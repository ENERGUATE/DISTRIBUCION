HA$PBExportHeader$u_gener_calendario.sru
$PBExportComments$Objeto que contiene la funcionalidad necesaria para asignar horarios de trabajo a contratas y brigadas
forward
global type u_gener_calendario from userobject
end type
type dw_brig_con_calendario from u_contratas_cal within u_gener_calendario
end type
type dw_festivos from datawindow within u_gener_calendario
end type
type st_3 from statictext within u_gener_calendario
end type
type em_desde2 from editmask within u_gener_calendario
end type
type st_4 from statictext within u_gener_calendario
end type
type em_hasta2 from editmask within u_gener_calendario
end type
type em_hasta1 from editmask within u_gener_calendario
end type
type st_2 from statictext within u_gener_calendario
end type
type em_desde1 from editmask within u_gener_calendario
end type
type st_1 from statictext within u_gener_calendario
end type
type cb_limpiar_calendario from commandbutton within u_gener_calendario
end type
type cb_grabar_calendario from commandbutton within u_gener_calendario
end type
type cbx_festivos from checkbox within u_gener_calendario
end type
type dw_b_turno from datawindow within u_gener_calendario
end type
type cbx_en_turno from checkbox within u_gener_calendario
end type
type st_5 from statictext within u_gener_calendario
end type
type ole_calendar from olecustomcontrol within u_gener_calendario
end type
type gb_1 from groupbox within u_gener_calendario
end type
end forward

global type u_gener_calendario from userobject
integer width = 3273
integer height = 1496
boolean border = true
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_cambio_mes ( )
event ue_grabar ( )
dw_brig_con_calendario dw_brig_con_calendario
dw_festivos dw_festivos
st_3 st_3
em_desde2 em_desde2
st_4 st_4
em_hasta2 em_hasta2
em_hasta1 em_hasta1
st_2 st_2
em_desde1 em_desde1
st_1 st_1
cb_limpiar_calendario cb_limpiar_calendario
cb_grabar_calendario cb_grabar_calendario
cbx_festivos cbx_festivos
dw_b_turno dw_b_turno
cbx_en_turno cbx_en_turno
st_5 st_5
ole_calendar ole_calendar
gb_1 gb_1
end type
global u_gener_calendario u_gener_calendario

type variables
u_generico_comunicaciones iu_comunic

boolean ib_dias[31]
boolean ib_dias_festivos[31]
boolean ib_hay_cambios = FALSE

constant long il_rojo = RGB(255,0,0)
constant long il_marron = RGB(128,0,0)
constant long ilk_activado = 15780518

long il_nro_brig_con

int ii_dia_inicio
int ii_dia_fin
int ii_month
int ii_year


end variables

forward prototypes
public function integer wf_borrar_dia (datetime pdt_borrar_desde)
public function boolean wf_dia_con_horario (date pd_fecha, boolean pb_unico_dia)
public function integer wf_insertar_dia (long pl_nro_brig_con, datetime pdt_hora_desde, datetime pdt_hora_hasta, datetime pdt_f_actual)
public function integer wf_cargar_calendario ()
public function boolean wf_es_dia_festivo (string ps_fecha)
public function integer wf_grabar_calendario ()
public function integer wf_inicializar_calendario ()
public function string wf_validar_calendario ()
public function integer wf_validar_fechas (datetime pdt_desde, datetime pdt_hasta)
public function datetime wf_primer_dia_del_mes ()
public function datetime wf_ultimo_dia_del_mes ()
end prototypes

event ue_cambio_mes;int li_dia
Datetime ldt_primer_dia_mes, ldt_ultimo_dia_mes

IF ib_hay_cambios THEN
	//$$HEX1$$bf00$$ENDHEX$$Desea guardar los cambios efectuados?
	IF gnv_msg.f_mensaje("CG01","","",YESNO!)=1 THEN
		this.triggerevent("ue_grabar")
	END IF
	ib_hay_cambios = FALSE
END IF

ii_dia_inicio = 0
ii_dia_fin = 0
wf_inicializar_calendario()

FOR li_dia = 1 TO 31 
	ib_dias_festivos[li_dia] = FALSE
NEXT
		
ldt_primer_dia_mes = wf_primer_dia_del_mes()
ldt_ultimo_dia_mes = wf_ultimo_dia_del_mes()
ii_month = ole_calendar.Object.Month 
ii_year = ole_calendar.Object.Year

// Cargo la data window de calendario con lo calendario de la brigada
dw_brig_con_calendario.Reset()
dw_brig_con_calendario.Retrieve(il_nro_brig_con,ldt_primer_dia_mes, ldt_ultimo_dia_mes)
dw_brig_con_calendario.Sort()
dw_festivos.reset()
dw_festivos.Retrieve(ldt_primer_dia_mes, ldt_ultimo_dia_mes)
wf_cargar_calendario()


end event

event ue_grabar;//Me fijo si valido la datawindow d_datos_brigada y en caso
//contrario retorno a la misma para corregir los errores

IF dw_brig_con_calendario.Update() = -1 THEN
	//gnu_u_transaction.uf_rollback()
	//No fue posible grabar el calendario para la brigada.
	gnv_msg.f_mensaje("EM60","","",OK!)
	RETURN
END IF

//COMMIT;
//gnu_u_transaction.uf_commit(This)

end event

public function integer wf_borrar_dia (datetime pdt_borrar_desde);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_borrar_dia
// 
// Objetivo: Elimina de dw_brig_con_calendario el horario asignado al d$$HEX1$$ed00$$ENDHEX$$a que viene
//				 en el par$$HEX1$$e100$$ENDHEX$$metro pdt_borrar_desde
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pdt_borrar_desde
//		Salida:   --
//						
// Devuelve: 0 - si no se ha borrado nada en la datawindow	
//				 1 - si ha borrado el horario en la datawindow
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_fila, li_retorno = 1 
string ls_busqueda
date ld_fecha
datetime ldt_fecha_fin, ldt_hora_desde, ldt_hora_hasta, ldt_borrar_desde


ldt_borrar_desde = Datetime(Date(pdt_borrar_desde))
// se especifica en ls_busqueda lo que se quiere buscar en la datawindow: en primer lugar
// se busca si el d$$HEX1$$ed00$$ENDHEX$$a del que se quieren borrar los horarios no est$$HEX2$$e1002000$$ENDHEX$$en un intervalo, esto es
// es un $$HEX1$$fa00$$ENDHEX$$nico dia -> fecha_inicio = fecha_fin
ls_busqueda = "fecha_inicio = "	+ "(Datetime('" + string(ldt_borrar_desde) + "'))" + " and " + &	
				  "fecha_fin = "	+ "(Datetime('" + string(ldt_borrar_desde) + "')) and " + &
				  "Time(hora_desde) = Time(DateTime('" + String(pdt_borrar_desde) + "')) "

// se busca en dw_brig_con_calendario 
li_fila = dw_brig_con_calendario.Find(ls_busqueda,0,dw_brig_con_calendario.rowcount())
	
// Se borran todos los horarios asociados a ese d$$HEX1$$ed00$$ENDHEX$$a
IF li_fila > 0 THEN
	// Un $$HEX1$$fa00$$ENDHEX$$nico registro: se borra ese registro
	dw_brig_con_calendario.DeleteRow(li_fila)
	
ELSE
	// De estar, est$$HEX2$$e1002000$$ENDHEX$$en un intervalo. Se busca a ver si ese d$$HEX1$$ed00$$ENDHEX$$a pertenece a alg$$HEX1$$fa00$$ENDHEX$$n 
	// extremo de alg$$HEX1$$fa00$$ENDHEX$$n intervalo
	// Se busca en el extremo izquierdo de los intervalos
	ls_busqueda = "fecha_inicio = " + "(Datetime('" + string(ldt_borrar_desde) + "')) and " + & 
					  "Time(hora_desde) = Time(DateTime('" + String(pdt_borrar_desde) + "')) "
	li_fila = dw_brig_con_calendario.Find(ls_busqueda,0,dw_brig_con_calendario.rowcount())
		
	IF li_fila > 0 THEN
		// El d$$HEX1$$ed00$$ENDHEX$$a borrado est$$HEX2$$e1002000$$ENDHEX$$en el extremo izquierdo de un intervalo.
		// Se modifica el extremo izquierdo, y se pone en este campo el d$$HEX1$$ed00$$ENDHEX$$a siguiente al que estaba
		ld_fecha = RelativeDate(Date(pdt_borrar_desde),1)  // se obtiene el d$$HEX1$$ed00$$ENDHEX$$a siguiente
		dw_brig_con_calendario.SetItem(li_fila, "fecha_inicio", DateTime(ld_fecha))
	ELSE
		// Al no estar en ning$$HEX1$$fa00$$ENDHEX$$n extremo izquierdo, se busca en el extremo derecho
		ls_busqueda = "fecha_fin = " + "(Datetime('" + string(ldt_borrar_desde) + "')) and " + &
						  "Time(hora_desde) = Time(DateTime('" + String(pdt_borrar_desde) + "'))"
		li_fila = dw_brig_con_calendario.Find(ls_busqueda,0,dw_brig_con_calendario.rowcount())
		
		IF li_fila > 0 THEN
			// El d$$HEX1$$ed00$$ENDHEX$$a borrado est$$HEX2$$e1002000$$ENDHEX$$en el extremo derecho de un intervalo.
			// Se modifica el extremo derecho, y se pone en este campo el d$$HEX1$$ed00$$ENDHEX$$a anterior al que estaba
			ld_fecha = RelativeDate(Date(pdt_borrar_desde),-1) // se obtiene el d$$HEX1$$ed00$$ENDHEX$$a anterior
			dw_brig_con_calendario.SetItem(li_fila, "fecha_fin", DateTime(ld_fecha))
		ELSE
			// Como la fecha no est$$HEX2$$e1002000$$ENDHEX$$en ning$$HEX1$$fa00$$ENDHEX$$n extremo de ning$$HEX1$$fa00$$ENDHEX$$n intervalo, la fecha, de estar,
			// estar$$HEX2$$e1002000$$ENDHEX$$en medio de un intervalo. Hay que buscar el intervalo
			ls_busqueda = "fecha_inicio < " + "(Datetime('" + string(ldt_borrar_desde) + "'))" + " and " + &
							  "fecha_fin > "	+ "(Datetime('" + string(ldt_borrar_desde) + "')) and " + &
							  "Time(hora_desde) = Time(DateTime('" + String(pdt_borrar_desde) + "'))"
			li_fila = dw_brig_con_calendario.Find(ls_busqueda,0,dw_brig_con_calendario.rowcount())
					
			IF li_fila > 0 THEN
				// Hay que quitar la fecha de este intervalo. Esto implica que este intervalo se
				// convierta en dos
				
				// Primer intervalo. Se modifica el intervalo que ya se tiene
				ld_fecha = RelativeDate(Date(pdt_borrar_desde),-1)
				ldt_fecha_fin = dw_brig_con_calendario.GetItemDatetime(li_fila, "fecha_fin")
				ldt_hora_desde = dw_brig_con_calendario.GetItemDatetime(li_fila, "hora_desde")
				ldt_hora_hasta = dw_brig_con_calendario.GetItemDatetime(li_fila, "hora_hasta")
				//ll_nro_brig_con = dw_brig_con_calendario.GetItemNumber(li_fila, "nro_brigada")
				dw_brig_con_calendario.SetItem(li_fila, "fecha_fin", DateTime(ld_fecha))
				
				// Segundo intervalo. $$HEX1$$c900$$ENDHEX$$ste hay que crearlo
				ld_fecha = RelativeDate(Date(pdt_borrar_desde),1)
				li_fila = dw_brig_con_calendario.InsertRow(0)
			
				dw_brig_con_calendario.SetItem(li_fila, 5, il_nro_brig_con)
				dw_brig_con_calendario.SetItem(li_fila,"fecha_inicio",DateTime(ld_fecha))
				dw_brig_con_calendario.SetItem(li_fila,"fecha_fin",ldt_fecha_fin)
				dw_brig_con_calendario.SetItem(li_fila,"usuario",gs_usuario)
				dw_brig_con_calendario.SetItem(li_fila,"f_actual",fgnu_fecha_actual())
				dw_brig_con_calendario.SetItem(li_fila,"programa","w_2271")
				dw_brig_con_calendario.SetItem(li_fila,"hora_desde",ldt_hora_desde)
				dw_brig_con_calendario.SetItem(li_fila,"hora_hasta",ldt_hora_hasta)
			ELSE 
				li_retorno = 0  // la fecha no tiene asignado ning$$HEX1$$fa00$$ENDHEX$$n horario
			END IF		
		END IF

	END IF
	
END IF
return li_retorno

end function

public function boolean wf_dia_con_horario (date pd_fecha, boolean pb_unico_dia);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_dia_con_horario
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que dice si para un d$$HEX1$$ed00$$ENDHEX$$a concreto hay asignado un horario para una 
//				 brigada o contrata determinada, y si lo hay pone el horario en los edit mask
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pd_fecha
//		Salida:   --
//						
// Devuelve: True  - si existe horario
//				 False - si no existe horario
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
string ls_busqueda, ls_hora
int li_fila, li_fila2

// Se pone en ls_busqueda las condiciones de b$$HEX1$$fa00$$ENDHEX$$squeda
ls_busqueda = "(Datetime('" + string(pd_fecha) + "') >= fecha_inicio)" + " and " + &
				  "(Datetime('" + string(pd_fecha) + "') <= fecha_fin)" 

// se realiza la b$$HEX1$$fa00$$ENDHEX$$squeda
li_fila = dw_brig_con_calendario.Find(ls_busqueda, 1, dw_brig_con_calendario.RowCount())
IF li_fila > 0 AND pb_unico_dia= TRUE THEN
	// hay un horario
	// se obtiene la hora de inicio de ese horario
	ls_hora = String(Time(dw_brig_con_calendario.GetItemDateTime(li_fila, 'hora_desde')))
	// se a$$HEX1$$f100$$ENDHEX$$ade al editmask
	em_desde1.Text= ls_hora
	// se obtiene la hora de fin de ese horario
	ls_hora = String(Time(dw_brig_con_calendario.GetItemDateTime(li_fila, 'hora_hasta')))
	// se a$$HEX1$$f100$$ENDHEX$$ade al editmask
	em_hasta1.Text=ls_hora
	// Comprobamos si puede haber un segundo horario
	IF li_fila < dw_brig_con_calendario.RowCount() THEN
		// se busca el posible segundo horario
		li_fila2 = dw_brig_con_calendario.Find(ls_busqueda, li_fila+1, dw_brig_con_calendario.RowCount())
		IF li_fila2 > 0 THEN	
			// hay un segundo horario
			// se obtiene la hora de inicio de ese horario
			ls_hora = String(Time(dw_brig_con_calendario.GetItemDateTime(li_fila2, 'hora_desde')))
			// se a$$HEX1$$f100$$ENDHEX$$ade al segundo editmask
			em_desde2.Text=ls_hora
			// se obtiene la hora de fin de ese horario
			ls_hora = String(Time(dw_brig_con_calendario.GetItemDateTime(li_fila2, 'hora_hasta')))
			// se a$$HEX1$$f100$$ENDHEX$$ade al segundo editmask
			em_hasta2.Text=ls_hora
		END IF
	END IF
ELSE
	// si no hay horario se resetean los editmask
	em_desde1.Text="00:00"
	em_desde2.Text="00:00"
	em_hasta1.Text="00:00"
	em_hasta2.Text="00:00"
END IF

return li_fila > 0

end function

public function integer wf_insertar_dia (long pl_nro_brig_con, datetime pdt_hora_desde, datetime pdt_hora_hasta, datetime pdt_f_actual);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_insertar_dia
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que inserta en dw_brig_con_calendario un horario para un d$$HEX1$$ed00$$ENDHEX$$a determinado 
//				 y una brigada o contrata determinada. En la inserci$$HEX1$$f300$$ENDHEX$$n hay que tener en cuenta que 
//           ese horario puede entrar dentro de un intervalo de horarios ya definidos, con lo 
//           cu$$HEX1$$e100$$ENDHEX$$l s$$HEX1$$f300$$ENDHEX$$lo ha de modificarse el intervalo. Entrar$$HEX2$$e1002000$$ENDHEX$$dentro de un intervalo si 
//           alguno de los extremo del intervalo es d$$HEX1$$ed00$$ENDHEX$$a anterior o posterior al d$$HEX1$$ed00$$ENDHEX$$a que queremos 
//				 insertar, y adem$$HEX1$$e100$$ENDHEX$$s el horario es el mismo (el del intervalo y el del d$$HEX1$$ed00$$ENDHEX$$a que se
//   			 quiere insertar). Tambi$$HEX1$$e900$$ENDHEX$$n puede darse el caso que este d$$HEX1$$ed00$$ENDHEX$$a que se quiere
//			    insertar una dos intervalos; esto se produce cuando el cae d$$HEX1$$ed00$$ENDHEX$$a justo en medio de 
//				 dos intervalos con el mismo horario entre ellos y con el del d$$HEX1$$ed00$$ENDHEX$$a
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  pl_nro_brig_con, pdt_hora_desde, pdt_hora_hasta, pdt_f_actual
//		Salida:   --
//						
// Devuelve: 1
//				 
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_fila_izquierda, li_fila_derecha, li_nuevo 
string ls_busqueda_derecha, ls_busqueda_izquierda
date ld_fecha
datetime ldt_fecha, ldt_hora, ldt_hora_hasta
time lt_hora

ldt_fecha = Datetime(Date(pdt_hora_desde))
// Lo primero que se hace es comprobar si hay horario para ese d$$HEX1$$ed00$$ENDHEX$$a, y en caso de haberlo
// hay que comprobar si los horarios casan (Ej: 9:00 - 14:00, 14:00-17:00). En caso de que 
// casen este d$$HEX1$$ed00$$ENDHEX$$a tendr$$HEX2$$e1002000$$ENDHEX$$un $$HEX1$$fa00$$ENDHEX$$nico horario (Del ejemplo: de 9:00 a 17:00)

// Comprobamos si hay solapamiento con la hora de fin
ls_busqueda_izquierda = "( Datetime('" + string(ldt_fecha) + "') >= fecha_inicio)" + " and " + &
								"( Datetime('" + string(ldt_fecha) + "') <= fecha_fin)" + " and " + &
							   "( Time(hora_desde) = " + "Time(Datetime('" + string(pdt_hora_hasta) + "'))) "
	
li_fila_izquierda = dw_brig_con_calendario.Find(ls_busqueda_izquierda,0,dw_brig_con_calendario.rowcount())

// Comprobamos si hay solapamiento con la hora de inicio
ls_busqueda_derecha = "( Datetime('" + string(ldt_fecha) + "') >= fecha_inicio)" + " and " + &
								"( Datetime('" + string(ldt_fecha) + "') <= fecha_fin)" + " and " + &
							   "( Time(hora_hasta) = " + "Time(Datetime('" + string(pdt_hora_desde) + "'))) "

//li_fila_derecha = dw_brig_con_calendario.Find(ls_busqueda_derecha,0,dw_brig_con_calendario.rowcount())


IF li_fila_izquierda > 0 THEN
	// Existe ya un horario para ese d$$HEX1$$ed00$$ENDHEX$$a con el que el nuevo se solapa
	//Este horario se solapa con uno previamente defenido. $$HEX1$$bf00$$ENDHEX$$Desea solapar horarios?
	IF gnv_msg.f_mensaje("CM16","","",YESNO!) = 1 THEN
		// Se solapan los horarios: se modifica la hora de fin
		ldt_fecha = dw_brig_con_calendario.GetItemDatetime(li_fila_izquierda, "fecha_inicio")
		ldt_hora = dw_brig_con_calendario.GetItemDatetime(li_fila_izquierda, "hora_desde")
		ldt_hora_hasta = dw_brig_con_calendario.GetItemDatetime(li_fila_izquierda, "hora_hasta")
		lt_hora = Time(ldt_hora)
		ldt_hora=Datetime(Date(pdt_hora_desde), lt_hora)
		// se borra el horario para ese d$$HEX1$$ed00$$ENDHEX$$a para definirlo m$$HEX1$$e100$$ENDHEX$$s adelante
		wf_borrar_dia(ldt_hora)	
		lt_hora = Time(ldt_hora_hasta)
		pdt_hora_hasta = DateTime(Date(pdt_hora_hasta), lt_hora)
		li_fila_derecha = dw_brig_con_calendario.Find(ls_busqueda_derecha,0,dw_brig_con_calendario.rowcount())
		IF li_fila_derecha > 0 THEN
			// El horario tambi$$HEX1$$e900$$ENDHEX$$n se solapa por la derecha con otro horario definido previamente
			ldt_fecha = dw_brig_con_calendario.GetItemDatetime(li_fila_derecha, "fecha_inicio")
			// se modifica la hora de inicio
			ldt_hora = dw_brig_con_calendario.GetItemDatetime(li_fila_derecha, "hora_desde")
			lt_hora = Time(ldt_hora)
			// se borra el horario para ese d$$HEX1$$ed00$$ENDHEX$$a para definirlo m$$HEX1$$e100$$ENDHEX$$s adelante
			ldt_hora=Datetime(Date(pdt_hora_desde), lt_hora)
			wf_borrar_dia(ldt_hora)	
			pdt_hora_desde = DateTime(Date(pdt_hora_desde), lt_hora)
		END IF
			
	ELSE
		Return 1
	END IF
ELSE // como no hay solapamiento con la hora de fin, se prueba por 
	  //el otro lado: con la hora de comienzo
	ls_busqueda_derecha = "( Datetime('" + string(ldt_fecha) + "') >= fecha_inicio)" + " and " + &
								"( Datetime('" + string(ldt_fecha) + "') <= fecha_fin)" + " and " + &
							   "( Time(hora_hasta) = " + "Time(Datetime('" + string(pdt_hora_desde) + "'))) "

	li_fila_derecha = dw_brig_con_calendario.Find(ls_busqueda_derecha,0,dw_brig_con_calendario.rowcount())
	IF li_fila_derecha > 0 THEN
		// Existe ya un horario para ese d$$HEX1$$ed00$$ENDHEX$$a con el que el nuevo se solapa
		//Este horario se solapa con uno previamente defenido. $$HEX1$$bf00$$ENDHEX$$Desea solapar horarios?
		IF gnv_msg.f_mensaje("CM16","","",YESNO!) = 1 THEN
			// Se solapan los horarios: se modifica la hora de comienzo
			ldt_fecha = dw_brig_con_calendario.GetItemDatetime(li_fila_derecha, "fecha_inicio")
			ldt_hora = dw_brig_con_calendario.GetItemDatetime(li_fila_derecha, "hora_desde")
			lt_hora = Time(ldt_hora)
			// se borra el horario para ese d$$HEX1$$ed00$$ENDHEX$$a para definirlo m$$HEX1$$e100$$ENDHEX$$s adelante
			ldt_hora=Datetime(Date(pdt_hora_desde), lt_hora)
			wf_borrar_dia(ldt_hora)	
			pdt_hora_desde = DateTime(Date(pdt_hora_desde), lt_hora)
		ELSE
			Return 1
		END IF
	END IF

END IF

// Para insertar un nuevo d$$HEX1$$ed00$$ENDHEX$$a se busca a ver si ese d$$HEX1$$ed00$$ENDHEX$$a puede formar parte de un intervalo
lt_hora = Time(pdt_hora_hasta)
ld_fecha = RelativeDate(Date(pdt_hora_desde),-1)
ldt_fecha = datetime(ld_fecha)

// Se busca a ver si el d$$HEX1$$ed00$$ENDHEX$$a anterior tiene definido el mismo horario
ls_busqueda_izquierda = "fecha_fin = "	+ "(Datetime('" + string(ldt_fecha) + "'))" + " and " + &
				  "Time(hora_desde) = " + "Time(Datetime('" + string(pdt_hora_desde) + "'))" + " and " + &
				  "Time(hora_hasta) = " + "Time(Datetime('" + string(pdt_hora_hasta) + "'))" 
				  
li_fila_izquierda = dw_brig_con_calendario.Find(ls_busqueda_izquierda,0,dw_brig_con_calendario.rowcount())
	
// Se busca a ver si el d$$HEX1$$ed00$$ENDHEX$$a posterior tiene definido el mismo horario
ld_fecha = RelativeDate(Date(pdt_hora_desde),1)
ldt_fecha = datetime(ld_fecha)
ls_busqueda_derecha = "fecha_inicio = " + "(Datetime('" + string(ldt_fecha) + "'))" + " and " + &
					  "Time(hora_desde) = " + "Time(Datetime('" + string(pdt_hora_desde) + "'))" + " and " + &
					  "Time(hora_hasta) = " + "Time(Datetime('" + string(pdt_hora_hasta) + "'))" 
	
li_fila_derecha = dw_brig_con_calendario.Find(ls_busqueda_derecha,0,dw_brig_con_calendario.rowcount())	

IF li_fila_izquierda > 0 THEN
	// El d$$HEX1$$ed00$$ENDHEX$$a anterior tiene definido un mismo horario
	// Se comprueba si el d$$HEX1$$ed00$$ENDHEX$$a posterior tiene definido un mismo horario
	IF li_fila_derecha > 0 THEN
			// Hay el mismo horario un d$$HEX1$$ed00$$ENDHEX$$a a la derecha y un d$$HEX1$$ed00$$ENDHEX$$a a la izquierda. Se unifican en 
			//	un solo registro.
			// Hay que poner la fecha final del de la derecha en el de la izquierda, y borrar el de 
			// la derecha (sea d$$HEX1$$ed00$$ENDHEX$$a o intervalo)
		ldt_fecha = dw_brig_con_calendario.GetItemDatetime(li_fila_derecha, "fecha_fin")
		dw_brig_con_calendario.SetItem(li_fila_izquierda,"fecha_fin", ldt_fecha)
		dw_brig_con_calendario.DeleteRow(li_fila_derecha)

	ELSE	
		// S$$HEX1$$f300$$ENDHEX$$lo el d$$HEX1$$ed00$$ENDHEX$$a anterior tiene definido el mismo horario. Solapamos el d$$HEX1$$ed00$$ENDHEX$$a que queremos
		// insertar con $$HEX1$$e900$$ENDHEX$$ste: modificamos la fecha fin del horario del d$$HEX1$$ed00$$ENDHEX$$a anterior
		dw_brig_con_calendario.SetItem(li_fila_izquierda,"fecha_fin",DateTime(Date(pdt_hora_hasta)))
	END IF

ELSE
	// El d$$HEX1$$ed00$$ENDHEX$$a anterior no tiene definido un mismo horario
	// Se comprueba si el d$$HEX1$$ed00$$ENDHEX$$a posterior tiene definido un mismo horario
	IF li_fila_derecha > 0 THEN
		// El d$$HEX1$$ed00$$ENDHEX$$a posterior tiene definido el mismo horario. Solapamos el d$$HEX1$$ed00$$ENDHEX$$a que queremos
		// insertar con $$HEX1$$e900$$ENDHEX$$ste: modificamos la fecha de inicio del horario del d$$HEX1$$ed00$$ENDHEX$$a posterior
		dw_brig_con_calendario.SetItem(li_fila_derecha,"fecha_inicio",DateTime(Date(pdt_hora_desde)))
	ELSE
		// No hay ni d$$HEX1$$ed00$$ENDHEX$$a anterior ni posterior con el mismo horario. Creamos una nueva fila
		// para el horario nuevo
		li_nuevo = dw_brig_con_calendario.InsertRow(0)
		dw_brig_con_calendario.SetItem(li_nuevo, 5, il_nro_brig_con)
		dw_brig_con_calendario.SetItem(li_nuevo,"fecha_inicio",DateTime(Date(pdt_hora_desde)))
		dw_brig_con_calendario.SetItem(li_nuevo,"fecha_fin",DateTime(Date(pdt_hora_hasta)))
		dw_brig_con_calendario.SetItem(li_nuevo,"usuario",gs_usuario)
		dw_brig_con_calendario.SetItem(li_nuevo,"f_actual",pdt_f_actual)
		dw_brig_con_calendario.SetItem(li_nuevo,"programa","w_2271")
		dw_brig_con_calendario.SetItem(li_nuevo,"hora_desde",pdt_hora_desde)
		dw_brig_con_calendario.SetItem(li_nuevo,"hora_hasta",pdt_hora_hasta)
	END IF
END IF	
return 1


end function

public function integer wf_cargar_calendario ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_cargar_calendario
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que pinta de verde los d$$HEX1$$ed00$$ENDHEX$$as que una brigada o contrata tiene asignado
//           un horario
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
//	15/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Datetime ldt_fecha_desde, ldt_fecha_hasta
String ls_dia
int li_cont1, li_cont2, li_total_dias, li_dia
int li_num_dias

// Se cogen los d$$HEX1$$ed00$$ENDHEX$$as festivos del mes actual para pintarlos de rojo en el calendario
li_total_dias = dw_festivos.RowCount()
FOR li_cont1 = 1 TO li_total_dias
	// Se obtiene la fecha del d$$HEX1$$ed00$$ENDHEX$$a festivo
	ldt_fecha_desde = dw_festivos.GetItemDateTime(li_cont1,"fecha_fiesta")
	// De la fecha se saca el d$$HEX1$$ed00$$ENDHEX$$a
	li_dia = Day(Date(ldt_fecha_desde))
	// se pone ese d$$HEX1$$ed00$$ENDHEX$$a como festivo
	ib_dias_festivos[li_dia] = TRUE
	// se pinta el d$$HEX1$$ed00$$ENDHEX$$a de rojo
	ole_calendar.Object.DayColor[li_dia] = il_rojo
NEXT

// Se cogen ahora los d$$HEX1$$ed00$$ENDHEX$$as del mes en los que el equipo trabaja para pintarlos de verde
li_total_dias = dw_brig_con_calendario.RowCount()

IF li_total_dias <= 0 THEN
	// Este mes no trabaja
	Return 1
END IF

// Cargo los dias
FOR li_cont1 = 1 TO li_total_dias // se recorren todos los intervalos
	// Se obtiene los extremos de cada intervalo
	ldt_fecha_desde = dw_brig_con_calendario.GetItemDateTime(li_cont1,"fecha_inicio")
	ldt_fecha_hasta = dw_brig_con_calendario.GetItemDateTime(li_cont1,"fecha_fin")
	
	// se obtiene el n$$HEX2$$ba002000$$ENDHEX$$de d$$HEX1$$ed00$$ENDHEX$$as que hay entre los extremos del intervalo, para pintar todos
	// $$HEX1$$e900$$ENDHEX$$stos de verde
	li_num_dias = DaysAfter(Date(ldt_fecha_desde), Date(ldt_fecha_hasta)) 
	li_dia = Day(Date(ldt_fecha_desde))
	
	// se pintan de verde todos los d$$HEX1$$ed00$$ENDHEX$$as del intervalo
	FOR li_cont2 = 0 TO li_num_dias
		ls_dia = String(li_cont2+li_dia)+"/"+ &
					String(ole_calendar.Object.Month)+"/"+ &
					String(ole_calendar.Object.Year)
		IF wf_es_dia_festivo(ls_dia) THEN
			// si el d$$HEX1$$ed00$$ENDHEX$$a que trabaja es festivo, en vez de pintarlo de verde se pinta de marr$$HEX1$$f300$$ENDHEX$$n
			ole_calendar.Object.DayColor[li_cont2+li_dia] = il_marron
		ELSE
			ole_calendar.Object.DayColor[li_cont2+li_dia] = RGB(128,128,0)
		END IF
	NEXT
NEXT

Return 1
end function

public function boolean wf_es_dia_festivo (string ps_fecha);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_es_dia_festivo
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que dice si un d$$HEX1$$ed00$$ENDHEX$$a es festivo o no
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  ps_fecha
//		Salida:   --
//						
// Devuelve: TRUE  - Si el d$$HEX1$$ed00$$ENDHEX$$a es festivo
//				 FALSE - Si el d$$HEX1$$ed00$$ENDHEX$$a no es festivo
//				 
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	31/03/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


// Los d$$HEX1$$ed00$$ENDHEX$$as festivos son los s$$HEX1$$e100$$ENDHEX$$bados, domingos, y los marcados como tales
RETURN UPPER(DayName(Date(ps_fecha))) = "SATURDAY" OR UPPER(DayName(Date(ps_fecha))) = "SUNDAY" OR &
		 UPPER(DayName(Date(ps_fecha))) = "S$$HEX1$$c100$$ENDHEX$$BADO" OR UPPER(DayName(Date(ps_fecha))) = "DOMINGO" OR &
		 ib_dias_festivos[Day(Date(ps_fecha))]

end function

public function integer wf_grabar_calendario ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_grabar_calendario
// 
// Objetivo: Se encarga de actualizar la datawindow dw_brig_con_calendario
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve: -1 - si no se han actualizado bien los datos
//				  1 - si se han actualizado bien los datos
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Declaracion de variables
string ls_fecha_alta, ls_where
int li_ret,  li_cont, li_fila_aux, li_total_inicial, li_contador_brigadistas
DateTime ldt_f_actual
DateTime ldt_hora1_desde, ldt_hora2_desde, ldt_hora1_hasta, ldt_hora2_hasta, ldt_f_alta
long ll_nro_brig_con

//// Inicio del codigo  ////

SetPointer(HourGlass!)

ldt_f_actual = fgnu_fecha_actual()

FOR li_cont = 1 TO 31 // se recorren todos los d$$HEX1$$ed00$$ENDHEX$$as del mes
	IF ib_dias[li_cont] THEN // si el d$$HEX1$$ed00$$ENDHEX$$a est$$HEX2$$e1002000$$ENDHEX$$marcado por el usuario
		// Se construye la fecha del d$$HEX1$$ed00$$ENDHEX$$a marcado por el usuario
		ls_fecha_alta = String(li_cont) + '/' + &
							 String(ole_calendar.Object.Month) + '/' + &
							 String(ole_calendar.Object.Year)
		
		IF IsDate(ls_fecha_alta) THEN
			ldt_f_alta = DateTime(Date(ls_fecha_alta))
			
			IF cbx_en_turno.Checked = TRUE THEN
				// El usuario ha escogido un horario predefinido
				ls_where = dw_b_turno.GetText()
				// Se buscan las horas del horario predefinido
				  SELECT "GI_HORARIOS_TRABAJO"."DESDE",   
        			 		"GI_HORARIOS_TRABAJO"."HASTA"  
					INTO :ldt_hora1_desde, :ldt_hora1_hasta
    				FROM "GI_HORARIOS_TRABAJO"
					WHERE "GI_HORARIOS_TRABAJO"."DESCRIPCION" = :ls_where;
					
				// Se asignan las horas encontradas	
				ldt_hora1_desde = DateTime(Date(ldt_f_alta),Time(ldt_hora1_desde))
				ldt_hora1_hasta = DateTime(Date(ldt_f_alta),Time(ldt_hora1_hasta))	
								
			ELSE
				// El usuario ha definido un horario particular
				// Se cogen los datos de ese horario particular
				ldt_hora1_desde = DateTime(Date(ldt_f_alta),Time(em_desde1.Text))
				ldt_hora1_hasta = DateTime(Date(ldt_f_alta),Time(em_hasta1.Text))
				ldt_hora2_desde = DateTime(Date(ldt_f_alta),Time(em_desde2.Text))
				ldt_hora2_hasta = DateTime(Date(ldt_f_alta),Time(em_hasta2.Text))
			END IF
			// Se comprueba la correci$$HEX1$$f300$$ENDHEX$$n de las horas
			wf_validar_fechas(ldt_hora1_desde, ldt_hora1_hasta) 
			
			// Actualizo los campos en dw_brigadas_calendario
			wf_insertar_dia(ll_nro_brig_con, ldt_hora1_desde, ldt_hora1_hasta, ldt_f_actual)
			
			IF cbx_en_turno.Checked = FALSE AND &
					(Time(em_desde2.Text) <> Time('00:00') OR &
					Time(em_hasta2.Text) <> Time('00:00')) THEN
				
				// Hay un segundo horario definido
				// Se comprueba la correci$$HEX1$$f300$$ENDHEX$$n de las horas
				wf_validar_fechas(ldt_hora2_desde, ldt_hora2_hasta) 
				
				// Actualizo los campos en dw_brigadas_calendario
				wf_insertar_dia(ll_nro_brig_con, ldt_hora2_desde, ldt_hora2_hasta, ldt_f_actual)
			END IF
		END IF
	END IF
NEXT

Return 1
end function

public function integer wf_inicializar_calendario ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_inicializar_calendario
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
//	15/02/2000 		LFE		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_dia

// se inicializa el calendario
ole_calendar.Object.ClearDays()
ii_dia_fin = 0
ii_dia_inicio = 0

// se desmarcan todos los d$$HEX1$$ed00$$ENDHEX$$as
FOR li_dia = 1 TO 31 
	ib_dias[li_dia] = FALSE
NEXT

cb_grabar_calendario.enabled = FALSE
cb_limpiar_calendario.enabled = FALSE

em_desde1.Text="00:00"
em_desde2.Text="00:00"
em_hasta1.Text="00:00"
em_hasta2.Text="00:00"

Return 1

end function

public function string wf_validar_calendario ();//////////////////////
//
// Realiza todas las validaciones de la vantana
// Si alguna no se cumple, retorna un string indicando el error
// Si valida la ventana, retorna "" (tipo el Modify de las dw)
//
//
/////////////////////

// Declaracion de variables
Boolean	lb_valido
Integer li_index
Time lt_desde1, lt_desde2, lt_hasta1, lt_hasta2
String ls_fecha

lb_valido = FALSE

// Retorna si selecciono uno dia
FOR li_index = 1 TO 31
	IF ib_dias[li_index] THEN
		lb_valido = TRUE
		EXIT
	END IF
NEXT
IF NOT lb_valido THEN
	RETURN "No fue seleccionado ning$$HEX1$$fa00$$ENDHEX$$n dia para grabar los horarios."
END IF

// Capturo los valores de las horas
lt_desde1 = Time(em_desde1.Text)
lt_desde2 = Time(em_desde2.Text)
lt_hasta1 = Time(em_hasta1.Text)
lt_hasta2 = Time(em_hasta2.Text)

// Valido correlatividad de horarios
IF lt_desde1 > lt_hasta1 THEN
	Return "Fecha final menor que fecha inicial."
END IF

IF lt_desde2 > lt_hasta2 THEN
	Return "Fecha final menor que fecha inicial."
END IF

IF lt_hasta1 > lt_desde2 AND lt_desde2 <> Time("00:00") AND lt_hasta2 <> Time("00:00") THEN
	Return "Fin del primer horario mayor o igual que principio del segundo."
END IF
RETURN ""

end function

public function integer wf_validar_fechas (datetime pdt_desde, datetime pdt_hasta);// Valida si no hay sobreposicion de rango de horas para el dia

Boolean	lb_retorno
Integer	li_fila, li_inicio
String	ls_find
datetime ldt_fecha
Time lt_hora_desde
ldt_fecha = DateTime(Date(pdt_desde))



ls_find = " ( DateTime('" + String(ldt_fecha) + "') >= fecha_inicio AND " + &
			 "   DateTime('" + String(ldt_fecha) + "') <= Date(fecha_fin) ) AND " + &
			 " (( Time(DateTime('" + String(pdt_desde) + "')) > Time(hora_desde) AND " + &
			 "   Time(Datetime('" + String(pdt_desde) + "')) < Time(hora_hasta) ) OR " + &
			 " ( Time(Datetime('" + String(pdt_hasta) + "')) > Time(hora_desde) AND " + &
			 "   Time(Datetime('" + String(pdt_hasta) + "')) < Time(hora_hasta) ) OR " + &
			 " ( Time(Datetime('" + String(pdt_desde) + "')) <= Time(hora_desde) AND " + &
			 "   Time(Datetime('" + String(pdt_hasta) + "')) >= Time(hora_hasta) )) "

li_inicio = 1
DO
	li_fila = dw_brig_con_calendario.Find(ls_find, li_inicio, dw_brig_con_calendario.RowCount())
	
	IF li_fila > 0 THEN
		lt_hora_desde= Time(dw_brig_con_calendario.GetItemDatetime(li_fila,'hora_desde'))
		ldt_fecha = Datetime(Date(ldt_fecha), lt_hora_desde)
		wf_borrar_dia(ldt_fecha)
		li_inicio = li_fila
	END IF
LOOP WHILE li_fila > 0

return 1
end function

public function datetime wf_primer_dia_del_mes ();// Setea los dias de inicio 

date		ld_fecha
string	ls_fecha

ls_fecha = "01/" + String(ole_calendar.Object.Month) + "/" + &
					String(ole_calendar.Object.Year)

ld_fecha = fg_fecha_primer_dia_mes(Datetime(Date(ls_fecha)))
return DateTime(ld_fecha, Time("00:00:00"))


end function

public function datetime wf_ultimo_dia_del_mes ();// Setea los dias de inico y final del mes

date		ld_fecha
string	ls_fecha

ls_fecha = "01/" + String(ole_calendar.Object.Month) + "/" + &
					String(ole_calendar.Object.Year)

ld_fecha = fg_fecha_ultimo_dia_mes(Datetime(Date(ls_fecha)))
return DateTime(ld_fecha, Time("23:59:59"))

end function

on u_gener_calendario.create
this.dw_brig_con_calendario=create dw_brig_con_calendario
this.dw_festivos=create dw_festivos
this.st_3=create st_3
this.em_desde2=create em_desde2
this.st_4=create st_4
this.em_hasta2=create em_hasta2
this.em_hasta1=create em_hasta1
this.st_2=create st_2
this.em_desde1=create em_desde1
this.st_1=create st_1
this.cb_limpiar_calendario=create cb_limpiar_calendario
this.cb_grabar_calendario=create cb_grabar_calendario
this.cbx_festivos=create cbx_festivos
this.dw_b_turno=create dw_b_turno
this.cbx_en_turno=create cbx_en_turno
this.st_5=create st_5
this.ole_calendar=create ole_calendar
this.gb_1=create gb_1
this.Control[]={this.dw_brig_con_calendario,&
this.dw_festivos,&
this.st_3,&
this.em_desde2,&
this.st_4,&
this.em_hasta2,&
this.em_hasta1,&
this.st_2,&
this.em_desde1,&
this.st_1,&
this.cb_limpiar_calendario,&
this.cb_grabar_calendario,&
this.cbx_festivos,&
this.dw_b_turno,&
this.cbx_en_turno,&
this.st_5,&
this.ole_calendar,&
this.gb_1}
end on

on u_gener_calendario.destroy
destroy(this.dw_brig_con_calendario)
destroy(this.dw_festivos)
destroy(this.st_3)
destroy(this.em_desde2)
destroy(this.st_4)
destroy(this.em_hasta2)
destroy(this.em_hasta1)
destroy(this.st_2)
destroy(this.em_desde1)
destroy(this.st_1)
destroy(this.cb_limpiar_calendario)
destroy(this.cb_grabar_calendario)
destroy(this.cbx_festivos)
destroy(this.dw_b_turno)
destroy(this.cbx_en_turno)
destroy(this.st_5)
destroy(this.ole_calendar)
destroy(this.gb_1)
end on

event constructor;int li_cont

iu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia

// recibo parametros de entrada
iu_comunic.is_comunic = gu_comunic.is_comunic
FOR li_cont = 1 to 31
	ib_dias[li_cont] = False
NEXT

ole_calendar.Object.Today
ole_calendar.object.year = year(today())

ole_calendar.Object.WeekendColor = il_rojo

end event

type dw_brig_con_calendario from u_contratas_cal within u_gener_calendario
integer x = 18
integer y = 172
integer width = 1737
integer height = 716
integer taborder = 0
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

type dw_festivos from datawindow within u_gener_calendario
boolean visible = false
integer x = 1472
integer y = 1004
integer width = 425
integer height = 360
integer taborder = 60
string dataobject = "d_cal_dias_festivos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within u_gener_calendario
integer x = 187
integer y = 1224
integer width = 219
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Desde :"
boolean focusrectangle = false
end type

type em_desde2 from editmask within u_gener_calendario
integer x = 421
integer y = 1212
integer width = 242
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
boolean spin = true
end type

event modified;IF	ii_dia_inicio <> 0 THEN
	IF (Time(em_desde2.Text) <> Time('00:00') OR &
		Time(em_hasta2.Text) <> Time('00:00')) THEN
	
		cb_grabar_calendario.enabled = True
		cb_limpiar_calendario.enabled = True
	
	ELSEIF Time(em_desde1.Text) <> Time('00:00') OR &
			 Time(em_hasta1.Text) <> Time('00:00') THEN
			
		cb_grabar_calendario.enabled = True
		cb_limpiar_calendario.enabled = True
	ELSE
		cb_grabar_calendario.enabled = False
		cb_limpiar_calendario.enabled = False
	
	END IF
ELSE
	cb_grabar_calendario.enabled = False
	cb_limpiar_calendario.enabled = False
END IF
end event

type st_4 from statictext within u_gener_calendario
integer x = 782
integer y = 1224
integer width = 197
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Hasta :"
boolean focusrectangle = false
end type

type em_hasta2 from editmask within u_gener_calendario
integer x = 987
integer y = 1212
integer width = 242
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
boolean spin = true
end type

event modified;em_desde2.TriggerEvent(modified!)

end event

type em_hasta1 from editmask within u_gener_calendario
integer x = 987
integer y = 1040
integer width = 242
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
boolean spin = true
end type

event modified;em_desde1.TriggerEvent(modified!)

end event

type st_2 from statictext within u_gener_calendario
integer x = 782
integer y = 1052
integer width = 197
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Hasta :"
boolean focusrectangle = false
end type

type em_desde1 from editmask within u_gener_calendario
integer x = 421
integer y = 1040
integer width = 242
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean autoskip = true
boolean spin = true
end type

event modified;IF	ii_dia_inicio <> 0 THEN

	IF (Time(em_desde1.Text) <> Time('00:00') OR Time(em_hasta1.Text) <> Time('00:00')) THEN
		cb_grabar_calendario.enabled = True
	
	ELSE
		cb_grabar_calendario.enabled = False
	END IF

ELSE
	cb_grabar_calendario.enabled = False
END IF
end event

type st_1 from statictext within u_gener_calendario
integer x = 187
integer y = 1052
integer width = 219
integer height = 56
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Desde :"
boolean focusrectangle = false
end type

type cb_limpiar_calendario from commandbutton within u_gener_calendario
integer x = 2633
integer y = 1284
integer width = 549
integer height = 108
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Limpiar Calendario"
end type

event clicked;// Se borran de la tabla los horarios de los d$$HEX1$$ed00$$ENDHEX$$a seleccionados

Integer	li_index, li_fila_borrada = 1
DateTime	ldt_borrar_desde, ldt_borrar_hasta
String	ls_fecha

//$$HEX1$$bf00$$ENDHEX$$Confirma la eliminaci$$HEX1$$f300$$ENDHEX$$n del calendario para esta brigada en los d$$HEX1$$ed00$$ENDHEX$$as marcados?
IF gnv_msg.f_mensaje("CM17","","",YesNo!) = 1 THEN
	ib_hay_cambios = TRUE
	FOR li_index = 1 TO 31 // se recorren todos los d$$HEX1$$ed00$$ENDHEX$$as del mes
		IF ib_dias[li_index] THEN // este d$$HEX1$$ed00$$ENDHEX$$a est$$HEX2$$e1002000$$ENDHEX$$marcado para borrar
			ls_fecha = String(li_index) + '/' + &
						  String(ole_calendar.Object.Month) + '/' + &
						  String(ole_calendar.Object.Year)
			
			IF IsDate(ls_fecha) THEN
				ldt_borrar_desde = DateTime(Date(ls_fecha), Time("00:00:00"))
				ldt_borrar_hasta = DateTime(Date(ls_fecha), Time("23:59:59"))
			ELSE
				EXIT
			END IF
			// Borramos todos los horarios asignados al d$$HEX1$$ed00$$ENDHEX$$a. Puede haber var$$HEX1$$ed00$$ENDHEX$$os horarios 
			// asignados al d$$HEX1$$ed00$$ENDHEX$$a			
			wf_validar_fechas(ldt_borrar_desde, ldt_borrar_hasta)
			
		END IF
	NEXT
	
	// se borra la regi$$HEX1$$f300$$ENDHEX$$n seleccionada
	ii_dia_inicio = 0
	ii_dia_fin = 0
	
	// se inicializa el calendario
	wf_inicializar_calendario()
	// se pinta el calendario
	wf_cargar_calendario()
END IF
end event

type cb_grabar_calendario from commandbutton within u_gener_calendario
integer x = 2030
integer y = 1284
integer width = 549
integer height = 108
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Grabar Calendario"
boolean default = true
end type

event clicked;/////////////////////
//
// Grabo las modificaciones 
//	DE CALENDARIO
//
////////////////////

long		ll_ultimo
long		ll_cod_munic
long		ll_nro_centro, ll_nro_cmd, ll_nro_mesa
string	ls_valido

ls_valido = wf_validar_calendario()
IF ls_valido <> "" THEN
	gnv_msg.f_mensaje("AA18",ls_valido,"",OK!)
ELSE
	// Grabo en la BD
	// Tabla: gi_brigadas_cal
	ib_hay_cambios = TRUE
	wf_grabar_calendario()
	wf_inicializar_calendario()
	// se repinta el calendario
	wf_cargar_calendario()

END IF
end event

type cbx_festivos from checkbox within u_gener_calendario
integer x = 2034
integer y = 1120
integer width = 517
integer height = 84
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Marcar festivos"
end type

type dw_b_turno from datawindow within u_gener_calendario
integer x = 2601
integer y = 976
integer width = 590
integer height = 128
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_brigadas_turno"
boolean border = false
boolean livescroll = true
end type

event constructor;dw_b_turno.enabled = FALSE
dw_b_turno.Object.pi_turno.background.color = gs_gris
end event

event itemchanged;IF ii_dia_inicio = 0 OR IsNull(dw_b_turno.GetItemString(1,1)) OR dw_b_turno.GetItemString(1,1) = "" THEN
	cb_grabar_calendario.enabled = FALSE
ELSE
	cb_grabar_calendario.enabled = TRUE
END IF
end event

type cbx_en_turno from checkbox within u_gener_calendario
integer x = 2034
integer y = 1004
integer width = 581
integer height = 76
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Turnos definidos :"
end type

event clicked;// Si est$$HEX2$$e1002000$$ENDHEX$$marcado este checkbox, se deshabilitan los controles en los que se ponen los
// horarios a mano
IF This.Checked = TRUE THEN
	em_desde1.enabled = FALSE
	em_hasta1.enabled = FALSE
	em_desde2.enabled = FALSE
	em_hasta2.enabled = FALSE
	dw_b_turno.enabled = TRUE
	dw_b_turno.Object.pi_turno.background.color = gs_blanco
	dw_b_turno.TriggerEvent(itemchanged!)
ELSE
	em_desde1.enabled = TRUE
	em_hasta1.enabled = TRUE
	em_desde2.enabled = TRUE
	em_hasta2.enabled = TRUE
	dw_b_turno.enabled = FALSE
	dw_b_turno.Object.pi_turno.background.color = gs_gris
	em_desde1.TriggerEvent(modified!)
END IF
end event

type st_5 from statictext within u_gener_calendario
integer x = 18
integer y = 88
integer width = 1737
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 67108864
long backcolor = 8421504
boolean enabled = false
string text = "Horarios asignados para el mes actual"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type ole_calendar from olecustomcontrol within u_gener_calendario
event datechange ( ref integer ndow,  ref integer nday,  ref integer nmonth,  ref integer nyear )
event click ( )
event dblclick ( )
event keydown ( ref integer keycode,  integer shift )
event keypress ( ref integer keyascii )
event keyup ( ref integer keycode,  integer shift )
event mousedown ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mousemove ( integer button,  integer shift,  long ocx_x,  long ocx_y )
event mouseup ( integer button,  integer shift,  long ocx_x,  long ocx_y )
integer x = 2043
integer y = 88
integer width = 1143
integer height = 800
integer taborder = 10
borderstyle borderstyle = stylelowered!
string binarykey = "u_gener_calendario.udo"
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

event mousedown;// Este script marca en el calendario los d$$HEX1$$ed00$$ENDHEX$$as seleccionados por el usuario

integer li_indice, li_maxdias, li_dia, li_mes, li_a$$HEX1$$f100$$ENDHEX$$o
string ls_fecha

//	shift:
//		1 -> shift
//		2 -> control
//		3 ->
//		4 -> alt

// Se quitan los colores del calendario
ole_calendar.Object.ClearDays
// Se obtiene el d$$HEX1$$ed00$$ENDHEX$$a, el mes y el a$$HEX1$$f100$$ENDHEX$$o, del d$$HEX1$$ed00$$ENDHEX$$a que ha pinchado el usuario
li_dia = ole_calendar.Object.Day
li_mes = ole_calendar.Object.Month
li_a$$HEX1$$f100$$ENDHEX$$o = ole_calendar.Object.Year
	
IF button = 1 THEN // Se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo del rat$$HEX1$$f300$$ENDHEX$$n
	ls_fecha= String(li_a$$HEX1$$f100$$ENDHEX$$o)+"-"+String(li_mes)+"-"+String(li_dia)
	// Se comprueba la validez de la fecha
	IF NOT IsDate(String(li_dia)+"/"+String(li_mes)+"/"+String(li_a$$HEX1$$f100$$ENDHEX$$o)) THEN
		RETURN
	END IF
	// Se comprueba si el usuario ha cambiado de mes
	IF ii_month <> li_mes OR ii_year <> li_a$$HEX1$$f100$$ENDHEX$$o THEN // Hay cambio de mes
		Parent.TriggerEvent("ue_cambio_mes")
		Return
	END IF
	IF iu_comunic.is_comunic.accion_llamada <> "Consulta" OR &
		IsNull(iu_comunic.is_comunic.accion_llamada) THEN
	// Comprobamos si la pulsaci$$HEX1$$f300$$ENDHEX$$n del rat$$HEX1$$f300$$ENDHEX$$n va acompa$$HEX1$$f100$$ENDHEX$$ada de alguna tecla
		CHOOSE CASE shift
			CASE 0 // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo del rat$$HEX1$$f300$$ENDHEX$$n sin nada m$$HEX1$$e100$$ENDHEX$$s. Hay que marcar ese d$$HEX1$$ed00$$ENDHEX$$a
				// Se inicializa el calendario
				wf_inicializar_calendario()
				IF NOT wf_es_dia_festivo(ls_fecha) OR cbx_festivos.checked = TRUE THEN 
					// El d$$HEX1$$ed00$$ENDHEX$$a pulsado no es festivo o est$$HEX2$$e1002000$$ENDHEX$$habilitado el marcar festivos
					// Se habilita el bot$$HEX1$$f300$$ENDHEX$$n de limpiar d$$HEX1$$ed00$$ENDHEX$$a en el caso de que el d$$HEX1$$ed00$$ENDHEX$$a seleccionado
					// ya tuviera asignado un horario para as$$HEX2$$ed002000$$ENDHEX$$tener la posibilidad de borrarlo
					cb_limpiar_calendario.enabled = wf_dia_con_horario(Date(ls_fecha), true)
					// se marca el comienzo del posible intervalo que marque el usuario
					ii_dia_inicio = li_dia
					// se pone ese d$$HEX1$$ed00$$ENDHEX$$a como d$$HEX1$$ed00$$ENDHEX$$a marcado
					ib_dias[li_dia] = TRUE
				ELSE
					// El d$$HEX1$$ed00$$ENDHEX$$a es festivo y no est$$HEX2$$e1002000$$ENDHEX$$habilitado el marcar festivos
					cb_limpiar_calendario.enabled = FALSE
				END IF
				
			CASE 1 // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo y la tecla shift
				// se marcan los d$$HEX1$$ed00$$ENDHEX$$as nuevos seleccionados
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
					// y cbx_festivos no est$$HEX2$$e1002000$$ENDHEX$$marcado, el d$$HEX1$$ed00$$ENDHEX$$a no se marca. El bot$$HEX1$$f300$$ENDHEX$$n de limpiar calendario
					// permanecer$$HEX2$$e1002000$$ENDHEX$$habilitado si todos los d$$HEX1$$ed00$$ENDHEX$$as escogidos tienen ya asignado un horario
					cb_limpiar_calendario.enabled = True 
					FOR li_indice=1 TO 31 // Se recorren todos los d$$HEX1$$ed00$$ENDHEX$$as del calendario
						IF li_indice >= ii_dia_inicio AND li_indice <= ii_dia_fin THEN
							// El d$$HEX1$$ed00$$ENDHEX$$a se encuentra entre los seleccionados
							ls_fecha= String(li_a$$HEX1$$f100$$ENDHEX$$o)+"-"+String(li_mes)+"-"+String(li_indice)
							IF NOT wf_es_dia_festivo(ls_fecha) OR cbx_festivos.checked = TRUE THEN 
								
								IF cb_limpiar_calendario.enabled = True THEN
									// se comprueba si el d$$HEX1$$ed00$$ENDHEX$$a ten$$HEX1$$ed00$$ENDHEX$$a ya horario, para seguir manteniendo
									// habilitado el bot$$HEX1$$f300$$ENDHEX$$n de limpiar
									cb_limpiar_calendario.enabled = wf_dia_con_horario(Date(ls_fecha), false)
								END IF
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
				ELSE
					// Este es el primer d$$HEX1$$ed00$$ENDHEX$$a que se marca, a$$HEX1$$fa00$$ENDHEX$$n no hay regi$$HEX1$$f300$$ENDHEX$$n
					ls_fecha= String(li_a$$HEX1$$f100$$ENDHEX$$o)+"-"+String(li_mes)+"-"+String(li_dia)
					IF NOT wf_es_dia_festivo(ls_fecha) OR cbx_festivos.checked = TRUE THEN 	
						// El d$$HEX1$$ed00$$ENDHEX$$a marcado es v$$HEX1$$e100$$ENDHEX$$lido 
						cb_limpiar_calendario.enabled = wf_dia_con_horario(Date(ls_fecha),false)
						ii_dia_inicio = li_dia
						ib_dias[li_dia] = TRUE
					END IF
				END IF
				
			CASE 2 // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n izquierdo y la tecla control
				// En este caso se van marcando los d$$HEX1$$ed00$$ENDHEX$$a individualmente, no se marcan regiones
				ls_fecha= String(li_a$$HEX1$$f100$$ENDHEX$$o)+"-"+String(li_mes)+"-"+String(li_dia)
				IF NOT wf_es_dia_festivo(ls_fecha) OR cbx_festivos.checked = TRUE THEN 
						
						// El d$$HEX1$$ed00$$ENDHEX$$a marcado es v$$HEX1$$e100$$ENDHEX$$lido
						ii_dia_inicio = li_dia
						// Si el d$$HEX1$$ed00$$ENDHEX$$a estaba seleccionado, se deselecciona, y si no lo estaba se selecciona
						ib_dias[li_dia] = NOT ib_dias[li_dia]
						//Se comprueba si se puede habilitar el bot$$HEX1$$f300$$ENDHEX$$n de limpiar calendario
						IF cb_limpiar_calendario.enabled THEN
							IF wf_dia_con_horario(Date(ls_fecha), false) AND ib_dias[li_dia] THEN
								cb_limpiar_calendario.enabled = TRUE
							ELSE
								cb_limpiar_calendario.enabled = FALSE
							END IF
						END IF
					END IF
		END CHOOSE
	
		ii_month = li_mes
		ii_year = li_a$$HEX1$$f100$$ENDHEX$$o
		//This.SetRedraw(True)
	END IF

ELSE // se ha pulsado el bot$$HEX1$$f300$$ENDHEX$$n derecho. Este bot$$HEX1$$f300$$ENDHEX$$n deselecciona
	ii_dia_fin = 0
	ii_dia_inicio = 0
	ib_dias[li_dia] = FALSE
	wf_cargar_calendario()
END IF

// Se pintan de verde los d$$HEX1$$ed00$$ENDHEX$$as que ya tienen horario
wf_cargar_calendario()

// Se pintan de azul los d$$HEX1$$ed00$$ENDHEX$$as seleccionados. Si los festivos no est$$HEX1$$e100$$ENDHEX$$n seleccionados 
// se pintan de rojo
For li_indice=1 To 31
	IF ib_dias[li_indice] = TRUE THEN
		ole_calendar.Object.DayColor[li_indice] = ilk_activado 
	END IF
Next
This.SetRedraw(True)
IF cbx_en_turno.Checked = TRUE THEN
	dw_b_turno.TriggerEvent(itemchanged!)
ELSE
	em_desde1.TriggerEvent(modified!)
END IF
end event

type gb_1 from groupbox within u_gener_calendario
integer x = 23
integer y = 924
integer width = 1385
integer height = 444
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Horarios"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Du_gener_calendario.bin 
2200001000e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd00000006fffffffe0000000400000005fffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000300000000000000000000000000000000000000000000000000000000fa78ae1001c4b20500000003000005c00000000000500003004c004200430049004e0045004500530045004b000000590000000000000000000000000000000000000000000000000000000000000000000000000002001cffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000002001affffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000010000044200000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000101001a0000000200000001000000048caeadc011cf25b57d9cfe9d19c9b23700000000fa78ae1001c4b205fa78ae1001c4b205000000000000000000000000fffffffe00000002000000030000000400000005000000060000000700000008000000090000000a0000000b0000000c0000000d0000000e0000000f000000100000001100000012fffffffe000000140000001500000016fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
29ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f0043007900700069007200680067002000740063002800200029003900310036003900470020006d0061007300650061006d0020006e006e0049002e00630000fffe000201058caeadc011cf25b57d9cfe9d19c9b23700000001fb8f0821101b01640008ed8413c72e2b00000030000004120000001300000100000000a000000101000000a800000102000000b000000103000000b800000104000000c00000010500000204000001060000020c0000010700000214000001080000021c00000109000002240000010a0000022c0000010b000002340000010c0000023c0000010d000002440000010e0000024c0000010f00000254000001100000025c000001110000027400000000000002d8000000030001000000000003000019d700000003000014ac00000003000000640000004b000001390000fffe000101050be3520311ce8f91aa00e39d51b84b0000000001fb8f0821101b01640008ed8413c72e2b00000030000001090000000800000002000000480000000a00000054000000090000005c0000000400000064000000070000007000000006000000780000000800000080000000000000008800000008000000020000004d00000002000000000000000200000190000000060001d4c0000000000000000b000000000000000b000000000000000b00000000000000080000000000000005006f00660000086e00000e00740073006900720065006b000400740005000000730000007a0069000000000900000007006500770a670069080000006300000061006800070072000a0000007500000064006e0072006500000002000000050061006e0000066d000007000000690000006100740000006c00000003000006d3000000020000000e000000020000000a00000002000007700000000200000000000000020000000000000002000000000000000200000000000000020000000300000002000000010000000b0000ffff000000080000000e2c4c2c442c582c4d2c562c4a00000053000000080000005a72656e4565462c6f72657262614d2c6f2c6f7a7269726241614d2c6c4a2c6f796f696e756c754a2c412c6f6974736f6765532c6f656974706572626d634f202c726275746f4e2c656d6569762c6572626963694472626d65000000650000001300000000000000010001100000000a0079616400646165680a0072650c0000016c0000006c6576657366666f0e00746509000001660000007473726900796164000001060000000400796164000001030000000c6f74735f72706b630073706f000001110000000b746e6f6d6d616e680b0073650a0000016400000078657461657a6973000109000000070074636100006e6f690000010c0000000a657461647a697379010f0065000d00006f6d00006268746e6f7474750100736e090000015f000000657478650078746e0000010700000006746e6f6d0102006800090000655f00006e657478080079740500000179000000007261650000010d0000000b6574616464726f6204007265050000016600000000746e6f00000100000000097265765f6e6f69730001050000000500746164000000006500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000019d7000014ac00000064e3520300ce8f910b00e39d11b84b00aa00000151c0019000040001d4766c6548c00100000000c0c000000000ff000000ffffffff0000000080000000d30080800e00000670000a000000000700000000020000000100030002000000010101004c2c440d582c4d2c562c4a2c4559532c6f72656e6265462c6f72657272614d2c412c6f7a6c69726279614d2c754a2c6f2c6f696e696c754a67412c6f6f74736f7065532c6d6569742c65726274634f2065726275766f4e2c626d6569442c6572656963696572626d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000006f00430074006e006e00650073007400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000013000000d8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2D000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Du_gener_calendario.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point

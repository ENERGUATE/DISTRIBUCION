HA$PBExportHeader$w_2304_situacion_climatologica.srw
forward
global type w_2304_situacion_climatologica from w_sgigenerica
end type
type d_situacion_climatologica from u_sit_2001_pr_form_situacion_clima within w_2304_situacion_climatologica
end type
type cb_confirmar from u_cb within w_2304_situacion_climatologica
end type
type cb_cancelar from u_cb within w_2304_situacion_climatologica
end type
end forward

global type w_2304_situacion_climatologica from w_sgigenerica
integer x = 503
integer y = 716
integer width = 2656
integer height = 1000
string title = "OPEN SGI - Informe Climatol$$HEX1$$f300$$ENDHEX$$gico"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "comment.ico"
d_situacion_climatologica d_situacion_climatologica
cb_confirmar cb_confirmar
cb_cancelar cb_cancelar
end type
global w_2304_situacion_climatologica w_2304_situacion_climatologica

type prototypes

end prototypes

type variables
u_generico_comunicaciones iu_comunic
u_generico_comunicaciones iu_resetear
u_sit_2001_rn_form_situacion_clima iu_sit_2001_rn
u_sit_2001_nu_form_situacion_clima iu_sit_2001_nu
long i_cant_filas
string is_modstring, is_columna
boolean ib_valido
int li_accion_pregunta
int ii_error
end variables

forward prototypes
public subroutine f_destruir_objetos ()
end prototypes

public subroutine f_destruir_objetos ();/////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : f_destruir_objetos
//
// Objetivo: Destruye objetos creados en la window.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: -- 
//			Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

DESTROY iu_sit_2001_rn
DESTROY iu_sit_2001_nu	
DESTROY iu_comunic
DESTROY iu_resetear			

end subroutine

event ue_arch_grabar;long ll_fila
int li_ingresados
datetime ld_fecha
li_ingresados = 2

 d_situacion_climatologica.accepttext()
 ll_fila = d_situacion_climatologica.GetRow()

IF not isnull(d_situacion_climatologica.GetItemNumber(ll_fila, "temp_min"))   THEN
	li_ingresados ++
END IF
IF not isnull(d_situacion_climatologica.GetItemNumber(ll_fila, "temp_max")) and  d_situacion_climatologica.GetItemNumber(ll_fila, "temp_max") >= d_situacion_climatologica.GetItemNumber(ll_fila, "temp_min") THEN
	li_ingresados ++
END IF
IF d_situacion_climatologica.GetItemNumber(ll_fila, "humedad") > 0 THEN
	li_ingresados ++
END IF
IF NOT isNull(d_situacion_climatologica.GetItemNumber(ll_fila, "est_clima")) THEN
	li_ingresados ++
END IF
IF d_situacion_climatologica.GetItemString(ll_fila, "viento_dir") <> "" THEN
	li_ingresados ++
END IF
IF d_situacion_climatologica.GetItemNumber(ll_fila, "viento_vel") > 0 THEN
	li_ingresados ++
END IF
ii_error = 0
IF li_ingresados <> 8 THEN
	gnv_msg.f_mensaje("EM32", "", "", Ok!)
	message.Returnvalue = 1
	ii_error = 1
	RETURN
END IF

d_situacion_climatologica.setitem(ll_fila,"usuario",gs_usuario)
d_situacion_climatologica.setitem(ll_fila,"f_actual",fgnu_fecha_actual())
d_situacion_climatologica.setitem(ll_fila,"h_actual",fgnu_fecha_actual())
d_situacion_climatologica.setitem(ll_fila,"hora",fgnu_fecha_actual())
d_situacion_climatologica.setitem(ll_fila,"programa","w_2304_s")

ld_fecha = datetime(date(d_situacion_climatologica.getitemdatetime(d_situacion_climatologica.getrow(),"fecha")),time("00:00:00"))
d_situacion_climatologica.setitem(ll_fila,"fecha",ld_fecha)

IF d_situacion_climatologica.update() = 1 THEN
	//COMMIT;
	gnu_u_transaction.uf_commit()
ELSE
	//ROLLBACK;
	gnu_u_transaction.uf_rollback()
END IF

end event

event closequery;call super::closequery;int li_veces
Long ll_cmd
boolean lb_validar_grabar
datetime ldt_fecha
date ld_fecha_aux

IF iu_comunic.is_comunic.accion_llamada <> 'Consulta' THEN
	d_situacion_climatologica.AcceptText()
	
	IF ib_valido = False THEN
		message.Returnvalue = 1
		RETURN
	END IF
	
	IF d_situacion_climatologica.GetItemNumber(1,"nro_cmd") = fgci_todos THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar un " + &
										Left(d_situacion_climatologica.describe("nro_cmd_t.text"), Len(d_situacion_climatologica.describe("nro_cmd_t.text")) - 1) + &
									  " v$$HEX1$$e100$$ENDHEX$$lido")
		message.Returnvalue = 1
		RETURN
	END IF
	
	
	ldt_fecha = d_situacion_climatologica.GetItemDateTime(1,"fecha")
	ld_fecha_aux=Date(ldt_fecha)
	
	ll_cmd = d_situacion_climatologica.GetItemNumber(1,"nro_cmd")
	
	SELECT COUNT(*) INTO :li_veces FROM "GI_SIT_CLIMA"
	WHERE To_Date("GI_SIT_CLIMA"."FECHA") =:ld_fecha_aux AND 
			NRO_CMD=:ll_cmd;
	
	//BLANQUEO LAS VARIABLES DE COMUNICACIONES CON NULOS
	fgnu_resetear_s_comunicaciones(gu_comunic1)
	
	lb_validar_grabar=FALSE
	
	////valida si quiere grabar, cancelar o salir sin efectuar cambios
	IF iu_comunic.is_comunic.accion_llamada="Consulta" THEN
		li_accion_pregunta= 4
	ELSE
		li_accion_pregunta=gnv_msg.f_mensaje('CG001',"","",YesNoCancel!)
	END IF
	
	CHOOSE CASE li_accion_pregunta 
	CASE 1
		IF iu_comunic.is_comunic.accion_llamada = "Alta" THEN
			IF li_veces > 0 THEN
				gnv_msg.f_mensaje("EM21","","",OK!)
				d_situacion_climatologica.SetColumn("fecha")
				message.Returnvalue = 1
			ELSE 
				This.TriggerEvent("ue_arch_grabar")	
				if ii_error = 1 then
					message.returnvalue = 1
				end if
			END IF
		ELSE
			This.TriggerEvent("ue_arch_grabar")	
			if ii_error = 1 then
				message.returnvalue = 1
			end if
		END IF
	CASE 2
			//ROLLBACK;
			gnu_u_transaction.uf_rollback()
	CASE 3, -1
			message.Returnvalue = 1
	
	END CHOOSE
END IF		

end event

event open;call super::open;// Entrada
// gu_comunic.is_comunic.longval1 // nro_cmd
// gu_comunic.is_comunic.datval1 // Fecha
// gu_comunic.is_comunic.accion_llamada // "Consulta"
// Salida
// gu_comunic.is_comunic.programa_retorno "w_2302_observaciones_incidencia"

iu_comunic = CREATE u_generico_comunicaciones
iu_resetear = CREATE u_generico_comunicaciones
iu_sit_2001_rn = CREATE u_sit_2001_rn_form_situacion_clima
iu_sit_2001_nu = CREATE u_sit_2001_nu_form_situacion_clima
iu_comunic.is_comunic = gu_comunic.is_comunic
d_situacion_climatologica.settransobject(sqlca)

ib_valido = True

This.title = gu_comunic.f_titulo_ventana("w_2304","Situ.Clima.")

datawindowchild ddw_cmd
d_situacion_climatologica.GetChild('nro_cmd',ddw_cmd)
ddw_cmd.SetTransObject(SQLCA)
ddw_cmd.Retrieve(1)


CHOOSE CASE iu_comunic.is_comunic.accion_llamada
	CASE "Consulta"
			li_accion_pregunta = 3
			i_cant_filas = iu_sit_2001_nu.fnu_obtener_datos(d_situacion_climatologica,iu_comunic.is_comunic.longval1,iu_comunic.is_comunic.datval1)
		  	iu_sit_2001_rn.frn_color(True,d_situacion_climatologica)
			iu_sit_2001_rn.frn_habilitar_campos(FALSE,d_situacion_climatologica)
			cb_confirmar.visible = false
			cb_cancelar.visible = false
	CASE "Actualizacion"
		
			i_cant_filas = iu_sit_2001_nu.fnu_obtener_datos(d_situacion_climatologica,iu_comunic.is_comunic.longval1,iu_comunic.is_comunic.datval1)
		  	iu_sit_2001_rn.frn_color(True,d_situacion_climatologica)
			iu_sit_2001_rn.frn_habilitar_campos(true,d_situacion_climatologica)
	CASE "Alta"

			i_cant_filas = d_situacion_climatologica.insertrow(1)
			d_situacion_climatologica.setitem(1,"nro_cmd",iu_comunic.is_comunic.longval1)
			d_situacion_climatologica.setitem(1,"fecha",iu_comunic.is_comunic.datval1)
			d_situacion_climatologica.accepttext()
		  	iu_sit_2001_rn.frn_color(True,d_situacion_climatologica)
			iu_sit_2001_rn.frn_habilitar_campos_alta(true,d_situacion_climatologica)
END CHOOSE

IF gi_pais=8 THEN
	d_situacion_climatologica.object.t_velocidad.text='m/s'
END IF

end event

on close;call w_sgigenerica::close;F_DESTRUIR_OBJETOS()

end on

on w_2304_situacion_climatologica.create
int iCurrent
call super::create
this.d_situacion_climatologica=create d_situacion_climatologica
this.cb_confirmar=create cb_confirmar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_situacion_climatologica
this.Control[iCurrent+2]=this.cb_confirmar
this.Control[iCurrent+3]=this.cb_cancelar
end on

on w_2304_situacion_climatologica.destroy
call super::destroy
destroy(this.d_situacion_climatologica)
destroy(this.cb_confirmar)
destroy(this.cb_cancelar)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2304_situacion_climatologica
end type

type d_situacion_climatologica from u_sit_2001_pr_form_situacion_clima within w_2304_situacion_climatologica
integer x = 37
integer y = 28
integer width = 2528
integer height = 704
integer taborder = 30
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemerror;
//////// DBE ini comment
//string ls_titulo

//
//is_columna = This.GetColumnName()
//IF is_columna <> 'fecha' THEN  // si hay un error en fecha el mensaje ya lo construye el padre (LFE)
//	is_modstring = iu_sit_2001_rn.frn_validar(d_situacion_climatologica,is_columna)
//	ls_titulo = "Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
//	This.Modify(ls_titulo)
//	is_modstring = is_columna + ".ValidationMsg='"+is_modstring+"'"
//	This.Modify(is_modstring)
//END IF
//ib_valido = False
//
//////// DBE fin comment
end event

event itemchanged;call super::itemchanged;string ls_nulo
SetNull(ls_nulo)
is_modstring = iu_sit_2001_rn.frn_validar(d_situacion_climatologica,This.GetColumnName())

//DBE comment ini
//ib_valido = True
//
//IF is_modstring <> "" THEN
//	is_columna = This.GetColumnName()
//	RETURN(1)
//END IF
//
//DBE comment fin


IF is_modstring <> ""  THEN
	
	
	//
	   string ls_titulo
		ls_titulo = "Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
	This.Modify(ls_titulo)
		is_columna = This.GetColumnName()
		is_modstring = is_columna + ".ValidationMsg='"+is_modstring+"'"
	This.Modify(is_modstring)
   
	//
	is_columna = This.GetColumnName()
	this.SetItem( row, is_columna, 0)
	ib_valido = false
	RETURN(1)
	
	
else
	ib_valido = True
	RETURN(0)
END IF


end event

event ue_soltar_clicked;//
end event

type cb_confirmar from u_cb within w_2304_situacion_climatologica
event ue_todos pbm_custom33
integer x = 558
integer y = 752
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "Aceptar"
end type

event clicked;//valida si quiere grabar, cancelar o salir sin efectuar cambios
IF iu_comunic.is_comunic.accion_llamada="Consulta" THEN
	li_accion_pregunta= 2
ELSE
	li_accion_pregunta= 1   
END IF

close(parent)
end event

type cb_cancelar from u_cb within w_2304_situacion_climatologica
integer x = 1673
integer y = 752
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "Cancelar"
end type

on clicked;call u_cb::clicked;//li_accion_pregunta= 2

iu_comunic.is_comunic.accion_llamada = 'Consulta'
close(parent)
end on


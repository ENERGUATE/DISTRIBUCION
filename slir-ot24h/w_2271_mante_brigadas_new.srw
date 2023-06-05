HA$PBExportHeader$w_2271_mante_brigadas_new.srw
$PBExportComments$Ventana para asignar brigadistas y distintos turnos a una brigada
forward
global type w_2271_mante_brigadas_new from w_sgigenerica
end type
type tab_1 from tab within w_2271_mante_brigadas_new
end type
type tabpage_brigadas from userobject within tab_1
end type
type dw_brigadistas_asignados from u_bri_2012_pr_brigadistas_asignados within tabpage_brigadas
end type
type dw_brigadistas_disponibles from u_bri_2013_pr_brigadistas_disponibles within tabpage_brigadas
end type
type cb_agregar_brigadistas from commandbutton within tabpage_brigadas
end type
type cb_consultar from commandbutton within tabpage_brigadas
end type
type d_datos_brigada from u_bri_2011_pr_ingreso_brigadas within tabpage_brigadas
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within tabpage_brigadas
end type
type dw_1 from datawindow within tabpage_brigadas
end type
type tabpage_brigadas from userobject within tab_1
dw_brigadistas_asignados dw_brigadistas_asignados
dw_brigadistas_disponibles dw_brigadistas_disponibles
cb_agregar_brigadistas cb_agregar_brigadistas
cb_consultar cb_consultar
d_datos_brigada d_datos_brigada
d_ambito d_ambito
dw_1 dw_1
end type
type tabpage_calendario from userobject within tab_1
end type
type dw_festivos from datawindow within tabpage_calendario
end type
type uo_cal from u_gener_calendario within tabpage_calendario
end type
type tabpage_calendario from userobject within tab_1
dw_festivos dw_festivos
uo_cal uo_cal
end type
type tab_1 from tab within w_2271_mante_brigadas_new
tabpage_brigadas tabpage_brigadas
tabpage_calendario tabpage_calendario
end type
type cb_aceptar from commandbutton within w_2271_mante_brigadas_new
end type
type cb_cancelar from commandbutton within w_2271_mante_brigadas_new
end type
type cb_1 from commandbutton within w_2271_mante_brigadas_new
end type
end forward

global type w_2271_mante_brigadas_new from w_sgigenerica
integer x = 5
integer y = 256
integer width = 3657
integer height = 2048
string title = "OPEN SGI - "
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "brigadas.ico"
event ue_cambio_mes pbm_custom74
event ue_retrieve ( )
event ue_grabar ( )
tab_1 tab_1
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
cb_1 cb_1
end type
global w_2271_mante_brigadas_new w_2271_mante_brigadas_new

type variables
u_generico_comunicaciones iu_comunic

boolean ib_valido_movil = TRUE
boolean ib_grabar_bien = TRUE
////////////////////////////////////
int ii_fila_seleccionada
int ii_brig_select
int ii_nro_responsable
int ii_si_valido
int ii_cantidad
int i_ind_disp


long il_nro_brig

u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu
u_bri_2012_nu_brigadistas_asignados iu_bri_2012_nu
u_bri_2013_nu_brigadistas_disponibles iu_bri_2013_nu
u_bri_2011_nu_ingreso_brigadas iu_bri_2011_nu  

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//constant long gl_gris = 12632256
constant long gl_gris = 81324524
// Fin. Sgo.
constant long gl_blanco = 16777215
constant long gl_navy = 12582912
constant string gs_navy = '12582912'
end variables

forward prototypes
public function integer fw_grabar_brigada ()
public subroutine fw_editar_campos (datawindow pdw_datos)
end prototypes

event ue_retrieve;THIS.SETREDRAW(FALSE)
iu_bri_2013_nu.fnu_obtener_datos(tab_1.tabpage_brigadas.dw_brigadistas_disponibles,iu_comunic.is_comunic.intval1,iu_comunic.is_comunic.intval2,iu_comunic.is_comunic.intval3)
iu_bri_2012_nu.fnu_obtener_datos(tab_1.tabpage_brigadas.dw_brigadistas_asignados,tab_1.tabpage_brigadas.d_datos_brigada.getItemNumber(1,"nro_brigada"))
// Esto es para arreglar un problema con el retrieve as need - LFE
tab_1.tabpage_brigadas.dw_brigadistas_asignados.setfilter("")
tab_1.tabpage_brigadas.dw_brigadistas_asignados.filter()
//
THIS.SETREDRAW(TRUE)
end event

event ue_grabar;////Me fijo si valido la datawindow d_datos_brigada y en caso
////contrario retorno a la misma para corregir los errores
//Boolean lb_validar, lb_valido
//int li_nulo, li_count, li_total_filas, li_continuar
//datetime ld_fecha
//string ls_modstring	// ANG
//
//tab_1.tabpage_brigadas.d_datos_brigada.accepttext()
//ib_valido_movil = TRUE
//
//if ii_si_valido=0 THEN
//	ib_valido_movil = FALSE
//	tab_1.tabpage_brigadas.d_datos_brigada.setfocus()	
//	RETURN
//END IF
//
//lb_valido = iu_bri_2011_nu.fnu_validar_movil(ls_modstring,tab_1.tabpage_brigadas.d_datos_brigada.getitemstring(1,"movil"))
//
//IF lb_valido = FALSE THEN
//	ib_valido_movil = FALSE
//	tab_1.tabpage_brigadas.d_datos_brigada.SetColumn("movil")
//	tab_1.tabpage_brigadas.d_datos_brigada.setfocus()
//	return
//END IF
//
//iu_comunic.is_comunic.programa_retorno = "w_2271_mante_brigadas"
//CHOOSE CASE iu_comunic.is_comunic.accion_llamada
//	CASE "Alta"
//		setNull(li_nulo)
//		li_count = 1
//		ld_fecha = fgcd_fecha_con_seg()
//		li_total_filas = tab_1.tabpage_brigadas.dw_brigadistas_asignados.RowCount()
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"usuario",gs_usuario)
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"programa","w_2271_man_bri")
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"f_actual",ld_fecha)
//		tab_1.tabpage_brigadas.d_datos_brigada.setitem(1,"h_actual",ld_fecha)
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"ot",li_nulo)
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_centro",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_centro"))
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_cmd",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_cmd"))
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_mesa",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_mesa"))
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"ind_previsto",0)
//		DO WHILE li_count <= li_total_filas
//			tab_1.tabpage_brigadas.dw_brigadistas_asignados.SetItem(li_count,"gi_brigada_brigadista_nro_brigada",tab_1.tabpage_brigadas.d_datos_brigada.getItemnumber(1,"nro_brigada"))
//			li_count ++
//		LOOP
//		iu_comunic.is_comunic.accion_retorno = "Refrescar"
//	CASE "Modificacion"
//		setNull(li_nulo)
//		li_count = 1
//
//		ld_fecha = fgcd_fecha_con_seg()
//		li_total_filas = tab_1.tabpage_brigadas.dw_brigadistas_asignados.RowCount()
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"usuario",gs_usuario)
//
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"programa","w_2271_man_bri")
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"f_actual",ld_fecha)
//		tab_1.tabpage_brigadas.d_datos_brigada.setitem(1,"h_actual",ld_fecha)
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_centro",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_centro"))
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_cmd",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_cmd"))
//		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_mesa",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_mesa"))
//		
//		DO WHILE li_count <= li_total_filas
//			tab_1.tabpage_brigadas.dw_brigadistas_asignados.SetItem(li_count,"gi_brigada_brigadista_nro_brigada",tab_1.tabpage_brigadas.d_datos_brigada.getItemNumber(1,"nro_brigada"))
//			li_count ++
//		LOOP
//		iu_comunic.is_comunic.accion_retorno = "Refrescar"
//	CASE "Consulta"
//		iu_comunic.is_comunic.accion_retorno = "No Refrescar"
//		return
//END CHOOSE
//
//IF i_ind_disp <> tab_1.tabpage_brigadas.d_datos_brigada.GetItemNumber(1,"ind_disponible") THEN
//	iu_comunic.is_comunic.accion_retorno = "Refrescar"
//END IF
//
//tab_1.tabpage_brigadas.dw_brigadistas_asignados.setfilter("")
//tab_1.tabpage_brigadas.dw_brigadistas_asignados.filter()
//IF tab_1.tabpage_brigadas.dw_brigadistas_asignados.update() = -1 THEN
//	gnu_u_transaction.uf_rollback(This)
//	RETURN;
//END IF
//
//IF tab_1.tabpage_brigadas.d_datos_brigada.update() = -1 THEN
//	//ROLLBACK;
//	gnu_u_transaction.uf_rollback(This)
//	RETURN
//END IF
//
IF fw_grabar_brigada() = 0 THEN
	//gnu_u_transaction.uf_rollback()
	ib_grabar_bien = FALSE
ELSE
	IF tab_1.tabpage_calendario.uo_cal.dw_brig_con_calendario.Update() = -1 THEN
		//gnu_u_transaction.uf_rollback()
		//No fue posible grabar el calendario para la brigada.
		ib_grabar_bien = FALSE
		gnv_msg.f_mensaje("EM60","","",OK!)
	ELSE
		ib_grabar_bien = TRUE
		gnu_u_transaction.uf_commit()
	END IF
END IF

//COMMIT;


end event

public function integer fw_grabar_brigada ();//Me fijo si valido la datawindow d_datos_brigada y en caso
//contrario retorno a la misma para corregir los errores
Boolean lb_validar, lb_valido
int li_nulo, li_count, li_total_filas, li_continuar
datetime ld_fecha
string ls_modstring	// ANG
int li_nro_zona, li_nro_cmd, li_nro_sector


tab_1.tabpage_brigadas.d_datos_brigada.accepttext()

// Lo primero que se hace es fijarse si el $$HEX1$$e100$$ENDHEX$$mbito (LFE)
li_nro_zona=tab_1.tabpage_brigadas.d_ambito.getitemnumber(1,"nro_centro")
li_nro_cmd=tab_1.tabpage_brigadas.d_ambito.getitemnumber(1,"nro_cmd")
li_nro_sector=tab_1.tabpage_brigadas.d_ambito.getitemnumber(1,"nro_mesa")
if li_nro_zona=0 or li_nro_cmd=0 or li_nro_sector=0 then
	gnv_msg.f_mensaje("EA20","","",OK!)	
	//			messagebox("Aviso","Ambito incorrecto")
	return 0
END IF

ib_valido_movil = TRUE

if ii_si_valido=0 THEN
	ib_valido_movil = FALSE
	tab_1.tabpage_brigadas.d_datos_brigada.setfocus()	
	RETURN 0
END IF

lb_valido = iu_bri_2011_nu.fnu_validar_movil(ls_modstring,tab_1.tabpage_brigadas.d_datos_brigada.getitemstring(1,"movil"))

IF lb_valido = FALSE THEN
	ib_valido_movil = FALSE
	tab_1.tabpage_brigadas.d_datos_brigada.SetColumn("movil")
	tab_1.tabpage_brigadas.d_datos_brigada.setfocus()
	return 0
END IF

iu_comunic.is_comunic.programa_retorno = "w_2271_mante_brigadas"
CHOOSE CASE iu_comunic.is_comunic.accion_llamada
	CASE "Alta"
		setNull(li_nulo)
		li_count = 1
		ld_fecha = fgcd_fecha_con_seg()
		li_total_filas = tab_1.tabpage_brigadas.dw_brigadistas_asignados.RowCount()
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"usuario",gs_usuario)
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"programa","w_2271_man_bri")
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"f_actual",ld_fecha)
		tab_1.tabpage_brigadas.d_datos_brigada.setitem(1,"h_actual",ld_fecha)
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"ot",li_nulo)
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_centro",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_centro"))
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_cmd",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_cmd"))
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_mesa",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_mesa"))
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"ind_previsto",0)
		DO WHILE li_count <= li_total_filas
			tab_1.tabpage_brigadas.dw_brigadistas_asignados.SetItem(li_count,"gi_brigada_brigadista_nro_brigada",tab_1.tabpage_brigadas.d_datos_brigada.getItemnumber(1,"nro_brigada"))
			li_count ++
		LOOP
		iu_comunic.is_comunic.accion_retorno = "Refrescar"
	CASE "Modificacion"
		setNull(li_nulo)
		li_count = 1

		ld_fecha = fgcd_fecha_con_seg()
		li_total_filas = tab_1.tabpage_brigadas.dw_brigadistas_asignados.RowCount()
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"usuario",gs_usuario)

		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"programa","w_2271_man_bri")
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"f_actual",ld_fecha)
		tab_1.tabpage_brigadas.d_datos_brigada.setitem(1,"h_actual",ld_fecha)
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_centro",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_centro"))
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_cmd",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_cmd"))
		tab_1.tabpage_brigadas.d_datos_brigada.setItem(1,"nro_mesa",tab_1.tabpage_brigadas.d_ambito.getItemNumber(1,"nro_mesa"))
		
		DO WHILE li_count <= li_total_filas
			tab_1.tabpage_brigadas.dw_brigadistas_asignados.SetItem(li_count,"gi_brigada_brigadista_nro_brigada",tab_1.tabpage_brigadas.d_datos_brigada.getItemNumber(1,"nro_brigada"))
			li_count ++
		LOOP
		iu_comunic.is_comunic.accion_retorno = "Refrescar"
	CASE "Consulta"
		iu_comunic.is_comunic.accion_retorno = "No Refrescar"
		return 0
END CHOOSE

IF i_ind_disp <> tab_1.tabpage_brigadas.d_datos_brigada.GetItemNumber(1,"ind_disponible") THEN
	iu_comunic.is_comunic.accion_retorno = "Refrescar"
END IF

tab_1.tabpage_brigadas.dw_brigadistas_asignados.setfilter("")
tab_1.tabpage_brigadas.dw_brigadistas_asignados.filter()
IF tab_1.tabpage_brigadas.dw_brigadistas_asignados.update() <> -1 THEN
	IF tab_1.tabpage_brigadas.d_datos_brigada.update() <> -1 THEN
		return 1
	ELSE
		return 0
	END IF
ELSE
	return 0
END IF

end function

public subroutine fw_editar_campos (datawindow pdw_datos);int li_tipo
string ls_descripcion
string ls_centro, ls_cmd, ls_mesa

li_tipo = pdw_datos.GetItemNumber(1,'tip_brigada')
SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_descripcion
FROM "SGD_VALOR"  
WHERE ("SGD_VALOR"."CODIF" = 'T_BR' ) AND  
      ("SGD_VALOR"."CODIGO" = :li_tipo )  ;  
		
tab_1.tabpage_brigadas.dw_1.Modify("tipo_t.text = '" + ls_descripcion + "'")

SELECT  NOM_CENTRO
INTO :ls_centro
FROM  SGD_CENTRO
WHERE ( NRO_CENTRO = :gu_comunic.is_comunic.intval1) AND 
	   ( TIP_CENTRO  = 1   );
         
SELECT NOM_CENTRO
INTO :ls_cmd
FROM SGD_CENTRO
WHERE ( NRO_CENTRO = :gu_comunic.is_comunic.intval2) AND
      ( TIP_CENTRO = 2   ) ;
		 
SELECT  NOM_CENTRO
INTO :ls_mesa
FROM SGD_CENTRO  
WHERE ( TIP_CENTRO = 3   ) AND    
      ( NRO_CENTRO = :gu_comunic.is_comunic.intval3)  ;	
		
tab_1.tabpage_brigadas.dw_1.modify("centro_t.text = '" + ls_centro + "'")
tab_1.tabpage_brigadas.dw_1.modify("cmd_t.text = '" + ls_cmd + "'")
tab_1.tabpage_brigadas.dw_1.modify("mesa_t.text = '" + ls_mesa + "'")
end subroutine

on w_2271_mante_brigadas_new.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.cb_1
end on

on w_2271_mante_brigadas_new.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.cb_1)
end on

event open;call super::open;///////////////////////////////////////////////////////////////////////
//
//	Evento:	open
//
// permite actualizar una brigada determinada.
//
// gu_comunic.is_Comunic.intval1 = centro
//								 intval2 = cmd
//								 intval3 = puesto
// 							 longval1 = brigada (para modificacion)
//
//gu_comunic.is_comunic.accion_llamada = "Alta"
//													  "Modificacion"	
//													  "Consulta"
///////////////////////////////////////////////////////////////////////
datawindowchild ddw_int_horario
int li_cont

THIS.SETREDRAW(FALSE)
int li_hora

// creo objetos de trabajo
iu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
iu_bri_2013_nu = CREATE u_bri_2013_nu_brigadistas_disponibles
iu_bri_2012_nu	= CREATE	u_bri_2012_nu_brigadistas_asignados
iu_bri_2011_nu = CREATE u_bri_2011_nu_ingreso_brigadas
int li_cantidad

// recibo parametros de entrada
iu_comunic.is_comunic = gu_comunic.is_comunic

// Seteo t$$HEX1$$ed00$$ENDHEX$$tulo de ventana 
//window lw_ventana
//lw_ventana = This
//fg_colocar_ventana(lw_ventana)
this.title = iu_comunic.f_titulo_ventana ("w_6202", iu_comunic.is_comunic.accion_llamada)

// Inicializo objetos de trabajo
tab_1.tabpage_brigadas.dw_brigadistas_asignados.setTransObject(SQLCA)
tab_1.tabpage_brigadas.dw_brigadistas_disponibles.setTransObject(SQLCA)
// Se inicializan loas datawindows del objeto del calendario de turnos
tab_1.tabpage_calendario.uo_cal.dw_brig_con_calendario.DataObject = 'd_nv_brigada_cal'
tab_1.tabpage_calendario.uo_cal.dw_brig_con_calendario.SetTransObject(Sqlca)
tab_1.tabpage_calendario.uo_cal.dw_festivos.SetTransObject(Sqlca)

tab_1.tabpage_brigadas.d_ambito.fpr_crea_dddw()
tab_1.tabpage_brigadas.d_ambito.f_insertar_fila()
tab_1.tabpage_brigadas.d_ambito.fnu_insertar_datos(gu_comunic.is_comunic.intval1,gu_comunic.is_comunic.intval2,gu_comunic.is_comunic.intval3,0)

iu_bri_2011_nu.fnu_crea_dddw(tab_1.tabpage_brigadas.d_datos_brigada)
tab_1.tabpage_brigadas.d_datos_brigada.InsertRow(0)

// Setea el ambito con intval1..intval3.
//fw_cargo_ambito()
tab_1.tabpage_brigadas.d_datos_brigada.setTransObject(SQLCA)

tab_1.tabpage_brigadas.dw_brigadistas_disponibles.enabled = true
tab_1.tabpage_brigadas.dw_brigadistas_asignados.enabled = true
cb_aceptar.enabled = true
tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_nombre()
tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_nro_brigada()
li_cantidad = 0

//Habilito el calendario
tab_1.tabpage_calendario.uo_cal.ole_calendar.enabled = TRUE

//Hago que el calendario muestre la fecha actual
tab_1.tabpage_calendario.uo_cal.ole_calendar.Object.Today
tab_1.tabpage_calendario.uo_cal.ole_calendar.object.year = year(today())

// Inserto los turnos preestablecidos en dw_b_turno
tab_1.tabpage_calendario.uo_cal.dw_b_turno.Insertrow(0)
tab_1.tabpage_calendario.uo_cal.dw_b_turno.GetChild('pi_turno', ddw_int_horario)
ddw_int_horario.SetTransObject(sqlca)
ddw_int_horario.Retrieve()
IF ddw_int_horario.RowCount() > 0 THEN
	// Se visualiza el primer turno preestablecido
	tab_1.tabpage_calendario.uo_cal.dw_b_turno.Setitem(1,1,ddw_int_horario.GetItemString(1,1))
	tab_1.tabpage_calendario.uo_cal.dw_b_turno.accepttext()
END IF

// Se deshabilitan los botones de grabar y borrar d$$HEX1$$ed00$$ENDHEX$$as
tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.enabled = False
tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.enabled = False

CHOOSE CASE iu_comunic.is_comunic.accion_llamada
	CASE "Alta"
			
		li_hora = Hour(Now( ))
		if li_hora >= 0 and li_hora <= 8 then 
			tab_1.tabpage_brigadas.d_datos_brigada.fpr_inicializo(1,1,1)
		elseif li_hora >8 and li_hora <=16 then
			tab_1.tabpage_brigadas.d_datos_brigada.fpr_inicializo(1,2,1)
		else	
			tab_1.tabpage_brigadas.d_datos_brigada.fpr_inicializo(1,3,1)
		end if
//		d_datos_brigada.fpr_inicializo(1,1)
		tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_ind_disponible() /* Merc*/
		il_nro_brig = iu_bri_2011_nu.fnu_actualizar_ultima_brigada()
		// se le pasa al objeto del calendario de turnos el n$$HEX1$$fa00$$ENDHEX$$mero de la nueva brigada
		tab_1.tabpage_calendario.uo_cal.il_nro_brig_con = il_nro_brig
		ii_nro_responsable=0
		tab_1.tabpage_brigadas.d_datos_brigada.Setitem(1,"nro_brigada",il_nro_brig)
		cb_aceptar.enabled = false
		iu_comunic.is_comunic.accion_retorno = "Refrescar"
		// No se habilita el calendario por ser alta
		tab_1.tabpage_calendario.enabled = False		
		
	CASE "Modificacion"
		SELECT COUNT (*) INTO :li_cantidad FROM GI_BRIGADA_OT
		WHERE NRO_BRIGADA = :iu_comunic.is_comunic.longval1 AND
		F_HASTA IS NULL;

		if sqlca.sqlcode = 0 then
			IF li_cantidad >0 THEN
				tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_ind_disponible()
				tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_movil()
				tab_1.tabpage_brigadas.d_datos_brigada.modify("frec_radio.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//				tab_1.tabpage_brigadas.d_datos_brigada.modify("frec_radio.background.color="+string(65536*192+256*192+192))
				tab_1.tabpage_brigadas.d_datos_brigada.modify("frec_radio.background.color=" + gs_gris)
// Fin. Sgo.
				tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_tipo()
			END IF
			ii_cantidad=li_cantidad
		end if
		// Se le pasa el n$$HEX1$$fa00$$ENDHEX$$mero de brigada al objeto del calendario de turnos
		tab_1.tabpage_calendario.uo_cal.il_nro_brig_con = iu_comunic.is_comunic.longval1
		tab_1.tabpage_brigadas.d_datos_brigada.retrieve(iu_comunic.is_comunic.longval1)
		select nro_brigadistas 
		into :ii_nro_responsable 
		from gi_brigada_brigadista 
		where nro_brigada=:iu_comunic.is_comunic.longval1 
			   and encargado=1;
		//tab_1.tabpage_brigadas.d_ambito.fnu_deshab_puesto(tab_1.tabpage_brigadas.d_ambito)
		tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_ind_disponible() /* Merc*/
		tab_1.tabpage_calendario.uo_cal.enabled = True
	CASE "Consulta"
		// Se le pasa el n$$HEX1$$fa00$$ENDHEX$$mero de brigada al objeto del calendario de turnos
		tab_1.tabpage_calendario.uo_cal.il_nro_brig_con = iu_comunic.is_comunic.longval1
		tab_1.tabpage_brigadas.d_datos_brigada.retrieve(iu_comunic.is_comunic.longval1)
		tab_1.tabpage_brigadas.d_ambito.fnu_deshab_puesto(tab_1.tabpage_brigadas.d_ambito)
		tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_ind_disponible()
		//tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_turno()
		tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_movil()
		tab_1.tabpage_brigadas.d_datos_brigada.fnu_deshab_tipo()
		tab_1.tabpage_brigadas.d_datos_brigada.modify("frec_radio.protect=1")
// Modificaci$$HEX1$$f300$$ENDHEX$$n por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		tab_1.tabpage_brigadas.d_datos_brigada.modify("frec_radio.background.color="+string(65536*192+256*192+192))
		tab_1.tabpage_brigadas.d_datos_brigada.modify("frec_radio.background.color=" + gs_gris)
// Fin. Sgo.
//		dw_brigadistas_disponibles.enabled = false /*ANG*/	
//		dw_brigadistas_asignados.enabled = true	/*ANG*/
		cb_aceptar.enabled = false
		cb_aceptar.visible = false
		cb_cancelar.visible = false
		tab_1.tabpage_brigadas.cb_agregar_brigadistas.visible = false
		tab_1.tabpage_calendario.uo_cal.enabled = True
		// Como estamos en modo consulta se deshabilitan todos los elemntos modificables
		tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.enabled = false
		tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.visible = false
		tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.enabled = false
		tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.visible = false
		tab_1.tabpage_calendario.uo_cal.em_desde1.enabled = FALSE
		tab_1.tabpage_calendario.uo_cal.em_hasta1.enabled = FALSE
		tab_1.tabpage_calendario.uo_cal.em_desde2.enabled = FALSE
		tab_1.tabpage_calendario.uo_cal.em_hasta2.enabled = FALSE
		tab_1.tabpage_calendario.uo_cal.dw_b_turno.enabled = FALSE
		tab_1.tabpage_calendario.uo_cal.dw_b_turno.Object.pi_turno.background.color = gs_gris
		tab_1.tabpage_calendario.uo_cal.cbx_en_turno.enabled = FALSE
		tab_1.tabpage_calendario.uo_cal.cbx_festivos.enabled = FALSE
END CHOOSE
tab_1.tabpage_calendario.uo_cal.TriggerEvent("ue_cambio_mes")

ii_si_valido=1
i_ind_disp = tab_1.tabpage_brigadas.d_datos_brigada.GetItemNumber(1,"ind_disponible")

//tab_1.tabpage_brigadas.d_ambito.fnu_deshab_centro(tab_1.tabpage_brigadas.d_ambito)
//tab_1.tabpage_brigadas.d_ambito.fnu_deshab_cmd(tab_1.tabpage_brigadas.d_ambito)

// obtengo informaci$$HEX1$$f300$$ENDHEX$$n de la lista
this.triggerevent("ue_retrieve")
//d_datos_brigada.setfocus()

tab_1.tabpage_brigadas.cb_agregar_brigadistas.SetFocus()

end event

event closequery;call super::closequery;IF tab_1.tabpage_calendario.uo_cal.ib_hay_cambios THEN
	//$$HEX1$$bf00$$ENDHEX$$Desea guardar los cambios efectuados?
	IF gnv_msg.f_mensaje("CG01","","",YESNO!)=1 THEN
		tab_1.tabpage_calendario.uo_cal.triggerevent("ue_grabar")
		IF ib_grabar_bien = TRUE THEN
			gnu_u_transaction.uf_Commit(this)
		ELSE
			return 1
		END IF
	else
		gnu_u_transaction.uf_rollback(this)
	END IF
	tab_1.tabpage_calendario.uo_cal.ib_hay_cambios = FALSE
else
	gnu_u_transaction.uf_rollback(this)
END IF


gu_comunic.is_comunic = iu_comunic.is_comunic
gu_comunic.is_comunic.intval1 = tab_1.tabpage_brigadas.d_ambito.GetItemNumber(1,"nro_centro")
gu_comunic.is_comunic.intval2 = tab_1.tabpage_brigadas.d_ambito.GetItemNumber(1,"nro_cmd")
gu_comunic.is_comunic.intval3 = tab_1.tabpage_brigadas.d_ambito.GetItemNumber(1,"nro_mesa")
gu_comunic.is_comunic.programa_retorno = "w_2271"

DESTROY iu_comunic
DESTROY iu_cen_2001_nu
DESTROY iu_bri_2012_nu 
DESTROY iu_bri_2013_nu 
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2271_mante_brigadas_new
end type

type tab_1 from tab within w_2271_mante_brigadas_new
event create ( )
event destroy ( )
integer x = 41
integer y = 20
integer width = 3534
integer height = 1616
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_brigadas tabpage_brigadas
tabpage_calendario tabpage_calendario
end type

on tab_1.create
this.tabpage_brigadas=create tabpage_brigadas
this.tabpage_calendario=create tabpage_calendario
this.Control[]={this.tabpage_brigadas,&
this.tabpage_calendario}
end on

on tab_1.destroy
destroy(this.tabpage_brigadas)
destroy(this.tabpage_calendario)
end on

event selectionchanging;// Si estamos dando de alta grabamos los datos de la nueva brigada antes de cambiar al
// tabpage del calendario. Se hace esto debido a que la tabla que almacena los horarios de 
// las brigadas tiene como foreign key el nro de brigada, por lo que $$HEX1$$e900$$ENDHEX$$ste tiene que existir
// en la tabla gi_brigada para poder dar de alta d$$HEX1$$ed00$$ENDHEX$$as en el calendario.
IF iu_comunic.is_comunic.accion_llamada = "Alta" AND newindex = 2 THEN
	IF fw_grabar_brigada() = 0 THEN
		return 1
	END IF
END IF
	

end event

type tabpage_brigadas from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3497
integer height = 1488
long backcolor = 79741120
string text = "    Brigadas"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Brigada4.bmp"
long picturemaskcolor = 553648127
dw_brigadistas_asignados dw_brigadistas_asignados
dw_brigadistas_disponibles dw_brigadistas_disponibles
cb_agregar_brigadistas cb_agregar_brigadistas
cb_consultar cb_consultar
d_datos_brigada d_datos_brigada
d_ambito d_ambito
dw_1 dw_1
end type

on tabpage_brigadas.create
this.dw_brigadistas_asignados=create dw_brigadistas_asignados
this.dw_brigadistas_disponibles=create dw_brigadistas_disponibles
this.cb_agregar_brigadistas=create cb_agregar_brigadistas
this.cb_consultar=create cb_consultar
this.d_datos_brigada=create d_datos_brigada
this.d_ambito=create d_ambito
this.dw_1=create dw_1
this.Control[]={this.dw_brigadistas_asignados,&
this.dw_brigadistas_disponibles,&
this.cb_agregar_brigadistas,&
this.cb_consultar,&
this.d_datos_brigada,&
this.d_ambito,&
this.dw_1}
end on

on tabpage_brigadas.destroy
destroy(this.dw_brigadistas_asignados)
destroy(this.dw_brigadistas_disponibles)
destroy(this.cb_agregar_brigadistas)
destroy(this.cb_consultar)
destroy(this.d_datos_brigada)
destroy(this.d_ambito)
destroy(this.dw_1)
end on

type dw_brigadistas_asignados from u_bri_2012_pr_brigadistas_asignados within tabpage_brigadas
integer x = 50
integer y = 720
integer width = 1376
integer height = 616
integer taborder = 11
string dragicon = "ROW.ICO"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;///////////////////////////////////////////////////////////////////////
//
//	Evento:	clicked
//
///////////////////////////////////////////////////////////////////////

if iu_comunic.is_comunic.accion_llamada="Consulta" then return

// Deselecciono todo y selecciono la fila en que hizo click.
if  row = 0 then
	return
end if
ii_fila_seleccionada = row
ii_brig_select = ii_fila_seleccionada
this.selectRow(0,FALSE)
this.selectRow(ii_fila_seleccionada,TRUE)

// Comienzo el dragueo

this.drag(begin!)
end event

event doubleclicked;///////////////////////////////////////////////////////////////////////
//
//	Evento:	doubleclicked
//
///////////////////////////////////////////////////////////////////////

if iu_comunic.is_comunic.accion_llamada="Consulta" then return

// Asigno brigadista responsable , ii_fila_seleccionada
int li_count, li_total_filas, li_responsable
string ls_nombre_encargado, ls_encargado
This.drag(cancel!)
IF row <=0 and This.RowCount() <> 1 THEN
		RETURN
END IF
li_total_filas = This.RowCount()

IF li_total_filas = 0 THEN
	RETURN
END IF

li_count = 1 
ii_nro_responsable = 0

DO WHILE li_count <= li_total_filas
	if This.GetItemNumber(li_count,"gi_brigada_brigadista_encargado") = 1 then
		ii_nro_responsable = This.GetItemNumber(li_count,"gi_brigada_brigadista_nro_brigadistas") 
	end if

	li_count ++
LOOP

li_count = 1 

DO WHILE li_count <= li_total_filas
	IF li_count = ii_fila_seleccionada THEN
		This.SetItem(li_count,"gi_brigada_brigadista_encargado",1)
		This.SetItem(li_count,"gi_brigadista_encargado",1)
	ELSE
		This.SetItem(li_count,"gi_brigada_brigadista_encargado",0)
		This.SetItem(li_count,"gi_brigadista_encargado",0)
	END IF

	li_count ++
LOOP 

ls_nombre_encargado = This.GetItemString(ii_fila_seleccionada,"gi_brigadista_ape1")
ls_nombre_encargado=	ls_nombre_encargado+", "+This.GetItemString(ii_fila_seleccionada,"gi_brigadista_nombre")

d_datos_brigada.SetItem(1,"nombre",ls_nombre_encargado)

IF ii_nro_responsable <> 0 then
	UPDATE "GI_BRIGADISTA"  
   SET "ENCARGADO" = 0
   WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" = :ii_nro_responsable   ;
END IF

ii_nro_responsable = This.GetItemNumber(ii_fila_seleccionada,"gi_brigada_brigadista_nro_brigadistas")

UPDATE "GI_BRIGADISTA"  
SET "ENCARGADO" = 1  
WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" = :ii_nro_responsable   ;

cb_aceptar.enabled = TRUE
tab_1.tabpage_calendario.enabled = TRUE
d_datos_brigada.accepttext()




end event

event dragdrop;///////////////////////////////////////////////////////////////////////
//
//	Evento:	dragdrop
//
///////////////////////////////////////////////////////////////////////
long ll_nro_brigadista, ll_brig_bloq
int li_lock_status
			
if iu_comunic.is_comunic.accion_llamada="Consulta" then return
//if lu_comunic.is_comunic.accion_llamada="Modificacion" then return

this.selectRow(0,FALSE)
this.setredraw(FALSE)
long ll_fila_seleccionada, ll_buscar, ll_cant_filas
string ls_brigadista_seleccionado , ls_condicion, ls_nombre
datawindow objeto

objeto = draggedObject()

if typeOf(objeto) = dataWindow! then
	if objeto.dataObject = "d_bri_2013_brigadistas_disponibles" then
		ll_fila_seleccionada = objeto.getSelectedRow(0)
		if ll_fila_seleccionada > 0 or not isNull(ll_fila_seleccionada) then
			ll_nro_brigadista=objeto.getitemnumber(ll_fila_seleccionada,'gi_brigadista_nro_brigadistas')
			//li_lock_status=gnu_u_transaction.uf_lock(w_2271_mante_brigadas_new,'GI_BRIGADISTA','NRO_BRIGADISTAS = '+string(ll_nro_brigadista), false)
			SELECT NRO_BRIGADISTAS
			INTO :ll_brig_bloq
			FROM GI_BRIGADISTA
			WHERE NRO_BRIGADISTAS = :ll_nro_brigadista FOR UPDATE NOWAIT;
			
//			IF li_lock_status<>0 THEN
			IF SQLCA.SQLCode <> 0 THEN
	      	this.SelectRow(0, FALSE)
				this.setRedraw(TRUE)
				gnv_msg.f_mensaje("AI96","El Brigadista","modificado",OK!)
				this.drag(Cancel!)
			ELSE
				this.setFilter("")
				this.filter()
				ls_brigadista_seleccionado = objeto.getItemString(ll_fila_seleccionada,"cc_nombre_brigadista")
				ls_condicion = "cc_nombre_brigadista = '" + string(ls_brigadista_seleccionado) + "'"
				ll_buscar = this.find(ls_condicion, 0, this.rowCount())
				
				// Si no lo encontro, inserto nuevo registro
				d_datos_brigada.accepttext()
				if ll_buscar = 0 then
						iu_bri_2012_nu.fnu_insertar_datos(dw_brigadistas_asignados,d_datos_brigada.getItemNumber(1,"nro_brigada"),"w_2271_man_bri",objeto.getItemNumber(ll_fila_seleccionada,"gi_brigadista_nro_brigadistas"),0,objeto.getItemString(ll_fila_seleccionada,"gi_brigadista_nombre"),objeto.getItemString(ll_fila_seleccionada,"gi_brigadista_ape1"),objeto.getItemString(ll_fila_seleccionada,"gi_brigadista_ape2"))
						//gnu_u_transaction_uf_commit();
						dw_brigadistas_disponibles.Retrieve(iu_comunic.is_comunic.intval1,iu_comunic.is_comunic.intval2,iu_comunic.is_comunic.intval3)
				else	// Si recien lo borro, lo modifico y aparece de nuevo
					iu_bri_2012_nu.fnu_liberar_por_error(dw_brigadistas_asignados,ll_buscar)
				end if
				// Elimino como disponible y refresco los datos
				iu_bri_2013_nu.fnu_eliminar_fila(objeto,ll_fila_seleccionada)
	//			objeto.setFilter("ind_disponible = 1")
	//			objeto.filter()
				this.setFilter("ISNULL(GI_BRIGADA_BRIGADISTA_F_FIN)")
				this.filter()
				// Si es el primer brigadista se lo asigna como encargado por defecto
				IF This.RowCount() = 1 THEN
					ii_fila_seleccionada = 1
					This.TriggerEvent(Doubleclicked!)
					//gnu_u_transaction.uf_commit()
				END IF
			END IF
		end if
	end if
end if



this.drag(End!)
this.setRedraw(TRUE)
This.accepttext()

end event

event sqlpreview;call super::sqlpreview;//
end event

type dw_brigadistas_disponibles from u_bri_2013_pr_brigadistas_disponibles within tabpage_brigadas
integer x = 1733
integer y = 728
integer width = 1641
integer height = 620
integer taborder = 11
string dragicon = "ROW.ICO"
boolean hscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;///////////////////////////////////////////////////////////////////////
//
//	Evento:	clicked
//
///////////////////////////////////////////////////////////////////////

long ll_responsable, ll_disponible, ll_respuesta, ll_brigadista, ll_brigada, ll_brig
if iu_comunic.is_comunic.accion_llamada="Consulta" then return
date dt_hoy

dt_hoy = Today()

// Deselecciono todo y selecciono la fila en que hizo click.
if  row = 0 then
	return
end if
this.selectRow(0,FALSE)
this.selectRow(row,TRUE)

ll_responsable = This.GetItemNumber(row,"gi_brigadista_encargado")
ll_disponible = This.GetItemNumber(row,"gi_brigadista_ind_disponible")
ll_brigadista = This.GetItemNumber(row,"gi_brigadista_nro_brigadistas")
ll_brig =       This.GetItemNumber(row,"gi_brigada_brigadista_nro_brigada")
ll_brigada =    d_datos_brigada.GetItemNumber(1,"nro_brigada")

IF ll_responsable = 1 THEN 
	IF ll_brig <> ll_brigada or IsNull (ll_brig) THEN
		//Este brigadista ya es responsable de otra brigada
		gnv_msg.f_mensaje("AM22","","",OK!)
	ELSE
		//Este brigadista es el responsable de esta brigada
		gnv_msg.f_mensaje("AM23","","",OK!)
	END IF	
ELSE
	IF ll_disponible = 0 THEN
		IF ll_brig <> ll_brigada or IsNull (ll_brig) THEN
			//Este brigadista ya est$$HEX2$$e1002000$$ENDHEX$$trabajando en otra brigada. $$HEX1$$bf00$$ENDHEX$$Desea incorporarle a esta brigada?
			ll_respuesta = gnv_msg.f_mensaje("CM11","","",YESNO!)
			IF ll_respuesta = 2 THEN
		   	this.selectRow(row,FALSE)
				return
			ELSE
			  	UPDATE "GI_BRIGADA_BRIGADISTA"  
			  		SET "F_FIN" = :dt_hoy
					WHERE "GI_BRIGADA_BRIGADISTA"."NRO_BRIGADISTAS" = :ll_brigadista ; 
				this.drag(begin!)	
	  		END IF
		ELSE
			//Este brigadista ya est$$HEX2$$e1002000$$ENDHEX$$trabajando en esta brigada
			gnv_msg.f_mensaje("AM24","","",OK!)
			This.selectRow(row,FALSE)
		END IF
	ELSE	
		// Comienzo el dragueo
		this.drag(begin!)
   END IF

END IF	
end event

event dragdrop;/////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////
//
//	Evento:	dragdrop
//
///////////////////////////////////////////////////////////////////////
if iu_comunic.is_comunic.accion_llamada="Consulta" then return

this.selectRow(0,FALSE)

this.setRedraw(FALSE)

long ll_fila_seleccionada, ll_buscar, ll_cant_filas, ll_brig 
string ls_brigadista_seleccionado , ls_condicion, ls_nombre

datawindow objeto

objeto = draggedObject()

IF typeOf(objeto) = dataWindow! then
	IF objeto.dataObject = "d_bri_2012_brigadistas_asignados" then
		ll_fila_seleccionada = objeto.getSelectedRow(0)
		ll_brig = dw_brigadistas_asignados.getitemnumber(ll_fila_seleccionada,"gi_brigada_brigadista_nro_brigadistas")    
		//gnu_u_transaction.uf_rollback(w_2271_mante_brigadas_new,'GI_BRIGADISTA','NRO_BRIGADISTAS = '+string(ll_brig))
		IF dw_brigadistas_asignados.getitemnumber(ll_fila_seleccionada,"gi_brigada_brigadista_encargado") = 1 THEN
			setnull(ls_nombre)
			d_datos_brigada.setitem(1,"nombre",ls_nombre)
			cb_aceptar.enabled = FALSE
			tab_1.tabpage_calendario.enabled = False		
 		  	UPDATE "GI_BRIGADISTA"  
			   SET "ENCARGADO" = 0  
			   WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" =:ll_brig   ;
			
						
		END IF
		dw_brigadistas_asignados.setitem(ll_fila_seleccionada,"gi_brigada_brigadista_encargado",0)
		dw_brigadistas_asignados.setitem(ll_fila_seleccionada,"gi_brigadista_encargado",0)
		if ll_fila_seleccionada > 0 or not isNull(ll_fila_seleccionada) then
			ls_brigadista_seleccionado = objeto.getItemString(ll_fila_seleccionada,"cc_nombre_brigadista")
			ls_condicion = "cc_nombre_brigadista = '" + string(ls_brigadista_seleccionado) + "'"
      	this.setFilter("")
			this.filter()
			ll_buscar = this.find(ls_condicion, 0, this.rowCount()) 
		   if ll_buscar <> 0 OR TRUE then

				// Marco brigadista como disponible y lo ingreso en la lista
				IF ll_buscar > 0 THEN
					dw_brigadistas_disponibles.setItem(ll_buscar,"gi_brigadista_ind_disponible",1)
					dw_brigadistas_disponibles.setItem(ll_buscar,"gi_brigadista_encargado",0)
				END IF
				
				UPDATE "GI_BRIGADISTA"  
 				SET "IND_DISPONIBLE" = 1,
 	 				 "ENCARGADO" = 0
 				WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" =:ll_brig;
				//iu_bri_2013_nu.fnu_liberar_brigadistas(dw_brigadistas_disponibles,ll_buscar)
				this.setFilter("ISNULL(GI_BRIGADA_BRIGADISTA_F_FIN)")
				this.filter()

				// Marco como dado de baja de la brigada
				
				iu_bri_2012_nu.fnu_baja_de_brigada(objeto, ll_fila_seleccionada)
				objeto.setFilter("ISNULL(GI_BRIGADA_BRIGADISTA_F_FIN)")
				objeto.filter()
			else
				gnv_msg.f_mensaje("EM42","","",OK!)
				//messageBox("Error","No existen Brigadistas")
			end if
		end if
		//gnu_u_transaction.uf_commit()
	end if
end if

this.drag(End!)
this.setRedraw(TRUE)
end event

event sqlpreview;//
end event

type cb_agregar_brigadistas from commandbutton within tabpage_brigadas
integer x = 1742
integer y = 564
integer width = 613
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Agregar Brigadistas"
end type

event clicked;//ii_fila_seleccionada = 1
int li_centro, li_cmd, li_mesa
gu_comunic.is_comunic.accion_llamada = "Alta"

SetPointer(HourGlass!)


	
li_centro=d_ambito.object.nro_centro[1]
li_cmd=d_ambito.object.nro_cmd[1]
li_mesa=d_ambito.object.nro_mesa[1]

if li_centro=0 or li_cmd=0 or li_mesa=0 then
	//gnv_msg.f_mensaje("EM54","","",OK!)
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar un $$HEX1$$e100$$ENDHEX$$mbito v$$HEX1$$e100$$ENDHEX$$lido")	
	return 
end if
gu_comunic.is_comunic.intval1= li_centro
gu_comunic.is_comunic.intval2= li_cmd
gu_comunic.is_comunic.intval3= li_mesa
	



Open (w_6204_ingreso_brigadistas)

dw_brigadistas_disponibles.Retrieve(gu_comunic.is_comunic.intval1,gu_comunic.is_comunic.intval2,gu_comunic.is_comunic.intval3)
end event

type cb_consultar from commandbutton within tabpage_brigadas
integer x = 2729
integer y = 564
integer width = 645
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Consultar Brigadistas"
end type

event clicked;long ll_fila
int li_centro, li_cmd, li_mesa
ll_fila=dw_brigadistas_disponibles.getrow()
if ll_fila > 0 then
	gu_comunic.is_comunic.accion_llamada="Consulta"
	gu_comunic.is_comunic.longval1=dw_brigadistas_disponibles.object.gi_brigadista_nro_brigadistas[dw_brigadistas_disponibles.getrow()]
		
	li_centro=d_ambito.object.nro_centro[1]
	li_cmd=d_ambito.object.nro_cmd[1]
	li_mesa=d_ambito.object.nro_mesa[1]

	gu_comunic.is_comunic.intval1= li_centro
	gu_comunic.is_comunic.intval2= li_cmd
	gu_comunic.is_comunic.intval3= li_mesa
		
	// OBTIENE EL AMBITO DEL BRIGADISTA
	
	open(w_6204_ingreso_brigadistas)
end if
end event

type d_datos_brigada from u_bri_2011_pr_ingreso_brigadas within tabpage_brigadas
integer x = 18
integer y = 96
integer width = 1417
integer height = 492
integer taborder = 10
boolean border = false
end type

on clicked;//wwwwww
end on

event itemchanged;string	ls_texto, ls_columna, a
ls_texto = This.GetText()
ls_columna=This.getcolumnname()
CHOOSE CASE ls_columna
	CASE "nro_brigada"
		IF isnull(ls_texto) OR integer(ls_texto)=0 THEN
			Return 1
		END IF
//	CASE "movil"
//		IF ls_texto = "" OR ls_texto = " " THEN
//			Return 1
//		END IF
END CHOOSE

end event

event itemerror;Return 1
////////////////////////////////////////////////////////////////////////
////
////	Evento:		Itemerror
////
////	Objetivo:	Si el dato ingresado no es correcto, despliega un mensaje
////					indic$$HEX1$$e100$$ENDHEX$$ndolo, y deja en el campo modioficado el valor 
////					anterior
////
////	Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
////
////				Actualizaci$$HEX1$$f300$$ENDHEX$$n			Fecha				Responsable
////				-------------			--------			-----------
////				Creaci$$HEX1$$f300$$ENDHEX$$n					27/9/95				EGF
////
////////////////////////////////////////////////////////////////////////
//string ls_texto, ls_columna, ls_titulo, a, ls_modstring
//
//boolean lb_valido
//lb_valido = FALSE
//ls_columna=this.getcolumnname()
//
//
//CHOOSE CASE ls_columna
////	CASE "nro_brigada"
////		lb_valido = iu_bri_2011_nu.fnu_validar_brigada(ls_modstring,integer(this.gettext()))
////	CASE "movil"
////		lb_valido = iu_bri_2011_nu.fnu_validar_movil(ls_modstring,this.gettext())
//	CASE "nombre" 
//		lb_valido = iu_bri_2011_nu.fnu_validar_nombre(ls_modstring,this.gettext())
//END CHOOSE
//
//IF lb_valido = FALSE THEN
//	
//	ls_titulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
//	a=This.Modify(ls_titulo)
//	ls_modstring=ls_columna+".ValidationMsg='"+ls_modstring+"'"
//	a=This.Modify(ls_modstring)
//	ii_si_valido=0
//ELSE
//	return
//END IF
//
end event

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within tabpage_brigadas
integer x = 1737
integer y = 104
integer taborder = 70
boolean bringtotop = true
boolean border = false
end type

event post_itemchange;call super::post_itemchange;// Al cambiar el ambito, traigo las brigadas correspondientes
long ll_cmd, ll_mesa, ll_centro, ll_row

ll_row = This.GetRow()
ll_centro = This.object.nro_centro[ll_row]
ll_cmd = This.object.nro_cmd[ll_row]
ll_mesa = This.object.nro_mesa[ll_row]

tab_1.tabpage_brigadas.dw_brigadistas_disponibles.Retrieve(ll_centro, ll_cmd, ll_mesa)

end event

event itemchanged;call super::itemchanged;this.postevent("post_itemchange")
end event

type dw_1 from datawindow within tabpage_brigadas
boolean visible = false
integer x = 50
integer y = 572
integer width = 1682
integer height = 576
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_brigadas_imp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type tabpage_calendario from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3497
integer height = 1488
long backcolor = 79741120
string text = "    Calendario"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Cursor!"
long picturemaskcolor = 553648127
dw_festivos dw_festivos
uo_cal uo_cal
end type

on tabpage_calendario.create
this.dw_festivos=create dw_festivos
this.uo_cal=create uo_cal
this.Control[]={this.dw_festivos,&
this.uo_cal}
end on

on tabpage_calendario.destroy
destroy(this.dw_festivos)
destroy(this.uo_cal)
end on

type dw_festivos from datawindow within tabpage_calendario
boolean visible = false
integer x = 1435
integer y = 1036
integer width = 494
integer height = 360
integer taborder = 21
boolean bringtotop = true
string dataobject = "d_cal_dias_festivos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_cal from u_gener_calendario within tabpage_calendario
integer x = 114
integer taborder = 80
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_cal.destroy
call u_gener_calendario::destroy
end on

type cb_aceptar from commandbutton within w_2271_mante_brigadas_new
integer x = 489
integer y = 1720
integer width = 471
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;int li_valor, li_todos

li_valor = tab_1.tabpage_brigadas.d_ambito.getitemnumber(1,"nro_mesa")
li_todos = fgci_todos

IF li_valor = li_todos THEN
	gnv_msg.f_mensaje("EM02","","",OK!)
	tab_1.tabpage_brigadas.d_ambito.SetFocus()
	RETURN
END IF

Parent.triggerevent("ue_grabar")

IF ib_valido_movil = FALSE THEN
	return
END IF

Close(w_2271_mante_brigadas_new )
end event

type cb_cancelar from commandbutton within w_2271_mante_brigadas_new
integer x = 1577
integer y = 1720
integer width = 471
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;iu_comunic.is_comunic.programa_retorno = "w_2271"
iu_comunic.is_comunic.accion_retorno = "No Refrescar"
//rollback;
gnu_u_transaction.uf_rollback(Parent)

tab_1.tabpage_calendario.uo_cal.ib_hay_cambios = False

Close(Parent)
end event

type cb_1 from commandbutton within w_2271_mante_brigadas_new
integer x = 2665
integer y = 1724
integer width = 471
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_brigada, dwc_brigadista, dwc_contratas, dwc_ambito
string ls_titulo
long ll_longitud
int li_nro


li_nro = tab_1.tabpage_brigadas.d_datos_brigada.GetITemNumber (1,'nro_brigada')
//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Datos de la Brigada ' + string(li_nro)
ll_longitud = len (ls_titulo)*100
tab_1.tabpage_brigadas.dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
tab_1.tabpage_brigadas.dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
tab_1.tabpage_brigadas.dw_1.modify("nom_cmd_t.Text='" + tab_1.tabpage_brigadas.d_ambito.Describe("nro_cmd_t.text") + "'")

tab_1.tabpage_brigadas.dw_1.getchild ("d_brigada",dwc_brigada)
tab_1.tabpage_brigadas.d_datos_brigada.sharedata(dwc_brigada)
lst_impresion.pa_todos[1]=tab_1.tabpage_brigadas.d_datos_brigada
lst_impresion.pa_nombres[1]='d_brigada'

tab_1.tabpage_brigadas.dw_1.getchild ("d_brigadista",dwc_brigadista)
tab_1.tabpage_brigadas.dw_brigadistas_asignados.sharedata(dwc_brigadista)
lst_impresion.pa_todos[2]=tab_1.tabpage_brigadas.dw_brigadistas_asignados
lst_impresion.pa_nombres[2]='d_brigadista'

tab_1.tabpage_brigadas.dw_1.getchild ("d_contratas",dwc_contratas)
tab_1.tabpage_calendario.uo_cal.dw_brig_con_calendario.sharedata(dwc_contratas)
lst_impresion.pa_todos[3]=tab_1.tabpage_calendario.uo_cal.dw_brig_con_calendario
lst_impresion.pa_nombres[3]='d_contratas'

tab_1.tabpage_brigadas.dw_1.getchild ("d_ambito",dwc_ambito)
tab_1.tabpage_brigadas.d_ambito.sharedata(dwc_ambito)

lst_impresion.pa_todos[4]=tab_1.tabpage_brigadas.d_ambito
lst_impresion.pa_nombres[4]='d_ambito'

lst_impresion.total = 4
//IF d_lista_brigada.RowCount() = 0 THEN
//	gnv_msg.f_mensaje( "AB02","","",OK!)
//	return
//END IF

fw_editar_campos (tab_1.tabpage_brigadas.d_datos_brigada)
tab_1.tabpage_brigadas.dw_1.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada
lst_impresion.pdw_compuesto = tab_1.tabpage_brigadas.dw_1
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)

	
	

end event


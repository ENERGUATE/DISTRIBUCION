HA$PBExportHeader$w_2270_lista_brigadas_centro.srw
forward
global type w_2270_lista_brigadas_centro from w_sgigenerica
end type
type d_lista_brigada from u_bri_2010_pr_lista_brigada_centro within w_2270_lista_brigadas_centro
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2270_lista_brigadas_centro
end type
type cb_buscar from u_cb within w_2270_lista_brigadas_centro
end type
type cb_tareas from u_cb within w_2270_lista_brigadas_centro
end type
type cb_eliminar from commandbutton within w_2270_lista_brigadas_centro
end type
type cb_agregar from commandbutton within w_2270_lista_brigadas_centro
end type
type cb_historico from commandbutton within w_2270_lista_brigadas_centro
end type
type cb_incidencia from u_cb within w_2270_lista_brigadas_centro
end type
type d_filtro_brigada from u_bri_2005_pr_lista_brigada_puesto_cal within w_2270_lista_brigadas_centro
end type
type cb_imprimir from commandbutton within w_2270_lista_brigadas_centro
end type
type dw_1 from datawindow within w_2270_lista_brigadas_centro
end type
end forward

global type w_2270_lista_brigadas_centro from w_sgigenerica
integer width = 3589
integer height = 2616
string title = "OPEN SGI - Consulta de Brigadas"
boolean resizable = false
long backcolor = 79741120
string icon = "brigadas.ico"
event ue_retrieve pbm_custom21
event ue_abrir_mant_brigadas pbm_custom73
event ue_armar_sql pbm_custom74
event ue_modificar_mant_brigadas pbm_custom69
event ue_consulta_mant_brigadas pbm_custom70
event ue_buscar pbm_custom71
event ue_resetear_datos pbm_custom72
event ue_tareas pbm_custom65
event ue_historico pbm_custom22
event ue_incidencia ( )
d_lista_brigada d_lista_brigada
d_ambito d_ambito
cb_buscar cb_buscar
cb_tareas cb_tareas
cb_eliminar cb_eliminar
cb_agregar cb_agregar
cb_historico cb_historico
cb_incidencia cb_incidencia
d_filtro_brigada d_filtro_brigada
cb_imprimir cb_imprimir
dw_1 dw_1
end type
global w_2270_lista_brigadas_centro w_2270_lista_brigadas_centro

type variables
u_generico_comunicaciones lu_comunic // Variable local de trabajo de comunicacion
u_generico_comunicaciones iu_resetea // variable local para resetear la variable de comunicaciones
u_bri_2005_nu_lista_brigadas_puesto iu_bri_2005_nu
u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu
u_bri_2010_nu_lista_brigada_centro iu_bri_2010_nu
u_bri_2011_nu_ingreso_brigadas iu_bri_2011_nu
String is_select_original
String is_where
String is_filtro_ambito , is_filtro_turno , is_filtro_disponible
int ii_fila_seleccionada

// Ambito del usuario
long il_centro_usu, il_cmd_usu, il_mesa_usu

mbtder_lista_brigadas menu_lista_brigadas
end variables

forward prototypes
public subroutine fnu_destruir_objetos ()
end prototypes

event ue_retrieve;//iu_bri_2010_nu.fnu_obtener_datos(d_lista_brigada,& 
//							d_ambito.getitemnumber(1,"nro_centro"), &
//							d_ambito.getitemnumber(1,"nro_cmd"), &
//							d_ambito.getitemnumber(1,"nro_mesa"), &
//							d_filtro_brigada.getitemnumber(1,"pi_en_turno"), &
//							d_filtro_brigada.getitemnumber(1,"pi_disponible"))
//
//

iu_bri_2010_nu.fnu_obtener_datos(d_lista_brigada)

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Brigadas'
ll_longitud = len (ls_titulo)*100

dw_1.modify("f_desde.visible='0'")
dw_1.modify("desde.visible='0'")
dw_1.modify("nulo_desde.visible = '0'")
dw_1.modify("nulo_hasta.visible = '0'")
dw_1.modify("f_hasta.visible='0'")
dw_1.modify("hasta.visible='0'")

// si no son nulas las inserto
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_1.Modify("data_1.Width= '8000'")
//d_lista_brigada.ShareData(dw_datos)




end event

event ue_abrir_mant_brigadas;ii_fila_seleccionada = 1

gu_comunic.is_comunic.accion_llamada = "Alta"

//gu_comunic.fnu_abrir(w_6202_ingreso_brigadas,"w_6202_ingreso_brigadas",1,1,w_2270_lista_brigadas_centro,"w_2270_lista_brigadas_centro")
SetPointer(HourGlass!)

//Open (w_6202_ingreso_brigadas)
Open(w_2271_mante_brigadas_new)
end event

event ue_armar_sql;string is_modificacion
string is_clausula_where
string retorno
string ls_select,is_select,is_from, ls_where
time	lt_hora = Now()
int li_tipo_brig
Datetime ldt_fecha_turno

d_ambito.accepttext()
is_filtro_ambito=d_ambito.fnu_filtro_amb(d_ambito.getitemnumber(1,"nro_centro"), &
					d_ambito.getitemnumber(1,"nro_cmd"), &
					d_ambito.getitemnumber(1,"nro_mesa"))
if is_filtro_ambito=" " then
	is_clausula_where = " "
else
	is_clausula_where=" Where "
	is_clausula_where=is_clausula_where + is_filtro_ambito
end if

//d_filtro_brigada.accepttext()

li_tipo_brig=d_filtro_brigada.getitemnumber(1,"pi_tipo_brig")

if (d_filtro_brigada.getitemnumber(1,"pi_disponible") = 1) THEN
	is_filtro_disponible="(gi_brigada.ind_disponible=1)"
elseif (d_filtro_brigada.getitemnumber(1,"pi_disponible") = 0) THEN
	is_filtro_disponible="(gi_brigada.ind_disponible=0)"
else
	is_filtro_disponible=" "
end if

if (d_filtro_brigada.getitemnumber(1,"pi_en_turno") = 1) THEN
//	is_filtro_turno="(gi_brigada.turno=1)"

	ldt_fecha_turno = d_filtro_brigada.GetItemDateTime(1, 'pdt_fecha_turno')

	is_filtro_turno = "gi_brigada.nro_brigada IN (SELECT DISTINCT gi_brigadas_cal.nro_brigada " + &
							"FROM GI_BRIGADAS_CAL WHERE gi_brigadas_cal.fecha_inicio <= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
							"AND gi_brigadas_cal.fecha_fin >= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
							"AND TO_CHAR(gi_brigadas_cal.hora_desde,'HH24:MI:SS') <= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') " + &
							"AND TO_CHAR(gi_brigadas_cal.hora_hasta,'HH24:MI:SS') >= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI')) "

else							
	is_filtro_turno=" "
end if

//A$$HEX1$$f100$$ENDHEX$$adir b$$HEX1$$fa00$$ENDHEX$$squeda si selecciono TODOS en ind_disponible o turno

IF is_filtro_disponible <> " " and is_filtro_turno <> " " THEN
	IF  is_clausula_where = " " THEN
		is_clausula_where= " Where " + is_filtro_disponible
	ELSE
		is_clausula_where=is_clausula_where + " AND " + is_filtro_disponible
	END IF
		is_clausula_where=is_clausula_where + " AND " + is_filtro_turno
ELSEIF is_filtro_disponible <> " " and is_filtro_turno = " " THEN
	IF  is_clausula_where = " " THEN
		is_clausula_where= " Where " + is_filtro_disponible
	ELSE
		is_clausula_where=is_clausula_where + " AND " + is_filtro_disponible
	END IF
ELSEIF is_filtro_disponible = " " and is_filtro_turno <> " " THEN
	IF  is_clausula_where = " " THEN
		is_clausula_where= " Where " +  is_filtro_turno
	ELSE
		is_clausula_where=is_clausula_where + " AND " +  is_filtro_turno
	END IF
END IF		



//	is_select =  "SELECT GI_BRIGADA.NRO_BRIGADA," + &
//							"GI_BRIGADA.NOMBRE, " +&
//							"GI_BRIGADA.IND_DISPONIBLE, " + &
//							"GI_BRIGADA.TURNO," + &
//							"GI_BRIGADA.MOVIL," + &
//							"GI_BRIGADA.NRO_CENTRO," + &
//							"GI_BRIGADA.NRO_MESA,"  + & 
//							"GI_BRIGADA.NRO_CMD," + &
//							"GI_BRIGADA.FREC_RADIO," + &
//							"SGD_VALOR_A.DESCRIPCION," + &
//							"SGD_VALOR_A.CODIGO,"+ &
//  							"SGD_VALOR_B.DESCRIPCION"
	is_select=   "SELECT GI_BRIGADA.NRO_BRIGADA, " + &   
         		 		  "GI_BRIGADA.NOMBRE, " + &   
         				  "GI_BRIGADA.IND_DISPONIBLE, " + &   
         				  "GI_BRIGADA.MOVIL, " + &   
         				  "GI_BRIGADA.NRO_CENTRO, " + &   
         				  "GI_BRIGADA.NRO_MESA, " + &   
         				  "GI_BRIGADA.NRO_CMD, " + &   
         				  "GI_BRIGADA.FREC_RADIO, " + &   
         				  "GI_BRIGADA.TIP_BRIGADA, " + & 
							  "GI_BRIGADA.IND_PREVISTO, " + & 
         				  "SGD_VALOR_B.DESCRIPCION"
								 
	is_from   = "FROM GI_BRIGADA, SGD_VALOR SGD_VALOR_B"
	
	//ls_where = "SGD_VALOR_A.CODIF='HORA' "  + " AND " +  "GI_BRIGADA.TURNO = SGD_VALOR_A.CODIGO AND " +&
	//			  "SGD_VALOR_B.CODIF='T_BR'" + " AND " +  "GI_BRIGADA.TIP_BRIGADA = SGD_VALOR_B.CODIGO"
	ls_where = "SGD_VALOR_B.CODIF='T_BR'" + " AND " +  "GI_BRIGADA.TIP_BRIGADA = SGD_VALOR_B.CODIGO"
if li_tipo_brig <> 0 then
	ls_where=ls_where + " AND GI_BRIGADA.TIP_BRIGADA = " + STRING(LI_TIPO_BRIG)
END IF	
IF  is_clausula_where = " " THEN
		is_clausula_where= " Where " + ls_where
	ELSE
		is_clausula_where=is_clausula_where + " AND " + ls_where
	END IF 
ls_select = is_select + " " + is_from + " " + is_clausula_where 
is_modificacion="Datawindow.table.select=~" "+ls_select + " ~" "

retorno=d_lista_brigada.modify(is_modificacion)

end event

event ue_modificar_mant_brigadas;int  li_nro_centro, li_nro_cmd, li_nro_mesa, li_lock_status
long ll_n_nro_brigada
//gi_perfil_ok = {fgci_perfil_oper_alta_media,&
//					fgci_perfil_oper_baja,&
//					fgci_perfil_oper_mante_red,&
//					fgci_perfil_operador_cmd}

//ii_fila_seleccionada = d_lista_brigada.getSelectedRow(0)

//if ii_fila_seleccionada > 0 and fgnu_tiene_perfil(0) then
	IF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRI_ACCESO', "ACC_MANTEN") = 1 THEN
		gu_comunic.is_comunic.accion_llamada = "Modificacion"
	ELSE
		gu_comunic.is_comunic.accion_llamada = "Consulta"
	END IF
	ll_n_nro_brigada = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_brigada")
	li_lock_status = gnu_u_transaction.uf_lock_brigada(ll_n_nro_brigada)
//	li_lock_status = gnu_u_transaction.uf_lock(This, "GI_BRIGADA", "NRO_BRIGADA = " + string(ll_n_nro_brigada))
	IF li_lock_status = 0 THEN 
		gu_comunic.is_comunic.longval1 = ll_n_nro_brigada
	
		// Asigna al objeto de comunicaciones los valores del $$HEX1$$e100$$ENDHEX$$mbito correspondientes a la fila seleccionada
		gu_comunic.is_comunic.intval1 = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_centro")
		gu_comunic.is_comunic.intval2 = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_cmd")
		gu_comunic.is_comunic.intval3 = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_mesa")
	
//		select NRO_BRIGADA INTO :ll_n_nro_brigada FROM GI_BRIGADA WHERE NRO_BRIGADA=:ll_n_nro_brigada for UPDATE NOWAIT;
//		IF SQLCA.SQLCODE<>0 THEN
//				gnv_msg.f_mensaje( "EG19","","",OK!)
//				RETURN
//		END IF
	
	li_nro_centro = d_ambito.GetItemNumber(1,"nro_centro")
	li_nro_cmd = d_ambito.GetItemNumber(1,"nro_cmd")
	li_nro_mesa = d_ambito.GetItemNumber(1,"nro_mesa")
	
//	IF gu_comunic.is_comunic.accion_llamada = "Modificacion" THEN //LFE - perfiles
//		gu_comunic.is_comunic.accion_llamada = gu_perfiles.of_acceso_segun_ambito(lu_comunic.is_comunic.intval1, &
//												  lu_comunic.is_comunic.intval2, &
//												  lu_comunic.is_comunic.intval3, &
//												  This.GetItemNumber(row,"nro_centro"), &
//												  This.GetItemNumber(row,"nro_cmd"), &
//												  This.GetItemNumber(row,"nro_mesa"))
////		if il_centro_usu = gu_comunic.is_comunic.intval1 and  il_cmd_usu = gu_comunic.is_comunic.intval2 and	il_mesa_usu = gu_comunic.is_comunic.intval3 then 
////			gu_comunic.is_comunic.accion_llamada = "Modificacion"
////		else		
////			gu_comunic.is_comunic.accion_llamada = "Consulta"
////		END IF
//	END IF
	
	SetPointer(HourGlass!)
	
	//Open (w_6202_ingreso_brigadas)
	Open(w_2271_mante_brigadas_new)
	//gnu_u_transaction.uf_commit()
	gnu_u_transaction.uf_unlock_brigada(ll_n_nro_brigada)
		// Restauro gu_comunic y lu_comunic con el centro, cmd y mesa del usuario.
	
		lu_comunic.is_comunic.intval1	= il_centro_usu 
		lu_comunic.is_comunic.intval2 = il_cmd_usu  
		lu_comunic.is_comunic.intval3 = il_mesa_usu 
	
		gu_comunic.is_comunic.intval1	= il_centro_usu 
		gu_comunic.is_comunic.intval2 = il_cmd_usu  
		gu_comunic.is_comunic.intval3 = il_mesa_usu 
	
	//end if

END IF
end event

event ue_buscar;This.triggerevent("ue_armar_sql")
This.triggerevent("ue_retrieve")

d_ambito.AcceptText()

IF d_lista_brigada.RowCount() > 0 THEN
	d_lista_brigada.ScrollToRow(1)
	d_lista_brigada.SelectRow(0,False)
	d_lista_brigada.SelectRow(1,TRUE)
	cb_historico.enabled = true
	cb_tareas.enabled = true
	cb_incidencia.enabled = true
	if lu_comunic.is_comunic.accion_llamada <> "Consulta"  then
		cb_eliminar.enabled= true
	end if
ELSE
	cb_eliminar.enabled = false
	cb_historico.enabled = false
	cb_tareas.enabled = false
	cb_incidencia.enabled = false
	gnv_msg.f_mensaje( "AB02","","",OK!)
END IF

end event

event ue_resetear_datos;d_lista_brigada.DBCancel()
d_lista_brigada.reset()
cb_historico.enabled = false
cb_eliminar.enabled = false
cb_tareas.enabled = false
cb_incidencia.enabled = false

d_filtro_brigada.AcceptText()
IF d_filtro_brigada.getItemNumber(1, "pi_en_turno") = 0 THEN
	d_filtro_brigada.fpr_deshabilitar_fechas()
ELSE
	d_filtro_brigada.fpr_habilitar_fechas()
END IF

end event

event ue_tareas;long  ll_n_nro_brigada, ll_num
int li_lock_status
//ii_fila_seleccionada = d_lista_brigada.getSelectedRow(0)


if ii_fila_seleccionada > 0 then
	ll_n_nro_brigada = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_brigada")
	
	IF gu_perfiles.of_acceso_perfil(gi_perfil, 'BRI_ACCESO', "ACC_MANTEN") = 1 THEN
		gu_comunic.is_comunic.accion_llamada = "Actualizacion"
	ELSE
		gu_comunic.is_comunic.accion_llamada = "Consulta"
	END IF

	IF gu_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
		
		SELECT COUNT(*)
		INTO :ll_num
		FROM GI_OT, GI_BRIGADA_OT
		WHERE GI_OT.NRO_OT = GI_BRIGADA_OT.NRO_OT
			AND GI_BRIGADA_OT.NRO_BRIGADA = :ll_n_nro_brigada 
			AND GI_OT.EST_OT <= :fgci_ot_trabajando;
			
			
		IF ll_num = 0 THEN	
			IF gnv_msg.f_mensaje( "AM53","","",YesNo!) = 2 THEN
				return
			END IF
		END IF
		
	END IF
	
	li_lock_status = gnu_u_transaction.uf_lock_brigada(ll_n_nro_brigada)
//	li_lock_status = gnu_u_transaction.uf_lock(This, "GI_BRIGADA", "NRO_BRIGADA = " + string(ll_n_nro_brigada))
	IF li_lock_status = 0 THEN 
	
		gu_comunic.is_comunic.longval1 = ll_n_nro_brigada
		gu_comunic.is_comunic.strval1 = d_lista_brigada.GetItemString(ii_fila_seleccionada,"nombre")
	
		// Asigna al objeto de comunicaciones los valores del $$HEX1$$e100$$ENDHEX$$mbito correspondientes a la fila seleccionada
		gu_comunic.is_comunic.intval1 = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_centro")
		gu_comunic.is_comunic.intval2 = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_cmd")
		gu_comunic.is_comunic.intval3 = d_lista_brigada.GetItemNumber(ii_fila_seleccionada, "nro_mesa")
	
	//	select NRO_BRIGADA INTO :ll_n_nro_brigada FROM GI_BRIGADA WHERE NRO_BRIGADA=:ll_n_nro_brigada for UPDATE NOWAIT;
	//	IF SQLCA.SQLCODE<>0 THEN
	//			gnv_msg.f_mensaje( "EG19","","",OK!)
	//			RETURN
	//	END IF
	//	gu_comunic.fnu_abrir(w_6205_consulta_tareas,"w_6205_consulta_tareas",&
	//			1,1,w_2270_lista_brigadas_centro,"w_2270_lista_brigadas_centro")
	SetPointer(HourGlass!)
	
	gu_comunic.is_comunic.programa_llamante='w_2270'
	gu_comunic.is_comunic.strval2='BR'
	Open(w_6205_consulta_tareas)
	This.TriggerEvent("ue_retrieve")
	
	
		// Restauro gu_comunic y lu_comunic con el centro, cmd y mesa del usuario.
	
		lu_comunic.is_comunic.intval1	= il_centro_usu 
		lu_comunic.is_comunic.intval2 = il_cmd_usu  
		lu_comunic.is_comunic.intval3 = il_mesa_usu 
	
		gu_comunic.is_comunic.intval1	= il_centro_usu 
		gu_comunic.is_comunic.intval2 = il_cmd_usu  
		gu_comunic.is_comunic.intval3 = il_mesa_usu 

	end if
END IF
end event

event ue_historico;
if ii_fila_seleccionada > 0 then
	
	gu_comunic.is_comunic.longval1=d_lista_brigada.object.nro_brigada[ii_fila_seleccionada]
	gu_comunic.is_comunic.strval1=d_lista_brigada.object.nombre[ii_fila_seleccionada]
	open(w_6207_historico_brigada)
end if
end event

event ue_incidencia;SetPointer(HourGlass!)	

long ll_nro_brigada

gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
gu_comunic.is_comunic.accion_llamada="Consulta"

ll_nro_brigada = d_lista_brigada.getitemnumber(d_lista_brigada.getrow(),"nro_brigada")

if ll_nro_brigada > 0 then
	
  SELECT "GI_OT"."NRO_INCIDENCIA"  
    INTO :gu_comunic.is_comunic.longval3
    FROM "GI_BRIGADA_OT",   
         "GI_OT"  
   WHERE ( "GI_BRIGADA_OT"."NRO_OT" = "GI_OT"."NRO_OT" ) and  
         ( ( "GI_BRIGADA_OT"."NRO_BRIGADA" = :ll_nro_brigada ) and
			    "GI_BRIGADA_OT"."EST_BRIGADA" <= :fgci_ot_trabajando ); 

	if gu_comunic.is_comunic.longval3 > 0 and not isnull(gu_comunic.is_comunic.longval3) and sqlca.sqlcode = 0 then
		gu_comunic.is_comunic.Accion_llamada = "Consulta"
		//OpenSheet(w_2301_form_incidencia,w_operaciones,0,Layered!)
		gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
	else
		
		gnv_msg.f_mensaje( "AI136","","",OK!)
	
	end if

end if
end event

public subroutine fnu_destruir_objetos ();DESTROY iu_bri_2005_nu 
DESTROY iu_cen_2001_nu 
DESTROY iu_bri_2010_nu 
DESTROY iu_bri_2011_nu
DESTROY lu_comunic
end subroutine

on close;call w_sgigenerica::close;This.fnu_destruir_objetos()

end on

event open;call super::open;// permite actualizar y consultar las brigadas para un puesto

// gu_comunic.is_Comunic.intval1 = centro
//								 intval2 = cmd
//								 intval3 = puesto
//gu_comunic.is_comunic.accion_llamada = "Actualizaci$$HEX1$$f300$$ENDHEX$$n"
//														"Consulta"

SetPointer(HourGlass!)
int li_hora
fg_colocar_ventana_main(w_2270_lista_brigadas_centro)

// creo objetos de trabajo
lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
iu_bri_2005_nu = CREATE u_bri_2005_nu_lista_brigadas_puesto
iu_cen_2001_nu = CREATE u_cen_2001_nu_form_centro_cmd_mesa
iu_bri_2010_nu = create u_bri_2010_nu_lista_brigada_centro
iu_bri_2011_nu = create u_bri_2011_nu_ingreso_brigadas

// recibo parametros de entrada
lu_comunic.is_comunic = gu_comunic.is_comunic

IF lu_comunic.is_comunic.accion_llamada = "Consulta"  THEN
	cb_agregar.enabled = false
	cb_eliminar.enabled = false
	cb_historico.enabled = true
	cb_tareas.enabled = False
ELSEIF lu_comunic.is_comunic.accion_llamada ="Consult/Manten" THEN
	cb_historico.enabled = true
	lu_comunic.is_comunic.accion_llamada ="Modificar"
ELSE
	cb_historico.enabled = False
END IF

if gu_perfiles.of_acceso_perfil(gi_perfil,"INC_GENERAL","") = 1 then // SI NO TIENE ACCESO A INCIDENCIAS
	cb_incidencia.enabled= false
end if

// Guardo $$HEX1$$e100$$ENDHEX$$mbito del usuario

il_centro_usu = lu_comunic.is_comunic.intval1
il_cmd_usu = lu_comunic.is_comunic.intval2
il_mesa_usu = lu_comunic.is_comunic.intval3

// Seteo t$$HEX1$$ed00$$ENDHEX$$tulo de ventana 

this.title = lu_comunic.f_titulo_ventana ("w_2270", lu_comunic.is_comunic.accion_llamada)
//d_lista_brigada.SetRowFocusIndicator(Hand!)

// Inicializo objetos de trabajo
d_ambito.fpr_crea_dddw()
d_ambito.f_insertar_fila()
d_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1, &
									 lu_comunic.is_comunic.intval2, &
									 lu_comunic.is_comunic.intval3, 0)
//d_ambito.fnu_filtrar_cmd(d_ambito,lu_comunic.is_comunic.intval1) // LFE - comentado para ambito
//d_ambito.fnu_filtro_mesa_nuevo(d_ambito,lu_comunic.is_comunic.intval2) // LFE - comentado para ambito

//iu_bri_2010_nu.fnu_crea_dddw(d_filtro_brigada)	
//d_filtro_brigada.InsertRow(0)
d_filtro_brigada.fpr_crear_dw()
d_filtro_brigada.fpr_deshabilitar_fechas()
//iu_cen_2001_nu.fnu_cargar_estructura(d_ambito,lu_comunic.is_comunic.intval1, &
//											lu_comunic.is_comunic.intval2, &
//											lu_comunic.is_comunic.intval3)
//				
								
// Muestro el turno correspondiente a la hora actual	

//li_hora = Hour(Now( ))
//if li_hora >= 0 and li_hora <= 8 then 
//	iu_bri_2005_nu.fnu_cargar_estructura(d_filtro_brigada,0,1,1)
//elseif li_hora >8 and li_hora <=16 then
//	iu_bri_2005_nu.fnu_cargar_estructura(d_filtro_brigada,2,1,1)
//else	
//	iu_bri_2005_nu.fnu_cargar_estructura(d_filtro_brigada,3,1,1)
//end if

ii_fila_seleccionada = 1
	
d_lista_brigada.SetFocus()

// obtengo informaci$$HEX1$$f300$$ENDHEX$$n de la lista
is_select_original=d_lista_brigada.Describe("Datawindow.table.select")
this.triggerevent("ue_armar_sql")
dw_1.modify("data_1.DataObject ='" + d_lista_brigada.DataObject + "'")
this.triggerevent("ue_retrieve")

	
end event

event activate;String ls_programa_retorno
String ls_accion_retorno
//This.height=1557
lu_comunic.is_comunic = gu_comunic.is_comunic

ls_programa_retorno=lu_comunic.is_comunic.programa_retorno
ls_accion_retorno=lu_comunic.is_comunic.accion_retorno
IF ls_programa_retorno="w_2271" and lu_comunic.is_comunic.accion_retorno = "Refrescar" THEN
//	d_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1, &
//									 lu_comunic.is_comunic.intval2, &
//									 lu_comunic.is_comunic.intval3, 0)
//	
	//d_ambito.fnu_habi_cmd() // LFE - comentado para ambito
	//d_ambito.fnu_habi_puesto() // LFE - comentado para ambito
	//d_ambito.SetItem(1,"nro_centro",lu_comunic.is_comunic.intval1) // LFE - comentado para ambito
	//d_ambito.fnu_filtro_cmd_out() // LFE - comentado para ambito
	//d_ambito.SetItem(1,"nro_cmd",lu_comunic.is_comunic.intval2) // LFE - comentado para ambito
	//d_ambito.fnu_filtro_mesa_out() // LFE - comentado para ambito
	//d_ambito.SetItem(1,"nro_mesa",lu_comunic.is_comunic.intval3) // LFE - comentado para ambito
		this.triggerevent("ue_retrieve")
		lu_comunic.is_comunic.accion_retorno = ""
END IF

IF d_lista_brigada.RowCount() > 0 THEN
// Comentado por LFE. Problema Moldavia
//	d_lista_brigada.ScrollToRow(ii_fila_seleccionada)
//	d_lista_brigada.SelectRow(0,False)
//	d_lista_brigada.SelectRow(ii_fila_seleccionada,True)
	//ii_fila_seleccionada=1
ELSE
	cb_historico.enabled=false
	cb_eliminar.enabled = false
	cb_tareas.enabled = false
	cb_incidencia.enabled = false
	//gnv_msg.f_mensaje( "AB02","","",OK!)
END IF

end event

event ue_arch_eliminar;call super::ue_arch_eliminar;int li_confirmo, li_lock_status
long ll_nro_brig
boolean lb_asignada

ll_nro_brig = d_lista_brigada.getitemnumber(ii_fila_seleccionada,"nro_brigada")
li_lock_status = gnu_u_transaction.uf_lock_brigada(ll_nro_brig)
//li_lock_status = gnu_u_transaction.uf_lock(This, "GI_BRIGADA", "NRO_BRIGADA = " + string(ll_nro_brig))
IF li_lock_status = 0 THEN 
	li_confirmo = gnv_msg.f_mensaje("CM05","","",YesNo!)
	
	IF li_confirmo <> 1 THEN
		gnu_u_transaction.uf_rollback()
		gnu_u_transaction.uf_unlock_brigada(ll_nro_brig)
		Return
	END IF

	// Se pasan los registros de la brigada/ot de gi_brigada_ot a gi_hist_brigada_ot.
	
	  INSERT INTO GI_HIST_BRIGADA_OT  
         ( USUARIO,   
           F_ACTUAL,   
           H_ACTUAL,   
           PROGRAMA,   
           NRO_OT,   
           NRO_BRIGADA,   
           F_DESDE,   
           H_DESDE,   
           F_HASTA,   
           H_HASTA,   
           ID_REPONSABLE,   
           EST_BRIGADA,   
           NOMBRE,   
           MOVIL,   
           FREC_RADIO )  
 		(SELECT GI_BRIGADA_OT.USUARIO,   
         GI_BRIGADA_OT.F_ACTUAL,   
         GI_BRIGADA_OT.H_ACTUAL,   
         GI_BRIGADA_OT.PROGRAMA,   
         GI_BRIGADA_OT.NRO_OT,   
         GI_BRIGADA_OT.NRO_BRIGADA,   
         GI_BRIGADA_OT.F_DESDE,   
         GI_BRIGADA_OT.H_DESDE,   
         GI_BRIGADA_OT.F_HASTA,   
         GI_BRIGADA_OT.H_HASTA,   
         GI_BRIGADA_OT.ID_REPONSABLE,   
         GI_BRIGADA_OT.EST_BRIGADA,
			GI_BRIGADA.NOMBRE,   
         GI_BRIGADA.MOVIL,   
         GI_BRIGADA.FREC_RADIO   
      FROM GI_BRIGADA_OT,GI_BRIGADA
		WHERE GI_BRIGADA_OT.NRO_BRIGADA=GI_BRIGADA.NRO_BRIGADA AND
				GI_BRIGADA_OT.NRO_OT IN 
									(	SELECT GI_OT.NRO_OT 
										FROM GI_BRIGADA_OT,GI_OT 
										WHERE NRO_BRIGADA = :ll_nro_brig
										AND EST_OT = :fgci_ot_resuelta
										AND GI_BRIGADA_OT.NRO_OT = GI_OT.NRO_OT) AND
					  GI_BRIGADA_OT.NRO_OT NOT IN 
								(SELECT NRO_OT 
								 FROM GI_HIST_BRIGADA_OT 
								 WHERE GI_HIST_BRIGADA_OT.NRO_OT = GI_BRIGADA_OT.NRO_OT AND
									   GI_HIST_BRIGADA_OT.NRO_BRIGADA = GI_BRIGADA_OT.NRO_BRIGADA));
	
	if sqlca.sqlcode = -1 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n"," Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al pasar la tabla gi_brigada_ot a hist$$HEX1$$f300$$ENDHEX$$ricos: " + sqlca.sqlerrtext,Exclamation!,ok!)
		gnu_u_transaction.uf_rollback()
		gnu_u_transaction.uf_unlock_brigada(ll_nro_brig)
		Return
	END IF

	lb_asignada = iu_bri_2011_nu.fnu_borrar_brigada(ll_nro_brig)
	
	IF lb_asignada = FALSE THEN
		gnu_u_transaction.uf_rollback()
		gnu_u_transaction.uf_unlock_brigada(ll_nro_brig)
		RETURN
	END IF
	
	d_lista_brigada.DeleteRow(ii_fila_seleccionada)
	d_lista_brigada.update()
	
	gnu_u_transaction.uf_commit()
	gnu_u_transaction.uf_unlock_brigada(ll_nro_brig)
	if d_lista_brigada.rowcount() = 0 then 
		cb_eliminar.enabled = false
		cb_historico.enabled = false
		cb_tareas.enabled = false
		cb_incidencia.enabled = false
	else
		ii_fila_seleccionada = 1
		d_lista_brigada.ScrolltoRow(ii_fila_seleccionada)
		d_lista_brigada.selectrow(0,False)
		d_lista_brigada.selectrow(ii_fila_seleccionada,true)
	end if
END IF
end event

on w_2270_lista_brigadas_centro.create
int iCurrent
call super::create
this.d_lista_brigada=create d_lista_brigada
this.d_ambito=create d_ambito
this.cb_buscar=create cb_buscar
this.cb_tareas=create cb_tareas
this.cb_eliminar=create cb_eliminar
this.cb_agregar=create cb_agregar
this.cb_historico=create cb_historico
this.cb_incidencia=create cb_incidencia
this.d_filtro_brigada=create d_filtro_brigada
this.cb_imprimir=create cb_imprimir
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_brigada
this.Control[iCurrent+2]=this.d_ambito
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.cb_tareas
this.Control[iCurrent+5]=this.cb_eliminar
this.Control[iCurrent+6]=this.cb_agregar
this.Control[iCurrent+7]=this.cb_historico
this.Control[iCurrent+8]=this.cb_incidencia
this.Control[iCurrent+9]=this.d_filtro_brigada
this.Control[iCurrent+10]=this.cb_imprimir
this.Control[iCurrent+11]=this.dw_1
end on

on w_2270_lista_brigadas_centro.destroy
call super::destroy
destroy(this.d_lista_brigada)
destroy(this.d_ambito)
destroy(this.cb_buscar)
destroy(this.cb_tareas)
destroy(this.cb_eliminar)
destroy(this.cb_agregar)
destroy(this.cb_historico)
destroy(this.cb_incidencia)
destroy(this.d_filtro_brigada)
destroy(this.cb_imprimir)
destroy(this.dw_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;
IF d_lista_brigada.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_brigada

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2270_lista_brigadas_centro
integer x = 613
end type

type d_lista_brigada from u_bri_2010_pr_lista_brigada_centro within w_2270_lista_brigadas_centro
event ue_abrir_mant_brigadas pbm_custom21
integer x = 14
integer y = 544
integer width = 3547
integer height = 1140
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;if row > 0 then
	parent.triggerevent("ue_modificar_mant_brigadas")
end if
end event

event clicked;call super::clicked;IF row > 0 THEN
	ii_fila_seleccionada = row
	this.ScrollToRow(ii_fila_seleccionada)
	this.selectrow(0,False)
	this.selectrow(ii_fila_seleccionada,true)
END IF

end event

event rbuttondown;call super::rbuttondown;//menu_lista_brigadas = CREATE mbtder_lista_brigadas
//
//
//if gu_perfiles.of_acceso_perfil(gi_perfil,'BRI_ACCESO',"ACC_MANTEN")=1 then // TIENE MANTENIMIENTO
//IF row > 0 or this.Rowcount() = 0 THEN
//	IF cb_eliminar.Enabled = False THEN
//		Menu_lista_brigadas.m_eliminarunabrigada.Enabled = False
//	END IF
//	IF cb_agregar.Enabled = False THEN
//		Menu_lista_brigadas.m_dardealtaunabrigada.Enabled = False
//	END IF
//	IF cb_historico.Enabled = False THEN
//		Menu_lista_brigadas.m_mantenimientodeunabrigada.Enabled = False
//	END IF
//	IF cb_tareas.Enabled = False THEN
//		Menu_lista_brigadas.m_tareasotsdeunabrigada.Enabled = False
//	END IF
//	
////	Menu_lista_brigadas.PopMenu(xpos+600,ypos)
//	Menu_lista_brigadas.PopMenu(PointerX(),PointerY()+400)
//END IF
//
//else
//	gnv_msg.f_mensaje("AA08","","",OK!)
//	   
//end if
//Destroy(Menu_lista_brigadas)
//
end event

event ue_key_down;/////////////////////////////////////////////////////
//	Permite borrar o agregar incidencias desde el teclado
//	dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row 

IF keyflags = 0 THEN  // Controlo que no haya presionado
							// control ni shift
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyDelete! THEN
		Parent.TriggerEvent("ue_arch_eliminar")
	ELSEIF key = KeyInsert! THEN
		Parent.TriggerEvent("ue_abrir_mant_brigadas")

	ELSEIF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
		this.selectrow(ll_row - 1,true)
		ii_fila_Seleccionada = ll_row -1
	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		this.selectrow(ll_row + 1,true)
		ii_fila_Seleccionada = ll_row + 1
	END IF

END IF
end event

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2270_lista_brigadas_centro
integer x = 14
integer y = 80
integer width = 992
integer height = 396
integer taborder = 20
boolean border = false
end type

on itemchanged;call u_cen_2001_pr_form_centro_cmd_mesa::itemchanged;parent.triggerEvent("ue_resetear_datos")

end on

type cb_buscar from u_cb within w_2270_lista_brigadas_centro
integer x = 2574
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 90
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Buscar"
end type

event clicked;call super::clicked;parent.triggerevent("ue_buscar")
end event

type cb_tareas from u_cb within w_2270_lista_brigadas_centro
event clicked pbm_bnclicked
integer x = 1591
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Tareas/OT"
end type

event clicked;call super::clicked;parent.triggerevent("ue_tareas")
end event

type cb_eliminar from commandbutton within w_2270_lista_brigadas_centro
integer x = 603
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Eliminar"
end type

event clicked;parent.triggerevent("ue_arch_eliminar")
end event

type cb_agregar from commandbutton within w_2270_lista_brigadas_centro
integer x = 110
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;parent.triggerevent("ue_abrir_mant_brigadas")
end event

type cb_historico from commandbutton within w_2270_lista_brigadas_centro
integer x = 1093
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Hist$$HEX1$$f300$$ENDHEX$$rico"
end type

event clicked;parent.triggerevent("ue_historico")
end event

type cb_incidencia from u_cb within w_2270_lista_brigadas_centro
integer x = 2075
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 80
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Incidencia"
end type

event clicked;parent.triggerevent("ue_incidencia")
end event

type d_filtro_brigada from u_bri_2005_pr_lista_brigada_puesto_cal within w_2270_lista_brigadas_centro
integer x = 2423
integer y = 92
integer width = 1093
integer height = 388
integer taborder = 30
boolean bringtotop = true
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;long ll_en_turno

// si el campo modificado es el de las brigadas en turno, entonces se conmuta el valor a mano
// para que el cambio tenga efecto antes de entrar en ue_resetear_datos, ya que de no ser a s$$HEX1$$ed00$$ENDHEX$$, el 
// cambio no tiene efecto hasta que no se sale de este script
IF this.GetColumnName()="pi_en_turno" THEN 
	ll_en_turno = getItemNumber(1, "pi_en_turno")
	IF ll_en_turno = 0 THEN
		SetItem(1, "pi_en_turno",1)
	ELSE
		SetItem(1, "pi_en_turno",0)
	END IF
END IF

parent.triggerEvent("ue_resetear_datos")

end event

event losefocus;call super::losefocus;This.accepttext()
end event

type cb_imprimir from commandbutton within w_2270_lista_brigadas_centro
integer x = 3072
integer y = 1780
integer width = 443
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "I&mprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_2270_lista_brigadas_centro
boolean visible = false
integer x = 55
integer y = 712
integer width = 494
integer height = 360
integer taborder = 110
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


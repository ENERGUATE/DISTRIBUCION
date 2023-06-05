HA$PBExportHeader$w_7106_solicitud_descargos.srw
forward
global type w_7106_solicitud_descargos from w_sgigenerica
end type
type tab_1 from tab within w_7106_solicitud_descargos
end type
type tabpage_solicitud from userobject within tab_1
end type
type dw_desc_descargo from datawindow within tabpage_solicitud
end type
type cb_menos from commandbutton within tabpage_solicitud
end type
type cb_mas from commandbutton within tabpage_solicitud
end type
type dw_puesta_explotacion from u_sgt_instalaciones within tabpage_solicitud
end type
type st_3 from statictext within tabpage_solicitud
end type
type cb_1 from commandbutton within tabpage_solicitud
end type
type dw_datos_solicitud from datawindow within tabpage_solicitud
end type
type gb_solicitud_descargo from groupbox within tabpage_solicitud
end type
type tabpage_solicitud from userobject within tab_1
dw_desc_descargo dw_desc_descargo
cb_menos cb_menos
cb_mas cb_mas
dw_puesta_explotacion dw_puesta_explotacion
st_3 st_3
cb_1 cb_1
dw_datos_solicitud dw_datos_solicitud
gb_solicitud_descargo gb_solicitud_descargo
end type
type tabpage_otros from userobject within tab_1
end type
type dw_datos_solicitud_otros from datawindow within tabpage_otros
end type
type tabpage_otros from userobject within tab_1
dw_datos_solicitud_otros dw_datos_solicitud_otros
end type
type tabpage_interrupciones from userobject within tab_1
end type
type st_sel_causa from statictext within tabpage_interrupciones
end type
type st_causa from statictext within tabpage_interrupciones
end type
type cb_otra from commandbutton within tabpage_interrupciones
end type
type dw_seleccion from datawindow within tabpage_interrupciones
end type
type cb_desmarcar from commandbutton within tabpage_interrupciones
end type
type cb_marcar from commandbutton within tabpage_interrupciones
end type
type st_2 from statictext within tabpage_interrupciones
end type
type st_1 from statictext within tabpage_interrupciones
end type
type tv_1 from uo_man_instalac within tabpage_interrupciones
end type
type gb_2 from groupbox within tabpage_interrupciones
end type
type gb_4 from groupbox within tabpage_interrupciones
end type
type dw_interrupcion from datawindow within tabpage_interrupciones
end type
type gb_1 from groupbox within tabpage_interrupciones
end type
type dw_seccionadores from u_seccionador within tabpage_interrupciones
end type
type cb_clientes from commandbutton within tabpage_interrupciones
end type
type cb_eliminar from commandbutton within tabpage_interrupciones
end type
type gb_causa from groupbox within tabpage_interrupciones
end type
type tabpage_interrupciones from userobject within tab_1
st_sel_causa st_sel_causa
st_causa st_causa
cb_otra cb_otra
dw_seleccion dw_seleccion
cb_desmarcar cb_desmarcar
cb_marcar cb_marcar
st_2 st_2
st_1 st_1
tv_1 tv_1
gb_2 gb_2
gb_4 gb_4
dw_interrupcion dw_interrupcion
gb_1 gb_1
dw_seccionadores dw_seccionadores
cb_clientes cb_clientes
cb_eliminar cb_eliminar
gb_causa gb_causa
end type
type tabpage_int_simulacion from userobject within tab_1
end type
type dw_int_simulacion from u_info_int_descargo within tabpage_int_simulacion
end type
type tabpage_int_simulacion from userobject within tab_1
dw_int_simulacion dw_int_simulacion
end type
type tabpage_historial from userobject within tab_1
end type
type uo_historial from uo_historial_descargos within tabpage_historial
end type
type tabpage_historial from userobject within tab_1
uo_historial uo_historial
end type
type tabpage_instalaciones from userobject within tab_1
end type
type mle_observaciones from multilineedit within tabpage_instalaciones
end type
type gb_6 from groupbox within tabpage_instalaciones
end type
type tabpage_instalaciones from userobject within tab_1
mle_observaciones mle_observaciones
gb_6 gb_6
end type
type tabpage_accion from userobject within tab_1
end type
type uo_1 from uo_historial_descargos within tabpage_accion
end type
type tabpage_accion from userobject within tab_1
uo_1 uo_1
end type
type tab_1 from tab within w_7106_solicitud_descargos
tabpage_solicitud tabpage_solicitud
tabpage_otros tabpage_otros
tabpage_interrupciones tabpage_interrupciones
tabpage_int_simulacion tabpage_int_simulacion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
end type
type gb_5 from groupbox within w_7106_solicitud_descargos
end type
end forward

global type w_7106_solicitud_descargos from w_sgigenerica
integer x = 219
integer y = 324
integer width = 3360
integer height = 1868
string title = "OPEN SGI - Solicitud del Descargo"
windowtype windowtype = response!
long backcolor = 79741120
string icon = "Open.ico"
event ue_grabar pbm_custom26
tab_1 tab_1
gb_5 gb_5
end type
global w_7106_solicitud_descargos w_7106_solicitud_descargos

type variables
//estructura de comunicaciones
u_generico_comunicaciones  lu_comunic
long il_nro_descargo,il_nro_instal
boolean lb_tiene_perfil_oper
long il_handle
s_rama s_elemento
long ll_apertura = 0
integer ii_grabo = 0
integer ii_accion 
long il_error = 0
long il_nro_inst_padre
boolean ib_error
boolean ib_abierta = false
boolean ib_con_interrupcion=true
integer ii_index
boolean ib_grabo = true
long il_item_hasta=0
long il_tipo_instalacion
long il_tension
long il_otras_inst[]
long il_grande=1
long il_handle_sel
long il_instalacion_sel
long il_instalacion_afect
Boolean ib_otras_inst
int ii_descargo_sgi = -1
int ii_numero_instalaciones=0,ii_tipo_instalacion
boolean ib_new_tip_inc // tipo incidencia AMR
boolean ib_sin_nro = false
String is_ventana
treeviewitem le_elemento_click
int ii_permito,ii_cargada = 0
// LFE - Mejora 1/272575: copiar descargos
long il_otra_inst_afec
long il_tipo_otra_inst_afec
// LFE - Fin Mejora
end variables

forward prototypes
public function string fnu_obte_nom_usuario (string ps_usuario)
public function long fnu_obtener_ultimo_descargo ()
public function integer fnu_valida_solicitud (ref datawindow dw)
public subroutine fw_agrupa_descargos (long li_fila)
public subroutine fw_habilitar_campos (ref datawindow pdw_data, boolean pb_habilita)
public function string fw_calcular_estado (long pl_estado)
public function long fw_puede_seleccionar (treeviewitem pe_elemento, integer pi_nivel)
public function long fw_buscar_hijos_marcados (treeviewitem pe_elemento)
public subroutine fw_habilitar_botones (treeviewitem pe_elemento)
public function long fw_marcar_hijas (treeviewitem pe_elemento)
public function long fw_desmarcar_hijas (treeviewitem pe_elemento)
public function long fw_puede_seleccionar_hijas (treeviewitem pe_elemento, integer pi_nivel)
public function integer fw_anade_registro ()
public function integer fw_ind_seleccion (long pl_inst_afect)
public function integer fw_comprueba_padres_hijos (treeviewitem pe_elemento)
public function integer fw_direccion (treeviewitem pe_elemento, treeviewitem pe_elemento_h)
public function long fw_comprobar_otros_desc (datetime pdt_fecha_ini, datetime pdt_fecha_fin, long pl_nro_instalacion)
public function integer fnu_poner_blanco (integer li_item)
end prototypes

event ue_grabar;long ll_nro_descargo, ll_contador = 1,li_nro_descargo, li_contador, ll_ret
string ls_nom_instalacion
integer li_resp_1, li_tipo_instalacion, li_tension
datetime ld_fecha, ldt_fecha,ld_f_actual
treeviewitem le_elemento
//u_desc_2030_rn_filtro_descargo	lu_desc_const
long ll_nuevo

ld_f_actual = fgnu_fecha_actual()
ldt_fecha = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado') 
tab_1.tabpage_interrupciones.tv_1.getitem(1,le_elemento)
s_elemento = le_elemento.data

//ll_ret = fw_comprobar_otros_desc(tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'), &
//								   tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'), &
//									s_elemento.codigo) 

IF ll_Ret > 0 THEN
	if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n.","Ya existe un descargo (" + string(ll_ret) + ") en esa instalaci$$HEX1$$f300$$ENDHEX$$n para ese periodo de tiempo. $$HEX1$$bf00$$ENDHEX$$Desea Modificar el descargo?",Information!,okcancel!) = 1 then
		ib_grabo=false
	else
		ib_grabo=true
	end  if
	RETURN
END IF

//if ii_smt = 1

//lu_desc_const = Create u_desc_2030_rn_filtro_descargo;

tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"nro_descargo",il_nro_descargo)

if ib_con_interrupcion then // DSA 03/04/2000
	do while ll_contador <= tab_1.tabpage_interrupciones.dw_interrupcion.rowcount()
        tab_1.tabpage_interrupciones.dw_interrupcion.Setitem(ll_contador,"nro_descargo",tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"nro_descargo"))
        ll_contador++
	loop
end if
//
//Destroy (lu_desc_const )

//tab_1.tabpage_interrupciones.tv_1.getitem(1,le_elemento)
//s_elemento = le_elemento.data
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(tab_1.tabpage_solicitud.dw_datos_solicitud.getrow(),"cod_inst_origen",s_elemento.codigo)
//AHU (03/03/2009)
//tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(tab_1.tabpage_solicitud.dw_datos_solicitud.getrow(),"tipo_descargo",fgci_descargo_ordinario)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(tab_1.tabpage_solicitud.dw_datos_solicitud.getrow(),"inst_descargar",tab_1.tabpage_instalaciones.mle_observaciones.text)
//


ll_nro_descargo = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemnumber(1,"nro_descargo")
ld_fecha = datetime(today(),now())
tab_1.tabpage_solicitud.dw_datos_solicitud.accepttext()

tab_1.tabpage_interrupciones.dw_interrupcion.accepttext()

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

If fg_verifica_parametro("solicitud_descargos_extra") Then
	tab_1.tabpage_otros.dw_datos_solicitud_otros.AcceptText()
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"jefe_trabajo",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"jefe_trabajo"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"tel_trabajo",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"tel_trabajo"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"tiempo_repos",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"tiempo_repos"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"ubicacion",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"ubicacion"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"plano",tab_1.tabpage_otros.dw_datos_solicitud_otros.getitemnumber(1,"plano"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"brigada",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"brigada"))
	//tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"trab_tension",tab_1.tabpage_otros.dw_datos_solicitud_otros.getitemnumber(1,"trab_tension"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"tel_solic",tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,"tel_solic"))
	tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1,"unidad",tab_1.tabpage_otros.dw_datos_solicitud_otros.getitemnumber(1,"unidad"))
End If

tab_1.tabpage_solicitud.dw_puesta_explotacion.accepttext()

if  tab_1.tabpage_solicitud.dw_puesta_explotacion.rowcount() > 0 then
	for li_contador = 1 to  tab_1.tabpage_solicitud.dw_puesta_explotacion.rowcount() 
		if isnull(trim(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.identificador_instalacion[li_contador])) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un identificador de instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
			gnu_u_transaction.uf_rollback();
			ib_grabo = false
			return 
		end if			
		if isnull(trim(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.descripcion[li_contador])) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar una descripci$$HEX1$$f300$$ENDHEX$$n de instalaci$$HEX1$$f300$$ENDHEX$$n correcta.",information!,ok!)
			gnu_u_transaction.uf_rollback();
			ib_grabo = false		
			return 
		end if			
		if isnull(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.nro_instalacion[li_contador]) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un N$$HEX1$$fa00$$ENDHEX$$mero de Instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
			gnu_u_transaction.uf_rollback();
			ib_grabo = false
			return 
		end if			
		if isnull(tab_1.tabpage_solicitud.dw_puesta_explotacion.object.tipo_instalacion[li_contador]) then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un Tipo de Instalaci$$HEX1$$f300$$ENDHEX$$n correcto.",information!,ok!)
			gnu_u_transaction.uf_rollback();
			ib_grabo = false	
			return 
		end if			
	next
end if

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

tab_1.tabpage_solicitud.dw_datos_solicitud.AcceptText()
li_resp_1 = tab_1.tabpage_solicitud.dw_datos_solicitud.Update()
IF li_resp_1 < 0 THEN
	gnv_msg.f_mensaje("AM68","","",ok!)
	ib_grabo = false
	tab_1.SelectTab(1)
ELSE
	ib_grabo = true
END IF

if ib_con_interrupcion then // DSA 03/04/2000
	if  li_resp_1 = 1 then
        ii_grabo = tab_1.tabpage_interrupciones.dw_interrupcion.Update()
	end if  
end if

//  UPDATE "SGD_DESCARGOS"  
//     SET "ESTADO" = 11  
//   WHERE "SGD_DESCARGOS"."NRO_DESCARGO" in (  SELECT "SGD_DESCARGOS_AGRUPADOS"."NRO_DESCARGO"  
//                                                FROM "SGD_DESCARGOS_AGRUPADOS"  
//                                               WHERE "SGD_DESCARGOS_AGRUPADOS"."NRO_AGRUPACION" = (  SELECT "SGD_DESCARGOS"."NRO_AGRUPACION"  
//                                                                                                       FROM "SGD_DESCARGOS"  
//                                                                                              WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo  ) )  ;

if ii_grabo = 1 then
	ii_grabo = tab_1.tabpage_solicitud.dw_puesta_explotacion.update()
end if

IF ii_grabo = 1 THEN
	If upperbound(il_otras_inst[]) > 0 then
		For li_contador = 1 to upperbound(il_otras_inst[])
			IF il_otras_inst[li_contador] <> 0 THEN	
				  INSERT INTO"SGD_DESCARGOS_INST_AFEC"  
						("USUARIO",  
						"PROGRAMA", 
						"F_ACTUAL", 
						"NRO_DESCARGO", 
						"NRO_INSTALACION") Values
					(:gs_usuario,'SGI',:ld_f_actual,:il_nro_descargo, :il_otras_inst[li_contador]);     
					
					IF sqlca.sqlcode <> 0 THEN 
						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se ha producido el siguiente error: " + sqlca.sqlerrtext ,exclamation!,ok!)
						gnu_u_transaction.uf_rollback();
						RETURN
					END IF
			END IF
		Next
	end if
	
	// Se inserta la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
	INSERT INTO"SGD_DESCARGOS_INST_AFEC"  
		("USUARIO",  
		"PROGRAMA", 
		"F_ACTUAL", 
		"NRO_DESCARGO", 
		"NRO_INSTALACION") Values
		(:gs_usuario,'SGI',:ld_f_actual,:il_nro_descargo, :il_instalacion_afect);     

	IF sqlca.sqlcode <> 0 THEN 
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se ha producido el siguiente error: " + sqlca.sqlerrtext ,exclamation!,ok!)
		gnu_u_transaction.uf_rollback();
		RETURN
	END IF
END IF

IF fg_insertar_estado_descargo(il_nro_descargo, &
									 0, &
									 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'), &
									 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'), &
									 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_solicitado'),&
									 tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1, 'obs_solicitado'), &
									 il_instalacion_afect) = FALSE THEN
	ii_grabo = 0
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se ha podido guardar la informaci$$HEX1$$f300$$ENDHEX$$n de los estados asociados al Descargo")
END IF

if ii_grabo = 1 then
	gnu_u_transaction.uf_commit();
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El descargo Nro. " + string(il_nro_descargo) + " ha sido guardado.",information!,ok!)
else
	gnu_u_transaction.uf_rollback();
end if

end event

public function string fnu_obte_nom_usuario (string ps_usuario);string ls_nom_usuario

Select nom_usuario into :ls_nom_usuario From GI_USUARIO_SGI 
WHERE usuario = :ps_usuario ;

IF SQLCA.SQLCode <> 0 THEN ls_nom_usuario = ps_usuario

Return ls_nom_usuario
end function

public function long fnu_obtener_ultimo_descargo (); long ll_nro_ult_descargo
 long ll_encontrados
 long ll_VALOR
date fecha

fecha = today()

    SELECT count(*)  
    INTO :ll_encontrados  
    FROM "SGD_ULT_REG"  
   WHERE "SGD_ULT_REG"."NOM_TABLA" = 'sgd_descargos'   ;

if ll_encontrados > 0 then
        
     SELECT "SGD_ULT_REG"."VALOR"  
     INTO :ll_VALOR  
     FROM "SGD_ULT_REG"  
     WHERE "SGD_ULT_REG"."NOM_TABLA" = 'sgd_descargos'  
           FOR UPDATE NOWAIT ;
                       
     IF sqlca.sqlcode<> 0 THEN       
        gnv_msg.f_mensaje("AD22","","",ok!)
		  return -1
		  gnu_u_transaction.uf_rollback();
        //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Espere un momento. Otro usuario est$$HEX2$$e1002000$$ENDHEX$$dando de alta un descargo.")
     ELSE
                
		  UPDATE "SGD_ULT_REG"  
		  SET "VALOR" = :ll_VALOR + 1,   
				"PROGRAMA" = 'DESCARGOS',   
				"F_ACTUAL" = :fecha,   
				"NOM_TABLA" = 'sgd_descargos',   
				"USUARIO" = :gs_usuario  
		  WHERE "NOM_TABLA" = 'sgd_descargos' ;
		  
	  END IF

else
        
     INSERT INTO "SGD_ULT_REG"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "NOM_TABLA",   
           "VALOR" )  
     VALUES ( :gs_usuario,   
           :fecha,   
           'DESCARGOS',   
           'sgd_descargos',   
           1 )  ;
        
     ll_valor = 1

end if

gnu_u_transaction.uf_commit();
return ll_VALOR
end function

public function integer fnu_valida_solicitud (ref datawindow dw);datetime ldt_inicio, ldt_fin, ldt_solicitud, ldt_ini_interr, ldt_fin_interr, ldt_hoy
long ll_contador
string ls_obs_solicitado, ls_nombre,ls_descripcion
date ld_inicio
int li_ind_act_grafica
int li_antelacion, li_diferencia_dias, li_hora_inicio, li_hora_descargo, li_horas, li_fila_interrupcion
tab_1.tabpage_solicitud.dw_datos_solicitud.AcceptText()
tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()
//li_fila_interrupcion = dw_interrupcion.GetSelectedRow(0)

li_ind_act_grafica =tab_1.tabpage_solicitud.dw_datos_solicitud.GetitemNumber(1,"ind_act_grafica")
ls_nombre = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemstring(1,"nom_desc")
ls_descripcion = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemstring(1,"descripcion")
ls_obs_solicitado = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemstring(1,"obs_solicitado")
ldt_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDateTime(1,"f_ini_solicitado")
ldt_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDateTime(1,"f_fin_solicitado")
ldt_solicitud = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDateTime(1,"f_solicitado")

if isnull(ldt_inicio) then
        gnv_msg.f_mensaje("AD23","","",ok!)
        //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe introducir una fecha de inicio del descargo")
        Return 2
end if

if isnull(ldt_fin) then
        gnv_msg.f_mensaje("AD24","","",ok!)
        //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe introducir una fecha de fin del descargo")
        Return 2
end if  

ldt_hoy = datetime(today(),now() )

SELECT CODIGO
INTO :li_antelacion
FROM SGD_VALOR
WHERE CODIF = 'DS_H';

if not isnull(ldt_inicio) then
		
		li_diferencia_dias = daysAfter(date(ldt_Hoy),date(ldt_inicio))
		li_hora_inicio   = hour(time(ldt_inicio))
		li_hora_descargo = hour (time(ldt_hoy))
		li_horas = (li_diferencia_dias*24)  + (li_hora_inicio - li_hora_descargo)

		if li_horas < li_antelacion then
			IF li_antelacion = 0 then
				messagebox("Atencion","La solicitud del descargo debe hacerse con antelacion")
			else
				messagebox("Atencion","La solicitud del descargo debe hacerse con " + string(li_antelacion) + " Hora/s de antelacion")
			end if
//      		gnv_msg.f_mensaje("ED26","","",ok!)


//ld_inicio = date(ldt_inicio)
//ld_hoy = today()
//
//if daysafter(ld_hoy,ld_inicio) < 1 then
//        gnv_msg.f_mensaje("","","",ok!)
//        //Comprueba que la solicitud del descargo se hace como minimo 24 h por adelantado
        return 2
		end if


if ldt_inicio > ldt_fin then
        gnv_msg.f_mensaje("AD25","","",ok!)
        //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de fin del descargo debe ser mayor que la fecha de inicio del mismo")
        Return 2
end if  

	
if tab_1.tabpage_interrupciones.st_2.Text = '' then
	MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar la Instalaci$$HEX1$$f300$$ENDHEX$$n del Descargo")
   Return 2
end if

// GNU 10-2-2006. Incidencia 0/396474
// A$$HEX1$$f100$$ENDHEX$$adido por Sgo. Mejora Colombia. 12/07/2005.
//If gi_pais = 7 Then
If fg_verifica_parametro("Causa en descargos.") Then
// FIN GNU
	If tab_1.tabpage_interrupciones.st_causa.Text = '' then
		MessageBox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Debe seleccionar la Causa que motiv$$HEX2$$f3002000$$ENDHEX$$del Descargo")
   	Return 2
	End If
End If
// Fin. Sgo.

if isnull(ls_obs_solicitado) or len(ls_obs_solicitado) < 1 then
        gnv_msg.f_mensaje("AD35","","",ok!)
        //Ha de insertar un observacion en la solicitud
        return 2
end if


if isnull(ls_nombre) or len(ls_nombre) < 1 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No ha introducido el nombre del descargo",Information!) 
        //Ha de insertar un observacion en la solicitud
        return 2
end if

if isnull(ls_descripcion) or len(ls_descripcion) < 1 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No ha introducido la descripci$$HEX1$$f300$$ENDHEX$$n del descargo",Information!)    
        //Ha de insertar un observacion en la solicitud
        return 2
end if

if ldt_solicitud > ldt_inicio then
        gnv_msg.f_mensaje("AD26","","",ok!)
        //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio del descargo debe ser mayor que la fecha de la solicitud")
        Return 2
end if  



if ib_con_interrupcion then // DSA 03/04/2000
	if tab_1.tabpage_interrupciones.dw_interrupcion.RowCount() < 1 then
        Return 1
	end if
	
	for ll_contador = 1 to tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()
		
// GNU 16-11-2006. Incidencia 0/460037		
//		ldt_ini_interr = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(1,"f_inicio")
//         ldt_fin_interr = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(1,"f_fin")
		
		ldt_ini_interr = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(ll_contador,"f_inicio")
      ldt_fin_interr = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(ll_contador,"f_fin")
// FIN GNU
		
		if ldt_inicio > ldt_ini_interr then
			  gnv_msg.f_mensaje("AD29","","",ok!)
			  //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de la interrupci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la fecha de inicio del descargo")
			  Return 2
		end if  
	
		if ldt_fin < ldt_fin_interr then
			  gnv_msg.f_mensaje("AD30","","",ok!)
			  //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de fin de la interrupci$$HEX1$$f300$$ENDHEX$$n debe ser menor que la fecha de fin del descargo")
			  Return 2
		end if
	
		if ldt_ini_interr > ldt_fin_interr then
			  gnv_msg.f_mensaje("AD31","","",ok!)
			  //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de fin de la interrupci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la fecha de inicio de la misma")
			  Return 2
		end if  
	next

	Long ll_i, ll_row
	DateTime ldt_fecha_valida


	ll_row = tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()
	For ll_i = 1 To ll_row
	 ldt_fecha_valida = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(ll_i,"f_inicio")
	 If IsNull(ldt_fecha_valida) Or Not IsDate(String(Date(ldt_fecha_valida))) Then
		 gnv_msg.f_mensaje("AD27","","",ok!)
		 Return 2
	 End If
	
	 ldt_fecha_valida = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(ll_i,"f_fin")
	 If IsNull(ldt_fecha_valida) Or Not IsDate(String(Date(ldt_fecha_valida))) Then
		  gnv_msg.f_mensaje("AD28","","",ok!)
		 Return 2
	 End If
	Next
end if  

////********************************************************************************************//
////               Externalidad: Solicitud de descargos, informacion adicional                  //
////               Luis Eduardo Ortiz   Mayo/2001                                               //
////********************************************************************************************//
//
//String ls_ubicacion,ls_jefe_trab
//Integer li_unidad
//
//tab_1.tabpage_otros.dw_datos_solicitud_otros.AcceptText()
//
//If fg_verifica_parametro("solicitud_descargos_extra") Then
//	li_unidad = tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemNumber(1,'unidad')
//	ls_ubicacion = tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,'Ubicacion')
//	ls_jefe_trab = tab_1.tabpage_otros.dw_datos_solicitud_otros.GetItemString(1,'jefe_trabajo')
//	If IsNull(ls_jefe_trab) Or len(ls_jefe_trab) < 1 Then
//		Messagebox("Informacion","Debe Ingresar un Jefe de Trabajo",Information!)
//		tab_1.SelectedTab = 2
//		Return 2
//	End If
//	If Isnull(ls_ubicacion) Or len(ls_ubicacion) < 1 Then
//		Messagebox("Informacion","Debe Ingresar Ubicacion",Information!)
//		tab_1.SelectedTab = 2
//		Return 2
//	End If
//	If IsNull(li_unidad) Then
//		Messagebox("Informacion","Debe Ingresar una Unidad",Information!)
//		tab_1.SelectedTab = 2
//		Return 2
//	End If
//End If
//
////********************************************************************************************//
////               Luis Eduardo Ortiz   Mayo/2001                                               //
////********************************************************************************************//

end if

return 1
end function

public subroutine fw_agrupa_descargos (long li_fila);il_nro_inst_padre = gu_comunic.is_comunic.longval2
tab_1.tabpage_solicitud.gb_solicitud_descargo.text = "Solicitud de agrupaci$$HEX1$$f300$$ENDHEX$$n de descargos"
tab_1.tabpage_interrupciones.st_1.underline = false
tab_1.tabpage_interrupciones.st_1.textcolor = 0
tab_1.tabpage_interrupciones.st_1.enabled = false
tab_1.tabpage_interrupciones.st_1.italic = false
tab_1.tabpage_interrupciones.st_2.text = gu_comunic.is_comunic.strval2
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_ini_solicitado",w_7005_agrupar_descargos.idt_f_inicio)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_fin_solicitado",w_7005_agrupar_descargos.idt_f_fin)

end subroutine

public subroutine fw_habilitar_campos (ref datawindow pdw_data, boolean pb_habilita);///////////////////////////////////////////////////////////////////////////
// Funcion: fw_habilitar_campos															
//																									
// Objetivo: Se encarga de habilitar y deshabilitar todos los campos de la dw.														
//																									
//	Entrada:	pdw_data	- Datawindow de la que deshabilitar/habilitar			
//																									
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:																	
//																									
//  Fecha         Resp.          Actuaci$$HEX1$$f300$$ENDHEX$$n											
// ---------     -------        ----------------------------------------	
// 27/01/1999    JVI            Versi$$HEX1$$f300$$ENDHEX$$n Inicial										
//	03/06/1999		ACO				Modificaci$$HEX1$$f300$$ENDHEX$$n																						
///////////////////////////////////////////////////////////////////////////

integer		li_modo, li_num_cols, li_contador
double			ld_color
string ls_respuesta

//													
//Seg$$HEX1$$fa00$$ENDHEX$$n el modo pasado como parametro	
//													
if pb_habilita then
	li_modo = 0
	ld_color = 16777215
	tab_1.tabpage_interrupciones.st_1.enabled=true
else
	li_modo = 1
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ld_color = 12632256
	ld_color = 81324524
// Fin. Sgo.
	tab_1.tabpage_interrupciones.st_1.enabled=false
end if

	li_num_cols = integer(pdw_data.object.DataWindow.Column.Count)
	for li_contador = 1 to li_num_cols
		ls_respuesta = pdw_data.Describe("#" + string(li_contador) +".TabSequence")
		if ls_respuesta<>"0" then 
				pdw_data.Modify("#" + string(li_contador) + ".protect = " + string(li_modo))
  				pdw_data.Modify("#" + string(li_contador) + ".background.color = " + string(ld_color))		
			END IF
		NEXT


end subroutine

public function string fw_calcular_estado (long pl_estado);// Recupera la descripcion del estado 
string ls_estado

ls_estado = ''

SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_estado
FROM "SGD_VALOR"  
WHERE ( "SGD_VALOR"."CODIF" = 'ES_D' ) AND "SGD_VALOR"."CODIGO" =:pl_estado ;

return ls_estado
end function

public function long fw_puede_seleccionar (treeviewitem pe_elemento, integer pi_nivel);treeviewItem le_elemento
int li_item
long ll_return = 0

// Compruebo si alguno de los padre del item seleccionado para marcar ya esta marcado
// en ese caso no deberia poder marcar

li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! , pe_elemento.itemhandle)
DO WHILE li_item <> -1 
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! ,le_elemento.itemhandle)
		ll_return = 0
	END IF
LOOP

// Compruebo si hay algun hijo por debajo de ese item que ya este seleccionado,
// en ese caso no dejo marcar

// Obtendo el primer hijo
li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!  , pe_elemento.itemhandle)
DO WHILE li_item <> -1 and ll_return <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		ll_return = -1
	ELSE	
		ll_return = fw_buscar_hijos_marcados(le_elemento)	
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem! ,le_elemento.itemhandle)
		tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	END IF
LOOP

return ll_return

end function

public function long fw_buscar_hijos_marcados (treeviewitem pe_elemento);int li_item
treeviewitem le_elemento

// Obtendo el primer hijo
li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!  , pe_elemento.itemhandle)
DO WHILE li_item <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		return -1
	ELSE
		DO while li_item <> -1
			li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem! ,le_elemento.itemhandle)
			tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
			IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
				return -1
			END IF
		LOOP
	END IF
LOOP
return 0
end function

public subroutine fw_habilitar_botones (treeviewitem pe_elemento);int li_indice
this.SetRedraw(false)
tab_1.tabpage_interrupciones.cb_marcar.enabled = false
tab_1.tabpage_interrupciones.cb_desmarcar.enabled = false
FOR li_indice = 1 TO il_item_hasta
	tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,pe_elemento)
	IF pe_elemento.StatePictureIndex = 2 THEN
		tab_1.tabpage_interrupciones.cb_marcar.enabled = true
		// inserto en la dw los datos necesarios para la interrupcion
		IF pe_elemento.bold = true THEN
			tab_1.tabpage_interrupciones.cb_desmarcar.enabled = true
			li_indice = il_item_hasta
			// inserto en la dw los datos necesarios para la interrupcion
		END IF
	END IF
NEXT
this.SetRedraw(true)
end subroutine

public function long fw_marcar_hijas (treeviewitem pe_elemento);treeviewItem le_elemento
int li_item
long ll_return = 0

tab_1.tabpage_interrupciones.tv_1.getitem(pe_elemento.itemhandle,le_elemento)
ll_return = fw_puede_seleccionar_hijas(le_elemento,le_elemento.level)
IF ll_return = -1 THEN	
	return ll_return
END IF

// Compruebo si alguno de los padre del item seleccionado para marcar ya esta marcado
// en ese caso no deberia poder marcar

li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! , pe_elemento.itemhandle)
DO WHILE li_item <> -1 
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! ,le_elemento.itemhandle)
		ll_return = 0
	END IF
LOOP

li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!, pe_elemento.itemhandle)
DO WHILE li_item <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)		
	IF le_elemento.StatePictureIndex = 2 THEN
		le_elemento.StatePictureIndex = 1
	ELSE
		le_elemento.StatePictureIndex = 2
	END IF
	
	tab_1.tabpage_interrupciones.tv_1.setitem(li_item, le_elemento)
	li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem!,le_elemento.itemhandle)	
  	
	IF il_item_hasta < li_item THEN
		il_item_hasta = li_item
	END IF
LOOP

return ll_return
end function

public function long fw_desmarcar_hijas (treeviewitem pe_elemento);treeviewItem le_elemento
int li_item
long ll_return = 0


li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!, pe_elemento.itemhandle)
DO WHILE li_item <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)		
	IF le_elemento.StatePictureIndex = 2 THEN
		le_elemento.StatePictureIndex = 1
	END IF
	
	tab_1.tabpage_interrupciones.tv_1.setitem(li_item, le_elemento)
	li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem!,le_elemento.itemhandle)	
  	
	IF il_item_hasta < li_item THEN
		il_item_hasta = li_item
	END IF
LOOP

return ll_return
end function

public function long fw_puede_seleccionar_hijas (treeviewitem pe_elemento, integer pi_nivel);treeviewItem le_elemento
int li_item
long ll_return = 0




// Compruebo si alguno de los padre del item seleccionado para marcar ya esta marcado
// en ese caso no deberia poder marcar

li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! , pe_elemento.itemhandle)
DO WHILE li_item <> -1 
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 THEN
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! ,le_elemento.itemhandle)
		ll_return = 0
	END IF
LOOP

// Compruebo si hay algun hijo por debajo de ese item que ya este seleccionado,
// en ese caso no dejo marcar

// Obtendo el primer hijo
li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!  , pe_elemento.itemhandle)
DO WHILE li_item <> -1 and ll_return <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 THEN
		ll_return = -1
	ELSE	
		ll_return = fw_buscar_hijos_marcados(le_elemento)	
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem! ,le_elemento.itemhandle)
		tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	END IF
LOOP

return ll_return

end function

public function integer fw_anade_registro ();int li_reg
datetime f_alta

li_reg = tab_1.tabpage_solicitud.dw_puesta_explotacion.insertrow(0)
f_alta = fgnu_fecha_actual()

tab_1.tabpage_solicitud.dw_puesta_explotacion.object.nro_descargo[li_reg] = il_nro_descargo
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.f_alta[li_reg] = f_alta
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.usuario[li_reg] = gs_usuario
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.programa[li_reg] = 'Ing_desc'
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.f_actual[li_reg] = f_alta
tab_1.tabpage_solicitud.dw_puesta_explotacion.object.estado[li_reg] = 1
return 1

end function

public function integer fw_ind_seleccion (long pl_inst_afect);//////////////////////////////////////////////////////////////////////////////////////////////////
//
// Evento:  fw_ind_seleccion
//
// Objetivo: Comprueba que la instalacion recibida como parametro no este
//			   entre las instalaciones asignadas como 'Otras instalaciones' o
//			   como la instalaci$$HEX1$$f300$$ENDHEX$$n afectada por la incidencia.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n     Fecha     	Responsable
//                       ---------       	-----    		 ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//             		Creaci$$HEX1$$f300$$ENDHEX$$n      	23/10/2002  	FDO
//
//////////////////////////////////////////////////////////////////////////////////////////////////

int li_conta

if Upperbound(il_otras_inst[]) = 0 then return 0

for li_conta = 1 to Upperbound(il_otras_inst[]) 
	If il_otras_inst[li_conta] = pl_inst_afect then 
		return -1
	end if
next

return 0
end function

public function integer fw_comprueba_padres_hijos (treeviewitem pe_elemento);treeviewitem le_elemento
int li_item

li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! , pe_elemento.itemhandle)
DO WHILE li_item <> -1 
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		// hay papi
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ParentTreeItem! ,le_elemento.itemhandle)
		// de momento no hay papi
	END IF
LOOP

li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(ChildTreeItem!, pe_elemento.itemhandle)

DO WHILE li_item <> -1 
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	IF le_elemento.StatePictureIndex = 2 OR le_elemento.bold = true THEN
		// hay hijo
		return -1
	ELSE
		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(childTreeItem! ,le_elemento.itemhandle)
		// de momento no hay hijo
	END IF
LOOP

return 0
end function

public function integer fw_direccion (treeviewitem pe_elemento, treeviewitem pe_elemento_h);int li_item = 0
treeviewitem le_elemento

tab_1.tabpage_interrupciones.tv_1.getitem(pe_elemento_h.itemhandle,le_elemento)

do while li_item <> -1

	li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(previousTreeItem!,le_elemento.itemhandle)
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	
	if pe_elemento.label = le_elemento.label then
		return 0
		// hacia atras
	end if

loop

li_item = 0
tab_1.tabpage_interrupciones.tv_1.getitem(pe_elemento_h.itemhandle,le_elemento)

do while li_item <> -1

	li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(nextTreeItem!,le_elemento.itemhandle)
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento)
	
	if pe_elemento.label = le_elemento.label then
		return 1
		// hacia delante
	end if

loop

// hacia ningun lado

return -1
end function

public function long fw_comprobar_otros_desc (datetime pdt_fecha_ini, datetime pdt_fecha_fin, long pl_nro_instalacion);long ll_nro_descargo

SELECT NRO_DESCARGO
INTO :ll_nro_descargo
FROM SGD_DESCARGOS
WHERE COD_INST_ORIGEN = :pl_nro_instalacion
AND ( (F_INI_SOLICITADO<= :pdt_fecha_ini AND F_FIN_SOLICITADO> :pdt_fecha_ini) OR
		(F_INI_SOLICITADO<= :pdt_fecha_fin AND F_FIN_SOLICITADO> :pdt_fecha_fin) OR
		(F_INI_SOLICITADO>= :pdt_fecha_ini AND F_FIN_SOLICITADO<= :pdt_fecha_fin) ) AND 
	 ESTADO NOT IN (:fgci_descargo_anulado, :fgci_descargo_finalizado, :fgci_descargo_rechazado) AND
	 NRO_DESCARGO <> :il_nro_descargo AND
	 ROWNUM = 1;
	 

IF sqlca.sqlcode = 0 THEN 
	Return ll_nro_descargo
ELSE
	Return 0
END IF
end function

public function integer fnu_poner_blanco (integer li_item);treeviewitem le_elemento
int li_item_2

DO WHILE li_item <> -1
	tab_1.tabpage_interrupciones.tv_1.getitem (li_item, le_elemento)
	le_elemento.StatePictureIndex= 1
	tab_1.tabpage_interrupciones.tv_1.setitem(le_elemento.itemhandle, le_elemento)
	li_item_2= tab_1.tabpage_interrupciones.tv_1.FindItem (ChildTreeItem!, le_elemento.itemhandle)
	fnu_Poner_Blanco(li_item_2)
	li_item= tab_1.tabpage_interrupciones.tv_1.FindItem (NextTreeItem!, le_elemento.itemhandle)
LOOP

Return 1
end function

on w_7106_solicitud_descargos.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.gb_5
end on

on w_7106_solicitud_descargos.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.gb_5)
end on

event open;call super::open;string ls_nom_usuario, ls_estado
date ldt_fecha
int li_fila

// Creaci$$HEX1$$f300$$ENDHEX$$n de los objetos de trabajo
SetPointer(HourGlass!)

is_ventana = 'Solicitud'

lu_comunic = create u_generico_comunicaciones 
lu_comunic.is_comunic=gu_comunic.is_comunic

// Conexi$$HEX1$$f300$$ENDHEX$$n a la base de datos
tab_1.tabpage_solicitud.dw_datos_solicitud.SetTransObject(SQLCA)
tab_1.tabpage_interrupciones.dw_interrupcion.SetTransObject(SQLCA)
tab_1.tabpage_solicitud.dw_puesta_explotacion.SetTransObject(SQLCA)
// GNU 18-1-2006. Incidencia pruebas integradas Nicaragua
tab_1.tabpage_solicitud.dw_puesta_explotacion.Show()
// FIN GNU

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional              //
//               Luis Eduardo Ortiz   Mayo/2001                                               			//
//********************************************************************************************//

tab_1.tabpage_otros.dw_datos_solicitud_otros.SetTransObject(SQLCA)
li_fila = tab_1.tabpage_otros.dw_datos_solicitud_otros.InsertRow(0)

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

// Obtenci$$HEX1$$f300$$ENDHEX$$n del usuario que define el descargo
lb_tiene_perfil_oper=FALSE
ls_nom_usuario = This.fnu_obte_nom_usuario(gs_usuario)
SetNULL(ldt_fecha)

// COMIENZO ALE

// Solo si no hay BDI se oculta el checkbox
IF not (gb_openbdi or gb_operaciones) THEN
        tab_1.tabpage_solicitud.dw_datos_solicitud.modify("ind_act_grafica.visible=0")
END IF
// FINAL

// Controla el perfil del usuario que entr$$HEX2$$f3002000$$ENDHEX$$en el sistema
if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA","")> 1  then // ALTA / SOLICITUD DE DESCARGOS
        lb_tiene_perfil_oper=TRUE
END IF

// Inicializa variables
li_fila = tab_1.tabpage_solicitud.dw_datos_solicitud.InsertRow(0)

tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"tipo_descargo", 1)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"ind_act_grafica", 0)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"subest_movil", 0)
tab_1.tabpage_solicitud.dw_datos_solicitud.setitem(1,"trab_tension", 0)

tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"id_enviado", 0)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"id_solicitante",gs_usuario)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_solicitado",DateTime(Today(),Now()))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_ini_solicitado",ldt_fecha)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_fin_solicitado",ldt_fecha)	

tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"ind_interrupcion",1)
// Si estamos agrupando descargos cambio la informacion de la pantalla
if isvalid(w_7005_agrupar_descargos) then
	fw_agrupa_descargos(li_fila)
end if

tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"estado",fgci_descargo_definido)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"usuario",gs_usuario)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"f_alta",DateTime(Today(),Now()))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(li_fila,"programa","w_7104")
il_nro_descargo = fnu_obtener_ultimo_descargo()

IF il_nro_descargo = -1 THEN
	ib_sin_nro = true
	close(this)
	return
ELSE
	ib_grabo = true
END IF

datawindowchild ddw_desc_descargo
//string ls_prim_desc 

//SELECT valor
//INTO :ls_prim_desc
//FROM sgd_valor
//WHERE codif='DESC';
if fg_verifica_parametro("descripcion descargos") then
//	and (il_nro_descargo >= long(ls_prim_desc)) then
	tab_1.tabpage_solicitud.dw_desc_descargo.insertrow(0)
	tab_1.tabpage_solicitud.dw_desc_descargo.visible=true
	tab_1.tabpage_solicitud.dw_desc_descargo.GetChild('pi_desc_descargo',ddw_desc_descargo)
	ddw_desc_descargo.SetTransObject(SQLCA)
	ddw_desc_descargo.retrieve()
end if

tab_1.tabpage_solicitud.dw_datos_solicitud.SetFocus()
ib_abierta = true
ls_estado = fw_calcular_estado(tab_1.tabpage_solicitud.dw_datos_solicitud.GetITemNumber(1,'estado'))
tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado_o.text = ls_estado

//********************************************************************************************//
//               Externalidad: Solicitud de descargos, informacion adicional                  //
//               Luis Eduardo Ortiz   Mayo/2001                                               //
//********************************************************************************************//

If fg_verifica_parametro("solicitud_descargos_extra") Then
	tab_1.tabpage_otros.Visible = True
End If

ib_otras_inst = fg_verifica_parametro("DESCARGOS OTRAS INST")

//********************************************************************************************//
//               Luis Eduardo Ortiz   Mayo/2001                                                      //
//********************************************************************************************//

//////////////////////////////////////////////////////////
// TIPO DE INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
//////////////////////////////////////////////////////////

ib_new_tip_inc = fg_verifica_parametro('nuevos_tip_inc')

if ib_new_tip_inc then
	 tab_1.tabpage_solicitud.dw_datos_solicitud.modify("ind_obligada.visible=1")
else
	 tab_1.tabpage_solicitud.dw_datos_solicitud.modify("ind_obligada.visible=0")
	 tab_1.tabpage_solicitud.dw_datos_solicitud.modify("obs_solicitado.width = 1257")
	 tab_1.tabpage_solicitud.dw_datos_solicitud.modify("obs_solicitado.height = 380")
	 tab_1.tabpage_solicitud.cb_1.y = 956
end if

tab_1.tabpage_interrupciones.dw_seccionadores.settransobject(sqlca)

// A$$HEX1$$f100$$ENDHEX$$adido por FDO Mejora Colombia. 12/07/2005.
If fg_verifica_parametro("Causa en descargos.") Then
	tab_1.tabpage_interrupciones.gb_causa.Visible = True
	tab_1.tabpage_interrupciones.gb_causa.Enabled = True
	tab_1.tabpage_interrupciones.st_sel_causa.Visible = True
	tab_1.tabpage_interrupciones.st_sel_causa.Enabled = True
	tab_1.tabpage_interrupciones.st_causa.Visible = True
End If
// Fin. FDO

IF gi_pais = 4 THEN // En Panam$$HEX2$$e1002000$$ENDHEX$$este campo tiene que estar deshabilitado en la solicitud (LFE)
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.nom_desc.protect = 1
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.nom_desc.background.color = gs_gris
END IF

//AHM(24/04/2008)
tab_1.tabpage_instalaciones.visible = TRUE
tab_1.tabpage_instalaciones.enabled = TRUE

//AHU(19/02/2009) Mejora - Reportes de eventos STN y STR
//tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo.protect = TRUE
//tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo.ReadOnly("No")
//tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo.background.color = gs_blanco
tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo.visible = TRUE
tab_1.tabpage_solicitud.dw_datos_solicitud.object.grupo_descargo.visible = FALSE
tab_1.tabpage_solicitud.dw_datos_solicitud.setItem(1, "tipo_descargo", 1);

end event

event closequery;long ll_respuesta
long ll_auxiliar
int ll_valida_solicitud, ll_valida_interr
string ls_desc, ls_ident

if ib_error = true then
	return 1
end if

if not ib_sin_nro then
	
	ll_respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
	
	if ll_respuesta = 1 then
		tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()
		ll_valida_solicitud = fnu_valida_solicitud (tab_1.tabpage_solicitud.dw_datos_solicitud)
		if ll_valida_solicitud = 1 then
			ii_grabo = 1
			This.TriggerEvent("ue_grabar")
			
			IF not ib_grabo THEN Return 1
		else
			Return 1
		end if
		
	ELSEIF ll_respuesta = 3 then
		Return 1
	end if
end if
end event

event close;fgnu_resetear_s_comunicaciones(gu_comunic1)
fgnu_resetear_s_comunicaciones(gu_comunic)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7106_solicitud_descargos
integer x = 626
integer y = 548
end type

type tab_1 from tab within w_7106_solicitud_descargos
event create ( )
event destroy ( )
integer x = 110
integer y = 32
integer width = 3067
integer height = 1696
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean raggedright = true
integer selectedtab = 1
tabpage_solicitud tabpage_solicitud
tabpage_otros tabpage_otros
tabpage_interrupciones tabpage_interrupciones
tabpage_int_simulacion tabpage_int_simulacion
tabpage_historial tabpage_historial
tabpage_instalaciones tabpage_instalaciones
tabpage_accion tabpage_accion
end type

on tab_1.create
this.tabpage_solicitud=create tabpage_solicitud
this.tabpage_otros=create tabpage_otros
this.tabpage_interrupciones=create tabpage_interrupciones
this.tabpage_int_simulacion=create tabpage_int_simulacion
this.tabpage_historial=create tabpage_historial
this.tabpage_instalaciones=create tabpage_instalaciones
this.tabpage_accion=create tabpage_accion
this.Control[]={this.tabpage_solicitud,&
this.tabpage_otros,&
this.tabpage_interrupciones,&
this.tabpage_int_simulacion,&
this.tabpage_historial,&
this.tabpage_instalaciones,&
this.tabpage_accion}
end on

on tab_1.destroy
destroy(this.tabpage_solicitud)
destroy(this.tabpage_otros)
destroy(this.tabpage_interrupciones)
destroy(this.tabpage_int_simulacion)
destroy(this.tabpage_historial)
destroy(this.tabpage_instalaciones)
destroy(this.tabpage_accion)
end on

event selectionchanged;//datetime ldt_inicio, ldt_fin
//
//ldt_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(1,"f_ini_solicitado")
//ldt_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(1,"f_fin_solicitado")
//
//if isnull(ldt_inicio) then
//   gnv_msg.f_mensaje("AD27","","",ok!)
//	newindex=oldindex
//   return 
//end if
//
//if isnull(ldt_fin) then
//	
//   gnv_msg.f_mensaje("AD28","","",ok!)
//	newindex=oldindex
//   return 
//end if
//
//
//
ii_index = newindex
end event

event selectionchanging;datetime ldt_inicio, ldt_fin, ldt_ini_int, ldt_fin_int, ldt_solicitado
string ls_nom_desc, ls_desc, ls_obs
int li_fila

IF oldindex > 0 THEN
	tab_1.tabpage_solicitud.dw_datos_solicitud.Accepttext()
	ldt_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(1,"f_ini_solicitado")
	ldt_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(1,"f_fin_solicitado")
	ldt_solicitado = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(1,"f_solicitado")
	ls_nom_desc = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"nom_Desc")
	ls_desc = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,"descripcion")
	ls_obs = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString (1,"obs_solicitado")
	
	IF This.control[oldindex] = tabpage_solicitud THEN
	//if oldindex= 1  THEN
		if isnull(ldt_inicio) and isnull(ldt_fin) then
			gnv_msg.f_mensaje("AD49","","",ok!)
			return 1
		elseif isnull(ldt_fin)	then
			gnv_msg.f_mensaje("AD24","","",ok!)
			return 1	
		elseif isnull(ldt_inicio) then
			gnv_msg.f_mensaje("AD23","","",ok!)
			return 1	
		end if



		if isnull(ls_desc) or isnull(ls_nom_desc) or isnull(ls_obs) or &
			(ls_desc='') or (ls_nom_desc='') or (ls_obs = '') then
			gnv_msg.f_mensaje ("AD48","","",ok!)
			return 1
		end if
	
		if isnull(ldt_solicitado) then
			gnv_msg.f_mensaje("AD38","","",ok!)
			return 1
		end if
	
		if ldt_inicio > ldt_fin then
			gnv_msg.f_mensaje("AD25","","",ok!)
			return 1
		end if
	
		if ldt_inicio = ldt_fin then
			gnv_msg.f_mensaje("AD39","","",ok!)
			return 1
		end if
	
		if ldt_solicitado > ldt_inicio or ldt_solicitado > ldt_fin then
			gnv_msg.f_mensaje("AD40","","",ok!)
			return 1
		end if
	
	END IF
	
	//Valido las fechas de las interrupciones marcadas
	IF This.control[oldindex] = tabpage_interrupciones THEN
	//IF oldindex = 3  THEN
		IF tab_1.tabpage_interrupciones.dw_interrupcion.RowCount() > 0 THEN
			tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()
			FOR li_fila = 1 TO tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()
				ldt_ini_int = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(li_fila,"f_inicio")
				ldt_fin_int = tab_1.tabpage_interrupciones.dw_interrupcion.GetItemDateTime(li_fila,"f_fin")
	
				if (ldt_ini_int < ldt_inicio) or (ldt_fin_int > ldt_fin) &
					OR (ldt_ini_int >= ldt_fin_int) then
					gnv_msg.f_mensaje ("AM67","","",ok!)
					return 
				end if
			NEXT	
		END IF
	END IF
END IF
end event

type tabpage_solicitud from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
long backcolor = 79741120
string text = " Descargo "
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "descargo.bmp"
long picturemaskcolor = 553648127
dw_desc_descargo dw_desc_descargo
cb_menos cb_menos
cb_mas cb_mas
dw_puesta_explotacion dw_puesta_explotacion
st_3 st_3
cb_1 cb_1
dw_datos_solicitud dw_datos_solicitud
gb_solicitud_descargo gb_solicitud_descargo
end type

on tabpage_solicitud.create
this.dw_desc_descargo=create dw_desc_descargo
this.cb_menos=create cb_menos
this.cb_mas=create cb_mas
this.dw_puesta_explotacion=create dw_puesta_explotacion
this.st_3=create st_3
this.cb_1=create cb_1
this.dw_datos_solicitud=create dw_datos_solicitud
this.gb_solicitud_descargo=create gb_solicitud_descargo
this.Control[]={this.dw_desc_descargo,&
this.cb_menos,&
this.cb_mas,&
this.dw_puesta_explotacion,&
this.st_3,&
this.cb_1,&
this.dw_datos_solicitud,&
this.gb_solicitud_descargo}
end on

on tabpage_solicitud.destroy
destroy(this.dw_desc_descargo)
destroy(this.cb_menos)
destroy(this.cb_mas)
destroy(this.dw_puesta_explotacion)
destroy(this.st_3)
destroy(this.cb_1)
destroy(this.dw_datos_solicitud)
destroy(this.gb_solicitud_descargo)
end on

type dw_desc_descargo from datawindow within tabpage_solicitud
boolean visible = false
integer x = 1614
integer y = 104
integer width = 1056
integer height = 108
integer taborder = 20
string title = "none"
string dataobject = "d_desc_descargo"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//datawindowchild ddw_desc_descargo
//string ls_prim_desc 
//
//SELECT valor
//INTO :ls_prim_desc
//FROM sgd_valor
//WHERE codif='DESC';
//
//if fg_verifica_parametro("descripcion descargos") &
//	and (il_nro_descargo >= long(ls_prim_desc) or (il_nro_descargo=0)) then
//	this.insertrow(0)
//	this.visible=true
//	this.GetChild('pi_desc_descargo',ddw_desc_descargo)
//	ddw_desc_descargo.SetTransObject(SQLCA)
//	ddw_desc_descargo.retrieve()
//end if
end event

event itemchanged;dw_datos_solicitud.setitem(1,'descripcion',data)


end event

type cb_menos from commandbutton within tabpage_solicitud
integer x = 2583
integer y = 1368
integer width = 78
integer height = 64
integer taborder = 51
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "-"
end type

event clicked;if tab_1.tabpage_solicitud.dw_puesta_explotacion.getrow() > 0 then
	tab_1.tabpage_solicitud.dw_puesta_explotacion.deleterow(tab_1.tabpage_solicitud.dw_puesta_explotacion.getrow())
end if
end event

type cb_mas from commandbutton within tabpage_solicitud
integer x = 2583
integer y = 1292
integer width = 78
integer height = 64
integer taborder = 61
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "+"
end type

event clicked;IF tab_1.tabpage_solicitud.dw_puesta_explotacion.AcceptText() = 1 THEN
	fw_anade_registro()
	tab_1.tabpage_solicitud.dw_puesta_explotacion.setfocus()
END IF
end event

type dw_puesta_explotacion from u_sgt_instalaciones within tabpage_solicitud
integer x = 219
integer y = 1120
integer width = 2350
integer height = 312
integer taborder = 21
boolean hscrollbar = true
boolean vscrollbar = true
end type

event itemchanged;call super::itemchanged;int li_contador = 1

if row > 0 then
	if dwo.name = 'identificador_instalacion' then
		// se comprueba que el identificador es $$HEX1$$fa00$$ENDHEX$$nico
		do while li_contador <= This.RowCount() and li_contador > 0
			if li_contador <> row then
				if string(data) = this.GetItemString(li_contador, 'identificador_instalacion') then
					li_contador = -2
				end if
			end if
			
			li_contador ++
		loop
		
		if li_contador < 0 then
			this.setitem(row, 'identificador_instalacion', '')
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El identificador de la instalaci$$HEX1$$f300$$ENDHEX$$n no puede estar repetido.")
			return 2
		end if
		
	end if
	
end if
end event

event losefocus;call super::losefocus;this.AcceptText()
end event

type st_3 from statictext within tabpage_solicitud
integer x = 219
integer y = 1048
integer width = 2350
integer height = 76
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 276856960
boolean enabled = false
string text = " Instalaciones a poner en explotaci$$HEX1$$f300$$ENDHEX$$n"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within tabpage_solicitud
integer x = 1422
integer y = 856
integer width = 73
integer height = 60
integer taborder = 61
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "->"
end type

event clicked;// LFE: Incidencia 0/325553
tab_1.tabpage_solicitud.dw_datos_solicitud.AcceptText()
/////////////////

parent.setredraw(false)

IF il_grande = 1 THEN

	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.x = 64
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.y = 8
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.Width = 2345
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.Height = 844
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.trab_tension.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.subest_movil.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_act_grafica.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_solicitado.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.id_solicitante.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.nom_desc.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.descripcion.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_solicitado_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.id_solicitante_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.nom_desc_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.descripcion_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.gb_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado_o.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo_t.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.agente.visible = false
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.agente_t.visible = false
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
		tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_obligada.visible = false
	end if
	////////////////////////////////////////////////////
	
	this.x = 2424
	this.y = 900
	
	this.text='<-'
	
	tab_1.tabpage_solicitud.dw_datos_solicitud.setcolumn('obs_solicitado')
	tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
	
	il_grande = 0
	
ELSE
		
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.x = 64
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.y = 528
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.Width = 1257
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.Height = 380
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_solicitado.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.id_solicitante.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.nom_desc.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion.visible = true
	IF tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion[1] = 2 then
		tab_1.tabpage_solicitud.dw_datos_solicitud.object.trab_tension.visible = true
	END IF

	tab_1.tabpage_solicitud.dw_datos_solicitud.object.subest_movil.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_act_grafica.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.descripcion.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_solicitado_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.id_solicitante_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.nom_desc_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.descripcion_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado_o.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.estado_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.tipo_descargo_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.gb_t.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.agente.visible = true
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.agente_t.visible = true
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
	   tab_1.tabpage_solicitud.dw_datos_solicitud.object.obs_solicitado.Height = 284
		tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_obligada.visible = true
	end if
	///////////////////////////////////////////////////
	tab_1.tabpage_solicitud.dw_datos_solicitud.setcolumn('obs_solicitado')
	tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
	

	
	this.x = 1344
	this.y = 956
	
	///////////////////////////////////////////////////
	// TIPO INCIDENCIA VERSION UNIFICADA AMR 16/08/2002
	///////////////////////////////////////////////////
	if ib_new_tip_inc then
	   this.y = 856
	end if
	///////////////////////////////////////////////////
	
	il_grande = 1
	
	this.text='->'
	
END IF

this.show()

parent.setredraw(true)
end event

type dw_datos_solicitud from datawindow within tabpage_solicitud
event ue_post_itemchanged ( )
event ue_post_itemchanged_fechas ( )
integer x = 201
integer y = 104
integer width = 2441
integer height = 944
integer taborder = 10
string dataobject = "d_7004_datos_solicitud"
boolean border = false
boolean livescroll = true
end type

event ue_post_itemchanged();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_post_itemchanged
//
// Objetivo: Realizo las validaciones sobre interrupciones
//               para que si hay algo mal salte aqu$$HEX2$$ed002000$$ENDHEX$$antes 
//			   de que termine de definir el descargo.
//			   Se ha realizado un evento de usuario con
//			   el fin de que sean efectivos los setcolumns
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//        Entrada: -- 
//        Salida: --
//
// Devuelve: 
//
// Fecha            Responsable      Actuaci$$HEX1$$f300$$ENDHEX$$ngb_entre
// --------              -----------             ---------
// 03/12/2000	    FDO			    Creacci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////// 
int li_con_interrupcion,  li_indice, li_tension, li_tipo
long ll_respuesta

treeviewitem le_elemento

tab_1.tabpage_solicitud.dw_datos_solicitud.accepttext()

li_con_interrupcion=tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion[1]

IF li_con_interrupcion = 1 then
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.trab_tension.visible =  false
ELSE
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.trab_tension.visible = true
END IF

if li_con_interrupcion =1 then //off
	ib_con_interrupcion=true
	
   //tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()))
  // tab_1.tabpage_interrupciones.gb_1.enabled= true
else //on
   ib_con_interrupcion=false
   IF tab_1.tabpage_interrupciones.dw_interrupcion.RowCount() > 0 then
		ll_respuesta = gnv_msg.f_mensaje("CG20","","",YesNoCancel!) 
		if ll_respuesta = 1 then
			//tab_1.tabpage_interrupciones.dw_interrupcion.Reset	()
			For li_indice = 1 to il_item_hasta 
	
				tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
				le_elemento.StatePictureIndex = 1
				le_elemento.bold = False
				tab_1.tabpage_interrupciones.tv_1.setitem(li_indice, le_elemento)
			NEXT
			
			FOR li_indice = 1 TO tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()
				tab_1.tabpage_interrupciones.dw_interrupcion.deleterow(li_indice)
			NEXT
			//Borro y Contruyo el arbol 
			
			//tab_1.tabpage_interrupciones.tv_1.deleteitem(0)
			//tab_1.tabpage_interrupciones.tv_1.triggerevent('ue_cargar')
			
			tab_1.tabpage_interrupciones.cb_marcar.enabled = false
			tab_1.tabpage_interrupciones.cb_desmarcar.enabled = false
			ib_con_interrupcion=false
		else
			ib_con_interrupcion=true
			tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion[1] = 1
		end if
	ELSE
		if not isnull(gu_comunic1.is_comunic.decval1) then
			ib_con_interrupcion=false	
			// Deselecciono todas las instalaciones que estuvieran seleccionadas		
			For li_indice = 1 to il_item_hasta 
	
				tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
				le_elemento.StatePictureIndex = 1
				le_elemento.bold = False
				tab_1.tabpage_interrupciones.tv_1.setitem(li_indice, le_elemento)
			NEXT
			//tab_1.tabpage_interrupciones.tv_1.deleteitem(0)
			//tab_1.tabpage_interrupciones.tv_1.triggerevent('ue_cargar')
			
			tab_1.tabpage_interrupciones.cb_marcar.enabled = false
			tab_1.tabpage_interrupciones.cb_desmarcar.enabled = false
		END IF
	END IF
end if
this.SetRedraw (false)

SELECT NVL(TENSION,0), NVL(TIPO_INSTALACION,0)
INTO :li_tension, :li_tipo
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :il_instalacion_afect AND
		BDI_JOB = 0;

IF ib_con_interrupcion = false OR &
	(SQLCA.SQLCode = 0 AND gb_operaciones and li_tension <=gi_tension_nivel_min &
	 AND li_tipo <> fgci_tipo_ct ) THEN
	tab_1.tabpage_interrupciones.Text = "Instalaciones"
	tab_1.tabpage_interrupciones.PictureName = "Regenerate!"
ELSE
	tab_1.tabpage_interrupciones.Text = "Interrupciones"	
	tab_1.tabpage_interrupciones.PictureName = "Incorpor.bmp"
	tab_1.tabpage_interrupciones.cb_marcar.visible = TRUE
	tab_1.tabpage_interrupciones.cb_desmarcar.visible = TRUE
	tab_1.tabpage_interrupciones.cb_clientes.visible = TRUE
END IF
this.SetRedraw (true)


end event

event ue_post_itemchanged_fechas;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ue_post_itemchanged_fechas
//
// Objetivo: Realizo las validaciones sobre fechas 
//               para que si hay algo mal salte aqu$$HEX2$$ed002000$$ENDHEX$$antes 
//			   de que termine de definir el descargo.
//			   Se ha realizado un evento de usuario con
//			   el fin de que sean efectivos los setcolumns
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//
//        Entrada: -- 
//        Salida: --
//
// Devuelve: 
//
// Fecha            Responsable      Actuaci$$HEX1$$f300$$ENDHEX$$ngb_entre
// --------              -----------             ---------
// 03/12/2000	    FDO			    Creacci$$HEX1$$f300$$ENDHEX$$n
//		
/////////////////////////////////////////////////////////// 

datetime ldt_inicio, ldt_fin,ldt_solicitud,ldt_null, ldt_hoy
int li_antelacion
int li_hora_inicio, li_hora_descargo, li_diferencia_dias, li_horas



ldt_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado[1]
ldt_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado[1]
ldt_solicitud = tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_solicitado[1]
setnull(ldt_null) 
ldt_hoy = datetime(today(),now() )

SELECT CODIGO
INTO :li_antelacion
FROM SGD_VALOR
WHERE CODIF = 'DS_H';

if not isnull(ldt_inicio) then
		
		li_diferencia_dias = daysAfter(date(ldt_Hoy),date(ldt_inicio))
		li_hora_inicio   = hour(time(ldt_inicio))
		li_hora_descargo = hour (time(ldt_hoy))
		li_horas = (li_diferencia_dias*24)  + (li_hora_inicio - li_hora_descargo)

		if li_horas < li_antelacion then
//		if ldt_solicitud >= ldt_inicio then
			IF li_antelacion = 0 then
				messagebox("Atencion","La solicitud del descargo debe hacerse con antelacion")
			else
				messagebox("Atencion","La solicitud del descargo debe hacerse con " + string(li_antelacion) + " Hora/s de antelacion")
			end if					
      		//gnv_msg.f_mensaje("ED26","","",ok!)
        		//Comprueba que la solicitud del descargo se hace como minimo 24 h por adelantado
//			tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado[1]=ldt_null 
//			tab_1.tabpage_solicitud.dw_datos_solicitud.SetColumn ( "f_ini_solicitado" )
//        		return
//		end if	
//			  gnv_msg.f_mensaje("AD26","","",ok!)
//			  //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio del descargo debe ser mayor que la fecha de la solicitud")
			  tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_ini_solicitado[1]=ldt_null
			  tab_1.tabpage_solicitud.dw_datos_solicitud.SetColumn ( "f_ini_solicitado" )
			  Return
		end if  		
		
end if
	
if  not isnull(ldt_fin) then
		
		if ldt_inicio > ldt_fin then
			gnv_msg.f_mensaje("AD25","","",ok!)
			tab_1.tabpage_solicitud.dw_datos_solicitud.object.f_fin_solicitado[1]=ldt_null
			tab_1.tabpage_solicitud.dw_datos_solicitud.SetColumn ( "f_fin_solicitado" )
			//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de fin del descargo debe ser mayor que la fecha de inicio del mismo")
			Return
		end if  
		
end if
 

end event

event itemchanged;//if dwo.name = "ind_interrupcion" then
//	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion.protect= 1
//	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion.color = rgb(128,128,128)
//end if
if dwo.name = "ind_interrupcion" then 
	this.postevent("ue_post_itemchanged")
end if

if  dwo.name = "f_ini_solicitado" or dwo.name = "f_fin_solicitado" then
	this.postevent("ue_post_itemchanged_fechas")
end if
end event

event itemerror;if dwo.name="f_ini_solicitado" or dwo.name="f_fin_solicitado" or dwo.name="f_solicitado" then
	 gnv_msg.f_mensaje("EG23","","",ok!)
	return 1
end if
end event

event constructor;// Parametrizacion: Luis Ortiz Mayo/2001

fg_ventana_parametro("identificador", This)
end event

event dberror;
messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Se produce el siguiente error al actualizar el descargo: " + sqlerrtext)

return 1
end event

type gb_solicitud_descargo from groupbox within tabpage_solicitud
integer x = 91
integer y = 40
integer width = 2661
integer height = 1408
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Solicitud del Descargo"
end type

type tabpage_otros from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
long backcolor = 79741120
string text = "    Otros    "
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom072!"
long picturemaskcolor = 553648127
dw_datos_solicitud_otros dw_datos_solicitud_otros
end type

on tabpage_otros.create
this.dw_datos_solicitud_otros=create dw_datos_solicitud_otros
this.Control[]={this.dw_datos_solicitud_otros}
end on

on tabpage_otros.destroy
destroy(this.dw_datos_solicitud_otros)
end on

type dw_datos_solicitud_otros from datawindow within tabpage_otros
integer x = 37
integer y = 108
integer width = 2830
integer height = 1192
integer taborder = 40
string dataobject = "d_7004_datos_solicitud_param"
boolean border = false
boolean livescroll = true
end type

type tabpage_interrupciones from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
long backcolor = 79741120
string text = "Interrupciones"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Incorpor.bmp"
long picturemaskcolor = 553648127
st_sel_causa st_sel_causa
st_causa st_causa
cb_otra cb_otra
dw_seleccion dw_seleccion
cb_desmarcar cb_desmarcar
cb_marcar cb_marcar
st_2 st_2
st_1 st_1
tv_1 tv_1
gb_2 gb_2
gb_4 gb_4
dw_interrupcion dw_interrupcion
gb_1 gb_1
dw_seccionadores dw_seccionadores
cb_clientes cb_clientes
cb_eliminar cb_eliminar
gb_causa gb_causa
end type

on tabpage_interrupciones.create
this.st_sel_causa=create st_sel_causa
this.st_causa=create st_causa
this.cb_otra=create cb_otra
this.dw_seleccion=create dw_seleccion
this.cb_desmarcar=create cb_desmarcar
this.cb_marcar=create cb_marcar
this.st_2=create st_2
this.st_1=create st_1
this.tv_1=create tv_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.dw_interrupcion=create dw_interrupcion
this.gb_1=create gb_1
this.dw_seccionadores=create dw_seccionadores
this.cb_clientes=create cb_clientes
this.cb_eliminar=create cb_eliminar
this.gb_causa=create gb_causa
this.Control[]={this.st_sel_causa,&
this.st_causa,&
this.cb_otra,&
this.dw_seleccion,&
this.cb_desmarcar,&
this.cb_marcar,&
this.st_2,&
this.st_1,&
this.tv_1,&
this.gb_2,&
this.gb_4,&
this.dw_interrupcion,&
this.gb_1,&
this.dw_seccionadores,&
this.cb_clientes,&
this.cb_eliminar,&
this.gb_causa}
end on

on tabpage_interrupciones.destroy
destroy(this.st_sel_causa)
destroy(this.st_causa)
destroy(this.cb_otra)
destroy(this.dw_seleccion)
destroy(this.cb_desmarcar)
destroy(this.cb_marcar)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.tv_1)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.dw_interrupcion)
destroy(this.gb_1)
destroy(this.dw_seccionadores)
destroy(this.cb_clientes)
destroy(this.cb_eliminar)
destroy(this.gb_causa)
end on

type st_sel_causa from statictext within tabpage_interrupciones
boolean visible = false
integer x = 1513
integer y = 208
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "mano.cur"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = " Causa :"
boolean focusrectangle = false
end type

event doubleclicked;///////////////////////////////////////////////////////////////////////////
// Evento: doublecliked															
//																									
// Objetivo: Se encarga de abrir la ventana de Seleccio$$HEX1$$f300$$ENDHEX$$n de Causa.														
//																									
//	Entrada:	
//																									
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:																	
//																									
//  Fecha         Resp.          Actuaci$$HEX1$$f300$$ENDHEX$$n											
// ---------     -------        ----------------------------------------	
//	04/07/2005		SGO				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
///////////////////////////////////////////////////////////////////////////

int li_subfamilia, li_familia, li_gpo_causa
string ls_descripcion

SetPointer(HourGlass!)

If fg_verifica_parametro('CAUSAS') Then
	If tab_1.tabpage_solicitud.dw_datos_solicitud.GetRow() > 0 Then
		If tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemNumber( tab_1.tabpage_solicitud.dw_datos_solicitud.GetRow(), "ind_obligada") = 1 Then
			OpenWithParm(w_2301_sel_causa_x_tipo, fgci_incidencia_obligada)
		Else
			OpenWithParm(w_2301_sel_causa_x_tipo, tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemNumber( tab_1.tabpage_solicitud.dw_datos_solicitud.GetRow(), "tipo_descargo"))
		End If
	End If
Else
	Open(w_2301_sel_causa)
End If

If gu_comunic2.is_comunic.longval4 > 0 Then
	
	select subtipo 
	into :li_subfamilia 
	from gi_causa 
	where cod_causa = :gu_comunic2.is_comunic.longval4;
	
	if sqlca.sqlcode <> 0 then 
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No se puede encontrar la Familia de la causa que se ha elegido.",information!,ok!)
	else
		tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(tab_1.tabpage_solicitud.dw_datos_solicitud.GetRow(), "cod_causa", gu_comunic2.is_comunic.longval4)
		tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(tab_1.tabpage_solicitud.dw_datos_solicitud.GetRow(), "fam_causa", li_subfamilia)
		tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(tab_1.tabpage_solicitud.dw_datos_solicitud.GetRow(), "fec_causa", datetime(Today(), Now()))
	end if
	
	// GNU 12-9-2007. Incidencia 0/525907
	IF fg_verifica_parametro('CAUSAS') THEN
		
			select gpo_causa,tipo, subtipo
			into :li_gpo_causa, :li_familia, :li_subfamilia 
			from gi_causa 
			where cod_causa = :gu_comunic2.is_comunic.longval4;

	
	  SELECT "GI_SUBTIPOS"."DESCRIPCION" ||'-'|| "GI_SUBTIPO_CAUSA"."DESCRIPCION" 
	  into :ls_descripcion
    FROM "GI_SUBTIPOS",   
         "GI_SUBTIPO_CAUSA"
   WHERE ( "GI_SUBTIPOS"."TIPO" = "GI_SUBTIPO_CAUSA"."TIPO" ) and  
         ( "GI_SUBTIPOS"."SUBTIPO" = "GI_SUBTIPO_CAUSA"."SUBTIPO" ) 
		 AND "GI_SUBTIPO_CAUSA"."SUBTIPO"= :li_subfamilia 
		 AND "GI_SUBTIPO_CAUSA"."TIPO"= :li_familia
		 AND "GI_SUBTIPO_CAUSA"."GPO_CAUSA"=:li_gpo_causa;
		 gu_comunic2.is_comunic.strval9= ls_descripcion + "-" + gu_comunic2.is_comunic.strval9
		 Parent.st_causa.TEXTSIZE=3
	end if
	// FIN GNU
	
	Parent.st_causa.text = gu_comunic2.is_comunic.strval9

	yield()
End If

end event

type st_causa from statictext within tabpage_interrupciones
boolean visible = false
integer x = 1541
integer y = 288
integer width = 1257
integer height = 168
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type cb_otra from commandbutton within tabpage_interrupciones
boolean visible = false
integer x = 919
integer y = 1040
integer width = 466
integer height = 76
integer taborder = 41
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Otra instalaci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;//Paso al objeto generico de comunicaciones el centro, cmd y mesa del usuario

//if ib_con_interrupcion then // DSA 03/04/2000	
//	if dw_interrupcion.rowcount() > 0 then
//        gnv_msg.f_mensaje("AD33","","",ok!)
//        //messagebox("Error","Debe desmarcar las interrupciones")
//        return
//	end if
//end if	
cb_marcar.enabled = false
cb_desmarcar.enabled = false

if gu_comunic.is_comunic.programa_llamante<>"w_7101_consulta" then 
	gu_comunic.is_comunic.intval1=gi_nro_centro
	gu_comunic.is_comunic.intval2=gi_nro_cmd
	gu_comunic.is_comunic.intval3=gi_nro_puesto
end if 

IF gb_usuario_mant THEN 
	gu_comunic.is_comunic.intval4 = 1 
ELSEIF gb_operador_cmd THEN 
	gu_comunic.is_comunic.intval4 = 2  
ELSE
	gu_comunic.is_comunic.intval4 = 4
end if

gu_comunic.is_comunic.Accion_Llamada="Seleccion"

gu_comunic.is_comunic.strval1="SMT"

openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)

ll_apertura = 1

IF gu_comunic1.is_comunic.decval1 > 0 and gu_comunic1.is_comunic.decval1 <> il_instalacion_afect and fw_ind_seleccion(gu_comunic1.is_comunic.decval1) = 0 THEN 
	IF gb_operaciones AND gb_operaciones_inst=false and ii_descargo_sgi = 1 AND gu_comunic1.is_comunic.intval4 <= fgci_tipo_salida_mt THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada debe ser de baja tensi$$HEX1$$f300$$ENDHEX$$n")
	ELSEIF gb_operaciones AND gb_operaciones_inst=false and ii_descargo_sgi = 0 AND gu_comunic1.is_comunic.intval4 > fgci_tipo_salida_mt THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no puede ser de baja tensi$$HEX1$$f300$$ENDHEX$$n")
	ELSE
		//ii_numero_instalaciones ++
		// LFE - Mejora 1/272575: copiar descargos
		il_otra_inst_afec = gu_comunic1.is_comunic.decval1
		il_tipo_otra_inst_afec = gu_comunic1.is_comunic.intval4
		// LFE - Fin Mejora
		tab_1.tabpage_interrupciones.tv_1.event ue_cargar(2)
		
		if ii_cargada = 0 then
			cb_otra.visible = true
			cb_eliminar.visible=true
		end if
	END IF
ELSEIF gu_comunic1.is_comunic.decval1 <= 0 THEN
	cb_otra.visible = true
ELSE
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n ya ha sido previamente seleccionada.",Information!,okcancel!)
END IF
end event

type dw_seleccion from datawindow within tabpage_interrupciones
boolean visible = false
integer x = 1477
integer y = 1176
integer width = 539
integer height = 160
integer taborder = 30
string dataobject = "dw_bloque_inst_desc"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_desmarcar from commandbutton within tabpage_interrupciones
integer x = 722
integer y = 1180
integer width = 663
integer height = 108
integer taborder = 51
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Desmarcar Interrupci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;int li_indice, li_contador, li_row, li_tipo
treeviewItem le_elemento
s_rama ls_elemento
DataStore ldt_instalaciones, ldt_interrupciones
li_contador =0
if  NOT ib_con_interrupcion then return
ldt_instalaciones = Create DataStore
ldt_interrupciones = Create DataStore
ldt_instalaciones.DataObject = 'dw_bloque_inst_desc'
ldt_interrupciones.DataObject = 'd_7004_fechas_interr'
ldt_instalaciones.Reset()

FOR li_indice = 1 TO il_item_hasta +1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
	ls_elemento = le_elemento.data
	IF le_elemento.StatePictureIndex = 2 THEN
		IF le_elemento.bold = true THEN
			li_row = tab_1.tabpage_interrupciones.dw_interrupcion.find('cod_instalacion = ' + string(ls_elemento.codigo),1,tab_1.tabpage_interrupciones.dw_interrupcion.RowCount())
			dw_interrupcion.deleterow(li_row)
			
//			DELETE FROM "SGD_INTERRUPCION_DESCARGO"  
//   		WHERE ( "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo ) AND  
//         ( "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" = :ls_elemento.codigo )   ;	
//	
//			IF SQLCA.SQLCODE = 0 THEN
				le_elemento.StatePictureIndex = 1
				le_elemento.bold = false
				tab_1.tabpage_interrupciones.tv_1.setitem(li_indice, le_elemento)
//			END IF
		END IF
	END IF
NEXT
cb_marcar.enabled = false
cb_desmarcar.enabled = false



end event

type cb_marcar from commandbutton within tabpage_interrupciones
integer x = 14
integer y = 1180
integer width = 663
integer height = 108
integer taborder = 41
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Marcar Interrupci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;int li_indice, li_contador, li_row, li_tipo
treeviewItem le_elemento
s_rama ls_elemento
datetime ldt_fecha

DataStore ldt_instalaciones, ldt_interrupciones
li_contador =0
li_row=0

if  NOT ib_con_interrupcion then return

ldt_fecha = Datetime(today(),now())
ldt_instalaciones = Create DataStore
ldt_interrupciones = Create DataStore
ldt_instalaciones.DataObject = 'dw_bloque_inst_desc'
ldt_interrupciones.DataObject = 'd_7004_fechas_interr'
ldt_instalaciones.SetTransObject(SQLCA)
SetPointer(HourGlass!)
tab_1.tabpage_solicitud.dw_datos_solicitud.AcceptText()
ldt_instalaciones.Retrieve(il_nro_descargo)
ldt_interrupciones.Reset()
FOR li_indice = 1 TO il_item_hasta +1
	tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
	ls_elemento = le_elemento.data
	IF le_elemento.StatePictureIndex = 2 THEN
		
		li_row = ldt_instalaciones.find('cod_instalacion = ' + string(ls_elemento.codigo),1,ldt_instalaciones.RowCount())

		IF li_row = 0 AND sqlca.sqlcode <> -1 THEN
			
			SELECT "SGD_INSTALACION"."TIPO_INSTALACION"    
			INTO :li_tipo
			FROM "SGD_INSTALACION" 
			WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ls_elemento.codigo AND "SGD_INSTALACION"."BDI_JOB" =0;
			li_contador = ldt_instalaciones.InsertRow(0)
			ldt_instalaciones.SetItem(li_contador,'cod_instalacion',ls_elemento.codigo)
			ldt_instalaciones.SetItem(li_contador,'nro_descargo',il_nro_descargo)
			ldt_instalaciones.SetItem(li_contador,'nom_instalacion',le_elemento.label)
			ldt_instalaciones.SetItem(li_contador,'tipo_instalacion',li_tipo)
			ldt_instalaciones.SetITem(li_contador,'f_inicio',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'))
			ldt_instalaciones.SetITem(li_contador,'f_fin',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'))				
		ELSEIF li_row > 0 THEN 	
			ldt_instalaciones.SetITem(li_row,'f_inicio',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado'))
			ldt_instalaciones.SetITem(li_row,'f_fin',tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_fin_solicitado'))		
		END IF
	END IF
NEXT
ldt_instalaciones.AcceptText()
SetPointer(Arrow!)

OpenWithParm(w_7106_marcar_interrupcion, ldt_instalaciones)

cb_clientes.enabled = false

// Recojo las interrupciones y deselecciono las instalaciones del arbol
ldt_interrupciones = Message.PowerObjectParm
IF ldt_interrupciones.RowCount() > 0 THEN
	FOR li_indice = 1 TO il_item_hasta +1
		tab_1.tabpage_interrupciones.tv_1.getitem(li_indice,le_elemento)
		IF le_elemento.StatePictureIndex = 2 THEN
			le_elemento.StatePictureIndex = 1
			le_elemento.bold = true 
			tab_1.tabpage_interrupciones.tv_1.setitem(li_indice, le_elemento)
		
		END IF
	NEXT
	cb_marcar.enabled = false
	cb_desmarcar.enabled = false
END IF

long ll_cod_instalacion, li_fila

//LI = tab_1.tabpage_interrupciones.dw_interrupcion.RowCount()

FOR li_indice = 1 TO ldt_interrupciones.RowCount()
	ll_cod_instalacion = ldt_interrupciones.GetITemNumber(li_indice,'cod_instalacion')
	li_row = tab_1.tabpage_interrupciones.dw_interrupcion.find('cod_instalacion = ' + string(ll_cod_instalacion),1,tab_1.tabpage_interrupciones.dw_interrupcion.RowCount())	
	IF li_row = 0 AND sqlca.sqlcode <> -1 THEN	
		li_fila=tab_1.tabpage_interrupciones.dw_interrupcion.InsertRow(0)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'nro_descargo',il_nro_descargo)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'cod_instalacion',ll_cod_instalacion)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_inicio',ldt_interrupciones.GetItemDateTime(li_indice,'f_inicio'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_fin',ldt_interrupciones.GetItemDatetime(li_indice,'f_fin'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'f_alta',ldt_fecha)
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'programa','w_7106')
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_fila,'usuario',gs_usuario)
	ELSEIF li_row > 0 THEN
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'f_inicio',ldt_interrupciones.GetItemDateTime(li_indice,'f_inicio'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'f_fin',ldt_interrupciones.GetItemDatetime(li_indice,'f_fin'))
		tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(li_row,'f_alta',ldt_fecha)		
	END IF
NEXT
		
		
//FOR li_indice = 1 TO ldt_interrupciones.RowCount()
//	
//	IF li_row = 0 AND sqlca.sqlcode <> -1 THEN
//		ldt_interrupciones.RowsCopy(li_indice,li_indice, Primary!, tab_1.tabpage_interrupciones.dw_interrupcion, tab_1.tabpage_interrupciones.dw_interrupcion.RowCount(), Primary!)
//	END IF		
//NEXT
//
//ldt_interrupciones.RowsCopy(1,ldt_interrupciones.RowCount(), Primary!, tab_1.tabpage_interrupciones.dw_interrupcion, 1, Primary!)
tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()


end event

type st_2 from statictext within tabpage_interrupciones
integer x = 1541
integer y = 112
integer width = 1157
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_interrupciones
event clicked pbm_bnclicked
integer x = 1513
integer y = 32
integer width = 654
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "Mano.cur"
long textcolor = 16777344
long backcolor = 79741120
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n Descargo "
boolean focusrectangle = false
end type

event doubleclicked;long ll_tvi,ll_nro_instalacion,ll_conta,ll_array[]
treeviewitem lt_item
s_rama ls_elemento

//Paso al objeto generico de comunicaciones el centro, cmd y mesa del usuario

if ib_con_interrupcion then // DSA 03/04/2000	
	If dw_interrupcion.find("cod_instalacion = " + string(il_instalacion_afect),1,dw_interrupcion.rowcount()) > 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n afectada tiene interrupciones que dependen de ella. Elimine las interrupciones para sustituir la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.",information!,ok!)
        return
	end if
	

	ll_tvi = tv_1.FindItem(childtreeitem!, il_handle_sel)
	
	Do while ll_tvi > 0 
		
		tv_1.getitem(ll_tvi,lt_item)
		ls_elemento = lt_item.data
		ll_nro_instalacion = ls_elemento.codigo
	
		If dw_interrupcion.find("cod_instalacion = " + string(ll_nro_instalacion),1,dw_interrupcion.rowcount()) > 0 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n afectada tiene interrupciones que dependen de ella. Elimine las interrupciones para eliminar la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.",information!,ok!)
			return 
		End if
		
		ll_tvi = tv_1.FindItem(nexttreeitem!, ll_tvi)
	Loop
		
end if

/////////////////////////////////////
cb_marcar.enabled = false
cb_desmarcar.enabled = false
//////////////////////////////////////
// VERSION UNIFICADA AMR 06/08/2002
//////////////////////////////////////
cb_clientes.enabled = false
//////////////////////////////////////

if gu_comunic.is_comunic.programa_llamante<>"w_7101_consulta" then 
	gu_comunic.is_comunic.intval1=gi_nro_centro
	gu_comunic.is_comunic.intval2=gi_nro_cmd
	gu_comunic.is_comunic.intval3=gi_nro_puesto
end if 


IF gb_usuario_mant THEN 
        gu_comunic.is_comunic.intval4 = 1 
ELSEIF gb_operador_cmd THEN 
        gu_comunic.is_comunic.intval4 = 2  
ELSE
        gu_comunic.is_comunic.intval4 = 4
end if

gu_comunic1.is_comunic.Accion_Llamada="Seleccion" // DSA 03/04/2000	

openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)

ll_apertura = 1

//Contruyo el arbol

IF gu_comunic1.is_comunic.decval1 > 0  THEN 
	
	IF ii_numero_instalaciones > 0 THEN ii_numero_instalaciones --
	
	
	//Si existe operaciones solo se puede marcar interrupciones en el nivel de tensi$$HEX1$$f300$$ENDHEX$$n que no exista digit. gr$$HEX1$$e100$$ENDHEX$$fica.

	IF gb_operaciones = true then
						
		// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
			
		IF gb_operaciones_inst = true then
			
			ll_array[2] = gu_comunic1.is_comunic.decval1
			
			ii_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[], gu_comunic1.is_comunic.intval4)
			
			IF ii_permito = 0 or ii_permito = -1 then // ii_permito = 1 significa que la instalacion y todos sus hijos estan digitalizados
	
				ii_descargo_sgi = 1
			
			ELSE
				ii_descargo_sgi = 0
			
			END IF
			IF fw_ind_seleccion(gu_comunic1.is_comunic.decval1) = 0  THEN //GNU 28-06-2005
				tab_1.tabpage_interrupciones.tv_1.deleteitem(1)
				st_2.text = ""
			
				tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)
				il_instalacion_afect = gu_comunic1.is_comunic.decval1
			ELSE
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n ya ha sido previamente seleccionada.",Information!,okcancel!)
			END IF
			
			if ib_otras_inst = true then
				cb_otra.visible = true
			end if
		ELSE

			IF gb_operaciones AND ii_numero_instalaciones > 0 AND ii_descargo_sgi = 1 AND gu_comunic1.is_comunic.intval4 <= fgci_tipo_salida_mt THEN
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada debe ser de baja tensi$$HEX1$$f300$$ENDHEX$$n")
				ii_numero_instalaciones ++
			ELSEIF gb_operaciones AND ii_numero_instalaciones > 0 AND ii_descargo_sgi = 0 AND gu_comunic1.is_comunic.intval4 > fgci_tipo_salida_mt THEN
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no puede ser de baja tensi$$HEX1$$f300$$ENDHEX$$n")
				ii_numero_instalaciones ++
			ELSE
				IF fw_ind_seleccion(gu_comunic1.is_comunic.decval1) = 0  THEN //GNU 28-06-2005
					tab_1.tabpage_interrupciones.tv_1.deleteitem(1)
					st_2.text = ""
				
					tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)
					il_instalacion_afect = gu_comunic1.is_comunic.decval1
				ELSE
					messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n ya ha sido previamente seleccionada.",Information!,okcancel!)
				END IF
				
				if ib_otras_inst = true then
					cb_otra.visible = true
				end if
				
				IF gu_comunic1.is_comunic.intval4 <= fgci_tipo_salida_mt THEN
					ii_descargo_sgi = 0
				ELSE
					ii_descargo_sgi = 1
				END IF
			END IF	

		END IF

	ELSE
		IF fw_ind_seleccion(gu_comunic1.is_comunic.decval1) = 0  THEN //GNU 28-06-2005
			tab_1.tabpage_interrupciones.tv_1.deleteitem(1)
			st_2.text = ""
		
			tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)
			il_instalacion_afect = gu_comunic1.is_comunic.decval1
		ELSE
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n ya ha sido previamente seleccionada.",Information!,okcancel!)
		END IF
		if ib_otras_inst = true then
			cb_otra.visible = true
		end if
		
		IF gu_comunic1.is_comunic.intval4 <= fgci_tipo_salida_mt THEN
			ii_descargo_sgi = 0
		ELSE
			ii_descargo_sgi = 1
		END IF
		
	END IF
	


//ELSE
//	cb_otra.visible = false
END IF
//AHM(28/04/2008)
tab_1.tabpage_instalaciones.visible= TRUE
tab_1.tabpage_instalaciones.enabled= TRUE


end event

type tv_1 from uo_man_instalac within tabpage_interrupciones
event ue_cargar ( integer pi_llamada )
event ue_asigna ( )
event ue_desasigna ( )
integer x = 73
integer y = 116
integer width = 1275
integer height = 908
integer taborder = 11
string dragicon = "None!"
fontcharset fontcharset = ansi!
long textcolor = 33554432
long backcolor = 79741120
string picturename[] = {"SUBEST.bmp","Sal_tra1.bmp","CT1.bmp","TRANSFOR.bmp","SALBAJ.bmp"}
string statepicturename[] = {"OFF.BMP","ON.BMP"}
integer ii_aviso_de_calidad_sin_alim = 100
integer ii_aviso_de_calidad_con_alim = 200
integer ii_cmd = 300
integer ii_instalaciones_modificadas = 500
integer ii_instalaciones_interrumpidas = 12164
integer ii_instalaciones_repuestas = 12164
integer ii_cmd_padre = 12164
end type

event ue_cargar(integer pi_llamada);long ll_nro_instalacion,ll_nro_padre
string ls_nom_instalacion, ls_matricula
long ll_handle,ll_tipo,ll_icono,ll_fila
treeviewitem le_elemento
long ll_numero, ll_cantdad_descargos = 1,ll_array[] 
long ll_nro_descargo,ll_co_nivel
int li_tipo_inst
int li_icono,li_permito
datetime ldt_fecha 

Setpointer(HourGlass!)

if gb_operaciones and gb_operaciones_inst then
	// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	

	// LFE - Mejora 1/272575: copiar descargos
	// Comentado por LFE
	//ll_array[2] = il_nro_inst_padre 
	//li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],il_tipo_instalacion)
	// Y sustituido por esto otro
	ll_array[2] = il_otra_inst_afec
	li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],il_tipo_otra_inst_afec)
	// LFE - Fin Mejora 
	IF pi_llamada=2 THEN
		if ii_permito = 0 or ii_permito = -1 then
			if li_permito = 1 or li_permito = 2 then
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Tanto la instalaci$$HEX1$$f300$$ENDHEX$$n afectada del descargo como la a$$HEX1$$f100$$ENDHEX$$adida deben poder ser gestionadas desde el mismo sistema",information!,ok!)
				ii_cargada = -1
				return 
			end if
		else
			if li_permito = 0 or li_permito = -1 then
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Tanto la instalaci$$HEX1$$f300$$ENDHEX$$n afectada del descargo como la a$$HEX1$$f100$$ENDHEX$$adida deben poder ser gestionadas desde el mismo sistema",information!,ok!)
				ii_cargada = -1
				return
			end if
		end if
	end if
else
	li_permito = 0
end if


IF (((gb_operaciones and gu_comunic1.is_comunic.intval6 <=gi_tension_nivel_min AND gu_comunic1.is_comunic.intval4 <> fgci_tipo_ct)  OR &  
	tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion[1] <> 1) and (gb_operaciones_inst = false or li_permito = 1 or li_permito = 2)) then 
	
	// LO TRATA OPERACIONES	O ES SIN INTERRUPCION
	
	tab_1.tabpage_interrupciones.Text = 'Instalaciones'
	tab_1.tabpage_interrupciones.PictureName = "Regenerate!"
	tab_1.tabpage_interrupciones.cb_marcar.visible = False
	tab_1.tabpage_interrupciones.cb_desmarcar.visible = False
	tab_1.tabpage_interrupciones.cb_clientes.visible = False
	tab_1.tabpage_interrupciones.gb_1.visible = False
//	tab_1.tabpage_interrupciones.dw_interrupcion.visible = False
	tab_1.tabpage_instalaciones.visible = False
	tab_1.tabpage_instalaciones.mle_observaciones.Text = ""
	
ELSE
	
	tab_1.tabpage_interrupciones.Text = 'Interrupciones'
	tab_1.tabpage_interrupciones.PictureName = "Incorpor.bmp"
	tab_1.tabpage_interrupciones.cb_marcar.visible = True
	tab_1.tabpage_interrupciones.cb_desmarcar.visible = True
	tab_1.tabpage_interrupciones.cb_clientes.visible = True
	tab_1.tabpage_interrupciones.gb_1.visible = True
	tab_1.tabpage_instalaciones.visible = True

END IF

il_nro_inst_padre = gu_comunic1.is_comunic.decval1

IF il_nro_inst_padre = 0 THEN 
	ii_cargada = -1
	return 
END IF

if NOT ib_con_interrupcion then 
	
	ldt_fecha = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado')
	
	
	SELECT  count(*) INTO :ll_cantdad_descargos
	FROM SGD_DESCARGOS
	WHERE COD_INST_ORIGEN = :il_nro_inst_padre AND
			((F_INI_SOLICITADO<= :ldt_fecha) AND 
			(F_FIN_SOLICITADO> :ldt_fecha)) AND 
			ind_interrupcion = 2 AND 
			nro_descargo <> :il_nro_descargo and
			(ESTADO <> :fgci_descargo_anulado) AND 
			(ESTADO <> :fgci_descargo_finalizado);
	
	if ll_cantdad_descargos > 0 then
		messagebox('Aviso','La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada ya tiene un descargo sin interrupci$$HEX1$$f300$$ENDHEX$$n')
		ii_cargada = -1
		return
	end if
	
end if

 DECLARE cu_arbol1 CURSOR FOR  
  SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
         "SGD_INSTALACION"."NRO_INSTALACION",   
         "SGD_INSTALACION"."TIPO_INSTALACION",
		"SGD_INSTALACION"."TENSION",
		"SGD_CT"."MATRICULA"
    FROM "SGD_INSTALACION",
			 "SGD_CT" 
WHERE  "SGD_INSTALACION"."NRO_INSTALACION" =  :gu_comunic1.is_comunic.decval1 
		AND "SGD_INSTALACION"."BDI_JOB" = 0
		AND "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_CT"."CODIGO"(+) 
		AND  "SGD_INSTALACION"."ESTADO" = 0;

		// FDO Incidencia 0/345236
		
tab_1.tabpage_interrupciones.dw_interrupcion.visible = true 

open cu_arbol1 ;

fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst, :il_tension, :ls_matricula;

il_tipo_instalacion = li_tipo_inst

//______DSA INI 03/04/2000			
if NOT ib_con_interrupcion Then 
	
	string ls_tipo_tension
	
	CHOOSE CASE  li_tipo_inst
			
		case fgci_tipo_subestacion_at,fgci_tipo_salida_at// ALTA
		ls_tipo_tension="ACC_ALTA"
		
		case fgci_tipo_subestacion, fgci_tipo_salida_mt, fgci_tipo_ct // MEDIA 
		ls_tipo_tension="ACC_MEDIA"	
		
		case  fgci_tipo_transformador, fgci_tipo_salida_de_baja// BAJA
		ls_tipo_tension="ACC_BAJA"

	END CHOOSE

	if gu_perfiles.of_acceso_perfil(gi_perfil,"DES_ALTA",ls_tipo_tension)=0 then // SIN ACCESO
		gnv_msg.f_mensaje("AA08","","",OK!)
		close cu_arbol1;
		ii_cargada = -1
		return
	end if
	
end if

//______DSA FIN 03/04/2000			

parent.setredraw(false)

li_icono= f_icono_arbol(li_tipo_inst)
if not isnull(trim(ls_matricula)) then
	ls_nom_instalacion = ls_nom_instalacion + "; Mat.-" + ls_matricula
end if	
if pi_llamada = 1 THEN
	ll_handle = tab_1.tabpage_interrupciones.tv_1.InsertItemfirst( 0, ls_nom_instalacion,li_icono)
	ii_numero_instalaciones++
else
	ll_handle = tab_1.tabpage_interrupciones.tv_1.InsertItemsort( 0, ls_nom_instalacion,li_icono)
	ii_numero_instalaciones++
end if

tab_1.tabpage_interrupciones.tv_1.getitem(ll_handle, le_elemento)
s_elemento.codigo = ll_nro_instalacion
s_elemento.fila = li_tipo_inst
le_elemento.data = s_elemento
le_elemento.StatePictureIndex = 1
tab_1.tabpage_interrupciones.tv_1.setitem(ll_handle, le_elemento)

close cu_arbol1;

IF pi_llamada=1 THEN
	tab_1.tabpage_interrupciones.st_2.text = le_elemento.label
ELSE
	il_otras_inst[upperbound(il_otras_inst[]) + 1] = ll_nro_instalacion
END IF

tab_1.tabpage_interrupciones.tv_1.selectitem(1)

////////////////////////////// 
// A$$HEX1$$f100$$ENDHEX$$adido FDO, otras instalaciones afectadas.
// Cargo mas niveles

IF pi_llamada <> 2 AND is_ventana = 'Resolicitud' THEN

	DECLARE desc_inst_afect CURSOR FOR  
	SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
			"SGD_INSTALACION"."CO_NIVEL",
			"SGD_INSTALACION"."TIPO_INSTALACION", 
			"SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION"
	 FROM "SGD_INSTALACION" ,"SGD_DESCARGOS_INST_AFEC" 
	WHERE "SGD_DESCARGOS_INST_AFEC"."NRO_DESCARGO" =  :il_nro_descargo 
			AND "SGD_INSTALACION"."BDI_JOB" = 0 
			AND "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION" 
			AND "SGD_INSTALACION"."NRO_INSTALACION" <> :il_nro_inst_padre
			AND  "SGD_INSTALACION"."ESTADO" = 0; 
	
	// FDO Incidencia 0/345236
	
	OPEN desc_inst_afect;
	
	FETCH desc_inst_afect into  :ls_nom_instalacion, :ll_co_nivel, :li_tipo_inst,:ll_nro_padre;
	
	DO WHILE sqlca.sqlcode = 0
	
		ll_icono = f_icono_arbol(li_tipo_inst)
		ll_handle = tab_1.tabpage_interrupciones.tv_1.insertitemsort(0,ls_nom_instalacion,ll_icono)
		ii_numero_instalaciones++
		tab_1.tabpage_interrupciones.tv_1.getitem(ll_handle,le_elemento)
		s_elemento.codigo = ll_nro_padre
		s_elemento.fila = 0
		
		// Si existe una interrupcion para esa instalacion se pone en negrilla
		// Y se guarda el numero de fila donde se ha encontrado en interrupciones
		
		if ll_fila > 0 then
			 le_elemento.bold = true
			 s_elemento.fila = ll_fila
		end if
			
		// Actualiza el elemento creado en el arbol
			
		le_elemento.data = s_elemento
		le_elemento.StatePictureIndex = 1
		tab_1.tabpage_interrupciones.tv_1.setitem(ll_handle,le_elemento)			
		il_otras_inst[upperbound(il_otras_inst[]) + 1] = ll_nro_padre
	
		FETCH desc_inst_afect into  :ls_nom_instalacion, :ll_co_nivel, :li_tipo_inst,:ll_nro_padre;
	
	LOOP
	
	CLOSE desc_inst_afect;

	is_ventana = ''

END IF
	
///////////////////////////////////

ii_cargada = 0

parent.setredraw(true)

end event

event ue_asigna;TreeviewItem le_elemento
long ll_newrow, ll_fila 
s_rama s_estructura
datetime ldt_f_inicio, ldt_f_fin  

tab_1.tabpage_interrupciones.tv_1.getitem(il_handle, le_elemento)

le_elemento.bold = true
le_elemento.label = le_elemento.label + "    X"
s_estructura = le_elemento.data
tab_1.tabpage_solicitud.dw_datos_solicitud.accepttext()
ll_fila = tab_1.tabpage_solicitud.dw_datos_solicitud.getrow()
ll_newrow = tab_1.tabpage_interrupciones.dw_interrupcion.InsertRow(0) 
ldt_f_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila,"f_ini_solicitado")
ldt_f_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila,"f_fin_solicitado")
tab_1.tabpage_interrupciones.dw_interrupcion.ScrollToRow(ll_newrow)
tab_1.tabpage_interrupciones.dw_interrupcion.setitem(ll_newrow,"cod_instalacion",long(s_estructura.codigo))
//dw_interrupcion.setitem(ll_newrow,"nro_descargo",dw_datos_solicitud.getitemnumber(1,"nro_descargo"))
tab_1.tabpage_interrupciones.dw_interrupcion.setitem(ll_newrow,"f_alta",today())
//dw_datos_solicitud.setitem(ll_newrow,"cod_inst_origen",il_nro_inst_padre)
tab_1.tabpage_interrupciones.dw_interrupcion.setitem(ll_newrow,"programa",'DESCARGOS')
tab_1.tabpage_interrupciones.dw_interrupcion.setitem(ll_newrow,"f_inicio",ldt_f_inicio)
tab_1.tabpage_interrupciones.dw_interrupcion.setitem(ll_newrow,"f_fin",ldt_f_fin)
tab_1.tabpage_interrupciones.dw_interrupcion.setitem(ll_newrow,"usuario",gs_usuario)
tab_1.tabpage_interrupciones.dw_interrupcion.visible = true
//s_estructura.fila = ll_newrowgse
le_elemento.data = s_estructura
tab_1.tabpage_interrupciones.tv_1.setitem(il_handle, le_elemento)
tab_1.tabpage_interrupciones.dw_interrupcion.AcceptText()
tab_1.tabpage_interrupciones.dw_interrupcion.setfocus()

end event

event ue_desasigna;TreeviewItem le_elemento
long ll_longitud
s_rama s_estructura

//st_2.text = ""	// DSA 27/04/2000	

tab_1.tabpage_interrupciones.tv_1.getitem(il_handle, le_elemento)
le_elemento.bold = false
s_estructura = le_elemento.data 
ll_longitud = len(le_elemento.label)
tab_1.tabpage_interrupciones.dw_interrupcion.deleterow(dw_interrupcion.getrow())
s_estructura.fila = 0
le_elemento.label = Trim(left(le_elemento.label, ll_longitud - 1))
le_elemento.data = s_estructura
tab_1.tabpage_interrupciones.tv_1.setitem(il_handle, le_elemento)
tab_1.tabpage_interrupciones.dw_interrupcion.visible = false
end event

event doubleclicked;long ll_nro_instalacion, ll_handle,ll_inst_unificada=0,ll_instalac[],li_contador
string ls_nom_instalacion,ls_matricula
treeviewitem le_elemento
int li_tipo_inst, li_icono, li_tension,ll_encontrado
int li_tipo_area // GNU 9-7-2007. Mejora 1/440387
Setpointer(HourGlass!)

if handle = 0 then return

if tab_1.tabpage_solicitud.dw_datos_solicitud.object.ind_interrupcion[1] = 2 then return // DSA 03/04/2000

tab_1.tabpage_interrupciones.tv_1.getitem(handle,le_elemento)
s_elemento = le_elemento.data
il_nro_inst_padre = s_elemento.codigo


if le_elemento.level = 3 then
        return
end if

IF le_elemento.expandedonce = true then
        return
end if

parent.setredraw(false)

////Recupero el nivel de instalacion seleccionado
//SELECT "SGD_INSTALACION"."TENSION",
//		 "SGD_INSTALACION"."TIPO_INSTALACION"
//INTO :li_tension,
//	  :li_tipo
//FROM "SGD_INSTALACION"
//WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :il_nro_inst_padre AND "SGD_INSTALACION"."BDI_JOB" =0;
//

// Hay que evaluar de que instalacion se ha abierto la rama
// Si se ha hecho un doble click sobre un ct puedo desplegar el arbol para
// nivel BT si la instalacion afectada esta por encima de CT solo 
// despliego el arbol hasta CT
IF  il_tipo_instalacion = fgci_tipo_ct THEN
	// GNU 9-7-2007. Mejora 1/440387. A$$HEX1$$f100$$ENDHEX$$ado el tipo_area
	//Si es un CT permite desplegar el $$HEX1$$e100$$ENDHEX$$rbol	
	DECLARE cu_arbol2 CURSOR FOR  
	SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
				"SGD_INSTALACION"."NRO_INSTALACION",   
				"SGD_INSTALACION"."TIPO_INSTALACION",
				NVL("SGD_INSTALACION"."NRO_INST_UNIFICADA",0),					  
				"SGD_CT"."MATRICULA",
				"SGD_INSTALACION"."TIPO_AREA"
	FROM "SGD_INSTALACION",
		"SGD_CT" 
	WHERE "SGD_INSTALACION"."NRO_INST_PADRE" =  :il_nro_inst_padre AND
	"SGD_INSTALACION"."ESTADO" = 0 AND "SGD_INSTALACION"."BDI_JOB" =0 AND
	"SGD_INSTALACION"."NRO_INSTALACION" = "SGD_CT"."CODIGO"(+) ;
	
ELSE
	// GNU 9-7-2007. Mejora 1/440387. A$$HEX1$$f100$$ENDHEX$$ado el tipo_area
	 DECLARE cu_arbol1 CURSOR FOR  
	  SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
				  "SGD_INSTALACION"."NRO_INSTALACION",   
				  "SGD_INSTALACION"."TIPO_INSTALACION",
				  NVL("SGD_INSTALACION"."NRO_INST_UNIFICADA",0),				
				  "SGD_CT"."MATRICULA",
				  "SGD_INSTALACION"."TIPO_AREA"
		 FROM "SGD_INSTALACION" ,
		"SGD_CT" 
	WHERE  "SGD_INSTALACION"."NRO_INST_PADRE" =  :il_nro_inst_padre AND
		"SGD_INSTALACION"."ESTADO" = 0 AND
		("SGD_INSTALACION"."TENSION" <=:il_tension ) 
	 AND "SGD_INSTALACION"."BDI_JOB" =0 AND
	"SGD_INSTALACION"."NRO_INSTALACION" = "SGD_CT"."CODIGO"(+) ;
END IF


//if le_elemento.pictureindex <> 3 then
IF il_tipo_instalacion = fgci_tipo_ct THEN
        open cu_arbol2 ;
        fetch cu_arbol2 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst,:ll_inst_unificada,:ls_matricula, :li_tipo_area;
ELSE
        open cu_arbol1 ;
        fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst,:ll_inst_unificada,:ls_matricula, :li_tipo_area;
	
END IF


do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
	
	ll_encontrado = 0
	
	if upperbound(ll_instalac[]) > 0 then
		for li_contador = 1 to upperbound(ll_instalac[])
			if ll_instalac[li_contador] = ll_inst_unificada or ll_instalac[li_contador] = ll_nro_instalacion then 
				ll_encontrado = 1
			end if
		next
	end if
	
	IF ll_inst_unificada > 0 and li_tipo_inst <> fgci_tipo_salida_de_baja  and li_tipo_inst <> fgci_tipo_salida_mt and gi_pais = 8 then // Comprueba inst fict en mold. La instalacion es ficticia.
		
		IF ll_encontrado = 0 then // SI NO ENCUENTRA METEMOS EL ORIGINAL
			  // GNU 9-7-2007. Mejora 1/440387. A$$HEX1$$f100$$ENDHEX$$ado el tipo_area
			  SELECT SGD_INSTALACION.NOM_INSTALACION,  
						  SGD_INSTALACION.NRO_INSTALACION,   
						  SGD_INSTALACION.TIPO_INSTALACION,
						  SGD_CT.MATRICULA     
			  INTO  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst,:ls_matricula, :li_tipo_area
			  FROM SGD_INSTALACION ,
						 SGD_CT 
			  WHERE ( SGD_INSTALACION.NRO_INSTALACION = :ll_inst_unificada AND
							 SGD_INSTALACION.ESTADO = 0 AND 
						 SGD_INSTALACION.NRO_INSTALACION = SGD_CT.CODIGO(+)) ;		
		END IF		  
	END IF
	
	
	IF ll_encontrado = 0 THEN
		
		ll_instalac[upperbound(ll_instalac[])+1] = ll_nro_instalacion
		
		if not isnull(ls_matricula) then
			ls_nom_instalacion = ls_nom_instalacion + "; Mat.-" + ls_matricula
		end if
		
		// GNU 9-7-2007. Mejora 1/440387
		IF il_tipo_instalacion = fgci_tipo_ct and not isnull(li_tipo_area) and li_tipo_area<> 0 THEN
		 	li_icono = f_icono_arbol(li_tipo_inst+ (li_tipo_area * 100) + 1000)
		ELSE
			li_icono = f_icono_arbol(li_tipo_inst)
		END IF
		// FIN GNU
		 ll_handle = tab_1.tabpage_interrupciones.tv_1.insertitemsort(handle,ls_nom_instalacion,li_icono)
		 tab_1.tabpage_interrupciones.tv_1.getitem(ll_handle, le_elemento)
		 s_elemento.codigo = ll_nro_instalacion
		 s_elemento.fila = li_tipo_inst
		 le_elemento.data = s_elemento
		 le_elemento.StatePictureIndex = 1
		 tab_1.tabpage_interrupciones.tv_1.setitem(ll_handle, le_elemento)
	
	END IF
	
	 IF il_tipo_instalacion = fgci_tipo_ct THEN
			fetch cu_arbol2 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst,:ll_inst_unificada,:ls_matricula,:li_tipo_area;
	 ELSE
			fetch cu_arbol1 into  :ls_nom_instalacion, :ll_nro_instalacion ,:li_tipo_inst,:ll_inst_unificada,:ls_matricula,:li_tipo_area;
	 END IF 

	 
loop
//if le_elemento.pictureindex <> 3 then
IF il_tipo_instalacion = fgci_tipo_ct THEN
   close cu_arbol2 ;
ELSE
	close cu_arbol1 ;
END IF
//else
//        close cu_arbol2;
//end if

tab_1.tabpage_interrupciones.tv_1.selectitem(handle)
parent.setredraw(true)

end event

event getfocus;//long ll_fila
//datetime ldt_inicio, ldt_fin, ldt_solicitado
//
//if ib_abierta = false then
//        return
//end if
//
//tab_1.tabpage_solicitud.dw_datos_solicitud.accepttext()
//
//ll_fila = tab_1.tabpage_solicitud.dw_datos_solicitud.getrow()
//
//ldt_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila,"f_ini_solicitado")
//ldt_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila,"f_fin_solicitado")
//ldt_solicitado = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila,"f_solicitado")
//
//if isnull(ldt_inicio) then
//        gnv_msg.f_mensaje("AD23","","",ok!)
//        tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
//        return
//end if
//
//
//if isnull(ldt_fin) then
//        gnv_msg.f_mensaje("AD24","","",ok!)
//        tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
//        return
//
//end if
//
//if isnull(ldt_solicitado) then
//        gnv_msg.f_mensaje("AD38","","",ok!)
//        tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
//        return
//
//end if
//
//if ldt_inicio > ldt_fin then
//        gnv_msg.f_mensaje("AD25","","",ok!)
//        tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
//        return
//end if
//
//if ldt_inicio = ldt_fin then
//        gnv_msg.f_mensaje("AD39","","",ok!)
//        tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
//        return
//end if
//
//if ldt_solicitado > ldt_inicio or ldt_solicitado > ldt_fin then
//        gnv_msg.f_mensaje("AD40","","",ok!)
//        tab_1.tabpage_solicitud.dw_datos_solicitud.setfocus()
//        return
//end if
end event

event rightclicked;treeviewitem le_elemento,le_elemento_h,le_elemento_b,le_elemento_c
s_rama ls_elemento
long ll_retorno, ll_fila, ll_array[],ll_tipo_inst,ll_nro_inst
int li_item,li_item_sel,li_permito
string ls_variable
int li_item_1,li_item_2, li_tv1
treeviewitem  le_elemento_1,le_elemento_2, padre

if  NOT ib_con_interrupcion then return

tab_1.tabpage_interrupciones.tv_1.getitem(handle,le_elemento_c)
ls_variable = classname(le_elemento_c.data)

// FDO Incidencia 0/345237
if  classname(le_elemento_c.data) <> "s_rama" then return 

s_elemento = le_elemento_c.data

ll_nro_inst = s_elemento.codigo

// GNU 29/06/2006. Incidencia 0/437695
//select tipo_instalacion into :ll_tipo_inst from sgd_instalacion where nro_instalacion = :ll_nro_inst;
select tipo_instalacion into :ll_tipo_inst from sgd_instalacion where nro_instalacion = :ll_nro_inst and bdi_job=0;
// FIN GNU

if gb_operaciones and gb_operaciones_inst then
	// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
	ll_array[2] = ll_nro_inst
	li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],ll_tipo_inst)
	//ll_array[2] = il_nro_inst_padre
	//li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],il_tipo_instalacion)
else
	li_permito = 0
end if


IF gb_operaciones_inst = true and (li_permito = 1 or li_permito = 2) then 
	
	// LO TRATA OPERACIONES
	
	tab_1.tabpage_interrupciones.cb_marcar.visible = False
	tab_1.tabpage_interrupciones.cb_desmarcar.visible = False
	tab_1.tabpage_interrupciones.cb_clientes.visible = False
	tab_1.tabpage_interrupciones.gb_1.visible = False
	
	return 
	
ELSE

	tab_1.tabpage_interrupciones.cb_marcar.visible = True
	tab_1.tabpage_interrupciones.cb_desmarcar.visible = True
	tab_1.tabpage_interrupciones.cb_clientes.visible = True
	tab_1.tabpage_interrupciones.gb_1.visible = True

END IF

tab_1.tabpage_interrupciones.tv_1.getitem(handle,le_elemento)

// Si la tecla de control est$$HEX2$$e1002000$$ENDHEX$$pinzada no se eliminan las selecciones anteriores en caso contrario si, siempre que el registro seleccionado se pueda marcar/desamarcar

//IF keyDown(KeyControl!) = FALSE AND handle > 0 AND fw_comprueba_padres_hijos(le_elemento) = 0 THEN
//
//	tab_1.tabpage_interrupciones.tv_1.getitem(il_item_hasta,le_elemento_b)
//	
//	do while li_item <> -1
//	
//		le_elemento_b.StatePictureIndex = 1
//		tab_1.tabpage_interrupciones.tv_1.setitem(le_elemento_b.itemhandle, le_elemento_b)
//		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(previousTreeItem!,le_elemento_b.itemhandle)
//		tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento_b)
//		
//	loop
//	
//	li_item = 0
//	tab_1.tabpage_interrupciones.tv_1.getitem(il_item_hasta,le_elemento_b)
//	
//	do while li_item <> -1
//	
//		le_elemento_b.StatePictureIndex = 1
//		tab_1.tabpage_interrupciones.tv_1.setitem(le_elemento_b.itemhandle, le_elemento_b)
//		li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(nextTreeItem!,le_elemento_b.itemhandle)
//		tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento_b)	
//	loop
//
//END IF 

// GNU 28-06-2005

IF (KeyDown(KeyControl!)= FALSE) AND (handle > 0) THEN
	li_tv1=tab_1.tabpage_interrupciones.tv_1.FindItem(roottreeitem!,0)
	fnu_Poner_Blanco(li_tv1)
END IF

//FIN GNU

li_item = 0

// si est$$HEX2$$e1002000$$ENDHEX$$pulsando la tecla mayusculas puede seleccionar los hijos o puede selecionar un rango

IF keyDown(KeyShift!) AND handle > 0 THEN
	
	li_item_sel = 	tab_1.tabpage_interrupciones.tv_1.finditem(currenttreeitem!,0)
	
	tab_1.tabpage_interrupciones.tv_1.getitem(li_item_sel,	le_elemento_click)

	IF le_elemento.level = le_elemento_click.level and  tab_1.tabpage_interrupciones.tv_1.FindItem(parentTreeItem! , le_elemento_click.itemhandle) = tab_1.tabpage_interrupciones.tv_1.FindItem(parentTreeItem! , le_elemento.itemhandle) THEN
		
		tab_1.tabpage_interrupciones.tv_1.getitem(le_elemento_click.itemhandle,le_elemento_h)		
		
		  IF fw_direccion(le_elemento,le_elemento_h) = 0 then
		  
			DO WHILE (fw_direccion(le_elemento,le_elemento_h) = 0 or le_elemento.label = le_elemento_h.label) AND li_item <> -1
				
				// Comprueba padres hijos del elemento seleccionado

				IF il_item_hasta < le_elemento_h.itemHandle THEN
					il_item_hasta = le_elemento_h.itemHandle
				END IF
				
				IF fw_comprueba_padres_hijos(le_elemento_h) = 0 then

				
					le_elemento_h.StatePictureIndex = 2
					tab_1.tabpage_interrupciones.tv_1.setitem(le_elemento_h.itemhandle, le_elemento_h)
		
				END IF
				
				li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(previousTreeItem! , le_elemento_h.itemhandle)
				tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento_h)
				
			LOOP
		
		ELSE
			
			DO WHILE (fw_direccion(le_elemento,le_elemento_h) = 1 or le_elemento.label = le_elemento_h.label) AND li_item <> -1
				
				// Comprueba padres hijos del elemento seleccionado
				
				IF il_item_hasta < le_elemento_h.itemHandle THEN
					il_item_hasta = le_elemento_h.itemHandle
				END IF
				
				IF fw_comprueba_padres_hijos(le_elemento_h) = 0 then
				
					le_elemento_h.StatePictureIndex = 2
					tab_1.tabpage_interrupciones.tv_1.setitem(le_elemento_h.itemhandle, le_elemento_h)
		
				END IF
				
				li_item = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem! , le_elemento_h.itemhandle)
				tab_1.tabpage_interrupciones.tv_1.getitem(li_item,le_elemento_h)
				
				
			LOOP
									
		END IF
		
	END IF

ELSEIF handle > 0 THEN
	
	IF le_elemento.StatePictureIndex = 1 THEN
		le_elemento.StatePictureIndex = 2
	ELSEIF le_elemento.StatePictureIndex = 2 THEN
		le_elemento.StatePictureIndex = 1
	END IF
	
	tab_1.tabpage_interrupciones.tv_1.setitem(handle, le_elemento)
	
	ll_retorno = fw_puede_seleccionar(le_elemento,le_elemento.level)
	IF ll_retorno = -1 THEN	
		le_elemento.StatePictureIndex = 1
		tab_1.tabpage_interrupciones.tv_1.setitem(handle, le_elemento)
		return
	END IF 
	
	IF il_item_hasta < le_elemento.itemHandle THEN
		il_item_hasta = le_elemento.itemHandle
	END IF
	
END IF


fw_habilitar_botones(le_elemento)

IF handle > 0 THEN
	ls_elemento = le_elemento.data
	le_elemento_click = le_elemento
	if le_elemento.bold = false then
		tab_1.tabpage_interrupciones.dw_interrupcion.visible = false
	else
		ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ls_elemento.codigo) ,1, dw_interrupcion.RowCount( ))
		tab_1.tabpage_interrupciones.dw_interrupcion.visible = true
		tab_1.tabpage_interrupciones.dw_interrupcion.ScrollToRow(ll_fila)
	end if
END IF

end event

event selectionchanged;treeviewitem le_elemento
long ll_longitud, ll_codigo,ll_nro_instalacion, ll_fila
long ll_interrumpido, ll_dias, ll_resto, ll_horas, ll_minutos
string ls_dias = " Dias", ls_horas=" Horas", ls_minutos=" Minutos", ls_tiempo
datetime inicio, final
il_handle = newhandle
s_rama s_estructura

tab_1.tabpage_interrupciones.tv_1.getitem(newhandle,le_elemento)

s_estructura = le_elemento.data
ll_codigo = s_estructura.codigo

if le_elemento.level = 1 and ll_codigo <> il_instalacion_afect and ib_otras_inst = true then
	il_handle_sel = newhandle
	il_instalacion_sel = ll_codigo
	cb_eliminar.enabled=true
else
	cb_eliminar.enabled=false
end if

////Mostrar nombre del instalaci$$HEX1$$f300$$ENDHEX$$n
//if le_elemento.bold = true then
//        ll_longitud = len(le_elemento.label)
//        tab_1.tabpage_interrupciones.st_2.text = Trim(left(le_elemento.label, ll_longitud - 1))
//else
//        tab_1.tabpage_interrupciones.st_2.text = le_elemento.label
//end if

//Si se ha cargado de una datawindow o se ha cargado de la tabla

ll_fila = s_estructura.fila 

//if ll_fila < 1 then
//      ll_fila =       dw_1.find("cod_instalacion = " + string(ll_codigo),1, dw_1.rowcount())
//end if

//hugo serna
//if ll_fila = 0 then
//      dw_interrupcion.visible = false
//else
//              dw_interrupcion.visible = true
//              dw_interrupcion.ScrollToRow(ll_fila)
//              inicio = dw_interrupcion.getitemdatetime(ll_fila,"f_inicio")
//              final = dw_interrupcion.getitemdatetime(ll_fila,"f_fin")
//
//              
//end if
//

//Mostrar datos de la interrupci$$HEX1$$f300$$ENDHEX$$n
if le_elemento.bold = false then
     tab_1.tabpage_interrupciones.dw_interrupcion.visible = false
	 tab_1.tabpage_interrupciones.dw_interrupcion.enabled = false
else
	 ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ll_codigo) + " AND nro_descargo = " + string(il_nro_descargo) ,1, dw_interrupcion.RowCount( ))
	 tab_1.tabpage_interrupciones.dw_interrupcion.visible = true
 	 tab_1.tabpage_interrupciones.dw_interrupcion.enabled = false
	 tab_1.tabpage_interrupciones.dw_interrupcion.ScrollToRow(ll_fila)
	 inicio = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,"f_inicio")
	 final = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,"f_fin")             
end if

end event

event selectionchanging;treeviewitem le_elemento
datetime ldt_inicio, ldt_fin,ldt_sol_inicio, ldt_sol_fin
long ll_fila, ll_fila_datos_solicitud

tab_1.tabpage_interrupciones.tv_1.getitem(oldhandle,le_elemento)

if le_elemento.bold = true then

        tab_1.tabpage_interrupciones.dw_interrupcion.accepttext()
        ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.getrow()
        ldt_inicio = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,"f_inicio")
        ldt_fin = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,"f_fin")

        tab_1.tabpage_solicitud.dw_datos_solicitud.accepttext()
        ll_fila_datos_solicitud = tab_1.tabpage_solicitud.dw_datos_solicitud.getrow()
        ldt_sol_inicio = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila_datos_solicitud,"f_ini_solicitado")
        ldt_sol_fin = tab_1.tabpage_solicitud.dw_datos_solicitud.getitemdatetime(ll_fila_datos_solicitud,"f_fin_solicitado")

        if isnull(ldt_inicio) then
                gnv_msg.f_mensaje("AD27","","",ok!)
//              messagebox("Error","Fecha de Inicio nula")
                return 1
        end if

        if isnull(ldt_fin) then
                gnv_msg.f_mensaje("AD28","","",ok!)
//              messagebox("Error","Fecha de fin nula")
                return 1
        end if

        if ldt_inicio > ldt_fin then
                gnv_msg.f_mensaje("AD41","","",ok!)
//              messagebox("Error","La fecha de inicio de la interrupcion debe ser menor que la fecha final de la interrupcion")
                return 1
        end if

        if ldt_inicio = ldt_fin then
                gnv_msg.f_mensaje("AD39","","",ok!)
//              messagebox("Error","La fechas de inicio y final de la interrupcion no pueden ser iguales")
                return 1
        end if

        if ldt_inicio < ldt_sol_inicio then
                gnv_msg.f_mensaje("AD29","","",ok!)
//              messagebox("Error","La fecha de inicio de la interrupcion ha de ser mayor o igual que la fecha de inicio del descargo")
                return 1
        end if

        if ldt_fin > ldt_sol_fin then
                gnv_msg.f_mensaje("AD30","","",ok!)
//              messagebox("Error","La fecha de fin de la interrupcion ha de ser menor o igual que la fecha de fin del descargo")
                return 1
        end if

end if

if il_error = 1 then return 1
end event

event rightdoubleclicked;call super::rightdoubleclicked;
RETURN -1

end event

event clicked;call super::clicked;treeviewitem le_elemento
s_rama ls_elemento
long  ll_fila

IF handle > 0 THEN
	tab_1.tabpage_interrupciones.tv_1.getitem(handle,le_elemento)
	tab_1.tabpage_interrupciones.tv_1.getitem(handle,le_elemento_click)
	ls_elemento = le_elemento.data
	
	///////////////////////////////////////
	// VERSION UNIFICADA AMR 05/08/2002
	///////////////////////////////////////
	
	tab_1.tabpage_interrupciones.cb_clientes.enabled = true
	
	///////////////////////////////////////
	
	IF le_elemento.bold = false THEN
		tab_1.tabpage_interrupciones.dw_interrupcion.visible = false
	ELSE
		ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ls_elemento.codigo) ,1, dw_interrupcion.RowCount( ))
		IF ll_fila > 0 THEN
			tab_1.tabpage_interrupciones.dw_interrupcion.visible = true
			tab_1.tabpage_interrupciones.dw_interrupcion.ScrollToRow(ll_fila)
		END IF
	END IF
ELSE
   ///////////////////////////////////////
	// VERSION UNIFICADA AMR 05/08/2002
	///////////////////////////////////////
	
	tab_1.tabpage_interrupciones.cb_clientes.enabled = false
	
	///////////////////////////////////////
		
END IF

//dw_seccionadores.retrieve(long(ls_elemento.codigo))
end event

type gb_2 from groupbox within tabpage_interrupciones
integer x = 1445
integer y = 48
integer width = 1417
integer height = 164
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_4 from groupbox within tabpage_interrupciones
integer x = 18
integer y = 44
integer width = 1371
integer height = 1088
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = " Instalaciones Afectadas "
end type

type dw_interrupcion from datawindow within tabpage_interrupciones
event losefocus pbm_dwnkillfocus
event rowfocuschanged pbm_dwnrowchange
integer x = 1499
integer y = 540
integer width = 1358
integer height = 192
integer taborder = 31
string dataobject = "d_7004_fechas_interr"
boolean border = false
boolean livescroll = true
end type

event dberror;//long ll_error,i_sql_ok
//string msg_error
//
//msg_error = sqlerrtext
//ll_error = sqldbcode
//  IF ll_error <> 0 THEN
//
//              CHOOSE CASE ll_error
//                      CASE 1407,1400
//                                      gnv_msg.f_mensaje("EG05","la tabla sgd_interrupcion_descargos  ","",OK!)
//               CASE ELSE 
//                                      MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
//        END CHOOSE
//                gnu_u_transaction.uf_rollback();
//
//               RETURN 1
//  END IF
end event

event itemchanged;//datetime inicio, final, inicio_sol, final_sol, ldt_nula
//long ll_interrumpido
//
//dw_interrupcion.AcceptText()
//inicio = dw_interrupcion.getitemdatetime(row,"f_inicio")
//final = dw_interrupcion.getitemdatetime(row,"f_fin")
//inicio_sol = dw_datos_solicitud.getitemdatetime(1,"f_ini_solicitado")
//final_sol = dw_datos_solicitud.getitemdatetime(1,"f_fin_solicitado")
//
//ib_error = true
//SetNull(ldt_nula)
//
//if double_click = false then
//
//      if inicio < inicio_sol then
//              Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de la interrupci$$HEX1$$f300$$ENDHEX$$n es menor que la fecha de inicio de la solicitud",exclamation!)
//              dw_interrupcion.setfocus()      
//      end if
//      
//      if final > final_sol then
//              messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha del final de la interrupcion es mayor que la del final solicitado",exclamation!)
//              dw_interrupcion.setfocus()      
//      end if
//      
//      if final < inicio then
//              messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El inicio de la interrupcion es mayor que el final de la interrupcion",exclamation!)
//              dw_interrupcion.setfocus()      
//      end if
//      
////    if isnull(inicio) then
////            messagebox("Error","La fecha inicio de la interrupcion no es valida")
////            dw_interrupcion.setfocus()      
////            return
////    end if
////    
////    if isnull(final) then
////            messagebox("Error","La fecha final de la interrupcion no es valida")
////            dw_interrupcion.setfocus()      
////            return
////    end if
//      
//      if final = inicio then
//              messagebox("Error","Las fechas de inicio y fin de la interrupcion no pueden ser iguales")
//              dw_interrupcion.setfocus()      
//      end if
//
//end if
//
//ib_error = false

//
//il_error = 0 
//
//
//
//
//
end event

event itemerror;if dwo.name="f_inicio" or dwo.name="f_fin"  then
	 gnv_msg.f_mensaje("EG23","","",ok!)
	return 1
end if
end event

type gb_1 from groupbox within tabpage_interrupciones
integer x = 1454
integer y = 488
integer width = 1413
integer height = 268
integer taborder = 21
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Intervalo Horario"
end type

type dw_seccionadores from u_seccionador within tabpage_interrupciones
boolean visible = false
integer x = 1499
integer y = 800
integer width = 1321
integer height = 324
integer taborder = 11
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;call super::itemchanged;//dw_seccionadores.accepttext()
//
//if dw_seccionadores.object.selec[row] = '0' then
//	mle_observaciones.Scroll(2)
//	mle_observaciones.text= mle_observaciones.text + string(dw_seccionadores.object.codigo[row])  + " " + dw_seccionadores.object.localizacion[row] + ".~r~n"
//end if
end event

type cb_clientes from commandbutton within tabpage_interrupciones
integer x = 14
integer y = 1316
integer width = 663
integer height = 108
integer taborder = 71
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Clientes Afectados"
end type

event clicked;/////////////////////////////////////
// VERSION UNIFICADA AMR 05/08/2002
/////////////////////////////////////


treeviewItem le_elemento

s_rama ls_elemento
s_grupo_int sw_datos
long ll_fila

tab_1.tabpage_interrupciones.tv_1.getitem(il_handle, le_elemento)

ls_elemento = le_elemento.data

sw_datos.nro_instalacion = ls_elemento.codigo
// GNU 1-08-2005
sw_datos.nro_instalacion_int [1]= ls_elemento.codigo

//If tab_1.tabpage_interrupciones.dw_interrupcion.rowcount() = 0 then
//  sw_datos.inicio[1] = tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemDatetime(1,'f_ini_solicitado')
//else
//	ll_fila = tab_1.tabpage_interrupciones.dw_interrupcion.Find("cod_instalacion = " + string(ls_elemento.codigo) ,1, dw_interrupcion.RowCount( ))
//  	IF ll_fila > 0 then 
//		sw_datos.inicio[1] = tab_1.tabpage_interrupciones.dw_interrupcion.getitemdatetime(ll_fila,'f_inicio')
//	end if
//end if

// Fin GNU

if isnull(ls_elemento.codigo) then
	messagebox('AVISO','El codigo de la instalaci$$HEX1$$f300$$ENDHEX$$n no es correcto, revise la selecci$$HEX1$$f300$$ENDHEX$$n')
else

   OpenWithParm(w_ver_sum_importantes, sw_datos)
end if






end event

type cb_eliminar from commandbutton within tabpage_interrupciones
boolean visible = false
integer x = 503
integer y = 1040
integer width = 398
integer height = 76
integer taborder = 71
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Eliminar inst."
end type

event clicked;long ll_tvi,ll_nro_instalacion,ll_conta
treeviewitem lt_item
s_rama ls_elemento

if il_instalacion_afect = il_instalacion_sel then
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No es posible eliminar la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.",information!,ok!)
else
	ll_tvi = tv_1.FindItem(childtreeitem!, il_handle_sel)
	
	If dw_interrupcion.find("cod_instalacion = " + string(il_instalacion_sel) ,1,dw_interrupcion.rowcount()) > 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n afectada tiene interrupciones que dependen de ella. Elimine las interrupciones para eliminar la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.",information!,ok!)
		return 
	End if
	
	Do while ll_tvi > 0 
		
		tv_1.getitem(ll_tvi,lt_item)
		ls_elemento = lt_item.data
		ll_nro_instalacion = ls_elemento.codigo
	
		If dw_interrupcion.find("cod_instalacion = " + string(ll_nro_instalacion),1,dw_interrupcion.rowcount()) > 0 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n afectada tiene interrupciones que dependen de ella. Elimine las interrupciones para eliminar la instalaci$$HEX1$$f300$$ENDHEX$$n afectada.",information!,ok!)
			return 
		End if
		
		ll_tvi = tv_1.FindItem(nexttreeitem!, ll_tvi)
	Loop
   
	
	For ll_conta = 1 to upperbound(il_otras_inst[]) 
		IF il_otras_inst[ll_conta] = il_instalacion_sel THEN
			il_otras_inst[ll_conta] = 0
		END IF
	next
	
	tv_1.deleteitem(il_handle_sel)
		
	ii_numero_instalaciones --
	
end if


end event

type gb_causa from groupbox within tabpage_interrupciones
boolean visible = false
integer x = 1445
integer y = 224
integer width = 1417
integer height = 256
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
end type

type tabpage_int_simulacion from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
long backcolor = 79741120
string text = "Interrupciones"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Incorpor.bmp"
long picturemaskcolor = 553648127
dw_int_simulacion dw_int_simulacion
end type

on tabpage_int_simulacion.create
this.dw_int_simulacion=create dw_int_simulacion
this.Control[]={this.dw_int_simulacion}
end on

on tabpage_int_simulacion.destroy
destroy(this.dw_int_simulacion)
end on

type dw_int_simulacion from u_info_int_descargo within tabpage_int_simulacion
integer x = 14
integer y = 16
integer width = 2999
integer height = 1520
integer taborder = 11
boolean bringtotop = true
end type

type tabpage_historial from userobject within tab_1
boolean visible = false
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
long backcolor = 79741120
string text = "Historial"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "ScriptYes!"
long picturemaskcolor = 553648127
uo_historial uo_historial
end type

on tabpage_historial.create
this.uo_historial=create uo_historial
this.Control[]={this.uo_historial}
end on

on tabpage_historial.destroy
destroy(this.uo_historial)
end on

type uo_historial from uo_historial_descargos within tabpage_historial
integer x = 14
integer y = 16
integer taborder = 41
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_historial.destroy
call uo_historial_descargos::destroy
end on

type tabpage_instalaciones from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
long backcolor = 79741120
string text = "Instalaciones a Descargar"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "PasteStatement!"
long picturemaskcolor = 553648127
mle_observaciones mle_observaciones
gb_6 gb_6
end type

on tabpage_instalaciones.create
this.mle_observaciones=create mle_observaciones
this.gb_6=create gb_6
this.Control[]={this.mle_observaciones,&
this.gb_6}
end on

on tabpage_instalaciones.destroy
destroy(this.mle_observaciones)
destroy(this.gb_6)
end on

type mle_observaciones from multilineedit within tabpage_instalaciones
integer x = 50
integer y = 100
integer width = 2802
integer height = 1248
integer taborder = 61
boolean bringtotop = true
integer textsize = -7
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
end type

type gb_6 from groupbox within tabpage_instalaciones
integer x = 9
integer y = 24
integer width = 2880
integer height = 1360
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Instalaciones a descargar:"
end type

type tabpage_accion from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3031
integer height = 1568
boolean enabled = false
long backcolor = 79741120
string text = "Aprobar  "
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom038!"
long picturemaskcolor = 553648127
uo_1 uo_1
end type

on tabpage_accion.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_accion.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_historial_descargos within tabpage_accion
integer x = 14
integer y = 36
integer taborder = 41
boolean bringtotop = true
boolean border = false
long backcolor = 79741120
end type

on uo_1.destroy
call uo_historial_descargos::destroy
end on

type gb_5 from groupbox within w_7106_solicitud_descargos
integer x = 1454
integer y = 220
integer width = 1413
integer height = 268
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Intervalo Horario"
end type


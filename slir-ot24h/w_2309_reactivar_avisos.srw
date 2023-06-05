HA$PBExportHeader$w_2309_reactivar_avisos.srw
forward
global type w_2309_reactivar_avisos from w_sgigenerica
end type
type cb_reactivar from commandbutton within w_2309_reactivar_avisos
end type
type cb_cancelar from commandbutton within w_2309_reactivar_avisos
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2309_reactivar_avisos
end type
type cb_buscar from commandbutton within w_2309_reactivar_avisos
end type
type d_filtro_aviso from u_avi_2030_pr_filtro_aviso within w_2309_reactivar_avisos
end type
type cb_observaciones from commandbutton within w_2309_reactivar_avisos
end type
type dw_1 from datawindow within w_2309_reactivar_avisos
end type
type cb_1 from commandbutton within w_2309_reactivar_avisos
end type
type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within w_2309_reactivar_avisos
end type
type dw_usuarios from u_avi_2034_pr_usuario_telegestiones within w_2309_reactivar_avisos
end type
end forward

global type w_2309_reactivar_avisos from w_sgigenerica
integer width = 3657
integer height = 2060
string title = "Reactivar Avisos"
long backcolor = 79741120
event ue_armar_sql pbm_custom21
event ue_retrieve pbm_custom22
event ue_buscar pbm_custom23
cb_reactivar cb_reactivar
cb_cancelar cb_cancelar
d_ambito d_ambito
cb_buscar cb_buscar
d_filtro_aviso d_filtro_aviso
cb_observaciones cb_observaciones
dw_1 dw_1
cb_1 cb_1
d_lista_aviso d_lista_aviso
dw_usuarios dw_usuarios
end type
global w_2309_reactivar_avisos w_2309_reactivar_avisos

type variables
u_generico_comunicaciones lu_comunic
u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu
u_avi_2004_pr_form_inf_resumen iu_avi_2004_pr

string is_select_original, is_filtro_ambito
string is_from, is_where
int ii_fila_ant

// Ambito del usuario
long il_centro_usu, il_cmd_usu, il_mesa_usu

datawindowchild ldwch_co_alc, ldwch_tip_avi, ldwch_prioridad,ldwch_est_aviso

boolean ib_accion_nueva = false
boolean ib_abierta = true
int ii_fila_clickeada
string is_modify_ext
end variables

forward prototypes
public function integer fw_cargarestados ()
end prototypes

event ue_armar_sql;string is_modificacion, ls_operacion, ls_cl_duracion, ls_duracion,ls_filtro_usuario
string is_clausula_where, ls_select, ls_from, ls_where,is_filtro_deteccion, is_filtro_alimentacion,ls_blanco = ""
string retorno, ls_filtro_nro_desde_hasta,ls_usuario

int li_duracion, li_tiempo,li_pos1,li_pos2

d_ambito.accepttext()
d_filtro_aviso.Accepttext()

//********************************************************************//
//							  ARMO EL FILTRO PARA EL NRO DE AVISO            //
//********************************************************************//

if isnull(d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta"))  then 
   d_filtro_aviso.setitem(1,"nro_aviso_hasta", 0)   
end if
if isnull(d_filtro_aviso.getitemnumber(1,"nro_aviso_desde")) then
	d_filtro_aviso.setitem(1,"nro_aviso_desde", 0)   
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") < 0  or d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") < 0  then 
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Los N$$HEX1$$fa00$$ENDHEX$$meros del rango de avisos no pueden ser menores que 0.")
	return
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") = 0  and d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") <> 0  then
   d_filtro_aviso.setitem(1,"nro_aviso_hasta", d_filtro_aviso.getitemnumber(1,"nro_aviso_desde"))
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") = 0  and d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") <> 0  then
  if d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") > 100 then
     d_filtro_aviso.setitem(1,"nro_aviso_desde", d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta"))
 else
     d_filtro_aviso.setitem(1,"nro_aviso_desde", 1)
end if
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") - d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") > 100 then
   d_filtro_aviso.setitem(1,"nro_aviso_hasta", d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") + 100)
end if	
If d_filtro_aviso.getitemnumber(1,"nro_aviso_hasta") < d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") then
	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El N$$HEX1$$fa00$$ENDHEX$$mero 'desde' del rango de avisos no puede ser mayor que el n$$HEX1$$fa00$$ENDHEX$$mero 'hasta'.")
	return
end if		
If d_filtro_aviso.getitemnumber(1,"nro_aviso_desde") > 0 then
	d_filtro_aviso.object.ai_clase_aviso[1] = 101
	d_filtro_aviso.object.ai_tipo[1] = fgci_todos
	d_filtro_aviso.object.ai_alcance[1] = fgci_todos
	d_filtro_aviso.object.ai_alimentacion[1] = fgci_todos
	d_filtro_aviso.object.ai_duracion[1] = 0
	//d_ambito.object.nro_centro[1] = fgci_todos
	//d_ambito.object.nro_cmd[1] = fgci_todos
	//d_ambito.object.nro_mesa[1] = fgci_todos
end if

ls_filtro_nro_desde_hasta = d_filtro_aviso.fnu_cargar_nro_aviso()


//********************************************************************//
//                     ARMO EL FILTRO PARA EL AMBITO                  //
//********************************************************************//


is_filtro_ambito = d_ambito.fnu_filtro_ambito(d_ambito.getitemnumber(1,"nro_centro"), & 
															 d_ambito.getitemnumber(1,"nro_cmd") ,     &
															 d_ambito.getitemnumber(1,"nro_mesa")) // Parte del where para el ambito

is_filtro_ambito = trim(is_filtro_ambito)

//********************************************************************//
//                     ARMO EL FILTRO PARA EL PERIODO                 //
//********************************************************************//

ls_usuario = dw_usuarios.object.nro_usuario[1]

li_pos1 = pos(ls_usuario,'<',1)
li_pos2 = pos(ls_usuario,'>',1)

If li_pos1 > 0 and li_pos2 > 0 then
	ls_filtro_usuario = ' '
ELSE
	ls_filtro_usuario = " AND UPPER(NRO_TELEFONISTA) = UPPER('" + dw_usuarios.object.nro_usuario[1] + "') "
END IF	
	
//is_filtro_deteccion = d_deteccion.fnu_filtro_deteccion(d_deteccion.getitemdatetime(1,"desde"),d_deteccion.getitemdatetime(1,"hasta")) // Parte del where para deteccion
is_filtro_Alimentacion = d_filtro_aviso.fnu_filtrar_avisos() // parte del Where del resto de la Consulta

is_filtro_alimentacion = trim(is_filtro_alimentacion)

is_clausUla_where = ""

if is_filtro_ambito <> ls_blanco then
	is_clausula_where = is_clausula_where + " AND " + is_filtro_ambito 
end if

////********************************************************************//
////              AGREGO EL FILTRO DEL PERIODO A LA SELECT              //
////********************************************************************//
//
//if is_filtro_deteccion <> ls_blanco then
//	if is_filtro_ambito <> ls_blanco then
//		is_clausula_where = is_clausula_where +  " AND " 	+ is_filtro_deteccion 
//	else
//		is_clausula_where = is_clausula_where + is_filtro_deteccion
//	end if
//end if
//
////**********************************************************************//

if is_filtro_alimentacion <> ls_blanco then
		is_clausula_where = is_clausula_where +  " AND " + is_filtro_alimentacion
end if

if len(ls_filtro_nro_desde_hasta) > 1 then
	is_clausula_where = is_clausula_where + " AND " + ls_filtro_nro_desde_hasta 
end if
//ACO

ls_operacion= d_filtro_aviso.object.operacion[1]
li_tiempo= d_filtro_aviso.object.tiempo[1]
li_duracion=d_filtro_aviso.getitemnumber(1,"ai_duracion")
ls_duracion=string(li_duracion)


if li_tiempo=2 then
	ls_duracion= string(li_duracion*60)
elseif li_tiempo=3 then
	ls_duracion= string(li_duracion*60*24)
end if

if li_duracion > 0 then 
 ls_cl_duracion= " fg_duracion_int( GI_AVISOS.F_ALTA,GI_AVISOS.FECHA_RES) " + ls_operacion + " " + ls_duracion
 is_clausula_where=is_clausula_where + " and " + ls_cl_duracion
end if

is_clausula_where = is_clausula_where + ls_filtro_usuario
//********************************************************************//
//                     CAMBIO EL SELECT A LA DATAWINDOW               //
//********************************************************************//

is_modificacion = "DataWindow.table.Select=~"" + is_select_original + is_clausula_where + "~""

retorno = d_lista_aviso.modify(is_modificacion)

//d_lista_aviso.settransobject(sqlca)
//this.triggerevent("ue_retrieve")
//
//IF d_lista_aviso.RowCount() = 0 THEN
//	if ib_abierta = false then
//		gnv_msg.F_mensaje("ER67","","",oK!)	
//		close(this)
//	else
//		gnv_msg.F_mensaje("AB02","","",oK!)	
//		this.setredraw(true)
//	end if
//else
//	ib_abierta = true
//END IF
//
end event

event ue_retrieve;DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo


d_lista_aviso.Reset()
d_lista_aviso.Retrieve()
d_filtro_aviso.setitem(1,"ai_reg_seleccionados", d_lista_aviso.rowcount())

IF d_lista_aviso.RowCount() > 0 THEN
	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//		dw_1.GetChild ("data_1",dw_datos)
		
		//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
		ls_titulo = 'Listado de Avisos'
		ll_longitud = len (ls_titulo)*100
		
		dw_1.modify("nulo_desde.visible = '0")
		dw_1.modify("f_desde.visible='0'")
		dw_1.modify("desde.Visible='0'")
		dw_1.modify("nulo_hasta.visible = '0'")
		dw_1.modify("f_hasta.visible='0'")
		dw_1.modify("hasta.Visible='0'")
		
		// si no son nulas las inserto
		dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
		dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
		dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
		dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
		
//		d_lista_aviso.ShareData(dw_datos)
		d_lista_aviso.setredraw(true)
	
END IF
end event

event ue_buscar;This.triggerevent("ue_armar_sql")
This.triggerevent("ue_retrieve")

d_ambito.AcceptText()

IF d_lista_aviso.RowCount() > 0 THEN
	d_lista_aviso.SelectRow(1,TRUE)
	// DSA INI 7/08/2000
	//	cb_reactivar.enabled = true
	if gu_perfiles.of_acceso_perfil(gi_perfil,'RAV_REACTIVAR','ACC_MANTEN') =1 THEN	
		cb_reactivar.Enabled = TRUE
		cb_observaciones.Enabled = TRUE
	end if
	// DSA FIN 7/08/2000
ELSE
	cb_reactivar.enabled = false
	cb_observaciones.Enabled = FALSE
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","No existe ning$$HEX1$$fa00$$ENDHEX$$n aviso improcedente con los criterios seleccionados",information!,ok!)
END IF

end event

public function integer fw_cargarestados ();//************************************************************************************//
// Descripci$$HEX1$$f300$$ENDHEX$$n : Borra los estados que sobran del ddlb de estados e incluye el estado //
//					  resuelto.	Mejora 1/353285.																			  //
//	Par$$HEX1$$e100$$ENDHEX$$metros	: -																						  //
// Devuelve    :  1 -> Correcto.																		  //
//					  -1 -> Error.																			  //
// Autor       : AHM.																					  //
// Fecha       : 10/06/2009																			  //
//************************************************************************************//


d_filtro_aviso.Modify("ai_estado.Values='Resuelto~t5/Improcedente~t6'")


RETURN 1
end function

event open;call super::open;//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
String ls_modify_ext = ""
//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************

// permite reactivar1 los avisos improcedentes

// gu_comunic.is_Comunic.intval1 = centro
//								 intval2 = cmd
//								 intval3 = puesto
//COMPROBAR EL PERFIL
	if gu_perfiles.of_acceso_perfil(gi_perfil,'RAV_REACTIVAR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
		cb_reactivar.Enabled = TRUE
	end if
// Muestro el reloj al abrir la ventana
	SetPointer(HourGlass!)
	this.setredraw(false)

// Coloco la ventana en la posici$$HEX1$$f300$$ENDHEX$$n adecuada
	fg_colocar_ventana_main(w_2309_reactivar_avisos)

// Creo el objeto de comunicaciones
	lu_comunic = CREATE u_generico_comunicaciones
	iu_cen_2001_nu = CREATE u_cen_2001_nu_form_centro_cmd_mesa
	iu_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen
	lu_comunic.is_comunic = gu_comunic.is_comunic

// Pongo el t$$HEX1$$ed00$$ENDHEX$$tulo de la ventana
	This.Title = lu_comunic.f_titulo_ventana("w_2309","React_avisos.")
	
// Guardo el $$HEX1$$e100$$ENDHEX$$mbito del usuario
	il_centro_usu = lu_comunic.is_comunic.intval1
	il_cmd_usu = lu_comunic.is_comunic.intval2
	il_mesa_usu = lu_comunic.is_comunic.intval3

// Inicializo objetos de trabajo
	d_ambito.fpr_crea_dddw()
	d_ambito.f_insertar_fila()
	d_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1, &
										 lu_comunic.is_comunic.intval2, &
										 lu_comunic.is_comunic.intval3, 0)

										 
dw_usuarios.object.nro_usuario.width = 654
dw_usuarios.insertrow(0)
dw_usuarios.fnu_crea_dropdown()
// GNU 10-11-2005 Incidencia 0/383236
datawindowchild dddw_usuarios_telegestiones
dw_usuarios.GetChild('nro_usuario',dddw_usuarios_telegestiones)
dddw_usuarios_telegestiones.SetTransObject(SQLCA)
dddw_usuarios_telegestiones.retrieve(gi_nro_centro,gi_nro_cmd)
dddw_usuarios_telegestiones.insertrow(1)
dddw_usuarios_telegestiones.setitem(1,"gi_usuario_sgi_nom_usuario",'<Todos>')
dddw_usuarios_telegestiones.setitem(1,"gi_usuario_sgi_usuario",'<Todos>')
// FIN GNU
dw_usuarios.setitem(1,"nro_usuario",'<Todos>')

//	d_ambito.fnu_filtrar_cmd(d_ambito,lu_comunic.is_comunic.intval1)
//	d_ambito.fnu_filtro_mesa_nuevo(d_ambito,lu_comunic.is_comunic.intval2)
//	iu_cen_2001_nu.fnu_cargar_estructura(d_ambito,lu_comunic.is_comunic.intval1, &
//											lu_comunic.is_comunic.intval2, &
//											lu_comunic.is_comunic.intval3)
											
//CHOOSE CASE lu_comunic.is_comunic.accion_llamada
//	CASE "Centro"
//		d_ambito.fnu_deshab_centro(d_ambito)
//	CASE "CMD"
//		d_ambito.fnu_deshab_centro(d_ambito)
//		d_ambito.fnu_deshab_cmd(d_ambito)
//	CASE "Puesto"
//		d_ambito.fnu_deshab_centro(d_ambito)
//		d_ambito.fnu_deshab_cmd(d_ambito)
//		d_ambito.fnu_deshab_puesto(d_ambito)
//		cb_reactivar.enabled = false
//		cb_observaciones.Enabled = false
//	END CHOOSE										
											
// Obtengo el select original de la datawindow

If gb_potencia Then
	//******************************************
	//**  OSGI 2001.2  	28/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  NIVELES GEOGRAFICOS 						**
	//******************************************
	//**  NIVELES GEOGRAFICOS  	fg_ventana_parametro(This.ClassName(),d_lista_aviso)

	ls_modify_ext = fg_ventana_parametro(This.ClassName(),d_lista_aviso)
	//******************************************
	//**  OSGI 2001.2  	28/10/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  NIVELES GEOGRAFICOS 						**
	//******************************************
End If



	d_lista_aviso.settransobject(sqlca) // me conecto a la base para modificar
	// GNU 27-10-2005 Mejora 1/335502
IF fg_verifica_parametro('NIC') then
		INT li_cuenta
	select count(*) 
	into :li_cuenta
	from gi_sintaxis_usuario 
	where usuario =:gs_usuario 
	and datawindow = :d_lista_aviso.dataobject; 
	
	string ls_select, ls_from, ls_where, ls_dw
	long posicion,longitud
	ls_dw=d_lista_aviso.describe("datawindow.table.select")
	posicion= pos(ls_dw, 'FROM')
	ls_select=left (ls_dw, posicion - 11)
	ls_select= ls_select + " SUMCON.NIC NIC "
	longitud=len(ls_dw)
	ls_dw=right (ls_dw, longitud - (posicion - 2))
	posicion= pos (ls_dw, 'WHERE')
	ls_from= left (ls_dw, posicion - 2)
	ls_from= ls_from + ", SUMCON "
	longitud=len(ls_dw)
	ls_where=right (ls_dw, longitud - (posicion - 2))
	ls_where= ls_where + " AND SUMCON.NIS_RAD (+)= GI_AVISOS.NIS_RAD"
	ls_dw= ls_select + ls_from + ls_where
	d_lista_aviso.modify("DataWindow.table.Select=~"" + ls_dw + "~"")

if li_cuenta = 0 then  // existe registro para este usuario y esta datawindow, nos salimos.
	d_lista_aviso.Modify ('create column (visible="1" band=detail id=40 alignment="2" ' + &
		'tabsequence=0 border="0" ' + &
		'color="8388608" x="6640" y ="4" height="64" '+ &
		'width="311" format="[general]" ' + &
		'name=nic edit.limit=0 edit.case=any ' + &
		'edit.autoselect=yes font.face="MS Sans Serif" ' + &
		'font.height= "-10" font.weight="400" ' + &
		'font.family="2" font.pitch="2" ' + &
		'font.charset="0" background.mode="0" ' + &
		'background.color="81324524")')
	
	d_lista_aviso.Modify ( 'create text (band=header  alignment="2" ' + &
		'text="NIC" border="6"  ' + &
		'color="0" x= "6637" y="4" height="64" ' + &
		'width="320" name=nic_t ' + &
		'font.face="MS Sans Serif" ' + &
		'font.height="-10" font.weight="700" ' + &
		'font.family="2" font.pitch="2" ' + &
		'font.charset="0" background.mode="0" ' + &
		'background.color="81324524" )')
		
//		d_lista_aviso.Retrieve()
		d_lista_aviso.Setfocus()
	end if
END IF
// Fin GNU
	is_select_original = d_lista_aviso.describe("datawindow.table.select")

	// Modifico la datawindow para hacer visible el campo observaciones de improcedencia

	d_lista_aviso.modify("st_observaciones.width='1874'")
	d_lista_aviso.modify("gi_avisos_obs_improc.width='1861'")
	d_lista_aviso.modify("st_observaciones.visible='1'")
	d_lista_aviso.modify("gi_avisos_obs_improc.visible='1'")
	
	
// DBE ini 31/03/2000 17:38
datawindowchild ldwch_clase_avi
d_filtro_aviso.getchild('ai_clase_aviso',ldwch_clase_avi)
ldwch_clase_avi.settransobject(sqlca)
ldwch_clase_avi.retrieve('C_AV')
ldwch_clase_avi.SetSort("codigo A")
ldwch_clase_avi.Sort()
ldwch_clase_avi.insertrow(1)
ldwch_clase_avi.setitem(1,'codigo',101)
ldwch_clase_avi.setitem(1,'descripcion','<Todos>')

d_filtro_aviso.insertrow(0)
d_filtro_aviso.GetChild('ai_alcance',ldwch_co_alc)
d_filtro_aviso.GetChild('ai_tipo',ldwch_tip_avi)
d_filtro_aviso.GetChild('ai_estado',ldwch_est_aviso)
ddw_alcance_aviso_t_shared.sharedata(ldwch_co_alc)
ddw_tipo_aviso_t_shared.sharedata(ldwch_tip_avi)
ddw_estado_aviso_t_shared.sharedata(ldwch_est_aviso)
	
d_filtro_aviso.fnu_cargar_duracion (fgci_todos)
d_filtro_aviso.setitem(1,"ai_estado",6)
//AHM Mejora 1/353285
//d_filtro_aviso.Object.ai_estado.Protect=1
//d_filtro_aviso.Object.ai_estado.background.color=gs_gris
d_filtro_aviso.setitem(1,"ai_tipo",0) 		
d_filtro_aviso.setitem(1,"ai_alcance",0) 		
d_filtro_aviso.setitem(1,"operacion",'<') 
d_filtro_aviso.setitem(1,"tiempo",2) 
d_filtro_aviso.setitem(1,"ai_clase_aviso",101)  // DBE  31/03/2000 9:09
d_filtro_aviso.setitem(1,"ai_alimentacion",0)
d_filtro_aviso.object.ai_alimentacion.protect=1
d_filtro_aviso.object.ai_alimentacion.background.color=gs_gris
dw_1.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")

//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
If fg_verifica_parametro('GEO') Then
	is_modify_ext = "nom_depto_t.text = '" + fg_geografica("2", d_lista_aviso.Describe("nom_depto_t.Text")) + "' "
	is_modify_ext += "nom_munic_t.text = '" + fg_geografica("3", d_lista_aviso.Describe("nom_munic_t.Text")) + "' "
	
	d_lista_aviso.Modify(is_modify_ext)
	
	is_modify_ext += " " + ls_modify_ext + " "
End If
//******************************************
//**  OSGI 2001.2  	28/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************


//AHM Mejora 1/353285
fw_cargarEstados()

end event

on w_2309_reactivar_avisos.create
int iCurrent
call super::create
this.cb_reactivar=create cb_reactivar
this.cb_cancelar=create cb_cancelar
this.d_ambito=create d_ambito
this.cb_buscar=create cb_buscar
this.d_filtro_aviso=create d_filtro_aviso
this.cb_observaciones=create cb_observaciones
this.dw_1=create dw_1
this.cb_1=create cb_1
this.d_lista_aviso=create d_lista_aviso
this.dw_usuarios=create dw_usuarios
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_reactivar
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.d_ambito
this.Control[iCurrent+4]=this.cb_buscar
this.Control[iCurrent+5]=this.d_filtro_aviso
this.Control[iCurrent+6]=this.cb_observaciones
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.d_lista_aviso
this.Control[iCurrent+10]=this.dw_usuarios
end on

on w_2309_reactivar_avisos.destroy
call super::destroy
destroy(this.cb_reactivar)
destroy(this.cb_cancelar)
destroy(this.d_ambito)
destroy(this.cb_buscar)
destroy(this.d_filtro_aviso)
destroy(this.cb_observaciones)
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.d_lista_aviso)
destroy(this.dw_usuarios)
end on

event close;call super::close;destroy iu_cen_2001_nu
destroy lu_comunic
end event

event activate;IF d_lista_aviso.RowCount() = 0 THEN
	cb_reactivar.enabled=false
	cb_observaciones.Enabled = false
END IF

//\\// PM_U003 TIPOS VIA AMR 13/06//2002
// \/
IF gb_tipos_de_via = False THEN
	
	d_lista_aviso.Modify("c_concat.Expression='avisos_nom_calle +~" N$$HEX2$$ba002000$$ENDHEX$$~"+ string(duplicador) +~" - ~"+ string(num_puerta)'")
	
END IF
// /\
//\\// PM_U003 TIPOS VIA AMR 13/06//2002

end event

event ue_arch_imprimir;call super::ue_arch_imprimir;IF d_lista_aviso.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_aviso

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2309_reactivar_avisos
end type

type cb_reactivar from commandbutton within w_2309_reactivar_avisos
integer x = 123
integer y = 1776
integer width = 466
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Reactivar"
end type

event clicked;///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     Cliked (Reactivaci$$HEX1$$f300$$ENDHEX$$n de Avisos)
//
// Objetivo:    Implementa una conexi$$HEX1$$f300$$ENDHEX$$n con conectividad para 
//				  que devuelva la jerarqu$$HEX1$$ed00$$ENDHEX$$a en el Estado Real de la red.
//				  Dicha jerarqu$$HEX1$$ed00$$ENDHEX$$a se grabara en la tabla gi_avisos_instalacion.
//				  Si no grabara la jerarqu$$HEX1$$ed00$$ENDHEX$$a real, grabar$$HEX2$$e1002000$$ENDHEX$$la normal.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:     Pi_clase_aviso
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  	Fecha         Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// 	---------    			-------         	----------------------------------------
//	24/01/2001		FDO			Creaci$$HEX1$$f300$$ENDHEX$$n.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_incidencia,ll_instalacion,ll_posicion_busqueda,ll_instalacion_referencia,ll_padre,ll_clase_aviso,ll_nis
string ls_nombre_instalacion
int li_contador,li_tipo_instalacion,li_centro,li_mesa,li_cmd,li_ind_red
datetime ldt_f_reposicion, ldt_fecha_actual, ldt_f_alta_interrup,ldt_f_alta,ldt_f_actual,ldt_f_nueva,ldt_fecha_res
string ls_t_interrupcion,ls_ci,ls_h_rep,ls_mensaje
int li_fin_cursor,li_tiempo_espera,li_tipo_red,li_clase_aviso,li_result_func,li_retorno
long ll_inst_padre, ll_nro_orden, ll_ot, ll_nro_incid, ll_nro_aviso,ll_fila=0,ll_ind_incidencia,ll_nro_inc,ll_ct,ll_cant_av_ct
boolean lb_inc_asoc = False


/////////// Declaraci$$HEX1$$f300$$ENDHEX$$n de variables para la llamada a fnu_o_inf_comple_sum
long ll_orden_servicio
long ll_nro_inciden
boolean lb_incid_pos
string ls_nombre
ls_nombre = " "
///////////

setnull(ldt_fecha_res)

ll_fila = d_lista_aviso.getselectedrow(ll_fila)

ldt_f_nueva = fgnu_fecha_actual()

do while ll_fila > 0
	
	lb_incid_pos=false
	ll_instalacion = d_lista_aviso.object.nro_instalacion[ll_fila]
	ll_nro_aviso = d_lista_aviso.object.nro_aviso[ll_fila]
	ldt_f_alta = d_lista_aviso.object.f_alta[ll_fila]
	ll_clase_aviso = d_lista_aviso.object.clase_aviso[ll_fila]
	li_centro=d_lista_aviso.object.nro_centro[ll_fila]
	li_mesa=d_lista_aviso.object.nro_mesa[ll_fila]
	li_cmd=d_lista_aviso.object.nro_cmd[ll_fila]
	ll_nis=d_lista_aviso.object.nis_rad[ll_fila]
	ldt_f_actual =d_lista_aviso.object.f_Actual[ll_fila]
	
	// Se van a bloquear los Avisos que se reactiven
	
	li_result_func = gnu_u_transaction.uf_bloquea_avisos( ldt_f_actual, fgci_bloq_reactivar_avisos, ll_nro_aviso)

	if li_result_func= -2 or li_result_func= -54 then
		d_lista_aviso.reset()
		parent.triggerevent("ue_retrieve")
		return
	end if
		
	if ll_clase_aviso = fgci_clase_avi_calidad then
		iu_avi_2004_pr.is_avisos.gi_ind_calidad= 1
	end if
	
	iu_avi_2004_pr.is_avisos.gl_nro_aviso=ll_nro_aviso
	iu_avi_2004_pr.is_avisos.gd_f_alta=ldt_f_alta
	iu_avi_2004_pr.is_avisos.gl_nro_instalacion=ll_instalacion
	iu_avi_2004_pr.is_avisos.gs_ventana_carga= "w_2309"
	
	// llamo a inf comple sum para cargar conectividad y comprobar si me afecta alguna interrupcion
	
	IF ll_clase_aviso = fgci_clase_avi_calidad or  ll_clase_aviso = fgci_clase_avi_normal then
	
		li_retorno=iu_avi_2004_pr.fpr_o_inf_comple_sum(ll_orden_servicio,ll_nro_inciden,ll_nis,lb_incid_pos,ls_nombre)
		
		if li_retorno = 2 then
		
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Una interrupci$$HEX1$$f300$$ENDHEX$$n afecta a la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada el aviso se asociar$$HEX2$$e1002000$$ENDHEX$$a la incidencia.")
			iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_asociado
			ll_nro_inc = iu_avi_2004_pr.is_avisos.gl_nro_incidencia
			ll_ind_incidencia = 1
			
		elseif li_retorno = 3 then
			
			iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_resuelto
			ll_nro_inc = iu_avi_2004_pr.is_avisos.gl_nro_incidencia
			ll_ind_incidencia = 1
			ldt_fecha_res = iu_avi_2004_pr.is_avisos.gdt_f_res
			
		end if
		
		// GNU 7-6-2007. Incidencia reactivar avisos con est_aviso=0
		IF li_retorno= 4 THEN
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Existe un aviso activo con ese NIS")
			gnu_u_transaction.uf_desbloquea_avisos( ll_nro_aviso, 2) //Rollback
			return
		END IF
		// FIN GNU		

		// llamo a avisos instalacion
		IF li_retorno <> 3 then
			// A$$HEX1$$f100$$ENDHEX$$adido por RCA (24-03-08). Incidencia: 0/553885. Insertamos en la tabla 
			// gi_avisos_instalacion la fecha de alta y no la actual que cambiaba anteriormente
			// en la funcion fpr_o_inf_comple_sum()
			iu_avi_2004_pr.is_avisos.gd_f_alta = ldt_f_alta
			// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA
			if iu_avi_2004_pr.fpr_avisos_instalacion(ll_clase_aviso) = -1 then
				gnu_u_transaction.uf_desbloquea_avisos( ll_nro_aviso, 2) //Rollback
				return 
			end if
		end if
	
	ELSE
		
		iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_pendiente
		
		//Ingresamos el aviso de ayuda o de alumbrado p$$HEX1$$fa00$$ENDHEX$$blico en gi_avisos_instalacion de nuevo.
		
 		SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
    		INTO :ls_nombre_instalacion  
    		FROM "SGD_INSTALACION"  
   		WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_instalacion   ;

		  INSERT INTO "GI_AVISOS_INSTALACION"  
				( "F_ACTUAL",   
				  "USUARIO",   
				  "PROGRAMA",   
				  "TIPO_INSTALACION",   
				  "NRO_AVISO",   
				  "NRO_INSTALACION",   
				  "NRO_INST_PADRE",  
				  "EST_AVISO",   
				  "TIPO_AVISO",   
				  "NRO_ZONA",   
				  "NRO_CMD",   
				  "NRO_SECTOR",   
				  "F_ALTA",   
				  "IND_RED",   
				  "CLASE_AVISO",   
				  "NOM_INSTALACION" )  
	  VALUES ( 
				  :ldt_f_nueva,   
				  :gs_usuario,   
				  'w_2309REA',   
				  0,   
				  :ll_nro_aviso,   
				  :ll_instalacion,   
				  0,   
				  :iu_avi_2004_pr.is_avisos.gi_est_aviso,   
				  :ll_clase_aviso,   
				  :li_centro,
				  :li_cmd,     
				  :li_mesa,   
				  :ldt_f_alta,   
				  0,   
				  :ll_clase_aviso,
				  :ls_nombre_instalacion)  ;
				  
			if sqlca.sqlcode = -1 then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar gi_avisos_instalacion")
				gnu_u_transaction.uf_desbloquea_avisos( ll_nro_aviso, 2) //Rollback
			return 
	end if

				  
	END IF

	IF gb_operaciones =  true and li_clase_aviso = fgci_clase_avi_normal then
	
		SELECT "GI_AVISOS_INSTALACION"."NRO_INSTALACION"  
			INTO :ll_ct
			FROM "GI_AVISOS_INSTALACION"  
			WHERE ( "GI_AVISOS_INSTALACION"."NRO_AVISO" = :ll_nro_aviso ) AND  
						( "GI_AVISOS_INSTALACION"."TIPO_INSTALACION" = :fgci_tipo_ct )   ;

		IF sqlca.SqlCode < 0 THEN
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede recuperar el CT del aviso.")
		END IF
	
		SELECT COUNT(distinct NRO_AVISO)  
			INTO :ll_cant_av_ct
			FROM "GI_AVISOS_INSTALACION"  
			WHERE ( "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_ct and  "GI_AVISOS_INSTALACION"."EST_AVISO" = :fgci_aviso_pendiente  ) ;
						
		IF sqlca.SqlCode < 0 THEN
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pueden contabilizar los avisos")
		END IF				
							
		IF ll_cant_av_ct = 0 then // Como vamos a dar de alta el primer aviso del ct, generamos una tool de alta de aviso.
							
//			gu_rf_servidor_operacion.of_tool_aviso(ll_ct,fgnu_fecha_actual(),1,ls_mensaje,gi_ci_ct)
						
			IF ls_mensaje <> "" then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al dar de alta el tool: " + ls_mensaje,information!,ok!)
			END IF	
							
		END IF
	
	END IF

	UPDATE GI_AVISOS 
	SET 	EST_AVISO = :iu_avi_2004_pr.is_avisos.gi_est_aviso,
			IND_IMPROCEDENTE = 0,
			F_ACTUAL = :ldt_f_nueva,
			PROGRAMA = 'w_2309REA',
			IND_INC_ASOC = :ll_ind_incidencia,
			NRO_INCIDENCIA = :ll_nro_inc,
			FECHA_RES = :ldt_fecha_res
	WHERE NRO_AVISO = :ll_nro_aviso;
	
	if sqlca.sqlcode = -1 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar el estado del aviso.")
		gnu_u_transaction.uf_desbloquea_avisos( ll_nro_aviso, 2) //Rollback
		return 
	end if

	UPDATE GI_AVISOS_INSTALACION
	SET F_ACTUAL = :ldt_f_nueva
	WHERE NRO_AVISO = :ll_nro_aviso;
	
	if sqlca.sqlcode = -1 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo actualizar la acometida del aviso.")
		return -1
	end if

	ll_fila = d_lista_aviso.getselectedrow(ll_fila)
	
	iu_avi_2004_pr.is_avisos.gs_ventana_carga= ""
	
	gnu_u_transaction.uf_desbloquea_avisos( ll_nro_aviso, 1) //Commit
	
	if isnull(ll_fila) or ll_fila = 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Los avisos seleccionados han sido reactivados en el sistema." )
	end if
loop

d_lista_aviso.reset()

parent.triggerevent("ue_buscar")

RETURN 1
end event

type cb_cancelar from commandbutton within w_2309_reactivar_avisos
integer x = 1577
integer y = 1776
integer width = 466
integer height = 108
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cerrar"
boolean cancel = true
end type

event clicked;lu_comunic.is_comunic.programa_retorno = "w_2308_reactivar_avisos"
lu_comunic.is_comunic.accion_retorno = "No Refrescar"
// DSA 7/08/2000
//gnu_u_transaction.uf_rollback(Parent)
close(parent)
end event

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_2309_reactivar_avisos
integer x = 46
integer y = 92
integer width = 992
integer height = 412
integer taborder = 10
boolean border = false
end type

type cb_buscar from commandbutton within w_2309_reactivar_avisos
integer x = 2304
integer y = 1776
integer width = 466
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Buscar"
end type

event clicked;parent.triggerevent("ue_buscar")
end event

type d_filtro_aviso from u_avi_2030_pr_filtro_aviso within w_2309_reactivar_avisos
integer x = 1042
integer width = 2505
integer height = 712
integer taborder = 30
boolean bringtotop = true
boolean border = false
end type

event itemchanged;call super::itemchanged;// DBE ini  31/03/2000 9:06
String ls_columna
ls_columna=this.getcolumnname()
CHOOSE CASE ls_columna
	CASE "ai_clase_aviso" 
		  if data = string (fgci_clase_avi_normal) or data = string(fgci_clase_avi_calidad) then
			this.object.ai_alimentacion.protect=0
			this.object.ai_alimentacion.background.color=gs_blanco
		  else
			this.setitem(1,'ai_alimentacion',0)
			this.object.ai_alimentacion.protect=1
			this.object.ai_alimentacion.background.color=gs_gris
		  end if
		  
END CHOOSE
// DBE fin  31/03/2000 9:06
end event

event editchanged;call super::editchanged;// En este evento se controla que el usuario no introduzca como primer caracter del
// Nis, el signo negativo.   (LFE)
string ls_aviso

ls_aviso = this.GetText()
if ls_aviso = "-" and this.getcolumnname()= "ai_duracion" then
	this.SetText("")
end if

end event

type cb_observaciones from commandbutton within w_2309_reactivar_avisos
integer x = 850
integer y = 1776
integer width = 466
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Observaciones"
end type

event clicked;long ll_row , ll_selectedrow
string ls_classname
ls_classname=parent.classname()

ll_row=d_lista_aviso.getrow()

ll_selectedrow=d_lista_aviso.GetSelectedRow(0)
do while ll_selectedrow>0
	
if d_lista_aviso.scrolltorow(ll_selectedrow)<0 then return ;

ll_selectedrow=d_lista_aviso.GetSelectedRow (ll_selectedrow)

openwithparm(w_1105_obs_improc,ls_classname)

loop
end event

type dw_1 from datawindow within w_2309_reactivar_avisos
boolean visible = false
integer x = 73
integer y = 896
integer width = 494
integer height = 360
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_2309_reactivar_avisos
integer x = 3031
integer y = 1776
integer width = 466
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within w_2309_reactivar_avisos
event ue_click pbm_dwnkey
integer x = 50
integer y = 732
integer width = 3497
integer height = 1012
integer taborder = 20
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
end type

event ue_click;long ll_fila_actual, ll_fila_ultima

ll_fila_actual = this.getrow()
ll_fila_ultima = this.rowcount()

this.setredraw(false)

IF KeyDown(KeyDownArrow!) AND KeyDown(KeyShift!) THEN
	setpointer(Hourglass!)
	if ll_fila_actual < ll_fila_ultima then
		if this.isselected(ll_fila_actual + 1) =true then
			This.SelectRow(ll_fila_actual, False)
		else
			This.SelectRow(ll_fila_actual + 1, True)
		end if
	end if
	this.setrow(ll_fila_actual)
end if


IF KeyDown(KeyUpArrow!) AND KeyDown(KeyShift!) THEN
	setpointer(HourGlass!)
	if ll_fila_actual > 1 then
		if this.isselected(ll_fila_actual - 1) =true then
			This.SelectRow(ll_fila_actual, False)
		else
			This.SelectRow(ll_fila_actual - 1, True)
		end if
	end if
	this.setrow(ll_fila_actual)
end if


IF KeyDown(KeyEnd!) AND KeyDown(KeyShift!) THEN
	setpointer(HourGlass!)
	this.setredraw(false)
	if ll_fila_actual < ll_fila_ultima then
			FOR ll_fila_actual=ll_fila_actual TO ll_fila_ultima + 1 step 1
				This.SelectRow(ll_fila_actual, True)
			NEXT
			ll_fila_actual = ll_fila_ultima
	end if
	this.setrow(ll_fila_actual)
end if


IF KeyDown(KeyHome!) AND KeyDown(KeyShift!) THEN
	setpointer(HourGlass!)
	this.setredraw(false)
	if ll_fila_actual > 1 then
			FOR ll_fila_actual=ll_fila_actual TO 1 step -1
				This.SelectRow(ll_fila_actual, True)
			NEXT
			ll_fila_actual = 1
	end if
	this.setrow(ll_fila_actual)
end if

ii_fila_clickeada=ll_fila_actual

this.setredraw(true)
setpointer(Arrow!)
end event

event clicked;call super::clicked;////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: clicked
// 
// Objetivo: Marca/Desmarca la fila sobre la que se produce la acci$$HEX1$$f300$$ENDHEX$$n
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable  	 Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	  	 ----------- 			  ---------
// 15/09/97   FDO				  Clicked
//
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

boolean lb_condicion
int li_centro, li_cmd, li_puesto, li_fila
long ll_ot,ll_fila,ll_con_ot,ll_contador

this.setredraw(false)

li_fila =Row

IF li_fila > 0 THEN

	ib_accion_nueva = true

  	lb_condicion=false
	
	if this.getselectedrow(li_fila - 1) = li_fila then
		this.selectrow(li_fila,false)
	else
		
		if KeyDown(KeyControl!) = false then
			This.SelectRow(0, False)
		end if
		
		if KeyDown(KeyShift!) then
			if row > ii_fila_clickeada	then
				for ll_contador = ii_fila_clickeada to row step 1
					This.SelectRow(ll_contador, True)
				next
			else
				for ll_contador = ii_fila_clickeada to row step - 1
					This.SelectRow(ll_contador, True)
				next
			end if
		else
			This.SelectRow(li_fila, True)
			This.SetRow(li_fila)
			this.scrolltorow(li_fila)
		end if
	end if

	ii_fila_clickeada = li_fila

ELSE
	
	This.SelectRow(0, False)
	This.SetRow(0)
	ii_fila_clickeada = 0
	
END IF

this.setredraw(true)
end event

event scrollvertical;call super::scrollvertical;d_filtro_aviso.setitem(1,"ai_reg_seleccionados", This.rowcount())
end event

event constructor;call super::constructor;This.modify("fecha_res_t.Text='F. Improcedente'")
end event

type dw_usuarios from u_avi_2034_pr_usuario_telegestiones within w_2309_reactivar_avisos
integer x = 1499
integer y = 460
integer width = 1115
integer height = 96
integer taborder = 70
boolean bringtotop = true
boolean border = false
end type


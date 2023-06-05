HA$PBExportHeader$w_6203_mantenimiento_brigadistas.srw
$PBExportComments$Ventana que muestra los brigadistas, y permite su mantenimiento
forward
global type w_6203_mantenimiento_brigadistas from w_sgigenerica
end type
type cb_agregar from u_cb within w_6203_mantenimiento_brigadistas
end type
type cb_eliminar from u_cb within w_6203_mantenimiento_brigadistas
end type
type cb_buscar from u_cb within w_6203_mantenimiento_brigadistas
end type
type dw_lista_brigadistas from u_bri_2014_pr_mante_brigadistas within w_6203_mantenimiento_brigadistas
end type
type cb_historico from commandbutton within w_6203_mantenimiento_brigadistas
end type
type cb_consultar from commandbutton within w_6203_mantenimiento_brigadistas
end type
type dw_seleccion from u_bri_2005_pr_lista_brigadista within w_6203_mantenimiento_brigadistas
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_6203_mantenimiento_brigadistas
end type
type dw_1 from datawindow within w_6203_mantenimiento_brigadistas
end type
type cb_1 from commandbutton within w_6203_mantenimiento_brigadistas
end type
end forward

global type w_6203_mantenimiento_brigadistas from w_sgigenerica
integer x = 23
integer y = 4
integer width = 3419
integer height = 2472
string title = "OPEN SGI - Mantenimiento de Brigadistas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "brigadista.ico"
event ue_retrieve pbm_custom21
event ue_abrir_mant_brig pbm_custom22
event ue_alta pbm_custom23
event ue_armar_sql pbm_custom24
event ue_historico pbm_custom25
cb_agregar cb_agregar
cb_eliminar cb_eliminar
cb_buscar cb_buscar
dw_lista_brigadistas dw_lista_brigadistas
cb_historico cb_historico
cb_consultar cb_consultar
dw_seleccion dw_seleccion
dw_ambito dw_ambito
dw_1 dw_1
cb_1 cb_1
end type
global w_6203_mantenimiento_brigadistas w_6203_mantenimiento_brigadistas

type variables
u_generico_comunicaciones lu_comunic 
u_bri_2014_nu_mante_brigadistas iu_bri_2014_nu
int ii_fila_seleccionada
u_bri_2014_rn_mante_brigadistas iu_bri_2014_rn
u_bri_2005_nu_lista_brigadas_puesto iu_bri_2005_nu
u_bri_2010_nu_lista_brigada_centro iu_bri_2010_nu

u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu 

string is_select_original
string is_clausula_where
string is_modificacion
string is_accion_llamada //DBE 16/12/1999

boolean ib_llamada_open = true
integer ii_total
end variables

forward prototypes
public subroutine f_crear_objetos ()
public subroutine f_destruir_objetos ()
end prototypes

event ue_retrieve;//iu_bri_2014_nu.fnu_obtener_datos(dw_lista_brigadistas)
dw_lista_brigadistas.DBCancel()
dw_lista_brigadistas.Reset()
ii_total = dw_lista_brigadistas.Retrieve()

IF dw_lista_brigadistas.RowCount() > 0 THEN
	IF lu_comunic.is_comunic.accion_llamada = "Consulta" THEN
			cb_consultar.enabled= TRUE
			cb_historico.enabled = TRUE
	ELSEIF lu_comunic.is_comunic.accion_llamada = "Consult/Manten" OR &
			lu_comunic.is_comunic.accion_llamada = "Modificar" THEN
			cb_consultar.enabled= TRUE
			cb_historico.enabled = TRUE
   	   cb_eliminar.enabled = TRUE
	ELSE 
			cb_eliminar.enabled = TRUE
	END IF
	ii_fila_seleccionada = 1
	dw_lista_brigadistas.ScrollToRow(1)
	dw_lista_brigadistas.SelectRow(0,FALSE)
	dw_lista_brigadistas.SelectRow(ii_fila_seleccionada ,TRUE)
ELSE
	ii_fila_seleccionada=0
	cb_consultar.enabled= FALSE
	cb_historico.enabled = FALSE
	cb_eliminar.enabled = FALSE
	IF NOT ib_llamada_open THEN
		gnv_msg.f_mensaje( "AB02","","",OK!)
	END IF
END IF

IF ib_llamada_open THEN
	ib_llamada_open = False
END IF

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de Brigadistas'
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
dw_lista_brigadistas.ShareData(dw_datos)
end event

event ue_abrir_mant_brig;/// DBE borr$$HEX2$$f3002000$$ENDHEX$$viejo script 16/12/1999 . este es nuevo

//DBE ini 16/12/1999
long ll_n_nro_brigadista
int li_islocked , li_centro, li_cmd, li_mesa

if ii_fila_seleccionada > 0 then
	lu_comunic.is_comunic.longval1 = dw_lista_brigadistas.GetItemNumber(ii_fila_seleccionada,"nro_brigadistas")

   lu_comunic.is_comunic.accion_llamada=is_accion_llamada 

	li_islocked=gnu_u_transaction.uf_lock(this,'GI_BRIGADISTA','NRO_BRIGADISTAS = '+&
	string(lu_comunic.is_comunic.longval1),false)
	if  li_islocked <> 0 then 
		choose case li_islocked
			    case -54
		gnv_msg.f_mensaje("EM22","","",OK!)
//		"Este Brigadista esta siendo modificado por otro Usuario."
        if is_accion_llamada = "Modificar" then
             RETURN
		  end if
	          case 100
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos de este Brigadista. Se necesita actualizarlos');
		This.TriggerEvent("ue_armar_sql")
		return 
		end choose

	end if


	fgnu_resetear_s_comunicaciones(gu_comunic)
	gu_comunic.is_comunic = lu_comunic.is_comunic

	
//li_centro=dw_ambito.object.nro_centro[1]
//li_cmd=dw_ambito.object.nro_cmd[1]
//li_mesa=dw_ambito.object.nro_mesa[1]
//ll_nro_brigadista = dw_lista_brigadistas.getitemnumber(ii_fila_seleccionada, 'nro_brigadistas')

	select nro_centro, nro_cmd, nro_puesto
	into :li_centro, :li_cmd, :li_mesa
	from gi_brigadista
	where nro_brigadistas = :lu_comunic.is_comunic.longval1;
	
	gu_comunic.is_comunic.intval1 = li_centro
	gu_comunic.is_comunic.intval2 = li_cmd
	gu_comunic.is_comunic.intval3 = li_mesa

// lee los datos del ambito del propio brigadista

	Open(w_6204_ingreso_brigadistas)

end if

//DBE fin 16/12/1999
end event

event ue_alta;dw_lista_brigadistas.SelectRow(0,FALSE)
int li_centro, li_cmd, li_mesa

lu_comunic.is_comunic.accion_llamada = "Alta"

fgnu_resetear_s_comunicaciones(gu_comunic)
gu_comunic.is_comunic = lu_comunic.is_comunic
//Mato-->(Brigadistas Inc. 2)

	
li_centro=dw_ambito.object.nro_centro[1]
li_cmd=dw_ambito.object.nro_cmd[1]
li_mesa=dw_ambito.object.nro_mesa[1]

if li_centro=0 or li_cmd=0 or li_mesa=0 then
	gnv_msg.f_mensaje("EM54","","",OK!)
	
	return 
end if
gu_comunic.is_comunic.intval1= li_centro
gu_comunic.is_comunic.intval2= li_cmd
gu_comunic.is_comunic.intval3= li_mesa
	
ib_llamada_open = true

//gu_comunic.fnu_abrir(w_6204_ingreso_brigadistas,"w_6204_ingreso_brigadistas",1,1,w_6203_mantenimiento_brigadistas,"w_6203_mantenimiento_brigadistas")
Open(w_6204_ingreso_brigadistas)


//This.TriggerEvent("ue_abrir_mant_brig")
end event

event ue_armar_sql;//********************************************************************//
//                     ARMO EL FILTRO PARA EL $$HEX1$$c100$$ENDHEX$$MBITO                  //
//********************************************************************//
integer li_centro, li_cmd, li_puesto
string retorno
li_centro =dw_ambito.getitemnumber(1,"nro_centro")
li_cmd = dw_ambito.getitemnumber(1,"nro_cmd")
li_puesto = dw_ambito.getitemnumber(1,"nro_mesa")

//is_select_original =" SELECT GI_BRIGADISTA.NRO_BRIGADISTAS,GI_BRIGADISTA.NOMBRE,GI_BRIGADISTA.DOC_ID,GI_BRIGADISTA.CO_PAIS,GI_BRIGADISTA.APE1,GI_BRIGADISTA.APE2,GI_BRIGADISTA.NRO_CONTRATA,GI_BRIGADISTA.ENCARGADO,GI_BRIGADISTA.IND_DISPONIBLE,TIPOS.DESC_TIPO,GI_BRIGADISTA.TIP_DOC,CODIGOS.DESC_COD,SGD_VALOR.DESCRIPCION FROM GI_BRIGADISTA,TIPOS,CODIGOS,SGD_VALOR WHERE ( GI_BRIGADISTA.TIP_DOC = TIPOS.TIPO ) and ( GI_BRIGADISTA.CO_PAIS = CODIGOS.COD) AND ( SGD_VALOR.CODIF = 'HORA' ) AND ( SGD_VALOR.CODIGO = GI_BRIGADISTA.TURNO ) " 
is_select_original =" SELECT " + &
						  "GI_BRIGADISTA.NRO_BRIGADISTAS,GI_BRIGADISTA.NOMBRE,GI_BRIGADISTA.DOC_ID," + &
						  "GI_BRIGADISTA.CO_PAIS,GI_BRIGADISTA.APE1,GI_BRIGADISTA.APE2," + &
						  "GI_BRIGADISTA.NRO_CONTRATA,SGD_VALOR.DESCRIPCION,GI_BRIGADISTA.ENCARGADO," + &
						  "GI_BRIGADISTA.IND_DISPONIBLE,TIPOS.DESC_TIPO,GI_BRIGADISTA.TIP_DOC," + &
						  "CODIGOS.DESC_COD " + & 
						  "FROM GI_BRIGADISTA,TIPOS,CODIGOS, SGD_VALOR " + &
						  "WHERE ( GI_BRIGADISTA.TIP_DOC = TIPOS.TIPO ) " + &
						  "and ( GI_BRIGADISTA.CO_PAIS = CODIGOS.COD) " + &
                    "and ((SGD_VALOR.CODIF = 'EMPR') " + & 
         			  "and (SGD_VALOR.CODIGO <> 0 ) " + &
			           "and (SGD_VALOR.CODIGO = GI_BRIGADISTA.NRO_CONTRATA)) "
						  
						  
String ls_filtro = " "  //inicaliza filtro del ambito

// Permite armar el filtro considerando el $$HEX1$$e100$$ENDHEX$$mbito
// para ser usado en el where de la sentencia sql
IF li_centro<>fgci_todos THEN
		ls_filtro = " AND " + "(GI_BRIGADISTA.NRO_CENTRO = " + string(li_centro) + ")"
end if
IF li_cmd<>fgci_todos THEN
			ls_filtro=ls_filtro + " and (GI_BRIGADISTA.NRO_CMD = " + string(li_cmd)+ ")"
end if
IF li_puesto<>fgci_todos THEN
				ls_filtro=ls_filtro + " and (GI_BRIGADISTA.NRO_PUESTO= " + string(li_puesto) + ")"
END IF	

if dw_seleccion.object.pi_en_turno[1] = 1 &
	AND NOT IsNull(dw_seleccion.getItemDatetime(1, 'pdt_fecha_turno')) then
	string ls_subselect
	Datetime ldt_fecha_turno
	
	ldt_fecha_turno = dw_seleccion.getItemDatetime(1, 'pdt_fecha_turno')
	ls_subselect = "select gi_brigada_brigadista.nro_brigadistas from gi_brigada_brigadista, gi_brigadas_cal " + &
						"where gi_brigada_brigadista.nro_brigada = gi_brigadas_cal.nro_brigada AND " + &
						"TO_CHAR(gi_brigadas_cal.fecha_inicio, 'DD/MM/YYYY') <= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'DD/MM/YYYY') " + &
						"AND TO_CHAR(gi_brigadas_cal.fecha_fin, 'DD/MM/YYYY') >= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'DD/MM/YYYY') " + &
						"AND TO_CHAR(gi_brigadas_cal.hora_desde,'HH24:MI:SS') <= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') " + &
						"AND TO_CHAR(gi_brigadas_cal.hora_hasta,'HH24:MI:SS') >= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI')"	
	ls_filtro = ls_filtro + " AND gi_brigadista.nro_brigadistas IN (" + ls_subselect + ") "		

//	ls_filtro = ls_filtro + " AND (GI_BRIGADISTA.TURNO = " + string(dw_seleccion.object.pi_en_turno[1]) + ")"
end if

if dw_seleccion.object.pi_disponible[1] <> 2 then
	ls_filtro = ls_filtro + " AND (GI_BRIGADISTA.IND_DISPONIBLE= " + string(dw_seleccion.object.pi_disponible[1]) + ")"
end if



is_clausula_where = is_select_original + ls_filtro


//is_modificacion = "DataWindow.Table.Select= '" + is_clausula_where + "'"
is_modificacion="Datawindow.table.select=~" "+is_clausula_where + " ~" "
retorno = dw_lista_brigadistas.Modify(is_modificacion)
IF retorno = "" THEN
	this.triggerevent("ue_retrieve")
ELSE
	gnv_msg.f_mensaje("EA27",retorno,"",OK!)
	//MessageBox("Error en Sintaxis","Modify Failed " + retorno)
END IF


// reseteo las variables
	is_clausula_where = ""
	is_modificacion = ""
	ls_filtro = ""
end event

event ue_historico;string ls_nombre_brigadista

ls_nombre_brigadista = dw_lista_brigadistas.GetItemString(ii_fila_seleccionada,"nombre")
IF NOT IsNull(dw_lista_brigadistas.GetItemString(ii_fila_seleccionada,"ape1")) THEN
	ls_nombre_brigadista = ls_nombre_brigadista + " "+ dw_lista_brigadistas.GetItemString(ii_fila_seleccionada,"ape1")
END IF
IF NOT IsNull(dw_lista_brigadistas.GetItemString(ii_fila_seleccionada,"ape2")) THEN
	ls_nombre_brigadista = ls_nombre_brigadista + " "+ dw_lista_brigadistas.GetItemString(ii_fila_seleccionada,"ape2")
END IF
gu_comunic.is_comunic.strval1 = ls_nombre_brigadista
gu_comunic.is_comunic.longval1 = dw_lista_brigadistas.GetItemNumber(ii_fila_seleccionada,"nro_brigadistas")
gu_comunic.is_comunic.programa_llamante = "w_2270"
gu_comunic.is_comunic.accion_llamada = "consulta"
//OpenSheet(w_2272_historico_brigadista,w_6203_mantenimiento_brigadistas,4,Layered!)
Open(w_2272_historico_brigadista)


end event

public subroutine f_crear_objetos ();lu_comunic = CREATE u_generico_comunicaciones
iu_bri_2014_nu = CREATE u_bri_2014_nu_mante_brigadistas
iu_bri_2014_rn = CREATE u_bri_2014_rn_mante_brigadistas
iu_cen_2001_nu = CREATE u_cen_2001_nu_form_centro_cmd_mesa
iu_bri_2005_nu = CREATE u_bri_2005_nu_lista_brigadas_puesto 
iu_bri_2010_nu = CREATE u_bri_2010_nu_lista_brigada_centro 

RETURN
end subroutine

public subroutine f_destruir_objetos ();DESTROY lu_comunic
DESTROY iu_bri_2014_nu
DESTROY iu_bri_2014_rn
DESTROY iu_cen_2001_nu
DESTROY iu_bri_2005_nu 
DESTROY iu_bri_2010_nu 
RETURN

end subroutine

event ue_arch_eliminar;call super::ue_arch_eliminar;int li_desasigno, li_elimino, li_nro_brigadista
long ll_fila
datetime ld_fecha_actual

int li_islocked //DBE 16/12/1999

//Obtengo la fila marcada
ll_fila = dw_lista_brigadistas.GetSelectedRow(0)

IF ll_fila > 0 THEN
	ld_fecha_actual = fgnu_fecha_actual()
	li_nro_brigadista = dw_lista_brigadistas.GetItemNumber(ll_fila,"nro_brigadistas")
ELSE
	Return 
END IF

IF ll_fila <= 0 THEN
	gnv_msg.f_mensaje("AM06","","",OK!)
	Return
END IF

//DBE ini 16/12/1999
	li_islocked=gnu_u_transaction.uf_lock(this,'GI_BRIGADISTA','NRO_BRIGADISTAS = '+&
	string(dw_lista_brigadistas.getitemnumber(ll_fila,'NRO_BRIGADISTAS')),false)
	if  li_islocked <> 0 then 
		choose case li_islocked
			    case -54
		gnv_msg.f_mensaje("EM22","","",OK!)
//		"Este Brigadista esta siendo modificado por otro Usuario."
             return
	          case 100
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos de este Brigadista. Se necesita actualizarlos');
		this.TriggerEvent("ue_armar_sql")
		return 
		end choose
		
	end if
//DBE fin 16/12/1999



lu_comunic.is_comunic.accion_retorno = ""
gu_comunic.is_comunic.accion_retorno = "No Refrescar"
IF dw_lista_brigadistas.GetItemNumber(ll_fila,"ENCARGADO") = 1 THEN
	gnv_msg.f_mensaje("AM25","","",OK!)
	//MESSAGEBOX("Atenci$$HEX1$$f300$$ENDHEX$$n","Este brigadista es responsable de una brigada. No puedes borrar su nombre",exclamation!,OK!)
	RETURN
END IF

IF dw_lista_brigadistas.GetItemNumber(ll_fila,"ind_disponible") = 0 THEN
	li_desasigno = gnv_msg.f_mensaje("CM02","","",YesNo!)
	IF li_desasigno = 1 THEN
		iu_bri_2014_nu.fnu_desasignar(ld_fecha_actual,li_nro_brigadista)
	ELSE
		RETURN
	END IF
END IF

li_elimino = gnv_msg.f_mensaje("CM03","","",YesNo!)

IF li_elimino = 1 THEN
	
	dw_lista_brigadistas.DeleteRow(ll_fila)
	dw_lista_brigadistas.update()
//	COMMIT; //DBE 16/12/1999
gnu_u_transaction.uf_commit(this)
	
	if dw_lista_brigadistas.RowCount()=0 then //Mato
		cb_historico.enabled = FALSE
	   cb_eliminar.enabled = FALSE
	end if
	
////////////////////
// INCLUIDO JCARLOS
//	int li_Instrucciones[]
//	Any lany_Parametros[]
//	string ls_Entrada
//	string ls_Salida
//	long ll_Codigo_Error
//
//   lany_Parametros[1] = li_nro_brigadista
//	// Instrucci$$HEX1$$f300$$ENDHEX$$n 60 ( eliminar brigadista ) de la funci$$HEX1$$f300$$ENDHEX$$n de negocio MB000001
//   li_Instrucciones[1] = 60
//	ls_Salida = guo_OpenLink.of_Ejecutar( "MB000001", li_Instrucciones, lany_Parametros, &
//					ls_Entrada, ll_Codigo_Error) 
//	IF ll_Codigo_Error <> 0 THEN
//	  MessageBox( "Error", guo_OpenLink.of_Texto_Error() )
//	ELSE
//		dw_lista_brigadistas.DeleteRow(0)
//		dw_lista_brigadistas.ResetUpdate()
//	END IF
	//
	////////////////////
END IF

dw_lista_brigadistas.SelectRow(0,False)
//dw_lista_brigadistas.SelectRow(ll_fila,True)
//dw_lista_brigadistas.ScrollToRow(ll_fila)
end event

event close;call super::close;//Destruyo objetos creados en evento "open"
This.f_destruir_objetos()
end event

event open;call super::open;int li_hora,li_centro,li_cmd

li_centro=gi_nro_centro
li_cmd=gi_nro_cmd

//Colocar la ventana en el sitio adecuado
fg_colocar_ventana_main(w_6203_mantenimiento_brigadistas)

//Creo objetos de Trabajo
This.f_crear_objetos()

//Recibo parametros de entrada
lu_comunic.is_comunic = gu_comunic.is_comunic

//objeto de ambito
dw_ambito.settransobject(sqlca) // Conexi$$HEX1$$f300$$ENDHEX$$n a la base
dw_ambito.fnu_cargo_drop()
dw_ambito.insertrow(0)
//dw_ambito.setitem(1,"nro_centro",li_centro) // LFE - comentado para $$HEX1$$e100$$ENDHEX$$mbito
//dw_ambito.fnu_filtro_cmd_n() // LFE - comentado para $$HEX1$$e100$$ENDHEX$$mbito
//dw_ambito.setitem(1,"nro_cmd",li_cmd) // LFE - comentado para $$HEX1$$e100$$ENDHEX$$mbito
//dw_ambito.fnu_filtro_mesa_n() // LFE - comentado para $$HEX1$$e100$$ENDHEX$$mbito
//dw_ambito.setitem(1,"nro_mesa",gi_nro_puesto) // LFE - comentado para $$HEX1$$e100$$ENDHEX$$mbito





////objeto de ambito
//dw_ambito.settransobject(sqlca) // Conexi$$HEX1$$f300$$ENDHEX$$n a la base
//dw_ambito.fnu_cargo_drop()
//
//dw_ambito.fnu_filtrar_cmd_2(dw_ambito,li_centro)
//dw_ambito.fnu_filtro_mesa_2(dw_ambito,li_cmd)
//dw_ambito.insertrow(0)
//
//iu_bri_2010_nu.fnu_crea_dddw(dw_seleccion)	
dw_seleccion.fpr_crear_dw()
dw_seleccion.fpr_deshabilitar_fechas()
//dw_seleccion.InsertRow(0)

// Muestro el turno correspondiente a la hora actual	

//li_hora = Hour(Now( ))
//if li_hora >= 0 and li_hora <= 8 then 
//	iu_bri_2005_nu.fnu_cargar_estructura_2(dw_seleccion,1,1)
//elseif li_hora >8 and li_hora <=16 then
//	iu_bri_2005_nu.fnu_cargar_estructura_2(dw_seleccion,2,1)
//else	
//	iu_bri_2005_nu.fnu_cargar_estructura_2(dw_seleccion,3,1)
//end if

//***INICIALIZACI$$HEX1$$d300$$ENDHEX$$N DE VALORES POR DEFECTO*******************
dw_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1,lu_comunic.is_comunic.intval2,lu_comunic.is_comunic.intval3,0)
cb_buscar.Setfocus()

IF lu_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	lu_comunic.is_comunic.accion_llamada = "Modificar"
END IF

//Inicializo objetos de trabajo
dw_lista_brigadistas.SetTransObject(SQLCA)
ii_fila_seleccionada = 0

/*IF iu_bri_2014_rn.frn_tiene_perfil_modifica() = FALSE THEN
	lu_comunic.is_comunic.accion_llamada = "Consulta"
END IF*/

 is_accion_llamada=lu_comunic.is_comunic.accion_llamada //DBE 16/12/1999

IF lu_comunic.is_comunic.accion_llamada = "Consulta" THEN
	This.title = gu_comunic.f_titulo_ventana("w_6203","consulta")
	cb_agregar.enabled = FALSE
	cb_eliminar.enabled = FALSE
	cb_historico.enabled  = FALSE
ELSEIF lu_comunic.is_comunic.accion_llamada = "Consult/Manten" THEN
	This.title = gu_comunic.f_titulo_ventana("w_6203","modificar")
	lu_comunic.is_comunic.accion_llamada ="Modificar"
	is_accion_llamada = "Modificar"
	cb_consultar.enabled=true
	cb_historico.enabled = true
	cb_eliminar.enabled = true
ELSE
	This.title = gu_comunic.f_titulo_ventana("w_6203","modificar")
	cb_consultar.enabled=FALSE
	cb_historico.enabled = FALSE
	cb_eliminar.enabled = FALSE
END IF

dw_1.modify("data_1.DataObject ='" + dw_lista_brigadistas.DataObject + "'")
cb_buscar.TriggerEvent(clicked!)
end event

event activate;
IF gu_comunic.is_comunic.accion_retorno = "Refrescar" THEN
	gnu_u_transaction.uf_rollback(this)
	lu_comunic.is_comunic.accion_llamada = "Modificar"
	cb_buscar.TriggerEvent(clicked!)
	ii_fila_seleccionada = 1
END IF

IF dw_lista_brigadistas.RowCount() > 0 THEN
	ii_fila_seleccionada = 1
	dw_lista_brigadistas.ScrollToRow(ii_fila_seleccionada)
	dw_lista_brigadistas.SelectRow(0,FALSE)
	dw_lista_brigadistas.SelectRow(ii_fila_seleccionada ,TRUE)
END IF



end event

on w_6203_mantenimiento_brigadistas.create
int iCurrent
call super::create
this.cb_agregar=create cb_agregar
this.cb_eliminar=create cb_eliminar
this.cb_buscar=create cb_buscar
this.dw_lista_brigadistas=create dw_lista_brigadistas
this.cb_historico=create cb_historico
this.cb_consultar=create cb_consultar
this.dw_seleccion=create dw_seleccion
this.dw_ambito=create dw_ambito
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_agregar
this.Control[iCurrent+2]=this.cb_eliminar
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.dw_lista_brigadistas
this.Control[iCurrent+5]=this.cb_historico
this.Control[iCurrent+6]=this.cb_consultar
this.Control[iCurrent+7]=this.dw_seleccion
this.Control[iCurrent+8]=this.dw_ambito
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.cb_1
end on

on w_6203_mantenimiento_brigadistas.destroy
call super::destroy
destroy(this.cb_agregar)
destroy(this.cb_eliminar)
destroy(this.cb_buscar)
destroy(this.dw_lista_brigadistas)
destroy(this.cb_historico)
destroy(this.cb_consultar)
destroy(this.dw_seleccion)
destroy(this.dw_ambito)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;//
s_impresion_preliminar lst_Impresion
DataWindowChild dwc_brigadista
string ls_estado, ls_nombre
long ll_codigo
int li_posy, li_indice
li_posy = 378

IF dw_lista_brigadistas.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF
dw_1.Reset()
dw_1.getchild ("d_impresion_brigadista",dwc_brigadista)
dw_lista_brigadistas.sharedata(dwc_brigadista)
lst_impresion.pa_todos[1]=dw_lista_brigadistas
lst_impresion.pa_nombres[1]='d_impresion_brigadista'

//messagebox('dw_lista_brigadistas.RowCount()', dw_lista_brigadistas.RowCount())
//FOR li_indice = 1 TO dw_lista_brigadistas.RowCount()
//	
//	
//	ls_estado = ''
//	ll_codigo = dw_lista_brigadistas.GetItemNumber (li_indice ,'nro_contrata')
//	//ll_codigo = long (ls_estado)
//	SELECT "SGD_VALOR"."DESCRIPCION"  
//	INTO :ls_estado
//   FROM "SGD_VALOR"  
//   WHERE ("SGD_VALOR"."CODIF" = 'EMPR' ) AND  
//         ("SGD_VALOR"."CODIGO" <> 0 )    AND
//			  "SGD_VALOR"."CODIGO" = :ll_codigo;
//
////   ls_nombre = "campo" + "_" + string(li_indice)
////	IF ls_estado ='' THEN ls_estado = string(ll_codigo)
////   // Para cada fila recuperada pegamos dinamicamente un texto con el estado del clima
////   dw_1.Modify('create text(name=' + ls_nombre+ ' band=Foreground ' + &
////   'font.charset="0" font.face="MS Sans Serif" font.family="2" font.height="-10" ' + &
////   'font.pitch="2" font.weight="400" background.mode="2" background.color="16777215" ' + &
////   'color="8388608" alignment="0" border="0" x="2850" y="' + string (li_posy) +'" height="64" width="315" ' + &
////   'text="' + ls_estado + '" )')
////	
////   // Se ha calculado la diferencia entre dos filas, por lo tanto cada vez que se pegue un texto
////   // se incrementar$$HEX2$$e1002000$$ENDHEX$$la fila
////
////   li_posy = li_posy + 71
//	
//   dw_1.modify("empresa.text='" + ls_estado + "'")
//NEXT

lst_impresion.total = 1

dw_1.SetTransObject(SQLCA)
lst_impresion.pdw_compuesto = dw_1
lst_impresion.zoom = 94
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)

//FOR li_indice = 1 TO dw_lista_brigadistas.RowCount()
//   ls_nombre = "campo" + "_" + string(li_indice)
//	dw_1.Modify(ls_nombre+ ".Visible=false")
//NEXT
end event

event resize;call super::resize;ib_llamada_open = true
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6203_mantenimiento_brigadistas
integer x = 581
end type

type cb_agregar from u_cb within w_6203_mantenimiento_brigadistas
integer x = 192
integer y = 1600
integer width = 411
integer height = 96
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

on clicked;call u_cb::clicked;Parent.TriggerEvent("ue_alta")
end on

type cb_eliminar from u_cb within w_6203_mantenimiento_brigadistas
integer x = 722
integer y = 1600
integer width = 411
integer height = 96
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Eliminar"
end type

event clicked;call super::clicked;Parent.TriggerEvent("ue_arch_eliminar")

gnu_u_transaction.uf_rollback(parent) //DBE 17/12/1999
end event

type cb_buscar from u_cb within w_6203_mantenimiento_brigadistas
integer x = 2313
integer y = 1600
integer width = 411
integer height = 96
integer taborder = 80
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Buscar"
end type

event clicked;call super::clicked;Parent.TriggerEvent("ue_armar_sql")

end event

type dw_lista_brigadistas from u_bri_2014_pr_mante_brigadistas within w_6203_mantenimiento_brigadistas
integer x = 101
integer y = 544
integer width = 3291
integer height = 960
integer taborder = 10
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;IF row > 0 THEN
	ii_fila_seleccionada  = row
	This.SelectRow(0,False)
	This.SelectRow(ii_fila_seleccionada,True)
END IF

end event

event doubleclicked;IF row > 0 THEN Parent.TriggerEvent("ue_abrir_mant_brig")

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

type cb_historico from commandbutton within w_6203_mantenimiento_brigadistas
integer x = 1783
integer y = 1600
integer width = 411
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Historico"
end type

event clicked;//DBE ini 16/12/1999
int li_islocked 


if ii_fila_seleccionada > 0 then

	li_islocked=gnu_u_transaction.uf_lock(parent,'GI_BRIGADISTA','NRO_BRIGADISTAS = '+&
	string(dw_lista_brigadistas.GetItemNumber(ii_fila_seleccionada,"nro_brigadistas")),false)
	if  li_islocked <> 0 then 
		choose case li_islocked
			    case -54
		gnv_msg.f_mensaje("EM22","","",OK!)
//		"Este Brigadista esta siendo modificado por otro Usuario."
	          case 100
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos de este Brigadista. Se necesita actualizarlos');
		Parent.TriggerEvent("ue_armar_sql")
		return 
		end choose
	else
		gnu_u_transaction.uf_rollback(parent)	
	end if

end if
//DBE fin 16/12/1999

Parent.TriggerEvent("ue_historico")
end event

type cb_consultar from commandbutton within w_6203_mantenimiento_brigadistas
integer x = 1253
integer y = 1600
integer width = 411
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Consultar"
end type

event clicked;long ll_fila, ll_nro_brigadista
int li_islocked //DBE  16/12/1999
int li_centro, li_cmd, li_mesa

ll_fila=dw_lista_brigadistas.getrow()
if ll_fila > 0 then
	gu_comunic.is_comunic.accion_llamada="Consulta"
	gu_comunic.is_comunic.longval1=dw_lista_brigadistas.object.nro_brigadistas[ll_fila]
	//DBE ini 16/12/1999
	li_islocked=gnu_u_transaction.uf_lock(parent,'GI_BRIGADISTA','NRO_BRIGADISTAS = '+&
	string(gu_comunic.is_comunic.longval1),false)
	if  li_islocked <> 0 then 
		choose case li_islocked
			    case -54
		gnv_msg.f_mensaje("EM22","","",OK!)
//		"Este Brigadista esta siendo modificado por otro Usuario."
	          case 100
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos de este Brigadista. Se necesita actualizarlos');
		Parent.TriggerEvent("ue_armar_sql")
		return 
		end choose
	else
		gnu_u_transaction.uf_rollback(parent)	
	end if
	//DBE fin 16/12/1999
	

//li_centro=dw_ambito.object.nro_centro[1]
//li_cmd=dw_ambito.object.nro_cmd[1]
//li_mesa=dw_ambito.object.nro_mesa[1]

//	fgnu_resetear_s_comunicaciones(gu_comunic)
//	gu_comunic.is_comunic = lu_comunic.is_comunic
	
	ll_nro_brigadista = dw_lista_brigadistas.getitemnumber(ii_fila_seleccionada, 'nro_brigadistas')

	select nro_centro, nro_cmd, nro_puesto
	into :li_centro, :li_cmd, :li_mesa
	from gi_brigadista
	where nro_brigadistas = :ll_nro_brigadista;
		
	gu_comunic.is_comunic.intval1 = li_centro
	gu_comunic.is_comunic.intval2 = li_cmd
	gu_comunic.is_comunic.intval3 = li_mesa
	
// Lee los datos de ambito del propio brigadista
	
open(w_6204_ingreso_brigadistas)
end if
end event

type dw_seleccion from u_bri_2005_pr_lista_brigadista within w_6203_mantenimiento_brigadistas
integer x = 2194
integer y = 128
integer width = 1088
integer height = 320
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
		This.fpr_habilitar_fechas()
	ELSE
		SetItem(1, "pi_en_turno",0)
		This.fpr_deshabilitar_fechas()
	END IF
END IF

end event

event losefocus;call super::losefocus;This.AcceptText()
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_6203_mantenimiento_brigadistas
integer x = 137
integer y = 88
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

type dw_1 from datawindow within w_6203_mantenimiento_brigadistas
boolean visible = false
integer x = 165
integer y = 676
integer width = 494
integer height = 360
integer taborder = 100
boolean bringtotop = true
string dataobject = "d_impresion_brigadista"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_6203_mantenimiento_brigadistas
integer x = 2843
integer y = 1600
integer width = 411
integer height = 96
integer taborder = 90
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


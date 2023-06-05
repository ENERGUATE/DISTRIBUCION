HA$PBExportHeader$w_2307_consulta_avisos.srw
$PBExportComments$tconavi
forward
global type w_2307_consulta_avisos from w_sgigenerica
end type
type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within w_2307_consulta_avisos
end type
type dw_1 from datawindow within w_2307_consulta_avisos
end type
type cb_imprimir from commandbutton within w_2307_consulta_avisos
end type
type cb_liberar_aviso from u_cb within w_2307_consulta_avisos
end type
type cb_asociar from u_cb within w_2307_consulta_avisos
end type
end forward

global type w_2307_consulta_avisos from w_sgigenerica
integer x = 466
integer y = 564
integer width = 5367
integer height = 1616
string title = ""
event ue_retrieve pbm_custom21
event ue_armar_sql pbm_custom22
d_lista_aviso d_lista_aviso
dw_1 dw_1
cb_imprimir cb_imprimir
cb_liberar_aviso cb_liberar_aviso
cb_asociar cb_asociar
end type
global w_2307_consulta_avisos w_2307_consulta_avisos

type variables
u_generico_comunicaciones iu_comunic
string is_clausula_where,is_clausula_where2,is_clausula_where3
string is_modificacion
string is_select_original, is_select_original2,is_select_original3,is_select_original4,is_select_original5,is_select_original6
string is_retorno
int ii_fila_ant,ii_tipo,ii_alcance
u_avi_2004_nu_form_inf_resumen lu_avi_2004_nu
u_avi_2021_rn_lista_avisos_cliente lu_avi_2021_rn
u_avi_1002_nu_generico lu_avi_1002
int il_trajo_datos,ii_estado
long li_nro_aviso_ant
long il_nro_fil
String is_modify_ext = ""  //**  OSGI 2002.1 12/11/2002
//AHM 29/09/2009 (Mejora 1/468636)
string	is_selectOriginalAux
end variables

forward prototypes
public function integer f_desa_botones (boolean pb_estado)
private function long wf_fueron_modificaciones ()
public function string wf_incluir_historicos (string ps_select)
public function long wf_obteneraviso (long pl_nroot, ref long pl_nroaviso)
end prototypes

event ue_retrieve;int xx
DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

xx=d_lista_aviso.fnu_obtener_datos()
d_lista_aviso.setsort("nro_aviso A")
d_lista_aviso.sort()
IF d_lista_aviso.rowcount() = 0 THEN
	cb_liberar_aviso.enabled=false
	il_trajo_datos=0
Else
	il_trajo_datos=1
End if

long ll_nro_avi
long ll_nro_avi_ant
long ll_nro_fila
long ll_cant_avisos

//ELIMINO LOS AVISOS REPETIDOS
IF iu_comunic.is_comunic.programa_llamante <> "w_3107" OR &
	IsNull(iu_comunic.is_comunic.programa_llamante) THEN
	if d_lista_aviso.rowcount()>0 then
		ll_nro_avi_ant = d_lista_aviso.getitemnumber(1,"nro_aviso")
		ll_nro_fila=2
		ll_cant_avisos=d_lista_aviso.rowcount()
		IF d_lista_aviso.rowcount()>1 then
			FOR xx=1 to (ll_cant_avisos - 1)
				ll_nro_avi = d_lista_aviso.getitemnumber(ll_nro_fila,"nro_aviso")
				if ll_nro_avi=ll_nro_avi_ant then
					d_lista_aviso.deleterow(ll_nro_fila)
				else
					ll_nro_fila=ll_nro_fila + 1
					ll_nro_avi_ant=ll_nro_avi
				END IF
			next
		END IF
		
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
		cb_imprimir.enabled = true
	else
		cb_imprimir.enabled = false
	end if
end if
end event

event ue_armar_sql;//Dependiendo de quien llamo armo la sentencia sql.
// Como son sentencias muy grandes, se dividieron  en varios parrafos.
string ls_select_hist = ""
long		ll_posicionFrom		//Posicion que ocupa la palabra reservada from en la sentencia de selecci$$HEX1$$f300$$ENDHEX$$n de la lista de avisos
string	ls_selectAux			//Select auxiliar para componer la select final	



//AHM (21/09/2009) Mejora 1/468636
IF iu_comunic.is_comunic.programa_llamante = "iw_ot_av"  AND gu_comunic.is_comunic.accion_llamada = "Asociar" THEN
		is_select_original = is_selectOriginalAux
		ll_posicionFrom = pos(is_select_original, 'FROM')
		
		ls_selectAux = left (is_select_original, ll_posicionFrom + 4 )
		ls_selectAux += " sgd_acometida, " + right(is_select_original, len(is_select_original) - (ll_posicionFrom + 3))
		
		is_select_original = ls_selectAux
		
		is_modificacion = ' '
		is_select_original2 = ' '
		is_select_original3 = ' '
		is_select_original4 = ' '
		is_select_original5 = ' '
		is_select_original6 = ' '
		is_clausula_where = " AND gi_avisos.est_aviso <> 3 AND gi_Avisos.est_aviso < 5 and gi_avisos.nro_aviso not in  ( select nro_aviso from gi_avisos_asoc_ot where nro_ot ="+String(iu_comunic.is_comunic.longval1)+")"
		is_clausula_where += " AND gi_avisos.nro_instalacion  = sgd_acometida.codigo and sgd_acometida.instalacion_origen in (select nro_instalacion from sgd_instalacion start with nro_instalacion = "+String(iu_comunic.is_comunic.longval2)+ " connect by prior nro_instalacion = nro_inst_padre)"
		is_clausula_where2 = ' '
		is_clausula_where3 = ' '
ELSEIF iu_comunic.is_comunic.programa_llamante = "iw_ot_av"  AND (gu_comunic.is_comunic.accion_llamada = "Desasociar" OR gu_comunic.is_comunic.accion_llamada = "Consultar")  THEN		
		is_select_original = is_selectOriginalAux
		ll_posicionFrom = pos(is_select_original, 'FROM')
		
		ls_selectAux = left (is_select_original, ll_posicionFrom + 4 )
		ls_selectAux += " sgd_acometida, " + right(is_select_original, len(is_select_original) - (ll_posicionFrom + 3))
		
		is_select_original = ls_selectAux
		
		is_modificacion = ' '
		is_select_original2 = ' '
		is_select_original3 = ' '
		is_select_original4 = ' '
		is_select_original5 = ' '
		is_select_original6 = ' '
		is_clausula_where = " AND gi_avisos.est_aviso <> 3 AND gi_Avisos.est_aviso < 5 and gi_avisos.nro_aviso in  ( select nro_aviso from gi_avisos_asoc_ot where nro_ot ="+String(iu_comunic.is_comunic.longval1)+")"
		is_clausula_where += " AND gi_avisos.nro_instalacion  = sgd_acometida.codigo and sgd_acometida.instalacion_origen in (select nro_instalacion from sgd_instalacion start with nro_instalacion = "+String(iu_comunic.is_comunic.longval2)+ " connect by prior nro_instalacion = nro_inst_padre)"
		is_clausula_where2 = ' '
		is_clausula_where3 = ' '	
ELSE
	IF iu_comunic.is_comunic.programa_llamante = "w_3107" THEN
	
		is_modificacion = ' '
		is_select_original2 = ' '
		is_select_original3 = ' '
		is_select_original4 = ' '
		is_select_original5 = ' '
		is_select_original6 = ' '
		is_clausula_where = " AND " +"gi_Avisos.Nro_aviso in  ( select nro_aviso from gi_avisos_instalacion where nro_instalacion ="+String(iu_comunic.is_comunic.decval1)+")"
		is_clausula_where2 = ' '
		is_clausula_where3 = ' '
	
	ELSE
	
		IF iu_comunic.is_comunic.longval1 <> 0 THEN
			is_select_original2 = ' '
			is_select_original3 = ' '
			is_select_original4 = ' '
			is_select_original5 = ' '
			is_select_original6 = ' '
	
			is_clausula_where = ' '
			is_clausula_where2 = ' '
			is_clausula_where3 = ' '
			is_modificacion = ' '
			is_clausula_where = " AND " 
			is_clausula_where = is_clausula_where +"GI_AVISOS.Nis_Rad="+String(iu_comunic.is_comunic.longval1)
		ELSE
			is_select_original2 = ' '
			is_select_original3 = ' '
			is_select_original4 = ' '
			is_select_original5 = ' '
			is_select_original6 = ' '
			is_clausula_where = ' '
			is_clausula_where2 = ' '
			is_clausula_where3 = ' '
			is_modificacion = ' '
			is_clausula_where = " AND " 
			is_clausula_where = is_clausula_where +"GI_AVISOS.Nro_Incidencia="+String(iu_comunic.is_comunic.longval2)
		End if
	END IF
	
	IF gu_comunic.is_comunic.strval1 = "historico" THEN
		ls_select_hist = ' UNION ' + wf_incluir_historicos(is_select_original + is_select_original3 + is_clausula_where + is_select_original2 + is_select_original4 + is_clausula_where2 + is_select_original5 + is_select_original6 + is_clausula_where3)
	END IF
	
END IF

is_modificacion = "DataWindow.Table.Select=~"" + is_select_original + is_select_original3 + is_clausula_where + is_select_original2 + is_select_original4 + is_clausula_where2 + is_select_original5 + is_select_original6 + is_clausula_where3 + ls_select_hist + "~""

is_retorno = d_lista_aviso.Modify(is_modificacion)

d_lista_aviso.SetTransObject(sqlca)

This.TriggerEvent("ue_retrieve")




end event

public function integer f_desa_botones (boolean pb_estado);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_desa_botones
//
// Objetivo: Habilita y Deshabilita botones.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//        Entrada: pb_estado
//        Salida : --
//
// Devuelve: 
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----	 	-----------		---------
//
///////////////////////////////////////////////////////////


If pb_estado = False THEN
	cb_liberar_aviso.enabled = FALSE
ELSE
	cb_liberar_aviso.enabled = TRUE
END IF
Return 1
end function

private function long wf_fueron_modificaciones ();long ll_nro_aviso
long ll_cuanto


if d_lista_aviso.getrow() >0 then 
else
	return -1
end if

ll_nro_aviso= d_lista_aviso.getitemnumber(d_lista_aviso.getrow(), 'nro_aviso')

IF iu_comunic.is_comunic.programa_llamante = "w_3107" THEN

select count(*) into :ll_cuanto
FROM "GI_AVISOS", "SGD_VALOR" 
WHERE (("GI_AVISOS"."PRIORIDAD" = "SGD_VALOR"."CODIGO" (+)) AND "SGD_VALOR"."CODIF"= 'PRI') 
      	AND gi_Avisos.Nro_aviso=:ll_nro_aviso;
 
 

ELSEIF iu_comunic.is_comunic.longval1 <> 0 THEN

select count(*) into :ll_cuanto
FROM "GI_AVISOS", "SGD_VALOR" 
WHERE (("GI_AVISOS"."PRIORIDAD" = "SGD_VALOR"."CODIGO" (+)) AND "SGD_VALOR"."CODIF"= 'PRI') 
      AND gi_Avisos.nis_rad=:iu_comunic.is_comunic.longval1
		AND gi_Avisos.Nro_aviso=:ll_nro_aviso;

	
	ELSE
		
select count(*) into :ll_cuanto
FROM "GI_AVISOS", "SGD_VALOR" 
WHERE (("GI_AVISOS"."PRIORIDAD" = "SGD_VALOR"."CODIGO" (+)) AND "SGD_VALOR"."CODIF"= 'PRI') 
      AND gi_Avisos.Nro_Incidencia=:iu_comunic.is_comunic.longval2
		AND gi_Avisos.Nro_aviso=:ll_nro_aviso;
		
	END IF

if sqlca.SQLCode<>0 then return -2 

return ll_cuanto
end function

public function string wf_incluir_historicos (string ps_select);string ls_select_hist, ls_tabla_original, ls_nueva_tabla, ls_plsql_orig, ls_plsql_nuevo
long ll_start_pos=1

ls_select_hist = Upper(ps_select)

ls_tabla_original = "GI_AVISOS"
ls_nueva_tabla = "GI_HIST_AVISOS"

// Se obtiene la primera aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos)
// Only enter the loop if you find old_str.
DO WHILE ll_start_pos > 0
	// Se sustituye la aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ls_select_hist = Replace(ls_select_hist, ll_start_pos, Len(ls_tabla_original), ls_nueva_tabla)
	// Se busca la siguiente aparici$$HEX1$$f300$$ENDHEX$$n de la tabla
	ll_start_pos = Pos(ls_select_hist, ls_tabla_original, ll_start_pos + Len(ls_nueva_tabla))

LOOP

return ls_select_hist
end function

public function long wf_obteneraviso (long pl_nroot, ref long pl_nroaviso);/********************************************************************************/
/* Descripcion: Obtiene el aviso que se ha producido antes dentro de los que	  */
/*					 tiene asociados la ot.														  */
/* Argumentos : pl_nroOt -> N$$HEX1$$fa00$$ENDHEX$$mero de la ot de la que se busca el aviso.		  */
/*					 pl_nroAviso -> N$$HEX1$$fa00$$ENDHEX$$mero de aviso que se ha producido antes, de    */
/*									    los que tiene asociado del aviso.					  */
/* Devuelve   :  1 -> correcto																  */
/*					 -1 -> incorrecto																  */
/*				Autor						Fecha					Acci$$HEX1$$f300$$ENDHEX$$n							  */
/*           AHM					29/09/2009			  Creaci$$HEX1$$f300$$ENDHEX$$n							  */
/********************************************************************************/
long		ll_nroAviso			//N$$HEX1$$fa00$$ENDHEX$$mero de aviso que hemos obtenido

SELECT NRO_AVISO
INTO :ll_nroAviso
FROM GI_AVISOS
WHERE NRO_AVISO IN (SELECT NRO_AVISO
						  FROM GI_AVISOS_ASOC_OT
						  WHERE NRO_OT = :pl_nroOt);
						  
IF sqlca.sqlcode < 0 THEN
	messageBox("Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos")
	RETURN -1
ELSEIF sqlca.sqlcode = 100 THEN
	pl_nroAviso = 0
ELSE
	pl_nroAviso = ll_nroAviso
END IF

RETURN 1
end function

event open;call super::open;	// Consulta de Avisos 
// Estructura de comunicaciones
// Entrada
	 //gu_comunic.is_comunic.longval2 // nro_incidencia
	 // gu_comunic.is_comunic.longval1 // nis_rad
	 // gu_comunic.is_comunic.accion_llamada = "Consulta" / "Actualizacion"
// Salida
	 // gu_comunic.is_comunic.programa_retorno "iw_2307_consulta_avisos"

string ls_blanco  
long ll_nro_inc

iu_comunic = CREATE u_generico_comunicaciones
lu_avi_2021_rn = CREATE u_avi_2021_rn_lista_avisos_cliente

// capturo valores en variable local de trabajo

iu_comunic.is_comunic = gu_comunic.is_comunic


//AHM 21/09/2009 Mejora 1/468636
IF iu_comunic.is_comunic.programa_llamante = "iw_ot_av" THEN
	This.title = "Lista de avisos"
	
	IF iu_comunic.is_comunic.accion_llamada = 'Asociar' THEN
		cb_asociar.visible = TRUE
		cb_asociar.enabled = TRUE
		cb_liberar_aviso.visible = FALSE
		cb_liberar_aviso.enabled = FALSE
	ELSEIF iu_comunic.is_comunic.accion_llamada = 'Desasociar' THEN
		cb_asociar.visible = FALSE
		cb_asociar.enabled = FALSE
		cb_liberar_aviso.visible = TRUE
		cb_liberar_aviso.enabled = TRUE
	ELSE
		cb_asociar.visible = FALSE
		cb_asociar.enabled = FALSE
		cb_liberar_aviso.visible = FALSE
		cb_liberar_aviso.enabled = FALSE
		cb_imprimir.visible = FALSE
		cb_imprimir.enabled = FALSE
		d_lista_aviso.enabled = FALSE
	END IF	
	
	dw_1.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")
	
	is_select_original = d_lista_aviso.describe("datawindow.table.select")
	is_selectOriginalAux = is_select_original

	This.TriggerEvent("ue_armar_sql")
	
	IF iu_comunic.is_comunic.accion_llamada = 'Desasociar' AND d_lista_aviso.rowCount() = 1 THEN
//		cb_liberar_aviso.visible = FALSE
		cb_liberar_aviso.enabled = FALSE
	END IF
		
ELSE	
	
	IF iu_comunic.is_comunic.programa_llamante = "w_3107" THEN
	
		This.title = gu_comunic.f_titulo_ventana("w_3107","List.Aviso.")
	
	ELSE
	
		This.title = "Avisos Asociados a la Incidencia"
		
	END IF
	
	SELECT "SGD_INCIDENCIA"."NRO_INCIDENCIA",
				"SGD_INCIDENCIA"."EST_ACTUAL",
				"SGD_INCIDENCIA"."ALCANCE",
				"SGD_INCIDENCIA"."TIP_INCIDENCIA"
			INTO :ll_nro_inc,:ii_estado,:ii_alcance, :ii_tipo 
			FROM "SGD_INCIDENCIA"  
			WHERE ( "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :iu_comunic.is_comunic.longval2 )   ;
	
	dw_1.modify("data_1.DataObject ='" + d_lista_aviso.DataObject + "'")
	//****************EFECTUO EL RETRIEVE A LA BASE DE DATOS*******************
	// Obtengo la clausula select original de la datawindow.
	
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
		d_lista_aviso.Modify ('create column (visible="1" band=detail id=40 alignment="0" ' + &
			'tabsequence=0 border="0" ' + &
			'color="8388608" x="6640" y ="4" height="64" '+ &
			'width="311" format="[general]" ' + &
			'name=nic edit.limit=0 edit.case=any ' + &
			'edit.autoselect=yes font.face="MS Sans Serif" ' + &
			'font.height= "-10" font.weight="400" ' + &
			'font.family="2" font.pitch="2" ' + &
			'font.charset="0" background.mode="0" ' + &
			'background.color="81324524")')
		
		d_lista_aviso.Modify ( 'create text (band=header  alignment="0" ' + &
			'text="NIC" border="6"  ' + &
			'color="0" x= "6637" y="4" height="64" ' + &
			'width="320" name=nic_t ' + &
			'font.face="MS Sans Serif" ' + &
			'font.height="-10" font.weight="700" ' + &
			'font.family="2" font.pitch="2" ' + &
			'font.charset="0" background.mode="0" ' + &
			'background.color="81324524" )')
			
			d_lista_aviso.Retrieve()
			d_lista_aviso.Setfocus()
		end if
	END IF
	// Fin GNU
	
	
	is_select_original = d_lista_aviso.describe("datawindow.table.select")
	
	This.TriggerEvent("ue_armar_sql")
	
	//// DBE ini ha comentado 18/01/2000
	//IF iu_comunic.is_comunic.accion_llamada ="Consulta" or lu_avi_2021_rn.frn_aut_liberar_aviso()=False THEN
	//	f_desa_botones(False)
	//END IF
	//// DBE fin  ha comentado 18/01/2000
	
	IF gu_perfiles.of_acceso_perfil(gi_perfil,'INC_LIBERAR_AV','ACC_MANTEN') = 1 AND &
		iu_comunic.is_comunic.accion_llamada <> 'Consulta' then
		
		f_desa_botones(true)
		
	//AHM (30/09/2009) Mejora 1/535253
	ELSE
		IF gu_perfiles.of_acceso_perfil(gi_perfil,'INC_LIBERAR_AV','ACC_MANTEN') = 1 THEN
			f_desa_botones(true)
		ELSE
			f_desa_botones(False)
		END IF
	END IF
	
	IF iu_comunic.is_comunic.programa_llamante = "w_3107"  THEN
		f_desa_botones(False)
	END IF
	
	IF il_trajo_datos = 0 THEN
		IF iu_comunic.is_comunic.programa_llamante = "W_1211" THEN
			gnv_msg.f_mensaje("AI26"," "," ",OK!)
		ELSE
			gnv_msg.f_mensaje("AI25"," "," ",OK!)
		END IF
	END IF
	
	//Parametrizo el n$$HEX1$$fa00$$ENDHEX$$mero del aviso//MERC
	
	IF gl_nro_aviso_visible THEN
		d_lista_aviso.Object.Nro_Aviso.Visible = 1
	ELSE
		d_lista_aviso.Object.Nro_Aviso.Visible = 0
	//	d_lista_aviso.Object.st_nro_aviso.Visible = 0
		d_lista_aviso.Modify("prioridad_t.Alignment='2'")
	END IF	
	
	ii_fila_ant = 1
	d_lista_aviso.SelectRow(ii_fila_ant,true)
	
	//Mejora (30/09/2009) 1/535253
//	if ii_estado>= fgci_incidencia_servicio_repuesto OR (ii_alcance=fgci_incidencia_de_suministro) then
	IF (ii_alcance=fgci_incidencia_de_suministro) THEN
		
		cb_liberar_aviso.enabled=false
		
	end if
	
	
	
	//******************************************
	//**  OSGI 2002.1  	12/11/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  NIVELES GEOGRAFICOS 						**
	//******************************************
	If fg_verifica_parametro('GEO') Then
		is_modify_ext = "nom_depto_t.text = '" + fg_geografica("2", d_lista_aviso.Describe("nom_depto_t.Text")) + "' "
		is_modify_ext += "nom_munic_t.text = '" + fg_geografica("3", d_lista_aviso.Describe("nom_munic_t.Text")) + "' "
		
		d_lista_aviso.Modify(is_modify_ext)
	End If
	//******************************************
	//**  OSGI 2002.1 	12/11/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  NIVELES GEOGRAFICOS 						**
	//******************************************
	
END IF

IF il_trajo_datos = 0 THEN
	Yield()
	messageBox("Aviso", "No se han recuperado datos")
	CLOSE(THIS)
END IF
end event

event close;call super::close;destroy lu_avi_2021_rn
destroy iu_comunic

//AHM (30/09/2009) Mejora 1/535253
gu_comunic.is_comunic.programa_llamante = "w_2307_consulta_avisos"


end event

event closequery;call super::closequery;iu_comunic.is_comunic.programa_retorno = "iw_2307_consulta_avisos"

// GNU 13-02-2007. Incidencia Ezequiel
if d_lista_aviso.RowCount()>0 then
	iu_comunic.is_comunic.longval4= d_lista_aviso.GetItemNumber(1,"nro_aviso")
else
	if il_trajo_datos>0 then
		iu_comunic.is_comunic.longval4=0
	end if
end if
// FIN GNU
gu_comunic.is_comunic = iu_comunic.is_comunic

end event

on w_2307_consulta_avisos.create
int iCurrent
call super::create
this.d_lista_aviso=create d_lista_aviso
this.dw_1=create dw_1
this.cb_imprimir=create cb_imprimir
this.cb_liberar_aviso=create cb_liberar_aviso
this.cb_asociar=create cb_asociar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_aviso
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.cb_imprimir
this.Control[iCurrent+4]=this.cb_liberar_aviso
this.Control[iCurrent+5]=this.cb_asociar
end on

on w_2307_consulta_avisos.destroy
call super::destroy
destroy(this.d_lista_aviso)
destroy(this.dw_1)
destroy(this.cb_imprimir)
destroy(this.cb_liberar_aviso)
destroy(this.cb_asociar)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN triggerevent("ue_armar_sql")

IF d_lista_aviso.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_aviso



//******************************************
//**  OSGI 2001.2  	12/11/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************
lst_impresion.modify = is_modify_ext
//******************************************
//**  OSGI 2001.2  	12/11/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  NIVELES GEOGRAFICOS 						**
//******************************************



gf_impresion_preliminar (lst_impresion, True, 0)
end event

event activate;call super::activate;this.setFocus()
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2307_consulta_avisos
end type

type d_lista_aviso from u_avi_2021_pr_lista_avisos_cliente within w_2307_consulta_avisos
integer x = 27
integer y = 36
integer width = 5285
integer height = 1292
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = false
borderstyle borderstyle = styleraised!
end type

on retrievestart;call u_avi_2021_pr_lista_avisos_cliente::retrievestart;li_nro_aviso_ant=0
il_nro_fil=0
end on

on constructor;call u_avi_2021_pr_lista_avisos_cliente::constructor;//This.SetRowFocusIndicator(Hand!)
end on

event clicked;call super::clicked;IF row > 0 THEN
	this.selectrow(ii_fila_ant,False)
	ii_fila_ant = row
	this.selectrow(row,true)
	IF ii_estado < fgci_incidencia_servicio_repuesto and (ii_alcance<>fgci_incidencia_de_suministro) then
		//AHM (29/09/2009) Mejora 1/468636
		IF iu_comunic.is_comunic.accion_llamada <> 'Consulta' AND iu_comunic.is_comunic.accion_llamada <> 'Desasociar' THEN
			cb_liberar_aviso.enabled=true
		END IF
	END IF
END IF



end event

event doubleclicked;call super::doubleclicked;// Si se selecciono alguno

////DBE ini 17/01/2000
long ll_modific
ll_modific=wf_fueron_modificaciones()
if ll_modific<0 then
	   return 

elseif ll_modific = 0 AND gu_comunic.is_comunic.strval1 <> "historico" THEN 
	gnv_msg.f_mensaje('AA12','','',OK!)
	parent.TriggerEvent("ue_armar_sql")
	if d_lista_aviso.rowcount()>0 then 
	return
   else 
		close (parent)
	end if 
	return
end if
////DBE ini 17/01/2000


IF row > 0 THEN
	SETPOINTER(HOURGLASS!)
	this.SelectRow(ii_fila_ant,False)    //elimino la marcar anterior
	this.SelectRow(row,True)  // marco el seleccionado
	ii_fila_ant = row
	gu_comunic.is_comunic.longval1 = this.getitemnumber(row,"nro_aviso")
	gu_comunic.is_comunic.longval5 = 1
	gu_comunic.is_comunic.accion_llamada = "Consulta"
	gu_comunic.is_comunic.programa_llamante = "w_2307_consulta_aviso"
	//AHM 30/09/2009 Mejora 1/535253
	gu_comunic.is_comunic.w_llamante = PARENT
	IF gu_comunic.is_comunic.strval1 = "historico" AND ll_modific = 0 THEN
		//Open(w_1203_inf_aviso_hist)
		OpenSheet(w_1203_inf_aviso_hist,w_operaciones,8, Layered!)
		//AHM 30/09/2009 Mejora 1/535253
//		Close(Parent)
		w_1203_inf_aviso_hist.setFocus()
	ELSE
		//Open(w_1203_inf_aviso)
		OpenSheet(w_1203_inf_aviso,w_operaciones,8, Layered!)
		//AHM 30/09/2009 Mejora 1/535253
//		Close(Parent)
		w_1203_inf_aviso.setFocus()
	END IF
END IF


end event

on rowfocuschanged;call u_avi_2021_pr_lista_avisos_cliente::rowfocuschanged;//
end on

event ue_key_down;call super::ue_key_down;IF Key = KeyLeftArrow! THEN
	IF this.getselectedrow(0) > 1 AND this.getselectedrow(0) < This.RowCount() THEN
		This.scrolltorow(this.getselectedrow(0)+1)
	END IF
	return
ELSEIF Key = KeyRightArrow! THEN
	IF this.getselectedrow(0)> 1 THEN
		This.scrolltorow(this.getselectedrow(0) - 1)
	END IF
	return
END IF

end event

type dw_1 from datawindow within w_2307_consulta_avisos
boolean visible = false
integer x = 73
integer y = 224
integer width = 494
integer height = 360
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_2307_consulta_avisos
integer x = 2459
integer y = 1368
integer width = 503
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
boolean default = true
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type cb_liberar_aviso from u_cb within w_2307_consulta_avisos
boolean visible = false
integer x = 453
integer y = 1044
integer width = 503
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "Desasociar"
boolean default = true
end type

event clicked;DateTime ldt_fecha_resuelto,ldt_f_actual,ldt_f_nueva
DateTime ldt_fecha_procesado
Long ll_nro_aviso
Long li_cantidad
int li_cant_avisos, li_interrup, li_ind_calidad, li_clase_aviso
int li_ind_peligro,li_ind_cliente_importante
long li_nro_incidencia,ll_ct,ll_cant_av_ct
int li_result_func,li_actuacion,li_est_aviso
string ls_est_aviso,ls_mensaje
datetime		ldt_fAlta					//Fecha de alta del aviso
int			li_tipoAviso				//Tipo del aviso
int			li_tipoInstalacion		//Tipo de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando
long			ll_nroInstalacion			//N$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando
long			ll_nroInstPadre			//N$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n padre, de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando
long			ll_numeroRegistros		//N$$HEX1$$fa00$$ENDHEX$$mero de registros 
long			ll_numeroAviso				//N$$HEX1$$fa00$$ENDHEX$$mero aviso a cargar en la tabla gi_ot
long			ll_zona						//C$$HEX1$$f300$$ENDHEX$$digo de la zona
long			ll_cmd						//C$$HEX1$$f300$$ENDHEX$$digo del cmd
long			ll_sector					//C$$HEX1$$f300$$ENDHEX$$digo del sector
string		ls_nomInstalacion			//Nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando

ll_nro_aviso = d_lista_aviso.object.nro_aviso[d_lista_aviso.getrow()]
ldt_f_actual = fgnu_fecha_actual()
ldt_f_nueva =  d_lista_aviso.object.f_Actual[d_lista_aviso.getrow()]
li_clase_aviso =  d_lista_aviso.object.clase_aviso[d_lista_aviso.getrow()]
li_est_aviso  =  d_lista_aviso.object.est_aviso[d_lista_aviso.getrow()]
	
//AHM (29/30/2009) Mejora 1/468636
IF gu_comunic.is_comunic.programa_llamante = 'iw_ot_av' THEN
	IF messagebox("Cuesti$$HEX1$$f300$$ENDHEX$$n","Esta acci$$HEX1$$f300$$ENDHEX$$n desasociar$$HEX2$$e1002000$$ENDHEX$$el aviso de la ot. $$HEX1$$bf00$$ENDHEX$$Desea continuar?",question!,YesNo!) = 1 THEN
			
		DELETE FROM GI_AVISOS_ASOC_OT 
		WHERE NRO_OT = :gu_comunic.is_comunic.longval1 
		AND NRO_AVISO = :ll_nro_aviso;
			
		IF sqlca.sqlcode <> 0 then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar desasociar el aviso: " + sqlca.sqlerrtext)
			RETURN
		END IF
		
		SELECT count(*)
		INTO :ll_numeroRegistros
		FROM gi_ot
		WHERE nro_aviso = :ll_nro_aviso
		AND nro_ot = :gu_comunic.is_comunic.longval1;
		
		IF ll_numeroRegistros > 0 THEN
			
			IF wf_obtenerAviso(gu_comunic.is_comunic.longval1, ll_numeroAviso) = 1 THEN
			
				UPDATE GI_OT
				SET NRO_AVISO = :ll_numeroAviso
				WHERE NRO_OT = :gu_comunic.is_comunic.longval1;
				
			END IF
			
		END IF
		
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El aviso ha sido desasociado de la ot.")
			
		PARENT.TriggerEvent("ue_retrieve")
		
		d_lista_aviso.SelectRow(0,FALSE)
		
		IF d_lista_aviso.RowCount() > 0 THEN
			d_lista_aviso.SelectRow(1, TRUE)
			cb_liberar_aviso.enabled = TRUE
			IF d_lista_aviso.RowCount() = 1 THEN
//				cb_liberar_aviso.visible = FALSE
				cb_liberar_aviso.enabled = FALSE
			END IF
		ELSE
			cb_liberar_aviso.enabled = FALSE
			messageBox("Aviso", "No hay m$$HEX1$$e100$$ENDHEX$$s avisos que desasociar")
			CLOSE(PARENT)
		END IF
	
	END IF
	
ELSE	
	//AHM (30/09/2009) Mejora 1/535253
//	// Se van a bloquear las tablas GI_AVISOS y GI_AVISOS_INSTALACION 	
//	if li_est_aviso <> fgci_aviso_asociado then
//		
//		  SELECT "SGD_VALOR"."DESCRIPCION"  
//			INTO :ls_est_aviso  
//			FROM "SGD_VALOR"  
//			WHERE ( "SGD_VALOR"."CODIF" = 'E_AV' ) AND  
//					( "SGD_VALOR"."CODIGO" = :li_est_aviso )   ;
//		 
//		Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El aviso se encuentra en estado " + ls_est_aviso + ". No se puede desasociar.",information!,ok!)
//		
//		return
//		
//	end if
		
	if messagebox("Cuesti$$HEX1$$f300$$ENDHEX$$n","Esta acci$$HEX1$$f300$$ENDHEX$$n desasocia el aviso de la incidencia. $$HEX1$$bf00$$ENDHEX$$Desea continuar?",question!,YesNo!) = 1 then
	
		li_result_func = gnu_u_transaction.uf_bloquea_avisos( ldt_f_nueva, fgci_bloq_reactivar_avisos, ll_nro_aviso)
				
		if li_result_func= -2 then
			parent.TriggerEvent("ue_retrieve")
			return
		end if
		
		if li_result_func= -54 then
			return
		end if
		
		UPDATE GI_AVISOS
		SET GI_AVISOS.EST_AVISO=1,
			GI_AVISOS.F_ACTUAL= :ldt_f_actual,
			GI_AVISOS.NRO_INCIDENCIA= 0,
			GI_AVISOS.IND_INC_MANUAL=null,	
			GI_AVISOS.IND_INC_ASOC= null,
			GI_AVISOS.PROGRAMA= 'w_2307',
			GI_AVISOS.USUARIO = :gs_usuario,
			GI_AVISOS.FECHA_RES = NULL,
			GI_AVISOS.HORA_RES = NULL
		WHERE GI_AVISOS.NRO_AVISO = :ll_nro_aviso;
		
		
		IF sqlca.sqlcode <> 0 then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar reactivar el aviso: " + sqlca.sqlerrtext)
			 li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //rollback
			return
		end if
				
		SELECT count(*)
		INTO :ll_numeroRegistros
		FROM gi_avisos_instalacion
		WHERE nro_aviso = :ll_nro_aviso;
		
		IF sqlca.sqlcode <> 0 THEN
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar reactivar el aviso: " + sqlca.sqlerrtext)
			 li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //rollback
			RETURN
		END IF
		
		IF ll_numeroRegistros = 0 THEN
			//AHM (15/03/2011) ASUR 990319
			//AHM (09/12/2010) ASUR 824470
			//AHM(13/07/2010) ASUR 655186
			DECLARE lc_instalaciones CURSOR FOR 
				SELECT TIPO_INSTALACION,
						 NRO_INSTALACION,
						 NRO_INST_PADRE,
						 NOM_INSTALACION
				FROM sgd_instalacion
				START WITH nro_instalacion = (SELECT sgd_acometida.instalacion_origen 
														FROM GI_AVISOS, aco_sum, sgd_acometida 
														WHERE sgd_acometida.bdi_job = 0
														AND gi_avisos.nis_rad = aco_sum.nis_rad 
														AND aco_sum.NRO_ACOMETIDA = sgd_acometida.codigo 
														AND nro_aviso = :ll_nro_aviso)
				AND BDI_JOB = 0
				CONNECT BY PRIOR nro_inst_padre = nro_instalacion AND bdi_job = 0; 
			
			ldt_fAlta = d_lista_aviso.object.f_alta[d_lista_aviso.getrow()]
			li_tipoAviso = d_lista_aviso.object.tip_aviso[d_lista_aviso.getrow()]
			ll_zona = d_lista_aviso.object.nro_centro[d_lista_aviso.getrow()]
			ll_cmd = d_lista_aviso.object.nro_cmd[d_lista_aviso.getrow()]
			ll_sector = d_lista_aviso.object.nro_mesa[d_lista_aviso.getrow()]
			
			OPEN lc_instalaciones;
			
			IF sqlca.sqlcode <> 0 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error, en la apertura del cursor, al intentar reactivar el aviso: " + sqlca.sqlerrtext)
				li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //rollback
				RETURN				
			END IF
			
			FETCH lc_instalaciones 
			INTO :li_tipoInstalacion, 
				  :ll_nroInstalacion,
				  :ll_nroInstPadre,
				  :ls_nomInstalacion;
				  
			DO WHILE sqlca.sqlcode = 0
			
			
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
					  sysdate,   
					  :gs_usuario,   
					  'w_2307CA',   
					  :li_tipoInstalacion,   
					  :ll_nro_aviso,   
					  :ll_nroInstalacion,   
					  :ll_nroInstPadre,   
					  1,   
					  :li_clase_aviso,   
					  :ll_zona,
					  :ll_cmd,     
					  :ll_sector,   
					  :ldt_fAlta,   
					  0,   
					  :li_clase_aviso,
					  :ls_nomInstalacion)  ;
					  
				IF sqlca.sqlcode <> 0 THEN
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error, en la inserci$$HEX1$$f300$$ENDHEX$$n de las instalaciones, al intentar reactivar el aviso: " + sqlca.sqlerrtext)
					li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //rollback
					RETURN
				END IF
				
				FETCH lc_instalaciones 
				INTO :li_tipoInstalacion, 
					  :ll_nroInstalacion,
					  :ll_nroInstPadre,
					  :ls_nomInstalacion;
				
			LOOP
			
			CLOSE lc_instalaciones;
			
			IF sqlca.sqlcode <> 0 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error, al cerrar el cursor de las instalaciones, al intentar reactivar el aviso: " + sqlca.sqlerrtext)
				li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //rollback
				RETURN
			END IF
			
		END IF
		
		if  li_clase_aviso = fgci_clase_avi_normal or li_clase_aviso = fgci_clase_avi_calidad then
			
			li_actuacion = messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Desea cambiar la alimentacion del aviso?",Information!,YesNo!) 
		
		else 
			
			li_actuacion = 2
		
		end if
		
		if li_actuacion = 2 then
					
	
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
									
	//				gu_rf_servidor_operacion.of_tool_aviso(ll_ct,fgnu_fecha_actual(),1,ls_mensaje,gi_ci_ct)
								
					IF ls_mensaje <> "" then
						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error al dar de alta el tool: " + ls_mensaje,information!,ok!)
					END IF	
									
				END IF
			
			END IF
			
			UPDATE GI_AVISOS_INSTALACION
			SET GI_AVISOS_INSTALACION.EST_AVISO=1,
					GI_AVISOS_INSTALACION.F_ACTUAL= :ldt_f_actual,
					GI_AVISOS_INSTALACION.PROGRAMA= 'w_2307',
					GI_AVISOS_INSTALACION.USUARIO = :gs_usuario
			WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :ll_nro_aviso;
			
			IF sqlca.sqlcode <> 0 then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar liberar el aviso: " + sqlca.sqlerrtext)
				li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //rollback
				return
			end if
			
			li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,1) //commit
			
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El aviso ha sido liberado quedando en estado pendiente.")
			
			//cb_liberar_aviso.enabled=false
		ELSE
							
			//EL AVISO NO ESTA ASOCIADO A INC. Y NO SALE POR BLOQUEO
		
			fgnu_resetear_s_comunicaciones(gu_comunic)
			fgnu_resetear_s_comunicaciones(gu_comunic1)
			// Se crea el objeto con el que se va a recibir la estructura
			// de la ventana que se llama (la de Cambio de alimentacion)
			
			// Se carga la estructura con los valores para la
			// llamada a una ventana
		
			gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_b"
			gu_comunic.is_comunic.accion_llamada = 'Seleccion'
					
			gu_comunic.is_comunic.intval1 = d_lista_aviso.GetItemNumber (ii_fila_ant, "nro_centro")
			gu_comunic.is_comunic.intval2 = d_lista_aviso.GetItemNumber (ii_fila_ant, "nro_cmd")
			gu_comunic.is_comunic.intval3 = d_lista_aviso.GetItemNumber (ii_fila_ant, "nro_mesa")
				
			// Va a permitir traer las instalaciones para el centro
			// y cmd dado ( sin considerar la mesa)
			gu_comunic.is_comunic.intval4 = 2
					
			gu_comunic.is_comunic.intval5 = 2
			gu_comunic.is_comunic.intval6 = 0
			gu_comunic.is_comunic.strval1 = "d_lista_aviso"
			gu_comunic.is_comunic.programa_retorno = ' '
		
			Open(w_2120_identificacion_instalacion)
		
			lu_avi_1002 = CREATE u_avi_1002_nu_generico 
		
			if not isnull (gu_comunic1.is_comunic.decval1) and gu_comunic1.is_comunic.decval1<> 0 then
				lu_avi_1002.fnu_cambiar_alim_avi(d_lista_aviso,ii_fila_ant,&
				d_lista_aviso,&
				d_lista_aviso.GetItemNumber(ii_fila_ant,"nro_aviso"),&					
				gu_comunic1.is_comunic.decval1,&
				d_lista_aviso.GetItemNumber(ii_fila_ant,"nis_rad"),&
				d_lista_aviso.GetItemNumber(ii_fila_ant,"nro_ot"),&
				d_lista_aviso.GetItemDateTime(ii_fila_ant,"f_alta"), &
				gu_comunic1.is_comunic.strval4,3,0) //LSH ** DDAG-255 ** 30/01/2014 ** Se agrego el 0 como nuevo argumento de la funcion 
			
				DESTROY lu_avi_1002
			
				li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,1) //commit
				
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El aviso ha sido liberado quedando en estado pendiente.")
				
				//cb_liberar_aviso.enabled=false
			else
				
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no puede ser nula.")
				
				DESTROY lu_avi_1002
			
				li_result_func = gnu_u_transaction.uf_desbloquea_avisos(ll_nro_aviso,2) //Rollback
				
			end if
			
		
		END IF
		
		parent.TriggerEvent("ue_retrieve")
		
		d_lista_aviso.SelectRow(0,FALSE)
		
		IF d_lista_aviso.RowCount() > 0 THEN
			d_lista_aviso.SelectRow(1,true)
			cb_liberar_aviso.enabled=true
		ELSE
			cb_liberar_aviso.enabled=false
		END IF
		
	end if
END IF
end event

type cb_asociar from u_cb within w_2307_consulta_avisos
boolean visible = false
integer x = 453
integer y = 1044
integer width = 503
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "Asociar"
boolean default = true
end type

event clicked;dateTime ldt_f_actual			//Fecha actual del sistema
datetime	ldt_f_nueva				//Fecha del aviso
int		li_result_func			//Resultado de la funci$$HEX1$$f300$$ENDHEX$$n de bloqueo y desbloqueo del aviso
long		ll_nro_aviso			//N$$HEX1$$fa00$$ENDHEX$$mero del aviso

ll_nro_aviso = d_lista_aviso.object.nro_aviso[d_lista_aviso.getrow()]
ldt_f_actual = fgnu_fecha_actual()
ldt_f_nueva =  d_lista_aviso.object.f_Actual[d_lista_aviso.getrow()]


IF messagebox("Cuesti$$HEX1$$f300$$ENDHEX$$n","Esta acci$$HEX1$$f300$$ENDHEX$$n asociar$$HEX2$$e1002000$$ENDHEX$$el aviso de la ot. $$HEX1$$bf00$$ENDHEX$$Desea continuar?",question!,YesNo!) = 1 THEN
	
	INSERT INTO GI_AVISOS_ASOC_OT (USUARIO, F_ACTUAL, PROGRAMA, NRO_OT, NRO_AVISO)
	VALUES (:gs_usuario, SYSDATE, 'iw_asoc_avisos', :gu_comunic.is_comunic.longval1, :ll_nro_aviso);

	IF sqlca.sqlcode <> 0 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al intentar asociar el aviso: " + sqlca.sqlerrtext)
		RETURN
	END IF
	
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","El aviso ha sido asociado a la ot.")
		
	PARENT.TriggerEvent("ue_retrieve")
	
	d_lista_aviso.SelectRow(0,FALSE)
	
	IF d_lista_aviso.RowCount() > 0 THEN
		d_lista_aviso.SelectRow(1, TRUE)
		cb_asociar.enabled = TRUE
	ELSE
		cb_asociar.enabled = FALSE
		messageBox("Aviso", "No hay mas avisos que asociar")
		CLOSE(PARENT)
	END IF

END IF


end event


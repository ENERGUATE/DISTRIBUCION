HA$PBExportHeader$w_reportes_new.srw
$PBExportComments$NUEVA VENTANA 17/11/2000
forward
global type w_reportes_new from window
end type
type st_causa from statictext within w_reportes_new
end type
type dw_lista_corte from datawindow within w_reportes_new
end type
type dw_lista_agrupar from datawindow within w_reportes_new
end type
type dw_1 from datawindow within w_reportes_new
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_reportes_new
end type
type st_2 from statictext within w_reportes_new
end type
type mle_titulo from multilineedit within w_reportes_new
end type
type st_1 from statictext within w_reportes_new
end type
type st_corte_por from statictext within w_reportes_new
end type
type st_agrupor from statictext within w_reportes_new
end type
type st_ordpor from statictext within w_reportes_new
end type
type st_obj_inf from statictext within w_reportes_new
end type
type st_funcion from statictext within w_reportes_new
end type
type dw_funcion from u_pr_funcion within w_reportes_new
end type
type dw_lista_reporte from u_lista_reporte within w_reportes_new
end type
type dw_lista_orden from u_lista_orden within w_reportes_new
end type
type mle_subtitulo from multilineedit within w_reportes_new
end type
type st_material from statictext within w_reportes_new
end type
type dw_filtro from u_gen_7001_pr_filtro_reporte_inc_new within w_reportes_new
end type
type st_instalacion from statictext within w_reportes_new
end type
end forward

global type w_reportes_new from window
integer x = 1056
integer y = 484
integer width = 3589
integer height = 2076
boolean titlebar = true
string title = "Objeto de Creaci$$HEX1$$f300$$ENDHEX$$n de Informes Din$$HEX1$$e100$$ENDHEX$$micos."
string menuname = "m_reportes"
boolean controlmenu = true
boolean minbox = true
windowstate windowstate = maximized!
long backcolor = 79741120
string icon = "Reportes.ico"
event ue_armar_sql ( )
event ue_deseleccionar_todo ( )
event ue_seleccionar_todo ( )
event ue_setear_datos ( )
event ue_imprimir ( )
event ue_grabar_pref ( )
event ue_abrir_pref ( string pas_pref )
event ue_abrir_reporte ( string ps_contenido )
event ue_grabar_reporte ( )
event ue_exportar_excel ( )
st_causa st_causa
dw_lista_corte dw_lista_corte
dw_lista_agrupar dw_lista_agrupar
dw_1 dw_1
dw_ambito dw_ambito
st_2 st_2
mle_titulo mle_titulo
st_1 st_1
st_corte_por st_corte_por
st_agrupor st_agrupor
st_ordpor st_ordpor
st_obj_inf st_obj_inf
st_funcion st_funcion
dw_funcion dw_funcion
dw_lista_reporte dw_lista_reporte
dw_lista_orden dw_lista_orden
mle_subtitulo mle_subtitulo
st_material st_material
dw_filtro dw_filtro
st_instalacion st_instalacion
end type
global w_reportes_new w_reportes_new

type variables
long il_row
string is_newfrom[], is_tabla_principal, is_preferencia
s_print str_print_new
u_generico_comunicaciones iu_comunic
DatawindowChild idwchild_famcausa, idwchild_codcausa
Boolean ib_gpo_causa

String is_order_by

String is_campo_inc = 'ai_tipo'  //**  OSGI 2001.1  18/06/2001

int ii_filas_seleccionadas = 0

datawindowchild ddw_tension_incid_t
datawindowchild ddw_tipo_tension_t

boolean ib_error = FALSE

string is_columna

int ii_alcance
end variables

forward prototypes
public subroutine f_armar_select ()
public subroutine f_verifica_from (any pas_from, long pal_cant)
public subroutine f_modificar_dw (string pas_select)
public subroutine f_ordenar_indice (integer pi_row, integer pi_orden)
public subroutine f_titulo_subtitulo ()
public subroutine f_inabilitar_menu ()
public subroutine f_habilitar_menu ()
public function string f_preparo_archivo ()
public function integer f_interpretar_archivo (string ps_contenido)
public subroutine f_desabilitar ()
public subroutine f_habilitar ()
public subroutine f_reordena_indice (long pas_indice, integer pas_cantfilas)
public subroutine fw_fam_causa ()
public subroutine fw_causa (readonly long al_gpo_causa)
public subroutine dw ()
public subroutine dwdsfsd ()
public subroutine fw_filtro_tipo_inc_ext ()
public subroutine f_armar_select_reenganches ()
public function integer fw_validar_fechas ()
public subroutine f_armar_select_brigadas ()
end prototypes

event ue_armar_sql();integer li_cantrow, li_row, li_count, li_find, li_agrupar ,&
			li_corte, li_cantidad, li_funcion, li_i, li_countdemas, &
			li_alcance, li_num_fil_sel, li_nulo
long ll_indice, ll_i, ll_cont

SetNull(li_nulo)

li_cantrow = dw_lista_reporte.Rowcount()

li_find = dw_lista_reporte.Find("funcion <> '' ",1,li_cantrow)

dw_filtro.AcceptText()

if fw_validar_fechas()= -1 then
	return
end if

IF dw_filtro.GetItemNumber(1,"rango") = 0 THEN
	IF dw_filtro.GetItemDateTime(1,"pa_rango") > dw_filtro.GetItemDateTime(1,"pa_periodo") THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha Desde no puede ser mayor que la fecha Hasta. Rectifique",exclamation!)
		return
	END IF
END IF

IF li_find > 0 And dw_lista_agrupar.RowCount() <= 0 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe agrupar por alg$$HEX1$$fa00$$ENDHEX$$n campo para generar la consulta",exclamation!)
	return
ELSEIF li_find <= 0 AND dw_lista_agrupar.RowCount() > 0 THEN //SUR 13 *JHE 15/02/2001*
//SUR 13 *JHE 15/02/2001*
	FOR ll_i = 1 TO li_cantrow
		IF dw_lista_reporte.IsSelected(ll_i) THEN ll_cont ++
	NEXT
	
	IF dw_lista_reporte.IsSelected(dw_lista_reporte.Find("campo = 'cantidad'",1,li_cantrow)) AND &
		ll_cont > 2 AND dw_lista_corte.Rowcount() = 0 THEN	
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe aplicar una funci$$HEX1$$f300$$ENDHEX$$n si se ha agrupado, para poder generar la consulta",exclamation!)
		return 
	ELSEIF ll_cont >= 2 AND dw_lista_agrupar.Rowcount() > 0 AND &
			 dw_lista_reporte.IsSelected(dw_lista_reporte.Find("campo = 'cantidad'",1,li_cantrow)) = FALSE THEN	
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe aplicar una funci$$HEX1$$f300$$ENDHEX$$n o seleccionar el campo (Cantidad de datos) si se ha agrupado," +&
									  " para poder generar la consulta",exclamation!)
		return		
	END IF
//SUR 13 *JHE 15/02/2001*
END IF

If li_find > 0 THEN
	
	

	DO
		ll_indice += 1
		
		li_find = dw_lista_reporte.Find("indice = "+ string(ll_indice) +"",1,li_cantrow)

		If li_find > 0 THEN
			IF dw_lista_reporte.GetItemString(li_find,"nombre") = dw_lista_agrupar.getITemString(1,"nombre") THEN
				li_agrupar = 1
				li_count ++
			ELSEIF dw_lista_reporte.GetItemString(li_find,"campo") = "cantidad" THEN
					li_cantidad = 1
					li_count ++
			ELSEIF dw_lista_reporte.GetItemString(li_find,"funcion") <> "" THEN
					li_funcion = 1
					li_count ++
			ELSEIF dw_lista_corte.Rowcount() > 0 And li_corte = 0 THEN
					IF dw_lista_reporte.GetItemString(li_find,"nombre") = dw_lista_corte.getITemString(1,"nombre") THEN
						li_corte = 1
						li_count ++
					ELSE
						li_count ++
					END IF
			ELSE
				li_count ++
			END IF
		END IF
	LOOP UNTIL li_find = 0 or Isnull(li_find)
	
	IF li_count > 4 and li_cantidad = 0 and li_corte = 0 THEN 
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Existen uno o m$$HEX1$$e100$$ENDHEX$$s campos seleccionados. Para poder generar la consulta por agrupaci$$HEX1$$f300$$ENDHEX$$n " /*+"~n"*/ +&
									 "debe seleccionar el campo (Cantidad de datos) o uno para Corte Por.",exclamation!)
		return
	ELSEIF li_count > 4 and li_cantidad = 0 and li_corte = 1 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Existen m$$HEX1$$e100$$ENDHEX$$s campos seleccionados de lo debido. Para poder generar la consulta por agrupaci$$HEX1$$f300$$ENDHEX$$n " /*+"~n"*/+&
									 "seleccione el campo (Cantidad de datos)",exclamation!)
		return
	ELSEIF li_count >= 4 and li_cantidad = 1 and li_corte = 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Existen m$$HEX1$$e100$$ENDHEX$$s campos seleccionados de lo debido. Para poder generar la consulta por agrupaci$$HEX1$$f300$$ENDHEX$$n "/*+"~n"*/+&
									 "seleccione un campo para Corte Por.",exclamation!)
		return
	ELSEIF li_count > 4 and li_cantidad = 1 and li_corte = 1 and li_cantidad = 1 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Existen m$$HEX1$$e100$$ENDHEX$$s campos seleccionados de lo debido. Para poder generar la consulta por agrupaci$$HEX1$$f300$$ENDHEX$$n "/*+"~n"*/+&
									 "deseleccione algunos ",exclamation!)
		return		
	ELSEIF li_count > 4 and li_agrupar = 1 and li_corte = 0 and li_cantidad = 0 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Existen m$$HEX1$$e100$$ENDHEX$$s campos seleccionados de lo debido. Para poder generar la consulta por agrupaci$$HEX1$$f300$$ENDHEX$$n "/*+"~n"*/+&
									"debe seleccionar el campo (Cantidad de datos) o un campo para Corte Por." ,exclamation!)
		return
	ELSEIF li_count > 4 and li_agrupar = 1 and li_corte = 0 and li_cantidad = 1 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Existen m$$HEX1$$e100$$ENDHEX$$s campos seleccionados de lo debido. Para poder generar la consulta por agrupaci$$HEX1$$f300$$ENDHEX$$n "/*+"~n"*/+&
									 "debe seleccionar un campo para Corte Por o deseleccionar algunos." ,exclamation!)
		return	
	
	END IF
	IF li_count < 3 THEN
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar el campo (Cantidad de datos) o un campo para Corte Por." ,exclamation!)
		return		
	END IF
END IF

//li_alcance = dw_filtro.GetItemNumber(1,'pa_alcance')
//IF li_alcance = fgci_incidencia_reenganche THEN

IF dw_lista_reporte.IsSelected(dw_lista_reporte.RowCount()) THEN
	li_num_fil_sel = 0 
	ll_indice = 0
	
	DO
		ll_indice = dw_lista_reporte.GetSelectedRow(ll_indice) 
		li_num_fil_sel ++
	LOOP UNTIL dw_lista_reporte.GetSelectedRow(ll_indice) = 0
	
	dw_lista_reporte.SetItem(dw_lista_reporte.RowCount(),"indice",li_num_fil_sel)
END IF

is_tabla_principal = dw_lista_reporte.GetItemString(1,"tabla")
// GNU 24-4-2007. Mejora 1/343671
//IF is_tabla_principal = 'sgd_reenganches' THEN
//	f_armar_select_reenganches()
//ELSE
//	f_armar_select()
//END IF

IF is_tabla_principal = 'sgd_reenganches' THEN
	f_armar_select_reenganches()
ELSEIF is_tabla_principal= 'gi_brigada' THEN
	f_armar_select_brigadas()
ELSE
	f_armar_select()
END IF
//FIN GNU

dw_lista_reporte.SetItem(dw_lista_reporte.RowCount(),"indice",li_nulo)




end event

event ue_deseleccionar_todo;int li_conta, li_nulo
long ll_fila

SetNull(li_nulo)
for li_conta=1 to dw_lista_reporte.rowcount()
	dw_lista_reporte.selectrow(li_conta,false)
	dw_lista_reporte.Setitem(li_conta,"indice",li_nulo)
	IF ll_fila > 0 THEN 
		dw_lista_orden.DeleteRow(ll_fila)   
	END IF	
	
//	if dw_lista_reporte.GetItemString(li_conta,"funcion") <> "" or &         
//		not isnull(dw_lista_reporte.getitemstring(li_conta,"funcion")) then  
		dw_lista_reporte.setitem(li_conta,"funcion","")							  
		dw_lista_reporte.setitem(li_conta,"parentesis","")	
		dw_lista_reporte.SetITem(li_conta,"habilitado","")
//	end if
next

IF dw_lista_orden.RowCount() > 0 THEN
	
	for li_conta=1 to dw_lista_orden.rowcount()
		dw_lista_orden.DeleteRow(li_conta)
	next
	
END IF

IF dw_lista_agrupar.RowCount() > 0 THEN
		dw_lista_agrupar.DeleteRow(1)
END IF
	
IF dw_lista_corte.RowCount() > 0 THEN
		dw_lista_corte.DeleteRow(1)
END IF

m_reportes.m_rep.m_mostrar.enabled=false
m_reportes.m_reporte.m_guardar.m_preferencia1.enabled=false


	
	

end event

event ue_seleccionar_todo;int li_conta, li_filas, li_nulo
long ll_find,ll_indice

//IF dw_lista_agrupar.RowCount() > 0 THEN//PM0010 SGI SUR235 JHC 08/03/2001
//	li_filas = dw_lista_reporte.rowcount()//PM0010 SGI SUR235 JHC 08/03/2001
//ELSE											  //PM0010 SGI SUR235 JHC 08/03/2001
	li_filas = dw_lista_reporte.rowcount()//PM0010 SGI SUR235 JHC 08/03/2001
//END IF											  //PM0010 SGI SUR235 JHC 08/03/2001

FOR li_conta=1 TO li_filas
	
	IF Not dw_lista_reporte.IsSelected(li_conta) THEN
		
		dw_lista_reporte.selectrow(li_conta,true)
	
		ll_find = dw_lista_reporte.Find("not IsNull(indice)",1,li_filas)
	
		IF ll_find = 0 THEN

			dw_lista_reporte.SetItem(li_conta,"indice",1)
			
		ELSE
			
			ll_find = dw_lista_reporte.Find("indice > 0 ",1,li_filas)
					
				DO
					ll_indice = dw_lista_reporte.GetItemNumber(ll_find,"indice")
					
					ll_find = dw_lista_reporte.Find("indice > "+ string(ll_indice) +"",1,li_filas)
					
					IF ll_find = 0 Or IsNull(ll_find) THEN
						ll_indice += 1
						dw_lista_reporte.SetItem(li_conta,"indice",ll_indice)
					END IF
					
				LOOP UNTIL ll_find = 0 or Isnull(ll_find)
		END IF
	END IF
NEXT

m_reportes.m_rep.m_mostrar.enabled=TRUE

m_reportes.m_reporte.m_guardar.m_preferencia1.enabled=true

// Se le quita el n$$HEX1$$fa00$$ENDHEX$$mero al campo Cantidad de Datos, que estar$$HEX2$$e1002000$$ENDHEX$$al final
SetNull(li_nulo)
dw_lista_reporte.SetItem(dw_lista_reporte.RowCount(), "indice", li_nulo)

		
end event

event ue_setear_datos();DataWindowChild ldwc_alcance
int li_alcance

//dw_filtro.fpr_crea_dddw()
//dw_filtro.InsertRow(0)


//***************************************
//**  OSGI 2001.1  	26/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//DataWindowChild ldwc_causa, ldwc_fam_causa
//**  OSGI 2001.1  	26/04/2001  dw_filtro.setitem(1,"cod_hor",0)
//**  OSGI 2001.1  	26/04/2001  dw_filtro.setitem(1,"tipo_instalacion",0)
//**  OSGI 2001.1  	26/04/2001  dw_filtro.SetITem(1,"est_actual",0)
//**  OSGI 2001.1  	26/04/2001  dw_filtro.SetItem(1,"pa_incid_relevante",0)
//dw_filtro.GetChild("cod_causa", ldwc_causa)
//dw_filtro.GetChild("fam_causa", ldwc_fam_causa)
//ldwc_causa.InsertRow(1)
//ldwc_fam_causa.InsertRow(1)
dw_filtro.SetRedraw(false)
dw_filtro.Reset()
dw_filtro.fpr_crea_dddw()
dw_filtro.InsertRow(0)

choose case iu_comunic.is_comunic.accion_llamada 
	CASE "gi_brigada"
		dw_filtro.dataobject="d_bdg_7003_pr_filtro_reporte_brigadas"
//		st_titulo.text="Informe de Brigadas"
		dw_filtro.visible=true
		dw_lista_reporte.fpr_lista_brigada()

		//Inserto una fila y conecto las DW de los datos por Z. Geo
      dw_filtro.SetRedraw(false)
dw_filtro.Reset()
dw_filtro.fpr_crea_dddw()
dw_filtro.InsertRow(0)
		dw_filtro.setitem(1,"pa_periodo",fgnu_fecha_actual())
		dw_filtro.setitem(1,"ai_estado",99)
		dw_filtro.setitem(1,"ai_tipo",0)
		//dw_filtro_reporte.setitem(1,"ai_turno",0)
		dw_filtro.setitem(1,"pa_operador_fecha","=")
		//dw_filtro_reporte.setitem(1,"pa_operador_trab",">=")
		//dw_filtro_reporte.setitem(1,"trab_prev",0)
		dw_filtro.setitem(1,"rango",1)
		dw_filtro.setitem(1,"pa_rango",fgnu_fecha_actual())
	CASE else
//ldwc_causa.SetItem(1, "cod_causa", 0)
//ldwc_causa.SetItem(1, "descripcion", "<Todos>")
//
//ldwc_fam_causa.SetItem(1, "gpo_causa", 0)
////ldwc_fam_causa.SetItem(1, "gi_tipo", 0)
//ldwc_fam_causa.SetItem(1, "descripcion", "<Todos>")

//ldwc_causa.AcceptText()
//ldwc_fam_causa.AcceptText()


li_alcance = dw_filtro.GetItemNumber(1,'pa_alcance')
//dw_filtro.setitem(1,"cod_causa",fgci_todos)
dw_filtro.setItem(1,"ps_nom_causa","<Todos>")
//
//***************************************
//**  OSGI 2001.1  	26/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// Habilito las opciones de menu para importar archivos
m_reportes.m_reporte.m_abrir1.m_reporte1.enabled = true
m_reportes.m_reporte.m_abrir1.m_preferencia.enabled = true


dw_filtro.setitem(1,"tip_tension",0)
dw_filtro.setitem(1,"mat_averiado","010101000001")//<---CAMBIO SUR14 *JHE 05/02/2001*
dw_filtro.setitem(1,"cod_causa",0)
dw_filtro.setitem(1,"mat_averiado"," ")
dw_filtro.setItem(1,"ps_nom_mat_averiado",'<Todos>')
dw_filtro.setItem(1,'ps_nom_instalacion','<Todas>')
dw_filtro.setItem(1,'nro_instalacion',fgci_todos)

//
//If ib_gpo_causa Then
//	dw_filtro.setItem(1,"fam_causa", 0)//<---CAMBIO SUR13 *JHE 15/02/2001*
//	dw_filtro.SetItem(1, "c_gpo_causa", 1)
//End If


//dw_filtro.GetChild("cod_causa",idwchild_codcausa)
//
//idwchild_codcausa.SettransObject(SQLCA)
//idwchild_codcausa.Retrieve(0)

dw_filtro.SetItem(1,"agente", fgci_todos)
dw_filtro.setitem(1,"pa_periodo",fgnu_fecha_actual())
dw_filtro.setitem(1,"pa_operador_fecha","=")
dw_filtro.setitem(1,"rango",1)
dw_filtro.setitem(1,"pa_rango",fgnu_fecha_actual())
dw_filtro.setitem(1,"pa_alcance", fgci_todos)


dw_lista_reporte.SetRedraw(false)
dw_lista_reporte.reset()

	
//IF dw_lista_reporte.GetItemString(1,"tabla") = 'sgd_reenganches' THEN
IF li_alcance = fgci_incidencia_reenganche THEN
	dw_lista_reporte.fpr_lista_reenganche()
	mle_titulo.text = "Informe de Reenganches"
	dw_filtro.setitem(1,"tip_incidencia",fgci_incidencia_imprevista)
	dw_filtro.setitem(1,"pa_alcance", fgci_incidencia_reenganche)
	dw_filtro.object.pa_alcance.protect=0
   dw_filtro.object.pa_alcance.background.color=gs_blanco
ELSE
	dw_lista_reporte.fpr_lista_incidencia()
	mle_titulo.text = "Informe de Incidencias"
	dw_filtro.setitem(1,"tip_incidencia",0)
	dw_filtro.object.pa_alcance.protect=1
	dw_filtro.object.pa_alcance.background.color=gs_gris
	st_causa.visible = true
	st_material.visible = true
	
END IF
END CHOOSE
// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.reset()
dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)
dw_ambito.AcceptText()
dw_ambito.show()

dw_filtro.SetRedraw(true)
dw_lista_reporte.SetRedraw(true)
dw_lista_orden.reset()
dw_lista_agrupar.reset()
dw_lista_corte.reset()

f_inabilitar_menu()
f_habilitar()

dw_filtro.AcceptText()
end event

event ue_imprimir;IF dw_1.RowCount() > 0 THEN
	
	f_titulo_subtitulo()
	
	this.str_print_new.dwprint=dw_1
	this.str_print_new.titulo="Informe de Incidencias"
	this.str_print_new.PARM1=true
	
	OpenWithParm(w_print_dialog,this.str_print_new)

ELSE
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se obtuvieron datos para Imprimir")
END IF

end event

event ue_grabar_pref;///////////////////////////////////////////////////////
//										
// Evento: ue_grabar_pref
// 
// Objetivo: Graba el fichero de preferencias que el
//           usuario ha escogido
//	
//
// Responsables:  FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_docname, ls_named, ls_documento

integer li_value, li_numfila

long ll_pos

li_value = GetFileSaveName("Grabar Preferencias",  & 
	ls_docname, ls_named, "PRF",  &
	"Archivos de Preferencias (*.PRF),*.PRF,Todos los Archivos (*.*), *.*")

ll_pos=pos(upper(ls_docname),".PRF")

ls_documento = f_preparo_archivo() // trae el string del archivo

li_numfila=fileopen(ls_docname,StreamMode!,write!,LockReadWrite!,Replace!)

if li_numfila> 0 then
	if ll_pos>0 then	
		filewrite(li_numfila,ls_documento) //Graba un archivo por detras con configuraciones de la DW
		// mensage de archivo fue salvado con exito 
		gnv_msg.F_MENSAJE("CG06","","",ok!)
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	end if
	fileclose(li_numfila)
end if 
end event

event ue_abrir_pref;///////////////////////////////////////////////////////
//										
// Evento: ue_abrir_pref
// 
// Objetivo: Abre el fichero de preferencias que el
//           usuario ha escogido
//	
//
// Responsables:  
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_docname, ls_named , ls_contenido

integer li_value,li_numfila, li_contador

boolean lb_fila_sel

long ll_pos

setpointer(HourGlass!)

If Isnull(pas_pref)  THEN
	li_value = GetFileOpenName("Abrir Preferencia",  &
	+ ls_docname, ls_named, "PRF",  &
	+ "Archivos de Preferencias (*.PRF),*.PRF,"  &
	+ "Todos los Archivos (*.*),*.*")
ELSE
	ls_docname = pas_pref
	li_value = 1
END IF
ll_pos=pos(upper(ls_docname),".PRF")

IF li_value = 1 THEN li_numfila=FileOpen(ls_docname)
if li_numfila>0 then
//	ii_filas_seleccionadas = 0  // se inicializa el n$$HEX2$$ba002000$$ENDHEX$$de campos seleccionados (LFE)
	IF ll_pos > 0 THEN
		fileread(li_numfila,ls_contenido)	
		li_value=f_interpretar_archivo(ls_contenido)
		if li_value=1 then
			for li_contador=1 to dw_lista_reporte.rowcount()
				if dw_lista_reporte.isselected(li_contador) then
					lb_fila_sel=true
//					ii_filas_seleccionadas ++ // se incrementa el n$$HEX2$$ba002000$$ENDHEX$$de campos seleccionados (LFE)
				end if
				if lb_fila_sel then
					m_reportes.m_rep.m_mostrar.enabled=true
					m_reportes.m_rep.m_presentacionpreliminar.enabled=FALSE
					m_reportes.m_reporte.m_guardar.m_reporte2.enabled = true
					m_reportes.m_reporte.m_guardar.m_preferencia1.enabled = true
				else
					m_reportes.m_rep.m_mostrar.enabled=false
				end if
			next
		end if
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	END IF
	fileclose(li_numfila)
end if
setpointer(Arrow!)
end event

event ue_abrir_reporte;///////////////////////////////////////////////////////
//										
// Evento: ue_abrir_reporte
// 
// Objetivo: Abre el fichero de reporte que el
//           usuario ha escogido
//	
//
// Responsables:  
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////
string ls_docname, ls_named, ls_contenido, ls_doc2, ls_campo, ls_campos, ls_sintaxis, &
ls_error_create, ls_preferencia, ls_contenido_parcial

integer li_value, li_numfich

long ll_pos,ll_posicion,ll_posicion_final, ll_num_car, ll_longitud

If Isnull(ps_contenido)  THEN
	li_value = GetFileOpenName("Abrir Reporte",  &
		+ ls_docname, ls_named, "REP",  &
		+ "Archivos de Reportes (*.REP),*.REP,"  &
		+ "Todos los Archivos (*.*),*.*")
ELSE
	ls_docname = ps_contenido
	li_value = 1
END IF

ll_pos=pos(upper(ls_docname),".REP")
ll_longitud = FileLength(ls_docname)
li_numfich=fileopen(ls_docname,StreamMode!)
ls_contenido = ''

if li_numfich>0 then
	if ll_pos>0 then
		DO
			ll_num_car = fileread(li_numfich,ls_contenido_parcial)
			IF ll_num_car > 0 THEN
				ls_contenido = ls_contenido + ls_contenido_parcial
				ll_longitud = ll_longitud - ll_num_car
			ELSE
				ll_longitud = 0
			END IF
		LOOP WHILE ll_longitud > 0
		
		fileread(li_numfich,ls_contenido)
		yield()
		ll_posicion=pos(ls_contenido,"#Sintaxis#")
		ls_campos=left(ls_contenido,ll_posicion - 1)
		ll_posicion=ll_posicion+10
		ll_posicion_final=pos(ls_contenido,"$$HEX1$$ac00$$ENDHEX$$campo$$HEX1$$ac00$$ENDHEX$$")
		ls_sintaxis=mid(ls_contenido,ll_posicion,(ll_posicion_final) - ll_posicion)
		ll_posicion=ll_posicion_final + 7
		ll_posicion_final=pos(ls_contenido,"$$HEX1$$e700$$ENDHEX$$Preferencia$$HEX1$$e700$$ENDHEX$$")
		ls_campo=mid(ls_contenido,ll_posicion,(ll_posicion_final) - ll_posicion)
		ll_posicion=ll_posicion_final + 12
		ls_preferencia=right(ls_contenido,len(ls_contenido)-ll_posicion)
		dw_1.Create(ls_sintaxis, ls_error_create) //creo el objeto DW
			IF Len(ls_error_create) <= 0 THEN
				IF f_interpretar_archivo(ls_preferencia) = 0 then 
					fileclose(li_numfich)
					return
				END IF
//				dw_1.visible=false
//				sle_1.visible=true
//				sle_1.text=ls_campo
				this.str_print_new.PARM1 = True
				ll_pos=dw_1.Importstring(ls_campos)
				f_desabilitar()
//				m_reportes.m_rep.m_presentacionpreliminar.toolbaritemvisible=true
				m_reportes.m_rep.m_presentacionpreliminar.enabled=true
			end if
	else
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	end if
	fileclose(li_numfich)
end if

end event

event ue_grabar_reporte;///////////////////////////////////////////////////////
//										
// Evento: ue_grabar_reporte
// 
// Objetivo: Graba el fichero de reportes que el
//           usuario ha escogido
//	
//
// Responsables:  
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

string ls_docname, ls_named, ls_doc2, ls_syntaxis, ls_datos

integer li_value,li_numfila,li_retorno

long ll_pos, ll_num_car_escritos

boolean lb_todo_escrito


ls_datos=dw_1.Object.DataWindow.Data
//fg_replacetext (ls_datos,~

ls_syntaxis="#Sintaxis#" + dw_1.Describe("DataWindow.Syntax") 
ls_datos= ls_syntaxis + "$$HEX1$$ac00$$ENDHEX$$campo$$HEX1$$ac00$$ENDHEX$$" + string(dw_1.Rowcount())
ls_datos= ls_datos + "$$HEX1$$e700$$ENDHEX$$Preferencia$$HEX1$$e700$$ENDHEX$$" + is_preferencia

li_value = GetFileSaveName("Grabar Reportes",  & 
	ls_docname, ls_named, "REP",  &
	"Archivos de Reportes (*.REP),*.REP," +  &
	"Todos los Archivos (*.*), *.*")
	//Abro el Archivo y cargo los Valores

ll_pos=pos(upper(ls_docname),".REP")
li_retorno = dw_1.SaveAs(ls_docname,Text!, False)
IF li_retorno = 1 THEN
	li_numfila=fileopen(ls_named,StreamMode!,write!,LockReadWrite!,Append!)
	IF li_numfila > 0 THEN 
		if ll_pos>0 then	
			DO
				ll_num_car_escritos = filewrite(li_numfila,ls_datos)
				IF ll_num_car_escritos < Len(ls_datos) THEN
					ls_datos = Replace(ls_datos, 1, Len(ls_datos), Mid(ls_datos, ll_num_car_escritos+1))
				ELSE
					lb_todo_escrito = TRUE
				END IF
			LOOP WHILE lb_todo_escrito = FALSE
			gnv_msg.F_MENSAJE("CG06","","",ok!)
			fileclose(li_numfila)		
		ELSE
			gnv_msg.F_MENSAJE("MF01","","",ok!)
		END IF
	ELSE
		gnv_msg.F_MENSAJE("MF01","","",ok!)
	END IF
else
	gnv_msg.F_MENSAJE("MF01","","",ok!)
	//mensage de extensi$$HEX1$$f300$$ENDHEX$$n para fichero incorrecta
end if	
	
	
//li_numfila=fileopen(ls_named,StreamMode!,write!,LockReadWrite!,Replace!)
//if li_numfila> 0 then
//	ll_pos=pos(upper(ls_docname),".REP")
//	if ll_pos>0 then
//		DO
//
//			dw_1.Saveas(ls_docname,CSV!,True)
////			ll_num_car_escritos = filewrite(li_numfila,ls_datos)
////			IF ll_num_car_escritos < Len(ls_datos) THEN
////				ls_datos = Replace(ls_datos, 1, Len(ls_datos), Mid(ls_datos, ll_num_car_escritos+1))
////			ELSE
//				lb_todo_escrito = TRUE
////			END IF
//		LOOP WHILE lb_todo_escrito = FALSE
//		gnv_msg.F_MENSAJE("CG06","","",ok!)
//	else
//		gnv_msg.F_MENSAJE("MF01","","",ok!)
//		//mensage de extensi$$HEX1$$f300$$ENDHEX$$n para fichero incorrecta
//	end if
//	fileclose(li_numfila)
//end if 	
//	
//	
	

end event

event ue_exportar_excel;///////////////////////////////////////////////////////
//										
// Evento: ue_exportar_excel
// 
// Objetivo: Script para exportar el contenido de un informe generado a un 
//				 fichero con formato Excel 
//	
//
// Responsable:  LFE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//  LFE
//
///////////////////////////////////////////////////////

int li_columnas, li_contador, li_tama$$HEX1$$f100$$ENDHEX$$o, li_letra, li_contador_excel
int li_fila_cantidad, li_desp
string ls_cabecera, ls_nombre, ls_nombre_archivo, rfilename
boolean lb_existe

// consultamos si hay datos que exportar a Excel. Si no hay no se genera fichero
IF dw_1.rowcount() = 0 THEN
	gnv_msg.F_MENSAJE("AP09","","",ok!)
ELSE
	// El informe tiene datos
	
	li_columnas = dw_lista_reporte.rowcount()
	li_contador_excel = 1
	
	IF dw_lista_reporte.GetSelectedRow(dw_lista_reporte.rowcount() -1) = dw_lista_reporte.rowcount()  THEN
		li_fila_cantidad = dw_lista_reporte.GetItemNumber(dw_lista_reporte.rowcount(), 'indice')
	ELSE
		li_fila_cantidad = dw_lista_reporte.RowCount()
	END IF
	// En este bucle se corrige un problema que se produce al exportar: el nombre de las 
	// cabeceras que la funci$$HEX1$$f300$$ENDHEX$$n SaveAs a$$HEX1$$f100$$ENDHEX$$ade en el fichero Excel es el nombre del campo de 
	// la tabla. Tiene que ser un nombre m$$HEX1$$e100$$ENDHEX$$s descriptivo para el usuario, as$$HEX2$$ed002000$$ENDHEX$$que se coge
	// como nombres de cabecera los textos de la dw dw_lista_reporte. Este texto hay que 
	// ponerlo en la propiedad dbname
	FOR li_contador = 1 TO li_columnas
		IF dw_lista_reporte.GetSelectedRow(li_contador -1) = li_contador THEN
			ls_nombre = dw_lista_reporte.getitemstring(li_contador,'nombre')
			li_tama$$HEX1$$f100$$ENDHEX$$o = len(ls_nombre)
			ls_cabecera=""
			FOR li_letra=1 TO li_tama$$HEX1$$f100$$ENDHEX$$o
				// En este bucle se quitan los posibles caracteres de '.' que aparezcan en el
				// nombre de la cabecera que se ha obtenido de la dw dw_lista_reporte, ya que 
				// en caso de existir alguno, este texto no lo admitir$$HEX2$$e1002000$$ENDHEX$$la propiedad dbname
				IF Mid(ls_nombre, li_letra, 1) <> "." THEN
					ls_cabecera = ls_cabecera + Mid(ls_nombre, li_letra, 1)
				END IF
			NEXT
			// Se cambia la propiedad dbname
			//messagebox(ls_cabecera,dw_1.describe("#"+string(li_contador)+".dbName"))
			IF dw_lista_reporte.getitemNumber(li_contador,'indice') > li_fila_cantidad THEN
				li_desp = 1
			ELSE
				li_desp = 0
			END IF
			
			IF li_contador < dw_lista_reporte.RowCount() THEN
				dw_1.modify("#"+string(dw_lista_reporte.getitemNumber(li_contador,'indice') -li_desp)+".dbName="+"'"+ls_cabecera+"'")
				li_contador_excel ++
			END IF
		END IF
	NEXT

	// Se obtiene el nombre del fichero donde el usuario quiere exportar el informe
	IF GetFileSaveName( "", ls_nombre_archivo, rfilename ,"XLS","Excel (*.XLS),*.XLS" ) = 1 THEN
	// Se comprueba si existe el fichero
		lb_existe = FileExists(ls_nombre_archivo)
	
		IF lb_existe THEN 
			//Se confirmar que quiere grabar el fichero que ya existe
			IF gnv_msg.F_MENSAJE("CP04",ls_nombre_archivo,"",YesNo!) = 1 THEN //$$HEX1$$bf00$$ENDHEX$$Sobreescribir el fichero ya existente?
				IF dw_1.SaveAs (ls_nombre_archivo, Excel!, True)	= -1 THEN
					gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
				END IF
			END IF 
		ELSE
			IF dw_1.SaveAs(ls_nombre_archivo, Excel!, True)	= -1 THEN
				gnv_msg.F_MENSAJE("EP04",ls_nombre_archivo,"",Ok!) //No se ha podido grabar el archivo
			END IF
		END IF
	END IF
END IF
end event

public subroutine f_armar_select ();long ll_totalfila, ll_filas, ll_find, ll_indice, ll_cantfrom, ll_seleccion, &
		ll_centro , ll_cmd, ll_mesa, ll_rowfind, ll_nro_instalacion
string ls_select, ls_funcion, ls_campo, ls_groupby, ls_join1, &
		 ls_tabla, ls_nulo, ls_from[], ls_newfrom[], ls_groupjoin, ls_join2, &
		 ls_operador, ls_wheredate, ls_cadenafrom, ls_filtro, ls_mat_averiado , /*ls_orderby,*/ &
		 ls_campo_agrupa, ls_campo_corte, ls_ordena, ls_campo_f, ls_tabla_f, ls_sinonimo_f, &
		 ls_sinonimo
any lany_from[]

boolean lb_solo_cantidad = false

integer 	li_existe, li_rangperi, li_i, li_tip_incid, &
			li_tipo_tension, li_cod_causa ,li_fam_causa, &
			li_tipo_intal, li_agente, li_relevante, li_orden, li_filtro1, li_filtro2, li_agrupar

date ldt_periodo, ldt_rango

//NCA-INICIO.DDAG-1679.18/05/2015.
		long larg, li_count
		long larg_agente, larg_ten_origen, larg_ten_afectada
		string ls_select_hist, ls_verif_funcion
		String ls_select_fnc_max, ls_select_fnc_min, ls_armar_consult_max, ls_armar_consult, ls_armar_consult_min	
//NCA-FIN.DDAG-1679.18/05/2015.

dw_filtro.AcceptText()
dw_ambito.AcceptText()
dw_funcion.AcceptText()
dw_lista_reporte.AcceptText()
dw_lista_orden.AcceptText()
dw_lista_agrupar.AcceptTExt()
dw_lista_corte.AcceptText()

SetNull(ls_nulo)

ll_indice = 1

li_agrupar = dw_lista_agrupar.Rowcount() //nuevo SGI SUR13 JHC 15/02/2001

ll_totalfila = dw_lista_reporte.RowCount()

ll_find = dw_lista_reporte.find("indice = 1",1,ll_totalfila)

li_existe = dw_lista_reporte.find("funcion <> ''",1,ll_totalfila)

ls_select = "Select "

ls_groupjoin = " Where "

ls_groupby = " Group By "

ll_seleccion = dw_lista_reporte.GetSelectedRow(0)

IF ll_seleccion = ll_totalfila THEN
	lb_solo_cantidad = true
ELSE
	lb_solo_cantidad = false
END IF

////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////
DO
	
	IF ll_find > 0 THEN
		
		ls_funcion = dw_lista_reporte.GetItemString(ll_find,"funcion")
		
		IF ls_funcion <> "" THEN
			
			ls_tabla_f = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo_f = dw_lista_reporte.GetItemString(ll_find,"campo")

			ls_join1 = dw_lista_reporte.GetItemString(ll_find,"join")
			
			ls_sinonimo_f = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
			IF NOT lb_solo_cantidad THEN
				IF ls_sinonimo_f <> "" THEN	
					IF dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
						ls_select += ls_funcion +"TO_CHAR(" +ls_sinonimo_f +"."+ ls_campo_f + ",'dd/mm/yyyy')) AS "+ ls_sinonimo_f+ls_campo_f+", "
	//					ls_groupby += "TO_CHAR(" +ls_sinonimo_f +"."+ ls_campo_f + ",'dd/mm/yyyy'), "
					ELSE
						ls_select += ls_funcion + ls_sinonimo_f +"."+ ls_campo_f + ") AS "+ ls_sinonimo_f+ls_campo_f+", "
	//					ls_groupby += ls_sinonimo_f +"."+ ls_campo_f +", "
					END IF
					
					IF ls_tabla_f <> "" THEN ls_from[ll_indice] = ls_tabla_f+" "+ls_sinonimo_f
				ELSE
					IF dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
						ls_select += ls_funcion+"TO_CHAR("+ls_tabla_f +"."+ ls_campo_f + ",'dd/mm/yyyy')) AS "+ ls_campo_f+", "
	//					ls_groupby += "TO_CHAR("+ls_tabla_f +"."+ ls_campo_f + ",'dd/mm/yyyy'), "
					ELSE
						//Cambio SGI SUR13 JHC 14/02/2001
	//					ls_select += ls_funcion + ls_tabla_f +"."+ ls_campo_f + ") AS "+ ls_campo_f+", "
						IF ls_funcion = "AVG(" THEN
							ls_select += "Round("+ls_funcion +"nvl("+ ls_tabla_f +"."+ ls_campo_f + ",0)),2) AS "+ ls_campo_f+", "
						ELSE
							ls_select += ls_funcion +"nvl("+ ls_tabla_f +"."+ ls_campo_f + ",0)) AS "+ ls_campo_f+", "
						END IF
						//Cambio SGI SUR13 JHC 14/02/2001
	//					ls_groupby += ls_tabla_f +"."+ ls_campo_f +", "
					END IF
					IF ls_tabla_f <> ""  THEN ls_from[ll_indice] = ls_tabla_f
				END IF
	
				
				ll_cantfrom = UpperBound(ls_from)
					
				IF ls_join1 <> "" THEN	
					
					ls_groupjoin += ls_join1 + " and " //+ ""+string(ll_find)+""
					
				END IF
				
				ll_indice += 1
				
				ls_join1 = ls_nulo
				ls_funcion = ls_nulo
			ELSE
				ll_find = 0
				messagebox("Atencion","Debe seleccionar otro campo para generar el informe")
				return
			END IF
		ELSE
			
			ls_tabla = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo = dw_lista_reporte.GetItemString(ll_find,"campo")
			
			ls_join1 = dw_lista_reporte.GetItemString(ll_find,"join")			
	
			ls_sinonimo = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
			IF NOT lb_solo_cantidad THEN
				//IF li_existe > 0 AND ls_campo = "cantidad" THEN //CAMBIO SGI SUR13 JHC 15/02/2001 
				IF li_agrupar > 0 AND ls_campo = "cantidad" THEN
					IF ls_sinonimo <> "" THEN
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select +=  "Count(TO_CHAR("+ls_sinonimo+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							
//							ls_groupby += "TO_CHAR("+ls_sinonimo_f+"."+ls_campo_f+",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
								
							ls_select +=  "Count(TO_CHAR("+ls_sinonimo+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							
//							ls_groupby += "TO_CHAR("+ls_sinonimo_f+"."+ls_campo_f+",'dd/mm/yyyy'), "
							
						ELSE
							ls_select +=  "Count("+ls_sinonimo+"."+ls_campo+") AS cantidad, "
						END IF
						
						If ls_tabla <> "" THEN ls_from[ll_indice] = ls_tabla + " " +ls_sinonimo //CAMBIO SGI SUR13 JHC 15/02/2001 
					ELSE
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select +=  "Count(TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							ls_groupby += "TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy'), "//nuevo SGI SUR13 JHC 15/02/2001
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN							
							ls_select +=  "Count(TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							ls_groupby += "TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy'), "//nuevo SGI SUR13 JHC 15/02/2001
						ELSE
//							ls_select +=  "Count("+ls_tabla_f+"."+ls_campo_f+") AS cantidad, "
							IF dw_lista_orden.Find("campo = '"+dw_lista_agrupar.GetItemString(1,"campo")+"'",1,dw_lista_orden.rowCount()) > 0 AND &
								dw_lista_reporte.GetItemString(dw_lista_reporte.Find("campo = '"+dw_lista_agrupar.GetItemString(1,"campo")+"'",1,dw_lista_reporte.rowCount()),"tipo") = "N" THEN
//    						dw_lista_reporte.GetItemString(ll_find,"tipo") = "N" THEN 	//Cambio SGI SUR13 JHC 14/02/2001	
								
								ls_select +=  "Count(nvl("+dw_lista_orden.GetItemstring(1,"tabla")+"."+dw_lista_orden.GetItemstring(1,"campo")+",0)) AS cantidad, "
							ELSE
								//ls_select +=  "Count("+dw_lista_orden.GetItemstring(1,"tabla")+"."+dw_lista_orden.GetItemstring(1,"campo")+") AS cantidad, "
							END IF
						END IF
						If ls_tabla <> "" THEN  ls_from[ll_indice] = ls_tabla//nuevo SGI SUR13 JHC 15/02/2001
					END IF
					
				ELSE
					IF ls_sinonimo <> "" THEN
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy') AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
								
							ls_select += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy') AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy'), "
						ELSE
							
							ls_select += ls_sinonimo +"."+ ls_campo + " AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += ls_sinonimo +"."+ ls_campo +", "
						END IF
						
						IF ls_tabla <> ""  THEN ls_from[ll_indice] = ls_tabla + " " +ls_sinonimo //CAMBIO SGI SUR13 JHC 15/02/2001 
					ELSE
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy') AS "+ls_campo+", "
							
							ls_groupby += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy') AS "+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy'), "
						ELSE
							
							IF ls_campo = 'paxtc' THEN 
								ls_select += "Round(Nvl("+ls_tabla +"."+ ls_campo + ",0)/60,2) AS "+ ls_campo +", "
							ELSEIF ls_campo = 'pot_afectada' THEN//CAMBIO DOM SUR13 *JHE 14/02/2001*
								ls_select += "Nvl("+ls_tabla +"."+ ls_campo + ",0) AS "+ ls_campo +", "
							ELSE                         //CAMBIO DOM SUR13 *JHE 14/02/2001*
								IF ls_tabla <> "" and ls_campo <> "cantidad" THEN
									ls_select += ls_tabla +"."+ ls_campo + ", "
								END IF
//									ls_select += ls_tabla +"."+ ls_campo + ", "
							END IF
							ls_groupby += ls_tabla +"."+ ls_campo + ", "
						END IF
						
						IF ls_tabla <> "" THEN	ls_from[ll_indice] = ls_tabla //CAMBIO SGI SUR13 JHC 15/02/2001 
						
					END IF
				END IF
		
				ll_cantfrom = UpperBound(ls_from)
				
				IF ls_join1 <> "" THEN
					
					ls_groupjoin += ls_join1 + " and " //+ ""+string(ll_find)+""
					
					ls_join1 = ls_nulo
					
				END IF
				
				ll_indice += 1
				
//				IF li_existe > 0 AND ls_campo <> "cantidad" THEN
//					IF ls_sinonimo <> "" THEN
//						ls_groupby += ls_sinonimo +"."+ ls_campo + ", "
//					ELSE
//						ls_groupby += ls_tabla +"."+ ls_campo + ", "
//					END IF
//				END IF
			ELSE
				ll_find = 0
				messagebox("Atencion","Debe seleccionar otro campo para generar el informe")				
				return
			END IF
		END IF
			
	END IF
	
	ll_find = dw_lista_reporte.find("indice = "+string(ll_indice)+"",1,ll_totalfila)
	
	IF ll_find = 0 OR IsNull(ll_find) THEN
		
		ls_select = left(ls_select,len(ls_select) - 2)
		
		IF ls_groupjoin = " Where and " THEN 
			ls_groupjoin = left(ls_groupjoin,len(ls_groupjoin) - 4)
		END IF
		IF	ls_groupby <> " Group By " THEN 
			ls_groupby = left(ls_groupby,len(ls_groupby) - 2)
		ELSE
			ls_groupby = ""
		END IF
		
	END IF
	
LOOP UNTIL ll_find = 0 OR IsNull(ll_find)


////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////

////////////////////////////////////////////////////ORDER BY//////////////////////////////

IF dw_lista_orden.Rowcount() > 0 THEN
	
	is_order_by = " Order by "
	
	FOR li_i = 1 TO dw_lista_orden.RowCount()
		
		li_orden = dw_lista_orden.GetITemNumber(li_i,"tipo")
		IF li_orden = 1 THEN 
			ls_ordena = "ASC"	
		ELSEIF li_orden = 2 THEN
			ls_ordena = "DESC"
		END IF
		//Cambio SGI DOM II JHC 11/01/2001  ********************************					
		ll_rowfind = dw_lista_reporte.Find("nombre = '" +dw_lista_orden.getitemstring(li_i,"nombre")+"'",1,dw_lista_reporte.Rowcount())


		If ll_rowfind > 0 Then
			is_order_by += String(dw_lista_reporte.GetItemNumber(ll_rowfind,"indice"))	+ " " + ls_ordena + " , "
			//is_order_by += dw_lista_reporte.GetItemString(ll_rowfind,"tabla") + "." + dw_lista_reporte.GetItemString(ll_rowfind,"campo") + " " + ls_ordena + " , "
		End If
	
//		IF ll_rowfind > 0 AND dw_lista_reporte.GetItemString(ll_rowfind,"sinonimo") <> "" THEN 
//
//			is_order_by += dw_lista_reporte.GetItemString(ll_rowfind,"sinonimo")	+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
//						  " "+ ls_ordena +" , "
//		//Cambio SGI DOM II JHC 11/01/2001  ********************************		
//		ELSE
//			//CAMBIO DOM SUR13 *JHE 14/02/2001*
////			ls_orderby += dw_lista_orden.GetITemString(li_i,"tabla")+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
////						  " "+ ls_ordena +" , "
//			IF dw_lista_reporte.GetItemString(ll_rowfind,"Tipo") = "D" THEN
//				is_order_by += "TO_CHAR("+dw_lista_orden.GetITemString(li_i,"tabla")+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
//						  ",'dd/mm/yyyy') "+ ls_ordena +" , "						 
//			ELSE
//				is_order_by += dw_lista_orden.GetITemString(li_i,"tabla")+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
//						  " "+ ls_ordena +" , "
//			END IF
//			//CAMBIO DOM SUR13 *JHE 14/02/2001*
//		END IF
	NEXT
	
	is_order_by = left(is_order_by,len(is_order_by) - 2)
	
ELSE
	
	is_order_by = ""
	
END IF


////////////////////////////////////////////////////ORDER BY//////////////////////////////


////////////////////////////////////////////////////AMBITO//////////////////////////////
ll_centro = dw_ambito.GetItemNumber(1,"nro_centro")
ll_cmd = dw_ambito.GetItemNumber(1,"nro_cmd")
ll_mesa = dw_ambito.GetItemNumber(1,"nro_mesa")

ls_join2 += "("+is_tabla_principal+".nro_centro = "+string(ll_centro)+" OR "+string(ll_centro)+" = 0) AND "+"~n"+&
				"("+is_tabla_principal+".nro_cmd = "+string(ll_cmd)+" OR "+string(ll_cmd)+" = 0) AND " + "~n" +&
				"("+is_tabla_principal+".nro_mesa= "+string(ll_mesa)+" OR "+string(ll_mesa)+" = 0) "

ls_from[UpperBound(ls_from) + 1] = is_tabla_principal
////////////////////////////////////////////////////AMBITO//////////////////////////////				
				
////////////////////////////////////////////////////RANGO O PERIODO//////////////////////////////
li_rangperi = dw_filtro.GetItemNumber(1,"rango")

IF li_rangperi = 1 THEN
	
	ls_operador = dw_filtro.GetItemString(1,"pa_operador_fecha")
	
	ldt_periodo = date(dw_filtro.GetItemDateTime(1,"pa_periodo"))

	ls_wheredate = "to_number(to_char(sgd_incidencia.f_deteccion,'yyyymmdd')) " + ls_operador +" "+ string(ldt_periodo,'yyyymmdd')
	
ELSE
	
	ldt_rango = date(dw_filtro.GetItemDatetime(1,"pa_rango"))
	
	ldt_periodo = date(dw_filtro.GetItemDateTime(1,"pa_periodo"))
	
	ls_wheredate = "to_number(to_char(sgd_incidencia.f_deteccion,'yyyymmdd')) between " + string(ldt_rango,'yyyymmdd') +" AND " + string(ldt_periodo,'yyyymmdd')+""
		
END IF
////////////////////////////////////////////////////RANGO O PERIODO//////////////////////////////


///////////////////////////////////FILTROS/////////////////////////////////////////////////////////

dw_filtro.AcceptText()
li_tip_incid = dw_filtro.GetItemNumber(1,"tip_incidencia")
li_tipo_tension = dw_filtro.GetItemNumber(1,"tip_tension")
ls_mat_averiado = dw_filtro.GetItemString(1,"mat_averiado")
li_cod_causa = dw_filtro.GetItemNumber(1,"cod_causa")
li_fam_causa = dw_filtro.GetItemNumber(1,"fam_causa")
li_agente = dw_filtro.GetItemNumber(1,"agente")
ll_nro_instalacion = dw_filtro.GetItemNumber(1,'nro_instalacion')


IF li_tip_incid > 0 THEN 	
	ls_filtro += is_tabla_principal +".tip_incidencia = "+ string(li_tip_incid)+" AND "
END IF

IF ll_nro_instalacion > 0 THEN
	ls_filtro += is_tabla_principal + ".nro_inst_afectada = "+ string(ll_nro_instalacion) + " AND "
ELSE
	IF li_tipo_tension >  0 THEN	
		ls_filtro += is_tabla_principal +".tip_tension ="+ string(li_tipo_tension)  +" AND "
	END IF
END IF

IF ls_mat_averiado >  '0101010000' And ls_mat_averiado <> '010101000001' THEN	//<---CAMBIO SUR14 *JHE 05/02/2001*
	ls_filtro += is_tabla_principal + ".mat_averiado = '"+ ls_mat_averiado +"' AND "
END IF
//CAMBIO DOM II *JHE 01/02/2001*
IF li_cod_causa > 0 THEN	
	ls_filtro += is_tabla_principal + ".cod_causa = "+ string(li_cod_causa)  +" AND " 
END IF
IF li_fam_causa > 0 THEN	
	ls_filtro += is_tabla_principal +".fam_causa = "+ string(li_fam_causa)  +" AND "
END IF
//CAMBIO DOM II *JHE 01/02/2001*

IF li_tipo_intal > 0 THEN
//CAMBIO DOM SUR13 *JHE 14/02/2001*
//	ls_filtro += "sgd_instalacion.tipo_instalacion = "+ string(li_tipo_intal)  +" AND "
	ls_filtro += "sgd_instalacion.nro_instalacion = sgd_incidencia.nro_inst_afectada AND " +&
	"sgd_instalacion.bdi_job = 0 AND sgd_instalacion.tipo_instalacion = "+ string(li_tipo_intal)  +" AND "
//CAMBIO DOM SUR13 *JHE 14/02/2001*
	li_filtro1 = 1
END IF

IF li_agente > 0 THEN	
	ls_filtro += is_tabla_principal +".agente = "+ string(li_agente)  +" AND "
END IF

IF li_relevante > 0 THEN
	ls_filtro += " ( sgd_incidencia.pot_afectada > gi_par_relevantes_bdg.pot_afectada_min ) and  " +&
       			 " ( sgd_incidencia.ccli_afec > gi_par_relevantes_bdg.num_cli_afe_min ) and  " +&
        			 " ( sgd_incidencia.duracion_rs > gi_par_relevantes_bdg.duracion_rs_min ) and "

	li_filtro2 = 2
END IF

ls_filtro = left(ls_filtro,len(ls_filtro) - 4)

IF	li_filtro1 = 1 THEN ls_from[UpperBound(ls_from) + 1] = "sgd_instalacion"
IF	li_filtro2 = 2 THEN 	ls_from[UpperBound(ls_from) + 1] = "gi_par_relevantes_bdg"
///////////////////////////////////FILTROS/////////////////////////////////////////////////////////

///////////////////////////////////FROM/////////////////////////////////////////////////////////

f_verifica_from(ls_from,UpperBound(ls_from))

ls_cadenafrom = ' From '

FOR li_i = 1 To UpperBound(is_newfrom)

	ls_cadenafrom += is_newfrom[li_i] + ", "
	
NEXT

///////////////////////////////////FROM/////////////////////////////////////////////////////////

ls_cadenafrom = left(ls_cadenafrom,len(ls_cadenafrom) - 2)


IF li_existe > 0 AND is_order_by <> "" AND ls_filtro <> "" THEN
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + " AND " + &
					ls_filtro + " " + ls_groupby + " " /*+ls_orderby*/
		
ELSEIF li_existe > 0 AND ls_filtro <> "" THEN
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
					ls_filtro +" " /*+ ls_groupby*/

ELSEIF li_existe > 0 THEN

	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" "+ls_groupby


ELSEIF	li_existe <= 0 AND is_order_by <> "" AND ls_filtro <> "" AND li_agrupar = 0 THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + " AND " +&
						" " + ls_filtro + " " /*+ ls_orderby*/
ELSEIF li_existe <= 0 AND ls_filtro <> "" AND li_agrupar = 0 THEN

		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND "+ &
						ls_filtro
//NUEVO DOM SUR13 *JHE 15/02/2001*
ELSEIF li_agrupar > 0 AND ls_filtro <> "" AND is_order_by <> "" THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
						ls_filtro +" " + ls_groupby + " " /*+ ls_orderby*/
						
ELSEIF li_agrupar > 0 AND ls_filtro <> "" THEN
		
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
						ls_filtro +" " + ls_groupby
						
ELSEIF li_agrupar > 0 AND is_order_by <> "" THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " + ls_groupby + " " /*+ ls_orderby*/

ELSEIF li_agrupar > 0 THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " + ls_groupby
//NUEVO DOM SUR13 *JHE 15/02/2001*						
ELSEIF li_existe <= 0 AND is_order_by <> "" THEN
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " /*+ ls_orderby*/
//		messagebox("6",ls_select)	
ELSE
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate
//		messagebox("7",ls_select)	
		
END IF

//NCA-INICIO.DDAG-1679.18/05/2015.Reemplazamos la tabla sgd_incidencia por la de gi_hist_incidencias y hacemos el union all.
	If iu_comunic.is_comunic.accion_llamada = 'sgd_incidencia' Then	
      ls_select_hist = ls_select		
		larg = LEN('sgd_incidencia')	
			
			do while Pos(ls_select_hist, "sgd_incidencia") <> 0
							ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, "sgd_incidencia"), larg, 'gi_hist_incidencias')
			loop	
			
			//HLA.INI.DDAG-5343.24/06/2016.Reemplazamos la tabla sgd_estado_oper por la de gi_hist_estado_oper
			long larg_estado_oper
			larg_estado_oper = LEN('sgd_estado_oper')
			do while Pos(ls_select_hist, "sgd_estado_oper") <> 0
							ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, "sgd_estado_oper"), larg_estado_oper, 'gi_hist_estado_oper')
			loop	
			//HLA.FIN.DDAG-5343.24/06/2016.
			
			//NCA-INICIO.DDAG-1679.18/06/2015.Los campos agente, tension_origen y tension_afectada con el tipo number 
			//en la tabla de historico de incidencias tienen nombres diferentes, por eso reemplazamos en el query 
			//  con esos campos.			
			
			larg_agente = LEN('.agente')	
			do while Pos(ls_select_hist, ".agente") <> 0
							ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, ".agente"), larg_agente , '.cod_agente')
			loop			
			//-----------------						
			
			larg_ten_origen = LEN('.tension_origen')	
			do while Pos(ls_select_hist, ".tension_origen") <> 0
							ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, ".tension_origen"), larg_ten_origen, '.cod_tension_origen')
			loop					
			//-----------------		
			
			larg_ten_afectada = LEN('.tension_afectada')	
			do while Pos(ls_select_hist, ".tension_afectada") <> 0
							ls_select_hist= Replace (ls_select_hist, Pos(ls_select_hist, ".tension_afectada"), larg_ten_afectada, '.cod_tension_afectada')
			loop			

			For li_count = 1 to dw_lista_reporte.rowcount()
				ls_verif_funcion= dw_lista_reporte.getitemstring(li_count,"funcion")
				IF Not isnull(ls_verif_funcion) Then
					ls_funcion = ls_verif_funcion					
				End If 
			next 
			
			IF ls_sinonimo_f <> "" THEN				
				ls_armar_consult = "WHERE " + ls_sinonimo_f+ls_campo_f + " = " + "(SELECT " + ls_funcion + ls_sinonimo_f+ls_campo_f + ")" + " FROM (" +""			
			else
				ls_armar_consult = "WHERE " + ls_campo_f + " = " + "(SELECT " + ls_funcion + ls_campo_f + ")" + " FROM (" +""   
		   End If 
			

			choose Case ls_funcion
					case  "MAX("
							ls_armar_consult_max = "SELECT * FROM ("
							ls_select_fnc_max = ls_armar_consult_max + ls_select + " UNION ALL " + ls_select_hist + ")" + ls_armar_consult + ls_select + " UNION ALL " + ls_select_hist +"))"
							
							ls_select = ls_select_fnc_max 

					case  "MIN("						
						   ls_armar_consult_min = "SELECT * FROM ("
							ls_select_fnc_min = ls_armar_consult_min + ls_select + " UNION ALL " + ls_select_hist + ")" + ls_armar_consult + ls_select + " UNION ALL " + ls_select_hist +"))"
							
							ls_select = ls_select_fnc_min 
	
					case else 
							ls_select= ls_select + " UNION ALL " + ls_select_hist	
			end choose			
	 End if	 
//NCA-FIN.DDAG-1679.18/05/2015.

is_preferencia = f_preparo_archivo()
this.str_print_new.PARM1 = false					
f_modificar_dw(ls_select)

//Clipboard(ls_select)
end subroutine

public subroutine f_verifica_from (any pas_from, long pal_cant);string ls_fromarray[], ls_find, ls_nulo, ls_newfrom[]
integer li_a, li_b, li_cont
integer li_hay_gi_causa= 0 // GNU 18-4-2007. Mejora 1/485502

	// Variable para ver si hay que insertar GI_CAUSA en la SELECT
	// 0 --> No hay causas
	// 1 --> Hay GI_CAUSA --> No hay que insertarlo
	// 2 --> No Hay GI_CAUSA, pero hay GI_SUBTIPOS o GI_SUBTIPO_CAUSA --> Hay que insertarlo


SetNull(ls_nulo)

ls_fromarray = pas_from

FOR li_a = 1 TO pal_cant
		
		ls_find = ls_fromarray[li_a]

		IF Not IsNull(ls_fromarray[li_a]) THEN
				
			FOR li_b	= 1 TO pal_cant			
			
				IF li_b <> li_a AND ls_find = ls_fromarray[li_b]THEN
					
					ls_fromarray[li_b] = ls_nulo
				
				END IF
				
			NEXT
		END IF
NEXT

FOR li_a = 1 TO pal_cant
	IF ls_fromarray[li_A] <> "" THEN
		IF Not IsNull(ls_fromarray[li_A]) THEN 
			li_cont ++
			ls_newfrom[li_cont] = ls_fromarray[li_a]
			// GNU 18-4-2007. Mejora 1/485502
			// Compruebo si hay que insertar GI_CAUSA en el FROM o no
			IF li_hay_gi_causa <> 1 THEN
				IF Upper(ls_fromarray[li_A])='GI_SUBTIPOS' &
					or Upper(ls_fromarray[li_A])='GI_SUBTIPO_CAUSA' then
					li_hay_gi_causa= 2
				ELSEIF Upper(ls_fromarray[li_A])='GI_CAUSA' then
					li_hay_gi_causa= 1
				END IF
			END IF
			// FIN GNU
		END IF
	END IF
NEXT

// GNU 24-4-2007. Mejora 1/343671
if is_tabla_principal="gi_brigada" then
	if dw_lista_reporte.IsSelected(5)=true or dw_lista_reporte.IsSelected(6)=true then
		li_cont ++
		ls_newfrom[li_cont] ='gi_ot'
	end if
end if
// FIN GNU

// GNU 18-4-2007. Mejora 1/485502
IF li_hay_gi_causa=2 THEN
	li_cont ++
	ls_newfrom[li_cont] = 'GI_CAUSA'
END IF

 is_newfrom = ls_newfrom
end subroutine

public subroutine f_modificar_dw (string pas_select);string ls_style, ls_dw_err, ls_dw_syntax,ls_funcion, ls_tabla, ls_nombre, ls_cadena, ls_nulo, ls_campo, &
	    ls_cadenaobjetos, ls_objeto , ls_sinonimo, ls_nomcol
long ll_indice, ll_totalfila, ll_find, ll_width, &
	 ll_colcount, ll_colposx, ll_colwidth, ll_colheight //PM0010 SGI SUR235 JHC 07/03/2001
integer li_existe, li_posobjeto, li_postab, li_ultimapos, li_pos, li_i

SetNull(ls_nulo)

//Configura el estilo del dataWindow

dw_1.SettransObject(Sqlca)



IF dw_lista_agrupar.RowCount() > 0 THEN
	
	ls_campo = dw_lista_agrupar.GetItemString(1,"tabla") +"_"+dw_lista_agrupar.GetItemString(1,"campo")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ls_style = " style(type=group)  datawindow(units=0 color=" + String(RGB(192, 192, 192)) + " Label.Columns.Spacing=3 ) " +&
	ls_style = " style(type=group)  datawindow(units=0 color=" + gs_gris + " Label.Columns.Spacing=3 ) " +&
				  " Column(Border=0 Background.color=16777215 background.mode=0 color="+  String(RGB(0, 51, 128)) + " ) " +&
				  " Text(Border = 6 )  group(1 ) " 
				  
	IF dw_lista_corte.RowCount() > 0 THEN
		ls_style += ", group(2 ) "
	END IF
				  
				  
//				  , header.height=108 trailer.height=96 by=("+ls_campo+") header.color=536870912 trailer.color=536870912 " +&
//				  " column(name="+ls_campo+" band=header.1 id=3 x=421 y=28 )"  
				  //+&
//				  " group(level=1 header.height=108 trailer.height=96 by=(#3) header.color='536870912' trailer.color='536870912' ) "

//				  " column(name="+ls_campo+" band=header.1 id=1 x=421 y=28 ) "
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ls_style = " style(type=tabular) datawindow(units=0 color=" + String(RGB(192, 192, 192)) + "Label.Columns.Spacing=3 ) " +&
	ls_style = " style(type=tabular) datawindow(units=0 color=" + gs_gris + "Label.Columns.Spacing=3 ) " +&
				  " Column(Border=0 Background.color=16777215 background.mode=0 color="+ String(RGB(0, 51, 128)) + " ) " +&
				  " Text(Border = 6 ) "
END IF


//	Messagebox("",ls_style)

ls_dw_syntax = SQLCA.SyntaxFromSQL(pas_select, ls_style, ls_dw_err)			

//messagebox("",ls_dw_err)

If len(ls_dw_err) > 0 then 
	Messagebox("Error",Sqlca.Sqlerrtext)
	m_reportes.m_reporte.m_imprimir.enabled = false
	m_reportes.m_rep.m_presentacionpreliminar.enabled= false
	return
END IF

dw_1.Create(ls_dw_syntax)


//dw_1.Modify("DataWindow.Header.Height='120'")

dw_1.SettransObject(Sqlca)
////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////

ll_indice = 1

ll_totalfila = dw_lista_reporte.RowCount()

ll_find = dw_lista_reporte.find("indice = 1",1,ll_totalfila)

li_existe = dw_lista_reporte.find("funcion <> ''",1,ll_totalfila)

dw_1.Retrieve()

//"Total : " + string(rowcount())

DO
	
	IF ll_find > 0 THEN
		
		ls_funcion = dw_lista_reporte.GetItemString(ll_find,"funcion")
		
		IF ls_funcion <> "" /*Or Not IsNull(ls_funcion	) */THEN
			
			ls_nombre = dw_lista_reporte.GetItemString(ll_find,"nombre")
			
			ls_funcion = dw_lista_reporte.GetItemString(ll_find,"funcion")
			
			ls_tabla = dw_lista_reporte.GetItemString(ll_find,"tabla")

			ls_campo = dw_lista_reporte.GetItemString(ll_find,"campo")
			
			ls_sinonimo = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
//			ls_cadena = ls_tabla +"_"+ ls_campo + "_t"
			ls_cadena = ls_campo + "_t"
		
			dw_1.Modify(ls_cadena+".text='"+ls_nombre+"'")
			dw_1.Modify(ls_cadena+".Height=105")


			ll_indice += 1
			
		ELSE
			
			ls_nombre = dw_lista_reporte.GetItemString(ll_find,"nombre")
			
			ls_tabla = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo = dw_lista_reporte.GetItemString(ll_find,"campo")		

			ls_sinonimo = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
			IF ls_campo = "cantidad" THEN
				ls_cadena = ls_campo + "_t"
			
				dw_1.Modify(ls_cadena+".text='"+ls_nombre+"'")
				dw_1.Modify(ls_cadena+".Height=105")
				
				//PM0010 SGI SUR235 JHC 07/03/2001
				//\\//
				// \/
				IF dw_lista_agrupar.Rowcount() = 0 THEN
					
					ll_colcount = long(dw_1.Describe("DataWindow.Column.Count"))
					
					ls_nomcol = dw_1.Describe("#"+string(ll_colcount)+".Name")
					
					ll_colposx = long(dw_1.Describe("#"+string(ll_colcount)+".X"))
					
					ll_colwidth = long(dw_1.Describe("#"+string(ll_colcount)+".width"))
					
					ll_colheight = long(dw_1.Describe("#"+string(ll_colcount)+".height"))
					
					dw_1.Modify("create compute(band=Summary color='" + String(RGB(0, 51, 128)) + "' alignment='1' border='0' x='"+string(ll_colposx)+"' "+&
									"y='16' height='"+string(ll_colheight)+"' width='"+string(ll_colwidth)+"' expression='~"Total : ~"+string(rowcount())' "+&
									"font.face='Arial' font.height='-8' font.weight='400' font.family='2' "+&
									"font.pitch='2' font.charset='0'  background.mode='2' background.color='16777215')")
				END IF
				// /\
				////\\
				//PM0010 SGI SUR235 JHC 07/03/2001	
					
				ll_indice += 1
			ELSE

				IF dw_1.Describe(ls_campo+".Name") = ls_campo THEN
//					ll_width = long(dw_1.Describe(ls_campo+".width"))
					ls_cadena = ls_campo+"_t"
//					dw_1.Modify(ls_cadena+".width="+string(ll_width + 10))
				ELSEIF ls_sinonimo <> "" THEN
					ls_cadena = ls_tabla +"_"+ ls_sinonimo+ls_campo + "_t"
				ELSE
					ls_cadena = ls_tabla +"_"+ ls_campo + "_t"
				END IF
				
				dw_1.Modify(ls_cadena+".text='"+ls_nombre+"'")
				dw_1.Modify(ls_cadena+".Height=105")
				
//				
				ll_indice += 1
			END IF	
			
		END IF
	END IF
	
	ll_find = dw_lista_reporte.find("indice = "+string(ll_indice)+"",1,ll_totalfila)
	
LOOP UNTIL ll_find = 0 OR IsNull(ll_find)

dw_1.Modify("DataWindow.Summary.Height= '200'" )

IF dw_lista_agrupar.Rowcount() > 0 THEN
	
	dw_1.Modify("DataWindow.Header.Height= '200'" )

	
	ls_cadenaobjetos = dw_1.Describe("DataWindow.Objects")
	li_pos = 1
	
	FOR li_i = 1 To 4
		
		li_posobjeto = Pos(ls_cadenaobjetos,"obj",li_pos)
		
		ls_cadenaobjetos = Mid(ls_cadenaobjetos,li_posobjeto)
		
		li_postab = Pos(ls_cadenaobjetos,"~t",1)
		
		ls_objeto = left(ls_cadenaobjetos,li_postab - 1)
		
		li_pos = li_postab + 1
		
		dw_1.Modify(""+ls_objeto+".Visible='0'")
	NEXT
ELSE
	dw_1.Modify("DataWindow.Header.Height= '130'")
	
	
END IF

IF dw_1.Rowcount() > 0 THEN
	gnv_msg.f_mensaje("IA09","","",ok!)
	//messagebox("Aviso","Reporte generado satisfactoriamente",inFormation!,ok!)
	
//	m_reportes.m_reporte.m_imprimir.enabled = true
//	m_reportes.m_rep.m_presentacionpreliminar.enabled = true
	f_habilitar_menu()
ELSE
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se obtuvieron datos para el Informe",information!)
	m_reportes.m_reporte.m_imprimir.enabled = false
	m_reportes.m_rep.m_presentacionpreliminar.enabled= false
	m_reportes.m_reporte.m_guardar.m_reporte2.enabled = false
END IF



//dw_1.Modify("column(name="+ls_campo+" band=header.1 id=1 x=421 y=28 )"

//" column(name="+ls_campo+" band=header.1 id=1 x=421 y=28 height=64 width=274 color=0 border=1 alignment=1 format=[general] edit.focusrectangle=no edit.autohscroll=yes edit.autoselect=yes edit.autovscroll=no edit.case=any edit.codetable=no edit.displayonly=no edit.hscrollbar=no edit.imemode=0 edit.limit=0 edit.password=no edit.vscrollbar=no edit.validatecode=no edit.nilisnull=no edit.required=no criteria.required=no criteria.override_edit=no crosstab.repeat=no background.mode=1 background.color=536870912 font.charset=0 font.face=MS Sans Serif font.family=2 font.height=-8 font.pitch=2 font.weight=400 tabsequence=0 )"





end subroutine

public subroutine f_ordenar_indice (integer pi_row, integer pi_orden);
long  ll_find, li_indice
integer li_filas, li_nulo

li_indice = pi_orden

SetNull(li_nulo)

li_filas = dw_lista_reporte.rowcount()

	
dw_lista_reporte.SetItem(pi_row,"indice",li_indice)

DO
	ll_find = dw_lista_reporte.Find("indice = "+ string(li_indice) +"",1,li_filas)
	
	IF ll_find = pi_row THEN
		IF pi_row + 1 > li_filas THEN 
			ll_find = 0
		ELSE
			ll_find = dw_lista_reporte.Find("indice = "+ string(li_indice) +"",pi_row + 1,li_filas)
		END IF
	END IF
	
	IF ll_find > 0 THEN	
		li_indice += 1		
		dw_lista_reporte.SetItem(ll_find,"indice",li_indice)
		pi_row = ll_find
	END IF
LOOP UNTIL ll_find = 0 or Isnull(ll_find)
										
					
end subroutine

public subroutine f_titulo_subtitulo ();///////////////////////////////////////////////////////
//									
// Funcion/Evento: f_titulo_subtitulo
// 
// Objetivo: crea el titulo, el subtitulo, la fecha de cuando se imprimio el informe y el logo del datawindo
//				 a imprimir.
// Responsable: JHC
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//    Salida : --
//
// Devuelve: --
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------       -----------   ---------
// 12/09/2000   JHC
//
///////////////////////////////////////////////////////


Long 		ll_y_ti,  ll_header,  ll_pos, ll_pos2
String 	ls_name_ti, ls_titulo, ls_cadena


IF this.str_print_new.PARM1 THEN
	return
ELSE
	ll_header = Long(dw_1.Describe("DataWindow.Header.Height")) 
	ll_header += 250
	dw_1.Modify("DataWindow.Header.Height= " + String(ll_header) + " ")
	
		
	dw_1.Modify("create text(band=Header " + &
	" color='534543' alignment='2' border='0'" + &
	" x='600' y='1' height='90' width='2000' text='"+mle_titulo.text+"'" + &
	" name=titulo background.mode='1' font.Face='Arial' font.height = '100' font.weight='700' font.underline='1'  background.color='" + gs_blanco + "')")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	" name=titulo background.mode='1' font.Face='Arial' font.height = '100' font.weight='700' font.underline='1'  background.color='" + String(RGB(255,255,255)) + "')")
	
	dw_1.Modify("create text(band=Header " + &
	" color='534543' alignment='2' border='0'" + &
	" x='600' y='100' height='90' width='2000' text='"+mle_subtitulo.text+"'" + &
	" name=subtitulo background.mode='1' font.Face='Arial' font.height = '80' font.weight='700' font.underline='1'  background.color='" + gs_blanco + "')")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	" name=subtitulo background.mode='1' font.Face='Arial' font.height = '80' font.weight='700' font.underline='1'  background.color='" + String(RGB(255,255,255)) + "')")
	
	dw_1.Modify("create text(band=Header " + &
	" color='534543' alignment='0' border='0'" + &
	" x='0' y='150' height='50' width='400' text='"+string(today())+"'" + &
	" name=fechaactual background.mode='1' font.Face='Arial' font.height = '50' font.weight='700' font.underline='0'  background.color='" + gs_blanco + "')")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	" name=fechaactual background.mode='1' font.Face='Arial' font.height = '50' font.weight='700' font.underline='0'  background.color='" + String(RGB(255,255,255)) + "')")
	
	//crea el bitmap
//	dw_1.Modify(&
//	"create bitmap(band= Header" + &
//	" x='1' y='1' height='200' width='200'" + &
//	" filename='uf.bmp' name=bmp)")
	

//	//crea el bitmap
//	dw_1.Modify(&
//	"create bitmap(band= Header" + &
//	" x='1' y='1' height='200' width='200'" + &
//	" filename='uf.bmp' name=bmp)")
	
	
	ls_cadena = UPPER(dw_1.Describe("datawindow.syntax"))
	
	ll_pos = Pos( ls_cadena , "TEXT(NAME=" ,1)
	
	Do While ll_pos > 0
		ll_pos+= 9
		If ll_pos > 0 then
			ll_pos2 = Pos( ls_cadena , " " ,ll_pos ) 
			If ll_pos2 > 0 then
	
				 ls_name_ti = Mid(ls_cadena, ll_pos + 1 , ( ll_pos2 - 1) - ll_pos  )
				 
					If ls_name_ti <> "TITULO" AND ls_name_ti <> "SUBTITULO" AND ls_name_ti <> "FECHAACTUAL"Then
					 ll_y_ti =  Long(dw_1.Describe(ls_name_ti + ".Y")) + 250
					 dw_1.Modify(ls_name_ti  + ".Y=' " + String(ll_y_ti) +"'")
	
				 End IF	 
			ls_cadena = Mid(ls_cadena,ll_pos2)
			End If	
			
		End If	
		ll_pos = Pos( ls_cadena , "TEXT(NAME=" ,1)
	Loop
	
	dw_1.Modify("DataWindow.Print.Margin.Top=100")
	
END IF
end subroutine

public subroutine f_inabilitar_menu ();m_reportes.m_rep.m_mostrar.enabled=false
m_reportes.m_reporte.m_imprimir.enabled = false
m_reportes.m_rep.m_presentacionpreliminar.enabled= false
m_reportes.m_reporte.m_guardar.enabled = false
m_reportes.m_reporte.m_guardar.m_reporte2.enabled = false
m_reportes.m_reporte.m_guardar.m_preferencia1.enabled = false

end subroutine

public subroutine f_habilitar_menu ();m_reportes.m_rep.m_mostrar.enabled=true
m_reportes.m_reporte.m_imprimir.enabled = true
m_reportes.m_rep.m_presentacionpreliminar.enabled= true
m_reportes.m_reporte.m_guardar.enabled=true
m_reportes.m_reporte.m_guardar.m_reporte2.enabled = true
m_reportes.m_reporte.m_guardar.m_preferencia1.enabled = true
end subroutine

public function string f_preparo_archivo ();///////////////////////////////////////////////////////
//										
// funcion: fw_preparar_archivo
// 
// Objetivo: Codifica Archivo de preferencias
//	
//
// Responsable: 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : String con archivo de preferencias
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

INT li_contador, li_conta2
STRING ls_campo="" ,ls_funciones, ls_orden ,ls_asdes ,ls_arch, ls_filtro, ls_ambito, ls_agrupar, ls_corte

FOR li_contador = 0 TO dw_lista_reporte.rowcount()
	if dw_lista_reporte.isselected(li_contador) then
		ls_campo=ls_campo + string(li_contador)+"-"+string(dw_lista_reporte.getitemnumber(li_contador,"indice"))+","
		if dw_lista_reporte.getitemstring(li_contador,"funcion") <> "" THEN
			ls_funciones=string(li_contador) + "," + dw_lista_reporte.getitemstring(li_contador,"funcion")
		end if
	END IF
NEXT

if dw_lista_orden.rowcount() > 0 then
	FOR li_contador=1 TO dw_lista_orden.rowcount()
		ls_asdes= ls_asdes + string(dw_lista_orden.GETITEMnumber(li_contador,"TIPO")) + ","
//		FOR li_conta2=1 TO dw_lista_orden.rowcount()
//			if dw_lista_reporte.isselected(li_conta2) then
//				if dw_lista_reporte.getitemstring(li_conta2,"nombre") = dw_lista_orden.getitemstring(li_contador,"nombre") then
					li_conta2 = dw_lista_reporte.Find("nombre = '"+dw_lista_orden.getitemstring(li_contador,"nombre")+"'",1,dw_lista_reporte.rowcount())
					ls_orden=ls_orden + string(li_conta2) + ","
//				end if
//			end if
//		next
	next
end if

IF dw_lista_agrupar.RowCount() > 0 THEN
	ls_agrupar = string(dw_lista_reporte.Find("nombre = '"+dw_lista_agrupar.getitemstring(1,"nombre")+"'",1,dw_lista_reporte.rowcount()))
END IF

IF dw_lista_corte.RowCount() > 0 THEN
	ls_corte = string(dw_lista_reporte.Find("nombre = '"+dw_lista_corte.getitemstring(1,"nombre")+"'",1,dw_lista_reporte.rowcount()))
END IF

// Grabar Datawindows de Filtros
ls_filtro= dw_filtro.Object.DataWindow.Data

// Grabar Datawindows de ambito
ls_ambito= dw_ambito.Object.DataWindow.Data


	
ls_arch = is_tabla_principal+"?Campos#" + ls_campo + "#funciones~$$HEX1$$a400$$ENDHEX$$" + ls_funciones + "~$$HEX1$$a400$$ENDHEX$$Ordenes~$$HEX1$$a500$$ENDHEX$$" +&
				ls_orden + "~$$HEX1$$a500$$ENDHEX$$Ascdes~$$HEX1$$de00$$ENDHEX$$" + ls_asdes + "~$$HEX1$$de00$$ENDHEX$$ambito!" + ls_ambito + "!filtro@" + ls_filtro + "/AC" + ls_agrupar+","+ ls_corte +"/"

//messagebox("",ls_arch)
RETURN ls_arch
end function

public function integer f_interpretar_archivo (string ps_contenido);///////////////////////////////////////////////////////
//										
// Funcion: f_interpretar_archivo
// 
// Objetivo: Decodifica el archivo de preferencia
//	
//
// Responsable: FDB -. Frank
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_contenido 
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////////////////
/// INTERPRETACION DE LOS ARCHIVOS DE PREFERENCIAS
//////////////////////////////////////////////////////////////////////////////


//// DEFINICION DE VARIABLES
string ls_tiporep,ls_campo, ls_funcion, ls_funpos , ls_campoorden, ls_campo_ind
long ll_posicion,ll_posicion_siguiente,ll_posicion_fin,ll_recibo
long ll_contador=0, ll_posicion_guion
int li_alcance
string ls_tablas
// RECOGEMOS EL TIPO DE REPORTE
//Debemos comprobar si estamos tratando de abrir un reporte de reenganches o de incidencias
//li_alcance = dw_filtro.GetItemNumber(1,'pa_alcance')
ll_posicion=pos(ps_contenido,"?")
ls_tiporep=mid(ps_contenido,1,ll_posicion - 1)
//IF li_alcance = fgci_incidencia_reenganche THEN
//	ls_tablas = 'sgd_reenganches'	
//ELSE
//	ls_tablas = 'sgd_incidencia'
//END IF

IF ls_tiporep <> iu_comunic.is_comunic.accion_llamada THEN
	IF ls_tiporep = 'gi_avisos' THEN
		ls_tiporep = ' avisos'
	ELSEIF ls_tiporep = 'gi_brigada' THEN
		ls_tiporep = ' brigadas'
	ELSEIF ls_tiporep = 'sgd_instalacion' THEN
		ls_tiporep = ' instalaciones'
	ELSEIF ls_tiporep = 'sgd_reenganches' THEN
		ls_tiporep = ' reenganches'
	ELSEIF ls_tiporep = 'sgd_incidencia' THEN
		ls_tiporep = ' incidencias'		
	END IF
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Este informe no se puede abrir desde aqu$$HEX2$$ed002000$$ENDHEX$$puesto que se trata de un informe de"+ls_tiporep)
	return 0
END IF	

		

// CARGAMOS EL MODO DE REPORTE
//iu_comunic.is_comunic.accion_llamada = ls_tiporep
triggerevent("ue_setear_datos")

// RECOGEMOS LOS CAMPOS QUE ESTABAN MARCADOS Y LOS MARCAMOS
ll_posicion=pos(ps_contenido,"#",ll_posicion)
ll_posicion_fin=pos(ps_contenido,"#",ll_posicion+1)
do while (ll_posicion < ll_posicion_fin and ll_posicion<>0)
		ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
	if (ll_posicion_siguiente < ll_posicion_fin and ll_posicion_siguiente <> 0) then	
		
		ll_posicion_guion =  pos(ps_contenido,"-",ll_posicion + 1)				
		ls_campo=mid(ps_contenido,ll_posicion + 1,ll_posicion_guion - (ll_posicion + 1))
		dw_lista_reporte.SelectRow(long(ls_campo),true)
		
		ls_campo_ind = mid(ps_contenido,ll_posicion_guion + 1,ll_posicion_siguiente - (ll_posicion_guion + 1))
		
		dw_lista_reporte.SetItem(long(ls_campo),"indice",long(ls_campo_ind))
		
	end if
	ll_posicion=ll_posicion_siguiente
loop

// RECOGEMOS LAS FUNCIONES Y LAS INCLUIMOS
ll_posicion=0
ll_posicion_siguiente=0
ll_posicion_fin=0
ll_posicion=pos(ps_contenido,"~$$HEX1$$a400$$ENDHEX$$")
ll_posicion_fin=pos(ps_contenido,"~$$HEX1$$a400$$ENDHEX$$",ll_posicion+1)
ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
if ((ll_posicion + 1) <> ll_posicion_fin) then //si habia alguna funcion aplicada
   ls_funpos=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
   ls_funcion=mid(ps_contenido,ll_posicion_siguiente + 1, 4)
	dw_lista_reporte.setitem(long(ls_funpos),"funcion",ls_funcion)
	dw_lista_reporte.setitem(long(ls_funpos),"parentesis",")")
end if

// RECOGEMOS LOS CRITERIOS DE ORDENACION
ll_posicion=pos(ps_contenido,"~$$HEX1$$a500$$ENDHEX$$")
ll_posicion_fin=pos(ps_contenido,"~$$HEX1$$a500$$ENDHEX$$",ll_posicion+1)
if ((ll_posicion + 1) <> ll_posicion_fin) then //si habia algun criterio
   do while (ll_posicion < ll_posicion_fin and ll_posicion<>0)
		ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
	   if (ll_posicion_siguiente < ll_posicion_fin and ll_posicion_siguiente <> 0) then	
		   ls_campo=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
		   ls_campoorden=dw_lista_reporte.getitemstring(long(ls_campo),"nombre")
			dw_lista_orden.insertrow(0)
			dw_lista_orden.setitem(dw_lista_orden.rowcount(),"nombre",ls_campoorden)
			dw_lista_orden.setitem(dw_lista_orden.rowcount(),"campo",&
			dw_lista_reporte.getitemstring(long(ls_campo),"campo"))
		end if
	   ll_posicion=ll_posicion_siguiente
   loop
end if

// RECOGEMOS CRITERIOS DE ORDENACION ASCENDENTE-DESCENTE
ll_posicion=pos(ps_contenido,"~$$HEX1$$de00$$ENDHEX$$")
ll_posicion_fin=pos(ps_contenido,"~$$HEX1$$de00$$ENDHEX$$",ll_posicion+1)
do while (ll_posicion < ll_posicion_fin and ll_posicion <> 0)
	ll_contador++
		ll_posicion_siguiente=pos(ps_contenido,",",ll_posicion + 1)
	if (ll_posicion_siguiente < ll_posicion_fin and ll_posicion_siguiente <> 0) then	
		ls_campo=mid(ps_contenido,ll_posicion + 1,ll_posicion_siguiente - (ll_posicion + 1))
		dw_lista_orden.setitem(ll_contador,"tipo",long(ls_campo))
	end if
	ll_posicion=ll_posicion_siguiente
loop


// Recogemos los Datos de Ambito
dw_ambito.reset()
ll_posicion=pos(ps_contenido,"!")
ll_posicion_fin=pos(ps_contenido,"!",ll_posicion+1)
ls_campo=mid(ps_contenido,ll_posicion + 1, ll_posicion_fin - (ll_posicion + 1))
ll_recibo=dw_ambito.Importstring(ls_campo,1)
// iNCLUIR MENSAGE




// Recogemos los datos de la datawindows de ambito
ll_posicion=pos(ps_contenido,"filtro@") + 6
ls_campo=right(ps_contenido,len(ps_contenido)-ll_posicion)

IF pos(ps_contenido,"/AC") + 2 > 2 THEN
	ls_campo= left(ls_campo,Pos(ls_campo,"/AC") - 1)
END IF

dw_filtro.reset()
ll_recibo=dw_filtro.Importstring(ls_campo,1)
dw_filtro.setitem(1,"pa_periodo",today())


// Recogemos los datos de agrupacion
ll_posicion_guion = pos(ps_contenido,"/AC") + 2
ll_posicion_guion = pos(ps_contenido,"/AC") + 2
ll_posicion_siguiente = pos(ps_contenido,",",ll_posicion_guion)
ls_campo = mid(ps_contenido,ll_posicion_guion + 1,ll_posicion_siguiente - (ll_posicion_guion + 1))

IF len(ls_campo) <> 0 and IsNumber(ls_campo) THEN
	dw_lista_agrupar.InsertRow(0)

	dw_lista_agrupar.setitem(1,"nombre",dw_lista_reporte.getitemstring(long(ls_campo),"nombre"))
	dw_lista_agrupar.setitem(1,"campo",dw_lista_reporte.getitemstring(long(ls_campo),"campo"))
	dw_lista_agrupar.setitem(1,"tabla",dw_lista_reporte.getitemstring(long(ls_campo),"tabla"))
	
	ls_campo = ""
	ll_posicion_guion = ll_posicion_siguiente
	ll_posicion_siguiente = pos(ps_contenido,"/",ll_posicion_guion)
	ls_campo = mid(ps_contenido,ll_posicion_guion + 1,ll_posicion_siguiente - (ll_posicion_guion + 1))
	
	IF len(ls_campo) <> 0 THEN
	
		dw_lista_corte.InsertRow(0)
		dw_lista_corte.setitem(1,"nombre",dw_lista_reporte.getitemstring(long(ls_campo),"nombre"))
		dw_lista_corte.setitem(1,"campo",dw_lista_reporte.getitemstring(long(ls_campo),"campo"))
		dw_lista_corte.setitem(1,"tabla",dw_lista_reporte.getitemstring(long(ls_campo),"tabla"))
		
	END IF
END IF

		
//		//incluir mensage
//	CASE "gi_avisos"
//		dw_filtro.reset()
//		ll_recibo=dw_filtro.Importstring(ls_campo,1) 
//		dw_filtro.setitem(1,"pa_periodo",today())
//		//INCLUIR MENSAGE
//	CASE "gi_brigada"
//		dw_filtro.reset()
//		ll_recibo=dw_filtro.Importstring(ls_campo,1) 
//		dw_filtro.setitem(1,"pa_periodo",today())
//		//INCLUIR MENSAGE
//	CASE "sgd_instalacion"
//		dw_filtro.reset()
//		ll_recibo=dw_filtro.Importstring(ls_campo,1) 
//		dw_filtro.setitem(1,"pa_periodo",today())
////		//INCLUIR MENSAGE
//END CHOOSE
//w_reportes.setredraw(true)

//
//return 1

return 1
end function

public subroutine f_desabilitar ();
int li_cont

dw_ambito.fnu_deshab_centro(dw_ambito)
dw_ambito.fnu_deshab_cmd(dw_ambito)
dw_ambito.fnu_deshab_puesto(dw_ambito)
dw_funcion.enabled=false

dw_lista_agrupar.enabled=false
dw_lista_corte.enabled=false
dw_lista_reporte.enabled=false

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//dw_lista_orden.modify("tipo.background.color=" + string(65536*192+256*192+192))
//
//dw_filtro.enabled=false
//dw_filtro.modify("pa_periodo.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("tip_incidencia.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("tip_tension.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("mat_averiado.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("pa_centro.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("cod_causa.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("pa_operador_fecha.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("rango.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("pa_rango.background.color=" + string(65536*192+256*192+192))
//
//dw_filtro.modify("fam_causa.background.color=" + string(65536*192+256*192+192))
//dw_filtro.modify("agente.background.color=" + string(65536*192+256*192+192))

dw_lista_orden.modify("tipo.background.color=" + gs_gris)

dw_filtro.enabled=false
dw_filtro.modify("pa_periodo.background.color=" + gs_gris)
dw_filtro.modify("tip_incidencia.background.color=" + gs_gris)
dw_filtro.modify("tip_tension.background.color=" + gs_gris)
dw_filtro.modify("mat_averiado.background.color=" + gs_gris)
dw_filtro.modify("pa_centro.background.color=" + gs_gris)
dw_filtro.modify("cod_causa.background.color=" + gs_gris)
dw_filtro.modify("pa_operador_fecha.background.color=" + gs_gris)
dw_filtro.modify("rango.background.color=" + gs_gris)
dw_filtro.modify("pa_rango.background.color=" + gs_gris)

dw_filtro.modify("fam_causa.background.color=" + gs_gris)
dw_filtro.modify("agente.background.color=" + gs_gris)
// Fin. Sgo.
end subroutine

public subroutine f_habilitar ();int li_cont

dw_ambito.fpr_hab_centro(dw_ambito)
dw_ambito.fpr_hab_cmd(dw_ambito)
dw_ambito.fpr_hab_puesto(dw_ambito)
dw_funcion.enabled=true
dw_lista_agrupar.enabled = true
dw_lista_corte.enabled = true
dw_lista_reporte.enabled = true
mle_subtitulo.enabled = true
mle_titulo.enabled = true
dw_lista_orden.modify("tipo.background.color=" + string(65536*255+256*255+255))

dw_filtro.enabled=true
dw_filtro.modify("pa_periodo.background.color=" + string(65536*255+256*255+255))

//***************************************
//**  OSGI 2001.1  	26/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	26/04/2001  dw_filtro.modify("cod_hor.background.color=" + string(65536*255+256*255+255))
//**  OSGI 2001.1  	26/04/2001  dw_filtro.SetTabOrder("cod_hor",50)
//**  OSGI 2001.1  	26/04/2001  dw_filtro.modify("tipo_instalacion.background.color=" + string(65536*255+256*255+255))
//**  OSGI 2001.1  	26/04/2001  dw_filtro.SetTabOrder("tipo_instalacion",120)
//**  OSGI 2001.1  	26/04/2001  dw_filtro.modify("est_actual.background.color=" + string(65536*255+256*255+255))
//**  OSGI 2001.1  	26/04/2001  dw_filtro.SetTabOrder("est_actual",140)
//**  OSGI 2001.1  	26/04/2001  dw_filtro.modify("pa_incid_relevante.background.color=" + string(65536*255+256*255+255))
//**  OSGI 2001.1  	26/04/2001  dw_filtro.SetTabOrder("pa_incid_relevante",150)
//***************************************
//**  OSGI 2001.1  	26/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
dw_filtro.modify("tip_incidencia.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("tip_tension.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("mat_averiado.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("pa_centro.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("ps_nom_causa.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("pa_operador_fecha.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("rango.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("pa_rango.background.color=" + string(65536*255+256*255+255))

//dw_filtro.modify("fam_causa.background.color=" + string(65536*255+256*255+255))
dw_filtro.modify("agente.background.color=" + string(65536*255+256*255+255))

end subroutine

public subroutine f_reordena_indice (long pas_indice, integer pas_cantfilas);long ll_indice, ll_find
ll_indice = pas_indice
DO
	ll_indice += 1
	
	ll_find = dw_lista_reporte.Find("indice = "+ string(ll_indice) +"",1,pas_cantfilas)
	
	IF ll_find > 0 THEN	
		
		ll_indice -= 1		
		dw_lista_reporte.SetItem(ll_find,"indice",ll_indice)
		ll_indice += 1
	END IF
LOOP UNTIL ll_find = 0 or Isnull(ll_find)
end subroutine

public subroutine fw_fam_causa ();Integer li_tipo_incidencia



li_tipo_incidencia = dw_filtro.GetItemNumber(1, "tip_incidencia")

If li_tipo_incidencia = 0 Then
	dw_filtro.GetChild("fam_causa", idwchild_famcausa)
	idwchild_famcausa.SetTransObject(SQLCA)
	idwchild_famcausa.Retrieve(0)
Else
	dw_filtro.GetChild("fam_causa", idwchild_famcausa)
	idwchild_famcausa.SetTransObject(SQLCA)
	idwchild_famcausa.Retrieve(li_tipo_incidencia)
End If

idwchild_famcausa.InsertRow(1)
idwchild_famcausa.SetItem(1, "gpo_causa", 0)
idwchild_famcausa.SetItem(1, "descripcion", "<Todos>")
idwchild_famcausa.AcceptText()

dw_filtro.SetItem(1, "fam_causa", 0)

idwchild_famcausa.ScrollToRow(1)

fw_causa(0)
end subroutine

public subroutine fw_causa (readonly long al_gpo_causa);dw_filtro.Getchild("cod_causa", idwchild_codcausa)
idwchild_codcausa.SettransObject(SQLCA)
dw_filtro.SetItem(1,"cod_causa", 0)
idwchild_codcausa.Retrieve(al_gpo_causa)

idwchild_codcausa.InsertRow(1)
idwchild_codcausa.SetItem(1, "cod_causa", 0)
idwchild_codcausa.SetItem(1, "descripcion", "<Todos>")

idwchild_codcausa.ScrollToRow(1)
end subroutine

public subroutine dw ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If fg_verifica_parametro('nuevos_tip_inc') Then
	If Not gb_scada Then
		fg_filtro_ext(dw_filtro, "not_nuevos_tip_inc_consulta_scada", "ai_tipo")
	Else
		fg_filtro_ext(dw_filtro, "not_nuevos_tip_inc_consulta", "ai_tipo")
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public subroutine dwdsfsd ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If fg_verifica_parametro('nuevos_tip_inc') Then
	If Not gb_scada Then
		fg_filtro_ext(dw_filtro, "not_nuevos_tip_inc_consulta_scada", is_campo_inc)
	Else
		fg_filtro_ext(dw_filtro, "not_nuevos_tip_inc_consulta", is_campo_inc)
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public subroutine fw_filtro_tipo_inc_ext ();//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not fg_verifica_parametro('nuevos_tip_inc') Or &
	fg_verifica_parametro('not_nuevos_tip_inc') Then

	If Not gb_scada Then
		fg_filtro_ext(dw_filtro, "not_nuevos_tip_inc_consulta_scada", 'tip_incidencia')
	Else
		fg_filtro_ext(dw_filtro, "not_nuevos_tip_inc_consulta", 'tip_incidencia')
	End If
End If
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public subroutine f_armar_select_reenganches ();long ll_totalfila, ll_filas, ll_find, ll_indice, ll_cantfrom, ll_seleccion, &
		ll_centro , ll_cmd, ll_mesa, ll_rowfind, ll_nro_instalacion
string ls_select, ls_funcion, ls_campo, ls_groupby, ls_join1, &
		 ls_tabla, ls_nulo, ls_from[], ls_newfrom[], ls_groupjoin, ls_join2, &
		 ls_operador, ls_wheredate, ls_cadenafrom, ls_filtro,  /*ls_orderby,*/ &
		 ls_campo_agrupa, ls_campo_corte, ls_ordena, ls_campo_f, ls_tabla_f, ls_sinonimo_f, &
		 ls_sinonimo
any lany_from[]

boolean lb_solo_cantidad = false

integer 	li_existe, li_rangperi, li_i, &
			li_tipo_tension,  &
			li_tipo_intal,  li_orden, li_filtro1, li_filtro2, li_agrupar

date ldt_periodo, ldt_rango

dw_filtro.AcceptText()
dw_ambito.AcceptText()
dw_funcion.AcceptText()
dw_lista_reporte.AcceptText()
dw_lista_orden.AcceptText()
dw_lista_agrupar.AcceptTExt()
dw_lista_corte.AcceptText()

SetNull(ls_nulo)

ll_indice = 1

li_agrupar = dw_lista_agrupar.Rowcount() //nuevo SGI SUR13 JHC 15/02/2001

ll_totalfila = dw_lista_reporte.RowCount()

ll_find = dw_lista_reporte.find("indice = 1",1,ll_totalfila)

li_existe = dw_lista_reporte.find("funcion <> ''",1,ll_totalfila)

ls_select = "Select "

ls_groupjoin = " Where "

ls_groupby = " Group By "

ll_seleccion = dw_lista_reporte.GetSelectedRow(0)

IF ll_seleccion = ll_totalfila THEN
	lb_solo_cantidad = true
ELSE
	lb_solo_cantidad = false
END IF

////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////
DO
	
	IF ll_find > 0 THEN
		
		ls_funcion = dw_lista_reporte.GetItemString(ll_find,"funcion")
		
		IF ls_funcion <> "" THEN
			
			ls_tabla_f = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo_f = dw_lista_reporte.GetItemString(ll_find,"campo")

			ls_join1 = dw_lista_reporte.GetItemString(ll_find,"join")
			
			ls_sinonimo_f = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
			IF NOT lb_solo_cantidad THEN
				IF ls_sinonimo_f <> "" THEN	
					IF dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
						ls_select += ls_funcion +"TO_CHAR(" +ls_sinonimo_f +"."+ ls_campo_f + ",'dd/mm/yyyy')) AS "+ ls_sinonimo_f+ls_campo_f+", "
	
					ELSE
						ls_select += ls_funcion + ls_sinonimo_f +"."+ ls_campo_f + ") AS "+ ls_sinonimo_f+ls_campo_f+", "
	
					END IF
					
					IF ls_tabla_f <> "" THEN ls_from[ll_indice] = ls_tabla_f+" "+ls_sinonimo_f
				ELSE
					IF dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
						ls_select += ls_funcion+"TO_CHAR("+ls_tabla_f +"."+ ls_campo_f + ",'dd/mm/yyyy')) AS "+ ls_campo_f+", "
	
					ELSE
	
						IF ls_funcion = "AVG(" THEN
							ls_select += "Round("+ls_funcion +"nvl("+ ls_tabla_f +"."+ ls_campo_f + ",0)),2) AS "+ ls_campo_f+", "
						ELSE
							ls_select += ls_funcion +"nvl("+ ls_tabla_f +"."+ ls_campo_f + ",0)) AS "+ ls_campo_f+", "
						END IF
					END IF
					IF ls_tabla_f <> ""  THEN ls_from[ll_indice] = ls_tabla_f
				END IF
	
				
				ll_cantfrom = UpperBound(ls_from)
					
				IF ls_join1 <> "" THEN	
					
					ls_groupjoin += ls_join1 + " and " 
					
				END IF
				
				ll_indice += 1
				
				ls_join1 = ls_nulo
				ls_funcion = ls_nulo
			ELSE
				ll_find = 0
				messagebox("Atencion","Debe seleccionar otro campo para generar el informe")				
				return
			END IF
		ELSE
			
			ls_tabla = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo = dw_lista_reporte.GetItemString(ll_find,"campo")
			
			ls_join1 = dw_lista_reporte.GetItemString(ll_find,"join")			
	
			ls_sinonimo = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
			IF NOT lb_solo_cantidad then
				IF li_agrupar > 0 AND ls_campo = "cantidad" THEN
					IF ls_sinonimo <> "" THEN
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select +=  "Count(TO_CHAR("+ls_sinonimo+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
													
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
								
							ls_select +=  "Count(TO_CHAR("+ls_sinonimo+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							
						ELSE
							ls_select +=  "Count("+ls_sinonimo+"."+ls_campo+") AS cantidad, "
						END IF
						
						If ls_tabla <> "" THEN ls_from[ll_indice] = ls_tabla + " " +ls_sinonimo //CAMBIO SGI SUR13 JHC 15/02/2001 
					ELSE
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select +=  "Count(TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							ls_groupby += "TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy'), "//nuevo SGI SUR13 JHC 15/02/2001
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN							
							ls_select +=  "Count(TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							ls_groupby += "TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy'), "//nuevo SGI SUR13 JHC 15/02/2001
						ELSE

							IF dw_lista_orden.Find("campo = '"+dw_lista_agrupar.GetItemString(1,"campo")+"'",1,dw_lista_orden.rowCount()) > 0 AND &
								dw_lista_reporte.GetItemString(dw_lista_reporte.Find("campo = '"+dw_lista_agrupar.GetItemString(1,"campo")+"'",1,dw_lista_reporte.rowCount()),"tipo") = "N" THEN
								
								ls_select +=  "Count(nvl("+dw_lista_orden.GetItemstring(1,"tabla")+"."+dw_lista_orden.GetItemstring(1,"campo")+",0)) AS cantidad, "
							END IF
						END IF
						If ls_tabla <> "" THEN  ls_from[ll_indice] = ls_tabla//nuevo SGI SUR13 JHC 15/02/2001
					END IF
					
				ELSE
					IF ls_sinonimo <> "" THEN
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy') AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
								
							ls_select += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy') AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy'), "
						ELSE
							
							ls_select += ls_sinonimo +"."+ ls_campo + " AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += ls_sinonimo +"."+ ls_campo +", "
						END IF
						
						IF ls_tabla <> ""  THEN ls_from[ll_indice] = ls_tabla + " " +ls_sinonimo //CAMBIO SGI SUR13 JHC 15/02/2001 
					ELSE
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy') AS "+ls_campo+", "
							
							ls_groupby += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy') AS "+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy'), "
						ELSE
							IF ls_tabla <> "" and ls_campo <> "cantidad" THEN
								ls_select += ls_tabla +"."+ ls_campo + ", "
							END IF
							ls_groupby += ls_tabla +"."+ ls_campo + ", "
						END IF
						
						IF ls_tabla <> "" THEN	ls_from[ll_indice] = ls_tabla //CAMBIO SGI SUR13 JHC 15/02/2001 
						
					END IF
				END IF
		
				ll_cantfrom = UpperBound(ls_from)
				
				IF ls_join1 <> "" THEN
					
					ls_groupjoin += ls_join1 + " and " 
					
					ls_join1 = ls_nulo
					
				END IF
				
				ll_indice += 1
			
			ELSE
			   ll_find = 0
				messagebox("Atencion","Debe seleccionar otro campo para generar el informe")				
				return
			END IF
		END IF
	END IF
	
	ll_find = dw_lista_reporte.find("indice = "+string(ll_indice)+"",1,ll_totalfila)
	
	IF ll_find = 0 OR IsNull(ll_find) THEN
		
		ls_select = left(ls_select,len(ls_select) - 2)
		
		IF ls_groupjoin = " Where and " THEN 
			ls_groupjoin = left(ls_groupjoin,len(ls_groupjoin) - 4)
		END IF
		IF	ls_groupby <> " Group By " THEN 
			ls_groupby = left(ls_groupby,len(ls_groupby) - 2)
		ELSE
			ls_groupby = ""
		END IF
		
	END IF
	
LOOP UNTIL ll_find = 0 OR IsNull(ll_find)


////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////

////////////////////////////////////////////////////ORDER BY//////////////////////////////

IF dw_lista_orden.Rowcount() > 0 THEN
	
	is_order_by = " Order by "
	
	FOR li_i = 1 TO dw_lista_orden.RowCount()
		
		li_orden = dw_lista_orden.GetITemNumber(li_i,"tipo")
		IF li_orden = 1 THEN 
			ls_ordena = "ASC"	
		ELSEIF li_orden = 2 THEN
			ls_ordena = "DESC"
		END IF
		//Cambio SGI DOM II JHC 11/01/2001  ********************************					
		ll_rowfind = dw_lista_reporte.Find("nombre = '" +dw_lista_orden.getitemstring(li_i,"nombre")+"'",1,dw_lista_reporte.Rowcount())


		If ll_rowfind > 0 Then
			is_order_by += String(dw_lista_reporte.GetItemNumber(ll_rowfind,"indice"))	+ " " + ls_ordena + " , "
			//is_order_by += dw_lista_reporte.GetItemString(ll_rowfind,"tabla") + "." + dw_lista_reporte.GetItemString(ll_rowfind,"campo") + " " + ls_ordena + " , "
		End If
	
	NEXT
	
	is_order_by = left(is_order_by,len(is_order_by) - 2)
	
ELSE
	
	is_order_by = ""
	
END IF


////////////////////////////////////////////////////ORDER BY//////////////////////////////


////////////////////////////////////////////////////AMBITO//////////////////////////////
ll_centro = dw_ambito.GetItemNumber(1,"nro_centro")
ll_cmd = dw_ambito.GetItemNumber(1,"nro_cmd")
ll_mesa = dw_ambito.GetItemNumber(1,"nro_mesa")

ls_join2 += "("+is_tabla_principal+".nro_zona = "+string(ll_centro)+" OR "+string(ll_centro)+" = 0) AND "+"~n"+&
				"("+is_tabla_principal+".nro_cmd = "+string(ll_cmd)+" OR "+string(ll_cmd)+" = 0) AND " + "~n" +&
				"("+is_tabla_principal+".nro_sector= "+string(ll_mesa)+" OR "+string(ll_mesa)+" = 0) "

ls_from[UpperBound(ls_from) + 1] = is_tabla_principal
////////////////////////////////////////////////////AMBITO//////////////////////////////				
				
////////////////////////////////////////////////////RANGO O PERIODO//////////////////////////////
li_rangperi = dw_filtro.GetItemNumber(1,"rango")

IF li_rangperi = 1 THEN
	
	ls_operador = dw_filtro.GetItemString(1,"pa_operador_fecha")
	
	ldt_periodo = date(dw_filtro.GetItemDateTime(1,"pa_periodo"))

	ls_wheredate = "to_number(to_char(sgd_reenganches.f_deteccion,'yyyymmdd')) " + ls_operador +" "+ string(ldt_periodo,'yyyymmdd')
	
ELSE
	
	ldt_rango = date(dw_filtro.GetItemDatetime(1,"pa_rango"))
	
	ldt_periodo = date(dw_filtro.GetItemDateTime(1,"pa_periodo"))
	
	ls_wheredate = "to_number(to_char(sgd_reenganches.f_deteccion,'yyyymmdd')) between " + string(ldt_rango,'yyyymmdd') +" AND " + string(ldt_periodo,'yyyymmdd')+""
		
END IF
////////////////////////////////////////////////////RANGO O PERIODO//////////////////////////////


///////////////////////////////////FILTROS/////////////////////////////////////////////////////////


li_tipo_tension = dw_filtro.GetItemNumber(1,"tip_tension")
ll_nro_instalacion = dw_filtro.GetItemNumber (1,"nro_instalacion")

IF ll_nro_instalacion > 0 THEN
	ls_filtro += is_tabla_principal + ".nro_inst_afectada = " + string(ll_nro_instalacion) + " AND "
ELSE
	IF li_tipo_tension >  0 THEN	
		ls_filtro += is_tabla_principal +".tip_tension ="+ string(li_tipo_tension)  +" AND "
	END IF
END IF
IF li_tipo_intal > 0 THEN
	ls_filtro += "sgd_instalacion.nro_instalacion = sgd_reenganches.nro_inst_afectada AND " +&
	"sgd_instalacion.bdi_job = 0 AND sgd_instalacion.tipo_instalacion = "+ string(li_tipo_intal)  +" AND "
	li_filtro1 = 1
END IF

ls_filtro = left(ls_filtro,len(ls_filtro) - 4)

IF	li_filtro1 = 1 THEN ls_from[UpperBound(ls_from) + 1] = "sgd_instalacion"
//IF	li_filtro2 = 2 THEN 	ls_from[UpperBound(ls_from) + 1] = "gi_par_relevantes_bdg"
///////////////////////////////////FILTROS/////////////////////////////////////////////////////////

///////////////////////////////////FROM/////////////////////////////////////////////////////////

f_verifica_from(ls_from,UpperBound(ls_from))

ls_cadenafrom = ' From '

FOR li_i = 1 To UpperBound(is_newfrom)

	ls_cadenafrom += is_newfrom[li_i] + ", "
	
NEXT

///////////////////////////////////FROM/////////////////////////////////////////////////////////

ls_cadenafrom = left(ls_cadenafrom,len(ls_cadenafrom) - 2)


IF li_existe > 0 AND is_order_by <> "" AND ls_filtro <> "" THEN
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + " AND " + &
					ls_filtro + " " + ls_groupby + " " 
		
ELSEIF li_existe > 0 AND ls_filtro <> "" THEN
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
					ls_filtro +" " 

ELSEIF li_existe > 0 THEN

	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" "+ls_groupby

ELSEIF	li_existe <= 0 AND is_order_by <> "" AND ls_filtro <> "" AND li_agrupar = 0 THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + " AND " +&
						" " + ls_filtro + " " 
ELSEIF li_existe <= 0 AND ls_filtro <> "" AND li_agrupar = 0 THEN

		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND "+ &
						ls_filtro
//NUEVO DOM SUR13 *JHE 15/02/2001*
ELSEIF li_agrupar > 0 AND ls_filtro <> "" AND is_order_by <> "" THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
						ls_filtro +" " + ls_groupby + " " /*+ ls_orderby*/
						
ELSEIF li_agrupar > 0 AND ls_filtro <> "" THEN
		
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
						ls_filtro +" " + ls_groupby
						
ELSEIF li_agrupar > 0 AND is_order_by <> "" THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " + ls_groupby + " " 

ELSEIF li_agrupar > 0 THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " + ls_groupby

ELSEIF li_existe <= 0 AND is_order_by <> "" THEN
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " 

ELSE
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate
		
END IF
is_preferencia = f_preparo_archivo()
this.str_print_new.PARM1 = false					
f_modificar_dw(ls_select)


end subroutine

public function integer fw_validar_fechas ();datetime ldt_rango
datetime ldt_periodo
datetime ldt_nulo

dw_filtro.accepttext()
SetNull(ldt_nulo)

ldt_periodo = dw_filtro.object.pa_periodo[1]
ldt_rango = dw_filtro.object.pa_rango[1]
IF IsDate(string(date(ldt_periodo))) and IsTime(string(time(ldt_periodo))) THEN
	if isnull(ldt_periodo) or isnull(day(date(ldt_periodo))) or isnull(month(date(ldt_periodo))) or isnull(year(date(ldt_periodo))) &
		or day(date(ldt_periodo)) = 0 or month(date(ldt_periodo)) = 0 or year(date(ldt_periodo)) = 0 then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe cumplimentar correctamente las fechas",information!,ok!)
		return -1
	end if
ELSE
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe cumplimentar correctamente las fechas",information!,ok!)
	dw_filtro.SetItem (1,'pa_periodo',today())
	return -1
END IF

if isnull(ldt_rango) or isnull(day(date(ldt_rango))) or isnull(month(date(ldt_rango))) or isnull(year(date(ldt_rango))) &
	or day(date(ldt_rango)) = 0 or month(date(ldt_rango)) = 0 or year(date(ldt_rango)) = 0 then
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe cumplimentar correctamente las fechas",information!,ok!)
	return -1
end if

return 1
end function

public subroutine f_armar_select_brigadas ();long ll_totalfila, ll_filas, ll_find, ll_indice, ll_cantfrom, ll_seleccion, &
		ll_centro , ll_cmd, ll_mesa, ll_rowfind, ll_nro_instalacion
string ls_select, ls_funcion, ls_campo, ls_groupby, ls_join1, &
		 ls_tabla, ls_nulo, ls_from[], ls_newfrom[], ls_groupjoin, ls_join2, &
		 ls_operador, ls_wheredate, ls_cadenafrom, ls_filtro, ls_mat_averiado , /*ls_orderby,*/ &
		 ls_campo_agrupa, ls_campo_corte, ls_ordena, ls_campo_f, ls_tabla_f, ls_sinonimo_f, &
		 ls_sinonimo
any lany_from[]

boolean lb_solo_cantidad = false

integer 	li_existe, li_rangperi, li_i, li_tip_incid, &
			li_tipo_tension, li_cod_causa ,li_fam_causa, &
			li_tipo_intal, li_agente, li_relevante, li_orden, li_filtro1, li_filtro2, li_agrupar

date ldt_periodo, ldt_rango


int li_estado
int li_tipo
int li_intervalo_horario,li_rango
datetime ld_fecha,ld_fecha_desde
string ls_operador_fecha
string ls_retorno
String ls_fecha_select
string ls_mes,ls_fecha_rango

dw_filtro.AcceptText()
dw_ambito.AcceptText()
dw_funcion.AcceptText()
dw_lista_reporte.AcceptText()
dw_lista_orden.AcceptText()
dw_lista_agrupar.AcceptTExt()
dw_lista_corte.AcceptText()

SetNull(ls_nulo)

ll_indice = 1

li_agrupar = dw_lista_agrupar.Rowcount() //nuevo SGI SUR13 JHC 15/02/2001

ll_totalfila = dw_lista_reporte.RowCount()

ll_find = dw_lista_reporte.find("indice = 1",1,ll_totalfila)

li_existe = dw_lista_reporte.find("funcion <> ''",1,ll_totalfila)

ls_select = "Select "

ls_groupjoin = " Where "

ls_groupby = " Group By "

ll_seleccion = dw_lista_reporte.GetSelectedRow(0)

IF ll_seleccion = ll_totalfila THEN
	lb_solo_cantidad = true
ELSE
	lb_solo_cantidad = false
END IF

////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////
DO
	
	IF ll_find > 0 THEN
		
		ls_funcion = dw_lista_reporte.GetItemString(ll_find,"funcion")
		
		IF ls_funcion <> "" THEN
			
			ls_tabla_f = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo_f = dw_lista_reporte.GetItemString(ll_find,"campo")

			ls_join1 = dw_lista_reporte.GetItemString(ll_find,"join")
			
			ls_sinonimo_f = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
						
			IF NOT lb_solo_cantidad THEN
				IF ls_sinonimo_f <> "" THEN	
					IF dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
						ls_select += ls_funcion +"TO_CHAR(" +ls_sinonimo_f +"."+ ls_campo_f + ",'dd/mm/yyyy')) AS "+ ls_sinonimo_f+ls_campo_f+", "
	//					ls_groupby += "TO_CHAR(" +ls_sinonimo_f +"."+ ls_campo_f + ",'dd/mm/yyyy'), "
					ELSE
						ls_select += ls_funcion + ls_sinonimo_f +"."+ ls_campo_f + ") AS "+ ls_sinonimo_f+ls_campo_f+", "
	//					ls_groupby += ls_sinonimo_f +"."+ ls_campo_f +", "
					END IF
					
					IF ls_tabla_f <> "" THEN ls_from[ll_indice] = ls_tabla_f+" "+ls_sinonimo_f
				ELSE
					IF dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
						ls_select += ls_funcion+"TO_CHAR("+ls_tabla_f +"."+ ls_campo_f + ",'dd/mm/yyyy')) AS "+ ls_campo_f+", "
	//					ls_groupby += "TO_CHAR("+ls_tabla_f +"."+ ls_campo_f + ",'dd/mm/yyyy'), "
					ELSE
						//Cambio SGI SUR13 JHC 14/02/2001
	//					ls_select += ls_funcion + ls_tabla_f +"."+ ls_campo_f + ") AS "+ ls_campo_f+", "
						IF ls_funcion = "AVG(" THEN
							ls_select += "Round("+ls_funcion +"nvl("+ ls_tabla_f +"."+ ls_campo_f + ",0)),2) AS "+ ls_campo_f+", "
						ELSE
							ls_select += ls_funcion +"nvl("+ ls_tabla_f +"."+ ls_campo_f + ",0)) AS "+ ls_campo_f+", "
						END IF
						//Cambio SGI SUR13 JHC 14/02/2001
	//					ls_groupby += ls_tabla_f +"."+ ls_campo_f +", "
					END IF
					IF ls_tabla_f <> ""  THEN ls_from[ll_indice] = ls_tabla_f
				END IF
	
				
				ll_cantfrom = UpperBound(ls_from)
					
				IF ls_join1 <> "" THEN	
					
					ls_groupjoin += ls_join1 + " and " //+ ""+string(ll_find)+""
					
				END IF
				
				ll_indice += 1
				
				ls_join1 = ls_nulo
				ls_funcion = ls_nulo
			ELSE
				ll_find = 0
				messagebox("Atencion","Debe seleccionar otro campo para generar el informe")
				return
			END IF
		ELSE
			
			ls_tabla = dw_lista_reporte.GetItemString(ll_find,"tabla")
			
			ls_campo = dw_lista_reporte.GetItemString(ll_find,"campo")
			
			ls_join1 = dw_lista_reporte.GetItemString(ll_find,"join")			
	
			ls_sinonimo = dw_lista_reporte.GetItemString(ll_find,"sinonimo")
			
						
			IF NOT lb_solo_cantidad THEN
				//IF li_existe > 0 AND ls_campo = "cantidad" THEN //CAMBIO SGI SUR13 JHC 15/02/2001 
				IF li_agrupar > 0 AND ls_campo = "cantidad" THEN
					IF ls_sinonimo <> "" THEN
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select +=  "Count(TO_CHAR("+ls_sinonimo+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							
//							ls_groupby += "TO_CHAR("+ls_sinonimo_f+"."+ls_campo_f+",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
								
							ls_select +=  "Count(TO_CHAR("+ls_sinonimo+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							
//							ls_groupby += "TO_CHAR("+ls_sinonimo_f+"."+ls_campo_f+",'dd/mm/yyyy'), "
							
						ELSE
							ls_select +=  "Count("+ls_sinonimo+"."+ls_campo+") AS cantidad, "
						END IF
						
						If ls_tabla <> "" THEN ls_from[ll_indice] = ls_tabla + " " +ls_sinonimo //CAMBIO SGI SUR13 JHC 15/02/2001 
					ELSE
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select +=  "Count(TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							ls_groupby += "TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy'), "//nuevo SGI SUR13 JHC 15/02/2001
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN							
							ls_select +=  "Count(TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy')) AS cantidad, "
							ls_groupby += "TO_CHAR("+ls_tabla+"."+ls_campo+",'dd/mm/yyyy'), "//nuevo SGI SUR13 JHC 15/02/2001
						ELSE
//							ls_select +=  "Count("+ls_tabla_f+"."+ls_campo_f+") AS cantidad, "
							IF dw_lista_orden.Find("campo = '"+dw_lista_agrupar.GetItemString(1,"campo")+"'",1,dw_lista_orden.rowCount()) > 0 AND &
								dw_lista_reporte.GetItemString(dw_lista_reporte.Find("campo = '"+dw_lista_agrupar.GetItemString(1,"campo")+"'",1,dw_lista_reporte.rowCount()),"tipo") = "N" THEN
//    						dw_lista_reporte.GetItemString(ll_find,"tipo") = "N" THEN 	//Cambio SGI SUR13 JHC 14/02/2001	
								
								ls_select +=  "Count(nvl("+dw_lista_orden.GetItemstring(1,"tabla")+"."+dw_lista_orden.GetItemstring(1,"campo")+",0)) AS cantidad, "
							ELSE
								//ls_select +=  "Count("+dw_lista_orden.GetItemstring(1,"tabla")+"."+dw_lista_orden.GetItemstring(1,"campo")+") AS cantidad, "
							END IF
						END IF
						If ls_tabla <> "" THEN  ls_from[ll_indice] = ls_tabla//nuevo SGI SUR13 JHC 15/02/2001
					END IF
					
				ELSE
					IF ls_sinonimo <> "" THEN
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy') AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
								dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
								
							ls_select += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy') AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_sinonimo +"."+ ls_campo + ",'dd/mm/yyyy'), "
						ELSE
							
							ls_select += ls_sinonimo +"."+ ls_campo + " AS "+ls_sinonimo+ls_campo+", "
							ls_groupby += ls_sinonimo +"."+ ls_campo +", "
						END IF
						
						IF ls_tabla <> ""  THEN ls_from[ll_indice] = ls_tabla + " " +ls_sinonimo //CAMBIO SGI SUR13 JHC 15/02/2001 
					ELSE
						IF dw_lista_agrupar.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy') AS "+ls_campo+", "
							
							ls_groupby += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy'), "
							
						ELSEIF dw_lista_corte.Find("campo = '"+dw_lista_reporte.GetItemString(ll_find,"campo")+"'",1,1) > 0 AND &
							dw_lista_reporte.GetItemString(ll_find,"tipo") = "D" THEN
							
							ls_select += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy') AS "+ls_campo+", "
							ls_groupby += "TO_CHAR("+ls_tabla +"."+ ls_campo +",'dd/mm/yyyy'), "
						ELSE
							
							IF ls_campo = 'paxtc' THEN 
								ls_select += "Round(Nvl("+ls_tabla +"."+ ls_campo + ",0)/60,2) AS "+ ls_campo +", "
							ELSEIF ls_campo = 'pot_afectada' THEN//CAMBIO DOM SUR13 *JHE 14/02/2001*
								ls_select += "Nvl("+ls_tabla +"."+ ls_campo + ",0) AS "+ ls_campo +", "
							ELSE                         //CAMBIO DOM SUR13 *JHE 14/02/2001*
								IF ls_tabla <> "" and ls_campo <> "cantidad" THEN
									ls_select += ls_tabla +"."+ ls_campo + ", "
								END IF
//									ls_select += ls_tabla +"."+ ls_campo + ", "
							END IF
							ls_groupby += ls_tabla +"."+ ls_campo + ", "
						END IF
						
						IF ls_tabla <> "" THEN	ls_from[ll_indice] = ls_tabla //CAMBIO SGI SUR13 JHC 15/02/2001 
						
					END IF
				END IF
		
				ll_cantfrom = UpperBound(ls_from)
				
				IF ls_join1 <> "" THEN
					
					ls_groupjoin += ls_join1 + " and " //+ ""+string(ll_find)+""
					
					ls_join1 = ls_nulo
					
				END IF
				
				ll_indice += 1
				
//				IF li_existe > 0 AND ls_campo <> "cantidad" THEN
//					IF ls_sinonimo <> "" THEN
//						ls_groupby += ls_sinonimo +"."+ ls_campo + ", "
//					ELSE
//						ls_groupby += ls_tabla +"."+ ls_campo + ", "
//					END IF
//				END IF
			ELSE
				ll_find = 0
				messagebox("Atencion","Debe seleccionar otro campo para generar el informe")				
				return
			END IF
		END IF
			
	END IF
	
	ll_find = dw_lista_reporte.find("indice = "+string(ll_indice)+"",1,ll_totalfila)
	
	IF ll_find = 0 OR IsNull(ll_find) THEN
		
		ls_select = left(ls_select,len(ls_select) - 2)
		
		IF ls_groupjoin = " Where and " THEN 
			ls_groupjoin = left(ls_groupjoin,len(ls_groupjoin) - 4)
		END IF
		IF	ls_groupby <> " Group By " THEN 
			ls_groupby = left(ls_groupby,len(ls_groupby) - 2)
		ELSE
			ls_groupby = ""
		END IF
		
	END IF
	
LOOP UNTIL ll_find = 0 OR IsNull(ll_find)


////////////////////////////////////////////////////SELECT FROM WHERE GROUP BY//////////////////////////////

////////////////////////////////////////////////////ORDER BY//////////////////////////////

IF dw_lista_orden.Rowcount() > 0 THEN
	
	is_order_by = " Order by "
	
	FOR li_i = 1 TO dw_lista_orden.RowCount()
		
		li_orden = dw_lista_orden.GetITemNumber(li_i,"tipo")
		IF li_orden = 1 THEN 
			ls_ordena = "ASC"	
		ELSEIF li_orden = 2 THEN
			ls_ordena = "DESC"
		END IF
		//Cambio SGI DOM II JHC 11/01/2001  ********************************					
		ll_rowfind = dw_lista_reporte.Find("nombre = '" +dw_lista_orden.getitemstring(li_i,"nombre")+"'",1,dw_lista_reporte.Rowcount())


		If ll_rowfind > 0 Then
			is_order_by += String(dw_lista_reporte.GetItemNumber(ll_rowfind,"indice"))	+ " " + ls_ordena + " , "
			//is_order_by += dw_lista_reporte.GetItemString(ll_rowfind,"tabla") + "." + dw_lista_reporte.GetItemString(ll_rowfind,"campo") + " " + ls_ordena + " , "
		End If
	
//		IF ll_rowfind > 0 AND dw_lista_reporte.GetItemString(ll_rowfind,"sinonimo") <> "" THEN 
//
//			is_order_by += dw_lista_reporte.GetItemString(ll_rowfind,"sinonimo")	+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
//						  " "+ ls_ordena +" , "
//		//Cambio SGI DOM II JHC 11/01/2001  ********************************		
//		ELSE
//			//CAMBIO DOM SUR13 *JHE 14/02/2001*
////			ls_orderby += dw_lista_orden.GetITemString(li_i,"tabla")+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
////						  " "+ ls_ordena +" , "
//			IF dw_lista_reporte.GetItemString(ll_rowfind,"Tipo") = "D" THEN
//				is_order_by += "TO_CHAR("+dw_lista_orden.GetITemString(li_i,"tabla")+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
//						  ",'dd/mm/yyyy') "+ ls_ordena +" , "						 
//			ELSE
//				is_order_by += dw_lista_orden.GetITemString(li_i,"tabla")+"."+dw_lista_orden.GetItemString(li_i,"campo") +&
//						  " "+ ls_ordena +" , "
//			END IF
//			//CAMBIO DOM SUR13 *JHE 14/02/2001*
//		END IF
	NEXT
	
	is_order_by = left(is_order_by,len(is_order_by) - 2)
	
ELSE
	
	is_order_by = ""
	
END IF


////////////////////////////////////////////////////ORDER BY//////////////////////////////


////////////////////////////////////////////////////AMBITO//////////////////////////////
ll_centro = dw_ambito.GetItemNumber(1,"nro_centro")
ll_cmd = dw_ambito.GetItemNumber(1,"nro_cmd")
ll_mesa = dw_ambito.GetItemNumber(1,"nro_mesa")

ls_join2 += "("+is_tabla_principal+".nro_centro = "+string(ll_centro)+" OR "+string(ll_centro)+" = 0) AND "+"~n"+&
				"("+is_tabla_principal+".nro_cmd = "+string(ll_cmd)+" OR "+string(ll_cmd)+" = 0) AND " + "~n" +&
				"("+is_tabla_principal+".nro_mesa= "+string(ll_mesa)+" OR "+string(ll_mesa)+" = 0) "

ls_from[UpperBound(ls_from) + 1] = is_tabla_principal
////////////////////////////////////////////////////AMBITO//////////////////////////////				
				
////////////////////////////////////////////////////RANGO O PERIODO//////////////////////////////
li_rangperi = dw_filtro.GetItemNumber(1,"rango")

IF li_rangperi = 1 THEN
	
	ls_operador = dw_filtro.GetItemString(1,"pa_operador_fecha")
	
	ldt_periodo = date(dw_filtro.GetItemDateTime(1,"pa_periodo"))

	ls_wheredate = "to_number(to_char(gi_brigada.f_actual,'yyyymmdd')) " + ls_operador +" "+ string(ldt_periodo,'yyyymmdd')
	
ELSE
	
	ldt_rango = date(dw_filtro.GetItemDatetime(1,"pa_rango"))
	
	ldt_periodo = date(dw_filtro.GetItemDateTime(1,"pa_periodo"))
	
	ls_wheredate = "to_number(to_char(gi_brigada.f_actual,'yyyymmdd')) between " + string(ldt_rango,'yyyymmdd') +" AND " + string(ldt_periodo,'yyyymmdd')+""
		
END IF
////////////////////////////////////////////////////RANGO O PERIODO//////////////////////////////


///////////////////////////////////FILTROS/////////////////////////////////////////////////////////

//dw_filtro.AcceptText()
//li_estado = dw_filtro.GetItemNumber(1,"ai_estado")
//li_tipo = dw_filtro.GetItemNumber(1,"ai_tipo")
//ld_fecha = dw_filtro.GetItemDateTime(1,"pa_periodo")
//ls_operador_fecha = dw_filtro.GetItemString(1,"pa_operador_fecha")
//ld_fecha_desde=dw_filtro.GetItemDateTime(1,"pa_rango")
//IF isnull(ld_fecha_desde) THEN
//	ld_fecha_desde = Datetime(Date("01/01/1900"), Time(""))
//END IF
//ls_retorno = " "
//li_rango=dw_filtro.GetItemNumber(1,"rango")
//
//IF li_tipo <> 0 THEN
//	ls_retorno = " and gi_brigada.tip_brigada = " + string(li_tipo)
//END IF
//
//IF li_estado <> 99 THEN
//	ls_retorno = ls_retorno + " and gi_brigada.ind_disponible = " + string(li_estado)
//END IF
//
////IF li_turno <> 0 THEN
////	ls_retorno = ls_retorno + " and gi_brigada.turno = " + string(li_estado)
////END IF
//
//ls_mes = string(Month(Date(ld_fecha)))
//
//IF LEN(ls_mes) = 1 THEN
//	ls_mes = "0" + ls_mes
//END IF
//
//ls_fecha_select = string(Year(Date(ld_fecha))) 
//ls_fecha_select = ls_fecha_select + ls_mes
//ls_fecha_select = ls_fecha_select + string(Day(Date(ld_fecha))) 
//
//
//ls_fecha_select = " to_date( '" + ls_fecha_select  +"' ,'YYYYMMDD')" 
//
//if li_rango=1 then
//ls_retorno = ls_retorno + " and to_date( to_char(gi_brigada.f_actual ,'YYYYMMDD'),'YYYYMMDD')" + ls_operador_fecha + &
//	ls_fecha_select
//end if
//
//if li_rango=0 then
//	ls_mes = string(Month(Date(ld_fecha_desde)))
//	IF LEN(ls_mes) = 1 THEN
//		ls_mes = "0" + ls_mes
//	END IF
//
//	ls_fecha_rango = string(Year(Date(ld_fecha_desde))) 
//	ls_fecha_rango = ls_fecha_rango + ls_mes
//	ls_fecha_rango = ls_fecha_rango + string(Day(Date(ld_fecha_desde))) 
//	ls_fecha_rango = " to_date( '" + ls_fecha_rango  +"' ,'YYYYMMDD')" 
//	ls_retorno = ls_retorno + " and to_date(to_char( gi_brigada.f_actual ,'YYYYMMDD'),'YYYYMMDD') BETWEEN " + ls_fecha_rango + "AND " + &
//	ls_fecha_select
//end if
//
//
//
//
//dw_filtro.AcceptText()
//li_tip_incid = dw_filtro.GetItemNumber(1,"tip_incidencia")
//li_tipo_tension = dw_filtro.GetItemNumber(1,"tip_tension")
//ls_mat_averiado = dw_filtro.GetItemString(1,"mat_averiado")
//li_cod_causa = dw_filtro.GetItemNumber(1,"cod_causa")
//li_fam_causa = dw_filtro.GetItemNumber(1,"fam_causa")
//li_agente = dw_filtro.GetItemNumber(1,"agente")
//ll_nro_instalacion = dw_filtro.GetItemNumber(1,'nro_instalacion')
//
//
//IF li_tip_incid > 0 THEN 	
//	ls_filtro += is_tabla_principal +".tip_incidencia = "+ string(li_tip_incid)+" AND "
//END IF
//
//IF ll_nro_instalacion > 0 THEN
//	ls_filtro += is_tabla_principal + ".nro_inst_afectada = "+ string(ll_nro_instalacion) + " AND "
//ELSE
//	IF li_tipo_tension >  0 THEN	
//		ls_filtro += is_tabla_principal +".tip_tension ="+ string(li_tipo_tension)  +" AND "
//	END IF
//END IF
//
//IF ls_mat_averiado >  '0101010000' And ls_mat_averiado <> '010101000001' THEN	//<---CAMBIO SUR14 *JHE 05/02/2001*
//	ls_filtro += is_tabla_principal + ".mat_averiado = '"+ ls_mat_averiado +"' AND "
//END IF
////CAMBIO DOM II *JHE 01/02/2001*
//IF li_cod_causa > 0 THEN	
//	ls_filtro += is_tabla_principal + ".cod_causa = "+ string(li_cod_causa)  +" AND " 
//END IF
//IF li_fam_causa > 0 THEN	
//	ls_filtro += is_tabla_principal +".fam_causa = "+ string(li_fam_causa)  +" AND "
//END IF
////CAMBIO DOM II *JHE 01/02/2001*
//
//IF li_tipo_intal > 0 THEN
////CAMBIO DOM SUR13 *JHE 14/02/2001*
////	ls_filtro += "sgd_instalacion.tipo_instalacion = "+ string(li_tipo_intal)  +" AND "
//	ls_filtro += "sgd_instalacion.nro_instalacion = sgd_incidencia.nro_inst_afectada AND " +&
//	"sgd_instalacion.bdi_job = 0 AND sgd_instalacion.tipo_instalacion = "+ string(li_tipo_intal)  +" AND "
////CAMBIO DOM SUR13 *JHE 14/02/2001*
//	li_filtro1 = 1
//END IF
//
//IF li_agente > 0 THEN	
//	ls_filtro += is_tabla_principal +".agente = "+ string(li_agente)  +" AND "
//END IF
//
//IF li_relevante > 0 THEN
//	ls_filtro += " ( sgd_incidencia.pot_afectada > gi_par_relevantes_bdg.pot_afectada_min ) and  " +&
//       			 " ( sgd_incidencia.ccli_afec > gi_par_relevantes_bdg.num_cli_afe_min ) and  " +&
//        			 " ( sgd_incidencia.duracion_rs > gi_par_relevantes_bdg.duracion_rs_min ) and "
//
//	li_filtro2 = 2
//END IF
//
//ls_filtro = left(ls_filtro,len(ls_filtro) - 4)
//
//IF	li_filtro1 = 1 THEN ls_from[UpperBound(ls_from) + 1] = "sgd_instalacion"
//IF	li_filtro2 = 2 THEN 	ls_from[UpperBound(ls_from) + 1] = "gi_par_relevantes_bdg"
///////////////////////////////////FILTROS/////////////////////////////////////////////////////////

///////////////////////////////////FROM/////////////////////////////////////////////////////////

f_verifica_from(ls_from,UpperBound(ls_from))

ls_cadenafrom = ' From '

FOR li_i = 1 To UpperBound(is_newfrom)

	ls_cadenafrom += is_newfrom[li_i] + ", "
	
NEXT

///////////////////////////////////FROM/////////////////////////////////////////////////////////

ls_cadenafrom = left(ls_cadenafrom,len(ls_cadenafrom) - 2)


IF li_existe > 0 AND is_order_by <> "" AND ls_filtro <> "" THEN
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + " AND " + &
					ls_filtro + " " + ls_groupby + " " /*+ls_orderby*/
		
ELSEIF li_existe > 0 AND ls_filtro <> "" THEN
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
					ls_filtro +" " /*+ ls_groupby*/

ELSEIF li_existe > 0 THEN

	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" "+ls_groupby


ELSEIF	li_existe <= 0 AND is_order_by <> "" AND ls_filtro <> "" AND li_agrupar = 0 THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + " AND " +&
						" " + ls_filtro + " " /*+ ls_orderby*/
ELSEIF li_existe <= 0 AND ls_filtro <> "" AND li_agrupar = 0 THEN

		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND "+ &
						ls_filtro
//NUEVO DOM SUR13 *JHE 15/02/2001*
ELSEIF li_agrupar > 0 AND ls_filtro <> "" AND is_order_by <> "" THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
						ls_filtro +" " + ls_groupby + " " /*+ ls_orderby*/
						
ELSEIF li_agrupar > 0 AND ls_filtro <> "" THEN
		
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate +" AND " + &
						ls_filtro +" " + ls_groupby
						
ELSEIF li_agrupar > 0 AND is_order_by <> "" THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " + ls_groupby + " " /*+ ls_orderby*/

ELSEIF li_agrupar > 0 THEN
	
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " + ls_groupby
//NUEVO DOM SUR13 *JHE 15/02/2001*						
ELSEIF li_existe <= 0 AND is_order_by <> "" THEN
		ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate + &
						" " /*+ ls_orderby*/
//		messagebox("6",ls_select)	
ELSE
	
	ls_select = ls_select + ls_cadenafrom + ls_groupjoin +  ls_join2 + " AND " + ls_wheredate
//		messagebox("7",ls_select)	
		
END IF
is_preferencia = f_preparo_archivo()
this.str_print_new.PARM1 = false					
f_modificar_dw(ls_select)

//Clipboard(ls_select)
end subroutine

on w_reportes_new.create
if this.MenuName = "m_reportes" then this.MenuID = create m_reportes
this.st_causa=create st_causa
this.dw_lista_corte=create dw_lista_corte
this.dw_lista_agrupar=create dw_lista_agrupar
this.dw_1=create dw_1
this.dw_ambito=create dw_ambito
this.st_2=create st_2
this.mle_titulo=create mle_titulo
this.st_1=create st_1
this.st_corte_por=create st_corte_por
this.st_agrupor=create st_agrupor
this.st_ordpor=create st_ordpor
this.st_obj_inf=create st_obj_inf
this.st_funcion=create st_funcion
this.dw_funcion=create dw_funcion
this.dw_lista_reporte=create dw_lista_reporte
this.dw_lista_orden=create dw_lista_orden
this.mle_subtitulo=create mle_subtitulo
this.st_material=create st_material
this.dw_filtro=create dw_filtro
this.st_instalacion=create st_instalacion
this.Control[]={this.st_causa,&
this.dw_lista_corte,&
this.dw_lista_agrupar,&
this.dw_1,&
this.dw_ambito,&
this.st_2,&
this.mle_titulo,&
this.st_1,&
this.st_corte_por,&
this.st_agrupor,&
this.st_ordpor,&
this.st_obj_inf,&
this.st_funcion,&
this.dw_funcion,&
this.dw_lista_reporte,&
this.dw_lista_orden,&
this.mle_subtitulo,&
this.st_material,&
this.dw_filtro,&
this.st_instalacion}
end on

on w_reportes_new.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_causa)
destroy(this.dw_lista_corte)
destroy(this.dw_lista_agrupar)
destroy(this.dw_1)
destroy(this.dw_ambito)
destroy(this.st_2)
destroy(this.mle_titulo)
destroy(this.st_1)
destroy(this.st_corte_por)
destroy(this.st_agrupor)
destroy(this.st_ordpor)
destroy(this.st_obj_inf)
destroy(this.st_funcion)
destroy(this.dw_funcion)
destroy(this.dw_lista_reporte)
destroy(this.dw_lista_orden)
destroy(this.mle_subtitulo)
destroy(this.st_material)
destroy(this.dw_filtro)
destroy(this.st_instalacion)
end on

event open;//this.width=3645
//this.Height=2400
this.x=1
this.y=1
iu_comunic=Create u_generico_comunicaciones
dw_filtro.SetTransObject(SQLCA)
dw_ambito.SettransObject(SQLCA)


is_tabla_principal = Message.StringParm
// Cargo la estructura local de comunicaciones
iu_comunic.is_comunic = gu_comunic.is_comunic

//***************************************
//**  OSGI 2001.1  	27/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_gpo_causa = fg_verifica_parametro("CAUSAS")
//***************************************
//**  OSGI 2001.1  	27/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


triggerevent("ue_setear_datos")

dw_funcion.fnu_insertar_datos()

//dw_filtro.InsertRow(0)
//dw_filtro.fpr_crea_dddw()
//
//dw_filtro.setitem(1,"tip_incidencia",0)
//dw_filtro.setitem(1,"tip_tension",0)
//dw_filtro.setitem(1,"mat_averiado","010101")
//dw_filtro.setitem(1,"cod_hor",0)
//dw_filtro.setitem(1,"cod_causa",0)
//dw_filtro.setItem(1,"fam_causa",0)
//dw_filtro.setitem(1,"tipo_instalacion",0)
//dw_filtro.SetItem(1,"agente",0)
//dw_filtro.SetITem(1,"est_actual",0)
//dw_filtro.SetItem(1,"pa_incid_relevante",2)
//
//dw_filtro.setitem(1,"pa_periodo",fgnu_fecha_actual())
//dw_filtro.setitem(1,"pa_operador_fecha","=")
//dw_filtro.setitem(1,"rango",1)
//dw_filtro.setitem(1,"pa_rango",fgnu_fecha_actual())
//
//dw_ambito.InsertRow(0)
//
//
//// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
//dw_ambito.reset()
//dw_ambito.f_insertar_fila()
//
////Conecto las DDDW del objeto "ambito"
//// filtro todos sus campos y seteo a los mismos con todos
//
//dw_ambito.fpr_crea_dddw()
//dw_ambito.fnu_filtro_centro()
//dw_ambito.setitem(1,"nro_centro",0)
//dw_ambito.fpr_filtro_cmd()
//dw_ambito.setitem(1,"nro_cmd",0)
//dw_ambito.fpr_filtro_mesa()
//dw_ambito.setitem(1,"nro_mesa",0)
//
////dw_ambito.fnu_deshab_cmd(dw_ambito)
//dw_ambito.fnu_deshab_puesto(dw_ambito)
//dw_ambito.setcolumn("nro_centro")




//dw_lista_reporte.dataobject="d_lista_reporte_new"
//dw_lista_reporte.fpr_lista_incidencia()
//





end event

event close;close(this)
end event

type st_causa from statictext within w_reportes_new
integer x = 1957
integer y = 1508
integer width = 590
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
long backcolor = 79741120
string text = "Causa Incidencia"
boolean focusrectangle = false
end type

event doubleclicked;int li_tip_incid
setpointer(HourGlass!)

//***************************************
//**  OSGI 2001.1  	16/08/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	16/05/2001  open(w_2301_sel_causa)
dw_filtro.Accepttext()
li_tip_incid = dw_filtro.object.tip_incidencia[1]
If fg_verifica_parametro('CAUSAS') Then
	OpenWithParm(w_2301_sel_causa_x_tipo, li_tip_incid)
Else
	// GNU 13-1-2003. Mejora 1/342078
	gu_comunic2.is_comunic.programa_llamante="w_reportes"
	Open(w_2301_sel_causa)
End If
//***************************************
//**  OSGI 2001.1  	16/08/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

if gu_comunic2.is_comunic.longval4 > 0 then
	dw_filtro.setitem(1,"ps_nom_causa",gu_comunic2.is_comunic.strval9)
	dw_filtro.setitem(1,"cod_causa",gu_comunic2.is_comunic.longval4)
	yield()
end if
end event

type dw_lista_corte from datawindow within w_reportes_new
integer x = 2039
integer y = 912
integer width = 1504
integer height = 112
integer taborder = 20
string dragicon = "Row.ico"
string dataobject = "d_lista_agrupar"
borderstyle borderstyle = stylelowered!
end type

event dragdrop;DragObject	ldo_control
int			li_row, &
				li_emp_id, li_i, li_contador
string ls_funcion, ls_aplicable

// Get the dragged object.
ldo_control = DraggedObject()

For li_i = 1 To dw_lista_reporte.RowCount()
	IF dw_lista_reporte.IsSelected(li_i) THEN
		li_contador ++
	END IF
NEXT

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_lista_reporte then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_lista_reporte.GetRow()
	
	if li_row > 0  and li_row < dw_lista_reporte.RowCount() then			
		if dw_lista_agrupar.rowCount() <= 0 Then
			messagebox("Aviso","Primero debe Agrupar Por, para luego realizar el Corte Por",exclamation!)
		else
			if dw_lista_agrupar.GetItemString(1,"nombre") = dw_lista_reporte.GetITemString(li_row,"nombre") Then
				Messagebox("Aviso","No se puede selecionar el campo que se encuentra en Agrupar Por.",exclamation!)
			elseif this.rowcount() > 0 then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ya existe un campo en Corte Por.",exclamation!)
			elseif li_contador = 2 THEN
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar por lo menos otro campo para realizar la consulta",exclamation!)
			else			
				if dw_lista_reporte.isselected(li_row) then
					this.InsertRow(0)
					this.setitem(this.rowcount(),"nombre",dw_lista_reporte.getitemstring(li_row,"nombre"))
					this.setitem(this.rowcount(),"campo",dw_lista_reporte.getitemstring(li_row,"campo"))
					this.setitem(this.rowcount(),"tabla",dw_lista_reporte.getitemstring(li_row,"tabla"))
					f_ordenar_indice(li_row,2)			
				else
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El campo por el que intenta agrupar no est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",exclamation!)
				end if
			end if
		end if
	end if
end if
end event

event clicked;dw_lista_corte.drag(begin!)
end event

type dw_lista_agrupar from datawindow within w_reportes_new
integer x = 2048
integer y = 692
integer width = 1499
integer height = 116
integer taborder = 40
string dragicon = "Row.ico"
string dataobject = "d_lista_agrupar"
borderstyle borderstyle = stylelowered!
end type

event dragdrop;DragObject	ldo_control
int			li_row, &
				li_emp_id, &
				li_filas
string ls_funcion, ls_aplicable, ls_tabla

// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_lista_reporte then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_lista_reporte.GetRow()
	
	if li_row > 0  and li_row < dw_lista_reporte.RowCount() then			
			If this.rowcount() > 0 then
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Ya existe un campo para Agrupar Por.",exclamation!)
//			elseif dw_lista_reporte.Find("funcion <> ''",1,dw_lista_reporte.rowcount()) > 0 then
			elseif dw_lista_reporte.isselected(li_row) then
					this.InsertRow(0)
					this.setitem(this.rowcount(),"nombre",dw_lista_reporte.getitemstring(li_row,"nombre"))
					this.setitem(this.rowcount(),"campo",dw_lista_reporte.getitemstring(li_row,"campo"))
					ls_tabla = dw_lista_reporte.getitemstring(li_row,"sinonimo")
					IF len(ls_tabla)=0 THEN
						ls_tabla = dw_lista_reporte.getitemstring(li_row,"tabla")
					END IF
					this.setitem(this.rowcount(),"tabla",ls_tabla)
					
					dw_lista_orden.Reset()
					
					dw_lista_orden.InsertRow(0)
					dw_lista_orden.setitem(dw_lista_orden.rowcount(),"tipo",1)
					dw_lista_orden.setitem(dw_lista_orden.rowcount(),"nombre",dw_lista_agrupar.getitemstring(1,"nombre"))
					dw_lista_orden.setitem(dw_lista_orden.rowcount(),"campo",dw_lista_agrupar.getitemstring(1,"campo"))
					dw_lista_orden.setitem(dw_lista_orden.rowcount(),"tabla",dw_lista_agrupar.getitemstring(1,"tabla"))
					
					
					f_ordenar_indice(li_row,1)
					
					
			else
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El campo por el que intenta agrupar no est$$HEX2$$e1002000$$ENDHEX$$seleccionado.",exclamation!)
			end if
//			else
//					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe aplicar una funci$$HEX1$$f300$$ENDHEX$$n a un campo para poder agrupar.",exclamation!)
//			end if
	end if
end if
end event

event clicked;dw_lista_agrupar.drag(begin!)
end event

type dw_1 from datawindow within w_reportes_new
integer x = 3598
integer y = 192
integer width = 942
integer height = 1348
integer taborder = 30
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event sqlpreview;String ls_sqlsyntax


ls_sqlsyntax = sqlsyntax

//fg_replace_text(ls_sqlsyntax, "sgd_incidencia", "gi_hist_incidencias")
//
//sqlsyntax += ' Union ' + ls_sqlsyntax + ' ' + is_order_by
sqlsyntax += ' ' + is_order_by
//MessageBox(is_order_by, sqlsyntax)
This.SetSqlPreview(sqlsyntax)
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_reportes_new
integer x = 174
integer y = 1408
integer taborder = 70
boolean border = false
end type

type st_2 from statictext within w_reportes_new
integer x = 1751
integer y = 1040
integer width = 411
integer height = 104
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Subtitulo : "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type mle_titulo from multilineedit within w_reportes_new
integer x = 302
integer y = 1040
integer width = 1431
integer height = 104
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_reportes_new
integer x = 27
integer y = 1040
integer width = 270
integer height = 104
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Titulo : "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_corte_por from statictext within w_reportes_new
integer x = 2039
integer y = 816
integer width = 1509
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Corte Por:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_agrupor from statictext within w_reportes_new
integer x = 2039
integer y = 600
integer width = 1509
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Agrupar Por:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_ordpor from statictext within w_reportes_new
integer x = 2039
integer y = 32
integer width = 1509
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Ordenar Por:"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_obj_inf from statictext within w_reportes_new
integer x = 530
integer y = 32
integer width = 1504
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Objeto de Informes"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_funcion from statictext within w_reportes_new
integer x = 37
integer y = 32
integer width = 494
integer height = 88
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 67108864
boolean enabled = false
string text = "Funci$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_funcion from u_pr_funcion within w_reportes_new
integer x = 37
integer y = 124
integer width = 494
integer height = 900
integer taborder = 100
string dragicon = "Row.ico"
borderstyle borderstyle = stylelowered!
end type

event clicked;call super::clicked;	dw_funcion.drag(begin!)
end event

event dragdrop;call super::dragdrop;DragObject	ldo_control
int			li_row, &
				li_emp_id
string ls_funcion, ls_aplicable, ls_nulo


// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_lista_reporte then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_lista_reporte.GetRow()
	if row > 0 then
		
		if dw_lista_reporte.getitemstring(li_row,"parentesis") = ")" then
		
						if dw_lista_reporte.isselected(li_row) then
							dw_lista_reporte.setitem(li_row,"funcion","")
							dw_lista_reporte.setitem(li_row,"parentesis","")
							dw_lista_reporte.Accepttext()
						end if
		end if
	end if
end if
end event

type dw_lista_reporte from u_lista_reporte within w_reportes_new
integer x = 530
integer y = 124
integer width = 1504
integer height = 900
integer taborder = 90
string dragicon = "Row.ico"
string dataobject = "d_lista_reporte_new"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dragdrop;call super::dragdrop;DragObject	ldo_control
int			li_row, &
				li_emp_id, li_find, li_nulo
string ls_funcion, ls_aplicable

SetNull(li_nulo)

// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_funcion then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_funcion.GetRow()
	if row > 0 then
		if this.getitemstring(row,"Habilitado") = "H" then
			if dw_lista_agrupar.rowcount() > 0 then
				ls_aplicable = dw_funcion.getitemstring(li_row,"aplica_a")
					if (ls_aplicable = "T") or (ls_aplicable = dw_lista_reporte.getitemstring(row,"tipo")) then
						
						ls_funcion = dw_funcion.GetItemString(li_row,"funcion") + "("
						
						if this.isselected(row) then
							this.setitem(row,"funcion",ls_funcion)
							this.setitem(row,"parentesis",")")
						end if
					end if
			else		
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe agrupar por un campo antes de aplicar una funci$$HEX1$$f300$$ENDHEX$$n")
				dw_lista_reporte.Setitem(row,"habilitado","")
			end if
				
		elseif this.IsSelected(row) and this.getitemstring(row,"Habilitado") <> "H"then
				gnv_msg.f_mensaje("AP06","","",ok!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Sobre este campo no se puede aplicar una funci$$HEX1$$f300$$ENDHEX$$n",exclamation!,OK!)
		elseif Not this.IsSelected(row) and dw_lista_orden.rowcount() = 0 Then
			
			Messagebox("Aviso","Debe seleccionar un campo para aplicar una funci$$HEX1$$f300$$ENDHEX$$n",Information!)
			
		end if
	end if
elseif ldo_control = dw_lista_orden then
	If dw_lista_orden.RowCount() > 0 then 
		dw_lista_orden.Deleterow(dw_lista_orden.GetRow())
		If dw_lista_agrupar.rowCount() > 0 then dw_lista_agrupar.Deleterow(dw_lista_agrupar.GetRow())
//		if dw_lista_corte.Rowcount() > 0 then	dw_lista_corte.Deleterow(dw_lista_corte.GetRow())
	end if
elseif ldo_control = dw_lista_agrupar then
	If dw_lista_agrupar.rowCount() > 0 then 
		dw_lista_agrupar.Deleterow(dw_lista_agrupar.GetRow())
		dw_lista_orden.Deleterow(dw_lista_orden.GetRow())
		if dw_lista_corte.Rowcount() > 0 then	dw_lista_corte.Deleterow(dw_lista_corte.GetRow())
		
		IF this.IsSelected(this.Rowcount()) THEN 
				this.selectrow(this.Rowcount(),false)
				
			f_reordena_indice(this.GetITemNumber(this.RowCount(),"indice"),this.Rowcount())
			this.SetItem(this.Rowcount(),"indice",li_nulo)
		END IF
		
		
		li_find = this.Find("funcion <> ''",1,this.RowCount()) 
		
		if li_find > 0 and this.isselected(li_find) then
			this.setitem(li_find,"funcion","")
			this.setitem(li_find,"parentesis","")
			this.Setitem(li_find,"habilitado","")
		end if
	End If
elseif ldo_control = dw_lista_corte then
	If dw_lista_corte.rowCount() > 0 then dw_lista_corte.Deleterow(dw_lista_corte.GetRow())
end if

dw_lista_orden.Drag(end!)
dw_funcion.Drag(end!)
TriggerEvent(dragleave!)
end event

event doubleclicked;call super::doubleclicked;string ls_nombre
long ll_row_orden, ll_find, ll_indice
integer li_filas, li_nulo, li_find

SetNull(li_nulo)
li_filas = this.rowcount()

If row <= 0 then return

IF this.IsSelected(row) THEN
	
	ll_indice = this.GetItemNumber(row,"indice")
	this.SetItem(row,"indice",li_nulo)

	this.selectrow(row,false)
	
	f_reordena_indice(ll_indice,li_filas)
	
	IF dw_lista_orden.RowCount() > 0 THEN
		ls_nombre = this.GetItemString(row,"nombre")
		ll_row_orden = dw_lista_orden.Find("nombre ='"+ls_nombre+"'",1,dw_lista_orden.RowCount())
		IF	 ll_row_orden >= 1 THEN
			 dw_lista_orden.DeleteRow(ll_row_orden)
		END IF
	END IF

	IF dw_lista_agrupar.RowCount() > 0 THEN
		IF dw_lista_agrupar.GetItemString(1,"nombre") = this.GetItemString(row,"nombre") THEN
			dw_lista_agrupar.DeleteRow(1)
			
			li_find = this.Find("funcion <> ''",1,this.RowCount()) 
			
			if li_find > 0 AND this.isselected(li_find) then
				this.setitem(li_find,"funcion","")
				this.setitem(li_find,"parentesis","")
				this.Setitem(li_find,"habilitado","")
			end if
			
			
			IF dw_lista_corte.RowCount() > 0 THEN	dw_lista_corte.DeleteRow(1)
			IF this.IsSelected(this.Rowcount()) THEN 
				this.selectrow(this.Rowcount(),false)
				
				f_reordena_indice(this.GetITemNumber(this.RowCount(),"indice"),li_filas)
				this.SetItem(this.Rowcount(),"indice",li_nulo)
			END IF
		END IF
	END IF
	
	IF dw_lista_corte.RowCount() > 0 THEN
		IF dw_lista_corte.GetItemString(1,"nombre") = this.GetItemString(row,"nombre") THEN
			dw_lista_corte.DeleteRow(1)
			IF this.IsSelected(this.Rowcount()) THEN 
				
				this.selectrow(this.Rowcount(),false)				
				f_reordena_indice(this.GetITemNumber(this.RowCount(),"indice"),li_filas)
				this.SetItem(this.Rowcount(),"indice",li_nulo)
				
			END IF
		END IF
	END IF
	
	
		
	
	this.SetItem(row,"funcion","")
	
	this.SetItem(row,"parentesis","")
	
	this.SetITem(row,"habilitado","")
	
	
//	DO
//		ll_indice += 1
//		
//		ll_find = this.Find("indice = "+ string(ll_indice) +"",1,li_filas)
//		
//		IF ll_find > 0 THEN	
//			
//			ll_indice -= 1		
//			this.SetItem(ll_find,"indice",ll_indice)
//			ll_indice += 1
//		END IF
//	LOOP UNTIL ll_find = 0 or Isnull(ll_find)
	
	
	
	
ELSE
	IF this.GetItemString(row,"nombre") = "Cantidad" THEN
		
		//PM0010 SGI SUR235 JHC 07/03/2001
		//\\//
		// \/
//		IF dw_lista_agrupar.RowCount() <= 0 /*OR dw_lista_reporte.Find("funcion <> ''",1,li_filas) <= 0*/ THEN //SUR 13 JHE 15/02/2001
		IF this.RowCount() <= 1 /*OR dw_lista_reporte.Find("funcion <> ''",1,li_filas) <= 0*/ THEN //SUR 13 JHE 15/02/2001
//			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El campo CANTIDAD no se puede seleccionar si no existe un campo"+"~n" +&
//										" en agrupar por o si no ha aplicado una funci$$HEX1$$f300$$ENDHEX$$n a un campo")
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El campo CANTIDAD no se puede seleccionar si no hay otro campo seleccionado")

			return
		END IF
		// /\
		////\\
		//PM0010 SGI SUR235 JHC 07/03/2001
	END IF
	this.selectrow(row,true)
	
	ll_find = this.Find("not IsNull(indice)",1,li_filas)

	If ll_find = 0 AND this.GetItemString(row,"nombre") <> "Cantidad de Datos" Then
		this.SetItem(row,"indice",1)
		m_reportes.m_rep.m_mostrar.enabled=true
	else
		
		ll_find = this.Find("indice > 0 ",1,li_filas)

		IF this.GetItemString(row,"nombre") <> "Cantidad de Datos" THEN	
			DO
				ll_indice = this.GetItemNumber(ll_find,"indice")
				
				ll_find = this.Find("indice > "+ string(ll_indice) +"",1,li_filas)
				
				IF ll_find = 0 Or IsNull(ll_find) THEN
					ll_indice += 1
					this.SetItem(row,"indice",ll_indice)
				END IF
				
			LOOP UNTIL ll_find = 0 or Isnull(ll_find)
		END IF
		
//		ll_indice = this.GetItemNumber(ll_find,"indice")
//		ll_indice += 1
//		this.SetItem(row,"indice",ll_indice)
	end if
END IF

IF GetSelectedRow(0) = 0 THEN
	m_reportes.m_reporte.m_guardar.enabled=false    // LFE
	m_reportes.m_reporte.m_guardar.m_preferencia1.enabled=false
	m_reportes.m_rep.m_mostrar.enabled = false
ELSE
	m_reportes.m_reporte.m_guardar.enabled=True    // LFE
	m_reportes.m_reporte.m_guardar.m_preferencia1.enabled=True
	m_reportes.m_rep.m_mostrar.enabled = true	
END IF	
end event

event clicked;call super::clicked;this.drag(begin!)
end event

event dragenter;call super::dragenter;DragObject	ldo_control
int			li_row, &
				li_emp_id, li_find
string ls_tipo, ls_funciones, ls_aplicable


ldo_control = DraggedObject()

if ldo_control = dw_funcion then
	li_row = dw_funcion.getRow()
	
	ls_tipo = this.GetItemString(this.GetRow(),"tipo")
	ls_funciones = dw_funcion.Getitemstring(li_row,"funcion")
	
//		if Not this.IsSelected(this.Getrow()) and dw_lista_orden.rowcount() = 0 Then
//			
//			Messagebox("Aviso","Debe Seleccionar un campo para aplicar una funci$$HEX1$$f300$$ENDHEX$$n",Information!)
//			
//		else
//		if  this.IsSelected(this.Getrow()) and dw_lista_orden.RowCount() > 0 and &
//				(dw_lista_agrupar.RowCount() > 0 or dw_lista_orden.Rowcount() > 0) then
//			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Solo se puede aplicar una funcion por consulta")
//			
//		else
		if this.IsSelected(this.Getrow()) and dw_lista_orden.RowCount() > 0 and &
			(dw_lista_agrupar.RowCount() <= 0 or dw_lista_orden.Rowcount() <= 0) then
			gnv_msg.f_mensaje("AP05","","",ok!)
			
		else			

			li_find = this.Find("funcion <> ''",1, this.RowCount())
			if li_find > 0 then messagebox("Aviso","Solo se puede aplicar una funcion por Consulta")
				
//		elseif ib_funcion=true or dw_lista_reporte.rowcount()>0 then
//			for li_count =1 to dw_lista_reporte.rowcount() 
//				dw_lista_reporte.Setitem(li_count,"habilitado","X")
//			next
//		END IF
		end if
end if

end event

event dragleave;call super::dragleave;int li_contador

FOR li_contador=1 TO dw_lista_reporte.RowCount()
	dw_lista_reporte.Setitem(li_contador,"habilitado","")
NEXT

//dw_lista_reporte.Setitem(this.Getrow(),"habilitado","")
end event

event dragwithin;call super::dragwithin;DragObject	ldo_control
int			li_row, &
				li_emp_id
string ls_tipo, ls_funciones, ls_aplicable, ls_campo


ldo_control = DraggedObject()



if ldo_control = dw_funcion then
	
	li_row = dw_funcion.getRow()
	
		if row = 0 and il_row > 0 then
			if IsNull(this.GetItemString(il_row,"funcion")) OR &
					this.GetItemString(il_row,"funcion") = "" Then dw_lista_reporte.Setitem(il_row,"habilitado","")
		elseif il_row > row then
			
			if IsNull(this.GetItemString(il_row,"funcion")) OR &
					this.GetItemString(il_row,"funcion") = "" Then dw_lista_reporte.Setitem(row + 1,"habilitado","")
		elseif il_row < row then
			
			if il_row = 0 then il_row = row
			
			if Isnull(this.GetItemString(il_row,"funcion")) OR &
					this.GetItemString(il_row,"funcion") = "" Then dw_lista_reporte.Setitem(row - 1,"habilitado","")
		end if
		
		il_row = row
				
		if this.IsSelected(row) then
						
			ls_tipo = this.GetItemString(row,"tipo")
			ls_funciones = dw_funcion.Getitemstring(li_row,"funcion")
			ls_campo = this.GetItemString(row,"campo") //SUR13 *JHE 15/02/2001*
			choose case ls_funciones
				case "SUM", "AVG"
					if ls_tipo = "D" or ls_tipo = "S" then	
						dw_lista_reporte.Setitem(row,"habilitado","X")
					else
						dw_lista_reporte.Setitem(row,"habilitado","H")
					end if	
					
					If ls_campo = "cantidad" THEN dw_lista_reporte.Setitem(row,"habilitado","X") //SUR13 *JHE 15/02/2001*
					
				case	"MIN", "MAX"
					if ls_tipo = "S" then	
						dw_lista_reporte.Setitem(row,"habilitado","X")
					else
						dw_lista_reporte.Setitem(row,"habilitado","H")
					end if
					
					If ls_campo = "cantidad" THEN dw_lista_reporte.Setitem(row,"habilitado","X") //SUR13 *JHE 15/02/2001*
					
			end choose
			
		end if
	
end if
end event

event rbuttondown;call super::rbuttondown;m_rep_emer lm_menu
lm_menu=create m_rep_emer


lm_menu.popmenu(PointerX()+480, PointerY()+480)
destroy lm_menu
end event

type dw_lista_orden from u_lista_orden within w_reportes_new
integer x = 2034
integer y = 124
integer width = 1509
integer height = 464
integer taborder = 10
string dragicon = "row.ico"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dragdrop;call super::dragdrop;DragObject	ldo_control
int			li_row, &
				li_emp_id
string ls_funcion, ls_aplicable, ls_tabla

// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_lista_reporte then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_lista_reporte.GetRow()
	if li_row > 0 and li_row <> dw_lista_reporte.RowCount() then
			
			If dw_lista_reporte.Find("funcion <> ''",1,dw_lista_reporte.rowcount()) > 0 then
				gnv_msg.f_mensaje("AP02","","",ok!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Si hay aplicada una funci$$HEX1$$f300$$ENDHEX$$n a alg$$HEX1$$fa00$$ENDHEX$$n campo, no se puede ordenar",exclamation!,Ok!)
			else
			
				if dw_lista_reporte.isselected(li_row) then
					this.InsertRow(0)
					this.setitem(this.rowcount(),"tipo",1)
					this.setitem(this.rowcount(),"nombre",dw_lista_reporte.getitemstring(li_row,"nombre"))
					this.setitem(this.rowcount(),"campo",dw_lista_reporte.getitemstring(li_row,"campo"))
					ls_tabla = dw_lista_reporte.getitemstring(li_row,"sinonimo")
					IF len(ls_tabla)=0 THEN
						ls_tabla = dw_lista_reporte.getitemstring(li_row,"tabla")
					END IF
					this.setitem(this.rowcount(),"tabla",ls_tabla)
				else
					gnv_msg.f_mensaje("AP03","","",ok!)
				//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El campo por el que intenta ordenar, no esta seleccionado.",exclamation!,Ok!)
				end if
			end if
	end if
end if
end event

event dragleave;call super::dragleave;//DragObject	ldo_control
//int			li_row, &
//				li_emp_id
//string ls_funcion, ls_aplicable
//
//// Get the dragged object.
//ldo_control = DraggedObject()
//
//// Determine if the dragged object is the employee datawindow
//if ldo_control = dw_lista_reporte then
////	dw_lista_orden.Setitem(1,"habil",0)
//	this.deleterow(1)
//end if
end event

event clicked;call super::clicked;dw_lista_orden.drag(begin!)
end event

event dragenter;call super::dragenter;DragObject	ldo_control
int			li_row, &
				li_emp_id, &
				li_filas
string ls_funcion, ls_aplicable

// Get the dragged object.
ldo_control = DraggedObject()

// Determine if the dragged object is the employee datawindow
if ldo_control = dw_lista_reporte then
	// Retrieve the employee detail information according to the selected 
	// row on the employee datawindow
	li_row = dw_lista_reporte.GetRow()
	if li_row > 0 then
		if dw_lista_orden.rowcount() >= 0 Then
					
//			if dw_lista_agrupar.rowcount() > 0 And dw_lista_corte.rowcount() > 0 then
//				if (dw_lista_agrupar.GetItemString(1,"nombre") <> dw_lista_reporte.GetItemString(li_row,"nombre")) and &
//						(dw_lista_corte.GetItemString(1,"nombre") <> dw_lista_reporte.GetItemString(li_row,"nombre")) Then
//						
//						Messagebox("Aviso","No se puede selecionar otro campo para ordenar " + "~n" +&
//												 "que sea diferente que agrupar o por corte",exclamation!)
//
//				end if
//			else
			if dw_lista_agrupar.rowcount() > 0 then
				if (dw_lista_agrupar.GetItemString(1,"nombre") <> dw_lista_reporte.GetItemString(li_row,"nombre")) Then
					Messagebox("Aviso","No se puede selecionar otro campo para ordenar " /*+ "~n"*/ +&
											 "que sea diferente que agrupar",exclamation!)
				end if
			end if 
			
			For li_filas = 1 to dw_lista_orden.rowcount() 
				If dw_lista_orden.GetItemString(li_filas,"nombre") = dw_lista_reporte.GetItemString(li_row,"nombre") Then
					Messagebox("Aviso","Ya existe este campo para ordenar")
					exit
				end if					
			Next		
			
		end if	
		
	end if
		
end if
end event

type mle_subtitulo from multilineedit within w_reportes_new
integer x = 2162
integer y = 1040
integer width = 1390
integer height = 104
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_material from statictext within w_reportes_new
integer x = 1957
integer y = 1664
integer width = 590
integer height = 72
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
long backcolor = 79741120
string text = "Material Averiado"
boolean focusrectangle = false
end type

event doubleclicked;string ls_codigo
string ls_descripcion

Open(w_2401_ayuda_materiales)
ls_codigo = gu_comunic.is_comunic.strval1
ls_descripcion = gu_comunic.is_comunic.strval2

IF Len(Trim(ls_codigo)) > 0 THEN
	dw_filtro.setitem(1,"mat_averiado",ls_codigo)
	dw_filtro.setitem(1,"ps_nom_mat_averiado", ls_descripcion)
end if
end event

type dw_filtro from u_gen_7001_pr_filtro_reporte_inc_new within w_reportes_new
event ue_postitemchanged ( )
integer x = 14
integer y = 1136
integer width = 3547
integer height = 716
integer taborder = 60
boolean border = false
end type

event ue_postitemchanged;
//If ib_gpo_causa Then
//	If This.GetColumnName() = "tip_incidencia" Then
//		fw_fam_causa()
//	End If
//	
	
//	If This.GetColumnName() = "fam_causa" Then
//		fw_causa(This.GetItemNumber(1, "fam_causa"))
//	End If
//End If


end event

event itemchanged;call super::itemchanged;string ls_columna
int li_alcance
datetime ldt_periodo, ldt_rango
String ls_modtitulo
string ls_filtro
String ls_ismodif
int li_tension, li_tipo
DatawindowChild ldwch_alcance

ls_columna = is_columna

this.Accepttext()
is_columna=this.getcolumnname()
IF is_columna = 'ps_nom_mat_averiado' THEN
	this.setitem(1,'mat_averiado',data)
END IF

IF is_columna = 'ps_nom_causa' AND data = string(fgci_todos) THEN
	this.setitem(1,'cod_causa',fgci_todos)
END IF


//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	14/06/2001  If fg_usa_famcusa() = 0 THEN
//***************************************
//**  OSGI 2001.1  	14/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//This.PostEvent("ue_postitemchanged")

//String is_columna

this.accepttext()
IF ii_filas_seleccionadas > 0 THEN
	m_reportes.m_reporte.m_guardar.m_preferencia1.enabled=true
END IF

is_columna=this.getcolumnname()
// Si la columna es ai_tipo_aviso estamos en el informe de avisos
IF is_columna = "ai_tipo_aviso" and ls_columna =  "tip_incidencia" THEN
	// Se comprueba la clase de aviso seleccionado para habilitar o deshabilitar
	// la alimentaci$$HEX1$$f300$$ENDHEX$$n.
	// Si el aviso es normal o de calidad se habilita, ya que se podr$$HEX2$$e1002000$$ENDHEX$$escoger la 
	// alimentaci$$HEX1$$f300$$ENDHEX$$n de los avisos. Para el resto de los avisos se deshabilita (LFE)
	if data = string (fgci_clase_avi_normal) or data = string(fgci_clase_avi_calidad) then
		this.object.ai_alimentacion.protect=0
		this.object.ai_alimentacion.background.color=gs_blanco
  else
		this.setitem(1,'ai_alimentacion',0)
		this.object.ai_alimentacion.protect=1
		this.object.ai_alimentacion.background.color=gs_gris
  end if
// Si la columna es pa_tipo_icidencia estamos en el informe de incidencias
ELSEIF is_columna = "tip_incidencia" THEN
	dw_filtro.getchild('pa_alcance',ldwch_alcance)
	ldwch_alcance.Reset()
	ldwch_alcance.settransobject(sqlca)
	st_causa.visible = true
	st_material.visible = true
	parent.triggerevent("ue_deseleccionar_todo")
	ldwch_alcance.retrieve('IN_A')
	
	dw_lista_reporte.SetRedraw(false)
	dw_lista_reporte.SelectRow(0,false)
	dw_lista_reporte.Reset()
	dw_lista_reporte.fpr_lista_incidencia()
	dw_lista_reporte.SetRedraw(true)
	is_tabla_principal = 'sgd_incidencia'
	iu_comunic.is_comunic.accion_llamada = is_tabla_principal
	mle_titulo.text = "Informe de Incidencias"
	// Se comprueba el tipo de inicidencia seleccionado para filtrar el alcance.
	// Si la incidencia es imprevista 
	//	<Todos>, De suministro, Con Perdida, Sin Perdida ;
	//Si es de calidad entonces el alcance ser$$HEX2$$e1002000$$ENDHEX$$
	// <Todos>, De suministro, Instalaci$$HEX1$$f300$$ENDHEX$$n;
	// si la incidencia es programada el alcance ser$$HEX1$$e100$$ENDHEX$$
	// <Todos>, Con Interrupci$$HEX1$$f300$$ENDHEX$$n, Sin Interrupci$$HEX1$$f300$$ENDHEX$$n;
	// y si la incidencia es de calidad, no se podr$$HEX2$$e1002000$$ENDHEX$$escoger el alcance (LFE)
	IF data = String(fgci_incidencia_imprevista) THEN 
		ls_filtro ='codigo =' + string(fgci_todos) +' or codigo =' + string(fgci_incidencia_de_suministro) +' or codigo ='+ string(fgci_incidencia_con_interrupcion) + ' or codigo = '+string(fgci_incidencia_sin_interrupcion)
		IF gb_scada THEN
			ls_filtro = ls_filtro +  ' or codigo = '+string(fgci_incidencia_reenganche)
		END IF
		ldwch_alcance.SetFilter(ls_filtro)
	ELSEIF data = String(fgci_incidencia_calidad) THEN
		ls_filtro ='codigo =' + string(fgci_todos) + 'or codigo =' + string(fgci_incidencia_de_suministro) +' or codigo ='+ string(fgci_incidencia_de_instalacion)
		ldwch_alcance.SetFilter(ls_filtro)
	ELSEIF data = String(fgci_incidencia_programada) THEN
		ls_filtro ='codigo =' + string(fgci_todos) +' or codigo ='+ string(fgci_incidencia_con_interrupcion) + ' or codigo = '+string(fgci_incidencia_sin_interrupcion)
		ldwch_alcance.SetFilter(ls_filtro)
//	ELSEIF data = String(fgci_incidencia_scada) THEN
//		ls_filtro ='codigo =' + string(fgci_todos) +' or codigo ='+ string(fgci_incidencia_con_interrupcion) + ' or codigo = '+string(fgci_incidencia_sin_interrupcion)+ ' or codigo = '+string(fgci_incidencia_reenganche)
//		ldwch_alcance.SetFilter(ls_filtro)
	END IF
	
	ldwch_alcance.Filter()
	ldwch_alcance.SetSort("codigo A")
	ldwch_alcance.Sort()
	This.setitem(1,"pa_alcance",fgci_todos)
	IF data = String(fgci_todos) OR data = string(fgci_incidencia_obligada) OR &
		data = string(fgci_incidencia_alum_pub) THEN
		this.object.pa_alcance.protect=1
		this.object.pa_alcance.background.color=gs_gris
	ELSE
		this.object.pa_alcance.protect=0
		this.object.pa_alcance.background.color=gs_blanco
	END IF
	
//ELSEIF dwo.name = 'tip_tension' THEN
//	li_tension = this.GetItemNumber(1,'tip_tension')
//	
//	CHOOSE CASE li_tension
//		CASE fgci_alta_tension
//			ls_filtro = 'tipo_instalacion IN (1,2)'
//			li_tipo = fgci_tipo_subestacion_at
//		CASE fgci_media_tension
//			ls_filtro = 'tipo_instalacion IN (3,4,5)'				
//			li_tipo = fgci_tipo_subestacion
//		CASE fgci_baja_tension
//			ls_filtro = 'tipo_instalacion IN (6,7,8)'
//			li_tipo =  fgci_tipo_transformador
//	END CHOOSE
//	dw_filtro.GetChild("tip_tension",ddw_tipo_tension_t)
//	ddw_tipo_tension_t.SetTransObject(SQLCA)
//	ddw_tipo_tension_t.retrieve()
//	
//	ddw_tipo_tension_t.SetFilter(ls_filtro)
//	ddw_tipo_tension_t.Filter()
//	dw_filtro.setitem(1,"tip_tension",li_tipo)
	
END IF

IF dwo.name = 'pa_alcance' THEN
	
	li_alcance = ii_alcance
	ii_alcance = this.GetItemNumber(1,'pa_alcance')
	
	IF ii_alcance = fgci_incidencia_reenganche AND gb_scada and li_alcance <> fgci_incidencia_reenganche THEN
		dw_lista_reporte.SetRedraw(false)
		dw_lista_reporte.SelectRow(0,false)
		dw_lista_reporte.Reset()
		dw_lista_corte.Reset()
		dw_lista_orden.Reset()
		dw_lista_agrupar.Reset()
		st_causa.visible = false
		st_material.visible = false
		parent.triggerevent("ue_deseleccionar_todo")
		dw_lista_reporte.fpr_lista_reenganche()
		dw_lista_reporte.SetRedraw(true)
		is_tabla_principal='sgd_reenganches'
		iu_comunic.is_comunic.accion_llamada = is_tabla_principal
		mle_titulo.text = "Informe de Reenganches"
		this.setitem(1,'mat_averiado',0)
		this.setitem(1,'ps_nom_mat_averiado','<Todos>')
		this.setitem(1,'cod_causa',0)
		this.setitem(1,'ps_nom_causa','<Todos>')
		this.setitem(1,'agente',0)
//		this.setItem(1,'ps_nom_instalacion','<Todas>')
//		this.setItem(1,'nro_instalacion',fgci_todos)
		this.Object.ps_nom_mat_averiado.Protect=1
		this.Object.ps_nom_causa.Protect=1
		this.Object.agente.Protect=1
		this.Object.ps_nom_mat_averiado.Background.Color = gs_gris	
		this.Object.ps_nom_causa.Background.Color = gs_gris	
		this.Object.agente.Background.Color = gs_gris	
		parent.st_causa.visible = false
		parent.st_material.visible = false
	ELSEIF ii_alcance <> fgci_incidencia_reenganche and li_alcance = fgci_incidencia_reenganche THEN
		dw_lista_reporte.SetRedraw(false)
		dw_lista_reporte.SelectRow(0,false)
		dw_lista_reporte.Reset()
		dw_lista_corte.Reset()
		dw_lista_orden.Reset()
		dw_lista_agrupar.Reset()		
		st_causa.visible = true
		st_material.visible = true
		parent.triggerevent("ue_deseleccionar_todo")
		dw_lista_reporte.fpr_lista_incidencia()
		dw_lista_reporte.SetRedraw(true)
		is_tabla_principal = 'sgd_incidencia'
		iu_comunic.is_comunic.accion_llamada = is_tabla_principal
		mle_titulo.text = "Informe de Incidencias"
//		this.setItem(1,'ps_nom_instalacion','<Todas>')
//		this.setItem(1,'nro_instalacion',fgci_todos)
		this.Object.ps_nom_mat_averiado.Protect=0
		this.Object.ps_nom_causa.Protect=0
		this.Object.agente.Protect=0
		this.Object.ps_nom_mat_averiado.Background.Color = gs_blanco
		this.Object.ps_nom_causa.Background.Color = gs_blanco
		this.Object.agente.Background.Color = gs_blanco
		parent.st_causa.visible = true
		parent.st_material.visible = true
	END IF
	
END IF

IF is_columna = 'mat_averiado' THEN
	this.setitem(1,'mat_averiado',data)
END IF

IF is_columna = 'ps_nom_instalacion' THEN
	this.setItem(1,'nro_instalacion',long(data))
END IF

ldt_periodo = dw_filtro.object.pa_periodo[1]
ldt_rango	= dw_filtro.object.pa_rango[1]
IF is_columna ='pa_periodo' OR is_columna = 'pa_rango' THEN
	IF isDate(string(date(ldt_periodo))) AND isDate(string(date(ldt_rango)))  THEN
	ELSE
		dw_filtro.SetItem (1,'pa_periodo',today())
		dw_filtro.SetItem (1,'pa_rango',today())
		dw_filtro.AcceptText()
	END IF
END IF

IF is_columna = 'rango' THEN
	IF isDate(string(date(ldt_periodo))) AND isDate(string(date(ldt_rango)))  THEN
	ELSE
		dw_filtro.SetItem (1,'pa_periodo',today())
		dw_filtro.SetItem (1,'pa_rango',today())
		dw_filtro.AcceptText()
	END IF
END IF



end event

event doubleclicked;call super::doubleclicked;//string ls_codigo
//string ls_descripcion
//
//
//If dwo.Name = "mat_averiado_t" Then
//	Open(w_2401_ayuda_materiales)
//	ls_codigo = gu_comunic.is_comunic.strval1
//	ls_descripcion = gu_comunic.is_comunic.strval2
//	
//	IF Len(Trim(ls_codigo)) > 0 THEN
//		dw_filtro.setitem(1,"mat_averiado", ls_codigo)
//	//	dw_filtro.object.st_mat_averiado.text = ls_descripcion
//	end if
//	
//	dw_filtro.AcceptText()
//End If
end event

event editchanged;call super::editchanged;// En este evento se controla que el usuario no pueda teclear el signo negativo como
// primer caracter en el campo Cant Clientes, Clientes Imp, o Pot Contratada .  (LFE)

String ls_columna
ls_columna=this.getcolumnname()
IF ls_columna = "ai_clientes" OR ls_columna="ai_clientes_imp" OR ls_columna="pn_pot_inst" THEN
	If Left(this.gettext(),1) = "-"  then
		this.settext("")
	END IF
END IF


end event

event itemerror;call super::itemerror;ib_error = TRUE
string ls_periodo
ls_periodo= dwo.name
IF ls_periodo = "pa_periodo" THEN 
gnv_msg.f_mensaje('EP03',"","",OK!)
END IF
return 1

end event

type st_instalacion from statictext within w_reportes_new
integer x = 1957
integer y = 1588
integer width = 590
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
long backcolor = 79741120
string text = "Instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

event doubleclicked;string ls_nom_instalacion

dw_filtro.SetItem(1,'ps_nom_instalacion','<Todas>')
dw_filtro.SetItem(1,'nro_instalacion',fgci_todos)
gu_comunic.is_comunic.programa_llamante = 'w_reportes'
openWithParm(w_2120_identificacion_instalacion,gu_comunic.is_comunic.programa_llamante)


SELECT "SGD_INSTALACION"."NOM_INSTALACION"
INTO :ls_nom_instalacion	
FROM "SGD_INSTALACION" 
WHERE "NRO_INSTALACION" = :gu_comunic1.is_comunic.decval1 AND BDI_JOB=0;

IF SQLCA.SQLCODE = 0 THEN
	dw_filtro.SetItem(1,'ps_nom_instalacion',ls_nom_instalacion)
	dw_filtro.SetItem(1,'nro_instalacion',gu_comunic1.is_comunic.decval1)
END IF
end event


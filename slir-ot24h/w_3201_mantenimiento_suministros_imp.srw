HA$PBExportHeader$w_3201_mantenimiento_suministros_imp.srw
forward
global type w_3201_mantenimiento_suministros_imp from w_sgigenerica
end type
type cb_eliminar from u_cb within w_3201_mantenimiento_suministros_imp
end type
type cb_consultar from u_cb within w_3201_mantenimiento_suministros_imp
end type
type dw_mant_sum_imp from u_man_2035_pr_lista_sum_imp within w_3201_mantenimiento_suministros_imp
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_3201_mantenimiento_suministros_imp
end type
type cb_buscar from u_cb within w_3201_mantenimiento_suministros_imp
end type
type cb_agregar from u_cb within w_3201_mantenimiento_suministros_imp
end type
type dw_vigente from datawindow within w_3201_mantenimiento_suministros_imp
end type
type gb_1 from groupbox within w_3201_mantenimiento_suministros_imp
end type
type dw_1 from datawindow within w_3201_mantenimiento_suministros_imp
end type
type cb_imprimir from commandbutton within w_3201_mantenimiento_suministros_imp
end type
end forward

global type w_3201_mantenimiento_suministros_imp from w_sgigenerica
integer width = 3653
integer height = 2400
string title = "OPEN SGI - Suministros Importantes"
string icon = "sumimp.ico"
event ue_retrieve pbm_custom21
event ue_arch_modificar pbm_custom46
event ue_armar_sql pbm_custom73
cb_eliminar cb_eliminar
cb_consultar cb_consultar
dw_mant_sum_imp dw_mant_sum_imp
d_ambito d_ambito
cb_buscar cb_buscar
cb_agregar cb_agregar
dw_vigente dw_vigente
gb_1 gb_1
dw_1 dw_1
cb_imprimir cb_imprimir
end type
global w_3201_mantenimiento_suministros_imp w_3201_mantenimiento_suministros_imp

type variables
u_generico_comunicaciones lu_comunic // Variable local de trabajo de comunicacion

//u_avi_2030_nu_filtro_aviso iu_avi_2030_nu
u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu 

//u_man_2036_nu_sum_imp   iu_man_2036_nu
u_man_2036_rn_sum_imp       iu_man_2036_rn

s_direccion_cliente		is_direccion

string	is_prov, is_depto, is_munic, is_local
long il_provincia, il_departamento, il_municipio, il_localidad

int ii_fila_ant
// string is_clausula_where
// string is_modificacion
// string is_select_original
string Is_Select_original = " "
string Is_Clausula_Where = " "
string Is_modificacion = " "
string Is_filtro_ambito
string Is_filtro_deteccion
string Is_filtro_alimentacion
string retorno
int il_trajo_datos, ii_fila_seleccionada

int ii_mantenimiento
end variables

forward prototypes
public function integer fnu_obtener_direccion ()
public function boolean fnu_valido_datos ()
public function integer fw_llamada_incidencias ()
public subroutine fw_hab_botones ()
public function integer fw_actualizar_avisos_sum (long pl_nis)
end prototypes

event ue_retrieve;/////////////////////////////////////////////////////////////
//
//	Event:	ue_retrieve
//
/////////////////////////////////////////////////////////////
int li_vigente, li_tabla_decision
long ll_filas

SetPointer(HourGlass!)
THIS.SETREDRAW(FALSE)
dw_mant_sum_imp.Reset()
//dw_mant_sum_imp.Retrieve()

IF lu_comunic.is_comunic.programa_llamante <> "iw_1234" THEN
	ll_filas = dw_mant_sum_imp.Retrieve()
ELSE
	IF gb_tabla_decision THEN
		li_tabla_decision = 1 
	ELSE
		li_tabla_decision = 0
	END IF
	ll_filas = dw_mant_sum_imp.Retrieve(lu_comunic.is_comunic.longval1, lu_comunic.is_comunic.Datval1, li_tabla_decision)
END IF

IF ll_filas < 1 THEN
	dw_mant_sum_imp.Reset()
	this.setredraw(TRUE)
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No exiten suministro importantes que cumplan la condici$$HEX1$$f300$$ENDHEX$$n",Exclamation!)
	//gnv_msg.f_mensaje("IS04","","",ok!)
end if


fw_hab_botones()


DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista Suministros Importantes'
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

//dw_mant_sum_imp.ShareData(dw_datos)
dw_mant_sum_imp.setredraw(true)
									
THIS.SETREDRAW(TRUE)
end event

event ue_arch_modificar;int li_lock_status
long ll_nis_rad
datetime  ld_f_desde 
SetPointer(HourGlass!)

ll_nis_rad = dw_mant_sum_imp.GetItemNumber(ii_fila_seleccionada, "nis_rad")
ld_f_desde=  dw_mant_sum_imp.GetItemDateTime(ii_fila_seleccionada, "f_desde")

IF iu_man_2036_rn.frn_tiene_perfil_modifica() = FALSE OR lu_comunic.is_comunic.accion_llamada = "Consulta"  THEN
	gu_comunic.is_comunic.accion_llamada = "Consulta"
ELSE
	gu_comunic.is_comunic.accion_llamada = "Modifica"
END IF
if ii_fila_seleccionada > 0 then
	gu_comunic.is_comunic.longval1 = dw_mant_sum_imp.GetItemNumber(ii_fila_seleccionada,"nis_rad")	
	gu_comunic.is_comunic.datval1 = dw_mant_sum_imp.GetItemDateTime(ii_fila_seleccionada,"f_desde")
//______DSA INI 17/01/2000		
li_lock_status = gnu_u_transaction.uf_lock(THIS,"GI_SUMINISTROS_IMP", "NIS_RAD = " + string(ll_nis_rad) + " and " + "GI_SUMINISTROS_IMP.F_DESDE = TO_DATE('" + string(ld_f_desde) + "','DD/MM/YYYY HH24:mi:ss') " )
	IF li_lock_status = 0 THEN
		open(w_3202_alta_suministros_imp)
	END IF	
	
//______DSA INI 17/01/2000		
END IF
	


end event

event ue_armar_sql;
long ll_nro_incidencia
string ls_filtro, ls_filtro2


integer li_centro, li_cmd, li_puesto, li_vigente

SetPointer(HourGlass!)
d_ambito.accepttext()
dw_vigente.accepttext()

li_centro =d_ambito.getitemnumber(1,"nro_centro")
li_cmd =d_ambito.getitemnumber(1,"nro_cmd")
li_puesto = d_ambito.getitemnumber(1,"nro_mesa")
ll_nro_incidencia = lu_comunic.is_comunic.longval1

li_vigente = dw_vigente.getitemnumber(1,"vigente")

IF li_vigente<>0 THEN

		//si cliente no vigente 
	IF li_vigente=2 THEN
		ls_filtro2= "  and (f_expiracion <= sysdate)"
		//si cliente vigente
	ELSEIF li_vigente=1 THEN 
		ls_filtro2= " and (f_expiracion > sysdate)"
			
	END IF
ELSE
	ls_filtro2= ""	
END IF


is_select_original = " SELECT ~"GI_SUMINISTROS_IMP~".~"NIS_RAD~" ,~"GI_SUMINISTROS_IMP~".~"F_DESDE~" ,~"GI_SUMINISTROS_IMP~".~"F_EXPIRACION~" ,~"GI_SUMINISTROS_IMP~".~"OBSERVACION~" ,~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~", ~"GI_SUMINISTROS_IMP~".~"CONTACTO~",~"GI_SUMINISTROS_IMP~".~"TELEFONO~",~"GI_SUMINISTROS_IMP~".~"NRO_INSTALACION~" FROM ~"GI_SUMINISTROS_IMP~" ,~"ACO_SUM~" ,~"SGD_ACOMETIDA~",~"CLIENTES~" "



IF lu_comunic.is_comunic.programa_llamante = "w_oper" THEN
	
	
	if li_centro<>fgci_todos THEN
		ls_filtro = " (~"SGD_ACOMETIDA~".~"NRO_CENTRO~" = " + string(li_centro) + ")"
		if li_cmd<>fgci_todos THEN
			ls_filtro=ls_filtro + " and (~"SGD_ACOMETIDA~".~"NRO_CMD~" = " + string(li_cmd)+ ")"
			if li_puesto<>fgci_todos THEN
				ls_filtro=ls_filtro + " and (~"SGD_ACOMETIDA~".~"NRO_MESA~" = " + string(li_puesto) + ")"
			end if	
		end if
	end if

	is_clausula_where = 	"( ~"GI_SUMINISTROS_IMP~".~"COD_CLI~" = ~"CLIENTES~".~"COD_CLI~")  AND  "+&
							"( ~"GI_SUMINISTROS_IMP~".~"NIS_RAD~" = ~"ACO_SUM~".~"NIS_RAD~" ) AND " +&
							"( ~"ACO_SUM~".~"NRO_ACOMETIDA~" = ~"SGD_ACOMETIDA~".~"CODIGO~") "
ELSE

	is_select_original = " SELECT ~"GI_SUMINISTROS_IMP~".~"NIS_RAD~" ,~"GI_SUMINISTROS_IMP~".~"F_DESDE~" ,~"GI_SUMINISTROS_IMP~".~"F_EXPIRACION~" ,~"GI_SUMINISTROS_IMP~".~"OBSERVACION~" ,~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~", ~"GI_SUMINISTROS_IMP~".~"CONTACTO~",~"GI_SUMINISTROS_IMP~".~"TELEFONO~",~"GI_SUMINISTROS_IMP~".~"NRO_INSTALACION~" FROM ~"GI_SUMINISTROS_IMP~" ,~"ACO_SUM~" ,~"SGD_ACOMETIDA~",~"CLIENTES~" "
	is_clausula_where = 	"( ~"GI_SUMINISTROS_IMP~".~"COD_CLI~" = ~"CLIENTES~".~"COD_CLI~")  AND  "+&
							"( ~"GI_SUMINISTROS_IMP~".~"NIS_RAD~" = ~"ACO_SUM~".~"NIS_RAD~" ) AND " +&
							"( ~"ACO_SUM~".~"NRO_ACOMETIDA~" = ~"SGD_ACOMETIDA~".~"CODIGO~") "

END IF

IF ls_filtro <> "" THEN
	is_clausula_where = is_select_original + " WHERE " + is_clausula_where + " AND SGD_ACOMETIDA.BDI_JOB = 0 AND" + ls_filtro
ELSE
	is_clausula_where = is_select_original + " WHERE " + is_clausula_where + " AND SGD_ACOMETIDA.BDI_JOB = 0" 
END IF

//// EN EL CASO DE VENIR DE INCIDENCIAS
if lu_comunic.is_comunic.programa_llamante = "iw_1234" then 
	dw_mant_sum_imp.dataobject = 'd_sum_imp'
	dw_mant_sum_imp.SetTransObject(SQLCA)
	retorno = ""
ELSE
	//
	IF ls_filtro2 <> "" THEN
		is_clausula_where=is_clausula_where+ls_filtro2
	end if

	is_modificacion = "DataWindow.Table.Select= '" + is_clausula_where + "'"
	retorno = dw_mant_sum_imp.Modify(is_modificacion)
END IF

IF retorno = "" THEN
	this.triggerevent("ue_retrieve")
END IF

is_clausula_where = ""
is_modificacion = ""

d_ambito.accepttext()

end event

public function integer fnu_obtener_direccion ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_direccion
// 
// Objetivo: Obtengo datos centros y departamentos.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		AFS			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_tipo

IF GI_NRO_CENTRO = fgci_todos AND GI_NRO_CMD = fgci_todos AND GI_NRO_PUESTO = fgci_todos THEN
	li_tipo = 1
ELSE
	li_tipo = 3
END IF

  SELECT "SGD_CENTRO"."COD_PROV",   
         "SGD_CENTRO"."COD_DEPTO",   
         "SGD_CENTRO"."COD_MUNIC",   
         "SGD_CENTRO"."COD_LOCAL",   
         "PROVINCIAS"."NOM_PROV",   
         "DEPTOS"."NOM_DEPTO",   
         "MUNICIPIOS"."NOM_MUNIC",   
         "LOCALIDADES"."NOM_LOCAL"  
    INTO :IL_PROVINCIA,   
         :IL_DEPARTAMENTO,   
         :IL_MUNICIPIO,   
         :IL_LOCALIDAD,   
         :IS_PROV,   
         :IS_DEPTO,   
         :IS_MUNIC,   
         :IS_LOCAL  
    FROM "DEPTOS",   
         "LOCALIDADES",   
         "MUNICIPIOS",   
         "PROVINCIAS" ,
			"SGD_CENTRO" 
   WHERE ( "SGD_CENTRO"."COD_PROV" = "PROVINCIAS"."COD_PROV" ) and  
         ( "SGD_CENTRO"."COD_DEPTO" = "DEPTOS"."COD_DEPTO" ) and  
         ( "SGD_CENTRO"."COD_MUNIC" = "MUNICIPIOS"."COD_MUNIC" ) and  
         ( "SGD_CENTRO"."COD_LOCAL" = "LOCALIDADES"."COD_LOCAL" ) and  
			( "SGD_CENTRO"."TIP_CENTRO" = :li_tipo) AND
         ( ( "SGD_CENTRO"."NRO_CENTRO" = :gi_nro_puesto ) )   ;

RETURN 1
end function

public function boolean fnu_valido_datos ();////////////////////////////////////////////////////////////////
//
//	Function:	fnu_valido_datos
//
////////////////////////////////////////////////////////////////

//	IF d_ambito.getitemnumber(1,"nro_centro") = fgci_todos THEN
//		gnv_msg.f_mensaje("EI29","","",OK!)
//		d_ambito.setcolumn("nro_centro")
//		d_ambito.setfocus()
//		RETURN FALSE
//	ELSE
//		IF d_ambito.getitemnumber(1,"nro_cmd") = fgci_todos THEN
//			gnv_msg.f_mensaje("EI30","","",OK!)
//			d_ambito.setcolumn("nro_cmd")
//			d_ambito.setfocus()
//			RETURN FALSE
//		END IF
//	END IF

return TRUE
end function

public function integer fw_llamada_incidencias ();cb_agregar.visible=false
cb_buscar.visible=false
cb_consultar.visible=false
cb_eliminar.visible=false
d_ambito.visible=false
dw_vigente.visible=false
gb_1.visible=false
dw_mant_sum_imp.x=65
dw_mant_sum_imp.y=61
dw_mant_sum_imp.width=2689
dw_mant_sum_imp.height=773
this.x=28
this.y=521
this.width=2858
this.height=993

return 0
end function

public subroutine fw_hab_botones ();if dw_mant_sum_imp.getselectedrow(0) = 0 then
		cb_eliminar.Enabled= FALSE
		cb_consultar.Enabled=FALSE
elseif dw_mant_sum_imp.RowCount() > 0 and dw_mant_sum_imp.getselectedrow(0) > 0 THEN
		cb_eliminar.Enabled= true
		cb_consultar.Enabled=true
end if

end subroutine

public function integer fw_actualizar_avisos_sum (long pl_nis);// Funci$$HEX1$$f300$$ENDHEX$$n que actualiza el $$HEX1$$e100$$ENDHEX$$rbol de avisos y/o los datos de la incidencia en el caso de
// que el suministro importante tenga dados de alta avisos (LFE)

long ll_nro_aviso, ll_nro_incidencia, ll_nro_instalacion
int li_ind_calidad, li_ind_inc_asoc, li_asoc, li_clase_aviso
datetime ldt_f_actual


// Se comprueba si el suministro tiene dado de alta alg$$HEX1$$fa00$$ENDHEX$$n aviso en estado menor que resuelto
DECLARE lcur_avisos CURSOR FOR 
 SELECT NRO_AVISO, 
 		  IND_CALIDAD,
		  IND_INC_ASOC,
		  NRO_INCIDENCIA
 FROM GI_AVISOS
 WHERE NIS_RAD = :pl_nis AND
 		 EST_AVISO < :fgci_aviso_resuelto;

OPEN lcur_avisos;

IF SQLCA.SQLCode = 0 THEN
	FETCH lcur_avisos INTO :ll_nro_aviso, :li_ind_calidad, :li_ind_inc_asoc, :ll_nro_incidencia;
	
	ldt_f_actual = fgnu_fecha_actual()
	DO WHILE sqlca.sqlcode = 0 
		// Hay avisos no resueltos asociados a ese suministro
		// Se actualiza la tabla GI_AVISOS y se elimina el indicativo de cliente importante
		// en los avisos de ese suministro
		UPDATE GI_AVISOS
		SET IND_CLI_IMP = 0 
		WHERE NRO_AVISO = :ll_nro_aviso;
		
		IF SQLCA.SQLCode = 0 THEN
			// Se comprueba si el aviso se encuentra asociado a una incidencia
		ELSE
			// No se ha podido actualizar la tabla de avisos
			CLOSE lcur_avisos;
			return -1
		END IF
		
		FETCH lcur_avisos INTO :ll_nro_aviso, :li_ind_calidad, :li_ind_inc_asoc, :ll_nro_incidencia;
	LOOP
	
	CLOSE lcur_avisos;
	
ELSE
	return -1
END IF

return 1
end function

event open;call super::open;/////////////////////////////////////////////////////////////
//
//	Event:	Open
//
//Parametro de entrada
//					gu_comunic.is_comunic.longval1=nro_incidencia
//					(w_2301 y w_1234)
/////////////////////////////////////////////////////////////
if gu_comunic.is_comunic.programa_llamante <> "iw_1234" then 
	fg_colocar_ventana_main(w_3201_mantenimiento_suministros_imp)
ELSE
	This.Visible=False
	This.Setredraw(False)
	fw_llamada_incidencias()
end if

//This.SetReDraw(False)

//***CREACI$$HEX1$$d300$$ENDHEX$$N DE OBJETOS DE TRABAJO***********************
lu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia
iu_man_2036_rn = CREATE u_man_2036_rn_sum_imp
iu_cen_2001_nu = CREATE u_cen_2001_nu_form_centro_cmd_mesa

//***OBTENGO y VALIDO PAR$$HEX1$$c100$$ENDHEX$$METROS DE ENTRADA***************

lu_comunic.is_comunic = gu_comunic.is_comunic // Recibo valores de entrada desde globales

IF lu_comunic.is_comunic.accion_llamada = "Consulta" THEN
	cb_agregar.visible = false
	cb_eliminar.visible = false
	cb_consultar.visible = False
END IF

//***PREPARACI$$HEX1$$d300$$ENDHEX$$N DE PRESENTACI$$HEX1$$d300$$ENDHEX$$N DE LA VENTANA************
ii_fila_seleccionada = 1
d_ambito.settransobject(sqlca) // Conexi$$HEX1$$f300$$ENDHEX$$n a la base
d_ambito.fpr_crea_dddw()
d_ambito.insertrow(0)
d_ambito.fnu_insertar_datos(lu_comunic.is_comunic.intval1,lu_comunic.is_comunic.intval2,lu_comunic.is_comunic.intval3,0)
//***INICIALIZACI$$HEX1$$d300$$ENDHEX$$N DE VALORES POR DEFECTO*******************


IF lu_comunic.is_comunic.programa_llamante <> "w_oper" THEN
	d_ambito.fpr_habilitar_campos(FALSE)
END IF
//IF lu_comunic.is_comunic.programa_llamante <> "iw_1234" then
//	d_ambito.setitem(1,"nro_centro",lu_comunic.is_comunic.intval1)
//	d_ambito.setitem(1,"nro_cmd",lu_comunic.is_comunic.intval2)
//	d_ambito.setitem(1,"nro_mesa",lu_comunic.is_comunic.intval3)
//end if
//This.SetReDraw(True)

//***EFECTUO EL RETRIVE A LA BASE DE DATOS*******************
// Conexi$$HEX1$$f300$$ENDHEX$$n a la base
dw_mant_sum_imp.settransobject(sqlca)
//// Obtengo la clausula select original de la datawindow

this.TriggerEvent("ue_armar_sql")

//***BOT$$HEX1$$d300$$ENDHEX$$N DE CONSULTA***************************************
//	Deshabilitado los botones ya que no hay registros
IF dw_mant_sum_imp.RowCount() <= 0 THEN
	dw_mant_sum_imp.Reset()
	cb_agregar.enabled = true
	cb_consultar.enabled = False
	cb_eliminar.Enabled=False
END IF

d_ambito.setcolumn("nro_centro")
//This.SetReDraw(True)
dw_1.modify("data_1.DataObject ='" + dw_mant_sum_imp.DataObject + "'")
cb_buscar.setfocus()

IF dw_mant_sum_imp.RowCount() <= 0 AND lu_comunic.is_comunic.programa_llamante = "iw_1234" THEN
	Close(This)
ELSE
	This.Visible=True
	This.Setredraw(True)
END IF

end event

event activate;/////////////////////////////////////////////////////////////
//
//	Event:	Activate
//
/////////////////////////////////////////////////////////////

STRING ls_prog_llamante

fw_hab_botones()

IF gu_comunic.is_comunic.programa_retorno = "w_3202_sumin_imp" THEN
	ls_prog_llamante = lu_comunic.is_comunic.programa_llamante
	lu_comunic.is_comunic = gu_comunic.is_comunic
	lu_comunic.is_comunic.programa_llamante = ls_prog_llamante 
	fgnu_resetear_s_comunicaciones(gu_comunic)

	IF lu_comunic.is_comunic.accion_retorno = "Actualizacion" THEN
		This.TriggerEvent("ue_armar_sql")
	END IF

END IF

	lu_comunic.is_comunic.programa_retorno = ""
	lu_comunic.is_comunic.accion_retorno = ""

end event

event timer;//	ANCESTOR SCRIPT OVERRIDED
end event

event ue_arch_agregar;call super::ue_arch_agregar;SetPointer(HourGlass!)

//fnu_obtener_direccion()

// Cargo la direccion del usuario con las variables globales 
// cargadas en el arranque de la aplicacion
gu_comunic.is_comunic.strval1  = gs_provincia		  // Provincia
gu_comunic.is_comunic.strval2  = gs_departamento     // Departamento
gu_comunic.is_comunic.strval3  = gs_municipio        // Municipio
gu_comunic.is_comunic.strval4  = gs_localidad        // Localidad

gu_comunic.is_comunic.intval1	 = gi_cod_provincia		// Cod. Prov.
gu_comunic.is_comunic.intval2  = gi_cod_departamento	// Cod. Depto.
gu_comunic.is_comunic.longval4 = gl_cod_municipio		// Cod. Munic.
gu_comunic.is_comunic.longval5 = gl_cod_localidad		// Cod. Loc.

gu_comunic.is_comunic.intval3 = gi_nro_centro
gu_comunic.is_comunic.intval4 = gi_nro_cmd	
gu_comunic.is_comunic.intval5 = gi_nro_puesto

gu_comunic.is_comunic.accion_llamada = "Alta"
//gu_comunic.fnu_abrir(w_3202_alta_suministros_imp,"w_3202_alta_suministros_imp",1,1,w_3201_mantenimiento_suministros_imp,"w_3201_mantenimiento_suministros_imp")
open(w_3202_alta_suministros_imp)
end event

event ue_arch_eliminar;call super::ue_arch_eliminar;int li_confirmo, li_lock_status
long ll_nis_rad,ll_nro_ct
datetime ld_f_desde,ld_f_actual,ld_f_expiracion
string ls_mensaje

ld_f_desde=  dw_mant_sum_imp.GetItemDateTime(ii_fila_seleccionada, "f_desde")
ll_nis_rad = dw_mant_sum_imp.GetItemNumber(ii_fila_seleccionada, "nis_rad")
ll_nro_ct = dw_mant_sum_imp.GetItemNumber(ii_fila_seleccionada, "nro_instalacion")

ld_f_actual = fgnu_fecha_actual()
// intento bloquear el registro para que nadie m$$HEX1$$e100$$ENDHEX$$s lo pueda modificar
li_lock_status = gnu_u_transaction.uf_lock(THIS,"GI_SUMINISTROS_IMP", "NIS_RAD = " + string(ll_nis_rad) + " and " + "GI_SUMINISTROS_IMP.F_DESDE = TO_DATE('" + string(ld_f_desde) + "','DD/MM/YYYY HH24:mi:ss') " )
IF li_lock_status <> 0 THEN
	// el registro ya est$$HEX2$$e1002000$$ENDHEX$$bloqueado por otro usuario. No se puede eliminar
	return
END IF

//mensaje pididendo confirmacion
li_confirmo = gnv_msg.f_mensaje("CG02","","",YesNo!)

IF li_confirmo = 1 THEN
	dw_mant_sum_imp.DeleteRow (ii_fila_seleccionada)
	dw_mant_sum_imp.Update()
	//COMMIT;

	IF fw_actualizar_avisos_sum(ll_nis_rad) = 1 THEN
		gnu_u_transaction.uf_commit(THIS)
		
//		// Comunicamos la tool al Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n
//
//		if  gb_operaciones=true then 
//	
//			// Recuperamos el CT que alimenta al VIP
//			
//			if isvalid(gu_operaciones) then 	
//						
//				if gu_rf_servidor_operacion.of_tool_vip(ll_nro_ct,ld_f_desde,0,ls_mensaje,gi_ci_ct,ld_f_expiracion,ll_nis_rad)=1 then 
//					Close(this)
//					return
//				else  // ERROR AL ENVIAR A OPERACIONES
//					messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Error al enviar la tool VIP a Operaci$$HEX1$$f300$$ENDHEX$$n: " + ls_mensaje,information!,okcancel!)
//					Close(this)
//					return
//				end if
//			else 		// OPERACIONES PERO OBJETO INVALIDO
//				Close(this)
//				return
//			end if
//			 
//		end if
				
	ELSE
		//messagebox("Error", "No se han podido actualizar los datos del suministro")
		gnv_msg.f_mensaje("EM62", "", "",OK!)
		gnu_u_transaction.uf_rollback(THIS)
	END IF
	//gnu_u_transaction.uf_commit(THIS)
//	end if // PM TOOLS
		
ELSE
	li_confirmo = 0
	gnu_u_transaction.uf_rollback(THIS)
	return
END IF

IF ii_fila_seleccionada > dw_mant_sum_imp.RowCount() THEN
	ii_fila_seleccionada = ii_fila_seleccionada - 1
END IF

dw_mant_sum_imp.SelectRow(0,FALSE)
dw_mant_sum_imp.SelectRow(ii_fila_seleccionada,TRUE)


fw_hab_botones()


end event

on w_3201_mantenimiento_suministros_imp.create
int iCurrent
call super::create
this.cb_eliminar=create cb_eliminar
this.cb_consultar=create cb_consultar
this.dw_mant_sum_imp=create dw_mant_sum_imp
this.d_ambito=create d_ambito
this.cb_buscar=create cb_buscar
this.cb_agregar=create cb_agregar
this.dw_vigente=create dw_vigente
this.gb_1=create gb_1
this.dw_1=create dw_1
this.cb_imprimir=create cb_imprimir
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_eliminar
this.Control[iCurrent+2]=this.cb_consultar
this.Control[iCurrent+3]=this.dw_mant_sum_imp
this.Control[iCurrent+4]=this.d_ambito
this.Control[iCurrent+5]=this.cb_buscar
this.Control[iCurrent+6]=this.cb_agregar
this.Control[iCurrent+7]=this.dw_vigente
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.dw_1
this.Control[iCurrent+10]=this.cb_imprimir
end on

on w_3201_mantenimiento_suministros_imp.destroy
call super::destroy
destroy(this.cb_eliminar)
destroy(this.cb_consultar)
destroy(this.dw_mant_sum_imp)
destroy(this.d_ambito)
destroy(this.cb_buscar)
destroy(this.cb_agregar)
destroy(this.dw_vigente)
destroy(this.gb_1)
destroy(this.dw_1)
destroy(this.cb_imprimir)
end on

event closequery;call super::closequery;/////////////////////////////////////////////////////////////
//
//	Event:	Closequery
//
/////////////////////////////////////////////////////////////

DESTROY lu_comunic
DESTROY iu_man_2036_rn 
DESTROY iu_cen_2001_nu 


end event

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN triggerevent("ue_retrieve")

IF dw_mant_sum_imp.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_mant_sum_imp
lst_impresion.compuesto = false
gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3201_mantenimiento_suministros_imp
end type

type cb_eliminar from u_cb within w_3201_mantenimiento_suministros_imp
integer x = 1006
integer y = 1628
integer width = 411
integer height = 96
integer taborder = 70
string text = "&Eliminar"
end type

on clicked;call u_cb::clicked;parent.triggerevent("ue_arch_eliminar")
end on

type cb_consultar from u_cb within w_3201_mantenimiento_suministros_imp
integer x = 1605
integer y = 1628
integer width = 411
integer height = 96
integer taborder = 40
string text = "&Modificar"
end type

on clicked;call u_cb::clicked;Parent.TriggerEvent("ue_arch_modificar")

end on

type dw_mant_sum_imp from u_man_2035_pr_lista_sum_imp within w_3201_mantenimiento_suministros_imp
integer x = 105
integer y = 548
integer width = 3365
integer height = 936
integer taborder = 80
boolean border = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;ii_fila_seleccionada = row
if row>0 then
	parent.triggerevent("ue_arch_modificar")
end if
end event

event clicked;call super::clicked;	if row > 0 then 
		this.selectrow(0,false)
		this.selectrow(row,true)
		ii_fila_seleccionada = row
		cb_eliminar.Enabled=true
		cb_consultar.enabled = true
	end if
end event

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_3201_mantenimiento_suministros_imp
integer x = 101
integer y = 148
integer taborder = 10
boolean border = false
end type

event clicked;call super::clicked;//d_ambito.fnu_filtrar_cmd(d_ambito,d_ambito.getitemnumber(1,"nro_centro")) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
//d_ambito.fnu_filtro_mesa_nuevo(d_ambito,d_ambito.getitemnumber(1,"nro_cmd"))  // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
	
end event

type cb_buscar from u_cb within w_3201_mantenimiento_suministros_imp
event clicked pbm_bnclicked
integer x = 2203
integer y = 1628
integer width = 411
integer height = 96
integer taborder = 50
string text = "&Buscar"
boolean default = true
end type

event clicked;call super::clicked;//string ls_select
//ls_select=dw_mant_sum_imp.getsqlselect()
SetPointer(HourGlass!)
Parent.TriggerEvent("ue_armar_sql")
end event

type cb_agregar from u_cb within w_3201_mantenimiento_suministros_imp
event clicked pbm_bnclicked
integer x = 407
integer y = 1628
integer width = 411
integer height = 96
integer taborder = 60
string text = "&Agregar"
end type

on clicked;call u_cb::clicked;parent.triggerevent("ue_arch_agregar")
end on

type dw_vigente from datawindow within w_3201_mantenimiento_suministros_imp
integer x = 2679
integer y = 216
integer width = 786
integer height = 96
integer taborder = 30
boolean bringtotop = true
string dataobject = "ddw_man_sum_imp"
boolean border = false
boolean livescroll = true
end type

event constructor;this.insertrow(0)
this.setitem(1,"vigente",0)
end event

type gb_1 from groupbox within w_3201_mantenimiento_suministros_imp
integer x = 2661
integer y = 156
integer width = 818
integer height = 172
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Estado del cliente"
end type

type dw_1 from datawindow within w_3201_mantenimiento_suministros_imp
boolean visible = false
integer x = 133
integer y = 700
integer width = 494
integer height = 360
integer taborder = 90
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_imprimir from commandbutton within w_3201_mantenimiento_suministros_imp
integer x = 2802
integer y = 1628
integer width = 411
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event


HA$PBExportHeader$w_man_instalacion.srw
forward
global type w_man_instalacion from window
end type
type cb_cancelar from commandbutton within w_man_instalacion
end type
type cb_aceptar from commandbutton within w_man_instalacion
end type
type dw_2 from u_lista_tramos within w_man_instalacion
end type
type gb_1 from groupbox within w_man_instalacion
end type
type cb_1 from commandbutton within w_man_instalacion
end type
type st_2 from statictext within w_man_instalacion
end type
type st_3 from statictext within w_man_instalacion
end type
type tv_1 from uo_man_instalac within w_man_instalacion
end type
type dw_modifi from u_cen_2001_pr_form_centro_cmd_mesa within w_man_instalacion
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_man_instalacion
end type
type st_1 from statictext within w_man_instalacion
end type
type dw_1 from datawindow within w_man_instalacion
end type
type gb_2 from groupbox within w_man_instalacion
end type
type datos_arbol from structure within w_man_instalacion
end type
end forward

type datos_arbol from structure
	long		ll_codigo
	long		ll_tipo
end type

global type w_man_instalacion from window
boolean visible = false
integer y = 280
integer width = 3653
integer height = 2120
boolean titlebar = true
string title = "OPEN SGI - Mantenimiento de Instalaciones"
boolean controlmenu = true
long backcolor = 79741120
string icon = "estructu.ico"
event grabar_modificacion ( )
event ue_post_open ( )
event ue_sum_imp ( )
event ue_incidencias ( )
event ue_avisos ( )
event ue_ots ( )
event ue_acometidas ( )
event ue_suministros ( )
event ue_crear_inst ( )
event ue_eliminar_inst ( )
event ue_crear_salbaja ( )
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
dw_2 dw_2
gb_1 gb_1
cb_1 cb_1
st_2 st_2
st_3 st_3
tv_1 tv_1
dw_modifi dw_modifi
dw_ambito dw_ambito
st_1 st_1
dw_1 dw_1
gb_2 gb_2
end type
global w_man_instalacion w_man_instalacion

type variables
boolean  ib_ya_bloqueado =FALSE //Si registro tiene lock = TRUE
boolean ib_saliendo=false
long il_padre=0
int ii_tipo
boolean ib_mismo_ambito
long il_elemento_actual
long il_modifi
long il_ambito_modifi
long il_manejador
long il_marcado
long il_cancelar
long il_tipo_ambito = 0
u_generico_comunicaciones iu_gen_comunic
long il_centro
long il_cmd
long il_puesto
long il_abierta = 0
long ll_handle_nuevo_elemento
string 	  nombre, is_accion_llamada
boolean ib_busqueda_padre=false
int 	  tipo
decimal{0} instalacion, instalacion_padre
int 	  ii_fila, ii_afect_por_incid


u_generico_comunicaciones iu_resetear

u_gen_2001_nu_identificacion_instalacion iu_2001_nu
u_gen_2002_nu_identificacion_instalacion iu_2002_nu

u_ins_2011_rn_lista_instal_por_tipo iu_2011_rn
u_ins_2011_nu_lista_instal_por_tipo iu_2011_nu

string direccion
decimal centro
decimal cmd
decimal puesto
decimal t_instalacion
decimal nivel_instalacion
string nombre_instalacion
long il_nuevo_handle

string is_nombre_dw


long il_cant_cli
double il_pot_inst, il_pot_contr
int ii_tension
int ii_fila_ant

decimal{0} idec_nro_inst

boolean ib_actualizacion
boolean ib_hay_instalac
boolean ib_error = false

boolean ib_modificado = false

boolean ib_error_update = false

s_direccion_cliente			is_direccion
md_lista_mante im_menu
end variables

forward prototypes
public function long f_ult_registro (string ls_tabla, long ll_icono, long ll_handle_padre)
public subroutine f_campos_comunes ()
public function boolean validar_campos (string nombre_data_window)
public function boolean fnu_valida_ambito (ref datawindow dw)
public function boolean f_ambitos_iguales (datawindow dw1, datawindow dw2)
public subroutine f_cargar_datos_direccion ()
public subroutine fw_habilitar_campos (datawindow pdw_data, boolean pb_habilita)
public function integer fw_expande_rama (long pl_codigo_instalacion)
public function integer f_nivel (long pl_codigo)
public function string wf_tabla ()
public function string wf_clave ()
public function datetime wf_timestamp ()
public function boolean fw_padre_valido (long pl_padre, long pl_class_id_hijo)
end prototypes

event grabar_modificacion;treeviewitem le_elemento
long ll_codigo
long ll_nro_instalacion
long ll_retorno
boolean lb_insertado=false
datos_arbol lst_datos
long ll_tipo
string ls_nombre
long ll_icono_nuevo

ls_nombre = dw_1.getitemstring(1,"nombre")

// Actualizo el valor de los campos que son comunes para las tablas
f_campos_comunes()

// Comentado el viernes
////Comprueba que potencia instalada no sea 0
//IF dw_1.dataobject <> 'd_man_salbt' then
//	
//	dw_1.accepttext()
//	if dw_1.getitemnumber(dw_1.getrow(),"potencia_instalada") < 1 then
//		messagebox("Error","La potencia instalada es erronea")
//		ib_error = false
//		return
//	end if
//	
//end if

if il_modifi = 2 then
	CHOOSE CASE dw_1.dataobject

			CASE 'd_man_subestac'
								ll_nro_instalacion = f_ult_registro('sgd_subestac',1,0)
								dw_1.setitem(1,"instalacion_origen",fgcdec_aviso_con_alimentacion)
								ll_tipo = fgci_tipo_subestacion
			CASE 'd_man_salmt'
								ll_nro_instalacion = f_ult_registro('sgd_salmt',2,il_manejador)
								ll_tipo = fgci_tipo_salida_mt
			CASE 'd_man_ct'
									ll_nro_instalacion = f_ult_registro('sgd_ct',3,il_manejador)
									ll_tipo = fgci_tipo_ct
			CASE 'd_man_trafo_mb'
								ll_nro_instalacion = f_ult_registro('sgd_trafo_mb',4,il_manejador)
								ll_tipo = fgci_tipo_transformador
			CASE 'd_man_salbt'
								ll_nro_instalacion = f_ult_registro('sgd_salbt',5,il_manejador)
								ll_tipo = fgci_tipo_salida_de_baja
	END CHOOSE
end if

if il_modifi = 2 then
//Obtengo el nuevo icono viendo a que nivel esta el padre del elemento nuevo
				tv_1.getitem(il_manejador,le_elemento)
				//ll_icono_nuevo = le_elemento.level
				//ll_icono_nuevo ++
				ll_icono_nuevo = tv_1.f_icono_Arbol(ll_tipo)

				//Si se ha creado una nueva instalacion la a$$HEX1$$f100$$ENDHEX$$ade al arbol
				if dw_1.dataobject = 'd_man_subestac' then 
					ll_icono_nuevo = tv_1.f_icono_Arbol(fgci_tipo_subestacion)
					il_elemento_actual = 0
				end if

				//Pongo el numero de instalacion nueva o reescribo la misma
				dw_1.setitem(1,"codigo",ll_nro_instalacion)
				dw_1.accepttext()
				if dw_1.update() = -1 then
					ib_error_update = true
					//rollback;
					gnu_u_transaction.uf_rollback(THIS)
				else
					ib_error_update = false
					gnu_u_transaction.uf_commit(THIS)
					//commit;
				end if				

	
			if ib_error_update = false then
				if dw_1.dataobject = 'd_man_subestac' and ib_mismo_ambito then
		         ll_handle_nuevo_elemento =	tv_1.insertitemsort(il_elemento_actual,ls_nombre,ll_icono_nuevo)
					lb_insertado=true
				elseif dw_1.dataobject <>'d_man_subestac'  then
					lb_insertado=true
		         ll_handle_nuevo_elemento =	tv_1.insertitemsort(il_manejador,ls_nombre,ll_icono_nuevo)
				end if
				if lb_insertado then 
					tv_1.getitem(ll_handle_nuevo_elemento,le_elemento)
					
					lst_datos.ll_codigo = ll_nro_instalacion 
					lst_datos.ll_tipo = ll_tipo 
					le_elemento.data = lst_datos
					tv_1.setitem(ll_handle_nuevo_elemento,le_elemento)
				end if
			end if
else
	dw_1.accepttext()
	if dw_1.update() = -1 then //HAY QUE JODERSE
		ib_error_update = true
	else
		//commit;
		gnu_u_transaction.uf_commit(THIS)
	end if
	
//	dw_1.reset()
	ib_error = false
end if

if il_modifi = 2 then
	if ib_error_update = false then
  		if lb_insertado then 
			tv_1.selectitem(ll_handle_nuevo_elemento)
			
		//	tv_1.triggerevent("ue_cargar")	
		end if	
	else
		ib_error_update =false
		ib_error = false
		return
	end if
end if


if sqlca.sqlcode = 0 then
	il_modifi = 0
	ib_modificado=false //ACO
	This.tv_1.enabled = true
	This.cb_1.enabled = true
end if


end event

event ue_sum_imp;SetPointer(HourGlass!)

ii_fila = 1
IF ii_fila > 0 THEN

	gu_comunic.is_comunic.decval1 = dw_1.GetItemDecimal(ii_fila,"codigo")
	
	IF (gu_comunic.is_comunic.decval1 <> fgcdec_instalacion_eliminadas) AND &
			(dw_1.GetItemDecimal(ii_fila,"instalacion_origen") <> fgcdec_instalacion_eliminadas) THEN

		SetPointer(HourGlass!)
	
		gu_comunic.is_comunic.programa_llamante = "w_3107"
		gu_comunic.is_comunic.accion_llamada = "Consulta"

		//gu_comunic.fnu_abrir(w_2307_consulta_avisos,"w_2307_consulta_avisos",1,1,w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones")
		//*******************************************
		//**  OSGI 2001.2  	07/08/2002				 **
		//**  Jair Padilla / Soluziona PANAMA  	 **
		//**  SUMINISTROS IMPORTANTES					 **
		//*******************************************
		//**  SUMINISTROS IMPORTANTES					 		Open(w_3210_lista_suministros_imp)


		s_grupo_int ls_grupo_int
		
	
		ls_grupo_int.nro_instalacion = gu_comunic.is_comunic.decval1
		ls_grupo_int.f_deteccion = fgnu_fecha_actual()
		
		gi_clientes_afec = 1
	
		OpenWithParm(w_ver_sum_importantes, ls_grupo_int, w_operaciones)
		//*******************************************
		//**  OSGI 2001.2  	07/08/2002				 **
		//**  Jair Padilla / Soluziona PANAMA  	 **
		//**  SUMINISTROS IMPORTANTES					 **
		//*******************************************

	ELSE
		gnv_msg.f_mensaje("AM13","","",OK!)
	END IF	
ELSE
	gnv_msg.f_mensaje("AM04","","",OK!)
END IF
gu_comunic.is_comunic.accion_retorno = ''
end event

event ue_incidencias;SetPointer(HourGlass!)

ii_fila =1
IF ii_fila > 0 THEN

	fgnu_resetear_s_comunicaciones(gu_comunic)
	gu_comunic.is_comunic.decval1 = dw_1.GetItemDecimal(ii_fila,"codigo")
	gu_comunic.is_comunic.programa_llamante = "w_3107"

	// Abro la ventana de consulta de incidencias
	//gu_comunic.fnu_abrir(w_2038_consulta_incidencias,"w_2038_consulta_incidencias",1,1,w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones")
		Open(w_2038_consulta_incidencias)
ELSE

	gnv_msg.f_mensaje("AM04","","",OK!)	
END IF
gu_comunic.is_comunic.accion_retorno = ''
end event

event ue_avisos;ii_fila =1


IF ii_fila > 0 THEN

	gu_comunic.is_comunic.decval1 = dw_1.GetItemDecimal(ii_fila,"codigo")
	
	IF (gu_comunic.is_comunic.decval1 <> fgcdec_instalacion_eliminadas) AND &
			(dw_1.GetItemDecimal(ii_fila,"instalacion_origen") <> fgcdec_instalacion_eliminadas) THEN

		SetPointer(HourGlass!)
	
		gu_comunic.is_comunic.programa_llamante = "w_3107"
		gu_comunic.is_comunic.accion_llamada = "Consulta"

		//gu_comunic.fnu_abrir(w_2307_consulta_avisos,"w_2307_consulta_avisos",1,1,w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones")
		Open(w_2307_consulta_avisos)
	ELSE
		gnv_msg.f_mensaje("AM13","","",OK!)
	END IF	
ELSE
	gnv_msg.f_mensaje("AM04","","",OK!)
END IF


end event

event ue_ots;ii_fila = 1
IF ii_fila > 0 THEN

	gu_comunic.is_comunic.decval1 = dw_1.GetItemDecimal(ii_fila,"codigo")

	IF (gu_comunic.is_comunic.decval1 <> fgcdec_instalacion_eliminadas) AND &
			(dw_1.GetItemDecimal(ii_fila,"instalacion_origen") <> fgcdec_instalacion_eliminadas) THEN

		SetPointer(HourGlass!)
	
		gu_comunic.is_comunic.programa_llamante = "w_3107"
		gu_comunic.is_comunic.accion_llamada = "Consulta"

		//gu_comunic.fnu_abrir(w_2035_ordenes_trabajo,"w_2035_ordenes_trabajo",1,1,w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones")
		Open(w_2035_ordenes_trabajo)

	ELSE
		gnv_msg.f_mensaje("AM13","","",OK!)
	END IF	
ELSE
	gnv_msg.f_mensaje("AM04","","",OK!)
END IF

gu_comunic.is_comunic.accion_retorno = ''
end event

event ue_acometidas;ii_fila = 1

IF ii_fila > 0 THEN

	gu_comunic.is_comunic.decval1 = dw_1.GetItemDecimal(ii_fila,"codigo")

	IF (gu_comunic.is_comunic.decval1 <> fgcdec_instalacion_eliminadas) AND &
			(dw_1.GetItemDecimal(ii_fila,"instalacion_origen") <> fgcdec_instalacion_eliminadas) THEN

		//SetPointer(HourGlass!)
	
		gu_comunic.is_comunic.programa_llamante = "w_3107"
		gu_comunic.is_comunic.accion_llamada = "Consulta"

		//gu_comunic.fnu_abrir(w_3109_consulta_acometidas,"w_3109_consulta_acometidas",1,1,w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones")
		Open(w_3109_consulta_acometidas)
	ELSE
		gnv_msg.f_mensaje("AM13","","",OK!)
	END IF	
ELSE
	gnv_msg.f_mensaje("AM04","","",OK!)
END IF
gu_comunic.is_comunic.accion_retorno = ''
end event

event ue_suministros;ii_fila = 1

IF ii_fila > 0 THEN
	gu_comunic.is_comunic.decval1 = dw_1.GetItemDecimal(ii_fila,"codigo")

	IF (gu_comunic.is_comunic.decval1 <> fgcdec_instalacion_eliminadas) AND &
			(dw_1.GetItemDecimal(ii_fila,"instalacion_origen") <> fgcdec_instalacion_eliminadas) THEN

		//SetPointer(HourGlass!)
	
		gu_comunic.is_comunic.programa_llamante = "w_3107"
		gu_comunic.is_comunic.accion_llamada = "Consulta"

		//gu_comunic.fnu_abrir(w_3112_lista_consulta_sum,"w_3112_lista_consulta_sum",1,1,w_3107_lista_mante_instalaciones,"w_3107_lista_mante_instalaciones")
		Open(w_3112_lista_consulta_sum)

	ELSE
		gnv_msg.f_mensaje("AM13","","",OK!)
	END IF	
ELSE
	gnv_msg.f_mensaje("AM04","","",OK!)
END IF

gu_comunic.is_comunic.accion_retorno = ''
end event

event ue_crear_inst;datawindowchild ddw_propiedad, ddw_fase
long ll_nueva_fila
long li_nro_centro,li_nro_cmd,li_nro_puesto

	if ib_modificado and This.dw_1.Dataobject= 'd_man_subestac' then // ACO --
		// Recuperamos el $$HEX1$$e100$$ENDHEX$$mbito de la subestaci$$HEX1$$f300$$ENDHEX$$n si se ha modificado
		//ACO--
			li_nro_centro = dw_1.getitemnumber(1,"nro_centro")
			li_nro_cmd = dw_1.getitemnumber(1,"nro_cmd")
			li_nro_puesto = dw_1.getitemnumber(1,"nro_mesa")
			dw_modifi.reset()
			dw_modifi.show()
			dw_modifi.f_insertar_fila()
			dw_modifi.fnu_insertar_datos(li_nro_centro, li_nro_cmd, li_nro_puesto,0)
			st_3.show()
			
			//Conecto las DDDW del objeto "modifi"
			// filtro todos sus campos y seteo a los mismos con todos
			
//			dw_modifi.fpr_crea_dddw()
//			dw_modifi.fnu_filtro_centro()
//			dw_modifi.setitem(1,"nro_centro",li_nro_centro)
//			dw_modifi.fpr_filtro_cmd()
//			dw_modifi.setitem(1,"nro_cmd",li_nro_cmd)
//			dw_modifi.fpr_filtro_mesa()
//			dw_modifi.setitem(1,"nro_mesa",li_nro_puesto)
//			setredraw(true)
			dw_1.setredraw(true)
//			dw_modifi.setredraw(true)
			
	end if // --ACO
	

//	This.dw_modifi.fpr_hab_puesto(This.dw_modifi)
//	This.dw_modifi.fnu_deshab_centro(This.dw_modifi)
//	This.dw_modifi.fnu_deshab_cmd(This.dw_modifi)
	
	CHOOSE CASE This.dw_1.Dataobject
	
		CASE 'd_man_subestac'

				This.st_1.visible = false
				This.dw_1.DataObject = 'd_man_salmt'
			 	gb_2.text= "Alta de Salida de Media Tensi$$HEX1$$f300$$ENDHEX$$n"
		CASE 'd_man_salmt'
	
				This.st_1.visible = true
				This.dw_1.DataObject = 'd_man_ct'
				gb_2.text= "Alta de CT"
		CASE 'd_man_ct'
	
   			This.st_1.visible = false
				This.dw_1.DataObject = 'd_man_trafo_mb'
				gb_2.text= "Alta de Transformador"

		CASE 'd_man_trafo_mb'
			
	         This.st_1.visible = false			
				This.dw_1.DataObject = 'd_man_salbt'
				gb_2.text= "Alta de Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
	END CHOOSE

//Creo un nuevo registro 
This.dw_1.SetTransObject(sqlca)
ll_nueva_fila = This.dw_1.insertrow(0)
This.dw_1.ScrollToRow(ll_nueva_fila )
dw_1.object.bdi_job[1]=0
//Activo el indicador a 2 para saber que es un alta
This.il_modifi = 2

//Obtengo la lista de propiedades
This.dw_1.getchild('propiedad',ddw_propiedad)
ddw_propiedad.settransobject(sqlca)
ddw_propiedad.retrieve()

// Obtengo la lista de fases

if This.dw_1.Dataobject<> 'd_man_subestac' then 
	this.dw_1.getchild('sec_fase',ddw_fase)
	ddw_fase.settransobject(sqlca)
	ddw_fase.retrieve()
end if


//El foco lo recibe el datawindow
This.dw_1.setfocus()
gu_comunic.is_comunic.accion_retorno = ''
end event

event ue_eliminar_inst;long ll_codigo, ll_tvi
long ll_respuesta
long ll_handle
long ll_tipo
long ll_codigo_padre
long handle
long ll_cantidad
long ll_hijo, ll_padre
int  li_resultado
int li_resp
string ls_nombre
string ls_where, ls_tabla
datos_arbol lst_datos 

// se comprueba si el registro est$$HEX2$$e1002000$$ENDHEX$$bloqueado por otro usuario
ll_codigo=dw_1.getitemnumber(dw_1.GetRow(),"codigo")
ls_where = "(CODIGO = " + string(ll_codigo) +")"
CHOOSE CASE dw_1.dataobject
	CASE 'd_man_subestac'
					ls_tabla = "SGD_SUBESTAC"
					ll_tipo= fgci_tipo_subestacion
	CASE 'd_man_salmt'
					ls_tabla = "SGD_SALMT"
					ll_tipo= fgci_tipo_salida_mt
	CASE 'd_man_ct'
					ls_tabla = "SGD_CT"
					ll_tipo= fgci_tipo_ct
	CASE 'd_man_trafo_mb'
					ls_tabla = "SGD_TRAFO_MB"
					ll_tipo= fgci_tipo_transformador
	CASE 'd_man_salbt'
					ls_tabla = "SGD_SALBT"
					ll_tipo= fgci_tipo_salida_de_baja

END CHOOSE
	
IF gnu_u_transaction.uf_lock(THIS, ls_tabla, ls_where) <> 0 THEN			  
	// el registro lo tiene bloqueado otro usuario. No se puede borrar
	RETURN
END IF

treeviewitem le_elemento
handle = This.il_manejador
SetPointer(HourGlass!)

This.tv_1.getitem(handle,le_elemento)

//Comprueba si esa rama ya esta abierta o si esta contraida
//En negativo la abre haciendo un acceso a la B.D.

if le_elemento.Children = true then
	gnv_msg.f_mensaje("EG20","","",Ok!)

	return
end if

// = le_elemento.PictureIndex
lst_datos = le_elemento.data
ll_tipo = lst_datos.ll_tipo
ll_codigo_padre = lst_datos.ll_codigo


if ll_codigo_padre < 1 then 
	return
end if

  SELECT count(*)  
    INTO :ll_cantidad
    FROM "SGD_INTERRUPCION_DESCARGO"  
   WHERE "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" = :ll_codigo_padre   ;

	if ll_cantidad > 0 then
		gnv_msg.f_mensaje("EM45","","",OK!)
		//messagebox("Error","La instalaci$$HEX1$$f300$$ENDHEX$$n tiene un descargo asociado")
		return
	end if

  SELECT count(*)  
    INTO :ll_cantidad
    FROM "GI_AVISOS_INSTALACION"  
   WHERE "GI_AVISOS_INSTALACION"."NRO_INSTALACION" = :ll_codigo_padre   ;

	if ll_cantidad > 0 then
		gnv_msg.f_mensaje("EM46","","",OK!)
		//messagebox("Error","La instalaci$$HEX1$$f300$$ENDHEX$$n tiene avisos pendientes.")
		return
	end if

 SELECT count(*)  
    INTO :ll_cantidad
    FROM "SGD_INCIDENCIA"  
   WHERE "SGD_INCIDENCIA"."NRO_INST_AFECTADA" = :ll_codigo_padre   ;

	if ll_cantidad > 0 then
		gnv_msg.f_mensaje("EM47","","",OK!)
		//messagebox("Error","La instalaci$$HEX1$$f300$$ENDHEX$$n tiene incidencias asociadas.")
		return
	end if


ll_hijo = tv_1.FindItem(CurrentTreeItem! , 0)
ll_padre = tv_1.FindItem(ParentTreeItem!,ll_hijo)
//li_resultado = this.tv_1.SelectItem(ll_hijo)

This.dw_1.setredraw(false)
CHOOSE CASE ll_tipo
	CASE fgci_tipo_subestacion
		DECLARE cu_instala_1 CURSOR FOR 
		SELECT CODIGO, NOMBRE, :fgci_tipo_salida_mt
		FROM SGD_SALMT 
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0
		ORDER BY CODIGO ASC;
	CASE fgci_tipo_salida_mt
		DECLARE cu_instala_2 CURSOR FOR 
		SELECT CODIGO, NOMBRE , :fgci_tipo_ct
		FROM SGD_CT 
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0
		ORDER BY CODIGO ASC;  
	CASE fgci_tipo_ct
      DECLARE cu_instala_3 CURSOR FOR  
      SELECT CODIGO, NOMBRE, :fgci_tipo_transformador
      FROM sgd_TRAFO_MB  
      WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0  
		UNION 
	   SELECT CODIGO, NOMBRE, :fgci_tipo_salida_de_baja
      FROM SGD_SALBT
	   WHERE COD_TRAFO = :ll_codigo_padre AND BDI_JOB=0 
		 ORDER BY CODIGO ASC  ;
	CASE fgci_tipo_transformador
	   DECLARE cu_instala_4 CURSOR FOR  
	   SELECT CODIGO, NOMBRE, :fgci_tipo_salida_de_baja
      FROM SGD_SALBT
	   WHERE COD_TRAFO = :ll_codigo_padre AND BDI_JOB=0  //ACO
		ORDER BY CODIGO ASC  ;
END CHOOSE

//Aqui a$$HEX1$$f100$$ENDHEX$$ade al elemento pinchado que tiene el identificador handle
//los hijos que le correspondan de la tabla inferior

CHOOSE CASE ll_tipo
		
	CASE fgci_tipo_subestacion
		open cu_instala_1;
		fetch cu_instala_1 into :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;

	CASE fgci_tipo_salida_mt
		open cu_instala_2;
		fetch cu_instala_2 into  :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;

	CASE fgci_tipo_ct
		open cu_instala_3;
		fetch cu_instala_3 into  :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;

	CASE fgci_tipo_transformador
		open cu_instala_4;
		fetch cu_instala_4 into :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;

END CHOOSE








do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1 and ll_tipo <> fgci_tipo_salida_de_baja

//	ll_handle = This.tv_1.insertitemfirst(handle,ls_nombre,ll_tipo)
//	This.tv_1.GetItem(ll_handle, le_elemento)
//	lst_datos.ll_codigo = ll_codigo 
//	le_elemento.data = lst_datos
//	This.tv_1.setitem(ll_handle, le_elemento)
//	
	
	le_elemento.label = ls_nombre
	lst_datos.ll_codigo = ll_codigo

	le_elemento.data = lst_datos
	le_elemento.pictureindex = THIS.TV_1.f_icono_arbol(lst_datos.ll_tipo)
	le_elemento.Selectedpictureindex =  THIS.TV_1.f_icono_arbol(lst_datos.ll_tipo)
	

	
	this.TV_1.insertitemsort(handle,le_elemento)


	
	
	

	CHOOSE CASE ll_tipo
		CASE fgci_tipo_subestacion
			fetch cu_instala_1 into :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;
		CASE fgci_tipo_salida_mt
			fetch cu_instala_2 into :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;
		CASE fgci_tipo_ct
			fetch cu_instala_3 into :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;
		CASE fgci_tipo_transformador
			fetch cu_instala_4 into :ll_codigo, :ls_nombre, :lst_datos.ll_tipo;
	END CHOOSE

loop

CHOOSE CASE ll_tipo
	CASE fgci_tipo_subestacion
		close cu_instala_1;
	CASE fgci_tipo_salida_mt
		close cu_instala_2;
	CASE fgci_tipo_ct
		close cu_instala_3;
	CASE fgci_tipo_transformador
		close cu_instala_4;
END CHOOSE
This.tv_1.expandall(handle)
This.dw_1.setredraw(true)

if This.tv_1.finditem(ChildTreeItem!,handle) > 0 then
	gnv_msg.f_mensaje("EG20","","",Ok!)
	return
end if
//CG07

CHOOSE CASE ll_tipo
		CASE fgci_tipo_subestacion
			li_resp = gnv_msg.f_mensaje("CG07","","",YesNo!)
				if li_resp = 2 then
					return
				end if	
		CASE fgci_tipo_salida_mt
			li_resp = gnv_msg.f_mensaje("CG08","","",YesNo!)
				if li_resp = 2 then
					return
				end if	
		CASE fgci_tipo_ct
			li_resp = gnv_msg.f_mensaje("CG09","","",YesNo!)
				if li_resp = 2 then
					return
				end if	
		CASE fgci_tipo_transformador
			li_resp = gnv_msg.f_mensaje("CG10","","",YesNo!)
				if li_resp = 2 then
					return
				end if	
		CASE fgci_tipo_salida_de_baja
			li_resp = gnv_msg.f_mensaje("CG11","","",YesNo!)
				if li_resp = 2 then
					return
				end if	
	END CHOOSE
//choose case gnv_msg.f_mensaje("CG07","","",YesNo!)
//		case 2
//			return
//end choose

CHOOSE CASE ll_tipo
	CASE fgci_tipo_subestacion
		delete from sgd_subestac where codigo = :ll_codigo_padre;
	CASE fgci_tipo_salida_mt
		delete from sgd_salmt where codigo = :ll_codigo_padre;
	CASE fgci_tipo_ct
		delete from sgd_ct where codigo = :ll_codigo_padre;
	CASE fgci_tipo_transformador
		delete from sgd_trafo_mb where codigo = :ll_codigo_padre;
	CASE fgci_tipo_salida_de_baja
		delete from sgd_salbt where codigo = :ll_codigo_padre;
END CHOOSE
//commit;
gnu_u_transaction.uf_commit(THIS)

This.tv_1.deleteitem(handle)	
This.dw_1.reset()
This.dw_modifi.visible = true
This.st_3.visible = true
This.st_2.visible = true
// prueba

//ll_tipo = le_elemento.level

if ll_tipo < fgci_tipo_subestacion or ll_tipo > fgci_tipo_salida_de_baja then
	this.setredraw(true)
	dw_1.setredraw(true)
	dw_modifi.setredraw(true)
	return
end if


CHOOSE CASE ll_tipo - 1
	
	CASE fgci_tipo_subestacion
		
		 this.st_1.visible = true
		 this.dw_1.DataObject = 'd_man_subestac'


	CASE fgci_tipo_salida_mt

 		 this.st_1.visible = false
		 this.dw_1.DataObject = 'd_man_salmt'
		 
	CASE fgci_tipo_ct

		 this.st_1.visible = true
 		 this.dw_1.DataObject = 'd_man_ct'
  		
		
	CASE fgci_tipo_transformador

		 this.st_1.visible = false
 		 this.dw_1.DataObject = 'd_man_trafo_mb'
  		
			
	CASE fgci_tipo_salida_de_baja
		
		 this.st_1.visible = false
 		 this.dw_1.DataObject = 'd_man_salbt'
  		

END CHOOSE
dw_1.SetTransObject(SQLCA)
IF ll_padre <> -1 THEN
	tv_1.getitem(ll_padre,le_elemento)
	
	lst_datos = le_elemento.data
	ll_codigo = lst_datos.ll_codigo 
	dw_1.retrieve(ll_codigo)
	tv_1.selectitem(ll_padre)
	
ELSE
	ll_tvi = tv_1.FindItem(FirstVisibleTreeItem! , 0)
	  if ll_tvi=-1 then 
				tv_1.deleteitem(0)
				dw_1.reset()
				st_1.visible = false
				st_3.visible = false 
				dw_modifi.visible = false
				tv_1.triggerevent("ue_cargar")
	else	
			   tv_1.selectitem(ll_tvi)
				tv_1.getitem(ll_tvi,le_elemento)
				lst_datos = le_elemento.data
				ll_codigo = lst_datos.ll_codigo
				dw_1.retrieve(ll_codigo)
end if	
END IF	
//fin prueba
//This.tv_1.selectitem(1)
gu_comunic.is_comunic.accion_retorno = ''
return
//This.tv_1.selectitem(This.tv_1.finditem(ParentTreeItem!,handle))





end event

event ue_crear_salbaja;datawindowchild ddw_propiedad, ddw_fase
long ll_nueva_fila
long li_nro_centro,li_nro_cmd,li_nro_puesto

	if ib_modificado and This.dw_1.Dataobject= 'd_man_subestac' then // ACO --
		// Recuperamos el $$HEX1$$e100$$ENDHEX$$mbito de la subestaci$$HEX1$$f300$$ENDHEX$$n si se ha modificado
		//ACO--
			li_nro_centro = dw_1.getitemnumber(1,"nro_centro")
			li_nro_cmd = dw_1.getitemnumber(1,"nro_cmd")
			li_nro_puesto = dw_1.getitemnumber(1,"nro_mesa")
			dw_modifi.reset()
			dw_modifi.show()
			dw_modifi.f_insertar_fila()
			dw_modifi.fnu_insertar_datos(li_nro_centro, li_nro_cmd, li_nro_puesto,0)
			st_3.show()
			
			//Conecto las DDDW del objeto "modifi"
			// filtro todos sus campos y seteo a los mismos con todos
			
//			dw_modifi.fpr_crea_dddw()
//			dw_modifi.fnu_filtro_centro()
//			dw_modifi.setitem(1,"nro_centro",li_nro_centro)
//			dw_modifi.fpr_filtro_cmd()
//			dw_modifi.setitem(1,"nro_cmd",li_nro_cmd)
//			dw_modifi.fpr_filtro_mesa()
//			dw_modifi.setitem(1,"nro_mesa",li_nro_puesto)
//			setredraw(true)
			dw_1.setredraw(true)
//			dw_modifi.setredraw(true)
			
	end if // --ACO
	

//	This.dw_modifi.fpr_hab_puesto(This.dw_modifi)
//	This.dw_modifi.fnu_deshab_centro(This.dw_modifi)
//	This.dw_modifi.fnu_deshab_cmd(This.dw_modifi)

	         This.st_1.visible = false			
				This.dw_1.DataObject = 'd_man_salbt'
				gb_2.text= "Alta de Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"


//Creo un nuevo registro 
This.dw_1.SetTransObject(sqlca)
ll_nueva_fila = This.dw_1.insertrow(0)
This.dw_1.ScrollToRow(ll_nueva_fila )
dw_1.object.bdi_job[1]=0
//Activo el indicador a 2 para saber que es un alta
This.il_modifi = 2

//Obtengo la lista de propiedades
This.dw_1.getchild('propiedad',ddw_propiedad)
ddw_propiedad.settransobject(sqlca)
ddw_propiedad.retrieve()

// Obtengo la lista de fases

if This.dw_1.Dataobject<> 'd_man_subestac' then 
	this.dw_1.getchild('sec_fase',ddw_fase)
	ddw_fase.settransobject(sqlca)
	ddw_fase.retrieve()
end if


//El foco lo recibe el datawindow
This.dw_1.setfocus()
gu_comunic.is_comunic.accion_retorno = ''
end event

public function long f_ult_registro (string ls_tabla, long ll_icono, long ll_handle_padre);long ll_numero = 0, ll_codigo, ll_handle
date ld_fecha 
string ls_nombre 
treeviewitem le_elemento, le_padre
long ll_primer_registro

SELECT count(*)
INTO :ll_numero
FROM SGD_CODIGOS
WHERE NOMBRE = :ls_tabla;
					
//Si no encuentra crea el ultimo registro crea uno nuevo con el numero cero como ultimo registro
if ll_numero = 0 then

 	  if ls_tabla = 'sgd_subestac' then
			ll_primer_registro = 19999999
		elseif ls_tabla = 'sgd_salmt' then
			ll_primer_registro = 9999999
		elseif ls_tabla = 'sgd_ct' then
			ll_primer_registro = 39999999
		elseif ls_tabla = 'sgd_trafo_mb' then
			ll_primer_registro = 64999999
		elseif ls_tabla = 'sgd_salbt' then
			ll_primer_registro = 14999999
		end if
		
		
		  INSERT INTO "SGD_CODIGOS"  
         ( "NOMBRE",   
           "CODIGO",   
           "MAXIMO",   
           "CIS" )  
		  VALUES (:ls_tabla,    
            :ll_primer_registro,
           null,   
           null )  ;

		
		
		
end if
											
	//Busca el ultimo y lo a$$HEX1$$f100$$ENDHEX$$ade en uno solo cuando este a$$HEX1$$f100$$ENDHEX$$adiendo 
	
	SELECT codigo
	INTO :ll_numero
	FROM sgd_codigos
	WHERE nombre = :ls_tabla
	FOR UPDATE;  //ACO
	ll_numero ++


//Actualiza la tabla gi_t_ultimo con el nuevo numero de registro

UPDATE "SGD_CODIGOS"  
SET "CODIGO" = :ll_numero  
WHERE "SGD_CODIGOS"."NOMBRE" = :ls_tabla   ;


return ll_numero
end function

public subroutine f_campos_comunes ();long li_centro, li_cmd, li_mesa, ll_codigo
date ld_fecha
long ll_handle_padre, ll_tipo
treeviewitem le_elemento
datos_arbol lst_datos 

ld_fecha = today()
dw_modifi.accepttext()
li_centro = dw_modifi.getitemnumber(1,"nro_centro")
li_cmd = dw_modifi.getitemnumber(1,"nro_cmd")
li_mesa = dw_modifi.getitemnumber(1,"nro_mesa")
if dw_1.dataobject <>  'd_man_ct' then
	dw_1.setitem(1,"descripcion","descr instalaci$$HEX1$$f300$$ENDHEX$$n")
end if	
//dw_1.setitem(1,"potencia_contratada",0)
//dw_1.setitem(1,"cant_clientes",0)
//dw_1.setitem(1,"cant_clientes_imp",0)
dw_1.setitem(1,"programa","W_MAN_INSTA")
dw_1.setitem(1,"nro_centro",li_centro)
dw_1.setitem(1,"nro_cmd",li_cmd)
dw_1.setitem(1,"nro_mesa",li_mesa)
dw_1.setitem(1,"f_actual",today())
dw_1.setitem(1,"usuario",gs_usuario)

//if dw_1.dataobject <>  'd_man_trafo_mb' then  //ACO
dw_1.setitem(1,"bdi_job",0)

if dw_1.dataobject <> 'd_man_subestac' then

	ll_handle_padre = tv_1.finditem(ParentTreeItem!, il_elemento_actual)
	if il_modifi = 2 then
			tv_1.getitem(il_manejador,le_elemento)
	end if
	if il_modifi = 1 and dw_1.dataobject <> 'd_man_subestac' then	
			tv_1.getitem(tv_1.finditem(ParentTreeItem!,il_elemento_actual),le_elemento)
	else
			tv_1.getitem(il_elemento_actual,le_elemento)
	end if
	
	lst_datos = le_elemento.data 
	ll_codigo = lst_datos.ll_codigo 
	
	if dw_1.dataobject <> 'd_man_subestac' AND dw_1.dataobject <> 'd_man_salbt'then	
			dw_1.setitem(1,"instalacion_origen",ll_codigo)
	end if
	if dw_1.dataobject = 'd_man_salbt' then
		
		ll_tipo = long(lst_datos.ll_tipo)
		
		dw_1.setitem(1,"cod_trafo",ll_codigo) // Codigo del trafo o del  CT
		if ll_tipo = fgci_tipo_transformador then 
			tv_1.getitem(tv_1.finditem(ParentTreeItem!,ll_handle_padre),le_elemento) 
			lst_datos = le_elemento.data 
			ll_codigo = lst_datos.ll_codigo// codigo del ct
		end if 
			dw_1.setitem(1,"instalacion_origen",ll_codigo)
	end if	
end if

end subroutine

public function boolean validar_campos (string nombre_data_window);string ls_retorno
long ll_retorno, ll_retorno_2
Decimal ldec_retorno_pot

CHOOSE CASE nombre_data_window
	CASE 'd_man_subestac'
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"nombre")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM48","","",OK!)
				//messagebox("Error","Debe introducir un nombre valido")
				return true
			end if
			
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"propiedad")
			if isnull(ls_retorno) = true or ls_retorno = ""then
				gnv_msg.f_mensaje("EM49","","",OK!)
				//messagebox("Error","Debe introducir una propiedad valida")
				return true
			end if

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"matricula")
			if isnull(ls_retorno) = true or ls_retorno = ""then
				gnv_msg.f_mensaje("EM50","","",OK!)
				//messagebox("Error","Debe introducir una matr$$HEX1$$ed00$$ENDHEX$$cula valida")
				return true
			end if

			ldec_retorno_pot = dw_1.getitemnumber(dw_1.getrow(),"potencia_instalada")
			if isnull(ldec_retorno_pot) = true or ldec_retorno_pot <= 0.0 then
				gnv_msg.f_mensaje("EM51","","",OK!)
				//messagebox("Error","Debe introducir una potencia instalada valida.")
				return true
			end if

		
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"callejero_nom_calle")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM52","","",OK!)
				//messagebox("Error","Debe introducir una direccion valida.")
				return true
			end if
		
		
		
	CASE 'd_man_salmt'
		
		
		
		
			ll_retorno = dw_1.getitemnumber(dw_1.getrow(),"sec_fase")
			if (isnull(ll_retorno) or ll_retorno < 1) then
//				gnv_msg.f_mensaje("EM53","","",OK!)
				messagebox("Error","Debe introducir una fase v$$HEX1$$e100$$ENDHEX$$lida")
				return true
			end if


			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"nombre")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM48","","",OK!)
				//messagebox("Error","Debe introducir un nombre valido")
				return true
			end if

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"matricula")
			if isnull(ls_retorno) = true or ls_retorno = ""then
				gnv_msg.f_mensaje("EM50","","",OK!)
				//messagebox("Error","Debe introducir una matr$$HEX1$$ed00$$ENDHEX$$cula valida")
				return true
			end if

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"propiedad")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM49","","",OK!)
				//messagebox("Error","Debe introducir una propiedad valida")
				return true
			end if


			ldec_retorno_pot = dw_1.getitemnumber(dw_1.getrow(),"potencia_instalada")
			if isnull(ldec_retorno_pot) = true or ldec_retorno_pot <= 0.0 then
				gnv_msg.f_mensaje("EM51","","",OK!)
				//messagebox("Error","Debe introducir una potencia instalada valida")
				return true
			end if

			ll_retorno = dw_1.getitemnumber(dw_1.getrow(),"km_aerea")
			ll_retorno_2 = dw_1.getitemnumber(dw_1.getrow(),"km_subt")
			if (isnull(ll_retorno) = true or ll_retorno < 1) and (isnull(ll_retorno_2) = true or ll_retorno_2 < 1) then
				gnv_msg.f_mensaje("EM53","","",OK!)
				//messagebox("Error","Debe introducir Kil$$HEX1$$f300$$ENDHEX$$metros a$$HEX1$$e900$$ENDHEX$$reos y/o subterr$$HEX1$$e100$$ENDHEX$$neos v$$HEX1$$e100$$ENDHEX$$lidos")
				return true
			end if

	CASE 'd_man_ct'
		
			
			ll_retorno = dw_1.getitemnumber(dw_1.getrow(),"sec_fase")
			if (isnull(ll_retorno) or ll_retorno < 1) then
//				gnv_msg.f_mensaje("EM53","","",OK!)
				messagebox("Error","Debe introducir una fase v$$HEX1$$e100$$ENDHEX$$lida")
				return true
			end if

		

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"nombre")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM48","","",OK!)
				//messagebox("Error","Debe introducir un nombre valido")
				return true
			end if
					
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"matricula")
			if isnull(ls_retorno) = true or ls_retorno = ""then
				gnv_msg.f_mensaje("EM50","","",OK!)
				//messagebox("Error","Debe introducir una matr$$HEX1$$ed00$$ENDHEX$$cula valida")
				return true
			end if

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"propiedad")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM49","","",OK!)
				//messagebox("Error","Debe introducir una propiedad valida")
				return true
			end if
		
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"matricula")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM50","","",OK!)
				//messagebox("Error","Debe introducir una matricula valida")
				return true
			end if

			ldec_retorno_pot = dw_1.getitemnumber(dw_1.getrow(),"potencia_instalada")
			if isnull(ldec_retorno_pot) = true or ldec_retorno_pot <= 0.0 then
				gnv_msg.f_mensaje("EM51","","",OK!)
				//messagebox("Error","Debe introducir una potencia instalada valida")
				return true
			end if

		
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"callejero_nom_calle")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM52","","",OK!)
				//messagebox("Error","Debe introducir una direccion valida")
				return true
			end if
		
		
		
	CASE 'd_man_trafo_mb'
			
					
			ll_retorno = dw_1.getitemnumber(dw_1.getrow(),"sec_fase")
			if (isnull(ll_retorno) or ll_retorno < 1) then
//				gnv_msg.f_mensaje("EM53","","",OK!)
				messagebox("Error","Debe introducir una fase v$$HEX1$$e100$$ENDHEX$$lida")
				return true
			end if

		

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"nombre")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM48","","",OK!)
				//messagebox("Error","Debe introducir un nombre valido")
				return true
			end if

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"matricula")
			if isnull(ls_retorno) = true or ls_retorno = ""then
				gnv_msg.f_mensaje("EM50","","",OK!)
				//messagebox("Error","Debe introducir una matr$$HEX1$$ed00$$ENDHEX$$cula valida")
				return true
			end if

			
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"propiedad")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM49","","",OK!)
				//messagebox("Error","Debe introducir una propiedad valida")
				return true
			end if

			ldec_retorno_pot = dw_1.getitemnumber(dw_1.getrow(),"potencia_instalada")
			if isnull(ldec_retorno_pot) = true or ldec_retorno_pot <= 0.0 then
				gnv_msg.f_mensaje("EM51","","",OK!)
				//messagebox("Error","Debe introducir una potencia instalada valida")
				return true
			end if

	CASE 'd_man_salbt'
		
		
					
			ll_retorno = dw_1.getitemnumber(dw_1.getrow(),"sec_fase")
			if (isnull(ll_retorno) or ll_retorno < 1) then
//				gnv_msg.f_mensaje("EM53","","",OK!)
				messagebox("Error","Debe introducir una fase v$$HEX1$$e100$$ENDHEX$$lida")
				return true
			end if

		

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"nombre")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM48","","",OK!)
				//messagebox("Error","Debe introducir un nombre valido")
				return true
			end if
			
			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"matricula")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM50","","",OK!)
				//messagebox("Error","Debe introducir una matr$$HEX1$$ed00$$ENDHEX$$cula valida")
				return true
			end if

			ls_retorno = dw_1.getitemstring(dw_1.getrow(),"propiedad")
			if isnull(ls_retorno) = true or ls_retorno = "" then
				gnv_msg.f_mensaje("EM49","","",OK!)
				//messagebox("Error","Debe introducir una propiedad valida")
				return true
			end if

END CHOOSE

return false
end function

public function boolean fnu_valida_ambito (ref datawindow dw);long ll_centro, ll_cmd, ll_mesa

if dw.rowcount() > 0 then
	ll_centro = dw.getitemnumber(1,"nro_centro")
	ll_cmd = dw.getitemnumber(1,"nro_cmd")
	ll_mesa = dw.getitemnumber(1,"nro_mesa")
	if ll_centro = 0 or ll_cmd = 0 or ll_mesa = 0 then
		gnv_msg.f_mensaje("EM54","","",OK!)
		//messagebox("Error","Debe seleccionar un centro, cmd y mesa valido")
		dw.setfocus()
		Return False
	end if
end if
Return True
end function

public function boolean f_ambitos_iguales (datawindow dw1, datawindow dw2);// Compara el ambito del filtro de instalaciones (dw1) y el centro,cmd y puesto de
// una subestaci$$HEX1$$f300$$ENDHEX$$n (dw2) para saber cuando tiene que aparecer en el $$HEX1$$e100$$ENDHEX$$rbol.
boolean retorno=false
long ll_centro1, ll_cmd1, ll_mesa1
long ll_centro2, ll_cmd2, ll_mesa2

if dw1.rowcount() > 0 and dw2.rowcount()>0 then
	ll_centro1 = dw1.getitemnumber(1,"nro_centro")
	ll_cmd1 = dw1.getitemnumber(1,"nro_cmd")
	ll_mesa1 = dw1.getitemnumber(1,"nro_mesa")

	ll_centro2 = dw2.getitemnumber(1,"nro_centro")
	ll_cmd2 = dw2.getitemnumber(1,"nro_cmd")
	ll_mesa2 = dw2.getitemnumber(1,"nro_mesa")
   retorno=ll_centro1=0 or ( ll_centro1=ll_centro2 and ll_cmd1=0) or &
	  ( ll_centro1=ll_centro2 and ll_cmd1=ll_cmd2 and ll_mesa1=0) or &
	( ll_centro1=ll_centro2 and ll_cmd1=ll_cmd2 and ll_mesa1=ll_mesa2)
end if
return retorno
end function

public subroutine f_cargar_datos_direccion ();//*******************************************************************
//Esta funci$$HEX1$$f300$$ENDHEX$$n obtiene la provincia, el departamento,municipio y localidad
// de la instalacion si lo tiene o del usuario.

long ll_nro_calle

if gu_comunic.is_comunic.intval1=0 or  Isnull( gu_comunic.is_comunic.intval1)  then // La instalaci$$HEX1$$f300$$ENDHEX$$n no lo tiene 
	// Se obtiene del usuario
	gu_comunic.is_comunic.intval1=gi_cod_provincia
	gu_comunic.is_comunic.intval2=gi_cod_departamento
	gu_comunic.is_comunic.longval4=gl_cod_municipio
	gu_comunic.is_comunic.longval5=gl_cod_localidad
	gu_comunic.is_comunic.strval1=gs_provincia
	gu_comunic.is_comunic.strval2=gs_departamento	
	gu_comunic.is_comunic.strval3=gs_municipio
	gu_comunic.is_comunic.strval4=gs_localidad
	parmstr6=""
	parmstr7=""
	parmstr8=""
else // Si lo tiene
	
  SELECT "PROVINCIAS"."NOM_PROV"  
    INTO :gu_comunic.is_comunic.strval1
    FROM "PROVINCIAS"  
   WHERE "PROVINCIAS"."COD_PROV" = :gu_comunic.is_comunic.intval1;

  SELECT "DEPTOS"."NOM_DEPTO"  
    INTO :gu_comunic.is_comunic.strval2
    FROM "DEPTOS"  
   WHERE "DEPTOS"."COD_DEPTO" = :gu_comunic.is_comunic.intval2;
	
  SELECT "MUNICIPIOS"."NOM_MUNIC"  
    INTO :gu_comunic.is_comunic.strval3
    FROM "MUNICIPIOS"  
   WHERE "MUNICIPIOS"."COD_MUNIC" = :gu_comunic.is_comunic.longval4;
	
   SELECT "LOCALIDADES"."NOM_LOCAL"  
    INTO :gu_comunic.is_comunic.strval4
    FROM "LOCALIDADES"  
   WHERE "LOCALIDADES"."COD_LOCAL" = :gu_comunic.is_comunic.longval5;
	
	ll_nro_calle=	dw_1.GetItemNumber(1,"nro_calle")
	if dw_1.dataobject = 'd_man_ct' then
		parmstr7=string(dw_1.getitemNumber(1,"num_puerta"))
	else
		parmstr7=string(dw_1.getitemNumber(1,"nro_puerta"))
	end if
	parmstr8=dw_1.getitemstring(1,"duplicador")
	select nom_calle 
	into :parmstr6 
	from callejero
	where Cod_calle = :ll_nro_calle;
	
		
end if
end subroutine

public subroutine fw_habilitar_campos (datawindow pdw_data, boolean pb_habilita);///////////////////////////////////////////////////////////////////////////
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
long			ll_color
string ls_respuesta

//													
//Seg$$HEX1$$fa00$$ENDHEX$$n el modo pasado como parametro	
//													
if pb_habilita then
	li_modo = 0
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ll_color = rgb(255,255,255)
	ll_color = long(gs_blanco)
// Fin. Sgo.
	st_1.enabled=true
else
	li_modo = 1
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ll_color = rgb(192,192,192)	
	ll_color = long(gs_gris)
// Fin. Sgo.
	st_1.enabled=false
end if

	li_num_cols = integer(pdw_data.object.DataWindow.Column.Count)
	for li_contador = 1 to li_num_cols
		ls_respuesta = dw_1.Describe("#" + string(li_contador) +".TabSequence")
		if ls_respuesta<>"0" then 
				pdw_data.Modify("#" + string(li_contador) + ".protect = " + string(li_modo))
  				pdw_data.Modify("#" + string(li_contador) + ".background.color = " + string(ll_color))		
			END IF
		NEXT


end subroutine

public function integer fw_expande_rama (long pl_codigo_instalacion);long ll_codigo
long ll_padres[]
int li_num_padres=0, i
long ll_tvi
int li_nivel=0
long ll_bdijob
treeviewitem lt_item
datastore lds_lista_padres
long ll_candidato_padre,ll_busqueda
lds_lista_padres= create datastore
lds_lista_padres.dataobject='d_lista_padres'
lds_lista_padres.settransobject(sqlca)
lds_lista_padres.retrieve(pl_codigo_instalacion, fgcdec_aviso_con_alimentacion)

ll_candidato_padre=pl_codigo_instalacion
ll_busqueda=pl_codigo_instalacion
for i=1 to lds_lista_padres.rowcount()
	if lds_lista_padres.getitemnumber(i,"co_nivel")<>li_nivel then  //DISTINTO NIVEL
	   ll_busqueda=ll_candidato_padre
		ll_codigo=lds_lista_padres.getitemnumber(i,"nro_instalacion")
		if ll_codigo=ll_candidato_padre then
				li_nivel=lds_lista_padres.getitemnumber(i,"co_nivel")
				li_num_padres=li_num_padres+1
				ll_padres[li_num_padres]=ll_codigo
				ll_candidato_padre=lds_lista_padres.getitemnumber(i,"nro_inst_padre")
		end if
	else
		ll_bdijob=lds_lista_padres.getitemnumber(i,"bdi_job") 
		if ll_bdijob>0  then // ELEGIMOS ESTA INSTALACION
			ll_codigo=lds_lista_padres.getitemnumber(i,"nro_instalacion")
			if ll_busqueda=ll_codigo then
				ll_padres[li_num_padres]=lds_lista_padres.getitemnumber(i,"nro_instalacion")
				ll_candidato_padre=lds_lista_padres.getitemnumber(i,"nro_inst_padre")
			end if
		end if
	end if 
next


destroy lds_lista_padres

if li_num_padres=0 then return 0

//

tv_1.deleteitem(0)
tv_1.triggerevent("ue_cargar")





ll_tvi = tv_1.FindItem(roottreeitem!, 0)


do 
DO
	tv_1.GetItem(ll_tvi,lt_item )
  if 	long(lt_item.data)=ll_padres[li_num_padres] then exit
	ll_tvi = tv_1.FindItem(NextTreeItem!, ll_tvi)	
LOOP UNTIL ll_tvi=-1   
if ll_tvi=-1 then // NO ENCONTRADO
	return 0
else // ENCONTRADO
	tv_1.triggerEvent(DoubleClicked!,0,ll_tvi)
	//tv_1.ExpandItem(ll_tvi)
	if li_num_padres=1 then tv_1.Selectitem(ll_tvi)
	ll_tvi=tv_1.FindItem(ChildTreeItem!, ll_tvi)	
end if
li_num_padres=li_num_padres - 1 
loop until li_num_padres=0


return  1


end function

public function integer f_nivel (long pl_codigo);//Devuelve el nivel del arbol correspondiente a cada instalacion

if isvalid(onis) then 
CHOOSE CASE pl_codigo
	CASE onis.CTM // TRAMO MEDIA
		return 3
	CASE onis.CTB  // TRAMO BAJA
		return 6	
	CASE onis.CSUB
		return 1
	CASE onis.CSMT
		return 2
	CASE onis.CCT
		return 3
	CASE onis.CTRM
		return 4
	CASE onis.CSBT
		return 5
	CASE ELSE
       return 0
END CHOOSE
else 
	return 0
end if
end function

public function string wf_tabla ();	string ls_tabla

	CHOOSE CASE dw_1.dataobject
		CASE 'd_man_subestac'
						ls_tabla = "SGD_SUBESTAC"
		CASE 'd_man_salmt'
						ls_tabla = "SGD_SALMT"
		CASE 'd_man_ct'
						ls_tabla = "SGD_CT"
		CASE 'd_man_trafo_mb'
						ls_tabla = "SGD_TRAFO_MB"
		CASE 'd_man_salbt'
						ls_tabla = "SGD_SALBT"
		CASE 'd_man_tramo'
						ls_tabla = "SGD_TRAMO"
		CASE 'd_man_tramo_bt'
				ls_tabla = "SGD_TRAMO_BT"
	END CHOOSE
	
	return ls_tabla

end function

public function string wf_clave ();	return "(CODIGO = " + string(dw_1.GetItemNumber(dw_1.GetRow(),'codigo')) +")"
	

end function

public function datetime wf_timestamp (); 	return dw_1.GetItemDateTime(dw_1.GetRow(),'f_actual')

end function

public function boolean fw_padre_valido (long pl_padre, long pl_class_id_hijo);long ll_class_id_padre


if isvalid(onis) then
	ll_class_id_padre= onis.of_busca_class_id(pl_padre)
	
	CHOOSE CASE pl_class_id_hijo
			
	CASE  onis.CSUB // SUBESTACION
		return true
	
	CASE onis.CACO  // ACOMETIDA
		 if ll_class_id_padre = onis.CSBT then
			return true
		else
			return false
		end if	
	
   CASE onis.CTRM  // TRAFO DE MEDIA
		if ll_class_id_padre= onis.CCT or ll_class_id_padre= onis.CCD then
			return true
		else
			return false
		end if	
					
	CASE onis.CSBT  // SALIDA DE BAJA
		 if ll_class_id_padre = onis.CTRM then
			return true
		else
			return false
		end if	
			
	CASE onis.CSMT  //SALIDA DE MEDIA
		if ll_class_id_padre= onis.CSUB or ll_class_id_padre= onis.CCT or ll_class_id_padre= onis.CCD then 
			return true
		else
			return false
		end if
		
		
	CASE onis.CCD, onis.CCT  //CTS
		 if ll_class_id_padre = onis.CSMT then
			return true
		else
			return false
		end if
		
	CASE onis.CTB  // TRAMO DE BAJA
		 if ll_class_id_padre = onis.CSBT then
			return true
		else
			return false
		end if	
			
	CASE onis.CTM  // TRAMO DE MEDIA
		 if ll_class_id_padre = onis.CSMT then
			return true
		else
			return false
		end if	
		
		
END CHOOSE

	
	
	
	
	
	
	
end if








return false
end function

on w_man_instalacion.create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.dw_2=create dw_2
this.gb_1=create gb_1
this.cb_1=create cb_1
this.st_2=create st_2
this.st_3=create st_3
this.tv_1=create tv_1
this.dw_modifi=create dw_modifi
this.dw_ambito=create dw_ambito
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_2=create gb_2
this.Control[]={this.cb_cancelar,&
this.cb_aceptar,&
this.dw_2,&
this.gb_1,&
this.cb_1,&
this.st_2,&
this.st_3,&
this.tv_1,&
this.dw_modifi,&
this.dw_ambito,&
this.st_1,&
this.dw_1,&
this.gb_2}
end on

on w_man_instalacion.destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.dw_2)
destroy(this.gb_1)
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.tv_1)
destroy(this.dw_modifi)
destroy(this.dw_ambito)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_2)
end on

event open;window w_ventana
w_ventana= this
//FG_COLOCAR_VENTANA_MAIN(w_ventana)

setpointer(HourGlass!)

if gb_bdi and gb_hay_sesion  then
		this.ChangeMenu(md_lista_mante)
   	this.visible=true
		im_menu=this.MenuId
else
	this.visible=true
end if


dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)		
//	dw_ambito.fnu_filtro_cmd_n() 
//	dw_ambito.fnu_habi_cmd()
//	
//	dw_ambito.modify("nro_mesa.background.color="+gs_blanco)
//	dw_ambito.modify("nro_mesa.protect=0")
	

il_abierta = 1

// SI HAY ONIS SE DESHABILITA EL DRAGDROP

tv_1.DisableDragDrop= gb_bdi

if gb_bdi then 
	if gb_hay_sesion then
			ib_saliendo=false
		 im_menu.fm_salir_trabajo(true)
		 im_menu.m_consultar.visible=true
       im_menu.m_consultar.m_grafico.visible=true
		 cb_aceptar.enabled=false
		 cb_cancelar.enabled=false
//       md_lista_mante.m_consultar.m_grafico.toolbaritemvisible=true
//		 md_lista_mante.m_consultar.m_grafico.m_ventanagrfica.toolbaritemvisible=true
//		 md_lista_mante.m_consultar.m_grafico.m_localizacion.toolbaritemvisible=true
//		 md_lista_mante.m_consultar.m_grafico.m_selecciondecapas.toolbaritemvisible=true
//		 md_lista_mante.m_consultar.m_grafico.m_quitarblink.toolbaritemvisible=true
//       md_lista_mante.m_consultar.m_grafico.m_gestion.toolbaritemvisible=true
	 cb_1.visible=false
	
   else  
	   //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Por el momento no es posible mostrar informaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica, $$HEX1$$bf00$$ENDHEX$$desea continuar?",Information!,YesNo!)=2 then 
  	   if gnv_msg.f_mensaje("CD01","","",YesNo!) = 2 then 
//	      timer(0)	
		   close(this)
			return
	    end if	  
   end if 
 
end if
	// SI NO HAY PERMISOS DE MANTENIMIENTO
	if gu_perfiles.of_acceso_perfil(gi_perfil,'RED_ACCESO','ACC_MANTEN')=0 then
	if gb_hay_sesion then
		md_lista_mante.m_consultar.m_grafico.m_gestion.enabled=false
	end if
		cb_1.visible=false
		cb_aceptar.visible = false
		cb_cancelar.visible = false
	end if

end event

event activate;yield()
if gb_bdi then 
	if gb_hay_sesion  then
		fg_mostrar(false)
	end if
end if
end event

event closequery;button bu_botones
bu_botones = YesNoCancel!


if gb_bdi and gb_hay_sesion  then
	
	
if ib_modificado or im_menu.ib_modificaciones then
	ib_saliendo=true
	choose case gnv_msg.f_mensaje("CG01","","",YesNoCancel!)
		case 1
		if ib_modificado then 
		if ib_busqueda_padre and dw_1.dataobject<>'d_man_subestac' and il_padre=0 then // DEBE MARCAR AL PADRE
		gnv_msg.f_mensaje("AX05","","",Ok!)
			return 1
		end if
		
		dw_1.accepttext()	
		if validar_campos(dw_1.dataobject) = true then
			return 1
		end if
	
		
		
		
			cb_aceptar.triggerEvent(clicked!)
		end if
		if im_menu.ib_modificaciones then im_menu.f_graba_cambios() 			
		case 3
			return 1
		case 2
		if ib_modificado then 	cb_cancelar.triggerEvent(clicked!)
		if im_menu.ib_modificaciones then onis.of_abandona()
			
	end choose
end if	
if onis.trabajo<>-1 then onis.of_sal_trabajo()	
	
	
	
	
	
else

// mensaje, Existen cambios sin grabar, desea hacerlo
tv_1.setredraw(true)
This.setredraw(true)

if ib_modificado = true then

	choose case gnv_msg.f_mensaje("CG01","","",YesNoCancel!)
		case 1
			dw_1.accepttext()	
			if validar_campos(dw_1.dataobject) = true then
				return 1
			end if
			cb_aceptar.triggerEvent(clicked!)
			close(this)
		case 3
			return 1
		case 2
			//rollback;
			gnu_u_transaction.uf_rollback(THIS)
			close(this)
	//		close(This)
	end choose

end if
end if
end event

event close;gnu_u_transaction.uf_rollback(THIS)
DESTROY iu_gen_comunic
end event

type cb_cancelar from commandbutton within w_man_instalacion
integer x = 2519
integer y = 1656
integer width = 407
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancelar"
end type

event clicked;treeviewitem le_elemento
long ll_codigo, ll_padre, ll_tipo, ll_fila
int li_nro_centro, li_nro_cmd, li_nro_puesto
string ls_nombre
datos_arbol lst_datos 



if gb_hay_sesion then
	
		ib_busqueda_padre=false
		dw_1.setredraw(false)
		dw_1.Reset()
		tv_1.deleteitem(0)
		tv_1.triggerevent("ue_cargar")
		fw_habilitar_campos(dw_1,false)
		cb_aceptar.enabled=false
		cb_cancelar.enabled=false
		dw_1.setredraw(true)
		ib_modificado=false
else  // SIN ONIS
	

ll_fila = dw_1.getrow()
if ll_fila = 0 then
	return
end if

gnu_u_transaction.uf_rollback(PARENT)	

// El $$HEX1$$e100$$ENDHEX$$rbol y el bot$$HEX1$$f300$$ENDHEX$$n de agregar permanecen habilitados
il_modifi = 0
ib_modificado=false //ACO
Parent.tv_1.enabled = enabled
Parent.cb_1.enabled = enabled

// Localiza al padre de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada
//ll_padre = tv_1.FindItem(ParentTreeItem!,il_nuevo_handle) ACO

// Si la instalaci$$HEX1$$f300$$ENDHEX$$n existe, recupera los datos de la misma y 
// a qu$$HEX2$$e9002000$$ENDHEX$$tipo pertenece

IF tv_1.FindItem(RootTreeItem!, 0) <> -1 THEN
	IF il_nuevo_handle > 0  THEN
		tv_1.getitem(il_nuevo_handle,le_elemento)
		lst_datos = le_elemento.data 
		ll_codigo = lst_datos.ll_codigo 
		ll_tipo = lst_datos.ll_tipo
		
		CHOOSE CASE ll_tipo
		
		CASE fgci_tipo_subestacion
			
			 Parent.st_1.visible = true
			 Parent.dw_1.DataObject = 'd_man_subestac'
			 ls_nombre= "Subestaci$$HEX1$$f300$$ENDHEX$$n"
	
		CASE fgci_tipo_salida_mt
	
			 Parent.st_1.visible = false
			 Parent.dw_1.DataObject = 'd_man_salmt'
			 ls_nombre= "Salida de Media Tensi$$HEX1$$f300$$ENDHEX$$n"		 
			 
		CASE fgci_tipo_ct
	
			 Parent.st_1.visible = true
			 Parent.dw_1.DataObject = 'd_man_ct'
			 ls_nombre= "CT"
			
		CASE fgci_tipo_transformador
	
			 Parent.st_1.visible = false
			 Parent.dw_1.DataObject = 'd_man_trafo_mb'
			 ls_nombre= "Transformador"
				
		CASE fgci_tipo_salida_de_baja
			
			 Parent.st_1.visible = false
			 Parent.dw_1.DataObject = 'd_man_salbt'
			 ls_nombre= "Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
	
		END CHOOSE
	//
		Parent.dw_1.SetTransObject(SQLCA)
		Parent.dw_1.retrieve(ll_codigo)
		tv_1.setitem(il_nuevo_handle,le_elemento)
	// Si la instalaci$$HEX1$$f300$$ENDHEX$$n todav$$HEX1$$ed00$$ENDHEX$$a no se hab$$HEX1$$ed00$$ENDHEX$$a dado de alta,
	// 
		long ll_num
		ll_num = dw_1.RowCount()
		IF ll_num = 0 THEN
				IF ll_tipo < fgci_tipo_subestacion or ll_tipo > fgci_tipo_salida_de_baja then // Arbol estaba vacio //ACO
					tv_1.deleteitem(0)
					dw_1.reset()
					st_1.visible = false
					st_3.visible = false 
					dw_modifi.visible = false
					//Parent.dw_ambito.fpr_hab_centro(Parent.dw_ambito)
					//Parent.dw_modifi.fpr_hab_centro(Parent.dw_modifi)
					tv_1.triggerevent("ue_cargar")
					return
				END IF
	
				CHOOSE CASE ll_tipo
		
					CASE fgci_tipo_subestacion 
			
						Parent.st_1.visible = true
						 Parent.dw_1.DataObject = 'd_man_subestac'
						 ls_nombre= "Subestaci$$HEX1$$f300$$ENDHEX$$n"
				
					CASE fgci_tipo_salida_mt
				
						 Parent.st_1.visible = false
						 Parent.dw_1.DataObject = 'd_man_salmt'
						 ls_nombre= "Salida de Media Tensi$$HEX1$$f300$$ENDHEX$$n"		 
						 
					CASE fgci_tipo_ct
				
						 Parent.st_1.visible = true
						 Parent.dw_1.DataObject = 'd_man_ct'
						 ls_nombre= "CT"
						
					CASE fgci_tipo_transformador 
				
						 Parent.st_1.visible = false
						 Parent.dw_1.DataObject = 'd_man_trafo_mb'
						 ls_nombre= "Transformador"
							
					CASE fgci_tipo_salida_de_baja
						
						 Parent.st_1.visible = false
						 Parent.dw_1.DataObject = 'd_man_salbt'
						 ls_nombre= "Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
				
				END CHOOSE
	
				  
				// Recupera los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n pinchada en el $$HEX1$$e100$$ENDHEX$$rbol
	
	
				tv_1.getitem(il_nuevo_handle,le_elemento)
				Parent.dw_1.SetTransObject(SQLCA)
				lst_datos = le_elemento.data 
				ll_codigo = lst_datos.ll_codigo 
				dw_1.retrieve(ll_codigo)
				
			END IF
		END IF
		ls_nombre = ls_nombre + " - " + le_elemento.label
		gb_2.text= ls_nombre
		//ACO--
		li_nro_centro = Parent.dw_1.getitemnumber(1,"nro_centro")
		li_nro_cmd = Parent.dw_1.getitemnumber(1,"nro_cmd")
		li_nro_puesto = Parent.dw_1.getitemnumber(1,"nro_mesa")
		
		
		
		Parent.dw_modifi.reset()
		Parent.dw_modifi.show()
		Parent.dw_modifi.f_insertar_fila()
		Parent.st_3.show()
		
		//Conecto las DDDW del objeto "modifi"
		// filtro todos sus campos y seteo a los mismos con todos
		
		Parent.dw_modifi.fpr_crea_dddw()
		Parent.dw_modifi.fnu_insertar_datos(li_nro_centro, li_nro_cmd, li_nro_puesto, 0)
		//Parent.dw_modifi.fnu_filtro_centro()
		//Parent.dw_modifi.setitem(1,"nro_centro",li_nro_centro)
		//Parent.dw_modifi.fpr_filtro_cmd()
		//Parent.dw_modifi.setitem(1,"nro_cmd",li_nro_cmd)
		//Parent.dw_modifi.fpr_filtro_mesa()
		//Parent.dw_modifi.setitem(1,"nro_mesa",li_nro_puesto)
		if ll_tipo = fgci_tipo_subestacion then
					
				Parent.dw_modifi.fpr_hab_centro(Parent.dw_modifi)
				Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
				Parent.dw_modifi.fnu_deshab_puesto(Parent.dw_modifi)		 
		
		else
		
				Parent.dw_modifi.fnu_deshab_centro(Parent.dw_modifi)
				Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
				Parent.dw_modifi.fpr_hab_puesto(Parent.dw_modifi)		 
			
		end if
		
	ELSE
		dw_1.reset()
		st_1.visible = False
		gb_2.Text=""
	END IF	
	
	Parent.setredraw(true)
	dw_1.setredraw(true)
	dw_modifi.setredraw(true)
	
	Parent.dw_ambito.fnu_habilitar_campos()	
	
end if	
end event

type cb_aceptar from commandbutton within w_man_instalacion
integer x = 1801
integer y = 1656
integer width = 407
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ace&ptar"
end type

event clicked;string ls_nombre
long ll_codigo
int li_retorno, li_estado
long ll_fila = 0
long ll_aux, ll_tv
treeviewitem le_elemento
long li_centro, li_cmd, li_mesa
date ld_fecha
DatawindowChild ddw_propiedad, ddw_fase
Decimal ll_pot_contratada
long ll_cli, ll_cli_imp
string ls_texto

if gb_hay_sesion then
dw_1.accepttext()	
if validar_campos(dw_1.dataobject) = true then
	return
end if
if fnu_valida_ambito(dw_modifi) = False then
	return
end if
	
	ib_busqueda_padre=false
	
if isvalid(onis) then
	if onis.instalaciones[1].class_mem=0 then // ALTA
		li_retorno=onis.of_ult_codigo(onis.instalaciones[1].class_id,ll_codigo)
		if li_retorno=1 then  //OK
		  onis.instalaciones[1].class_mem=ll_codigo
		  li_estado=32
		else
				gnv_msg.f_mensaje("EX35","","",Ok!)		
				cb_aceptar.enabled=false
				cb_cancelar.enabled=false
				dw_1.setredraw(false)
				dw_1.Reset()
				tv_1.deleteitem(0)
				tv_1.triggerevent("ue_cargar")
				fw_habilitar_campos(dw_1,false)
				dw_1.setredraw(true)
				ib_modificado=false
				return
		end if
	else  // MODIFICACIONES
		li_estado=64
		onis.instalaciones[1].class_id=onis.of_busca_class_id(onis.instalaciones[1].class_mem)
	end if
	li_retorno=onis.of_bloquea_elto(onis.instalaciones[1].class_id,onis.instalaciones[1].class_mem,li_estado)
	if li_retorno=1 then //OK BLOQUEO


		ld_fecha = today()
		dw_modifi.accepttext()
		li_centro = dw_modifi.getitemnumber(1,"nro_centro")
		li_cmd = dw_modifi.getitemnumber(1,"nro_cmd")
		li_mesa = dw_modifi.getitemnumber(1,"nro_mesa")
		if dw_1.dataobject <>  'd_man_tramo_bt' and dw_1.dataobject <>  'd_man_ct' and  dw_1.dataobject <>  'd_man_tramo'  then
			dw_1.setitem(1,"descripcion","descr instalaci$$HEX1$$f300$$ENDHEX$$n")
		end if	
		
//		if dw_1.dataobject <>  'd_man_tramo' and dw_1.dataobject <>  'd_man_tramo_bt'  then
//			dw_1.setitem(1,"potencia_contratada",0)
//			dw_1.setitem(1,"cant_clientes",0)
//			dw_1.setitem(1,"cant_clientes_imp",0)
//		end if
		if dw_1.dataobject <>  'd_man_tramo_bt' then 
				dw_1.setitem(1,"nro_centro",li_centro)
				dw_1.setitem(1,"nro_cmd",li_cmd)
				dw_1.setitem(1,"nro_mesa",li_mesa)
		else
			
		end if

		dw_1.setitem(1,"f_actual",today())
		dw_1.setitem(1,"usuario",gs_usuario)
		dw_1.setitem(1,"programa","W_MAN_INSTA")
		dw_1.Setitem(1,"bdi_job",onis.trabajo)
		dw_1.Setitem(1,"statflg",li_estado)
		dw_1.setitem(1,"codigo",onis.instalaciones[1].class_mem)
		dw_1.setitem(1,"class_id",onis.instalaciones[1].class_id)
		if dw_1.dataobject <>  'd_man_tramo_bt' and dw_1.dataobject <>  'd_man_tramo' then //  POTENCIAS
			ll_pot_contratada = dw_1.getitemnumber(1,"pot_contratada")
			ll_cli = dw_1.getitemnumber(1,"cant_cli")
			ll_cli_imp = dw_1.getitemnumber(1,"can_cli_imp")
		end if
		if onis.instalaciones[1].class_id=onis.CSUB then // SUBESTACION
 			dw_1.setitem(1,"instalacion_origen",fgcdec_aviso_con_alimentacion)
		elseif onis.instalaciones[1].class_id=onis.CSBT then  // SBT
					  dw_1.setitem(1,"cod_trafo",il_padre)
					  SELECT "SGD_TRAFO_MB"."INSTALACION_ORIGEN"  
							  INTO :il_padre
							FROM "SGD_TRAFO_MB"  
						WHERE "SGD_TRAFO_MB"."CODIGO" = :il_padre;
					dw_1.setitem(1,"instalacion_origen",il_padre)				
		elseif onis.instalaciones[1].class_id=onis.CTB then // TRAMO DE BAJA			
			dw_1.setitem(1,"esta_en1",il_padre)
		else			
			dw_1.setitem(1,"instalacion_origen",il_padre)
		end if
				
		if dw_1.Update()=1   THEN
			//COMMIT;
			gnu_u_transaction.uf_commit(PARENT)
			
			//ACTUALIZAMOS EL TEXTO
		if onis.instalaciones[1].class_id=onis.CSUB or onis.instalaciones[1].class_id=onis.CCT then
			ls_texto=dw_1.getitemstring(1,"nombre")
			if not (isnull(ls_texto) or ls_texto="") then 	onis.of_actualiza_texto(onis.instalaciones[1].class_id,onis.instalaciones[1].class_mem,"nombre",ls_texto)
			ls_texto=dw_1.getitemstring(1,"matricula")
			if not (isnull(ls_texto) or ls_texto="") then	onis.of_actualiza_texto(onis.instalaciones[1].class_id,onis.instalaciones[1].class_mem,"matricula",ls_texto)
		end if	
		
		if li_estado=64  and dw_1.dataobject <>  'd_man_tramo_bt' and dw_1.dataobject <>  'd_man_tramo' then // MODIFICACION -- > ACTUALIZO LAS POTENCIAS
			  UPDATE "SGD_INSTALACION"  
		     SET "POT_CONTRATADA" = :ll_pot_contratada,   
      	   "CANT_CLI" = :ll_cli,   
         	"CAN_CLI_IMP" = :ll_cli_imp  
			   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :onis.instalaciones[1].class_mem;
				//COMMIT;
				gnu_u_transaction.uf_commit(PARENT)
		end if 
		ELSE
   			//ROLLBACK;
				gnu_u_transaction.uf_rollback(PARENT)
				// No se pudo grabar la modificacion
				gnv_msg.f_mensaje("EX06","","",Ok!)		
				onis.of_desbloquea_elto(onis.instalaciones[1].class_id,onis.instalaciones[1].class_mem,li_estado)
				dw_1.setredraw(false)
				dw_1.Reset()
				tv_1.deleteitem(0)
				tv_1.triggerevent("ue_cargar")
				fw_habilitar_campos(dw_1,false)
				ib_modificado=false
				cb_aceptar.enabled=false
				cb_cancelar.enabled=false
				dw_1.setredraw(true)
				return
		END IF
	else  // ERROR AL BLOQUEAR
//				messagebox("Aviso","No se puede bloquear la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada")
				gnv_msg.f_mensaje("EX36","","",Ok!)		
				dw_1.setredraw(false)
				tv_1.deleteitem(0)
				tv_1.triggerevent("ue_cargar")
				fw_habilitar_campos(dw_1,false)
				dw_1.setredraw(true)
				cb_aceptar.enabled=false
				cb_cancelar.enabled=false
				ib_modificado=false
				return 
	end if
	dw_1.setredraw(false)
	tv_1.deleteitem(0)
	tv_1.triggerevent("ue_cargar")
	fw_habilitar_campos(dw_1,false)
	fw_expande_rama(onis.instalaciones[1].class_mem)
	dw_1.setredraw(true)
	cb_aceptar.enabled=false
	cb_cancelar.enabled=false
	ib_modificado=false
	if ib_saliendo then return  // SI SE ESTA SALIENDO DE LA VENTANA O EL TRABAJO NO SE PREGUNTA
		
	 //if Messagebox("Aviso","$$HEX1$$bf00$$ENDHEX$$Desea dar de alta otra instalaci$$HEX1$$f300$$ENDHEX$$n del mismo tipo?",Information!,YesNo!)=1 then 
	 if li_estado=32 then  // ALTA 
		 if gnv_msg.f_mensaje("IX10","","",YesNo!)=1 then 
   	
			li_centro = w_man_instalacion.dw_1.getitemnumber(1,"nro_centro")
			li_cmd = w_man_instalacion.dw_1.getitemnumber(1,"nro_cmd")
			li_mesa = w_man_instalacion.dw_1.getitemnumber(1,"nro_mesa")
			w_man_instalacion.dw_modifi.reset()
			w_man_instalacion.dw_modifi.show()
			w_man_instalacion.dw_modifi.f_insertar_fila()
			w_man_instalacion.st_3.show()
			
			//Conecto las DDDW del objeto "modifi"
			// filtro todos sus campos y seteo a los mismos con todos
			
			w_man_instalacion.dw_modifi.fpr_crea_dddw()
			//w_man_instalacion.dw_modifi.fnu_filtro_centro()
			//w_man_instalacion.dw_modifi.setitem(1,"nro_centro",li_centro)
			//w_man_instalacion.dw_modifi.fpr_filtro_cmd()
			//w_man_instalacion.dw_modifi.setitem(1,"nro_cmd",li_cmd)
			//w_man_instalacion.dw_modifi.fpr_filtro_mesa()
			//w_man_instalacion.dw_modifi.setitem(1,"nro_mesa",li_mesa)
			Parent.dw_modifi.fnu_insertar_datos(li_centro, li_cmd, li_mesa, 0)
			w_man_instalacion.setredraw(true)
			w_man_instalacion.dw_1.setredraw(true)
			w_man_instalacion.dw_modifi.setredraw(true)
			
			if onis.instalaciones[1].class_id=onis.CSUB then // SUBESTACION
					w_man_instalacion.dw_modifi.fpr_deshab_puesto(w_man_instalacion.dw_modifi)
					w_man_instalacion.dw_modifi.fpr_hab_centro(w_man_instalacion.dw_modifi)
					w_man_instalacion.dw_modifi.fnu_deshab_cmd(w_man_instalacion.dw_modifi)
			else
					w_man_instalacion.dw_modifi.fpr_hab_puesto(w_man_instalacion.dw_modifi)
					w_man_instalacion.dw_modifi.fnu_deshab_centro(w_man_instalacion.dw_modifi)
					w_man_instalacion.dw_modifi.fnu_deshab_cmd(w_man_instalacion.dw_modifi)
			
			end if
			onis.instalaciones[1].class_mem=0
			CHOOSE CASE onis.instalaciones[1].class_id
				CASE onis.CSUB  // SUBESTACION
				  w_man_instalacion.st_1.visible = true
				  w_man_instalacion.st_1.bringtotop = true
				  w_man_instalacion.dw_1.DataObject = 'd_man_subestac'
				  w_man_instalacion.gb_2.text = "Subestaci$$HEX1$$f300$$ENDHEX$$n"
				  w_man_instalacion.cb_aceptar.enabled=true
				  w_man_instalacion.ib_busqueda_padre=true
				  w_man_instalacion.cb_cancelar.enabled=true 
   			CASE onis.CSMT
					w_man_instalacion.st_1.visible = false
					w_man_instalacion.dw_1.DataObject = 'd_man_salmt'
				   w_man_instalacion.gb_2.text = "Salida Media Tensi$$HEX1$$f300$$ENDHEX$$n" 	
					w_man_instalacion.ib_busqueda_padre=true

			   CASE onis.CCT
					w_man_instalacion.st_1.visible = true
					w_man_instalacion.st_1.bringtotop = true
					w_man_instalacion.dw_1.DataObject = 'd_man_ct'
				   w_man_instalacion.gb_2.text = "Centro de Transformaci$$HEX1$$f300$$ENDHEX$$n"
					w_man_instalacion.ib_busqueda_padre=true

				CASE onis.CTRM
					w_man_instalacion.st_1.visible = false
					w_man_instalacion.dw_1.DataObject = 'd_man_trafo_mb'
				   w_man_instalacion.gb_2.text = "Transformador Media - Baja"
					w_man_instalacion.ib_busqueda_padre=true

				CASE onis.CSBT
					w_man_instalacion.st_1.visible = false
					w_man_instalacion.dw_1.DataObject = 'd_man_salbt'
				   w_man_instalacion.gb_2.text = "Salida Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
					w_man_instalacion.ib_busqueda_padre=true

				CASE onis.CTM
				w_man_instalacion.st_1.visible = false
				w_man_instalacion.dw_1.DataObject = 'd_man_tramo'
			   w_man_instalacion.gb_2.text = "Tramo de media"
				w_man_instalacion.ib_busqueda_padre=true

				CASE onis.CTB
				w_man_instalacion.st_1.visible = false
				w_man_instalacion.dw_1.DataObject = 'd_man_tramo_bt'
			   w_man_instalacion.gb_2.text = "Tramo de baja"
				w_man_instalacion.ib_busqueda_padre=true



			END CHOOSE
			w_man_instalacion.dw_1.getchild('propiedad',ddw_propiedad)
			ddw_propiedad.settransobject(sqlca)
			ddw_propiedad.retrieve()
						
			w_man_instalacion.dw_1.getchild('sec_fase',ddw_fase)
			ddw_fase.settransobject(sqlca)
			ddw_fase.retrieve()				
			
			w_man_instalacion.dw_1.setredraw(true)
			w_man_instalacion.dw_1.settransObject(sqlca)
			w_man_instalacion.fw_habilitar_campos(w_man_instalacion.dw_1,true)
			w_man_instalacion.il_modifi=2
			w_man_instalacion.dw_1.InsertRow(0)
			w_man_instalacion.tv_1.deleteitem(0)
			w_man_instalacion.tv_1.triggerEvent("ue_cargar")
			ib_modificado=true
			w_man_instalacion.il_padre=0
			w_man_instalacion.dw_1.setfocus()
			w_man_instalacion.cb_cancelar.enabled=true
			
		 end if
	end if

end if
	
	
	
	
	
	
else  // SIN ONIS
		
ll_fila = dw_1.getrow()
if ll_fila = 0 then
	return
end if
ll_aux=il_modifi
dw_1.accepttext()

if validar_campos(dw_1.dataobject) = true then
	return
end if
if fnu_valida_ambito(dw_modifi) = False then
	return
end if


if il_modifi = 2 and dw_1.dataobject = 'd_man_subestac' then

	dw_1.setitem(1,"instalacion_origen",fgcdec_aviso_con_alimentacion)

end if

if il_modifi > 0 then

	ib_mismo_ambito=f_ambitos_iguales(dw_ambito,dw_modifi)
	// Si estamos modificando que es cuando il_modifi vale 1 solo se cambia la label de la rama

	if il_modifi = 1 then
		ls_nombre = dw_1.GetItemString(1,"nombre")
		tv_1.getitem(il_elemento_actual,le_elemento)
		le_elemento.label = ls_nombre
		tv_1.setitem(il_elemento_actual,le_elemento)
	end if
	
	Parent.triggerevent("grabar_modificacion")
  // No debe aparecer en el $$HEX1$$e100$$ENDHEX$$rbol si es de otro ambito.
	if  ll_aux>0 and dw_1.dataobject="d_man_subestac"	and not 	ib_mismo_ambito then
		  tv_1.deleteitem(il_elemento_actual)
		  ll_tv = tv_1.FindItem(CurrentTreeItem! , 0)
		  // Si el arbol es vacio provocamos el ue_cargar // ACO
		  if ll_tv=-1 then 
				tv_1.deleteitem(0)
				dw_1.reset()
				st_1.visible = false
				st_3.visible = false 
				dw_modifi.visible = false
				tv_1.triggerevent("ue_cargar")
		
		end if
		end if 		 
	
	Parent.dw_ambito.fnu_habilitar_campos()
//	Parent.dw_ambito.fpr_hab_centro(Parent.dw_ambito)
	
end if
end if
end event

type dw_2 from u_lista_tramos within w_man_instalacion
boolean visible = false
integer x = 1285
integer y = 624
integer width = 2043
integer height = 904
integer taborder = 40
boolean vscrollbar = true
end type

event clicked;call super::clicked;//Obtiene el codigo del tramo seleccionado

long ll_marcada
long i

this.selectrow(0,false)

if row > 0 then

	this.selectrow(row,true)
	ll_marcada = dw_2.getselectedrow(0)
	
	gl_instalacion_afectada = long(this.getitemdecimal(ll_marcada,"codigo"))

end if
end event

type gb_1 from groupbox within w_man_instalacion
integer x = 183
integer y = 156
integer width = 1042
integer height = 1380
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = " Instalaciones"
end type

type cb_1 from commandbutton within w_man_instalacion
integer x = 206
integer y = 1656
integer width = 800
integer height = 108
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Crear Subestaci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;datawindowchild ddw_propiedad
long ll_nueva_fila

gnu_u_transaction.uf_rollback(PARENT)
Parent.dw_ambito.fnu_deshab_centro(Parent.dw_ambito)
Parent.dw_ambito.fnu_deshab_cmd(Parent.dw_ambito)
Parent.dw_ambito.fnu_deshab_puesto(Parent.dw_ambito)		 
Parent.tv_1.enabled = false
Parent.cb_1.enabled = false

gb_2.text= "Alta de Subestaci$$HEX1$$f300$$ENDHEX$$n"
Parent.dw_modifi.reset()
Parent.dw_modifi.show()
Parent.dw_modifi.f_insertar_fila()
Parent.st_3.show()

//Conecto las DDDW del objeto "modifi"
// filtro todos sus campos y seteo a los mismos con todos

Parent.dw_modifi.fpr_crea_dddw()
Parent.dw_modifi.fnu_filtro_centro()
Parent.dw_modifi.setitem(1,"nro_centro",gi_nro_centro)
Parent.dw_modifi.fpr_filtro_cmd()
Parent.dw_modifi.setitem(1,"nro_cmd",gi_nro_cmd)
Parent.dw_modifi.fpr_filtro_mesa()
Parent.dw_modifi.setitem(1,"nro_mesa",gi_nro_puesto)

Parent.st_1.visible = true
Parent.dw_1.DataObject = 'd_man_subestac'	
Parent.dw_1.SetTransObject(sqlca)
ll_nueva_fila = Parent.dw_1.insertrow(0)
Parent.dw_1.ScrollToRow(ll_nueva_fila )

//Activo el indicador a 2 para saber que es un alta
Parent.il_modifi = 2

//Obtengo la lista de propiedades
Parent.dw_1.getchild('propiedad',ddw_propiedad)
ddw_propiedad.settransobject(sqlca)
ddw_propiedad.retrieve()

//El foco lo recibe el datawindow
Parent.dw_1.setfocus()
end event

type st_2 from statictext within w_man_instalacion
integer x = 1326
integer y = 152
integer width = 795
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = " Filtro de Instalaciones "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_man_instalacion
integer x = 2414
integer y = 140
integer width = 805
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = " $$HEX1$$c100$$ENDHEX$$mbito de Instalaci$$HEX1$$f300$$ENDHEX$$n "
alignment alignment = center!
boolean focusrectangle = false
end type

type tv_1 from uo_man_instalac within w_man_instalacion
event ue_cargar ( )
integer x = 219
integer y = 228
integer width = 997
integer height = 1212
integer taborder = 20
string dragicon = "Drag1pg.ico"
boolean bringtotop = true
fontcharset fontcharset = ansi!
long backcolor = 81324524
boolean linesatroot = true
boolean hideselection = false
grsorttype sorttype = ascending!
string picturename[] = {"subest.bmp","sal_tra1.bmp","ct1.bmp","TRANSFOR.bmp","salbaj.bmp","tsubest.bmp","tsal_tra1.bmp","tct1.bmp","ttransfo.bmp","tsalbaj.bmp"}
end type

event ue_cargar;
long ll_codigo
long ll_handle, ll_tvi,ll_bdijob
long ll_bdi
string ls_nombre
treeviewitem le_elemento
datos_arbol lst_datos


//Establece el ambito de busqueda a todos los centros, cmds y mesas la primera vez que se abre la ventana
//gb_1.visible= true
//gb_2.visible= true
Parent.dw_ambito.accepttext()
parent.setredraw(FALSE)
Parent.st_2.show()

// Comprueba que la B.D.I. no este instalada

// Carga el treeview con el primer nivel que son las subestaciones
// Selecciona un cursor u otro dependiendo de la variable il_tipo_ambito
// Si il_tipo_ambito = 0 trae todos
// Si es 1 trae los del centro
// Si es 2 trae los del centro y cmd
// Si es 3 trae los del centro, cmd y puesto

if il_tipo_ambito = 0 then

 if not gb_hay_sesion then
 DECLARE cu_subestac_0 CURSOR FOR  
 SELECT "SGD_SUBESTAC"."CODIGO",   
        "SGD_SUBESTAC"."NOMBRE"  ,
		    "BDI_JOB"
		  
 FROM "SGD_SUBESTAC"  
 WHERE BDI_JOB=0 //ACO	
 ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
 
else
 DECLARE cub_subestac_0 CURSOR FOR  
 SELECT "CODIGO",   
        "NOMBRE",
		  "BDI_JOB"
 FROM "SGD_SUBESTAC" SGD_SUBESTACA
 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
 ORDER BY "NOMBRE" ASC  ;
end if
 
 
 

 elseif il_tipo_ambito = 1 then
     if not gb_hay_sesion then
		DECLARE cu_subestac_1 CURSOR FOR  
      SELECT "SGD_SUBESTAC"."CODIGO",   
             "SGD_SUBESTAC"."NOMBRE",
				 BDI_JOB
      FROM "SGD_SUBESTAC"  
		WHERE "NRO_CENTRO" = :il_centro	and BDI_JOB=0		//ACO
      ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
	else
 DECLARE cub_subestac_1 CURSOR FOR  
 SELECT "CODIGO",   
        "NOMBRE",
		  "BDI_JOB"
 FROM "SGD_SUBESTAC" SGD_SUBESTACA
 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
	 and "NRO_CENTRO" = :il_centro
 ORDER BY "NOMBRE" ASC  ;

end if

		elseif il_tipo_ambito = 2 then
         if not gb_hay_sesion then
				DECLARE cu_subestac_2 CURSOR FOR  
				SELECT "SGD_SUBESTAC"."CODIGO",   
				       "SGD_SUBESTAC"."NOMBRE"  ,
						 BDI_JOB
				FROM "SGD_SUBESTAC"  
		 		WHERE  "NRO_CMD" = :il_cmd
				 and BDI_JOB=0		//ACO
				ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
			else
				 DECLARE cub_subestac_2 CURSOR FOR  
			 	SELECT "CODIGO",   
      	  "NOMBRE",
			  "BDI_JOB"
			 FROM "SGD_SUBESTAC" SGD_SUBESTACA
			 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
				 and "NRO_CMD" = :il_cmd
				 ORDER BY "NOMBRE" ASC  ;
			 end if
						
				else
	         if not gb_hay_sesion then	
					DECLARE cu_subestac_3 CURSOR FOR  
					SELECT "SGD_SUBESTAC"."CODIGO",   
					       "SGD_SUBESTAC"."NOMBRE" ,
							 BDI_JOB
					FROM "SGD_SUBESTAC"  
		 		   WHERE "NRO_CENTRO" = :il_centro and "NRO_CMD" = :il_cmd and "NRO_MESA" = :il_puesto
								and BDI_JOB=0		//ACO				 
					ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
					
				else 
			 DECLARE cub_subestac_3 CURSOR FOR  
			 	SELECT "CODIGO",   
      	  "NOMBRE",
			  "BDI_JOB"
			 FROM "SGD_SUBESTAC" SGD_SUBESTACA
			 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
				 and "NRO_CENTRO" = :il_centro and "NRO_CMD" = :il_cmd and "NRO_MESA" = :il_puesto
				 ORDER BY "NOMBRE" ASC  ;
	
			end if		
					
					
					
					
end if

if il_tipo_ambito = 0 then	
   if not gb_hay_sesion then	
		open cu_subestac_0;
		fetch cu_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
	else
		open cub_subestac_0;
		fetch cub_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
	end if	
		
		elseif il_tipo_ambito = 1 then
	   if not gb_hay_sesion then	
			open cu_subestac_1;
			fetch cu_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
		else
			open cub_subestac_1;
			fetch cub_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
		end if
			elseif il_tipo_ambito = 2 then
				if not gb_hay_sesion then	
					open cu_subestac_2;
					fetch cu_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					open cub_subestac_2;
					fetch cub_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if

				else

				if not gb_hay_sesion then	
					open cu_subestac_3;
					fetch cu_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					open cub_subestac_3;
					fetch cub_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if

end if

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
//	dw_modifi.visible = true
//	st_3.visible = true
//	st_3.bringtotop = true
   if isnull(ls_nombre) then ls_nombre=""
	IF gb_hay_sesion and ll_bdijob>0 then 
		ll_handle = this.insertitemsort(0,ls_nombre,6)		
	else
		ll_handle = this.insertitemsort(0,ls_nombre,1)		
	end if


	this.GetItem(ll_handle, le_elemento)
	lst_datos.ll_codigo = ll_codigo 
	lst_datos.ll_tipo = fgci_tipo_subestacion 
	le_elemento.data = lst_datos
	le_elemento.pictureindex = f_icono_arbol(lst_datos.ll_tipo)
	le_elemento.selectedpictureindex = f_icono_arbol(lst_datos.ll_tipo)
	
	if gb_hay_sesion and ll_bdijob>0 then 
			le_elemento.pictureindex = f_icono_arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
			le_elemento.selectedpictureindex = f_icono_arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
	end if
	
	
	
	
	this.setitem(ll_handle, le_elemento)
	
	
	
	
	
	
if il_tipo_ambito = 0 then	
				if not gb_hay_sesion then 
					fetch cu_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					fetch cub_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if
			elseif il_tipo_ambito = 1 then
				if not gb_hay_sesion then 
					fetch cu_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					fetch cub_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if

					elseif il_tipo_ambito = 2 then
						if not gb_hay_sesion then 
							fetch cu_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
						else
							fetch cub_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
						end if
						else
							if not gb_hay_sesion then 
								fetch cu_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
							else
								fetch cub_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
							end if

	end if
loop

if il_tipo_ambito = 0 then	
	if not gb_hay_sesion then 
		close cu_subestac_0;
	else
		close cub_subestac_0;
	end if
	elseif il_tipo_ambito = 1 then
		if not gb_hay_sesion then 
			close cu_subestac_1;
		else
			close cub_subestac_1;
		end if

		elseif il_tipo_ambito = 2 then
			if not gb_hay_sesion then 
				close cu_subestac_2;
			else
				close cub_subestac_2;
			end if

			else
			if not gb_hay_sesion then 
				close cu_subestac_3;
			else
				close cub_subestac_3;
			end if

end if

parent.setredraw(TRUE)

if ll_codigo = 0 then
	gb_2.text=""
//	gb_1.visible=false
//	gb_2.visible= false
	gnv_msg.f_mensaje("AM46","","",OK!)

	return
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No existen instalaciones para el $$HEX1$$e100$$ENDHEX$$mbito seleccionado", exclamation!)
end if	
	

ll_tvi = tv_1.FindItem(FirstVisibleTreeItem! , 0)
tv_1.selectitem(ll_tvi)
end event

event selectionchanged;long ll_tipo
long li_nro_centro, li_nro_cmd, li_nro_puesto
string ls_nombre
long row
treeviewitem le_elemento
long ll_codigo
long ll_respuesta
datos_arbol lst_datos

il_nuevo_handle = newhandle

//SetPointer(HourGlass!)

this.getitem(newhandle,le_elemento)

IF isnull(le_elemento.DATA) THEN return -1

lst_datos = le_elemento.data


//Comprueba si esa rama ya esta abierta o si esta contraida
//En negativo la abre haciendo un acceso a la B.D.

ll_tipo = lst_datos.ll_tipo
ii_tipo=ll_tipo

gl_instalacion_afectada = lst_datos.ll_codigo

if gb_hay_sesion then
	
	select tipo_instalacion into :ll_tipo from sgd_instalacion where nro_instalacion =  :gl_instalacion_afectada;
	
	if onis.trabajo=-1 and isvalid(im_menu) then
	if ll_tipo=fgci_tipo_salida_mt  or ll_tipo=fgci_tipo_salida_de_baja then // SALMT or SALBT
		im_menu.fm_listado_tramos(true)
	if im_menu.m_consultar.m_listadodetramos.checked then im_menu.m_consultar.m_listadodetramos.triggerEvent(Clicked!)	
	else
		if im_menu.m_consultar.m_listadodetramos.checked then 
			im_menu.m_consultar.m_listadodetramos.triggerEvent(Clicked!)
		end if
		im_menu.fm_listado_tramos(false)
	end if
 end  if	
end if




// SI hay sesion y se esta navegando para buscar el padre no se carga los datos en la datawindow
if  not ib_busqueda_padre then 



if ll_tipo < fgci_tipo_subestacion  or ll_tipo > fgci_tipo_salida_de_baja then
	Parent.setredraw(true)
	dw_1.setredraw(true)
	dw_modifi.setredraw(true)
	return
end if
dw_1.setredraw(false)

CHOOSE CASE ll_tipo
	
	CASE fgci_tipo_subestacion
		
		 Parent.st_1.visible = true
		 Parent.dw_1.DataObject = 'd_man_subestac'
		 ls_nombre= "Subestaci$$HEX1$$f300$$ENDHEX$$n"

	CASE fgci_tipo_salida_mt

 		 Parent.st_1.visible = false
		 Parent.dw_1.DataObject = 'd_man_salmt'
		 ls_nombre= "Salida de Media Tensi$$HEX1$$f300$$ENDHEX$$n"		 
	CASE fgci_tipo_ct

		 Parent.st_1.visible = true
 		 Parent.dw_1.DataObject = 'd_man_ct'
  		 ls_nombre= "CT"
		
	CASE fgci_tipo_transformador

		 Parent.st_1.visible = false
 		 Parent.dw_1.DataObject = 'd_man_trafo_mb'
  		 ls_nombre= "Transformador"
			
	CASE fgci_tipo_salida_de_baja
		
		 Parent.st_1.visible = false
 		 Parent.dw_1.DataObject = 'd_man_salbt'
  		 ls_nombre= "Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"

END CHOOSE

Parent.il_elemento_actual = newhandle
ie_data = newhandle
Parent.dw_1.SetTransObject(SQLCA)
lst_datos = le_elemento.data 

ll_codigo = lst_datos.ll_Codigo
ls_nombre = ls_nombre + " - " + le_elemento.label
gb_2.text= ls_nombre

ll_respuesta = Parent.dw_1.retrieve(ll_codigo)

if gb_hay_sesion then	fw_habilitar_campos(dw_1,true)

row = Parent.dw_1.getrow()

if row > 0 then
	
		li_nro_centro = Parent.dw_1.getitemnumber(row,"nro_centro")
		li_nro_cmd = Parent.dw_1.getitemnumber(row,"nro_cmd")
		li_nro_puesto = Parent.dw_1.getitemnumber(row,"nro_mesa")

end if

Parent.dw_modifi.reset()
Parent.dw_modifi.show()
Parent.dw_modifi.f_insertar_fila()
Parent.st_3.show()

//Conecto las DDDW del objeto "modifi"
// filtro todos sus campos y seteo a los mismos con todos

Parent.dw_modifi.fpr_crea_dddw()
Parent.dw_modifi.fnu_insertar_datos(li_nro_centro, li_nro_cmd, li_nro_puesto, 0)
//Parent.dw_modifi.fnu_filtro_centro()
//Parent.dw_modifi.setitem(1,"nro_centro",li_nro_centro)
//Parent.dw_modifi.fpr_filtro_cmd()
//Parent.dw_modifi.setitem(1,"nro_cmd",li_nro_cmd)
//Parent.dw_modifi.fpr_filtro_mesa()
//Parent.dw_modifi.setitem(1,"nro_mesa",li_nro_puesto)

if gb_bdi then
	if onis.trabajo=-1 then // NO ESTA MODIFICANDO
		Parent.dw_modifi.fnu_deshab_centro(Parent.dw_modifi)
		Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
		Parent.dw_modifi.fpr_deshab_puesto(Parent.dw_modifi)		 
	else
		if ll_tipo = fgci_tipo_subestacion  or ll_tipo=fgci_tipo_acometida  then
				
			Parent.dw_modifi.fpr_hab_centro(Parent.dw_modifi)
			Parent.dw_modifi.fnu_hab_cmd(Parent.dw_modifi)
			Parent.dw_modifi.fnu_deshab_puesto(Parent.dw_modifi)		 
	
		else
	
			Parent.dw_modifi.fnu_deshab_centro(Parent.dw_modifi)
			Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
			Parent.dw_modifi.fpr_hab_puesto(Parent.dw_modifi)		 
		end if
			
				
	end if

else // SI NO HAY GRAFICA SE PERMITE MODIFICAR EL AMBITO SI HAY ACCESO
	
	
	if gu_perfiles.of_acceso_perfil(gi_perfil,'RED_ACCESO','ACC_MANTEN')=0 then
		fw_habilitar_campos(dw_1,false)	
		Parent.dw_modifi.fnu_deshab_centro(Parent.dw_modifi)
		Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
		Parent.dw_modifi.fpr_deshab_puesto(Parent.dw_modifi)		 
					
	
	else  // MANTENIMIENTO PERMITIDO
	if ll_tipo = fgci_tipo_subestacion  or ll_tipo=fgci_tipo_acometida  then
			
		Parent.dw_modifi.fpr_hab_centro(Parent.dw_modifi)
		Parent.dw_modifi.fnu_hab_cmd(Parent.dw_modifi)
		Parent.dw_modifi.fnu_deshab_puesto(Parent.dw_modifi)		 

	else

		Parent.dw_modifi.fnu_deshab_centro(Parent.dw_modifi)
		Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
		Parent.dw_modifi.fpr_hab_puesto(Parent.dw_modifi)		 
	end if
end if
end if
Parent.setredraw(true)
dw_1.setredraw(true)
dw_modifi.setredraw(true)
if gb_hay_sesion then fw_habilitar_campos(dw_1,false)
end if
end event

event constructor;call super::constructor;long ll_codigo
long ll_bdijob
string ls_nombre
datos_arbol lst_datos
treeviewitem le_elemento
setpointer(HourGlass!)

//Establece el ambito de busqueda a todos los centros, cmds y mesas la primera vez que se abre la ventana
if il_abierta = 0 then
		il_centro = gi_nro_centro
		il_cmd = gi_nro_cmd
		il_puesto = gi_nro_puesto
		//Parent.dw_ambito.reset()
		//Parent.dw_ambito.show()
//		Parent.dw_ambito.fpr_crea_dddw()
//		Parent.dw_ambito.f_insertar_fila()
//		Parent.dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)
//		Parent.dw_ambito.fpr_crea_dddw()
//		Parent.dw_ambito.fnu_filtro_centro()
//		Parent.dw_ambito.setitem(1,"nro_centro",gi_nro_centro)
//		Parent.dw_ambito.fpr_filtro_cmd()
//		Parent.dw_ambito.setitem(1,"nro_cmd",gi_nro_cmd)
//		Parent.dw_ambito.fpr_filtro_mesa()
//		Parent.dw_ambito.setitem(1,"nro_mesa",gi_nro_puesto)
//		Parent.dw_ambito.fnu_deshab_cmd(Parent.dw_ambito)
//		Parent.dw_ambito.fnu_deshab_puesto(Parent.dw_ambito)		 
//		Parent.dw_ambito.fpr_hab_centro(Parent.dw_ambito)
end if

il_tipo_ambito = 3
Parent.dw_ambito.accepttext()
Parent.st_2.show()
Parent.st_3.show()

//// Comprueba que la B.D.I. no este instalada
//SELECT "SGD_PARAMETROS"."VALOR"  
// INTO :ll_bdi  
// FROM "SGD_PARAMETROS"  
//WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = 3   ;
//if ll_bdi = 1 then
//	Parent.dw_1.enabled = false
//end if



// Carga el treeview con el primer nivel que son las subestaciones
// Selecciona un cursor u otro dependiendo de la variable il_tipo_ambito
// Si il_tipo_ambito = 0 trae todos
// Si es 1 trae los del centro
// Si es 2 trae los del centro y cmd
// Si es 3 trae los del centro, cmd y puesto

if il_tipo_ambito = 0 then

 if not gb_hay_sesion then
 DECLARE cu_subestac_0 CURSOR FOR  
 SELECT "SGD_SUBESTAC"."CODIGO",   
        "SGD_SUBESTAC"."NOMBRE"  ,
		    "BDI_JOB"
		  
 FROM "SGD_SUBESTAC"  
 WHERE BDI_JOB=0 //ACO	
 ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
 
else
 DECLARE cub_subestac_0 CURSOR FOR  
 SELECT "CODIGO",   
        "NOMBRE",
		  "BDI_JOB"
 FROM "SGD_SUBESTAC" SGD_SUBESTACA

 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
 ORDER BY "NOMBRE" ASC  ;
end if
 
 
 

 elseif il_tipo_ambito = 1 then
     if not gb_hay_sesion then
		DECLARE cu_subestac_1 CURSOR FOR  
      SELECT "SGD_SUBESTAC"."CODIGO",   
             "SGD_SUBESTAC"."NOMBRE",
				 BDI_JOB
      FROM "SGD_SUBESTAC"  
		WHERE "NRO_CENTRO" = :il_centro	and BDI_JOB=0		//ACO
      ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
	else
 DECLARE cub_subestac_1 CURSOR FOR  
 SELECT "CODIGO",   
        "NOMBRE",
		  "BDI_JOB"
 FROM "SGD_SUBESTAC" SGD_SUBESTACA
 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
	 and "NRO_CENTRO" = :il_centro
 ORDER BY "NOMBRE" ASC  ;

end if

		elseif il_tipo_ambito = 2 then
         if not gb_hay_sesion then
				DECLARE cu_subestac_2 CURSOR FOR  
				SELECT "SGD_SUBESTAC"."CODIGO",   
				       "SGD_SUBESTAC"."NOMBRE"  ,
						 BDI_JOB
				FROM "SGD_SUBESTAC"  
		 		WHERE "NRO_CENTRO" = :il_centro and "NRO_CMD" = :il_cmd
				 and BDI_JOB=0		//ACO
				ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
			else
				 DECLARE cub_subestac_2 CURSOR FOR  
			 	SELECT "CODIGO",   
      	  "NOMBRE",
			  "BDI_JOB"
			 FROM "SGD_SUBESTAC" SGD_SUBESTACA
			 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
				 and "NRO_CENTRO" = :il_centro and "NRO_CMD" = :il_cmd
				 ORDER BY "NOMBRE" ASC  ;
			 end if
						
				else
	         if not gb_hay_sesion then	
					DECLARE cu_subestac_3 CURSOR FOR  
					SELECT "SGD_SUBESTAC"."CODIGO",   
					       "SGD_SUBESTAC"."NOMBRE" ,
							 BDI_JOB
					FROM "SGD_SUBESTAC"  
		 		   WHERE "NRO_CENTRO" = :il_centro and "NRO_CMD" = :il_cmd and "NRO_MESA" = :il_puesto
								and BDI_JOB=0		//ACO				 
					ORDER BY "SGD_SUBESTAC"."NOMBRE" ASC  ;
					
				else 
			 DECLARE cub_subestac_3 CURSOR FOR  
			 	SELECT "CODIGO",   
      	  "NOMBRE",
			  "BDI_JOB"
			 FROM "SGD_SUBESTAC" SGD_SUBESTACA
			 WHERE "BDI_JOB" = (SELECT MAX(BDI_JOB) FROM SGD_SUBESTAC	WHERE SGD_SUBESTACA.CODIGO=CODIGO)
				 and "NRO_CENTRO" = :il_centro and "NRO_CMD" = :il_cmd and "NRO_MESA" = :il_puesto
				 ORDER BY "NOMBRE" ASC  ;
	
			end if		
					
					
					
					
end if

if il_tipo_ambito = 0 then	
   if not gb_hay_sesion then	
		open cu_subestac_0;
		fetch cu_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
	else
		open cub_subestac_0;
		fetch cub_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
	end if	
		
		elseif il_tipo_ambito = 1 then
	   if not gb_hay_sesion then	
			open cu_subestac_1;
			fetch cu_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
		else
			open cub_subestac_1;
			fetch cub_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
		end if
			elseif il_tipo_ambito = 2 then
				if not gb_hay_sesion then	
					open cu_subestac_2;
					fetch cu_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					open cub_subestac_2;
					fetch cub_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if

				else

				if not gb_hay_sesion then	
					open cu_subestac_3;
					fetch cu_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					open cub_subestac_3;
					fetch cub_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if

end if

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
	lst_datos.ll_codigo = ll_codigo
	lst_datos.ll_tipo = fgci_tipo_subestacion
	le_elemento.data = lst_datos
	le_elemento.label = ls_nombre
	le_elemento.pictureindex = f_icono_Arbol(lst_datos.ll_tipo)
	le_elemento.selectedpictureindex = f_icono_Arbol(lst_datos.ll_tipo)
	IF gb_hay_sesion and ll_bdijob>0 then 
		le_elemento.pictureindex=f_icono_Arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
     	le_elemento.selectedpictureindex = 	f_icono_Arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
	end if
	tv_1.insertitemsort(0,le_elemento)
	
	if il_tipo_ambito = 0 then	
				if not gb_hay_sesion then 
					fetch cu_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					fetch cub_subestac_0 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if
			elseif il_tipo_ambito = 1 then
				if not gb_hay_sesion then 
					fetch cu_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
				else
					fetch cub_subestac_1 into :ll_codigo, :ls_nombre,:ll_bdijob;
				end if

					elseif il_tipo_ambito = 2 then
						if not gb_hay_sesion then 
							fetch cu_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
						else
							fetch cub_subestac_2 into :ll_codigo, :ls_nombre,:ll_bdijob;
						end if
						else
							if not gb_hay_sesion then 
								fetch cu_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
							else
								fetch cub_subestac_3 into :ll_codigo, :ls_nombre,:ll_bdijob;
							end if

	end if
loop

if il_tipo_ambito = 0 then	
	if not gb_hay_sesion then 
		close cu_subestac_0;
	else
		close cub_subestac_0;
	end if
	elseif il_tipo_ambito = 1 then
		if not gb_hay_sesion then 
			close cu_subestac_1;
		else
			close cub_subestac_1;
		end if

		elseif il_tipo_ambito = 2 then
			if not gb_hay_sesion then 
				close cu_subestac_2;
			else
				close cub_subestac_2;
			end if

			else
			if not gb_hay_sesion then 
				close cu_subestac_3;
			else
				close cub_subestac_3;
			end if

end if
tv_1.selectitem(1)
end event

event selectionchanging;//Sale si se ha modificado el ambito
long ll_codigo


if gb_hay_sesion and  ib_busqueda_padre  then return

IF newhandle=0 THEN Return 1


// si se ha cambiado de rama en el $$HEX1$$e100$$ENDHEX$$rbol sin haber aceptado los cambios, se deshacen los 
// cambios realizados (LFE)
IF ib_modificado AND Parent.dw_1.getrow() > 0 THEN
	ll_codigo=Parent.dw_1.getitemnumber(Parent.dw_1.getrow(), "codigo")
	Parent.dw_1.retrieve(ll_codigo)
	il_modifi = 0
	ib_modificado=false 
	gnu_u_transaction.uf_rollback(PARENT)
END IF



if il_abierta = 1 then
	
	Parent.st_1.visible = false

	//Si se esta modificando o a$$HEX1$$f100$$ENDHEX$$adiendo no permite cambiarse 
	if il_modifi > 0 then	
		Parent.dw_1.accepttext()
		if Parent.dw_1.ModifiedCount( ) > 0 THEN  
//			Parent.dw_1.Update()
if NOT gb_hay_sesion THEN
			Parent.cb_aceptar.triggerevent('clicked')
			END IF
		end if
	if ie_data = newhandle then //ACO
		return 1
	end if
	end if
	
	Parent.setredraw(false)
	dw_1.setredraw(false)
	dw_modifi.setredraw(false)
end if
end event

event begindrag;//ACO
//
//treeviewitem le_elemento
//
//if handle = 0 or gb_hay_sesion then
//	return
//end if
//
////______DSA INI 17/01/2000			
//int result
//result = gnu_u_transaction.uf_lock (Parent, wf_tabla(), wf_clave(),wf_timestamp()) 
//if result = -2 then 
//	gnu_u_transaction.uf_rollback(PARENT) // DSA 17/01/2000		
//	tv_1.deleteitem(0)
//	this.TriggerEvent('constructor');
//end if
//if result < 0 then return;
////______DSA FIN 17/01/2000																							
//
//
//il_handle_seleccionado = handle
//
//this.getitem(handle,le_elemento)
//
//il_nivel_seleccionado = le_elemento.level
//
end event

event doubleclicked;long ll_codigo
long ll_tipo, ll_bdijob, ll_pict, ll_tipo_instalacion
long ll_codigo_padre
long ll_noserie
datos_arbol lst_datos
string ls_nombre
treeviewitem le_elemento
treeviewitem le_elemento_nuevo

IF handle = 0 THEN // no hay ning$$HEX1$$fa00$$ENDHEX$$n elemento seleccionado
	return
END IF

SetPointer(HourGlass!)

if gb_bdi and gb_hay_sesion then
	if isnull(handle) then handle=message.LongParm	
end if	

this.getitem(handle,le_elemento)

//Comprueba si esa rama ya esta abierta o si esta contraida
//En negativo la abre haciendo un acceso a la B.D.

if le_elemento.Children = true then
	return
end if
lst_datos = le_elemento.data
ll_tipo = long(lst_datos.ll_tipo)
ll_codigo_padre = long(lst_datos.ll_codigo)

if ll_codigo_padre < 1 then 
	return
end if


if gb_hay_sesion then // MULTINIVEL   

		DECLARE cu_instalacion CURSOR FOR 
		SELECT NRO_INSTALACION, NOM_INSTALACION, BDI_JOB, TIPO_INSTALACION
		FROM SGD_INSTALACION SGD_INSTALACIONA
		WHERE NRO_INST_PADRE = :ll_codigo_padre  AND TIPO_INSTALACION <= :fgci_tipo_salida_de_baja AND
		BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_INSTALACION WHERE NRO_INSTALACION=SGD_INSTALACIONA.NRO_INSTALACION)
		ORDER BY NOM_INSTALACION ASC;

//Aqui a$$HEX1$$f100$$ENDHEX$$ade al elemento pinchado que tiene el identificador handle
//los hijos que le correspondan de la tabla inferior

		open cu_instalacion;
		fetch cu_instalacion into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_pict;
		

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
// COMENTADO MULTINIVEL INSTALACIONES
//	if gb_hay_sesion and ib_busqueda_padre then
//		if ll_tipo + 1>= f_nivel(onis.instalaciones[1].class_id) then // SE ABRE LA RAMA HASTA EL NIVEL DEL PADRE DE LA INSTALACION
//			exit
//		end if
//	end if
	le_elemento_nuevo.label = ls_nombre
	lst_datos.ll_codigo = ll_codigo
	lst_datos.ll_tipo = ll_pict
	le_elemento_nuevo.data = lst_datos
	le_elemento_nuevo.pictureindex = f_icono_arbol(lst_datos.ll_tipo)
	le_elemento_nuevo.selectedpictureindex = f_icono_arbol(lst_datos.ll_tipo)
	
	if gb_hay_sesion and ll_bdijob>0 then 
			le_elemento_nuevo.pictureindex = f_icono_arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
			le_elemento_nuevo.selectedpictureindex = f_icono_arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
	end if
	
	this.insertitemsort(handle,le_elemento_nuevo)

	fetch cu_instalacion into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_pict;

loop

			close cu_instalacion;

else

CHOOSE CASE ll_tipo
	
	CASE fgci_tipo_subestacion
	 if not gb_hay_sesion then 
		DECLARE cu_instala_1 CURSOR FOR 
		SELECT CODIGO, NOMBRE, BDI_JOB, :fgci_tipo_salida_mt
		FROM SGD_SALMT 
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0
		ORDER BY NOMBRE ASC;
	else
		DECLARE cub_instala_1 CURSOR FOR 
		SELECT CODIGO, NOMBRE, BDI_JOB , :fgci_tipo_salida_mt
		FROM SGD_SALMT SGD_SALMTA
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND
		BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_SALMT WHERE CODIGO=SGD_SALMTA.CODIGO)
		ORDER BY NOMBRE ASC;

   end if

	CASE fgci_tipo_salida_mt
   if not gb_hay_sesion then 
		DECLARE cu_instala_2 CURSOR FOR 
		SELECT CODIGO, NOMBRE, BDI_JOB , :fgci_tipo_ct
		FROM SGD_CT 
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0
		ORDER BY NOMBRE ASC;  
	else 
		DECLARE cub_instala_2 CURSOR FOR 
		SELECT CODIGO, NOMBRE, BDI_JOB, :fgci_tipo_salida_mt 
		FROM SGD_CT SGD_CTA
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND 
		BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_CT WHERE CODIGO =SGD_CTA.CODIGO)
		ORDER BY NOMBRE ASC;  
	end if
	CASE fgci_tipo_ct
   if not gb_hay_sesion then 	
		DECLARE cu_instala_3 CURSOR FOR  
	  	SELECT CODIGO, NOMBRE, BDI_JOB, :fgci_tipo_transformador
	   FROM SGD_TRAFO_MB
   	WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0 
		UNION 
		SELECT CODIGO, NOMBRE,BDI_JOB, :fgci_tipo_salida_de_baja
	   FROM SGD_SALBT
	   WHERE COD_TRAFO = :ll_codigo_padre AND BDI_JOB=0  
		ORDER BY NOMBRE ASC  ;
		
		
	else
		DECLARE cub_instala_3 CURSOR FOR  
	  	SELECT CODIGO, NOMBRE, BDI_JOB, :fgci_tipo_transformador
	   FROM SGD_TRAFO_MB SGD_TRAFO_MBA
   	WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND
		BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_TRAFO_MB WHERE CODIGO=SGD_TRAFO_MBA.CODIGO) 
		union
		SELECT CODIGO, NOMBRE,BDI_JOB, :fgci_tipo_salida_de_baja
	   FROM SGD_SALBT SGD_SALBTA
	   WHERE COD_TRAFO = :ll_codigo_padre AND 
		BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_SALBT WHERE CODIGO=SGD_SALBTA.CODIGO)  
		ORDER BY NOMBRE ASC  ;
		
	end if
			
	CASE fgci_tipo_transformador
   if not gb_hay_sesion then 			
		DECLARE cu_instala_4 CURSOR FOR  
		SELECT CODIGO, NOMBRE,BDI_JOB, :fgci_tipo_salida_de_baja
	   FROM SGD_SALBT
	   WHERE COD_TRAFO = :ll_codigo_padre AND BDI_JOB=0  
		ORDER BY NOMBRE ASC  ;
	else
		DECLARE cub_instala_4 CURSOR FOR  
		SELECT CODIGO, NOMBRE,BDI_JOB, :fgci_tipo_salida_de_baja
	   FROM SGD_SALBT SGD_SALBTA
	   WHERE COD_TRAFO = :ll_codigo_padre AND 
		BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_SALBT WHERE CODIGO=SGD_SALBTA.CODIGO)  
		ORDER BY NOMBRE ASC  ;
	end if
		
		
		
	CASE fgci_tipo_salida_de_baja
		return

END CHOOSE

//Aqui a$$HEX1$$f100$$ENDHEX$$ade al elemento pinchado que tiene el identificador handle
//los hijos que le correspondan de la tabla inferior

CHOOSE CASE ll_tipo
	
	CASE fgci_tipo_subestacion
    if not gb_hay_sesion then 			
		open cu_instala_1;
		fetch cu_instala_1 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
	else
		open cub_instala_1;
		fetch cub_instala_1 into :ll_codigo, :ls_nombre,:ll_bdijob , :ll_tipo_instalacion;
	end if	
	lst_datos.ll_tipo = ll_tipo_instalacion
	
	CASE fgci_tipo_salida_mt
		if not gb_hay_sesion then 			
		open cu_instala_2;
		fetch cu_instala_2 into :ll_codigo, :ls_nombre,:ll_bdijob, :ll_tipo_instalacion;
	else
		open cub_instala_2;
		fetch cub_instala_2 into :ll_codigo, :ls_nombre,:ll_bdijob, :ll_tipo_instalacion;
	end if
	lst_datos.ll_tipo = ll_tipo_instalacion

	CASE fgci_tipo_ct
	if not gb_hay_sesion then 			
		open cu_instala_3;

		
		fetch cu_instala_3 into :ll_codigo, :ls_nombre,:ll_bdijob , :ll_tipo_instalacion;
		lst_datos.ll_tipo = ll_tipo_instalacion
		
		
   else
	   open cub_instala_3;
		fetch cub_instala_3 into :ll_codigo, :ls_nombre,:ll_bdijob, :ll_tipo_instalacion;
		lst_datos.ll_tipo = ll_tipo_instalacion;
	end if	
	
	//	ls_nombre = "TRAFO - " + string(ll_noserie)

	CASE fgci_tipo_transformador
 	if not gb_hay_sesion then 			
		open cu_instala_4;
		fetch cu_instala_4 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
	else
		open cub_instala_4;
		fetch cub_instala_4 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
	end if
		lst_datos.ll_tipo = ll_tipo_instalacion;
END CHOOSE

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
// COMENTADO MULTINIVEL INSTALACIONES
//	if gb_hay_sesion and ib_busqueda_padre then
//		if ll_tipo + 1>= f_nivel(onis.instalaciones[1].class_id) then // SE ABRE LA RAMA HASTA EL NIVEL DEL PADRE DE LA INSTALACION
//			exit
//		end if
//	end if
	le_elemento_nuevo.label = ls_nombre
	lst_datos.ll_codigo= ll_codigo
	le_elemento_nuevo.data = lst_datos
	le_elemento_nuevo.pictureindex = f_icono_arbol(lst_datos.ll_tipo)
	le_elemento_nuevo.selectedpictureindex = f_icono_arbol(lst_datos.ll_tipo)
	
	if gb_hay_sesion and ll_bdijob>0 then 
			le_elemento_nuevo.pictureindex = f_icono_arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
			le_elemento_nuevo.selectedpictureindex = f_icono_arbol(lst_datos.ll_tipo+ii_instalaciones_modificadas)
	end if
	
	this.insertitemsort(handle,le_elemento_nuevo)

	CHOOSE CASE ll_tipo
	
		CASE fgci_tipo_subestacion
			if not gb_hay_sesion then 
					fetch cu_instala_1 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
			else
					fetch cub_instala_1 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
			end if
			lst_datos.ll_tipo = ll_tipo_instalacion
		CASE fgci_tipo_salida_mt
			if not gb_hay_sesion then 
					fetch cu_instala_2 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
			else
					fetch cub_instala_2 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
			end if
			lst_datos.ll_tipo = ll_tipo_instalacion

		CASE fgci_tipo_ct
			
			if not gb_hay_sesion then 
				
				fetch cu_instala_3 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
				lst_datos.ll_tipo = ll_tipo_instalacion
		
	
			else
   			fetch cub_instala_3 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
				lst_datos.ll_tipo = ll_tipo_instalacion
			end if
			
			
							
//			ls_nombre = "TRAFO - " + string(ll_noserie)
		
		CASE fgci_tipo_transformador, fgci_tipo_ct
	
			if not gb_hay_sesion then 
					fetch cu_instala_4 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
			else
					fetch cub_instala_4 into :ll_codigo, :ls_nombre,:ll_bdijob,:ll_tipo_instalacion;
			end if
			lst_datos.ll_tipo = ll_tipo_instalacion
			
	END CHOOSE

loop

CHOOSE CASE ll_tipo
	
	CASE fgci_tipo_subestacion

		if not gb_hay_sesion then 
			close cu_instala_1;
		else
			close cub_instala_1;
		end if
	CASE fgci_tipo_salida_mt
		if not gb_hay_sesion then 
			close cu_instala_2;
		else
			close cub_instala_2;
		end if
		
	CASE fgci_tipo_ct
		if not gb_hay_sesion then 
			close cu_instala_3;

		else
			close cub_instala_3;
		end if
		
	CASE fgci_tipo_transformador
	
		if not gb_hay_sesion then 
			close cu_instala_4;
		else
			close cub_instala_4;
		end if

END CHOOSE

end if
setpointer(Arrow!)
end event

event dragdrop;treeviewitem le_elemento
long ll_codigo_padre 
long ll_codigo_seleccionado
long ll_handle_hijas
datos_arbol lst_datos
long ll_tipo

if handle = 0 or gb_hay_sesion then
	return
end if
This.setredraw(false)
this.getitem(handle,le_elemento)

//Solo entra si el elemento destino es un nivel superior al origen de los datos
if (il_nivel_seleccionado - le_elemento.level) = 1 and (il_nivel_seleccionado > 1) then
	
	//Tenemos el codigo del padre
	lst_datos = le_elemento.data 
	ll_codigo_padre = lst_datos.ll_codigo
	
	this.getitem(il_handle_seleccionado,le_elemento)                                                                                          
	lst_datos = le_elemento.data 
	ll_codigo_seleccionado = lst_datos.ll_codigo
	
ll_tipo = lst_datos.ll_tipo
//Aqui se cambia en las tablas el campo instalacion_origen por el nuevo
CHOOSE CASE ll_tipo // le_elemento.level
	CASE fgci_tipo_salida_mt

				UPDATE "SGD_SALMT"  
					SET "INSTALACION_ORIGEN" = :ll_codigo_padre   , 
							f_actual = sysdate // DSA 17/01/2000			
				 WHERE "SGD_SALMT"."CODIGO" = :ll_codigo_seleccionado  
				 AND BDI_JOB=0;

	CASE fgci_tipo_ct

				UPDATE "SGD_CT"  
					SET "INSTALACION_ORIGEN" = :ll_codigo_padre   , 
							f_actual = sysdate // DSA 17/01/2000			
				 WHERE "SGD_CT"."CODIGO" = :ll_codigo_seleccionado AND BDI_JOB=0;


	CASE fgci_tipo_transformador
	
				UPDATE "SGD_TRAFO_MB"  
					SET "INSTALACION_ORIGEN" = :ll_codigo_padre   , 
							f_actual = sysdate // DSA 17/01/2000			
				 WHERE "SGD_TRAFO_MB"."CODIGO" = :ll_codigo_seleccionado  
				 AND BDI_JOB=0;


	CASE fgci_tipo_salida_de_baja

				UPDATE "SGD_SALBT"  
					SET COD_TRAFO = :ll_codigo_padre   , 
							f_actual = sysdate // DSA 17/01/2000			
				 WHERE "SGD_SALBT"."CODIGO" = :ll_codigo_seleccionado  AND BDI_JOB=0;		

END CHOOSE
	
	//Borramos la rama del origen
	this.deleteitem(il_handle_seleccionado)
	
	//Ahora se borra todas las hijas del destino

	ll_handle_hijas = This.FindItem(ChildTreeItem!,handle)
	
	DO WHILE ll_handle_hijas > 0 

	this.deleteitem(ll_handle_hijas)
	ll_handle_hijas = This.FindItem(ChildTreeItem!,handle)

LOOP
this.getitem(handle,le_elemento)                                                                                          
le_elemento.children = false
this.setitem(handle,le_elemento)

end if
	
il_nivel_seleccionado = 0
il_handle_seleccionado = 0
gnu_u_transaction.uf_commit(PARENT) // DSA 17/01/2000			
This.setredraw(true)
end event

event dragwithin;Treeviewitem elemento
if gb_hay_sesion then return
this.getitem(handle,elemento)

if (il_nivel_seleccionado - elemento.level) <> 1 then

	//this.drag(Cancel!)

end if
end event

event rightclicked;//Si no se ha pulsado sobre algun elemento sale
TreeViewItem elemento
int li_contador=0
datos_arbol lst_datos
if handle = 0 then return


if gu_perfiles.of_acceso_perfil(gi_perfil,"RED_ACCESO","ACC_CONSULTA")= 1 AND &
   gu_perfiles.of_acceso_perfil(gi_perfil,"RED_ACCESO","ACC_MANTEN") <> 1 then // ACCESO CONSULTA
	return
END IF


this.selectitem(handle)

Parent.il_manejador = handle
string ls_retorno

this.getitem(handle,elemento)
lst_datos = elemento.data

// SI ESTAMOS EN MANTENIMIENTO NO SE PUEDE ABRIR EL MENU
if isvalid(onis) then
	if gb_hay_sesion and onis.trabajo<>-1 then
		if ib_busqueda_padre then
			// MARCA EL PADRE

			il_padre = lst_datos.ll_codigo
			//COMPROBAMOS QUE CORRESPONDA AL NIVEL ANTERIOR
			if fw_padre_valido(il_padre,onis.instalaciones[1].class_id) then 
//			if elemento.level + 1 = f_nivel(onis.instalaciones[1].class_id) then 
			// COMPROBAMOS QUE EL PADRE NO SE VA A BORRAR	
			 SELECT count(*)  
    			INTO :li_contador  
		    FROM "SGD_INSTALACION"  
   			WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = :il_padre ) AND  
	         ( "SGD_INSTALACION"."STAT_FLG" = 128 )   ;

				if li_contador>0 then 
//					"La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada"
					gnv_msg.f_mensaje("EX33","","",Ok!)		
					cb_aceptar.enabled=false
					il_padre =0
				else
					cb_aceptar.enabled=true
					cb_cancelar.enabled=true
				end if
				
			else // Instalaci$$HEX1$$f300$$ENDHEX$$n padre incorrecta
				gnv_msg.f_mensaje("EX34","","",Ok!)		
				cb_aceptar.enabled=false
				il_padre =0
			end if
		end if
		return 
	end if
end if



boolean lb_algun_acceso
m_man_inst NewMenu
NewMenu = CREATE m_man_inst

// GSE  17/01/2001
// Recupero para que niveles de tension tiene permiso el usuario
string ls_incid, ls_aux
int indice, li_par, li_tension
boolean lb_sigo=true
// Obtengo los permisos de mi usuario para los niveles de tension
ls_incid  = gu_perfiles.of_nivel_tension('RED_ACCESO')

// Obtengo el nivel de tension de la instalacion seleccionada
CHOOSE CASE lst_datos.ll_tipo
	CASE fgci_tipo_subestacion_at
		li_tension = 1
	CASE fgci_tipo_salida_at,fgci_tipo_subestacion,fgci_tipo_salida_mt
		li_tension = 2
	CASE  fgci_tipo_ct ,fgci_tipo_transformador,fgci_tipo_salida_de_baja,fgci_tipo_acometida
		li_tension = 3
END CHOOSE

// Compruebo si mi usuario tiene permisos para el nivel de tension 
// de la instalacion seleccionada
for indice = 1 to len(ls_incid)
 	 li_par =  mod (indice,2)
	 IF li_par <> 0 then
		 ls_aux = mid(ls_incid,indice,1)
		 if ls_aux <> ',' and lb_sigo = true then
			 if integer(ls_aux) = li_tension or ls_aux = '0' then
				 lb_sigo = false
			 end if
		 end if
	 end if
next
	
// No tiene permiso para ese nivel
If lb_sigo = true then
	gnv_msg.f_mensaje("AA08","","",OK!)
	return 
end if		

// SI HAY ACCESO DE MANTENIMIENTO DE INSTALACIONES
if gu_perfiles.of_acceso_perfil(gi_perfil,'RED_ACCESO','ACC_MANTEN')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_eliminarinstalacin.visible = false
	 m_man_inst.m_crearinstalacin.visible =false	
end if
if gb_hay_sesion then 
 m_man_inst.m_eliminarinstalacin.visible = false
 m_man_inst.m_crearinstalacin.visible =false
end if
// SI HAY PERMISO DE CONSULTA DE SUMINISTROS IMPORTANTES

if gu_perfiles.of_acceso_perfil(gi_perfil,'SUM_IMP','ACC_CONSULTA')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_suministrosimportantes.enabled = false
end if

// SI HAY PERMISO DE CONSULTA DE INCIDENCIAS 

if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_CONSULTA')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_incidencias.enabled = false
end if

// SI HAY PERMISO DE CONSULTA DE AVISOS

if gu_perfiles.of_acceso_perfil(gi_perfil,'CAV_GENERAL','ACC_CONSULTA')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_avisos.enabled = false
end if

// SI HAY PERMISO DE CONSULTA DE ACOMETIDAS

if gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_SUMIN','ACC_CONSULTA')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_acometidas.enabled = false
end if

// SI HAY PERMISO DE CONSULTA DE OTS
if gu_perfiles.of_acceso_perfil(gi_perfil,'CONS_OT','ACC_CONSULTA')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_ots.enabled = false
end if


if gu_perfiles.of_acceso_perfil(gi_perfil,'INFO_CLI','ACC_CONSULTA')=1 then 
	lb_algun_acceso=true
else
	 m_man_inst.m_suministros.enabled = false
end if


if m_man_inst.m_crearinstalacin.visible then 

 m_man_inst.m_crearinstalacion2.visible= false

CHOOSE CASE lst_datos.ll_tipo
		
	CASE fgci_tipo_subestacion
		m_man_inst.m_eliminarinstalacin.text = m_man_inst.m_eliminarinstalacin.text + " Subestaci$$HEX1$$f300$$ENDHEX$$n"
		m_man_inst.m_crearinstalacin.text = m_man_inst.m_crearinstalacin.text + " Salida Media Tensi$$HEX1$$f300$$ENDHEX$$n"		
		
		
	CASE fgci_tipo_salida_mt
		m_man_inst.m_eliminarinstalacin.text = m_man_inst.m_eliminarinstalacin.text + " Salida Media Tension"
		m_man_inst.m_crearinstalacin.text = m_man_inst.m_crearinstalacin.text + " Centro Transformaci$$HEX1$$f300$$ENDHEX$$n"		
		
		
	CASE fgci_tipo_ct
		m_man_inst.m_crearinstalacion2.text = m_man_inst.m_crearinstalacin.text +  " Salida Baja Tensi$$HEX1$$f300$$ENDHEX$$n"	
		m_man_inst.m_eliminarinstalacin.text = m_man_inst.m_eliminarinstalacin.text + " Centro Transformaci$$HEX1$$f300$$ENDHEX$$n"
		m_man_inst.m_crearinstalacin.text = m_man_inst.m_crearinstalacin.text + " Transformador MB"		
		
		m_man_inst.m_crearinstalacion2.visible= true
		
	CASE fgci_tipo_transformador
		m_man_inst.m_eliminarinstalacin.text = m_man_inst.m_eliminarinstalacin.text + " Transformador MB"
		m_man_inst.m_crearinstalacin.text = m_man_inst.m_crearinstalacin.text + " Salida Baja Tensi$$HEX1$$f300$$ENDHEX$$n"		
				
		
	CASE fgci_tipo_salida_de_baja
		m_man_inst.m_eliminarinstalacin.text = m_man_inst.m_eliminarinstalacin.text + " Salida Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
		m_man_inst.m_crearinstalacin.enabled = false
			
END CHOOSE
end if

if lb_algun_acceso then 
	
m_man_inst.PopMenu(PointerX(), PointerY())

ls_retorno = gu_comunic.is_comunic.accion_retorno 
	CHOOSE CASE ls_retorno
		CASE 'crear_instalacion'
			Parent.TriggerEvent ("ue_crear_inst")
		CASE 'crear_instalacion2'
			Parent.TriggerEvent ("ue_crear_salbaja")
		CASE 'eliminar_instalacion'
			Parent.TriggerEvent ("ue_eliminar_inst")
		CASE 'suministros_imp'
			Parent.TriggerEvent ("ue_sum_imp")
		CASE 'incidencias'
			Parent.TriggerEvent ("ue_incidencias")
		CASE 'avisos'
			Parent.TriggerEvent ("ue_avisos")	
		CASE 'ots'
			Parent.TriggerEvent ("ue_ots")
		CASE 'acometidas'
			Parent.TriggerEvent ("ue_acometidas")
		CASE 'suministros'
			Parent.TriggerEvent ("ue_suministros")
	END CHOOSE
else
	gnv_msg.f_mensaje("AA08","","",OK!)	
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Usuario no autorizado")
end if

//Deshabilito el filtro de ambito
if il_modifi = 2 then

		Parent.dw_ambito.fnu_deshab_centro(Parent.dw_ambito)
		Parent.dw_ambito.fnu_deshab_cmd(Parent.dw_ambito)
		Parent.dw_ambito.fnu_deshab_puesto(Parent.dw_ambito)
		Parent.tv_1.enabled = false
		Parent.cb_1.enabled = false

end if


end event

event clicked;treeviewitem le_elemento

IF handle = 0 THEN // no hay ning$$HEX1$$fa00$$ENDHEX$$n elemento seleccionado
	return
END IF

//SetPointer(HourGlass!)

this.getitem(handle,le_elemento)




end event

type dw_modifi from u_cen_2001_pr_form_centro_cmd_mesa within w_man_instalacion
integer x = 2368
integer y = 136
integer width = 1056
integer height = 448
integer taborder = 100
string dataobject = "d_cen_2001_pr_form_centro_cmd_mesa_2"
boolean border = false
end type

event getfocus;call super::getfocus;ib_modificado = true

if il_modifi = 0 then
	il_modifi = 1

end if
end event

event losefocus;call super::losefocus;//long ll_centro, ll_cmd, ll_mesa
//dw_1.accepttext()
//if dw_modifi.rowcount() > 0 then
//	ll_centro = dw_modifi.getitemnumber(1,"nro_centro")
//	ll_cmd = dw_modifi.getitemnumber(1,"nro_cmd")
//	ll_mesa = dw_modifi.getitemnumber(1,"nro_mesa")
//	if ll_centro = 0 or ll_cmd = 0 or ll_mesa = 0 then
//		messagebox("Error","Debe seleccionar un centro, cmd y mesa valido")
//		dw_modifi.setfocus()
//	end if
//end if
end event

event post_itemchange;call super::post_itemchange;//
//Parent.dw_modifi.setredraw(false)
//if ii_tipo = 1 or ii_tipo=6 then
//			
//		Parent.dw_modifi.fpr_hab_centro(Parent.dw_modifi)
//		Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
//		Parent.dw_modifi.fnu_deshab_puesto(Parent.dw_modifi)		 
//
//else
//
//		Parent.dw_modifi.fnu_deshab_centro(Parent.dw_modifi)
//		Parent.dw_modifi.fnu_deshab_cmd(Parent.dw_modifi)
//		Parent.dw_modifi.fpr_hab_puesto(Parent.dw_modifi)		 
//	
//end if
//Parent.dw_modifi.setredraw(true)
end event

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ITEMCHANGED
//
// Objetivo: SELECCIONA / HABILITA / DESHABILITA LAS DDDW.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 09/09/1999	    FDO
//		
/////////////////////////////////////////////////////////// 

//
//
//int li_todos
//int li_valor
//
//This.SetRedraw(False)
//li_todos=fgci_todos
//String ls_columna
//ls_columna=this.getcolumnname()
//
//long ll_nro_centro
//
//CHOOSE CASE ls_columna
//	CASE "nro_centro"
//				li_valor=Integer(this.gettext())
//				This.SetItem(1,"nro_cmd",li_todos)
//				This.SetItem(1,"nro_mesa",li_todos)
//				This.fnu_des_puesto()
//				If li_valor=li_todos THEN
//					This.fnu_HABI_cmd()
//				 	This.fnu_des_puesto()
//					This.fnu_filtro_cmd_n()
//					this.object.nro_cmd[1] = li_todos					
//				ELSE
//					This.SetItem(1,"nro_cmd",li_todos)
//					This.SetItem(1,"nro_mesa",li_todos)
//					This.fnu_DES_cmd()
//					This.fnu_filtro_mesa_n()
//					This.fnu_habi_puesto()
//					ii_centro_entrada=li_valor
//					ii_cmd_entrada=li_todos
//				END IF
//				
//	 CASE "nro_cmd"
//		
//			li_valor=Integer(this.gettext())
//			If li_valor=li_todos THEN
//				This.SetItem(1,"nro_mesa",li_todos)
//				This.fnu_des_puesto()
//				this.fnu_habi_centro()
//				this.object.nro_centro[1] = li_todos
//			ELSE
//				This.SetItem(1,"nro_mesa",li_todos)
//				this.object.nro_centro[1] = li_todos
//				THIS.FNU_DES_CENTRO()
//				This.fnu_filtro_mesa_n()
//				This.fnu_habi_puesto()
//				ii_centro_entrada=li_todos
//				ii_cmd_entrada=li_valor
//			END IF
//			
//	 CASE "nro_mesa"
//		
//			li_valor=Integer(this.gettext())
//
//			if li_valor <> li_todos THEN
//
//				 if dw_1.dataobject='d_man_subestac' then 
//						THIS.FNU_HABI_CENTRO()
//						THIS.FNU_HABI_CMD()
//					ELSE
//						fnu_des_centro()
//						fnu_des_cmd()		 
//					END IF
//				// setea el centro
//					
//				SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
//					INTO :ll_nro_centro  
//					FROM "SGD_RELACION_CENTRO"  
//				WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
//						( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 )   ;
//
//				This.object.nro_centro[1]=ll_nro_centro
//		
//				// setea el CMD
//					
//				This.fnu_filtro_cmd_n()										
//				
//				SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
//					INTO :ll_nro_centro  
//					FROM "SGD_RELACION_CENTRO"  
//				WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
//						( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2 )   ;
//
//				This.object.nro_cmd[1]=ll_nro_centro
//				
//			else
//				
//				This.SetItem(1,"nro_cmd",ii_cmd_entrada)
//				This.SetItem(1,"nro_mesa",li_todos)
//				This.SetItem(1,"nro_centro",ii_centro_entrada)
//				
//				if ii_cmd_entrada<>0 then 
//					fnu_des_centro()
//				elseif ii_centro_entrada<>0 then 
//					fnu_des_cmd()
//				else
//					if ii_tipo=6 or ii_tipo=1 then fnu_des_puesto()
//				end if
//				
//			end if
//END CHOOSE
//
//This.SetRedraw(true)
//
//
//
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_man_instalacion
event getfocus pbm_dwnsetfocus
event retrieveend pbm_dwnretrieveend
integer x = 1266
integer y = 160
integer width = 1074
integer height = 420
integer taborder = 50
boolean border = false
end type

event itemchanged;call super::itemchanged;//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ITEMCHANGED
//
// Objetivo: SELECCIONA / HABILITA / DESHABILITA LAS DDDW.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 
//        Salida:
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 09/09/1999	    FDO
//		
/////////////////////////////////////////////////////////// 
int li_todos,li_conta
int li_valor

//This.SetRedraw(False)
li_todos=fgci_todos
String ls_columna
ls_columna=this.getcolumnname()
long ll_nro_centro

ib_modificado = false
il_modifi = 0 

dw_ambito.accepttext()
setpointer(hourglass!)
if dwo.name = "nro_centro" or dwo.name = "nro_cmd" or dwo.name = "nro_mesa" and  il_modifi  = 0 then
		il_ambito_modifi = 1
		st_3.visible = false
		dw_modifi.visible = false

		il_centro = dw_ambito.getitemnumber(1,"nro_centro")
		il_cmd = dw_ambito.getitemnumber(1,"nro_cmd")
		il_puesto = dw_ambito.getitemnumber(1,"nro_mesa")
		if il_centro = 0 and il_cmd=0 and il_puesto=0 then 
			il_tipo_ambito = 0
		elseif il_centro<>0 and il_cmd = 0 then
			il_tipo_ambito = 1
			elseif il_centro=0 and il_cmd <> 0 then
				il_tipo_ambito = 2
			else
					il_tipo_ambito = 3
		end if
		
		//Si se esta modificando o a$$HEX1$$f100$$ENDHEX$$adiendo no permite cambiarse //ACO
		if il_modifi > 0 then	
			 Parent.dw_1.accepttext()
		if Parent.dw_1.ModifiedCount( )>0 then 
		//	Parent.dw_1.Update()
			Parent.cb_aceptar.triggerevent('clicked')
		end if
	end if // ACO
	
		//tv_1.deleteitem(0)
		dw_1.reset()
		st_1.visible = false
		st_3.visible = false 
		dw_modifi.visible = false
		tv_1.triggerevent("ue_cargar")
		Parent.setredraw(true)
end if

end event

type st_1 from statictext within w_man_instalacion
integer x = 1413
integer y = 1256
integer width = 434
integer height = 76
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 16777344
long backcolor = 79741120
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n"
long bordercolor = 79741120
boolean focusrectangle = false
end type

event doubleclicked;long ll_pro, ll_dep, ll_mun, ll_loc
long ll_nro_calle
string ls_nom_calle, ls_tipo_dato

//______DSA INI 17/01/2000	
IF il_modifi <> 2 and not ib_ya_bloqueado then
	
	if gnu_u_transaction.uf_lock (Parent, wf_tabla(), wf_clave(),wf_timestamp()) <> 0 	THEN

		dw_1.retrieve(dw_1.getitemnumber(dw_1.GetRow(),"codigo"))	
		return
	ELSE
		ib_ya_bloqueado = TRUE 
	end if
	
END IF
//______DSA FIN 17/01/2000	

if il_modifi = 0 then
	il_modifi = 1
end if



iu_gen_comunic = CREATE u_generico_comunicaciones

ls_tipo_dato = dw_1.Object.cod_prov.coltype
if ls_tipo_dato = "decimal(0)" then 
	gu_comunic.is_comunic.intval1= integer( dw_1.GetItemdecimal(1, "cod_prov") )		//Prov
else
	gu_comunic.is_comunic.intval1= integer( dw_1.GetItemString(1, "cod_prov") )		//Prov
end if

ls_tipo_dato = dw_1.Object.cod_depto.coltype

if ls_tipo_dato = "decimal(0)" then 
	gu_comunic.is_comunic.intval2= integer( dw_1.GetItemdecimal(1, "cod_depto") )		//Depto
else
		gu_comunic.is_comunic.intval2= integer( dw_1.GetItemString(1, "cod_depto") )		//Depto
end if


ls_tipo_dato =  dw_1.Object.cod_munic.coltype

if ls_tipo_dato = "decimal(0)" then 
	gu_comunic.is_comunic.longval4= long (dw_1.GetItemdecimal(1, "cod_munic")) 		//Munic
else
	gu_comunic.is_comunic.longval4= long (dw_1.GetItemstring(1, "cod_munic")) 		//Munic
end if

ls_tipo_dato =  dw_1.Object.cod_local.coltype
if ls_tipo_dato = "decimal(0)" then 
	gu_comunic.is_comunic.longval5= long (dw_1.GetItemdecimal(1, "cod_local"))		//Local
else
	gu_comunic.is_comunic.longval5= long (dw_1.GetItemstring(1, "cod_local"))		//Local
end if

f_cargar_datos_direccion()
parnum2 = gu_comunic.is_comunic.intval1
parnum3 = gu_comunic.is_comunic.intval2
parnum4 = gu_comunic.is_comunic.longval4
parnum5 = gu_comunic.is_comunic.longval5
gu_comunic.is_comunic.strval10 = "Nif"
gu_comunic.is_comunic.programa_llamante = "w_man_instalacion_alta"


open(w_id0100)

if not isnull(gu_comunic.is_comunic.longval1) and not isnull(gu_comunic.is_comunic.intval6) and not isnull(gu_comunic.is_comunic.strval6) then
		dw_1.setitem(1,"nro_calle",gu_comunic.is_comunic.longval1)
		if dw_1.dataobject<>"d_man_ct" then 
			dw_1.setitem(1,"nro_puerta",gu_comunic.is_comunic.intval6  )
		else	
			dw_1.setitem(1,"num_puerta",gu_comunic.is_comunic.intval6  )
		end if
		dw_1.setitem(1,"duplicador",gu_comunic.is_comunic.strval6  )

		dw_1.setItem(1, "cod_prov",string(gu_comunic.is_comunic.intval1)) 		//Prov
 		dw_1.setItem(1, "cod_depto",string(gu_comunic.is_comunic.intval2))		//Depto
		dw_1.SetItem(1, "cod_munic",string(gu_comunic.is_comunic.longval4)) 		//Munic
 		dw_1.Setitem(1, "cod_local",string(gu_comunic.is_comunic.longval5))		//Local
//
//		select nom_calle 
//		into :ls_nom_calle 
//		from callejero
//		where Cod_calle = :gu_comunic.is_comunic.longval1;
//		dw_1.setitem(1,"callejero_nom_calle",ls_nom_calle)

		dw_1.setitem(1,"callejero_nom_calle",gu_comunic.is_comunic.strval5)
		dw_1.accepttext()

end if

destroy iu_gen_comunic 

end event

type dw_1 from datawindow within w_man_instalacion
integer x = 1390
integer y = 616
integer width = 1856
integer height = 832
integer taborder = 90
string dataobject = "d_man_trafo_mb"
boolean border = false
end type

event getfocus;//ib_modificado = true
//
//IF il_modifi = 0 then
//	il_modifi = 1
//end if
//
end event

event retrieveend;ib_ya_bloqueado = FALSE// DSA 17/01/2000			
Parent.setredraw(true)

end event

event itemchanged;ib_modificado = true

IF il_modifi = 0 then
	il_modifi = 1
end if

//______DSA INI 17/01/2000	
//gnu_u_transaction.uf_commit(PARENT)
IF il_modifi <> 2 and not ib_ya_bloqueado then
	
	if gnu_u_transaction.uf_lock (Parent, wf_tabla(), wf_clave(),wf_timestamp()) <> 0 	THEN

		dw_1.retrieve(dw_1.getitemnumber(dw_1.GetRow(),"codigo"))	
		return
	ELSE
		ib_ya_bloqueado = TRUE
	end if
	
END IF


IF il_modifi <> 2 THEN // si no es un alta
//		il_modifi = 0
//		ib_modificado=false
//
		//hemos hecho cambios
		il_modifi = 1		 
		ib_modificado=true 

		Parent.tv_1.enabled = enabled
		Parent.cb_1.enabled = enabled
	
END IF
			

//
//
//if dwo.name = "nro_centro" or dwo.name = "nro_cmd" and il_modifi = 0 then
//		il_ambito_modifi = 1
//		il_centro = Parent.dw_1.getitemnumber(1,"nro_centro")
//		il_cmd = Parent.dw_1.getitemnumber(1,"nro_cmd")
//		
//		if il_centro = 0 then
//			il_tipo_ambito = 0
//		elseif il_cmd = 0 then
//			il_tipo_ambito = 1
//				else 
//					il_tipo_ambito = 2
//				end if
//		
//		tv_1.deleteitem(0)
//		tv_1.triggerevent("constructor")
//
//end if
//______DSA FIN 17/01/2000		
end event

event dberror;long ll_error,i_sql_ok
string msg_error
string ls_tabla

msg_error =sqlerrtext
ll_error = sqldbcode
  IF ll_error <> 0 THEN
  ib_error = true
				 
CHOOSE CASE dw_1.dataobject
		 
			CASE 'd_man_subestac'
					
					ls_tabla = ' sgd_subestac'
							
			CASE 'd_man_salmt'
					
					ls_tabla = ' sgd_salmt'
	
			CASE 'd_man_ct'

					ls_tabla = ' sgd_ct'
					
			CASE 'd_man_trafo_mb'

					ls_tabla = ' sgd_trafo_mb'

			CASE 'd_man_salbt'

					ls_tabla = ' sgd_salbt'

END CHOOSE


//messagebox("Error " + string(ll_error),sqlerrtext)

		CHOOSE CASE ll_error

			CASE 100
				gnv_msg.f_mensaje("EG13","","",OK!)
 		   CASE 1407,1400
  				gnv_msg.f_mensaje("EG05","la tabla " + ls_tabla ,"",OK!)
		   CASE  1,-1
	   		gnv_msg.f_mensaje("EG06","la tabla " + ls_tabla ,"",OK!)
			CASE 2291
	   		gnv_msg.f_mensaje("EG07","la tabla " + ls_tabla ,"",OK!)
	   	CASE 2292	
   			gnv_msg.f_mensaje("EG08","la tabla " + ls_tabla ,"",OK!)
         CASE ELSE 
				gnv_msg.f_mensaje("EG21",string(sqldbcode)+"  "+sqlerrtext,"",ok!)
				fg_mostrar_dw(dw_1)
		   	//MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
	  END CHOOSE
		  //Rollback;
			gnu_u_transaction.uf_rollback(PARENT)
		 RETURN 1
  END IF
end event

event editchanged;// DSA INI 17/01/2000			
//// En cuanto se produzca un cambio en alguno de los campos, comprobamos si el registro
//// est$$HEX2$$e1002000$$ENDHEX$$bloqueado por otro usuario; si est$$HEX2$$e1002000$$ENDHEX$$bloqueado deshacemos los cambios, y si no est$$HEX1$$e100$$ENDHEX$$
//// lo bloqueamos nosotros. (LFE)
//
//IF il_modifi <> 2 THEN // si no es un alta
//
//		il_modifi = 0
//		ib_modificado=false 
//
//		Parent.tv_1.enabled = enabled
//		Parent.cb_1.enabled = enabled
//	
//END IF
// DSA FIN 17/01/2000			


end event

type gb_2 from groupbox within w_man_instalacion
integer x = 1262
integer y = 556
integer width = 2094
integer height = 984
integer taborder = 30
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
end type


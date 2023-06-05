HA$PBExportHeader$w_7106_solicitud_descargos_copiar.srw
$PBExportComments$// LFE - Mejora 1/272575: copiar descargos
forward
global type w_7106_solicitud_descargos_copiar from w_7106_solicitud_descargos
end type
type dw_datos_solicitud_origen from datawindow within tabpage_solicitud
end type
end forward

global type w_7106_solicitud_descargos_copiar from w_7106_solicitud_descargos
end type
global w_7106_solicitud_descargos_copiar w_7106_solicitud_descargos_copiar

type variables

end variables

forward prototypes
public function boolean fw_copiar_datos_solicitud ()
public function boolean fw_copiar_datos_solicitud_otros ()
public function boolean fw_copiar_datos_inst_afec ()
public function boolean fw_copiar_datos_interrupcion (long pl_nro_desc_orig)
end prototypes

public function boolean fw_copiar_datos_solicitud ();// Se copian los datos del descargo
//tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'usuario', gs_usuario)
//tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'id_solicitante', gs_usuario)
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'obs_solicitado', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'obs_solicitado'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'tipo_descargo', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'tipo_descargo'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'id_enviado', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'id_enviado'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'tipo_descargo', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'tipo_descargo'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'cod_inst_origen', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'cod_inst_origen'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'nom_desc', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'nom_desc'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'ubicacion', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'ubicacion'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'tel_solic', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'tel_solic'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'unidad', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'unidad'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'trab_tension', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'trab_tension'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'jefe_trabajo', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'jefe_trabajo'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'tel_trabajo', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'tel_trabajo'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'plano', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'plano'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'tiempo_repos', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'tiempo_repos'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'brigada', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'brigada'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'subest_movil', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'subest_movil'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'descripcion', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'descripcion'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'agente', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'agente'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'ind_interrupcion', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'ind_interrupcion'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'ind_act_grafica', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'ind_act_grafica'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'inst_descargar', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'inst_descargar'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'ind_obligada', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'ind_obligada'))
tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'programa', 'w_7106_copiar')

string ls_descripcion//, ls_prim_desc  // GNU 2-8-2006. Mejora 1/426921
datawindowchild ddw_desc_descargo

//SELECT valor
//INTO :ls_prim_desc
//FROM sgd_valor
//WHERE codif='DESC';

	if fg_verifica_parametro("descripcion descargos") then
//		and (il_nro_descargo >= long(ls_prim_desc)) then
		ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')	
		tab_1.tabpage_solicitud.dw_desc_descargo.insertrow(0)
		tab_1.tabpage_solicitud.dw_desc_descargo.visible=true
		tab_1.tabpage_solicitud.dw_desc_descargo.GetChild('pi_desc_descargo',ddw_desc_descargo)
		ddw_desc_descargo.SetTransObject(SQLCA)
		ddw_desc_descargo.retrieve()
//				IF (gu_comunic.is_comunic.longval1 < long(ls_prim_desc)) THEN
		IF Not IsNumber(ls_descripcion) then
			tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'descripcion','')
		ELSE
//		ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')
			tab_1.tabpage_solicitud.dw_desc_descargo.setitem(1,"pi_desc_descargo",long(ls_descripcion))
		end if
	end if

Return true
end function

public function boolean fw_copiar_datos_solicitud_otros ();// Se copian los datos de la pesta$$HEX1$$f100$$ENDHEX$$a otros
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'jefe_trabajo', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'jefe_trabajo'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'tel_trabajo', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'tel_trabajo'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'tiempo_repos', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'tiempo_repos'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'ubicacion', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'ubicacion'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'plano', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'plano'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'brigada', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'brigada'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'trab_tension', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'trab_tension'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'id_solicitante', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'id_solicitante'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'tel_solic', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemString(1, 'tel_solic'))
tab_1.tabpage_otros.dw_datos_solicitud_otros.SetItem(1, 'unidad', tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'unidad'))

Return true
end function

public function boolean fw_copiar_datos_inst_afec ();long ll_nro_inst_afec
long ll_array[]
Int li_tipo_inst
Boolean lb_error = False

gu_comunic1.is_comunic.decval1 = tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'cod_inst_origen')
ll_nro_inst_afec = tab_1.tabpage_solicitud.dw_datos_solicitud_origen.GetItemNumber(1, 'cod_inst_origen')

DECLARE LC_CURSOR_INST_AFEC CURSOR FOR
SELECT SGD_DESCARGOS_INST_AFEC.NRO_INSTALACION, NVL(SGD_INSTALACION.TIPO_INSTALACION, -1)
FROM SGD_DESCARGOS_INST_AFEC, SGD_INSTALACION
WHERE SGD_DESCARGOS_INST_AFEC.NRO_DESCARGO = :gu_comunic.is_comunic.longval1 AND 
	SGD_DESCARGOS_INST_AFEC.NRO_INSTALACION <> :ll_nro_inst_afec AND
	SGD_INSTALACION.NRO_INSTALACION (+) = SGD_DESCARGOS_INST_AFEC.NRO_INSTALACION AND
	SGD_INSTALACION.BDI_JOB (+) = 0; 

// Se obtiene el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
SELECT TIPO_INSTALACION
INTO :li_tipo_inst
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :ll_nro_inst_afec AND BDI_JOB = 0 AND ESTADO = 0;

IF SQLCA.SQLCode = 0 THEN
	gu_comunic1.is_comunic.intval4 = li_tipo_inst
ELSEIF SQLCA.SQLCode = 100 THEN
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede copiar el descargo puesto que la instalaci$$HEX1$$f300$$ENDHEX$$n afectada no existe en la tabla de Instalaciones")
	lb_error = True
ELSE // ERROR
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error a la hora de determinar el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada. " +SQLCA.SQLErrText)
END IF
	
IF lb_Error = False THEN
	
	IF ii_numero_instalaciones > 0 THEN ii_numero_instalaciones --
	
	//Si existe operaciones solo se puede marcar interrupciones en el nivel de tensi$$HEX1$$f300$$ENDHEX$$n que no exista digit. gr$$HEX1$$e100$$ENDHEX$$fica.
	
	IF gb_operaciones = true then
							
		// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada y si por lo tanto permitimos generarla desde SGI 	
		IF gb_operaciones_inst = true then
				
			ll_array[2] = ll_nro_inst_afec
				
			ii_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[], li_tipo_inst)
			
			IF ii_permito = 0 or ii_permito = -1 then // ii_permito = 1 significa que la instalacion y todos sus hijos estan digitalizados
	
				ii_descargo_sgi = 1
			
			ELSE
				ii_descargo_sgi = 0
			
			END IF
			
			tab_1.tabpage_interrupciones.tv_1.deleteitem(1)
			tab_1.tabpage_interrupciones.st_2.text = ""
			
			tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)
			il_instalacion_afect = ll_nro_inst_afec
			
			if ib_otras_inst = true then
				tab_1.tabpage_interrupciones.cb_otra.visible = true
			end if
		ELSE
	
			tab_1.tabpage_interrupciones.tv_1.deleteitem(1)
			tab_1.tabpage_interrupciones.st_2.text = ""
			
			tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)
			il_instalacion_afect = ll_nro_inst_afec
			
			if ib_otras_inst = true then
				tab_1.tabpage_interrupciones.cb_otra.visible = true
			end if
			
			IF li_tipo_inst <= fgci_tipo_salida_mt THEN
				ii_descargo_sgi = 0
			ELSE
				ii_descargo_sgi = 1
			END IF
		END IF
	
	ELSE
		
		tab_1.tabpage_interrupciones.tv_1.deleteitem(1)
		tab_1.tabpage_interrupciones.st_2.text = ""
		
		tab_1.tabpage_interrupciones.tv_1.event ue_cargar(1)
		il_instalacion_afect = ll_nro_inst_afec
		
		if ib_otras_inst = true then
			tab_1.tabpage_interrupciones.cb_otra.visible = true
		end if
		
		IF li_tipo_inst <= fgci_tipo_salida_mt THEN
			ii_descargo_sgi = 0
		ELSE
			ii_descargo_sgi = 1
		END IF
		
	END IF
	
	OPEN LC_CURSOR_INST_AFEC;
	
	IF SQLCA.SQLCode = 0 THEN
	
		DO WHILE SQLCA.SQLCode = 0 AND lb_Error = False
			FETCH LC_CURSOR_INST_AFEC
			INTO :ll_nro_inst_afec, :li_tipo_inst;
	
			IF SQLCA.SQLCode = 0 THEN
				IF li_tipo_inst = -1 THEN
					Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede copiar el descargo puesto que la instalaci$$HEX1$$f300$$ENDHEX$$n afectada con c$$HEX1$$f300$$ENDHEX$$digo " + string(ll_nro_inst_afec) + " no existe en la tabla de Instalaciones")
					lb_error = True
				ELSE
					gu_comunic1.is_comunic.decval1 = ll_nro_inst_afec
					gu_comunic1.is_comunic.intval4 = li_tipo_inst
					il_otra_inst_afec = ll_nro_inst_afec
					il_tipo_otra_inst_afec= li_tipo_inst
					tab_1.tabpage_interrupciones.tv_1.event ue_cargar(2)
					
					if ii_cargada = 0 then
						tab_1.tabpage_interrupciones.cb_otra.visible = true
						tab_1.tabpage_interrupciones.cb_eliminar.visible=true
					elseif ii_cargada = -1 THEN
						lb_error = True // La instalaci$$HEX1$$f300$$ENDHEX$$n no ha sido cargada en el $$HEX1$$e100$$ENDHEX$$rbol
					end if
				END IF
				
			END IF
	
		LOOP
		
		IF SQLCA.SQLCode < 0 THEN // Error
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error de Base de Datos a la hora de determinar las instalaciones afectadas." + SQLCA.SQLErrText)
			lb_error = True
		END IF
		
		CLOSE LC_CURSOR_INST_AFEC;
	ELSE 
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error de Base de Datos a la hora de determinar las instalaciones afectadas." + SQLCA.SQLErrText)
		lb_error = True
	END IF
END IF

Return Not lb_error
end function

public function boolean fw_copiar_datos_interrupcion (long pl_nro_desc_orig);Boolean lb_retorno = True
Long ll_nro_instalacion, ll_fila
Long ll_tvi
Datetime ldt_f_ini, ldt_f_fin
Int li_ind_oop
TreeviewItem le_elemento

// Este cursor trae las instalaciones interrumpidas que todav$$HEX1$$ed00$$ENDHEX$$a dependen de las 
// instalaciones afectadas del descargo

DECLARE LC_CUR_INTERR_COPIA CURSOR FOR
SELECT COD_INSTALACION, 
	   F_INICIO,
	   F_FIN,
	   IND_OOP
FROM SGD_INTERRUPCION_DESCARGO
WHERE NRO_DESCARGO = :pl_nro_desc_orig AND 
	  COD_INSTALACION IN (SELECT NRO_INSTALACION
	  				  	  		 FROM SGD_INSTALACION
						  		 START WITH NRO_INSTALACION IN (SELECT NRO_INSTALACION
						  							 				 	  FROM SGD_DESCARGOS_INST_AFEC
																		  WHERE NRO_DESCARGO = :pl_nro_desc_orig) 
						  						AND BDI_JOB = 0
						  		 CONNECT BY PRIOR NRO_INSTALACION = NRO_INST_PADRE AND BDI_JOB = 0);
						  

// S$$HEX1$$f300$$ENDHEX$$lo se copian las interrupciones si el descargo es del SGI
IF ii_descargo_sgi = 1 THEN						   
							
	OPEN LC_CUR_INTERR_COPIA;
	
	IF SQLCA.SQLCode = 0 THEN
		DO WHILE SQLCA.SQLCode = 0
			FETCH LC_CUR_INTERR_COPIA
			INTO :ll_nro_instalacion, 
				  :ldt_f_ini,
				  :ldt_f_fin,
				  :li_ind_oop;
				  
			IF SQLCA.SQLCode = 0 THEN
				ll_fila=tab_1.tabpage_interrupciones.dw_interrupcion.InsertRow(0)
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'nro_descargo',il_nro_descargo)
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'cod_instalacion',ll_nro_instalacion)
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'f_inicio', ldt_f_ini)
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'f_fin', ldt_f_fin)
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'f_alta',fgnu_fecha_actual())
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'programa','w_7106_copiar')
				tab_1.tabpage_interrupciones.dw_interrupcion.SetItem(ll_fila,'usuario',gs_usuario)
			END IF
		LOOP
		
		IF SQLCA.SQLCode < 0 THEN // Error
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error de BD a la hora de obtener las interrupciones del descargo. " + SQLCA.SQLErrText) 
		END IF
		
		CLOSE LC_CUR_INTERR_COPIA;
	ELSE
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error de BD a la hora de obtener las interrupciones del descargo. " + SQLCA.SQLErrText) 
		lb_retorno = False
	END IF
END IF

ll_tvi = tab_1.tabpage_interrupciones.tv_1.FindItem(RootTreeItem!, 0)

DO WHILE ll_tvi > 0 
	IF tab_1.tabpage_interrupciones.tv_1.getitem(ll_tvi,le_elemento) = 1 THEN
		s_elemento = le_elemento.data
		IF tab_1.tabpage_interrupciones.dw_interrupcion.Find('cod_instalacion=' + string(s_elemento.codigo), 1, tab_1.tabpage_interrupciones.dw_interrupcion.Rowcount()) > 0 THEN
			le_elemento.Bold = TRUE
			tab_1.tabpage_interrupciones.tv_1.SetItem(ll_tvi, le_elemento)	
		END IF
	END IF
	ll_tvi = tab_1.tabpage_interrupciones.tv_1.FindItem(NextTreeItem!, ll_tvi)
	//s_elemento.codigo = ll_nro_instalacion
LOOP

Return lb_retorno


end function

on w_7106_solicitud_descargos_copiar.create
int iCurrent
call super::create
end on

on w_7106_solicitud_descargos_copiar.destroy
call super::destroy
end on

event open;call super::open;long ll_nro_inst_afec
long ll_array[]
Int li_tipo_inst
Boolean lb_error = false

IF tab_1.tabpage_solicitud.dw_datos_solicitud_origen.Retrieve() > 0 THEN

	fw_copiar_datos_solicitud()
	fw_copiar_datos_solicitud_otros()
	IF fw_copiar_datos_inst_afec() = False THEN
		lb_error = TRUE
	END IF
	IF fw_copiar_datos_interrupcion(gu_comunic.is_comunic.longval1) = False THEN
		lb_error = TRUE
	END IF
ELSE
	Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se han podido obtener todos los datos del descargo original")
	lb_error = True
END IF

IF lb_Error THEN 
	Close(This)
END IF
		

end event

type st_bloqueo from w_7106_solicitud_descargos`st_bloqueo within w_7106_solicitud_descargos_copiar
end type

type tab_1 from w_7106_solicitud_descargos`tab_1 within w_7106_solicitud_descargos_copiar
end type

type tabpage_solicitud from w_7106_solicitud_descargos`tabpage_solicitud within tab_1
dw_datos_solicitud_origen dw_datos_solicitud_origen
end type

on tabpage_solicitud.create
this.dw_datos_solicitud_origen=create dw_datos_solicitud_origen
int iCurrent
call super::create
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_datos_solicitud_origen
end on

on tabpage_solicitud.destroy
call super::destroy
destroy(this.dw_datos_solicitud_origen)
end on

type dw_desc_descargo from w_7106_solicitud_descargos`dw_desc_descargo within tabpage_solicitud
end type

type cb_menos from w_7106_solicitud_descargos`cb_menos within tabpage_solicitud
end type

type cb_mas from w_7106_solicitud_descargos`cb_mas within tabpage_solicitud
end type

type dw_puesta_explotacion from w_7106_solicitud_descargos`dw_puesta_explotacion within tabpage_solicitud
end type

type st_3 from w_7106_solicitud_descargos`st_3 within tabpage_solicitud
end type

type cb_1 from w_7106_solicitud_descargos`cb_1 within tabpage_solicitud
end type

type dw_datos_solicitud from w_7106_solicitud_descargos`dw_datos_solicitud within tabpage_solicitud
end type

event dw_datos_solicitud::retrieveend;call super::retrieveend;//string ls_descripcion, ls_prim_desc  // GNU 2-8-2006. Mejora 1/426921
//datawindowchild ddw_desc_descargo
//
//SELECT valor
//INTO :ls_prim_desc
//FROM sgd_valor
//WHERE codif='DESC';
//
//	if fg_verifica_parametro("descripcion descargos") &
//		and (il_nro_descargo >= long(ls_prim_desc)) then
//			
//		tab_1.tabpage_solicitud.dw_desc_descargo.insertrow(0)
//		tab_1.tabpage_solicitud.dw_desc_descargo.visible=true
//		tab_1.tabpage_solicitud.dw_desc_descargo.GetChild('pi_desc_descargo',ddw_desc_descargo)
//		ddw_desc_descargo.SetTransObject(SQLCA)
//		ddw_desc_descargo.retrieve()
//				IF (gu_comunic.is_comunic.longval1 < long(ls_prim_desc)) THEN
//			tab_1.tabpage_solicitud.dw_datos_solicitud.SetItem(1, 'descripcion','')
//		ELSE
//		ls_descripcion= tab_1.tabpage_solicitud.dw_datos_solicitud.GetItemString(1,'descripcion')
//		tab_1.tabpage_solicitud.dw_desc_descargo.setitem(1,"pi_desc_descargo",long(ls_descripcion))
//	end if
//	end if
end event

type gb_solicitud_descargo from w_7106_solicitud_descargos`gb_solicitud_descargo within tabpage_solicitud
end type

type tabpage_otros from w_7106_solicitud_descargos`tabpage_otros within tab_1
end type

type dw_datos_solicitud_otros from w_7106_solicitud_descargos`dw_datos_solicitud_otros within tabpage_otros
end type

type tabpage_interrupciones from w_7106_solicitud_descargos`tabpage_interrupciones within tab_1
end type

type st_sel_causa from w_7106_solicitud_descargos`st_sel_causa within tabpage_interrupciones
end type

type st_causa from w_7106_solicitud_descargos`st_causa within tabpage_interrupciones
end type

type cb_otra from w_7106_solicitud_descargos`cb_otra within tabpage_interrupciones
end type

type dw_seleccion from w_7106_solicitud_descargos`dw_seleccion within tabpage_interrupciones
end type

type cb_desmarcar from w_7106_solicitud_descargos`cb_desmarcar within tabpage_interrupciones
end type

type cb_marcar from w_7106_solicitud_descargos`cb_marcar within tabpage_interrupciones
end type

type st_2 from w_7106_solicitud_descargos`st_2 within tabpage_interrupciones
end type

type st_1 from w_7106_solicitud_descargos`st_1 within tabpage_interrupciones
end type

type tv_1 from w_7106_solicitud_descargos`tv_1 within tabpage_interrupciones
end type

event tv_1::selectionchanging;call super::selectionchanging;// GNU 15-11-2006. Incidencia 0/460037
treeviewitem le_elemento
datetime ldt_inicio, ldt_fin,ldt_sol_inicio, ldt_sol_fin
long ll_fila, ll_fila_datos_solicitud

tab_1.tabpage_interrupciones.tv_1.getitem(oldhandle,le_elemento)
tab_1.tabpage_interrupciones.tv_1.SelectItem(oldhandle)
end event

type gb_2 from w_7106_solicitud_descargos`gb_2 within tabpage_interrupciones
end type

type gb_4 from w_7106_solicitud_descargos`gb_4 within tabpage_interrupciones
end type

type dw_interrupcion from w_7106_solicitud_descargos`dw_interrupcion within tabpage_interrupciones
end type

type gb_1 from w_7106_solicitud_descargos`gb_1 within tabpage_interrupciones
end type

type dw_seccionadores from w_7106_solicitud_descargos`dw_seccionadores within tabpage_interrupciones
end type

type cb_clientes from w_7106_solicitud_descargos`cb_clientes within tabpage_interrupciones
end type

type cb_eliminar from w_7106_solicitud_descargos`cb_eliminar within tabpage_interrupciones
end type

type gb_causa from w_7106_solicitud_descargos`gb_causa within tabpage_interrupciones
end type

type tabpage_int_simulacion from w_7106_solicitud_descargos`tabpage_int_simulacion within tab_1
end type

type dw_int_simulacion from w_7106_solicitud_descargos`dw_int_simulacion within tabpage_int_simulacion
end type

type tabpage_historial from w_7106_solicitud_descargos`tabpage_historial within tab_1
end type

type uo_historial from w_7106_solicitud_descargos`uo_historial within tabpage_historial
end type

type tabpage_instalaciones from w_7106_solicitud_descargos`tabpage_instalaciones within tab_1
end type

type mle_observaciones from w_7106_solicitud_descargos`mle_observaciones within tabpage_instalaciones
end type

type gb_6 from w_7106_solicitud_descargos`gb_6 within tabpage_instalaciones
end type

type tabpage_accion from w_7106_solicitud_descargos`tabpage_accion within tab_1
boolean visible = false
end type

type uo_1 from w_7106_solicitud_descargos`uo_1 within tabpage_accion
end type

type gb_5 from w_7106_solicitud_descargos`gb_5 within w_7106_solicitud_descargos_copiar
end type

type dw_datos_solicitud_origen from datawindow within tabpage_solicitud
boolean visible = false
integer y = 852
integer width = 686
integer height = 400
integer taborder = 41
boolean bringtotop = true
string title = "none"
string dataobject = "d_7004_datos_solicitud"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;String ls_sql, ls_clausula_where, ls_modificacion, ls_select

ls_sql = This.describe("DataWindow.Table.Select")
ls_clausula_where =" WHERE NRO_DESCARGO = "+ string(gu_comunic.is_comunic.longval1)
ls_modificacion = "DataWindow.Table.Select=~" " + ls_sql + ls_clausula_where + "~""
ls_select= This.modify(ls_modificacion)


This.SetTransObject(SQLCA)
end event


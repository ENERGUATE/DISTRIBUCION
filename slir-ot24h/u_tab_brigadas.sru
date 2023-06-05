HA$PBExportHeader$u_tab_brigadas.sru
forward
global type u_tab_brigadas from tab
end type
type tabpage_disponibles from userobject within u_tab_brigadas
end type
type dw_brigadas_disponibles from u_bri_2004_pr_lista_brigadas_disp within tabpage_disponibles
end type
type tabpage_disponibles from userobject within u_tab_brigadas
dw_brigadas_disponibles dw_brigadas_disponibles
end type
type tabpage_no_disponibles from userobject within u_tab_brigadas
end type
type dw_brigadas_no_disponibles from u_bri_2004_pr_lista_brigadas_no_disp within tabpage_no_disponibles
end type
type tabpage_no_disponibles from userobject within u_tab_brigadas
dw_brigadas_no_disponibles dw_brigadas_no_disponibles
end type
end forward

global type u_tab_brigadas from tab
integer width = 2217
integer height = 664
integer taborder = 1
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_disponibles tabpage_disponibles
tabpage_no_disponibles tabpage_no_disponibles
end type
global u_tab_brigadas u_tab_brigadas

type variables
long il_nro_ot
w_2301_form_incidencia iw_contenedora
long il_retrieve = 0

end variables

forward prototypes
public function su_drag_brigada_ot fpr_devolver_brigada (ref datawindow pd_dw, datetime pdt_fecha_desde, long click_row)
public subroutine fpr_actualizar_disponibles (string ps_brigada, long pl_nro_brigada, integer pi_turno, string ps_movil, integer pi_fila, string ps_frec_radio)
public function integer fpr_quitar_brigada (ref datawindow pd_dw, long pl_nro_brigada)
public subroutine fpr_actualizar_dw_no_disp (ref su_drag_brigada_ot ps_estructura, long pl_nro_incidencia, integer pi_estado_actual, datetime pdt_f_deteccion, long pl_nro_instalacion, string ps_instalacion_afectada, integer pi_tipo_incid, integer pi_alcance, long pl_nro_ot, long pl_fila, long pl_cant_cli_afect)
end prototypes

public function su_drag_brigada_ot fpr_devolver_brigada (ref datawindow pd_dw, datetime pdt_fecha_desde, long click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_brigada
// 
// Objetivo: Carga los datos de la data window seleccionada 
//				 en la data window
//	Ambito:	 P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pd_fecha_desde
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
////////////////////////////////////////////////////////////////////////////////////////////////

su_drag_brigada_ot ls_estructura
datetime ld_fecha


//click_row = this.GetClickedrow()	
IF CLICK_ROW > 0 THEN
	ls_estructura.click_row=Click_Row
	ls_estructura.brigada=pd_dw.GetItemString(click_row,"brigada")
	ls_estructura.nro_ot=0
	ls_estructura.nro_brigada=pd_dw.GetItemNumber(click_row,"nro_brigada")
	ls_estructura.usuario=gs_usuario	
	SETNULL(ls_estructura.f_hasta)
	SETNULL(ls_estructura.h_hasta)
	ls_estructura.programa="w_6201"
	ls_estructura.f_desde=pdt_fecha_desde
	ls_estructura.h_desde=pdt_fecha_desde
	ls_estructura.f_actual=fgnu_fecha_actual()
	ls_estructura.h_actual=fgnu_fecha_actual()
	ls_estructura.ind_disponible=0
	ls_estructura.ind_responsable=0
	
	if pd_dw.dataobject='d_con_2004_pr_lista_contratas'  then	
	     ls_estructura.estado=pd_dw.GetItemNumber(click_row,"gi_contratas_estado")
	     ls_estructura.movil=pd_dw.GetItemString(click_row,"telefono")
        ls_estructura.pers_contacta=pd_dw.GetItemString(click_row,"pers_contacto")
    	  ls_estructura.cantidad_ot=pd_dw.GetItemNumber(click_row,"cantidad_ot")
	     ls_estructura.cantidad_tp=pd_dw.GetItemNumber(click_row,"cantidad_tp")		  
	else
			ls_estructura.movil=pd_dw.GetItemString(click_row,"movil")
			ls_estructura.frec_radio = pd_dw.GetItemString(click_row,"frec_radio")
			ls_estructura.tip_brigada=pd_dw.GetItemNumber(click_row,"tip_brigada")

	end if 


ELSE
	ls_estructura.click_row=0
END IF
Return ls_estructura
end function

public subroutine fpr_actualizar_disponibles (string ps_brigada, long pl_nro_brigada, integer pi_turno, string ps_movil, integer pi_fila, string ps_frec_radio);/////////////////////
//
//	Actualiza la datawindow de brigadas disponibles
//
//
//
/////////////////////

long ll_nro_trab  

tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"brigada",ps_brigada)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"nro_centro",gi_nro_centro)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"nro_cmd",gi_nro_cmd)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"nro_mesa",gi_nro_puesto)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"ind_disponible",fgci_disponible)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"movil",ps_movil)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"nro_brigada",pl_nro_brigada)
tabpage_disponibles.dw_brigadas_disponibles.SetItem(pi_fila,"frec_radio",ps_frec_radio)


	UPDATE GI_BRIGADA
	SET IND_DISPONIBLE = 1 
	WHERE NRO_BRIGADA = :pl_nro_brigada
			AND IND_DISPONIBLE = 0;
	
	gnu_u_transaction.uf_commit()
	
	
end subroutine

public function integer fpr_quitar_brigada (ref datawindow pd_dw, long pl_nro_brigada);///////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_quitar_brigada
//
// Objetivo: Quita de la data window la fila seleccionada
//				 
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pi_nro_brigada, pd_dw, pi_turno, pi_disponible
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//
///////////////////////////////////////////////////////////////////////////
long ll_row

ll_row = pd_dw.Find("nro_brigada="+String(pl_nro_brigada),0,pd_dw.RowCount())
pd_dw.SetItem(ll_row,"ind_disponible",fgci_no_disponible)

Return 1 
end function

public subroutine fpr_actualizar_dw_no_disp (ref su_drag_brigada_ot ps_estructura, long pl_nro_incidencia, integer pi_estado_actual, datetime pdt_f_deteccion, long pl_nro_instalacion, string ps_instalacion_afectada, integer pi_tipo_incid, integer pi_alcance, long pl_nro_ot, long pl_fila, long pl_cant_cli_afect);/////////////////////////////
//
//	Actualiza la datawindow de brigadas no disponibles con 
//	los datos de la nueva incidencia a la que esta asignada.
//
//	Recibe como parametro el nro de la brigada, 
//	y realiza los setitem con los demas parametros
//
// Creacion : AFS   04/09/97
//
/////////////////////////////
String ls_estados[]
ls_estados[1] = 'PT'
ls_estados[2] = 'EB'
ls_estados[3] = 'ER'
ls_estados[4] = 'SR'
//long ll_fila

//ll_fila = tabpage_no_disponibles.dw_brigadas_no_disponibles.Find("nro_brigada=" + string(pl_nro_brigada),1,tabpage_no_disponibles.dw_brigadas_no_disponibles.RowCount())

tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_incidencia",pl_nro_incidencia)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"gi_incidencia_est_actual",pi_estado_actual)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"f_deteccion_incidencia",pdt_f_deteccion)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_instalacion",pl_nro_instalacion)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"instalacion_afectada",ps_instalacion_afectada)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"tipo_incidencia",pi_tipo_incid)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_ot",pl_nro_ot)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"frec_radio",ps_estructura.frec_radio)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_brigada",ps_estructura.nro_brigada)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_centro",gi_nro_centro)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_cmd",gi_nro_cmd)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_mesa",gi_nro_puesto)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"ind_disponible",0)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"movil",ps_estructura.movil)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"brigada",ps_estructura.brigada)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"cccli_afec",pl_cant_cli_afect)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"bitmap",'inci_imp.bmp')
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"est_act",ls_estados[pi_estado_actual])

UPDATE GI_BRIGADA
SET IND_DISPONIBLE = 1 
WHERE NRO_BRIGADA = :ps_estructura.nro_brigada
		AND IND_DISPONIBLE = 0;
	
gnu_u_transaction.uf_commit()


end subroutine

on u_tab_brigadas.create
this.tabpage_disponibles=create tabpage_disponibles
this.tabpage_no_disponibles=create tabpage_no_disponibles
this.Control[]={this.tabpage_disponibles,&
this.tabpage_no_disponibles}
end on

on u_tab_brigadas.destroy
destroy(this.tabpage_disponibles)
destroy(this.tabpage_no_disponibles)
end on

event constructor;gu_control_v_incidencias.of_recupera_padre(iw_contenedora,this,"w_2301_form_incidencia")
end event

type tabpage_disponibles from userobject within u_tab_brigadas
integer x = 18
integer y = 112
integer width = 2181
integer height = 536
long backcolor = 81324524
string text = "Brigadas Disponibles"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
long picturemaskcolor = 553648127
dw_brigadas_disponibles dw_brigadas_disponibles
end type

on tabpage_disponibles.create
this.dw_brigadas_disponibles=create dw_brigadas_disponibles
this.Control[]={this.dw_brigadas_disponibles}
end on

on tabpage_disponibles.destroy
destroy(this.dw_brigadas_disponibles)
end on

type dw_brigadas_disponibles from u_bri_2004_pr_lista_brigadas_disp within tabpage_disponibles
integer x = 32
integer y = 24
integer width = 2098
integer height = 500
integer taborder = 3
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;
IF iw_contenedora.tab_1.is_accion_llamada="Consulta" THEN
	Return
END IF

IF row > 0 THEN
	this.SelectRow(0, FALSE)

	this.SetRow(row)
	this.SelectRow(row,true)

	iw_contenedora.tab_1.click_row = row
	this.Drag(Begin!)
END IF

end event

event dragdrop;call super::dragdrop;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragDrop
// 
// Objetivo: 
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
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

int li_brig_permitida, li_fila, li_fila_no_disp=0
int li_cant_brigadas,li_conta,li_cont2,li_cual_es
Datetime ldt_f_nula
datawindow objeto

This.SetRedraw(False)
su_drag_brigada_ot s_estructura 

objeto = source
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_bri_2002_pr_list_brigadas_ot" THEN
		
		long xx
		xx = iw_contenedora.tab_1.click_row_brig_ot
		s_estructura = iw_contenedora.tab_1.f_devolver_brigada_ot(iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot,xx)
		IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemString(xx, 'tipo') = 'Brig.' THEN
			gnu_u_transaction.uf_commit()
			iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.AcceptText()
			li_brig_permitida = iw_contenedora.tab_1.frn_validar_quitar_brigada(iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot,s_estructura.nro_brigada)
			// Si es la brigada mas vieja asignada a la OT, es decir, la brigada
			// cuya fecha de inicio de tareas coincide con  la fecha de EB, o es 
			// la $$HEX1$$fa00$$ENDHEX$$nica brigada asignada, no permito quitarla
			IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
				
				// Borro la brigada de la lista de las asignadas
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.DeleteRow(xx)
				
				// Borro la brigada de las no disponibles
				li_fila_no_disp = tabpage_no_disponibles.dw_brigadas_no_disponibles.Find("nro_brigada=" + string(s_estructura.nro_brigada),1,tabpage_no_disponibles.dw_brigadas_no_disponibles.RowCount())
				tabpage_no_disponibles.dw_brigadas_no_disponibles.DeleteRow(li_fila_no_disp)
		
					// Inserto la brigada entre las disponibles
					li_fila = This.InsertRow(0)
				
					iw_contenedora.tab_1.tabpage_ot.tab_lista_brigadas.fpr_actualizar_disponibles(s_estructura.brigada,s_estructura.nro_brigada, &
					s_estructura.turno,s_estructura.movil,li_fila,s_estructura.frec_radio)

			END IF

			gnu_u_transaction.uf_unlock_brigada(s_estructura.nro_brigada)
		
		// Valida para ver si solo hay una brigada trabajando para mostrar o no el 
		// boton brigada encargada

			iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.accepttext()
			li_cant_brigadas= iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.rowcount()
			
			li_cual_es = 0
			li_conta = 1
			
			// En caso de que la brigada desasignada sea la responsable, se busca una
			// nueva brigada responsable
			if li_cant_brigadas > 1 then
				DO	
					if iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.object.tipo[li_conta] = 'Brig.' AND &
						isnull(iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.object.f_hasta[li_conta]) then
			
						li_cual_es = li_conta
						li_cont2 ++
					end if
					li_conta ++
				LOOP WHILE (li_cual_es = 0 AND li_conta <= li_cant_brigadas)
			
			elseif li_cant_brigadas = 1 THEN 
				IF	iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.object.tipo[1] = 'Brig.' THEN
					li_cual_es = 1
				END IF
			else
				setnull(iw_contenedora.tab_1.il_nro_ot)
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.object.nro_ot[1] = iw_contenedora.tab_1.il_nro_ot
// Modificado por Sgo. 07/07/2005. Mejora Moldavia.
//				iw_contenedora.tab_1.tabpage_ot.st_sin_ot.visible = true
				If gi_pais = 8 Then
					iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Object.nro_ot_t.visible = False
					iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Object.f_prepara_lm.visible = False
				Else
					iw_contenedora.tab_1.tabpage_ot.st_sin_ot.visible = true
				End If
// Fin. Sgo.
			end if 
			
			if li_cual_es > 0 then
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.SetItem(li_cual_es,"Ind_responsable",1)
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.SetFilter("tipo = 'Brig.'")
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.Filter()
			
				IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() <= 1 THEN
					iw_contenedora.tab_1.tabpage_ot.bmp_brigada_responsable.visible=false	
				END IF
			
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.SetFilter("")
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.Filter()
			end if
			
			if li_cant_brigadas = 0 then
				setnull(li_cual_es)
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.Setitem(1,"nom_brigada","")
				iw_contenedora.tab_1.tabpage_formulario.d_inf_general.Setitem(1,"brigada",li_cual_es)
			ELSE
				iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.ScrollToRow(1)
			end if
			
			IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount() = 0 THEN
// Modificado por Sgo. 07/07/2005. Mejora Moldavia.
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Modify("f_prepara_lm.protect=1")
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Modify("f_prepara_lm.background.color="+gs_gris)
// Fin. Sgo.
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Modify("f_hasta.protect=1")
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.Modify("f_hasta.background.color="+gs_gris)
				iw_contenedora.tab_1.tabpage_cuadrillas.enabled = FALSE
				iw_contenedora.tab_1.tabpage_acciones.enabled = FALSE
				SetNull(ldt_f_nula)
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.SetItem(1, 'est_ot', fgci_ot_pendiente)
				iw_contenedora.tab_1.tabpage_ot.d_datos_ot.SetItem(1, 'f_desde', ldt_f_nula)
				IF iw_contenedora.tab_1.ii_incidencia_enviado_brigada <> 0 THEN
					iw_contenedora.tab_1.tabpage_seguimiento.d_seguimiento_operaciones.setitem(iw_contenedora.tab_1.ii_incidencia_enviado_brigada, 'f_alta', ldt_f_nula)
				END IF
				
			END IF

		END IF
	
	END IF
END IF
This.SetRedraw(True)
this.Drag(End!)


end event

event retrieveend;call super::retrieveend;// Filtro por calendario
long ll_fila, ll_contador
long ll_nro_brigada

SetPointer(HourGlass!)

IF rowcount <= 0 THEN Return


// Se recorren ahora cada brigada asignada a la OT y se comprueba si se ha tra$$HEX1$$ed00$$ENDHEX$$do como
// brigada disponible: este caso se puede dar debido a que puede figurar una brigada asignada
// a la OT en la dw d_lista_brigadas_ot y no estar esta informaci$$HEX1$$f300$$ENDHEX$$n todav$$HEX1$$ed00$$ENDHEX$$a en BD, por lo
// que la brigada figurar$$HEX1$$ed00$$ENDHEX$$a como disponible.
FOR ll_contador = 1 TO iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount()
	IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemString(ll_contador, 'tipo') = 'Brig.' THEN
		IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'est_brigada') <> fgci_ot_resuelta THEN 
			ll_nro_brigada = iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'nro_brigada')
			ll_fila = This.Find('nro_brigada = ' + string(ll_nro_brigada), 1, This.RowCount())
			IF ll_fila > 0 THEN
				This.Object.ind_disponible[ll_fila] = 0
			END IF
		END IF
	END IF
NEXT

This.SetFilter('ind_disponible <> 0')
This.Filter()

// Vuelvo a dibujar la pantalla
This.SetRedraw(True)

end event

event ue_as_need;//
end event

event sqlpreview;//
end event

event rowfocuschanged;call super::rowfocuschanged;//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.SelectRow(0, False)

If KeyDown(KeyDownArrow!) Or KeyDown(KeyUpArrow!) Then
	This.SelectRow(currentrow, True)
End If
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type tabpage_no_disponibles from userobject within u_tab_brigadas
integer x = 18
integer y = 112
integer width = 2181
integer height = 536
long backcolor = 81324524
string text = "Brigadas No Disponibles"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
long picturemaskcolor = 536870912
dw_brigadas_no_disponibles dw_brigadas_no_disponibles
end type

on tabpage_no_disponibles.create
this.dw_brigadas_no_disponibles=create dw_brigadas_no_disponibles
this.Control[]={this.dw_brigadas_no_disponibles}
end on

on tabpage_no_disponibles.destroy
destroy(this.dw_brigadas_no_disponibles)
end on

type dw_brigadas_no_disponibles from u_bri_2004_pr_lista_brigadas_no_disp within tabpage_no_disponibles
integer x = 37
integer y = 20
integer width = 2098
integer height = 484
integer taborder = 2
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;
IF iw_contenedora.tab_1.is_accion_llamada="Consulta" THEN
	Return
END IF

IF row > 0 THEN
	this.SelectRow(0, FALSE)
	this.SetRow(row)
	this.SelectRow(row,true)
	
	// Agregado por AFS
	iw_contenedora.tab_1.click_row = row
	this.Drag(Begin!)
END IF
end event

event dragdrop;call super::dragdrop;This.SetRedraw(False)
tabpage_disponibles.dw_brigadas_disponibles.Event dragdrop(source,row,dwo)
This.SetRedraw(True)

end event

event doubleclicked;call super::doubleclicked;int li_ind_disp

if row > 0 then
	gu_comunic.is_comunic.longval1 = dw_brigadas_no_disponibles.object.nro_brigada[row]
	
	SELECT COUNT(*)
	INTO :li_ind_disp
	FROM "GI_BRIGADA"  
	WHERE "NRO_BRIGADA" = :gu_comunic.is_comunic.longval1 AND 
			"IND_DISPONIBLE" = 1;
			
	IF SQLCA.SQLCODE = 0 AND li_ind_disp = 0 THEN
		// La brigada no est$$HEX2$$e1002000$$ENDHEX$$disponible. Esto implica que tiene trabajos.		
		// La brigada reci$$HEX1$$e900$$ENDHEX$$n dragueada seguir$$HEX2$$e1002000$$ENDHEX$$estando disponible en BD hasta que no
		// se grabe. Para evistar que se le asignen tareas, ya que va a tener una OT
		// asociada no se permite abrir la ventana. Esto ocurre cuando li_ind_disp es
		// igual a uno
		gu_comunic.is_comunic.intval1 = gi_nro_centro
		gu_comunic.is_comunic.intval2 = gi_nro_cmd
		gu_comunic.is_comunic.intval3 = gi_nro_puesto
		
		gu_comunic.is_comunic.strval1 = dw_brigadas_no_disponibles.object.brigada[row]
		gu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA"
		gu_comunic.is_comunic.strval2 = 'BR'//DSA
		open(w_6205_consulta_tareas)
	END IF
end if
end event

event sqlpreview;//
end event

event ue_as_need;//
end event

event rowfocuschanged;call super::rowfocuschanged;//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.SelectRow(0, False)

If KeyDown(KeyDownArrow!) Or KeyDown(KeyUpArrow!) Then
	This.SelectRow(currentrow, True)
End If
//***************************************
//**  OSGI 2001.1  	19/03/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event retrieveend;call super::retrieveend;su_drag_brigada_ot s_estructura 
long ll_cant_brig, ll_contador, ll_nro_brigada
long ll_fila, ll_ccli_afec
int li_tip_brigada 
string ls_nom_instalacion

il_retrieve = 1

This.SetRedraw(False)
SetPointer(HourGlass!)

// Anadido por Sgo.
long ll_zona, ll_cmd, ll_sector, ll_exist_brigada

ll_zona = iw_contenedora.tab_1.tabpage_ot.dw_ambito.getitemnumber(1,"nro_centro")
ll_cmd = iw_contenedora.tab_1.tabpage_ot.dw_ambito.getitemnumber(1,"nro_cmd") 
ll_sector = iw_contenedora.tab_1.tabpage_ot.dw_ambito.getitemnumber(1,"nro_mesa")
// Fin. Sgo.

li_tip_brigada = iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.GetitemNumber(1, 'pi_tipo_brig')
ll_cant_brig = iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.RowCount()

FOR ll_contador = 1 TO ll_cant_brig
	IF iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemString(ll_contador, 'tipo') = 'Brig.' THEN
		IF IsNull(iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemDatetime(ll_contador, 'f_hasta')) &
			 AND (li_tip_brigada = fgci_todos OR iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'tip_brigada') = li_tip_brigada) THEN
	
			ll_nro_brigada = iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'nro_brigada')
			
			IF This.Find('nro_brigada = ' + string(ll_nro_brigada), 1, This.RowCount()) = 0 AND &
				( iw_contenedora.tab_1.tabpage_ot.d_crit_seleccion.GetItemNumber(1,"pi_brigadas_en_turno") = 0 &
				  OR gf_brigada_disponible(ll_nro_brigada, fgnu_fecha_actual(), iw_contenedora.dw_brigadas_calendario_rango)) THEN
	
				s_estructura=iw_contenedora.tab_1.f_devolver_brigada_ot(iw_contenedora.tab_1.tabpage_ot.d_lista_brigadas_ot,ll_contador)

// Anadido por Sgo.
				select 1 into :ll_exist_brigada from gi_brigada
				where nro_centro = Decode(:ll_zona, 0, nro_centro, :ll_zona) and
					  nro_cmd = Decode(:ll_cmd, 0, nro_cmd, :ll_cmd) and
					  nro_mesa = Decode(:ll_sector, 0, nro_mesa, :ll_sector) and
					  nro_brigada = :ll_nro_brigada;

				IF SQLCA.SQLCODE = 0 AND ll_exist_brigada = 1 THEN
// Fin. Sgo.

					ls_nom_instalacion = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemString(1,"nombre_instalacion")
					ll_ccli_afec = iw_contenedora.tab_1.tabpage_formulario.d_inf_general.GetItemNumber(1,"ccli_afec")
					ll_fila = This.InsertRow(0)
					fpr_actualizar_dw_no_disp(s_estructura, &
								iw_contenedora.tab_1.il_nro_incidencia,&
								iw_contenedora.tab_1.ii_estado_oper,&
								iw_contenedora.tab_1.idt_fec_deteccion, &
								iw_contenedora.tab_1.idec_nro_instalacion_afectada, &
								ls_nom_instalacion,&
								iw_contenedora.tab_1.ii_tipo_incid, &
								iw_contenedora.tab_1.ii_alcance,&
								iw_contenedora.tab_1.il_nro_ot,&
								ll_fila, &
								ll_ccli_afec)
				End If // Anadido por Sgo.
				
			END IF
		END IF
	END IF
NEXT

This.SetRedraw(True)
end event


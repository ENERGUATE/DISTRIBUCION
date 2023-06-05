HA$PBExportHeader$u_tab_brigadas_avisos.sru
$PBExportComments$Ya modificado
forward
global type u_tab_brigadas_avisos from tab
end type
type tabpage_disponibles from userobject within u_tab_brigadas_avisos
end type
type dw_brigadas_disponibles from u_bri_2004_pr_lista_brigadas_disponibles within tabpage_disponibles
end type
type dw_brigadas_disponibles2 from datawindow within tabpage_disponibles
end type
type tabpage_disponibles from userobject within u_tab_brigadas_avisos
dw_brigadas_disponibles dw_brigadas_disponibles
dw_brigadas_disponibles2 dw_brigadas_disponibles2
end type
type tabpage_no_disponibles from userobject within u_tab_brigadas_avisos
end type
type dw_brigadas_no_disponibles from u_bri_2004_pr_lista_brigadas_no_disp within tabpage_no_disponibles
end type
type tabpage_no_disponibles from userobject within u_tab_brigadas_avisos
dw_brigadas_no_disponibles dw_brigadas_no_disponibles
end type
end forward

global type u_tab_brigadas_avisos from tab
integer width = 2263
integer height = 608
integer taborder = 1
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_disponibles tabpage_disponibles
tabpage_no_disponibles tabpage_no_disponibles
end type
global u_tab_brigadas_avisos u_tab_brigadas_avisos

type variables
u_bri_2004_rn_lista_brigadas ui_bri_2004_rn
long il_nro_ot
long il_retrieve = 0

end variables

forward prototypes
public function su_drag_brigada_ot fpr_devolver_brigada (datetime pd_fecha_desde, integer click_row, ref datawindow pd_dw)
public function integer fnu_quitar_brigada (long click_row, ref datawindow pd_dw)
public subroutine fpr_actualizar_dw_no_disp (ref su_drag_brigada_ot ps_estructura, long pl_nro_incidencia, integer pi_estado_actual, datetime pdt_f_deteccion, long pl_nro_instalacion, string ps_instalacion_afectada, integer pi_tipo_incid, integer pi_ind_suministro, long pl_nro_ot, long pl_fila, long pl_cant_cli_afect)
public subroutine fpr_actualizar_disponibles (string ps_brigada, long pl_nro_brigada, integer pi_turno, string ps_movil, integer pi_fila, string ps_frec_radio)
public function integer fpr_quitar_brigada (long pl_nro_brigada, datawindow pd_dw, integer pi_turno, integer pi_disponible, ref datawindow pd_dw2)
public function integer fpr_agregar_brigada (long pl_nro_brigada, datawindow pd_dw)
end prototypes

public function su_drag_brigada_ot fpr_devolver_brigada (datetime pd_fecha_desde, integer click_row, ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
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


//click_row = pd_dw.GetClickedrow()	
IF CLICK_ROW > 0 THEN
	ls_estructura.click_row=Click_Row
	ls_estructura.nro_ot=0
	ls_estructura.usuario=gs_usuario	
	SETNULL(ls_estructura.f_hasta)
	SETNULL(ls_estructura.h_hasta)
	ls_estructura.programa="w_6201"
	ls_estructura.f_desde=pd_fecha_desde
	ls_estructura.h_desde=pd_fecha_desde
	ls_estructura.f_actual=fgnu_fecha_actual()
	ls_estructura.h_actual=fgnu_fecha_actual()
	ls_estructura.nro_brigada=pd_dw.GetItemNumber(click_row,"nro_brigada")
//dsa ini	
	if pd_dw.dataobject = 'd_con_2004_pr_lista_contratas' then
		ls_estructura.estado = pd_dw.GetItemNumber(click_row,"gi_contratas_estado")// DSA 03/04/2000	
		ls_estructura.brigada=pd_dw.GetItemString(click_row,"brigada")		
		ls_estructura.movil=pd_dw.GetItemString(click_row,"telefono")		
		ls_estructura.pers_contacta=pd_dw.GetItemString(click_row,"pers_contacto")	
		ls_estructura.cantidad_ot=pd_dw.GetItemNumber(click_row,"cantidad_ot")			
		ls_estructura.cantidad_tp=pd_dw.GetItemNumber(click_row,"cantidad_tp")					
	else
		ls_estructura.brigada=pd_dw.GetItemString(click_row,"brigada")		
		ls_estructura.movil=pd_dw.GetItemString(click_row,"movil")
		//ls_estructura.turno=pd_dw.GetItemNumber(click_row,"turno")
		ls_estructura.frec_radio=pd_dw.GetItemstring(click_row,"frec_radio")
		ls_estructura.ind_disponible=0
		ls_estructura.ind_responsable=0	
		ls_estructura.tip_brigada = pd_dw.GetItemNumber(click_row,"tip_brigada")
		
	end if
//dsa fin

//	SetNull(ld_Fecha)
//	ls_estructura.f_hasta=ld_fecha
//	ls_estructura.h_hasta=ld_fecha
//

ELSE
	ls_estructura.click_row=0
END IF
Return ls_estructura
end function

public function integer fnu_quitar_brigada (long click_row, ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_quitar_brigadas
// 
// Objetivo: Borra de la datawindow la fila seleccionada
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: --
//			Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pd_dw.DeleteRow(click_row)

Return 1
end function

public subroutine fpr_actualizar_dw_no_disp (ref su_drag_brigada_ot ps_estructura, long pl_nro_incidencia, integer pi_estado_actual, datetime pdt_f_deteccion, long pl_nro_instalacion, string ps_instalacion_afectada, integer pi_tipo_incid, integer pi_ind_suministro, long pl_nro_ot, long pl_fila, long pl_cant_cli_afect);/////////////////////////////
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

long ll_fila
ll_fila=tabpage_no_disponibles.dw_brigadas_no_disponibles.insertrow(0)
//ll_fila = tabpage_no_disponibles.dw_brigadas_no_disponibles.Find("nro_brigada=" + string(pl_nro_brigada),1,tabpage_no_disponibles.dw_brigadas_no_disponibles.RowCount())

//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"nro_incidencia",pl_nro_incidencia)
//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"gi_incidencia_est_actual",pi_estado_actual)
//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"f_deteccion_incidencia",pdt_f_deteccion)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"instalacion_afectada",pl_nro_instalacion)
//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"instalacion_afectada",ps_instalacion_afectada)
//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"tipo_incidencia",pi_tipo_incid)
//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"ind_suministro",pi_ind_suministro)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"nro_ot",pl_nro_ot)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"nro_brigada",ps_estructura.nro_brigada)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"nro_centro",gi_nro_centro)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"nro_cmd",gi_nro_cmd)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"nro_mesa",gi_nro_puesto)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"ind_disponible",0)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"movil",ps_estructura.movil)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"brigada",ps_estructura.brigada)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(LL_fila,"frec_radio",ps_estructura.frec_radio)
tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(ll_fila,"bitmap","avitelef.bmp")

//tabpage_no_disponibles.dw_brigadas_no_disponibles.SetItem(pl_fila,"f_inicio_tarea_ot",)

UPDATE GI_BRIGADA
SET IND_DISPONIBLE = 1 
WHERE NRO_BRIGADA = :ps_estructura.nro_brigada
		AND IND_DISPONIBLE = 0;
	
gnu_u_transaction.uf_commit()
	
end subroutine

public subroutine fpr_actualizar_disponibles (string ps_brigada, long pl_nro_brigada, integer pi_turno, string ps_movil, integer pi_fila, string ps_frec_radio);/////////////////////
//
//	Actualiza la datawindow de brigadas disponibles
//
//
//
/////////////////////

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

public function integer fpr_quitar_brigada (long pl_nro_brigada, datawindow pd_dw, integer pi_turno, integer pi_disponible, ref datawindow pd_dw2);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_quitar_brigada
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
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_row

ll_row=pd_dw2.Find("nro_brigada="+String(pl_nro_brigada),0,pd_dw2.RowCount())	

pd_dw2.deleterow(ll_row)
//pd_dw2.AcceptText()
//ui_bri_2004_rn=CREATE u_bri_2004_rn_lista_brigadas
//	ui_bri_2004_rn.frn_filtrar_brigadas(pd_dw,pi_turno,pi_disponible)
//DESTROY ui_bri_2004_rn
Return 1
end function

public function integer fpr_agregar_brigada (long pl_nro_brigada, datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_agregar_brigada
// 
// Objetivo: Inserta los datos en la datawindow de la brigada
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
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_row



//Datos de la  brigada

//pd_dw2.SetFilter("")
//pd_dw2.Filter()

ll_row=pd_dw.Find("nro_brigada="+string(pl_nro_brigada),0,pd_dw.RowCount())
pd_dw.SetItem(ll_row,"ind_disponible",fgci_disponible)
//pd_dw2.AcceptText()
//
//ui_bri_2004_rn=CREATE u_bri_2004_rn_lista_brigadas
//	ui_bri_2004_rn.frn_filtrar_brigadas(pd_dw,pi_turno,pi_disponible)
//DESTROY ui_bri_2004_rn
//
//
//Return 1

Return 1
end function

on u_tab_brigadas_avisos.create
this.tabpage_disponibles=create tabpage_disponibles
this.tabpage_no_disponibles=create tabpage_no_disponibles
this.Control[]={this.tabpage_disponibles,&
this.tabpage_no_disponibles}
end on

on u_tab_brigadas_avisos.destroy
destroy(this.tabpage_disponibles)
destroy(this.tabpage_no_disponibles)
end on

type tabpage_disponibles from userobject within u_tab_brigadas_avisos
integer x = 18
integer y = 112
integer width = 2226
integer height = 480
long backcolor = 67108864
string text = "Brigadas Disponibles"
long tabtextcolor = 33554432
long picturemaskcolor = 553648127
dw_brigadas_disponibles dw_brigadas_disponibles
dw_brigadas_disponibles2 dw_brigadas_disponibles2
end type

on tabpage_disponibles.create
this.dw_brigadas_disponibles=create dw_brigadas_disponibles
this.dw_brigadas_disponibles2=create dw_brigadas_disponibles2
this.Control[]={this.dw_brigadas_disponibles,&
this.dw_brigadas_disponibles2}
end on

on tabpage_disponibles.destroy
destroy(this.dw_brigadas_disponibles)
destroy(this.dw_brigadas_disponibles2)
end on

type dw_brigadas_disponibles from u_bri_2004_pr_lista_brigadas_disponibles within tabpage_disponibles
integer x = 50
integer y = 12
integer width = 2167
integer height = 468
integer taborder = 23
string dragicon = "Rows.ico"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;w_6201_asignacion_de_brigada.click_row = Row	//ANG

IF w_6201_asignacion_de_brigada.lu_comunic.is_comunic.accion_llamada="Consulta" THEN
	Return
END IF

IF w_6201_asignacion_de_brigada.click_row > 0 THEN
	this.SelectRow(0, FALSE)

	this.SetRow(w_6201_asignacion_de_brigada.Click_row)
	this.SelectRow(w_6201_asignacion_de_brigada.Click_row,true)
				//Si la ot no esta anulada permito el draged
	fg_SetRow(dw_brigadas_disponibles)
	this.Drag(Begin!)
END IF
end event

event dragdrop;call super::dragdrop;dw_brigadas_disponibles.SetRedraw(False)
su_drag_brigada_ot s_estructura 
long i, ll_cant_row
int li_brig_permitida,li_turno,li_disponible,li_fila,li_fila_no_disp, li_fila_resp, li_conta
datawindow objeto
//datetime ld_fecha_ini_ot
this.accepttext()

objeto=DraggedObject()
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_bri_2002_pr_list_brigadas_ot" THEN
		long xx
		xx=w_6201_asignacion_de_brigada.click_row_brig_ot
		
		IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemString(xx, 'tipo') = 'Brig.' THEN 

			gnu_u_transaction.uf_commit()
			s_estructura=w_6201_asignacion_de_brigada.iu_2002_nu_bri.fnu_devolver_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,w_6201_asignacion_de_brigada.click_row_brig_ot)
			li_brig_permitida=w_6201_asignacion_de_brigada.iu_2002_rn_bri.frn_validar_quitar_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,s_estructura.nro_brigada)

			IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.fnu_quitar_brigada(s_estructura.Click_Row )
	//			li_turno=w_6201_asignacion_de_brigada.iu_2001_nu_bri.fnu_retorna_turno(w_6201_asignacion_de_brigada.d_seleccion_brigada)
	//			li_disponible=w_6201_asignacion_de_brigada.iu_2001_nu_bri.fnu_retorna_disponible(w_6201_asignacion_de_brigada.d_seleccion_brigada)
	//			fpr_agregar_brigada(s_estructura.nro_brigada,dw_brigadas_disponibles)	
	/////
				// Borro la brigada de las no disponibles
				li_fila_no_disp = tabpage_no_disponibles.dw_brigadas_no_disponibles.Find("nro_brigada=" + string(s_estructura.nro_brigada),1,tabpage_no_disponibles.dw_brigadas_no_disponibles.RowCount())
				tabpage_no_disponibles.dw_brigadas_no_disponibles.DeleteRow(li_fila_no_disp)

				// COmpruebo que la brigada no este trabajando en otra OT /tarea antes de
				// ingresarla entre las disponibles
//				li_fila_no_disp = 0
//				
//			  	SELECT "GI_BRIGADA"."IND_DISPONIBLE"  
//				INTO :li_fila_no_disp  
//				FROM "GI_BRIGADA"  
//				WHERE "GI_BRIGADA"."NRO_BRIGADA" = :s_estructura.nro_brigada  ;
//	
//				
//				IF li_fila_no_disp= 1 AND &
//				   gf_brigada_disponible(s_estructura.nro_brigada, fgnu_fecha_actual(), w_6201_asignacion_de_brigada.dw_brigadas_calendario_rango) THEN
				
					// Inserto la brigada entre las disponibles
					li_fila = This.InsertRow(0)
				
					w_6201_asignacion_de_brigada.tab_lista_brigadas.fpr_actualizar_disponibles(s_estructura.brigada,s_estructura.nro_brigada, &
											s_estructura.turno,s_estructura.movil,li_fila,s_estructura.frec_radio)
					This.TriggerEvent('retrieveend')
//				ELSE
//					w_6201_asignacion_de_brigada.d_crit_seleccion.SetColumn('pi_tipo_brig')
//					w_6201_asignacion_de_brigada.d_crit_seleccion.triggerevent("itemchanged")
//				END IF
			END IF
		//END IF
			gnu_u_transaction.uf_unlock_brigada(s_estructura.nro_brigada)
			li_fila_resp = 0
			li_conta = 1
			
			// En caso de que la brigada desasignada sea la responsable, se busca una
			// nueva brigada responsable
			IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() > 1 THEN
				DO	
					if w_6201_asignacion_de_brigada.d_lista_brigadas_ot.object.tipo[li_conta] = 'Brig.' AND &
						isnull(w_6201_asignacion_de_brigada.d_lista_brigadas_ot.object.f_hasta[li_conta]) then
			
						li_fila_resp = li_conta
					end if
					li_conta ++
				LOOP WHILE (li_fila_resp  = 0 AND li_conta <= w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount())
			
			ELSEIF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() = 1 THEN 
				IF	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.object.tipo[1] = 'Brig.' THEN
					li_fila_resp  = 1
				END IF
			end if
			
			if li_fila_resp > 0 then
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.SetItem(li_fila_resp,"Ind_responsable",1)
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.SetFilter("tipo = 'Brig.'")
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.Filter()
			
				IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() <= 1 THEN
					w_6201_asignacion_de_brigada.bmp_brigada_responsable.visible=false	
				END IF
			
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.SetFilter("")
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.Filter()
			end if
			
			IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() = 0 THEN
				w_6201_asignacion_de_brigada.d_datos_ot.object.est_ot[1] = fgci_ot_pendiente
			end if
		END IF
				
						
		//		UPDATE GI_BRIGADA
		//		SET IND_DISPONIBLE = 1 
		//		WHERE NRO_BRIGADA = :s_estructura.nro_brigada;
		//		
		//		IF SQLCA.SQLCode = 0 THEN
		//			DELETE GI_BRIGADA_OT
		//			WHERE NRO_BRIGADA = :s_estructura.nro_brigada
		//					AND NRO_OT = :ll_nro_ot 
		//					AND EST_BRIGADA < :fgci_ot_resuelta;
		//		END IF
	END IF
END IF

dw_brigadas_disponibles.SetRedraw(True)
this.Drag(End!)


end event

event retrieveend;call super::retrieveend;// Filtro por calendario
long ll_fila, ll_contador
long ll_nro_brigada

SetPointer(HourGlass!)

IF rowcount <= 0 THEN Return

// Si no esta seleccionado "Brigadas en turno"
// entonces no filtro
This.SetRedraw(False)


// Se recorren ahora cada brigada asignada a la OT y se comprueba si se ha tra$$HEX1$$ed00$$ENDHEX$$do como
// brigada disponible: este caso se puede dar debido a que puede figurar una brigada asignada
// a la OT en la dw d_lista_brigadas_ot y no estar esta informaci$$HEX1$$f300$$ENDHEX$$n todav$$HEX1$$ed00$$ENDHEX$$a en BD, por lo
// que la brigada figurar$$HEX1$$ed00$$ENDHEX$$a como disponible.
FOR ll_contador = 1 TO w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount()
	IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemString(ll_contador, 'tipo') = 'Brig.' THEN
		ll_nro_brigada = w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'nro_brigada')
		IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'est_brigada') <> fgci_ot_resuelta THEN
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

type dw_brigadas_disponibles2 from datawindow within tabpage_disponibles
boolean visible = false
integer x = 50
integer y = 12
integer width = 2094
integer height = 468
integer taborder = 3
string dragicon = "Rows.ico"
string dataobject = "d_bri_2004_pr_lista_brigadas_disp"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;w_6201_asignacion_de_brigada.click_row = Row	//ANG

IF w_6201_asignacion_de_brigada.lu_comunic.is_comunic.accion_llamada="Consulta" THEN
	Return
END IF

IF w_6201_asignacion_de_brigada.click_row > 0 THEN
	this.SelectRow(0, FALSE)

	this.SetRow(w_6201_asignacion_de_brigada.Click_row)
	this.SelectRow(w_6201_asignacion_de_brigada.Click_row,true)
				//Si la ot no esta anulada permito el draged
	fg_SetRow(dw_brigadas_disponibles)
	this.Drag(Begin!)
END IF
end event

event dragdrop;dw_brigadas_disponibles.SetRedraw(False)
su_drag_brigada_ot s_estructura 
long i, ll_cant_row
int li_brig_permitida,li_turno,li_disponible,li_fila,li_fila_no_disp, li_fila_resp, li_conta
datawindow objeto
//datetime ld_fecha_ini_ot
this.accepttext()

objeto=DraggedObject()
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_bri_2002_pr_list_brigadas_ot" THEN
		long xx
		xx=w_6201_asignacion_de_brigada.click_row_brig_ot
		
		IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemString(xx, 'tipo') = 'Brig.' THEN 

			gnu_u_transaction.uf_rollback()
			s_estructura=w_6201_asignacion_de_brigada.iu_2002_nu_bri.fnu_devolver_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,w_6201_asignacion_de_brigada.click_row_brig_ot)
			li_brig_permitida=w_6201_asignacion_de_brigada.iu_2002_rn_bri.frn_validar_quitar_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,s_estructura.nro_brigada)

			IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
				w_6201_asignacion_de_brigada.d_lista_brigadas_ot.fnu_quitar_brigada(s_estructura.Click_Row )
	//			li_turno=w_6201_asignacion_de_brigada.iu_2001_nu_bri.fnu_retorna_turno(w_6201_asignacion_de_brigada.d_seleccion_brigada)
	//			li_disponible=w_6201_asignacion_de_brigada.iu_2001_nu_bri.fnu_retorna_disponible(w_6201_asignacion_de_brigada.d_seleccion_brigada)
	//			fpr_agregar_brigada(s_estructura.nro_brigada,dw_brigadas_disponibles)	
	/////
				// Borro la brigada de las no disponibles
				li_fila_no_disp = tabpage_no_disponibles.dw_brigadas_no_disponibles.Find("nro_brigada=" + string(s_estructura.nro_brigada),1,tabpage_no_disponibles.dw_brigadas_no_disponibles.RowCount())
				tabpage_no_disponibles.dw_brigadas_no_disponibles.DeleteRow(li_fila_no_disp)

				// COmpruebo que la brigada no este trabajando en otra OT /tarea antes de
				// ingresarla entre las disponibles
				li_fila_no_disp = 0
				
			  	SELECT "GI_BRIGADA"."IND_DISPONIBLE"  
				INTO :li_fila_no_disp  
				FROM "GI_BRIGADA"  
				WHERE "GI_BRIGADA"."NRO_BRIGADA" = :s_estructura.nro_brigada  ;
	
				
				IF li_fila_no_disp= 1 AND &
				   gf_brigada_disponible(s_estructura.nro_brigada, fgnu_fecha_actual(), w_6201_asignacion_de_brigada.dw_brigadas_calendario_rango) THEN
				
					// Inserto la brigada entre las disponibles
					li_fila = This.InsertRow(0)
				
					w_6201_asignacion_de_brigada.tab_lista_brigadas.fpr_actualizar_disponibles(s_estructura.brigada,s_estructura.nro_brigada, &
											s_estructura.turno,s_estructura.movil,li_fila,s_estructura.frec_radio)
					This.TriggerEvent('retrieveend')
				ELSE
					w_6201_asignacion_de_brigada.d_crit_seleccion.SetColumn('pi_tipo_brig')
					w_6201_asignacion_de_brigada.d_crit_seleccion.triggerevent("itemchanged")
				END IF
			END IF
		END IF
		gnu_u_transaction.uf_unlock_brigada(s_estructura.nro_brigada)
	END IF
END IF

dw_brigadas_disponibles.SetRedraw(True)
this.Drag(End!)

li_fila_resp = 0
li_conta = 1

// En caso de que la brigada desasignada sea la responsable, se busca una
// nueva brigada responsable
IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() > 1 THEN
	DO	
		if w_6201_asignacion_de_brigada.d_lista_brigadas_ot.object.tipo[li_conta] = 'Brig.' AND &
			isnull(w_6201_asignacion_de_brigada.d_lista_brigadas_ot.object.f_hasta[li_conta]) then

			li_fila_resp = li_conta
		end if
		li_conta ++
	LOOP WHILE (li_fila_resp  = 0 AND li_conta <= w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount())

ELSEIF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() = 1 THEN 
	IF	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.object.tipo[1] = 'Brig.' THEN
		li_fila_resp  = 1
	END IF
end if

if li_fila_resp > 0 then
	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.SetItem(li_fila_resp,"Ind_responsable",1)
	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.SetFilter("tipo = 'Brig.'")
	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.Filter()

	IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount() <= 1 THEN
		w_6201_asignacion_de_brigada.bmp_brigada_responsable.visible=false	
	END IF

	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.SetFilter("")
	w_6201_asignacion_de_brigada.d_lista_brigadas_ot.Filter()
end if

end event

event doubleclicked;//if row>0 then
//	if this.object.ind_previsto[row]>= 1 then
//		gu_comunic.is_comunic.intval1 = gi_nro_centro
//		gu_comunic.is_comunic.intval2 = gi_nro_cmd
//		gu_comunic.is_comunic.intval3 = gi_nro_puesto
//		gu_comunic.is_comunic.longval1 = dw_brigadas_disponibles.object.nro_brigada[row]
//		gu_comunic.is_comunic.strval1 = dw_brigadas_disponibles.object.brigada[row]
//		gu_comunic.is_comunic.strval2 = 'BR'
//		gu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA"
//		open(w_6205_consulta_tareas)
//	end if
//end if
end event

event retrieveend;// Filtro por calendario
long ll_fila, ll_contador
long ll_nro_brigada

SetPointer(HourGlass!)

IF rowcount <= 0 THEN Return

//IF IsValid(w_2301_form_incidencia) THEN 
//	ll_puesto = w_2301_form_incidencia.tab_1.tabpage_formulario.d_inf_general.Object.nro_mesa[1]
//ELSE
//	Return
//END IF

// Si no esta seleccionado "Brigadas en turno"
// entonces no filtro
This.SetRedraw(False)
//IF w_6201_asignacion_de_brigada.d_crit_seleccion.GetItemNumber(1,"pi_brigadas_en_turno") = 1 THEN
//	
//	FOR ll_fila = 1 TO rowcount
//		ll_nro_brigada = This.Object.nro_brigada[ll_fila]
//		
//		IF NOT gf_brigada_disponible(ll_nro_brigada, fgnu_fecha_actual(), w_6201_asignacion_de_brigada.dw_brigadas_calendario_rango) THEN
//			SetPointer(HourGlass!)
//			This.Object.ind_disponible[ll_fila] = 0
//		END IF
//	NEXT
//	
//	This.SetFilter('ind_disponible <> 0')
//	This.Filter()
//ELSE
//	This.SetFilter('')
//	This.Filter()
//END IF
//
// Se recorren ahora cada brigada asignada a la OT y se comprueba si se ha tra$$HEX1$$ed00$$ENDHEX$$do como
// brigada disponible: este caso se puede dar debido a que puede figurar una brigada asignada
// a la OT en la dw d_lista_brigadas_ot y no estar esta informaci$$HEX1$$f300$$ENDHEX$$n todav$$HEX1$$ed00$$ENDHEX$$a en BD, por lo
// que la brigada figurar$$HEX1$$ed00$$ENDHEX$$a como disponible.
FOR ll_contador = 1 TO w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount()
	IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemString(ll_contador, 'tipo') = 'Brig.' THEN
		ll_nro_brigada = w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'nro_brigada')
		ll_fila = This.Find('nro_brigada = ' + string(ll_nro_brigada), 1, This.RowCount())
		IF ll_fila > 0 THEN
			This.Object.ind_disponible[ll_fila] = 0
		END IF
	END IF
NEXT
This.SetFilter('ind_disponible <> 0')
This.Filter()


// Vuelvo a dibujar la pantalla
This.SetRedraw(True)

end event

event rowfocuschanged;//***************************************
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

type tabpage_no_disponibles from userobject within u_tab_brigadas_avisos
integer x = 18
integer y = 112
integer width = 2226
integer height = 480
long backcolor = 67108864
string text = "Brigadas No Disponibles"
long tabtextcolor = 33554432
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
integer x = 50
integer y = 12
integer width = 2094
integer height = 468
integer taborder = 11
string dragicon = "Rows.ico"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;w_6201_asignacion_de_brigada.click_row = Row	//ANG

IF w_6201_asignacion_de_brigada.lu_comunic.is_comunic.accion_llamada="Consulta" THEN
	Return
END IF

IF w_6201_asignacion_de_brigada.click_row > 0 THEN
	this.SelectRow(0, FALSE)

	this.SetRow(w_6201_asignacion_de_brigada.Click_row)
	this.SelectRow(w_6201_asignacion_de_brigada.Click_row,true)
				//Si la ot no esta anulada permito el draged
	fg_SetRow(dw_brigadas_no_disponibles) //DBE 17/12/1999
	this.Drag(Begin!)                     //DBE 17/12/1999
END IF

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
		open(w_6205_consulta_tareas)
	END IF
end if
end event

event dragdrop;call super::dragdrop;//
//dw_brigadas_no_disponibles.SetRedraw(False)
//su_drag_brigada_ot s_estructura 
//long i, ll_cant_row
//int li_brig_permitida,li_turno,li_disponible,li_fila,li_fila_no_disp
//datawindow objeto
////datetime ld_fecha_ini_ot
//
//objeto=DraggedObject()
//IF typeof(Objeto)=DataWindow! THEN
//	IF objeto.DataObject="d_bri_2002_pr_list_brigadas_ot" THEN
//		long xx
//		xx=w_6201_asignacion_de_brigada.click_row_brig_ot
//		s_estructura=w_6201_asignacion_de_brigada.iu_2002_nu_bri.fnu_devolver_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,w_6201_asignacion_de_brigada.click_row_brig_ot)
//
//		li_brig_permitida=w_6201_asignacion_de_brigada.iu_2002_rn_bri.frn_validar_quitar_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,s_estructura.nro_brigada)
//		IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
//			w_6201_asignacion_de_brigada.d_lista_brigadas_ot.fnu_quitar_brigada(s_estructura.Click_Row )
////			li_turno=w_6201_asignacion_de_brigada.iu_2001_nu_bri.fnu_retorna_turno(w_6201_asignacion_de_brigada.d_seleccion_brigada)
////			li_disponible=w_6201_asignacion_de_brigada.iu_2001_nu_bri.fnu_retorna_disponible(w_6201_asignacion_de_brigada.d_seleccion_brigada)
////			fpr_agregar_brigada(s_estructura.nro_brigada,dw_brigadas_no_disponibles,li_turno,li_disponible,dw_brigadas_no_disponibles)
This.SetRedraw(False)
tabpage_disponibles.dw_brigadas_disponibles.Event dragdrop(source,row,dwo)
This.SetRedraw(True)

/////////////
//			
////////////////////////// DBE 15/12/1999 ha comentado			
////			// Borro la brigada de las no disponibles
////			li_fila_no_disp = This.Find("nro_brigada=" + string(s_estructura.nro_brigada),1,This.RowCount())
////			This.DeleteRow(li_fila_no_disp)
////
////			// Inserto la brigada entre las disponibles
////			li_fila = tabpage_disponibles.dw_brigadas_disponibles.InsertRow(0)
////			
////			w_6201_asignacion_de_brigada.tab_lista_brigadas.fpr_actualizar_disponibles(s_estructura.brigada,s_estructura.nro_brigada, &
////				s_estructura.turno,s_estructura.movil,li_fila,s_estructura.frec_radio)
////////////////////////// DBE 15/12/1999 ha comentado	
//
////DBE ini 15/12/1999
//gnu_u_transaction.uf_rollback(objeto,'GI_BRIGADA','NRO_BRIGADA = '+string(s_estructura.nro_brigada))
//
//w_6201_asignacion_de_brigada.d_crit_seleccion.triggerevent("itemchanged")
////DBE fin 15/12/1999
//
//		END IF
//	END IF
//END IF
//dw_brigadas_no_disponibles.SetRedraw(True)
//this.Drag(End!)
//gnu_u_transaction.uf_rollback(objeto,'GI_BRIGADA','NRO_BRIGADA = '+string(s_estructura.nro_brigada), TRUE)
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
long ll_fila
int li_tip_brigada 
string ls_nomcalle

IF rowcount <= 0 THEN Return

SetPointer(HourGlass!)
This.SetRedraw(False)

li_tip_brigada = w_6201_asignacion_de_brigada.d_crit_seleccion.GetitemNumber(1, 'pi_tipo_brig')
ll_cant_brig = w_6201_asignacion_de_brigada.d_lista_brigadas_ot.RowCount()

FOR ll_contador = 1 TO ll_cant_brig
	IF w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemString(ll_contador, 'tipo') = 'Brig.' THEN
		IF IsNull(w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemDatetime(ll_contador, 'f_hasta')) &
			 AND (li_tip_brigada = fgci_todos OR w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'tip_brigada') = li_tip_brigada) THEN
	
			ll_nro_brigada = w_6201_asignacion_de_brigada.d_lista_brigadas_ot.GetItemNumber(ll_contador, 'nro_brigada')
			
			IF This.Find('nro_brigada = ' + string(ll_nro_brigada), 1, This.RowCount()) = 0 AND &
				(w_6201_asignacion_de_brigada.d_crit_seleccion.GetItemNumber(1,"pi_brigadas_en_turno") = 0 &
				 OR gf_brigada_disponible(ll_nro_brigada, fgnu_fecha_actual(), w_6201_asignacion_de_brigada.dw_brigadas_calendario_rango)) THEN
				 
				s_estructura=w_6201_asignacion_de_brigada.iu_2002_nu_bri.fnu_devolver_brigada_ot(w_6201_asignacion_de_brigada.d_lista_brigadas_ot,ll_contador)
				fpr_actualizar_dw_no_disp(s_estructura, &
												  0,0,fgnu_fecha_actual(), &
												  0,LS_NOMCALLE,1, &
												  1,w_6201_asignacion_de_brigada.d_datos_ot.GETITEMDECIMAL(1,"NRO_OT"),&
												  ll_contador,1)
			END IF
		END IF
	END IF
NEXT

//// Filtro por calendario
//
//// Si no esta seleccionado "Brigadas en turno"
//// entonces no filtro
//
//
//IF w_6201_asignacion_de_brigada.d_crit_seleccion.GetItemNumber(1,"pi_brigadas_en_turno") = 1 THEN
//	
//	FOR ll_fila = 1 TO this.rowcount()
//		ll_nro_brigada = This.Object.nro_brigada[ll_fila]
//		
//		IF NOT gf_brigada_disponible(ll_nro_brigada, fgnu_fecha_actual(), w_6201_asignacion_de_brigada.dw_brigadas_calendario_rango) THEN
//			SetPointer(HourGlass!)
//			This.Object.ind_disponible[ll_fila] = 2
//		END IF
//	NEXT
//	
//	This.SetFilter('ind_disponible <> 2')
//	This.Filter()
//ELSE
//	This.SetFilter('')
//	This.Filter()
//END IF
//
// Vuelvo a dibujar la pantalla
This.SetRedraw(True)



end event

event sqlpreview;//
end event

event ue_as_need;//
end event


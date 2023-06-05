HA$PBExportHeader$w_7006_gest_agrupacion.srw
forward
global type w_7006_gest_agrupacion from w_sgigenerica
end type
type dw_2 from datawindow within w_7006_gest_agrupacion
end type
type dw_1 from datawindow within w_7006_gest_agrupacion
end type
type st_nom_instalacion from statictext within w_7006_gest_agrupacion
end type
type st_nro_descargo from statictext within w_7006_gest_agrupacion
end type
type st_2 from statictext within w_7006_gest_agrupacion
end type
type st_1 from statictext within w_7006_gest_agrupacion
end type
type cb_2 from commandbutton within w_7006_gest_agrupacion
end type
type cb_1 from commandbutton within w_7006_gest_agrupacion
end type
type gb_3 from groupbox within w_7006_gest_agrupacion
end type
type gb_2 from groupbox within w_7006_gest_agrupacion
end type
type gb_1 from groupbox within w_7006_gest_agrupacion
end type
end forward

global type w_7006_gest_agrupacion from w_sgigenerica
int X=837
int Y=588
int Width=1998
int Height=1208
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n Agrupaci$$HEX1$$f300$$ENDHEX$$n"
long BackColor=79741120
dw_2 dw_2
dw_1 dw_1
st_nom_instalacion st_nom_instalacion
st_nro_descargo st_nro_descargo
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
end type
global w_7006_gest_agrupacion w_7006_gest_agrupacion

type variables
long il_fila, il_nro_descargo
boolean ib_desagrupar
Long il_sesion_operacion
end variables

on w_7006_gest_agrupacion.create
int iCurrent
call super::create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.st_nom_instalacion=create st_nom_instalacion
this.st_nro_descargo=create st_nro_descargo
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_2
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.st_nom_instalacion
this.Control[iCurrent+4]=this.st_nro_descargo
this.Control[iCurrent+5]=this.st_2
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_2
this.Control[iCurrent+8]=this.cb_1
this.Control[iCurrent+9]=this.gb_3
this.Control[iCurrent+10]=this.gb_2
this.Control[iCurrent+11]=this.gb_1
end on

on w_7006_gest_agrupacion.destroy
call super::destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_nom_instalacion)
destroy(this.st_nro_descargo)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;call super::open;IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN	
	il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()
END IF

st_nom_instalacion.text = string(gu_comunic.is_comunic.strval9)
st_nro_descargo.text= string(gu_comunic.is_comunic.longval2)
il_nro_descargo = gu_comunic.is_comunic.longval4
dw_1.settransObject(sqlca)
dw_1.retrieve(gu_comunic.is_comunic.longval1)

il_fila = dw_1.find (" nro_descargo = " + string(il_nro_Descargo), 1, dw_1.rowcount())
if il_fila > 0 then
  	dw_1.setitem(il_fila,"seleccionada",1)
	dw_1.selectrow(il_fila,true)
   dw_1.accepttext()
end if
end event

event close;long ll_nro_descargo,ll_fila
int li_indice
IF ib_desagrupar THEN
	ll_fila = dw_1.getselectedrow(ll_fila)

	do while ll_fila > 0 
		ll_nro_descargo = dw_1.getitemnumber(ll_fila,"nro_descargo")
		IF ll_nro_descargo <> gu_comunic.is_comunic.longval4 THEN
			gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
		END IF
		ll_fila = dw_1.getselectedrow(ll_fila)        
	loop
END IF
end event

type dw_2 from datawindow within w_7006_gest_agrupacion
int X=366
int Y=416
int Width=494
int Height=360
int TabOrder=20
boolean Visible=false
string DataObject="d_7006_gest_agrupacion"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_1 from datawindow within w_7006_gest_agrupacion
int X=55
int Y=232
int Width=1847
int Height=680
int TabOrder=10
string DataObject="d_7006_gest_agrupacion"
boolean Border=false
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
boolean LiveScroll=true
end type

event clicked;// No deja seleccionar el descargo origen del agrupamiento
if row = il_fila or row = 0 then
        return
end if
if row > 0 then
// Marco y desmarco la fila pulsada
	if (this.getselectedrow(row - 1) = row) then
			  this.selectrow(row,false)
			  if this.getselectedrow(0) = 0 then 
					cb_1.enabled = false
			  end if	
	else
			  this.selectrow(row,true)
				cb_1.enabled = true
	end if
end if
end event

type st_nom_instalacion from statictext within w_7006_gest_agrupacion
int X=1216
int Y=104
int Width=677
int Height=64
boolean Enabled=false
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_nro_descargo from statictext within w_7006_gest_agrupacion
int X=590
int Y=104
int Width=238
int Height=64
boolean Enabled=false
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within w_7006_gest_agrupacion
int X=846
int Y=104
int Width=421
int Height=64
boolean Enabled=false
string Text="Instalaci$$HEX1$$f300$$ENDHEX$$n:"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_7006_gest_agrupacion
int X=69
int Y=104
int Width=786
int Height=64
boolean Enabled=false
string Text="Nro. Descargo:"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_2 from commandbutton within w_7006_gest_agrupacion
int X=1079
int Y=944
int Width=416
int Height=108
int TabOrder=60
string Text="&Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;gnu_u_transaction.uf_rollback()
close(parent)
end event

type cb_1 from commandbutton within w_7006_gest_agrupacion
int X=357
int Y=944
int Width=434
int Height=108
int TabOrder=40
boolean Enabled=false
string Text="&Desagrupar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Desagrupa el descargo y lo marca como solicitado
long ll_fila = 0
long ll_filas_seleccionadas = 0 
long ll_nro_fila_seleccionada = 0 
long ll_nro_descargo = 0
long ll_lista_desc[]
int li_islocked, li_res = 1
int li_hay_trabajos, li_tension, li_tipo_instalacion
string ls_mensaje
Datetime ldt_f_ini, ldt_f_fin

ll_fila = dw_1.getselectedrow(ll_fila)

IF ll_fila > 0 THEN
	ll_nro_descargo = dw_1.getitemnumber(ll_fila,"nro_descargo")
	
	ll_filas_seleccionadas = dw_1.getselectedrow(ll_filas_seleccionadas)
	do while ll_filas_seleccionadas > 0 
		ll_nro_fila_seleccionada ++
		ll_filas_seleccionadas =  dw_1.getselectedrow(ll_filas_seleccionadas)
	loop
	

	if ll_nro_fila_seleccionada + 1 = dw_1.rowcount() then 
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La agrupaci$$HEX1$$f300$$ENDHEX$$n debe contener al menos dos descargos", Information!)
		gnu_u_transaction.uf_rollback()
		return
	end if
	
		
	// SI  ES DE OPERACIONES ES NECESARIO COMPROBAR SI SE HA CAIDO EL SERVIDOR O
	// HA HABIDO UN CORTE EN LA COMUNICACION, QUE PUEDA HACER QUE NO ESTE BLOQUEADA
	
	// SI ES DE OPERACION entonces
	IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
		if gu_rf_servidor_operacion.of_actualiza_icono() = 0  then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que no se puede conectar con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n",Information!)
			gnu_u_transaction.uf_rollback()
			Close(Parent)
			RETURN
			
		elseif gu_rf_servidor_operacion.of_devuelve_sesion() <> il_sesion_operacion then 
			// SE HA PRODUCIDO UN CORTE
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que se ha producido un corte en la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n", Information!)
			gnu_u_transaction.uf_rollback()
			close(Parent)
			RETURN
		end if
	end if
	
	do while ll_nro_descargo > 0 and li_res = 1
		
		li_islocked=gnu_u_transaction.uf_lock(parent,'SGD_DESCARGOS','NRO_DESCARGO = '+ string(ll_nro_descargo),fgci_bloqueo_descargo,ll_nro_descargo)  	
		if li_islocked <> 0 then 
			gnu_u_transaction.uf_rollback()
			ib_desagrupar = true
			close(Parent)
			return
		end if
	 
		UPDATE "SGD_DESCARGOS"  
			SET "ESTADO" = :fgci_descargo_solicitado,   
			"NRO_AGRUPACION" = 0  
		WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo   ;
		
		IF SQLCA.SQLCODE <> 0 THEN
			li_res = 0
			ls_mensaje = "No se han podido desagrupar los Descargos debido a que no se ha podido actualizar el estado del Descargo " + string(ll_nro_descargo)
		END IF

		IF li_res > 0 THEN
			
			ll_lista_desc[upperBound(ll_lista_desc) + 1] = ll_nro_descargo
			
			ldt_f_ini = dw_1.getitemDatetime(ll_fila, 'f_ini_solicitado')
			ldt_f_fin = dw_1.getitemDatetime(ll_fila, 'f_fin_solicitado')
			
			IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_solicitado, &
											 ldt_f_ini, ldt_f_fin, fgnu_fecha_actual(), "", 0) = FALSE THEN
	
				messagebox("Aviso","El descargo no ha podido ser desagrupado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
				li_res = 0
			END IF
		END IF
		
		IF li_res > 0 THEN
			SELECT "SGD_DESCARGOS_AGRUPADOS"."NRO_AGRUPACION"  
			INTO :gu_comunic.is_comunic.longval3 
			FROM "SGD_DESCARGOS_AGRUPADOS"  
			WHERE "SGD_DESCARGOS_AGRUPADOS"."NRO_DESCARGO" = :ll_nro_descargo   ;
	
			DELETE FROM "SGD_DESCARGOS_AGRUPADOS"  
			WHERE "SGD_DESCARGOS_AGRUPADOS"."NRO_DESCARGO" = :ll_nro_descargo   ;
			
			IF SQLCA.SQLCODE <> 0 THEN
				li_res = 0
				ls_mensaje = "No se han podido desagrupar los Descargos debido a que no se ha podido borrar de la agrupaci$$HEX1$$f300$$ENDHEX$$n el Descargo " + string(ll_nro_descargo)
			END IF
	
		END IF
	//	DELETE FROM "SGD_DESCARGOS_TRABAJOS"
	//	WHERE "SGD_DESCARGOS_TRABAJOS"."NRO_DESCARGO" = :ll_nro_descargo;
	
		IF li_res > 0 THEN
			DELETE FROM SGD_DESCARGOS_TRABAJOS   
			WHERE NRO_DESCARGO  = :il_nro_descargo AND 
				  COD_OBRA || COD_TRABAJO IN (SELECT COD_OBRA || COD_TRABAJO
														FROM SGD_DESCARGOS_TRABAJOS
														WHERE NRO_DESCARGO = :ll_nro_descargo);
		
			IF SQLCA.SQLCODE <> 0 THEN
				li_res = 0
				ls_mensaje = "No se han podido desagrupar los Descargos debido a que no se han podido desagrupar los trabajos del Descargo " + string(ll_nro_descargo)
			END IF
		END IF
		
	//	DELETE FROM "SGD_INSTALACIONES_DESCARGO"
	//	WHERE "SGD_INSTALACIONES_DESCARGO"."NRO_DESCARGO" = :ll_nro_descargo;
		IF li_res > 0 THEN
			DELETE FROM SGD_INSTALACIONES_DESCARGO
			WHERE NRO_DESCARGO = :il_nro_descargo AND
					IDENTIFICADOR_INSTALACION IN (SELECT IDENTIFICADOR_INSTALACION
															FROM SGD_INSTALACIONES_DESCARGO
															WHERE NRO_DESCARGO = :ll_nro_descargo);
			IF SQLCA.SQLCODE <> 0 THEN
				li_res = 0
				ls_mensaje = "No se han podido desagrupar los Descargos debido a que no se han podido desagrupar las instalaciones del Descargo " + string(ll_nro_descargo)
			END IF
		END IF
		
		//Elimino las otras instalaciones asociadas con el descargo.
		
		IF li_res > 0 THEN
			DELETE FROM SGD_DESCARGOS_INST_AFEC
			WHERE NRO_DESCARGO = :il_nro_descargo;
			IF SQLCA.SQLCODE <> 0 THEN
				li_res = 0
				ls_mensaje = "No se han podido desagrupar los Descargos debido a que no se han podido desagrupar las otras instalaciones del Descargo " + string(ll_nro_descargo)
			END IF
		END IF
		
		// Restauro los trabajos bdi
		IF li_res > 0 THEN	
			UPDATE "SGD_TRABAJOS_BDI"
				SET "NRO_DESCARGO" = :ll_nro_descargo,
				"DESC_ANTIGUO" = 0
			WHERE "DESC_ANTIGUO" = :ll_nro_descargo;
		
			IF SQLCA.SQLCODE <> 0 THEN
				li_res = 0
				ls_mensaje = "No se han podido desagrupar los Descargos debido a que no se han podido desagrupar los trbajos de BDI del Descargo " + string(ll_nro_descargo)
			END IF
		END IF
		
		ll_fila = dw_1.getselectedrow(ll_fila)        
		IF ll_fila > 0 THEN
			ll_nro_descargo = dw_1.getitemnumber(ll_fila,"nro_descargo")
		ELSE
			ll_nro_descargo = 0
		END IF
	
	loop
	
	
	//dw_1.rowscopy(1, dw_1.rowcount(),Primary!,dw_2,1,Primary!)
	//parent.triggerevent(Open!)
	//
	
	IF li_res > 0 THEN
		// Si no quedan descargos agrupados borra el agrupador
		dw_2.settransObject(sqlca)
		dw_2.retrieve(gu_comunic.is_comunic.longval1)
		
		if dw_2.rowcount() < 1 then
				  
			ll_nro_descargo = long(st_nro_descargo.text)
			
			IF gb_operaciones THEN
				SELECT SGD_INSTALACION.TENSION, SGD_INSTALACION.TIPO_INSTALACION
				INTO :li_tension, :li_tipo_instalacion
				FROM SGD_DESCARGOS, SGD_INSTALACION
				WHERE SGD_DESCARGOS.COD_INST_ORIGEN = SGD_INSTALACION.NRO_INSTALACION
						AND SGD_INSTALACION.BDI_JOB = 0 
						AND SGD_DESCARGOS.NRO_DESCARGO = :ll_nro_descargo;
			END IF
			
			DELETE FROM "SGD_INTERRUPCION_DESCARGO"  
			WHERE "NRO_DESCARGO" = :ll_nro_descargo   ;
					
			DELETE FROM "SGD_DESCARGOS"  
			WHERE "NRO_DESCARGO" = :ll_nro_descargo   ;
			
			DELETE FROM "SGD_DESCARGOS_INST_AFEC"  
			WHERE "NRO_DESCARGO" = :ll_nro_descargo   ;
			
			DELETE FROM "SGD_ESTADOS_DESCARGO"  
			WHERE "NRO_DESCARGO" = :ll_nro_descargo   ;
			
			IF gb_operaciones THEN
				IF (li_tension <=gi_tension_nivel_min AND li_tipo_instalacion <> fgci_tipo_ct) then 	
					li_res = gu_rf_servidor_operacion.of_baja_simulacion_descargo(ll_nro_descargo, ls_mensaje)
					IF li_res = 0 THEN
						ls_mensaje = "No se ha podido realizar la desagrupaci$$HEX1$$f300$$ENDHEX$$n de Descargos debido al siguiente error: " + ls_mensaje
					END IF
				END IF
			END IF
		end if
		
		SELECT COUNT(*) 
		INTO :li_hay_trabajos
		FROM "SGD_TRABAJOS_BDI"
		WHERE "SGD_TRABAJOS_BDI"."NRO_DESCARGO" = :il_nro_descargo;
		
		IF li_hay_trabajos = 0 THEN
			UPDATE "SGD_DESCARGOS"
			SET 	"SGD_DESCARGOS"."IND_ACT_GRAFICA" = 0
			WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_nro_descargo;
		END IF
	END IF
	
	if li_res > 0 then
		gnu_u_transaction.uf_commit();
	else
		gnu_u_transaction.uf_rollback();
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje, Information!)
	end if
	
	ib_desagrupar = true
END IF

close(parent)

end event

type gb_3 from groupbox within w_7006_gest_agrupacion
int X=37
int Y=188
int Width=1883
int Height=736
int TabOrder=50
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_2 from groupbox within w_7006_gest_agrupacion
int X=37
int Y=44
int Width=1883
int Height=144
int TabOrder=20
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_7006_gest_agrupacion
int X=14
int Y=4
int Width=1929
int Height=1068
int TabOrder=30
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


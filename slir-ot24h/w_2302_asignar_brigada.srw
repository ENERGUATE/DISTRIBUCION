HA$PBExportHeader$w_2302_asignar_brigada.srw
$PBExportComments$Ya modificado
forward
global type w_2302_asignar_brigada from w_sgigenerica
end type
type dw_asigancion_brigada from u_inc_2302_pr_asociar_brigada within w_2302_asignar_brigada
end type
type cb_aceptar from commandbutton within w_2302_asignar_brigada
end type
type cb_cancelar from commandbutton within w_2302_asignar_brigada
end type
end forward

global type w_2302_asignar_brigada from w_sgigenerica
int X=1047
int Y=728
int Width=1568
int Height=936
WindowType WindowType=response!
long BackColor=79741120
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
dw_asigancion_brigada dw_asigancion_brigada
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_2302_asignar_brigada w_2302_asignar_brigada

type variables
//integer ii_estado_inc
//integer  ii_nro_brigada
//DateTime idt_fecha_fin_trabajo
//string is_nombre_inst
string is_ventana_llamante
string is_accion_llamada
DataWindowChild l_brigada
DataWindowChild l_estado_incidencia
DataWindowChild l_estado_aviso
DataWindowChild l_tarea

string is_nom_instalacion  
string is_nom_instalacion_nueva
string is_nom_brigada
datetime idt_fecha_deteccion
long  il_nro_incidencia
long li_tarea
long li_estado
long ll_nro_inst
long li_nro_brigada
datetime idt_f_tarea_pendiente
int ii_unica_brigada
end variables

forward prototypes
public function boolean fnu_fecha_valida (datetime pdt_fecha_valida)
end prototypes

public function boolean fnu_fecha_valida (datetime pdt_fecha_valida);//////////////////////////////////////////////
// FUNCION : fnu_fecha_valida
//
//	OBJETIVO	:	Valida que la fecha no sea mayor a la fecha del d$$HEX1$$ed00$$ENDHEX$$a,
//					que no exista una tarea u ot con fecha de inicio asignada 
//					mayor ala la fecha indicada.
///////////////////////////////////////////////

IF (idt_f_tarea_pendiente > pdt_fecha_valida) THEN
	gnv_msg.f_mensaje("EA25",string(idt_f_tarea_pendiente),"",Ok!)
	//MessageBox("Error"," La fecha debe ser mayor a la fecha de inicio de la tarea pendiente de finalizacion ("+string(idt_f_tarea_pendiente)+")")
	Return FALSE
END IF

IF  pdt_fecha_valida > fgnu_fecha_actual() THEN
	gnv_msg.f_mensaje("EA26","","",Ok!)
	//MessageBox("Error","La fecha debe ser menor a la fecha y hora actual")
	Return FALSE
END IF

IF  Isnull(pdt_fecha_valida) THEN
	gnv_msg.f_mensaje("EG22","","",Ok!)
	//MessageBox("Error","La fecha no puede ser nula")
	Return FALSE
END IF

return True


end function

on w_2302_asignar_brigada.create
int iCurrent
call super::create
this.dw_asigancion_brigada=create dw_asigancion_brigada
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_asigancion_brigada
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_cancelar
end on

on w_2302_asignar_brigada.destroy
call super::destroy
destroy(this.dw_asigancion_brigada)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
//
//  Venta w_2302_asiganaci$$HEX1$$f300$$ENDHEX$$n de brigadas
//		Evento : Open
//
//		Objetivo : Solicitar una fecha de fin de tareas de la brigada
//					para las tareas que se encuentra realizando.
//					Esta ventana se llamara cuando se asigna la brigada
//					a una OT y la brigada esta No Disponible (esta trabajando
//					en la OT o Tarea a la cual se des asignara) o cuando se le 
//					asigna una Tarea y la brigada esta no disponible idem que
//             el caso anterior.
//					Se manejaran 2 dw que seran cambiadas dinamicamente segun
//					la ventana llamante.
//						
//		Parametros Entrada :
//								gu_comunic.is_comunic
//						accion_llamada 	= "ot" o "tarea"
//						programa llmante 	= "w_2301" o "w_6205"
//									longval3	=	nro_brigada
//									intval2	=	estado de la incidencia
//									longval4	=  nro_tarea o nro de OT
//									intval4	=  (1 = unica brigada, 0 = mas de una)
//									longval1 = 	nro Instalaci$$HEX1$$f300$$ENDHEX$$n
//									longval2 =  nro de la Incidencia
//									strval1	= 	Nombre de la instalacion
//									strval2	= 	Nombre de la Brigada
//									strval3 	=	Nombre de la instalacion de la nueva
//													incidencia a la cual va a ser asignada
//									datval1	=	fecha de inicio de la tarea pendiente
//									datval2	=	fecha de deteccion de la nueva incidencia
//													a la cual va a ser asignada
//
//		Parametros de Salida: ----
//////////////////////////////////////////////////////////////////////////
long ll_nro_brig
int li_lock_status

this.title = "Asignaci$$HEX1$$f300$$ENDHEX$$n de fecha de finalizaci$$HEX1$$f300$$ENDHEX$$n de Trabajos"

li_nro_brigada = gu_comunic.is_comunic.longval3
li_estado = gu_comunic.is_comunic.intval2
li_tarea = gu_comunic.is_comunic.longval4
ii_unica_brigada = gu_comunic.is_comunic.intval4
ll_nro_inst = gu_comunic.is_comunic.longval1
il_nro_incidencia = gu_comunic.is_comunic.longval2
is_nom_instalacion = gu_comunic.is_comunic.strval1
is_nom_brigada = gu_comunic.is_comunic.strval2
is_nom_instalacion_nueva = gu_comunic.is_comunic.strval3
idt_f_tarea_pendiente = gu_comunic.is_comunic.datval1
idt_fecha_deteccion = gu_comunic.is_comunic.datval2
is_accion_llamada = gu_comunic.is_comunic.accion_llamada
is_ventana_llamante = gu_comunic.is_comunic.programa_llamante

//// No se permite que otro usuario modifique los datos del registro
// La brigada ya ha sido bloqueada en u_tab_2301_form_incidencia o en w_6201_asignacion_brigada
//li_lock_status=gnu_u_transaction.uf_lock(TRUE, This,'GI_BRIGADA','NRO_BRIGADA = '+string(li_nro_brigada))
	
IF li_lock_status <> 0 THEN	 
	// Otro usuario ya ha bloqueado el registro. No se permite asignar la brigada a la OT
	gu_comunic.is_comunic.accion_retorno="cancelado"
	gu_comunic.is_comunic.programa_retorno="w_2302"
	Close(This)
	Return
END IF

IF is_accion_llamada = "ot" THEN
	//asigno la Dw para asignar fecha de fin de OT
	IF il_nro_incidencia <> 0 THEN
		dw_asigancion_brigada.DataObject = "d_inc_2302_from_asociar_brigada"

		dw_asigancion_brigada.GetChild('l_estado_incidencia', l_estado_incidencia)
		l_estado_incidencia.SetTransObject(SQLCA)
		l_estado_incidencia.Retrieve('E_OP')	

		dw_asigancion_brigada.InsertRow(0)
	
		//Inserto valores por defecto
		dw_asigancion_brigada.SetItem(1,"l_brigada",is_nom_brigada)
		dw_asigancion_brigada.SetItem(1,"l_estado_incidencia",li_estado)
		dw_asigancion_brigada.SetItem(1,"s_nom_instalacion_afectada",is_nom_instalacion)
		dw_asigancion_brigada.SetItem(1,"dt_fecha_fin_tarea",fgnu_fecha_actual())
	ELSE
		dw_asigancion_brigada.DataObject = "d_inc_2302_from_asociar_brigada_3"

		dw_asigancion_brigada.GetChild('l_estado_aviso', l_estado_aviso)
		l_estado_aviso.SetTransObject(SQLCA)
		l_estado_aviso.Retrieve()	

		dw_asigancion_brigada.InsertRow(0)
	
		//Inserto valores por defecto
		dw_asigancion_brigada.SetItem(1,"l_brigada",is_nom_brigada)
		dw_asigancion_brigada.SetItem(1,"l_estado_aviso",li_estado)
		dw_asigancion_brigada.SetItem(1,"s_nom_instalacion_afectada",is_nom_instalacion)
		dw_asigancion_brigada.SetItem(1,"dt_fecha_fin_tarea",fgnu_fecha_actual())
	END IF
ELSE
	//accion_llamada = tarea"
	//asigno la Dw de asignaci$$HEX1$$f300$$ENDHEX$$n de finalizaci$$HEX1$$f300$$ENDHEX$$n de tarea
	dw_asigancion_brigada.DataObject = "d_inc_2302_from_asociar_brigada2"
	
	//cargo las Ddw
	dw_asigancion_brigada.GetChild('l_tarea', l_tarea)
	l_tarea.SetTransObject(SQLCA)
	l_tarea.Retrieve()	
	
	dw_asigancion_brigada.GetChild('l_brigada', l_brigada)
	l_brigada.SetTransObject(SQLCA)
	l_brigada.Retrieve()

	dw_asigancion_brigada.InsertRow(0)
	
	//Inserto valores por defecto
	dw_asigancion_brigada.SetItem(1,"l_brigada",li_nro_brigada)
	dw_asigancion_brigada.SetItem(1,"l_tarea",li_tarea)
	dw_asigancion_brigada.SetItem(1,"dt_fecha_fin_tarea",fgnu_fecha_actual())	
END IF

gu_comunic.is_comunic.accion_retorno="cancelado"
gu_comunic.is_comunic.programa_retorno="w_2302"

// Se comprueba que la brigada permanezca asignada a la OT
SELECT nro_brigada 
INTO :ll_nro_brig 
FROM "GI_BRIGADA_OT"  
WHERE nro_brigada = :li_nro_brigada AND 
		f_hasta is Null AND 
		est_brigada = :fgci_ot_trabajando AND
		nro_ot = :li_tarea;


IF sqlca.sqlcode <> 0  THEN //DBE 17/12/1999
//	gnv_msg.f_mensaje("EI39","","",OK!) 
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Esta Brigada no se puede asignar porque probablemente ha cambiado de estado. Pruebe a refrescar los datos.")//MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Esta Brigada est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otra estaci$$HEX1$$f300$$ENDHEX$$n")
	//	rollback; //DBE 15/12/1999
	//gnu_u_transaction.uf_rollback(THIS, TRUE);//DBE 15/12/1999
	
	Close(This)
END IF
end event

type dw_asigancion_brigada from u_inc_2302_pr_asociar_brigada within w_2302_asignar_brigada
int X=41
int Y=52
int Width=1467
int TabOrder=10
string DataObject="d_inc_2302_from_asociar_brigada2"
boolean Border=true
BorderStyle BorderStyle=StyleBox!
boolean Resizable=true
end type

type cb_aceptar from commandbutton within w_2302_asignar_brigada
int X=233
int Y=708
int Width=302
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Aceptar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;datetime ldt_fecha
integer li_brigada_nula, li_ind_responsable
long ll_brigada, ll_nro_ot_brigada_drag, ll_inc
string ls_descripcion, ls_observacion_inc
SetNull(li_brigada_nula)

//gnu_u_transaction.uf_rollback(PARENT, TRUE)
dw_asigancion_brigada.AcceptText()
ldt_fecha = dw_asigancion_brigada.GetItemDateTime(1,"dt_fecha_fin_tarea")
IF fnu_fecha_valida(ldt_fecha) THEN

	SELECT ID_REPONSABLE, NRO_OT 
	INTO :li_ind_responsable, :ll_nro_ot_brigada_drag
	FROM GI_BRIGADA_OT
	WHERE NRO_OT = :gu_comunic.is_comunic.longval4 AND
			NRO_BRIGADA = :li_nro_brigada AND
			EST_BRIGADA = :fgci_ot_trabajando;

	IF SQLCA.SQLCode <> 0 THEN	 
		gu_comunic.is_comunic.accion_retorno="cancelado"
		gu_comunic.is_comunic.programa_retorno="w_2302"
		//gnu_u_transaction.uf_rollback() 
		// Se ha producido un error a la hora de asociar la brigada a la OT
		gnv_msg.f_mensaje("EO06", "", "", OK!)
		Close(Parent)
		Return
	END IF
	
	IF li_ind_responsable = 1 THEN 
		// La OT se ha quedado sin brigada responsable, ya que la brigada escogida era la 
		// responsable de la OT. Se asigna como responsable otra de las brigadas.
		SELECT MAX(nro_brigada)
		INTO :ll_brigada
		FROM GI_BRIGADA_OT
		WHERE NRO_OT = :ll_nro_ot_brigada_drag AND
				NRO_BRIGADA <> :li_nro_brigada AND
				EST_BRIGADA = :fgci_ot_trabajando;
		
		IF SQLCA.SQLCode = 0 THEN
			
			UPDATE "GI_BRIGADA_OT"  
	      SET "ID_REPONSABLE" = 1
		   WHERE NRO_OT = :ll_nro_ot_brigada_drag AND
					nro_brigada = :ll_brigada;
				
			IF SQLCA.SQLCode <> 0 THEN	 
				gu_comunic.is_comunic.accion_retorno="cancelado"
				gu_comunic.is_comunic.programa_retorno="w_2302"
				gnu_u_transaction.uf_rollback() 
				// Se ha producido un error a la hora de asociar la brigada a la OT
				gnv_msg.f_mensaje("EO06", "", "", OK!)				
				Close(Parent)
				Return
			END IF
			
			// Se comprueba si la OT pertenece a una incidencia
			SELECT COUNT(*)
			INTO :ll_inc
			FROM SGD_INCIDENCIA
			WHERE "OT" = :ll_nro_ot_brigada_drag;
			
			IF SQLCA.SQLCode = 0 THEN	
				// Como la OT es de una incidencia se actualiza la brigada responsable de la
				// incidencia
				UPDATE "SGD_INCIDENCIA"  
				SET "NRO_BRIGADA" = :ll_brigada
				WHERE "OT" = :ll_nro_ot_brigada_drag;
		 
				IF SQLCA.SQLCode <> 0 THEN	 
					gu_comunic.is_comunic.accion_retorno="cancelado"
					gu_comunic.is_comunic.programa_retorno="w_2302"
					gnu_u_transaction.uf_rollback() 
					// Se ha producido un error a la hora de asociar la brigada a la OT
					gnv_msg.f_mensaje("EO06", "", "", OK!)
					Close(Parent)
				END IF
			END IF
				
		//ELSE
			//gu_comunic.is_comunic.accion_retorno="cancelado"
			//gu_comunic.is_comunic.programa_retorno="w_2302"
			//gnu_u_transaction.uf_rollback() 
			// Se ha producido un error a la hora de asociar la brigada a la OT
			//gnv_msg.f_mensaje("EO06", "", "", OK!)
			//Close(Parent)
			//Return
		END IF
	END IF
	// Le pongo la fecha escogida por el usuario a la tarea/OT que tenia asignada la brigada
	UPDATE "GI_BRIGADA_OT"  
     SET "F_HASTA" = :ldt_fecha,   
        "H_HASTA" = :ldt_fecha,
		  "EST_BRIGADA" = :fgci_ot_resuelta,
		  "ID_REPONSABLE" = 0
	  WHERE nro_brigada = :li_nro_brigada
		 AND nro_ot = :gu_comunic.is_comunic.longval4 ;

	IF SQLCA.SQLCode <> 0 THEN	 
		gu_comunic.is_comunic.accion_retorno="cancelado"
		gu_comunic.is_comunic.programa_retorno="w_2302"
		gnu_u_transaction.uf_rollback() 
		// Se ha producido un error a la hora de asociar la brigada a la OT
		gnv_msg.f_mensaje("EO06", "", "", OK!)
		Close(Parent)
		Return
	END IF
	
	// Actualizo el estado de la brigada el la tabla gi_brigada
//	UPDATE "GI_BRIGADA" SET "IND_DISPONIBLE" = :fgci_disponible
//		WHERE "NRO_BRIGADA" = :li_nro_brigada ;
		 
//	IF SQLCA.SQLCode <> 0 THEN	 
//		gu_comunic.is_comunic.accion_retorno="cancelado"
//		gu_comunic.is_comunic.programa_retorno="w_2302"
//		gnu_u_transaction.uf_rollback() 
//		// Se ha producido un error a la hora de asociar la brigada a la OT
//		gnv_msg.f_mensaje("EO06", "", "", OK!)
//		Close(Parent)
//		Return
//	END IF
	
	IF is_accion_llamada = "ot" THEN
		
		// Obtengo la observacion de la incidencia a la cual esta asociada la brigada
		// y le concateno el texto
		SELECT observacion into :ls_observacion_inc from sgd_incidencia
			where nro_incidencia = :il_nro_incidencia;
		
	   ls_descripcion =ls_observacion_inc+". La brigada " + is_nom_brigada + " fue derivada a la incidencia sobre la instalaci$$HEX1$$f300$$ENDHEX$$n " + is_nom_instalacion_nueva //+ " con fecha de detecci$$HEX1$$f300$$ENDHEX$$n " + string(idt_fecha_deteccion)
		IF len(ls_descripcion) > 250 THEN
			ls_descripcion = Mid(ls_descripcion, 0, 250)
		END IF
		
		UPDATE "SGD_INCIDENCIA"  
   		SET "OBSERVACION" = :ls_descripcion 
		WHERE "NRO_INCIDENCIA" = :il_nro_incidencia;
		
		IF SQLCA.SQLCode <> 0 THEN	 
			gu_comunic.is_comunic.accion_retorno="cancelado"
			gu_comunic.is_comunic.programa_retorno="w_2302"
			gnu_u_transaction.uf_rollback() 
			// Se ha producido un error a la hora de asociar la brigada a la OT
			gnv_msg.f_mensaje("EO06", "", "", OK!)
			Close(Parent)
			Return
		END IF
			 
	// Si es la $$HEX1$$fa00$$ENDHEX$$nica brigada asignada a la incidencia, 
	// actualizo la tabla incidencia (sin brigada seleccionada)
		IF ii_unica_brigada = 1 THEN
			
		  UPDATE "SGD_INCIDENCIA"  
		  	SET "NRO_BRIGADA" = :li_brigada_nula
		  	where "NRO_INCIDENCIA" = :il_nro_incidencia;
		 
		 	IF SQLCA.SQLCode <> 0 THEN	 
				gu_comunic.is_comunic.accion_retorno="cancelado"
				gu_comunic.is_comunic.programa_retorno="w_2302"
				gnu_u_transaction.uf_rollback() 
				// Se ha producido un error a la hora de asociar la brigada a la OT
				gnv_msg.f_mensaje("EO06", "", "", OK!)
				Close(Parent)
			END IF
			  
		END IF
	END IF
	
//	COMMIT; //DBE 15/12/1999
//   gnu_u_transaction.uf_commit(THIS, TRUE)//DBE 15/12/1999
	
	gu_comunic.is_comunic.accion_retorno = "aceptado"
	gu_comunic.is_comunic.programa_retorno="w_2302"
	gu_comunic.is_comunic.datval1 = ldt_fecha
	Close(Parent)
	
END IF

Return 
end event

type cb_cancelar from commandbutton within w_2302_asignar_brigada
int X=914
int Y=708
int Width=302
int Height=108
int TabOrder=3
boolean BringToTop=true
string Text="&Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;gu_comunic.is_comunic.accion_retorno="cancelado"
gu_comunic.is_comunic.programa_retorno="w_2302"

Close(Parent)

end event


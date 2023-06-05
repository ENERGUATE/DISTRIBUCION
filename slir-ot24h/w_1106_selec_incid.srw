HA$PBExportHeader$w_1106_selec_incid.srw
forward
global type w_1106_selec_incid from Window
end type
type cb_nueva from commandbutton within w_1106_selec_incid
end type
type cb_abrir from commandbutton within w_1106_selec_incid
end type
type dw_lista from u_inc_2001_pr_lista_inc within w_1106_selec_incid
end type
end forward

global type w_1106_selec_incid from Window
int X=293
int Y=764
int Width=3077
int Height=888
boolean TitleBar=true
string Title=" Apertura / Generaci$$HEX1$$f300$$ENDHEX$$n de Incidencias para la Instalaci$$HEX1$$f300$$ENDHEX$$n: "
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
string Icon="incicon.ico"
cb_nueva cb_nueva
cb_abrir cb_abrir
dw_lista dw_lista
end type
global w_1106_selec_incid w_1106_selec_incid

type variables
long il_nro_instalacion
long il_nro_inc
long il_nro_ot
int ii_tip_inc
u_generico_comunicaciones iu_gen_comunic_w_1106
long il_pepe
datetime idt_f_desde
end variables

on w_1106_selec_incid.create
this.cb_nueva=create cb_nueva
this.cb_abrir=create cb_abrir
this.dw_lista=create dw_lista
this.Control[]={this.cb_nueva,&
this.cb_abrir,&
this.dw_lista}
end on

on w_1106_selec_incid.destroy
destroy(this.cb_nueva)
destroy(this.cb_abrir)
destroy(this.dw_lista)
end on

event open;/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: open
//
// Objetivo: Validar el modo en el que se abrir$$HEX2$$e1002000$$ENDHEX$$la ventana
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
// Fecha            	Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         		-----------             		---------
// 09/02/2000	    FDO						Validar el modo en el que se abre la ventana
//		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 iu_gen_comunic_w_1106= CREATE u_generico_comunicaciones 

 iu_gen_comunic_w_1106.is_comunic  = gu_comunic.is_comunic

IF iu_gen_comunic_w_1106.is_comunic.accion_llamada = "Alta_nivel_instalacion" THEN
	gu_comunic.is_comunic.accion_retorno = 'No_resetear'
END IF

// Dependiendo de la accion con la que llamo actuo de una u otra forma
 
il_nro_instalacion =  iu_gen_comunic_w_1106.is_comunic.longval1

idt_f_desde = iu_gen_comunic_w_1106.is_comunic.datval2
if isnull(idt_f_desde) then
	
	Select min(f_desde) 
	into :idt_f_desde
	from gi_ot 
	where est_ot < 3;
	
end if

if gu_comunic.is_comunic.intval8 = 3 then // es de calidad se lo pasamos a la datawindow al hacer el retrieve
	ii_tip_inc = 1
else
	ii_tip_inc = 0
end if

if iu_gen_comunic_w_1106.is_comunic.intval1 = 1 then
	
	// Apertura por incidencia
	
	dw_lista.settransobject(sqlca)

	dw_lista.retrieve(il_nro_instalacion,ii_tip_inc)

	this.title=this.title + " " + iu_gen_comunic_w_1106.is_comunic.strval1
	
	if gu_comunic.is_comunic.programa_llamante= "w_1105_avisos_con_alim" THEN
		if gu_comunic.is_comunic.intval10 = 1 then
			cb_nueva.enabled = false
		else
			cb_nueva.enabled = true
		end if
	end if
	
else
	
	if iu_gen_comunic_w_1106.is_comunic.intval3 = 1 then
		cb_nueva.visible=false
		cb_abrir.x=1262
		cb_abrir.y=628
	end if
	
	gu_comunic.is_comunic.longval4 = 0
	// Apertura por ot
	
	dw_lista.dataobject =  "d_inc_2001_pr_lista_ot"
	
	dw_lista.settransobject(sqlca)

	dw_lista.retrieve(il_nro_instalacion,idt_f_desde)

	this.title= "Apertura / Generaci$$HEX1$$f300$$ENDHEX$$n de OT's para la Instalaci$$HEX1$$f300$$ENDHEX$$n: " + iu_gen_comunic_w_1106.is_comunic.strval1
	
	this.icon= "ot.ico"
	
	this.cb_abrir.text = "Abrir OT"
	
	this.cb_nueva.text = "Nueva OT"

end if


end event

type cb_nueva from commandbutton within w_1106_selec_incid
int X=1605
int Y=628
int Width=411
int Height=100
int TabOrder=20
string Text="Nueva Inc."
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;w_1106_selec_incid lw_1106_ot

setpointer(hourglass!)

if gu_comunic.is_comunic.programa_llamante= "w_1105_avisos_con_alim" THEN
	//IF iu_gen_comunic.is_comunic.accion_llamada <> "Alta_nivel_instalacion" OR &
	//	gu_comunic.is_comunic.intval1 = 1  then
	if gu_comunic.is_comunic.intval1=1 then
		gu_comunic.is_comunic.accion_llamada = "Alta_nivel_instalacion"
		gu_comunic.is_comunic.intval1 = 2
		IF gu_comunic.is_comunic.longval4 = 1 THEN
			parent.visible = false
			open(lw_1106_ot)
		END IF
		gu_control_v_incidencias.of_abre_ventana(-1,-1,w_operaciones,3) 
		close(parent)
	elseif  iu_gen_comunic_w_1106.is_comunic.accion_llamada <> "Alta_nivel_instalacion" THEN
		gu_comunic1.is_comunic.accion_llamada = "Alta"
		gu_comunic1.is_comunic.longval2 = il_nro_ot
		gu_comunic1.is_comunic.decval1 = il_nro_instalacion 		
		gu_comunic1.is_comunic.intval3 = gu_comunic.is_comunic.intval3
		gu_comunic1.is_comunic.intval4 = gu_comunic.is_comunic.intval4
		gu_comunic1.is_comunic.intval5 = gu_comunic.is_comunic.intval5
		//parent.visible = false
		open(w_6201_asignacion_de_brigada)
		close(parent)
	else
		close(parent)
	end if
else
	close(parent)
end if


end event

type cb_abrir from commandbutton within w_1106_selec_incid
int X=978
int Y=628
int Width=411
int Height=100
int TabOrder=20
boolean Enabled=false
string Text="Abrir Inc."
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Int li_result_func,li_lock_status,li_respuesta
long ll_nro_brig_bloq

setpointer(hourglass!)


if  iu_gen_comunic_w_1106.is_comunic.intval1=1 then
	
	if  iu_gen_comunic_w_1106.is_comunic.programa_llamante <> "w_1105_avisos_con_alim" then
		fgnu_resetear_s_comunicaciones( iu_gen_comunic_w_1106)
		fgnu_resetear_s_comunicaciones(gu_comunic)
		fgnu_resetear_s_comunicaciones(gu_comunic1)
		 iu_gen_comunic_w_1106.is_comunic.programa_llamante="w_1234_consulta_incidencia"
	END IF
	
	 iu_gen_comunic_w_1106.is_comunic.accion_llamada = "Modificacion"
	 iu_gen_comunic_w_1106.is_comunic.longval3= il_nro_inc
	
	// Bloqueo la incidencia.
	
	if  iu_gen_comunic_w_1106.is_comunic.programa_llamante <> "w_1105_avisos_con_alim" then
	
		li_result_func=gnu_u_transaction.uf_lock(w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
	
	else
		
		li_result_func=gnu_u_transaction.uf_lock(w_1105_avisos_con_alim, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
		
	end if
	
	
	gu_comunic.is_comunic = iu_gen_comunic_w_1106.is_comunic
	
	setpointer(hourglass!)
	
	if li_result_func = -1 or li_result_func = -54 then
		gu_comunic.is_comunic.accion_llamada="Consulta"
	ELSEIF li_result_func = -2 THEN
		if  iu_gen_comunic_w_1106.is_comunic.programa_llamante <> "w_1105_avisos_con_alim" then
			gnu_u_transaction.uf_rollback( w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + STRING(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
		else
			gnu_u_transaction.uf_rollback( w_1105_avisos_con_alim, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + STRING(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
		end if
		closewithreturn(parent,il_nro_inc)
		return
	END IF	
	
	// A$$HEX1$$f100$$ENDHEX$$adido Pacho
	// Se comprueba si existen brigadas asociadas a la incidencia bloqueadas
	
	if gu_comunic.is_comunic.accion_llamada <> "Consulta" then
		
		SELECT COUNT(GI_BRIGADA.NRO_BRIGADA)
		INTO :ll_nro_brig_bloq
		FROM SGD_INCIDENCIA, GI_BRIGADA_OT, GI_BRIGADA
		WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = :il_nro_inc AND
				SGD_INCIDENCIA.OT = GI_BRIGADA_OT.NRO_OT AND
				GI_BRIGADA_OT.NRO_BRIGADA = GI_BRIGADA.NRO_BRIGADA AND
				GI_BRIGADA_OT.EST_BRIGADA <= :fgci_ot_resuelta AND
				GI_BRIGADA.IND_BLOQUEO = 1;
			
		IF SQLCA.SQLCode = 0 AND ll_nro_brig_bloq > 0 THEN
			// Existen brigadas bloqueadas, hay que indic$$HEX1$$e100$$ENDHEX$$rselo al usuario y abrir la 
			// incidencia en modo consulta
			IF messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Algunas de las brigadas asociadas a la incidencia se encuentran siendo utilizadas por otro usuario. $$HEX1$$bf00$$ENDHEX$$Desea abrir en modo consulta?",information!,yesno!) = 1 then
				li_lock_status = -1
			ELSE
				li_lock_status = -2
			END IF
		END IF

	
		IF li_lock_status = -1  THEN
			gu_comunic.is_comunic.accion_llamada="Consulta"
		ELSEIF li_lock_status = -2 THEN
			if  iu_gen_comunic_w_1106.is_comunic.programa_llamante <> "w_1105_avisos_con_alim" then
				gnu_u_transaction.uf_rollback( w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + STRING(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
			else
				gnu_u_transaction.uf_rollback( w_1105_avisos_con_alim, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + STRING(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
			end if
			closewithreturn(parent,il_nro_inc)
			return
		END IF
		
	end if	
		
	IF gu_control_v_incidencias.of_abre_ventana( iu_gen_comunic_w_1106.is_comunic.longval3,-1,w_operaciones,3) < 1 THEN
		// No puede abrir luego desbloqueo la incidencia
		if  iu_gen_comunic_w_1106.is_comunic.programa_llamante <> "w_1105_avisos_con_alim" then
			gnu_u_transaction.uf_rollback( w_1234_consulta_incidencias, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + STRING(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
		else
			gnu_u_transaction.uf_rollback( w_1105_avisos_con_alim, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + STRING(il_nro_inc),fgci_bloqueo_incidencia,il_nro_inc)
		end if
	END IF
						
	closewithreturn(parent,il_nro_inc)
	return
else
	//*******************************************
	//**  OSGI 2001.2  	07/08/2002				 **
	//**  Jair Padilla / Soluziona PANAMA  	 **
	//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
	//*******************************************
	If fg_valida_ot_antig(il_nro_ot, 1) > 0 Then Return	
	//*******************************************
	//**  OSGI 2001.2  	07/08/2002				 **
	//**  Jair Padilla / Soluziona PANAMA  	 **
	//**  PM001 RESTRICCION N DIAS ANTIG$$HEX1$$dc00$$ENDHEX$$EDAD  **
	//*******************************************



	IF ISNULL( iu_gen_comunic_w_1106.is_comunic.accion_llamada) OR &
		iu_gen_comunic_w_1106.is_comunic.accion_llamada <> "Alta_nivel_instalacion" THEN
		gu_comunic1.is_comunic.accion_llamada = "Modificacion"
		gu_comunic1.is_comunic.longval2 = il_nro_ot
		gu_comunic1.is_comunic.decval1 = il_nro_instalacion 		
		gu_comunic1.is_comunic.intval3 = gu_comunic.is_comunic.intval3
		gu_comunic1.is_comunic.intval4 = gu_comunic.is_comunic.intval4
		gu_comunic1.is_comunic.intval5 = gu_comunic.is_comunic.intval5
		
		w_1106_selec_incid.visible=true
		
		// BLOQUEO LA OT
			
		li_result_func=gnu_u_transaction.uf_lock(parent, "GI_OT", "NRO_OT=" + string(il_nro_ot),fgci_bloqueo_ot,il_nro_ot)
		
		if li_result_func < 0 then
			return
		end if
		
		OPEN(w_6201_asignacion_de_brigada)
		
		gnu_u_transaction.uf_commit( parent, "GI_OT", "NRO_OT=" + STRING(il_nro_ot),fgci_bloqueo_ot,il_nro_ot)
		
	ELSE
		
		li_result_func=gnu_u_transaction.uf_lock(w_1234_consulta_incidencias, "GI_OT", "NRO_OT=" + string(il_nro_ot),fgci_bloqueo_ot,il_nro_ot)
		
		if li_result_func < 0 then
			return
		end if
		
		gu_comunic.is_comunic.accion_retorno = 'No_resetear'
		gu_comunic.is_comunic.longval4 = il_nro_ot
		gnu_u_transaction.uf_commit( parent, "GI_OT", "NRO_OT=" + STRING(il_nro_ot),fgci_bloqueo_ot,il_nro_ot)		
	END IF
	
	closewithreturn(parent,il_nro_ot)
	return
END IF
end event

type dw_lista from u_inc_2001_pr_lista_inc within w_1106_selec_incid
int X=32
int Y=28
int Height=532
int TabOrder=10
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
end type

event clicked;call super::clicked;long fila_ant


if row > 0 then

	if  iu_gen_comunic_w_1106.is_comunic.intval1=1 then
		
		il_nro_inc=this.object.sgd_incidencia_nro_incidencia[row]
		
	else
		
		il_nro_ot=this.object.gi_ot_nro_ot[row]
		
	end if
	
	this.selectrow(0,False)
	fila_ant = row
	this.selectrow(row,true)
	cb_abrir.enabled=true
	
end if

end event

event doubleclicked;call super::doubleclicked;if row >0 then
	if  iu_gen_comunic_w_1106.is_comunic.intval1 = 1 then
		il_nro_inc=this.object.sgd_incidencia_nro_incidencia[row]
		cb_abrir.triggerevent(clicked!)
	else
		il_nro_ot=this.object.gi_ot_nro_ot[row]
		cb_abrir.triggerevent(clicked!)
	end if
end if
end event


HA$PBExportHeader$u_2030_ambito_estadisticas.sru
forward
global type u_2030_ambito_estadisticas from userobject
end type
type cb_2 from commandbutton within u_2030_ambito_estadisticas
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within u_2030_ambito_estadisticas
end type
type cb_1 from commandbutton within u_2030_ambito_estadisticas
end type
end forward

global type u_2030_ambito_estadisticas from userobject
integer width = 1106
integer height = 616
boolean border = true
long backcolor = 79741120
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_2 cb_2
dw_ambito dw_ambito
cb_1 cb_1
end type
global u_2030_ambito_estadisticas u_2030_ambito_estadisticas

type variables
string is_ventana
end variables

on u_2030_ambito_estadisticas.create
this.cb_2=create cb_2
this.dw_ambito=create dw_ambito
this.cb_1=create cb_1
this.Control[]={this.cb_2,&
this.dw_ambito,&
this.cb_1}
end on

on u_2030_ambito_estadisticas.destroy
destroy(this.cb_2)
destroy(this.dw_ambito)
destroy(this.cb_1)
end on

type cb_2 from commandbutton within u_2030_ambito_estadisticas
integer x = 553
integer y = 480
integer width = 329
integer height = 88
integer taborder = 3
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;
if is_ventana = "Avisos_int_horario" then
	w_2030_estadisticas.tab_1.int_horario.cb_buscar.enabled=w_2030_estadisticas.tab_1.ib_cb_buscar
	w_2030_estadisticas.tab_1.int_horario.p_avanza.enabled=w_2030_estadisticas.tab_1.ib_p_avanza
	w_2030_estadisticas.tab_1.int_horario.p_retrocede.enabled=w_2030_estadisticas.tab_1.ib_p_retrocede
	w_2030_estadisticas.tab_1.int_horario.cbx_3.enabled=w_2030_estadisticas.tab_1.ib_cbx_3
	w_2030_estadisticas.tab_1.int_horario.pb_1.enabled=w_2030_estadisticas.tab_1.ib_pb_1
	w_2030_estadisticas.tab_1.int_horario.pb_2.enabled=w_2030_estadisticas.tab_1.ib_pb_2
	w_2030_estadisticas.tab_1.int_horario.em_fecha.enabled=w_2030_estadisticas.tab_1.ib_em_fecha
	w_2030_estadisticas.tab_1.int_horario.dw_tipo.modify("tipo_aviso.background.color=" + string(65536*255+256*255+255))
	//w_2030_estadisticas.tab_1.int_horario.dw_tipo.SetTabOrder("tipo_aviso",10)
	w_2030_estadisticas.tab_1.int_horario.dw_tipo.enabled = true
	//w_2030_estadisticas.tab_1.int_horario.st_centro.visible=true   // comentado LFE
	w_2030_estadisticas.tab_1.ib_ambito_abierto=false
	w_2030_estadisticas.tab_1.int_horario.u_amb.visible = false
	w_2030_estadisticas.tab_1.int_horario.cbx_1.enabled=w_2030_estadisticas.tab_1.ib_cbx_1
	w_2030_estadisticas.tab_1.int_horario.dw_usuario.enabled=w_2030_estadisticas.tab_1.ib_dw_usuario
	w_2030_estadisticas.tab_1.int_horario.dw_usuario.modify("usuario.background.color=" + w_2030_estadisticas.tab_1.is_color_dw_usuario)

	if w_2030_estadisticas.tab_1.il_nro_centro=0 AND &
		w_2030_estadisticas.tab_1.il_nro_cmd=0 then
		
		w_2030_estadisticas.tab_1.int_horario.cbx_3.checked=false
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.ENABLED=TRUE
	elseif w_2030_estadisticas.tab_1.il_nro_centro <> 0 then
		
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.checked=false
		w_2030_estadisticas.tab_1.int_horario.cbx_3.checked=true
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.ENABLED=FALSE
		
	elseif w_2030_estadisticas.tab_1.il_nro_cmd <> 0 then
		
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.checked=true
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.ENABLED=FALSE
		w_2030_estadisticas.tab_1.int_horario.cbx_3.checked=true
		
	end if

end if

if is_ventana = "Avisos_por_duracion" then
	w_2030_estadisticas.tab_1.avisos_pendientes.cb_buscar2.enabled=w_2030_estadisticas.tab_1.ib_cb_buscar_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.p_avanzar.enabled=w_2030_estadisticas.tab_1.ib_p_avanza_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.p_retroceder.enabled=w_2030_estadisticas.tab_1.ib_p_retrocede_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.enabled=w_2030_estadisticas.tab_1.ib_cbx_4_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.pb_3.enabled=w_2030_estadisticas.tab_1.ib_pb_3_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.pb_5.enabled=w_2030_estadisticas.tab_1.ib_pb_5_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_tipo_pend.modify("tipo_aviso.background.color=" + string(65536*255+256*255+255))
	//w_2030_estadisticas.tab_1.avisos_pendientes.dw_tipo_pend.SetTabOrder("tipo_aviso",10)
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_tipo_pend.enabled = true
	//w_2030_estadisticas.tab_1.avisos_pendientes.st_centro_dur.visible=true   // comentado LFE
	w_2030_estadisticas.tab_1.ib_ambito_abierto_dur=false
	w_2030_estadisticas.tab_1.avisos_pendientes.u_amb_dur.visible = false	
	w_2030_estadisticas.tab_1.avisos_pendientes.cbx_2.enabled=w_2030_estadisticas.tab_1.ib_cbx_2
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_usuario_dur.enabled=w_2030_estadisticas.tab_1.ib_dw_usuario_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_usuario_dur.modify("usuario.background.color=" + w_2030_estadisticas.tab_1.is_color_dw_usuario_dur)
	
	if w_2030_estadisticas.tab_1.il_nro_centro_dur=0 AND &
		w_2030_estadisticas.tab_1.il_nro_cmd_dur=0 then
		
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.checked=false
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.ENABLED=TRUE
	elseif w_2030_estadisticas.tab_1.il_nro_centro_dur <> 0 then
		
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.checked=false
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.checked=true
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.ENABLED=FALSE
		
	elseif w_2030_estadisticas.tab_1.il_nro_cmd_dur <> 0 then
		
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.checked=true
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.ENABLED=FALSE
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.checked=true
		
	end if
end if
if is_ventana = "Situacion_actual" then
	w_2033_situacion_actual.p_avanzar.enabled=w_2033_situacion_actual.ib_p_avanzar
	w_2033_situacion_actual.p_retroceder.enabled=w_2033_situacion_actual.ib_p_retroceder
	w_2033_situacion_actual.pb_1.enabled=w_2033_situacion_actual.ib_pb_1
	w_2033_situacion_actual.u_amb.visible=false
	if w_2033_situacion_actual.il_nro_centro=0 AND &
		w_2033_situacion_actual.il_nro_cMD=0 AND &
		w_2033_situacion_actual.il_nro_mesa=0 then 
	
		w_2033_situacion_actual.st_centro.visible=FALSE
	ELSE
		w_2033_situacion_actual.st_centro.visible=TRUE
	END IF
	w_2033_situacion_actual.ib_ambito_abierto=false
	w_2033_situacion_actual.dw_situacion_actual.enabled=true
	w_2033_situacion_actual.cb_buscar.enabled=true
	w_2033_situacion_actual.cbx_centro_cmd.enabled=true
	
	if w_2033_situacion_actual.il_nro_centro=0 AND &
		w_2033_situacion_actual.il_nro_cMD=0 then
		
		w_2033_situacion_actual.cbx_3.checked=false
		w_2033_situacion_actual.cbx_centro_cmd.ENABLED=TRUE
	elseif w_2033_situacion_actual.il_nro_centro <> 0 then
		
		w_2033_situacion_actual.cbx_centro_cmd.checked=false
		w_2033_situacion_actual.cbx_3.checked=true
		w_2033_situacion_actual.cbx_centro_cmd.ENABLED=FALSE
		
	elseif w_2033_situacion_actual.il_nro_cmd <> 0 then
		
		w_2033_situacion_actual.cbx_centro_cmd.checked=true
		w_2033_situacion_actual.cbx_centro_cmd.ENABLED=FALSE
		w_2033_situacion_actual.cbx_3.checked=true
		
	end if
end if
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within u_2030_ambito_estadisticas
integer x = 41
integer y = 32
integer taborder = 10
boolean border = false
end type

event itemchanged;call super::itemchanged;////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: ITEMCHANGED
////
//// Objetivo: SELECCIONA / HABILITA / DESHABILITA LAS DDDW.
////         
//// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
////
//// Par$$HEX1$$e100$$ENDHEX$$metros:
////
////        Entrada: 
////        Salida:
////
//// Devuelve: 
////
//// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
//// --------         -----------             ---------
//// 09/09/1999	    FDO
////		
///////////////////////////////////////////////////////////// 
//
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
////				THIS.FNU_HABI_CENTRO()
////				THIS.FNU_HABI_CMD()
////				
////				// setea el centro
////					
////				SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
////					INTO :ll_nro_centro  
////					FROM "SGD_RELACION_CENTRO"  
////				WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
////						( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 )   ;
////
////				This.object.nro_centro[1]=ll_nro_centro
////		
////				// setea el CMD
////					
////				This.fnu_filtro_cmd_n()										
////				
////				SELECT "SGD_RELACION_CENTRO"."CENTRO_RESP"  
////					INTO :ll_nro_centro  
////					FROM "SGD_RELACION_CENTRO"  
////				WHERE ( "SGD_RELACION_CENTRO"."CENTRO_DEPEN" = :li_valor ) AND  
////						( "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2 )   ;
////
////				This.object.nro_cmd[1]=ll_nro_centro
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
//					fnu_des_puesto()
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

type cb_1 from commandbutton within u_2030_ambito_estadisticas
integer x = 192
integer y = 480
integer width = 329
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;dw_ambito.accepttext()

if is_ventana = "Avisos_int_horario" then
	w_2030_estadisticas.tab_1.il_nro_centro=dw_ambito.getitemnumber(1,1)
	w_2030_estadisticas.tab_1.il_nro_cmd=dw_ambito.getitemnumber(1,2)
	w_2030_estadisticas.tab_1.il_nro_mesa=dw_ambito.getitemnumber(1,3)

	if w_2030_estadisticas.tab_1.il_nro_mesa >0 then
		
		 select nom_centro 
		 into :w_2030_estadisticas.tab_1.int_horario.st_centro.text 
		 from sgd_centro 
		 where nro_centro= :w_2030_estadisticas.tab_1.il_nro_mesa
		 	 and tip_centro = 3 //DBE 13/01/2000
		 ;
		 
	elseif w_2030_estadisticas.tab_1.il_nro_cmd >0 then
		
		 select nom_centro 
		 into :w_2030_estadisticas.tab_1.int_horario.st_centro.text 
		 from sgd_centro 
		 where nro_centro= :w_2030_estadisticas.tab_1.il_nro_cmd
		 	 and tip_centro = 2 //DBE 13/01/2000
		 ;
		 
	elseif w_2030_estadisticas.tab_1.il_nro_centro >0 then
		
		 select nom_centro 
		 into :w_2030_estadisticas.tab_1.int_horario.st_centro.text 
		 from sgd_centro 
		 where nro_centro= :w_2030_estadisticas.tab_1.il_nro_centro
		 	 and tip_centro = 1 //DBE 13/01/2000
		 ;
		 
	else
		
		select nom_centro 
		into :w_2030_estadisticas.tab_1.int_horario.st_centro.text 
		from sgd_centro 
		where nro_centro= :w_2030_estadisticas.tab_1.il_nro_centro
			 and tip_centro = 1 //DBE 13/01/2000
		 ;
		
	end if
	w_2030_estadisticas.tab_1.int_horario.cb_buscar.enabled=w_2030_estadisticas.tab_1.ib_cb_buscar
	w_2030_estadisticas.tab_1.int_horario.p_avanza.enabled=w_2030_estadisticas.tab_1.ib_p_avanza
	w_2030_estadisticas.tab_1.int_horario.p_retrocede.enabled=w_2030_estadisticas.tab_1.ib_p_retrocede
	w_2030_estadisticas.tab_1.int_horario.cbx_3.enabled=w_2030_estadisticas.tab_1.ib_cbx_3
	w_2030_estadisticas.tab_1.int_horario.pb_1.enabled=w_2030_estadisticas.tab_1.ib_pb_1
	w_2030_estadisticas.tab_1.int_horario.pb_2.enabled=w_2030_estadisticas.tab_1.ib_pb_2
	w_2030_estadisticas.tab_1.int_horario.em_fecha.enabled=w_2030_estadisticas.tab_1.ib_em_fecha
	w_2030_estadisticas.tab_1.int_horario.dw_tipo.modify("tipo_aviso.background.color=" + string(65536*255+256*255+255))
	//w_2030_estadisticas.tab_1.int_horario.dw_tipo.SetTabOrder("tipo_aviso",10)
	w_2030_estadisticas.tab_1.int_horario.dw_tipo.enabled = True
	w_2030_estadisticas.tab_1.int_horario.u_amb.visible = false
	w_2030_estadisticas.tab_1.int_horario.st_centro.visible=true 
	w_2030_estadisticas.tab_1.ib_ambito_abierto=false
	w_2030_estadisticas.tab_1.int_horario.cbx_1.enabled=w_2030_estadisticas.tab_1.ib_cbx_1
	w_2030_estadisticas.tab_1.int_horario.dw_usuario.enabled=w_2030_estadisticas.tab_1.ib_dw_usuario
	w_2030_estadisticas.tab_1.int_horario.dw_usuario.modify("usuario.background.color=" + w_2030_estadisticas.tab_1.is_color_dw_usuario)

	if w_2030_estadisticas.tab_1.il_nro_centro=0 AND &
		w_2030_estadisticas.tab_1.il_nro_cmd=0 then
		
		w_2030_estadisticas.tab_1.int_horario.cbx_3.checked=false
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.ENABLED=TRUE
	elseif w_2030_estadisticas.tab_1.il_nro_centro <> 0 then
		
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.checked=false
		w_2030_estadisticas.tab_1.int_horario.cbx_3.checked=true
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.ENABLED=FALSE
		
	elseif w_2030_estadisticas.tab_1.il_nro_cmd <> 0 then
		
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.checked=true
		w_2030_estadisticas.tab_1.int_horario.cbx_centro_cmd.ENABLED=FALSE
		w_2030_estadisticas.tab_1.int_horario.cbx_3.checked=true
		
	end if
end if

if is_ventana = "Avisos_por_duracion" then
	w_2030_estadisticas.tab_1.il_nro_centro_dur=dw_ambito.getitemnumber(1,1)
	w_2030_estadisticas.tab_1.il_nro_cmd_dur=dw_ambito.getitemnumber(1,2)
	w_2030_estadisticas.tab_1.il_nro_mesa_dur=dw_ambito.getitemnumber(1,3)

	if w_2030_estadisticas.tab_1.il_nro_mesa_dur >0 then
		
		 select nom_centro 
		 into :w_2030_estadisticas.tab_1.avisos_pendientes.st_centro_dur.text 
		 from sgd_centro 
		 where nro_centro= :w_2030_estadisticas.tab_1.il_nro_mesa_dur
		 	 and tip_centro = 3 //DBE 13/01/2000
		 ;
		 
	elseif w_2030_estadisticas.tab_1.il_nro_cmd_dur >0 then
		
		 select nom_centro 
		 into :w_2030_estadisticas.tab_1.avisos_pendientes.st_centro_dur.text 
		 from sgd_centro 
		 where nro_centro= :w_2030_estadisticas.tab_1.il_nro_cmd_dur
		 	 and tip_centro = 2 //DBE 13/01/2000
		 ;
		 
	elseif w_2030_estadisticas.tab_1.il_nro_centro_dur >0 then
		
		 select nom_centro 
		 into :w_2030_estadisticas.tab_1.avisos_pendientes.st_centro_dur.text 
		 from sgd_centro 
		 where nro_centro= :w_2030_estadisticas.tab_1.il_nro_centro_dur
		 	 and tip_centro = 1 //DBE 13/01/2000
		 ;
		 
	else
		
		select nom_centro 
		into :w_2030_estadisticas.tab_1.avisos_pendientes.st_centro_dur.text 
		from sgd_centro 
		where nro_centro= :w_2030_estadisticas.tab_1.il_nro_centro_dur
			 and tip_centro = 1 //DBE 13/01/2000
		 ;
		
	end if
	
	w_2030_estadisticas.tab_1.avisos_pendientes.cb_buscar2.enabled=w_2030_estadisticas.tab_1.ib_cb_buscar_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.p_avanzar.enabled=w_2030_estadisticas.tab_1.ib_p_avanza_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.p_retroceder.enabled=w_2030_estadisticas.tab_1.ib_p_retrocede_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.enabled=w_2030_estadisticas.tab_1.ib_cbx_4_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.pb_3.enabled=w_2030_estadisticas.tab_1.ib_pb_3_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.pb_5.enabled=w_2030_estadisticas.tab_1.ib_pb_5_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_tipo_pend.modify("tipo_aviso.background.color=" + string(65536*255+256*255+255))
	//w_2030_estadisticas.tab_1.avisos_pendientes.dw_tipo_pend.SetTabOrder("tipo_aviso",10)
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_tipo_pend.enabled = True
	w_2030_estadisticas.tab_1.avisos_pendientes.u_amb_dur.visible = false
	w_2030_estadisticas.tab_1.avisos_pendientes.st_centro_dur.visible=true  //DBE 19/01/2000
	w_2030_estadisticas.tab_1.ib_ambito_abierto_dur=false
	w_2030_estadisticas.tab_1.avisos_pendientes.cbx_2.enabled=w_2030_estadisticas.tab_1.ib_cbx_2
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_usuario_dur.enabled=w_2030_estadisticas.tab_1.ib_dw_usuario_dur
	w_2030_estadisticas.tab_1.avisos_pendientes.dw_usuario_dur.modify("usuario.background.color=" + w_2030_estadisticas.tab_1.is_color_dw_usuario_dur)
	
	if w_2030_estadisticas.tab_1.il_nro_centro_dur=0 AND &
		w_2030_estadisticas.tab_1.il_nro_cmd_dur=0 then
		
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.checked=false
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.ENABLED=TRUE
	elseif w_2030_estadisticas.tab_1.il_nro_centro_dur <> 0 then
		
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.checked=false
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.checked=true
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.ENABLED=FALSE
		
	elseif w_2030_estadisticas.tab_1.il_nro_cmd_dur <> 0 then
		
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.checked=true
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_centro_cmd_pend.ENABLED=FALSE
		w_2030_estadisticas.tab_1.avisos_pendientes.cbx_4.checked=true
		
	end if
end if

if is_ventana = "Situacion_actual" then
	w_2033_situacion_actual.il_nro_centro=dw_ambito.getitemnumber(1,1)
	w_2033_situacion_actual.il_nro_cmd=dw_ambito.getitemnumber(1,2)
	w_2033_situacion_actual.il_nro_mesa=dw_ambito.getitemnumber(1,3)

	if w_2033_situacion_actual.il_nro_mesa >0 then
		
			 select nom_centro 
		 into :w_2033_situacion_actual.st_centro.text 
		 from sgd_centro 
		 where nro_centro= :w_2033_situacion_actual.il_nro_mesa
		 and tip_centro = 3 //DBE 13/01/2000
		 ;
		 
	elseif w_2033_situacion_actual.il_nro_cmd >0 then
		
		 select nom_centro 
		 into :w_2033_situacion_actual.st_centro.text 
		 from sgd_centro 
		 where nro_centro= :w_2033_situacion_actual.il_nro_cmd
		 and tip_centro = 2 //DBE 13/01/2000
		 ;
	elseif w_2033_situacion_actual.il_nro_centro >0 then
		
		 select nom_centro 
		 into :w_2033_situacion_actual.st_centro.text 
		 from sgd_centro 
		 where nro_centro= :w_2033_situacion_actual.il_nro_centro
		 and tip_centro = 1 //DBE 13/01/2000
		 ;

	else
		
		select nom_centro 
		into :w_2033_situacion_actual.st_centro.text 
		from sgd_centro 
		where nro_centro= :w_2033_situacion_actual.il_nro_centro
		and tip_centro = 1 //DBE 13/01/2000
		;

		
	end if
	
	w_2033_situacion_actual.p_avanzar.enabled=w_2033_situacion_actual.ib_p_avanzar
	w_2033_situacion_actual.p_retroceder.enabled=w_2033_situacion_actual.ib_p_retroceder
	w_2033_situacion_actual.pb_1.enabled=w_2033_situacion_actual.ib_pb_1
	w_2033_situacion_actual.u_amb.visible=false
	if w_2033_situacion_actual.il_nro_centro=0 AND &
		w_2033_situacion_actual.il_nro_cMD=0 AND &
		w_2033_situacion_actual.il_nro_mesa=0 then 
	
		w_2033_situacion_actual.st_centro.visible=FALSE
	ELSE
		w_2033_situacion_actual.st_centro.visible=TRUE
	END IF
	w_2033_situacion_actual.ib_ambito_abierto=false
	w_2033_situacion_actual.dw_situacion_actual.enabled=true
	w_2033_situacion_actual.cb_buscar.enabled=true
	
	if w_2033_situacion_actual.il_nro_centro=0 AND &
		w_2033_situacion_actual.il_nro_cMD=0 then
		
		w_2033_situacion_actual.cbx_3.checked=false
		w_2033_situacion_actual.cbx_centro_cmd.ENABLED=TRUE
	elseif w_2033_situacion_actual.il_nro_centro <> 0 then
		
		w_2033_situacion_actual.cbx_centro_cmd.checked=false
		w_2033_situacion_actual.cbx_3.checked=true
		w_2033_situacion_actual.cbx_centro_cmd.ENABLED=FALSE
		
	elseif w_2033_situacion_actual.il_nro_cmd <> 0 then
		
		w_2033_situacion_actual.cbx_centro_cmd.checked=true
		w_2033_situacion_actual.cbx_centro_cmd.ENABLED=FALSE
		w_2033_situacion_actual.cbx_3.checked=true
		
	end if
//	w_2033_situacion_actual.dw_situacion_actual.reset()//DBE 14/01/2000
//	w_2033_situacion_actual.cb_buscar.triggerevent('clicked') //DBE 14/01/2000
end if

end event


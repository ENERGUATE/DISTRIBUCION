HA$PBExportHeader$w_1105_obs_improc.srw
forward
global type w_1105_obs_improc from w_sgigenerica
end type
type cb_3 from commandbutton within w_1105_obs_improc
end type
type cb_2 from commandbutton within w_1105_obs_improc
end type
type cbx_2 from checkbox within w_1105_obs_improc
end type
type mle_1 from multilineedit within w_1105_obs_improc
end type
type cb_1 from commandbutton within w_1105_obs_improc
end type
type gb_1 from groupbox within w_1105_obs_improc
end type
end forward

global type w_1105_obs_improc from w_sgigenerica
integer x = 873
integer y = 700
integer width = 1934
integer height = 1036
string title = "Observaciones de aviso improcedente"
windowtype windowtype = response!
long backcolor = 79741120
cb_3 cb_3
cb_2 cb_2
cbx_2 cbx_2
mle_1 mle_1
cb_1 cb_1
gb_1 gb_1
end type
global w_1105_obs_improc w_1105_obs_improc

type variables
string is_activated_from_window
long il_fila
long il_nro_aviso
boolean  ib_modified
w_1105_avisos_con_alim iw_ventana // GNU 12/01/2007. Mejora 1/311530
end variables

on w_1105_obs_improc.create
int iCurrent
call super::create
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cbx_2=create cbx_2
this.mle_1=create mle_1
this.cb_1=create cb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_3
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.mle_1
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_1105_obs_improc.destroy
call super::destroy
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cbx_2)
destroy(this.mle_1)
destroy(this.cb_1)
destroy(this.gb_1)
end on

event open;call super::open;//DBE ini comment 1/03/2000

//string ls_nom_instalacion
//  
//  SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
//    INTO :ls_nom_instalacion
//    FROM "SGD_INSTALACION"  
//   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :w_1105_avisos_con_alim.il_avis_nro_ins  
//	and "SGD_INSTALACION"."BDI_JOB" = 0 //DBE 11/01/2000
//	;
//DBE fin comment 1/03/2000

string ls_direccion
long ll_fila, ll_rows
string ls_nro_aviso
string ls_message_param
string ls_observaciones
long ll_nro_row 
long ll_cant_row
long ll_message_param // GNU 12/01/2007. Mejora 1/311530


ls_message_param=message.stringparm
choose case ls_message_param
	    case 'w_2309_reactivar_avisos'
			is_activated_from_window='w_2309_reactivar_avisos'
			cbx_2.hide()
			cb_2.hide()


   if isvalid(w_2309_reactivar_avisos) then 
		
	il_fila=w_2309_reactivar_avisos.d_lista_aviso.getrow()	
	il_nro_aviso=w_2309_reactivar_avisos.d_lista_aviso.getitemnumber(il_fila,'nro_aviso')
	
	ls_observaciones=w_2309_reactivar_avisos.d_lista_aviso.getitemstring(il_fila,'gi_avisos_obs_improc')
	
	ls_direccion=w_2309_reactivar_avisos.d_lista_aviso.getitemstring(il_fila,'c_concat')


        ls_direccion=trim(ls_direccion)
        if len(ls_direccion)>0 then
        ls_direccion="   Direcci$$HEX1$$f300$$ENDHEX$$n: "+ls_direccion
        end if

    mle_1.text = ls_observaciones
    gb_1.text = "Aviso N$$HEX2$$ba002000$$ENDHEX$$: " + string(il_nro_aviso) + ls_direccion
    end if

			
			
		 case else //'w_1105_avisos_con_alim'
			is_activated_from_window='w_1105_avisos_con_alim'
			// GNU 12/01/2007. Mejora 1/311530
//			ll_message_param=message.longparm
			iw_ventana=gu_control_v_incidencias.of_busca_hija(long(ls_message_param))
			if isvalid(iw_ventana) then
				ls_nro_aviso=string(iw_ventana.il_nro_avi)
				ll_rows=iw_ventana.dw_lista_avisos.rowcount()
				ll_fila=iw_ventana.dw_lista_avisos.find('avisos_nro_aviso =' + ls_nro_aviso, 1, ll_rows)
				
				ll_nro_row= iw_ventana.dw_lista_avisos.GetSelectedRow(0)
				
				do while ll_nro_row <> 0
					ll_nro_row=iw_ventana.dw_lista_avisos.GetSelectedRow(ll_nro_row)
					ll_cant_row ++
				loop
				
				if iw_ventana.ii_nro_avisos= ll_cant_row then
					cb_2.enabled=false
				end if
				
				if ll_fila> 0 then
					ls_direccion= iw_ventana.dw_lista_avisos.getitemstring(ll_fila,'c_concat')
				end if
				
		  ls_direccion=trim(ls_direccion)
        if len(ls_direccion)>0 then
        ls_direccion="   Direcci$$HEX1$$f300$$ENDHEX$$n: "+ls_direccion
        end if
		// TDA.INI.EDM-3.19052017
		gb_1.text ="Se gestionaran "+ string(iw_ventana.ii_nro_avisos) +" avisos como improcedentes"
    	//gb_1.text = "Aviso N$$HEX2$$ba002000$$ENDHEX$$: " + string(iw_ventana.il_nro_avi) + ls_direccion
		// TDA.FIN.EDM-3.19052017
    end if
//   if isvalid(w_1105_avisos_con_alim) then 
//	ls_nro_aviso=string(w_1105_avisos_con_alim.il_nro_avi)
//	ll_rows=w_1105_avisos_con_alim.dw_lista_avisos.rowcount()
//   ll_fila=w_1105_avisos_con_alim.dw_lista_avisos.find('avisos_nro_aviso ='+ls_nro_aviso,1,ll_rows)
//	
//	
//	ll_nro_row = w_1105_avisos_con_alim.dw_lista_avisos.GetSelectedRow(0)
//	
//	do while ll_nro_row <> 0
//		ll_nro_row=w_1105_avisos_con_alim.dw_lista_avisos.GetSelectedRow(ll_nro_row)
//		ll_cant_row ++
//	loop
//
//	if w_1105_avisos_con_alim.ii_nro_avisos = ll_cant_row then
//		// si no hay mas avisos que marcar, deshabilito el bot$$HEX1$$f300$$ENDHEX$$n
//		cb_2.enabled=false
//	end if
	
//         if ll_fila >0 then 
//         ls_direccion=w_1105_avisos_con_alim.dw_lista_avisos.getitemstring(ll_fila,'c_concat')
//         end if

//        ls_direccion=trim(ls_direccion)
//        if len(ls_direccion)>0 then
//        ls_direccion="   Direcci$$HEX1$$f300$$ENDHEX$$n: "+ls_direccion
//        end if
//
//
//    gb_1.text = "Aviso N$$HEX2$$ba002000$$ENDHEX$$: " + string(w_1105_avisos_con_alim.il_nro_avi) + ls_direccion
//    end if
// FIN GNU	 
end choose


end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1105_obs_improc
end type

type cb_3 from commandbutton within w_1105_obs_improc
integer x = 1344
integer y = 760
integer width = 379
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;choose case is_activated_from_window
   	 case 'w_1105_avisos_con_alim'
				 // GNU 15/01/2007. Mejora 1/311530
//             w_1105_avisos_con_alim.ib_cancelado = true   
				 iw_ventana.ib_cancelado = true
				 // FIN GNU
	    case 'w_2309_reactivar_avisos'

end choose

close(parent)
end event

type cb_2 from commandbutton within w_1105_obs_improc
boolean visible = false
integer x = 951
integer y = 760
integer width = 343
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Siguiente"
end type

event clicked;
choose case is_activated_from_window
   	 case 'w_1105_avisos_con_alim'
			// GNU 15/01/2007. Mejora 1/311530
//			if cbx_2.checked then
//				w_1105_avisos_con_alim.ib_obs_general = true
//			end if
//
//			if len(mle_1.text ) = 0 then
//				w_1105_avisos_con_alim.is_obs = "Aviso Improcedente"
//			else
//				w_1105_avisos_con_alim.is_obs = mle_1.text
//			end if
			if cbx_2.checked then
				iw_ventana.ib_obs_general = true
			end if

			if len(mle_1.text ) = 0 then
				iw_ventana.is_obs = "Aviso Improcedente"
			else
				iw_ventana.is_obs = mle_1.text
			end if
			// FIN GNU
			close(parent)
				 
	    case 'w_2309_reactivar_avisos'
             close(parent)
end choose


end event

type cbx_2 from checkbox within w_1105_obs_improc
boolean visible = false
integer x = 512
integer y = 772
integer width = 393
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "General"
boolean lefttext = true
end type

type mle_1 from multilineedit within w_1105_obs_improc
integer x = 59
integer y = 72
integer width = 1778
integer height = 608
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;ib_modified=true
end event

type cb_1 from commandbutton within w_1105_obs_improc
integer x = 133
integer y = 764
integer width = 329
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;string ls_observaciones
setpointer(hourglass!)

choose case is_activated_from_window
   	 case 'w_1105_avisos_con_alim'

// GNU 15/01/2006. Mejora 1/311530
//if cbx_2.checked then
//	w_1105_avisos_con_alim.ib_obs_general = true
//end if
//
//if len(mle_1.text ) = 0 then
//	w_1105_avisos_con_alim.is_obs = "Aviso Improcedente"
//else
//	w_1105_avisos_con_alim.is_obs = mle_1.text
//end if
if cbx_2.checked then
	iw_ventana.ib_obs_general = true
end if

if len(mle_1.text ) = 0 then
	iw_ventana.is_obs = "Aviso Improcedente"
else
	iw_ventana.is_obs = mle_1.text
end if
// FIN GNU
//close(parent)
       
	  case 'w_2309_reactivar_avisos'
		if  ib_modified then 
		ls_observaciones=left(trim(mle_1.text),250)			
		update gi_avisos set obs_improc=:ls_observaciones where nro_aviso=:il_nro_aviso;
		if sqlca.sqlcode<>0 then 
			gnv_msg.f_mensaje('AA19','','',OK!)
			return
		end if
		gnu_u_transaction.uf_commit()
		w_2309_reactivar_avisos.d_lista_aviso.setitem(il_fila,'gi_avisos_obs_improc',ls_observaciones)
	end if
end choose

close(parent)
end event

type gb_1 from groupbox within w_1105_obs_improc
integer x = 32
integer y = 8
integer width = 1838
integer height = 700
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type


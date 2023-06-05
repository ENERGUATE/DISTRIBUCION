HA$PBExportHeader$w_3301_detalle_instalacion.srw
forward
global type w_3301_detalle_instalacion from w_sgigenerica
end type
type st_1 from statictext within w_3301_detalle_instalacion
end type
type cb_1 from commandbutton within w_3301_detalle_instalacion
end type
type cb_borrar from commandbutton within w_3301_detalle_instalacion
end type
type cb_aceptar from commandbutton within w_3301_detalle_instalacion
end type
end forward

global type w_3301_detalle_instalacion from w_sgigenerica
integer height = 1660
boolean resizable = false
event ue_retrieve pbm_custom66
st_1 st_1
cb_1 cb_1
cb_borrar cb_borrar
cb_aceptar cb_aceptar
end type
global w_3301_detalle_instalacion w_3301_detalle_instalacion

type variables
u_generico_comunicaciones iu_g_com 
u_tab_ins_ct it_tabpct
u_tab_ins_trans it_tabptr
long il_tabclick
end variables

forward prototypes
public function integer fpr_habilito_campos (boolean pb_habilito, ref datawindow pd_dw)
end prototypes

event ue_retrieve;call super::ue_retrieve;//
//IF iu_g_com.is_comunic.intval4 = 3 THEN
//
//	CHOOSE CASE il_tabclick
//		CASE 1
//			it_tabpct.tabpage_1.dw_1.settransobject(sqlca)
//			it_tabpct.tabpage_1.dw_1.retrieve(iu_g_com.is_comunic.decval1)
//		CASE 2
//			it_tabpct.tabpage_2.dw_2.settransobject(sqlca)
//			it_tabpct.tabpage_2.dw_2.retrieve(iu_g_com.is_comunic.decval1)
//		CASE 3
//			it_tabpct.tabpage_3.dw_3.settransobject(sqlca)
//			it_tabpct.tabpage_3.dw_3.retrieve(iu_g_com.is_comunic.decval1)
//		CASE 4
//			it_tabpct.tabpage_4.dw_4.settransobject(sqlca)
//			it_tabpct.tabpage_4.dw_4.retrieve(iu_g_com.is_comunic.decval1)
//	END CHOOSE
//ELSEIF iu_g_com.is_comunic.intval4 = 4 THEN
//
//	CHOOSE CASE il_tabclick
//		CASE 1
//			it_tabptr.tabpage_1.dw_1.settransobject(sqlca)
//			it_tabptr.tabpage_1.dw_1.retrieve(iu_g_com.is_comunic.decval1)
//		CASE 2
//			it_tabptr.tabpage_2.dw_2.settransobject(sqlca)
//			it_tabptr.tabpage_2.dw_2.retrieve(iu_g_com.is_comunic.decval1)
//
//	END CHOOSE
//END IF
end event

public function integer fpr_habilito_campos (boolean pb_habilito, ref datawindow pd_dw);IF pb_habilito THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("sqsq.background.color="+string(65536*255+256*255+255))
	pd_dw.modify("sqsq.background.color=" + gs_blanco)
// Fin. Sgo.
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("sqsq.background.color="+string(65536*192+256*192+192))
	pd_dw.modify("sqsq.background.color=" + gs_gris)
// Fin. Sgo.
END IF

return 1
end function

on w_3301_detalle_instalacion.create
int iCurrent
call super::create
this.st_1=create st_1
this.cb_1=create cb_1
this.cb_borrar=create cb_borrar
this.cb_aceptar=create cb_aceptar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_borrar
this.Control[iCurrent+4]=this.cb_aceptar
end on

on w_3301_detalle_instalacion.destroy
call super::destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.cb_borrar)
destroy(this.cb_aceptar)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana con el formulario de la instalaci$$HEX1$$f300$$ENDHEX$$n
//				 pasada como parametro, variando del tipo de instalacion.
//
// datos entrada :
//					gu_comunic
//						decval1 = nro_instalacion
//						intval4 = Tipo Instalacion
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        24/01/97   FDB
//
/////////////////////////////////////////////////////////////////////////

decimal{0} ldec_nro_inst
long ll_calle
string ls_calle
int li_tipo_inst
datetime ldt_f_actual

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//	iu_g_com  --> para cargar la estructura local 
SetPointer(HourGlass!)

iu_g_com  = CREATE u_generico_comunicaciones

iu_g_com.is_comunic = gu_comunic.is_comunic

// Cambiar los atributos de la ventana
//this.fpr_cambiar_atributos()

This.Title = iu_g_com.f_titulo_ventana("w_3301","Details of Instalac.")

// La ventana se comporta de acuerdo al programa (ventana)
// que la llam$$HEX1$$f300$$ENDHEX$$.

IF iu_g_com.is_comunic.programa_llamante = "w_3208" THEN
	IF iu_g_com.is_comunic.accion_llamada = "Consulta" THEN
		cb_aceptar.visible = False // deshabilito la opcion grabar
		cb_BORRAR.visible = FALSE
		
		//seleciono data window a mostrar segun
		// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n para la instalaci$$HEX1$$f300$$ENDHEX$$n pasada.
	END IF
END IF

IF iu_g_com.is_comunic.programa_llamante = "w_2301" THEN
	
	// Habilito los campos de los user-object,
	// de acuerdo a la accion de llamada.
	// deshabilito la opcion grabar
	//seleciono data window a mostrar segun
	// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n para la instalaci$$HEX1$$f300$$ENDHEX$$n pasada.
END IF

st_1.text='Informaci$$HEX1$$f300$$ENDHEX$$n Adicional para:'+ iu_g_com.is_comunic.strval1

IF  iu_g_com.is_comunic.intval4=3 then				// Instalacion tipo CT
	it_tabpct = create u_tab_ins_ct
	This.OpenUserObject(it_tabpct, 197,161)		// (eluserobj)
	it_tabpct.f_obtener_datos(iu_g_com.is_comunic.decval1)
	it_tabpct.tabpage_1.dw_1.SetItem(1,"company_no",' ')
	it_tabpct.tabpage_1.dw_1.SetItem(1,"installation_no",iu_g_com.is_comunic.decval1)
	IF iu_g_com.is_comunic.accion_llamada = "Consulta" THEN
	// Habilito los campos de los user-object,
	// de acuerdo a la accion de llamada.
		it_tabpct.f_deshabilitar_campos()
	end if	
else
	it_tabptr = create u_tab_ins_trans
	This.OpenUserObject(it_tabptr, 197,161)							// (eluserobj)
	it_tabptr.f_obtener_datos(iu_g_com.is_comunic.decval1)
	it_tabptr.tabpage_1.dw_1.SetItem(1,"installation_no",iu_g_com.is_comunic.decval1)
	IF iu_g_com.is_comunic.accion_llamada = "Consulta" THEN
   // Habilito los campos de los user-object,
	// de acuerdo a la accion de llamada.
		it_tabptr.f_deshabilitar_campos()
	end if
end if	

end event

event close;call super::close;DESTROY iu_g_com
DESTROY it_tabpct
DESTROY it_tabptr

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3301_detalle_instalacion
end type

type st_1 from statictext within w_3301_detalle_instalacion
integer x = 197
integer y = 68
integer width = 2519
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 1090519039
long backcolor = 8421376
boolean enabled = false
string text = "none"
alignment alignment = center!
boolean border = true
long bordercolor = 1090519039
borderstyle borderstyle = styleraised!
end type

type cb_1 from commandbutton within w_3301_detalle_instalacion
integer x = 2286
integer y = 1408
integer width = 430
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;CLOSE(PARENT)
end event

type cb_borrar from commandbutton within w_3301_detalle_instalacion
event clicked pbm_bnclicked
integer x = 197
integer y = 1412
integer width = 430
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Eliminar"
end type

event clicked;
	IF ISVALID(it_tabpct) then 
		if (it_tabpct.ib_alta=false) then
			if gnv_msg.F_MENSAJE("CG02","","",YESNO!)=1 THEN
				delete from detalles_instalacion where "INSTALLATION_NO" = :iu_g_com.is_comunic.decval1;
			END IF
		END IF
	end if
		
	IF ISVALID(it_tabptr) then
		if (it_tabptr.ib_alta=false) then
			IF gnv_msg.F_MENSAJE("CG02","","",YESNO!)=1 THEN
				delete from detalles_instalacion where "INSTALLATION_NO" = :iu_g_com.is_comunic.decval1;
			END IF
		END IF
	end if
	CLOSE(PARENT)

end event

type cb_aceptar from commandbutton within w_3301_detalle_instalacion
event clicked pbm_bnclicked
integer x = 1797
integer y = 1412
integer width = 430
integer height = 96
integer taborder = 11
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Evento: 	clicked for cb_aceptar
// 
// Objetivo:	Valida las DW tanto de CT como de Transformadores y realiza el update
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/02/1997		FDB	    Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_errorup
	IF ISVALID(it_tabpct) then
		it_tabpct.tabpage_1.dw_1.ACCEPTTEXT()
		it_tabpct.tabpage_2.dw_2.ACCEPTTEXT()
		it_tabpct.tabpage_3.dw_3.ACCEPTTEXT()
		it_tabpct.tabpage_4.dw_4.ACCEPTTEXT()
		if (it_tabpct.ib_modifico=TRUE) THEN 
					if (it_tabpct.ib_alta=true) then
						it_tabpct.f_dar_alta(iu_g_com.is_comunic.decval1)
					else 
						it_tabpct.f_modificar()
					END IF
		END IF
	END IF
	
	IF ISVALID(it_tabptr) then
		it_tabptr.tabpage_1.dw_1.ACCEPTTEXT()
		it_tabptr.tabpage_2.dw_2.ACCEPTTEXT()
		if (it_tabptr.ib_modifico=TRUE) THEN
			  IF it_tabptr.IB_VACIO=FALSE THEN
				  IF (it_tabptr.IB_ALTA=TRUE)THEN
				  	li_erroruP=it_tabptr.f_dar_alta(iu_g_com.is_comunic.decval1)
				  ELSE
					li_erroruP=it_tabptr.f_MODIFICAR()
				  end if
				  
				  if li_errorup=0 then 
						gnv_msg.F_MENSAJE("EG05","Company N$$HEX1$$ba00$$ENDHEX$$","",ok!)
				      return 1
				  END IF
				ELSE
						gnv_msg.F_MENSAJE("EG05","Company N$$HEX1$$ba00$$ENDHEX$$","",ok!)
						RETURN 1
				END IF
			end if
		end if
	CLOSE(PARENT)
end event


HA$PBExportHeader$w_mant_categorias_sum_imp.srw
$PBExportComments$Ventana de mantenimiento de acci$$HEX1$$f300$$ENDHEX$$n de Incidencia
forward
global type w_mant_categorias_sum_imp from w_sgigenerica
end type
type dw_mant_categorias_sum_imp from datawindow within w_mant_categorias_sum_imp
end type
type cb_agregar from commandbutton within w_mant_categorias_sum_imp
end type
type cb_aceptar from commandbutton within w_mant_categorias_sum_imp
end type
type cb_cancelar from commandbutton within w_mant_categorias_sum_imp
end type
end forward

global type w_mant_categorias_sum_imp from w_sgigenerica
string title = "OPEN SGI - Mantenimiento de Categor$$HEX1$$ed00$$ENDHEX$$as Suministros Import.(Fondo/Color)"
dw_mant_categorias_sum_imp dw_mant_categorias_sum_imp
cb_agregar cb_agregar
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_mant_categorias_sum_imp w_mant_categorias_sum_imp

type variables
Long il_nro_max_cod_accion,il_max_cat
long il_fila_blanco, il_valor_cod_act

end variables

on w_mant_categorias_sum_imp.create
int iCurrent
call super::create
this.dw_mant_categorias_sum_imp=create dw_mant_categorias_sum_imp
this.cb_agregar=create cb_agregar
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mant_categorias_sum_imp
this.Control[iCurrent+2]=this.cb_agregar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_cancelar
end on

on w_mant_categorias_sum_imp.destroy
call super::destroy
destroy(this.dw_mant_categorias_sum_imp)
destroy(this.cb_agregar)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event ue_arch_agregar;call super::ue_arch_agregar;long	ll_row, ll_nro_max_cod_categoria, ls_color
string ls_descripcion_cat


cb_aceptar.enabled = true

//NCA-INICIO.DDAG-4730.20160212.Agregamos
				
					dw_mant_categorias_sum_imp.AcceptText()
					dw_mant_categorias_sum_imp.setredraw(true)		

					ll_row = dw_mant_categorias_sum_imp.InsertRow(0)
					dw_mant_categorias_sum_imp.ScrollToRow(ll_row)


					SELECT MAX (cod_categoria)
					  INTO : ll_nro_max_cod_categoria
					  FROM GI_CATEGORIA;


					il_max_cat = ll_nro_max_cod_categoria + 1	
					
					If isnull(il_max_cat) Then //Controlo la primera vez
						il_max_cat = 1
					End If 

	
					dw_mant_categorias_sum_imp.SetItem(ll_row, "cod_categoria", il_max_cat)
					dw_mant_categorias_sum_imp.SetItem(ll_row, "usuario", gs_usuario)
					dw_mant_categorias_sum_imp.SetItem(ll_row, "f_actual", fgnu_fecha_actual())
					dw_mant_categorias_sum_imp.SetItem(ll_row, "h_actual", fgnu_fecha_actual())
					dw_mant_categorias_sum_imp.SetItem(ll_row, "programa", "MANTENIMIENTO")
					dw_mant_categorias_sum_imp.SetItem(ll_row, "descripcion_categoria", ls_descripcion_cat)
					dw_mant_categorias_sum_imp.SetItem(ll_row, "color", ls_color)									

	cb_agregar.enabled = false 
	dw_mant_categorias_sum_imp.Modify("activo.Protect=1")
  
//NCA-FIN.DDAG-4730.20160212.



end event

event ue_arch_grabar;call super::ue_arch_grabar;string ls_descripcion_cat,  ls_color
long ll_row,ll_row_control, ll_countfilas,ls_cod_cat
integer li_resp, li_activo,il_valor
dwItemStatus l_status

//NCA-INICIO.DDAG-4730.20160212.Grabamos.
	    
    				ll_row = dw_mant_categorias_sum_imp.GetRow()					 
 
	 				// preguntamos si grabamos o no.
    				li_resp = gnv_msg.f_mensaje('CG02',' ','',YesNoCancel!)
					 
					
					Choose Case li_resp													
							
					//	Si la respuesta es afirmativa validamos y procedemos a grabar.
							 	 CASE 1	
    									IF dw_mant_categorias_sum_imp.AcceptText( ) = -1 THEN RETURN 1 										 
   									
										  ls_cod_cat = dw_mant_categorias_sum_imp.GetItemNumber(ll_row,"cod_categoria")										  
									     ls_descripcion_cat = dw_mant_categorias_sum_imp.GetItemString(ll_row,"descripcion_categoria")
				                    ls_color = dw_mant_categorias_sum_imp.GetItemString(ll_row,"color")
  
  										// controla datos si no estan null
    									if ISNULL(ls_descripcion_cat) or ISNULL(ls_color) or ls_descripcion_cat = "" then
	   										gnv_msg.f_mensaje('EG12',' ',' ',OK!)
												
	   								return 1
    									end if	 
	  	 
									  //controla dato si no es lo mismo que precedente
									  for ll_row_control = 1 to dw_mant_categorias_sum_imp.RowCount()
									   if ll_row_control <> ll_row then
										  IF dw_mant_categorias_sum_imp.Find ("descripcion_categoria ='"+ ls_descripcion_cat +"'", ll_row_control, ll_row_control) <> 0 THEN										  
														 gnv_msg.f_mensaje('EM25',' ',' ',OK!)		 
												 return 1
											 END IF
									   end if
									  next	
	 
                            // Grabamos en BD, hacemos commit o rollback.	  
									 IF dw_mant_categorias_sum_imp.update() = -1 THEN
										ROLLBACK;
										return 1
									 ELSE										
											UPDATE GI_AVISOS 
												SET COD_COLOR_CATEGORIA = :ls_color									
												WHERE COD_CATEGORIA = :ls_cod_cat;										
																		
										  COMMIT;
									 END IF						 
								 
									 dw_mant_categorias_sum_imp.SetRow(ll_row)	
									 dw_mant_categorias_sum_imp.ScrollToRow(ll_row)	  

	
								 CASE 2
										//Si la respuesta es negativa regresamos al estado original
										l_status = dw_mant_categorias_sum_imp.GetItemStatus(ll_row, 0, Primary!)  
										 if  l_status = New! or l_status = NewModified! then											
													dw_mant_categorias_sum_imp.DeleteRow(ll_row)
													dw_mant_categorias_sum_imp.SetRow(ll_row - 1 )
													dw_mant_categorias_sum_imp.ScrollToRow(ll_row - 1)
										 end if
										 
										 
										 If ll_row = 1 Then 
										 	 cb_aceptar.enabled = false									
										 End If 

								 CASE 3
										//Si la respuesta es negativa regresamos al estado original
										l_status = dw_mant_categorias_sum_imp.GetItemStatus(ll_row, 0, Primary!)  
										 if  l_status = New! or l_status = NewModified! then											
													dw_mant_categorias_sum_imp.DeleteRow(ll_row)
													dw_mant_categorias_sum_imp.SetRow(ll_row - 1 )
													dw_mant_categorias_sum_imp.ScrollToRow(ll_row - 1)
										 end if
										 
										 If ll_row = 1 Then 
										 	 cb_aceptar.enabled = false									
										 End If 
					End Choose

 cb_agregar.enabled = True
 dw_mant_categorias_sum_imp.Modify("activo.Protect=0")
 il_fila_blanco = 0
//NCA-FIN.DDAG-4730.20160212.




end event

event open;call super::open;long ll_numfilas


//NCA-INICIO.DDAG-4730.20160212.

dw_mant_categorias_sum_imp.visible = true
dw_mant_categorias_sum_imp.settransobject(sqlca)
dw_mant_categorias_sum_imp.retrieve()
dw_mant_categorias_sum_imp.setredraw(true) 

dw_mant_categorias_sum_imp.SetFocus()
ll_numfilas = dw_mant_categorias_sum_imp.RowCount()     //se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de filas en el datawindow
dw_mant_categorias_sum_imp.scrolltorow(ll_numfilas)       //se desplaza hasta la $$HEX1$$fa00$$ENDHEX$$ltima
dw_mant_categorias_sum_imp.setcolumn(1)                 //se selecciona la primera columna



If ll_numfilas = 0 Then 	 
    cb_aceptar.enabled = false	
End if 

//NCA-FIN.DDAG-4730.20160212.


end event

event closequery;call super::closequery;ROLLBACK; 
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mant_categorias_sum_imp
end type

type dw_mant_categorias_sum_imp from datawindow within w_mant_categorias_sum_imp
integer x = 169
integer y = 124
integer width = 2537
integer height = 844
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_mant_categorias_sum_imp"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)
this.SetRowFocusIndicator(Hand!)
end event

event itemchanged;
string ls_columna_actual, ls_valor
int il_cod_valor 

 ls_valor = data


//NCA-INICIO.DDAG-4730.20160212.
	If ls_valor = "" or IsNull(ls_valor) Then 
			il_fila_blanco = dw_mant_categorias_sum_imp.GetRow()		
			dw_mant_categorias_sum_imp.Modify("color.Protect=1")		
			dw_mant_categorias_sum_imp.SetFocus()
			cb_agregar.enabled = false
	End If 
//NCA-FIN.DDAG-4730.20160212.

end event

event itemfocuschanged;string ls_descripcion
ls_descripcion = dw_mant_categorias_sum_imp.GetItemString(RowCount(),"descripcion_categoria")

//NCA-INICIO.DDAG-4730.20160212.

IF dw_mant_categorias_sum_imp.DeletedCount() > 0 OR & 
	dw_mant_categorias_sum_imp.ModifiedCount() > 0 THEN   
	
	If IsNull(ls_descripcion) or  ls_descripcion = "" Then
   	dw_mant_categorias_sum_imp.SetRow(RowCount())
		
	End If	
	dw_mant_categorias_sum_imp.SetRow(il_fila_blanco)	
END IF

//NCA-FIN.DDAG-4730.20160212.





end event

event editchanged;
//NCA-INICIO.DDAG-1783.20150317.

string ls_valor

If ls_valor = "" or IsNull(ls_valor) Then 
		cb_agregar.enabled = false
End If 

//NCA-FIN.DDAG-1783.20150317.

end event

type cb_agregar from commandbutton within w_mant_categorias_sum_imp
integer x = 293
integer y = 1088
integer width = 448
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Agregar"
end type

event clicked;w_mant_categorias_sum_imp.triggerevent("ue_arch_agregar")
end event

type cb_aceptar from commandbutton within w_mant_categorias_sum_imp
integer x = 1221
integer y = 1088
integer width = 443
integer height = 104
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Aceptar"
end type

event clicked;w_mant_categorias_sum_imp.triggerevent("ue_arch_grabar")


end event

type cb_cancelar from commandbutton within w_mant_categorias_sum_imp
integer x = 2130
integer y = 1088
integer width = 439
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cerrar"
end type

event clicked;setpointer(hourglass!)
close(parent)
end event


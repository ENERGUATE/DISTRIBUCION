HA$PBExportHeader$w_mant_suministros_cat.srw
$PBExportComments$Ventana de mantenimiento de acci$$HEX1$$f300$$ENDHEX$$n de Incidencia
forward
global type w_mant_suministros_cat from w_sgigenerica
end type
type dw_mant_suministros_cat from datawindow within w_mant_suministros_cat
end type
type cb_agregar from commandbutton within w_mant_suministros_cat
end type
type cb_aceptar from commandbutton within w_mant_suministros_cat
end type
type cb_cancelar from commandbutton within w_mant_suministros_cat
end type
end forward

global type w_mant_suministros_cat from w_sgigenerica
string title = "OPEN SGI - Mantenimiento de Suministros por Categor$$HEX1$$ed00$$ENDHEX$$a (Fondo/Color)"
dw_mant_suministros_cat dw_mant_suministros_cat
cb_agregar cb_agregar
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_mant_suministros_cat w_mant_suministros_cat

type variables
Long il_nro_max_cod_accion,il_max_cat
long il_fila_blanco, il_valor_cod_act

end variables

on w_mant_suministros_cat.create
int iCurrent
call super::create
this.dw_mant_suministros_cat=create dw_mant_suministros_cat
this.cb_agregar=create cb_agregar
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mant_suministros_cat
this.Control[iCurrent+2]=this.cb_agregar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_cancelar
end on

on w_mant_suministros_cat.destroy
call super::destroy
destroy(this.dw_mant_suministros_cat)
destroy(this.cb_agregar)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event ue_arch_agregar;call super::ue_arch_agregar;long	ll_row

//NCA-INICIO.DDAG-4730.20160212.Agregamos
cb_aceptar.enabled = True	
				
					dw_mant_suministros_cat.AcceptText()
					dw_mant_suministros_cat.setredraw(true)		

					ll_row = dw_mant_suministros_cat.InsertRow(0)
					dw_mant_suministros_cat.ScrollToRow(ll_row)

					dw_mant_suministros_cat.SetItem(ll_row, "usuario", gs_usuario)
					dw_mant_suministros_cat.SetItem(ll_row, "f_actual", fgnu_fecha_actual())
					dw_mant_suministros_cat.SetItem(ll_row, "h_actual", fgnu_fecha_actual())
					dw_mant_suministros_cat.SetItem(ll_row, "programa", "MANTENIMIENTO")								

	cb_agregar.enabled = false 
	dw_mant_suministros_cat.Modify("activo.Protect=1")
  
//NCA-FIN.DDAG-4730.20160212.



end event

event ue_arch_grabar;call super::ue_arch_grabar;string ls_descripcion_cat, ls_color_cat
long ll_row,ll_row_control, ll_countfilas, ll_cod_cat, ll_nis, ll_nis_valido
integer li_resp, li_activo,il_valor
dwItemStatus l_status

//NCA-INICIO.DDAG-4730.20160212.Grabamos.
	    
    				ll_row = dw_mant_suministros_cat.GetRow()					 
 
	 				// preguntamos si grabamos o no.
    				li_resp = gnv_msg.f_mensaje('CG02',' ','',YesNoCancel!)
					 
					
					Choose Case li_resp													
							
					//	Si la respuesta es afirmativa validamos y procedemos a grabar.
							 	 CASE 1	
    									IF dw_mant_suministros_cat.AcceptText( ) = -1 THEN RETURN 1 	
										 
   									  ll_nis = dw_mant_suministros_cat.GetItemNumber(ll_row,"nis_rad") 
									     ls_descripcion_cat = dw_mant_suministros_cat.GetItemString(ll_row,"descripcion")
										  ll_cod_cat = dw_mant_suministros_cat.GetItemNumber(ll_row,"cod_categoria") 
										  
										  
									  //controla si el nis es valido				  
										  
 										SELECT COUNT(*) 
										  INTO :ll_nis_valido
										FROM GI_SUMINISTROS_IMP 										  
										WHERE NIS_RAD = :ll_nis;
									
										If ISnull(ll_nis_valido) or ll_nis_valido = 0 Then										  
											messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Suministro Importante inv$$HEX1$$e100$$ENDHEX$$lido", Exclamation!, OK!)
										  Return 1
										End If 
  			
										 
									  //controla dato si no es lo mismo que precedente
									  for ll_row_control = 1 to dw_mant_suministros_cat.RowCount()
									   if ll_row_control <> ll_row then
										 IF dw_mant_suministros_cat.Find ("nis_rad = " + String(ll_nis), ll_row_control, ll_row_control) <> 0 THEN	
														 gnv_msg.f_mensaje('EM25',' ',' ',OK!)		 
												 return 1
											 END IF
									   end if
									  next	
									  
								  // controla datos si no estan null
    									if ISNULL(ll_nis) OR ISNULL(ls_descripcion_cat) or ISNULL(ll_cod_cat) or ls_descripcion_cat = ""  or ll_nis = 0 then
	   										gnv_msg.f_mensaje('EG12',' ',' ',OK!)
												
	   								return 1
    									end if							  

	 
                            // Grabamos en BD, hacemos commit o rollback.	  
									 IF dw_mant_suministros_cat.update() = -1 THEN
										ROLLBACK;
										return 1
									 ELSE		
										
										 SELECT color
										 INTO :ls_color_cat 
										 FROM GI_CATEGORIA 
										 WHERE COD_CATEGORIA = :ll_cod_cat;	

										
										UPDATE GI_AVISOS 
										SET COD_CATEGORIA = :ll_cod_cat,
										    COD_COLOR_CATEGORIA = :ls_color_cat 
										WHERE NIS_RAD = :ll_nis;
										
										
										//Hago Commit							
										COMMIT;
									 END IF						 
								 
									 dw_mant_suministros_cat.SetRow(ll_row)	
									 dw_mant_suministros_cat.ScrollToRow(ll_row)	  

	
								 CASE 2
										//Si la respuesta es negativa regresamos al estado original
										l_status = dw_mant_suministros_cat.GetItemStatus(ll_row, 0, Primary!)  
										 if  l_status = New! or l_status = NewModified! then											
													dw_mant_suministros_cat.DeleteRow(ll_row)
													dw_mant_suministros_cat.SetRow(ll_row - 1 )
													dw_mant_suministros_cat.ScrollToRow(ll_row - 1)
										 end if		
										 
										 If  ll_row = 1 Then
											  cb_aceptar.enabled = false	
										 End If

								CASE 3
										//Si la respuesta es negativa regresamos al estado original
										l_status = dw_mant_suministros_cat.GetItemStatus(ll_row, 0, Primary!)  
										 if  l_status = New! or l_status = NewModified! then											
													dw_mant_suministros_cat.DeleteRow(ll_row)
													dw_mant_suministros_cat.SetRow(ll_row - 1 )
													dw_mant_suministros_cat.ScrollToRow(ll_row - 1)
										 end if
										 
										 If  ll_row = 1 Then
											  cb_aceptar.enabled = false	
										 End If
					End Choose

 cb_agregar.enabled = True
 dw_mant_suministros_cat.Modify("activo.Protect=0")
 il_fila_blanco = 0
//NCA-FIN.DDAG-4730.20160212.




end event

event open;call super::open;long ll_numfilas


//NCA-INICIO.DDAG-4730.20160212.
dw_mant_suministros_cat.visible = true
dw_mant_suministros_cat.settransobject(sqlca)
dw_mant_suministros_cat.retrieve()
dw_mant_suministros_cat.setredraw(true) 

dw_mant_suministros_cat.SetFocus()
ll_numfilas = dw_mant_suministros_cat.RowCount()     //se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de filas en el datawindow
dw_mant_suministros_cat.scrolltorow(ll_numfilas)       //se desplaza hasta la $$HEX1$$fa00$$ENDHEX$$ltima
dw_mant_suministros_cat.setcolumn(1)         //se selecciona la primera columna

If ll_numfilas = 0 Then 	 
    cb_aceptar.enabled = false	
End if 
//NCA-FIN.DDAG-4730.20160212.
end event

event closequery;call super::closequery;ROLLBACK; 
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mant_suministros_cat
end type

type dw_mant_suministros_cat from datawindow within w_mant_suministros_cat
integer x = 169
integer y = 124
integer width = 2537
integer height = 844
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_mant_suministros_cat"
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

ls_columna_actual=dw_mant_suministros_cat.GetColumnName()

//NCA-INICIO.DDAG-4730.20160212.

If ls_valor = "" or IsNull(ls_valor) Then 
		il_fila_blanco = dw_mant_suministros_cat.GetRow()		
		dw_mant_suministros_cat.Modify("color.Protect=1")		
		dw_mant_suministros_cat.SetFocus()
		cb_agregar.enabled = false
End If 

//NCA-FIN.DDAG-4730.20160212.
end event

event itemfocuschanged;string ls_descripcion
ls_descripcion = dw_mant_suministros_cat.GetItemString(RowCount(),"descripcion")

//NCA-INICIO.DDAG-4730.20160212.

IF dw_mant_suministros_cat.DeletedCount() > 0 OR & 
	dw_mant_suministros_cat.ModifiedCount() > 0 THEN   
	
	If IsNull(ls_descripcion) or  ls_descripcion = "" Then
   	dw_mant_suministros_cat.SetRow(RowCount())
		
	End If	
	dw_mant_suministros_cat.SetRow(il_fila_blanco)	
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

type cb_agregar from commandbutton within w_mant_suministros_cat
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

event clicked;w_mant_suministros_cat.triggerevent("ue_arch_agregar")
end event

type cb_aceptar from commandbutton within w_mant_suministros_cat
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

event clicked;w_mant_suministros_cat.triggerevent("ue_arch_grabar")


end event

type cb_cancelar from commandbutton within w_mant_suministros_cat
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


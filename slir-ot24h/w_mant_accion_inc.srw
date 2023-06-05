HA$PBExportHeader$w_mant_accion_inc.srw
$PBExportComments$Ventana de mantenimiento de acci$$HEX1$$f300$$ENDHEX$$n de Incidencia
forward
global type w_mant_accion_inc from w_sgigenerica
end type
type dw_mant_accion_inc from datawindow within w_mant_accion_inc
end type
type cb_agregar from commandbutton within w_mant_accion_inc
end type
type cb_aceptar from commandbutton within w_mant_accion_inc
end type
type cb_cancelar from commandbutton within w_mant_accion_inc
end type
end forward

global type w_mant_accion_inc from w_sgigenerica
string title = "OPEN SGI - Mantenimiento de Acciones de Incidencia"
dw_mant_accion_inc dw_mant_accion_inc
cb_agregar cb_agregar
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_mant_accion_inc w_mant_accion_inc

type variables
Long il_nro_max_cod_accion,il_max_accion_inc
long il_fila_blanco, il_valor_cod_act

end variables

on w_mant_accion_inc.create
int iCurrent
call super::create
this.dw_mant_accion_inc=create dw_mant_accion_inc
this.cb_agregar=create cb_agregar
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_mant_accion_inc
this.Control[iCurrent+2]=this.cb_agregar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_cancelar
end on

on w_mant_accion_inc.destroy
call super::destroy
destroy(this.dw_mant_accion_inc)
destroy(this.cb_agregar)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event ue_arch_agregar;call super::ue_arch_agregar;long	ll_row, ll_nro_max_cod_accion


//NCA-INICIO.DDAG-1783.20150228.Agregamos
				
					dw_mant_accion_inc.AcceptText()
					dw_mant_accion_inc.setredraw(true)				

					ll_row = dw_mant_accion_inc.InsertRow(0)
					dw_mant_accion_inc.ScrollToRow(ll_row)

					
					SELECT MAX (COD_ACCION_INC)
					  INTO : ll_nro_max_cod_accion
					  FROM GI_TIP_ACCION_INC;
	
					il_max_accion_inc = ll_nro_max_cod_accion + 1	
	
					dw_mant_accion_inc.SetItem(ll_row, "cod_accion_inc", il_max_accion_inc)
					dw_mant_accion_inc.SetItem(ll_row, "usuario", gs_usuario)
					dw_mant_accion_inc.SetItem(ll_row, "f_actual", fgnu_fecha_actual())
					dw_mant_accion_inc.SetItem(ll_row, "h_actual", fgnu_fecha_actual())
					dw_mant_accion_inc.SetItem(ll_row, "programa", "MANTENIMIENTO")
					dw_mant_accion_inc.SetItem(ll_row, "activo", 1)										


	cb_agregar.enabled = false 
	dw_mant_accion_inc.Modify("activo.Protect=1")
  
//NCA-FIN.DDAG-1783.20150228.



end event

event ue_arch_grabar;call super::ue_arch_grabar;string ls_descripcion
long ll_row,ll_row_control, ll_countfilas
integer li_resp, li_activo,il_valor
dwItemStatus l_status

//NCA-INICIO.DDAG-1783.20150228.Grabamos.
	    
    				ll_row = dw_mant_accion_inc.GetRow()					 
 
	 				// preguntamos si grabamos o no.
    				li_resp = gnv_msg.f_mensaje('CG02',' ','',YesNoCancel!)
					 
					
					Choose Case li_resp													
							
					//	Si la respuesta es afirmativa validamos y procedemos a grabar.
							 	 CASE 1	
    									IF dw_mant_accion_inc.AcceptText( ) = -1 THEN RETURN 1  
										 
    									ls_descripcion = dw_mant_accion_inc.GetItemString(ll_row,"descripcion")
										li_activo = dw_mant_accion_inc.GetItemNumber(ll_row,"activo")	   									
  
  										// controla datos si no estan null
    									if ISNULL(ls_descripcion) or ISNULL(li_activo) or ls_descripcion = "" then
	   										gnv_msg.f_mensaje('EG12',' ',' ',OK!)
												
	   								return 1
    									end if	 
	  	 
									  //controla dato si no es lo mismo que precedente
									  for ll_row_control = 1 to dw_mant_accion_inc.RowCount()
									   if ll_row_control <> ll_row then
										  IF dw_mant_accion_inc.Find ("descripcion ='"+ ls_descripcion +"'", ll_row_control, ll_row_control) <> 0 THEN										  
														 gnv_msg.f_mensaje('EM25',' ',' ',OK!)		 
												 return 1
											 END IF
									   end if
									  next	
	 
                            // Grabamos en BD, hacemos commit o rollback.	  
									 IF dw_mant_accion_inc.update() = -1 THEN
										ROLLBACK;
										return 1
									 ELSE
										COMMIT;
									 END IF						 
								 
									 dw_mant_accion_inc.SetRow(ll_row)	
									 dw_mant_accion_inc.ScrollToRow(ll_row)	  

	
								 CASE 2
										//Si la respuesta es negativa regresamos al estado original
										l_status = dw_mant_accion_inc.GetItemStatus(ll_row, 0, Primary!)  
										 if  l_status = New! or l_status = NewModified! then											
													dw_mant_accion_inc.DeleteRow(ll_row)
													dw_mant_accion_inc.SetRow(ll_row - 1 )
													dw_mant_accion_inc.ScrollToRow(ll_row - 1)
										 end if		
										 
										 
										 //Validamos que si hicimos uncheck vuelva a quedar check regresamos todo a su estado original.
										  dw_mant_accion_inc.SetTransObject(SQLCA)
	 									  dw_mant_accion_inc.retrieve()											
																						
										  ll_countfilas = dw_mant_accion_inc.RowCount()     
										  dw_mant_accion_inc.scrolltorow(ll_countfilas)       
										  dw_mant_accion_inc.setcolumn(1)
								CASE 3
										//Si la respuesta es negativa regresamos al estado original
										l_status = dw_mant_accion_inc.GetItemStatus(ll_row, 0, Primary!)  
										 if  l_status = New! or l_status = NewModified! then											
													dw_mant_accion_inc.DeleteRow(ll_row)
													dw_mant_accion_inc.SetRow(ll_row - 1 )
													dw_mant_accion_inc.ScrollToRow(ll_row - 1)
										 end if									 
										 
										 //Validamos que si hicimos uncheck vuelva a quedar check regresamos todo a su estado original.
										  dw_mant_accion_inc.SetTransObject(SQLCA)
	 									  dw_mant_accion_inc.retrieve()											
																						
										  ll_countfilas = dw_mant_accion_inc.RowCount()     
										  dw_mant_accion_inc.scrolltorow(ll_countfilas)       
										  dw_mant_accion_inc.setcolumn(1)								
										
					End Choose

 cb_agregar.enabled = True
 dw_mant_accion_inc.Modify("activo.Protect=0")
 il_fila_blanco = 0
//NCA-FIN.DDAG-1783.20150228.




end event

event open;call super::open;long ll_numfilas


//NCA-INICIO.DDAG-1783.20150228.
dw_mant_accion_inc.visible = true
dw_mant_accion_inc.settransobject(sqlca)
dw_mant_accion_inc.retrieve()
dw_mant_accion_inc.setredraw(true) 

dw_mant_accion_inc.SetFocus()
ll_numfilas = dw_mant_accion_inc.RowCount()     //se obtiene el n$$HEX1$$fa00$$ENDHEX$$mero de filas en el datawindow
dw_mant_accion_inc.scrolltorow(ll_numfilas)       //se desplaza hasta la $$HEX1$$fa00$$ENDHEX$$ltima
dw_mant_accion_inc.setcolumn(1)         //se selecciona la primera columna
//NCA-FIN.DDAG-1783.20150228.
end event

event closequery;call super::closequery;ROLLBACK; 
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mant_accion_inc
end type

type dw_mant_accion_inc from datawindow within w_mant_accion_inc
integer x = 169
integer y = 124
integer width = 2537
integer height = 844
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_man_accion_inc"
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

ls_columna_actual=dw_mant_accion_inc.GetColumnName()

//NCA-INICIO.DDAG-1783.20150305.Validamos que no se pueda deshabilitar la primera opci$$HEX1$$f300$$ENDHEX$$n "NO ASIGNADA"

il_cod_valor = dw_mant_accion_inc.getItemNumber(row, "cod_accion_inc")  
 
 If il_cod_valor = 0  Then 	 
    gnv_msg.f_mensaje('EA27',' ',' ',OK!)	

	 dw_mant_accion_inc.setredraw(true)
	 dw_mant_accion_inc.SetItem(getrow(), "activo", 1)		 
	 dw_mant_accion_inc.setredraw(false)			  
	 dw_mant_accion_inc.SetTransObject(SQLCA)
	 dw_mant_accion_inc.retrieve()	
	 dw_mant_accion_inc.setredraw(true)
	 cb_agregar.enabled = True
	 return 
 End If  


//VAlidamos que si se hace clic en la columna activo bloqueamos el boton agregar.

If ls_columna_actual = 'activo' Then
	cb_agregar.enabled = false
End If 

//Validamos que si la descripci$$HEX1$$f300$$ENDHEX$$n queda en blanco se mantenga en la fila hasta digitar la nueva descripc$$HEX1$$f300$$ENDHEX$$n
//string ls_descripcion_blanco

If ls_valor = "" or IsNull(ls_valor) Then 
		il_fila_blanco = dw_mant_accion_inc.GetRow()		
		dw_mant_accion_inc.Modify("activo.Protect=1")		
		dw_mant_accion_inc.SetFocus()
		cb_agregar.enabled = false
End If 


end event

event itemfocuschanged;string ls_descripcion
ls_descripcion = dw_mant_accion_inc.GetItemString(RowCount(),"descripcion")

//NCA-INICIO.DDAG-1783.20150317.

IF dw_mant_accion_inc.DeletedCount() > 0 OR & 
	dw_mant_accion_inc.ModifiedCount() > 0 THEN   
	
	If IsNull(ls_descripcion) or  ls_descripcion = "" Then
   	dw_mant_accion_inc.SetRow(RowCount())
		
	End If	
	dw_mant_accion_inc.SetRow(il_fila_blanco)	
END IF

//NCA-FIN.DDAG-1783.20150317.





end event

event editchanged;
//NCA-INICIO.DDAG-1783.20150317.

string ls_valor

If ls_valor = "" or IsNull(ls_valor) Then 
		cb_agregar.enabled = false
End If 

//NCA-FIN.DDAG-1783.20150317.

end event

type cb_agregar from commandbutton within w_mant_accion_inc
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

event clicked;w_mant_accion_inc.triggerevent("ue_arch_agregar")
end event

type cb_aceptar from commandbutton within w_mant_accion_inc
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

event clicked;w_mant_accion_inc.triggerevent("ue_arch_grabar")


end event

type cb_cancelar from commandbutton within w_mant_accion_inc
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


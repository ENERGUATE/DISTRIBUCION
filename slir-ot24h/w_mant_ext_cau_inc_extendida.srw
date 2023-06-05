HA$PBExportHeader$w_mant_ext_cau_inc_extendida.srw
forward
global type w_mant_ext_cau_inc_extendida from w_sgigenerica
end type
type cb_cancelar from commandbutton within w_mant_ext_cau_inc_extendida
end type
type cb_aceptar from commandbutton within w_mant_ext_cau_inc_extendida
end type
type cb_eliminar from commandbutton within w_mant_ext_cau_inc_extendida
end type
type cb_agregar from commandbutton within w_mant_ext_cau_inc_extendida
end type
type tab_1 from tab within w_mant_ext_cau_inc_extendida
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tabpage_2 from userobject within tab_1
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_2 dw_2
end type
type tab_1 from tab within w_mant_ext_cau_inc_extendida
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
end forward

global type w_mant_ext_cau_inc_extendida from w_sgigenerica
integer x = 864
integer y = 600
integer width = 2610
integer height = 1444
string title = "Mantenimiento de las Causas de Incidencias"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79416533
event agregar_registro pbm_custom40
event borrar_registro pbm_custom41
event grabar_modificaciones pbm_custom42
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_eliminar cb_eliminar
cb_agregar cb_agregar
tab_1 tab_1
end type
global w_mant_ext_cau_inc_extendida w_mant_ext_cau_inc_extendida

type variables
boolean ib_fila_nueva
int ii_fila_nueva = 0
boolean ib_duplicado

long il_scan_cambios_OK
long il_update_dw_OK
DataWindow idw_dw



end variables

forward prototypes
public function integer wf_update_dw ()
public function integer wf_si_todavia_existe (readonly long pl_tipo, readonly long pl_subtipo, readonly long pl_gpo_causa, readonly string ps_descripcion)
public function long fw_nuevo_grupo (readonly long al_tipo, readonly long al_subtipo)
public function integer wf_scan_cambios ()
public function boolean wf_si_duplicado (long pl_tipo, long pl_subtipo, long pl_gpo_causa)
end prototypes

event agregar_registro;long ll_nuevo_grupo, ll_nueva_causa
int respuesta



If idw_dw.ModifiedCount() > 0 Or idw_dw.DeletedCount() > 0 Then
	respuesta = gnv_msg.f_mensaje("CG12","","",OkCancel!)

	CHOOSE CASE respuesta
			 CASE 2
						return
			 CASE 1
				cb_aceptar.triggerevent('clicked') //DBE 16/02/2000   
				if  il_scan_cambios_OK<0 or il_update_dw_OK<0 then return;
				
	END CHOOSE
End If


// Inserto una nueva fila en la dw, con el gpo_causa calculado anteriormente
// y los valores por defecto para usuario, programa y fecha

ii_fila_nueva = idw_dw.insertrow(0)
idw_dw.setfocus()
idw_dw.scrolltorow(ii_fila_nueva)
ii_fila_nueva = idw_dw.getrow()

ib_fila_nueva = True


If tab_1.SelectedTab = 1 Then
	tab_1.tabpage_2.Enabled = False
Else
	tab_1.tabpage_1.Enabled = False
End If

end event

event borrar_registro;Long ll_fila_actual, ll_gpo_causa, ll_cantidad
Long ll_tipo, ll_subtipo




ll_fila_actual = idw_dw.getrow()
ll_gpo_causa = 0


if ll_fila_actual < 1 then  return


// GNU 7-12-2005. Mejora 1/342078
//IF gnv_msg.f_mensaje("CM05","","",YesNo!) = 2  THEN     //DBE 26/10/1999
//	return  
//END IF
 IF 	 gnv_msg.f_mensaje("CG12","","",YesNo!) 	= 2 THEN
	return
ELSE

   	
// Obtengo el numero de grupo para borrar la cabecera de la familia de causas	
ll_tipo = idw_dw.getitemnumber(ll_fila_actual,"tipo")
ll_subtipo = idw_dw.getitemnumber(ll_fila_actual,"subtipo")

// GNU 25-11-2005. Mejora 1/342078
//If tab_1.SelectedTab = 2 Then	
//	ll_gpo_causa = idw_dw.getitemnumber(ll_fila_actual,"subtipo")
//ll_gpo_causa = idw_dw.getitemnumber(ll_fila_actual,"gpo_causa")

//Select count(*)
//  Into :ll_cantidad
//  From gi_causa
// Where (tipo = :ll_tipo and &
// 		  subtipo = :ll_subtipo and &
//		  (gpo_causa = :ll_gpo_causa And :ll_gpo_causa > 0) ) And &
//		  rownum<3;
//else
//Select count(*)
//  Into :ll_cantidad
//  From gi_causa
// Where (tipo = :ll_tipo and &
//  		  subtipo = :ll_subtipo) and &
//		  rownum<3;
//
//End If
// FIN GNU
// Compruebo si hay hijos para esa familia en la tabla gi_causa
//Select count(*)
//  Into :ll_cantidad
//  From gi_causa
// Where (tipo = :ll_tipo Or &
// 		  subtipo = :ll_subtipo Or &
//		  (gpo_causa = :ll_gpo_causa And :ll_gpo_causa > 0) ) And &
//		  rownum<3;

// Si hay hijos no puedo borrar
//If ll_cantidad > 1 Then
//  gnv_msg.f_mensaje("AI137","","",Ok!)//DBE 11/02/2000
//Else
//// idw_dw.deleterow(ll_fila_actual)
if idw_dw.GetItemNumber(ll_fila_actual, "activo")= 1 then
	If tab_1.SelectedTab = 2 Then	
		ll_gpo_causa = idw_dw.getitemnumber(ll_fila_actual,"gpo_causa")

		Select count(*)
  		Into :ll_cantidad
  		From gi_causa
 		Where (tipo = :ll_tipo and &
 			  subtipo = :ll_subtipo and &
			  (gpo_causa = :ll_gpo_causa And :ll_gpo_causa > 0) ) And &
			  activo = 1;
	else
// GNU 12-12-2005. Mejora 1/342078
//		Select count(*)
//  		Into :ll_cantidad
//  		From gi_causa
// 		Where (tipo = :ll_tipo and &
//  			  subtipo = :ll_subtipo) and &
//		  	  activo = 1;
		Select count (*)
		Into :ll_cantidad
		From gi_subtipo_causa
		Where (tipo =: ll_tipo and &
			subtipo = :ll_subtipo) and &
			//gpo_causa = :ll_gpo_causa and :ll_gpo_causa > 0) and &
			activo = 1;
// FIN GNU

	End If
	If ll_cantidad > 0 Then
//		gnv_msg.f_mensaje("AI137","","",Ok!)//DBE 11/02/2000
 	// GNU 7-12-2005. Mejora 1/342078
		If tab_1.SelectedTab = 2 Then	
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Esta subfamilia tiene causas activas, desact$$HEX1$$ed00$$ENDHEX$$velas para poder continuar")
		Else
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Esta familia tiene subfamilias activas, desact$$HEX1$$ed00$$ENDHEX$$velas para poder continuar")
		End if
	// FIN GNU
	Else
		idw_dw.setitem(ll_fila_actual,"activo", 0)
		cb_eliminar.text= "Activa~&r"
	End if
else
	// GNU 12-1-2006. Mejora 1/342078
		If tab_1.SelectedTab = 2 Then	
			select activo
			into :ll_cantidad
			from gi_subtipos
			where (tipo =: ll_tipo and &
			subtipo = :ll_subtipo) ;
			If ll_cantidad = 0 Then
//		gnv_msg.f_mensaje("AI137","","",Ok!)//DBE 11/02/2000
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La familia no est$$HEX2$$e1002000$$ENDHEX$$activa,act$$HEX1$$ed00$$ENDHEX$$vela para poder continuar") // GNU 7-12-2005. Mejora 1/342078
			Else
				idw_dw.setitem(ll_fila_actual,"activo", 1)
				cb_eliminar.text= "Desactiva~&r"
			End if
		else
			// FIN GNU
			idw_dw.setitem(ll_fila_actual,"activo", 1)
			cb_eliminar.text= "Desactiva~&r"
		end if
end if
idw_dw.update()
this.triggerevent("grabar_modificaciones")
End If
 // FIN GNU
end event

event grabar_modificaciones;long ll_fila = 1
string ls_descripcion

//if idw_dw.rowcount() > 0 then
//        idw_dw.accepttext()
     
//        do while ll_fila <= idw_dw.rowcount()
//                ls_descripcion = idw_dw.getitemstring(ll_fila,"descripcion") 
//                if isnull(ls_descripcion) or len(trim(ls_descripcion)) = 0 then
//                        gnv_msg.f_mensaje("AI59","","",Ok!)
//                        return
//                end if
//                
//                ll_fila ++
//        loop
        
//end if

il_update_dw_OK=wf_update_dw()

if il_update_dw_OK<0 then 
	if il_update_dw_OK=-1 then // GNU 12-1-2006. Mejora 1/342078. Para que no muestre dos veces el error
		gnv_msg.f_mensaje("EM59",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",OK!)
		gnu_u_transaction.uf_rollback();   
	end if
else
	gnu_u_transaction.uf_commit();
	idw_dw.Reset()
	idw_dw.Retrieve()

	tab_1.tabpage_1.Enabled = True
	tab_1.tabpage_2.Enabled = True
end if

ii_fila_nueva = 0
ib_fila_nueva = False
end event

public function integer wf_update_dw ();long ll_counter
long ll_Deleted_cod_causa,ll_Deleted_gpo_causa
long ll_last_modif
long ll_tipo, ll_subtipo, ll_gpo_causa
long ll_cantidad
long ll_activo, ll_activo_subtipo
string ls_descripcion
DataWindowChild ldwc_tipo_subtipo


/// insert and update


ll_last_modif=idw_dw.GetNextModIfied(0, Primary!)


Do While ll_last_modif > 0 
	ls_descripcion = Left(Trim(idw_dw.getitemstring(ll_last_modif,'descripcion')),50)

	If tab_1.SelectedTab = 1 Then
		ll_tipo = idw_dw.GetItemNumber(ll_last_modif,'tipo')
		ll_subtipo = idw_dw.GetItemNumber(ll_last_modif,'subtipo')
		ll_activo =idw_dw.GetItemNumber(ll_last_modif,'activo') // GNU 28-11-2005. Mejora 1/342078
	Else
		idw_dw.GetChild("c_concat", ldwc_tipo_subtipo)

		If ldwc_tipo_subtipo.GetRow() > 0 Then
			ll_tipo = ldwc_tipo_subtipo.GetItemNumber(ldwc_tipo_subtipo.GetRow(),'tipo')
			ll_subtipo = ldwc_tipo_subtipo.GetItemNumber(ldwc_tipo_subtipo.GetRow(),'subtipo')	
		End If
		ll_activo =idw_dw.GetItemNumber(ll_last_modif,'activo') // GNU 28-11-2005. Mejora 1/342078
		ll_gpo_causa=idw_dw.GetItemNumber(ll_last_modif,'gpo_causa')
	End If

	If idw_dw.GetItemStatus ( ll_last_modif, 0, primary! )=NewModIfied! Then 
		If tab_1.SelectedTab = 1 Then
			INSERT INTO "GI_SUBTIPOS"  
				( "TIPO",
				  "SUBTIPO",
				  "DESCRIPCION",
				  "ACTIVO") // GNU 28-11-2005. Mejora 1/342078
			VALUES
				( :ll_tipo,   
				  :ll_subtipo,
				  :ls_descripcion,
				  :ll_activo) ; // GNU 28-11-2005. Mejora 1/342078
		Else
			// GNU 12-1-2005. Mejora 1/342078
			SELECT ACTIVO
			INTO :ll_activo_subtipo
			FROM GI_SUBTIPOS
			WHERE
				TIPO= :ll_tipo AND SUBTIPO= :ll_subtipo;
			IF ll_activo_subtipo = 0 THEN
				Messagebox("Error", "Debe seleccionar un tipo activo")
				return -2
			END IF
			
			INSERT INTO "GI_SUBTIPO_CAUSA"  
				( "TIPO",
				  "SUBTIPO",
				  "GPO_CAUSA",
				  "DESCRIPCION",
				  "ACTIVO") // GNU 28-11-2005. Mejora 1/342078
			VALUES
				( :ll_tipo,   
				  :ll_subtipo,
				  :ll_gpo_causa,
				  :ls_descripcion,
				  :ll_activo) ; // GNU 28-11-2005. Mejora 1/342078
		End If

		If sqlca.sqlcode<0 Then Return -1;
	Else
		If tab_1.SelectedTab = 1 Then
			UPDATE "GI_SUBTIPOS"  
			SET "TIPO" = :ll_tipo,   
				 "SUBTIPO" = :ll_subtipo,   
				 "DESCRIPCION" = :ls_descripcion ,
				 "ACTIVO"= :ll_activo // GNU 28-11-2005. Mejora 1/342078
			WHERE "TIPO"	= :ll_gpo_causa AND "SUBTIPO"	= :ll_subtipo ;
		Else
			ll_gpo_causa=idw_dw.GetItemNumber(ll_last_modif,'gpo_causa')

			UPDATE "GI_SUBTIPO_CAUSA"  
			SET "TIPO" = :ll_tipo,   
				 "SUBTIPO" = :ll_subtipo,   
				 "GPO_CAUSA" = :ll_gpo_causa,   
				 "DESCRIPCION" = :ls_descripcion,
				 "ACTIVO" = :ll_activo // GNU 28-11-2005. Mejora 1/342078
			WHERE "TIPO"	= :ll_tipo AND "SUBTIPO" = :ll_subtipo ;
		End If

	  If sqlca.sqlcode < 0 Then Return -1 ;
	End If

	ll_last_modif=idw_dw.GetNextModIfied(ll_last_modif, Primary!)
Loop


// Delete


For ll_counter = 1 to idw_dw.DeletedCount()
	ll_Deleted_gpo_causa=idw_dw.GetItemNumber(ll_counter,'gpo_causa', Delete!, False)

	Select count(*)
	  Into :ll_cantidad
	  From gi_causa
	 Where gpo_causa = :ll_Deleted_gpo_causa And rownum < 3;

	If ll_cantidad > 1 Then
		gnv_msg.f_mensaje("EG08",idw_dw.getitemstring(ll_counter,'descripcion', Delete!, False),"",Ok!)
   Else
		Delete From gi_familia_causas Where gpo_causa=:ll_Deleted_gpo_causa;

		If sqlca.sqlcode < 0 Then Return -1;
	End If
Next

Return 0
end function

public function integer wf_si_todavia_existe (readonly long pl_tipo, readonly long pl_subtipo, readonly long pl_gpo_causa, readonly string ps_descripcion);//wf_si_todavia_existe
Long ll_existe



If tab_1.SelectedTab = 1 Then
	Select Count(*) 
	  Into :ll_existe 
	  From GI_SUBTIPOS
	 Where TIPO = :pl_tipo And
			 SUBTIPO = :pl_subtipo ;
Else
	Select Count(*)
	  Into :ll_existe 
	  From GI_SUBTIPO_CAUSA
	 Where TIPO = :pl_tipo And
			 SUBTIPO = :pl_subtipo  And
			 GPO_CAUSA = :pl_gpo_causa ;
End If

If ll_existe = 0 Then // no existe
	//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$la causa '+ ps_descripcion+' . Se necesita actualizar datos');
	gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)
End If

Return ll_existe
end function

public function long fw_nuevo_grupo (readonly long al_tipo, readonly long al_subtipo);Long ll_ultimo



// Seleccion el $$HEX1$$fa00$$ENDHEX$$ltimo n$$HEX2$$ba002000$$ENDHEX$$asignado a un grupo de causas
SELECT Max(SUBTIPO) 
  INTO :ll_ultimo 
  FROM GI_SUBTIPOS	
 WHERE TIPO = :al_tipo AND SUBTIPO = :al_subtipo ;


If ll_ultimo=999 Then //Casi imposible...
	gnu_u_transaction.uf_rollback(This)
	messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar c$$HEX1$$f300$$ENDHEX$$digo SUBTIPO')

	Return -1
End If

If ll_ultimo = 0 or isnull(ll_ultimo) Then
	ll_ultimo = 1
Else
	 ll_ultimo ++
End If

Return ll_ultimo
end function

public function integer wf_scan_cambios ();Boolean lb_duplicado
Long ll_noHay, ll_activo
Long ll_last_modif
Long ll_tipo, ll_subtipo, ll_gpo_causa = 0
String ls_descripcion
DataWindowChild ldwc_tipo_subtipo



ll_last_modif=idw_dw.GetNextModified(0, Primary!)

Do While ll_last_modif > 0
	If tab_1.SelectedTab = 1 Then
		ll_tipo=idw_dw.GetItemNumber(ll_last_modif,'tipo')
		ll_subtipo=idw_dw.GetItemNumber(ll_last_modif,'subtipo')
		ll_activo =idw_dw.GetItemNumber(ll_last_modif,'activo') // GNU 28-11-2005. Mejora 1/342078ll_activo =idw_dw.GetItemNumber(ll_last_modif,'activo') // GNU 28-11-2005. Mejora 1/342078
	Else
		idw_dw.GetChild("c_concat", ldwc_tipo_subtipo)

		If ldwc_tipo_subtipo.GetRow() > 0 Then
			ll_tipo = ldwc_tipo_subtipo.GetItemNumber(ldwc_tipo_subtipo.GetRow(),'tipo')
			ll_subtipo = ldwc_tipo_subtipo.GetItemNumber(ldwc_tipo_subtipo.GetRow(),'subtipo')		
		End If
		ll_activo =idw_dw.GetItemNumber(ll_last_modif,'activo') // GNU 28-11-2005. Mejora 1/342078
		ll_gpo_causa=idw_dw.GetItemNumber(ll_last_modif,'gpo_causa')
	End If

	ls_descripcion=idw_dw.GetItemString(ll_last_modif,'descripcion')

	If IsNull(ls_descripcion) or len(trim(ls_descripcion)) = 0 Then
		gnv_msg.f_mensaje("AI59","","",Ok!)
		idw_dw.SetFocus()
		idw_dw.ScrollToRow(ll_last_modif)
		Return -1
	End If

	//Modified record in dw still exist in the database?
	If Not idw_dw.GetItemStatus(ll_last_modif,0,Primary!)=NewModified! Then
		ll_noHay=wf_si_todavia_existe(ll_tipo,ll_subtipo,ll_gpo_causa,ls_descripcion)
   End If

   If ll_noHay > 0 Or &
		idw_dw.GetItemStatus (ll_last_modif,0,Primary!)=NewModified! Then
		lb_duplicado=wf_si_duplicado(ll_tipo,ll_subtipo,ll_gpo_causa)

		If lb_duplicado Then Return -2 ;
   End If

	ll_last_modif=idw_dw.GetNextModified(ll_last_modif, Primary!)
Loop

Return 0
end function

public function boolean wf_si_duplicado (long pl_tipo, long pl_subtipo, long pl_gpo_causa);Long ll_count



If tab_1.SelectedTab = 1 Then	
	Select count(*)
	  Into :ll_count
	  From gi_subtipos
	 Where tipo = :pl_tipo And subtipo = :pl_subtipo ;
Else
	Select count(*)
	  Into :ll_count
	  From gi_subtipo_causa
	 Where tipo = :pl_tipo And subtipo = :pl_subtipo And gpo_causa = :pl_gpo_causa ;
End If
		
If ll_count > 0 Then
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ya existe el c$$HEX1$$f300$$ENDHEX$$digo de familia de causa seleccionado.') ;

	Return True
End If

Return False
end function

event close;gnu_u_transaction.uf_rollback(); //DBE 14/02/2000
Close(This)

end event

on w_mant_ext_cau_inc_extendida.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_eliminar=create cb_eliminar
this.cb_agregar=create cb_agregar
this.tab_1=create tab_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_eliminar
this.Control[iCurrent+4]=this.cb_agregar
this.Control[iCurrent+5]=this.tab_1
end on

on w_mant_ext_cau_inc_extendida.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_eliminar)
destroy(this.cb_agregar)
destroy(this.tab_1)
end on

event open;call super::open;int li_contador, li_i

setpointer(hourglass!)


tab_1.tabpage_1.dw_1.SetTransObject(SQLCA)
tab_1.tabpage_2.dw_2.SetTransObject(SQLCA)
tab_1.tabpage_1.dw_1.Retrieve()
tab_1.tabpage_2.dw_2.Retrieve()

tab_1.tabpage_1.dw_1.SetRowFocusIndicator(Hand!)
tab_1.tabpage_2.dw_2.SetRowFocusIndicator(Hand!)

If gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_MANTEN')=1 Then
	cb_aceptar.Visible  = TRUE
	cb_agregar.Visible  = TRUE
	cb_eliminar.Visible = TRUE
	cb_cancelar.Visible = TRUE
ElseIf gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_CONSULTA')=1 Then
	idw_dw = tab_1.tabpage_1.dw_1

	For li_i = 1 To 2
		For li_contador = 1 to integer(idw_dw.object.DataWindow.Column.Count)
			 idw_dw.Modify("#" + string(li_contador) + ".protect = 1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//			 idw_dw.Modify("#" + string(li_contador) + ".background.color = " + string(rgb(192,192,192)))		
			 idw_dw.Modify("#" + string(li_contador) + ".background.color = " + gs_gris)
// Fin. Sgo.
		Next

		idw_dw = tab_1.tabpage_2.dw_2
	Next

	cb_aceptar.Visible      = FALSE
	cb_agregar.Visible      = FALSE
	cb_eliminar.Visible     = FALSE
	cb_cancelar.Visible     = FALSE	 

	tab_1.tabpage_1.dw_1.SetRowFocusIndicator(Off!)
	tab_1.tabpage_2.dw_2.SetRowFocusIndicator(Off!)
Else 
	gnv_msg.f_mensaje("AA08","","",OK!)	
	//				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Su perfil no est$$HEX2$$e1002000$$ENDHEX$$autorizado a realizar mantenimiento")

	Close(This)
	Return				
End If

This.X=768 //DBE 26/10/1999
This.Y=212

idw_dw = tab_1.tabpage_1.dw_1

fg_centrar_ventana(This)
end event

event closequery;int li_respuesta

IF idw_dw.ModifiedCount() > 0 or idw_dw.deletedcount()>0 THEN
        li_respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 

        if li_respuesta = 1 then
//                if dw_1.update() = 1 then
//								gnu_u_transaction.uf_commit();
//                        close(this)
//                end if
//					 
					 cb_aceptar.triggerevent('clicked')
					 if il_scan_cambios_ok<0 or il_update_dw_ok<0 then return 1;
					 close(this)
        end if
        
        if li_respuesta = 2 then
                close(this)
        end if
        
        if li_respuesta = 3 then
                return 1
        end if
        
end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mant_ext_cau_inc_extendida
end type

type cb_cancelar from commandbutton within w_mant_ext_cau_inc_extendida
integer x = 1595
integer y = 1156
integer width = 407
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;setpointer(hourglass!)
Close(Parent)
end event

type cb_aceptar from commandbutton within w_mant_ext_cau_inc_extendida
integer x = 1129
integer y = 1156
integer width = 407
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Ace&ptar"
end type

event clicked;setpointer(hourglass!)
idw_dw.accepttext()

if not idw_dw.rowcount()>0 then return ;

if ib_duplicado=true then 
	ib_duplicado=false
	return 
end if

il_scan_cambios_OK=wf_scan_cambios()

if il_scan_cambios_OK<0 then return;

parent.triggerevent("grabar_modificaciones")
end event

type cb_eliminar from commandbutton within w_mant_ext_cau_inc_extendida
integer x = 663
integer y = 1156
integer width = 407
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Desactiva&r"
end type

event clicked;setpointer(hourglass!)
parent.triggerevent("borrar_registro")
end event

type cb_agregar from commandbutton within w_mant_ext_cau_inc_extendida
integer x = 197
integer y = 1156
integer width = 407
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;setpointer(hourglass!)
parent.triggerevent("agregar_registro")


end event

type tab_1 from tab within w_mant_ext_cau_inc_extendida
event create ( )
event destroy ( )
string tag = "Familia de Causas"
integer x = 37
integer y = 48
integer width = 2464
integer height = 1076
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79416533
boolean raggedright = true
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanged;If tab_1.SelectedTab = 1 Then
	idw_dw = tab_1.tabpage_1.dw_1
	// GNU 25-11-2005. Mejora 1/342078
	if tab_1.tabpage_1.dw_1.GetItemNumber(tab_1.tabpage_1.dw_1.GetRow(), "activo") = 1 then
		cb_eliminar.text= "Desactiva~&r"
	else
		cb_eliminar.text= "Activa~&r"
	End if
	// FIN GNU
Else
	idw_dw = tab_1.tabpage_2.dw_2
	// GNU 25-11-2005. Mejora 1/342078
	if tab_1.tabpage_2.dw_2.GetItemNumber(tab_1.tabpage_2.dw_2.GetRow(), "activo") = 1 then
		cb_eliminar.text= "Desactiva~&r"
	else
		cb_eliminar.text= "Activa~&r"
	End if
	// FIN GNU
End If
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2427
integer height = 948
long backcolor = 79416533
string text = "Familia de causas"
long tabtextcolor = 33554432
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
event ue_ext_post_itemchjanged ( readonly long al_row,  readonly string as_column )
integer x = 9
integer y = 48
integer width = 2432
integer height = 864
integer taborder = 30
string dataobject = "d_man_ext_tipo_causa"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_ext_post_itemchjanged;//If as_column = 'tipo' Then
//	This.SetSort("tipo A, subtipo A")
//	This.Sort()
//End If
//



end event

event itemchanged;This.Post Event ue_ext_post_itemchjanged(row, String(dwo.name))
end event

event rowfocuschanged;//If currentrow > 0 Then
////	If This.GetItemNumber(currentrow, "c_row_new") = 1 Then
//		cb_eliminar.Enabled = True
//	Else
//		cb_eliminar.Enabled = False
//	End If
//End If
If currentrow > 0 Then
// GNU 25-11-2005. Mejora 1/342078
	IF This.GetItemNumber(currentrow,"activo")= 1 Then	
		cb_eliminar.text= "Desactiva~&r"
	Else
		cb_eliminar.text= "Activa~&r"
	End If
End If
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2427
integer height = 948
long backcolor = 79416533
string text = "SubFamilia de causas"
long tabtextcolor = 33554432
long tabbackcolor = 79416533
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
integer x = 9
integer y = 48
integer width = 2427
integer height = 864
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_man_ext_subtipo_causa"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//If currentrow > 0 Then
//	// GNU 25-11-2005. Mejora 1/342078
////	If This.GetItemNumber(currentrow, "c_row_new") = 1 Then
//	IF This.GetItemNumber(currentrow,"activo")= 1 Then	
//		cb_eliminar.Enabled = True
//	Else
//		cb_eliminar.Enabled = False
//	End If
//End If
If currentrow > 0 Then
// GNU 25-11-2005. Mejora 1/342078
	IF This.GetItemNumber(currentrow,"activo")= 1 Then	
		cb_eliminar.text= "Desactiva~&r"
	Else
		cb_eliminar.text= "Activa~&r"
	End If
End If
end event


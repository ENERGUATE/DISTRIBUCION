HA$PBExportHeader$w_mant_causa.srw
$PBExportComments$Lo aun necesito
forward
global type w_mant_causa from w_sgigenerica
end type
type cb_agregar from commandbutton within w_mant_causa
end type
type cb_cancelar from commandbutton within w_mant_causa
end type
type cb_aceptar from commandbutton within w_mant_causa
end type
type cb_eliminar from commandbutton within w_mant_causa
end type
type dw_1 from datawindow within w_mant_causa
end type
type tv_1 from treeview within w_mant_causa
end type
end forward

global type w_mant_causa from w_sgigenerica
integer x = 603
integer y = 564
integer width = 3278
integer height = 1396
string title = "OPEN SGI - Mantenimiento de Causas"
windowtype windowtype = response!
long backcolor = 79741120
cb_agregar cb_agregar
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_eliminar cb_eliminar
dw_1 dw_1
tv_1 tv_1
end type
global w_mant_causa w_mant_causa

type variables
long ll_newrow
long manejador
integer modifi = 0
long ll_fila_actual

boolean ib_duplicado

long il_scan_cambios_OK
long il_update_dw_OK
long il_cod_causa_padre
int il_fila


end variables

forward prototypes
private function integer wf_scan_cambios ()
private function boolean wf_si_duplicado (long pl_cod_causa, string ps_descripcion)
private function integer wf_update_dw ()
private function integer wf_si_todavia_existe (long pl_cod_causa, string ps_descripcion)
private function boolean wf_si_tiene_relaciones_con_tablas (long pl_cod_causa, string ps_descripcion)
end prototypes

private function integer wf_scan_cambios ();//DBE  9/02/2000


boolean lb_duplicado
long ll_noHay
long ll_last_modif
long ll_cod_causa
string ls_descripcion

ll_last_modif=dw_1.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 
	///
	//Modified record in dw still exist in the database?
	ll_cod_causa=dw_1.getitemnumber(ll_last_modif,'cod_causa')
	ls_descripcion=dw_1.getitemstring(ll_last_modif,'descripcion')
	
	if isnull(ls_descripcion) or len(trim(ls_descripcion)) = 0 then
	gnv_msg.f_mensaje("EM57","","",Ok!)
	dw_1.SetFocus()
   dw_1.ScrollToRow(ll_last_modif)
	return -1 
   end if

	if not dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
     ll_noHay=wf_si_todavia_existe(ll_cod_causa,&
	  ls_descripcion)
	
   end if 	

   if ll_noHay>0 &
	or dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! &
	then //Description is unique ?
	lb_duplicado=wf_si_duplicado(ll_cod_causa,ls_descripcion)
	if lb_duplicado then return -2;
   else
		//
   end if
	///
					
ll_last_modif=dw_1.GetNextModified(ll_last_modif, Primary!)
loop

return 0
end function

private function boolean wf_si_duplicado (long pl_cod_causa, string ps_descripcion);//DBE 9/02/2000

long ll_cod_causa

select cod_causa into :ll_cod_causa from gi_causa
where descripcion = :ps_descripcion;


if ll_cod_causa <> pl_cod_causa and ll_cod_causa > 0 then
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ya existe esta descripc$$HEX1$$ed00$$ENDHEX$$on : '+ ps_descripcion);
gnv_msg.f_mensaje("AM57",ps_descripcion,"",OK!)
	return true
end if

	return false
end function

private function integer wf_update_dw ();long ll_counter
long ll_deleted_cod_causa,ll_deleted_gpo_causa
long ll_last_modif
long ll_cod_causa
long ll_gpo_causa
long ll_contador
string ls_descripcion
int li_lock_status
long ll_activo

/// insert and update

ll_last_modif=dw_1.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 

	ll_cod_causa=dw_1.getitemnumber(ll_last_modif,'cod_causa')
	ls_descripcion=dw_1.getitemstring(ll_last_modif,'descripcion')
	ls_descripcion=left(trim(ls_descripcion),50)
	ll_gpo_causa=dw_1.getitemnumber(ll_last_modif,'gpo_causa')
	ls_descripcion=upper(ls_descripcion)
	ll_activo=dw_1.getitemnumber(ll_last_modif,'activo')
	
	if dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
   		  INSERT INTO "GI_CAUSA"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "COD_CAUSA",   
           "DESCRIPCION",   
           "GPO_CAUSA",
	    "ACTIVO")  // GNU 28-11-2005. Mejora 1/342078
  VALUES ( :gs_usuario,   
           sysdate,   
           'w_mant_causa',   
           :ll_cod_causa,   
           :ls_descripcion,   
           :ll_gpo_causa,
	    :ll_activo)  ; // GNU 28-11-2005. Mejora 1/342078
			  
			  if sqlca.sqlcode<0 then return -1;

   else
	  UPDATE "GI_CAUSA"  
     SET "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = 'w_mant_causa',     
         "DESCRIPCION" = :ls_descripcion ,
	  "ACTIVO"= :ll_activo		/* GNU 28-11-2005. Mejora 1/342078 */
	WHERE "GI_CAUSA"."COD_CAUSA"	= :ll_cod_causa;
	 if sqlca.sqlcode<0 then return -1;
   end if 	

					
ll_last_modif=dw_1.GetNextModified(ll_last_modif, Primary!)
loop
//////////////////////////

// delete

for ll_counter = 1 to dw_1.deletedcount()
	ll_deleted_cod_causa=dw_1.getitemnumber(ll_counter,'cod_causa',delete!,false)

	   if wf_si_tiene_relaciones_con_tablas(ll_deleted_cod_causa,dw_1.getitemstring(ll_counter,'descripcion',delete!,false)) then 	
//		 gnv_msg.f_mensaje("EG08",dw_1.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)

      else
		 	  	li_lock_status = gnu_u_transaction.uf_lock &
					(this, "GI_CAUSA", "COD_CAUSA = " + string(ll_deleted_cod_causa),FALSE)
					
  	    choose case  li_lock_status 
				  case  -54 
			gnv_msg.f_mensaje("EG19",dw_1.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0									
	      delete from gi_causa where cod_causa=:ll_deleted_cod_causa;   
	      if sqlca.sqlcode<0 then return -1;
	  end choose  	
	
	  
	  end if
next

return 0
end function

private function integer wf_si_todavia_existe (long pl_cod_causa, string ps_descripcion);//wf_si_todavia_existe
long ll_existe

select count(*) into :ll_existe from  GI_CAUSA 
where 
      GI_CAUSA.COD_CAUSA = :pl_cod_causa
      ;

if ll_existe = 0 then // no existe
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$la causa '+ ps_descripcion+' . Se necesita actualizar datos');
gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)

end if 

return ll_existe

end function

private function boolean wf_si_tiene_relaciones_con_tablas (long pl_cod_causa, string ps_descripcion);long ll_contador

select count(*)
		into :ll_contador
		from sgd_incidencia
		where sgd_incidencia.cod_causa = :pl_cod_causa
			and not (sgd_incidencia.est_actual  in (5,11)) // GNU 28-11-2005. Mejora 1/342078
			and rownum=1;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_incidencia",Ok!)
		return true
		end if
		
// GNU 28-11-2005. Mejora 1/342078
//select count(*)
//		into :ll_contador
//		from sgd_incid_mto
//		where sgd_incid_mto.cod_causa = :pl_cod_causa and rownum=1;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_incid_mto",Ok!)
//		return true
//		end if
//
//select count(*)
//		into :ll_contador
//		from gi_hist_incidencias
//		where gi_hist_incidencias.cod_causa = :pl_cod_causa and rownum=1;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_hist_incidencias",Ok!)
//		return true
//		end if
//
//select count(*)
//		into :ll_contador
//		from gi_incidencia_bdg
//		where gi_incidencia_bdg.cod_causa = :pl_cod_causa and rownum=1;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_incidencia_bdg",Ok!)
//		return true
//		end if
//
//select count(*)
//		into :ll_contador
//		from gi_incidencia_bdg_tmp
//		where gi_incidencia_bdg_tmp.cod_causa = :pl_cod_causa and rownum=1;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_incidencia_bdg_tmp",Ok!)
//		return true
//		end if
//
//select count(*)
//		into :ll_contador
//		from gi_relevantes_bdg
//		where gi_relevantes_bdg.cod_causa = :pl_cod_causa and rownum=1;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_relevantes_bdg",Ok!)
//		return true
//		end if
//
//select count(*)
//		into :ll_contador
//		from gi_relevantes_bdg_tmp
//		where gi_relevantes_bdg_tmp.cod_causa = :pl_cod_causa and rownum=1;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_relevantes_bdg_tmp",Ok!)
//		return true
//		end if
		
select count(*)
		into :ll_contador
		from sgd_descargos
		where sgd_descargos.cod_causa = :pl_cod_causa
			and not (sgd_descargos.estado in (8,11,13)) // GNU 28-11-2005. Mejora 1/342078
			and rownum=1;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_descargos",Ok!)
		return true
		end if
// FIN GNU

return false
end function

event open;
long ll_resultado, ll_cod_objeto, ll_minimo
string ls_descripcion, ls_cod_objeto
treeviewitem elemento
int li_contador
setpointer(hourglass!)
if gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_MANTEN')=1 then
                cb_aceptar.Visible      = TRUE
                cb_agregar.Visible      = TRUE
                cb_eliminar.Visible     = TRUE
                cb_cancelar.Visible     = TRUE
					 
					 
elseif gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_CONSULTA')=1 then
						
					for li_contador = 1 to integer(dw_1.object.DataWindow.Column.Count)
						dw_1.Modify("#" + string(li_contador) + ".protect = 1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//  						dw_1.Modify("#" + string(li_contador) + ".background.color = " + string(rgb(192,192,192)))		
  						dw_1.Modify("#" + string(li_contador) + ".background.color = " + gs_gris)
// Fin. Sgo.
					next
                cb_aceptar.Visible      = FALSE
                cb_agregar.Visible      = FALSE
                cb_eliminar.Visible     = FALSE
                cb_cancelar.Visible     = FALSE	 
 			else 
				gnv_msg.f_mensaje("AA08","","",OK!)	
//				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Su perfil no est$$HEX2$$e1002000$$ENDHEX$$autorizado a realizar mantenimiento")

				close(this)
				return				
	end if
			
ls_descripcion = 'Grupos de causas'
tv_1.insertitemfirst(0,ls_descripcion,1)


DECLARE cu_arbol CURSOR FOR
 SELECT  GPO_CAUSA
 FROM "GI_FAMILIA_CAUSAS" ;
// GROUP BY GPO_CAUSA;

OPEN cu_arbol;

FETCH cu_arbol INTO :ll_cod_objeto;
if sqlca.sqlcode = 100 then
	gnv_msg.f_mensaje("AM50","","",Ok!)
	CLOSE cu_arbol;
	close(this)
	return 
end if


DO 

	SELECT DESCRIPCION
	INTO :ls_descripcion
	FROM GI_FAMILIA_CAUSAS
	WHERE GPO_CAUSA = :ll_cod_objeto;
	
   ll_resultado = tv_1.insertitemfirst(1,ls_descripcion,2)		
	tv_1.getitem(ll_resultado,elemento)
	elemento.data = string(ll_cod_objeto)
	tv_1.setitem(ll_resultado,elemento)
	FETCH cu_arbol INTO :ll_cod_objeto;

LOOP while sqlca.sqlcode <> 100 and sqlca.sqlcode <> -1

CLOSE cu_arbol;
tv_1.expanditem(1)

end event

on w_mant_causa.create
int iCurrent
call super::create
this.cb_agregar=create cb_agregar
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_eliminar=create cb_eliminar
this.dw_1=create dw_1
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_agregar
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_eliminar
this.Control[iCurrent+5]=this.dw_1
this.Control[iCurrent+6]=this.tv_1
end on

on w_mant_causa.destroy
call super::destroy
destroy(this.cb_agregar)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_eliminar)
destroy(this.dw_1)
destroy(this.tv_1)
end on

event closequery;long respuesta

dw_1.AccepTtext()
//if modifi > 0 then
	IF dw_1.ModifiedCount() > 0 or dw_1.deletedcount()>0  THEN // DBE 15/02/2000
	respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
	
	CHOOSE CASE respuesta
		CASE 3
			return 1
		CASE 2
//			gnu_u_transaction.uf_rollback(THIS);
		CASE 1
//			dw_1.update()
//			gnu_u_transaction.uf_commit(THIS);
//			
			
			cb_aceptar.triggerevent('clicked')
			if il_scan_cambios_ok<0 or il_update_dw_ok<0 then return 1;

	END CHOOSE
end if
end event

event close;gnu_u_transaction.uf_rollback(); //DBE 14/02/2000
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mant_causa
end type

type cb_agregar from commandbutton within w_mant_causa
event clicked pbm_bnclicked
integer x = 197
integer y = 1040
integer width = 407
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Agregar"
end type

event clicked;treeviewitem elemento 
string ls_codigo_maximo,ls_codigo
long ll_manejador_padre,ll_codigo_maximo
integer li_codigo
int respuesta

setpointer(hourglass!)
if dw_1.ModifiedCount()>0 or dw_1.DeletedCount()>0 then
	
	        respuesta = gnv_msg.f_mensaje("CG12","","",OkCancel!)
        CHOOSE CASE respuesta
                CASE 2
                        return
                CASE 1
						
						cb_aceptar.triggerevent('clicked') //DBE 16/02/2000   
						if  il_scan_cambios_OK<0 or il_update_dw_OK<0 then return;
						
			END CHOOSE
	
	
end if





if manejador < 1 then return


tv_1.getitem(manejador,elemento)

if elemento.level = 1  then
	return
end if


//Obtiene el ultimo codigo de causa
//	SELECT cod_causa  
//	INTO :ll_codigo_maximo
//	FROM "GI_CAUSA" ;
SELECT ultimo 
INTO :ll_codigo_maximo  FROM GI_T_ULTIMO
WHERE tabla LIKE 'GI_CAUSA.COD_CAUSA%' FOR UPDATE;


if ll_codigo_maximo =999 then // this also could happen...
	gnu_u_transaction.uf_rollback()
//	messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar nuevo Primary Key')	
   gnv_msg.f_mensaje("AM55","","",OK!)
	return 
end  if



ll_codigo_maximo++
//UPDATE gi_t_ultimo SET ultimo=:ll_codigo_maximo WHERE tabla LIKE 'GI_CAUSA%' ;
  UPDATE "GI_T_ULTIMO"  
     SET "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = 'w_mant_causa',   
         "FECHA" = sysdate,   
         "ULTIMO" = :ll_codigo_maximo
  WHERE "TABLA" = 'GI_CAUSA.COD_CAUSA'
			;

gnu_u_transaction.uf_commit()


//cb_agregar.enabled = false
//cb_eliminar.enabled = false
ll_manejador_padre = manejador
	
tv_1.getitem(ll_manejador_padre,elemento)
li_codigo = integer(elemento.data)
ll_newrow = dw_1.InsertRow(0) 
dw_1.SetFocus()
dw_1.ScrollToRow(ll_newrow)
dw_1.SetColumn("descripcion")

	
modifi = 2
	
	
dw_1.setitem(ll_newrow,"cod_causa",ll_codigo_maximo)
dw_1.setitem(ll_newrow,"usuario",gs_usuario)		
dw_1.setitem(ll_newrow,"programa",'w_mant_causa')
dw_1.setitem(ll_newrow,"f_actual",fgnu_fecha_actual())
dw_1.setitem(ll_newrow,"gpo_causa",integer(elemento.data))

end event

type cb_cancelar from commandbutton within w_mant_causa
integer x = 1815
integer y = 1040
integer width = 407
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cerrar"
end type

event clicked;setpointer(hourglass!)
close(parent)
end event

type cb_aceptar from commandbutton within w_mant_causa
integer x = 1280
integer y = 1040
integer width = 407
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ace&ptar"
end type

event clicked;string ls_descripcion

//cb_agregar.enabled = true
//cb_eliminar.enabled = true
//

//if modifi = 0 then
//	return
//end if

setpointer(hourglass!)
dw_1.AcceptText()

//if not dw_1.rowcount()>0 then return ;

if ib_duplicado=true then 
	ib_duplicado=false
	return 
end if

//ls_descripcion = dw_1.getitemstring(ll_fila_actual,"descripcion")
//if len(trim(ls_descripcion)) < 1 then
//	gnv_msg.f_mensaje("EM57","","",Ok!)
//	return
//end if
il_scan_cambios_OK=wf_scan_cambios()

if il_scan_cambios_OK<0 then return;

il_update_dw_OK=wf_update_dw()
        if il_update_dw_OK<0 then 
gnv_msg.f_mensaje("EM59",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",OK!)
gnu_u_transaction.uf_rollback(parent);        
	     else
gnu_u_transaction.uf_commit(parent);
dw_1.reset()
dw_1.retrieve(il_cod_causa_padre)
		  end if



//dw_1.update()
//if sqlca.sqlcode <> 0 then
//	gnv_msg.f_mensaje("EM49", "","",Ok!)
//else
//	gnu_u_transaction.uf_commit(Parent);
//end if
//
modifi = 0
end event

type cb_eliminar from commandbutton within w_mant_causa
boolean visible = false
integer x = 759
integer y = 1040
integer width = 407
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Desactiva&r"
end type

event clicked;integer li_respuesta, li_lock_status
long  ll_contador, ll_cod_causa
string ls_descripcion
treeviewitem elemento

//Obtengo la fila
//ll_fila = dw_1.GetRow()
setpointer(hourglass!)

//cb_agregar.enabled = false

//Si no hay fila seleccionado retorno
If il_fila <= 0 THEN	
	gnv_msg.f_mensaje( "EM63","","",OK!)
	RETURN
END IF

IF dw_1.GetItemNumber(il_fila, 'cod_causa') = fgci_cod_causa_desconocida THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se permite que esta causa sea eliminada del sistema")
	return
END IF

ll_cod_causa = dw_1.GetItemNumber(il_fila, "cod_causa")

//	li_respuesta = gnv_msg.f_mensaje("CG13","","",YesNo!)
	li_respuesta = gnv_msg.f_mensaje("CG12","","",YesNo!)
	
	if li_respuesta = 2 then 
		return
	end if
	
	
	//Pregunta si existe un registro con ese c$$HEX1$$f300$$ENDHEX$$digo en la tabla sgd_incidencia que no elimine ese c$$HEX1$$f300$$ENDHEX$$digo de causa	
	
//		select count(*)
//		into :ll_contador
//		from sgd_incidencia
//		where sgd_incidencia.cod_causa = :ll_cod_causa;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AI137","","",Ok!)
//		 return
//		end if
		
		ls_descripcion=dw_1.GetItemString(il_fila, "descripcion")
// GNU 23-11-2005 Mejora 1/342078
//if wf_si_tiene_relaciones_con_tablas(ll_cod_causa,ls_descripcion) then return;

//      dw_1.deleterow(il_fila)

if dw_1.GetItemNumber(il_fila, "activo")= 1 then
	if wf_si_tiene_relaciones_con_tablas(ll_cod_causa,ls_descripcion) then return;
	dw_1.setitem(il_fila,"activo", 0)
	cb_eliminar.text= "Activa~&r"
else
	dw_1.setitem(il_fila,"activo", 1)
	cb_eliminar.text= "Desactiva~&r"
end if
dw_1.update()
// FIN GNU


// DBE ini comment 14/02/2000
////////////////////////////////////
//// Intentamos bloquear el registro
//li_lock_status = gnu_u_transaction.uf_lock(Parent, "GI_CAUSA", "COD_CAUSA = " + string(ll_cod_causa))
//IF li_lock_status = 0 THEN
//	// Hemos bloqueado con $$HEX1$$e900$$ENDHEX$$xito el registro que queremos borrar	
//	//Esta seguro que desea eliminar?
//	li_respuesta = gnv_msg.f_mensaje("CG13","","",YesNo!)
//	
//	if li_respuesta = 2 then 
//		cb_agregar.enabled = true
//		cb_eliminar.enabled = true
//		// desbloqueamos el registro
//		gnu_u_transaction.uf_rollback(Parent)
//		return
//	else
//		
//		ll_codigo = dw_1.object.cod_causa[il_fila]
//	
//	//Pregunta si existe un registro con ese c$$HEX1$$f300$$ENDHEX$$digo en la tabla sgd_incidencia que no elimine ese c$$HEX1$$f300$$ENDHEX$$digo de causa	
//	
//		select count(*)
//		into :ll_contador
//		from sgd_incidencia
//		where sgd_incidencia.cod_causa = :ll_codigo;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AI137","","",Ok!)
//		 // desbloqueamos el registro
//		 gnu_u_transaction.uf_rollback(Parent)
//		 return
//		end if
//		
//		DELETE FROM "GI_CAUSA"  
//			
//		WHERE "GI_CAUSA"."COD_CAUSA" = :ll_codigo   ;
//		IF SQLCA.SQLCODE = 0 THEN
//				dw_1.deleterow(il_fila)
//				//commit;
//				gnu_u_transaction.uf_commit(Parent)
//		ELSE
//			gnu_u_transaction.uf_rollback(Parent)
//		END IF
//	end if
//END IF
////////////////////////////////
//// DBE fin  comment 14/02/2000
end event

type dw_1 from datawindow within w_mant_causa
integer x = 910
integer y = 16
integer width = 2217
integer height = 984
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_mant_causa"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;//DBE 10/02/2000
if wf_si_duplicado(this.getitemnumber(row,'cod_causa'),data) then
	ib_duplicado=true
	return 2
end if
 
//DBE ini comment 14/02/2000
//
//long ll_fila, ll_cod_causa
//int li_lock_status
//
//dw_1.accepttext()
//ll_fila_actual=row
//if modifi = 0 then
//	modifi = 1
//end if
//
//// intentamos bloquear la fila seleccionada, para que otro usuario no la modifique
//ll_fila = getrow()
//IF ll_fila > 0 AND modifi = 2 THEN
//	ll_cod_causa = GetItemNumber(ll_fila, "cod_causa")
//	// Intentamos bloquear el registro
//  	li_lock_status = gnu_u_transaction.uf_lock(Parent, "GI_CAUSA", "COD_CAUSA = " + string(ll_cod_causa),FALSE)
//  	IF li_lock_status <> 0 THEN
//		IF li_lock_status = -54 THEN
//			gnv_msg.f_mensaje("EG19","","",Ok!)
//			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
//		END IF
//		Parent.cb_aceptar.enabled = False
//		RETURN 2
//	END IF
//END IF
//
////DBE fin comment 14/02/2000
end event

event losefocus;dw_1.accepttext()

end event

event dberror;long ll_error,i_sql_ok
string msg_error

msg_error = sqlerrtext
ll_error = sqldbcode
IF ll_error <> 0 THEN
		CHOOSE CASE ll_error

			CASE 100
				gnv_msg.f_mensaje("EG13","","",OK!)
			CASE 1407,1400
  				gnv_msg.f_mensaje("EG05","la tabla GI_CAUSA ","",OK!)
	      CASE  1,-1
				gnv_msg.f_mensaje("EG06","la tabla GI_CAUSA ","",OK!)
			CASE 2291
				gnv_msg.f_mensaje("EG07","la tabla GI_CAUSA ","",OK!)
	   	CASE 2292	
		      gnv_msg.f_mensaje("EG08","la tabla GI_CAUSA ","",OK!)
         CASE ELSE 
				//gnv_msg.f_mensaje("EG21",string(SQLDBCode)+"  "+ SQLErrtext,"",ok!)
				//MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario ha modificado los datos de este elemento")
				gnv_msg.f_mensaje("EG24","","",OK!)
				Parent.cb_aceptar.enabled = False
	  END CHOOSE
		  gnu_u_transaction.uf_rollback(Parent)

		  RETURN 1
END IF
end event

event clicked;
//	This.SelectRow(0,False)

if row > 0 then 
	cb_eliminar.enabled=true
	il_fila = row
	// GNU 23-11-2005 Mejora 1/342078
	if dw_1.GetItemNumber(il_fila,"activo")= 1 then
		cb_eliminar.text= "Desactiva~&r"
	else
		cb_eliminar.text= "Activa~&r"
	end if
	// FIN GNU
else
	cb_eliminar.enabled=false
end if
//
//Integer CurRow
//
//boolean result
//CurRow = this.GetRow()
//result = this.IsSelected(CurRow)
//IF result THEN
//
//	this.SelectRow(CurRow, FALSE)
//
//ELSE
//	this.SelectRow(CurRow, TRUE)
//
//END IF
end event

type tv_1 from treeview within w_mant_causa
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
integer y = 8
integer width = 896
integer height = 992
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean border = false
boolean hideselection = false
grsorttype sorttype = ascending!
string picturename[] = {"Help!","CreateTable!"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
end type

event clicked;il_fila = 0
//
//treeviewitem elemento
//
//tv_1.getitem(handle,elemento)
//
////if elemento.expandedonce = true or handle = 0 then 
//	return
//end if
//
//dw_1.settransobject(sqlca)
//dw_1.retrieve(elemento.data)
//
end event

event selectionchanged;treeviewitem elemento
long ll_indice, ll_row

dw_1.reset()
manejador = newhandle
//messagebox("debug","manejador: " + string(manejador))
//Retrieve de la datawindows

tv_1.getitem(newhandle,elemento)



//if elemento.expandedonce = true or handle = 0 then 
//	return
//end if
//
il_cod_causa_padre=long(elemento.data) //DBE 15/02/2000

dw_1.settransobject(sqlca)
dw_1.retrieve(long(elemento.data))
		
if dw_1.RowCount() = 0 then
	cb_eliminar.enabled=false
else
	cb_eliminar.enabled=true
end if
gnu_u_transaction.uf_rollback(Parent) 


end event

event selectionchanging;//DBE ini 15/02/2000
long respuesta

dw_1.AccepTtext()




	IF dw_1.ModifiedCount() > 0 THEN 
		
		if ib_duplicado=true then 
   	ib_duplicado=false
   	return 1
      end if

	respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
	
	CHOOSE CASE respuesta
		CASE 3
			return 1
		CASE 2
			return 0
		CASE 1

			cb_aceptar.triggerevent('clicked')
			if il_scan_cambios_ok<0 or il_update_dw_ok<0 then return 1;

	END CHOOSE
   end if
	
	return 0
//DBE fin 15/02/2000

end event


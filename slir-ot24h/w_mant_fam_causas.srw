HA$PBExportHeader$w_mant_fam_causas.srw
$PBExportComments$Lo aun necesito
forward
global type w_mant_fam_causas from w_sgigenerica
end type
type dw_1 from datawindow within w_mant_fam_causas
end type
type cb_cancelar from commandbutton within w_mant_fam_causas
end type
type cb_aceptar from commandbutton within w_mant_fam_causas
end type
type cb_eliminar from commandbutton within w_mant_fam_causas
end type
type cb_agregar from commandbutton within w_mant_fam_causas
end type
end forward

global type w_mant_fam_causas from w_sgigenerica
integer x = 864
integer y = 600
integer width = 2208
integer height = 1320
string title = "Mantenimiento de las Causas de Incidencias"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event agregar_registro pbm_custom40
event borrar_registro pbm_custom41
event grabar_modificaciones pbm_custom42
dw_1 dw_1
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_eliminar cb_eliminar
cb_agregar cb_agregar
end type
global w_mant_fam_causas w_mant_fam_causas

type variables
boolean ib_fila_nueva
int ii_fila_nueva = 0
boolean ib_duplicado

long il_scan_cambios_OK
long il_update_dw_OK




end variables

forward prototypes
public function integer fw_nuevo_grupo ()
public function integer fw_nueva_causa ()
public function integer wf_scan_cambios ()
public function integer wf_update_dw ()
public function boolean wf_si_duplicado (long pl_gpo_causa, string ps_descripcion)
public function integer wf_si_todavia_existe (long pl_gpo_causa, string ps_descripcion)
end prototypes

event agregar_registro;long ll_nuevo_grupo, ll_nueva_causa
int respuesta

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


// Calculo el codigo de grupo para la nueva familia de causas
ll_nuevo_grupo = fw_nuevo_grupo()
 
if ll_nuevo_grupo<0 then return;

// Inserto una nueva fila en la dw, con el gpo_causa calculado anteriormente
// y los valores por defecto para usuario, programa y fecha

ii_fila_nueva = dw_1.insertrow(0)
dw_1.setfocus()
dw_1.scrolltorow(ii_fila_nueva)
ii_fila_nueva = dw_1.getrow()

dw_1.setitem(ii_fila_nueva,"gpo_causa",ll_nuevo_grupo)
dw_1.setitem(ii_fila_nueva,"programa","W_MANT_FAMILIA_CAUS")
dw_1.setitem(ii_fila_nueva,"f_actual",fgnu_fecha_actual())
dw_1.setitem(ii_fila_nueva,"usuario",gs_usuario)

ib_fila_nueva = true
end event

event borrar_registro;long ll_fila_actual, ll_gpo_causa, ll_cantidad

ll_fila_actual = dw_1.getrow()

if ll_fila_actual < 1 then  return


IF dw_1.GetItemNumber(ll_fila_actual, 'gpo_causa') = fgci_cod_fam_causa_desconocida THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No est$$HEX2$$e1002000$$ENDHEX$$permitido que esta familia de causas sea eliminada del sistema")
	return
END IF

// GNU 7-12-2005. Mejora 1/342078
//IF gnv_msg.f_mensaje("CM05","","",YesNo!) = 2  THEN     //DBE 26/10/1999
//	return  
//END IF
 IF 	 gnv_msg.f_mensaje("CG12","","",YesNo!) 	= 2 THEN
	return
END IF
// FIN GNU

// Obtengo el numero de grupo para borrar la cabecera de la familia de causas	
ll_gpo_causa = dw_1.getitemnumber(ll_fila_actual,"gpo_causa")

// Compruebo si hay hijos para esa familia en la tabla gi_causa
// GNU 29-11-2005. Mejora 1/342078
//select count(*)
//into :ll_cantidad
//from gi_causa
//where gpo_causa = :ll_gpo_causa and rownum<3;

// Si hay hijos no puedo borrar
//if ll_cantidad > 1 then
//  gnv_msg.f_mensaje("AI137","","",Ok!)//DBE 11/02/2000
//else

  //dw_1.deleterow(ll_fila_actual)
  if dw_1.GetItemNumber(ll_fila_actual, "activo")= 1 then
	SELECT COUNT(*)
	INTO :ll_cantidad
	FROM GI_CAUSA
	WHERE GPO_CAUSA =:ll_gpo_causa AND
	ACTIVO= 1;
	if ll_cantidad > 1 then
//  		gnv_msg.f_mensaje("AI137","","",Ok!)//DBE 11/02/2000
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Esta familia tiene causas activas, desact$$HEX1$$ed00$$ENDHEX$$velas para poder continuar") // GNU 7-12-2005. Mejora 1/342078
	else
		dw_1.setitem(ll_fila_actual,"activo", 0)
		cb_eliminar.text= "Activa~&r"
	end if
else
	dw_1.setitem(ll_fila_actual,"activo", 1)
	cb_eliminar.text= "Desactiva~&r"
end if
dw_1.update()

//end if
// FIN GNU
end event

event grabar_modificaciones;long ll_fila = 1
string ls_descripcion

//if dw_1.rowcount() > 0 then
//        dw_1.accepttext()
     
//        do while ll_fila <= dw_1.rowcount()
//                ls_descripcion = dw_1.getitemstring(ll_fila,"descripcion") 
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
	gnv_msg.f_mensaje("EM59",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",OK!)
	gnu_u_transaction.uf_rollback();        
else
	gnu_u_transaction.uf_commit();
	dw_1.reset()
	dw_1.retrieve()
end if



        ii_fila_nueva = 0

        ib_fila_nueva = false



end event

public function integer fw_nuevo_grupo ();int li_gpo_causa

//select max(gpo_causa) 
//into :li_gpo_causa
//from gi_causa;

//// DBE ini 9/02/2000
long ll_ultimo,ll_maxi

//select ultimo into :ll_ultimo from gi_t_ultimo where tabla like 'GI_CAUSA.GPO_CAUSA' for update;GSE
//select max(gpo_causa) into :ll_maxi from gi_causa ;

// Seleccion el $$HEX1$$fa00$$ENDHEX$$ltimo n$$HEX2$$ba002000$$ENDHEX$$asignado a un grupo de causas
SELECT ULTIMO 
INTO :ll_ultimo 
FROM GI_T_ULTIMO	
WHERE TABLA LIKE 'GI_FAMILIA_CAUSAS' FOR UPDATE;

if ll_ultimo=0 then 
INSERT INTO "GI_T_ULTIMO"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "TABLA",   
           "FECHA",   
           "ULTIMO" )  
  VALUES ( :gs_usuario,   
           sysdate,   
           sysdate,   
           'MANT_FAM_CAUS',   
           'GI_FAMILIA_CAUSAS',   
           sysdate,   
           :ll_ultimo )  ;
end if

//if ll_maxi > ll_ultimo then ll_ultimo = ll_maxi;GSE

if ll_ultimo=999 then //Casi imposible...
	gnu_u_transaction.uf_rollback(this)
//	messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar c$$HEX1$$f300$$ENDHEX$$digo GPO_CAUSA')
   gnv_msg.f_mensaje("AM55","","",OK!)
	return -1
end if

  UPDATE "GI_T_ULTIMO"  
     SET "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = 'MANT_FAM_CAUS',   
         "FECHA" = sysdate,   
         "ULTIMO" = :ll_ultimo + 1 
  WHERE "TABLA" = 'GI_FAMILIA_CAUSAS'
			;

li_gpo_causa=ll_ultimo
gnu_u_transaction.uf_commit(this)
// DBE fin 9/02/2000

if li_gpo_causa = 0 or isnull(li_gpo_causa) then
        li_gpo_causa = 1
else
        li_gpo_causa ++
end if

return li_gpo_causa
        
end function

public function integer fw_nueva_causa ();int ll_causa

//////DBE ini comment 9/02/2000
//select max(cod_causa) 
//into :ll_causa
//from gi_causa;
//////DBE fin  comment 9/02/2000


//// DBE ini 9/02/2000
//// Obtaining primary key value for table GI_CAUSA 
long ll_ultimo,ll_maxi

select ultimo into :ll_ultimo from gi_t_ultimo where tabla like 'GI_CAUSA.COD_CAUSA' for update;
select max(cod_causa) into :ll_maxi from gi_causa ;




if ll_ultimo=0 then 
INSERT INTO "GI_T_ULTIMO"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "TABLA",   
           "FECHA",   
           "ULTIMO" )  
  VALUES ( :gs_usuario,   
           sysdate,   
           sysdate,   
           'MAN_CAUSA',   
           'GI_CAUSA.COD_CAUSA',   
           sysdate,   
           :ll_ultimo )  ;
end if
		

if ll_maxi > ll_ultimo then ll_ultimo = ll_maxi;

if ll_ultimo=999 then //Casi imposible tener tanto causas pero puede ser...
   gnu_u_transaction.uf_rollback(this)
//	messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar nuevo Primary Key')	
	gnv_msg.f_mensaje("AM55","","",OK!)
	return -1
end  if

  UPDATE "GI_T_ULTIMO"  
     SET "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = 'MAN_CAUSA',   
         "FECHA" = sysdate,   
         "ULTIMO" = :ll_ultimo + 1 
  WHERE "TABLA" = 'GI_CAUSA.COD_CAUSA'
			;

ll_causa=ll_ultimo
gnu_u_transaction.uf_commit(this)
// DBE fin 9/02/2000

if ll_causa = 0 or isnull(ll_causa) then
        ll_causa = 1
else
        ll_causa ++
end if

return ll_causa

end function

public function integer wf_scan_cambios ();//DBE  9/02/2000


boolean lb_duplicado
long ll_noHay
long ll_last_modif
long ll_gpo_causa
string ls_descripcion

ll_last_modif=dw_1.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 

	ll_gpo_causa=dw_1.getitemnumber(ll_last_modif,'gpo_causa')
	ls_descripcion=dw_1.getitemstring(ll_last_modif,'descripcion')
	

                if isnull(ls_descripcion) or len(trim(ls_descripcion)) = 0 then
                        gnv_msg.f_mensaje("AI59","","",Ok!)
									dw_1.SetFocus()
                           dw_1.ScrollToRow(ll_last_modif)
                        return -1 
                end if                


	//Modified record in dw still exist in the database?
	if not dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
     ll_noHay=wf_si_todavia_existe(ll_gpo_causa,&
	  ls_descripcion)
	
   end if 	

   if ll_noHay>0 &
	or dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! &
	then //Description is unique ?
	lb_duplicado=wf_si_duplicado(ll_gpo_causa,ls_descripcion)
	if lb_duplicado then return -2;
   else
		//
   end if
	///
					
ll_last_modif=dw_1.GetNextModified(ll_last_modif, Primary!)
loop

return 0
end function

public function integer wf_update_dw ();long ll_counter
long ll_deleted_cod_causa,ll_deleted_gpo_causa
long ll_last_modif
long ll_cod_causa
long ll_gpo_causa
long ll_cantidad
string ls_descripcion
long ll_activo

/// insert and update

ll_last_modif=dw_1.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 

	//ll_cod_causa=dw_1.getitemnumber(ll_last_modif,'cod_causa')
	ls_descripcion=dw_1.getitemstring(ll_last_modif,'descripcion')
	ls_descripcion=left(trim(ls_descripcion),50)
	ll_gpo_causa=dw_1.getitemnumber(ll_last_modif,'gpo_causa')
	ll_activo= dw_1.getitemnumber(ll_last_modif,'activo') // GNU 28-11-2005. Mejora 1/342078
	
	
	if dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
   		  INSERT INTO "GI_FAMILIA_CAUSAS"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "DESCRIPCION",   
           "GPO_CAUSA",
	    "ACTIVO")  // GNU 28-11-2005. Mejora 1/342078
  VALUES ( :gs_usuario,   
           sysdate,   
           'MANT_FAM_CAUS',   
           :ls_descripcion,   
           :ll_gpo_causa,
	    :ll_activo)  ; // GNU 28-11-2005. Mejora 1/342078
			  
			  if sqlca.sqlcode<0 then return -1;

   else
	  UPDATE "GI_FAMILIA_CAUSAS"  
     SET "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = 'MANT_FAM_CAUS',     
         "DESCRIPCION" = :ls_descripcion,
	  "ACTIVO"=: ll_activo // GNU 28-11-2005. Mejora 1/342078
	WHERE "GI_FAMILIA_CAUSAS"."GPO_CAUSA"	= :ll_gpo_causa;
	 if sqlca.sqlcode<0 then return -1;
   end if 	

					
ll_last_modif=dw_1.GetNextModified(ll_last_modif, Primary!)
loop
//////////////////////////

// delete

for ll_counter = 1 to dw_1.deletedcount()
//	ll_deleted_cod_causa=dw_1.getitemnumber(ll_counter,'cod_causa',delete!,false)
	
	ll_deleted_gpo_causa=dw_1.getitemnumber(ll_counter,'gpo_causa',delete!,false)
	
		select count(*)
	into :ll_cantidad
	from gi_causa
	where gpo_causa = :ll_deleted_gpo_causa and rownum<3;

	if ll_cantidad > 1 then
			  gnv_msg.f_mensaje("EG08",dw_1.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)//DBE 11/02/2000
			  
//			  if dw_1.RowsCopy(ll_counter, ll_counter, delete!, dw_1, dw_1.rowcount()+1, Primary!) >0 then				
//			  dw_1.SetItemStatus( dw_1.rowcount(), 0, Primary!, NotModified! )
//		     end if
	 
   else
		   delete from gi_familia_causas where gpo_causa=:ll_deleted_gpo_causa;
			if sqlca.sqlcode < 0 then return -1;
//	 delete from gi_causa where cod_causa=:ll_deleted_cod_causa;
//	  if sqlca.sqlcode<0 then return -1;
//	 gse 
	end if
next

return 0
end function

public function boolean wf_si_duplicado (long pl_gpo_causa, string ps_descripcion);//DBE 9/02/2000

long ll_gpo_causa

//select cod_causa into :ll_cod_causa from gi_causa
//where descripcion = :ps_descripcion; GSE 25/01/2001
select gpo_causa into :ll_gpo_causa from gi_familia_causas
where descripcion = :ps_descripcion;

if ll_gpo_causa <> pl_gpo_causa and ll_gpo_causa > 0 then
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ya existe esta descripc$$HEX1$$ed00$$ENDHEX$$on : '+ ps_descripcion);
gnv_msg.f_mensaje("AM57",ps_descripcion,"",OK!)
	return true
end if

	return false
end function

public function integer wf_si_todavia_existe (long pl_gpo_causa, string ps_descripcion);//wf_si_todavia_existe


long ll_existe




select count(*) into :ll_existe from  GI_FAMILIA_CAUSAS
where 
      GI_FAMILIA_CAUSAS.GPO_CAUSA = :pl_gpo_causa
      ;

if ll_existe = 0 then // no existe
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$la causa '+ ps_descripcion+' . Se necesita actualizar datos');
gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)


end if 

return ll_existe

end function

event close;gnu_u_transaction.uf_rollback(); //DBE 14/02/2000
Close(This)

end event

on w_mant_fam_causas.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_eliminar=create cb_eliminar
this.cb_agregar=create cb_agregar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.cb_aceptar
this.Control[iCurrent+4]=this.cb_eliminar
this.Control[iCurrent+5]=this.cb_agregar
end on

on w_mant_fam_causas.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_eliminar)
destroy(this.cb_agregar)
end on

event open;call super::open;int li_contador



//*****************************
//** FAM CAUSA JPE 20021113  **
//*****************************
If fg_verifica_parametro('CAUSAS') Then
	Open(w_mant_ext_cau_inc_extendida)
	Close(This)
	Return
End If
//*****************************
//** FAM CAUSA JPE 20021113  **
//*****************************



setpointer(hourglass!)
dw_1.settransObject(sqlca)
dw_1.retrieve()
dw_1.setrowfocusIndicator(Hand!)




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
					 dw_1.setrowfocusIndicator(Off!)
 			else 
				gnv_msg.f_mensaje("AA08","","",OK!)	
//				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Su perfil no est$$HEX2$$e1002000$$ENDHEX$$autorizado a realizar mantenimiento")

				close(this)
				return				
			end if
			
			
			

THIS.X=768 //DBE 26/10/1999
THIS.Y=212


end event

event closequery;int li_respuesta

IF dw_1.ModifiedCount() > 0 or dw_1.deletedcount()>0 THEN
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

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mant_fam_causas
end type

type dw_1 from datawindow within w_mant_fam_causas
integer x = 9
integer y = 28
integer width = 2176
integer height = 876
integer taborder = 10
string dataobject = "d_man_2023_causa_inc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;//this.SetSort("descripcion A")
//this.Sort()
//
end event

event itemchanged;//DBE 10/02/2000
//if wf_si_duplicado(this.getitemnumber(row,'cod_causa'),data) then
//	ib_duplicado=true
//	return 2
//end if
 
end event

event clicked;// GNU 23-11-2005 Mejora 1/342078
if row > 0 then 
	cb_eliminar.enabled=true
	if dw_1.GetItemNumber(row,"activo")= 1 then
		cb_eliminar.text= "Desactiva~&r"
	else
		cb_eliminar.text= "Activa~&r"
	end if
else
	cb_eliminar.enabled=false
end if
// FIN GNU
end event

type cb_cancelar from commandbutton within w_mant_fam_causas
integer x = 1445
integer y = 956
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

type cb_aceptar from commandbutton within w_mant_fam_causas
integer x = 978
integer y = 956
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

event clicked;////DBE 07/02/2000 ini
setpointer(hourglass!)
dw_1.accepttext()
if not dw_1.rowcount()>0 then return ;

if ib_duplicado=true then 
	ib_duplicado=false
	return 
end if

il_scan_cambios_OK=wf_scan_cambios()

if il_scan_cambios_OK<0 then return;
////DBE 07/02/2000 fin
parent.triggerevent("grabar_modificaciones")
end event

type cb_eliminar from commandbutton within w_mant_fam_causas
integer x = 512
integer y = 956
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

type cb_agregar from commandbutton within w_mant_fam_causas
integer x = 46
integer y = 956
integer width = 407
integer height = 108
integer taborder = 20
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


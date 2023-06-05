HA$PBExportHeader$w_mat_averiado.srw
$PBExportComments$Lo aun necesito
forward
global type w_mat_averiado from w_sgigenerica
end type
type cb_agregar from commandbutton within w_mat_averiado
end type
type cb_cancelar from commandbutton within w_mat_averiado
end type
type cb_aceptar from commandbutton within w_mat_averiado
end type
type cb_eliminar from commandbutton within w_mat_averiado
end type
type dw_1 from datawindow within w_mat_averiado
end type
type tv_1 from u_tv_generico within w_mat_averiado
end type
end forward

global type w_mat_averiado from w_sgigenerica
integer x = 494
integer y = 564
integer width = 2747
integer height = 1340
string title = "OPEN SGI - Mantenimiento de Materiales por Familia"
windowtype windowtype = response!
long backcolor = 79741120
cb_agregar cb_agregar
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_eliminar cb_eliminar
dw_1 dw_1
tv_1 tv_1
end type
global w_mat_averiado w_mat_averiado

type variables
long ll_newrow
long manejador
integer modifi = 0
long ll_fila_actual

string is_codigo_padre

string is_codigo //DBE 17/02/2000
boolean ib_anadir_antes
boolean ib_ultimo_nivel = False // GNU 23-3-2006. Mejora materiales
end variables

forward prototypes
public function integer wf_update_dw ()
private function string wf_obtener_codigo_unico (string ps_codigo_padre)
private function boolean wf_si_duplicado (string ps_cod_material, string ps_descripcion)
private function integer wf_si_todavia_existe (string ps_cod_material, string ps_descripcion)
private function integer wf_scan_cambios ()
private function boolean wf_si_tiene_relaciones_con_tablas (string ps_cod_material, string ps_descripcion)
end prototypes

public function integer wf_update_dw ();//DBE 17/02/2000

long ll_counter
long ll_last_modif
long ll_contador
string ls_cod_material
string ls_descripcion
string ls_caract_tecnicas
string ls_unidad_medida
string ls_aportacion_material
string ls_deleted_cod_material
int li_lock_status
int li_repeat_until
/// insert and update
ll_last_modif=dw_1.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 

	ls_cod_material=dw_1.getitemstring(ll_last_modif,'cod_material')
	ls_descripcion=dw_1.getitemstring(ll_last_modif,'descripcion')
	ls_descripcion=left(trim(ls_descripcion),75)
	ls_caract_tecnicas=dw_1.getitemstring(ll_last_modif,'caract_tecnicas')
	ls_unidad_medida=dw_1.getitemstring(ll_last_modif,'unidad_medida')
	ls_aportacion_material=dw_1.getitemstring(ll_last_modif,'aportacion_material')
	
	if dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
		
	  ls_cod_material=wf_obtener_codigo_unico(is_codigo_padre)
	  
	  	  do while double(ls_cod_material)=0 and li_repeat_until<3
	  	  ls_cod_material=wf_obtener_codigo_unico(is_codigo_padre)
		  li_repeat_until++
	     loop
	  
	  
	  if isnull(ls_cod_material) then return -1;
	  
       INSERT INTO "SGD_MATERIALES"  
         ( "COD_MATERIAL",   
           "DESCRIPCION",   
           "APORTACION_MATERIAL",   
           "UNIDAD_MEDIDA",   
           "USUARIO",   
           "F_ACTUAL",   
           "COD_SAP_MATERIAL" )  
  VALUES ( :ls_cod_material,   
           :ls_descripcion,   
           :ls_aportacion_material,   
           :ls_unidad_medida,   
           :gs_usuario,   
           sysdate,   
           '0' )  ;
		
	  if sqlca.sqlcode<0 then return -1;

		  INSERT INTO "SGD_MATERIALES_LONG"  
         ( "COD_MATERIAL",   
           "CARACT_TECNICAS",   
           "USUARIO",   
           "F_ALTA",   
           "PROGRAMA",   
           "F_ACTUAL" )  
  VALUES ( :ls_cod_material,   
           :ls_caract_tecnicas,   
           :gs_usuario,   
           sysdate,   
           'w_mat_averiado',   
           sysdate )  ;
						 
     
     if sqlca.sqlcode<0 then return -1;
     dw_1.SetItem( ll_last_modif, 'cod_material',ls_cod_material)
	  
   else /////////// Update
		
  UPDATE "SGD_MATERIALES"  
     SET "DESCRIPCION" = :ls_descripcion,   
         "APORTACION_MATERIAL" = :ls_aportacion_material,   
         "UNIDAD_MEDIDA" = :ls_unidad_medida,   
         "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate  
   WHERE "SGD_MATERIALES"."COD_MATERIAL" = :ls_cod_material   ;
	 
	 if sqlca.sqlcode<0 then return -1;
	 
	  UPDATE "SGD_MATERIALES_LONG"  
     SET "CARACT_TECNICAS" = :ls_caract_tecnicas,   
         "USUARIO" = :gs_usuario,   
         "PROGRAMA" = 'w_mat_averiado',   
         "F_ACTUAL" = sysdate  
   WHERE "SGD_MATERIALES_LONG"."COD_MATERIAL" = :ls_cod_material   ;
 
	 if sqlca.sqlcode<0 then return -1;
	 
   end if 	

					
ll_last_modif=dw_1.GetNextModified(ll_last_modif, Primary!)
loop


//////////////////////////
// delete
long ll_test

ll_test=dw_1.deletedcount()

for ll_counter = 1 to ll_test
	ls_deleted_cod_material=dw_1.getitemstring(ll_counter,'cod_material',delete!,false)

	   if wf_si_tiene_relaciones_con_tablas(ls_deleted_cod_material,dw_1.getitemstring(ll_counter,'descripcion',delete!,false)) then 	
//		 gnv_msg.f_mensaje("EG08",dw_1.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
      else
		 	  	li_lock_status = gnu_u_transaction.uf_lock &
					(this, "SGD_MATERIALES", "COD_MATERIAL = " + string(ls_deleted_cod_material),FALSE)
					
  	    choose case  li_lock_status 
				  case  -54 
			gnv_msg.f_mensaje("EG19",dw_1.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0	
			delete from SGD_MATERIALES_LONG where cod_material=:ls_deleted_cod_material;  		
			if sqlca.sqlcode<0 then return -1;
	      delete from SGD_MATERIALES where cod_material=:ls_deleted_cod_material;   
	      if sqlca.sqlcode<0 then return -1;
	  end choose  	
	
	  
	  end if
next

return 0
end function

private function string wf_obtener_codigo_unico (string ps_codigo_padre);//wf_obtener_codigo_unico DBE 15/02/2000

 
 double ldb_max, ldb_ultimo
 string ls_codigo_maximo, ls_codigo_ultimo_6
 string ls_programa
 string ls_condicion
 int li_longitud , li_faltan
                                        
 ls_condicion=ps_codigo_padre+'%'
 select max(cod_material) into :ls_codigo_maximo from sgd_materiales
 where cod_material like :ls_condicion;
 
 if not isnull(ls_codigo_maximo) then
	ls_codigo_ultimo_6=right(ls_codigo_maximo,6)
	if ls_codigo_ultimo_6='999999' then //Por si acaso
	   gnu_u_transaction.uf_rollback();
//		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar nuevo Primary Key')
		gnv_msg.f_mensaje("AM55","","",OK!)
		return '' 
	end if
else
	ls_codigo_maximo = ps_codigo_padre + '000000' 
 end if
   ls_programa='MATERIALES.'+ls_codigo_maximo
	ldb_max=double(ls_codigo_maximo)
	
///////////// DBE 
// All these transaction sucrifices were made in the name of concurrency,
// To avoid collisions in the simultaneous generation of primary key. 
/////////////
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
           'w_mat_averiado',   
           :ls_programa,   
           trunc(sysdate),   
           NVL(:ldb_max,0) )  ;

gnu_u_transaction.uf_commit();

select ultimo into :ldb_ultimo from gi_t_ultimo where trunc(fecha) = trunc(sysdate)
and tabla like :ls_programa for update ;

if ldb_ultimo=0 or isnull(ldb_ultimo) then //repeate to resolve collision
                                         // record in gi_t_ultimo was deleted 
	 return '0'
end if



ldb_ultimo++

ls_codigo_maximo=string(ldb_ultimo)

update gi_t_ultimo set ultimo=:ldb_ultimo 
where trunc(fecha) = trunc(sysdate)
and tabla like :ls_programa ;

gnu_u_transaction.uf_commit();



delete from gi_t_ultimo where trunc(fecha) = trunc(sysdate)
and tabla like :ls_programa;



               
                        li_longitud = len(trim(ls_codigo_maximo))
                
                        li_faltan = 12 - li_longitud
                
                DO WHILE li_faltan > 0
                        
                        ls_codigo_maximo = '0' + ls_codigo_maximo
                        li_faltan = li_faltan - 1
                
                LOOP

return ls_codigo_maximo

end function

private function boolean wf_si_duplicado (string ps_cod_material, string ps_descripcion);//DBE 16/02/2000

string ls_cod_material
//string ls_left_6_ymas

//ls_left_6_ymas=is_codigo_padre+'%'
//select cod_material into :ls_cod_material from sgd_materiales
//where descripcion = :ps_descripcion and cod_material like :ls_left_6_ymas;


select cod_material into :ls_cod_material from sgd_materiales
where descripcion = :ps_descripcion;

if (isnull(ps_cod_material) and len(ls_cod_material)>0 ) or &
((ls_cod_material <> ps_cod_material) and len(ls_cod_material)>0 ) &
then 
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ya existe esta descripc$$HEX1$$ed00$$ENDHEX$$on : '+ ps_descripcion);
gnv_msg.f_mensaje("AM57",ps_descripcion,"",OK!)
	return true
end if

	return false
end function

private function integer wf_si_todavia_existe (string ps_cod_material, string ps_descripcion);//wf_si_todavia_existe
long ll_existe

select count(*) into :ll_existe from  SGD_MATERIALES 
where 
      SGD_MATERIALES.COD_MATERIAL = :ps_cod_material
      ;

if ll_existe = 0 then // no existe
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$el material '+ ps_descripcion+' . Se necesita actualizar datos');
gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)
end if 

return ll_existe

end function

private function integer wf_scan_cambios ();//DBE  9/02/2000


boolean lb_duplicado
long ll_noHay
long ll_last_modif
string ls_cod_material
string ls_descripcion

ll_last_modif=dw_1.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 

	//Modified record in dw still exist in the database?
	ls_cod_material=dw_1.getitemstring(ll_last_modif,'cod_material')
	ls_descripcion=dw_1.getitemstring(ll_last_modif,'descripcion')
	
	if isnull(ls_descripcion) or len(trim(ls_descripcion)) = 0 then
	gnv_msg.f_mensaje("EM57","","",Ok!)
	dw_1.SetFocus()
	return -1 
   end if

	if not dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
     ll_noHay=wf_si_todavia_existe(ls_cod_material,&
	  ls_descripcion)
	
   end if 	

   if ll_noHay>0 &
	or dw_1.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! &
	then //Description is unique ?
	lb_duplicado=wf_si_duplicado(ls_cod_material,ls_descripcion)
	if lb_duplicado then return -2;
   else
		//
   end if
	///
ll_last_modif=dw_1.GetNextModified(ll_last_modif, Primary!)
loop
					

return 0
end function

private function boolean wf_si_tiene_relaciones_con_tablas (string ps_cod_material, string ps_descripcion);long ll_contador

select count(*)
		into :ll_contador
		from sgd_incidencia
		where sgd_incidencia.mat_averiado = :ps_cod_material
		and rownum=1;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_incidencia",Ok!)
		return true
		end if

select count(*)
		into :ll_contador
		from sgd_incid_mto
		where sgd_incid_mto.mat_averiado = :ps_cod_material and rownum=1;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_incid_mto",Ok!)
		return true
		end if

select count(*)
		into :ll_contador
		from gi_materiales
		where gi_materiales.material = :ps_cod_material and rownum=1;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_materiales",Ok!)
		return true
		end if


return false
end function

event open;long donde_coloco
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
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Su perfil no est$$HEX2$$e1002000$$ENDHEX$$autorizado a realizar mantenimiento")

				close(this)
				return				
	end if
			
			
setpointer(hourglass!)

// GNU 23-3-2006. Mejora materiales
//  SELECT  "SGD_ORG_MAT"."COD_OBJETO",   
//          "SGD_ORG_MAT"."DESCRIPCION"  
//    INTO :ls_cod_objeto,   
//         :ls_descripcion  
//    FROM  "SGD_ORG_MAT"  
//   WHERE "SGD_ORG_MAT"."COD_OBJETO" = '010100'   ;
//
//donde_coloco = tv_1.insertitemfirst(0,ls_descripcion,1)
//tv_1.getitem(donde_coloco,elemento)
//elemento.data = ls_cod_objeto
//tv_1.setitem(donde_coloco,elemento)
// 
// DECLARE cu_arbol CURSOR FOR  
//  SELECT  "SGD_ORG_MAT"."DESCRIPCION",   
//          "SGD_ORG_MAT"."COD_OBJETO"  
//    FROM  "SGD_ORG_MAT"  
//         WHERE "COD_OBJETO" LIKE '0101%' and "COD_OBJETO" <> '010101' and "COD_OBJETO" <> '010100';
//
//open cu_arbol;
//
//fetch cu_arbol into :ls_descripcion, :ls_cod_objeto;
//
//do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
//                
//        donde_coloco = tv_1.insertitemfirst(1,ls_descripcion,2)
//        tv_1.getitem(donde_coloco,elemento)
//        elemento.data = ls_cod_objeto
//        tv_1.setitem(donde_coloco,elemento)
//
//        fetch cu_arbol into :ls_descripcion, :ls_cod_objeto;
//        
//loop
//close cu_arbol;
//
//tv_1.ExpandItem(1) //DBE
//
// FIN GNU
end event

on w_mat_averiado.create
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

on w_mat_averiado.destroy
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
if modifi > 0 then
	IF modifi <> 3 THEN
   	respuesta = gnv_msg.f_mensaje("CG01","","",YesNoCancel!) 
        
       CHOOSE CASE respuesta
      	 CASE 3
         	 return 1
          CASE 1
				 cb_aceptar.triggerevent('clicked') //DBE 16/02/2000    
          CASE 2
	          gnu_u_transaction.uf_rollback()
       END CHOOSE
	END IF
end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mat_averiado
end type

type cb_agregar from commandbutton within w_mat_averiado
event clicked pbm_bnclicked
integer x = 293
integer y = 1048
integer width = 407
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;treeviewitem elemento
string ls_codigo
string ls_codigo_maximo
long ll_manejador_padre
double ld_codigo_maximo
long respuesta
integer li_longitud
integer li_faltan

setpointer(hourglass!)

if modifi = 3 THEN return // ya est$$HEX2$$e1002000$$ENDHEX$$la dw preparara para dar de alta el material.
								  // No se necesita pues modificar nada
								  
if modifi > 0 then //modify & delete
        //respuesta = messagebox ("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea guardar los cambios ?",Question!,YesNoCancel!,1)
        respuesta = gnv_msg.f_mensaje("CG12","","",YesNoCancel!)
        CHOOSE CASE respuesta
                CASE 3
                        return
                CASE 2
                        modifi = 0
                CASE 1
						
						cb_aceptar.triggerevent('clicked') //DBE 16/02/2000    
						if modifi>0 then return;
               //DBE ini comment 16/02/2000      
//                        dw_1.update()
//                        gnu_u_transaction.uf_commit();
//                        modifi = 0
   				//DBE fin comment 16/02/2000
        END CHOOSE
end if

if manejador < 1 then return

tv_1.getitem(manejador,elemento)

if elemento.level = 1 /* or elemento.level = 2 */ then
        return
end if

IF elemento.level = 3 then
        ll_manejador_padre = tv_1.finditem(ParentTreeItem!,manejador)
else
        ll_manejador_padre = manejador
end if

tv_1.getitem(ll_manejador_padre,elemento)
ls_codigo = elemento.data
is_codigo = elemento.data //  DBE 16/02/2000
dw_1.reset()
ll_newrow = dw_1.InsertRow(0) 
dw_1.ScrollToRow(ll_newrow)
dw_1.setfocus()
modifi = 3
ib_anadir_antes=true

//  DBE ini comment 16/02/2000

//ls_codigo = ls_codigo + '%'
//
//  SELECT max(cod_material)  
//    INTO :ls_codigo_maximo  
//    FROM "SGD_MATERIALES"  
//         WHERE "COD_MATERIAL" LIKE :ls_codigo ;
//
//
//if isnull(ls_codigo_maximo) then
//        
//                ls_codigo_maximo = elemento.data + '000000'                     
//        
//end if
//        
//                        ld_codigo_maximo = double(ls_codigo_maximo)
//                
//                        ld_codigo_maximo = ld_codigo_maximo + 1
//                
//                        ls_codigo_maximo = string(ld_codigo_maximo)
//                
//                        li_longitud = len(trim(ls_codigo_maximo))
//                
//                        li_faltan = 12 - li_longitud
//                
//                DO WHILE li_faltan > 0
//                        
//                        ls_codigo_maximo = '0' + ls_codigo_maximo
//                        li_faltan = li_faltan - 1
//                
//                LOOP
//                
//                //Aqui obtengo el codigo siguiente a la familia solicitada
//                //Y a$$HEX1$$f100$$ENDHEX$$ado los ceros que se pueden haber perdido de la izquierda
//                
//                dw_1.setitem(ll_newrow,"cod_material",ls_codigo_maximo)
//
//
//  DBE fin comment 16/02/2000
end event

type cb_cancelar from commandbutton within w_mat_averiado
integer x = 1911
integer y = 1048
integer width = 407
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cerrar"
end type

event clicked;setpointer(hourglass!)
close(parent)
end event

type cb_aceptar from commandbutton within w_mat_averiado
integer x = 1376
integer y = 1048
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

event clicked;long ll_padre
string ls_descripcion,ls_caract_tecnicas
string ls_codigo
treeviewitem elemento
datetime ld_fecha
int il_scan_cambios_OK,il_update_dw_OK
setpointer(hourglass!)
dw_1.accepttext()

//if ib_duplicado=true then //DBE 
//	ib_duplicado=false
//	return 
//end if
//

//ld_fecha=fgnu_fecha_actual()

if modifi = 0 then
        return
end if

il_scan_cambios_OK=wf_scan_cambios()

if il_scan_cambios_OK<0 then return;

il_update_dw_OK=wf_update_dw()
        if il_update_dw_OK<0 then 
gnv_msg.f_mensaje("EM59",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"", OK!)


gnu_u_transaction.uf_rollback(parent);        
	     else
gnu_u_transaction.uf_commit(parent);
//dw_1.reset()
//dw_1.retrieve(il_cod_causa_padre)
		  end if

choose case modifi
	case 1 //MODIFICA
		  modifi = 0
        ls_codigo = dw_1.getitemstring(dw_1.getrow(),"cod_material")
        ls_descripcion = dw_1.getitemstring(dw_1.getrow(),"descripcion")
        tv_1.getitem(manejador,elemento)
        elemento.label = ls_descripcion
        elemento.data = ls_codigo
        tv_1.setitem(manejador,elemento)


   case 2  //A$$HEX1$$d100$$ENDHEX$$ADE
		  modifi = 0
		  ib_anadir_antes=false
        ls_codigo = dw_1.getitemstring(dw_1.getrow(),"cod_material")
        ls_descripcion = dw_1.getitemstring(dw_1.getrow(),"descripcion")
	// GNU 23-3-2006. Mejora materiales
	ll_padre = tv_1.finditem(CurrentTreeItem!,manejador)
	tv_1.getitem(manejador,elemento)
	if elemento.level=3 then
       	 ll_padre = tv_1.finditem(ParentTreeItem!,manejador)
	end if
	// FIN GNU
        if ll_padre = 1 then
                ll_padre = manejador
        end if
        ll_padre = tv_1.insertitemfirst(ll_padre,ls_descripcion,3)
        tv_1.getitem(ll_padre,elemento)
        elemento.data = ls_codigo
        tv_1.setitem(ll_padre,elemento)
		  tv_1.selectitem(ll_padre)
		  
   case 3 // eliminar
		 modifi = 0
		 if not ib_anadir_antes then 
			tv_1.deleteitem(manejador)
		else
			  tv_1.getitem(manejador,elemento)
			if elemento.level=3 then 
              dw_1.settransobject(sqlca)
              dw_1.retrieve(elemento.data)
			end if
	end if
end choose
//////////// DBE ini comment 17/02/2000
//dw_1.update()
// 
////--<<Mato 
//If modifi = 1 then //modifica
//   UPDATE "SGD_MATERIALES_LONG"
//   SET "COD_MATERIAL" = :ls_codigo,
//       "CARACT_TECNICAS" = :ls_caract_tecnicas,
//                 "USUARIO" = :gs_usuario,
//                 "F_ALTA" = :ld_fecha,
//                 "PROGRAMA" = 'w_mant_mat',
//                 "F_ACTUAL" = :ld_fecha
//        WHERE "SGD_MATERIALES_LONG"."COD_MATERIAL" = :ls_codigo;         
//end if
//
//If modifi = 2 then//a$$HEX1$$f100$$ENDHEX$$ade
//        INSERT INTO "SGD_MATERIALES_LONG"
//              ("COD_MATERIAL", "CARACT_TECNICAS", "USUARIO", "F_ALTA", "PROGRAMA", "F_ACTUAL")
//   VALUES
//              (:ls_codigo, :ls_caract_tecnicas, :gs_usuario, :ld_fecha, 'w_mant_mat',:ld_fecha);
//End if
////-->>
//
//gnu_u_transaction.uf_commit();
//
//////////// DBE fin  comment 17/02/2000
modifi = 0
end event

type cb_eliminar from commandbutton within w_mat_averiado
integer x = 841
integer y = 1048
integer width = 407
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Eliminar"
end type

event clicked;integer li_respuesta
string ls_cod_material
string ls_descripcion
treeviewitem elemento
setpointer(hourglass!)
tv_1.getitem(manejador,elemento)

if elemento.level <> 3 then
        return
end if          

dw_1.accepttext()

//respuesta = messagebox ("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea guardar los cambios ?",Question!,YesNoCancel!,1)
li_respuesta = gnv_msg.f_mensaje("CG13","","",YesNoCancel!)
CHOOSE CASE li_respuesta
   CASE 3
        return 1
   CASE 2
        modifi = 0
		  tv_1.selectitem(manejador)
        return
   CASE 1
        ls_cod_material = elemento.data
        ls_descripcion = elemento.label
		  if wf_si_tiene_relaciones_con_tablas(ls_cod_material,ls_descripcion) then return;
        dw_1.deleterow(dw_1.getrow())
        modifi=3				
		  cb_aceptar.triggerevent('clicked') 
		  if modifi>0 then return 1;
END CHOOSE
end event

type dw_1 from datawindow within w_mat_averiado
integer x = 914
integer y = 16
integer width = 1783
integer height = 988
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_man_2020_mat_averiado"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//dw_1.accepttext()
ll_fila_actual=row

if modifi = 0 then
   modifi = 1
elseif modifi = 3 then
	modifi = 2
end if

choose case lower(dwo.name) //DBE 10/02/2000
	    case 'descripcion'
			
if wf_si_duplicado(this.getitemstring(row,'cod_material'),data) then
	return 2
end if

end choose

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
                                gnv_msg.f_mensaje("EG05","la tabla SGD_MATERIALES ","",OK!)
              CASE  1,-1
                                gnv_msg.f_mensaje("EG06","la tabla SGD_MATERIALES ","",OK!)
                        CASE 2291
                                gnv_msg.f_mensaje("EG07","la tabla SGD_MATERIALES ","",OK!)
                CASE 2292       
                      gnv_msg.f_mensaje("EG08","la tabla SGD_MATERIALES ","",OK!)
         CASE ELSE 
                                gnv_msg.f_mensaje("EG21",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",ok!)
                                //MessageBox("Error","SQL Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
          END CHOOSE
                  gnu_u_transaction.uf_rollback();

                  RETURN 1
  END IF
end event

type tv_1 from u_tv_generico within w_mat_averiado
event clicked pbm_tvnclicked
event doubleclicked pbm_tvndoubleclicked
integer x = 9
integer y = 12
integer width = 896
integer height = 992
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 81324524
borderstyle borderstyle = styleraised!
grsorttype sorttype = ascending!
string picturename[] = {"CreateRuntime!","UserObject5!","Application5!"}
end type

event clicked;////// DBE ini comment 17/02/2000
//treeviewitem elemento
//
//tv_1.getitem(handle,elemento)
//
//if elemento.expandedonce = true or handle = 0 then 
//        return
//end if
//
//dw_1.settransobject(sqlca)
//dw_1.retrieve(elemento.data)
//
//////// DBE fin comment 17/02/2000

// GNU 23-3-2006. Mejora materiales
//treeviewitem elemento
//tv_1.getitem(handle,elemento)
//if elemento.level=2 then is_codigo_padre=elemento.data ; //DBE
// FIN GNU
end event

event doubleclicked;// 23-3-2006. Mejora materiales
//treeviewitem elemento
//string ls_cod_material, ls_cod_material_aux, ls_cod_objeto, ls_descripcion
//long donde_coloco
//
//
//
//tv_1.getitem(handle,elemento)
//
////if elemento.expandedonce = true or handle = 0 then 
////        return
////end if
//
//if elemento.expanded = true or (handle = 0 or isnull(handle)) then 
//        return
//end if
//
//
//////////////// DBE ini
//if elemento.level<>2 then return 
//
//long ll_padre_handle,ll_hijo_handle
//
//tv_1.getitem(manejador,elemento)
//
//choose case elemento.level
//	case 2
//		ll_padre_handle=manejador
//ll_hijo_handle=tv_1.finditem(ChildTreeItem! ,ll_padre_handle)
//
//do while ll_hijo_handle>0
//	tv_1.deleteitem(ll_hijo_handle)
//ll_hijo_handle=tv_1.finditem(ChildTreeItem! ,ll_padre_handle)
//loop
//tv_1.getitem(ll_padre_handle,elemento)
//end choose
//
//
//////////////// DBE fin
//
//
//ls_cod_material = elemento.data
//ls_cod_material_aux = elemento.data
//ls_cod_material = trim(ls_cod_material) + '%'
//
//is_codigo_padre=ls_cod_material ; //DBE
//
// DECLARE cu_arbol CURSOR FOR  
//  SELECT "COD_MATERIAL",   
//         "DESCRIPCION"  
//    FROM "SGD_MATERIALES"  
//   WHERE "COD_MATERIAL" like :ls_cod_material and "COD_MATERIAL" <> :ls_cod_material_aux  ;
//
//        open cu_arbol;
//        
//fetch cu_arbol into :ls_cod_material, :ls_descripcion ;
//
//do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
//
//                
//        donde_coloco = tv_1.insertitemfirst(handle,ls_descripcion,3)
//        tv_1.getitem(donde_coloco,elemento)
//        
//
//        elemento.data = ls_cod_material
//        tv_1.setitem(donde_coloco,elemento)
//
//        fetch cu_arbol into :ls_cod_material, :ls_descripcion ;
//        
//loop
//close cu_arbol;

        
end event

event selectionchanged;int  li_respuesta

//DBE ini
treeviewitem elemento


manejador = newhandle
dw_1.reset()


tv_1.getitem(newhandle,elemento)

if elemento.level=2 then is_codigo_padre=elemento.data ; //DBE

if elemento.level<>3 then return;
dw_1.settransobject(sqlca)
dw_1.retrieve(elemento.data)

// DBE fin
end event

event selectionchanging;////DBE 
//int li_respuesta
//
//dw_1.accepttext()
//
//
//if modifi > 0  then //modify & delete
//        //respuesta = messagebox ("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX2$$bf002000$$ENDHEX$$Desea guardar los cambios ?",Question!,YesNoCancel!,1)
//        li_respuesta = gnv_msg.f_mensaje("CG12","","",YesNoCancel!)
//        CHOOSE CASE li_respuesta
//                CASE 3
//                        return 1
//                CASE 2
//                        modifi = 0
//                CASE 1
//						
//						cb_aceptar.triggerevent('clicked') 
//						if modifi>0 then return 1;
//        END CHOOSE
//end if
//
end event

event constructor;call super::constructor;This.of_SetNivel(1,"d_inc_2039_subfamilia_materiales","descripcion","")
This.of_SetNivel(2,"d_inc_2040_clase_materiales","descripcion","subfamilia_materiales")
This.of_SetNivel(3,"d_inc_2041_materiales","descripcion","clase_hijos")

This.of_Refrescar_Arbol()

This.ExpandItem(1)
end event


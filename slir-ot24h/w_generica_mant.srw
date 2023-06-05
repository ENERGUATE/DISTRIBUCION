HA$PBExportHeader$w_generica_mant.srw
$PBExportComments$Ventana gen$$HEX1$$e900$$ENDHEX$$rica para los mantenimientos de las tablas.
forward
global type w_generica_mant from w_sgigenerica
end type
type cb_cancelar from commandbutton within w_generica_mant
end type
type cb_aceptar from commandbutton within w_generica_mant
end type
type cb_eliminar from commandbutton within w_generica_mant
end type
type cb_agregar from commandbutton within w_generica_mant
end type
end forward

global type w_generica_mant from w_sgigenerica
integer x = 704
integer y = 600
integer width = 2272
integer height = 1188
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event agregar_registro pbm_custom40
event borrar_registro pbm_custom41
event grabar_modificaciones pbm_custom42
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
cb_eliminar cb_eliminar
cb_agregar cb_agregar
end type
global w_generica_mant w_generica_mant

type variables
boolean ib_duplicado,ib_nohay
int il_scan_cambios_OK,il_update_dw_OK


u_man_0000_generico iuo_gen_uo

// UOs de los distintos mantenimientos
u_man_2020_pr_alc_avi iuo_alc_avi
u_man_2022_pr_tip_avi iuo_tip_avi
u_man_2023_pr_causa_inc iuo_causa_inc
u_man_2024_pr_incidencia iuo_incidencia
u_man_2027_pr_mat_averiado iuo_mat_averiado
u_man_2040_pr_accion iuo_accion
u_man_2041_pr_est_clima iuo_est_clima
u_man_2043_pr_prioridad iuo_prioridad
u_man_2044_pr_tip_ins  iuo_tip_ins
u_man_2045_pr_int_horario iuo_int_hora
u_man_2047_pr_problema  iuo_problema
u_man_2048_pr_turno iuo_turno
u_man_2042_pr_propiedad iuo_propiedad
u_man_2049_pr_materiales iuo_materiales
u_man_2050_pr_tareas iuo_tareas
u_man_prof iuo_profesion
u_man_cont iuo_empresa
u_man_motivos_anulacion iuo_motivos

u_man_2053_pr_descargo iuo_descargos //GNU 25-7-2006. Mejora 1/426921

int ii_fila_actual

boolean ib_no_verifica

// Objeto local de comunicaciones
u_generico_comunicaciones iu_comunic



u_man_2051_pr_tipos_tension iuo_tipos_tension
u_man_2052_pr_agentes  iuo_agentes
u_man_2052_pr_unidades iuo_unidades


//23/10/2008 YAF
u_man_2050_ocen_ser_ejec iuo_serv_ejecutor

end variables

forward prototypes
protected function boolean f_anulo ()
public function integer f_destruir_objetos ()
private function string wf_obtener_codigo_unico (string ps_dw_name)
public function integer wf_si_todavia_existe (string ps_codigo, string ps_descripcion)
private function integer wf_scan_cambios ()
public function boolean wf_si_duplicado (string ps_codigo, string ps_descripcion)
private function boolean wf_si_tiene_relaciones_con_tablas (string ps_codigo, string ps_valor, string ps_descripcion)
private function integer wf_update_dw ()
end prototypes

event agregar_registro;long ll_fila_actual
ll_fila_actual=iuo_gen_uo.insertrow(0)
iuo_gen_uo.scrolltorow(ll_fila_actual)
if gi_fila_actual=-1 then
	//MessageBox("Error", "No se pudo insertar fila", StopSign!, OK!, 1)
    gnv_msg.f_mensaje("EM16","","",OK!)
else
   iuo_gen_uo.SetFocus()
	iuo_gen_uo.SetRow(ll_fila_actual)
	iuo_gen_uo.setitem(ll_fila_actual,'descripcion','')
end if



// Llama a la funci$$HEX1$$f300$$ENDHEX$$n que inserta una fila al final , (insertrow(0)).
//datawindow      dw_control
//long        ll_codigomax
//long                    ll_fila
//string          ls_codigomax
//
//dw_control = iuo_gen_uo
//
//iuo_gen_uo.f_agregar_registro()
//ll_fila=dw_control.getrow()
////dw_control.setitem(ll_fila,"tip_aviso",ll_codigomax)



//////////// DBE ini comment 21/02/2000
//CHOOSE CASE dw_control.dataobject
//        CASE "d_man_2022_tip_avi" 
//                   SELECT max(tip_aviso)  
//                INTO :ll_codigomax  
//                   FROM "GI_T_TIP_AVISO"  ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"tip_aviso",ll_codigomax)
//                  
//   CASE "d_man_2020_alc_avi"
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'ALC'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//
//        CASE "d_man_2023_causa_inc"
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'CAU'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//                        
//                        
//        CASE "d_man_2040_accion"
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'ACC'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//                   dw_control.setitem(ll_fila,"valor",string(ll_codigomax))
//                  
//        CASE "d_man_2041_est_clima"
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'E_CL'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//                        
//        CASE "d_man_2042_propiedad"
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'PROP'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//                  
//        CASE "d_man_2050_tareas"
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'TARE'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//
//        CASE "d_man_prof" 
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'PROF'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//
//        CASE "d_man_cont" 
//                   SELECT max( codigo )  
//              INTO :ll_codigomax  
//           FROM "SGD_VALOR"  
//                   WHERE "SGD_VALOR"."CODIF" = 'EMPR'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//                        
//        CASE "d_man_2047_problema" 
//                        SELECT max( codigo )  
//                        INTO :ll_codigomax  
//                        FROM "SGD_VALOR"  
//                        WHERE "SGD_VALOR"."CODIF" = 'PROB'   ;
//                        ll_codigomax = ll_codigomax + 1
//                        dw_control.setitem(ll_fila,"codigo",ll_codigomax)
//                        
//        CASE "d_man_2049_materiales"
//        
//            SELECT max("SGD_ORG_MAT"."COD_OBJETO")
//                 INTO :ls_codigomax
//       FROM "SGD_ORG_MAT"  
//       WHERE ( "SGD_ORG_MAT"."COD_OBJETO" LIKE '0101%' ) AND  
//             ( "SGD_ORG_MAT"."COD_OBJETO" <> '010100' )    ;
//                                 
//                 ls_codigomax = right(ls_codigomax,2)
//                 ll_codigomax = long(ls_codigomax)
//                 ll_codigomax++
//                 ls_codigomax = string(ll_codigomax)
//                 if len(ls_codigomax) = 2 then
//                           ls_codigomax = '0101' + trim(ls_codigomax)
//                 else
//                        ls_codigomax = '01010' + trim(ls_codigomax)

//                 end if
//                 dw_control.setitem(ll_fila,"codigo",ls_codigomax)
//                                                          
//END CHOOSE
//
//////////// DBE fin comment 21/02/2000
//        
end event

event borrar_registro;// Ale

long    ll_ref
string ls_codigo
long ll_encontrados = 0

int li_respuesta
long ll_fila
long ll_codigo
string ls_valor
string ls_descripcion

ll_ref = 0

ll_fila = iuo_gen_uo.getrow()
if ll_fila>0 then 
//	OK
else
	return
end if

// DBE ini 24/02/2000
li_respuesta = gnv_msg.f_mensaje("CG13","","",YesNo!)

if li_respuesta = 2 then 
        return
end if

choose case iuo_gen_uo.dataobject
     	 case "d_man_2022_tip_avi"
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_fila,'tip_aviso'))
	    case "d_man_2042_propiedad"
			ls_valor=iuo_gen_uo.getitemstring(ll_fila,'valor')
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_fila,'codigo'))
		 case "d_man_2049_materiales"
			ls_codigo=iuo_gen_uo.getitemstring(ll_fila,'codigo')
			//23/10/2008 yaf
		case "d_man_5020_ocen_ser_ejec"
			ls_codigo=iuo_gen_uo.getItemString(ll_fila,'codigo')
		case else
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_fila,'codigo'))
end choose

         ls_descripcion=iuo_gen_uo.getitemstring(ll_fila,'descripcion')
	  // GNU 23-3-2006. Mejora materiales
	 if iuo_gen_uo.dataobject= "d_man_2049_materiales" then
		SELECT descripcion
		INTO :ls_descripcion
		FROM SGD_ORG_MAT
		WHERE cod_objeto=:ls_codigo;
	end if
	
	//yaf
	if iuo_gen_uo.dataobject <> "d_man_5020_ocen_ser_ejec" then
	
			ls_descripcion=trim(ls_descripcion)
		if wf_si_tiene_relaciones_con_tablas(ls_codigo,ls_valor,ls_descripcion) then return;
		
	end if	
      iuo_gen_uo.deleterow(ll_fila)



end event

event grabar_modificaciones;//DBE ini 24/02/2000


iuo_gen_uo.accepttext()

if ib_duplicado then
	ib_duplicado=false
il_scan_cambios_OK=-1
return 
end if

il_scan_cambios_OK=wf_scan_cambios()

if il_scan_cambios_OK<0 then return;

il_update_dw_OK=wf_update_dw()
if il_update_dw_OK<0 then 
			choose case il_update_dw_OK
				case -1
            gnv_msg.f_mensaje("EM59",string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext,"",OK!)
         end choose
	gnu_u_transaction.uf_rollback();        
	     
else
	gnu_u_transaction.uf_commit();


if ib_nohay then 
	ib_nohay=false
	iuo_gen_uo.reset()
	iuo_gen_uo.retrieve()
else
   iuo_gen_uo.resetupdate()
end if

       end if

end event

protected function boolean f_anulo ();return true
end function

public function integer f_destruir_objetos ();DESTROY iu_comunic


return 1
end function

private function string wf_obtener_codigo_unico (string ps_dw_name);//DBE 21/02/2000
long ll_ultimo,ll_maxi
long ll_limite
long ll_codigomax
string ls_codigomax
string ls_tabla
string ls_codif

 
 
CHOOSE CASE ps_dw_name
		
        CASE "d_man_2022_tip_avi" 

 select max(tip_aviso) into :ll_maxi from gi_t_tip_aviso;
 
   ls_tabla='GI_T_TIP_AVISO'
	              
					  
   CASE "d_man_2020_alc_avi"
		
				  ls_codif='ALC'
              ls_tabla='SGD_VALOR.CODIF=ALC'
              
// No se usan. Se usan w_mant_causa y w_mant_fam_causa
//   CASE "d_man_2023_causa_inc"


	case "d_man_motivos_anulacion"
			  ls_codif='ANUL'
			  ls_tabla='SGD_VALOR.CODIF=ANUL' 
              
   CASE "d_man_2040_accion"
				  ls_codif='ACC'
				  ls_tabla='SGD_VALOR.CODIF=ACC' 
                  
   CASE "d_man_2041_est_clima"
              ls_codif='E_CL'   				  
				  ls_tabla='SGD_VALOR.CODIF=E_CL' 
                        
   CASE "d_man_2042_propiedad"
              ls_codif='PROP'   				  
              ls_tabla='SGD_VALOR.CODIF=PROP' 
                  
   CASE "d_man_2050_tareas" 
              ls_codif='TARE'   
				  ls_tabla='SGD_VALOR.CODIF=TARE' 

   CASE "d_man_prof" 
              ls_codif='PROF'				
				  ls_tabla='SGD_VALOR.CODIF=PROF' 
				
   CASE "d_man_cont" 
            ls_codif='EMPR'   ;						
				ls_tabla='SGD_VALOR.CODIF=EMPR' 
                        
   CASE "d_man_2047_problema" 
            ls_codif='PROB'   				
				ls_tabla='SGD_VALOR.CODIF=PROB' 
				
   CASE "d_man_2049_materiales"
        
//            SELECT max("SGD_ORG_MAT"."COD_OBJETO")
//            INTO :ls_codigomax
//            FROM "SGD_ORG_MAT"  
//       WHERE ( "SGD_ORG_MAT"."COD_OBJETO" LIKE '0101%' ) AND  
//             ( "SGD_ORG_MAT"."COD_OBJETO" <> '010100' )    ;
			
// FAMILIA DE MATERIALES  GSE 06/06/2001
string ls_subfamilia

		SELECT "VALOR"
		INTO :ls_subfamilia
		FROM "SGD_VALOR"
		WHERE "SGD_VALOR"."CODIF" = 'C_FA';

		ls_subfamilia = ls_subfamilia + '%'

// GNU 24-3-2006. Mejora materiales
//		SELECT max("SGD_ORG_MAT"."COD_OBJETO")
//		INTO :ls_codigomax
//		FROM "SGD_ORG_MAT"  
//		WHERE ( "SGD_ORG_MAT"."COD_OBJETO" LIKE :ls_subfamilia ) AND  
//	   ( "SGD_ORG_MAT"."COD_OBJETO" <> '010100' );
		
		SELECT max("SGD_ORG_MAT"."COD_OBJETO")
		INTO :ls_codigomax
		FROM "SGD_ORG_MAT"  
		WHERE ( "SGD_ORG_MAT"."COD_OBJETO" LIKE :ls_subfamilia ) AND  
	   ( "SGD_ORG_MAT"."COD_OBJETO" not like '%00' );
// FIN GNU		

				 ls_tabla='SGD_ORG_MAT'  
				  
                 ls_codigomax = right(ls_codigomax,2)
                 ll_codigomax = long(ls_codigomax)
					   if not isnull(ll_codigomax) then
	                  if ll_codigomax=99 then //Por si acaso
	                  gnu_u_transaction.uf_rollback();
//               		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar nuevo Primary Key')
							gnv_msg.f_mensaje('AM55','','',OK!)
               		return string(-1)
                  	end if
                  end if
					  
					  
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
           'MAN_TAB_BAS',   
           :ls_tabla,   
           trunc(sysdate),   
           NVL(:ll_codigomax,0) )  ;
				  
gnu_u_transaction.uf_commit();

select ultimo into :ll_ultimo from gi_t_ultimo where trunc(fecha) = trunc(sysdate)
and tabla like :ls_tabla for update ;

if ll_ultimo=0 or isnull(ll_ultimo) then //repeate to resolve collision
                                         // record in gi_t_ultimo was deleted 
	 return '0'
end if

ll_ultimo++


update gi_t_ultimo set ultimo=:ll_ultimo 
where trunc(fecha) = trunc(sysdate)
and tabla like :ls_tabla ;


gnu_u_transaction.uf_commit();

if sqlca.sqlcode<>0 then return string(-1)

delete from gi_t_ultimo where trunc(fecha) = trunc(sysdate)
and tabla like :ls_tabla;



                 ls_codigomax = string(ll_ultimo)
// GNU 24-3-2006. Mejora materiales					  
//                 if len(ls_codigomax) = 2 then
//                           ls_codigomax = '0101' + trim(ls_codigomax)
//                 else
//                        ls_codigomax = '01010' + trim(ls_codigomax)
//                 end if
		ls_subfamilia=left(ls_subfamilia,4)
                 if len(ls_codigomax) = 2 then
                           ls_codigomax = ls_subfamilia + trim(ls_codigomax)
                 else
                        ls_codigomax =ls_subfamilia + '0' + trim(ls_codigomax)
                 end if
// FIN GNU					  

return ls_codigomax

//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
   CASE "d_man_2051_tipos_tension"
				  ls_codif='TTEN'
				  ls_tabla='SGD_VALOR.CODIF=TTEN' 

   CASE "d_man_2052_agentes"
				  ls_codif='TAGT'
				  ls_tabla='SGD_VALOR.CODIF=TAGT' 

   CASE "d_man_2052_unidades"
				  ls_codif='UNI'
				  ls_tabla='SGD_VALOR.CODIF=UNI' 
	// GNU 31-7-2006. Mejora 1/426921			  
   CASE "d_man_2053_descargo"
				  ls_codif='DS_D'
				  ls_tabla='SGD_VALOR.CODIF=DS_D' 				  
	// FIN GNU
//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

//23/10/2008  YAF
CASE "d_man_5020_ocen_ser_ejec"
	ls_codif = 'OCEN'
	ls_tabla = 'SGD_OCEN_SERVICIO_EJECUTOR=OCEN'

END CHOOSE

//////////////////////////////////////////////////////////////////////////////////////////
////This part of code exutes for all previous CASES except of CASE "d_man_2049_materiales"
 if ps_dw_name <>"d_man_2022_tip_avi" then 
              SELECT max( codigo )  
              INTO :ll_maxi
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = :ls_codif;	
 end if
 
 // GNU 6-10-2006. Mejora 1/426921	
 if ps_dw_name = "d_man_2053_descargo" then
	long ll_max_desc
	
	SELECT nvl(max(codigo),0)
	INTO :ll_max_desc
	FROM gi_desc_descargos;
		
	if ll_max_desc> ll_maxi then
		ll_maxi=ll_max_desc
	end if
end if
// FIN GNU
	
 
 if not isnull(ll_maxi) then
	   choose case ps_dw_name
			    case "d_man_2022_tip_avi"
					ll_limite=99
				 case else
					ll_limite=999
		end choose
	if ll_maxi=ll_limite then //Por si las moscas
	   gnu_u_transaction.uf_rollback();
//		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No es posible generar nuevo Primary Key')
		gnv_msg.f_mensaje('AM55','','',OK!)
		return string(-1)
	end if
 end if

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
           'MAN_TAB_BAS',   
           :ls_tabla,   
           trunc(sysdate),   
           NVL(:ll_maxi,0) )  ;
			  
gnu_u_transaction.uf_commit();

select ultimo into :ll_ultimo from gi_t_ultimo where trunc(fecha) = trunc(sysdate)
and tabla like :ls_tabla for update ;

//if ll_ultimo=0 or isnull(ll_ultimo) then //repeate to resolve collision
//                                         // record in gi_t_ultimo was deleted 
//	 return '0'
//end if
//
ll_ultimo++

update gi_t_ultimo set ultimo=:ll_ultimo 
where trunc(fecha) = trunc(sysdate)
and tabla like :ls_tabla ;

gnu_u_transaction.uf_commit();

delete from gi_t_ultimo where trunc(fecha) = trunc(sysdate)
and tabla like :ls_tabla;

return string(ll_ultimo)

end function

public function integer wf_si_todavia_existe (string ps_codigo, string ps_descripcion);//wf_si_todavia_existe
long ll_existe
long ll_codigo
string ls_codif

     ll_codigo=long(ps_codigo)

CHOOSE CASE iuo_gen_uo.dataobject
		
   CASE "d_man_2022_tip_avi" 

 select count(*) into :ll_existe from gi_t_tip_aviso 
 where tip_aviso = :ll_codigo;

if ll_existe = 0 then // no existe
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$'+ ps_descripcion+' . Se necesita actualizar datos');
gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)

end if 

return ll_existe
						  
   CASE "d_man_2020_alc_avi"
		        ls_codif = 'ALC'
				  
// No se usan. Se usan w_mant_causa y w_mant_fam_causa
//   CASE "d_man_2023_causa_inc"
         
   CASE "d_man_2040_accion"
              ls_codif = 'ACC'    
				  
   CASE "d_man_2041_est_clima"
 
              ls_codif = 'E_CL'    

   CASE "d_man_2042_propiedad"
				ls_codif = 'PROP'
				  
	CASE "d_man_2045_int_horario"
		select count(*) into :ll_existe from gi_horarios_trabajo 
		 where cod_hor = :ll_codigo;			
		 if ll_existe = 0 then // no existe
			gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)

		end if 

		return ll_existe

		 
   CASE "d_man_2050_tareas"
		        ls_codif = 'TARE' 
 
   CASE "d_man_prof" 
              ls_codif = 'PROF'  
				  
   CASE "d_man_cont" 
              ls_codif = 'EMPR' 
				  
   CASE "d_man_2047_problema" 		
              ls_codif = 'PROB'   
				
   CASE "d_man_2049_materiales"
		
            select count(*) into :ll_existe
            FROM "SGD_ORG_MAT"  
       WHERE ( "SGD_ORG_MAT"."COD_OBJETO" LIKE '0101%' )
  		   AND ( "SGD_ORG_MAT"."COD_OBJETO" <> '010100' ) 
         AND "SGD_ORG_MAT"."COD_OBJETO"=:ps_codigo;	
			
			if ll_existe = 0 then // no existe
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$'+ ps_descripcion+' . Se necesita actualizar datos');
gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)
         end if 
			
          return ll_existe

              
	//***************************************
	//**  OSGI 2001.1  	28/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
   CASE "d_man_2051_tipos_tension" 
				ls_codif = 'TTEN'
				
	CASE "d_man_motivos_anulacion" 
				ls_codif = 'ANUL'			
	
   CASE "d_man_2052_agentes" 
				ls_codif = 'TAGT'
	
   CASE "d_man_2052_unidades" 
				ls_codif = 'UNI'

	//***************************************
	//**  OSGI 2001.1  	28/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	
	// GNU 27-7-2006. Mejora 1/426921
	   CASE "d_man_2053_descargo" 
				ls_codif = 'DS_D'
	// FIN GNU			
	
	//23/10/2008   YAF
	CASE "d_man_5020_ocen_ser_ejec"
		select count(*) into :ll_existe from gi_ocen_servicio_ejecutor 
 		where codigo = :ll_codigo;
		//ls_codif = 'OCEN'
		return ll_existe
	
END CHOOSE


//////////// para todos cases excepto ultimo y primero
              select count(*) into :ll_existe
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = :ls_codif 
				  and "SGD_VALOR"."CODIGO"=:ll_codigo;		
				  
if ll_existe = 0 then // no existe
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$'+ ps_descripcion+' . Se necesita actualizar datos');
gnv_msg.f_mensaje("AM56",ps_descripcion,"",OK!)
end if 




return ll_existe

end function

private function integer wf_scan_cambios ();//DBE  9/02/2000

boolean lb_duplicado
long ll_noHay
long ll_last_modif
string ls_codigo
long ll_codigo
string ls_descripcion
string ls_valor
Datetime ldt_desde, ldt_hasta
string ls_desde, ls_hasta

ll_last_modif=iuo_gen_uo.GetNextModified(0, Primary!)
	
do while ll_last_modif>0 

	choose case iuo_gen_uo.dataobject
		case "d_man_2020_alc_avi"
			 ls_descripcion=iuo_gen_uo.getitemstring(ll_last_modif,'descripcion') + iuo_gen_uo.getitemstring(ll_last_modif,'valor')
     	case "d_man_2022_tip_avi"
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_last_modif,'tip_aviso'))
	    case "d_man_2042_propiedad"
			ls_valor=iuo_gen_uo.getitemstring(ll_last_modif,'valor')
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_last_modif,'codigo'))
	    case "d_man_2045_int_horario"  // LFE
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_last_modif,'codigo'))
			ldt_desde = iuo_gen_uo.GetItemDatetime(ll_last_modif, 'desde')
			ldt_hasta = iuo_gen_uo.GetItemDatetime(ll_last_modif, 'hasta')
			ls_desde = String(Hour(Time(ldt_desde))) + ":" + String(Minute(Time(ldt_desde)))
			IF IsNull(ls_desde) THEN
				// Si el campo es nulo se trata de la hora 0:00
				ls_desde = '0:00'
				// Hay que ponerle una fecha a esa hora
				iuo_gen_uo.SetItem(ll_last_modif, 'desde', Date(fgnu_fecha_actual()))
			END IF
			IF Minute(Time(ldt_desde))=0 THEN
				ls_desde = ls_desde + "0"
			END IF
			ls_hasta = String(Hour(Time(ldt_hasta))) + ":" + String(Minute(Time(ldt_hasta)))
			IF IsNull(ls_hasta) THEN
				// Si el campo es nulo se trata de la hora 0:00
				ls_hasta = '0:00'
				// Hay que ponerle una fecha a esa hora
				iuo_gen_uo.SetItem(ll_last_modif, 'hasta', Date(fgnu_fecha_actual()))
			END IF
			IF Minute(Time(ldt_hasta))=0 THEN
				ls_hasta = ls_hasta + "0"
			END IF
			iuo_gen_uo.SetItem(ll_last_modif, 'descripcion', &
									 "De "+ls_desde+" a "+ls_hasta)
		 case "d_man_2049_materiales"
			ls_codigo=iuo_gen_uo.getitemstring(ll_last_modif,'codigo')
			//23/10/2008 yaf
		case "d_man_5020_ocen_ser_ejec"
			ls_codigo=string(iuo_gen_uo.getitemstring(ll_last_modif,'codigo'))
		case else
			ls_codigo=string(iuo_gen_uo.getitemnumber(ll_last_modif,'codigo'))
			
	end choose
         //yaf
			if iuo_gen_uo.dataobject <> "d_man_5020_ocen_ser_ejec" then
		ls_descripcion=iuo_gen_uo.getitemstring(ll_last_modif,'descripcion') 
	end if
	
	//AHM (08/09/2009) Incidencia 100118908
	//if iuo_gen_uo.dataobject <> "d_man_2020_alc_avi" then
	if iuo_gen_uo.dataobject <> "d_man_2020_alc_avi" AND iuo_gen_uo.dataobject <> "d_man_2022_tip_avi" then
		ls_descripcion=iuo_gen_uo.getitemstring(ll_last_modif,'codigo') 
	end if

	//Modified record in dw still exist in the database?
	
	if isnull(ls_descripcion) or len(trim(ls_descripcion)) = 0 then
		gnv_msg.f_mensaje("EM57","","",Ok!)
		iuo_gen_uo.SetFocus()
		iuo_gen_uo.Scrolltorow(ll_last_modif)
		return -1 
   end if

	if not iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
     ll_noHay=wf_si_todavia_existe(ls_codigo,&
	  ls_descripcion)
	  if not ll_nohay>0 then ib_nohay=true;
   end if 	

   if ll_noHay>0 &
	or iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! &
	then //Description is unique ?
	lb_duplicado=wf_si_duplicado(ls_codigo,ls_descripcion)
	if lb_duplicado then 
			iuo_gen_uo.SetFocus()
      	iuo_gen_uo.Scrolltorow(ll_last_modif)
		return -2
	end if
   else
		//
   end if
	///
ll_last_modif=iuo_gen_uo.GetNextModified(ll_last_modif, Primary!)
loop
					

return 0
end function

public function boolean wf_si_duplicado (string ps_codigo, string ps_descripcion);//DBE 21/02/2000
string ls_codigo
long ll_codigo

CHOOSE CASE iuo_gen_uo.dataobject
		
   CASE "d_man_2022_tip_avi" 
 	select tip_aviso into :ll_codigo from gi_t_tip_aviso 
	where descripcion = :ps_descripcion;
 
	if ll_codigo=0 then
		ls_codigo=''
	else
   	ls_codigo=string(ll_codigo)
	end if

						  
   CASE "d_man_2020_alc_avi"
		
              SELECT to_char(codigo)
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'ALC' 
				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;		
				  
// No se usan. Se usan w_mant_causa y w_mant_fam_causa
//   CASE "d_man_2023_causa_inc"
//              SELECT valor  
//              INTO :ls_codigo
//              FROM "SGD_VALOR"  
//              WHERE "SGD_VALOR"."CODIF" = 'CAU'   
//				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
          
	   CASE "d_man_motivos_anulacion"
			
              SELECT to_char(codigo)
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'ANUL'    
				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;			 
			 
   CASE "d_man_2040_accion"
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'ACC'    
				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	

                  
   CASE "d_man_2041_est_clima"
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'E_CL'    
				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	

                        
   CASE "d_man_2042_propiedad"
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'PROP'    
				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
 
	CASE "d_man_2045_int_horario"  // LFE
				  SELECT cod_hor 
				  INTO :ls_codigo
				  FROM "GI_HORARIOS_TRABAJO"
				  WHERE "GI_HORARIOS_TRABAJO"."DESCRIPCION" = :ps_descripcion;
			             
   CASE "d_man_2050_tareas"
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'TARE'   
				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
	

   CASE "d_man_prof" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
            WHERE "SGD_VALOR"."CODIF" = 'PROF'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
				
   CASE "d_man_cont" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'EMPR'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;			

                        
   CASE "d_man_2047_problema" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
            WHERE "SGD_VALOR"."CODIF" = 'PROB'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
				
   CASE "d_man_2049_materiales"

            SELECT "SGD_ORG_MAT"."COD_OBJETO"
            INTO :ls_codigo
            FROM "SGD_ORG_MAT"  
       WHERE ( "SGD_ORG_MAT"."COD_OBJETO" LIKE '0101%' )
  		   AND ( "SGD_ORG_MAT"."COD_OBJETO" <> '010100' ) 
         AND "SGD_ORG_MAT"."DESCRIPCION"=:ps_descripcion;	

	//***************************************
	//**  OSGI 2001.1  	28/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
   CASE "d_man_2051_tipos_tension" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'TTEN'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;			
	
   CASE "d_man_2052_agentes" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'TAGT'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;			
	
   CASE "d_man_2052_unidades" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'UNI'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;			
	
	//***************************************
	//**  OSGI 2001.1  	28/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	
	// GNU 27-7-2006. Mejora 1/426921
   CASE "d_man_2053_descargo" 
              SELECT valor  
              INTO :ls_codigo
              FROM "SGD_VALOR"  
              WHERE "SGD_VALOR"."CODIF" = 'DS_D'   
				and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
				
	//23/10/2008  YAF
	CASE "d_man_5020_ocen_ser_ejec"
		   SELECT codigo
         INTO :ls_codigo
         FROM "GI_OCEN_SERVICIO_EJECUTOR"  
         WHERE "GI_OCEN_SERVICIO_EJECUTOR"."CODIGO" = 'OCEN' 
		   and "GI_OCEN_SERVICIO_EJECUTOR"."DESCRIPCION"=:ps_descripcion;
END CHOOSE


	
	if (isnull(ps_codigo) and len(ls_codigo)>0 ) or &
((ls_codigo <> ps_codigo) and len(ls_codigo)>0 ) &
then 
//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Ya existe esta descripc$$HEX1$$ed00$$ENDHEX$$on : '+ ps_descripcion);
gnv_msg.f_mensaje("AM57",ps_descripcion,"",OK!)
	return true
end if

	
	return false
end function

private function boolean wf_si_tiene_relaciones_con_tablas (string ps_codigo, string ps_valor, string ps_descripcion);string ls_codigo
long ll_contador
long ll_codigo

CHOOSE CASE iuo_gen_uo.dataobject
		
   CASE "d_man_2022_tip_avi" 
		ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from gi_avisos
		where gi_avisos.tip_aviso = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_avisos",Ok!)
		return true
		end if
      
		select count(*)
		into :ll_contador
		from gi_hist_avisos
		where gi_hist_avisos.tip_aviso = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_hist_avisos",Ok!)
		return true
		end if
						  
   CASE "d_man_2020_alc_avi"
			ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from gi_avisos
		where gi_avisos.co_alcance = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_avisos",Ok!)
		return true
		end if
      
		select count(*)
		into :ll_contador
		from gi_hist_avisos
		where gi_hist_avisos.co_alcance = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_hist_avisos",Ok!)
		return true
		end if
									  
// No se usan. Se usan w_mant_causa y w_mant_fam_causa
//   CASE "d_man_2023_causa_inc"
//              SELECT valor  
//              INTO :ls_codigo
//              FROM "SGD_VALOR"  
//              WHERE "SGD_VALOR"."CODIF" = 'CAU'   
//				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
          
   CASE "d_man_2040_accion"
      ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from gi_accion_inc
		where gi_accion_inc.cod_accion = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_accion_inc",Ok!)
		return true
		end if

                  
   CASE "d_man_2041_est_clima"
      ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from sgd_incidencia
		where sgd_incidencia.cod_est_clima = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_incidencia",Ok!)
		return true
		end if
		
		select count(*)
		into :ll_contador
		from gi_hist_incidencias
		where gi_hist_incidencias.cod_est_clima = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_hist_incidencias",Ok!)
		return true
		end if
		
		select count(*)
		into :ll_contador
		from gi_sit_clima
		where gi_sit_clima.cod_est_clima = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_sit_clima",Ok!)
		return true
		end if

	CASE "d_man_motivos_anulacion"
		
      ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from sgd_incidencia
		where sgd_incidencia.cod_motivo = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_incidencia",Ok!)
		return true
		end if
		
		select count(*)
		into :ll_contador
		from gi_hist_incidencias
		where gi_hist_incidencias.cod_motivo = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_hist_incidencias",Ok!)
		return true
		end if
				
		IF ll_codigo = fgci_cod_motivo_otros THEN
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se permite que este motivo sea eliminado del sistema")
		return true
		END IF
		
   CASE "d_man_2042_propiedad"
      
	
		select count(*)
		into :ll_contador
		from sgd_acometida
		where sgd_acometida.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_acometida",Ok!)
		return true
		end if

      select count(*)
		into :ll_contador
		from sgd_ct
		where sgd_ct.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_ct",Ok!)
		return true
		end if
 
      select count(*)
		into :ll_contador
		from sgd_instalacion
		where sgd_instalacion.cod_prop_inst in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_instalacion",Ok!)
		return true
		end if

      select count(*)
		into :ll_contador
		from sgd_salbt
		where sgd_salbt.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_salbt",Ok!)
		return true
		end if

      select count(*)
		into :ll_contador
		from sgd_salmt
		where sgd_salmt.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_salmt",Ok!)
		return true
		end if

      select count(*)
		into :ll_contador
		from sgd_subestac
		where sgd_subestac.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_subestac",Ok!)
		return true
		end if

      select count(*)
		into :ll_contador
		from sgd_trafo_mb
		where sgd_trafo_mb.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_trafo_mb",Ok!)
		return true
		end if
		
		select count(*)
		into :ll_contador
		from sgd_tramo
		where sgd_tramo.propiedad in (:ps_codigo,:ps_valor);
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_tramo",Ok!)
		return true
		end if
//   CASE "d_man_2050_tareas"
//              SELECT valor  
//              INTO :ls_codigo
//              FROM "SGD_VALOR"  
//              WHERE "SGD_VALOR"."CODIF" = 'TARE'   
//				  and "SGD_VALOR"."DESCRIPCION"=:ps_descripcion;	
//	
//
   CASE "d_man_prof" 
		
      ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from gi_brigadista
		where gi_brigadista.cod_profesion = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_brigadista",Ok!)
		return true
		end if
				
   CASE "d_man_cont" 
		
      ll_codigo=long(ps_codigo)
      select count(*)
		into :ll_contador
		from gi_brigadista
		where gi_brigadista.nro_contrata = :ll_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_brigadista",Ok!)
		return true
		end if
		
				
   CASE "d_man_2049_materiales"
		
	   select count(*)
		into :ll_contador
		from sgd_materiales
		where substr(sgd_materiales.cod_material,1,6) = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_materiales",Ok!)
		return true
		end if
		
//		select count(*)
//		into :ll_contador
//		from gi_brigadas_bdg
//		where gi_brigadas_bdg.mat_averiado = :ps_codigo;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_brigadas_bdg",Ok!)
//		return true
//		end if
//		
//		select count(*)
//		into :ll_contador
//		from gi_brigadas_tmp
//		where gi_brigadas_tmp.mat_averiado = :ps_codigo;
//	
//		if ll_contador > 0 then
//		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_brigadas_tmp",Ok!)
//		return true
//		end if

		select count(*)
		into :ll_contador
		from gi_hist_incidencias
		where gi_hist_incidencias.mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_hist_incidencias",Ok!)
		return true
		end if

		select count(*)
		into :ll_contador
		from gi_incidencia_bdg
		where gi_incidencia_bdg.mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_incidencia_bdg",Ok!)
		return true
		end if
		
	   select count(*)
		into :ll_contador
		from gi_incidencia_bdg_tmp
		where gi_incidencia_bdg_tmp.mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_incidencia_bdg_tmp",Ok!)
		return true
		end if

	   select count(*)
		into :ll_contador
		from gi_relevantes_bdg
		where gi_relevantes_bdg.mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_relevantes_bdg",Ok!)
		return true
		end if

	   select count(*)
		into :ll_contador
		from gi_relevantes_bdg_tmp
		where gi_relevantes_bdg_tmp.mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_relevantes_bdg_tmp",Ok!)
		return true
		end if

	   select count(*)
		into :ll_contador
		from gi_suministros_bdg
		where gi_suministros_bdg.fam_mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_suministros_bdg",Ok!)
		return true
		end if

	   		
		select count(*)
		into :ll_contador
		from gi_suministros_bdg_tmp
		where gi_suministros_bdg_tmp.fam_mat_averiado = :ps_codigo;
	
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"gi_suministros_bdg_tmp",Ok!)
		return true
		end if
		
	CASE "d_man_2053_descargo"
		
		SELECT count(*)
		into :ll_contador
		from sgd_descargos
		where descripcion = :ps_codigo and estado not in (8, 13);
		
		if ll_contador > 0 then
		 gnv_msg.f_mensaje("AM58",ps_descripcion,"sgd_descargos",Ok!)
		return true
		end if
		
		
		
		
	
		
 END CHOOSE
 
	return false
end function

private function integer wf_update_dw ();
////DBE 17/02/2000
//
long ll_counter
long ll_last_modif
long ll_contador
long ll_codigo

///tip_aviso
//long ll_tip_aviso
long ll_ind_peligro
long ll_activar


string ls_codigo
string ls_valor
string ls_descripcion
string ls_codif
string ls_color

int li_lock_status
int li_repeat_until

Datetime ldt_desde, ldt_hasta
//
///// insert and update

ll_last_modif=iuo_gen_uo.GetNextModified(0, Primary!)

CHOOSE CASE iuo_gen_uo.dataobject
		
   CASE "d_man_2022_tip_avi" 
////////////////////////////////////////////////////////////////
do while ll_last_modif>0 
   
	ll_codigo=iuo_gen_uo.getitemnumber(ll_last_modif,'tip_aviso')
	ll_ind_peligro=iuo_gen_uo.getitemnumber(ll_last_modif,'ind_peligro')
	//JHE SFP DEO-160 23/10/2012
	//Se agrego nuevos campos para seleccionar las actividades y colores
   ll_activar = iuo_gen_uo.getitemnumber(ll_last_modif,'activo')
	
	if isnull(ll_activar) then ll_activar = 0
	
	if ll_ind_peligro > 0 THEN
	   ls_color   =iuo_gen_uo.getitemstring(ll_last_modif,'color')
		
	else
		ls_color = ''
   end if
	//JHE SFP DEO-160 FIN
	ls_descripcion=iuo_gen_uo.getitemstring(ll_last_modif,'descripcion')
	ls_descripcion=left(trim(ls_descripcion),80)
	ls_descripcion=upper(ls_descripcion)
	
	
	if iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
		
	  ls_codigo=wf_obtener_codigo_unico("d_man_2022_tip_avi")	 	  
	  	  li_repeat_until=0
	  do while long(ls_codigo)=0 and li_repeat_until<3
	  	  ls_codigo=wf_obtener_codigo_unico(iuo_gen_uo.dataobject)
		  li_repeat_until++
	  loop
	  
	  if isnull(ls_codigo) then return -1;
     if wf_si_duplicado(string(ll_codigo),ls_descripcion)then return -2;	  
	  
	  ll_codigo=long(ls_codigo)
	  
  INSERT INTO "GI_T_TIP_AVISO"  
         ( "TIP_AVISO",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "DESCRIPCION",   
           "IND_PELIGRO",
			  "ACTIVO",
			  "COLOR")  
  VALUES ( :ll_codigo,   
           :gs_usuario,   
           sysdate,   
           :gs_programa,   
           :ls_descripcion,   
           :ll_ind_peligro,
			  :ll_activar,
			  :ls_color)  ;
			
	  if sqlca.sqlcode<0 then return -1;


     iuo_gen_uo.SetItem( ll_last_modif, 'tip_aviso',ll_codigo)
	  iuo_gen_uo.SetItem( ll_last_modif, 'ind_peligro',ll_ind_peligro)
	  iuo_gen_uo.SetItem( ll_last_modif, 'descripcion',ls_descripcion)
	  iuo_gen_uo.SetItem( ll_last_modif, 'activar',ll_activar)
	  iuo_gen_uo.SetItem( ll_last_modif, 'color',ls_color)
	  
   else /////////// Update
		
    UPDATE "GI_T_TIP_AVISO"  
     SET "USUARIO" = :gs_usuario,   
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = :gs_programa,   
         "DESCRIPCION" = :ls_descripcion,   
         "IND_PELIGRO" = :ll_ind_peligro,
			"ACTIVO" = :ll_activar,
			"COLOR"  = :ls_color
	 WHERE "GI_T_TIP_AVISO"."TIP_AVISO" =:ll_codigo
			; 
	 if sqlca.sqlcode<0 then return -1;
	 
   end if 	

					
ll_last_modif=iuo_gen_uo.GetNextModified(ll_last_modif, Primary!)
loop


//////////////////////////
// delete



for ll_counter = 1 to  iuo_gen_uo.deletedcount()
	ll_codigo=iuo_gen_uo.getitemnumber(ll_counter,'tip_aviso',delete!,false)

	   if wf_si_tiene_relaciones_con_tablas(string(ll_codigo),'',iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false)) then 	
//		 gnv_msg.f_mensaje("EG08",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
      else
		 	  	li_lock_status = gnu_u_transaction.uf_lock &
					(this, "GI_T_TIP_AVISO", "TIP_AVISO = " + string(ll_codigo),FALSE)
					
  	    choose case  li_lock_status 
				  case  -54 
			gnv_msg.f_mensaje("EG19",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0	
			delete from GI_T_TIP_AVISO where TIP_AVISO=:ll_codigo;  		
			if sqlca.sqlcode<0 then return -1;
	  end choose  	
	
	  
	  end if
next

return 0

////////////////////////////////////////////////////////////////
						  
   CASE "d_man_2020_alc_avi"
		        ls_codif = 'ALC'
				  
// No se usan. Se usan w_mant_causa y w_mant_fam_causa
//   CASE "d_man_2023_causa_inc"
         
   CASE "d_man_2040_accion"
              ls_codif = 'ACC'    
				  
   CASE "d_man_2041_est_clima"
 
              ls_codif = 'E_CL'    

   CASE "d_man_2042_propiedad"

              ls_codif = 'PROP'
   CASE "d_man_2050_tareas"
		        ls_codif = 'TARE' 
 
   CASE "d_man_prof" 
              ls_codif = 'PROF'  
				  
   CASE "d_man_cont" 
              ls_codif = 'EMPR' 
				
	CASE "d_man_2045_int_horario"

		do while ll_last_modif>0 
			ls_descripcion = iuo_gen_uo.GetItemString(ll_last_modif,'descripcion') 
			ldt_desde=iuo_gen_uo.GetItemDatetime(ll_last_modif,'desde')
			ldt_hasta=iuo_gen_uo.GetItemDatetime(ll_last_modif,'hasta')
			iuo_gen_uo.Setitem(ll_last_modif,'descripcion', ls_descripcion)

			IF iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
				// Se comprueba si hay datos en la tabla. Si no hay datos, el c$$HEX1$$f300$$ENDHEX$$digo del
				// nuevo horario ser$$HEX2$$e1002000$$ENDHEX$$1
				select count(cod_hor) into :ll_codigo from  GI_HORARIOS_TRABAJO;
				// Si hay datos se obtiene el $$HEX1$$fa00$$ENDHEX$$ltimo valor del c$$HEX1$$f300$$ENDHEX$$digo de horario para darle 
				// valor al c$$HEX1$$f300$$ENDHEX$$digo de horario del nuevo elemento
				IF ll_codigo <> 0 THEN
					select max(cod_hor) into :ll_codigo from  GI_HORARIOS_TRABAJO;
					IF Sqlca.SqlCode = 100 THEN 
						ll_codigo = 0
					END IF
					
				END IF		

				ll_codigo++
								
				INSERT INTO "GI_HORARIOS_TRABAJO"  
						( "COD_HOR",
						  "USUARIO",   
						  "F_ACTUAL",   
						  "PROGRAMA",  
						  "DESDE",
						  "HASTA",
						  "DESCRIPCION")  
				VALUES ( :ll_codigo,
							:gs_usuario,   
							 sysdate,   
							:gs_programa,
							:ldt_desde,
							:ldt_hasta,
							:ls_descripcion);
				
				iuo_gen_uo.SetItem(ll_last_modif,'codigo', ll_codigo)
			ELSE
				ll_codigo=iuo_gen_uo.getitemnumber(ll_last_modif,'codigo')
				UPDATE "GI_HORARIOS_TRABAJO"  
					SET "USUARIO" = :gs_usuario,   
						 "F_ACTUAL" = sysdate,      
						 "PROGRAMA" = :gs_programa, 
						 "DESDE" = :ldt_desde,
						 "HASTA" = :ldt_hasta,
						 "DESCRIPCION" = :ls_descripcion
				WHERE "COD_HOR" = :ll_codigo;
			END IF
					
			if sqlca.sqlcode<0 then return -1;
			
		  	ll_last_modif=iuo_gen_uo.GetNextModified(ll_last_modif, Primary!)
			
		loop
		// si hay que borrar registros
		for ll_counter = 1 to  iuo_gen_uo.deletedcount()
			ll_codigo=iuo_gen_uo.getitemnumber(ll_counter,'codigo',delete!,false)
			li_lock_status = gnu_u_transaction.uf_lock(this, "GI_HORARIOS_TRABAJO", "COD_HOR = " + string(ll_codigo),FALSE)
					
  	    	IF li_lock_status = -54 THEN 
				gnv_msg.f_mensaje("EG19",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
			ELSE
		       delete from GI_HORARIOS_TRABAJO where COD_HOR=:ll_codigo;  		
			END IF
			if sqlca.sqlcode<0 then return -1;
		next

		return 0;
				  
   CASE "d_man_2047_problema" 		
              ls_codif = 'PROB'   
				
   CASE "d_man_2049_materiales"
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////		
	
do while ll_last_modif>0 

	ls_codigo=iuo_gen_uo.getitemstring(ll_last_modif,'codigo')
	ls_descripcion=iuo_gen_uo.getitemstring(ll_last_modif,'descripcion')
	ls_descripcion=left(trim(ls_descripcion),100)
	
	
	
	if iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
		
	  ls_codigo=wf_obtener_codigo_unico("d_man_2049_materiales")
	  	   li_repeat_until=0
	  do while long(ls_codigo)=0 and li_repeat_until<3
	  	  ls_codigo=wf_obtener_codigo_unico(iuo_gen_uo.dataobject)
		  li_repeat_until++
	  loop

	  	  
	  if isnull(ls_codigo) then return -1;
	  if wf_si_duplicado(ls_codigo,ls_descripcion) then return -2;
	  
  INSERT INTO "SGD_ORG_MAT"  
         ( "COD_OBJETO",   
           "DESCRIPCION" ,
	    "IND_CORRECTIVO")  
  VALUES ( :ls_codigo,   
           :ls_descripcion,
	     1)  ;
			  
		iuo_gen_uo.SetItem( ll_last_modif, 'descripcion',ls_descripcion)
		
	  if sqlca.sqlcode<0 then return -1;

else /////////// Update
		
   UPDATE "SGD_ORG_MAT"  
     SET "DESCRIPCION" = :ls_descripcion  
	  WHERE "SGD_ORG_MAT"."COD_OBJETO"=:ls_codigo
	         AND ( "SGD_ORG_MAT"."COD_OBJETO" LIKE '0101%' )
  		   AND ( "SGD_ORG_MAT"."COD_OBJETO" <> '010100' ) ;
	 
	 if sqlca.sqlcode<0 then return -1;
	 
   end if 	

					
ll_last_modif=iuo_gen_uo.GetNextModified(ll_last_modif, Primary!)
loop


//////////////////////////
// delete


for ll_counter = 1 to iuo_gen_uo.deletedcount()
	ls_codigo=iuo_gen_uo.getitemstring(ll_counter,'codigo',delete!,false)

	   if wf_si_tiene_relaciones_con_tablas(ls_codigo,'',iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false)) then 	
//		 gnv_msg.f_mensaje("EG08",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
      else
		 	  	li_lock_status = gnu_u_transaction.uf_lock &
					(this, "SGD_ORG_MAT", "COD_OBJETO = " + ls_codigo,FALSE)
					
  	    choose case  li_lock_status 
				  case  -54 
			gnv_msg.f_mensaje("EG19",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0	
			delete from SGD_ORG_MAT where cod_objeto=:ls_codigo;  		
			if sqlca.sqlcode<0 then return -1;
	  end choose  	
	
	  
	  end if
next

return 0		
		

//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
   CASE "d_man_2051_tipos_tension"
              ls_codif = 'TTEN'

	CASE "d_man_motivos_anulacion"
		      ls_codif = 'ANUL'


   CASE "d_man_2052_agentes"
              ls_codif = 'TAGT'

   CASE "d_man_2052_unidades"
              ls_codif = 'UNI'
//***************************************
//**  OSGI 2001.1  	19/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

	// GNU 27-7-2006. Mejora 1/426921
	CASE "d_man_2053_descargo" 
				ls_codif ='DS_D'	
	//23/10/2008  YAF
	CASE "d_man_5020_ocen_ser_ejec"
		do while ll_last_modif>0 
			
			ls_codigo = iuo_gen_uo.getitemstring(ll_last_modif,'codigo')
			ls_descripcion = iuo_gen_uo.getitemString(ll_last_modif,'descripcion')
			
			if iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
				
				if isnull(ls_codigo) then return -1;
		      if wf_si_duplicado(ls_codigo,ls_descripcion) then return -2;
				
			INSERT INTO "GI_OCEN_SERVICIO_EJECUTOR"
							("CODIGO",
			 				 "DESCRIPCION",
							 "PROGRAMA",
							 "USUARIO",
							 "FECHA")
			VALUES (:ls_codigo,
					  :ls_descripcion,
					  :gs_programa,
					  :gs_usuario,
					  sysdate);
					  
					  
			iuo_gen_uo.SetItem( ll_last_modif, 'codigo',ls_codigo)
	  		iuo_gen_uo.SetItem( ll_last_modif, 'descripcion',ls_descripcion)
					  
			if sqlca.sqlcode<0 then return -1;
	
	  
   	else /////////// Update
		
   UPDATE "GI_OCEN_SERVICIO_EJECUTOR"  
     SET "DESCRIPCION" = :ls_descripcion 
   WHERE ( "GI_OCEN_SERVICIO_EJECUTOR"."CODIGO" = :ls_codigo );
			
         
			if sqlca.sqlcode<0 then return -1;
	 
   end if 	

					
ll_last_modif=iuo_gen_uo.GetNextModified(ll_last_modif, Primary!)
loop


//////////////////////////
// delete



for ll_counter = 1 to  iuo_gen_uo.deletedcount()
	lS_codigo=iuo_gen_uo.getitemstring(ll_counter,'codigo',delete!,false)
	lS_descripcion=iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false)
   
	
   li_lock_status = gnu_u_transaction.uf_lock &
	 (this, "GI_OCEN_SERVICIO_EJECUTOR", "CODIGO = '" + string(ls_codigo) + "' AND DESCRIPCION = "+"'"+ls_descripcion+"'",FALSE)
					
  	    choose case  li_lock_status 
				  case  -54 
					gnv_msg.f_mensaje("EG19",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
		        case 0	
					delete from "GI_OCEN_SERVICIO_EJECUTOR" where "CODIGO"=:ls_codigo;
					if sqlca.sqlcode<0 then return -1;
	  end choose
next
					  
return 0
END CHOOSE


// Este scripto se executa para todos CASES excepto ultimo y primero
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////


	
do while ll_last_modif>0 

	ll_codigo=iuo_gen_uo.getitemnumber(ll_last_modif,'codigo')
	ls_codigo=string(ll_codigo)
	ls_valor=iuo_gen_uo.getitemstring(ll_last_modif,'valor')
	ls_descripcion=iuo_gen_uo.getitemstring(ll_last_modif,'descripcion')
	ls_descripcion=left(trim(ls_descripcion),50)
   
	
	
	if iuo_gen_uo.GetItemStatus ( ll_last_modif, 0, primary! )=NewModified! then 
		
		ls_codigo=wf_obtener_codigo_unico(iuo_gen_uo.dataobject)
	   li_repeat_until=0
	  do while long(ls_codigo)=0 and li_repeat_until<3
	  	  ls_codigo=wf_obtener_codigo_unico(iuo_gen_uo.dataobject)
		  li_repeat_until++
	  loop
	  
	  if isnull(ls_codigo) then return -1;
	  if wf_si_duplicado(ls_codigo,ls_descripcion) then return -2;
	  
// GNU 29-8-2006. Incidencia EPSA
// Lo pongo aqu$$HEX2$$ed002000$$ENDHEX$$porque sino casca en el alcance de avisos
	ll_codigo=long(ls_codigo)
	
	if iuo_gen_uo.dataobject = "d_man_2020_alc_avi" then
		ls_codigo = ls_valor
	end if
	
//	  ll_codigo=long(ls_codigo)

	 
   INSERT INTO "SGD_VALOR"  
         ( "CODIF",   
           "VALOR",   
           "DESCRIPCION",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "CODIGO" )  
  VALUES ( :ls_codif,   
           :ls_codigo,   
           :ls_descripcion,   
           :gs_usuario,   
           sysdate,   
           :gs_programa,   
           :ll_codigo )  ;
			
	  if sqlca.sqlcode<0 then return -1;


     iuo_gen_uo.SetItem( ll_last_modif, 'codif',ls_codif)
	  iuo_gen_uo.SetItem( ll_last_modif, 'descripcion',ls_descripcion)
	  iuo_gen_uo.SetItem( ll_last_modif, 'valor',ls_codigo)
	  iuo_gen_uo.SetItem( ll_last_modif, 'codigo',ll_codigo)
	  
   else /////////// Update
		
   UPDATE "SGD_VALOR"  
     SET "DESCRIPCION" = :ls_descripcion,   
         "USUARIO" = :gs_usuario,   
	    "VALOR" = :ls_valor,
         "F_ACTUAL" = sysdate,   
         "PROGRAMA" = :gs_programa  
   WHERE ( "SGD_VALOR"."CODIF" = :ls_codif ) AND  
         ( "SGD_VALOR"."CODIGO" = :ll_codigo ) ;
	 if sqlca.sqlcode<0 then return -1;
	 
   end if 	

					
ll_last_modif=iuo_gen_uo.GetNextModified(ll_last_modif, Primary!)
loop


//////////////////////////
// delete



for ll_counter = 1 to  iuo_gen_uo.deletedcount()
	ll_codigo=iuo_gen_uo.getitemnumber(ll_counter,'codigo',delete!,false)
   ls_valor=iuo_gen_uo.getitemstring(ll_counter,'valor',delete!,false)
	
	   if wf_si_tiene_relaciones_con_tablas(string(ll_codigo),ls_valor,iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false)) then 	
//		 gnv_msg.f_mensaje("EG08",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
      else
		 	  	li_lock_status = gnu_u_transaction.uf_lock &
	 (this, "SGD_VALOR", "CODIGO = " + string(ll_codigo) + " AND CODIF = "+"'"+ls_codif+"'",FALSE)
					
  	    choose case  li_lock_status 
				  case  -54 
			gnv_msg.f_mensaje("EG19",iuo_gen_uo.getitemstring(ll_counter,'descripcion',delete!,false),"",Ok!)
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0	
			delete from SGD_VALOR where CODIF=:ls_codif
			and codigo=:ll_codigo;  		
			
			if sqlca.sqlcode<0 then return -1;
	  end choose  	
	
	  
	  end if
next

return 0

end function

event close;call super::close;long ll_puntero


//ll_puntero=HANDLE(THIS)

//GU_COMUNIC.FNU_CERRAR(This,ll_puntero)


//gu_comunic.fnu_cerrar_hijas(this)

Close(This)

end event

event open;menu me_menu_vent
setpointer(hourglass!)
me_menu_vent = this.menuid
gd_fecha_revision=fgnu_fecha_actual()
if NOT gu_comunic.fnu_cargar_vector_open(THIS,gs_ventana_nombre) then

end if
setnull(gs_ventana_nombre)

string ls_tipo_ventana

iu_comunic = CREATE u_generico_comunicaciones

iu_comunic.is_comunic = gu_comunic.is_comunic

SetPointer(HourGlass!)

gs_programa = 'MAN_TAB_BAS'

SetRedraw(False)

 iuo_gen_uo = CREATE u_man_0000_generico 


CHOOSE CASE iu_comunic.is_comunic.programa_llamante
        
        CASE "anulacion"
			       iuo_motivos = CREATE u_man_motivos_anulacion
                iuo_gen_uo = iuo_motivos
                ls_tipo_ventana = "Mantenimiento"
		  
        CASE "profesion"
                iuo_profesion = CREATE u_man_prof
                iuo_gen_uo = iuo_profesion
                ls_tipo_ventana = "Mantenimiento"
                
                
        CASE "empresa"
                iuo_empresa = CREATE u_man_cont
                iuo_gen_uo = iuo_empresa                
                ls_tipo_ventana = "Mantenimiento"


        CASE "alc_avi" 
                iuo_alc_avi = CREATE u_man_2020_pr_alc_avi
                iuo_gen_uo = iuo_alc_avi // Ale
                ls_tipo_ventana = "Mantenimiento"

   CASE "tip_avi"
      iuo_tip_avi = CREATE u_man_2022_pr_tip_avi
      iuo_gen_uo = iuo_tip_avi
                ls_tipo_ventana = "Mantenimiento"

        CASE "causa_inc"
      iuo_causa_inc = CREATE u_man_2023_pr_causa_inc
                iuo_gen_uo = iuo_causa_inc
                ls_tipo_ventana = "Mantenimiento"

        CASE "incidencia"
      iuo_incidencia = CREATE u_man_2024_pr_incidencia
                iuo_gen_uo = iuo_incidencia

//      CASE "mat_averiado"
//    iuo_mat_averiado = CREATE u_man_2027_pr_mat_averiado
//              iuo_gen_uo = iuo_mat_averiado
//              ls_tipo_ventana = "Mantenimiento"

        CASE "accion"
      iuo_accion = CREATE u_man_2040_pr_accion
                iuo_gen_uo = iuo_accion
                ls_tipo_ventana = "Mantenimiento"

        CASE "est_clima"
      iuo_est_clima = CREATE u_man_2041_pr_est_clima
                iuo_gen_uo = iuo_est_clima
                ls_tipo_ventana = "Mantenimiento"

        CASE "prioridad"
                iuo_prioridad = CREATE u_man_2043_pr_prioridad
                ls_tipo_ventana = "Consulta"
                iuo_gen_uo = iuo_prioridad
                        
        CASE "tip_ins"
                iuo_tip_ins = CREATE u_man_2044_pr_tip_ins 
                iuo_gen_uo = iuo_tip_ins
                ls_tipo_ventana = "Consulta"

        CASE "int_hora"
                iuo_int_hora = CREATE u_man_2045_pr_int_horario
                iuo_gen_uo = iuo_int_hora
                ls_tipo_ventana = "Mantenimiento"

        CASE "problema"
                iuo_problema = CREATE u_man_2047_pr_problema 
                iuo_gen_uo = iuo_problema
                ls_tipo_ventana = "Mantenimiento"

//        CASE "turno"
//                iuo_turno = CREATE u_man_2048_pr_turno
//                iuo_gen_uo = iuo_turno

        CASE "propiedad"
                iuo_propiedad =  CREATE u_man_2042_pr_propiedad
                iuo_gen_uo = iuo_propiedad
                ls_tipo_ventana = "Mantenimiento"

        CASE "materiales"
                iuo_materiales =  CREATE u_man_2049_pr_materiales
                iuo_gen_uo = iuo_materiales
                ls_tipo_ventana = "Mantenimiento"
        
   CASE "tareas"
                iuo_tareas =  CREATE u_man_2050_pr_tareas
                iuo_gen_uo = iuo_tareas
                ls_tipo_ventana = "Mantenimiento"

	//***************************************
	//**  OSGI 2001.1  	18/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
   CASE "tipos_tension"
			  iuo_tipos_tension = CREATE u_man_2051_pr_tipos_tension
			  iuo_gen_uo = iuo_tipos_tension
			  ls_tipo_ventana = "Mantenimiento"

	CASE "agentes"	
			 iuo_agentes = CREATE u_man_2052_pr_agentes
			 iuo_gen_uo  = iuo_agentes
			 ls_tipo_ventana = "Mantenimiento"

	CASE "unidades"	
			 iuo_unidades = CREATE u_man_2052_pr_unidades
			 iuo_gen_uo  = iuo_unidades
			 ls_tipo_ventana = "Mantenimiento"
	//***************************************
	//**  OSGI 2001.1  	18/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	
	// GNU 25-7-2006. Mejora 1/426921
	CASE "descargos"	
		 iuo_descargos = CREATE u_man_2053_pr_descargo
		 iuo_gen_uo  = iuo_descargos
		 ls_tipo_ventana = "Mantenimiento"
	// FIN GNU
	//23/10/2008
	CASE "servicio_ejecutor"
		iuo_serv_ejecutor = CREATE u_man_2050_ocen_ser_ejec
		iuo_gen_uo = iuo_serv_ejecutor
		ls_tipo_ventana = "Mantenimiento"
END CHOOSE

This.OpenUserObject(iuo_gen_uo, 100,50)                                                 // (eluserobj)
iuo_gen_uo.f_posicion()    // Funci$$HEX1$$f300$$ENDHEX$$n que ubica la window 
iuo_gen_uo.f_tamanio_win() // Establece el tama$$HEX1$$f100$$ENDHEX$$o de la window para que se corresponda con la datawindow llamada.
iuo_gen_uo.f_tamanio2()    // Especifica el tama$$HEX1$$f100$$ENDHEX$$o de la datawindow llamada.

This.Title = iuo_gen_uo.f_titulo() // Pone el titulo de la ventana seg$$HEX1$$fa00$$ENDHEX$$n la ventana que se llama.
iuo_gen_uo.f_obtener_registros()
IF iuo_gen_uo.RowCount() = 0 THEN
        iuo_gen_uo.f_insertar_fila()
END IF 


int li_contador

CHOOSE CASE ls_tipo_ventana
        CASE "Mantenimiento"
			if gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_MANTEN')=1 then
                cb_aceptar.Visible      = TRUE
                cb_agregar.Visible      = TRUE
                cb_eliminar.Visible     = TRUE
                cb_cancelar.Visible     = TRUE
					 
					 
				elseif gu_perfiles.of_acceso_perfil(gi_perfil,'TBAS_BASICAS','ACC_CONSULTA')=1 then
                cb_aceptar.Visible      = FALSE
                cb_agregar.Visible      = FALSE
                cb_eliminar.Visible     = FALSE
                cb_cancelar.Visible     = FALSE	 
					 
					 
					iuo_gen_uo.SetRowFocusIndicator(Off!)
					for li_contador = 1 to integer(iuo_gen_uo.object.DataWindow.Column.Count)
						iuo_gen_uo.Modify("#" + string(li_contador) + ".protect = 1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		  				iuo_gen_uo.Modify("#" + string(li_contador) + ".background.color = " + string(rgb(192,192,192)))		
		  				iuo_gen_uo.Modify("#" + string(li_contador) + ".background.color = " + gs_gris)
// Fin. Sgo.
					NEXT
 			else 
				gnv_msg.f_mensaje("AA08","","",OK!)	
//				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Su perfil no est$$HEX2$$e1002000$$ENDHEX$$autorizado a realizar mantenimiento")
				this.f_destruir_objetos()
				close(this)
				return				
			end if

        CASE "Consulta"
                cb_aceptar.Visible      = FALSE
                cb_agregar.Visible      = FALSE
                cb_eliminar.Visible     = FALSE
                cb_cancelar.Visible     = FALSE
					iuo_gen_uo.SetRowFocusIndicator(Off!)
					for li_contador = 1 to integer(iuo_gen_uo.object.DataWindow.Column.Count)
						iuo_gen_uo.Modify("#" + string(li_contador) + ".protect = 1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		  				iuo_gen_uo.Modify("#" + string(li_contador) + ".background.color = " + string(rgb(192,192,192)))		
		  				iuo_gen_uo.Modify("#" + string(li_contador) + ".background.color = " + gs_gris)
// Fin. Sgo.
					NEXT
END CHOOSE


SetRedraw(true)
end event

event closequery;// Declaraci$$HEX1$$f300$$ENDHEX$$n de variables.
integer                 i_changed
datawindow      dw_control
button          bu_botones
long                    ll_acceptext
        
IF ib_no_verifica THEN RETURN
dw_control = iuo_gen_uo // Carga la datawindow correspondiente.
ll_acceptext=dw_control.AcceptText()
i_changed = dw_control.ModifiedCount() + dw_control.DeletedCount()

if i_changed > 0 THEN
        bu_botones = YesNoCancel!
   // mensaje, Existen cambios sin grabar, desea hacerlo
        choose case gnv_msg.f_mensaje("CG01","","",bu_botones)
                case 1
                        This.TriggerEvent("grabar_modificaciones")
                        if il_scan_cambios_ok<0 or il_update_dw_ok<0 then
								Message.ReturnValue = 1
    							end if
                case 3, -1
                        Message.ReturnValue = 1
        end choose
end if

this.f_destruir_objetos()
end event

on w_generica_mant.create
int iCurrent
call super::create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.cb_eliminar=create cb_eliminar
this.cb_agregar=create cb_agregar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_cancelar
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_eliminar
this.Control[iCurrent+4]=this.cb_agregar
end on

on w_generica_mant.destroy
call super::destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.cb_eliminar)
destroy(this.cb_agregar)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_generica_mant
end type

type cb_cancelar from commandbutton within w_generica_mant
integer x = 1678
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
string text = "&Cerrar"
end type

event clicked;setpointer(hourglass!)
ib_no_verifica = TRUE
Close(Parent)
end event

type cb_aceptar from commandbutton within w_generica_mant
integer x = 1143
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
string text = "Ace&ptar"
end type

event clicked;setpointer(hourglass!)
ib_no_verifica = FALSE
w_generica_mant.triggerevent("grabar_modificaciones")
end event

type cb_eliminar from commandbutton within w_generica_mant
integer x = 613
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
string text = "&Eliminar"
end type

event clicked;setpointer(hourglass!)
if iuo_gen_uo.getrow()>0 then 
//	OK
else
	return
end if

w_generica_mant.triggerevent("borrar_registro")
end event

type cb_agregar from commandbutton within w_generica_mant
integer x = 82
integer y = 956
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
int respuesta

if iuo_gen_uo.ModifiedCount()>0 or iuo_gen_uo.DeletedCount()>0 then
	
	        respuesta = gnv_msg.f_mensaje("CG12","","",OkCancel!)
        CHOOSE CASE respuesta
                CASE 2
                        return
                CASE 1
						
						cb_aceptar.triggerevent('clicked') //DBE 16/02/2000   
						if  il_scan_cambios_OK<0 or il_update_dw_OK<0 then return;
						
			END CHOOSE
	
	
end if


w_generica_mant.triggerevent("agregar_registro")
end event


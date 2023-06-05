HA$PBExportHeader$w_mantenimiento_opciones.srw
forward
global type w_mantenimiento_opciones from w_sgigenerica
end type
type cb_aceptar from commandbutton within w_mantenimiento_opciones
end type
type cb_cancelar from commandbutton within w_mantenimiento_opciones
end type
type dw_lista_accesos from datawindow within w_mantenimiento_opciones
end type
type dw_perfil from datawindow within w_mantenimiento_opciones
end type
type dw_lista_opciones from datawindow within w_mantenimiento_opciones
end type
type st_2 from statictext within w_mantenimiento_opciones
end type
type st_3 from statictext within w_mantenimiento_opciones
end type
type gb_1 from groupbox within w_mantenimiento_opciones
end type
end forward

global type w_mantenimiento_opciones from w_sgigenerica
integer x = 329
integer y = 304
integer width = 3063
integer height = 1772
string title = "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Opciones / Accesos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_lista_accesos dw_lista_accesos
dw_perfil dw_perfil
dw_lista_opciones dw_lista_opciones
st_2 st_2
st_3 st_3
gb_1 gb_1
end type
global w_mantenimiento_opciones w_mantenimiento_opciones

type variables
long vector_accesos []
long vector_restricciones []
int li_fila
boolean ib_grabo=true

//NCA-DDAG-1530.29/01/2015.INICIO.
string op_seleccionada
//NCA-DDAG-1530.29/01/2015.FIN.
end variables

forward prototypes
public function integer wf_cargar_vector (integer pi_perfil)
public function integer wf_grabar_perfil (integer pi_perfil)
public function integer wf_nuevo_perfil (integer pi_perfil)
public function integer wf_actualizar_perfiles (integer pi_perfil)
public function integer wf_cargar_vector_restriccion (integer pi_perfil)
public function integer wf_desmarco_sin_acceso (integer pi_perfil)
public function integer wf_desmarcar (long pv_vector_accesos[], integer pi_row, integer pi_fila)
public function integer wf_comprobar_restriccion (long pl_accesos, long pv_vector_restricciones[], integer pi_row)
end prototypes

public function integer wf_cargar_vector (integer pi_perfil);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_cargar_vector 
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Recoge los accesos de las opciones correspondientes al perfil seleccionado y los guarda en el vector. Adem$$HEX1$$e100$$ENDHEX$$s 
//	 Bloquea los registros.
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 21/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_opcion, ls_opcion2, ls_descripcion
int li_perfil
long ll_acceso
int li_contador

long ll_acceso_ambito


// LEEMOS LOS ACCESOS Y A LA VEZ VAMOS BLOQUEANDO


li_contador=0

 DECLARE opcion_perfil CURSOR FOR  
  SELECT "GI_OPCIONES"."OPCION",
  			"GI_OPCIONES"."DESCRIPCION",   
         "GI_OPCIONES_PERFIL"."PERFIL"  
    FROM "GI_OPCIONES_PERFIL", GI_OPCIONES  
   WHERE "GI_OPCIONES_PERFIL"."PERFIL" = :pi_perfil
	AND GI_OPCIONES.OPCION = GI_OPCIONES_PERFIL.OPCION
	ORDER BY DESCRIPCION USING sqlca;


OPEN  opcion_perfil;
FETCH opcion_perfil INTO :ls_opcion, :ls_descripcion,:li_perfil;

DO WHILE sqlca.sqlcode=0
		// BLOQUEAMOS LOS REGISTROS DE GI_OPCIONES_PERFIL
	
	 SELECT "GI_OPCIONES_PERFIL"."ACCESO"  
    INTO :ll_acceso
    FROM "GI_OPCIONES_PERFIL"   
        WHERE ("GI_OPCIONES_PERFIL"."PERFIL" = :li_perfil ) AND OPCION =:ls_opcion;
 	if sqlca.sqlcode=0	then 
//			if ls_opcion<>"AMBITO" then
				li_contador= li_contador + 1
				vector_accesos[li_contador]=ll_acceso
//			else
//					ll_acceso_ambito= ll_Acceso
//			end if
			FETCH opcion_perfil INTO :ls_opcion, :ls_descripcion,:li_perfil;
	end if
LOOP


CLOSE opcion_perfil ;
// GUARDAMOS EN EL ULTIMO EL ACCESO DE AMBITO
//vector_accesos[li_contador + 1]= ll_acceso_ambito
return 1
end function

public function integer wf_grabar_perfil (integer pi_perfil);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_grabar_perfil
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Graba el perfil
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 21/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_opcion, ls_opcion2, ls_descripcion, ls_nombre
int li_perfil
long ll_acceso
int li_contador=0


 DECLARE opcion_perfil CURSOR FOR  
  SELECT "GI_OPCIONES"."OPCION",
  			"GI_OPCIONES"."DESCRIPCION",   
         "GI_OPCIONES_PERFIL"."PERFIL"  
    FROM "GI_OPCIONES_PERFIL", GI_OPCIONES  
   WHERE "GI_OPCIONES_PERFIL"."PERFIL" = :pi_perfil
	AND GI_OPCIONES.OPCION = GI_OPCIONES_PERFIL.OPCION
	ORDER BY DESCRIPCION USING sqlca;


OPEN  opcion_perfil;
FETCH opcion_perfil INTO :ls_opcion, :ls_descripcion,:li_perfil;

DO WHILE sqlca.sqlcode=0
//	if ls_opcion <> "AMBITO" then 
		li_contador= li_contador + 1
		ll_acceso=vector_accesos[li_contador] 
//	else  // Opcion de ambito
//		ll_acceso=vector_accesos[upperbound(vector_accesos)] 
//	
//	end if	
	// GRABAMOS LA MODIFICACION
	
	 
	  UPDATE "GI_OPCIONES_PERFIL"  
     SET "ACCESO" = :ll_acceso 
     WHERE  ( "GI_OPCIONES_PERFIL"."PERFIL" = :li_perfil ) AND OPCION =:ls_opcion USING sqlca ;
	if sqlca.sqlcode=0	then 
			FETCH opcion_perfil INTO :ls_opcion, :ls_descripcion,:li_perfil;
	else
		// ERROR AL GRABAR
		CLOSE opcion_perfil;
		gnu_u_transaction.uf_rollback();
		return 0
	end if
LOOP

CLOSE opcion_perfil ;

// SI ES ALTA GUARDAMOS EL NUEVO NOMBRE DEL PERFIL


if gu_comunic.is_comunic.strval1="ALTA" then
		dw_perfil.accepttext()	
		ls_nombre=dw_perfil.getitemstring(1,"descripcion")
		if isnull(ls_nombre) or  ls_nombre='' then	ls_nombre="SIN ESPECIFICAR"
		
		 UPDATE "GI_PERFILES"  
			  SET "DESCRIPCION" = :ls_nombre  
			WHERE "GI_PERFILES"."PERFIL" = :li_perfil  USING sqlca ;
		if sqlca.sqlcode<>0	then 
					gnu_u_transaction.uf_rollback();
					return 0
		end if
end if

return 1



end function

public function integer wf_nuevo_perfil (integer pi_perfil);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_nuevo_perfil
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Da de alta el nuevo perfil
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 21/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




int li_perfil


li_perfil=pi_perfil
string ls_opcion  
  
    // INTRODUCIMOS EL PERFIL
  
  
  INSERT INTO "GI_PERFILES"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "PERFIL",   
           "DESCRIPCION" )  
  VALUES ( 'OPENSI',   
           sysdate,   
           'MANT_PERFILES',   
           :li_perfil,   
           'Nuevo Perfil' ) USING sqlca ;
			  
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
		return 0
 	end if
	

DECLARE cu_opciones CURSOR FOR  
  SELECT "GI_OPCIONES"."OPCION"  
    FROM "GI_OPCIONES" USING sqlca ;
	
	
   OPEN cu_opciones;
	
	fetch cu_opciones into :ls_opcion;	
	
	DO WHILE sqlca.sqlcode=0
		
		
		
		  INSERT INTO "GI_OPCIONES_PERFIL"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "PERFIL",   
           "OPCION",   
           "ACCESO" )  
  VALUES ( 'OPENSGI',   
           sysdate,   
           'MANT_PERFILES',   
           :li_perfil,   
           :ls_opcion,   
           1 ) USING sqlca ;
			  
			  
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
		return 0
 	end if

	fetch cu_opciones into :ls_opcion;		
				
	LOOP
	
	close cu_opciones;

	

return 1
end function

public function integer wf_actualizar_perfiles (integer pi_perfil);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_actualizar_perfiles
//
//  Argumentos : pi_perfil
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Actualiza las opciones y accesos  de un determinado perfil, en caso de que haya alguna nueva
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 21/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




int li_perfil


li_perfil=pi_perfil
string ls_opcion , ls_accesos
int li_codigo

//BUSCAMOS LAS OPCIONES NO DEFINIDAS EN LAS OPCIONES DEL PERFIL

	
 DECLARE cu_opciones CURSOR FOR  
 SELECT "GI_OPCIONES"."OPCION"  
   FROM "GI_OPCIONES"  
  WHERE "GI_OPCIONES"."OPCION" not in (  SELECT "GI_OPCIONES_PERFIL"."OPCION"  
            FROM "GI_OPCIONES_PERFIL"  
		WHERE "GI_OPCIONES_PERFIL"."PERFIL" = :li_perfil  ) USING sqlca ;

	
	
   OPEN cu_opciones;
	
	fetch cu_opciones into :ls_opcion;	
	
	DO WHILE sqlca.sqlcode=0
		
		
		
		  INSERT INTO "GI_OPCIONES_PERFIL"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "PERFIL",   
           "OPCION",   
           "ACCESO" )  
  VALUES ( 'OPENSGI',   
           sysdate,   
           'MANT_PERFILES',   
           :li_perfil,   
           :ls_opcion,   
           1 ) USING sqlca ;
			  
			  
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_commit();
		return 0
 	end if

	fetch cu_opciones into :ls_opcion;		
				
	LOOP
	
	close cu_opciones;


// Y AHORA LOS ACCESOS	
	
DECLARE cu_accesos CURSOR FOR  
  SELECT "SGD_VALOR"."VALOR",   
         "SGD_VALOR"."CODIGO"  
    FROM "SGD_VALOR"  
   WHERE "SGD_VALOR"."CODIF" = 'T_AC'  AND  "SGD_VALOR"."VALOR" not in ( SELECT ACCESO FROM GI_ACCESO_PERFIL WHERE PERFIL = :pi_perfil) 
ORDER BY "SGD_VALOR"."CODIGO" ASC  USING sqlca ;


	
   OPEN cu_accesos;
	
	fetch cu_accesos into :ls_accesos, :li_codigo;	
	
	DO WHILE sqlca.sqlcode=0
		
		
		
		  INSERT INTO "GI_ACCESO_PERFIL"  
         ( "PERFIL",   
           "ACCESO", 
			  "AGRUPADO",
			  "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA")  
  	VALUES ( :li_perfil,
		      :ls_accesos,   
				0,
			  'OPENSGI',   
           sysdate,   
           'MANT_PERFILES') USING sqlca ;
			  
			  
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
		return 0
 	end if
	fetch cu_accesos into :ls_accesos, :li_codigo;	
					
	LOOP
	
	close cu_accesos;

		

return 1


end function

public function integer wf_cargar_vector_restriccion (integer pi_perfil);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_cargar_vector _restriccion
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Recoge las restricciones de cada usuario.
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Gema Segovia
//
//  Fecha : 22/01/2001	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_opcion, ls_opcion2, ls_descripcion
int li_perfil
long ll_acceso
int li_contador

long ll_acceso_ambito


// LEEMOS LOS ACCESOS Y A LA VEZ VAMOS BLOQUEANDO


li_contador=0

 DECLARE opcion_perfil CURSOR FOR  
  SELECT "GI_OPCIONES"."OPCION",
  			"GI_OPCIONES"."DESCRIPCION"
    FROM "GI_OPCIONES"  
	ORDER BY DESCRIPCION USING sqlca;


OPEN  opcion_perfil;
FETCH opcion_perfil INTO :ls_opcion, :ls_descripcion;

DO WHILE sqlca.sqlcode=0
		// BLOQUEAMOS LOS REGISTROS DE GI_OPCIONES_PERFIL
	
	 SELECT "GI_OPCIONES"."RESTRIC"  
    INTO :ll_acceso
    FROM "GI_OPCIONES"   
        WHERE OPCION =:ls_opcion;
 	if sqlca.sqlcode=0	then 
//			if ls_opcion<>"AMBITO" then
				li_contador= li_contador + 1
				vector_restricciones[li_contador]=ll_acceso
//			else
//					ll_acceso_ambito= ll_Acceso
//			end if
			FETCH opcion_perfil INTO :ls_opcion, :ls_descripcion;
	
	end if
LOOP


CLOSE opcion_perfil ;
// GUARDAMOS EN EL ULTIMO EL ACCESO DE AMBITO
//vector_restricciones[li_contador + 1]= ll_acceso_ambito
return 1
end function

public function integer wf_desmarco_sin_acceso (integer pi_perfil);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_actualizar_perfiles
//
//  Argumentos : pi_perfil
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Actualiza las opciones y accesos  de un determinado perfil, en caso de que haya alguna nueva
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 21/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




int li_perfil


li_perfil=pi_perfil
string ls_opcion , ls_accesos
int li_codigo

//BUSCAMOS LAS OPCIONES NO DEFINIDAS EN LAS OPCIONES DEL PERFIL

	
 DECLARE cu_opciones CURSOR FOR  
 SELECT "GI_OPCIONES"."OPCION"  
   FROM "GI_OPCIONES"  
  WHERE "GI_OPCIONES"."OPCION" not in (  SELECT "GI_OPCIONES_PERFIL"."OPCION"  
            FROM "GI_OPCIONES_PERFIL"  
		WHERE "GI_OPCIONES_PERFIL"."PERFIL" = :li_perfil  ) USING sqlca ;

	
	
   OPEN cu_opciones;
	
	fetch cu_opciones into :ls_opcion;	
	
	DO WHILE sqlca.sqlcode=0
		
		
		
		  INSERT INTO "GI_OPCIONES_PERFIL"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "PERFIL",   
           "OPCION",   
           "ACCESO" )  
  VALUES ( 'OPENSGI',   
           sysdate,   
           'MANT_PERFILES',   
           :li_perfil,   
           :ls_opcion,   
           1 ) USING sqlca ;
			  
			  
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
		return 0
 	end if

	fetch cu_opciones into :ls_opcion;		
				
	LOOP
	
	close cu_opciones;


// Y AHORA LOS ACCESOS	
	
DECLARE cu_accesos CURSOR FOR  
  SELECT "SGD_VALOR"."VALOR",   
         "SGD_VALOR"."CODIGO"  
    FROM "SGD_VALOR"  
   WHERE "SGD_VALOR"."CODIF" = 'T_AC'  AND  "SGD_VALOR"."VALOR" not in ( SELECT ACCESO FROM GI_ACCESO_PERFIL WHERE PERFIL = :pi_perfil) 
ORDER BY "SGD_VALOR"."CODIGO" ASC  USING sqlca ;


	
   OPEN cu_accesos;
	
	fetch cu_accesos into :ls_accesos, :li_codigo;	
	
	DO WHILE sqlca.sqlcode=0
		
		
		
		  INSERT INTO "GI_ACCESO_PERFIL"  
         ( "PERFIL",   
           "ACCESO", 
			  "AGRUPADO",
			  "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA")  
  	VALUES ( :li_perfil,
		      :ls_accesos,   
				0,
			  'OPENSGI',   
           sysdate,   
           'MANT_PERFILES') USING sqlca ;
			  
			  
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
		return 0
 	end if
	fetch cu_accesos into :ls_accesos, :li_codigo;	
					
	LOOP
	
	close cu_accesos;

		

return 1


end function

public function integer wf_desmarcar (long pv_vector_accesos[], integer pi_row, integer pi_fila);long ll_acceso, ll_restriccion
    
if pi_row=1 then    
	// Controlo las opciones que estan checkeadas
	ll_acceso=pv_vector_accesos[pi_fila]	
	ll_restriccion = 511 - ll_acceso
else
	ll_restriccion = 0
end if

return ll_restriccion
end function

public function integer wf_comprobar_restriccion (long pl_accesos, long pv_vector_restricciones[], integer pi_row);long  ll_restriccion, ll_Accesos
int li_indice
string ls_binario_accesos, ls_binario_restricciones

ll_accesos = pl_accesos
ll_restriccion=pv_vector_restricciones[pi_row]

ls_binario_accesos = ''
ls_binario_restricciones = ''
FOR li_indice = 1 TO dw_lista_accesos.RowCount()
	ls_binario_Accesos = ls_binario_accesos + string(mod(ll_Accesos,2))
	ls_binario_restricciones = ls_binario_restricciones + string( mod(ll_restriccion,2)) 
   ll_restriccion = truncate(ll_restriccion / 2,0)
   ll_Accesos = truncate(ll_accesos / 2,0)
NEXT

string ls_chequeado, ls_visible
FOR li_indice = 1 TO dw_lista_accesos.RowCount()
	ls_visible = mid(ls_binario_restricciones,li_indice,1)
	ls_chequeado = mid(ls_binario_Accesos,li_indice,1)
	IF ls_chequeado = '1' AND ls_visible = '0' THEN
	   return 1
	END IF
NEXT

Return 0
end function

on w_mantenimiento_opciones.create
int iCurrent
call super::create
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_lista_accesos=create dw_lista_accesos
this.dw_perfil=create dw_perfil
this.dw_lista_opciones=create dw_lista_opciones
this.st_2=create st_2
this.st_3=create st_3
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_aceptar
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.dw_lista_accesos
this.Control[iCurrent+4]=this.dw_perfil
this.Control[iCurrent+5]=this.dw_lista_opciones
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.gb_1
end on

on w_mantenimiento_opciones.destroy
call super::destroy
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_lista_accesos)
destroy(this.dw_perfil)
destroy(this.dw_lista_opciones)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.gb_1)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : open
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Carga los valores de la datawindow y habilita / deshabilita los botones dependiendo del perfil 	
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 17/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_perfil
int li_contador
int li_retorno
string ls_modif
setpointer(hourglass!)


li_perfil=gu_comunic.is_comunic.intval1;
ls_modif=gu_comunic.is_comunic.strval1;


// 


// SI ES ALTA

if ls_modif="ALTA" then
  if wf_nuevo_perfil(li_perfil)<>1  then 
		gnv_msg.f_mensaje("EG39","","",Ok!)		
	   // messagebox("Aviso","No se pudo dar de alta el nuevo perfil")
		close(this)
		return
	end if
	dw_perfil.enabled=true
	dw_perfil.object.descripcion.background.color=gs_blanco
	dw_perfil.object.descripcion.border=1
end if


// EN AMBOS CASOS ALTA Y MODIFICACION SE DEBEN ACTUALIZAR LAS OPCIONES Y ACCESOS  NUEVOS


 if wf_actualizar_perfiles(li_perfil)<>1  then 
		gnv_msg.f_mensaje("EG40","","",Ok!)		
		//messagebox("Aviso","No se pudo actualizar las nuevas opciones para el  nuevo perfil")
		close(this)
		return
	end if

li_retorno = wf_cargar_vector(li_perfil)
if li_retorno <>1 then  // ALGUN ERROR
	if li_retorno=0 then // 
		gnv_msg.f_mensaje("EG19","","",Ok!)		
   //   messagebox("Aviso","Perfil ya bloqueado por otro usuario")
 	else
		gnv_msg.f_mensaje("EG41","","",Ok!)		
//		messagebox("Aviso","Error en la carga de perfiles")
	end if	
	close(this)
	return
end if

// Carga el vector con las restricciones de cada usuario GSE 22/01/2001
li_retorno = wf_cargar_vector_restriccion(li_perfil)
if li_retorno <>1 then  // ALGUN ERROR
	if li_retorno=0 then // 
		gnv_msg.f_mensaje("EG19","","",Ok!)		
 	else
		gnv_msg.f_mensaje("EG41","","",Ok!)		
	end if	
	close(this)
	return
end if


// guardar datos del nuevo perfil
if ls_modif="ALTA" then
	gnu_u_transaction.uf_commit();	
end if
// CARGAMOS LA LISTA DE ACCESOS


dw_lista_accesos.SetTransObject(sqlca)
dw_lista_accesos.retrieve(li_perfil)
if dw_lista_accesos.rowcount()=0 then
	gnv_msg.f_mensaje("EG42","","",Ok!)		
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Perfil mal definido")
	close(this)
	return
end if

// CARGAMOS LA LISTA DE OPCIONES

dw_lista_opciones.SetTransObject(sqlca)
dw_lista_opciones.retrieve(li_perfil)

// CARGAMOS EL NOMBRE DEL PERFIL

dw_perfil.SetTransObject(sqlca)
dw_perfil.retrieve(li_perfil)

// No Hay registros
if dw_lista_opciones.rowcount()=0 then
	gnv_msg.f_mensaje("EG42","","",Ok!)		
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Perfil mal definido")
	close(this)
	return
end if
dw_lista_opciones.ScrollToRow(1)
dw_lista_opciones.selectrow(0,False)
dw_lista_opciones.selectrow(1,true)

if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN") =  0 then // CONSULTA
	cb_aceptar.enabled=false
	dw_lista_accesos.object.marca.protect=1
	dw_lista_accesos.object.icono2.protect=1
	for li_contador=1 to dw_lista_accesos.rowcount()
		dw_lista_accesos.object.color_fondo[li_contador]="0"
	next 
	
end if


end event

event closequery;call super::closequery;int li_Respuesta

IF ib_grabo THEN
	li_respuesta = Messagebox("Atencion","$$HEX1$$bf00$$ENDHEX$$Desea salvar los cambios?",Question!,YesNo!)
	IF li_respuesta = 1 THEN
		cb_aceptar.triggerevent(Clicked!)
	ELSE
		cb_cancelar.triggerevent(Clicked!)
	END IF
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mantenimiento_opciones
end type

type cb_aceptar from commandbutton within w_mantenimiento_opciones
integer x = 1865
integer y = 1476
integer width = 320
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;int li_perfil
li_perfil=gu_comunic.is_comunic.intval1;
dw_lista_accesos.Update()
if wf_grabar_perfil(li_perfil)=1 then
	//commit;
end if

ib_grabo = false
close(parent)
end event

type cb_cancelar from commandbutton within w_mantenimiento_opciones
integer x = 2386
integer y = 1476
integer width = 320
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;int li_perfil
string ls_modif
li_perfil=gu_comunic.is_comunic.intval1;
ls_modif=gu_comunic.is_comunic.strval1;
if ls_modif="ALTA" then 
  DELETE FROM "GI_PERFILES"  
  WHERE "GI_PERFILES"."PERFIL" = :li_perfil;
gnu_u_transaction.uf_commit();
gu_comunic.is_comunic.strval1="NADA"
else
	gnu_u_transaction.uf_rollback();
end if
ib_grabo = false
close(parent)
end event

type dw_lista_accesos from datawindow within w_mantenimiento_opciones
string tag = "                             "
integer x = 1600
integer y = 436
integer width = 1353
integer height = 936
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_lista_accesos"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;
string ls_binario
int li_valor

int li_contador, li_restriccion,li_acceso
string ls_digito
long ll_acceso
int li_fila_ambito
int li_agrupado

li_agrupado=this.getitemnumber(row,"agrupado")
li_fila_ambito=upperbound(vector_accesos)

////Para el caso que deseleccione la opcion sin acceso, teniendo en cuenta las restricciones
//if wf_desmarcar(vector_accesos[],row,li_fila)>0 THEN
//	vector_accesos[li_fila_ambito] = wf_desmarcar(vector_accesos[],row,li_fila)
//end if

if row=1 and dwo.name="marca" then  // SIN ACCESO
	if data="1" then  // CHEQUEO
//		vector_accesos[li_fila] = 1
//		this.object.marca[row]="1"
//		for li_contador=2 to this.rowcount()
//			setrow(li_contador)
//			this.object.marca[li_contador]="0"
//		next

		this.object.marca[row]="1"
		this.object.marca[2]="0"
		this.object.marca[3]="0"
		
		ls_binario=''
		ll_acceso=vector_accesos[li_fila]
		//PASAMOS A BINARIO
		DO WHILE ll_acceso > 0
			ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
			ll_acceso = truncate(ll_acceso / 2,0)
		LOOP
	
		if mid(ls_binario, 1, 1) = '0' then
			vector_accesos[li_fila] = vector_accesos[li_fila] + 1
		end if
		
		if mid(ls_binario, 2, 1) = '1' then
			vector_accesos[li_fila] = vector_accesos[li_fila] - 2 ^ ( 2 - 1 )
		end if

		if mid(ls_binario, 3, 1) = '1' then
			vector_accesos[li_fila] = vector_accesos[li_fila] - 2 ^ ( 3 - 1 )
		end if

	else //DESCHEQUEO
		if vector_accesos[li_fila_ambito]>1 then 
			if (li_agrupado=0)  and  dwo.name="marca" then 
				li_Acceso = wf_comprobar_restriccion(vector_accesos[upperbound(vector_accesos)],vector_restricciones[],li_fila)
				if li_acceso = 1 THEN				
					//vector_accesos[li_fila] = vector_Accesos[li_fila] + 2 ^ ( row -1 )
					vector_accesos[li_fila] =  vector_accesos[li_fila_ambito]					
				else
					vector_accesos[li_fila] = 1
					this.object.marca[row]="1"
					return 2
				end if
			else
				vector_accesos[li_fila] = 1
				this.object.marca[row]="1"
				return 2
			end if
			
 		else // NO EXISTE GLOBAL
			
 			vector_accesos[li_fila] = 1
	   	this.object.marca[row]="1"
			return 2
		end if	
		
	end if
// AL CHEQUEAR O DESCHEQUEAR  OTRO ACCESO QUE NO SEAN LOS DE AMBITOm O GENERALES
elseif (li_agrupado=0)  and  dwo.name="marca" then 
		if  data="1" then  // CHEQUEAMOS UNO NUEVO
						// COMPRUEBA SI ESTA CHEQUEADO "SIN ACCESO"
						
//			if this.object.marca[1]="1" then 
//				// LO DESCHEQUEA
//				vector_accesos[li_fila] = 2 ^ ( row -1 )
//				this.object.marca[1]="0"
//				if vector_accesos[li_fila_ambito]>1 then 
//					vector_accesos[li_fila] = vector_Accesos[li_fila] + vector_accesos[li_fila_ambito]
//			   end if	
//			
//			else
//				vector_accesos[li_fila] = vector_Accesos[li_fila] + 2 ^ ( row -1 )				
//			end if	

			if this.object.marca[1]="1" and row <= 3 then 
				this.object.marca[1]="0"
				vector_accesos[li_fila] --
			end if
			
			vector_accesos[li_fila] = vector_Accesos[li_fila] + 2 ^ ( row -1 )
															
		else // DESCHEQUEAMOS 
			vector_accesos[li_fila] = vector_Accesos[li_fila] - 2 ^ ( row -1 )
			if (row = 2 and this.object.marca[3]="0" and this.object.marca[1]="0") or &
				(row = 3 and this.object.marca[2]="0" and this.object.marca[1]="0") then

				this.object.marca[1]="1"
				vector_accesos[li_fila] ++
			end if
				
//			if vector_accesos[li_fila]=0 or vector_accesos[li_fila]=vector_accesos[li_fila_ambito] then  // NO TIENE NADA CHEQUEADO
//				this.object.marca[1]="1"
//				vector_Accesos[li_fila]=1
//
//			end if
		end if

// CHEQUEO DE AMBITO

elseif (li_agrupado=1)  and  dwo.name="marca" then 
		if  data="1" then  // CHEQUEAMOS UNO NUEVO
						// COMPRUEBA SI ESTA CHEQUEADO "SIN ACCESO"
						if this.object.marca[1]="1" then 
							// LO DESCHEQUEA
							this.object.marca[1]="0"
						end if	
						if  vector_accesos[li_fila_ambito]=1 then // SIN ACCESO
							vector_accesos[li_fila_ambito]= 2 ^ ( row -1 )	
						else
							// DEBEMOS COMPROBAR QUE NO ESTA CHEQUEADO PARA OTRA OPCION
							
							ls_binario=''
							ll_acceso=vector_accesos[li_fila_ambito]
							//PASAMOS A BINARIO
							DO WHILE ll_acceso > 0
								ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
								ll_acceso = truncate(ll_acceso / 2,0)
							LOOP
							li_valor=integer(mid(ls_binario,row,1))

							if li_valor<>1 then // NO ESTABA MARCADO ---> LO  MARCAMOS
								vector_accesos[li_fila_ambito]= vector_Accesos[li_fila_ambito] + 2 ^ ( row -1 )	
							end if
						end if
						
						for li_contador=1 to dw_lista_opciones.rowcount()
//							 //li_restriccion = wf_comprobar_restriccion(vector_accesos[],vector_restricciones[],li_fila,li_contador,li_fila_ambito)
//							 if vector_accesos[li_contador]=1 then // SIN ACCESO
//									  if li_contador=li_fila then // SOLO PARA LA FILA ACTUAL
//											if vector_accesos[li_fila_ambito]>1 then 
//												vector_accesos[li_fila] =  vector_accesos[li_fila_ambito]
//											end if	
//										end if
//							elseif li_valor<>1 then  // NO ESTABA MARCADO ANTES
//									vector_accesos[li_contador]= vector_Accesos[li_contador] + 2 ^ ( row -1 )		
//							end if
							ls_binario=''
							ll_acceso=vector_accesos[li_contador]
							//PASAMOS A BINARIO
							DO WHILE ll_acceso > 0
								ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
								ll_acceso = truncate(ll_acceso / 2,0)
							LOOP
							IF integer(mid(ls_binario,row,1)) = 0 THEN
								IF integer(mid(ls_binario,1,1)) = 1 and (row = 2 or row = 3) THEN
									vector_accesos[li_contador] --
								END IF
								vector_accesos[li_contador]= vector_Accesos[li_contador] + 2 ^ ( row -1 )		
							END IF
					   next	
													
		else // DESCHEQUEAMOS 
			vector_accesos[li_fila_ambito]= vector_Accesos[li_fila_ambito] - 2 ^ ( row -1 )	
			if vector_accesos[li_fila_ambito]=0 then vector_accesos[li_fila_ambito]=1
			 for li_contador=1 to dw_lista_opciones.rowcount()
				IF  vector_accesos[li_contador]<>1  then 
					//vector_accesos[li_contador] = vector_Accesos[li_contador] - 2 ^ ( row -1 )
					ls_binario=''
					ll_acceso=vector_accesos[li_contador]
					//PASAMOS A BINARIO
					DO WHILE ll_acceso > 0
						ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
						ll_acceso = truncate(ll_acceso / 2,0)
					LOOP
					IF integer(mid(ls_binario,row,1)) = 1 THEN
						vector_accesos[li_contador]= vector_Accesos[li_contador] - 2 ^ ( row -1 )		
					END IF

				END IF
				if vector_Accesos[li_contador]=0 OR wf_comprobar_restriccion(vector_accesos[li_contador],vector_restricciones[],li_contador) = 0 then 
					vector_Accesos[li_contador]=1
				end if
			 next	
//					if vector_accesos[li_fila] = 1 then  // NO TIENE NADA CHEQUEADO
//						this.object.marca[1]="1"
//					end if
		end if
end if 


  


	ls_binario=''
	ll_acceso=vector_accesos[li_fila]
	DO WHILE ll_acceso > 0
		ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
		ll_acceso = truncate(ll_acceso / 2,0)
	LOOP

	
	for li_contador=1 to dw_lista_accesos.rowcount()
		li_valor=integer(mid(ls_binario,li_contador,1))
	    dw_lista_accesos.setitem(li_contador,"marca",string(li_valor))
	next









end event

event getfocus;//st_2.backcolor=long(0)
//st_2.textcolor=long(79741120)


end event

event losefocus;//st_2.backcolor=long(276856960)
//st_2.textcolor=long(79741120)


end event

event clicked;string  ls_valor, ls_binario
long ll_acceso
int li_agrupado, li_contador, li_fila_ambito

if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN") =  1 then 
	if row>3 then 
		li_agrupado = dw_lista_accesos.getitemnumber(row,"agrupado")
		li_fila_ambito=upperbound(vector_accesos)
		ls_valor=dw_lista_accesos.getitemstring(row,"marca")
		if ls_valor<>"1" then 
			if dwo.name="icono2" then 
				 if li_agrupado = 1 then  // agrupado
					 dw_lista_accesos.setitem(row,"agrupado",0)
				 else
					 dw_lista_accesos.setitem(row,"agrupado",1)
					 //se debe comprobar si existe marcada en otra opcion
						
					 for li_contador=1 to dw_lista_opciones.rowcount()
						  ll_acceso= vector_accesos[li_contador]
						  ls_binario=''
						  DO WHILE ll_acceso > 0
							  ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
							  ll_acceso = truncate(ll_acceso / 2,0)
						  LOOP
			
						  if integer(mid(ls_binario,row,1))=1 then 
							  // SI ESTA MARCADO  EN OTRA OPCION SE BORRA
							  IF  vector_accesos[li_contador]<>1  then vector_accesos[li_contador] = vector_Accesos[li_contador] - 2 ^ ( row -1 )
							     IF vector_Accesos[li_contador]=0 then vector_Accesos[li_contador]=1
 						  end if
     				 next	
															
				end if
			end if
				
			dw_lista_accesos.accepttext()
		end if
	end if
end if
end event

type dw_perfil from datawindow within w_mantenimiento_opciones
integer x = 1723
integer y = 152
integer width = 1115
integer height = 136
integer taborder = 20
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_descripcion_perfil"
boolean border = false
boolean livescroll = true
end type

event getfocus;//st_1.backcolor=long(0)
//st_1.textcolor=long(79741120)


end event

event losefocus;//st_1.backcolor=long(276856960)
//st_1.textcolor=long(79741120)
//
end event

type dw_lista_opciones from datawindow within w_mantenimiento_opciones
event ue_key_down pbm_dwnkey
integer x = 73
integer y = 128
integer width = 1467
integer height = 1392
integer taborder = 10
string dataobject = "d_lista_opciones"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event ue_key_down;/////////////////////////////////////////////////////
//      Permite borrar o agregar incidencias desde el teclado
//      dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row 

IF keyflags = 0 THEN  // Controlo que no haya presionado
                                                        // control ni shift
			this.setredraw(false)																		  
        ll_row = This.Getselectedrow(0)
        
        IF key = KeyUpArrow! and ll_row > 1 THEN
//                this.ScrollToRow(ll_row - 1)
                this.selectrow(0,False)
                this.selectrow(ll_row - 1,true)
					 //this.setrow(ll_row - 1)		 
					 
					 
					 
					 
					 
        ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
//                this.ScrollToRow(ll_row - 1)
                this.selectrow(0,False)
                this.selectrow(ll_row + 1,true)
//	 				 this.setrow(ll_row + 1)		 
        END IF
			this.setredraw(true)
END IF

end event

event clicked;if row > 0 then 
	this.setredraw(false)
	This.SelectRow(0, FALSE)
	dw_lista_opciones.selectrow(row,true)
	//NCA-DDAG-1530.29/01/2015.INICIO.
	op_seleccionada = dw_lista_opciones.GetItemString(row, 'descripcion')
	//NCA-DDAG-1530.29/01/2015.FIN.
	This.Setrow(row)
	this.setredraw(true)
end if
end event

event rowfocuschanged;string ls_opcion, ls_binario
long ll_acceso, ll_restriccion
integer li_perfil, li_contador, li_valor

dw_lista_accesos.SetRedraw(FALSE)
if currentrow>0 then    
	// Controlo las opciones que estan checkeadas
	li_fila= currentrow
	ll_acceso=vector_accesos[currentrow]		
	ll_restriccion=vector_restricciones[currentrow]
		
	ls_binario=''
	DO WHILE ll_restriccion > 0
		ls_binario =   ls_binario + string( mod(ll_restriccion,2)) 
		ll_restriccion = truncate(ll_restriccion / 2,0)
	LOOP
	
	//NCA-DDAG-1530.29/01/2015.INICIO.Establecemos este numero binario para que solo aparezca la opcion sin acceso.	
	If (op_seleccionada = 'Quitar Interfaz OOP') Then 
			ls_binario='0111111111'	
	End If 		
	//NCA-DDAG-1530.29/01/2015.FIN.
		

	// Dependiendo de los permisos del usuario tendr$$HEX2$$e1002000$$ENDHEX$$accesos 
	// a unas opciones u otras, para las que no tenga acceso
	// no ser$$HEX1$$e100$$ENDHEX$$n visibles
	for li_contador=1 to dw_lista_accesos.rowcount()
		li_valor=integer(mid(ls_binario,li_contador,1))
		dw_lista_accesos.setitem(li_contador,"color_fondo",string(li_valor))
		dw_lista_accesos.setitem(li_contador,"icono2",string(li_valor))
		dw_lista_accesos.setitem(li_contador,"icono",string(li_valor))
	next
	
	//	 Pasamos el numero a binario
	
	ls_binario=''
	DO WHILE ll_acceso > 0
		ls_binario =   ls_binario + string( mod(ll_acceso,2)) 
		ll_acceso = truncate(ll_acceso / 2,0)
	LOOP

	
	for li_contador=1 to dw_lista_accesos.rowcount()
		li_valor=integer(mid(ls_binario,li_contador,1))
	    dw_lista_accesos.setitem(li_contador,"marca",string(li_valor))
	next
	dw_lista_accesos.accepttext()
end if
dw_lista_accesos.SetRedraw(true)
end event

event getfocus;//st_3.backcolor=long(0)
//st_3.textcolor=long(79741120)
//

end event

event losefocus;//st_3.backcolor=long(276856960)
//st_3.textcolor=long(79741120)


end event

type st_2 from statictext within w_mantenimiento_opciones
integer x = 1600
integer y = 360
integer width = 1353
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 8421504
string text = "Accesos"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;dw_lista_accesos.setfocus()
end event

type st_3 from statictext within w_mantenimiento_opciones
integer x = 73
integer y = 56
integer width = 1463
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 79741120
long backcolor = 8421504
string text = "Opciones"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;dw_lista_opciones.setfocus()
end event

type gb_1 from groupbox within w_mantenimiento_opciones
integer x = 1600
integer y = 64
integer width = 1353
integer height = 256
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Perfil"
end type


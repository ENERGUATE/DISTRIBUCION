HA$PBExportHeader$u_perfil.sru
forward
global type u_perfil from nonvisualobject
end type
end forward

global type u_perfil from nonvisualobject
end type
global u_perfil u_perfil

type prototypes
function  int SHA1Codifica( string  clave, ref string clave_cifrada)    Library "sha1_obdis.dll" Alias for "_SHA1Codifica@8;Ansi" 
end prototypes

type variables
datastore ids_opciones_perfil
datastore ids_restricciones_perfil
end variables

forward prototypes
public subroutine of_recupera_datos_perfil (integer pi_perfil)
public function integer of_chequea_acceso (string ps_acceso, long pl_codigo_acceso)
public function long of_acceso_perfil (integer pi_perfil, string ps_opcion, string ps_acceso)
public subroutine of_cifra_clave (string ps_clave_original, ref string ps_clave_cifrada)
public function string of_obtener_tension (string ps_opcion)
public function string of_nivel_tension (string ps_opcion)
public function long of_acceso_restriccion (string ps_opcion, string ps_acceso)
end prototypes

public subroutine of_recupera_datos_perfil (integer pi_perfil);ids_opciones_perfil.Retrieve(pi_perfil)
ids_restricciones_perfil.Retrieve()
end subroutine

public function integer of_chequea_acceso (string ps_acceso, long pl_codigo_acceso);/////////////////////////////////////////////
//
//	Funcion : of_chequea_acceso
//	
//	Devuelve 1 si el acceso "ps_acceso" se encuentra entre los accesos definidos en "pl_codigo_acceso"
//	Los tipos de acceso estan definidos en SGD_VALOR
//
//	Autor		Fecha				Actuacion
//--------	-------			--------------
//	ACO		09/12/1999		Creacion
//////////////////////////////////////////////////

// Obtenemos la posicion del acceso solicitado
int li_posicion
int li_resto
string  ls_binario

  SELECT "SGD_VALOR"."CODIGO"  
    INTO :li_posicion  
    FROM "SGD_VALOR"  
   WHERE ( "SGD_VALOR"."CODIF" = 'T_AC' ) AND  
         ( "SGD_VALOR"."VALOR" = :ps_acceso )   ;

if sqlca.sqlcode<>0 then 
	  return 0 // NO SE ENCUENTRA
end if

// Pasamos el numero a binario

ls_binario=''
DO WHILE pl_codigo_acceso > 0
	ls_binario =   ls_binario + string( mod(pl_codigo_acceso ,2)) 
	pl_codigo_acceso = truncate(pl_codigo_acceso / 2,0)
LOOP


if len(ls_binario)<li_posicion +1 then 
	return 0 // No se encuentra
	
else 
	return integer(mid(ls_binario,li_posicion + 1,1))
end if
	





return 1
end function

public function long of_acceso_perfil (integer pi_perfil, string ps_opcion, string ps_acceso);/////////////////////////////////////////////
//
//	Funcion : of_acceso_perfil
//	
//	Retorna un codigo de acceso a una opcion de la aplicacion
//	pasada como parametro para un perfil determinado
//	Los tipos de acceso estan definidos en SGD_VALOR
//
//	Autor		Fecha				Actuacion
//--------	-------			--------------
//	AFE		14/10/1999		Creacion
// ACO      09/12/1999     Modificacion
//////////////////////////////////////////////////

// Definicion de variables
long ll_fila, ll_total_filas
long  ll_tipo_acceso
string ls_condicion

// Inicio del codigo

// Busco la fila en la dw que tiene las opciones para cada perfil
ll_total_filas = ids_opciones_perfil.RowCount()
ls_condicion = "perfil=" + string(pi_perfil) + " and opcion='" + ps_opcion + "'"
ll_fila = ids_opciones_perfil.Find(ls_condicion, 1, ll_total_filas)

IF ll_fila < 0 THEN  // NO SE ENCUENTRA LA OPCION
	ll_tipo_acceso = -1
	return 0
ELSEIF ll_fila = 0 THEN // NO SE ENCUENTRA LA OPCION
	ll_tipo_acceso = 0 
	return 0
ELSE 
	ll_tipo_acceso =ids_opciones_perfil.Object.acceso[ll_fila]
END IF

if len(ps_acceso)=0 then // QUIERE RECUPERAR  EL CODIGO DE ACCESO
	Return ll_tipo_acceso	
else // Necesita verificar si el perfil tiene el acceso solicitado
	return of_chequea_acceso(ps_acceso,ll_tipo_acceso)
end if



end function

public subroutine of_cifra_clave (string ps_clave_original, ref string ps_clave_cifrada);int li_contador

ps_clave_cifrada = space(40)

if NOT isnull(ps_clave_original)  then
	SHA1Codifica(ps_clave_original, ps_clave_cifrada)
end if





//for li_contador=1 to len(ps_clave_original)
//	
//	ps_clave_cifrada= char(mod(asc (mid(ps_clave_original, li_contador,1 )) + 10 + li_contador, 256))   +  ps_clave_cifrada
//	
//next 
//


end subroutine

public function string of_obtener_tension (string ps_opcion);string ls_tension

	if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1 and  &
		gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 and  &
		gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
		   //todos
			ls_tension = '0'
//			li_tension=fgci_todos
	ELSE
		IF gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1  THEN
		   //alta
			ls_tension = '1,2'
//		li_tension= fgci_alta_tension
		end if
		IF	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 then 
			//media
			ls_tension = '3,4,5'
//			li_tension= fgci_media_tension
		end if
		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
			//baja
			ls_tension = '6,7,8'
//			li_tension= fgci_baja_tension
		end if	
   	if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1 and  &
	   	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 then
			//alta media
			ls_tension = '1,2,3,4,5'
		end if
		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1 and  &
 	   	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
			//alta baja
			ls_tension = '1,2,6,7,8'
		end if
  		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 and  &
	   	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
			//media baja
			ls_tension = '3,4,5,6,7,8'
		end if
		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 0 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 0 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 0 THEN
			//no permite ninguno
			ls_tension = ','
		end if
	
	end if
return ls_tension
end function

public function string of_nivel_tension (string ps_opcion);string ls_tension

	if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1 and  &
		gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 and  &
		gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
		   //todos
			ls_tension = '0'
//			ls_tension=fgci_todos
	ELSE
		IF gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1  THEN
		   //alta
			ls_tension = '1'
//		ls_tension= fgci_alta_tension
		end if
		IF	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 then 
			//media
			ls_tension = '2'
//			ls_tension= fgci_media_tension
		end if
		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
			//baja
			ls_tension = '3'
//			ls_tension= fgci_baja_tension
		end if	
   	if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1 and  &
	   	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 then
			//alta media
			ls_tension = '1,2'
		end if
		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 1 and  &
 	   	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
			//alta baja
			ls_tension = '1,3'
		end if
  		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 1 and  &
	   	gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 1  THEN
			//media baja
			ls_tension = '2,3'
		end if
		if gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_ALTA")= 0 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_MEDIA")= 0 and  &
			gu_perfiles.of_acceso_perfil(gi_perfil,ps_opcion,"ACC_BAJA")= 0 THEN
			//no permite ninguno
			ls_tension = ','
		end if
	
	end if
return ls_tension
end function

public function long of_acceso_restriccion (string ps_opcion, string ps_acceso);/////////////////////////////////////////////
//
//	Funcion : of_acceso_restriccion
//	
//	Retorna un codigo de restriccion de opcion de la 
// aplicacion pasada como parametro para un perfil 
// determinado
//	Los tipos de restriccion estan definidos en SGD_VALOR
//
//	Autor		Fecha				Actuacion
//--------	-------			--------------
//	GSE		22/01/2001			Creacion
//////////////////////////////////////////////////

// Definicion de variables
long ll_fila, ll_total_filas
long  ll_tipo_acceso
string ls_condicion

// Inicio del codigo

// Busco la fila en la dw que tiene las opciones para cada perfil
ll_total_filas = ids_restricciones_perfil.RowCount()
ls_condicion = "opcion='" + ps_opcion + "'"
ll_fila = ids_restricciones_perfil.Find(ls_condicion, 1, ll_total_filas)

IF ll_fila < 0 THEN  // NO SE ENCUENTRA LA OPCION
	ll_tipo_acceso = -1
	return 0
ELSEIF ll_fila = 0 THEN // NO SE ENCUENTRA LA OPCION
	ll_tipo_acceso = 0 
	return 0
ELSE 
	ll_tipo_acceso =ids_restricciones_perfil.Object.restric[ll_fila]
END IF

if len(ps_acceso)=0 then // QUIERE RECUPERAR  EL CODIGO DE ACCESO
	Return ll_tipo_acceso	
else // Necesita verificar si el perfil tiene el acceso solicitado
	return of_chequea_acceso(ps_acceso,ll_tipo_acceso)
end if
end function

on u_perfil.create
TriggerEvent( this, "constructor" )
end on

on u_perfil.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;//	Recupero las opciones a que tiene acceso cada perfil
// Esta dw es accedida por la funcion fg_tiene_perfil para retornar
// el tipo de acceso que tiene el perfil del usuario
ids_opciones_perfil = Create Datastore
ids_opciones_perfil.DataObject = 'd_opciones_perfil'
ids_opciones_perfil.SetTransObject(sqlca)

ids_restricciones_perfil = Create Datastore
ids_restricciones_perfil.DataObject = 'd_restricciones_perfil'
ids_restricciones_perfil.SetTransObject(sqlca)
end event

event destructor;destroy ids_opciones_perfil
destroy ids_restricciones_perfil
end event


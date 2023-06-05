HA$PBExportHeader$uo_arbol_activos.sru
forward
global type uo_arbol_activos from uo_man_instalac
end type
type is_datos_nodo from structure within uo_arbol_activos
end type
end forward

type is_datos_nodo from structure
	long		sl_codigoActivo
	string		ss_nombreActivo
	integer		si_tipoActivo
	long		sl_codigoSubestacion
	string		ss_nombreSubestacion
	integer		si_nivel
end type

global type uo_arbol_activos from uo_man_instalac
integer height = 608
event ue_doubleclicked ( )
event ue_clicked ( )
end type
global uo_arbol_activos uo_arbol_activos

type variables

long il_manejador
end variables

forward prototypes
public function integer of_carga_subestaciones ()
public function integer of_cargar_indisponibilidad (long pl_nroinstalacion)
public function boolean of_instalacionpermitida (integer pi_tipoactivo)
public function integer of_devuelve_datos_item_seleccionado (ref long pl_codigoactivo, ref string ps_nombreactivo, ref integer pi_tipoactivo, ref long pl_codigosubest, ref string ps_nombresubest, ref integer pi_nivel)
end prototypes

public function integer of_carga_subestaciones ();//************************************************************************************//
// Descripci$$HEX1$$f300$$ENDHEX$$n : Carga de las subestaciones de alta en el $$HEX1$$e100$$ENDHEX$$rbol							  //
// Par$$HEX1$$e100$$ENDHEX$$metros  : -																						  //
// Devuelve    :  1 -> Correcto																		  //
//               -1 -> Error																			  //
// Autor			: AHM																						  //
// Fecha       : 05/06/2009																			  //
//************************************************************************************//

is_datos_nodo	lis_datosNodo				//Datos que vamos a incluir en el nodo del $$HEX1$$e100$$ENDHEX$$rbol
long				ll_nroSubestacion			//N$$HEX1$$fa00$$ENDHEX$$mero de la subestaci$$HEX1$$f300$$ENDHEX$$n que estamos tratando
string			ls_nombreSubestacion		//Nombre de la subestaci$$HEX1$$f300$$ENDHEX$$n que estamos tratando
treeviewitem	ltvi_nodo					//Nodo que se va a insertar en el $$HEX1$$e100$$ENDHEX$$rbol

//Declaraci$$HEX1$$f300$$ENDHEX$$n del cursor de las subestaciones de alta
DECLARE cu_subestaciones CURSOR FOR 
	SELECT nro_instalacion, nom_instalacion
	FROM 	 sgd_instalacion_at
	WHERE  tipo_instalacion = 1
	ORDER BY nom_instalacion ASC;
	
//Apertura del cursor de las subestaciones
OPEN cu_subestaciones;

IF sqlca.sqlcode <> 0 THEN		//Comprobamos si ha habido una problema en la apertura del cursor
	messageBox("Error", "Error en la apertura del cursor de subestaciones , " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	RETURN -1
END IF

//Lectura de los datos del cursor
FETCH  cu_subestaciones into :ll_nroSubestacion, :ls_nombreSubestacion;

IF sqlca.sqlcode < 0 THEN		//Comprobamos si ha habido una problema en la lectura del cursor
	messageBox("Error", "Error en la lectura de los datos del cursor de subestaciones , " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	RETURN -1
END IF

//Procesamiento de los datos de las subestaciones
DO WHILE (sqlca.sqlcode = 0) 
	
	//Carga de los datos en la estructura
	lis_datosNodo.sl_codigoActivo = ll_nroSubestacion
	lis_datosNodo.ss_nombreActivo = ls_nombreSubestacion
	lis_datosNodo.si_tipoActivo = 1
	lis_datosNodo.sl_codigoSubestacion = ll_nroSubestacion
	lis_datosNodo.ss_nombreSubestacion = ls_nombreSubestacion
	lis_datosNodo.si_nivel = 0

	//Configuraci$$HEX1$$f300$$ENDHEX$$n del nodo del $$HEX1$$e100$$ENDHEX$$rbol
	ltvi_nodo.label = ls_nombreSubestacion
	ltvi_nodo.data = lis_datosNodo
	ltvi_nodo.bold = FALSE
	ltvi_nodo.pictureindex = f_icono_arbol(1 + 400)
	ltvi_nodo.selectedpictureindex = f_icono_arbol(1 + 400)

	//Inserci$$HEX1$$f300$$ENDHEX$$n del nodo en el $$HEX1$$e100$$ENDHEX$$rbol
	THIS.insertitemsort(0,ltvi_nodo)
	
	//Lectura de los datos del cursor
	FETCH  cu_subestaciones into :ll_nroSubestacion, :ls_nombreSubestacion;
	
	IF sqlca.sqlcode < 0 THEN		//Comprobamos si ha habido una problema en la lectura del cursor
		messageBox("Error", "Error en la lectura de los datos del cursor de subestaciones , " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
		RETURN -1
	END IF

LOOP

//Cierre del cursor de las subestaciones
CLOSE cu_subestaciones;

IF sqlca.sqlcode < 0 THEN		//Comprobamos si ha habido una problema en el cierre del cursor
	messageBox("Error", "Error en el cierre del cursor de subestaciones , " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	RETURN -1
END IF

RETURN 1
end function

public function integer of_cargar_indisponibilidad (long pl_nroinstalacion);//************************************************************************************//
// Descripci$$HEX1$$f300$$ENDHEX$$n : Carga del $$HEX1$$e100$$ENDHEX$$rbol de instalaciones hasta llegar a la instalaci$$HEX1$$f300$$ENDHEX$$n 		  //
//               por la indisponibilidad.															  //
// Par$$HEX1$$e100$$ENDHEX$$metros  : -																						  //
// Devuelve    :  1 -> Correcto																		  //
//               -1 -> Error																			  //
// Autor			: AHM																						  //
// Fecha       : 05/06/2009																			  //
//************************************************************************************//
int				li_nivel							//Nivel en el que se tiene que insertar el nodo
int				li_tipoGrupo					//Tipo del grupo al que pertenece la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
int				li_tipoInstalacion			//Tipo de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando
is_datos_nodo	lis_nodoNuevo					//Datos del nodo a insertar
long				ll_nroGrupo						//N$$HEX1$$fa00$$ENDHEX$$mero del grupo al que pertenece la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
long				ll_nroInstalacion				//N$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando
long				ll_nroSubestacion				//N$$HEX1$$fa00$$ENDHEX$$mero de la subestaci$$HEX1$$f300$$ENDHEX$$n
long				ll_manejador					//Manejador del nodo que se acaba de insertar
long				ll_manejadorAnterior			//Manejador del nodo que se acaba de insertar
long				ll_tipoInstalacion			//Tipo de instalaci$$HEX1$$f300$$ENDHEX$$n del nodo que se va a insertar
string			ls_nombreGrupo					//Nombre del grupo al que pertenece la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
string			ls_nombreInstalacion			//Nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n del nuevo nodo
string			ls_nombreSubestacion			//Nombre de la subestaci$$HEX1$$f300$$ENDHEX$$n
treeViewItem	ltwi_nodo						//Nodo que vamos a insertar


//Inicializaci$$HEX1$$f300$$ENDHEX$$n del nivel en el que se tiene que insertar el nodo
li_nivel = 0

//Captura de los datos de la subestaci$$HEX1$$f300$$ENDHEX$$n a partir de la instalaci$$HEX1$$f300$$ENDHEX$$n afectada
SELECT a.nom_instalacion, a.nro_instalacion
INTO :ls_nombreSubestacion, :ll_nroSubestacion
FROM sgd_instalacion_at a, sgd_instalacion_at b
WHERE a.nro_instalacion= b.cod_subestac_at
     AND b.nro_instalacion = :pl_nroInstalacion 
USING sqlca;


IF sqlca.sqlcode <> 0 THEN
	MessageBox("Error", "No se han podido obtener datos de la instalaci$$HEX1$$f300$$ENDHEX$$n, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	RETURN -1
end if

//Carga de los datos del nodo nuevo
lis_nodoNuevo.sl_codigoActivo = ll_nroSubestacion 
lis_nodoNuevo.ss_nombreActivo = ls_nombreSubestacion
lis_nodoNuevo.si_tipoActivo = 1
lis_nodoNuevo.sl_codigoSubestacion = ll_nroSubestacion 
lis_nodoNuevo.ss_nombreSubestacion = ls_nombreSubestacion
lis_nodoNuevo.si_nivel = li_nivel
ltwi_nodo.data = lis_nodoNuevo
ltwi_nodo.label = ls_nombreSubestacion

//Inicializaci$$HEX1$$f300$$ENDHEX$$n de los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n que se est$$HEX2$$e1002000$$ENDHEX$$tratando
ll_nroInstalacion = ll_nroSubestacion
li_tipoInstalacion = 1

//Incializaci$$HEX1$$f300$$ENDHEX$$n de los manejadores
ll_manejadorAnterior = 0
ll_manejador = 0

//Carga de las instalaciones intermedias (entre la subestaci$$HEX1$$f300$$ENDHEX$$n y el activo afectado)
DO WHILE (ll_nroInstalacion <> pl_nroInstalacion)
	
	ltwi_nodo.bold = FALSE
	ltwi_nodo.pictureindex = THIS.f_icono_Arbol(lis_nodoNuevo.si_tipoActivo + 400)
	ltwi_nodo.selectedpictureindex = THIS.f_icono_Arbol(lis_nodoNuevo.si_tipoActivo + 400)
	
	ll_manejadorAnterior = ll_manejador
	IF of_instalacionpermitida(lis_nodoNuevo.si_tipoActivo) THEN
		ll_manejador = THIS.insertitemsort(ll_manejadorAnterior,ltwi_nodo)
	END IF
	//Despliega el item anterior
	IF ll_manejadorAnterior > 0 THEN
		THIS.expandItem(ll_manejadorAnterior)
	END IF

	//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n inferior al $$HEX1$$fa00$$ENDHEX$$ltimo nodo insertado
	SELECT nom_instalacion, tipo_instalacion, nro_instalacion
	INTO :ls_nombreInstalacion, :ll_tipoInstalacion, :ll_nroInstalacion 
	FROM sgd_instalacion_at
	WHERE nro_inst_padre = :ll_nroInstalacion 
	START WITH nro_instalacion = :pl_nroInstalacion
	CONNECT BY PRIOR nro_inst_padre = nro_instalacion
	USING sqlca;
	
	//Cargamos el grupo
	IF (li_nivel = 0) THEN
				
		SELECT a.codigo, a.descripcion, 25
		INTO :ll_nroGrupo, :ls_nombreGrupo, :li_tipoGrupo
		FROM bdiv10_grupos_activos a, bdiv10_activos b
		WHERE b.grupo_activos_v10 = '6666:' || a.codigo
			AND b.codigo = (SELECT nro_instalacion
							FROM sgd_instalacion_at 
							WHERE nro_inst_padre = :ll_nroSubestacion
							START WITH nro_instalacion = :pl_nroInstalacion
							CONNECT BY PRIOR nro_inst_padre = nro_instalacion);
			
		IF (NOT(isNull(ll_nroGrupo)) AND ll_nroGrupo > 0)AND (ll_nroGrupo <> ll_nroInstalacion) THEN
						
			li_nivel++
			
			//Carga de la estructura con los datos del grupo
			lis_nodoNuevo.sl_codigoActivo = ll_nroGrupo
			lis_nodoNuevo.ss_nombreActivo = ls_nombreGrupo
			lis_nodoNuevo.si_tipoActivo = li_tipoGrupo
			lis_nodoNuevo.si_nivel = li_nivel
			ltwi_nodo.data = lis_nodoNuevo
			ltwi_nodo.label = ls_nombreGrupo
			
			ltwi_nodo.bold = FALSE
			ltwi_nodo.pictureindex = THIS.f_icono_Arbol(li_tipoGrupo + 400)
			ltwi_nodo.selectedpictureindex = THIS.f_icono_Arbol(li_tipoGrupo + 400)
			
			//Inserci$$HEX1$$f300$$ENDHEX$$n del nuevo nodo
			ll_manejadorAnterior = ll_manejador
			IF of_instalacionpermitida(lis_nodoNuevo.si_tipoActivo) THEN
				ll_manejador = THIS.insertitemsort(ll_manejadorAnterior,ltwi_nodo)
			END IF
			
			IF ll_manejadorAnterior > 0 THEN
				THIS.expandItem(ll_manejadorAnterior)
			END IF
			
		ELSEIF (ll_nroGrupo = ll_nroInstalacion) THEN
			ls_nombreInstalacion = ls_nombreGrupo
			ll_tipoInstalacion = li_tipoGrupo
			ll_nroInstalacion = ll_nroGrupo
			
		END IF
	END IF
	
	//Carga de los datos en la estructura
	lis_nodoNuevo.sl_codigoActivo = ll_nroInstalacion
	lis_nodoNuevo.ss_nombreActivo = ls_nombreInstalacion
	lis_nodoNuevo.si_tipoActivo = ll_tipoInstalacion
	lis_nodoNuevo.si_nivel = li_nivel + 1
	ltwi_nodo.data = ltwi_nodo
	ltwi_nodo.label = ls_nombreInstalacion

	li_nivel++
	
LOOP
setredraw(False)

RETURN 1
end function

public function boolean of_instalacionpermitida (integer pi_tipoactivo);//************************************************************************************//
// Descripci$$HEX1$$f300$$ENDHEX$$n : Dada un tipo de instalaci$$HEX1$$f300$$ENDHEX$$n devuelve si debe o no mostrarse por 	  //
//					  pantalla.																				  //
// Par$$HEX1$$e100$$ENDHEX$$metros  : pi_tipoActivo	-> Tipo del activo seleccionado.							  //
// Devuelve    : TRUE  -> Debe mostrarse.															  //
//               FALSE -> No debe mostrarse.														  //
// Autor			: AHM																						  //
// Fecha       : 05/06/2009																			  //
//************************************************************************************//

boolean		lb_aux

//Comprobamos que es un tipo permitido
IF (pi_tipoActivo = fgci_tipo_subestacion_at) OR (pi_tipoActivo = fgci_tipo_salida_at) &
	OR (pi_tipoActivo = fgci_tipo_barra_at) OR (pi_tipoActivo = fgci_tipo_celda_at) &
	OR (pi_tipoActivo = fgci_tipo_interruptor_at) OR (pi_tipoActivo = fgci_tipo_int_cabecera_at) &
	OR (pi_tipoActivo = fgci_tipo_trafo_pot) OR (pi_tipoActivo = fgci_tipo_seccionador_at) &
	OR (pi_tipoActivo = fgci_tipo_activos) OR (pi_tipoActivo = fgci_tipo_grupos_activos) &
	OR (pi_tipoActivo = fgci_tipo_condensador) THEN

	lb_aux = TRUE
	
ELSE
	
	lb_aux = FALSE
	
END IF
	
RETURN lb_aux
end function

public function integer of_devuelve_datos_item_seleccionado (ref long pl_codigoactivo, ref string ps_nombreactivo, ref integer pi_tipoactivo, ref long pl_codigosubest, ref string ps_nombresubest, ref integer pi_nivel);//************************************************************************************//
// Descripci$$HEX1$$f300$$ENDHEX$$n : Devuelve los datos del item seleccionado.									  //
// Par$$HEX1$$e100$$ENDHEX$$metros  : pl_codigoActivo -> C$$HEX1$$f300$$ENDHEX$$digo del activo seleccionado.						  //
//					  ps_nombreActivo -> Nombre del activo seleccionado.						  //
//					  pi_tipoActivo	-> Tipo del activo seleccionado.							  //
//					  pl_codigoSubest	->	C$$HEX1$$f300$$ENDHEX$$digo de la subestaci$$HEX1$$f300$$ENDHEX$$n de la que depende el 	  //
//												activo seleccionado.										  //
//					  ps_nombreSubest -> Nombre de la subestaci$$HEX1$$f300$$ENDHEX$$n de la que depende el 	  //
//												activo seleccionado.										  //
//					  pi_nivel			-> Nivel del activo en el $$HEX1$$e100$$ENDHEX$$rbol (0 -> primer nivel). //
//				     pi_manejador		-> Manejador del nodo seleccionado.						  //
// Devuelve    :  1 -> Correcto																		  //
//               -1 -> Error																			  //
// Autor			: AHM																						  //
// Fecha       : 05/06/2009																			  //
//************************************************************************************//

is_datos_nodo	lis_datosNodo				//Datos del nodo
long				ll_manejador				//Manejador del nodo del $$HEX1$$e100$$ENDHEX$$rbol seleccionado
treeViewItem	ltri_nodo					//Nodo seleccionado

//Captura del item seleccionado
IF il_manejador = 0 THEN
	THIS.FindItem(CurrentTreeItem!, il_manejador)
//ELSE
//	ll_manejador = pl_manejador
END IF

//Captura de los datos del item
THIS.getItem(il_manejador, ltri_nodo)
lis_datosNodo = ltri_nodo.data

//Carga de los par$$HEX1$$e100$$ENDHEX$$metros con los valores del nodo seleccionado
pl_codigoActivo = lis_datosNodo.sl_codigoActivo
ps_nombreActivo = lis_datosNodo.ss_nombreActivo
pi_tipoActivo = lis_datosNodo.si_tipoActivo
pl_codigoSubest = lis_datosNodo.sl_codigoSubestacion
ps_nombreSubest = lis_datosNodo.ss_nombreSubestacion
pi_nivel = lis_datosNodo.si_nivel

RETURN 1
end function

on uo_arbol_activos.create
call super::create
end on

on uo_arbol_activos.destroy
call super::destroy
end on

event doubleclicked;call super::doubleclicked;integer				li_tipoInstalacion	//Tipo de instalaci$$HEX1$$f300$$ENDHEX$$n que estamos tratando
is_datos_nodo		lis_datosNodo			//Datos que contiene el nodo que se ha seleccionado
is_datos_nodo		lis_datosNodoNuevo	//Datos que contiene el nuevo nodo que vamos a insertar en el $$HEX1$$e100$$ENDHEX$$rbol
//is_datos_nodo		lis_datosNodoPadre	//Datos que contiene el nodo padre
long					ll_manejadorPadre		//Manejador del padre del nodo seleccionado
long					ll_nroInstalacion		//N$$HEX1$$fa00$$ENDHEX$$mero de instalaci$$HEX1$$f300$$ENDHEX$$n que estamos tratando
long					ll_nroSubestacion		//N$$HEX1$$fa00$$ENDHEX$$mero de la subestaci$$HEX1$$f300$$ENDHEX$$n
string				ls_nombreInstalacion	//Nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n que estamos tratando
string				ls_nombreSubestacion	//Nombre de la subestaci$$HEX1$$f300$$ENDHEX$$n
treeViewItem		ltvi_nodo				//Nodo del $$HEX1$$e100$$ENDHEX$$rbol que ha sido seleccionado
treeViewItem		ltvi_nodoNuevo			//Nodo nuevo que se va a incluir en el $$HEX1$$e100$$ENDHEX$$rbol
//treeViewItem		ltvi_nodoPadre			//Nodo padre del nodo del $$HEX1$$e100$$ENDHEX$$rbol que ha sido seleccinado

//Comprobamos que se ha seleccionado una elemento
IF handle = 0 THEN 
	RETURN
END IF

il_manejador = handle

//Captura del nodo que ha sido seleccinado
THIS.getitem(handle,ltvi_nodo)

//Captura de los datos del nodo
lis_datosNodo = ltvi_nodo.data

//Definici$$HEX1$$f300$$ENDHEX$$n de los cursores que contendr$$HEX1$$e100$$ENDHEX$$n las instalaciones a desplegar dependiendo de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada
IF lis_datosNodo.si_tipoActivo = 25 THEN	//Se ha seleccionado un grupo

	DECLARE cu_instalacionA CURSOR FOR 
	SELECT I.NRO_INSTALACION, I.NOM_INSTALACION, I.TIPO_INSTALACION
	FROM SGD_INSTALACION_AT I, BDIV10_GRUPOS_ACTIVOS G, BDIV10_ACTIVOS A
	WHERE A.GRUPO_ACTIVOS_V10 = '6666:' || G.CODIGO
		AND A.CODIGO = I.NRO_INSTALACION
		AND G.CODIGO = :lis_datosNodo.sl_codigoActivo
		AND I.COD_SUBESTAC_AT = :lis_datosNodo.sl_codigoSubestacion
	ORDER BY NOM_INSTALACION ASC;
	
	//Apertura del cursor de instalaciones
	OPEN cu_instalacionA;
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la apertura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la apertura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
	//Lectura del cursor
	FETCH cu_instalacionA INTO :ll_nroInstalacion, :ls_nombreInstalacion,:li_tipoInstalacion;
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF

ELSEIF lis_datosNodo.si_tipoActivo = 1 THEN //Se ha seleccionado una subestaci$$HEX1$$f300$$ENDHEX$$n

	DECLARE cu_instalacionG CURSOR FOR 
	SELECT DISTINCT(G.CODIGO) AS NUMERO, G.DESCRIPCION AS NOMBRE, 25 AS TIPO_INSTALACION
	FROM SGD_INSTALACION_AT I, BDIV10_GRUPOS_ACTIVOS G, BDIV10_ACTIVOS A
	WHERE A.GRUPO_ACTIVOS_V10 = '6666:' || G.CODIGO
		  AND A.CODIGO = I.NRO_INSTALACION
		  AND I.NRO_INST_PADRE = :lis_datosNodo.sl_codigoActivo
	UNION
	SELECT NRO_INSTALACION AS NUMERO, NOM_INSTALACION AS NOMBRE, TIPO_INSTALACION
	FROM SGD_INSTALACION_AT SGD_INSTALACIONA
	WHERE NRO_INST_PADRE = :lis_datosNodo.sl_codigoActivo  AND
	BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_INSTALACION_AT 
	WHERE NRO_INSTALACION=SGD_INSTALACIONA.NRO_INSTALACION)
	AND SGD_INSTALACIONA.NRO_INSTALACION  NOT IN (SELECT A.CODIGO
																 FROM SGD_INSTALACION_AT I, BDIV10_GRUPOS_ACTIVOS G, BDIV10_ACTIVOS A
																 WHERE A.GRUPO_ACTIVOS_V10 = '6666:' || G.CODIGO
																	  AND A.CODIGO = I.NRO_INSTALACION
																	  AND I.NRO_INST_PADRE = :lis_datosNodo.sl_codigoActivo)																	  
	ORDER BY NOMBRE ASC;

	//Apertura del cursor
	OPEN cu_instalacionG;
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la apertura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la apertura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
	//Lectura de los datos del cursor
	FETCH cu_instalacionG INTO :ll_nroInstalacion, :ls_nombreInstalacion,:li_tipoInstalacion;
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF

ELSE	//Resto
	
	DECLARE cu_instalacion CURSOR FOR 
	SELECT NRO_INSTALACION, NOM_INSTALACION, TIPO_INSTALACION
	FROM SGD_INSTALACION_AT SGD_INSTALACIONA
	WHERE NRO_INST_PADRE = :lis_datosNodo.sl_codigoActivo  AND
	BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_INSTALACION_AT 
	WHERE NRO_INSTALACION=SGD_INSTALACIONA.NRO_INSTALACION)
	ORDER BY NOM_INSTALACION ASC;

	
	OPEN cu_instalacion;
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la apertura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la apertura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
	//Lectura de los datos del cursor
	FETCH cu_instalacion INTO :ll_nroInstalacion, :ls_nombreInstalacion,:li_tipoInstalacion;
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
END IF		

//Captura de los datos en el nodo nuevo
lis_datosNodoNuevo.sl_codigoSubestacion = lis_datosNodo.sl_codigoSubestacion
lis_datosNodoNuevo.ss_nombreSubestacion	= lis_datosNodo.ss_nombreSubestacion
lis_datosNodoNuevo.si_nivel = lis_datosNodo.si_nivel + 1

//Carga de los datos de las instalaciones
DO WHILE (sqlca.sqlcode = 0)
	
	lis_datosNodoNuevo.sl_codigoActivo = ll_nroInstalacion
	lis_datosNodoNuevo.ss_nombreActivo = ls_nombreInstalacion
	lis_datosNodoNuevo.si_tipoActivo	=	li_tipoInstalacion
	
	//Carga de los datos del nodo
	ltvi_nodoNuevo.data = lis_datosNodoNuevo
	ltvi_nodoNuevo.bold = FALSE
	ltvi_nodoNuevo.pictureindex = f_icono_arbol(li_tipoInstalacion + 400)
	ltvi_nodoNuevo.selectedpictureindex = f_icono_arbol(li_tipoInstalacion + 400)
	ltvi_nodoNuevo.label = ls_nombreInstalacion
	
	//Antes de cargar la instalacion en el $$HEX1$$e100$$ENDHEX$$rbol miramos si es una instalaci$$HEX1$$f300$$ENDHEX$$n permitida
	IF of_instalacionpermitida(li_tipoInstalacion) THEN
		THIS.insertitemsort(handle, ltvi_nodoNuevo)
	END IF
	
	//Lectura de los datos del cursor
	IF lis_datosNodo.si_tipoActivo = 25 THEN	//Se ha seleccionado un grupo

		FETCH cu_instalacionA INTO :ll_nroInstalacion, :ls_nombreInstalacion,:li_tipoInstalacion;
		//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
		IF (sqlca.sqlcode<0) THEN
			messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
		END IF
		
	ELSEIF lis_datosNodo.si_tipoActivo = 1 THEN //Se ha seleccionado una subestaci$$HEX1$$f300$$ENDHEX$$n
		
		FETCH cu_instalacionG INTO :ll_nroInstalacion, :ls_nombreInstalacion,:li_tipoInstalacion;
		//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
		IF (sqlca.sqlcode<0) THEN
			messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
		END IF
		
	ELSE	//Resto
	
		FETCH cu_instalacion INTO :ll_nroInstalacion, :ls_nombreInstalacion,:li_tipoInstalacion;
		//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
		IF (sqlca.sqlcode<0) THEN
			messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
		END IF
		
	END IF
	
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n de la lectura del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la lectura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
LOOP


//Cierre del cursor
IF lis_datosNodo.si_tipoActivo = 25 THEN	//Se ha seleccionado un grupo

	CLOSE cu_instalacionA;
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n del cierre del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la apertura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
ELSEIF lis_datosNodo.si_tipoActivo = 1 THEN //Se ha seleccionado una subestaci$$HEX1$$f300$$ENDHEX$$n
	
	CLOSE cu_instalacionG;
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n del cierre del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la apertura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
ELSE	//Resto
	
	CLOSE cu_instalacion;
	//Comprobaci$$HEX1$$f300$$ENDHEX$$n del cierre del cursor de instalaciones
	IF (sqlca.sqlcode<0) THEN
		messageBox("Error", "Error en la apertura del cursor de instalaciones, " + string(sqlca.sqlcode) + ":" + sqlca.sqlerrtext)
	END IF
	
END IF

//PostEvent("ue_doubleclicked")







end event

event clicked;call super::clicked;
il_manejador = handle
PostEvent("ue_clicked")

end event


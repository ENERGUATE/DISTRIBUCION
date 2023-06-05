HA$PBExportHeader$u_openlink.sru
$PBExportComments$Objeto de comunicaciones SF.
forward
global type u_openlink from nonvisualobject
end type
end forward

global type u_openlink from nonvisualobject
end type
global u_openlink u_openlink

type prototypes
FUNCTION int OPLINKCL ( int iPrimitiva, string sServidor, string sFuncion, ref string sReservado, string sDatosIda, ref long lRetorno, ref string sDatosVuelta, ref int iCompletitud) LIBRARY "Open32oc.dll" alias for "OPLINKCL;Ansi"
FUNCTION int OPLINKCE ( long lRetorno, int iError, ref string sDescripcion, int iReservado ) LIBRARY "Open32oc.dll" alias for "OPLINKCE;Ansi"
FUNCTION int OPLINKNS ( string sServidor, string sProyecto, string sUsuario, string sClave, string sNuevaClave, ref long lRetorno ) LIBRARY "Open32oc.dll" alias for "OPLINKNS;Ansi"
end prototypes

type variables
// VARIABLES ///
// 
PROTECTED:
// Guarda el nombre del servidor a utilizar
string is_Servidor = ""
// Guarda la $$HEX1$$fa00$$ENDHEX$$ltima funci$$HEX1$$f300$$ENDHEX$$n ejecutada
string is_Funcion = ""
// Guarda el $$HEX1$$fa00$$ENDHEX$$ltimo c$$HEX1$$f300$$ENDHEX$$digo de error retornado
long il_Error = 0
// DataStores utilizados en los procesos de 
// recepci$$HEX1$$f300$$ENDHEX$$n, conversi$$HEX1$$f300$$ENDHEX$$n y env$$HEX1$$ed00$$ENDHEX$$o de datos.
datastore ids_Replica
datastore ids_Buffer
// Guarda el $$HEX1$$fa00$$ENDHEX$$ltimo error ocurrido
string is_Error_Logica_BD = ""
// Guarda el usuario y clave de la base de datos.
string is_Usuario = ""
string is_Clave = ""
// Indica la primitiva que se estaba ejecutando
// actualmente
int ii_Primitiva = 0
// INDICADA SI SE UTILIZA TESTPC.DLL
boolean ib_TestPC = FALSE
//
////////////
string	is_comprobacion		//Indica si es necesaria la validaci$$HEX1$$f300$$ENDHEX$$n del usuario y la contrase$$HEX1$$f100$$ENDHEX$$a

// CONSTANTES /////////
//
// Fin de campo
CONSTANT STRING isk_EOF = CHAR(1)
// Fin de l$$HEX1$$ed00$$ENDHEX$$nea
CONSTANT STRING isk_EOL = CHAR(2)
// Fin de bloque
CONSTANT STRING isk_EOB = CHAR(2)
// Tabulador
CONSTANT STRING isk_TAB = "	"
// Separador decimal actual en la aplicaci$$HEX1$$f300$$ENDHEX$$n.
CONSTANT STRING isk_SEPDEC = ","
// Formato de fecha actualmente utilizado en la aplicaci$$HEX1$$f300$$ENDHEX$$n
CONSTANT STRING isk_FORMFECHA = "dd/mm/yyyy"
// Formato de fecha-hora utilizado actualmente
CONSTANT STRING isk_FORMFECHAHORA = "dd/mm/yyyy hh:mm:ss"
// Valor cierto en la Base de Datos para indicadores
CONSTANT INTEGER iik_TRUE = 1
// Valor falto en la Base de Datos para indicadores
CONSTANT INTEGER iik_FALSE = 2
// Separador de columna
CONSTANT STRING isk_EOC = "	"
// Separador de registro
CONSTANT STRING isk_EOR = "~r~n"
// Tama$$HEX1$$f100$$ENDHEX$$o de trama a mandar a la funci$$HEX1$$f300$$ENDHEX$$n de negocio
// cuando se realiza m$$HEX1$$fa00$$ENDHEX$$ltiples recepciones.
CONSTANT INTEGER iik_LONG_TRAMA = 8192
//
///////////////////////////
// NUEVO VERSION 2000 OPENLINK
String    is_Password , is_Proyecto
CONSTANT INTEGER    ERROR_SEC = 1000
end variables

forward prototypes
public function string of_recuperar_nuevos_modificados (ref datawindow adw_datawindow, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original)
public function string of_texto_error ()
public function string of_recuperar_bloque (ref datastore ads_datastore, long al_registro_inicial, long al_registro_final, integer ai_columna_inicial, integer ai_columna_final, dwbuffer aenum_dwbuffer, boolean ab_original)
public function string of_recuperar_borrados (ref datastore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final)
public function string of_recuperar_nuevos_modificados (ref DataStore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original)
public function integer of_cargar_bloque (ref datawindow adw_datawindow, string as_bloque_cargar, integer ai_num_bloque, boolean ab_resetear)
public function integer of_cargar_bloque (ref datastore ads_datastore, string as_bloque_cargar, integer ai_num_bloque)
public function integer of_cargar_bloque (ref datastore ads_datastore, string as_bloque_cargar, integer ai_num_bloque, boolean ab_resetear)
public function integer of_cargar_bloque (ref datawindow adw_datawindow, string as_bloque_cargar, integer ai_num_bloque)
public function integer of_cargar_bloque (ref datawindowchild adwc_dwchild, string as_bloque_cargar, integer ai_num_bloque)
public function integer of_cargar_bloque (ref datawindowchild adwc_dwchild, string as_bloque_cargar, integer ai_num_bloque, boolean ab_resetear)
public function integer of_ejecutar (string as_funcion, integer ai_instruccion, ref any aa_parametros[], string as_entrada, ref powerobject apo_objetos[])
public function long of_configuracion (ref window pw_frame, string ps_servidor, string ps_protocolo)
public subroutine of_reset ()
public function integer of_registrar_funcion (string as_funcion, character ac_metodo, unsignedinteger aui_longitud_registro)
public function integer of_enlazacampo (unsignedinteger aui_pos_campo, unsignedinteger aui_inicio, unsignedinteger aui_longitud, character ac_tipo, string ps_metodos)
public subroutine of_registrar_delimitador (string as_columna, string as_fila)
public function long of_getitemnumber (ref string as_Bloque, long al_Registro, integer ai_Columna)
public function string of_getitemstring (ref string as_bloque, long al_registro, integer ai_columna)
public function decimal of_getitemdecimal (ref string as_Bloque, long al_Registro, integer ai_Columna)
public function string of_bloque (ref string as_bloques, integer ai_bloque_inicial, integer ai_bloque_final)
public function string of_codigo_error ()
public function integer of_ejecutar (string as_funcion, ref integer ai_instruccion[], ref any aa_parametros[], string as_entrada, ref string as_salida)
public subroutine of_display_error ()
public function string of_recuperar_bloque (ref datastore ads_datastore, long al_registro_inicial, long al_registro_final, string as_lista_columnas, dwbuffer aenum_dwbuffer, boolean ab_original)
public function string of_recuperar_bloque (ref datawindow adw_datawindow, long al_registro_inicial, long al_registro_final, integer ai_columna_inicial, integer ai_columna_final, dwbuffer aenum_dwbuffer, boolean ab_original)
public function string of_Recuperar_Bloque (ref datawindow adw_datawindow, long al_registro_inicial, long al_registro_final, string as_Lista_Columnas, dwbuffer aenum_dwbuffer, boolean ab_original)
public function string of_recuperar_borrados (ref datastore ads_datastore, string as_Lista_Columnas)
public function string of_recuperar_borrados (ref datawindow adw_datawindow, string as_Lista_Columnas)
public function string of_recuperar_borrados (ref datawindow adw_datawindow, integer ai_columna_inicial, integer ai_columna_final)
public function string of_recuperar_modificados (ref datastore ads_datastore, string as_Lista_Columnas, boolean ab_original)
public function string of_recuperar_modificados (ref DataStore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original)
public function string of_recuperar_modificados (ref datawindow adw_datawindow, string as_Lista_Columnas, boolean ab_original)
public function string of_recuperar_modificados (ref datawindow adw_DataWindow, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original)
public function string of_recuperar_nuevos_modificados (ref datastore ads_datastore, string as_Lista_Columnas, boolean ab_original)
public function string of_recuperar_nuevos_modificados (ref datawindow adw_datawindow, string as_Lista_Columnas, boolean ab_original)
public function string of_recuperar_seleccionados (ref datastore ads_datastore, string as_Lista_Columnas, boolean ab_original)
public function string of_recuperar_seleccionados (ref datawindow adw_datawindow, string as_Lista_Columnas, boolean ab_original)
public function string of_recuperar_seleccionados (ref DataStore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original)
public function string of_recuperar_seleccionados (ref DataWindow adw_DataWindow, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original)
public function string of_generar_bloque (ref powerobject apo_objeto, string as_formato)
public function string of_generar_bloque (ref powerobject apo_objeto[], string as_formato, long al_registros)
public function integer of_ejecutar (string as_funcion, ref integer ai_instruccion[], ref any aa_parametros[], string as_entrada, ref string as_salida, boolean ab_recepcion_multiple)
private function long of_llamar_fn_multiple_recepcion (string as_funcion, ref string as_salida[], string as_entrada)
public function long of_recuperar (ref string as_salida, string as_parametro, boolean ab_formateado, boolean ab_resetear, ref long al_error)
public function string of_remplazar (string as_cadena, string as_buscar, string as_remplazar)
public function long of_loadf (string dest_func, string string_dat[], integer return_tr[], ref string return_string[])
public function long of_securityconnect (string proyecto, string usuario, string clave, ref long retorno)
public function string of_com_return ()
private function long of_llamar_fn (string as_funcion, ref string as_salida[], string as_entrada, integer ai_completitud)
public function long of_load_auth (string dest_func, string string_dat[], integer return_tr[], ref string return_string[], string more_call)
public function string of_round (string quant)
public function string of_get_descripcion_error ()
public function integer of_configuracion (string as_servidor, string ps_nombrefichero)
end prototypes

public function string of_recuperar_nuevos_modificados (ref datawindow adw_datawindow, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado NEWMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = adw_datawindow.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_datawindow.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_datawindow.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = adw_datawindow.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_datawindow.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_datawindow.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_texto_error ();// RECUPERACI$$HEX1$$d300$$ENDHEX$$N DEL TEXTO RETORNADO POR EL SERVIDOR DE NEGOCIO
long ll_Pos, ll_Pos_Anterior = 1
string ls_Texto = ""

ll_Pos_Anterior = POS( is_error_logica_bd, ISK_EOF , 1 )

ll_Pos = POS( is_error_logica_bd, ISK_EOF, ll_Pos_Anterior + 1 )

IF ll_Pos > 0 THEN
	ls_Texto = MID( is_Error_Logica_BD, ll_Pos_Anterior , ll_Pos - ll_Pos_Anterior )
END IF

RETURN ls_Texto
end function

public function string of_recuperar_bloque (ref datastore ads_datastore, long al_registro_inicial, long al_registro_final, integer ai_columna_inicial, integer ai_columna_final, dwbuffer aenum_dwbuffer, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
//
///////////////////////////////////////////////

///////////////////////////////////////////////////////
// MODIFICADO JCARLOS. 10/7/97. 
// 
// 1) 	Si nos piden un registro final que sobrepasa el l$$HEX1$$ed00$$ENDHEX$$mite de registros existentes en 
// 		el datawindow para el buffer especificado.
//		En este caso colocaremos el registro final como el $$HEX1$$fa00$$ENDHEX$$ltimo registro del datawindow
//		para el buffe especificado.
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF al_Registro_Final > ads_datastore.RowCount() THEN
			al_Registro_Final = ads_datastore.RowCount()
		END IF
	CASE DELETE!
		IF al_Registro_Final > ads_datastore.DeletedCount() THEN
			al_Registro_Final = ads_datastore.DeletedCount()
		END IF
	CASE FILTER!
		IF al_Registro_Final > ads_datastore.FilteredCount() THEN
			al_Registro_Final = ads_datastore.FilteredCount()
		END IF
END CHOOSE
// 2)	Si nos piden una columna final que sobrepasa el l$$HEX1$$ed00$$ENDHEX$$mite de columnas existentes en
//		el datawindow.
//		En este caso colocaremos la columna final como la $$HEX1$$fa00$$ENDHEX$$ltima columna del datawindow
li_Numero_Columnas = INTEGER( ads_datastore.Describe("DataWindow.Column.Count") )
IF ai_columna_final > li_Numero_Columnas THEN
	ai_Columna_Final = li_Numero_Columnas
END IF
// 3) 	Debemos comprobar si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites (registro inicial, registro final,
// 		columna inicial, columna final). Si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites no es correcto
// 		se devolver$$HEX2$$e1002000$$ENDHEX$$un bloque vacio.
IF 	al_registro_inicial <= 0 OR al_registro_final <= 0 OR &
	ai_columna_inicial <= 0 OR ai_columna_final <= 0 OR &
	al_registro_inicial > al_registro_final OR &
	ai_columna_inicial > ai_columna_final THEN
	RETURN "" + ISK_EOB
END IF
//
/////////////////////////////////////////////////////////


// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Recuperamos los valores 
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.CURRENT[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		END IF
	CASE FILTER!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = ads_DataStore.Object.Data.FILTER.ORIGINAL[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = ads_DataStore.Object.Data.FILTER.CURRENT[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		END IF
	CASE DELETE!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = ads_DataStore.Object.Data.DELETE.ORIGINAL[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = ads_DataStore.Object.Data.DELETE.CURRENT[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		END IF
END CHOOSE

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_borrados (ref datastore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer de borrado todos los registros
// 				
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno = ""
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registros_Borrados
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de registros borrados
ll_Registros_Borrados = ads_DataStore.DeletedCount()

IF ll_Registros_Borrados > 0 THEN

	// Cargamos la replica
	ids_Replica.Object.Data[1,ai_columna_inicial,ll_Registros_Borrados,ai_columna_final] = ads_DataStore.Object.Data.DELETE.ORIGINAL[1,ai_columna_inicial,ll_Registros_Borrados,ai_columna_final]

	// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
	// conversi$$HEX1$$f300$$ENDHEX$$n.
	li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )
	
	FOR li_Indice = 1 TO li_Numero_Columnas
		// Comprobamos si esta columna entra en el bloque a devolver
		IF 	li_Indice >= ai_columna_inicial AND &
			li_indice <= ai_columna_final THEN
			// Entra en el bloque debemos convertir su formato 
			ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
			CHOOSE CASE ls_Tipo
				CASE "DATETIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
				CASE "DATE"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
				CASE "DECIMAL(2)"
					IF ls_Decimal <> "." THEN
						ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
						lb_Convertir = TRUE
					END IF
				CASE "DECIMAL(3)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
				CASE "DECIMAL(1)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
				CASE "TIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
			END CHOOSE
		ELSE
			// La columna no entra en el bloque la destruimos
			ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
		END IF
	NEXT
	
	ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )
	
	// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
	IF lb_Convertir THEN
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
			END IF
		LOOP WHILE ll_Pos > 0
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "..", ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
			END IF
		LOOP WHILE ll_Pos > 0
	END IF
END IF
	
RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_nuevos_modificados (ref DataStore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado NEWMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function integer of_cargar_bloque (ref datawindow adw_datawindow, string as_bloque_cargar, integer ai_num_bloque, boolean ab_resetear);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_cargar_bloque_dw para n_controlador
// 
// Objetivo:	 	Se trata de cargar un bloque de datos recuperado del servidor de
//					negocio en un DataWindow.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	DataWindow adw_datawindow (Objeto sobre el que cargar).
//					string as_bloque_cargar (Bloque de datos a cargar).
//					Aqu$$HEX2$$ed002000$$ENDHEX$$se reciben X bloques de datos separados por el separador
//					de bloque ISK_EOB.
//					Integer ai_Num_Bloque ( N$$HEX1$$fa00$$ENDHEX$$mero de bloque a recuperar ).
//						
// Devuelve:	integer ( 0 OK, -1 KO)
//
//	Fecha			Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	04/03/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//	29/07/97							Si recibe un bloque vacio no intenta convertirlo
//
////////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Posici$$HEX1$$f300$$ENDHEX$$n del separador decimal
long ll_Pos = 1
// Posicion del inicio y fin de bloque a recuperar
long ll_Inicio_Bloque = 1, ll_Fin_Bloque
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para hacia el bloque que necesitamos
integer li_Bloque
// Indica si debemos realizar conversi$$HEX1$$f300$$ENDHEX$$n decimal
boolean lb_Conversion_Decimal = FALSE
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow sobre el que se va a cargar
// el bloque de datos.
integer li_Num_Col, li_Col
// Guarda el string a cargar en el datawindow convertido
string ls_Conversion
// Separador decimal utilizado en el sistema
string ls_Decimal
// Guarda el bloque a cargar
string ls_Bloque
// Guarda si hubo error al importar
int li_Error
//
//////////////////////////////////////////////////

//1) Recorremos hasta encontrar el bloque que necesitamos
FOR li_Bloque = 1 TO ai_Num_Bloque
	// Recuperamos la siguiente posici$$HEX1$$f300$$ENDHEX$$n
	ll_Fin_Bloque = POS( as_bloque_cargar, ISK_EOB, ll_Inicio_Bloque )
	IF li_Bloque < ai_Num_Bloque THEN ll_Inicio_Bloque = ll_Fin_Bloque + 1
NEXT

// Comprobamos si se encontr$$HEX2$$f3002000$$ENDHEX$$el finalizador de bloque
IF ll_Fin_Bloque <= 0 THEN RETURN -1

ls_Bloque = MID( as_bloque_Cargar, ll_inicio_Bloque, ll_Fin_Bloque - ll_inicio_bloque )

// Recuperamos el separador decimal del sistema.
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Reseteamos el buffer
ids_Buffer.DataObject = "d_buffer"
ids_Buffer.Reset()

// Cargamos el bloque pasado como par$$HEX1$$e100$$ENDHEX$$metro en el Buffer para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
ids_Buffer.ImportString( ls_Bloque )

// Realizamos la conversi$$HEX1$$f300$$ENDHEX$$n de los campos dependiendo de las columnas donde se
// va a alojar. Convertimos los campos DATETIME, DATE, TIME
li_Num_Col = INTEGER( adw_datawindow.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
	CHOOSE CASE UPPER(MID(adw_DataWindow.Describe("#"+STRING(li_Col)+".ColType"),1,7))
		CASE "DATETIM"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@ @@:@@:@@'")
		CASE "DATE"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@'")
		CASE "TIME"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@:@@:@@'")
		CASE "DECIMAL"
			lb_Conversion_Decimal = TRUE
	END CHOOSE
NEXT

// Recuperamos el string convertido
ls_Conversion = ids_Buffer.Describe( "DataWindow.Data" )

// Comprobamos si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del tipo decimal
IF lb_Conversion_Decimal AND ls_Decimal <> "." THEN
	// Necesita convertir pues existe una columna decimal y el separador decimal
	// del sistema es distinto al que se utiliza en el servidor C.
	DO
		ll_Pos = POS( ls_Conversion, ".",ll_Pos )
		IF ll_Pos > 0 THEN
			ls_Conversion = Replace( ls_Conversion, ll_Pos, 1, ",")
			ll_Pos++
		END IF
	LOOP WHILE ll_Pos > 0
END IF

// Hasta aqu$$HEX2$$ed002000$$ENDHEX$$hemos realizado la conversi$$HEX1$$f300$$ENDHEX$$n del BLOQUE DE DATOS pasado como 
// par$$HEX1$$e100$$ENDHEX$$metro. Debemos cargarlo en el DataWindow.
// Comprobamos si hay que resetear

// MODIFICACION 29/07/97

//IF ab_Resetear THEN
//	adw_DataWindow.Reset()
//	li_Error = adw_datawindow.ImportString( ls_Conversion ,1,32000,1, li_Num_Col)
//	IF li_Error >= 0 THEN
//		adw_DataWindow.ResetUpdate()
//	END IF
//ELSE
//	// No quiere resetear
//	li_Error = adw_DataWindow.ImportString( ls_Conversion, 1, 32000, 1, li_Num_Col)
//	IF li_Error >= 0 THEN
//		// Resetear los FLAGS de todo ( No tiene sentido recuperar parte nada m$$HEX1$$e100$$ENDHEX$$s ).
//		adw_DataWindow.ResetUpdate()
//	END IF
//END IF

IF ab_Resetear THEN
	adw_DataWindow.Reset()
END IF

IF TRIM(ls_conversion) = "" THEN RETURN 0

li_Error = adw_DataWindow.ImportString( ls_Conversion, 1, 32000, 1, li_Num_Col)

IF li_Error >= 0 THEN
	adw_DataWindow.ResetUpdate()
END IF

RETURN li_Error

end function

public function integer of_cargar_bloque (ref datastore ads_datastore, string as_bloque_cargar, integer ai_num_bloque);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_cargar_bloque_dw para n_controlador
// 
// Objetivo:	 	Se trata de cargar un bloque de datos recuperado del servidor de
//					negocio en un DataWindow.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	DataWindow ads_DataStore (Objeto sobre el que cargar).
//					string as_bloque_cargar (Bloque de datos a cargar).
//					Aqu$$HEX2$$ed002000$$ENDHEX$$se reciben X bloques de datos separados por el separador
//					de bloque ISK_EOB.
//					Integer ai_Num_Bloque ( N$$HEX1$$fa00$$ENDHEX$$mero de bloque a recuperar ).
//						
// Devuelve:	integer ( 0 OK, -1 KO)
//
//	Fecha		   Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
// 04/03/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//	29/07/97							Si recibe un bloque vacio no intenta convertirlo
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Posici$$HEX1$$f300$$ENDHEX$$n del separador decimal
long ll_Pos = 1
// Posicion del inicio y fin de bloque a recuperar
long ll_Inicio_Bloque = 1, ll_Fin_Bloque
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para hacia el bloque que necesitamos
integer li_Bloque
// Indica si debemos realizar conversi$$HEX1$$f300$$ENDHEX$$n decimal
boolean lb_Conversion_Decimal = FALSE
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow sobre el que se va a cargar
// el bloque de datos.
integer li_Num_Col, li_Col
// Guarda el string a cargar en el datawindow convertido
string ls_Conversion
// Separador decimal utilizado en el sistema
string ls_Decimal
// Guarda el bloque a cargar
string ls_Bloque
// Guarda si hubo error al importar
int li_Error
//
//////////////////////////////////////////////////

//1) Recorremos hasta encontrar el bloque que necesitamos
FOR li_Bloque = 1 TO ai_Num_Bloque
	// Recuperamos la siguiente posici$$HEX1$$f300$$ENDHEX$$n
	ll_Fin_Bloque = POS( as_bloque_cargar, ISK_EOB, ll_Inicio_Bloque )
	IF li_Bloque < ai_Num_Bloque THEN ll_Inicio_Bloque = ll_Fin_Bloque + 1
NEXT

// Comprobamos si se encontr$$HEX2$$f3002000$$ENDHEX$$el finalizador de bloque
IF ll_Fin_Bloque <= 0 THEN RETURN -1

ls_Bloque = MID( as_bloque_Cargar, ll_inicio_Bloque, ll_Fin_Bloque - ll_inicio_bloque )

// Recuperamos el separador decimal del sistema.
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Reseteamos el buffer
ids_Buffer.DataObject = "d_buffer"
ids_Buffer.Reset()

// Cargamos el bloque pasado como par$$HEX1$$e100$$ENDHEX$$metro en el Buffer para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
ids_Buffer.ImportString( ls_Bloque )

// Realizamos la conversi$$HEX1$$f300$$ENDHEX$$n de los campos dependiendo de las columnas donde se
// va a alojar. Convertimos los campos DATETIME, DATE, TIME
li_Num_Col = INTEGER( ads_DataStore.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
	CHOOSE CASE UPPER(MID(ads_DataStore.Describe("#"+STRING(li_Col)+".ColType"),1,7))
		CASE "DATETIM"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@ @@:@@:@@'")
		CASE "DATE"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@'")
		CASE "TIME"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@:@@:@@'")
		CASE "DECIMAL"
			lb_Conversion_Decimal = TRUE
	END CHOOSE
NEXT

// Recuperamos el string convertido
ls_Conversion = ids_Buffer.Describe( "DataWindow.Data" )

// Comprobamos si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del tipo decimal
IF lb_Conversion_Decimal AND ls_Decimal <> "." THEN
	// Necesita convertir pues existe una columna decimal y el separador decimal
	// del sistema es distinto al que se utiliza en el servidor C.
	DO
		ll_Pos = POS( ls_Conversion, ".",ll_Pos )
		IF ll_Pos > 0 THEN
			ls_Conversion = Replace( ls_Conversion, ll_Pos, 1, ",")
			ll_Pos++
		END IF
	LOOP WHILE ll_Pos > 0
END IF

// Hasta aqu$$HEX2$$ed002000$$ENDHEX$$hemos realizado la conversi$$HEX1$$f300$$ENDHEX$$n del BLOQUE DE DATOS pasado como 
// par$$HEX1$$e100$$ENDHEX$$metro. Debemos cargarlo en el DataWindow.
ads_DataStore.Reset()

IF TRIM(ls_conversion) = "" THEN RETURN 0

li_Error = ads_DataStore.ImportString( ls_Conversion ,1,10000,1, li_Num_Col, 1)
IF li_Error >= 0 THEN
	ads_DataStore.ResetUpdate()
END IF

RETURN li_Error

end function

public function integer of_cargar_bloque (ref datastore ads_datastore, string as_bloque_cargar, integer ai_num_bloque, boolean ab_resetear);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_cargar_bloque_dw para n_controlador
// 
// Objetivo:	 	Se trata de cargar un bloque de datos recuperado del servidor de
//					negocio en un DataWindow.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	DataWindow ads_DataStore (Objeto sobre el que cargar).
//					string as_bloque_cargar (Bloque de datos a cargar).
//					Aqu$$HEX2$$ed002000$$ENDHEX$$se reciben X bloques de datos separados por el separador
//					de bloque ISK_EOB.
//					Integer ai_Num_Bloque ( N$$HEX1$$fa00$$ENDHEX$$mero de bloque a recuperar ).
//						
// Devuelve:	integer ( 0 OK, -1 KO)
//
//	Fecha			Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	04/03/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//	29/07/97							Si recibe un bloque vacio no intenta convertirlo
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Posici$$HEX1$$f300$$ENDHEX$$n del separador decimal
long ll_Pos = 1
// Posicion del inicio y fin de bloque a recuperar
long ll_Inicio_Bloque = 1, ll_Fin_Bloque
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para hacia el bloque que necesitamos
integer li_Bloque
// Indica si debemos realizar conversi$$HEX1$$f300$$ENDHEX$$n decimal
boolean lb_Conversion_Decimal = FALSE
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow sobre el que se va a cargar
// el bloque de datos.
integer li_Num_Col, li_Col
// Guarda el string a cargar en el datawindow convertido
string ls_Conversion
// Separador decimal utilizado en el sistema
string ls_Decimal
// Guarda el bloque a cargar
string ls_Bloque
// Guarda si hubo error al importar
int li_Error
//
//////////////////////////////////////////////////

//1) Recorremos hasta encontrar el bloque que necesitamos
FOR li_Bloque = 1 TO ai_Num_Bloque
	// Recuperamos la siguiente posici$$HEX1$$f300$$ENDHEX$$n
	ll_Fin_Bloque = POS( as_bloque_cargar, ISK_EOB, ll_Inicio_Bloque )
	IF li_Bloque < ai_Num_Bloque THEN ll_Inicio_Bloque = ll_Fin_Bloque + 1
NEXT

// Comprobamos si se encontr$$HEX2$$f3002000$$ENDHEX$$el finalizador de bloque
IF ll_Fin_Bloque <= 0 THEN RETURN -1

ls_Bloque = MID( as_bloque_Cargar, ll_inicio_Bloque, ll_Fin_Bloque - ll_inicio_bloque )

// Recuperamos el separador decimal del sistema.
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Reseteamos el buffer
ids_Buffer.DataObject = "d_buffer"
ids_Buffer.Reset()

// Cargamos el bloque pasado como par$$HEX1$$e100$$ENDHEX$$metro en el Buffer para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
ids_Buffer.ImportString( ls_Bloque )

// Realizamos la conversi$$HEX1$$f300$$ENDHEX$$n de los campos dependiendo de las columnas donde se
// va a alojar. Convertimos los campos DATETIME, DATE, TIME
li_Num_Col = INTEGER( ads_DataStore.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
	CHOOSE CASE UPPER(MID(ads_DataStore.Describe("#"+STRING(li_Col)+".ColType"),1,7))
		CASE "DATETIM"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@ @@:@@:@@'")
		CASE "DATE"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@'")
		CASE "TIME"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@:@@:@@'")
		CASE "DECIMAL"
			lb_Conversion_Decimal = TRUE
	END CHOOSE
NEXT

// Recuperamos el string convertido
ls_Conversion = ids_Buffer.Describe( "DataWindow.Data" )

// Comprobamos si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del tipo decimal
IF lb_Conversion_Decimal AND ls_Decimal <> "." THEN
	// Necesita convertir pues existe una columna decimal y el separador decimal
	// del sistema es distinto al que se utiliza en el servidor C.
	DO
		ll_Pos = POS( ls_Conversion, ".",ll_Pos )
		IF ll_Pos > 0 THEN
			ls_Conversion = Replace( ls_Conversion, ll_Pos, 1, ",")
			ll_Pos++
		END IF
	LOOP WHILE ll_Pos > 0
END IF

// Hasta aqu$$HEX2$$ed002000$$ENDHEX$$hemos realizado la conversi$$HEX1$$f300$$ENDHEX$$n del BLOQUE DE DATOS pasado como 
// par$$HEX1$$e100$$ENDHEX$$metro. Debemos cargarlo en el DataWindow.
// Comprobamos si hay que resetear

//MODIFICACION 29/07/97
//IF ab_Resetear THEN
//	ads_DataStore.Reset()
//	li_Error = ads_DataStore.ImportString( ls_Conversion ,1,32000,1, li_Num_Col)
//	IF li_Error >= 0 THEN
//		ads_DataStore.ResetUpdate()
//	END IF
//ELSE
//	// No quiere resetear
//	li_Error = ads_DataStore.ImportString( ls_Conversion, 1, 32000, 1, li_Num_Col)
//	IF li_Error >= 0 THEN
//		// Resetear los FLAGS de todo ( No tiene sentido recuperar parte nada m$$HEX1$$e100$$ENDHEX$$s ).
//		ads_DataStore.ResetUpdate()
//	END IF
//END IF
IF ab_Resetear THEN
	ads_DataStore.Reset()
END IF

IF TRIM(ls_conversion) = "" THEN RETURN 0

li_Error = ads_DataStore.ImportString( ls_Conversion, 1, 32000, 1, li_Num_Col)
IF li_Error >= 0 THEN
	ads_DataStore.ResetUpdate()
END IF

RETURN li_Error

end function

public function integer of_cargar_bloque (ref datawindow adw_datawindow, string as_bloque_cargar, integer ai_num_bloque);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_cargar_bloque_dw para n_controlador
// 
// Objetivo:	 	Se trata de cargar un bloque de datos recuperado del servidor de
//					negocio en un DataWindow.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	DataWindow adw_DataWindow (Objeto sobre el que cargar).
//					string as_bloque_cargar (Bloque de datos a cargar).
//					Aqu$$HEX2$$ed002000$$ENDHEX$$se reciben X bloques de datos separados por el separador
//					de bloque ISK_EOB.
//					Integer ai_Num_Bloque ( N$$HEX1$$fa00$$ENDHEX$$mero de bloque a recuperar ).
//						
// Devuelve:	integer ( 0 OK, -1 KO)
//
//	Fecha			Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	04/03/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//	29/07/97							Si recibe un bloque vacio no intenta convertirlo
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Posici$$HEX1$$f300$$ENDHEX$$n del separador decimal
long ll_Pos = 1
// Posicion del inicio y fin de bloque a recuperar
long ll_Inicio_Bloque = 1, ll_Fin_Bloque
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para hacia el bloque que necesitamos
integer li_Bloque
// Indica si debemos realizar conversi$$HEX1$$f300$$ENDHEX$$n decimal
boolean lb_Conversion_Decimal = FALSE
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow sobre el que se va a cargar
// el bloque de datos.
integer li_Num_Col, li_Col
// Guarda el string a cargar en el datawindow convertido
string ls_Conversion
// Separador decimal utilizado en el sistema
string ls_Decimal
// Guarda el bloque a cargar
string ls_Bloque
// Guarda si hubo error al importar
int li_Error
//
//////////////////////////////////////////////////

//1) Recorremos hasta encontrar el bloque que necesitamos
FOR li_Bloque = 1 TO ai_Num_Bloque
	// Recuperamos la siguiente posici$$HEX1$$f300$$ENDHEX$$n
	ll_Fin_Bloque = POS( as_bloque_cargar, ISK_EOB, ll_Inicio_Bloque )
	IF li_Bloque < ai_Num_Bloque THEN ll_Inicio_Bloque = ll_Fin_Bloque + 1
NEXT

// Comprobamos si se encontr$$HEX2$$f3002000$$ENDHEX$$el finalizador de bloque
IF ll_Fin_Bloque <= 0 THEN RETURN -1

ls_Bloque = MID( as_bloque_Cargar, ll_inicio_Bloque, ll_Fin_Bloque - ll_inicio_bloque )

// Recuperamos el separador decimal del sistema.
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Reseteamos el buffer
ids_Buffer.DataObject = "d_buffer"
ids_Buffer.Reset()

// Cargamos el bloque pasado como par$$HEX1$$e100$$ENDHEX$$metro en el Buffer para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
ids_Buffer.ImportString( ls_Bloque )

// Realizamos la conversi$$HEX1$$f300$$ENDHEX$$n de los campos dependiendo de las columnas donde se
// va a alojar. Convertimos los campos DATETIME, DATE, TIME
li_Num_Col = INTEGER( adw_DataWindow.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
	CHOOSE CASE UPPER(MID(adw_DataWindow.Describe("#"+STRING(li_Col)+".ColType"),1,7))
		CASE "DATETIM"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@ @@:@@:@@'")
		CASE "DATE"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@'")
		CASE "TIME"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@:@@:@@'")
		CASE "DECIMAL"
			lb_Conversion_Decimal = TRUE
	END CHOOSE
NEXT

// Recuperamos el string convertido
ls_Conversion = ids_Buffer.Describe( "DataWindow.Data" )

// Comprobamos si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del tipo decimal
IF lb_Conversion_Decimal AND ls_Decimal <> "." THEN
	// Necesita convertir pues existe una columna decimal y el separador decimal
	// del sistema es distinto al que se utiliza en el servidor C.
	DO
		ll_Pos = POS( ls_Conversion, ".",ll_Pos )
		IF ll_Pos > 0 THEN
			ls_Conversion = Replace( ls_Conversion, ll_Pos, 1, ",")
			ll_Pos++
		END IF
	LOOP WHILE ll_Pos > 0
END IF

// Hasta aqu$$HEX2$$ed002000$$ENDHEX$$hemos realizado la conversi$$HEX1$$f300$$ENDHEX$$n del BLOQUE DE DATOS pasado como 
// par$$HEX1$$e100$$ENDHEX$$metro. Debemos cargarlo en el DataWindow.
adw_DataWindow.Reset()

// 29/07/97
IF TRIM(ls_conversion) = "" THEN RETURN 0

li_Error = adw_DataWindow.ImportString( ls_Conversion ,1,10000,1, li_Num_Col, 1)
IF li_Error >= 0 THEN
	adw_DataWindow.ResetUpdate()
END IF

RETURN li_Error

end function

public function integer of_cargar_bloque (ref datawindowchild adwc_dwchild, string as_bloque_cargar, integer ai_num_bloque);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_cargar_bloque_dw para n_controlador
// 
// Objetivo:	 	Se trata de cargar un bloque de datos recuperado del servidor de
//					negocio en un DataWindow.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	DataWindow adwc_DWChild (Objeto sobre el que cargar).
//					string as_bloque_cargar (Bloque de datos a cargar).
//					Aqu$$HEX2$$ed002000$$ENDHEX$$se reciben X bloques de datos separados por el separador
//					de bloque ISK_EOB.
//					Integer ai_Num_Bloque ( N$$HEX1$$fa00$$ENDHEX$$mero de bloque a recuperar ).
//						
// Devuelve:	integer ( 0 OK, -1 KO)
//
//	Fecha			Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	04/03/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//	29/07/97							Si recibe un bloque vacio no intenta convertirlo
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Posici$$HEX1$$f300$$ENDHEX$$n del separador decimal
long ll_Pos = 1
// Posicion del inicio y fin de bloque a recuperar
long ll_Inicio_Bloque = 1, ll_Fin_Bloque
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para hacia el bloque que necesitamos
integer li_Bloque
// Indica si debemos realizar conversi$$HEX1$$f300$$ENDHEX$$n decimal
boolean lb_Conversion_Decimal = FALSE
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow sobre el que se va a cargar
// el bloque de datos.
integer li_Num_Col, li_Col
// Guarda el string a cargar en el datawindow convertido
string ls_Conversion
// Separador decimal utilizado en el sistema
string ls_Decimal
// Guarda el bloque a cargar
string ls_Bloque
// Guarda si hubo error al importar
int li_Error
//
//////////////////////////////////////////////////

//1) Recorremos hasta encontrar el bloque que necesitamos
FOR li_Bloque = 1 TO ai_Num_Bloque
	// Recuperamos la siguiente posici$$HEX1$$f300$$ENDHEX$$n
	ll_Fin_Bloque = POS( as_bloque_cargar, ISK_EOB, ll_Inicio_Bloque )
	IF li_Bloque < ai_Num_Bloque THEN ll_Inicio_Bloque = ll_Fin_Bloque + 1
NEXT

// Comprobamos si se encontr$$HEX2$$f3002000$$ENDHEX$$el finalizador de bloque
IF ll_Fin_Bloque <= 0 THEN RETURN -1

ls_Bloque = MID( as_bloque_Cargar, ll_inicio_Bloque, ll_Fin_Bloque - ll_inicio_bloque )

// Recuperamos el separador decimal del sistema.
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Reseteamos el buffer
ids_Buffer.DataObject = "d_buffer"
ids_Buffer.Reset()

// Cargamos el bloque pasado como par$$HEX1$$e100$$ENDHEX$$metro en el Buffer para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
ids_Buffer.ImportString( ls_Bloque )

// Realizamos la conversi$$HEX1$$f300$$ENDHEX$$n de los campos dependiendo de las columnas donde se
// va a alojar. Convertimos los campos DATETIME, DATE, TIME
li_Num_Col = INTEGER( adwc_DWChild.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
	CHOOSE CASE UPPER(MID(adwc_DWChild.Describe("#"+STRING(li_Col)+".ColType"),1,7))
		CASE "DATETIM"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@ @@:@@:@@'")
		CASE "DATE"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@'")
		CASE "TIME"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@:@@:@@'")
		CASE "DECIMAL"
			lb_Conversion_Decimal = TRUE
	END CHOOSE
NEXT

// Recuperamos el string convertido
ls_Conversion = ids_Buffer.Describe( "DataWindow.Data" )

// Comprobamos si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del tipo decimal
IF lb_Conversion_Decimal AND ls_Decimal <> "." THEN
	// Necesita convertir pues existe una columna decimal y el separador decimal
	// del sistema es distinto al que se utiliza en el servidor C.
	DO
		ll_Pos = POS( ls_Conversion, ".",ll_Pos )
		IF ll_Pos > 0 THEN
			ls_Conversion = Replace( ls_Conversion, ll_Pos, 1, ",")
			ll_Pos++
		END IF
	LOOP WHILE ll_Pos > 0
END IF

// Hasta aqu$$HEX2$$ed002000$$ENDHEX$$hemos realizado la conversi$$HEX1$$f300$$ENDHEX$$n del BLOQUE DE DATOS pasado como 
// par$$HEX1$$e100$$ENDHEX$$metro. Debemos cargarlo en el DataWindow.
adwc_DWChild.Reset()

IF TRIM(ls_conversion) = "" THEN RETURN 0

li_Error = adwc_DWChild.ImportString( ls_Conversion ,1,10000,1, li_Num_Col, 1)
IF li_Error >= 0 THEN
	adwc_DWChild.ResetUpdate()
END IF

RETURN li_Error

end function

public function integer of_cargar_bloque (ref datawindowchild adwc_dwchild, string as_bloque_cargar, integer ai_num_bloque, boolean ab_resetear);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_cargar_bloque_dw para n_controlador
// 
// Objetivo:	 	Se trata de cargar un bloque de datos recuperado del servidor de
//					negocio en un DataWindow.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	DataWindow adwc_DWChild (Objeto sobre el que cargar).
//					string as_bloque_cargar (Bloque de datos a cargar).
//					Aqu$$HEX2$$ed002000$$ENDHEX$$se reciben X bloques de datos separados por el separador
//					de bloque ISK_EOB.
//					Integer ai_Num_Bloque ( N$$HEX1$$fa00$$ENDHEX$$mero de bloque a recuperar ).
//						
// Devuelve:	integer ( 0 OK, -1 KO)
//
//	Fecha			Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	04/03/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//	29/07/97							Si recibe un bloque vacio no intenta convertirlo
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Posici$$HEX1$$f300$$ENDHEX$$n del separador decimal
long ll_Pos = 1
// Posicion del inicio y fin de bloque a recuperar
long ll_Inicio_Bloque = 1, ll_Fin_Bloque
// Guarda un $$HEX1$$ed00$$ENDHEX$$ndice para hacia el bloque que necesitamos
integer li_Bloque
// Indica si debemos realizar conversi$$HEX1$$f300$$ENDHEX$$n decimal
boolean lb_Conversion_Decimal = FALSE
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow sobre el que se va a cargar
// el bloque de datos.
integer li_Num_Col, li_Col
// Guarda el string a cargar en el datawindow convertido
string ls_Conversion
// Separador decimal utilizado en el sistema
string ls_Decimal
// Guarda el bloque a cargar
string ls_Bloque
// Guarda si hubo error al importar
int li_Error
//
//////////////////////////////////////////////////

//1) Recorremos hasta encontrar el bloque que necesitamos
FOR li_Bloque = 1 TO ai_Num_Bloque
	// Recuperamos la siguiente posici$$HEX1$$f300$$ENDHEX$$n
	ll_Fin_Bloque = POS( as_bloque_cargar, ISK_EOB, ll_Inicio_Bloque )
	IF li_Bloque < ai_Num_Bloque THEN ll_Inicio_Bloque = ll_Fin_Bloque + 1
NEXT

// Comprobamos si se encontr$$HEX2$$f3002000$$ENDHEX$$el finalizador de bloque
IF ll_Fin_Bloque <= 0 THEN RETURN -1

ls_Bloque = MID( as_bloque_Cargar, ll_inicio_Bloque, ll_Fin_Bloque - ll_inicio_bloque )

// Recuperamos el separador decimal del sistema.
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Reseteamos el buffer
ids_Buffer.DataObject = "d_buffer"
ids_Buffer.Reset()

// Cargamos el bloque pasado como par$$HEX1$$e100$$ENDHEX$$metro en el Buffer para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
ids_Buffer.ImportString( ls_Bloque )

// Realizamos la conversi$$HEX1$$f300$$ENDHEX$$n de los campos dependiendo de las columnas donde se
// va a alojar. Convertimos los campos DATETIME, DATE, TIME
li_Num_Col = INTEGER( adwc_DWChild.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
	CHOOSE CASE UPPER(MID(adwc_DWChild.Describe("#"+STRING(li_Col)+".ColType"),1,7))
		CASE "DATETIM"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@ @@:@@:@@'")
		CASE "DATE"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@@@/@@/@@'")
		CASE "TIME"
			ids_Buffer.Modify("#"+STRING( li_Col )+".Edit.Format='@@:@@:@@'")
		CASE "DECIMAL"
			lb_Conversion_Decimal = TRUE
	END CHOOSE
NEXT

// Recuperamos el string convertido
ls_Conversion = ids_Buffer.Describe( "DataWindow.Data" )

// Comprobamos si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del tipo decimal
IF lb_Conversion_Decimal AND ls_Decimal <> "." THEN
	// Necesita convertir pues existe una columna decimal y el separador decimal
	// del sistema es distinto al que se utiliza en el servidor C.
	DO
		ll_Pos = POS( ls_Conversion, ".",ll_Pos )
		IF ll_Pos > 0 THEN
			ls_Conversion = Replace( ls_Conversion, ll_Pos, 1, ",")
			ll_Pos++
		END IF
	LOOP WHILE ll_Pos > 0
END IF

// Hasta aqu$$HEX2$$ed002000$$ENDHEX$$hemos realizado la conversi$$HEX1$$f300$$ENDHEX$$n del BLOQUE DE DATOS pasado como 
// par$$HEX1$$e100$$ENDHEX$$metro. Debemos cargarlo en el DataWindow.
// Comprobamos si hay que resetear

// MODIFICACION 29/07/97

//IF ab_Resetear THEN
//	adwc_DWChild.Reset()
//	li_Error = adwc_DWChild.ImportString( ls_Conversion ,1,32000,1, li_Num_Col)
//	IF li_Error >= 0 THEN
//		adwc_DWChild.ResetUpdate()
//	END IF
//ELSE
//	// No quiere resetear
//	li_Error = adwc_DWChild.ImportString( ls_Conversion, 1, 32000, 1, li_Num_Col)
//	IF li_Error >= 0 THEN
//		// Resetear los FLAGS de todo ( No tiene sentido recuperar parte nada m$$HEX1$$e100$$ENDHEX$$s ).
//		adwc_DWChild.ResetUpdate()
//	END IF
//END IF

IF ab_Resetear THEN
	adwc_DWChild.Reset()
END IF

IF TRIM(ls_conversion)= "" THEN RETURN 0

li_Error = adwc_DWChild.ImportString( ls_Conversion, 1, 32000, 1, li_Num_Col)
IF li_Error >= 0 THEN
	adwc_DWChild.ResetUpdate()
END IF

RETURN li_Error

end function

public function integer of_ejecutar (string as_funcion, integer ai_instruccion, ref any aa_parametros[], string as_entrada, ref powerobject apo_objetos[]);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	OF_EJECUTAR para n_controlador
// 
// Objetivo:	Ejecuta la funci$$HEX1$$f300$$ENDHEX$$n pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//					Le pasa seg$$HEX1$$fa00$$ENDHEX$$n estandar la serie de instrucciones,
//					los par$$HEX1$$e100$$ENDHEX$$metros y los bloques.
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:	string as_Nombre_Funcion:Funci$$HEX1$$f300$$ENDHEX$$n a ejecutar.
//				int ai_Instrucciones[]: Array de instrucciones a ejecutar.
//				Any aa_Parametros[]:	Array de par$$HEX1$$e100$$ENDHEX$$metros a enviar a  la
//											funci$$HEX1$$f300$$ENDHEX$$n.
//				string as_Entrada: Bloques de entrada a la funci$$HEX1$$f300$$ENDHEX$$n.
//
//	Salida:	string as_Salida: Bloques de salida a la funci$$HEX1$$f300$$ENDHEX$$n.
//						
// Devuelve:	integer ( <0 error, >= 0 OK ).
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	4/02/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Parametros fijos: Instrucciones + Parametros
string ls_Param_Fijos = ""
// Dimensi$$HEX1$$f300$$ENDHEX$$n e $$HEX1$$ed00$$ENDHEX$$ndice para recorrer arrays
integer li_Dimension, li_Indice
// Valor string a convertir
string ls_Valor
// Posici$$HEX1$$f300$$ENDHEX$$n de una ocurrencia
long ll_Posicion
// String de entrada a la funci$$HEX1$$f300$$ENDHEX$$n y String de salida
string ls_Entrada
string ls_Salida[]
// Variable de retorno
string ls_Retorno 
//
//////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
// COMPONEMOS LOS PAR$$HEX1$$c100$$ENDHEX$$METROS FIJOS A MANDAR
//
// INSTRUCCION///
// MODIFICADO JCARLOS. 16/7/97
// Se estaba incluyendo un separador de campo que daba problemas en FGEN.PC, 
// cuando alguno de los par$$HEX1$$e100$$ENDHEX$$metros era vacio. Se ha eliminado el separador de campo 
// del $$HEX1$$fa00$$ENDHEX$$ltimo elemento de un bloque.
ls_Param_Fijos = STRING( ai_Instruccion ) + ISK_EOL

// PARAMETROS ///////////
li_Dimension = UPPERBOUND( aa_parametros[] )
FOR li_Indice = 1 TO li_Dimension
	// Vamos a cargar los par$$HEX1$$e100$$ENDHEX$$metros pasados como par$$HEX1$$e100$$ENDHEX$$metros.
	// Pueden ser de cualquier tipo pero los tipos que nos interesan
	// son si son decimales debemos colocar el car$$HEX1$$e100$$ENDHEX$$cter . que es el 
	// car$$HEX1$$e100$$ENDHEX$$cter que entiende C.
	// Con las fechas ocurre lo mismo. Debemos convertir al formato
	// que entiende C que es "YYYYMMDD".

	// Pasamos el valor del par$$HEX1$$e100$$ENDHEX$$metro a STRING
	ls_Valor = STRING( aa_parametros[ li_Indice ] )
	// Comprobamos si el par$$HEX1$$e100$$ENDHEX$$metro no es vacio o 0
	IF ls_Valor <> "" AND ls_Valor <> "0" THEN
		// Comprobamos si el par$$HEX1$$e100$$ENDHEX$$metro es fecha
		IF isDate( ls_Valor ) THEN
			// Es una fecha y componemos sus valores
			ls_Param_Fijos = ls_Param_Fijos + &
					STRING( aa_parametros[li_Indice],"YYYYMMDD") + ISK_EOF
		ELSEIF isNumber( ls_Valor ) THEN
			ll_Posicion = POS( ls_Valor, isk_sepdec, 1)
			IF ll_Posicion > 0 THEN
				// Colocamos siempre un .
				ls_Valor = REPLACE(ls_Valor, ll_Posicion, LEN(ISK_SEPDEC), ".")
			END IF
			ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF
		ELSE
			ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF				
		END IF
	ELSE
		ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF				
	END IF
NEXT
// MODIFICADO JCARLOS. 16/7/97
// Se estaba incluyendo un separador de campo que daba problemas en FGEN.PC, 
// cuando alguno de los par$$HEX1$$e100$$ENDHEX$$metros era vacio. Se ha eliminado el separador de campo 
// del $$HEX1$$fa00$$ENDHEX$$ltimo elemento de un bloque.
IF li_Dimension > 0 THEN
	ls_Param_Fijos = LEFT( ls_Param_Fijos, LEN(ls_Param_Fijos) - LEN(isk_EOF) )
END IF
ls_Param_Fijos = ls_Param_Fijos + ISK_EOL

// BLOQUES //
IF NOT isNull(as_entrada) AND as_Entrada <> "" THEN
	// Concatenamos los bloques.
	ls_Param_Fijos = ls_Param_Fijos + as_Entrada
END IF
//
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// RECUPERACI$$HEX1$$d300$$ENDHEX$$N DE LOS DATOS.
// El objeto de comunicaciones realiza diferentes cortes de la
// informaci$$HEX1$$f300$$ENDHEX$$n, pues actualmente no se puede recibir m$$HEX1$$e100$$ENDHEX$$s de 64K.
// Para resolver este problema realizamos sucesivas llamadas
// al objeto de comunicaciones indicando el n$$HEX1$$fa00$$ENDHEX$$mero de trama (64K)
// que queremos recibir
// COMPONEMOS LOS PAR$$HEX1$$c100$$ENDHEX$$METROS A MANDAR ////////////////
//
// Componemos la cabecera que siempre van al servidor
ls_Entrada = ls_Param_Fijos
//
//////////////////////
	
// RECUPERAMOS LOS DATOS /////////////
//
IF of_Llamar_FN( as_funcion, ls_Salida[], ls_Entrada,1) <> 0 THEN 
	RETURN -1
END IF
//
///////////
	
//
/////////////////////////////////////////////////////////////

// ATENCI$$HEX1$$d300$$ENDHEX$$N AQU$$HEX1$$cd00$$ENDHEX$$. 
// La funci$$HEX1$$f300$$ENDHEX$$n of_Llamar_FN devuelve un array de string que contendr$$HEX2$$e1002000$$ENDHEX$$elementos
// de 8k aproximadamente. Como estamos trabajando con la versi$$HEX1$$f300$$ENDHEX$$n de 32 bits
// no tenemos la limitaci$$HEX1$$f300$$ENDHEX$$n de 32K en el formato STRING. Por tanto, vamos a concatenar
// todos los bloques de 8K que no tienen ning$$HEX1$$fa00$$ENDHEX$$n significado de manera unitaria y vamos
// a concatenarlos en un solo string.
// Si estuvieramos trabajando con 16 bits y con la limitaci$$HEX1$$f300$$ENDHEX$$n de ancho del string deber$$HEX1$$ed00$$ENDHEX$$amos
// recuperar los diferentes bloques a nivel de registro ( posible soluci$$HEX1$$f300$$ENDHEX$$n ).
// Componemos la trama total
li_Dimension = UPPERBOUND( ls_Salida )
FOR li_Indice = 1 TO li_Dimension 
	ls_Retorno = ls_Retorno + ls_Salida[ li_Indice ]
NEXT
//
/////////////////

// Carga del array de objetos pasados como par$$HEX1$$e100$$ENDHEX$$metro /////////////////////////
//
DataWindow ldw_DW
DataWindowChild ldwc_DWC
DataStore lds_DS
li_Dimension = UPPERBOUND( apo_objetos[])
FOR li_Indice = 1 TO li_Dimension
	CHOOSE CASE apo_Objetos[li_Indice].TypeOf()
		CASE DATAWINDOW!
			// Es un Datawindow
			ldw_DW = apo_Objetos[li_Indice]
			IF this.of_Cargar_Bloque( ldw_DW, ls_Retorno, li_indice ) < 0 THEN RETURN -1
		CASE DATASTORE!
			// Es un DataStore
			lds_DS = apo_Objetos[li_Indice]
			IF this.of_Cargar_Bloque( lds_DS, ls_Retorno, li_indice ) < 0 THEN RETURN -1
		CASE ELSE
			// Es una DataWindowChild
			ldwc_DWC = apo_Objetos[li_Indice]
			IF this.of_Cargar_Bloque( ldwc_DWC, ls_Retorno, li_indice ) < 0 THEN RETURN -1
	END CHOOSE
NEXT
//
/////////////////////////

RETURN 0
end function

public function long of_configuracion (ref window pw_frame, string ps_servidor, string ps_protocolo);// MODIFICADO JCARLOS.
// Esta funci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta y se mantiene temporalmente hasta que se modifiquen 
// las llamadas desde el objeto de comunicaciones openlink al nuevo objeto n_oc_32.
this.of_Configuracion(ps_servidor, "opensgi.ini")
return 0
end function

public subroutine of_reset ();// MODIFICADO JCARLOS.
// Esta funci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta y se mantiene temporalmente hasta que se modifiquen 
// las llamadas desde el objeto de comunicaciones openlink al nuevo objeto n_oc_32.

end subroutine

public function integer of_registrar_funcion (string as_funcion, character ac_metodo, unsignedinteger aui_longitud_registro);// MODIFICADO JCARLOS.
// Esta funci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta y se mantiene temporalmente hasta que se modifiquen 
// las llamadas desde el objeto de comunicaciones openlink al nuevo objeto n_oc_32.

is_funcion = as_funcion

RETURN 0
end function

public function integer of_enlazacampo (unsignedinteger aui_pos_campo, unsignedinteger aui_inicio, unsignedinteger aui_longitud, character ac_tipo, string ps_metodos);// MODIFICADO JCARLOS.
// Esta funci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta y se mantiene temporalmente hasta que se modifiquen 
// las llamadas desde el objeto de comunicaciones openlink al nuevo objeto n_oc_32.

RETURN 0
end function

public subroutine of_registrar_delimitador (string as_columna, string as_fila);// MODIFICADO JCARLOS.
// Esta funci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta y se mantiene temporalmente hasta que se modifiquen 
// las llamadas desde el objeto de comunicaciones openlink al nuevo objeto n_oc_32.
end subroutine

public function long of_getitemnumber (ref string as_Bloque, long al_Registro, integer ai_Columna);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_GETITEMNUMBER
// 
// Objetivo:	 	Se trata de recuperar de un bloque de datos un valor tipo num$$HEX1$$e900$$ENDHEX$$rico
//					de una columna y registro pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	string as_bloque: Bloque de datos a tratar.
//					integer al_registro: N$$HEX1$$fa00$$ENDHEX$$mero de registro.
//					integer ai_columna: N$$HEX1$$fa00$$ENDHEX$$mero de columna.
//						
// Devuelve:	string
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
// 	4-4-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////

RETURN LONG(this.of_GetItemString( as_Bloque, al_registro, ai_columna ))

end function

public function string of_getitemstring (ref string as_bloque, long al_registro, integer ai_columna);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_GETITEMSTRING 
// 
// Objetivo:	 	Se trata de recuperar de un bloque de datos un valor tipo string
//					de una columna y registro pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	string as_bloque: Bloque de datos a tratar.
//					integer ai_columna: N$$HEX1$$fa00$$ENDHEX$$mero de columna.
//					integer al_registro: N$$HEX1$$fa00$$ENDHEX$$mero de registro.
//						
// Devuelve:	string
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
// 	4-4-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
long ll_Registros
//
//////////////////////////////////////////////////

ids_buffer.Reset()
ll_Registros = ids_Buffer.ImportString( as_bloque ) 
IF ll_Registros < al_registro THEN RETURN ""
RETURN ids_Buffer.GetItemString( al_registro, ai_columna )






RETURN ""
end function

public function decimal of_getitemdecimal (ref string as_Bloque, long al_Registro, integer ai_Columna);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_GETITEMDECIMAL
// 
// Objetivo:	 	Se trata de recuperar de un bloque de datos un valor tipo DECIMAL
//					de una columna y registro pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	string as_bloque: Bloque de datos a tratar.
//					integer al_registro: N$$HEX1$$fa00$$ENDHEX$$mero de registro.
//					integer ai_columna: N$$HEX1$$fa00$$ENDHEX$$mero de columna.
//						
// Devuelve:	string
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
// 	4-4-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////

RETURN REAL(this.of_GetItemString( as_Bloque, al_registro, ai_columna ))

end function

public function string of_bloque (ref string as_bloques, integer ai_bloque_inicial, integer ai_bloque_final);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_bloque 
// 
// Objetivo:	 	Recuperar los bloques indicados del String pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	string as_bloques
//					integer ai_bloque_inicial
//					integer ai_bloque_final
//
// Devuelve:	string
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
// 	3-3-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda la posici$$HEX1$$f300$$ENDHEX$$n del final de bloque e inicio del bloque
long ll_Pos_Inicio, ll_Pos_Final
// Guarda las posiciones para recorrer el string
long ll_Pos_Aux , ll_Pos_Anterior = 1
// Guarda un contador de iteraciones
integer li_Contador = 1
// Indica que se encontr$$HEX2$$f3002000$$ENDHEX$$el bloque inicial
boolean lb_Encontrado_Inicial = FALSE
//
//////////////////////////////////////////////////

DO
	// Recuperamos el siguiente fin de bloque
	ll_Pos_Aux = POS(as_bloques, ISK_EOB, ll_Pos_Anterior )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$el separador de bloque
	IF ll_Pos_Aux > 0 THEN
		// Comprobamos si el bloque encontrado es el bloque inicial
		IF  li_Contador = ai_bloque_inicial THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$el bloque inicial
			ll_Pos_Inicio = ll_Pos_Anterior
		END IF
		IF li_Contador = ai_bloque_final THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$el bloque final
			ll_Pos_Final = ll_Pos_Aux + LEN(ISK_EOB)
		END IF
	END IF
	li_Contador ++
	ll_Pos_Anterior = ll_Pos_Aux + LEN(ISK_EOB)
LOOP WHILE li_Contador <= ai_bloque_final

// Hemos recuperado la posici$$HEX1$$f300$$ENDHEX$$n inicio y final del bloque a devolver
RETURN MID( as_bloques, ll_Pos_Inicio, ll_Pos_Final - ll_Pos_Inicio  )

end function

public function string of_codigo_error ();//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_codigo_error
//       
// Objetivo:	Cuando ocurre un error en el OPENLINK, llega codificado de la siguiente
//                manera:
//				El mensaje de error se encuentra en la variable de instancia
//				is_error_logica_bd.
//				Si es un error de l$$HEX1$$f300$$ENDHEX$$gica devuelven el c$$HEX1$$f300$$ENDHEX$$digo del mensaje:
//					is_error_logica = "EE107@PARAM1@PARAM2#"
//						donde @ = separador de columna
//						donde # = separador de fila.
//				Si es un error de base de datos devuelve el c$$HEX1$$f300$$ENDHEX$$digo de error de la BD:
//					is_error_logica="BDXXXX@mensaje@mensaje#"
//				Si es un error interno del objeto de comunicaciones:
//					is_error_logica="mensaje del objeto de comunicaciones"
//
//
// Fecha Responsable Actuaci$$HEX1$$f300$$ENDHEX$$n
//------------------------------------------------
// 11-6-97		JCC		INCIDENCIA RELACIONADA 487
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda la posici$$HEX1$$f300$$ENDHEX$$n de fin de campo
long ll_Campo
long ll_Anterior
// Guarda los par$$HEX1$$e100$$ENDHEX$$metros
string ls_Param1, ls_Param2, ls_Param3
//
//////////////////////////////////////////////////

// Comprobamos el tipo de error
IF ( il_Error > 0 AND il_Error < 90000000) THEN
	// Error del objeto de comunicaciones
	// Ocurri$$HEX2$$f3002000$$ENDHEX$$un error en el servidor de funciones de negocio.
	RETURN "EG58"
ELSE
	// Error l$$HEX1$$f300$$ENDHEX$$gico o de base de datos recuperamos el c$$HEX1$$f300$$ENDHEX$$digo de error
	// Si es l$$HEX1$$f300$$ENDHEX$$gico contedr$$HEX2$$e1002000$$ENDHEX$$el c$$HEX1$$f300$$ENDHEX$$digo del mensaje a mostrar "AG001", si es de la base
	// de datos contendr$$HEX2$$e1002000$$ENDHEX$$el n$$HEX1$$fa00$$ENDHEX$$mero del error de la base de datos="BD10007"
	// Recuperaci$$HEX1$$f300$$ENDHEX$$n de los par$$HEX1$$e100$$ENDHEX$$metros del mensaje
	ll_Campo = POS( is_error_logica_bd, isk_EOC )
	IF ll_Campo > 0 THEN
		ls_Param1 = trim(left( is_error_logica_bd,ll_Campo -1 ))
	END IF	
END IF

RETURN ls_Param1
end function

public function integer of_ejecutar (string as_funcion, ref integer ai_instruccion[], ref any aa_parametros[], string as_entrada, ref string as_salida);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	OF_EJECUTAR para n_controlador
// 
// Objetivo:	Ejecuta la funci$$HEX1$$f300$$ENDHEX$$n pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//					Le pasa seg$$HEX1$$fa00$$ENDHEX$$n estandar la serie de instrucciones,
//					los par$$HEX1$$e100$$ENDHEX$$metros y los bloques.
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:	string as_Nombre_Funcion:Funci$$HEX1$$f300$$ENDHEX$$n a ejecutar.
//				int ai_Instrucciones[]: Array de instrucciones a ejecutar.
//				Any aa_Parametros[]:	Array de par$$HEX1$$e100$$ENDHEX$$metros a enviar a  la
//											funci$$HEX1$$f300$$ENDHEX$$n.
//				string as_Entrada: Bloques de entrada a la funci$$HEX1$$f300$$ENDHEX$$n.
//
//	Salida:	string as_Salida: Bloques de salida a la funci$$HEX1$$f300$$ENDHEX$$n.
//						
// Devuelve:	integer ( <0 error, >= 0 OK ).
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	4/02/97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Parametros fijos: Instrucciones + Parametros
string ls_Param_Fijos = ""
// Dimensi$$HEX1$$f300$$ENDHEX$$n e $$HEX1$$ed00$$ENDHEX$$ndice para recorrer arrays
integer li_Dimension, li_Indice
// Valor string a convertir
string ls_Valor
// Posici$$HEX1$$f300$$ENDHEX$$n de una ocurrencia
long ll_Posicion
// String de entrada a la funci$$HEX1$$f300$$ENDHEX$$n y String de salida
string ls_Entrada
string ls_Salida[]
// Variable de retorno
string ls_Retorno 
//
//////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
// COMPONEMOS LOS PAR$$HEX1$$c100$$ENDHEX$$METROS FIJOS A MANDAR
//
// INSTRUCCIONES ///


long ll_return
// Security 
if of_securityconnect(is_proyecto, is_usuario, is_password, ll_return) > 0 then
	is_Error_Logica_BD = "Se ha producido un error al intentar validar el usuario del sistema : " + is_proyecto + ". Es posible que el servidor no se encuentre disponible en este momento."
	return ERROR_SEC
end if

li_Dimension = UpperBound( ai_instruccion[])
FOR li_Indice = 1 TO li_Dimension
	ls_Param_Fijos = 	ls_Param_Fijos + &
							STRING( ai_Instruccion[li_Indice] ) + ISK_EOF
NEXT
IF li_Dimension > 0 THEN
	ls_Param_Fijos = LEFT( ls_Param_Fijos, LEN(ls_Param_Fijos) - LEN(isk_EOF) )
END IF
ls_Param_Fijos = ls_Param_Fijos + ISK_EOL

// PARAMETROS ///////////
li_Dimension = UPPERBOUND( aa_parametros[] )
FOR li_Indice = 1 TO li_Dimension
	// Vamos a cargar los par$$HEX1$$e100$$ENDHEX$$metros pasados como par$$HEX1$$e100$$ENDHEX$$metros.
	// Pueden ser de cualquier tipo pero los tipos que nos interesan
	// son si son decimales debemos colocar el car$$HEX1$$e100$$ENDHEX$$cter . que es el 
	// car$$HEX1$$e100$$ENDHEX$$cter que entiende C.
	// Con las fechas ocurre lo mismo. Debemos convertir al formato
	// que entiende C que es "YYYYMMDD".

	// Pasamos el valor del par$$HEX1$$e100$$ENDHEX$$metro a STRING
	ls_Valor = STRING( aa_parametros[ li_Indice ] )
	// Comprobamos si el par$$HEX1$$e100$$ENDHEX$$metro no es vacio o 0
	IF ls_Valor <> "" AND ls_Valor <> "0" THEN
		// Comprobamos si el par$$HEX1$$e100$$ENDHEX$$metro es fecha
		IF isDate( ls_Valor ) THEN
			// Es una fecha y componemos sus valores
			ls_Param_Fijos = ls_Param_Fijos + &
					STRING( aa_parametros[li_Indice],"YYYYMMDD") + ISK_EOF
		ELSEIF isNumber( ls_Valor ) THEN
			ll_Posicion = POS( ls_Valor, isk_sepdec, 1)
			IF ll_Posicion > 0 THEN
				// Colocamos siempre un .
				ls_Valor = REPLACE(ls_Valor, ll_Posicion, LEN(ISK_SEPDEC), ".")
			END IF
			ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF
		ELSE
			ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF				
		END IF
	ELSE
		ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF				
	END IF
NEXT
// MODIFICADO JCARLOS. 16/7/97
// Se estaba incluyendo un separador de campo que daba problemas en FGEN.PC, 
// cuando alguno de los par$$HEX1$$e100$$ENDHEX$$metros era vacio. Se ha eliminado el separador de campo 
// del $$HEX1$$fa00$$ENDHEX$$ltimo elemento de un bloque.
IF li_Dimension > 0 THEN
	ls_Param_Fijos = LEFT( ls_Param_Fijos, LEN(ls_Param_Fijos) - LEN(isk_EOF) )
END IF
ls_Param_Fijos = ls_Param_Fijos + ISK_EOL

// BLOQUES //
IF NOT isNull(as_entrada) AND as_Entrada <> "" THEN
	// Concatenamos los bloques.
	ls_Param_Fijos = ls_Param_Fijos + as_Entrada
END IF
//
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// RECUPERACI$$HEX1$$d300$$ENDHEX$$N DE LOS DATOS.
// El objeto de comunicaciones realiza diferentes cortes de la
// informaci$$HEX1$$f300$$ENDHEX$$n, pues actualmente no se puede recibir m$$HEX1$$e100$$ENDHEX$$s de 64K.
// Para resolver este problema realizamos sucesivas llamadas
// al objeto de comunicaciones indicando el n$$HEX1$$fa00$$ENDHEX$$mero de trama (64K)
// que queremos recibir
// COMPONEMOS LOS PAR$$HEX1$$c100$$ENDHEX$$METROS A MANDAR ////////////////
//
// Componemos la cabecera que siempre van al servidor
ls_Entrada = ls_Param_Fijos
//
//////////////////////
	
// RECUPERAMOS LOS DATOS /////////////
//
IF of_Llamar_FN( as_funcion, ls_Salida[], ls_Entrada,1) <> 0 THEN 
	RETURN -1
END IF
//
///////////
	
//
/////////////////////////////////////////////////////////////

// ATENCI$$HEX1$$d300$$ENDHEX$$N AQU$$HEX1$$cd00$$ENDHEX$$. 
// La funci$$HEX1$$f300$$ENDHEX$$n of_Llamar_FN devuelve un array de string que contendr$$HEX2$$e1002000$$ENDHEX$$elementos
// de 8k aproximadamente. Como estamos trabajando con la versi$$HEX1$$f300$$ENDHEX$$n de 32 bits
// no tenemos la limitaci$$HEX1$$f300$$ENDHEX$$n de 32K en el formato STRING. Por tanto, vamos a concatenar
// todos los bloques de 8K que no tienen ning$$HEX1$$fa00$$ENDHEX$$n significado de manera unitaria y vamos
// a concatenarlos en un solo string.
// Si estuvieramos trabajando con 16 bits y con la limitaci$$HEX1$$f300$$ENDHEX$$n de ancho del string deber$$HEX1$$ed00$$ENDHEX$$amos
// recuperar los diferentes bloques a nivel de registro ( posible soluci$$HEX1$$f300$$ENDHEX$$n ).
// Componemos la trama total
li_Dimension = UPPERBOUND( ls_Salida )
FOR li_Indice = 1 TO li_Dimension 
	ls_Retorno = ls_Retorno + ls_Salida[ li_Indice ]
NEXT
//
/////////////////
as_salida = ls_Retorno
RETURN 0
end function

public subroutine of_display_error ();//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_display_error
// 
// Objetivo:	Se trata de mostrar el mensaje de error ocurrido al ejecutar una funci$$HEX1$$f300$$ENDHEX$$n
//				 de negocio.
//				El mensaje de error se encuentra en la variable de instancia
//				is_error_logica_bd.
//				Si es un error de l$$HEX1$$f300$$ENDHEX$$gica devuelven el c$$HEX1$$f300$$ENDHEX$$digo del mensaje:
//					is_error_logica = "EE107@PARAM1@PARAM2#"
//						donde @ = separador de columna
//						donde # = separador de fila.
//				Si es un error de base de datos devuelve el c$$HEX1$$f300$$ENDHEX$$digo de error de la BD:
//					is_error_logica="BDXXXX@mensaje@mensaje#"
//				Si es un error interno del objeto de comunicaciones:
//					is_error_logica="mensaje del objeto de comunicaciones"
//
//
// Fecha Responsable Actuaci$$HEX1$$f300$$ENDHEX$$n
//------------------------------------------------
// 11-6-97		JCC		INCIDENCIA RELACIONADA 487 
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda la posici$$HEX1$$f300$$ENDHEX$$n de fin de campo
long ll_Campo
long ll_Anterior
// Guarda los par$$HEX1$$e100$$ENDHEX$$metros
string ls_Param1, ls_Param2, ls_Param3
//
//////////////////////////////////////////////////

// Comprobamos el tipo de error
IF ( il_Error > 0 AND il_Error < 90000000) THEN
	// Error del objeto de comunicaciones
	MessageBox("Error","Error Openlink :"+ is_error_logica_Bd,Stopsign!)
ELSE
	
	// Recuperaci$$HEX1$$f300$$ENDHEX$$n de los par$$HEX1$$e100$$ENDHEX$$metros del mensaje
	ll_Campo = POS( is_error_logica_bd, isk_EOC )
		
	IF ll_Campo > 0 THEN
		ls_Param1 = trim(left( is_error_logica_bd,ll_Campo -1 ))
		ll_Anterior = ll_Campo + 1
		ll_Campo = POS( is_error_logica_bd, isk_EOC , ll_Anterior)
		IF ll_Campo > 0 THEN
			ls_Param2 = trim(mid( is_error_logica_bd, ll_Anterior, ll_Campo - ll_Anterior ))
			ll_Anterior = ll_Campo +1
			ll_Campo = POS( is_error_logica_bd, isk_EOR , ll_Anterior)
			IF ll_Campo > 0 THEN
				ls_Param3 = trim(mid( is_error_logica_bd, ll_Anterior, ll_Campo - ll_Anterior ))
			ELSE
				// Error
				MessageBox("Error", "Error en el objeto de comunicaciones",STOPSIGN!,OK!)
				RETURN
			END IF
		ELSE
			// Error
			MessageBox("Error", "Error en el objeto de comunicaciones",STOPSIGN!,OK!)
			RETURN
		END IF
	ELSE
		// Error
		MessageBox("Error", "Error en el objeto de comunicaciones",STOPSIGN!,OK!)
		RETURN
	END IF
	
	// Error de l$$HEX1$$f300$$ENDHEX$$gica o Base de datos
	IF lower(left(is_error_logica_bd,2)) = "bd" THEN
		// Error de base de datos
		MessageBox("Error","Error al operar con la base de datos.~r" + &
							"C$$HEX1$$f300$$ENDHEX$$digo de error: "+ls_param1 +"~r"+&
							"Mensaje desarrollo: "+ls_param2+ls_param3,Stopsign!)
	ELSE
		// Error de l$$HEX1$$f300$$ENDHEX$$gica
//		IF isValid( gnv_msg ) THEN
//			gnv_msg.f_mensaje( ls_param1, ls_param2,ls_param3,OK!)
//		ELSE
			MessageBox("Error","Error en el objeto de comunicaciones.~r"+&
				"C$$HEX1$$f300$$ENDHEX$$digo de error:"+ls_param1+"~r"+&
				"Mensaje desarrollo:"+ls_param2+"/"+ls_param3 ,StopSign!)
//		END IF
	END IF
END IF


end subroutine

public function string of_recuperar_bloque (ref datastore ads_datastore, long al_registro_inicial, long al_registro_final, string as_lista_columnas, dwbuffer aenum_dwbuffer, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Nombre de la columna tratada
string ls_Columna
//
///////////////////////////////////////////////

///////////////////////////////////////////////////////
// MODIFICADO JCARLOS. 10/7/97. 
// 
// 1) 	Si nos piden un registro final que sobrepasa el l$$HEX1$$ed00$$ENDHEX$$mite de registros existentes en 
// 		el datawindow para el buffer especificado.
//		En este caso colocaremos el registro final como el $$HEX1$$fa00$$ENDHEX$$ltimo registro del datawindow
//		para el buffe especificado.
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF al_Registro_Final > ads_datastore.RowCount() THEN
			al_Registro_Final = ads_datastore.RowCount()
		END IF
	CASE DELETE!
		IF al_Registro_Final > ads_datastore.DeletedCount() THEN
			al_Registro_Final = ads_datastore.DeletedCount()
		END IF
	CASE FILTER!
		IF al_Registro_Final > ads_datastore.FilteredCount() THEN
			al_Registro_Final = ads_datastore.FilteredCount()
		END IF
END CHOOSE
// 2) 	Debemos comprobar si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites (registro inicial, registro final,
// 		columna inicial, columna final). Si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites no es correcto
// 		se devolver$$HEX2$$e1002000$$ENDHEX$$un bloque vacio.
IF 	al_registro_inicial <= 0 OR al_registro_final <= 0 OR &
	al_registro_inicial > al_registro_final THEN
	RETURN "" + ISK_EOB
END IF
//
/////////////////////////////////////////////////////////


// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow.
li_Numero_Columnas = INTEGER( ads_datastore.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN "" + ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Copiamos los datos al datastore de replicaci$$HEX1$$f300$$ENDHEX$$n.
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = ads_DataStore.Object.Data.PRIMARY.CURRENT[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		END IF
	CASE FILTER!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = ads_DataStore.Object.Data.FILTER.ORIGINAL[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = ads_DataStore.Object.Data.FILTER.CURRENT[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		END IF
	CASE DELETE!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = ads_DataStore.Object.Data.DELETE.ORIGINAL[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = ads_DataStore.Object.Data.DELETE.CURRENT[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		END IF
END CHOOSE

// Destruimos las columnas que no hay que recuperar.
// Vamos a insertar en la lista de columnas los separadores 
// ";", que son los separadores por los que deben estar separadas las
// columnas que se solicitan.
as_lista_columnas = ";" + trim(lower(as_lista_columnas)) + ";"
FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	ls_Columna = ";"+ trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name")))+";"
	IF POS(as_lista_columnas,ls_Columna) > 0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_bloque (ref datawindow adw_datawindow, long al_registro_inicial, long al_registro_final, integer ai_columna_inicial, integer ai_columna_final, dwbuffer aenum_dwbuffer, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
//
///////////////////////////////////////////////

///////////////////////////////////////////////////////
// MODIFICADO JCARLOS. 10/7/97. 
// 
// 1) 	Si nos piden un registro final que sobrepasa el l$$HEX1$$ed00$$ENDHEX$$mite de registros existentes en 
// 		el datawindow para el buffer especificado.
//		En este caso colocaremos el registro final como el $$HEX1$$fa00$$ENDHEX$$ltimo registro del datawindow
//		para el buffe especificado.
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF al_Registro_Final > adw_datawindow.RowCount() THEN
			al_Registro_Final = adw_datawindow.RowCount()
		END IF
	CASE DELETE!
		IF al_Registro_Final > adw_datawindow.DeletedCount() THEN
			al_Registro_Final = adw_datawindow.DeletedCount()
		END IF
	CASE FILTER!
		IF al_Registro_Final > adw_datawindow.FilteredCount() THEN
			al_Registro_Final = adw_datawindow.FilteredCount()
		END IF
END CHOOSE
// 2)	Si nos piden una columna final que sobrepasa el l$$HEX1$$ed00$$ENDHEX$$mite de columnas existentes en
//		el datawindow.
//		En este caso colocaremos la columna final como la $$HEX1$$fa00$$ENDHEX$$ltima columna del datawindow
li_Numero_Columnas = INTEGER( adw_DataWindow.Describe("DataWindow.Column.Count") )
IF ai_columna_final > li_Numero_Columnas THEN
	ai_Columna_Final = li_Numero_Columnas
END IF
// 3) 	Debemos comprobar si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites (registro inicial, registro final,
// 		columna inicial, columna final). Si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites no es correcto
// 		se devolver$$HEX2$$e1002000$$ENDHEX$$un bloque vacio.
IF 	al_registro_inicial <= 0 OR al_registro_final <= 0 OR &
	ai_columna_inicial <= 0 OR ai_columna_final <= 0 OR &
	al_registro_inicial > al_registro_final OR &
	ai_columna_inicial > ai_columna_final THEN
	RETURN "" + ISK_EOB
END IF
//
/////////////////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Recuperamos los valores 
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = adw_datawindow.Object.Data.PRIMARY.ORIGINAL[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = adw_datawindow.Object.Data.PRIMARY.CURRENT[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		END IF
	CASE FILTER!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = adw_datawindow.Object.Data.FILTER.ORIGINAL[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = adw_datawindow.Object.Data.FILTER.CURRENT[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		END IF
	CASE DELETE!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = adw_datawindow.Object.Data.DELETE.ORIGINAL[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final] = adw_datawindow.Object.Data.DELETE.CURRENT[al_registro_inicial,ai_columna_inicial,al_registro_final,ai_columna_final]
		END IF
END CHOOSE

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_Recuperar_Bloque (ref datawindow adw_datawindow, long al_registro_inicial, long al_registro_final, string as_Lista_Columnas, dwbuffer aenum_dwbuffer, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Guarda la columna a tratar
string ls_Columna
//
///////////////////////////////////////////////

///////////////////////////////////////////////////////
// MODIFICADO JCARLOS. 10/7/97. 
// 
// 1) 	Si nos piden un registro final que sobrepasa el l$$HEX1$$ed00$$ENDHEX$$mite de registros existentes en 
// 		el datawindow para el buffer especificado.
//		En este caso colocaremos el registro final como el $$HEX1$$fa00$$ENDHEX$$ltimo registro del datawindow
//		para el buffe especificado.
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF al_Registro_Final > adw_datawindow.RowCount() THEN
			al_Registro_Final = adw_datawindow.RowCount()
		END IF
	CASE DELETE!
		IF al_Registro_Final > adw_datawindow.DeletedCount() THEN
			al_Registro_Final = adw_datawindow.DeletedCount()
		END IF
	CASE FILTER!
		IF al_Registro_Final > adw_datawindow.FilteredCount() THEN
			al_Registro_Final = adw_datawindow.FilteredCount()
		END IF
END CHOOSE
// 2) 	Debemos comprobar si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites (registro inicial, registro final,
// 		columna inicial, columna final). Si alguno de los l$$HEX1$$ed00$$ENDHEX$$mites no es correcto
// 		se devolver$$HEX2$$e1002000$$ENDHEX$$un bloque vacio.
IF al_registro_inicial <= 0 OR al_registro_final <= 0 OR &
	al_registro_inicial > al_registro_final THEN
	RETURN "" + ISK_EOB
END IF
//
/////////////////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas.
li_Numero_Columnas = INTEGER( adw_DataWindow.Describe("DataWindow.Column.Count") )

IF li_Numero_Columnas <= 0 THEN RETURN "" + ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Recuperamos los valores 
CHOOSE CASE aenum_dwbuffer
	CASE PRIMARY!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = adw_datawindow.Object.Data.PRIMARY.ORIGINAL[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = adw_datawindow.Object.Data.PRIMARY.CURRENT[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		END IF
	CASE FILTER!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = adw_datawindow.Object.Data.FILTER.ORIGINAL[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = adw_datawindow.Object.Data.FILTER.CURRENT[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		END IF
	CASE DELETE!
		IF ab_original THEN
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = adw_datawindow.Object.Data.DELETE.ORIGINAL[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		ELSE
			ids_Replica.Object.Data[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ] = adw_datawindow.Object.Data.DELETE.CURRENT[al_registro_inicial,1,al_registro_final,li_Numero_Columnas ]
		END IF
END CHOOSE


// Destrucci$$HEX1$$f300$$ENDHEX$$n de las columnas no seleccionadas y conversi$$HEX1$$f300$$ENDHEX$$n de 
// formatos de las columnas solicitadas.
as_Lista_Columnas = ";" + trim(lower(as_Lista_Columnas)) + ";"

FOR li_Indice = 1 TO li_Numero_Columnas
	// Recuperamos la columna en estudio
	ls_Columna = ";"+ trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name")))
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas,ls_Columna)>0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_borrados (ref datastore ads_datastore, string as_Lista_Columnas);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer de borrado todos los registros
// 				
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno = ""
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registros_Borrados
//
///////////////////////////////////////////////

// MODIFICADO JCARLOS.
// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del Datastore en cuesti$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ads_datastore.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB


// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de registros borrados
ll_Registros_Borrados = ads_DataStore.DeletedCount()

IF ll_Registros_Borrados > 0 THEN

	// Cargamos la replica
	ids_Replica.Object.Data[1,1,ll_Registros_Borrados,li_Numero_Columnas ] = ads_DataStore.Object.Data.DELETE.ORIGINAL[1,1,ll_Registros_Borrados,li_Numero_Columnas ]

	// MODIFICADO JCARLOS.
	// Inicializamos el string por el que debemos buscar si existen o no
	// las columnas
	as_Lista_Columnas = ";"+ trim(lower(as_Lista_Columnas)) + ";"

	FOR li_Indice = 1 TO li_Numero_Columnas
		// Comprobamos si esta columna entra en el bloque a devolver
		IF POS(as_Lista_Columnas,trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name"))))>0 THEN
			// Entra en el bloque debemos convertir su formato 
			ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
			CHOOSE CASE ls_Tipo
				CASE "DATETIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
				CASE "DATE"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
				CASE "DECIMAL(2)"
					IF ls_Decimal <> "." THEN
						ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
						lb_Convertir = TRUE
					END IF
				CASE "DECIMAL(3)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
				CASE "DECIMAL(1)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
				CASE "TIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
			END CHOOSE
		ELSE
			// La columna no entra en el bloque la destruimos
			ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
		END IF
	NEXT
	
	ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )
	
	// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
	IF lb_Convertir THEN
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
			END IF
		LOOP WHILE ll_Pos > 0
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "..", ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
			END IF
		LOOP WHILE ll_Pos > 0
	END IF
END IF
	
RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_borrados (ref datawindow adw_datawindow, string as_Lista_Columnas);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer de borrado todos los registros
// 				
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno = ""
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registros_Borrados
//
///////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas
li_Numero_Columnas = INTEGER( adw_datawindow.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de registros borrados
ll_Registros_Borrados = adw_DataWindow.DeletedCount()

IF ll_Registros_Borrados > 0 THEN

	// Cargamos la replica
	ids_Replica.Object.Data[1,1,ll_Registros_Borrados,li_Numero_Columnas ] = adw_datawindow.Object.Data.DELETE.ORIGINAL[1,1,ll_Registros_Borrados,li_Numero_Columnas ]

	// Recorremos las columnas comprobando si deben entrar o no en el
	// bloque de salida.
	// Inicializamos las columnas, para que cumplan un cierto
	// formato ";campo1;campo2;campo3;"
	as_Lista_Columnas = ";" + trim(lower(as_Lista_Columnas)) + ";"
	FOR li_Indice = 1 TO li_Numero_Columnas
		// Comprobamos si esta columna entra en el bloque a devolver
		IF POS(as_Lista_Columnas, trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name"))) )>0 THEN
			// Entra en el bloque debemos convertir su formato 
			ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
			CHOOSE CASE ls_Tipo
				CASE "DATETIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
				CASE "DATE"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
				CASE "DECIMAL(2)"
					IF ls_Decimal <> "." THEN
						ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
						lb_Convertir = TRUE
					END IF
				CASE "DECIMAL(3)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
				CASE "DECIMAL(1)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
				CASE "TIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
			END CHOOSE
		ELSE
			// La columna no entra en el bloque la destruimos
			ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
		END IF
	NEXT
	
	ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )
	
	// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
	IF lb_Convertir THEN
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
			END IF
		LOOP WHILE ll_Pos > 0
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "..", ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
			END IF
		LOOP WHILE ll_Pos > 0
	END IF
END IF
	
RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_borrados (ref datawindow adw_datawindow, integer ai_columna_inicial, integer ai_columna_final);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer de borrado todos los registros
// 				
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno = ""
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registros_Borrados
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_DataWindow.DataObject
ids_Replica.Reset()

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de registros borrados
ll_Registros_Borrados = adw_DataWindow.DeletedCount()

IF ll_Registros_Borrados > 0 THEN

	// Cargamos la replica
	ids_Replica.Object.Data[1,ai_columna_inicial,ll_Registros_Borrados,ai_columna_final] = adw_DataWindow.Object.Data.DELETE.ORIGINAL[1,ai_columna_inicial,ll_Registros_Borrados,ai_columna_final]

	// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
	// conversi$$HEX1$$f300$$ENDHEX$$n.
	li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )
	
	FOR li_Indice = 1 TO li_Numero_Columnas
		// Comprobamos si esta columna entra en el bloque a devolver
		IF 	li_Indice >= ai_columna_inicial AND &
			li_indice <= ai_columna_final THEN
			// Entra en el bloque debemos convertir su formato 
			ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
			CHOOSE CASE ls_Tipo
				CASE "DATETIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
				CASE "DATE"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
				CASE "DECIMAL(2)"
					IF ls_Decimal <> "." THEN
						ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
						lb_Convertir = TRUE
					END IF
				CASE "DECIMAL(3)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
				CASE "DECIMAL(1)"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
				CASE "TIME"
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
			END CHOOSE
		ELSE
			// La columna no entra en el bloque la destruimos
			ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
		END IF
	NEXT
	
	ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )
	
	// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
	IF lb_Convertir THEN
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
			END IF
		LOOP WHILE ll_Pos > 0
		ll_Pos = 1
		DO
			ll_POS = POS( ls_Retorno, "..", ll_POS )
			IF ll_POS > 0 THEN
				ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
			END IF
		LOOP WHILE ll_Pos > 0
	END IF
END IF
	
RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_modificados (ref datastore ads_datastore, string as_Lista_Columnas, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado DATAMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del Datastore
li_Numero_Columnas = INTEGER( ads_datastore.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos la lista de columnas por las que debe de buscar
as_Lista_Columnas = ";" + trim(lower(as_Lista_Columnas)) + ";"

// Recorremos las columnas buscando si debemos incluirlas.
FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas,";"+trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType")))+";" )>0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_modificados (ref DataStore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado DATAMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_modificados (ref datawindow adw_datawindow, string as_Lista_Columnas, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado DATAMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos la lista de columnas del datawindow a recuperar el bloque
li_Numero_Columnas = INTEGER( adw_datawindow.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = adw_datawindow.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = adw_datawindow.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos la lista de columnas
as_Lista_Columnas = ";" + trim(lower(as_Lista_Columnas)) + ";"

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas, ";"+trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name")))+";")>0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_modificados (ref datawindow adw_DataWindow, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado DATAMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_DataWindow.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = adw_DataWindow.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_DataWindow.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_DataWindow.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = adw_DataWindow.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es DATAMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			DATAMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_DataWindow.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_DataWindow.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,ai_columna_inicial,ll_Registro_Modificado,ai_columna_final]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_nuevos_modificados (ref datastore ads_datastore, string as_Lista_Columnas, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado NEWMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas
li_Numero_Columnas = INTEGER( ads_datastore.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = ads_DataStore.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF ads_DataStore.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0


// Inicializamos la lista de columnas para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda
as_Lista_Columnas = ";" + trim(lower(as_Lista_Columnas)) + ";"

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas, ";"+ids_Replica.Describe("#"+STRING(li_Indice)+".Name")+";" )>0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_nuevos_modificados (ref datawindow adw_datawindow, string as_Lista_Columnas, boolean ab_original);//////////////////////////////////////////////////////////////////
//
// Objetivo: Recuperar del buffer PRIMARIO y de FILTRADO aquellos registros
// 				en estado NEWMODIFIED!
//
//////////////////////////////////////////////////////////////////


// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Registro a recuperar
long ll_Registro_Modificado = 0
// Registro Insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del objeto a recuperar el bloque
li_Numero_Columnas = INTEGER( adw_datawindow.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro modificado
	ll_Registro_Modificado = adw_datawindow.GetNextModified( ll_Registro_Modificado, PRIMARY! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, PRIMARY! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.PRIMARY.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos el valor del registro modificado encontrado
ll_Registro_Modificado  = 0

// Buscamos en el buffer FILTRADO los registros modificados
DO
	ll_Registro_Modificado = adw_datawindow.GetNextModified( ll_Registro_Modificado, FILTER! )
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Modificado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro modificado comprobamos si es NEWMODIFIED!
		IF adw_DataWindow.GetItemStatus( ll_Registro_Modificado, 0, FILTER! ) = &
			NEWMODIFIED! THEN
			// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro lo copiamos a la replica
			IF ab_original THEN
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.FILTER.ORIGINAL[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			ELSE
				ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.FILTER.CURRENT[ll_Registro_Modificado,1,ll_Registro_Modificado,li_Numero_Columnas]
			END IF
			ll_Insertado ++
		END IF
	END IF
LOOP WHILE ll_Registro_Modificado <> 0

// Inicializamos la lista de columnas sobre las que realizar
// la b$$HEX1$$fa00$$ENDHEX$$squeda.
as_Lista_Columnas = ";" + trim(lower(as_Lista_Columnas)) + ";"

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas,";"+trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name")))+";" ) > 0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_seleccionados (ref datastore ads_datastore, string as_Lista_Columnas, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Guarda el registro seleccionado
long ll_Registro_Seleccionado = 0
// Guarda registro insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del objeto
li_Numero_Columnas = INTEGER( ads_datastore.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro seleccinoado
	ll_Registro_Seleccionado = ads_DataStore.GetSelectedRow( ll_Registro_Seleccionado)
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Seleccionado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro seleccinado
		IF ab_original THEN
			ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Seleccionado,1,ll_Registro_Seleccionado,li_Numero_Columnas]
		ELSE
			ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = ads_DataStore.Object.Data.PRIMARY.CURRENT[ll_Registro_Seleccionado,1,ll_Registro_Seleccionado,li_Numero_Columnas]
		END IF
		ll_Insertado ++
	END IF
LOOP WHILE ll_Registro_Seleccionado <> 0

// Inicializamos la lista de columnas que incluyen el bloque
as_Lista_Columnas = ";" + as_Lista_Columnas + ";"

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas, ";"+ trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name"))) +";" )>0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_seleccionados (ref datawindow adw_datawindow, string as_Lista_Columnas, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Guarda el registro seleccionado
long ll_Registro_Seleccionado = 0
// Guarda registro insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el n$$HEX1$$fa00$$ENDHEX$$mero de columnas
li_Numero_Columnas = INTEGER( adw_datawindow.Describe("DataWindow.Column.Count") )
IF li_Numero_Columnas <= 0 THEN RETURN ""+ISK_EOB

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_datawindow.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro seleccinoado
	ll_Registro_Seleccionado = adw_datawindow.GetSelectedRow( ll_Registro_Seleccionado)
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Seleccionado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro seleccinado
		IF ab_original THEN
			ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Seleccionado,1,ll_Registro_Seleccionado,li_Numero_Columnas]
		ELSE
			ids_Replica.Object.Data[ll_Insertado,1,ll_Insertado,li_Numero_Columnas] = adw_datawindow.Object.Data.PRIMARY.CURRENT[ll_Registro_Seleccionado,1,ll_Registro_Seleccionado,li_Numero_Columnas]
		END IF
		ll_Insertado ++
	END IF
LOOP WHILE ll_Registro_Seleccionado <> 0

// Inicializamos la lista de columnas sobre las que realizar la b$$HEX1$$fa00$$ENDHEX$$squeda
as_Lista_Columnas = ";" + as_Lista_Columnas + ";"

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF POS(as_Lista_Columnas,";"+trim(lower(ids_Replica.Describe("#"+STRING(li_Indice)+".Name")))+";")>0 THEN
		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_seleccionados (ref DataStore ads_DataStore, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Guarda el registro seleccionado
long ll_Registro_Seleccionado = 0
// Guarda registro insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = ads_DataStore.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro seleccinoado
	ll_Registro_Seleccionado = ads_DataStore.GetSelectedRow( ll_Registro_Seleccionado)
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Seleccionado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro seleccinado
		IF ab_original THEN
			ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Seleccionado,ai_columna_inicial,ll_Registro_Seleccionado,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = ads_DataStore.Object.Data.PRIMARY.CURRENT[ll_Registro_Seleccionado,ai_columna_inicial,ll_Registro_Seleccionado,ai_columna_final]
		END IF
		ll_Insertado ++
	END IF
LOOP WHILE ll_Registro_Seleccionado <> 0

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN

		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_recuperar_seleccionados (ref DataWindow adw_DataWindow, integer ai_columna_inicial, integer ai_columna_final, boolean ab_original);// VARIABLES LOCALES //////////////////////////
//
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de columnas del datawindow
integer li_Numero_Columnas
// Guarda un indice para recorrer las columnas
integer li_Indice
// Guarda el tipo de la columna
string ls_Tipo
// Guarda el string de vuelta
string ls_Retorno
// Posici$$HEX1$$f300$$ENDHEX$$n del caracter decimal.
long ll_Pos
// Caracter decimal del sistema
string ls_Decimal 
// Indica si debemos realizar la conversi$$HEX1$$f300$$ENDHEX$$n del caracter decimal
boolean lb_Convertir = FALSE
// Guarda el registro seleccionado
long ll_Registro_Seleccionado = 0
// Guarda registro insertado
long ll_Insertado = 1
//
///////////////////////////////////////////////

// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

// Replicamos el objeto 
ids_Replica.DataObject = adw_DataWindow.DataObject
ids_Replica.Reset()

// Buscamos en el buffer primario los registros modificados
DO
	// Recuperamos el registro seleccinoado
	ll_Registro_Seleccionado = adw_DataWindow.GetSelectedRow( ll_Registro_Seleccionado)
	// Comprobamos si encontr$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n registro modificado
	IF ll_Registro_Seleccionado <> 0 THEN
		// Encontr$$HEX2$$f3002000$$ENDHEX$$un registro seleccinado
		IF ab_original THEN
			ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_DataWindow.Object.Data.PRIMARY.ORIGINAL[ll_Registro_Seleccionado,ai_columna_inicial,ll_Registro_Seleccionado,ai_columna_final]
		ELSE
			ids_Replica.Object.Data[ll_Insertado,ai_columna_inicial,ll_Insertado,ai_columna_final] = adw_DataWindow.Object.Data.PRIMARY.CURRENT[ll_Registro_Seleccionado,ai_columna_inicial,ll_Registro_Seleccionado,ai_columna_final]
		END IF
		ll_Insertado ++
	END IF
LOOP WHILE ll_Registro_Seleccionado <> 0

// Seteamos las diferentes mascaras de edici$$HEX1$$f300$$ENDHEX$$n de cada campo para que realize la
// conversi$$HEX1$$f300$$ENDHEX$$n.
li_Numero_Columnas = INTEGER( ids_Replica.Describe("DataWindow.Column.Count") )

FOR li_Indice = 1 TO li_Numero_Columnas
	// Comprobamos si esta columna entra en el bloque a devolver
	IF 	li_Indice >= ai_columna_inicial AND &
		li_indice <= ai_columna_final THEN

		// Entra en el bloque debemos convertir su formato 
		ls_Tipo = UPPER(MID(ids_Replica.Describe("#"+STRING(li_Indice)+".ColType"),1,10))
		CHOOSE CASE ls_Tipo
			CASE "DATETIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDDHHMMSS'")
			CASE "DATE"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='YYYYMMDD'")
			CASE "DECIMAL(2)"
				IF ls_Decimal <> "." THEN
					ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..##'")
					lb_Convertir = TRUE
				END IF
			CASE "DECIMAL(3)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..###'")
			CASE "DECIMAL(1)"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='###\..#'")
			CASE "TIME"
				ids_Replica.Modify("#"+STRING(li_Indice)+".Edit.Format='HHMMSS'")
		END CHOOSE
	ELSE
		// La columna no entra en el bloque la destruimos
		ids_Replica.Modify( "DESTROY COLUMN #"+STRING( li_Indice ) )		
	END IF
NEXT

ls_Retorno = ids_Replica.Describe( "DataWindow.Data" )

// Conversi$$HEX1$$f300$$ENDHEX$$n de los decimales si es necesario
IF lb_Convertir THEN
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "."+ls_Decimal, ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos,LEN(ls_Decimal) + 1, ".")
		END IF
	LOOP WHILE ll_Pos > 0
	ll_Pos = 1
	DO
		ll_POS = POS( ls_Retorno, "..", ll_POS )
		IF ll_POS > 0 THEN
			ls_Retorno = REPLACE(ls_Retorno, ll_Pos, 2, ".")
		END IF
	LOOP WHILE ll_Pos > 0
END IF

RETURN ls_Retorno + ISK_EOB
end function

public function string of_generar_bloque (ref powerobject apo_objeto, string as_formato);
//////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_generar_bloque
//
// Objetivo:	A partir del objeto POWERBUILDER recibido como par$$HEX1$$e100$$ENDHEX$$metro
//					debemos generar un bloque de datos.
//					Para realizar esta operaci$$HEX1$$f300$$ENDHEX$$n nos vamos a basar en el
//					formato pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//					Con el formato podemos generar un datawindow de forma
//					din$$HEX1$$e100$$ENDHEX$$mica.
//					Despu$$HEX1$$e900$$ENDHEX$$s gracias a la nueva funcionalidad de PowerBuilder 5.0
//					cargamos el datawindow con la estructura pasada como 
//					par$$HEX1$$e100$$ENDHEX$$metro.
//				
//
// Parametros:
//  Entrada	: 	PowerObject apo_Objeto (estructura que forma un bloque 
//					de un solo registro)
//					string as_Formato (formato de la estructura. Los formatos
//					v$$HEX1$$e100$$ENDHEX$$lidos son: 
//						CXXX: string de XXX caracteres.
//						L:		long.
//						DX:	n$$HEX1$$fa00$$ENDHEX$$mero con X decimales (1,2,3)
//						F:		fecha.
//						H:		hora.
//  Salida	:
//
// Retorno: string(bloque de datos generado).
//
//
// FECHA	REALIZADO POR	TAREA
// -----	-------------	-----
// 10/7/97		JCC		PM044
// VARIABLES LOCALES /////////////////////////////////////////
//
string ls_Datawindow1 = 	'release 5;'+CHAR(13)+CHAR(10)+&
									'datawindow(units=0 timer_interval=0 color=12632256 processing=0 print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 97 print.margin.bottom = 97 print.paper.source = 0 print.paper.size = 0 print.prompt=no )'+CHAR(13)+CHAR(10)+&
									'header(height=1 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'summary(height=1 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'footer(height=1 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'detail(height=97 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'table('+CHAR(13)+CHAR(10)
string ls_ColumnaBD 
string ls_Columna 
datastore lds_DS
long ll_Pos, ll_Ult_Pos = 1
string ls_Tipo
integer li_Longitud
integer li_Contador = 1
string ls_Bloque
string ls_Decimal
boolean lb_Decimal = FALSE
Any lany_estructura
//
//
//////////////////////////////////////////////////////////////


// Recuperamos el objeto powerbuilder que es una simple estructura
lany_Estructura = apo_Objeto

lds_DS = CREATE datastore

// Recuperamos el formato para la generaci$$HEX1$$f300$$ENDHEX$$n de las columnas
// El formato vendr$$HEX2$$e1002000$$ENDHEX$$como sigue: "C8;F;H;D;L;"
ll_Pos = POS( as_formato, ";" )

DO WHILE ll_Pos > 0 
	ls_Tipo = MID( as_formato, ll_Ult_Pos, ll_Pos - ll_Ult_Pos )
	CHOOSE CASE lower(left(ls_tipo,1))
	CASE "c"
		// Es un caracter recuperamos la longitud
		li_Longitud = INTEGER( MID( ls_tipo, 2, 100 ))
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=char('+STRING(li_Longitud)+') updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=0 border="0" color="0" x="33" y="12" height="77" width="133"  name=col'+STRING(li_Contador)+'  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12632256" )'+CHAR(13)+CHAR(10)
	CASE "f"
		// Es una fecha 
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=date updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=30 border="0" color="8388608" x="549" y="16" height="77" width="220" format="[general]"  name=col'+STRING(li_Contador)+' edit.limit=0 edit.case=any edit.format="YYYYMMDD" edit.focusrectangle=no edit.autoselect=no  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+CHAR(13)+CHAR(10)
	CASE "h"
		// Es una fechahora
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=datetime updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=30 border="0" color="8388608" x="549" y="16" height="77" width="220" format="[general]"  name=col'+STRING(li_Contador)+' edit.limit=0 edit.case=any edit.format="YYYYMMDDHHMMSS" edit.focusrectangle=no edit.autoselect=no  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+CHAR(13)+CHAR(10)
	CASE "d"
		// Es un decimal recuperamos la longitud
		li_Longitud = INTEGER( MID( ls_tipo, 2, 100 ))
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=decimal('+STRING(li_Longitud)+') updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=0 border="0" color="0" x="33" y="12" height="77" width="133"  name=col'+STRING(li_Contador)+'  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12632256" )'+CHAR(13)+CHAR(10)
		lb_Decimal = TRUE
	CASE "l"
		// Es un long
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=long updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=0 border="0" color="0" x="33" y="12" height="77" width="133"  name=col'+STRING(li_Contador)+'  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12632256" )'+CHAR(13)+CHAR(10)
	END CHOOSE
	li_Contador ++
	ll_Ult_Pos = ll_Pos + 1
	ll_Pos = POS( as_formato, ";" , ll_Ult_Pos)
LOOP

// Generamos el datawindow
ls_DataWindow1 = ls_DataWindow1+ls_ColumnaBD+' ) '+CHAR(13)+CHAR(10)+ls_Columna

lds_DS.Create(ls_DataWindow1)

// Copiamos la estructura al nuevo datawindow
li_Contador --
lds_DS.Object.Data[1,1,1,li_Contador] = lany_estructura

// Recuperamos la sintaxis
ls_Bloque = lds_DS.Describe( "DataWindow.Data" ) + CHAR(2)

// Si se ha utilizado un campo tipo decimal vamos a aplicar la conversi$$HEX1$$f300$$ENDHEX$$n.
// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

IF ls_Decimal <> "." AND lb_Decimal THEN
	ls_Bloque = of_Remplazar( ls_Bloque, ",","." )
END IF

DESTROY lds_DS

RETURN ls_Bloque
end function

public function string of_generar_bloque (ref powerobject apo_objeto[], string as_formato, long al_registros);//////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: of_generar_bloque
//
// Objetivo:	A partir del objeto POWERBUILDER recibido como par$$HEX1$$e100$$ENDHEX$$metro
//					debemos generar un bloque de datos.
//					Para realizar esta operaci$$HEX1$$f300$$ENDHEX$$n nos vamos a basar en el
//					formato pasado como par$$HEX1$$e100$$ENDHEX$$metro.
//					Con el formato podemos generar un datawindow de forma
//					din$$HEX1$$e100$$ENDHEX$$mica.
//					Despu$$HEX1$$e900$$ENDHEX$$s gracias a la nueva funcionalidad de PowerBuilder 5.0
//					cargamos el datawindow con la estructura pasada como 
//					par$$HEX1$$e100$$ENDHEX$$metro.
//				
//
// Parametros:
//  Entrada	: 	PowerObject apo_Objeto[] (array de estructuras que forma un bloque 
//					de un solo registro)
//					string as_Formato (formato de la estructura. Los formatos
//					v$$HEX1$$e100$$ENDHEX$$lidos son: 
//						CXXX: string de XXX caracteres.
//						L:		long.
//						DX:	n$$HEX1$$fa00$$ENDHEX$$mero con X decimales (1,2,3)
//						F:		fecha.
//						H:		hora.
//  Salida	:
//
// Retorno: string(bloque de datos generado).
//
//
// FECHA	REALIZADO POR	TAREA
// -----	-------------	-----
// 10/7/97		JCC		PM044
// VARIABLES LOCALES /////////////////////////////////////////
//
string ls_Datawindow1 = 	'release 5;'+CHAR(13)+CHAR(10)+&
									'datawindow(units=0 timer_interval=0 color=12632256 processing=0 print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 97 print.margin.bottom = 97 print.paper.source = 0 print.paper.size = 0 print.prompt=no )'+CHAR(13)+CHAR(10)+&
									'header(height=1 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'summary(height=1 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'footer(height=1 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'detail(height=97 color="536870912" )'+CHAR(13)+CHAR(10)+&
									'table('+CHAR(13)+CHAR(10)
string ls_ColumnaBD 
string ls_Columna 
datastore lds_DS
long ll_Pos, ll_Ult_Pos = 1
string ls_Tipo
integer li_Longitud
integer li_Contador = 1
string ls_Bloque
string ls_Decimal
boolean lb_Decimal = FALSE
Any lany_estructura
//
//
//////////////////////////////////////////////////////////////


// Recuperamos el objeto powerbuilder que es una simple estructura
lany_Estructura = apo_Objeto

lds_DS = CREATE datastore

// Recuperamos el formato para la generaci$$HEX1$$f300$$ENDHEX$$n de las columnas
// El formato vendr$$HEX2$$e1002000$$ENDHEX$$como sigue: "C8;F;H;D;L;"
ll_Pos = POS( as_formato, ";" )

DO WHILE ll_Pos > 0 
	ls_Tipo = MID( as_formato, ll_Ult_Pos, ll_Pos - ll_Ult_Pos )
	CHOOSE CASE lower(left(ls_tipo,1))
	CASE "c"
		// Es un caracter recuperamos la longitud
		li_Longitud = INTEGER( MID( ls_tipo, 2, 100 ))
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=char('+STRING(li_Longitud)+') updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=0 border="0" color="0" x="33" y="12" height="77" width="133"  name=col'+STRING(li_Contador)+'  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12632256" )'+CHAR(13)+CHAR(10)
	CASE "f"
		// Es una fecha 
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=date updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=30 border="0" color="8388608" x="549" y="16" height="77" width="220" format="[general]"  name=col'+STRING(li_Contador)+' edit.limit=0 edit.case=any edit.format="YYYYMMDD" edit.focusrectangle=no edit.autoselect=no  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+CHAR(13)+CHAR(10)
	CASE "h"
		// Es una fechahora
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=datetime updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=30 border="0" color="8388608" x="549" y="16" height="77" width="220" format="[general]"  name=col'+STRING(li_Contador)+' edit.limit=0 edit.case=any edit.format="YYYYMMDDHHMMSS" edit.focusrectangle=no edit.autoselect=no  font.face="Arial" font.height="-10" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )'+CHAR(13)+CHAR(10)
	CASE "d"
		// Es un decimal recuperamos la longitud
		li_Longitud = INTEGER( MID( ls_tipo, 2, 100 ))
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=decimal('+STRING(li_Longitud)+') updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=0 border="0" color="0" x="33" y="12" height="77" width="133"  name=col'+STRING(li_Contador)+'  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12632256" )'+CHAR(13)+CHAR(10)
		lb_Decimal = TRUE
	CASE "l"
		// Es un long
		ls_ColumnaBD = ls_ColumnaBD + ' column=(type=long updatewhereclause=yes name=col'+STRING(li_Contador)+' dbname="col'+STRING(li_Contador)+'" )'+CHAR(13)+CHAR(10)
		ls_Columna = ls_Columna + 'column(band=detail id='+STRING(li_contador)+' alignment="0" tabsequence=0 border="0" color="0" x="33" y="12" height="77" width="133"  name=col'+STRING(li_Contador)+'  font.face="Arial" font.height="-12" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12632256" )'+CHAR(13)+CHAR(10)
	END CHOOSE
	li_Contador ++
	ll_Ult_Pos = ll_Pos + 1
	ll_Pos = POS( as_formato, ";" , ll_Ult_Pos)
LOOP

// Generamos el datawindow
ls_DataWindow1 = ls_DataWindow1+ls_ColumnaBD+' ) '+CHAR(13)+CHAR(10)+ls_Columna

lds_DS.Create(ls_DataWindow1)

// Copiamos la estructura al nuevo datawindow
li_Contador --
lds_DS.Object.Data[1,1,al_Registros,li_Contador] = lany_estructura

// Recuperamos la sintaxis
ls_Bloque = lds_DS.Describe( "DataWindow.Data" ) + CHAR(2)

// Si se ha utilizado un campo tipo decimal vamos a aplicar la conversi$$HEX1$$f300$$ENDHEX$$n.
// Recuperamos el car$$HEX1$$e100$$ENDHEX$$cter decimal del sistema
ls_Decimal = ProfileString( "WIN.INI", "INTL", "sDecimal", "." )

IF ls_Decimal <> "." AND lb_Decimal THEN
	ls_Bloque = of_Remplazar( ls_Bloque, ",","." )
END IF

DESTROY lds_DS

RETURN ls_Bloque
end function

public function integer of_ejecutar (string as_funcion, ref integer ai_instruccion[], ref any aa_parametros[], string as_entrada, ref string as_salida, boolean ab_recepcion_multiple);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	OF_EJECUTAR para n_controlador
// 
// Objetivo:	Ejecuta la funci$$HEX1$$f300$$ENDHEX$$n pasada como par$$HEX1$$e100$$ENDHEX$$metro.
//					Le pasa seg$$HEX1$$fa00$$ENDHEX$$n estandar la serie de instrucciones,
//					los par$$HEX1$$e100$$ENDHEX$$metros y los bloques.
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:	string as_Nombre_Funcion:Funci$$HEX1$$f300$$ENDHEX$$n a ejecutar.
//				int ai_Instrucciones[]: Array de instrucciones a ejecutar.
//				Any aa_Parametros[]:	Array de par$$HEX1$$e100$$ENDHEX$$metros a enviar a  la
//											funci$$HEX1$$f300$$ENDHEX$$n.
//				string as_Entrada: Bloques de entrada a la funci$$HEX1$$f300$$ENDHEX$$n.
//				boolean ab_Recepcion_Multiple: Indica si la funci$$HEX1$$f300$$ENDHEX$$n de 
//						negocio implementada es capaz de recibir tramas
//						superiores a 64K. 
//	Salida:	string as_Salida: Bloques de salida a la funci$$HEX1$$f300$$ENDHEX$$n.
//						
// Devuelve:	integer ( <0 error, >= 0 OK ).
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----------	---------
//	30/7/97		JCC		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Parametros fijos: Instrucciones + Parametros
string ls_Param_Fijos = ""
// Dimensi$$HEX1$$f300$$ENDHEX$$n e $$HEX1$$ed00$$ENDHEX$$ndice para recorrer arrays
integer li_Dimension, li_Indice
// Valor string a convertir
string ls_Valor
// Posici$$HEX1$$f300$$ENDHEX$$n de una ocurrencia
long ll_Posicion
// String de entrada a la funci$$HEX1$$f300$$ENDHEX$$n y String de salida
string ls_Entrada
string ls_Salida[]
// Variable de retorno
string ls_Retorno 
//
//////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////
// COMPONEMOS LOS PAR$$HEX1$$c100$$ENDHEX$$METROS FIJOS A MANDAR
//
// INSTRUCCIONES ///
li_Dimension = UpperBound( ai_instruccion[])
FOR li_Indice = 1 TO li_Dimension
	ls_Param_Fijos = 	ls_Param_Fijos + &
							STRING( ai_Instruccion[li_Indice] ) + ISK_EOF
NEXT
IF li_Dimension > 0 THEN
	ls_Param_Fijos = LEFT( ls_Param_Fijos, LEN(ls_Param_Fijos) - LEN(isk_EOF) )
END IF
ls_Param_Fijos = ls_Param_Fijos + ISK_EOL

// PARAMETROS ///////////
li_Dimension = UPPERBOUND( aa_parametros[] )
FOR li_Indice = 1 TO li_Dimension
	// Vamos a cargar los par$$HEX1$$e100$$ENDHEX$$metros pasados como par$$HEX1$$e100$$ENDHEX$$metros.
	// Pueden ser de cualquier tipo pero los tipos que nos interesan
	// son si son decimales debemos colocar el car$$HEX1$$e100$$ENDHEX$$cter . que es el 
	// car$$HEX1$$e100$$ENDHEX$$cter que entiende C.
	// Con las fechas ocurre lo mismo. Debemos convertir al formato
	// que entiende C que es "YYYYMMDD".

	// Pasamos el valor del par$$HEX1$$e100$$ENDHEX$$metro a STRING
	ls_Valor = STRING( aa_parametros[ li_Indice ] )
	// Comprobamos si el par$$HEX1$$e100$$ENDHEX$$metro no es vacio o 0
	IF ls_Valor <> "" AND ls_Valor <> "0" THEN
		// Comprobamos si el par$$HEX1$$e100$$ENDHEX$$metro es fecha
		IF isDate( ls_Valor ) THEN
			// Es una fecha y componemos sus valores
			ls_Param_Fijos = ls_Param_Fijos + &
					STRING( aa_parametros[li_Indice],"YYYYMMDD") + ISK_EOF
		ELSEIF isNumber( ls_Valor ) THEN
			ll_Posicion = POS( ls_Valor, isk_sepdec, 1)
			IF ll_Posicion > 0 THEN
				// Colocamos siempre un .
				ls_Valor = REPLACE(ls_Valor, ll_Posicion, LEN(ISK_SEPDEC), ".")
			END IF
			ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF
		ELSE
			ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF				
		END IF
	ELSE
		ls_Param_Fijos = ls_Param_Fijos + ls_Valor + isk_EOF				
	END IF
NEXT
// MODIFICADO JCARLOS. 16/7/97
// Se estaba incluyendo un separador de campo que daba problemas en FGEN.PC, 
// cuando alguno de los par$$HEX1$$e100$$ENDHEX$$metros era vacio. Se ha eliminado el separador de campo 
// del $$HEX1$$fa00$$ENDHEX$$ltimo elemento de un bloque.
IF li_Dimension > 0 THEN
	ls_Param_Fijos = LEFT( ls_Param_Fijos, LEN(ls_Param_Fijos) - LEN(isk_EOF) )
END IF
ls_Param_Fijos = ls_Param_Fijos + ISK_EOL

// BLOQUES //
IF NOT isNull(as_entrada) AND as_Entrada <> "" THEN
	// Concatenamos los bloques.
	ls_Param_Fijos = ls_Param_Fijos + as_Entrada
END IF
//
//////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////
// RECUPERACI$$HEX1$$d300$$ENDHEX$$N DE LOS DATOS.
// El objeto de comunicaciones realiza diferentes cortes de la
// informaci$$HEX1$$f300$$ENDHEX$$n, pues actualmente no se puede recibir m$$HEX1$$e100$$ENDHEX$$s de 64K.
// Para resolver este problema realizamos sucesivas llamadas
// al objeto de comunicaciones indicando el n$$HEX1$$fa00$$ENDHEX$$mero de trama (64K)
// que queremos recibir
// COMPONEMOS LOS PAR$$HEX1$$c100$$ENDHEX$$METROS A MANDAR ////////////////
//
// Componemos la cabecera que siempre van al servidor
ls_Entrada = ls_Param_Fijos
//
//////////////////////
	
// RECUPERAMOS LOS DATOS /////////////
//
// Vamos a llamar a una funci$$HEX1$$f300$$ENDHEX$$n diferente cuando la recepci$$HEX1$$f300$$ENDHEX$$n
// m$$HEX1$$fa00$$ENDHEX$$ltiple esta activada 
IF ab_recepcion_multiple THEN
	IF of_llamar_fn_multiple_recepcion( as_funcion, ls_Salida[], ls_Entrada) <> 0 THEN 
		RETURN -1
	END IF
ELSE
	IF of_Llamar_FN( as_funcion, ls_Salida[], ls_Entrada,1) <> 0 THEN 
		RETURN -1
	END IF
END IF
//
///////////
	
//
/////////////////////////////////////////////////////////////

// ATENCI$$HEX1$$d300$$ENDHEX$$N AQU$$HEX1$$cd00$$ENDHEX$$. 
// La funci$$HEX1$$f300$$ENDHEX$$n of_Llamar_FN devuelve un array de string que contendr$$HEX2$$e1002000$$ENDHEX$$elementos
// de 8k aproximadamente. Como estamos trabajando con la versi$$HEX1$$f300$$ENDHEX$$n de 32 bits
// no tenemos la limitaci$$HEX1$$f300$$ENDHEX$$n de 32K en el formato STRING. Por tanto, vamos a concatenar
// todos los bloques de 8K que no tienen ning$$HEX1$$fa00$$ENDHEX$$n significado de manera unitaria y vamos
// a concatenarlos en un solo string.
// Si estuvieramos trabajando con 16 bits y con la limitaci$$HEX1$$f300$$ENDHEX$$n de ancho del string deber$$HEX1$$ed00$$ENDHEX$$amos
// recuperar los diferentes bloques a nivel de registro ( posible soluci$$HEX1$$f300$$ENDHEX$$n ).
// Componemos la trama total
li_Dimension = UPPERBOUND( ls_Salida )
FOR li_Indice = 1 TO li_Dimension 
	ls_Retorno = ls_Retorno + ls_Salida[ li_Indice ]
NEXT
//
/////////////////
as_salida = ls_Retorno
RETURN 0
end function

private function long of_llamar_fn_multiple_recepcion (string as_funcion, ref string as_salida[], string as_entrada);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_llamar_fn_MULTIPLE_RECEPCION para u_openlink
// 
// Objetivo:	Se trata de llamar al objeto de comunicaciones (DLL) a la funci$$HEX1$$f300$$ENDHEX$$n
//					que realiza la conversaci$$HEX1$$f300$$ENDHEX$$n con la m$$HEX1$$e100$$ENDHEX$$quina "REMOTA".
//					Esta funci$$HEX1$$f300$$ENDHEX$$n realiza m$$HEX1$$fa00$$ENDHEX$$ltiple recepci$$HEX1$$f300$$ENDHEX$$n por parte de la
//					funci$$HEX1$$f300$$ENDHEX$$n remota. 
//					
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	string as_funcion ( Funci$$HEX1$$f300$$ENDHEX$$n a ejecutar ).
//					string as_salida[] ( Array de string (bloques) retornados por la funci$$HEX1$$f300$$ENDHEX$$n )
//					string as_entrada ( String de entrada a la funci$$HEX1$$f300$$ENDHEX$$n ).
//	Salida:   
//						
// Devuelve:	long ( C$$HEX1$$f300$$ENDHEX$$digo de retorno de la llamada a la funci$$HEX1$$f300$$ENDHEX$$n C ). (0 OK, <> 0 KO).
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	4-3-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
// Variables de llamada a la funci$$HEX1$$f300$$ENDHEX$$n OPLINKCL
integer li_Primitiva = 2
string ls_Reservado = SPACE(50)
// Variables de llamada a la funci$$HEX1$$f300$$ENDHEX$$n OPLINKCE
string ls_Descripcion = SPACE(255)
long ll_Retorno
string ls_Salida
string ls_Trama_OUT
integer li_Completitud = 0
integer li_Error
integer li_Longitud 
// Guarda el trozo a enviar
string ls_Trama
// Guarda el n$$HEX1$$fa00$$ENDHEX$$mero de trozos a enviar y el que se est$$HEX2$$e1002000$$ENDHEX$$enviando 
// actualmente.
integer li_Indice, li_Dimension
// Funci$$HEX1$$f300$$ENDHEX$$n de error
integer li_Reservado 
// Variable que indica si hay que enviar a la funci$$HEX1$$f300$$ENDHEX$$n una 
// comunicaci$$HEX1$$f300$$ENDHEX$$n m$$HEX1$$e100$$ENDHEX$$s.
boolean lb_Multiplo_Exacto = FALSE
// Guarda el indice para el string de salida
integer li_Indice_Salida = 1
//////////////

//////////////
// Comprobamos la longitud de la cadena a enviar.
// Si la longitud de la cadena es superior a iik_LONG_TRAMA  
// vamos a partirla en pedazos de iik_LONG_TRAMA.
// La funci$$HEX1$$f300$$ENDHEX$$n de recepci$$HEX1$$f300$$ENDHEX$$n "func_capas_Recibir_Trama" comprueba
// si el tama$$HEX1$$f100$$ENDHEX$$o recibido es menor de iik_LONG_TRAMA, en el caso
// de que sea menor para esta funci$$HEX1$$f300$$ENDHEX$$n indica que termin$$HEX2$$f3002000$$ENDHEX$$de recibir
// los datos.
// Tenemos que comprobar por esta raz$$HEX1$$f300$$ENDHEX$$n que la longitud del string
// a enviar no sea m$$HEX1$$fa00$$ENDHEX$$ltiplo exacto de iik_LONG_TRAMA. En tal caso
// enviaremos una comunicaci$$HEX1$$f300$$ENDHEX$$n m$$HEX1$$e100$$ENDHEX$$s con un string vacio, para indicar
// que no hay m$$HEX1$$e100$$ENDHEX$$s datos que recibir.
li_Dimension = INTEGER( LEN( as_entrada )/ iik_long_trama )
IF MOD( LEN(as_entrada), iik_LONG_TRAMA ) > 0 THEN li_Dimension ++
// Comprobamos si hay que realizar una comunicaci$$HEX1$$f300$$ENDHEX$$n m$$HEX1$$e100$$ENDHEX$$s
IF MOD( LEN(as_entrada), iik_LONG_TRAMA ) = 0 THEN lb_Multiplo_Exacto = TRUE
IF NOT lb_Multiplo_Exacto THEN li_Dimension --

// Ya conocemos el n$$HEX1$$fa00$$ENDHEX$$mero de trozos que hay que realizar.
// Entramos en el bucle que llama por tramos
FOR li_Indice = 0 TO li_Dimension
	// Recuperamos la trama a enviar.
	ls_Trama = MID( as_entrada, (li_Indice * iik_LONG_TRAMA)+1, iik_LONG_TRAMA )
	// Comprobamos si es el $$HEX1$$fa00$$ENDHEX$$ltimo trozo a enviar
	IF li_Indice = li_Dimension THEN
		// Es la $$HEX1$$fa00$$ENDHEX$$ltima trama a enviar 
		// Vamos a comprobar si era m$$HEX1$$fa00$$ENDHEX$$ltiplo exacto
		IF lb_Multiplo_Exacto THEN ls_Trama = ""
		DO
			ls_Trama_OUT = SPACE(10000)
			// Llamada a la funci$$HEX1$$f300$$ENDHEX$$n 
			li_Error = OPLINKCL( li_Primitiva, &
										is_Servidor, &
										as_Funcion, &
										ls_Reservado, &
										ls_Trama, &
										ll_Retorno, &
										ls_Trama_OUT, &
										li_Completitud )
			il_error = ll_Retorno					
			// Comprobamos si hubo error en la ejecuci$$HEX1$$f300$$ENDHEX$$n de la funci$$HEX1$$f300$$ENDHEX$$n
			IF ( li_Error <> 0  OR ( ll_Retorno > 0 AND ll_Retorno < 90000000)) THEN
				// Error de ejecuci$$HEX1$$f300$$ENDHEX$$n
				// Vamos a llamar a la funci$$HEX1$$f300$$ENDHEX$$n que nos devuelve el error del objeto de 
				// comunicaciones
				li_Longitud = OPLINKCE( ll_Retorno, li_Error, ls_Descripcion, li_Reservado )
				IF li_Longitud > 0 THEN
					is_Error_Logica_BD = TRIM( ls_Descripcion )
				ELSE
					is_Error_Logica_BD = "Error de ejecuci$$HEX1$$f300$$ENDHEX$$n del objeto, pero no es capaz de recuperar la descripci$$HEX1$$f300$$ENDHEX$$n del error..."
				END IF
				RETURN ll_Retorno				
			ELSEIF (ll_Retorno > 90000000) THEN
					// Error tratado por la funci$$HEX1$$f300$$ENDHEX$$n de negocio
					is_Error_Logica_BD = ls_Trama_OUT
					RETURN ll_Retorno				
			ELSE			
				as_salida[ li_Indice_Salida ] = ls_Trama_OUT
				li_indice_Salida ++
			END IF
		
			// Primitiva 5
			li_Primitiva = 5
			
		LOOP WHILE li_Completitud = 0
	ELSE	
		// La completidu debe ser 0, es decir debemos mandar m$$HEX1$$e100$$ENDHEX$$s
		// datos.
		li_Completitud = 0
		ls_Trama_OUT = SPACE(10000)
		li_Error = OPLINKCL( li_Primitiva, &
									is_Servidor, &
									as_Funcion, &
									ls_Reservado, &
									ls_Trama, &
									ll_Retorno, &
									ls_Trama_OUT, &
									li_Completitud )
		
	END IF
	li_Primitiva = 5
	il_error = ll_Retorno					
	// Comprobamos si hubo error en la ejecuci$$HEX1$$f300$$ENDHEX$$n de la funci$$HEX1$$f300$$ENDHEX$$n
	IF ( li_Error <> 0  OR ( ll_Retorno > 0 AND ll_Retorno < 90000000)) THEN
		// Error de ejecuci$$HEX1$$f300$$ENDHEX$$n
		// Vamos a llamar a la funci$$HEX1$$f300$$ENDHEX$$n que nos devuelve el error del objeto de 
		// comunicaciones
		li_Longitud = OPLINKCE( ll_Retorno, li_Error, ls_Descripcion, li_Reservado )
		IF li_Longitud > 0 THEN
			is_Error_Logica_BD = TRIM( ls_Descripcion )
		ELSE
			is_Error_Logica_BD = "Error de ejecuci$$HEX1$$f300$$ENDHEX$$n del objeto, pero no es capaz de recuperar la descripci$$HEX1$$f300$$ENDHEX$$n del error..."
		END IF
		RETURN ll_Retorno				
	ELSEIF (ll_Retorno > 90000000) THEN
			// Error tratado por la funci$$HEX1$$f300$$ENDHEX$$n de negocio
			is_Error_Logica_BD = ls_Trama_OUT
			RETURN ll_Retorno				
	END IF
NEXT

RETURN ll_Retorno
end function

public function long of_recuperar (ref string as_salida, string as_parametro, boolean ab_formateado, boolean ab_resetear, ref long al_error);//////////////////////////////////////////////////
// MODIFICADO JCARLOS.
// Esta funci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$obsoleta y se mantiene temporalmente hasta que se modifiquen 
// las llamadas desde el objeto de comunicaciones openlink al nuevo objeto n_oc_32.
//////////////////////////////////////////////////
// VARIABLES LOCALES
//
// Guarda la dimensi$$HEX1$$f300$$ENDHEX$$n y el $$HEX1$$ed00$$ENDHEX$$ndice para recorrer el array de salida
integer li_Dimension, li_Indice
// String de salida
string ls_Salida[]
//
//////////////////////////////////////////////////

// RECUPERAMOS LOS DATOS /////////////
//
IF of_Llamar_FN( is_funcion, ls_Salida[], as_Parametro,1) <> 0 THEN 
	// MODIFICADO JCARLOS. 11-06-97- Incidencia n$$HEX1$$fa00$$ENDHEX$$mero 487.
	al_error = il_Error
	//////////////
	RETURN il_error
END IF
//
///////////
	
/////////////////////////////////
// ATENCI$$HEX1$$d300$$ENDHEX$$N AQU$$HEX1$$cd00$$ENDHEX$$. 
// La funci$$HEX1$$f300$$ENDHEX$$n of_Llamar_FN devuelve un array de string que contendr$$HEX2$$e1002000$$ENDHEX$$elementos
// de 8k aproximadamente. Como estamos trabajando con la versi$$HEX1$$f300$$ENDHEX$$n de 32 bits
// no tenemos la limitaci$$HEX1$$f300$$ENDHEX$$n de 32K en el formato STRING. Por tanto, vamos a concatenar
// todos los bloques de 8K que no tienen ning$$HEX1$$fa00$$ENDHEX$$n significado de manera unitaria y vamos
// a concatenarlos en un solo string.
// Si estuvieramos trabajando con 16 bits y con la limitaci$$HEX1$$f300$$ENDHEX$$n de ancho del string deber$$HEX1$$ed00$$ENDHEX$$amos
// recuperar los diferentes bloques a nivel de registro ( posible soluci$$HEX1$$f300$$ENDHEX$$n ).
// Componemos la trama total
li_Dimension = UPPERBOUND( ls_Salida )
FOR li_Indice = 1 TO li_Dimension 
	as_salida = as_salida + ls_Salida[ li_Indice ]
NEXT
//
/////////////////

RETURN 1
end function

public function string of_remplazar (string as_cadena, string as_buscar, string as_remplazar);Long start_pos=1
String old_str, new_str, mystring
mystring = as_cadena
old_str = as_buscar

new_str = as_remplazar

start_pos = Pos(mystring,old_str,start_pos)
Do While ( start_pos > 0 )
	mystring = Replace(mystring,start_pos,Len(old_str),new_str)
	start_pos = Pos(mystring,old_str,start_pos+Len(new_str))
Loop

Return mystring
end function

public function long of_loadf (string dest_func, string string_dat[], integer return_tr[], ref string return_string[]);//////////////////////////////////////////////////////////////////////////
//
//   Function : of_loadf
//
//   Objectives : This function calls SGA/SIE/SIS server using Openlink. 
//
//   Arguments : dest_func : Calling function in SGA/SIE/SIS server.
//					 string_dat[] : String array with all the function arguments.
//					 return_tr[] : Integer array with all the return variable sizes.
//					 return_string[] : String array with all the return variables.
//
//////////////////////////////////////////////////////////////////////////
//
//   Javier Camacho Mart$$HEX1$$ed00$$ENDHEX$$nez          24/01/2001
//   soluziona - Software Factory
//
//////////////////////////////////////////////////////////////////////////

// Por defecto se le env$$HEX1$$ed00$$ENDHEX$$a 'N' al final, que significa que no hay m$$HEX1$$e100$$ENDHEX$$s llamadas
return of_load_auth(dest_func,string_dat[],return_tr[],return_string[],'N')


end function

public function long of_securityconnect (string proyecto, string usuario, string clave, ref long retorno);//////////////////////////////////////////////////////////////////////////
//
//   Function : of_securityconnect
//
//   Objectives : This function connect SGA/SIE/SIS server using Openlink. 
//
//   Arguments : proyecto : Work project.
//					 usuario : String with autorized user.
//					 clave : String with password.
//
//////////////////////////////////////////////////////////////////////////
//
//   Javier Camacho Mart$$HEX1$$ed00$$ENDHEX$$nez          15/01/2001
//   soluziona - Software Factory
//
//////////////////////////////////////////////////////////////////////////

long ll_error

ll_error = OPLINKNS ( is_servidor,  &
           		               proyecto, &
				   		 	usuario,  &
						 	clave,  &
							"",  &
							retorno )

return ll_error
end function

public function string of_com_return ();
// Devolvemos el valor del mensaje de error env$$HEX1$$ed00$$ENDHEX$$ado desde el servidor.
return is_Error_Logica_BD
end function

private function long of_llamar_fn (string as_funcion, ref string as_salida[], string as_entrada, integer ai_completitud);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_llamar_fn para n_controlador
// 
// Objetivo:		Se trata de llamar al objeto de comunicaciones (DLL) a la funci$$HEX1$$f300$$ENDHEX$$n
//					que realiza la conversaci$$HEX1$$f300$$ENDHEX$$n con la m$$HEX1$$e100$$ENDHEX$$quina REMOTA.
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros
//	Entrada:  	string as_funcion ( Funci$$HEX1$$f300$$ENDHEX$$n a ejecutar ).
//					string as_salida[] ( Array de string (bloques) retornados por la funci$$HEX1$$f300$$ENDHEX$$n )
//					string as_entrada ( String de entrada a la funci$$HEX1$$f300$$ENDHEX$$n ).
//	Salida:   
//						
// Devuelve:	long ( C$$HEX1$$f300$$ENDHEX$$digo de retorno de la llamada a la funci$$HEX1$$f300$$ENDHEX$$n C ). (0 OK, <> 0 KO).
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	4-3-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
// Variables de llamada a la funci$$HEX1$$f300$$ENDHEX$$n OPLINKCL
integer li_Primitiva
long ll_Retorno = 0
string ls_DatosVuelta
// Completitud 1 para una $$HEX1$$fa00$$ENDHEX$$nica comunicaci$$HEX1$$f300$$ENDHEX$$n 
int li_Completitud = ai_completitud
int li_Error = 0
string ls_Reservado = SPACE(50)
// Variables de llamada a la funci$$HEX1$$f300$$ENDHEX$$n OPLINKCE
string ls_Descripcion = SPACE(255)
int li_Reservado = 0
int li_Longitud = 0
// Variables para el control de m$$HEX1$$fa00$$ENDHEX$$ltiples llamadas
int li_Indice = 1
boolean lb_Error = FALSE
//
//////////////

// Vac$$HEX1$$ed00$$ENDHEX$$amos el contenido de la variable que contiene el error de comunicaciones
is_Error_Logica_BD = ""

// Colocamos la primera primitiva a ejecutar indicada por la variable de instancia
// que guarda la informaci$$HEX1$$f300$$ENDHEX$$n de la primitiva a ejecutar en cada caso.
li_Primitiva = ii_Primitiva

//JME 11/07/2008
li_Completitud = ai_completitud

li_primitiva = 4

DO

	// Los Datos de vuelta est$$HEX1$$e100$$ENDHEX$$n limitados y los inicializamos
	ls_DatosVuelta = SPACE(32768)

	// Llamada a la funci$$HEX1$$f300$$ENDHEX$$n 
	li_Error = OPLINKCL( 	li_Primitiva, &
									is_Servidor, &
									as_Funcion, &
									ls_Reservado, &
									as_Entrada, &
									ll_Retorno, &
									ls_DatosVuelta, &
									li_Completitud )
	il_error = ll_Retorno
	
	// Comprobamos si hubo error en la ejecuci$$HEX1$$f300$$ENDHEX$$n de la funci$$HEX1$$f300$$ENDHEX$$n
	IF ( li_Error <> 0  OR ( ll_Retorno > 0 AND ll_Retorno < 90000000)) THEN
		// Error de ejecuci$$HEX1$$f300$$ENDHEX$$n
		// Vamos a llamar a la funci$$HEX1$$f300$$ENDHEX$$n que nos devuelve el error del objeto de 
		// comunicaciones
		li_Longitud = OPLINKCE( ll_Retorno, li_Error, ls_Descripcion, li_Reservado )
		IF li_Longitud > 0 THEN
			is_Error_Logica_BD = TRIM( ls_Descripcion )
		ELSE
			is_Error_Logica_BD = "Error de ejecuci$$HEX1$$f300$$ENDHEX$$n del objeto, pero no es capaz de recuperar la descripci$$HEX1$$f300$$ENDHEX$$n del error..."
		END IF
	ELSEIF (ll_Retorno > 90000000) THEN
			// Error tratado por la funci$$HEX1$$f300$$ENDHEX$$n de negocio
			is_Error_Logica_BD = ls_DatosVuelta
	ELSEIF ((ls_DatosVuelta <> "" and not IsNull(ls_DatosVuelta)) AND as_funcion='IEI7064N') THEN
		as_salida[ li_Indice ] = ls_DatosVuelta
		is_Error_Logica_BD = TRIM( Mid(ls_DatosVuelta,7,60) ) 
		// Modificamos el error con el devuelto por la funci$$HEX1$$f300$$ENDHEX$$n SIE
		ll_Retorno = Long ( Left(ls_DatosVuelta,4) )
		li_indice ++			
	ELSE			
		//Ajuste de los espacios que nos deja W10. JHD 29012008
		IF as_funcion='CMEI0001' OR as_funcion='CMEI0006' OR as_funcion='CMEX0001' THEN		
		
			ls_DatosVuelta=RIGHTTRIM(ls_DatosVuelta)
			
			do while Mod(Len(ls_DatosVuelta),56)<>0 
				ls_DatosVuelta= ls_DatosVuelta+" "				
			loop
			
		elseif as_funcion='CMEI0012' then
				ls_DatosVuelta=RIGHTTRIM(ls_DatosVuelta)
			
			do while Mod(Len(ls_DatosVuelta),155)<>0 
				ls_DatosVuelta= ls_DatosVuelta+" "				
			loop
			
		END IF
		
		as_salida[ li_Indice ] = ls_DatosVuelta
		li_indice ++
	END IF

	// Primitiva 5
	li_Primitiva = 5
	
	// Guardamos el error
	il_Error = ll_Retorno

	if as_funcion = 'GAI5524N' and ll_Retorno = 90000000 then
		// Salimos del bucle de llamada, puesto que tenemos los datos para
		// rellamar desde fuera de esta funci$$HEX1$$f300$$ENDHEX$$n
		li_Error = 1
	End If

LOOP WHILE ( li_Completitud = 0 ) AND ( li_Error = 0 ) AND ( ll_Retorno = 0 )

// La primitiva se mantiene a 0 para una $$HEX1$$fa00$$ENDHEX$$nica comunicaci$$HEX1$$f300$$ENDHEX$$n 
ii_Primitiva = 0

if as_funcion = 'GAI5524N' and ll_Retorno = 90000000 then
	// El SGA env$$HEX1$$ed00$$ENDHEX$$a este c$$HEX1$$f300$$ENDHEX$$digo de error para avisar de que hay m$$HEX1$$e100$$ENDHEX$$s datos para devolver
	ll_Retorno = 0
end if

RETURN ll_Retorno
end function

public function long of_load_auth (string dest_func, string string_dat[], integer return_tr[], ref string return_string[], string more_call);//////////////////////////////////////////////////////////////////////////
//
//   Function : of_loadf
//
//   Objectives : This function calls SGA/SIE/SIS server using Openlink. 
//
//   Arguments : dest_func : Calling function in SGA/SIE/SIS server.
//					 string_dat[] : String array with all the function arguments.
//					 return_tr[] : Integer array with all the return variable sizes.
//					 return_string[] : String array with all the return variables.
//
//////////////////////////////////////////////////////////////////////////
//
//   Javier Camacho Mart$$HEX1$$ed00$$ENDHEX$$nez          24/01/2001
//   soluziona - Software Factory
//
//////////////////////////////////////////////////////////////////////////

String			ls_total, ls_return, as_salida[]
Integer		index, li_index, li_pos_amount=1, li_complet
Long 			error_int, ll_return

// Initial
ls_return = ""
////////

For index = 1 to UpperBound(string_dat)
	if not isNull(string_dat[index]) and len(string_dat[index]) > 0 then
		if left(string_dat[index],1) = '+' then 
			string_dat[index] = of_round(string_dat[index]) 
		end if
		ls_total += string_dat[index]
	end if
Next

// Security 
if is_comprobacion= '1' AND of_securityconnect(is_proyecto, is_usuario, is_password, ll_return) > 0 then
	is_Error_Logica_BD = "Se ha producido un error al intentar validar el usuario del sistema : " + is_proyecto + ". Es posible que el servidor no se encuentre disponible en este momento."
	return ERROR_SEC
end if

//// Server function
//if more_call = 'S' then
//	li_complet = 0
//else
//	li_complet = 1
//end if

li_complet = 0


error_int = of_llamar_fn(dest_func, as_salida, ls_total, li_complet)

 long ls_TotEnis,ls_TotEnis1
 long li_in,li_inarr
 
 //Ajuste de los espacios que nos deja W10. JHD 29012008	
IF dest_func='CMEI0001' OR dest_func='CMEI0006' or dest_func='CMEX0001' then
	if upperbound(as_salida) > 0 then
		for index = 1 to upperbound(as_salida)
			ls_return = ls_return + as_salida[index]
			ls_TotEnis=Len(as_salida[index])/56
			ls_TotEnis1=ls_TotEnis1+ls_TotEnis						
		next
	end if
	
		 li_in = 1
		 li_inarr = 1
		 do while li_in < ls_TotEnis1 + 1
			  return_tr[li_inarr] = 6  // Codigo Expresion
			  li_inarr++
			  return_tr[li_inarr] = 50 // Asunto
			  li_inarr++  	
			  li_in ++
		 loop	
else
		if upperbound(as_salida) > 0 then
		for index = 1 to upperbound(as_salida)
			ls_return = ls_return + as_salida[index]							
		next
	end if
end if	



If len(ls_return) > 0 Then
	For index = 1 to UpperBound(return_tr)
		return_string[index] = Mid(ls_return, li_pos_amount, return_tr[index])
		li_pos_amount += return_tr[index]
	Next
end if

//If UpperBound(return_string) > 0 Then
//	return 0
//End If

return error_int

end function

public function string of_round (string quant);dec lde_cantidad
long decimal_places
string ls_return

decimal_places = Long(ProfileString("opensgt.ini","PREFERENCES","decimales","0"))

lde_cantidad = dec(quant)

lde_cantidad = Round(lde_cantidad,decimal_places)

if len(quant) = 18 then // Es un importe o coste a redondear
	ls_return = String(lde_cantidad,"+0000000000000.000")
elseif len(quant) = 14 then // Es un tipo de cambio
	ls_return = String(lde_cantidad,"+000000.000000")
else // Para el resto de casos se devuelve lo que se env$$HEX1$$ed00$$ENDHEX$$a 
	ls_return = quant 
end if
return ls_return

end function

public function string of_get_descripcion_error ();//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	of_get_codigo_error
//       
// Objetivo:	Devuelve la descripci$$HEX1$$f300$$ENDHEX$$n del error
//
// Fecha   	Responsable Actuaci$$HEX1$$f300$$ENDHEX$$n
//------------------------------------------------
// 160708 	JME  
//
//////////////////////////////////////////////////


RETURN is_error_logica_bd
end function

public function integer of_configuracion (string as_servidor, string ps_nombrefichero);//////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:	of_configuracion para n_controlador
// 
// Objetivo:	Configuraci$$HEX1$$f300$$ENDHEX$$n de la comunicaci$$HEX1$$f300$$ENDHEX$$n.
//
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  	string as_Servidor ( Servidor a conectarse )
//					string as_Usuario ( Usuario de la BD )
//					string as_Clave ( Clave de la BD )
//	Salida:   
//						
// Devuelve:	integer (0 OK, -1 KO )
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----			-----------			---------
//	6-2-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////
INTEGER li_Primitiva = 0, li_Completitud = 1, li_Error
STRING ls_Reservado, ls_Entrada, ls_DatosVuelta
LONG ll_Retorno

// Inicializaci$$HEX1$$f300$$ENDHEX$$n de valores
is_servidor = ProfileString("opensgi.ini",as_servidor,"servidor","")
is_usuario = ProfileString("opensgi.ini",as_servidor,"usuario","")
is_password = ProfileString("opensgi.ini",as_servidor,"clave","")
is_proyecto = ProfileString("opensgi.ini",as_servidor,"proyecto","")
is_comprobacion = ProfileString("opensgi.ini",as_servidor,"comprobacion_usuario","")

// Vamos a realizar una llamada para resetear y comprobar si todo va OK
// Llamada a la funci$$HEX1$$f300$$ENDHEX$$n 
//JHD 13/02/2008 
/*li_Error = OPLINKCL( 	li_Primitiva, &
								is_Servidor, &
								"", &
								ls_Reservado, &
								Ls_Entrada, &
								ll_Retorno, &
								ls_DatosVuelta, &
								li_Completitud ) */

IF li_Error < 0 THEN 
	RETURN -1
END IF


RETURN 0
end function

event constructor;//////////////////////////////////////////////////
// 
// Evento: 	constructor para n_controlador
// 
// Objetivo:		Se trata de instanciar los DataStores necesarios para realizar la conversi$$HEX1$$f300$$ENDHEX$$n
//					de los bloques de entrada o salida hacia el DataWindow.
//
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	----------		-----------			---------
//	4-3-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////
ids_Replica 	= 	CREATE DataStore
ids_Buffer 		= 	CREATE DataStore


end event

event destructor;//////////////////////////////////////////////////
//
// Evento: 	destructor para n_controlador
// 
// Objetivo:		Se trata de destruir los DataStores auxiliares para realizar las conversiones
//					necesarias
//
//	Fecha		Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//	----------		-----------			---------
//	4-3-97		JCC				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
//////////////////////////////////////////////////
// VARIABLES LOCALES
// Variables de llamada a la funci$$HEX1$$f300$$ENDHEX$$n OPLINKCL
// La primitiva es 4 que indica que se cierra la conversaci$$HEX1$$f300$$ENDHEX$$n.
integer li_Primitiva = 4
long ll_Retorno = 0
string ls_DatosVuelta
int li_Completitud = 0
int li_Error = 0
string ls_Reservado = SPACE(50)
string ls_Funcion = "VACIA"
string ls_Entrada = ""
// Variables de llamada a la funci$$HEX1$$f300$$ENDHEX$$n OPLINKCE
string ls_Descripcion = SPACE(255)
int li_Reservado = 0
int li_Longitud = 0
// Variables para el control de m$$HEX1$$fa00$$ENDHEX$$ltiples llamadas
int li_Indice = 1
boolean lb_Error = FALSE
//
//////////////

DESTROY 	ids_Replica 
DESTROY	ids_Buffer


// Los Datos de vuelta est$$HEX1$$e100$$ENDHEX$$n limitados y los inicializamos
ls_DatosVuelta = SPACE(10000)

// Llamada a la funci$$HEX1$$f300$$ENDHEX$$n 
li_Error = OPLINKCL( 	li_Primitiva, &
								is_Servidor, &
								ls_Funcion, &
								ls_Reservado, &
								ls_Entrada, &
								ll_Retorno, &
								ls_DatosVuelta, &
								li_Completitud )


end event

on u_openlink.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_openlink.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


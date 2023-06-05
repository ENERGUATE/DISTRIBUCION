HA$PBExportHeader$u_crearordenes.sru
forward
global type u_crearordenes from u_openlink
end type
end forward

global type u_crearordenes from u_openlink
end type
global u_crearordenes u_crearordenes

type variables

end variables

forward prototypes
public function integer of_configurarorden ()
public function integer uf_llamadafunciongeneracionorden (long pl_primeraviso, long pl_numeroincidencia, string ps_comentario, ref string ps_numeroos)
public function integer uf_generarorden (long pl_primeraviso, long pl_numeroincidencia, string ps_comentario, ref string ps_numeroos)
private function long of_llamar_fn (string as_funcion, ref string as_salida[], string as_entrada, integer ai_completitud)
end prototypes

public function integer of_configurarorden ();/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Creaci$$HEX1$$f300$$ENDHEX$$n y configuraci$$HEX1$$f300$$ENDHEX$$n del objeto openlink						  */
/* Argumentos  : - 																				  */
/* Devuelve    : -1    Error																	  */
/*					   1    OK																		  */
/*																										  */
/*   Nombre						Fecha								Acci$$HEX1$$f300$$ENDHEX$$n						  */
/*------------------------------------------------------------------------------*/
/*   AHM						02/09/2009							Creaci$$HEX1$$f300$$ENDHEX$$n						  */
/********************************************************************************/
int			li_error								//Valor que devuelve la llamada a la funci$$HEX1$$f300$$ENDHEX$$n de configuraci$$HEX1$$f300$$ENDHEX$$n del objeto
string		ls_servidor							//Servidor al que tenemos que acceder
string		ls_seccion							//Secci$$HEX1$$f300$$ENDHEX$$n del fichero ini de configuraci$$HEX1$$f300$$ENDHEX$$n


//Obtenci$$HEX1$$f300$$ENDHEX$$n del servidor en el que se encuentra la funci$$HEX1$$f300$$ENDHEX$$n de negocio
ls_seccion = "OPENLINK"
ls_servidor = ProfileString("opensgi.ini", ls_seccion, "Servidor", "")
										 
//Configuraci$$HEX1$$f300$$ENDHEX$$n del objeto de comunicaciones
li_Error = of_Configuracion(ls_seccion, "opensgi.ini")
IF li_error <> 0 THEN
	messageBox("Error", "Error en la configuraci$$HEX1$$f300$$ENDHEX$$n del objeto de comunicaci$$HEX1$$f300$$ENDHEX$$n")
	RETURN -1
END IF


RETURN 1

end function

public function integer uf_llamadafunciongeneracionorden (long pl_primeraviso, long pl_numeroincidencia, string ps_comentario, ref string ps_numeroos);/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Llama a la funci$$HEX1$$f300$$ENDHEX$$n de negocio.											  */
/* Argumentos  : pl_primerAviso      -> Primer aviso asociado a la incidencia.  */
/*					  pl_numeroIncidencia -> N$$HEX1$$fa00$$ENDHEX$$mero de la incidencia para la que se  */
/*													 crea la orden de trabajo.					  */
/*					  ps_observaciones    -> Comentario.									  */
/*					  ps_numeroOs         -> n$$HEX1$$fa00$$ENDHEX$$mero de la os que se ha generado		  */
/* Devuelve    : -1    Error																	  */
/*					   1    OK																		  */
/*																										  */
/*   Nombre						Fecha								Acci$$HEX1$$f300$$ENDHEX$$n						  */
/*------------------------------------------------------------------------------*/
/*   AHM						02/09/2009							Creaci$$HEX1$$f300$$ENDHEX$$n						  */
/********************************************************************************/

Any			la_parametros[]	//Estructura en la que se almacena la informaci$$HEX1$$f300$$ENDHEX$$n necesaria para la llamada a la funci$$HEX1$$f300$$ENDHEX$$n openlink
Integer		li_return[]			//EStructura en la que se almacena los tama$$HEX1$$f100$$ENDHEX$$os de lo que se devuelve (En nuestro casa nada)
long			ll_retorno			//Valor que devuelve la llamada a la funci$$HEX1$$f300$$ENDHEX$$n del objeto que invoca a la funci$$HEX1$$f300$$ENDHEX$$n de negocio
string		ls_datos				//Datos que se le pasa a la funci$$HEX1$$f300$$ENDHEX$$n de negocio
string		ls_funcion			//Nombre de la funci$$HEX1$$f300$$ENDHEX$$n de negocio
string		ls_instruccion		//N$$HEX1$$fa00$$ENDHEX$$mero de instrucci$$HEX1$$f300$$ENDHEX$$n que se va a usar
string		ls_nisRad			//Nis del primer aviso asociado a la incidencia para la que se crea la orden
string		ls_return[]			//Mensaje de error que devuelve la llamada a la funci$$HEX1$$f300$$ENDHEX$$n de negocio


ls_instruccion = '130'
ls_funcion = 'OS0430'

//Obtenci$$HEX1$$f300$$ENDHEX$$n del nis_rad del primer aviso
SELECT to_char(nis_rad)
INTO :ls_nisRad
FROM gi_avisos
WHERE nro_aviso = :pl_primerAviso;

//ls_nisRad = '2675927'

//Contrucci$$HEX1$$f300$$ENDHEX$$n de los datos
ls_datos = ls_instruccion + CHAR(2) + 'PRSGCSGD' + CHAR(1) + ls_nisRad + CHAR(1) + string(pl_numeroIncidencia) + CHAR(1) + ps_comentario

//Carga de la estructura en la que se pasar$$HEX1$$e100$$ENDHEX$$n los datos
la_parametros[1] = ls_datos

//Carga del tama$$HEX1$$f100$$ENDHEX$$o del string que devuelve la funci$$HEX1$$f300$$ENDHEX$$n
li_return[1]=15

//Llamada a la funci$$HEX1$$f300$$ENDHEX$$n OpenLink 
ll_retorno = of_loadf(ls_funcion, la_parametros, li_return, ls_return)

IF ll_retorno = 0 THEN		//Comprobamos si ha funcionado bien la llamada al openlink
	
	ps_numeroOs = right(ls_return[1], 8)
	
ELSE
	
	setNull(ps_numeroOs)
	
	INSERT INTO gi_solicitud_orden (usuario, programa, f_actual, nro_incidencia, cadena, enviado)
	VALUES (:gs_usuario, 'iw_incidencias', sysdate, :pl_numeroIncidencia, :ls_datos, 0);

END IF

messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", trim (of_com_return ()))

RETURN 1
end function

public function integer uf_generarorden (long pl_primeraviso, long pl_numeroincidencia, string ps_comentario, ref string ps_numeroos);/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Creaci$$HEX1$$f300$$ENDHEX$$n de una orden														  */
/* Argumentos  : pl_primerAviso      -> primer aviso asociado a la incidencia.  */
/*					  pl_numeroIncidencia -> n$$HEX1$$fa00$$ENDHEX$$mero de la incidencia para la que se  */
/*													 crea la orden.								  */
/*					  ps_comentario		 -> comentario.									  */
/*					  ps_numeroOs         -> n$$HEX1$$fa00$$ENDHEX$$mero de la os que se ha generado		  */
/* Devuelve    : -1    Error																	  */
/*					   1    OK																		  */
/*																										  */
/*   Nombre						Fecha								Acci$$HEX1$$f300$$ENDHEX$$n						  */
/*------------------------------------------------------------------------------*/
/*   AHM						02/09/2009							Creaci$$HEX1$$f300$$ENDHEX$$n						  */
/********************************************************************************/

of_configurarOrden()
uf_llamadaFuncionGeneracionOrden(pl_primerAviso, pl_numeroIncidencia, ps_comentario, ps_numeroOs)

RETURN 1
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
int		li_error
int		li_longitud
int		li_primitiva
int		li_reservado
long		ll_codError
long    	ll_retorno
string	ls_datosVuelta
string	ls_descripcion
string	ls_reservado


li_primitiva = 0 
ls_reservado = SPACE(50)
ll_retorno = 0


ll_codError = OPLINKCL( li_primitiva, is_servidor, as_funcion, ls_reservado, as_entrada, ll_Retorno, ls_DatosVuelta, ai_completitud )

IF ( ll_codError <> 0  OR ( ll_Retorno > 0 AND ll_Retorno < 90000000)) THEN
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
END IF

as_salida[1] = ls_datosVuelta

RETURN ll_retorno


end function

on u_crearordenes.create
call super::create
end on

on u_crearordenes.destroy
call super::destroy
end on


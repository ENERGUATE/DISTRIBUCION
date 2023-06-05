HA$PBExportHeader$rf_servidor_operacion.sru
$PBExportComments$Objeto de comunicaci$$HEX1$$f300$$ENDHEX$$n con Operaciones
forward
global type rf_servidor_operacion from nonvisualobject
end type
type rf_function from structure within rf_servidor_operacion
end type
type rf_handler from structure within rf_servidor_operacion
end type
type rfc_function from structure within rf_servidor_operacion
end type
type rfc_services from structure within rf_servidor_operacion
end type
type rf_serv from structure within rf_servidor_operacion
end type
end forward

type rf_function from structure
	string		nfun
	boolean		fun
	string		par_in
	string		par_out
	string		ayuda
	string		comentario
	long		contador
end type

type rf_handler from structure
	character		buf_r[2048]
	long		procesados
	long		leidos
	long		buf_w[2048]
	long		escritos
	long		sock
	long		stat
	string		desc
	rf_function		funcs[]
end type

type rfc_function from structure
	string		nfun
	string		par_in
	string		par_out
end type

type rfc_services from structure
	rf_handler		rf[]
	rfc_function		funcs[]
	string		host
	long		puerto
end type

type rf_serv from structure
	character		buf_r[1024]
	long		procesados
	long		leidos
	long		buf_w[1024]
	long		escritos
	long		sock
	long		stat
	string		desc
	rf_function		funcs[]
end type

global type rf_servidor_operacion from nonvisualobject
end type
global rf_servidor_operacion rf_servidor_operacion

type prototypes
FUNCTION int   rfc_open(ref  rfc_services aux,string host, long port) LIBRARY  "librfs.dll"   ALIAS   FOR "_rfc_open@12;Ansi"
FUNCTION int   rfc_call(ref rfc_services aux,string nfun, ref rf_handler rfh) LIBRARY  "librfs.dll"   ALIAS   FOR "_rfc_call@12;Ansi"
SUBROUTINE rfc_services_close(rfc_Services aux) LIBRARY  "librfs.dll"   ALIAS   FOR "_rfc_services_close@4;Ansi"
FUNCTION int rfc_ping(ref rfc_services aux) LIBRARY  "librfs.dll"   ALIAS   FOR "_rfc_ping@4;Ansi"
FUNCTION int rf_readInt(ref rf_handler aux,ref long  a) LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_readInt@8;Ansi"
FUNCTION int rf_writeInt(ref rf_handler aux,long   a)  LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_writeInt@8;Ansi"
FUNCTION  int rf_readString(ref rf_handler aux,ref string a) LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_readString@8;Ansi"
FUNCTION int rf_writeString(ref rf_handler aux,ref string a)  LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_writeString@8;Ansi"
FUNCTION int rf_writeSepCampos(ref rf_handler aux)  LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_writeSepCampos@4;Ansi"
FUNCTION  int rf_writeSepRegistros(ref rf_handler aux)  LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_writeSepRegistros@4;Ansi"
FUNCTION  int rf_writeSepComandos(ref rf_handler aux)  LIBRARY  "librfs.dll"   ALIAS   FOR "_rf_writeSepComandos@4;Ansi"
SUBROUTINE rfc_close_pcall(ref rf_handler aux) LIBRARY  "librfs.dll"   ALIAS   FOR "_rfc_close_pcall@4;Ansi"
SUBROUTINE rfc_close_pb(ref rf_handler aux) LIBRARY  "librfs.dll"   ALIAS   FOR "_rfc_close@4;Ansi"
FUNCTION int gethostname (ref string name, int namelen ) library "wsock32.dll" alias for "gethostname;Ansi"
FUNCTION string GetHost(string lpszhost, ref string lpszaddress ) library "pbws32.dll" alias for "GetHost;Ansi"
SUBROUTINE ComGetHost(REF string Name, REF string Ip) LIBRARY "comunica2002.dll" ALIAS FOR "_ComGetHost@8;Ansi"
//AHM(01/01/2010) ASUR 815618
Function integer shutdown (uint s, int how) Library "wsock32.dll" 
Function integer closesocket (uint socket) Library "wsock32.dll" 
end prototypes

type variables
//Versi$$HEX1$$f300$$ENDHEX$$n para  el log del servidor de operaci$$HEX1$$f300$$ENDHEX$$n y ventana acerca de 
string is_version = " Versi$$HEX1$$f300$$ENDHEX$$n 2001.2"
// Identificador de versi$$HEX1$$f300$$ENDHEX$$n de compatibilidad del servidor de operaci$$HEX1$$f300$$ENDHEX$$n
 string is_indentificativo = "1"

CONSTANT int  RF_BUF_LEC = 1024
CONSTANT int RF_BUF_ESC = 1024
CONSTANT int RF_MAX_FIELD = 128
CONSTANT int RF_LISTEN = 5
int id_servidor  = 45
int id_puerto = 46
private rfc_services rfs, rfs_servidor
public boolean ib_conectado = false
public boolean ib_opensgi_ini
string is_ip
long il_puerto
long il_puerto_peticiones
nca_systray iu_systray
end variables

forward prototypes
public function integer of_conecta ()
public function integer of_actualiza_icono ()
public subroutine of_parametros_conexion (ref string ps_ip, ref long pl_puerto, ref boolean pb_opensgi_ini)
public function integer of_login ()
public function integer of_logout ()
public function integer of_bloquea (string ps_tabla, long pl_codigo, ref string ps_mensaje)
public function integer of_desbloquea (string ps_tabla, long pl_codigo, ref string ps_mensaje)
public function integer of_control_bloqueos (string ps_tabla, long pl_codigo, ref string ps_mensaje, boolean pb_bloquear)
public function integer of_desbloquea_usuarios (ref string ps_mensaje)
public function integer of_avisar_baja_incidencia (long pl_codigo, ref string ps_mensaje)
public function integer of_resuelve_indisponibilidad (long pl_codigo, ref string ps_mensaje)
public function long of_devuelve_sesion ()
public function integer of_fin_cambio (long pl_codigo, ref string ps_mensaje)
public function integer of_avisar_alta_incidencia (long pl_codigo, long pl_linea, datetime pdt_f_deteccion, long pl_tipo_alta, ref string ps_mensaje)
public function integer of_avisar_consulta_incidencia (long pl_codigo, ref string ps_mensaje)
public function integer of_avisar_salida_consulta_incidencia (long pl_codigo, ref string ps_mensaje)
public function integer of_avisar_mod_incidencia (long pl_codigo, long pl_estado, long pl_ot, long pl_causa, ref string ps_mensaje)
public function integer of_reavisar_consulta_incidencia ()
public subroutine of_devuelve_version (ref string ps_version, ref string ps_indentificativo)
public function string of_version_sop ()
public function integer of_avisar_poner_eb (long pl_codigo, long pl_estado, ref string ps_mensaje, integer pi_accion)
public function integer of_tool_aviso (long pl_codigo, datetime pdt_f_alta, integer pi_tipo, ref string ps_mensaje, integer pi_ci)
public function integer of_tool_vip (long pl_codigo, datetime pdt_f_alta, integer pi_tipo, ref string ps_mensaje, integer pi_ci, datetime pdt_f_baja, long pl_nis)
public function integer of_avisar_mod_descargo (long pl_nro_descargo, integer pi_estado, ref string ps_mensaje)
public function integer of_agrupa_simulacion_descargo (long pl_nro_descargo, long pl_lista_desc[], ref string ps_mensaje)
public function integer of_baja_simulacion_descargo (long pl_nro_descargo, ref string ps_mensaje)
public function integer of_desagrupa_simulacion_descargo (long pl_nro_descargo, long pl_lista_desc[], ref string ps_mensaje)
public function integer of_agrupa_simulacion_incidencia (long pl_nro_incidencia1, long pl_nro_incidencia2, ref string ps_mensaje)
public function integer of_baja_simulacion_incidencia (long pl_nro_incidencia, ref string ps_mensaje)
public function integer of_avisar_agrupacion_incidencias (long pl_cod_alta, long pl_linea_alta, datetime pdt_f_deteccion_alta, long pl_tipo_alta, long pl_cod_baja[], ref string ps_mensaje)
public function integer of_avisar_desagrupacion_incidencias (long pl_cod_alta[], long pl_linea_alta[], datetime pdt_f_deteccion_alta[], long pl_tipo_alta, ref string ps_mensaje)
public function integer of_abrir_indisponibilidad (long pl_codigo, long pl_nro_incidencia, long pl_cod_maniobra, datetime pdt_f_maniobra, ref string ps_mensaje)
end prototypes

public function integer of_conecta ();//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_conecta
// Objetivo:    Conecta el OpenSgi con el servidor de conectividad
//
//
//
// Ambito:      Privado
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: Parametros de conexion obtenidos del OpenSgi.ini
// Devuelve:     0 --> Error
//					  1 --> correcto
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 16/01/2001        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//
///////////////////////////////////////////////////////////////
int retorno 
string ip="localhost"
 rfc_services lst_nula
long  puerto 

setpointer(hourglass!)

if ib_conectado then of_logout()

of_parametros_conexion(is_ip,il_puerto,ib_opensgi_ini)

rfs= lst_nula
retorno=rfc_open(rfs,is_ip,il_puerto)

if retorno <>1 then
	ib_conectado = false
else 
	rfs_servidor = rfs
	retorno = of_login()
	if retorno = 1 then 
		ib_conectado = true
	else	
		rfs = lst_nula
		ib_conectado = false
		halt close
	end if
end if

return retorno
end function

public function integer of_actualiza_icono ();////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_actualiza_icono
// Objetivo:    Actualiza el icono indicativo del servidor de conectividad tras hacer un ping
//
//
//
// Ambito:      Privado
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: 
// Devuelve:     //					  
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 16/01/2001        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//
///////////////////////////////////////////////////////////////
int retorno

		setpointer(hourglass!)
		retorno= rfc_ping(rfs)
		if retorno =1 then // CONECTADO
		   if gb_operaciones then
		   if iu_systray.ib_systemtrayexists() then 
				iu_systray.changeicon("semafv.ico")
				iu_systray.changetip("Servidor de Operaciones  ON")
			else
					iu_systray.addicon("semafv.ico","Servidor de Operaciones ON",w_operaciones)			
			end if
		end if
		 
		else // NO ESTA CONECTADO 
			retorno = of_conecta()
		
			if retorno = 1 then // SE HA CONECTADO
				if gb_operaciones then 
				if iu_systray.ib_systemtrayexists() then 
					iu_systray.changeicon("semafv.ico")
					iu_systray.changetip("Servidor de Operaciones  ON")
				else
					iu_systray.addicon("semafv.ico","Servidor de Operaciones  ON",w_operaciones)			
				end if
				end if
			else // NO SE HA PODIDO CONECTAR
				if gb_operaciones then 
				if iu_systray.ib_systemtrayexists() then 
			   	iu_systray.changeicon("semafr.ico")
		 		   iu_systray.changetip("Servidor de Operaciones  OFF")
	   		else
					iu_systray.addicon("semafr.ico","Servidor de Operaciones  OFF",w_operaciones)			
				end if

				end if
			end if
		
					 	
		end if 
     setpointer(Arrow!)
return retorno
end function

public subroutine of_parametros_conexion (ref string ps_ip, ref long pl_puerto, ref boolean pb_opensgi_ini);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_parametros_conexion
// Objetivo:    Obtiene los parametros de conexion al servidor de operacion
//
//
//
// Ambito:      Privado
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: 
// Devuelve:     ps_ip --->Ip o nombre de la m$$HEX1$$e100$$ENDHEX$$quina donde se est$$HEX2$$e1002000$$ENDHEX$$ejecutando el servidor.
//					  pl_puerto --> Puerto 
//					  pb_opensgi_ini --> Indica si se han obtenido los valores del ini o de la tabla de configuraci$$HEX1$$f300$$ENDHEX$$n de operaciones	 						
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 16/04/2001        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//
///////////////////////////////////////////////////////////////

string ip
long puerto 


ip = ProfileString("Opensgi.ini", "Operaciones", "Soperaciones", "localhost")

puerto = long(Profilestring("Opensgi.ini", "Operaciones", "PSoperaciones", "0"))


if puerto = 0 then // NO EXISTE EN EL OPENSGI.INI
	
  SELECT "OOP_CONFIGURACION"."VALOR"  
    INTO :ip
    FROM "OOP_CONFIGURACION"  
   WHERE "OOP_CONFIGURACION"."ID" = :id_servidor   ;
	
  SELECT TO_NUMBER("OOP_CONFIGURACION"."VALOR"  )
    INTO :puerto
    FROM "OOP_CONFIGURACION"  
   WHERE "OOP_CONFIGURACION"."ID" = :id_puerto   ;
		pb_opensgi_ini = false
else
	pb_opensgi_ini = true
end if 

ps_ip = ip
pl_puerto = puerto



end subroutine

public function integer of_login ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_login
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Solicita al servidor de Operaci$$HEX1$$f300$$ENDHEX$$n una sesi$$HEX1$$f300$$ENDHEX$$n.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int li_retorno
string ls_res
int retorno 
long   res
rf_handler rfh
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
long ll_puerto 
string ls_nombre, ls_dirtcp, ls_version



ls_nombre=space(255)
ls_dirtcp=space(255)

gethostname(ls_nombre,255)
ComGetHost(ls_nombre,ls_dirtcp)

//ls_display=""
//for li_contador=1 to 3
//	ls_display=ls_display+string(asc(Mid(ls_dirtcp,li_contador,1)))+"."
//next
//   ls_display=ls_display+string(asc(Mid(ls_dirtcp,4,1)))
//
//
//ls_ip = ls_display

ls_ip = ls_dirtcp 

ls_version = is_version + of_version_sop()

ls_res = space(50)

// Recuperamos el puerto que nos ha devuelto comunica.dll, que es el primer puerto libre que ha encontrado al levantar el servidor del SGI. Siempre 
// y cuando en el .ini haya un 0

ll_puerto = gu_operaciones.il_servidor

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs_servidor,"loginSGI",ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  CI 
	if retorno = 1 then 	
		retorno= rf_writeString(ref rfh,gs_usuario) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
		     	retorno= rf_writeString(ref rfh,ls_ip) 
					if retorno=0 then  // TODO OK
						retorno= rf_writeSepCampos(ref rfh)
				     	if retorno =0  then // TODO OK
							retorno= rf_writeInt(ref rfh,ll_puerto) 
								if retorno=0 then  // TODO OK
									retorno= rf_writeSepCampos(ref rfh)
										if retorno =0  then // TODO OK
									     	retorno= rf_writeString(ref rfh,is_version) 
											if retorno=0 then  // TODO OK
												retorno= rf_writeSepCampos(ref rfh)
												 if retorno =0  then // TODO OK
       					   	   	     	retorno= rf_writeString(ref rfh,is_indentificativo)    
								
													if retorno = 0  then  // TODO OK
															retorno= rf_writeSepComandos(ref rfh)
															retorno= rfc_ping(rfs_servidor)  // VERIFICA SI HAY CONEXION
															if retorno = 1 then // 
																rf_readInt(ref rfh,ref res)
																rf_readString(ref rfh,ref ls_res)
															end if
														end if
													end if
											end if
										end if
									end if
								end if
							end if
						end if
				end if
		end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

//*** LSH *** INI *** DDAG-3917 *** 05/10/2015
/* Se comento la validacion que verifica si ya hay un usuario del SGI logueado
en el sistema - solo se comento el mensaje, el servidor de OOP aun sigue haciendo
la validacion*/
//if res>0 then 
	il_puerto_peticiones = res
	rfs= lst_nula
	retorno=rfc_open(rfs,is_ip,il_puerto_peticiones)
	return 1
//else
	//messagebox("Aviso",ls_res)
	//return 0
//end if
//*** LSH *** FIN *** DDAG-3917 *** 05/10/2015



end function

public function integer of_logout ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_logout
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Cierra la sesi$$HEX1$$f300$$ENDHEX$$n establecida con Operaci$$HEX1$$f300$$ENDHEX$$n.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int li_retorno
string ls_res
int retorno 
long   res
rf_handler rfh
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula




if ib_conectado then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,"logoutSGI",ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  CI 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
					if retorno = 0  then  // TODO OK
								retorno= rf_writeSepComandos(ref rfh)
//								retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXON
								retorno = 1
									if retorno = 1 then // 
										rf_readInt(ref rfh,ref res)
//										rf_readString(ref rfh,ref ls_res)
									end if
					end if
	end if
	
 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)
	
end if 
return retorno
end function

public function integer of_bloquea (string ps_tabla, long pl_codigo, ref string ps_mensaje); /////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_bloquea
//
//  Argumentos : ps_tabla --> Nombre de la tabla
//					  pl_codigo --> Codigo del registro
//					  ps_mensaje --> Mensaje de error 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Bloquea un registro en la tabla solicitada								
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno

retorno = of_control_bloqueos(ps_tabla,pl_codigo,ps_mensaje,true)

return retorno
end function

public function integer of_desbloquea (string ps_tabla, long pl_codigo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_desbloquea
//
//  Argumentos : ps_tabla --> Nombre de la tabla
//					  pl_codigo --> Codigo del registro
//					  ps_mensaje --> Mensaje de error 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Desbloquea un registro en la tabla solicitada								
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno


retorno = of_control_bloqueos(ps_tabla,pl_codigo,ps_mensaje,false)

return retorno
end function

public function integer of_control_bloqueos (string ps_tabla, long pl_codigo, ref string ps_mensaje, boolean pb_bloquear);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_control_bloqueos
//
//  Argumentos : ps_tabla --> Nombre de la tabla
//					  pl_codigo --> Codigo del registro
//					  ps_mensaje --> Mensaje de error 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Solicita al servidor de Operaciones el bloqueo/ desbloqueo de registros								
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula


rfh = rfh_nulo


int retorno

string ls_servicio


CHOOSE CASE ps_tabla
	CASE "SGD_INCIDENCIA"
		if pb_bloquear then 
			ls_Servicio = "oop_bloq_IncidenciaSGI"
		else
			ls_Servicio = "oop_desbloq_IncidenciaSGI"
		end if
		
	CASE "SGD_DESCARGOS"
			if pb_bloquear then 
				ls_Servicio = "oop_bloq_DescargoSGI"
			else
				ls_Servicio = "oop_desbloq_DescargoSGI"
			end if

		
	CASE "GI_OT"
			if pb_bloquear then 
				ls_Servicio = "oop_bloq_OTSGI"
			else
  				ls_Servicio = "oop_desbloq_OTSGI"
			end if

	//JME 30/04/09 
	CASE "SGD_DISPONIBILIDAD"
			if pb_bloquear then 
				ls_Servicio = "oop_bloq_DisponibilidadSGI"
			else
  				ls_Servicio = "oop_desbloq_DisponibilidadSGI"
			end if
	// Fin JME
		

END CHOOSE

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  CI 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
							if retorno = 0  then  // TODO OK
								retorno= rf_writeSepComandos(ref rfh)
									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
									if retorno = 1 then // RECOGEMOS lOS PARAMETROS
										rf_readInt(ref rfh,ref res)
										rf_readString(ref rfh,ref ls_res)
		
									end if
							end if
					end if
	end if
	
end if


 // CERRAMOS LA CONEXION 
//AHM(04/05/2011) ASUR 1059966
//AHM(01/01/2010) ASUR 815618 
IF ls_Servicio = "oop_bloq_DescargoSGI" OR ls_servicio = "oop_desbloq_DescargoSGI" THEN
	shutdown(rfh.sock, 2)
//	sleep(9)
	closesocket(rfh.sock)
ELSE
//	sleep(9)
	rfc_close_pb(ref rfh)
END IF

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_desbloquea_usuarios (ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_desbloquea_usuarios
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Desbloquea todos los usuarios que pudieran estar bloqueados						
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por ACO, LFE y FDO
//
//  Fecha : 31/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula


rfh = rfh_nulo


int retorno

string ls_servicio

ls_servicio = "oop_desbloqueo_General"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  CI 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
			if retorno = 0  then  // TODO OK
				retorno= rf_writeSepComandos(ref rfh)
				retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
				if retorno = 1 then // RECOGEMOS lOS PARAMETROS
					rf_readInt(ref rfh,ref res)
					rf_readString(ref rfh,ref ls_res)
				end if
			end if
	end if

 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = ""
end if

if res>=0 then
	ps_mensaje=ls_res
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_avisar_baja_incidencia (long pl_codigo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_avisar_baja_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha dado de baja (anulado o en RS) una incidencia
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula




rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_Baja_Incidencia_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
							if retorno = 0  then  // TODO OK
								retorno= rf_writeSepComandos(ref rfh)
									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
									if retorno = 1 then // RECOGEMOS lOS PARAMETROS
										rf_readInt(ref rfh,ref res)
										rf_readString(ref rfh,ref ls_res)
		
									end if
							end if
					end if
	end if
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_resuelve_indisponibilidad (long pl_codigo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_resuelve_indisponibilidad
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha dado de baja (anulado o en RS) una incidencia
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Francisco Donato
//
//  Fecha : 02/03/2006	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula




rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_CerrarIndisponibilidad_manual"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
							if retorno = 0  then  // TODO OK
								retorno= rf_writeSepComandos(ref rfh)
									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
									if retorno = 1 then // RECOGEMOS lOS PARAMETROS
										rf_readInt(ref rfh,ref res)
										rf_readString(ref rfh,ref ls_res)
		
									end if
							end if
					end if
	end if
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function long of_devuelve_sesion ();// DEVUELVE LA SESION DE CONEXION CON EL SERVI
return  il_puerto_peticiones
end function

public function integer of_fin_cambio (long pl_codigo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_fin_cambio
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha dado de alta una incidencia
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula



rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_Notificacion_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
							if retorno = 0  then  // TODO OK
								retorno= rf_writeSepComandos(ref rfh)
									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
									if retorno = 1 then // RECOGEMOS lOS PARAMETROS
										rf_readInt(ref rfh,ref res)
										rf_readString(ref rfh,ref ls_res)
		
									end if
							end if
					end if
	end if
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_avisar_alta_incidencia (long pl_codigo, long pl_linea, datetime pdt_f_deteccion, long pl_tipo_alta, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_avisar_alta_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha dado de alta una incidencia
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion



ls_f_deteccion =  string(pdt_f_deteccion,"DD/MM/YYYY hh:mm:ss")



rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_Alta_Incidencia_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
		       // MANDAMOS EL 	TERCER PARAMETRO
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
							if retorno =0  then // TODO OK
									retorno= rf_writeInt(ref rfh,pl_linea) 

									// MANDAMOS EL CUARTO PARAMETRO
										if retorno=0 then  // TODO OK
											retorno= rf_writeSepCampos(ref rfh)
											if retorno =0  then // TODO OK
													retorno= rf_writeString(ref rfh,ls_f_deteccion) 
												// MANDAMOS EL QUUINTO PARAMETRO
															if retorno=0 then  // TODO OK
																retorno= rf_writeSepCampos(ref rfh)
																if retorno =0  then // TODO OK
																		retorno= rf_writeInt(ref rfh,pl_tipo_alta) 
	
																			
					
												if retorno = 0  then  // TODO OK
													retorno= rf_writeSepComandos(ref rfh)
														retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
														if retorno = 1 then // RECOGEMOS lOS PARAMETROS
															rf_readInt(ref rfh,ref res)
															rf_readString(ref rfh,ref ls_res)
							
														end if
												end if
										end if
												end if
															end if
												end if
				end if
												end if
				end if
												end if
	
	
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_avisar_consulta_incidencia (long pl_codigo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_consultar_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se abre incidencia en modo consulta.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Francisco Donato copy paste del c$$HEX1$$f300$$ENDHEX$$digo de Alfonso Coto.
//
//  Fecha : 14/02/2002	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion


rfh = rfh_nulo

int retorno

string ls_servicio

ls_Servicio = "oop_consulta_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
				retorno= rf_writeInt(ref rfh,pl_codigo) 
				if retorno = 0  then  // TODO OK
					retorno= rf_writeSepComandos(ref rfh)
					retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
					if retorno = 1 then // RECOGEMOS lOS PARAMETROS
						rf_readInt(ref rfh,ref res)
						rf_readString(ref rfh,ref ls_res)
					end if
				end if
			end if
		end if
	end if
	
	
	//AHM	(29/03/2010) ASUR 991143
	//Pausamos la ejecuci$$HEX1$$f300$$ENDHEX$$n de la aplicaci$$HEX1$$f300$$ENDHEX$$n porque daba problemas debido a que se ejecutaba c$$HEX1$$f300$$ENDHEX$$digo antes de lo que debia y se caia
	//sleep(100)	
	IF gi_pais = 3 THEN
		//DisconnectEx(rfh.sock, 0, 0, 0); 
//		closesocket(rfh.sock);
//		rfh.sock = INVALID_SOCKET; 
		
		shutdown(rfh.sock, 2)
		sleep(9)
		closesocket(rfh.sock)
	ELSE
		//sleep(9)
		rfc_close_pb(ref rfh)
	END IF
 
 // CERRAMOS LA CONEXION 
 
//	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_avisar_salida_consulta_incidencia (long pl_codigo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_avisar_salida_consulta_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se abre incidencia en modo consulta.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Francisco Donato copy paste del c$$HEX1$$f300$$ENDHEX$$digo de Alfonso Coto.
//
//  Fecha : 14/02/2002	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion


rfh = rfh_nulo

int retorno

string ls_servicio

ls_Servicio = "oop_quita_consulta_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
				retorno= rf_writeInt(ref rfh,pl_codigo) 
				if retorno = 0  then  // TODO OK
					retorno= rf_writeSepComandos(ref rfh)
					retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
					if retorno = 1 then // RECOGEMOS lOS PARAMETROS
						rf_readInt(ref rfh,ref res)
						rf_readString(ref rfh,ref ls_res)
					end if
				end if
			end if
		end if
	end if

 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_avisar_mod_incidencia (long pl_codigo, long pl_estado, long pl_ot, long pl_causa, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_avisar_mod_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha modificado una incidencia
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion






rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_Modif_Incidencia_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
		       // MANDAMOS EL 	TERCER PARAMETRO
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
							if retorno =0  then // TODO OK
									retorno= rf_writeInt(ref rfh,pl_estado) 

									// MANDAMOS EL CUARTO PARAMETRO
										if retorno=0 then  // TODO OK
											retorno= rf_writeSepCampos(ref rfh)
											if retorno =0  then // TODO OK
													retorno= rf_writeInt(ref rfh,pl_ot) 
												// MANDAMOS EL QUUINTO PARAMETRO
															if retorno=0 then  // TODO OK
																retorno= rf_writeSepCampos(ref rfh)
																if retorno =0  then // TODO OK
																		retorno= rf_writeInt(ref rfh,pl_causa) 
	
																			
					
												if retorno = 0  then  // TODO OK
													retorno= rf_writeSepComandos(ref rfh)
														retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
														if retorno = 1 then // RECOGEMOS lOS PARAMETROS
															rf_readInt(ref rfh,ref res)
															rf_readString(ref rfh,ref ls_res)
							
														end if
												end if
										end if
												end if
															end if
												end if
				end if
												end if
				end if
												end if
	
	
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if



end function

public function integer of_reavisar_consulta_incidencia ();int li_numero_ventana 
string ls_mensaje

for li_numero_ventana= 1 to upperbound(gu_control_v_incidencias.ist_ventana)
if (gu_control_v_incidencias.ist_ventana[li_numero_ventana].modo="C" and gu_control_v_incidencias.ist_ventana[li_numero_ventana].incidencia_operacion ) then 
		of_avisar_consulta_incidencia(gu_control_v_incidencias.ist_ventana[li_numero_ventana].incidencia ,ls_mensaje)
	end if
next

return 1
end function

public subroutine of_devuelve_version (ref string ps_version, ref string ps_indentificativo);// DEVUELVE LA VERSION Y EL IDENTIFICATIVO DE LA VERSION

ps_version =is_version
ps_indentificativo = is_indentificativo
end subroutine

public function string of_version_sop ();// OBTIENE EL SISTEMA OPERATIVO DONDE SE EJECUTA EL SGI


string ls_sistema

environment lenv_env


GetEnvironment(lenv_env)


CHOOSE CASE lenv_env.ostype
	CASE windows!
		
	if lenv_env.osmajorrevision = 4 and lenv_env.osminorrevision= 0  then 
		
			ls_sistema = " Windows 95"
			
	elseif lenv_env.osmajorrevision = 4 and lenv_env.osminorrevision= 1  then 
		
			ls_sistema = "Windows 98"
	else
		
			ls_sistema = " S. O. Desconocido"
		
	
	end if
		

   case  windowsnt!
		if lenv_env.osmajorrevision <= 4 then 
			
			ls_sistema = " Windows NT"
			
		elseif lenv_env.osmajorrevision = 5 and lenv_env.osminorrevision= 0  then 
		
			ls_sistema = " Windows 2000"
			
		else
		
			ls_sistema = " S. O. Desconocido"
		
		end if
		
	CASE ELSE
		ls_sistema = " S. O. Desconocido"
			
END CHOOSE

return ls_sistema


end function

public function integer of_avisar_poner_eb (long pl_codigo, long pl_estado, ref string ps_mensaje, integer pi_accion);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_avisar_poner_eb
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha a$$HEX1$$f100$$ENDHEX$$adido/borrado eb
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  			   1 --> Correcto.
//
// 
//  Fecha : 30/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion






rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_ponerEB_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
				// MANDAMOS EL TERCER PARAMETRO
							if retorno=0 then  // TODO OK
								retorno= rf_writeSepCampos(ref rfh)
								if retorno =0  then // TODO OK
										retorno= rf_writeInt(ref rfh,pi_accion) 	
			
												if retorno = 0  then  // TODO OK
													retorno= rf_writeSepComandos(ref rfh)
														retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
														if retorno = 1 then // RECOGEMOS lOS PARAMETROS
															rf_readInt(ref rfh,ref res)
															rf_readString(ref rfh,ref ls_res)

															end if
												end if
				end if
												end if
				end if
												end if
				
end if
	


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if



end function

public function integer of_tool_aviso (long pl_codigo, datetime pdt_f_alta, integer pi_tipo, ref string ps_mensaje, integer pi_ci);/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////
////  Nombre : of_tool_aviso
////
////  Argumentos : pl_codigo - CM . C$$HEX1$$f300$$ENDHEX$$digo de la instalacion (CT)
////					  pdt_f_alta - Fecha de alta del aviso	
////					  pl_tipo - Tipo de comunicaci$$HEX1$$f300$$ENDHEX$$n de la tool: 
////		 						 1 - Alta
////								 0 - Baja	
////					  ps_mensaje : Mensaje de retorno del SVOP.
////					  pi_ci : Ci del elemento.
//// 
////  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor la correspondiente tool cuando se ha dado de alta un aviso.
////	
////  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
////				  			   1 --> Correcto.
////
////  Realizado por Francisco Donato
////
////  Fecha : 05/02/2003	Soluziona  Software Factory
////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//string ls_res
//
//long   res =0
//rf_handler rfh, rfh_nulo
//int li_contador = 1
//boolean pb_real = false
//string ls_ip
//rfc_services lst_nula
//string ls_f_alta
//
//ls_f_alta =  string(pdt_f_alta,"yyyymmddhhmmss")
//
//rfh = rfh_nulo
//
//int retorno
//
//string ls_servicio
//
//ls_Servicio = "oop_toolAvisoOne"
//
//ls_res = space(50)
//
//if of_Actualiza_icono()>0  then 
//
////PEDIMOS EL SERVICIO 
//	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
//
//	// MANDAMOS EL PRIMER PARAMETRO
//	if retorno =1  then // TODO OK
//		retorno= rf_writeInt(ref rfh,pi_ci) 
//		
//		// MANDAMOS EL SEGUNDO PARAMETRO
//			
//		if retorno=0 then  // TODO OK
//			retorno= rf_writeSepCampos(ref rfh)
//			
//			if retorno =0  then // TODO OK
//				retorno= rf_writeInt(ref rfh,pl_codigo) 
//
//				// MANDAMOS EL TERCER PARAMETRO
//				
//				if retorno=0 then  // TODO OK
//					retorno= rf_writeSepCampos(ref rfh)
//					
//					if retorno =0  then // TODO OK
//						retorno= rf_writeString(ref rfh,ls_f_alta) 
//										
//						// MANDAMOS EL CUARTO PARAMETRO
//						
//						if retorno=0 then  // TODO OK
//							retorno= rf_writeSepCampos(ref rfh)
//						
//							if retorno =0  then // TODO OK
//								retorno= rf_writeInt(ref rfh,pi_tipo) 
//
//								if retorno = 0  then  // TODO OK
//									retorno= rf_writeSepComandos(ref rfh)
//									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
//									if retorno = 1 then // RECOGEMOS lOS PARAMETROS
//											rf_readInt(ref rfh,ref res)
//											rf_readString(ref rfh,ref ls_res)
//									end if
//									
//								end if
//																				
//							end if
//						
//						end if
//					
//					end if
//			
//				end if
//											
//			end if
//
//		end if
//	
//	end if
//
// // CERRAMOS LA CONEXION 
// 
//rfc_close_pb(ref rfh)
//
//else
//	res = -1
//	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
//end if
//
//if res>=0 then
//	ps_mensaje=""

	return 1

//else
//	ps_mensaje= ls_res
//	return 0
//end if
//
//
//
//
end function

public function integer of_tool_vip (long pl_codigo, datetime pdt_f_alta, integer pi_tipo, ref string ps_mensaje, integer pi_ci, datetime pdt_f_baja, long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_tool_vip
//
//  Argumentos : pl_codigo - CM . C$$HEX1$$f300$$ENDHEX$$digo de la instalacion (CT)
//					  pdt_f_alta - Fecha de alta del aviso	
//					  pdt_f_baja - Fecha de alta del aviso	
//					  pl_nis - Nis rad del suministro afectado.
//					  pl_tipo - Tipo de comunicaci$$HEX1$$f300$$ENDHEX$$n de la tool: 
//		 						 1 - Alta
//								 0 - Baja	
//					  ps_mensaje : Mensaje de retorno del SVOP.
//					  pi_ci : Ci del elemento.
// 
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor la correspondiente tool cuando se ha dado de alta un vip o se da de baja
//	
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  			   1 --> Correcto.
//
//  Realizado por Francisco Donato
//
//  Fecha : 25/02/2003	Soluziona  Software Factory
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//bucle de:
//	ci,cm,nis,f_alta,f_baja,valor
//
//	siendo valor: 0 quitar; 1 poner; 2 modificar
//
//no devuelve nada el servicio.

string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_alta,ls_f_baja

rfh = rfh_nulo

int retorno

string ls_servicio

ls_Servicio = "oop_toolVIPOne"

ls_res = space(50)

ls_f_alta = string(pdt_f_alta,"yyyymmddhhmmss")
ls_f_baja = string(pdt_f_baja,"yyyymmddhhmmss")

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 

	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	
	// MANDAMOS EL PRIMER PARAMETRO
	if retorno =1  then // TODO OK
		retorno= rf_writeInt(ref rfh,pi_ci) 
		
		// MANDAMOS EL SEGUNDO PARAMETRO
				
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
				
			if retorno =0  then // TODO OK
				retorno= rf_writeInt(ref rfh,pl_codigo) 
		
				// MANDAMOS EL TERCER PARAMETRO
						
				if retorno=0 then  // TODO OK
					retorno= rf_writeSepCampos(ref rfh)
						
					if retorno =0  then // TODO OK
						retorno= rf_writeInt(ref rfh,pl_nis) 
				
						// MANDAMOS EL CUARTO PARAMETRO
							
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
								
							if retorno =0  then // TODO OK
								retorno= rf_writeString(ref rfh,ls_f_alta) 
										
								// MANDAMOS EL QUINTO PARAMETRO
								
								if retorno=0 then  // TODO OK
									retorno= rf_writeSepCampos(ref rfh)
								
									if retorno =0  then // TODO OK
										retorno= rf_writeString(ref rfh,ls_f_baja) 

										// MANDAMOS EL SEXTO PARAMETRO
						
										if retorno=0 then  // TODO OK
											retorno= rf_writeSepCampos(ref rfh)
												
											if retorno =0  then // TODO OK
												retorno= rf_writeInt(ref rfh,pi_tipo) 
										
											//-----------------------------------------------------
										
												if retorno = 0  then  // TODO OK
													
													retorno= rf_writeSepComandos(ref rfh)
													retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
													
													if retorno = 1 then // RECOGEMOS lOS PARAMETROS
														rf_readInt(ref rfh,ref res)
														rf_readString(ref rfh,ref ls_res)
													end if
												
												end if
																				
											end if
						
										end if
									
									end if
							
								end if
															
							end if
				
						end if
					
					end if
	
				end if
					
			end if

		end if
		
	end if
	
	 // CERRAMOS LA CONEXION 
 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_avisar_mod_descargo (long pl_nro_descargo, integer pi_estado, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_avisar_mod_descargo
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor que se ha modificado el estado del descargo
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por LFE
//
//  Fecha : 12/02/2003	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res, ls_ip, ls_servicio
int retorno, li_contador = 1
long   res =0
boolean pb_real = false
rf_handler rfh, rfh_nulo
rfc_services lst_nula

rfh = rfh_nulo

ls_Servicio = "oop_modifica_descargoSGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 
	//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	
	//MANDAMOS EL PRIMER PARAMETRO: C$$HEX1$$f300$$ENDHEX$$digo del Descargo   
	if retorno = 1  then // TODO OK
		retorno= rf_writeInt(ref rfh, pl_nro_descargo) 
	end if		

	
	if retorno = 0  then  // TODO OK
		retorno= rf_writeSepComandos(ref rfh)
		retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
		
		if retorno = 1 then // RECOGEMOS lOS PARAMETROS
			rf_readInt(ref rfh,ref res)
			rf_readString(ref rfh,ref ls_res)
		end if
	end if
	
	// CERRAMOS LA CONEXION 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_agrupa_simulacion_descargo (long pl_nro_descargo, long pl_lista_desc[], ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_agrupa_simulacion_descargo
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al que se ha realizado la agrupaci$$HEX1$$f300$$ENDHEX$$n de descargos
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por LFE
//
//  Fecha : 04/03/2003	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res, ls_ip, ls_servicio
int retorno, li_contador = 1
long   res =0
boolean pb_real = false
rf_handler rfh, rfh_nulo
rfc_services lst_nula

rfh = rfh_nulo

ls_Servicio = "oop_agrupaSimulacionDescargos"

ls_res = space(50)

if of_Actualiza_icono()>0  then 
	//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	end if
	
	// MANDAMOS EL SEGUNDO PARAMETRO. C$$HEX1$$f300$$ENDHEX$$digo de descargo nuevo.
	if retorno=0 then  // TODO OK
		retorno= rf_writeSepCampos(ref rfh)
	end if
	
	if retorno = 0  then // TODO OK
		retorno= rf_writeInt(ref rfh, pl_nro_descargo) 
	end if		
	
	if retorno=0 then  // TODO OK
		retorno= rf_writeSepCampos(ref rfh)
	end if
	
	if retorno = 0  then // TODO OK
		retorno= rf_writeInt(ref rfh, upperBound(pl_lista_desc[]))
	end if		
	
	retorno= rf_writeSepComandos(ref rfh)
	
	if retorno = 1 then
		retorno = 0
	end if
	
	
	DO WHILE li_contador <= upperBound(pl_lista_desc[]) AND retorno = 0
		// MANDAMOS LOS SIGUIENTES PARAMETROS. Los C$$HEX1$$f300$$ENDHEX$$digos de descargo que entran en la agrupaci$$HEX1$$f300$$ENDHEX$$n.
		if retorno = 0  then // TODO OK
			retorno= rf_writeInt(ref rfh, pl_lista_desc[li_contador]) 
		end if		
		li_contador ++
		
		retorno = rf_writeSepComandos(ref rfh)

		if retorno = 1 then
			retorno = 0
		end if
	LOOP

	if retorno = 0  then  // TODO OK
		//retorno= rf_writeSepComandos(ref rfh)
		retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
		
		if retorno = 1 then // RECOGEMOS lOS PARAMETROS
			rf_readInt(ref rfh,ref res)
			rf_readString(ref rfh,ref ls_res)
		end if
	end if
	
	// CERRAMOS LA CONEXION 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_baja_simulacion_descargo (long pl_nro_descargo, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_baja_simulacion_descargo
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor de operaci$$HEX1$$f300$$ENDHEX$$n que se ha dado de baja un 
//					descargo para que d$$HEX2$$e9002000$$ENDHEX$$de baja la simulaci$$HEX1$$f300$$ENDHEX$$n
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res, ls_ip, ls_servicio
int retorno, li_contador = 1
long   res =0
boolean pb_real = false
rf_handler rfh, rfh_nulo
rfc_services lst_nula

rfh = rfh_nulo

ls_Servicio = "oop_bajaSimulacionDescargos"

ls_res = space(50)

if of_Actualiza_icono()>0  then 
	//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO_ C$$HEX1$$d300$$ENDHEX$$DIGO DEL DESCARGO QUE SE DA DE BAJA 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,pl_nro_descargo) 
	end if
	
	
	if retorno = 0  then  // TODO OK
		retorno= rf_writeSepComandos(ref rfh)
		retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
		
		if retorno = 1 then // RECOGEMOS lOS PARAMETROS
			rf_readInt(ref rfh,ref res)
			rf_readString(ref rfh,ref ls_res)
		end if
	end if
	
	// CERRAMOS LA CONEXION 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_desagrupa_simulacion_descargo (long pl_nro_descargo, long pl_lista_desc[], ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_desagrupa_simulacion_descargo
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor de operaci$$HEX1$$f300$$ENDHEX$$n que se que se eliminan varios
//				   descargo de una agrupaci$$HEX1$$f300$$ENDHEX$$n de descargos, para que adapte la simulaci$$HEX1$$f300$$ENDHEX$$n
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 28/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res, ls_ip, ls_servicio
int retorno, li_contador = 1
long   res =0
boolean pb_real = false
rf_handler rfh, rfh_nulo
rfc_services lst_nula

rfh = rfh_nulo

ls_Servicio = "oop_desagrupaSimulacionDescargos"

ls_res = space(50)

if of_Actualiza_icono()>0  then 
	//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO : C$$HEX1$$f300$$ENDHEX$$digo del descargo agrupado
	
	if retorno = 0  then // TODO OK
		retorno= rf_writeInt(ref rfh, pl_nro_descargo) 
	end if		
	
//	if retorno = 0  then // TODO OK
//		retorno= rf_writeSepComandos(ref rfh)
//	END IF
	
	if retorno=0 then  // TODO OK
		retorno= rf_writeSepCampos(ref rfh)
	end if
	
	if retorno = 0  then // TODO OK
		retorno= rf_writeInt(ref rfh, upperBound(pl_lista_desc[]))
	end if		
	
	retorno= rf_writeSepComandos(ref rfh)
	
	if retorno = 1 then
		retorno = 0
	end if
	
	
	DO WHILE li_contador <= upperBound(pl_lista_desc[]) AND retorno = 0
		// MANDAMOS LOS SIGUIENTES PARAMETROS. Los C$$HEX1$$f300$$ENDHEX$$digos de descargo que entran en la agrupaci$$HEX1$$f300$$ENDHEX$$n.
//		if retorno=0 THEN
//			retorno= rf_writeSepCampos(ref rfh)
//		end if
//		
		if retorno = 0  then // TODO OK
			retorno= rf_writeInt(ref rfh, pl_lista_desc[li_contador]) 
		end if		
		li_contador ++
		
		//if retorno=0 AND li_contador <= upperBound(pl_lista_desc[]) then  // TODO OK
		//	retorno= rf_writeSepCampos(ref rfh)
		//end if
		retorno = rf_writeSepComandos(ref rfh)
		if retorno = 1 then
			retorno = 0
		end if
	LOOP

	if retorno = 0  then  // TODO OK
		//retorno= rf_writeSepComandos(ref rfh)
		retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
		
		if retorno = 1 then // RECOGEMOS lOS PARAMETROS
			rf_readInt(ref rfh,ref res)
			rf_readString(ref rfh,ref ls_res)
		end if
	end if
	
	// CERRAMOS LA CONEXION 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_agrupa_simulacion_incidencia (long pl_nro_incidencia1, long pl_nro_incidencia2, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_agrupa_simulacion_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al que se ha realizado una agrupaci$$HEX1$$f300$$ENDHEX$$n de incidenicias para que
//					agrupe las simulaciones	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por LFE
//
//  Fecha : 04/03/2003	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res, ls_ip, ls_servicio
int retorno, li_contador = 1
long   res =0
boolean pb_real = false
rf_handler rfh, rfh_nulo
rfc_services lst_nula

rfh = rfh_nulo

ls_Servicio = "oop_agrupaSimulacionIncidencia"

ls_res = space(50)

if of_Actualiza_icono()>0  then 
	//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	end if
	
	// MANDAMOS EL SEGUNDO PARAMETRO. C$$HEX1$$f300$$ENDHEX$$digo de incidencia contenedora.
	if retorno=0 then  // TODO OK
		retorno= rf_writeSepCampos(ref rfh)
	end if
	
	if retorno = 0  then // TODO OK
		retorno= rf_writeInt(ref rfh, pl_nro_incidencia1) 
	end if		
	
	if retorno=0 then  // TODO OK
		retorno= rf_writeSepCampos(ref rfh)
	end if
	
	if retorno = 0  then // TODO OK
		retorno= rf_writeInt(ref rfh, pl_nro_incidencia2) 
	end if		
	

	if retorno = 0  then  // TODO OK
		retorno= rf_writeSepComandos(ref rfh)
		retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
		
		if retorno = 1 then // RECOGEMOS lOS PARAMETROS
			rf_readInt(ref rfh,ref res)
			rf_readString(ref rfh,ref ls_res)
		end if
	end if
	
	// CERRAMOS LA CONEXION 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_baja_simulacion_incidencia (long pl_nro_incidencia, ref string ps_mensaje);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_baja_simulacion_incidencia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al servidor de operaci$$HEX1$$f300$$ENDHEX$$n que se tiene que dar de baja la 
//					simulaci$$HEX1$$f300$$ENDHEX$$n asociada a una incidencia
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por LFE
//
//  Fecha : 04/03/2003	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_res, ls_ip, ls_servicio
int retorno, li_contador = 1
long   res =0
boolean pb_real = false
rf_handler rfh, rfh_nulo
rfc_services lst_nula

rfh = rfh_nulo

ls_Servicio = "oop_bajaSimulacionIncidencia"

ls_res = space(50)

if of_Actualiza_icono()>0  then 
	//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO_ C$$HEX1$$d300$$ENDHEX$$DIGO DE LA INCIDENCIA
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,pl_nro_incidencia) 
	end if
	
	
	if retorno = 0  then  // TODO OK
		retorno= rf_writeSepComandos(ref rfh)
		retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
		
		if retorno = 1 then // RECOGEMOS lOS PARAMETROS
			rf_readInt(ref rfh,ref res)
			rf_readString(ref rfh,ref ls_res)
		end if
	end if
	
	// CERRAMOS LA CONEXION 
	rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if

end function

public function integer of_avisar_agrupacion_incidencias (long pl_cod_alta, long pl_linea_alta, datetime pdt_f_deteccion_alta, long pl_tipo_alta, long pl_cod_baja[], ref string ps_mensaje);string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion
long ll_indice = 1


ls_f_deteccion =  string(pdt_f_deteccion_alta,"DD/MM/YYYY hh:mm:ss")



rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_Agrupar_Incidencia_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_cod_alta) 
		       // MANDAMOS EL 	TERCER PARAMETRO
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
							if retorno =0  then // TODO OK
									retorno= rf_writeInt(ref rfh,pl_linea_alta) 

									// MANDAMOS EL CUARTO PARAMETRO
										if retorno=0 then  // TODO OK
											retorno= rf_writeSepCampos(ref rfh)
											if retorno =0  then // TODO OK
													retorno= rf_writeString(ref rfh,ls_f_deteccion) 
												// MANDAMOS EL QUUINTO PARAMETRO
															if retorno=0 then  // TODO OK
																retorno= rf_writeSepCampos(ref rfh)
																if retorno =0  then // TODO OK
																		retorno= rf_writeInt(ref rfh,pl_tipo_alta) 
	
																			
					
												if retorno = 0  then  // TODO OK

																
														DO WHILE (ll_indice <= Upperbound(pl_cod_baja) and retorno= 0)
															retorno= rf_writeSepRegistros(ref rfh)
																retorno= rf_writeInt(ref rfh,pl_cod_baja[ll_indice])  
															ll_indice ++
														LOOP
														retorno= rf_writeSepRegistros(ref rfh)
														retorno= rf_writeSepComandos(ref rfh)
														retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
														if retorno = 1 then // RECOGEMOS lOS PARAMETROS
															rf_readInt(ref rfh,ref res)
															rf_readString(ref rfh,ref ls_res)
							
														end if
													end if
												end if
		
												end if
															end if
												end if
				end if
												end if
				end if
												end if
	
	
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_avisar_desagrupacion_incidencias (long pl_cod_alta[], long pl_linea_alta[], datetime pdt_f_deteccion_alta[], long pl_tipo_alta, ref string ps_mensaje);string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula
string ls_f_deteccion
long ll_indice = 1


//ls_f_deteccion =  string(pdt_f_deteccion_alta,"DD/MM/YYYY hh:mm:ss")



rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_Desagrupar_Incidencia_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
	retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM

		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					DO WHILE (ll_indice <= Upperbound(pl_cod_alta) and retorno= 0)
					retorno= rf_writeInt(ref rfh,pl_cod_alta[ll_indice]) 
		       // MANDAMOS EL 	TERCER PARAMETRO
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
							if retorno =0  then // TODO OK
									retorno= rf_writeInt(ref rfh,pl_linea_alta[ll_indice]) 

									// MANDAMOS EL CUARTO PARAMETRO
										if retorno=0 then  // TODO OK
											retorno= rf_writeSepCampos(ref rfh)
											if retorno =0  then // TODO OK
												ls_f_deteccion =  string(pdt_f_deteccion_alta[ll_indice],"DD/MM/YYYY hh:mm:ss")
												retorno= rf_writeString(ref rfh,ls_f_deteccion) 
												// MANDAMOS EL QUUINTO PARAMETRO
															if retorno=0 then  // TODO OK
																retorno= rf_writeSepCampos(ref rfh)
																if retorno =0  then // TODO OK
																		retorno= rf_writeInt(ref rfh,pl_tipo_alta) 
																	if retorno= 0 then
																		rf_writeSepRegistros(ref rfh)
																		
																	end if
																end if
															end if
											end if
										end if
									end if
												end if
												ll_indice ++
												
			loop										
														if retorno = 0  then  // TODO OK
														retorno= rf_writeSepComandos(ref rfh)
														retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
														if retorno = 1 then // RECOGEMOS lOS PARAMETROS
															rf_readInt(ref rfh,ref res)
															rf_readString(ref rfh,ref ls_res)
				end if
			end if
											
										end if
								end if
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

public function integer of_abrir_indisponibilidad (long pl_codigo, long pl_nro_incidencia, long pl_cod_maniobra, datetime pdt_f_maniobra, ref string ps_mensaje);
string ls_res

long   res =0
rf_handler rfh, rfh_nulo
int li_contador = 1
boolean pb_real = false
string ls_ip
rfc_services lst_nula




rfh = rfh_nulo


int retorno

string ls_servicio

ls_Servicio = "oop_indisponibilidad_manual_SGI"

ls_res = space(50)

if of_Actualiza_icono()>0  then 

//PEDIMOS EL SERVICIO 
	retorno=rfc_call(ref rfs,ls_servicio,ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  SESION 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,il_puerto_peticiones) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo) 
							if retorno = 0  then  // TODO OK
								retorno= rf_writeSepCampos(ref rfh)
								if retorno= 0 THEN
									retorno= rf_writeInt(ref rfh, pl_nro_incidencia)
									if retorno= 0 then
										retorno= rf_writeSepCampos(ref rfh)
										if retorno= 0 then
											retorno= rf_writeInt(ref rfh, pl_cod_maniobra)
											if retorno= 0 then
												retorno= rf_writeSepCampos (ref rfh)
												if retorno= 0 then
//													retorno= rf_writedate(ref rfh, pdt_f_maniobra)
													if retorno=0 then
								retorno= rf_writeSepComandos(ref rfh)
									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
									if retorno = 1 then // RECOGEMOS lOS PARAMETROS
										rf_readInt(ref rfh,ref res)
										rf_readString(ref rfh,ref ls_res)
									end if
								end if
								end if
							end if
						end if
					end if
						end if
					end if
				end if


end if
	
end if


 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

else
	res = -1
	ls_res = "No es posible conectar con el servidor de Operaci$$HEX1$$f300$$ENDHEX$$n"
end if

if res>=0 then
	ps_mensaje=""
	return 1
else
	ps_mensaje= ls_res
	return 0
end if




end function

on rf_servidor_operacion.create
call super::create
TriggerEvent( this, "constructor" )
end on

on rf_servidor_operacion.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;of_logout()
if isvalid(iu_systray) then
	iu_systray.of_identificativo_icono(2)
	iu_systray.delicon()
	destroy iu_systray
end if
end event

event constructor;iu_systray	= create nca_systray
iu_systray.of_identificativo_icono(2)
end event


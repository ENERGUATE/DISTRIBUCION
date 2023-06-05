HA$PBExportHeader$u_interface.sru
$PBExportComments$Objeto de comunicacion con OpenOperacion
forward
global type u_interface from nonvisualobject
end type
end forward

global type u_interface from nonvisualobject
end type
global u_interface u_interface

type prototypes
SUBROUTINE ComClose () LIBRARY  "comunica2002.dll" ALIAS FOR "_ComClose@0"
FUNCTION int ComOpenServer (REF long puerto) LIBRARY  "comunica2002.dll" ALIAS FOR "_ComOpenServer@4"
FUNCTION int ComOpenClient (int puerto,REF string host) LIBRARY  "comunica2002.dll" ALIAS FOR "_ComOpenClient@8;Ansi"
FUNCTION int ComSend (REF string registro) LIBRARY  "comunica2002.dll" ALIAS FOR "_ComSend@4;Ansi"
FUNCTION int ComReceive (REF string registro, int lon) LIBRARY  "comunica2002.dll" ALIAS FOR "_ComReceive@8;Ansi"
FUNCTION int ComOnConexion(long vent,int mens) LIBRARY  "comunica2002.dll" ALIAS FOR "_ComOnConexion@8"
FUNCTION int ComCloseServer () LIBRARY  "comunica2002.dll" ALIAS FOR "_ComCloseServer@0"
FUNCTION int gethostname (ref string name, int namelen ) library "wsock32.dll" alias for "gethostname;Ansi"
FUNCTION string GetHost(string lpszhost, ref string lpszaddress ) library "pbws32.dll" alias for "GetHost;Ansi"
Function long GetComputerNameA  (REF string Name ,REF long Length ) Library "kernel32.dll" alias for "GetComputerNameA;Ansi" 
SUBROUTINE ComGetHost(REF string Name, REF string Ip) LIBRARY "comunica2002.dll" ALIAS FOR "_ComGetHost@8;Ansi"

end prototypes

type variables
long il_cliente, il_servidor
string is_maquina
CONSTANT string is_p_cons_incidencia = "3000  "
CONSTANT string is_p_cons_simplificado = "3036  "
CONSTANT string is_p_cons_linea = "3005  "
CONSTANT string is_p_cons_instalacion = "3010  "
CONSTANT string is_p_incidencia_nueva_linea = "3015  "
CONSTANT string is_p_incidencia_nueva_instalacion= "3020  "
CONSTANT string is_p_incidencia_existente = "3025  "
CONSTANT string is_p_descargo = "3030  "
CONSTANT string is_p_descargo_consulta = "3031  "
CONSTANT string is_p_informar_mod_inci = "3035  "
CONSTANT string is_aviso_sgi = "4001  "
CONSTANT string is_id_sgi = "1500  "
CONSTANT string is_id_operacion = "0     "
string is_ip

end variables

forward prototypes
public function integer of_activa_servidor ()
public function integer of_enviar_alta_tool (long pl_codigo, integer pi_tipo)
public function integer of_enviar_baja_tool (long pl_tool)
public function integer of_inserta_tool (long pl_elemento, integer pi_tipo, long pl_instalacion, datetime pf_desde, datetime pf_hasta)
public function integer of_actualiza_datos_tool (long pl_codigo, integer pi_tipo, datetime pd_f_desde, datetime pd_f_expiracion)
public function integer of_borra_tool (long pl_elemento, integer pi_tipo, datetime pdf_desde)
public function integer of_enviar_descargo_operacion (long pl_nro_descargo)
public function integer of_consultar_incidencia (long pl_nro_incidencia)
public function integer of_maniobrar_incidencia (long pl_nro_incidencia)
public function integer of_avisar_sgi (long pl_nro_incidencia)
public function integer of_conexion_bd ()
public function integer of_consultar_instalacion (long pl_nro_instalacion)
public function integer of_consultar_linea (long pl_cod_linea)
public function integer of_maniobrar_linea (long pl_cod_linea)
public function integer of_maniobrar_instalacion (long pl_nro_instalacion)
public function integer of_verifica_ip_sgi (ref datetime pdt_fecha_actual)
public function integer of_actualiza_registro_usuario (datetime pdt_fecha)
public function integer of_enviar_descargo_consulta (long pl_nro_descargo)
public subroutine of_traza (string ps_mensaje)
public function integer of_inserta_ip (long pl_nro_incidencia)
public function integer of_borra_ip (long pl_nro_incidencia)
public function integer of_localizar_simplificado (long pl_salida_mt, long pl_ct)
end prototypes

public function integer of_activa_servidor ();int li_retorno

String ls_nombre, ls_dirtcp
int li_Contador


ls_nombre=space(255)
ls_dirtcp=space(255)

gethostname(ls_nombre,255)
comGetHost(ls_nombre,ls_dirtcp)

//gethost(ls_nombre,ls_dirtcp)
//ls_display=""
//for li_contador=1 to 3
//	ls_display=ls_display+string(asc(Mid(ls_dirtcp,li_contador,1)))+"."
//next
//   ls_display=ls_display+string(asc(Mid(ls_dirtcp,4,1)))
//
//is_ip = ls_display

is_ip = ls_dirtcp


il_cliente  = long(ProfileString("opensgi.ini","OPERACIONES","pclient","0"))
il_servidor = long(ProfileString("opensgi.ini","OPERACIONES","pservid","0"))
is_maquina  = trim(ProfileString("opensgi.ini","OPERACIONES","maquina","none"))

li_retorno = comopenserver(il_servidor)

//if li_retorno = 1 then
//
//	comonconexion(handle(w_operaciones),10)
//	
//end if

return li_retorno
end function

public function integer of_enviar_alta_tool (long pl_codigo, integer pi_tipo);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_enviar_alta_tool
// Objetivo:   Envia a operaciones el codigo de los datos de la tool para que genere el simbolo
//
//
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pl_codigo --> C$$HEX1$$f300$$ENDHEX$$digo del elemento asociado a la tool ( OT o cliente importante)
// 				  pi_tipo -->  1 (OT) 2 (Cliente importante)		
//                                              
// Devuelve:     0 --> Error
//					  1 --> correcto
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 25/09/2000        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//////////////////////////////////////////////////////////////////
	
	
	
	int li_respuesta
	string ls_mensaje, ls_mensaje2
	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		// ES NECESARIO DEFINIR EL MENSAJE
		ls_mensaje = "1012 " + trim(string(pl_codigo)) + " " + trim(string(pi_tipo))
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
	
of_traza(ls_mensaje + ls_mensaje2)	

return li_respuesta

end function

public function integer of_enviar_baja_tool (long pl_tool);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_enviar_baja_tool
// Objetivo:   Envia a operaciones el codigo de la tool para que si no tiene mas datos asociados los borre
//
//
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pl_tool --> C$$HEX1$$f300$$ENDHEX$$digo del tool 
// 				  
//                                              
// Devuelve:     0 --> Error
//					  1 --> correcto
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 25/09/2000        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//////////////////////////////////////////////////////////////////
	
	
	
	
	int li_respuesta
	string ls_mensaje
	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		// ES NECESARIO DEFINIR EL MENSAJE
		ls_mensaje = "1013 " + trim(string(pl_tool)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
	
return li_respuesta

end function

public function integer of_inserta_tool (long pl_elemento, integer pi_tipo, long pl_instalacion, datetime pf_desde, datetime pf_hasta);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_inserta_tool
// Objetivo:    Inserta los registros correspondientes a una tool en la base de datos y envia a operaciones 
//              el codigo de la tool para que lo pinte en la ventana grafica
//
//
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pl_elemento --> C$$HEX1$$f300$$ENDHEX$$digo del elemento asociado a la tool ( OT o cliente importante)
// 				  pi_tipo -->  1 (OT) 2 (Cliente importante)		
//                                              
// Devuelve:     0 --> Error
//					  1 --> correcto
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 25/09/2000        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//////////////////////////////////////////////////////////////////
long ll_instalacion, ll_codigo_tool
datetime f_expiracion, f_desde
// Primero obtenemos la instalacion asociada con cada elemento

setnull(f_desde)

if pi_tipo=2 then  // CLIENTE IMPORTANTE
	
  SELECT "ACO_SUM"."NRO_ACOMETIDA"   
       			INTO :ll_instalacion
    FROM "ACO_SUM"
   WHERE ( "ACO_SUM"."NIS_RAD" =:pl_elemento) using sqlca;

 f_desde= pf_desde
 f_expiracion=pf_hasta
else  // OT
	
 ll_instalacion=pl_instalacion
 f_desde= pf_desde
 f_expiracion=pf_hasta
 
end if 

if isnull(ll_instalacion) then // NO TIENE INSTALACION ASOCIADA
	return 0
end if
	

  INSERT INTO "SGD_DATOS_TOOLS"  
         ( "CODIGO",   
           "TIPO",   
           "NRO_TOOL",   
           "F_ALTA",   
           "F_CADUCIDAD",   
           "USUARIO_SGI",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA", "INSTALACION_RELACIONADA" )  
  VALUES (:pl_elemento,   
           :pi_tipo,   
           null,   
           :f_desde,   
           :f_expiracion,   
           :gs_usuario,   
           'OpenSgi',   
           sysdate,   
           'u_interface', :ll_instalacion ) using sqlca ;

if sqlca.sqlcode<>0 then 
 return 0
end if

if of_enviar_alta_tool(pl_elemento,pi_tipo)=1 then
				commit using sqlca;
				return 1
else
				rollback using sqlca;
				return 0
end if

end function

public function integer of_actualiza_datos_tool (long pl_codigo, integer pi_tipo, datetime pd_f_desde, datetime pd_f_expiracion);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_actualiza_datos_tool
// Objetivo:    Actualiza las fechas de los datos de la tool 
//
//
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pl_elemento --> C$$HEX1$$f300$$ENDHEX$$digo del elemento asociado a la tool ( OT o cliente importante)
// 				  pi_tipo -->  1 (OT) 2 (Cliente importante)		
//					  pd_f_desde --> Fecha desde (ci) o Fecha alta (OT)
//               pd_f_expiracion --> Fecha de expiracion (CI) o null ( OT)                               
// Devuelve:     0 --> Error
//					  1 --> correcto
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 27/09/2000        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//////////////////////////////////////////////////////////////////

  UPDATE "SGD_DATOS_TOOLS"  
     SET "F_ALTA" = :pd_f_desde,   
         "F_CADUCIDAD" = :pd_f_expiracion  
   WHERE ( "SGD_DATOS_TOOLS"."CODIGO" = :pl_codigo ) AND  
         ( "SGD_DATOS_TOOLS"."TIPO" = :pi_tipo ) using sqlca  ;
	if sqlca.sqlcode=0 then 
		commit using sqlca;
		return 1
	else 
		rollback using sqlca;
		return 0
	end if

end function

public function integer of_borra_tool (long pl_elemento, integer pi_tipo, datetime pdf_desde);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_borra_tool
// Objetivo:    Borra 
//
//
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: pl_elemento --> C$$HEX1$$f300$$ENDHEX$$digo del elemento asociado a la tool ( OT o cliente importante)
// 				  pi_tipo -->  1 (OT) 2 (Cliente importante)		
//                                              
// Devuelve:     0 --> Error
//					  1 --> correcto o no encontrada la tool
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 25/09/2000        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//
//////////////////////////////////////////////////////////////////
long ll_tool

// Primero obtenemos el tool asociado


  SELECT "SGD_DATOS_TOOLS"."NRO_TOOL"  
  INTO :ll_tool
    FROM "SGD_DATOS_TOOLS"  
   WHERE ( "SGD_DATOS_TOOLS"."CODIGO" = :pl_elemento ) AND  
         ( "SGD_DATOS_TOOLS"."TIPO" = :pi_tipo ) and F_ALTA = :pdf_desde using sqlca  ;

if sqlca.sqlcode=0 then // REGISTRO ENCONTRADO LO BORRAMOS
	delete from sgd_datos_tools where codigo=:pl_elemento and tipo= :pi_tipo and F_ALTA = :pdf_desde using sqlca;
	
	if not isnull(ll_tool) then /// TIENE TOOL ASOCIADA
		if of_enviar_baja_tool(ll_tool)=1 then
				commit using sqlca;
				return 1
			else
				rollback using sqlca;
				return 0
			end if
	else // AUNQUE NO TENGA TOOL SE BORRA TAMBIEN
				commit using sqlca;
				return 1
	end if
end if

return 1


end function

public function integer of_enviar_descargo_operacion (long pl_nro_descargo); long ll_instalacion, ll_nro_ot, ll_clase
  int li_respuesta
  string ls_mensaje, ls_mensaje2
  datetime ldt_f_deteccion, ldt_f_env_brigada
	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_descargo+is_id_operacion+trim(string(pl_nro_descargo)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	
return li_respuesta

end function

public function integer of_consultar_incidencia (long pl_nro_incidencia);  int li_respuesta
  string ls_mensaje, ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_cons_incidencia+is_id_operacion+trim(string(pl_nro_incidencia)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	

return li_respuesta

end function

public function integer of_maniobrar_incidencia (long pl_nro_incidencia);  int li_respuesta
  string ls_mensaje, ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_incidencia_existente+is_id_operacion+trim(string(pl_nro_incidencia)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		Messagebox("cliente- maquina", string(il_cliente) + is_maquina)
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	

return li_respuesta

end function

public function integer of_avisar_sgi (long pl_nro_incidencia);
string ls_ip , ls_mensaje,ls_mensaje2
long ll_puerto
int li_respuesta

 DECLARE cu_ips CURSOR FOR  
	SELECT "GI_IP_SGI"."IP",   
       "GI_IP_SGI"."PUERTO"  
  FROM "GI_IP_SGI"  
 WHERE ("GI_IP_SGI"."IP","GI_IP_SGI"."PUERTO") NOT IN (SELECT  :is_ip,:il_servidor FROM DUAL) AND
   		"GI_IP_SGI"."NRO_INCIDENCIA" = :pl_nro_incidencia;
			
	open  cu_ips;
	
	fetch cu_ips into :ls_ip,:ll_puerto;

	do while sqlca.sqlcode =0 
	
	li_respuesta = ComOpenClient(ll_puerto,ls_ip)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_aviso_sgi+is_id_sgi+trim(string(pl_nro_incidencia)) 
		
		li_respuesta = ComSend(ls_mensaje)
		fw_escribe_log(string(NOW()) + ":  Avisando SGI (" + ls_ip + ") (u_interface,of_avisar_sgi)")
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		fw_escribe_log(string(NOW()) + ":  Cerrando Aviso SGI (" + ls_ip + ") (u_interface,of_avisar_sgi)")
		ComClose()
		of_traza(ls_mensaje + ls_mensaje2)			
	end if
fetch cu_ips into :ls_ip,:ll_puerto;
loop
close cu_ips;
return 1
end function

public function integer of_conexion_bd ();string base, usuario, clave, dbparametros,encriptar
SetPointer(Hourglass!)

usuario = ProfileString("opensgi.ini","database","usuario","sgi")
clave = ProfileString("opensgi.ini","database","clave","sgi")
base = ProfileString("opensgi.ini","database","Database","open")
dbparametros = ProfileString("opensgi.ini","database","DBParm","Disablebind=0,Date=' ''''yyyy/mm/dd'''' ';DateTime=' ''''yyyy/mm/dd hh:mm:ss'''' '")
encriptar = ProfileString("opensgi.ini","externalidad","encriptar","no")

//**************************************************************************************************//
//                          ENCRIPTAR EL NOMBRE Y EL PASSWORD                                       //
//                            LUIS EDUARDO ORTIZ ABRIL/2001                                         //
//**************************************************************************************************//

//LSH INI 17/10/2013 Mejora DEO13-00000754

//If encriptar = 'si' Then
//	usuario = fg_desencriptar(usuario)
//	clave = fg_desencriptar(clave)
//	If usuario = "" OR clave = "" Then
//		Halt Close
//	End if
//End If

If encriptar = 'si' Then
	clave = fg_desencriptar(clave)
	If usuario = "" OR clave = "" Then
		Halt Close
	End if
End If

//LSH FIN 17/10/2013 Mejora DEO13-00000754

//**************************************************************************************************//
//                                         FIN CAMBIOS                                              //
//**************************************************************************************************//

IF sqlca.sqlcode <> 0 then
		return 0
END IF

return 1
end function

public function integer of_consultar_instalacion (long pl_nro_instalacion);  int li_respuesta
  string ls_mensaje,ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_cons_instalacion+is_id_operacion+ trim(string(pl_nro_instalacion)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	
return li_respuesta

end function

public function integer of_consultar_linea (long pl_cod_linea);  int li_respuesta
  string ls_mensaje, ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_cons_linea+is_id_operacion+ trim(string(pl_cod_linea)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	
return li_respuesta

end function

public function integer of_maniobrar_linea (long pl_cod_linea);  int li_respuesta
  string ls_mensaje, ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_incidencia_nueva_linea+is_id_operacion+ trim(string(pl_cod_linea)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	
return li_respuesta

end function

public function integer of_maniobrar_instalacion (long pl_nro_instalacion);  int li_respuesta
  string ls_mensaje, ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_incidencia_nueva_instalacion+is_id_operacion+ trim(string(pl_nro_instalacion)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
	
of_traza(ls_mensaje + ls_mensaje2)	

return li_respuesta

end function

public function integer of_verifica_ip_sgi (ref datetime pdt_fecha_actual);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_verifica_ip_sgi
//
//  Argumentos : Devuelve la fecha actual del registro
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Comprueba si hay un SGI ejecutandose con un usuario determinado								
//	
//
//  Valores de retorno :  0 --> Si lo hay --> se impide la entrada.
//				  				  1 --> No lo hay.
//								 -1 --> Hay otro SGI en la misma m$$HEX1$$e100$$ENDHEX$$quina
//
//  Realizado por Alfonso Coto
//
//  Fecha : 23/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_respuesta
string ls_mensaje
long ll_puerto
long nro_simbolos = 20 
string ls_maquina



		
ls_maquina = space(nro_simbolos)
GetComputerNameA(ls_maquina, nro_simbolos)
//ll_puerto = long(ProfileString("opensgi.ini","OPERACIONES","pservid","0"))
ll_puerto = gu_operaciones.il_servidor

// COMPROBAMOS SI ALGUN USUARIO ESTA EJECUTANDO EL SGI EN ESTA MAQUINA

//
//	li_respuesta = ComOpenClient(ll_puerto,ls_maquina)
//	if li_respuesta = 1 then // HA CONTESTADO ---> EXISTE OTRO SGI EN ESTA MAQUINA
//		
//		ls_mensaje = "5" 
//		
//		li_respuesta = ComSend(ls_mensaje)
//		ls_mensaje = char(10) + char(13)
//		li_respuesta = ComSend(ls_mensaje)
//		ComClose()
//		return -1
//	end if 


 
  
  
  
  // COMPROBAMOS SI EL USUARIO ESTA EN OTRA MAQUINA
  
  SELECT "GI_USUARIO_SGI"."F_ACTUAL",   
         nvl("GI_USUARIO_SGI"."ULTIMO_ORDENADOR",'localhost')  , 
         nvl("GI_USUARIO_SGI"."PUERTO" ,0)
  INTO :pdt_fecha_actual,   
         :ls_maquina,   
         :ll_puerto  
    FROM "GI_USUARIO_SGI"  
   WHERE "GI_USUARIO_SGI"."USUARIO" = :gs_usuario   ;

if sqlca.sqlcode <> 0 then  // ES IMPOSIBLE PERO POR SI ACASO
		return 0
else
  
	
li_respuesta = ComOpenClient(ll_puerto,ls_maquina)
	if li_respuesta = 1 then // HA CONTESTADO ---> EXISTE OTRO SGI CON EL MISMO USUARIO
		
		ls_mensaje = "5" 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje)
		ComClose()
		li_respuesta = 0
	else
      li_respuesta = 1
	end if
end if 
return li_respuesta

end function

public function integer of_actualiza_registro_usuario (datetime pdt_fecha);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_registro_usuario
//
//  Argumentos :
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	
//	
//
//  Valores de retorno :  0 --> No se puede actualizar
//				  				  1 --> Se ha actualizado.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 23/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



long ll_puerto
string ls_maquina
long   nro_simbolos = 20
		
ls_maquina = space(nro_simbolos)
GetComputerNameA(ls_maquina, nro_simbolos)
ll_puerto = il_servidor

// BORRAMOS LOS REGISTROS DE LA MISMA MAQUINA
  
//  UPDATE "GI_USUARIO_SGI"  
//     SET "ULTIMO_ORDENADOR" = null,   
//         "PUERTO" = null
//   WHERE "GI_USUARIO_SGI"."ULTIMO_ORDENADOR" = :ls_maquina and 
//			 "GI_USUARIO_SGI"."USUARIO" <> :gs_usuario;

// BORRAMOS LOS REGISTROS DEL MISMO USUARIO

  UPDATE "GI_USUARIO_SGI"  
     SET "ULTIMO_ORDENADOR" = null,   
         "PUERTO" = null
   WHERE "GI_USUARIO_SGI"."USUARIO" = :gs_usuario;
/*AHM*/
  UPDATE "GI_USUARIO_SGI"  
     SET "F_ACTUAL" = sysdate,   
         "ULTIMO_ORDENADOR" = :ls_maquina,   
         "PUERTO" = :ll_puerto, 
			"VERSION" = :gs_version	
   WHERE "GI_USUARIO_SGI"."USUARIO" = :gs_usuario AND
			"GI_USUARIO_SGI"."F_ACTUAL" = :pdt_fecha   ;
  	
if sqlca.sqlnrows = 0 then  // NO SE HA ACTUALIZADO --->  ALGUIEN HA ENTRADO A LA VEZ.
	return 0
else
	return 1
end if
	  


end function

public function integer of_enviar_descargo_consulta (long pl_nro_descargo); long ll_instalacion, ll_nro_ot, ll_clase
  int li_respuesta
  string ls_mensaje, ls_mensaje2
  datetime ldt_f_deteccion, ldt_f_env_brigada
	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_descargo_consulta+is_id_operacion+trim(string(pl_nro_descargo)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	
return li_respuesta

end function

public subroutine of_traza (string ps_mensaje);

integer li_filenum
long ll_handle
string ls_nombre_descargos, nula

IF ProfileString("opensgi.ini","EXPLICACION","Depurar","NO") = 'SI' THEN
li_filenum = fileopen("C:\comunicaciones.LOG",LineMode!,Write!,LockReadWrite!,Append!)
filewrite(li_filenum,"********")
filewrite(li_filenum,"Fecha: " + String(Today( ), "dd/mm/yyyy hh:mm:ss"))
filewrite(li_filenum,"El mensaje enviado es " + ps_mensaje)
filewrite(li_filenum,"Y la longitud: " + string(len(ps_mensaje)))
filewrite(li_filenum,"********")
fileclose(li_filenum)
end if
end subroutine

public function integer of_inserta_ip (long pl_nro_incidencia);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_inserta_ip
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Inserta la Ip y el puerto de escucha del Sgi, cada vez que se abra la primera ventana de incidencias
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 03/06/1998	Soluziona  Software Factory
//





  INSERT INTO "GI_IP_SGI"  
         ( "IP",   
           "PUERTO",
			  "NRO_INCIDENCIA",
			  "USUARIO")  
  VALUES ( :is_ip,   
           :il_servidor,
			  :pl_nro_incidencia,
			  :gs_usuario)  ;

commit;
return 1

end function

public function integer of_borra_ip (long pl_nro_incidencia);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_borra_ip
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Borra el registro correspondiente a la IP y a la incidencia, o solamente a la IP									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 03/04/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

DELETE FROM "GI_IP_SGI"  
 WHERE "GI_IP_SGI"."IP" = :is_ip AND "GI_IP_SGI"."PUERTO" = :il_servidor AND
 "GI_IP_SGI"."NRO_INCIDENCIA" = decode(:pl_nro_incidencia, -1,"GI_IP_SGI"."NRO_INCIDENCIA",:pl_nro_incidencia);
commit;

// SI SE PRODUCE UNA CAIDA ANTERIOR , BORRA TODO LO QUE ESTE USUARIO TUVIERA BLOQUEADO.

DELETE FROM "GI_IP_SGI"  
 WHERE "GI_IP_SGI"."USUARIO" = :gs_usuario AND 
  ("GI_IP_SGI"."IP","GI_IP_SGI"."PUERTO") NOT IN (SELECT :is_ip,:il_servidor FROM DUAL) ;
commit;


return 1
end function

public function integer of_localizar_simplificado (long pl_salida_mt, long pl_ct);  int li_respuesta
  string ls_mensaje,ls_mensaje2

	
	li_respuesta = ComOpenClient(il_cliente,is_maquina)
	if li_respuesta = 1 then
		
		ls_mensaje = is_id_sgi +is_p_cons_simplificado + is_id_operacion + trim(string(pl_salida_mt))+ " " + trim(string(pl_ct)) 
		
		li_respuesta = ComSend(ls_mensaje)
		ls_mensaje2 = char(10) + char(13)
		li_respuesta = ComSend(ls_mensaje2)
		ComClose()
	else
		gnv_msg.f_mensaje("EZ01","","",Ok!)
	end if
of_traza(ls_mensaje + ls_mensaje2)	
return li_respuesta

end function

on u_interface.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_interface.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;Comclose()
ComCloseServer()



end event


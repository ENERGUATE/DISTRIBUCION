HA$PBExportHeader$rf.sru
$PBExportComments$Objeto de comunicaci$$HEX1$$f300$$ENDHEX$$n con conectividad
forward
global type rf from nonvisualobject
end type
type rf_function from structure within rf
end type
type rf_handler from structure within rf
end type
type rfc_function from structure within rf
end type
type rfc_services from structure within rf
end type
type rf_serv from structure within rf
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

global type rf from nonvisualobject
end type
global rf rf

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
end prototypes

type variables
CONSTANT int  RF_BUF_LEC = 1024
CONSTANT int RF_BUF_ESC = 1024
CONSTANT int RF_MAX_FIELD = 128
CONSTANT int RF_LISTEN = 5
int id_servidor  = 50
int id_puerto = 51
public rfc_services rfs
public boolean ib_conectado = false
public boolean ib_opensgi_ini
string is_ip
long il_puerto
nca_systray iu_systray	
long il_instalaciones[]
string is_mensaje
int ii_resultado
end variables

forward prototypes
public function integer of_conecta ()
public function integer of_actualiza_icono ()
public subroutine of_parametros_conexion (ref string ps_ip, ref long pl_puerto, ref boolean pb_opensgi_ini)
public subroutine of_obten_salida_mt (ref long pl_codigo, long pl_codigo_ct, integer pi_ci, ref long pl_salidas_mt[], ref long pl_fases[])
public function integer of_jerarquia (integer pi_ci, long pl_codigo, ref long pl_instalaciones[], ref boolean pb_real, ref long pl_salida_mt[], ref long pl_fases[], ref long pl_ct, ref string ls_fase_suministro)
public function integer of_jerarquia (integer pi_ci, long pl_codigo, ref long pl_instalaciones[], ref boolean pb_real, ref long pl_salida_mt[], ref long pl_fases[], ref long pl_ct, ref string ls_fase_suministro, ref boolean pb_conexion)
public function long of_pide_servicio (long pl_argumentos[], string ps_servicio)
public function long of_comprueba_inst_digitalizada (long pi_argumentos[], integer pi_tipo_instalacion)
public function long of_comprueba_inst_digitalizada_at (long pl_nro_instalacion, integer pi_tipo_instalacion)
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

of_parametros_conexion(is_ip,il_puerto,ib_opensgi_ini)

rfs= lst_nula
retorno=rfc_open(rfs,is_ip,il_puerto)

if retorno <>1 then
	ib_conectado = false
else 
	ib_conectado = true
end if

return retorno
end function

public function integer of_actualiza_icono ();//////////////////////////////////////////////////////////////////
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
 rfc_services lst_nula
setpointer(hourglass!)
		
if gb_operaciones then 
	
	retorno= rfc_ping(rfs)
	if retorno =1 then // CONECTADO
	
	   if iu_systray.ib_systemtrayexists() then 
				iu_systray.changeicon("semafv.ico")
				iu_systray.changetip("Servidor de Conectividad  ON")
			else
					iu_systray.addicon("semafv.ico","Servidor de Conectividad  ON",w_operaciones)			
			end if
			
	
		else // NO ESTA CONECTADO 
			retorno = of_conecta()
			
			if retorno = 1 then // SE HA CONECTADO
	
				if iu_systray.ib_systemtrayexists() then 
					iu_systray.changeicon("semafv.ico")
					iu_systray.changetip("Servidor de Conectividad  ON")
				else
					iu_systray.addicon("semafv.ico","Servidor de Conectividad  ON",w_operaciones)			
				end if
	
			else // NO SE HA PODIDO CONECTAR
	
				if iu_systray.ib_systemtrayexists() then 
			   	iu_systray.changeicon("semafr.ico")
		 		   iu_systray.changetip("Servidor de Conectividad  OFF")
	   		else
					iu_systray.addicon("semafr.ico","Servidor de Conectividad  OFF",w_operaciones)			
				end if
			
			
			end if
		
					 	
		end if 
else // NO HAY OPERACION
	retorno = 0
end if		

setpointer(Arrow!)
return retorno
end function

public subroutine of_parametros_conexion (ref string ps_ip, ref long pl_puerto, ref boolean pb_opensgi_ini);//////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_parametros_conexion
// Objetivo:    Obtiene los parametros de conexion al servidor de conectividad
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


ip = ProfileString("Opensgi.ini", "Operaciones", "Conectividad", "localhost")

puerto = long(Profilestring("Opensgi.ini", "Operaciones", "Pconectividad", "0"))


if puerto = 0 then // NO EXISTE EN EL OPENSGI.INI
	
  SELECT "OOP_CONFIGURACION"."VALOR"  
    INTO :ip
    FROM "OOP_CONFIGURACION"  
   WHERE "OOP_CONFIGURACION"."ID" = 180   ;
	
  SELECT TO_NUMBER("OOP_CONFIGURACION"."VALOR"  )
    INTO :puerto
    FROM "OOP_CONFIGURACION"  
   WHERE "OOP_CONFIGURACION"."ID" = 181   ;
		pb_opensgi_ini = false
else
	pb_opensgi_ini = true
end if 

ps_ip = ip
pl_puerto = puerto



end subroutine

public subroutine of_obten_salida_mt (ref long pl_codigo, long pl_codigo_ct, integer pi_ci, ref long pl_salidas_mt[], ref long pl_fases[]);long ll_instalaciones[] , ll_salidas_mt[], ll_Salida, ll_fases[],ll_anul_esp = 0
int retorno 
long   res
rf_handler rfh
int li_contador = 1,ll_contador = 0, li_anulo = 3
boolean pb_real = false
string ls_texto

//PEDIMOS EL SERVICIO --- > HAY QUE CAMBIAR EL SERVICIO Y LOS PARAMETROS
	retorno=rfc_call(ref rfs,"con_avisos",ref rfh)
	//MANDAMOS EL PRIMER PARAMETRO  CI 
	if retorno = 1 then 	
		retorno= rf_writeInt(ref rfh,pi_ci) 
	// MANDAMOS EL SEGUNDO PARAMETRO  CM
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)
			if retorno =0  then // TODO OK
					retorno= rf_writeInt(ref rfh,pl_codigo_Ct) 
					if retorno=0 then  // TODO OK
						retorno= rf_writeSepCampos(ref rfh)
							if retorno =0  then // TODO OK
								retorno= rf_writeInt(ref rfh,7) 
								if retorno = 0  then  // TODO OK
									retorno= rf_writeSepComandos(ref rfh)
									retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
									if retorno = 1 then // RECOGEMOS LA JERARQUIA
									do while  (rf_readInt(ref rfh,ref res)=1) 
									  ll_instalaciones[li_contador] = res
									  li_contador ++	
								loop
									
							end if
					end if
			end if
		end if
	end if

		end if
	
	end if


 // CERRAMOS LA CONEXION 
 
	rfc_close_pb(ref rfh)
	
	
// NOS QUEDAMOS CON LOS ELEMENTOS CABECERA

int li_num_salmt =1

FOR li_contador =1 TO upperbound(ll_instalaciones) STEP 5

	if ll_instalaciones[li_contador+3] = 0 then // ES UN CABECERA
		 if ll_instalaciones[li_contador+2]= 1 then // Y ES DE MEDIA
	
		  SELECT "SGD_CABECERAS"."COD_LINEA"  
			 INTO :ll_salida
			 FROM "SGD_CABECERAS"  
				WHERE ( "SGD_CABECERAS"."CM" = :ll_instalaciones[li_contador + 1] );
				
			  if sqlca.sqlcode =0 then 
				 
				 if li_anulo <> 1 and li_anulo <> 2 then // si li_anulo = 1 o 2 se salta los CA y la linea que lo alimenta
				 
				 	for ll_contador = 1 to upperbound( ll_salidas_mt[])	
						if ll_salidas_mt[ll_contador] = ll_salida then
							ll_salidas_mt[li_num_salmt -1] = 0
							ll_anul_esp = 1
						end if
					 next		
				 
				 	if ll_anul_esp = 0 then
						ll_salidas_mt[li_num_salmt] = ll_salida
						ll_fases[li_num_salmt] = ll_instalaciones[li_contador+4]
						li_num_salmt ++	
					else
						ll_anul_esp = 0
					end if
					
				END IF
				 
				 li_anulo ++

			 end if
			 
			 
		 
		 end if 
	
	else
		
		// si finalizo con un dos es que hay mas instalaciones.
				 // PACHO ELIMINA CA Y LINEAS REPETIDOS S.O.S
				 
		 for ll_contador = 1 to upperbound( ll_salidas_mt[])	
			if ll_salidas_mt[ll_contador] = ll_instalaciones[li_contador + 1] then
				li_anulo = 1
			end if
		 next		
		 
		if li_anulo <> 1 and li_anulo <> 2 then // si li_anulo = 1 o 2 se salta los CA y la linea que lo alimenta
			ll_salidas_mt[li_num_salmt] = ll_instalaciones[li_contador + 1]
			li_num_salmt ++
			ll_salidas_mt[li_num_salmt]  = 2
		END IF
		
		 li_anulo ++
		 
	end if
		

NEXT

//// Validaci$$HEX1$$f300$$ENDHEX$$n de instalaciones devueltas por OOP
//for li_conta = 1 to upperbound(ll_salidas_mt)
//	ls_texto =string(ll_salidas_mt[li_conta]) + ", "
//next
//messagebox("informaci$$HEX1$$f300$$ENDHEX$$n", ls_texto,information,ok!)


if upperbound(ll_salidas_mt)>0 then 
	pl_codigo  = ll_salidas_mt[1]
	pl_salidas_mt = ll_salidas_mt
	pl_fases = ll_fases
end if
end subroutine

public function integer of_jerarquia (integer pi_ci, long pl_codigo, ref long pl_instalaciones[], ref boolean pb_real, ref long pl_salida_mt[], ref long pl_fases[], ref long pl_ct, ref string ls_fase_suministro);////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n:     of_jerarquia
// Objetivo:    Devuelve la jerarquia real de una instalacion dada
//
//
//
// Ambito:      Privado
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: ci y Cm de la instalacion
// Devuelve:     0 --> Error
//					  1 --> correcto
//					  Vector de instalaciones padre
//					  Boolean que indica si la jerarquia es real o no
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 17/01/2001        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
///////////////////////////////////////////////////////////////

long ll_subestac, ll_trafo,ll_codigo
long ll_instalacion, ll_padres, ll_instalacion_superior;
int retorno,li_tipo_inst
long   res
rf_handler rfh
int li_contador = 1,li_tipo_con,li_tipo_con_aco
pb_real = false

long ll_instalaciones_normal[]

ll_codigo= pl_codigo
retorno= of_actualiza_icono()  // VERIFICA SI HAY CONEXION

if retorno = 1 then 

if gi_tension_nivel_min = fgci_media_tension then 
// SI OPERACIONES NO TRATA LA BAJA SE DEBE OBTENER EL CT CORRESPONDIENTE


	
select sgd_Acometida.instalacion_origen,sgd_Acometida.tipo_conexion
		into :ll_instalacion,:li_tipo_con_aco  from sgd_Acometida where codigo = :pl_codigo and bdi_job =0;
		
if sqlca.sqlcode<>0 then return 0 // ES IMPOSIBLE FORMAR LA JERARQUIA 


 
//			
//	// OBTENEMOS EL CT
//		select sgd_ct.codigo, sgd_ct.class_id, SGD_SALBT.COD_TRAFO
//		INTO :ll_codigo, :pi_ci, :ll_trafo
//   	 FROM "SGD_SALBT" , SGD_CT 
//	   WHERE ( "SGD_SALBT"."BDI_JOB" = 0 ) AND  
//         ( "SGD_SALBT"."CODIGO" = :ll_instalacion )  AND ("SGD_SALBT"."INSTALACION_ORIGEN" = SGD_CT.CODIGO) 
//			AND ( "SGD_CT"."BDI_JOB" = 0 ) ;	
//
//		li_contador ++	
//		pl_instalaciones[li_contador] = ll_trafo		
//		li_contador ++	
//		pl_instalaciones[li_contador] = ll_codigo
//		li_contador ++	

		 DECLARE cu_instalaciones_1 CURSOR FOR  
		  SELECT "SGD_INSTALACION"."NRO_INSTALACION"  FROM "SGD_INSTALACION"
		  start with nro_instalacion = :ll_instalacion and bdi_job =0 
		  connect by prior nro_inst_padre = nro_instalacion and bdi_job=0 AND TIPO_INSTALACION > :fgci_tipo_salida_mt;
		
		OPEN cu_instalaciones_1;
		FETCH cu_instalaciones_1 into :ll_codigo;
		li_contador = 1
		do while sqlca.sqlcode =0 

				pl_instalaciones[li_contador] = ll_codigo

			FETCH cu_instalaciones_1 into :ll_codigo;			
			li_Contador ++
		loop 
		close cu_instalaciones_1;

select  sgd_ct.class_id, sgd_ct.sec_fase into :pi_ci, :li_tipo_con from sgd_ct where codigo = :ll_codigo and bdi_job =0;

if sqlca.sqlcode<>0 then 
	return 0 // ES IMPOSIBLE FORMAR LA JERARQUIA 
else
	pl_ct = ll_codigo
end if

select fase_afectada into :ls_fase_suministro from gi_cambio_formato_fase where tipo_conexion = :li_tipo_con;

if sqlca.sqlcode<>0 then 
	ls_fase_suministro = '000'
end if


of_obten_salida_mt(ll_instalacion,ll_codigo,pi_ci,pl_salida_mt[],pl_fases[])

	if upperbound(pl_Salida_mt)>0 then // HAY AL MENOS UNA SMT
		pl_instalaciones[li_contador] = pl_Salida_mt[1]
		li_contador ++	


  SELECT "SGD_CABECERAS"."CM_ELTO_NIVEL"  
    INTO :ll_subestac
    FROM "SGD_CABECERAS"  
   WHERE ( "SGD_CABECERAS"."COD_LINEA" = :pl_salida_mt[1] ) AND  
         ( "SGD_CABECERAS"."CI_ELTO_NIVEL" in (1411,1118,1108) )   ;

   	if sqlca.sqlcode = 0 then 
			pl_instalaciones[li_contador] = ll_Subestac
		end if
	end if


end if 



end if

	// SI TODO HA IDO BIEN Y HEMOS ENCONTRADO ALGO-->  LO HEMOS SACADO DE LA REAL
	if upperbound(pl_Salida_mt)>0  then pb_real = true
	
	// COMPROBAMOS SI DEBEMOS OBTENER LA JERARQUIA NORMAL
	
	if not pb_real then
		
		select sgd_Acometida.instalacion_origen,tipo_conexion
		into :ll_instalacion,:li_tipo_con_aco  from sgd_Acometida where codigo = :pl_codigo and bdi_job =0;
		if sqlca.sqlcode<>0 then return 0 // ES IMPOSIBLE FORMAR LA JERARQUIA 
		
		 DECLARE cu_instalaciones CURSOR FOR  
		  SELECT "SGD_INSTALACION"."NRO_INSTALACION",
		  			  "SGD_INSTALACION"."TIPO_INSTALACION"
		  FROM "SGD_INSTALACION"
		  where nro_instalacion <> :fgcdec_aviso_con_alimentacion
		  start with nro_instalacion = :ll_instalacion and bdi_job =0 
		  connect by prior nro_inst_padre = nro_instalacion and bdi_job=0 AND TIPO_INSTALACION <> :fgci_tipo_salida_at;
		
		OPEN cu_instalaciones;
		FETCH cu_instalaciones into :ll_padres,:li_tipo_inst;
		li_contador =1
		do while sqlca.sqlcode =0 
						
						if li_tipo_inst = fgci_tipo_ct then
							
							// si la acometida tiene fase utilizo las de la acometida.
							
							if not isnull(li_tipo_con_aco) and li_tipo_con_aco > 0 then
								li_tipo_con = li_tipo_con_aco
							else
								Select tipo_conexion
								into :li_tipo_con 
								from sgd_instalacion 
								where nro_instalacion = :ll_padres 
										and bdi_job = 0;
							end if
							
							select fase_afectada 
							into :ls_fase_suministro 
							from gi_cambio_formato_fase 
							where tipo_conexion = :li_tipo_con;
							
							pl_ct = ll_padres
									
						end if
						
						ll_instalaciones_normal[li_contador] = ll_padres

			FETCH cu_instalaciones into :ll_padres,:li_tipo_inst;
			li_Contador ++
		loop 
		close cu_instalaciones;
		pl_instalaciones = ll_instalaciones_normal
		
	end if
	
	
	// EN CASO DE RED REAL O RED NORMAL  SE DEBE COMPROBAR QUE LA ULTIMA INSTALACION TIENE COMO INSTALACION PADRE la fgcd_aviso_con_alimentacion
	
if upperbound(pl_instalaciones)=0 then return 0 // NO TIENE ELEMENTOS ---> NO HAY JERARQUIA

ll_instalacion = pl_instalaciones[upperbound(pl_instalaciones)]

select tipo_instalacion into :ll_instalacion_superior  from sgd_instalacion where nro_instalacion = :ll_instalacion and bdi_job=0;

if ll_instalacion_superior <> long(fgci_tipo_subestacion) then return 0 // NO SE HA LLEGADO Al NIVEL SUPERIOR 
	
return 1
end function

public function integer of_jerarquia (integer pi_ci, long pl_codigo, ref long pl_instalaciones[], ref boolean pb_real, ref long pl_salida_mt[], ref long pl_fases[], ref long pl_ct, ref string ls_fase_suministro, ref boolean pb_conexion);// Funci$$HEX1$$f300$$ENDHEX$$n:     of_jerarquia
// Objetivo:    Devuelve la jerarquia real de una instalacion dada
//
//
//
// Ambito:      Privado
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: ci y Cm de la instalacion
// Devuelve:     0 --> Error
//					  1 --> correcto
//					  Vector de instalaciones padre
//					  Boolean que indica si la jerarquia es real o no
//
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------  		  -------    ---------------------
// 17/01/2001        ACO       Versi$$HEX1$$f300$$ENDHEX$$n Original
///////////////////////////////////////////////////////////////

long ll_subestac, ll_trafo,ll_codigo,ll_ct,ll_array[],ll_array_nulo[],ll_tip_padre,ll_inst_padres
long ll_instalacion, ll_padres, ll_instalacion_superior,ll_inst_unif,ll_inst_padre,ll_linea
int retorno,li_tipo_inst,li_permito,li_ci
boolean lb_pongo_unif = false
long   res
rf_handler rfh
int li_contador = 1,li_tipo_con,li_tipo_con_aco
pb_real = false
pb_conexion = false

long ll_instalaciones_normal[]

ll_codigo= pl_codigo
retorno= of_actualiza_icono()  // VERIFICA SI HAY CONEXION

if retorno = 1 then 
	pb_conexion  = true

	if gi_tension_nivel_min = fgci_media_tension then 
	
		fw_escribe_log_avisos(" NIVEL DE TENSION MINIMO: " + STRING(fgci_media_tension) ) 
		// SI OPERACIONES NO TRATA LA BAJA SE DEBE OBTENER EL CT O TRAFO CORRESPONDIENTE

		select sgd_Acometida.instalacion_origen,tipo_conexion
		into :ll_instalacion,:li_tipo_con_aco  
		from sgd_Acometida 
		where codigo = :pl_codigo and bdi_job =0;
		
		if sqlca.sqlcode<>0 then
			fw_escribe_log_avisos(" NO SE ENCUENTRAN DATOS PARA LA ACOMETIDA EN SGD_ACOMETIDA: " + STRING(pl_codigo) ) 
			return 0 // ES IMPOSIBLE FORMAR LA JERARQUIA 
		end if
		
		DECLARE cu_instalaciones_1 CURSOR FOR  
		
		SELECT "SGD_INSTALACION"."NRO_INSTALACION","SGD_INSTALACION"."TIPO_INSTALACION"   
		FROM "SGD_INSTALACION"
		start with nro_instalacion = :ll_instalacion and bdi_job =0 
		connect by prior nro_inst_padre = nro_instalacion and bdi_job=0 AND TIPO_INSTALACION in (:fgci_tipo_ct,:fgci_tipo_salida_de_baja,:fgci_tipo_transformador);
		
		OPEN cu_instalaciones_1;
		FETCH cu_instalaciones_1 into :ll_codigo,:li_tipo_inst;
		li_contador = 1
		
		DO WHILE sqlca.sqlcode =0 

			if li_tipo_inst = fgci_tipo_ct then
				select  sgd_ct.class_id, sgd_ct.sec_fase into :pi_ci, :li_tipo_con from sgd_ct where codigo = :ll_codigo and bdi_job =0;

				if sqlca.sqlcode<>0 then 
					fw_escribe_log_avisos(" CON LA INSTALACION PADRE DE LA ACOMETIDA  " + STRING(ll_instalacion) + " NO SE PUEDE LLEGAR HASTA EL CT. ") 
					return 0 // ES IMPOSIBLE FORMAR LA JERARQUIA 
				else
					ll_ct = ll_codigo
				end if
			
			elseif li_tipo_inst = fgci_tipo_transformador then
					
				select  sgd_trafo_mb.class_id, sgd_trafo_mb.sec_fase into :pi_ci, :li_tipo_con from sgd_trafo_mb where codigo = :ll_codigo and bdi_job =0;

				if sqlca.sqlcode = 0 then 
					ll_trafo = ll_codigo
				else
					fw_escribe_log_avisos(" CON LA INSTALACION PADRE DE LA ACOMETIDA  " + STRING(ll_instalacion) + " NO SE PUEDE LLEGAR HASTA EL TRAFO. ") 
				end if

			end if
				
			pl_instalaciones[li_contador] = ll_codigo

			FETCH cu_instalaciones_1 into :ll_codigo,:li_tipo_inst;			
			li_Contador ++
		
		LOOP 
		
		close cu_instalaciones_1;

		IF ll_trafo > 0 then // comprobamos que el trafo est$$HEX2$$e1002000$$ENDHEX$$digitalizado
			
			IF gb_operaciones_inst = TRUE then
						
				// FDO - SERVICIOS OPERACION -- Se valida si la instalacion esta digitalizada.
			
				ll_array[2] = ll_trafo
				
				li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],fgci_tipo_transformador)
	
				fw_escribe_log_avisos(" COMPRUEBA SI LA INSTALACION ESTA DIGITALIZADA  "  + STRING(li_permito)) 
	
				IF upperbound(il_instalaciones[]) > 0 then
					IF li_permito = 0 and il_instalaciones[1] = ll_trafo then // li_permito = 1 significa que la instalacion y todos sus hijos estan digitalizados
						
						ll_codigo = ll_trafo
						li_ci = gi_ci_trafo_esq
						
					ELSE
						ll_codigo = ll_ct
						li_ci = gi_ci_ct
						
					END IF
				ELSE
					ll_codigo = ll_ct
					li_ci = gi_ci_ct
				END IF	
					
			ELSE
				ll_codigo = ll_ct
				li_ci = gi_ci_ct
			END IF
		ELSE
			ll_codigo = ll_ct	
			li_ci = gi_ci_ct
			
		END IF

		
		select fase_afectada into :ls_fase_suministro from gi_cambio_formato_fase where tipo_conexion = :li_tipo_con;

		if sqlca.sqlcode<>0 then 
			ls_fase_suministro = '000'
		end if
		
		// Servicio que recupera jerarqu$$HEX1$$ed00$$ENDHEX$$a.
		
		of_obten_salida_mt(ll_instalacion,ll_codigo,li_ci,pl_salida_mt[],pl_fases[])

		if upperbound(pl_Salida_mt)>0 then // HAY AL MENOS UNA INSTALACION
			
			pb_real = true
			
			IF gb_operaciones_inst = false then
				pl_instalaciones[li_contador] = pl_Salida_mt[1]
				li_contador ++	
		
				SELECT "SGD_CABECERAS"."CM_ELTO_NIVEL"  
					INTO :ll_subestac
					FROM "SGD_CABECERAS"  
					WHERE ( "SGD_CABECERAS"."COD_LINEA" = :pl_salida_mt[1] ) AND  
					( "SGD_CABECERAS"."CI_ELTO_NIVEL" in (1411,1118,1108) )   ;
		
				if sqlca.sqlcode = 0 then 
					pl_instalaciones[li_contador] = ll_Subestac
				end if
			else
				for li_contador =1 to upperbound(pl_Salida_mt[])
					if pl_Salida_mt[li_contador] <> 2 and pl_Salida_mt[li_contador] <> 0 then
						pl_instalaciones[upperbound(pl_instalaciones) +1] = pl_Salida_mt[li_contador]
					end if
				next
				if pl_Salida_mt[upperbound(pl_Salida_mt[])] = 2 then
					pl_Salida_mt = ll_array_nulo
					pl_Salida_mt[1] = 2
					pl_Salida_mt[2] = 2
				else
					pl_Salida_mt = ll_array_nulo
				end if
			end if
		end if
	end if 
end if
	
// COMPROBAMOS SI DEBEMOS OBTENER LA JERARQUIA NORMAL
	
if not pb_real then
		
	select sgd_Acometida.instalacion_origen,tipo_conexion
	into :ll_instalacion,:li_tipo_con_aco  from sgd_Acometida where codigo = :pl_codigo and bdi_job =0;

	if sqlca.sqlcode<>0 then return 0 // ES IMPOSIBLE FORMAR LA JERARQUIA 
	
	 DECLARE cu_instalaciones CURSOR FOR  
	  SELECT "SGD_INSTALACION"."NRO_INSTALACION",
	  			  "SGD_INSTALACION"."NRO_INST_PADRE",
				  "SGD_INSTALACION"."TIPO_INSTALACION",
				  nvl("SGD_INSTALACION"."NRO_INST_UNIFICADA",0)
	  FROM "SGD_INSTALACION"
	  where nro_instalacion <> :fgcdec_aviso_con_alimentacion
	  start with nro_instalacion = :ll_instalacion and bdi_job =0 
	  connect by prior nro_inst_padre = nro_instalacion and bdi_job=0 AND TIPO_INSTALACION <> :fgci_tipo_salida_at;
	
	OPEN cu_instalaciones;
	FETCH cu_instalaciones into :ll_padres,:ll_inst_padre,:li_tipo_inst,:ll_inst_unif;
	li_contador =1
	do while sqlca.sqlcode =0 
					
					if li_tipo_inst = fgci_tipo_ct then
						
						if not isnull(li_tipo_con_aco) and li_tipo_con_aco > 0 then
							li_tipo_con = li_tipo_con_aco
						else							
							Select tipo_conexion
							into :li_tipo_con 
							from sgd_instalacion 
							where nro_instalacion = :ll_padres 
									and bdi_job = 0;
						end if		
						
													
						pl_ct = ll_padres
												
						select fase_afectada into :ls_fase_suministro from gi_cambio_formato_fase where tipo_conexion = :li_tipo_con;
					
					end if
					
					IF (li_tipo_inst = fgci_tipo_salida_de_baja or li_tipo_inst = fgci_tipo_salida_mt) and  ll_inst_unif <> 0 then
						// la instalacion es una linea de baja o una linea de media que dependen de una instalacion ficticia.
						ll_instalacion = ll_inst_unif
						select tipo_instalacion into :ll_tip_padre from sgd_instalacion where nro_instalacion = :ll_inst_padre;
						
						ll_instalaciones_normal[li_contador] = ll_padres // linea
						li_contador ++
												
						if sqlca.sqlcode = 0 and ll_tip_padre = fgci_tipo_transformador then // si el padre es un trafometo el ct
							ll_instalaciones_normal[li_contador] = ll_inst_padre // Trafo
							select nro_inst_unificada into :ll_ct from sgd_instalacion where nro_instalacion = :ll_inst_unif;	
							li_contador ++
							ll_instalaciones_normal[li_contador] = ll_ct // Y meto el ct unificado 
//							select nro_inst_padre into :ll_linea from sgd_instalacion where nro_instalacion = :ll_ct;
						else
							ll_instalaciones_normal[li_contador] = ll_inst_padre // CT o CA
//							select nro_inst_padre into :ll_linea from sgd_instalacion where nro_instalacion = :ll_inst_padre;
						end if
						
						
						
						// hay que meter la linea final 
//						li_contador ++
//						ll_instalaciones_normal[li_contador] = ll_linea // linea
					
						close cu_instalaciones;
						open cu_instalaciones;
						FETCH cu_instalaciones into :ll_padres,:ll_inst_padre,:li_tipo_inst,:ll_inst_unif;
						lb_pongo_unif = true
				
					END IF
					
					if lb_pongo_unif = false then
						ll_instalaciones_normal[li_contador] = ll_padres
					end if
					
					lb_pongo_unif = false
					
		FETCH cu_instalaciones into :ll_padres,:ll_inst_padre,:li_tipo_inst,:ll_inst_unif;
		li_Contador ++
	loop 
	close cu_instalaciones;
	pl_instalaciones = ll_instalaciones_normal
	
end if
	
	
	// EN CASO DE RED REAL O RED NORMAL  SE DEBE COMPROBAR QUE LA ULTIMA INSTALACION TIENE COMO INSTALACION PADRE la fgcd_aviso_con_alimentacion
	
if upperbound(pl_instalaciones)=0 then 
	fw_escribe_log_avisos(" CONECTIVIDAD NO DEVUELVE ELEMENTOS, NO HAY JERARQUIA. EL AVISO SERA SIN ALIMENTACION. ") 
	return 0 // NO TIENE ELEMENTOS ---> NO HAY JERARQUIA
end if
ll_instalacion = pl_instalaciones[upperbound(pl_instalaciones)]

select tipo_instalacion into :ll_instalacion_superior  from sgd_instalacion where nro_instalacion = :ll_instalacion and bdi_job=0;

if ll_instalacion_superior <> long(fgci_tipo_subestacion) then  // O NO SE HA LLEGADO Al NIVEL SUPERIOR O LA INSTALACION NO ES LA PADRE (PUEDE SER UN CA)
	
	declare  c_instal cursor for
	select nro_instalacion 
	from sgd_instalacion
	where nro_instalacion <> :ll_instalacion
	start with nro_instalacion = :ll_instalacion
	connect by prior nro_inst_padre = nro_instalacion ;

	open c_instal;
	
	fetch c_instal into :ll_inst_padres;
	
	do while sqlca.sqlcode = 0
		
		if ll_inst_padres <> fgcdec_aviso_con_alimentacion then
			
			pl_instalaciones[upperbound(pl_instalaciones) +1 ] = ll_inst_padres
			
		end if
		
		fetch c_instal into :ll_inst_padres;
		
	loop
		
	close c_instal;
	
	if ll_inst_padres <> fgcdec_aviso_con_alimentacion then 
		fw_escribe_log_avisos(" NO SE HA CONSEGUIDO LLEGAR AL NIVEL DE SUBESTACION, EL AVISO SERA SIN ALIMENTACION. ") 
		return 0
	end if
	
end if

return 1
end function

public function long of_pide_servicio (long pl_argumentos[], string ps_servicio);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//										
// Funcion/Evento: of_pide_servicio (1)
// 
// Objetivo: pide genericamente un servicio devolviendo un array con los elementos encontrados. 
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada:   	pl_argumentos, array de argumentos recibidos.
//					ps_servicio, nombre del servicio que se va a llamar.
//		Salida :  	il_retorno[] Array de instancia del objeto que se carga con lo devuelto por Conectividad
//					retorno -> 1 Funciona OK
//							  -> 0 No funciona Correctamente.
//
// Devuelve:		--
//
// Fecha      	Responsable   	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	  		-----------   		---------
// 27/10/2003    FDO				Creaci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_contador =1,ll_instalaciones[],ll_argumentos[],ll_nro_cabecera,ll_nro_instalacion,ll_nro_inst,ll_nro_ci
int retorno , li_contador = 1,li_comienzo,li_final,li_cant_cb
long   res
rf_handler rfh, rfh_null
boolean pb_real = false
string ls_str = "0"

// Reseteamos el array de instalaciones 
il_instalaciones[] = ll_instalaciones[]

// Cargamos en local los parametros
ll_argumentos[] = pl_argumentos[]

//Cambiamos en local los c$$HEX1$$f300$$ENDHEX$$digos de l$$HEX1$$ed00$$ENDHEX$$nea por cabeceras para aquellos servicios que lo necesiten
if ps_servicio = "con_info" then
	
	For ll_contador = 2 to upperbound(ll_argumentos[]) step 4
		
		ll_nro_inst = ll_argumentos[ll_contador]
		
		Select count(*) 
		into :li_cant_cb
		from sgd_cabeceras 
		where cod_linea  = :ll_nro_inst;
		
		if sqlca.sqlcode = 0 then
			
			if li_cant_cb > 1 then
		
				Select cm,ci 
				into :ll_nro_cabecera,:ll_nro_ci
				from sgd_cabeceras 
				where cod_linea  = :ll_nro_inst and CM_ELTO_NIVEL in (SELECT CODIGO FROM SGD_SUBESTAC WHERE bdi_job=0 UNION 
																						  SELECT CODIGO FROM SGD_CENTROALIM WHERE bdi_job=0  )
				and rownum < 2;
			
			else
				
				Select cm,ci 
				into :ll_nro_cabecera,:ll_nro_ci
				from sgd_cabeceras 
				where cod_linea  = :ll_nro_inst;
				
			end if
				
			if sqlca.sqlcode = 100 then
				// Sacamos mensaje por pantalla y retornamos con -1
				is_mensaje = "No se encuentran cabeceras asociados a las Instalaciones SGD_CABECERAS."
				return 0
			elseif sqlca.sqlcode = -1 then
				is_mensaje = "Error al recuperar los cabeceras de la tabla SGD_CABECERAS. " + sqlca.sqlerrtext
				return -1		
			end if
		
		else
			is_mensaje = "Error al recuperar los cabeceras de la tabla SGD_CABECERAS. " + sqlca.sqlerrtext
			return -1		
		end if	
		
		ll_argumentos[ll_contador - 1] = ll_nro_ci
		ll_argumentos[ll_contador] = ll_nro_cabecera
		
	next

end if

///////////
if ps_servicio = "con_esquemaPertenece" then
	// siempre que llamamos a este servicio, los trafos vienen en la posicion 3 del array.
	li_comienzo = 3
	li_final = upperbound(ll_argumentos)
else
	li_comienzo = 1
	li_final = 2
end if

FOR ll_contador = li_comienzo to li_final step 2
	
	//PEDIMOS EL SERVICIO --- > HAY QUE CAMBIAR EL SERVICIO Y LOS PARAMETROS
	rfh = rfh_null
	retorno=rfc_call(ref rfs,ps_servicio,ref rfh)

	//MANDAMOS EL PRIMER PARAMETRO  NRO_RED siempre un "0"
	if retorno = 1 then 	
		retorno = rf_writeString(ref rfh,ref ls_str)
		
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)		

			//MANDAMOS EL SEGUNDO PARAMETRO  CI 
			if retorno = 0 then 	
				
				retorno= rf_writeInt(ref rfh,ll_argumentos[ll_contador])
				
				if retorno=0 then  // TODO OK
					retorno= rf_writeSepCampos(ref rfh)

					// MANDAMOS EL TERCER PARAMETRO  CM
					
					if retorno =0  then // TODO OK
						retorno= rf_writeInt(ref rfh,ll_argumentos[ll_contador + 1]) 
						
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
							
							if retorno =0  then // TODO OK
							
								if ps_servicio <> "con_esquemaPertenece" then
									retorno= rf_writeInt(ref rfh,1)
									retorno= rf_writeSepCampos(ref rfh)
									retorno= rf_writeSepComandos(ref rfh)
								else
									retorno= rf_writeSepComandos(ref rfh)
								end if
								
								retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
	
								if retorno = 1 then // RECOGEMOS EL RESULTADO
									do while  (rf_readInt(ref rfh,ref res)=1) 
									  if res <> 0 and (li_contador = 2 or ps_servicio <> "con_esquemaPertenece") then
										if ps_servicio = "con_esquemaPertenece" then
											// cargamos el trafo por que el servicio carga el ct.
											ll_instalaciones[upperbound(ll_instalaciones) + 1] = ll_argumentos[ll_contador + 1] 
										else
											ll_instalaciones[upperbound(ll_instalaciones) + 1] = res
										end if
									  end if 
									  li_contador ++	
									  // recuperamos los valores en la variable instanciada de tal forma que accedemos a consultar.
									loop
									li_contador = 1
								end if
									
							end if
								
						end if
						
					end if
				
				end if
			
			end if
			
		end if
		
	else
		is_mensaje = "No se puede conectar con Conectividad" 
		return -1
	end if

Next

 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

il_instalaciones[] = ll_instalaciones[]

if upperbound(ll_instalaciones[]) = 0 then
	retorno =  0 // conectividad no devuelve nada
elseif ll_instalaciones[1] = 0 then
	retorno = 0 // No esta dig
end if

return retorno 
end function

public function long of_comprueba_inst_digitalizada (long pi_argumentos[], integer pi_tipo_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: Of_comprueba_inst_digitalizada
//
// Objetivo: 
//
//	Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada Subestaci$$HEX1$$f300$$ENDHEX$$n:
//	
//		Se pide un con_conexiones cuando se elige la instalaci$$HEX1$$f300$$ENDHEX$$n.
//	
//		Conectividad no devuelve ning$$HEX1$$fa00$$ENDHEX$$n cabecera - Permito al SGI definir interrupciones, tanto en la Sub. como en cualquiera de las l$$HEX1$$ed00$$ENDHEX$$neas.
//		Conectividad devuelve menos cabeceras que l$$HEX1$$ed00$$ENDHEX$$neas tiene la subestaci$$HEX1$$f300$$ENDHEX$$n - Permito definir interrupciones en aquellas l$$HEX1$$ed00$$ENDHEX$$neas no digitalizadas.
//		Conectividad devuelve todos los cabeceras, tantos como l$$HEX1$$ed00$$ENDHEX$$neas tiene la subestaci$$HEX1$$f300$$ENDHEX$$n - No permito esta incidencia.
//	
//	Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada L$$HEX1$$ed00$$ENDHEX$$nea de MT.
//	
//		Se pide un con_info de la l$$HEX1$$ed00$$ENDHEX$$nea -  Si conectividad devuelve informaci$$HEX1$$f300$$ENDHEX$$n No pemito esta incidencia.
//	
//	Instalaci$$HEX1$$f300$$ENDHEX$$n afectada Centro de Reflexi$$HEX1$$f300$$ENDHEX$$n.
//	
//		Idem subestaci$$HEX1$$f300$$ENDHEX$$n.
//	
//	Instalaci$$HEX1$$f300$$ENDHEX$$n afectada CT.
//	
//		Se pide un con_cabecera del elemento  
//	
//		Si conectividad devuelve el cabecera:
//			Se pide un con_esquema pertenece del primer trafo.
//				Si el trafo tiene esquema - No permito esta incidencia.
//				Si el trafo No tiene esquema - Permito interrumpir los trafos, notificando a operaci$$HEX1$$f300$$ENDHEX$$n el alta/reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n
//		Si conectividad no devuelve el cabecera:
//			Se permite la incidencia, pudiendo marcar interrupciones a nivel de CT y de Trafo.
//	
//	Instalaci$$HEX1$$f300$$ENDHEX$$n afectada Trafo.
//
//	Se pide un con_cabecera del padre.
//	
//		Se pide un con_esquema_pertenece del elemento.
//			Si el trafo tiene esquema - Permito esta incidencia pudiendo marcar interrupciones a nivel de L$$HEX1$$ed00$$ENDHEX$$nea.
//			Si el trafo no tiene esquema - Permito interrumpir el trafo, notificando a operaci$$HEX1$$f300$$ENDHEX$$n el alta/reposici$$HEX1$$f300$$ENDHEX$$n de la interrupci$$HEX1$$f300$$ENDHEX$$n.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
//                       Creaci$$HEX1$$f300$$ENDHEX$$n       27/10/2003   FDO
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

long ll_devuelve,ll_cant_lineas,ll_cant_trafos,ll_cod_trafo,ll_inst_padre,ll_instalaciones[]
long ll_array[],li_contador,ll_nro_instal,ll_nro_instalacion,ll_instal_reset[]


Declare c_trafos cursor for
select nro_instalacion 
from sgd_instalacion
where nro_inst_padre = :ll_nro_instal;

// Comprobamos el tipo de instalacion afectada para saber como vamos a comportarnos.-

ll_array[] = pi_argumentos[]

Choose case pi_tipo_instalacion
	case fgci_tipo_subestacion,fgci_tipo_centro_reflexion, fgci_tipo_subestacion_at
		
		// reselteamos el array de instalaciones
		
		il_instalaciones[] = ll_instalaciones[]
		
		li_contador=1
		
		//Cargamos el ci de la subestacion o centro de reflexion
		
		// Se decide usar una comparaci$$HEX1$$f300$$ENDHEX$$n entre sgd_cabeceras y sgd_instalacion
		
		select count(nro_instalacion)
		into :ll_cant_lineas
		from sgd_instalacion
		where nro_inst_padre = :pi_argumentos[2] and
				bdi_job = 0 and
				estado = 0;

		declare lc_inst cursor for 
		select nro_instalacion 
		from sgd_instalacion 
		where nro_instalacion in (select cod_linea 
											 from sgd_cabeceras 
											 where cm_elto_nivel = :pi_argumentos[2])
				and nro_inst_padre = :pi_argumentos[2]; 
											 
		open lc_inst;
		
		fetch lc_inst into :ll_nro_instalacion;
				
		do while sqlca.sqlcode = 0
			il_instalaciones[li_contador] = ll_nro_instalacion
			li_contador ++
			fetch lc_inst into :ll_nro_instalacion;
		loop
		
		close lc_inst;
		
		if upperbound(il_instalaciones) =  ll_cant_lineas then // las est$$HEX1$$e100$$ENDHEX$$n digitalizadas
			ii_resultado = 1
		elseif upperbound(il_instalaciones) > 0 then // tiene lineas digital pero no todas
			ii_resultado = 2 
		elseif upperbound(il_instalaciones) = 0 then
			ii_resultado = 0 // Todo alfa
		else 
			ii_resultado = -1
		end if
			

	case fgci_tipo_salida_mt
		
		//Cargamos el ci de la linea
		ll_array[1] = gi_ci_linea_mt
		
		ll_devuelve = gu_rf.of_pide_servicio(ll_array[],"con_info") 
		
		ii_resultado =  ll_devuelve
		
		// ll_devuelve = 1 La instalacion est$$HEX2$$e1002000$$ENDHEX$$digitalizada. ll_devuelve = 0 NO esta digitalizada. -1 casca
	
	// GNU 23-8-2007. Mejora EPSA indisponibilidades
	case fgci_tipo_salida_at
		//Cargamos el ci de la linea
		ll_array[1] = gi_ci_linea_at
		
		ll_devuelve = gu_rf.of_pide_servicio(ll_array[],"con_info") 
		
		ii_resultado =  ll_devuelve
		
		// ll_devuelve = 1 La instalacion est$$HEX2$$e1002000$$ENDHEX$$digitalizada. ll_devuelve = 0 NO esta digitalizada. -1 casca
	
		// FIN GNU
	case fgci_tipo_ct
		
		//Cargamos el ci del ct
		
		ll_array[1] = gi_ci_ct
		
		//Cargamos los trafos del ct
		
		ll_nro_instal = ll_array[2]
		
		open c_trafos;
			
		fetch c_trafos into :ll_cod_trafo;
			
		do while sqlca.sqlcode = 0
			ll_array[upperbound(ll_array) + 2] = ll_cod_trafo
			fetch c_trafos into :ll_cod_trafo;
		loop
		
		close c_trafos;
				
		ll_devuelve = gu_rf.of_pide_servicio(ll_array[],"con_cabecera") 
		
		if ll_devuelve = 1 then
			
			// El ct tiene cabecera luego miramos los trafos
			for li_contador = 4 to upperbound(ll_array[]) step 2
				ll_array[li_contador -1] = gi_ci_trafo_esq							
			next
			
			ll_devuelve = gu_rf.of_pide_servicio(ll_array[],"con_esquemaPertenece") 
			
			if ll_devuelve = 1 then // alguno o todos los trafos est$$HEX2$$e1002000$$ENDHEX$$digitalizado, comprobamos cuantos.
			
				// miramos si el usuario ha seleccionado un ct o trafos.	
				select count(nro_instalacion)
				into :ll_cant_trafos
				from sgd_instalacion
				where nro_inst_padre = :ll_array[2] and
					bdi_job = 0 and
					estado = 0 and
					tipo_instalacion = :fgci_tipo_transformador ;
						
				if ll_cant_trafos = upperbound(il_instalaciones[]) then
					// digitalizada con todos los trafos en el esquema
					ii_resultado =  1 // no permitimos
				elseif upperbound(il_instalaciones[]) = 0 then
					// No digitalizada
					ii_resultado =  0				
				elseif ll_cant_trafos > upperbound(il_instalaciones[]) then
					// digitalizada con alguno de los trafos en el esquema pero no todos.
					ii_resultado =  2
				end if					
			elseif ll_devuelve = 0 then
				// ningun trafo est$$HEX2$$e1002000$$ENDHEX$$digitalizado luego permitimos esta incidencia
				ii_resultado =  2		
			else
				ii_resultado =  -1
			end if
		elseif ll_devuelve = 0 then
			// el ct no est$$HEX2$$e1002000$$ENDHEX$$digitalizado luego permitimos esta incidencia
			ii_resultado =  0
		else
			ii_resultado =  -1
		end if

	case fgci_tipo_transformador
		
		ll_nro_instal = ll_array[2]
		
		//Cargamos el ci del ct padre
		
		ll_array[1] = gi_ci_ct
		
		select nro_inst_padre
		into :ll_inst_padre
		from sgd_instalacion
		where nro_instalacion = :ll_nro_instal;
		
		 ll_array[2] =  ll_inst_padre
		 ll_array[4] =  ll_nro_instal
		 
		//Cargamos los trafos del ct

		ll_devuelve = gu_rf.of_pide_servicio(ll_array[],"con_cabecera") 
		
		if ll_devuelve = 1 then
			
			// El ct tiene cabecera luego miramos el trafos
			ll_array[3] = gi_ci_trafo_esq
			
			ll_devuelve = gu_rf.of_pide_servicio(ll_array[],"con_esquemaPertenece") 
			
			if ll_devuelve = 1 then // el trafo est$$HEX2$$e1002000$$ENDHEX$$digitalizado
				il_instalaciones[] = ll_instal_reset[]
				ii_resultado =  2 // permitimos pero cargamos el trafo
			elseif ll_devuelve = 0 then
				// el trafo no est$$HEX2$$e1002000$$ENDHEX$$digitalizado luego permitimos esta incidencia pero cargamos el array con el ct
				il_instalaciones[1] = ll_inst_padre
				ii_resultado =  0		
			else
				ii_resultado =  -1
			end if
		elseif ll_devuelve = 0 then
			// el ct no est$$HEX2$$e1002000$$ENDHEX$$digitalizado luego permitimos esta incidencia
			ii_resultado =  0
		else
			ii_resultado =  -1
		end if		

	case fgci_tipo_salida_de_baja
		// el ct no est$$HEX2$$e1002000$$ENDHEX$$digitalizado luego permitimos esta incidencia
		ii_resultado =  0
end choose

return ii_Resultado
end function

public function long of_comprueba_inst_digitalizada_at (long pl_nro_instalacion, integer pi_tipo_instalacion);long ll_contador =1,ll_instalaciones[],ll_argumentos[],ll_nro_cabecera,ll_nro_instalacion,ll_nro_inst,ll_nro_ci
int retorno , li_contador = 1,li_comienzo,li_final,li_cant_cb
long   res
rf_handler rfh, rfh_null
//boolean pb_real = false
string ls_str = "0"
//
//Cambiamos en local los c$$HEX1$$f300$$ENDHEX$$digos de l$$HEX1$$ed00$$ENDHEX$$nea por cabeceras para aquellos servicios que lo necesiten
	
//	For ll_contador = 2 to upperbound(ll_argumentos[]) step 4
		
		ll_nro_inst = pl_nro_instalacion
		
		Select count(*) 
		into :li_cant_cb
		from sgd_cabeceras 
		where cod_linea  = :ll_nro_inst;
		
		if sqlca.sqlcode = 0 then
			
			if li_cant_cb > 1 then
		
				Select cm 
				into :ll_nro_cabecera
				from sgd_cabeceras 
				where cod_linea  = :ll_nro_inst and CM_ELTO_NIVEL in (SELECT CODIGO FROM SGD_SUBESTAC WHERE bdi_job=0)
				and rownum < 2;
			
			else
				
				Select cm 
				into :ll_nro_cabecera
				from sgd_cabeceras 
				where cod_linea  = :ll_nro_inst;
				
			end if
				
			if sqlca.sqlcode = 100 then
				// Sacamos mensaje por pantalla y retornamos con -1
				is_mensaje = "No se encuentran cabeceras asociados a las Instalaciones SGD_CABECERAS."
				return 0
			elseif sqlca.sqlcode = -1 then
				is_mensaje = "Error al recuperar los cabeceras de la tabla SGD_CABECERAS. " + sqlca.sqlerrtext
				return -1		
			end if
		
		else
			is_mensaje = "Error al recuperar los cabeceras de la tabla SGD_CABECERAS. " + sqlca.sqlerrtext
			return -1		
		end if	
		
		ll_argumentos[1] = ll_nro_ci
		ll_argumentos[2] = ll_nro_cabecera




	
	//PEDIMOS EL SERVICIO --- > HAY QUE CAMBIAR EL SERVICIO Y LOS PARAMETROS
	rfh = rfh_null
	retorno=rfc_call(ref rfs,"con_dameci",ref rfh)

	//MANDAMOS EL PRIMER PARAMETRO  NRO_RED siempre un "0"
	if retorno = 1 then 	
		retorno = rf_writeString(ref rfh,ref ls_str)
		
		if retorno=0 then  // TODO OK
			retorno= rf_writeSepCampos(ref rfh)		

//			//MANDAMOS EL SEGUNDO PARAMETRO  CI 
//			if retorno = 0 then 	
//				
//				retorno= rf_writeInt(ref rfh,ll_argumentos[ll_contador])
//				
//				if retorno=0 then  // TODO OK
//					retorno= rf_writeSepCampos(ref rfh)

					// MANDAMOS EL TERCER PARAMETRO  CM
					
					if retorno =0  then // TODO OK
						retorno= rf_writeInt(ref rfh,ll_nro_cabecera) 
						
						if retorno=0 then  // TODO OK
							retorno= rf_writeSepCampos(ref rfh)
							
							if retorno =0  then // TODO OK
							
									retorno= rf_writeInt(ref rfh,1)
									retorno= rf_writeSepCampos(ref rfh)
									retorno= rf_writeSepComandos(ref rfh)
								
								retorno= rfc_ping(rfs)  // VERIFICA SI HAY CONEXION
	
								if retorno = 1 then // RECOGEMOS EL RESULTADO
									do while  (rf_readInt(ref rfh,ref res)=1) 
									  if res <> 0 then
											ll_instalaciones[upperbound(ll_instalaciones) + 1] = res
									  end if 
									  li_contador ++	
									  // recuperamos los valores en la variable instanciada de tal forma que accedemos a consultar.
									loop
									li_contador = 1
								end if
									
							end if
								
//						end if
						
//					end if
				
				end if
			
			end if
			
		end if
		
	else
		is_mensaje = "No se puede conectar con Conectividad" 
		return -1
	end if



 // CERRAMOS LA CONEXION 
 
rfc_close_pb(ref rfh)

il_instalaciones[] = ll_instalaciones[]

if upperbound(ll_instalaciones[]) = 0 then
	retorno =  0 // conectividad no devuelve nada
elseif ll_instalaciones[1] = 0 then
	retorno = 0 // No esta dig
end if

return retorno 
end function

on rf.create
call super::create
TriggerEvent( this, "constructor" )
end on

on rf.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;iu_systray	= create nca_systray
iu_systray.of_identificativo_icono(1)
end event

event destructor;if isvalid(iu_systray) then
	iu_systray.of_identificativo_icono(1)
	iu_systray.delicon()
	destroy iu_systray
end if
end event


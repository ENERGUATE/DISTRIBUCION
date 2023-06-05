HA$PBExportHeader$n_msg_std_sgi.sru
$PBExportComments$Mensajes del SGI. Tambi$$HEX1$$e900$$ENDHEX$$n para  los  -TN-
forward
global type n_msg_std_sgi from nonvisualobject
end type
end forward

global type n_msg_std_sgi from nonvisualobject
end type
global n_msg_std_sgi n_msg_std_sgi

type variables

end variables

forward prototypes
public function integer f_error (integer pi_tabla)
public function integer f_mensaje (string ps_cod_msg, string ps_parm1, string ps_parm2, button ps_botones)
public function integer f_microhelp (string ps_cod)
public function string f_mensaje_g (string ps_tipo, integer pi_num)
public function string f_mensaje_s (string ps_tipo, integer pi_num)
public function string f_mensaje_a (string ps_tipo, integer pi_num)
public function string f_mensaje_r (string ps_tipo, integer pi_num)
public function string f_mensaje_i (string ps_tipo, integer pi_num)
public function string f_mensaje_d (string ps_tipo, integer pi_num)
public function string f_mensaje_o (string ps_tipo, integer pi_num)
public function string f_mensaje_b (string ps_tipo, integer pi_num)
public function string f_mensaje_m (string ps_tipo, integer pi_num)
public function string f_mensaje_f (string ps_tipo, integer pi_num)
public function string f_mensaje_p (string ps_tipo, integer pi_num)
public function string f_mensaje_c (string ps_tipo, integer pi_num)
public function string f_mensaje_x (string ps_tipo, integer pi_num)
public function string f_mensaje_z (string ps_tipo, integer pi_num)
public function string f_mensaje_t (string ps_tipo, integer pi_num)
end prototypes

public function integer f_error (integer pi_tabla);//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_error
//
//	Objetivo:	Controla el c$$HEX1$$f300$$ENDHEX$$digo de error de la ultima transacci$$HEX1$$f300$$ENDHEX$$n.
//
//	$$HEX1$$c100$$ENDHEX$$mbito:		Privado
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	pi_tabla	
//					Salida:	
//
//	Devuelve:	 1 = Ok
//					-1 = Error
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----------		---------
// 07/02/96		J.H.V       Versi$$HEX1$$f300$$ENDHEX$$n inicial
//
//////////////////////////////////////////////////////////////

// constantes para retorno de la funci$$HEX1$$f300$$ENDHEX$$n
Integer	i_rtn_ok = 1
Integer	i_rtn_error = -1

// constantes para controlar resultado de la operaci$$HEX1$$f300$$ENDHEX$$n 
Integer	i_sql_ok = 0
Integer	i_sql_not_found = 100
Integer	i_sql_error = -1

// variable para almacenar el nombre de la tabla
String	s_nom_tabla

// Si recibe datos en el par$$HEX1$$e100$$ENDHEX$$metro, obtiene el nombre de la tabla
IF pi_tabla <> 0 THEN
	
	CHOOSE CASE pi_tabla
		CASE 1	//Accion_inc
			s_nom_tabla = "Acciones sobre la incidencia"

		CASE 2	// SGD_ACOMETIDA
			s_nom_tabla = "Acometida instalacion"

		CASE 3	//Aco_sum
			s_nom_tabla = "Acometida suministro"
		CASE 4
			s_nom_tabla = "Alarmas"
		CASE 5
			s_nom_tabla = "Avisos"
		CASE 6
			s_nom_tabla = "Avisos_bonificados"
		CASE 7
			s_nom_tabla = "Avisos_distribucion"
		CASE 8
			s_nom_tabla = "Avisos_Res"
		CASE 9
			s_nom_tabla = "Avisos_tipo"
		CASE 10
			s_nom_tabla = "Aviso_ins"
		CASE 11
			s_nom_tabla = "Brigada"
		CASE 12
			s_nom_tabla = "Brigada_brigadista"
		CASE 13
			s_nom_tabla = "Brigada_mantenimiento"
		CASE 14
			s_nom_tabla = "Brigada_operacion"
		CASE 15
			s_nom_tabla = "Brigada_ot"
		CASE 16
			s_nom_tabla = "Brigada_trab"
		CASE 17
			s_nom_tabla = "Brigadista"
		CASE 18
			s_nom_tabla = "Callejero"
		CASE 19
			s_nom_tabla = "Centro"
		CASE 20
			s_nom_tabla = "Centro_loc"
		CASE 21
			s_nom_tabla = "Clientes"
		CASE 22
			s_nom_tabla = "Cmd_inc"
		CASE 23
			s_nom_tabla = "Cmd_ins"
		CASE 24
			s_nom_tabla = "Codigos"
		CASE 25
			s_nom_tabla = "Contratas"
		CASE 26
			s_nom_tabla = "Departamentos"
		CASE 27
			s_nom_tabla = "Estados"
		CASE 28
			s_nom_tabla = "Estado_oper"
		CASE 29
			s_nom_tabla = "Estado_mant"
		CASE 30
			s_nom_tabla = "Estados"
		CASE 31
			s_nom_tabla = "Est_region"
		CASE 32
			s_nom_tabla = "Est_zona"
		CASE 33
			s_nom_tabla = "Fincas"
		CASE 34
			s_nom_tabla = "Funcion"
		CASE 35
			s_nom_tabla = "Funciones"
		CASE 36
			s_nom_tabla = "H_sum_con"
		CASE 37
			s_nom_tabla = "Incidencia"
		CASE 38
			s_nom_tabla = "Incidencias_relevantes"
		CASE 39
			s_nom_tabla = "Incidencia_BDG"
		CASE 40
			s_nom_tabla = "Incidencia_duracion"
		CASE 41
			s_nom_tabla = "Incidencia_suministro"
		CASE 42
			s_nom_tabla = "Incidencia_tiemp"
		CASE 43
			s_nom_tabla = "Instalacion"
		CASE 44
			s_nom_tabla = "Instalaciones_BDG"
		CASE 45
			s_nom_tabla = "Instalacion_DT1"
		CASE 46
			s_nom_tabla = "Instalacion DT2"
		CASE 47
			s_nom_tabla = "Interrupcion"
		CASE 48
			s_nom_tabla = "Interrupciones_t"
		CASE 49
			s_nom_tabla = "Localidades"
		CASE 50
			s_nom_tabla = "Mcodigos"
		CASE 51
			s_nom_tabla = "Mestados"
		CASE 52
			s_nom_tabla = "Mtipos"
		CASE 53
			s_nom_tabla = "Municipios"
		CASE 54
			s_nom_tabla = "Nom_red_calle"
		CASE 55
			s_nom_tabla = "Ot"
		CASE 56
			s_nom_tabla = "O_s"
		CASE 57
			s_nom_tabla = "Perdidas_corte"
		CASE 58
			s_nom_tabla = "Perfil"
		CASE 59
			s_nom_tabla = "Perfiles"
		CASE 60
			s_nom_tabla = "Problemas_inst"
		CASE 61
			s_nom_tabla = "Provincias"
		CASE 62
			s_nom_tabla = "Relacion_centro"
		CASE 63
			s_nom_tabla = "Sit_clima"
		CASE 64
			s_nom_tabla = "Sumcon"
		CASE 65
			s_nom_tabla = "Suministros"
		CASE 66
			s_nom_tabla = "Suministros_imp"
		CASE 67
			s_nom_tabla = "Sum_imp"
		CASE 68
			s_nom_tabla = "Test"
		CASE 69
			s_nom_tabla = "Tipos"
		CASE 70
			s_nom_tabla = "T_accion"
		CASE 71
			s_nom_tabla = "T_alcance"
		CASE 72
			s_nom_tabla = "T_causa"
		CASE 73
			s_nom_tabla = "T_det_mantenimiento"
		CASE 74
			s_nom_tabla = "T_det_operacion"
		CASE 75
			s_nom_tabla = "T_det_perdidas"
		CASE 76
			s_nom_tabla = "T_estado"
		CASE 77
			s_nom_tabla = "T_estado_ot"
		CASE 78
			s_nom_tabla = "T_est_aviso"
		CASE 79
			s_nom_tabla = "T_est_clima"
		CASE 80
			s_nom_tabla = "T_est_mant"
		CASE 81
			s_nom_tabla = "T_incidencia"
		CASE 82
			s_nom_tabla = "T_material_averiado"
		CASE 83
			s_nom_tabla = "T_prioridad"
		CASE 84
			s_nom_tabla = "T_problema"
		CASE 85
			s_nom_tabla = "T_propiedad"
		CASE 86
			s_nom_tabla = "T_tension"
		CASE 87
			s_nom_tabla = "T_tipo_centro"
		CASE 88
			s_nom_tabla = "T_tipo_ins"
		CASE 89
			s_nom_tabla = "T_tip_aviso"
		CASE 90
			s_nom_tabla = "T_turno"
		CASE 91
			s_nom_tabla = "T_ultimo"
		CASE 92
			s_nom_tabla = "Usuarios"
		CASE 93
			s_nom_tabla = "Usuarios_sgi"
	END CHOOSE
	
END IF

CHOOSE CASE SQLCA.SQLCode
		
	CASE i_sql_ok
		RETURN i_rtn_ok				// Lectura o escritura correcta

	CASE i_sql_not_found
		gnv_msg.f_mensaje("EG13",s_nom_tabla,"",OK!)
		RETURN i_rtn_ok				//No se encontr$$HEX2$$f3002000$$ENDHEX$$lectura

	CASE i_sql_error
		CHOOSE CASE sqlca.SQLDBCode
			CASE 1407,1400
				gnv_msg.f_mensaje("EG05",s_nom_tabla,"",OK!)
			CASE  1,-1
				gnv_msg.f_mensaje("EG06",s_nom_tabla,"",OK!)
			CASE 2291
				gnv_msg.f_mensaje("EG07",s_nom_tabla,"",OK!)
			CASE 2292	
				gnv_msg.f_mensaje("EG08",s_nom_tabla,"",OK!)
         CASE ELSE 
				MessageBox("Error","Error SQL: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
//  s.a.				gnv_msg.f_mensaje("EG09",s_nom_tabla,"",OK!)
		END CHOOSE
		//Rollback;
		gnu_u_transaction.uf_rollback()
		RETURN i_rtn_error
		
   CASE ELSE 		
		gnv_msg.f_mensaje("EG09",s_nom_tabla,"",OK!)
		//Rollback;
		gnu_u_transaction.uf_rollback()
		RETURN i_rtn_error
       
END CHOOSE
end function

public function integer f_mensaje (string ps_cod_msg, string ps_parm1, string ps_parm2, button ps_botones);///////////////////////////////////////////////////////////////////////
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_mensaje
//
//	Objetivo:	Desplegar un mensaje dado un c$$HEX1$$f300$$ENDHEX$$digo de entrada, 
//					(opcionalmente) dos par$$HEX1$$e100$$ENDHEX$$metros a incorporar en el msg y 
//					los botones que el mismo debe tener. 
//					Si el mensaje es de confirmaci$$HEX1$$f300$$ENDHEX$$n, por defecto despliega el 
//					bot$$HEX1$$f300$$ENDHEX$$n OK!
//					El c$$HEX1$$f300$$ENDHEX$$digo ser$$HEX2$$e1002000$$ENDHEX$$de la forma TMnn, en donde 
//						T = Tipo de mensaje:
//                     	P = Mens. Error de codigo <C> 
//								A = Mens. de Aviso
//							 	E = Mens. de Error
//							 	C = Mens. Confirmaci$$HEX1$$f300$$ENDHEX$$n de acci$$HEX1$$f300$$ENDHEX$$n
//                     	I = Mens. de informaci$$HEX1$$f300$$ENDHEX$$n
//
//						M = M$$HEX1$$f300$$ENDHEX$$dulo al que pertenece el mensaje
//								A = Gestion de Avisos
// 		               B = Gesti$$HEX1$$f300$$ENDHEX$$n BDG
//       	         	C = Gen$$HEX1$$e900$$ENDHEX$$ricos de <C> 
//          	     		D = Descargos
//                 		G = Gen$$HEX1$$e900$$ENDHEX$$ricos
//								I = Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias
//								M = Mantenimiento de base de datos
//                     	P = Reportes
//								R = Recepci$$HEX1$$f300$$ENDHEX$$n de Avisos
//                  		S = Suministros
//                      O = OT's(Consulta)
//								X = Sistema Gr$$HEX1$$e100$$ENDHEX$$fico
//								Z = Interface
//					 	nn = n$$HEX1$$fa00$$ENDHEX$$mero del error dentro de su m$$HEX1$$f300$$ENDHEX$$dulo y tipo.
//
//	Si el n$$HEX1$$fa00$$ENDHEX$$mero de mensaje no existe, saldr$$HEX2$$e1002000$$ENDHEX$$un error que se despliega
// en el SystemError de la aplicaci$$HEX1$$f300$$ENDHEX$$n, ya que es un problema de codificaci$$HEX1$$f300$$ENDHEX$$n
// que debe solucionarse lo antes posible
//					
//
//	Ambito:		P$$HEX1$$fa00$$ENDHEX$$blico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	ps_cod_msg, ps_parm1_msg, ps_parm2_msg, ps_botones
//					Salida:	
//
//	Devuelve:	La respuesta del usuario al mensaje desplegado
//					1: Si
//					2: No
//					3: Cancelar
//
// Fecha		    Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		    -----------		---------
// 07/02/1996	 J.H.V.		      Versi$$HEX1$$f300$$ENDHEX$$n inicial
// 21/07/1998	 MATO             Modificaci$$HEX1$$f300$$ENDHEX$$n
///////////////////////////////////////////////////////////////////////

string	s_tipo_msg, s_msg, s_prim_cod, ls_tipo
int		i_nro_msg, i_return
icon		ic_icono
button	bu_botones

// Proceso el c$$HEX1$$f300$$ENDHEX$$digo del mensaje

s_tipo_msg = Left(ps_cod_msg,2)
s_prim_cod = Left(ps_cod_msg,1)

if len(trim(ps_cod_msg)) = 5 then
	i_nro_msg = integer(LeftTrim(Right(ps_cod_msg,3)))
else
	i_nro_msg = integer(LeftTrim(Right(ps_cod_msg,2)))
end if

// Cargo los botones recibidos por par$$HEX1$$e100$$ENDHEX$$metro
bu_botones = ps_botones

//HSE Genera el .LOG de la transaccion de ORACLE
if sqlca.sqlcode = -1 then
//	fg_registro_log(ps_cod_msg)
end if

CHOOSE CASE right(s_tipo_msg,1)
	CASE 'A'   
		s_msg = f_mensaje_a(s_tipo_msg,i_nro_msg)
	CASE 'B'	
		s_msg = f_mensaje_b(s_tipo_msg,i_nro_msg)
	CASE 'C' 
		s_msg = f_mensaje_c(s_tipo_msg,i_nro_msg)
	CASE 'D' 
		s_msg = f_mensaje_d(s_tipo_msg,i_nro_msg)
	CASE 'F' 
		s_msg = f_mensaje_f(s_tipo_msg,i_nro_msg)
	CASE 'G' 
		s_msg = f_mensaje_g(s_tipo_msg,i_nro_msg)
	CASE 'I'	
		s_msg = f_mensaje_i(s_tipo_msg,i_nro_msg)
	CASE 'M' 
		s_msg = f_mensaje_m(s_tipo_msg,i_nro_msg)
	CASE 'O' 
		s_msg = f_mensaje_o(s_tipo_msg,i_nro_msg)
	CASE 'P' 
		s_msg = f_mensaje_p(s_tipo_msg,i_nro_msg)
	CASE 'R'	
		s_msg = f_mensaje_r(s_tipo_msg,i_nro_msg)
	CASE 'S' 
		s_msg = f_mensaje_s(s_tipo_msg,i_nro_msg)
	CASE 'T' 
		s_msg = f_mensaje_t(s_tipo_msg,i_nro_msg)
	CASE 'X'
		s_msg = f_mensaje_x(s_tipo_msg,i_nro_msg)
	CASE 'Z'
		s_msg = f_mensaje_z(s_tipo_msg,i_nro_msg)
	CASE ELSE
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Error en la codificaci$$HEX1$$f300$$ENDHEX$$n del mensaje."+&
				" No se sigue ejecutando el proceso. Por favor comun$$HEX1$$ed00$$ENDHEX$$quese"+&
				" con Sistemas",StopSign!,OK!)
			//rollback;
			gnu_u_transaction.uf_rollback()
			i_return = -1
			RETURN i_return
END CHOOSE

// Vemos si debe tener icono o botones por defecto
CHOOSE CASE s_prim_cod
	CASE 'A'
		ic_icono = Exclamation!
	CASE 'E'
		ic_icono = StopSign!
		bu_botones = OK!
	CASE 'C'
		ic_icono = Question!
	CASE 'I'
		ic_icono = Information!
END CHOOSE


// Si recibi$$HEX2$$f3002000$$ENDHEX$$datos en ps_parm1, lo reemplazo en el mensaje a dsp.
IF (LeftTrim(ps_parm1)) <> "" THEN
	s_msg = Replace(s_msg,Pos(s_msg,"%s",1),2,ps_parm1)
END IF

// Si recibi$$HEX2$$f3002000$$ENDHEX$$datos en ps_parm2, lo reemplazo en el mensaje a dsp.
IF (LeftTrim(ps_parm2)) <> "" THEN
	s_msg = Replace(s_msg,Pos(s_msg,"%s1",1),3,ps_parm2)
END IF

i_return = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n ",s_msg,ic_icono,bu_botones)
//i_return = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n "+ps_cod_msg,s_msg,ic_icono,bu_botones)
RETURN i_return


end function

public function integer f_microhelp (string ps_cod);//////////////////////////////////////////////////////////////
//
//	Funci$$HEX1$$f300$$ENDHEX$$n:		f_microhelp
//
//	Objetivo:	Desplegar un mensaje en el microhelp de la ventana a
//					partir de un c$$HEX1$$f300$$ENDHEX$$digo de entrada
//					El c$$HEX1$$f300$$ENDHEX$$digo ser$$HEX2$$e1002000$$ENDHEX$$de la forma Mnn, en donde 
//						M = M$$HEX1$$f300$$ENDHEX$$dulo al que pertenece el mensaje
//								G = gen$$HEX1$$e900$$ENDHEX$$ricos
//								A = Gestion de Avisos
//								I = Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias
//								R = Recepci$$HEX1$$f300$$ENDHEX$$n de Avisos
//								B = BDG
//								M = mantenimiento de base de datos
//					 	nn = n$$HEX1$$fa00$$ENDHEX$$mero del mensaje dentro de su m$$HEX1$$f300$$ENDHEX$$dulo y tipo.
//
//	$$HEX1$$c100$$ENDHEX$$mbito:		P$$HEX1$$fa00$$ENDHEX$$blico
//
//	Par$$HEX1$$e100$$ENDHEX$$metros:	Entrada:	ps_cod
//					Salida:	
//
//	Devuelve:	Si estuvo ok o si hubo error
//					1: OK
//				  -1: Si no se encontr$$HEX2$$f3002000$$ENDHEX$$el c$$HEX1$$f300$$ENDHEX$$digo del mensaje
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//	-----		-----------		---------
// 07/02/96			J.H.V		Versi$$HEX1$$f300$$ENDHEX$$n inicial
//
//////////////////////////////////////////////////////////////
String	s_tipo_msg, s_msg
Integer	i_nro_msg, i_return

// Proceso el c$$HEX1$$f300$$ENDHEX$$digo del mensaje
s_tipo_msg = Left(ps_cod,1)
i_nro_msg = integer(LeftTrim(Right(ps_cod,2)))

// Si el c$$HEX1$$f300$$ENDHEX$$digo es G00, el microhelp es el defecto
IF (i_nro_msg = 0) AND (s_tipo_msg = 'G') THEN
//	w_mdi_aplicacion.SetMicroHelp("OPEN S.G.I")				
	Return 1
END IF

CHOOSE CASE s_tipo_msg
	CASE 'G'		// Mensajes gen$$HEX1$$e900$$ENDHEX$$ricos
		CHOOSE CASE i_nro_msg
			CASE 01
				s_msg = "..."
			CASE ELSE 
				i_return = -1
				RETURN i_return 
		END CHOOSE 

	CASE 'A'		// Mensajes Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos
		CHOOSE CASE i_nro_msg
			CASE 01
				s_msg = " "
			CASE ELSE 
				i_return = -1
				RETURN i_return 
		END CHOOSE 

	CASE 'I'		// Mensajes Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias
		CHOOSE CASE i_nro_msg
			CASE 01
				s_msg = "..."
			CASE ELSE 
				i_return = -1
				RETURN i_return 
		END CHOOSE 

CASE 'R'		//Mensajes Recepci$$HEX1$$f300$$ENDHEX$$n de avisos
		CHOOSE CASE i_nro_msg
			CASE 01
				s_msg = "..."
			CASE 02
				s_msg = "No se puede grabar el aviso debido a que el suministro ya tiene un aviso pendiente."
			CASE 03
				s_msg = "No se puede grabar el aviso debido a que el suministro tiene orden de corte y no es de peligro."
			CASE 04
				s_msg = "No se puede grabar debido a que no se tiene la informaci$$HEX1$$f300$$ENDHEX$$n de un suministro v$$HEX1$$e100$$ENDHEX$$lido y el aviso es normal."
			CASE ELSE 
				i_return = -1
				RETURN i_return 
		END CHOOSE 

CASE 'B'		// Mensajes BDG
		CHOOSE CASE i_nro_msg
			CASE 01
				s_msg = "..."
			CASE ELSE 
				i_return = -1
				RETURN i_return 
		END CHOOSE 

CASE ELSE
		i_return = -1
		RETURN i_return
		
END CHOOSE

//w_mdi_aplicacion.SetMicroHelp(s_msg)					

Return 1
end function

public function string f_mensaje_g (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AG'   // avisos gen$$HEX1$$e900$$ENDHEX$$ricos	
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No cuenta con los permisos requeridos para realizar la operaci$$HEX1$$f300$$ENDHEX$$n."		
			CASE 02
				s_msg = "Las fechas no pueden ser mayores a la fecha del d$$HEX1$$ed00$$ENDHEX$$a."		
			CASE 03
				s_msg = "No se dispone de datos para efectuar la consulta."
			CASE 04
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n solicitada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada"
         CASE 05
  			   s_msg = "La aplicaci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$configurada para una resoluci$$HEX1$$f300$$ENDHEX$$n de 800x600"
         CASE 06
  			   s_msg = "Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$%s. Se necesita actualizar la lista."
			CASE 07
  			   s_msg = "Usuario de SGI con sesi$$HEX1$$f300$$ENDHEX$$n abierta."				  
			CASE 08
  			   s_msg = "M$$HEX1$$e100$$ENDHEX$$quina con sesi$$HEX1$$f300$$ENDHEX$$n abierta."	  
		END CHOOSE
		

	CASE 'EG'   //errores gen$$HEX1$$e900$$ENDHEX$$ricos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Suministro inexistente."
			CASE 02
				s_msg = "Ingrese un valor v$$HEX1$$e100$$ENDHEX$$lido en la columna %s de la fila "+& 
		  					"%s1"
			CASE 03
				s_msg = "Clave de acceso err$$HEX1$$f300$$ENDHEX$$nea."
			CASE 04	
				s_msg = "Error en la codificaci$$HEX1$$f300$$ENDHEX$$n del mensaje;"+&
						  " no se sigue ejecutando el proceso. Comun$$HEX1$$ed00$$ENDHEX$$quese con Sistemas."
			CASE 05
				s_msg= "Se ha insertado un campo con valor nulo indebidamente en %s"
			CASE 06
				s_msg = "Se ha tratado de insertar un registro ya existente en %s"
			CASE 07	
				s_msg = "No se puede insertar en la tabla %s por referencias."
			CASE 08 
				s_msg = "No se puede borrar un registro de %s por inconsistencia en la Base de Datos."
			CASE 09	
				s_msg = "Error no codificado en %s"
			CASE 10	
				s_msg = "El mes debe ser mayor que el mes actual."
			CASE 11	
				s_msg = "Documento inexistente."
			CASE 12	
				s_msg = "Ingrese todos los datos de la fila."
			CASE 13	
				s_msg = "No se encontr$$HEX2$$f3002000$$ENDHEX$$informaci$$HEX1$$f300$$ENDHEX$$n en la tabla %s"
			CASE 14	
				s_msg = "No existe un cliente con ese nombre."
			CASE 15	
				s_msg = "No se ha encontrado el inmueble requerido."
			CASE 16	
				s_msg = "No existe un cliente con ese documento."
			CASE 17
				s_msg = "No existe informaci$$HEX1$$f300$$ENDHEX$$n suficiente para continuar con la opci$$HEX1$$f300$$ENDHEX$$n solicitada - Conumicar a Sistemas"
			CASE 18
				s_msg = "No cuenta con los permisos requeridos para realizar la operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 19
				s_msg = "El registro est$$HEX2$$e1002000$$ENDHEX$$siendo modificado por otra estaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 20
				s_msg = "No se puede borrar con instalaciones dependientes."
  			CASE 21
  			   s_msg = "SQL Error: %s"  
         CASE 22
  			   s_msg = "La fecha no puede ser nula"
			CASE 23
				s_msg = "Las fechas no son correctas"
			CASE 24
				s_msg = "Otro usuario ha modificado los datos de este elemento"
		   CASE 25
  			   s_msg = "Usuario o clave desconocido"	  
			CASE 26 	  
				  s_msg = "Usuario inexistente"	
			CASE 27 	  
				  s_msg = "Clave incorrecta"	
			CASE 28 	  
				  s_msg = "Usuario sin perfil o con mas de uno"		  
			CASE 29 	  
				  s_msg = "Usuario caducado"		  
			CASE 30 	  
				  s_msg = "No existen perfiles definidos"		 
			CASE 31 	  
				  s_msg = "Fecha de expiraci$$HEX1$$f300$$ENDHEX$$n incorrecta"		 	  
			CASE 32 	  
				  s_msg = "Introduzca una clave v$$HEX1$$e100$$ENDHEX$$lida"			  	
			CASE 33 	  
				  s_msg = "Identificador de usuario incorrecto"	
			CASE 34 	 
				  s_msg = "Direcci$$HEX1$$f300$$ENDHEX$$n de correo incorrecta"	
			CASE 35 	 
				  s_msg = "Descripci$$HEX1$$f300$$ENDHEX$$n no v$$HEX1$$e100$$ENDHEX$$lida"	
	  		CASE 36 	 
				  s_msg = "Nombre de usuario no valido"	
			CASE 37 	 
				  s_msg = "No se pudo insertar el registro"	
			CASE 38 	 
				  s_msg = "No se pueden grabar los datos del usuario"	
			CASE 39 	 
				  s_msg = "No se pudo dar de alta el nuevo perfil"	
			CASE 40 	 
				  s_msg = "No se pudo actualizar las nuevas opciones para el  nuevo perfil"	
			CASE 41 	 
				  s_msg = "No se pudo cargar el perfil"	
			CASE 42 	 
				  s_msg = "Perfil mal definido"	
			CASE 43 	 
				  s_msg = "No se ha obtenido el nuevo c$$HEX1$$f300$$ENDHEX$$digo del perfil"	
			CASE 44
				  s_msg = "No se puede borrar el perfil, hay usuarios que lo estan usando"	
			CASE 45
				  s_msg = "No se pudo cargar el perfil"	

			CASE 46
				  s_msg = "No existen perfiles definidos"	
			CASE 47
				  s_msg = "No se pueden cargar los datos del usuario"	
  		   
			CASE 48
				  s_msg = "El usuario no tiene una localidad v$$HEX1$$e100$$ENDHEX$$lida en el sistema"	
				  
			CASE 49
				  s_msg = "Este usuario est$$HEX2$$e1002000$$ENDHEX$$bloqueado. Consulte con el Administrador del OpenSgi."	
				  
			CASE 50
				  s_msg = "Fecha de expiraci$$HEX1$$f300$$ENDHEX$$n incorrecta"
				  
			CASE 51
				  s_msg = "Identificador de usuario duplicado"
						  
			CASE 52
				  s_msg = "Este usuario carece de clave. Consulte con el Administrador del OpenSgi."	
				  
			
	END CHOOSE
		
	CASE 'CG'  // confirmaciones gen$$HEX1$$e900$$ENDHEX$$ricas
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea guardar las modificaciones realizadas ?."
			CASE 02
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Confirma la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 03
				s_msg = "$$HEX2$$a1002000$$ENDHEX$$Cliente inexistente !"
			CASE 04	
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea salir del Open SGI ?"
			CASE 05
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea salir sin confirmar la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 06 
				s_msg = "El fichero fue grabado con $$HEX1$$e900$$ENDHEX$$xito."
			CASE 07
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar la Subestaci$$HEX1$$f300$$ENDHEX$$n seleccionada ?"
			CASE 08
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar la Salida de Media Tensi$$HEX1$$f300$$ENDHEX$$n seleccionada ?"
			CASE 09
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar el Centro de Transformaci$$HEX1$$f300$$ENDHEX$$n seleccionado ?"	
			CASE 10
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar el Transformador seleccionado ?"
			CASE 11
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n seleccionada ?"	
			CASE 12
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea guardar los cambios ?"
			CASE 13
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar el elemento ?"
			CASE 14
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea abandonar los cambios efectuados ?"
 			CASE 15
				s_msg = "Clave vacia $$HEX1$$bf00$$ENDHEX$$Desea asignarle el identificador de usuario?"
 			CASE 16
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere borrar el perfil?"
			CASE 17
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere borrar el usuario?"
			CASE 18 
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere desbloquear el usuario?"
			CASE 19
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere bloquear el usuario?"
			CASE 20
				s_msg = "Existen interrupciones marcadas $$HEX1$$bf00$$ENDHEX$$Desea Desmarcarlas?"
			CASE 21
				s_msg = "Operacion no v$$HEX1$$e100$$ENDHEX$$lida, no puede borrar el Usuario con el que est$$HEX2$$e1002000$$ENDHEX$$ejecutando"			
END CHOOSE 

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_s (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	 CASE 'IS'   // avisos de suministros
			CHOOSE CASE pi_num
				CASE 01
					s_msg = "No se encontraron incidencias asociadas al suministro."		
				CASE 02
					s_msg = "No se encontraron avisos asociados al suministro."		
				CASE 03
					s_msg = "No se encontraron interrupciones asociadas al suministro."
				CASE 04
					s_msg = "No existen suministros importantes que cumplan la condici$$HEX1$$f300$$ENDHEX$$n."
				CASE 05
					s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada carece de clientes importantes."
				CASE 06
					s_msg = "Las fechas deben estar comprendidas entre el 01/01/1000 y el 31/12/3000."
			END CHOOSE
		
END CHOOSE

return s_msg
end function

public function string f_mensaje_a (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AA'   // avisos Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Confirma el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n de la Instalaci$$HEX1$$f300$$ENDHEX$$n %s," + &
							"que ser$$HEX2$$e1002000$$ENDHEX$$alimentada por la instalaci$$HEX1$$f300$$ENDHEX$$n %s1 "
			CASE 02
				s_msg = "No se ha seleccionado una incidencia."
			CASE 03
				s_msg = "No se le puede cambiar la alimentaci$$HEX1$$f300$$ENDHEX$$n a una Instalaci$$HEX1$$f300$$ENDHEX$$n de nivel 0 !!!"
			CASE 04
				s_msg = "No se permite cambiar de alimentaci$$HEX1$$f300$$ENDHEX$$n en este nivel "
			CASE 05
				s_msg = "Debe seleccionar hasta la localidad del Cliente."
			CASE 06
				s_msg = "No existen Avisos para gestionar."
			CASE 07
				s_msg = "El nro. de Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionado es igual al de la instalaci$$HEX1$$f300$$ENDHEX$$n que la alimenta actualmente."
			CASE 08
				s_msg = "El Usuario no tiene perfil para realizar esta operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 09
				s_msg = "El Cliente no tiene asignada una localidad v$$HEX1$$e100$$ENDHEX$$lida en el sistema."
			CASE 10
				s_msg = "El estado actual de la Incidencia no es v$$HEX1$$e100$$ENDHEX$$lido, por lo tanto no se puede continuar con la operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 11
				s_msg = "La Incidencia ha sido eliminada, por lo tanto no se puede continuar con la operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 12
				s_msg = "El Aviso esta siendo modificado; no se puede continuar con la operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 13
				s_msg= "El Aviso fue asociado a una inicidencia; no se puede continuar con la operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 14
				s_msg = "El Aviso est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado por otro Usuario."
			CASE 15
				s_msg = "El Aviso est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado por otro usuario."
			CASE 16
				s_msg = "El Aviso ha sido previamente asociado a otra incidencia."
			CASE 17
				s_msg = "El Aviso ha sido previamente considerado como improcedente."
			CASE 18
				s_msg = "%s" 	
			CASE 19
				s_msg = "Error al intentar grabar"
			CASE 20
				s_msg = "Error al intentar borrar"
			CASE 21
				s_msg = "Hay datos de la Zona especificada pero del CMD o el Sector elegido no hay."
			CASE 22	
				s_msg = "Suministro clase Sin Alimentaci$$HEX1$$f300$$ENDHEX$$n.~nNo puede tener avisos de clase Aviso de Calidad. " + &
				"~n~n$$HEX2$$bf002000$$ENDHEX$$Desea engresar aviso como de clase Sin Alimentacion ?"
			CASE 23
				s_msg = "El usuario no es propietario del descargo"
			CASE 24
				s_msg = "La fecha introducida no es v$$HEX1$$e100$$ENDHEX$$lida"
	
		END CHOOSE

	CASE 'EA'	// Errores Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No se puede cambiar de alimentaci$$HEX1$$f300$$ENDHEX$$n a una instalaci$$HEX1$$f300$$ENDHEX$$n de " + &
							" menor jerarqu$$HEX1$$ed00$$ENDHEX$$a. Debe realizar nuevamente la operaci$$HEX1$$f300$$ENDHEX$$n de Selecci$$HEX1$$f300$$ENDHEX$$n de instalaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 02 
				s_msg = "No se pudo asignar una brigada a la instalaci$$HEX1$$f300$$ENDHEX$$n"
			CASE 03 
				s_msg = "Debe ingresar un nivel m$$HEX1$$e100$$ENDHEX$$s alto que el nivel de la instalaci$$HEX1$$f300$$ENDHEX$$n que quiere abrir."
			CASE 04
				s_msg = "No se pudo actualizar registros en la tabla 'avisos'."
			CASE 05 
				s_msg = "No se pudo borrar registros de la tabla 'aviso_ins'."
			CASE 06
				s_msg = "No se pudo actualizar registros en la tabla 'avisos_res'."
			CASE 07
				s_msg = "No se pudo seleccionar un registro en la tabla 'avisos_res'."
			CASE 08
				s_msg = "No se pudo borrar registros de la tabla 'avisos_res'."
			CASE 09
				s_msg = "No se pudo seleccionar un registro en la tabla 'incidencia'."
			CASE 10
				s_msg = "No se pudo actualizar registros en la tabla 'incidencia'."
			CASE 11
				s_msg = "No se pudo actualizar registros en la tabla 'estado_oper'."
			CASE 12
				s_msg = "No se pudo actualizar registros en la tabla 'instalacion'."
			CASE 13
				s_msg = "No se pudo insertar registros en la tabla 'aviso_ins'."
			CASE 14
				s_msg = "No se pudo insertar un registro en la tabla 'problemas_inst'."
			CASE 15
				s_msg = "No se pudo insertar un registro en la tabla 'avisos_res'."
			CASE 16
				s_msg = "No se pudo seleccionar un registro en la tabla 't_ultimo'."
			CASE 17
				s_msg = "No se pudo actualizar registros en la tabla 't_ultimo'."
			CASE 18
				s_msg = "No se pudo acceder al vector de instalaciones."
			CASE 19
				s_msg = "No se pudo seleccionar un registro en la tabla 'avisos'."
			CASE 20
				s_msg = "Debe completar el Ambito"
			CASE 21
				s_msg = "No se pudo actualizar registros en la tabla 'aviso_ins'."
			CASE 22
				s_msg = "No se pudo seleccionar un registro en la tabla 'instalacion'."
			CASE 23
				s_msg = "Se est$$HEX1$$e100$$ENDHEX$$n actualizando avisos, que se ven afectados por las interrupciones marcadas. Intente grabar nuevamente o cancele dicha operaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 24
				s_msg = "No se pudieron actualizar las tablas"
			CASE 25
				s_msg = "La fecha debe ser mayor a la fecha de inicio de la tarea pendiente de finalizacion ( %s )"
			CASE 26
				s_msg = "La fecha debe ser menor a la fecha y hora actual"
			CASE 27
				s_msg = "Modificaci$$HEX1$$f300$$ENDHEX$$n fallida"
		END CHOOSE
	
	CASE 'CA'	// confirmaciones Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Se est$$HEX2$$e1002000$$ENDHEX$$realizando una asociaci$$HEX1$$f300$$ENDHEX$$n directa de un aviso con " + &
							"alimentaci$$HEX1$$f300$$ENDHEX$$n a una incidencia, ~n$$HEX2$$bf002000$$ENDHEX$$desea continuar con dicha operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 02
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de querer marcar el aviso como improcedente?"			
			CASE 03
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de querer marcar los avisos como improcedentes?"			

		END CHOOSE
		
	CASE 'IA'    //Mensajes informaci$$HEX1$$f300$$ENDHEX$$n Avisos, Inc. y Descargos
		CHOOSE CASE pi_num
			CASE 01
 			   s_msg = "No existen datos para este criterio de seleccion."
			CASE 02
 			   s_msg = "La Tarea ha sido ingresada o actualizada correctamente."
			CASE 03
 			   s_msg = "Esta Brigada no tiene trabajos previstos."
 		   CASE 04
 			   s_msg = "Las Fechas Previstas ingresadas son correctas. La 'OT' quedar$$HEX2$$e1002000$$ENDHEX$$definida $$HEX2$$bf002000$$ENDHEX$$Desea Continuar ?"
			CASE 05
 			   s_msg = "El Descargo ha sido activado y ha sido generada una Incidencia." 
			CASE 06
 			   s_msg = "Todav$$HEX1$$ed00$$ENDHEX$$a no se puede activar el Descargo."
			CASE 07
 			   s_msg = "El Descargo ha quedado actualizado"
		   CASE 08
 			   s_msg = "Descargo/s actualizado/s"
			CASE 09
 			   s_msg = "Reporte generado satisfactoriamente"
 			CASE 10
 			   s_msg = "Seleccione un solo aviso"				 
			CASE 11 //DBE 28/02/2000
 			   s_msg = "Hay datos del %s especificado pero del Sector elegido no hay."		 
		END CHOOSE
		
END CHOOSE

return s_msg
end function

public function string f_mensaje_r (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AR'   // avisos Recepci$$HEX1$$f300$$ENDHEX$$n de avisos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Suministro con incidencia asignada: %s"	
			CASE 02
				s_msg = "Existen incidencias que podr$$HEX1$$ed00$$ENDHEX$$an estar afectando al suministro."		
			CASE 03
				s_msg = "Suministro no encontrado en el sistema."			
			CASE 04
				s_msg = "Documento no encontrado en el sistema."		
			CASE 06
				s_msg = "Aviso Ingresado"		// Modificado ANG  / PM: Eliminaci$$HEX1$$f300$$ENDHEX$$n nro. de Aviso
			CASE 07
				s_msg = "Para la Localidad seleccionada no existe en el sistema una Calle con ese nombre o que empiece por esas letras."		
			CASE 08
				s_msg = "No existe Suministro para el cliente seleccionado."		
			CASE 09
				s_msg = "Para la Calle seleccionada, no existe en el sistema ning$$HEX1$$fa00$$ENDHEX$$n n$$HEX1$$fa00$$ENDHEX$$mero de Puerta."		
			CASE 10
				s_msg = "La localidad ingresada no se encuentra dada de alta en la tabla 'centro_loc'."		
			CASE 11
				s_msg = "Para la Localidad seleccionada no existe en el sistema el n$$HEX1$$fa00$$ENDHEX$$mero y/o duplicador ingresado/s, para la Calle ingresada."		
			CASE 12
				s_msg = "No existe ning$$HEX1$$fa00$$ENDHEX$$n cliente con el documento ingresado."		
			CASE 13
				s_msg = "El Suministro ingresado no dispone de un contrato vigente con la empresa."		
			CASE 14
				s_msg = "No existe ning$$HEX1$$fa00$$ENDHEX$$n c$$HEX1$$f300$$ENDHEX$$digo de pa$$HEX1$$ed00$$ENDHEX$$s para el nombre ingresado."		
			CASE 15
				s_msg = "Suministro en corte."			
			CASE 16
				s_msg = "Para la Localidad seleccionada no existe en el sistema niguna referencia."		
		   CASE 17
		      s_msg = "Ese aviso no existe en el sistema."
			CASE 18	
				s_msg = "Este aviso ya ha sido resuelto"
			CASE 19	
				s_msg = "Error al actualizar el aviso."	
			CASE 20
				s_msg = "Fue ingresado un aviso para este suministro por otro usuario"	
			CASE 21
				s_msg = "Orden de Corte pendiente de ejecuci$$HEX1$$f300$$ENDHEX$$n"
			CASE 22
				s_msg = "Suministro dado de baja por impago"
			CASE 23
				s_msg = "No se encontraron datos para ese filtro"
		END CHOOSE		

	CASE 'ER'	// Errores Recepci$$HEX1$$f300$$ENDHEX$$n de avisos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Error al intentar acceder a la tabla 't_ultimo' para obtener el nro. de aviso correlativo."		
			CASE 02
				s_msg = "Error al intentar actualizar un registro en la tabla 't_ultimo' con el nro. de aviso nuevo."		
			CASE 03
				s_msg = "Error al intentar insertar un nuevo registro en la tabla 'avisos'. %s"		
			CASE 04
				s_msg = "Error al intentar insertar un nuevo registro en la tabla 'avisos'. %s"		
			CASE 05
				s_msg = "Error al verificar suministro importante."		
			CASE 06
				s_msg = "Error al acceder a la tabla 'provincias'."	
			CASE 07
				s_msg = "Error al acceder a la tabla 'departamentos'."		
			CASE 08
				s_msg = "Error al acceder a la tabla 'municipios'."	
			CASE 09
				s_msg = "Error al acceder a la tabla 'localidades'."		
			CASE 10
				s_msg = "Error al acceder a la tabla 'centro_loc'."		
			CASE 11
				s_msg = "Error al seleccionar aviso pendiente."		
			CASE 12
				s_msg = "Error al verificar aviso de peligro."		
			CASE 13
				s_msg = "Error al intentar grabar en la tabla 'aviso_ins'."
			CASE 14
				s_msg = "Error al verificar interrupci$$HEX1$$f300$$ENDHEX$$n marcada."		
			CASE 15
				s_msg = "Error al intentar actualizar en la tabla 'avisos_res'."		
			CASE 16
				s_msg = "Error al seleccionar cantidad de avisos."	
			CASE 17
				s_msg = "Error al buscar una instalaci$$HEX1$$f300$$ENDHEX$$n en el Jerarquizador."		
			CASE 18
				s_msg = "Error al verificar Orden de Servicio en corte."		
			CASE 19
				s_msg = "Error al cargar zona, cmd y sector."		
			CASE 20
				s_msg = "Error al intentar acceder a la tabla 'SGD_ACOMETIDA', con un nro. de acometida obtenido accediendo a 'aco_sum' por nro. de Suministro."		
//			CASE 21
//				s_msg = "Error al intentar acceder a la tabla 't_ultimo' para obtener el nro. de aviso correlativo."		
			CASE 22
				s_msg = "Error: La provincia ingresada no es v$$HEX1$$e100$$ENDHEX$$lida."
			CASE 23
				s_msg = "Error: La provincia no puede ser nula."		
			CASE 24
				s_msg = "Error: El departamento ingresado no es v$$HEX1$$e100$$ENDHEX$$lido."	
			CASE 25
				s_msg = "Error: El departamento no puede ser nulo."		

			CASE 26
				s_msg = "Error: El municipio ingresado no es v$$HEX1$$e100$$ENDHEX$$lido."		
			CASE 27
				s_msg = "Error: El municipio no puede ser nulo."		
//			CASE 28
//				s_msg = "Error al intentar actualizar un registro en la tabla 't_ultimo' con el nro. de aviso nuevo."		
			CASE 29
				s_msg = "Error: La provincia no puede ser nula."		
			CASE 30
				s_msg = "Error al intentar acceder a la tabla 'clientes'."		
			CASE 31
				s_msg = "Error al cargar s_direccion por nro. de Suministro."		
			CASE 32
				s_msg = "Error: Suministro no v$$HEX1$$e100$$ENDHEX$$lido."		
			CASE 33
				s_msg = "Error al intentar grabar en la tabla 'avisos'."		
			CASE 34
				s_msg = "Error: Debe seleccionar un cliente."		
			CASE 35
				s_msg = "Debe ingresar por lo menos el primer apellido."		
			CASE 36
				s_msg = "Error al traer datos."
			CASE 37
				s_msg = "Error: No existen clientes con el nombre ingresado, ni con sin$$HEX1$$f300$$ENDHEX$$nimos del mismo."		
			CASE 38
				s_msg = "Error: Debe ingresar la Provincia, Departamento, Municipio y Localidad."	
			CASE 39
				s_msg = "Error: Debe ingresar por lo menos las dos primeras letras de la Calle."		
			CASE 40
				s_msg = "Error: Debe elegir una Calle."		
			CASE 41
				s_msg = "Error: Debe ingresar documento, tipo y pa$$HEX1$$ed00$$ENDHEX$$s."		
//			CASE 42
//				s_msg = "Error: Suministro no v$$HEX1$$e100$$ENDHEX$$lido."		
			CASE 43
				s_msg = "Error: Para la Calle seleccionada, no existe en el sistema ning$$HEX1$$fa00$$ENDHEX$$n n$$HEX1$$fa00$$ENDHEX$$mero de Puerta."		
			CASE 44
				s_msg = "Error: Debe elegir un inmueble."		
//			CASE 45
//				s_msg = "Error al intentar acceder a la tabla 't_ultimo' para obtener el nro. de aviso correlativo."		
			CASE 46
				s_msg = "Error: Para el n$$HEX1$$fa00$$ENDHEX$$mero de puerta seleccionado, no existe en el sistema ning$$HEX1$$fa00$$ENDHEX$$n Suministro."
			CASE 47
				s_msg = "Error: Debe elegir un Suministro."		
			CASE 48
				s_msg = "Error al intentar traer los datos."		
//			CASE 49
//				s_msg = "Error al intentar acceder a la tabla 't_ultimo' para obtener el nro. de aviso correlativo."		
			CASE 50
				s_msg = "Error al intentar actualizar un registro en la tabla 't_ultimo' con el nro. de aviso nuevo."		
			CASE 51
				s_msg = "Error: Documento no v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 52
				s_msg = "Error: NO se puede grabar el aviso debido a que no se ha ingresado toda la informaci$$HEX1$$f300$$ENDHEX$$n requerida."
			CASE 53
				s_msg = "Error: Debe elegir un Cliente."		
			CASE 54
				s_msg = "Error al intentar acceder a la tabla 'codigos' para obtener el c$$HEX1$$f300$$ENDHEX$$digo de un pa$$HEX1$$ed00$$ENDHEX$$s."		
			CASE 55
				s_msg = "Error al intentar acceder a la tabla 'petsum'."		
			CASE 56
				s_msg = "Error al intentar acceder a la tabla 'sumcon'."		
			CASE 57
				s_msg = "Error al intentar acceder a la tabla 'suministros'."		
			CASE 58
				s_msg = "No se pudo tomar el n$$HEX1$$fa00$$ENDHEX$$mero correlativo de aviso de la tabla 't_ultimo'."
			CASE 59
				s_msg = "Error al intentar acceder a la tabla 't_int_horario'."			
			CASE 60
				s_msg = "No se encontr$$HEX2$$f3002000$$ENDHEX$$registro en la tabla 't_int_horario'."			
			CASE 61
				s_msg = "Error al intentar acceder a las tablas 'SGD_ACOMETIDA' y 'Aco_Sum'."			
			CASE 62
				s_msg = "Error al intentar acceder a la tabla 'Avisos_Res'."			
			CASE 63
				s_msg = "Error al buscar un registro en la DW de Interrupciones."			
			CASE 64
				s_msg = "Error al intentar acceder a la tabla 'Interrupcion'."
			CASE 65
				s_msg = "Error: no existen clientes con el n$$HEX1$$fa00$$ENDHEX$$mero de tel$$HEX1$$e900$$ENDHEX$$fono ingresado."		
			CASE 66
				s_msg = "Error: la consulta no pudo ser ejecutada"
			CASE 67
				s_msg = "No existen avisos improcedentes"
			CASE 68
				s_msg = "Introduzca datos validos"

	END CHOOSE
	
	CASE 'CR'	// Confirmaciones Recepci$$HEX1$$f300$$ENDHEX$$n de avisos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Desea salir sin seleccionar un Suministro?"		
			CASE 02
				s_msg = "No existen clientes con el nombre ingresado, $$HEX2$$bf002000$$ENDHEX$$quiere ver sus sin$$HEX1$$f300$$ENDHEX$$nimos ?"		
 		   CASE 03
				s_msg ="$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro que desea reactivar este aviso?"
 		   CASE 04
				s_msg ="$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro que desea reactivar los avisos?"

		END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_i (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AI'   // avisos Incidencias
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "La fecha de inicio de tareas de la %s no puede ser anterior a la fecha de generada la Orden de Trabajo." 
			CASE 02 
				s_msg = "La %s fue asignada a otra Orden de Trabajo por el usuario %s1"
			CASE 03 
				s_msg = "Debe asignarse una %s responsable."
			CASE 04 
				s_msg = "Debe seleccionarse previamente una %s."
			CASE 05
				s_msg = "La %s no puede ser responsable de las tareas por haber finalizado su trabajo y existir otras brigadas trabajando."		
			CASE 06
				s_msg = "El estado de la Incidencia en Mantenimiento debe ser %s, de lo contrario no podra ser derivada a Operaciones."		
			CASE 07
				s_msg = "La Incidencia ya fue derivada."		
			CASE 08
				s_msg = "Debe digitarse la Observaci$$HEX1$$f300$$ENDHEX$$n antes de ser derivada."		
			CASE 09
				s_msg = "Previamente se debe derivar la Incidencia a Mantenimiento."		
			CASE 10
				s_msg = "No se puede anular la derivaci$$HEX1$$f300$$ENDHEX$$n a Mantenimiento ya que la Incidencia fue retornada a Operaciones."		
			CASE 11
				s_msg = "Se puede derivar a Mantenimiento solo en los estados de ER y SR."		
			CASE 12
				s_msg = "La Incidencia debe ser resuelta por Mantenimiento."					
			CASE 13
				s_msg = "La Incidencia debe ser derivada a Operaciones por estar para Resolver ."					
			CASE 14
				s_msg = "No puede ser anulada la operacion por estar mantenimiento trabajando en Incidencia."					
			CASE 15
				s_msg = "No puede derivar la incidencia a mantenimiento por ser a nivel de Suministro."					
			CASE 16								
				s_msg = "No se cuenta con informaci$$HEX1$$f300$$ENDHEX$$n de suministros importantes."			
			CASE 17
				s_msg = "No se cuenta con informaci$$HEX1$$f300$$ENDHEX$$n de la situaci$$HEX1$$f300$$ENDHEX$$n climatologica del d$$HEX1$$ed00$$ENDHEX$$a %s"	
			CASE 18
				s_msg = "El aviso esta resuelto: no se puede liberar"
			CASE 19
				s_msg = "Aviso con alimentacion: no se puede liberar"
			CASE 20
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n %s ya se est$$HEX2$$e1002000$$ENDHEX$$procesando"
			CASE 21
				s_msg = "No se encontro informaci$$HEX1$$f300$$ENDHEX$$n para la fecha y $$HEX1$$e100$$ENDHEX$$mbito indicados."
			CASE 22
				s_msg = "No existe m$$HEX1$$e100$$ENDHEX$$s informaci$$HEX1$$f300$$ENDHEX$$n disponible."
			CASE 23
				s_msg = "No se encontraron avisos pendientes."
			CASE 24 
				s_msg = "No se encontraron incidencias asociadas a la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 25 
				s_msg = "No se encontraron avisos para la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 26
				s_msg = "No se encontraron avisos para la incidencia seleccionada."
			CASE 27
				s_msg = "La consulta de todas las incidencias Resueltas puede ser prolongada, seria conveniente acortar las fechas de busqueda."
			CASE 28
				s_msg = "$$HEX1$$da00$$ENDHEX$$nicamente es posible asociar avisos con alimentaci$$HEX1$$f300$$ENDHEX$$n a incidencias que est$$HEX1$$e900$$ENDHEX$$n en 'servicio repuesto'."
			CASE 29
				s_msg = "La fecha de generada la Ot no puede ser %s %s1"	
			CASE 30
				s_msg = "En la %s %s1 la fecha de inicio no puede ser nula."
			CASE 31
            s_msg = "En la %s %s1 la fecha de inicio no puede ser mayor a las fecha de fin de las tareas."
			CASE 32
				s_msg = "No pueden existir fechas nulas en mantenimiento y estar la OT derivada a operaciones."
			CASE 33  
            s_msg = "No existe la incidencia."
			CASE 34
				s_msg = "Se debe derivar la incidencia a operaciones por estar en estado para resoluci$$HEX1$$f300$$ENDHEX$$n en mantenimiento."
			CASE 35
 				s_msg = "Existe instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
			CASE 36
				s_msg = "N$$HEX1$$fa00$$ENDHEX$$mero de incidencia."
			CASE 37
				s_msg = "Faltan datos."
			CASE 38
				s_msg = "Se debe seleccionar una Incidencia."
			CASE 39
				s_msg = "El n$$HEX1$$fa00$$ENDHEX$$mero de la incidencia no puede ser nulo."
			CASE 40
				s_msg = "Incidencia de suministro no puede tener una instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
			CASE 41
  				s_msg = "No existe un aviso asociado."
			CASE 42
				s_msg = "Existe m$$HEX1$$e100$$ENDHEX$$s de un aviso asociado."
			CASE 43
				s_msg = "No existe instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
			CASE 44
				s_msg = "Debe ingresar una Orden de Trabajo."
			CASE 45
				s_msg = "Debe seleccionar una Instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
			CASE 46
				s_msg = "Debe ingresar alguna observaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 47
				s_msg = "Incidencia de suministro no debe tener una instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
			CASE 48
				s_msg = "Debe ingresar una instalaci$$HEX1$$f300$$ENDHEX$$n afectada."
			CASE 49
				s_msg = "Debe estar en estado para resoluci$$HEX1$$f300$$ENDHEX$$n."
			CASE 50
				s_msg = "Debe estar en resuelta mantenimiento."
			CASE 51	
				s_msg  = "Debe generar una interrupci$$HEX1$$f300$$ENDHEX$$n."
			CASE 52
				s_msg = "Deben existir clientes afectados."
			CASE 53
				s_msg = "La incidencia programada debe estar al menos en estado Enviado Brigada."
			CASE 54
				s_msg = "Fecha y Hora de detecci$$HEX1$$f300$$ENDHEX$$n no puede ser mayor que la del d$$HEX1$$ed00$$ENDHEX$$a."
			CASE 55
				s_msg = "Fecha de detecci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la del d$$HEX1$$ed00$$ENDHEX$$a."
			CASE 56
				s_msg = "Se debe seleccionar un material averiado."
			CASE 57
				s_msg = "Se debe seleccionar una causa antes de resolver todas las interrupciones."
			CASE 58
				s_msg = "Existen interrupciones para la incidencia."
			CASE 59
				s_msg = "Debe ingresar una descripci$$HEX1$$f300$$ENDHEX$$n."
			CASE 60
				s_msg = "Fecha de estimaci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la fecha de detecci$$HEX1$$f300$$ENDHEX$$n."
			CASE 61
				s_msg = "Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n debe ser menor que la fecha de Enviada Brigada."
//			CASE 62
//				s_msg = "Fecha de Causa Localizada debe ser mayor que fecha <EB>."
			CASE 63
				s_msg = "Fecha de Enviado Brigada debe ser menor que fecha de Incidencia en Reposici$$HEX1$$f300$$ENDHEX$$n."
			CASE 64
				s_msg = "Fecha de Estimaci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la fecha detecci$$HEX1$$f300$$ENDHEX$$n."
			CASE 65
				s_msg = "No se puede eliminar la incidencia debido a que se encuentra en un estado superior a Enviado Brigada."
			CASE 66
				s_msg = "Fecha de Alta debe ser menor que fecha de reposici$$HEX1$$f300$$ENDHEX$$n"
			CASE 67
				s_msg = "Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n debe ser mayor que fecha de Alta"
			CASE 68
				s_msg = "No se pudo realizar la consulta"				
			CASE 69  
				s_msg = "No existen asignaciones de trabajo."
			CASE 70 
				s_msg = "No se puede liberar el aviso. La incidencia no ha sido grabada a$$HEX1$$fa00$$ENDHEX$$n."
			CASE 71 
				s_msg = "No se encontraron Incidencias para el criterio de selecci$$HEX1$$f300$$ENDHEX$$n."
			CASE 72
				s_msg = "No se cuenta con informaci$$HEX1$$f300$$ENDHEX$$n de la situaci$$HEX1$$f300$$ENDHEX$$n climatologica para el rango de d$$HEX1$$ed00$$ENDHEX$$as indicados"	
			CASE 73
				s_msg = "No existe ning$$HEX1$$fa00$$ENDHEX$$n suministro alimentado directamente por esta instalaci$$HEX1$$f300$$ENDHEX$$n"
			CASE 74
				s_msg = "La Consulta no pudo ser ejecutada"	
			CASE 75
				s_msg = "No se encuentra ninguna Incidencia disponible, para poder asociar a ella."
         CASE 76
				s_msg = "No hay ninguna Brigada/Contrata asignada a ninguna OT."
         CASE 77
				s_msg = "La Fecha de Inicio de trabajo no puede ser mayor que la fecha de fin"
			CASE 78
				s_msg = "La Fecha de fin de trabajo es nula o es mayor que la del d$$HEX1$$ed00$$ENDHEX$$a"	
			CASE 79
				s_msg = "Algunas de las fechas previstas de la OT, est$$HEX1$$e100$$ENDHEX$$n con valores nulos"
			CASE 80
				s_msg = "La fecha prevista de inicio de la OT no puede ser menor que la fecha actual"
			CASE 81
				s_msg = "La fecha prevista del fin de la OT no debe ser menor a la fecha prevista del inicio de la misma"
			CASE 82
				s_msg = "La fecha de inicio de la OT no puede ser mayor que la fecha actual"
			CASE 83
				s_msg = "La Fecha de Inicio de la Ot no debe ser mayor que la fecha actual"
			CASE 84
				s_msg = "La Fecha de fin de la Ot no debe ser mayor que la fecha actual"
			CASE 85
				s_msg = "Algunas de las fechas previstas de las Brigadas/Contratas, est$$HEX1$$e100$$ENDHEX$$n con valores nulos"
			CASE 86
				s_msg = "La fecha prevista de inicio de la Brigada/Contrata en la OT no puede ser menor que la fecha actual"
			CASE 87
				s_msg = "La fecha prevista del fin de la Brigada/Contrata en la OT no debe ser menor a la fecha prevista del inicio de la misma"
			CASE 88
				s_msg = "La fecha de Inicio del Trabajo de la Brigada/Contrata en la <OT> no puede ser mayor que la fecha actual"
			CASE 89
				s_msg = "La Brigada/Contrata se encuentra trabajando en otra OT / Tarea"
			CASE 90
				s_msg = "La Fecha de fin de Trabajo de la brigada/contrata en la OT no debe ser mayor que la fecha actual"
			CASE 91
				s_msg = "La Fecha de fin de Trabajo de la brigada/contrata no puede ser menor a la fecha de inicio de la misma"
			CASE 92
				s_msg = "Debe Comenzar la OT, para poder activar el descargo."
			CASE 93
				s_msg = "La Fecha ingresada no puede ser mayor que la fecha actual."
			CASE 94
				s_msg = "Debe introducir un n$$HEX1$$fa00$$ENDHEX$$mero correcto de m$$HEX1$$f300$$ENDHEX$$vil."
			CASE 95
				s_msg = "Ventana gr$$HEX1$$e100$$ENDHEX$$fica no disponible, $$HEX2$$bf002000$$ENDHEX$$Desea continuar ?"
			CASE 96
				s_msg = "%s est$$HEX2$$e1002000$$ENDHEX$$siendo %s1 por otro usuario."
			CASE 97
				s_msg = "La Fecha de la causa debe ser mayor que la fecha actual."
			CASE 98
				s_msg = "La Fecha de la causa debe ser menor que la fecha actual."	
			CASE 99
				s_msg = "No se encontr$$HEX2$$f3002000$$ENDHEX$$el material especificado."
			CASE 100
				s_msg = "Debe seleccionar un material"
			CASE 101
				s_msg = "La Incidencia est$$HEX2$$e1002000$$ENDHEX$$en estado 'EB' o superior.~nDebe asignar al menos una Brigada/Contrata."
			CASE 102
				s_msg = "La fecha de 'EB' no puede ser menor que la fecha generada en la OT."
			CASE 103
				s_msg = "No hay Brigada encargada. Debe seleccionar una."
			CASE 104
				s_msg = "Para seguir gestionando la Incidencia, deber$$HEX2$$e1002000$$ENDHEX$$tener al menos una Brigada/Contrata trabajando."
			CASE 105
				s_msg = "La fecha de resoluci$$HEX1$$f300$$ENDHEX$$n estimada no debe ser menor que la fecha de detecci$$HEX1$$f300$$ENDHEX$$n."
			CASE 106
				s_msg = "No puede finalizar la Incidencia, si hay Brigadas/Contratas en la <OT> que no han comenzado sus trabajos."
			CASE 107
				s_msg = "La Fecha de 'Enviado Brigada' no puede ser menor que la fecha de Incidencia 'En Reposici$$HEX1$$f300$$ENDHEX$$n'."
			CASE 108
				s_msg = "La fecha de Inicio del Trabajo de la Brigada/Contrata en la <OT> no puede ser menor que la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia"
			CASE 109
				s_msg = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n no puede ser menor que la Fecha de alta de la Interrupci$$HEX1$$f300$$ENDHEX$$n."
			CASE 110
				s_msg = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n no puede ser mayor que la Fecha actual."
			CASE 111
				s_msg = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n no puede ser menor que la Fecha de Enviado Brigada"
			CASE 112
				s_msg = "La Fecha de Alta de la Interrupci$$HEX1$$f300$$ENDHEX$$n no puede ser mayor ~nque la fecha del primer aviso alimentado por esta Instalaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 113
				s_msg = "La Fecha de Alta no puede ser menor que la Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia."
			CASE 114
				s_msg = "Existe una interrupci$$HEX1$$f300$$ENDHEX$$n en alguna instalaci$$HEX1$$f300$$ENDHEX$$n hija."
			CASE 115
				s_msg = "Existe una interrupci$$HEX1$$f300$$ENDHEX$$n en alguna instalaci$$HEX1$$f300$$ENDHEX$$n padre."
			CASE 116
				s_msg = "La fecha no puede ser nula."
			CASE 117
				s_msg = "La fecha de Resuelta Mantenimiento no puede ser menor ~nque la fecha de Servicio Repuesto"
			CASE 118
				s_msg = "Las fechas no son correlativas"
			CASE 119
				s_msg = "No puede resolver la incidencia si no seleccion$$HEX2$$f3002000$$ENDHEX$$un Material Averiado."
			CASE 120
				s_msg = "La fecha ingresada no puede ser mayor que la fecha actual."
			CASE 121
				s_msg = "La fecha ingresada no puede ser menor que la fecha de <SR>."
			CASE 122
				s_msg = "No se puede actualizar la Tabla 'SGD_DESCARGOS'."
			CASE 123
				s_msg = "Ya existe una Incidencia sobre la Instalaci$$HEX1$$f300$$ENDHEX$$n %s en estado menor que 'SR'."
			CASE 124
				s_msg = "Alguna de las fechas de la Brigada/Contrata %s est$$HEX1$$e100$$ENDHEX$$n con valores nulos"
			CASE 125
				s_msg = "La fecha de inicio de la Brigada/Contrata %s no puede ser mayor que la fecha actual"
			CASE 126
				s_msg = "La fecha del fin de la Brigada/Contrata %s no debe ser menor a la fecha del inicio de la misma"
			CASE 127
				s_msg = "La fecha de inicio del Trabajo de la Brigada/Contrata %s no puede ser mayor que la fecha actual ni menor que la fecha pendiente"	
			CASE 128
				s_msg = "La Brigada/Contrata %s se encuentra trabajando en otra 'OT' / Tarea"
			CASE 129
				s_msg = "La Brigada/Contrata %s se encontraba trabajando en la fecha introducida."
			CASE 130
				s_msg = "La fecha de fin del Trabajo de la Brigada/Contrata %s no puede ser mayor que la fecha actual"	
			CASE 131
				s_msg = "La fecha de fin del Trabajo de la Brigada/Contrata %s no debe ser menor que la fecha de inicio de la misma"
			CASE 132
				s_msg = "La Brigada/Contrata %s est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otra estaci$$HEX1$$f300$$ENDHEX$$n"
			CASE 133
				s_msg = "La fecha de Inicio del Trabajo de la Brigada/Contrata en la <OT> del DESCARGO no puede ser mayor que la fecha actual ni menor a la fecha de Inicio prevista del mismo"
			CASE 134
				s_msg = "La incidencia no se ha encontrado"
			CASE 135
				s_msg = "Las incidencias de usuario no tienen instalaci$$HEX1$$f300$$ENDHEX$$n afectada"
			CASE 136
				s_msg = "La brigada/contrata seleccionada carece de incidencias activas"
			CASE 137
				s_msg = "No se puede eliminar esta causa porque esta siendo utilizada en el sistema"
			CASE 138
				s_msg = "No existen maniobras para esta incidencia"
			CASE 139
				s_msg = "Solamente se pueden mostrar instalaciones de media tensi$$HEX1$$f300$$ENDHEX$$n"   
			CASE 140
				s_msg = "Debe marcar la Instalaci$$HEX1$$f300$$ENDHEX$$n Origen de la Incidencia"  
			CASE 141
				s_msg = "Debe seleccionar el material averiado"  
			CASE 142
				s_msg = "Debe seleccionar la Instalaci$$HEX1$$f300$$ENDHEX$$n origen de la Incidencia"  
			CASE 143
				s_msg = "La Contrata seleccionada carece de incidencias activas"	
			CASE 144
				s_msg = "Existe una interrupci$$HEX1$$f300$$ENDHEX$$n en alguna instalaci$$HEX1$$f300$$ENDHEX$$n padre con fecha de resoluci$$HEX1$$f300$$ENDHEX$$n posterior a la fecha de alta de la nueva interrupci$$HEX1$$f300$$ENDHEX$$n"
			CASE 145
				s_msg = "No se ha podido asignar una nueva brigada responsable"
			CASE 146
				s_msg = "No se ha podido derivar a mantenimiento"
			CASE 147
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n escogida se tiene que seleccionar desde el m$$HEX1$$f300$$ENDHEX$$dulo de operaciones"
			CASE 148 
				s_msg = "Para el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n se debe seleccionar una %s"
			CASE 149
				s_msg = "Esta instalaci$$HEX1$$f300$$ENDHEX$$n no pertenece a su Sector"
			CASE 150
				s_msg = "Debe escribir la instalaci$$HEX1$$f300$$ENDHEX$$n espec$$HEX1$$ed00$$ENDHEX$$fica para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda"
			CASE 151 
				s_msg = "Escoja un nombre y un tipo de instalaci$$HEX1$$f300$$ENDHEX$$n para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda."
			CASE 152 
				s_msg = "Para asignar alimentaci$$HEX1$$f300$$ENDHEX$$n a una acometida debe seleccionar una %s"
			CASE 153
				s_msg = "No se pueden eliminar Incidencias Programadas."
			CASE 154
				s_msg = "No se pueden eliminar las incidencias procedentes de SCADA."
			CASE 155
				s_msg = "No se puede eliminar la incidencia debido a que ya existen interrupciones definidas."
			END CHOOSE		
		
	CASE 'EI'	// errores Incidencias
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No se pudo seleccionar un registro en la tabla 'instalacion'."
			CASE 02
				s_msg = "No se pudo actualizar un registro en la tabla 'interrupcion'."
			CASE 03
				s_msg = "No se pudo insertar un registro en la tabla 'interrupcion'."
			CASE 04
				s_msg = "No se pudo actualizar registros en la tabla 'instalacion'."
			CASE 05
				s_msg = "La fecha en que fue repuesta la Interrupci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la fecha de 'Enviado Brigada' de la Incidencia: ~n~n~t( %s )"
			CASE 06
				s_msg = "La fecha de alta de la interrupci$$HEX1$$f300$$ENDHEX$$n no puede ser nula."
			CASE 07
				s_msg = "No se pudo borrar un registro de la tabla 'interrupcion'."
			CASE 08
				s_msg = "No existe una instalaci$$HEX1$$f300$$ENDHEX$$n de salida para el transformador seleccionado."
			CASE 09
				s_msg = "No se pudo insertar un registro en la tabla 'sum_imp'."
			CASE 10
				s_msg = "No se pudo seleccionar un registro en la tabla 'incidencia'."
			CASE 11
            s_msg = "Error al grabar seguimiento de Mantenimiento." 
     		CASE 12
            s_msg = "Operacion en mantenimiento no valida, Debe derivar la incidencia a operaciones para poder continuar."
			CASE 13
				s_msg = "El registro ha sido actualizado por otro usuario."
			CASE 14
 				s_msg = "No se pudo actualizar los datos de brigada."
			CASE 15
            s_msg = "ERROR de fecha." 
			CASE 16
				s_msg = "En este modulo del Sistema se permite asignar Fecha de Finalizaci$$HEX1$$f300$$ENDHEX$$n a Trabajos, solamente a Tareas."   
			CASE 17
  				s_msg = "   "
			CASE 18
            s_msg = "Se debe marcar una interrupcion para poder grabar incidencia."
			CASE 19
				s_msg = "N$$HEX1$$fa00$$ENDHEX$$mero de incidenacia es nulo."
			CASE 20
				s_msg = "La Fecha de Alta debe ser menor que la Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n."
			CASE 21
				s_msg = "Si la incidencia es 'Imprevista', la Fecha de Alta debe ser menor o igual que la Fecha Actual."
			CASE 22
				s_msg = "Por lo menos una de las interrupciones debe tener como fecha de generada la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la Incidencia: ~n~n~t( %s ) "
			CASE 23 
				s_msg = "La fecha de Alta debe ser mayor o igual que la Fecha de Detecci$$HEX1$$f300$$ENDHEX$$n de la incidencia."
			CASE 24
				s_msg = "La fecha de resoluci$$HEX1$$f300$$ENDHEX$$n debe ser menor o igual que la Fecha del D$$HEX1$$ed00$$ENDHEX$$a."
			CASE 25
				s_msg = "Fecha Desde debe ser menor o igual que Fecha Hasta."
			CASE 26
				s_msg = "Fecha Hasta debe ser mayor o igual que Fecha Desde."
			CASE 27
				s_msg = "Fecha Hasta no puede ser nula."
			CASE 28
				s_msg = "Debe seleccionar un per$$HEX1$$ed00$$ENDHEX$$odo menor o igual a 15 d$$HEX1$$ed00$$ENDHEX$$as para efectuar esta consulta."
			CASE 29
				s_msg = "Debe seleccionar un sector para ejecutar esta consulta."
			CASE 30
				s_msg = "Debe seleccionar un sector para ejectuar esta consulta."
			CASE 31
				s_msg = "No existen suministros importantes para la incidencia seleccionada."
			CASE 32
				s_msg = "Existen Interrupciones registradas en la Incidencia. Debe realizar esta operaci$$HEX1$$f300$$ENDHEX$$n desde all$$HEX1$$ed00$$ENDHEX$$."
			CASE 33
				s_msg = "No se obtuvo la Instalaci$$HEX1$$f300$$ENDHEX$$n que alimenta a la seleccionada."
			CASE 34
				s_msg = "Ya se ingres$$HEX2$$f3002000$$ENDHEX$$ese material."
//			CASE 34
//				s_msg = "Esta Brigada/Contrata est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otra estaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 35
				s_msg = "Error intentando grabar un registro en estado 'OT'"
			CASE 36
				s_msg = "Las fechas no son correctas"
			CASE 37
				s_msg = "No existen brigadas para la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada"
			CASE 38
				s_msg = "La fecha de alta de la interrupcion no puede ser menor que la fecha de detecci$$HEX1$$f300$$ENDHEX$$n de la incidencia"
			CASE 39
				s_msg = "Esta Brigada/Contrata est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otra estaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 40
				s_msg = "No se puede eliminar la incidencia debido a un error con la Base de Datos."
			CASE 41
				s_msg = "No se ha podido borrar la incidencia."
			CASE 42
				s_msg = "No se ha podido borrar la incidencia ya que no se ha podido desasociar la OT."
			CASE 43
				s_msg = "No se han podido liberar los avisos asociados a la incidencia."
			CASE 44
				s_msg = "La incidencia ya ha sido agrupada por otro usuario."
			CASE 45
				s_msg = "La incidencia ha sido modificada por otro usuario."
			CASE 46
				s_msg = "La incidencia ya ha sido desagrupada por otro usuario."
		END CHOOSE
		
	CASE 'CI'	// confirmaciones Incidencias
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "La %s tiene tareas asignadas a la Orden de Trabajo N$$HEX2$$ba002000$$ENDHEX$$%s1.$$HEX1$$bf00$$ENDHEX$$Da por finalizadas las tareas?"					
			CASE 02			
				s_msg= "Las fechas de los estados %s y %s1 no son correlativas"
			CASE 03			
				s_msg= "La fecha en que se derivo la Incidencia a Mantenimiento no es correcta"
			CASE 04	
				s_msg= "La interrupci$$HEX1$$f300$$ENDHEX$$n marcada para la instalaci$$HEX1$$f300$$ENDHEX$$n %s no tiene fecha de generada asignada, desea continuar?"
			CASE 05
				s_msg= "Si desea dar de alta la incidencia sobre el transformador seleccione 'SI', sino, ~nsi desea darla sobre la salida seleccione 'NO'."
			CASE 06
				s_msg= "Esta consulta puede demorar mucho tiempo, desea continuar ?"
			CASE 07
				s_msg= "Confirma la eliminaci$$HEX1$$f300$$ENDHEX$$n de Incidencia ?"
			CASE 08
				s_msg= "Confirma la actualizaci$$HEX1$$f300$$ENDHEX$$n de la fecha de alta de la Interrupci$$HEX1$$f300$$ENDHEX$$n seleccionada ?"
			CASE 09
				s_msg= "La fecha del estado %s es mayor que la fecha actual."
			CASE 10
				s_msg= "Si desea dar de alta la incidencia sobre la Salida de Baja seleccione 'SI', sino, ~nsi desea darla sobre la Acometida seleccione 'NO'."
			CASE 11
				s_msg= "Confirma la resoluci$$HEX1$$f300$$ENDHEX$$n de la Incidencia ?"
			CASE 12
				s_msg = "El Descargo solicitado por %s no ha sido aprobado, $$HEX1$$bf00$$ENDHEX$$Desea continuar?"
			CASE 13
				s_msg = "No se puede activar un descargo, hasta que no se cumpla la fecha de inicio solicitada $$HEX1$$bf00$$ENDHEX$$Desea continuar?"				
			CASE 14
				s_msg = "El Descargo solicitado por %s no tiene el estado de solicitado $$HEX2$$bf002000$$ENDHEX$$Desea continuar ?"
			CASE 15
				s_msg = "La Fecha de Reposici$$HEX1$$f300$$ENDHEX$$n es mayor que la fecha en la que debe reponer la Interrupci$$HEX1$$f300$$ENDHEX$$n. $$HEX2$$bf002000$$ENDHEX$$Desea continuar ?"
			CASE 16
				s_msg= "Confirma la finalizaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia ?"
		END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_d (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AD' //Mensajes de Aviso en Descargos	
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No se pudieron %s actualizar las Tablas."
			CASE 02
				s_msg = "El Descargo no ha sido activado.~nSe detectaron problemas cuando se generaba la Incidencia"
			CASE 03

				s_msg = "El Descargo est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado por otro Usuario."
			CASE 04
				s_msg = "El Descargo no pudo ser actualizado."
			CASE 05
				s_msg = "La fecha de fin aprobado del Descargo es mayor o igual que la fecha actual, deber$$HEX2$$e1002000$$ENDHEX$$revisar el Descargo"
			CASE 06
				s_msg = "El Descargo no pudo ser solicitado."
			CASE 07
				s_msg = "La fecha de Inicio en la solicitud del Descargo es menor o igual que la fecha actual, deber$$HEX2$$e1002000$$ENDHEX$$revisar el Descargo"
			CASE 08
				s_msg = "La Fecha en que finalizaba el Descargo es ahora menor que la fecha actual.~n El Descargo dejar$$HEX2$$e1002000$$ENDHEX$$de estar aprobado y pasar$$HEX2$$e1002000$$ENDHEX$$a estado 'No Activado'"
			CASE 09
				s_msg = "Imposible encontrar referencias de la Instalaci$$HEX1$$f300$$ENDHEX$$n o de otras Instalaciones"
			CASE 10
				s_msg = "La fecha de Aprobaci$$HEX1$$f300$$ENDHEX$$n es superior a la actual"
			CASE 11
				s_msg = "La fecha de modificaci$$HEX1$$f300$$ENDHEX$$n no debe ser nula ni superior a la del dia ni inferior a la de inicio"
			CASE 12
				s_msg = "La fecha de aprobaci$$HEX1$$f300$$ENDHEX$$n no debe ser nula ni superior a la del dia ni inferior a la de inicio"
			CASE 13
				s_msg = "La fecha de rechazo no debe ser nula ni  superior a la del dia ni inferior a la de inicio"
			CASE 14
				s_msg = "La fecha de inicio de Descargo no debe ser nula ni inferior a la del dia"
			CASE 15
				s_msg = "La fecha de fin de Descargo no debe ser nula ni inferior a la del dia"
			CASE 16
				s_msg = "La fecha de inicio de Descargo no debe ser mayor que la fecha de fin"
			CASE 17
				s_msg = "Algunas de las fechas de las Interrupciones est$$HEX1$$e100$$ENDHEX$$n nulas o son menores a la del d$$HEX1$$ed00$$ENDHEX$$a"
			CASE 18
				s_msg = "Revise las fechas de las Interrupciones, con respecto a la de los Descargos pues alguna de ellas est$$HEX2$$e1002000$$ENDHEX$$fuera de rango."
			CASE 19
				s_msg = "Se deben ingresar observaciones"
			CASE 20
				s_msg = "Imposible actualizar Interrupciones"
			CASE 21
				s_msg = "Imposible actualizar el Descargo"
			CASE 22
				s_msg = "Espere un momento. Otro Usuario est$$HEX2$$e1002000$$ENDHEX$$dando de alta un Descargo."
			CASE 23
				s_msg = "Debe introducir una fecha de inicio del Descargo"
			CASE 24
				s_msg = "Debe introducir una fecha de fin del Descargo"	
			CASE 25
				s_msg = "La fecha de fin del Descargo debe ser mayor que la fecha de inicio del mismo"	
			CASE 26
				s_msg = "La fecha de inicio del Descargo debe ser mayor que la fecha de la solicitud"
			CASE 27
				s_msg = "Debe introducir una fecha de inicio de la Interrupci$$HEX1$$f300$$ENDHEX$$n"
			CASE 28
				s_msg = "Debe introducir una fecha de fin de la Interrupci$$HEX1$$f300$$ENDHEX$$n"
			CASE 29
				s_msg = "La fecha de inicio de la Interrupci$$HEX1$$f300$$ENDHEX$$n debe ser mayor o igual que la fecha de inicio del Descargo"
			CASE 30
				s_msg = "La fecha de fin de la Interrupci$$HEX1$$f300$$ENDHEX$$n debe ser menor o igual que la fecha de fin del Descargo"
			CASE 31
				s_msg = "La fecha de fin de la Interrupci$$HEX1$$f300$$ENDHEX$$n debe ser mayor que la fecha de inicio de la misma"
			CASE 32
				s_msg = "Debe marcar una Interrupci$$HEX1$$f300$$ENDHEX$$n"
			CASE 33
				s_msg = "Debe desmarcar las Interrupciones"
			CASE 34
				s_msg = "Imposible Actualizar Descargos"
			CASE 35
				s_msg = "Ha de insertar una observaci$$HEX1$$f300$$ENDHEX$$n para la solicitud"
			CASE 36
				s_msg = "Para realizar la operaci$$HEX1$$f300$$ENDHEX$$n debe ser el propietario del Descargo"
			CASE 37
				s_msg = "Los $$HEX1$$fa00$$ENDHEX$$nicos descargos existentes son en estado finalizado y/o no activado"
			CASE 38
				s_msg = "Debe insertar una fecha de solicitud de descargo"
			CASE 39
				s_msg = "Las fechas de inicio y fin del descargo no pueden ser iguales"
			CASE 40
				s_msg = "Las fechas de inicio y fin del descargo no pueden ser menor que la fecha de solicitud del descargo"
			CASE 41
				s_msg = "La fecha de inicio de la interrupci$$HEX1$$f300$$ENDHEX$$n debe ser menor que la fecha de fin de la interrupcion"
			CASE 42
				s_msg = "La fecha de %s de la interrupci$$HEX1$$f300$$ENDHEX$$n ha de estar comprendida entre el inicio y fin del descargo"
			CASE 43
				s_msg = "No existen descargos a los que se pueda asociar"
			CASE 44
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea desagrupar el descargo ?"
			CASE 45
				s_msg = "Debe tener al menos un trabajo de BDI asociado al descargo"
			CASE 46
				s_msg = "No se pudo actualizar el estado del trabajo de BDI asociado al descargo"	
			CASE 47
				s_msg = "Ya existe un descargo en esa instalacion para ese periodo de tiempo"
			CASE 48
				s_msg = "Debe introducir las descripciones"
			CASE 49
				s_msg = "Debe introducir fechas correctas para el descargo"
			CASE 50
				s_msg = "La fecha de fin de la interrupci$$HEX1$$f300$$ENDHEX$$n  debe ser mayor que la fecha de inicio de la misma"	
			CASE 51
				s_msg = "Las fechas de inicio y fin de la interrupci$$HEX1$$f300$$ENDHEX$$n no pueden ser iguales"
			CASE 52
				s_msg = "Las fechas de inicio y fin de la interrupci$$HEX1$$f300$$ENDHEX$$n  deben estar comprendidas entre las fechas de inicio y fin del descargo"
END CHOOSE						

	CASE 'ED' //Mensajes de Error en Descargos	
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Las fechas de Solicitud del Descargo no son validas."
			CASE 02
				s_msg = "Las fechas de Solicitud del Descargo son incorrectas."
			CASE 03
				s_msg = "La Observaci$$HEX1$$f300$$ENDHEX$$n de la Solicitud es requerida."
			CASE 04
				s_msg = "Las fechas de Aprobaci$$HEX1$$f300$$ENDHEX$$n del Descargo no son correctas."
			CASE 05
				s_msg = "Error en secuencia de las fechas de Aprobaci$$HEX1$$f300$$ENDHEX$$n del Descargo."
			CASE 06
				s_msg = "La fecha de inicio de la solicitud no es valida."
			CASE 07
				s_msg = "La fecha de fin de la solicitud no es valida."
			CASE 08
				s_msg = "La fecha de solicitud no es valida."
			CASE 09
				s_msg = "La fecha final de la solicitud es menor que la fecha inicial de la solicitud."
			CASE 10
				s_msg = "La fecha final de inicio de la solicitud es menor que la fecha de solicitud."
			CASE 11
				s_msg = "La fecha final de la solicitud es menor que la fecha de la solicitud."	
			CASE 12
				s_msg = "Las fechas inicio y final de la solicitud no pueden ser iguales."
			CASE 13
				s_msg = "La observaciones de la solicitud no puede estar en blanco."
			CASE 14
				s_msg = "El inicio de la interrupcion es menor que el inicio solicitado."
			CASE 15
				s_msg = "El final de la interrupcion es mayor que el final solicitado."
			CASE 16
				s_msg = "El inicio de la interrupcion es mayor que el final de la interrupcion."
			CASE 17
				s_msg = "Las fechas de la interrupcion no pueden ser iguales."
			CASE 18
				s_msg = "La fecha final de la interrupcion no es valida."
			CASE 19
				s_msg = "Debe cumplimentar todos los datos."
			CASE 20
				s_msg = "El Descargo esta caducado."
			CASE 21
				s_msg = "M$$HEX1$$e100$$ENDHEX$$ximo valor no puede ser menor o igual que el valor inicial."
			CASE 22
				s_msg = "El valor no pude ser mayor que %s"
			CASE 23
				s_msg = "Las Banderas no pueden estar superpuestas"
			CASE 24
				s_msg = "M$$HEX1$$e100$$ENDHEX$$ximo valor no puede ser mayor que %s"
			CASE 25
				s_msg = "Solo se pueden borrar descargos en estado definido"
			CASE 26
				s_msg = "La definici$$HEX1$$f300$$ENDHEX$$n del descargo debe ser realizada como m$$HEX1$$ed00$$ENDHEX$$nimo con una antelaci$$HEX1$$f300$$ENDHEX$$n de 24 horas"
			CASE 27
				s_msg = "Existe un conflicto con alguna interrupcion superior"
			CASE 28
				s_msg = "Las duraciones de las interrupciones definidas en %s no puenden ser agrupadas excede de 6 horas"
			CASE 29
				s_msg = "Debe desmarcar las interrupciones"
			CASE 30
				s_msg = "Marque el descargo que quiere asociar"
			CASE 31
				s_msg = "El descargo no ha podido ser solicitado, debido a un problema con las instalaciones"
			CASE 32
				s_msg = "El estado del descargo ha cambiado desde el inicio de la agrupaci$$HEX1$$f300$$ENDHEX$$n"
	END CHOOSE						
	
	CASE 'CD' //Confirmaciones Descargos	
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Por el momento no es posible mostrar informaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica.~n $$HEX2$$bf002000$$ENDHEX$$Desea continuar ?"
			CASE 02
				s_msg = 	"$$HEX1$$bf00$$ENDHEX$$Da su conformidad a la modificaci$$HEX1$$f300$$ENDHEX$$n realizada por el Centro Responsable?~r~n" + &
				        	"En caso afirmativo, el Descargo pasar$$HEX2$$e1002000$$ENDHEX$$a estado de Aprobado pendiente de que se active.~r~n" + &
							"En caso contrario, el Descargo pasar$$HEX2$$e1002000$$ENDHEX$$a estado Rechazado."
			CASE 03
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea solicitar el Descargo ?"
			CASE 04
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea actualizar los Descargos ?"
			CASE 05
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea borrar el descargo ?"
			CASE 06
				s_msg = "Refrescando datos de descargos"
	END CHOOSE			
		
END CHOOSE

return s_msg
end function

public function string f_mensaje_o (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

CASE 'AO'  //Avisos de $$HEX1$$f300$$ENDHEX$$rdenes de trabajo.
	CHOOSE CASE pi_num
		   case 01
				s_msg="La brigada %s est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otra estaci$$HEX1$$f300$$ENDHEX$$n" 
			case 02
				s_msg="La brigada %s est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otro usuario"
			case 03
				s_msg="%s"
			case 04
				s_msg="Las Brigadas/Contratas deber$$HEX1$$e100$$ENDHEX$$n tener Fecha de Inicio de Tareas"
			case 05
				s_msg = "No se puede desasignar la brigada de la OT en la que se encuentra trabajando debido a que es la $$HEX1$$fa00$$ENDHEX$$nica trabaja en ella"
	END CHOOSE		
	
  CASE 'EO'   // Errores de OT's(consulta)
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "El Rango establecido para F. Inicio no es correcto"
			CASE 02 
				s_msg = "El Rango establecido para F. Fin no es correcto"
			CASE 03
				s_msg = "Existen fechas erroneas"
			CASE 04
				s_msg = "La brigada ya se encuentra trabajando en la OT"
			CASE 05
				s_msg = "No se puede desasignar la brigada seleccionada de la OT"
			CASE 06
				s_msg = "Se ha producido un error a la hora de asociar la brigada a la OT"
			END CHOOSE	

	CASE 'CO'   // Confirmaci$$HEX1$$f300$$ENDHEX$$n de acciones en OT's(consulta)
		CHOOSE CASE pi_num
			CASE 01 
				s_msg = "Esta opci$$HEX1$$f300$$ENDHEX$$n Finalizar$$HEX2$$e1002000$$ENDHEX$$la OT y el trabajo de todas las brigadas que se encuentren en ella trabajando.$$HEX1$$bf00$$ENDHEX$$Desea continuar con esta operaci$$HEX1$$f300$$ENDHEX$$n?"
		
	END CHOOSE			
END CHOOSE

return s_msg
end function

public function string f_mensaje_b (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AB'   // avisos BDG
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Para poder graficar debe actualizar los datos seg$$HEX1$$fa00$$ENDHEX$$n los criterios de filtro seleccionados."		
			CASE 02
				s_msg = "No existen datos para este criterio de selecci$$HEX1$$f300$$ENDHEX$$n."		
			CASE 03
				s_msg = "Debe ingresar un periodo valido"
		END CHOOSE
	
	CASE 'CB'	// confirmaciones BDG
		CHOOSE CASE pi_num
			CASE 01
		      s_msg = "Si cambia el Indicador, perder$$HEX2$$e1002000$$ENDHEX$$los cambios realizados.~n $$HEX2$$bf002000$$ENDHEX$$A$$HEX1$$fa00$$ENDHEX$$n as$$HEX2$$ed002000$$ENDHEX$$quiere salvar ?"
			CASE 02
		      s_msg = "Por favor, confirme las siguientes modificaciones"
		END CHOOSE			
	
	CASE 'EB'	// Errores <Oracle> desde <C> y errores BDG
		CHOOSE CASE pi_num
			CASE 01
				s_msg = " " //La cadena se incluir$$HEX2$$e1002000$$ENDHEX$$desde funci$$HEX1$$f300$$ENDHEX$$n C.
			CASE 02
				s_msg = "Instalaci$$HEX1$$f300$$ENDHEX$$n padre no ha sido encontrada."
		END CHOOSE
	
END CHOOSE

return s_msg
end function

public function string f_mensaje_m (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'CM'   // confirmacion de base de datos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Confirma los Datos ?"
			CASE 02
				s_msg = "Este Brigadista est$$HEX2$$e1002000$$ENDHEX$$asignado a una Brigada. $$HEX2$$bf002000$$ENDHEX$$Desea desasignarlo ?"
			CASE 03
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Confirma la Eliminaci$$HEX1$$f300$$ENDHEX$$n del Brigadista ?"
			CASE 04
				s_msg = "Existen Cambios sin Grabar,  $$HEX2$$bf002000$$ENDHEX$$Desea hacerlo ?"
			CASE 05
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro que desea Eliminar el Registro ?"
			CASE 06
				s_msg = "La operaci$$HEX1$$f300$$ENDHEX$$n de actualizar la Red puede ser costosa, $$HEX2$$bf002000$$ENDHEX$$desea continuar ?"
			CASE 07
				s_msg = "Confirma la baja de la Instalaci$$HEX1$$f300$$ENDHEX$$n: ~n~n%s"
			CASE 08
				s_msg = "A la Acometida: %s, no se le puede cambiar la alimentaci$$HEX1$$f300$$ENDHEX$$n, $$HEX2$$bf002000$$ENDHEX$$desea continuar con la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 09
				s_msg = "Asociar las acometidas seleccionadas puede ser costoso, $$HEX2$$bf002000$$ENDHEX$$desea continuar con la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 10
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Verifica la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 11
				s_msg = "Este brigadista ya est$$HEX2$$e1002000$$ENDHEX$$trabajando en otra Brigada. $$HEX1$$bf00$$ENDHEX$$Desea incorporarle a esta Brigada?"
			CASE 12
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Est$$HEX2$$e1002000$$ENDHEX$$seguro de que quiere eliminar esta Tarea?"
			CASE 13
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Desea conservar los cambios realizados?"
			CASE 14
				s_msg = "Asociar la acometida seleccionada puede ser costoso, $$HEX2$$bf002000$$ENDHEX$$desea continuar con la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 15
				s_msg = "La consulta de clientes importantes a nivel de %s puede ser costoso, $$HEX2$$bf002000$$ENDHEX$$desea continuar con la operaci$$HEX1$$f300$$ENDHEX$$n ?"
			CASE 16
				s_msg = "Este horario se solapa con uno previamente defenido. $$HEX1$$bf00$$ENDHEX$$Desea solapar horarios?"
			CASE 17
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Confirma la eliminaci$$HEX1$$f300$$ENDHEX$$n del calendario para esta brigada en los d$$HEX1$$ed00$$ENDHEX$$as marcados?"
			CASE 18
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Confirma la eliminaci$$HEX1$$f300$$ENDHEX$$n del d$$HEX1$$ed00$$ENDHEX$$a festivo?"
		END CHOOSE
	
	CASE 'AM'   // Avisos mantenimiento de base de datos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Para dar un alta de una instalaci$$HEX1$$f300$$ENDHEX$$n primero debe seleccionar la instalaci$$HEX1$$f300$$ENDHEX$$n que la va a alimentar."
			CASE 02
				s_msg = "El $$HEX1$$fa00$$ENDHEX$$ltimo nivel de instalaci$$HEX1$$f300$$ENDHEX$$n existente es el de 'Salida de Baja'."
			CASE 03
				s_msg = "Esta Brigada tiene una Orden de Trabajo asignada. Solo puede asignarle o desasignarle Brigadistas."
			CASE 04
				s_msg = "Debe seleccionar una Instalaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 05
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no tiene ning$$HEX1$$fa00$$ENDHEX$$n Suministro Importante."
			CASE 06
				s_msg = "Debe seleccionar un Brigadista"
			CASE 07
				s_msg = "No se puede completar la operaci$$HEX1$$f300$$ENDHEX$$n debido a que existe una Incidencia Pendiente sobre la Instalaci$$HEX1$$f300$$ENDHEX$$n: ~n~n~t%s"
			CASE 08
				s_msg = "No se puede efectuar la baja debido a que existen instalaciones alimentadas por la Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada."
		 	CASE 09
				s_msg = "No se puede efectuar la baja debido a que existen suministros alimentados por la Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 10
				s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada ya fue dada de baja."
			CASE 11
				s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no puede ser modificada."
			CASE 12
				s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no puede ser dada de baja."
			CASE 13
				s_msg = "No es posible completar la operaci$$HEX1$$f300$$ENDHEX$$n debido a que la Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada est$$HEX2$$e1002000$$ENDHEX$$dada de baja."
			CASE 14
				s_msg = "No existe ninguna Acometida alimentada por la Instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 15
				s_msg = "No existe ning$$HEX1$$fa00$$ENDHEX$$n Suministro colgado de la Acometida seleccionada."
			CASE 16
				s_msg = "No existe ninguna Acometida sin alimentaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 17
				s_msg = "No existe ninguna Acometida en la Direcci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 18
				s_msg = "No existe ning$$HEX1$$fa00$$ENDHEX$$n Suministro en la Direcci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 19
				s_msg = "No se pudo actualizar la tabla 'SGD_ACOMETIDA'."
			CASE 20
				s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n %s est$$HEX2$$e1002000$$ENDHEX$$afectada por una Incidencia Pendiente."
			CASE 21
				s_msg = "No se encontraron datos."
			CASE 22
				s_msg = "Este brigadista ya es responsable de otra Brigada."
			CASE 23
				s_msg = "Este brigadista es el responsable de esta Brigada"
			CASE 24
				s_msg = "Este brigadista ya est$$HEX2$$e1002000$$ENDHEX$$trabajando en esta Brigada."
			CASE 25
				s_msg = "Este brigadista es responsable de una brigada. No puedes borrar su nombre."
			CASE 26
				s_msg = "Debe introducir un Nombre v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 27
				s_msg = "Debe introducir un Apelllido v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 28
				s_msg = "S$$HEX1$$f300$$ENDHEX$$lo se podr$$HEX1$$e100$$ENDHEX$$n consultar las incidencias en las OT's."
			CASE 29
				s_msg = "No es posible cambiarle la Prioridad a una OT en ese estado."
			CASE 30
				s_msg = "La fecha de finalizaci$$HEX1$$f300$$ENDHEX$$n de la Tarea no puede ser mayor que la fecha actual."
			CASE 31
				s_msg = "La fecha de finalizaci$$HEX1$$f300$$ENDHEX$$n de la Tarea no puede ser menor que la fecha de inicio de la misma."
			CASE 32
				s_msg = "Algunas de las fechas previstas est$$HEX1$$e100$$ENDHEX$$n con valores nulos."
			CASE 33
				s_msg = "La fecha prevista de inicio de Tarea no puede ser menor que la fecha actual."
			CASE 34  
  			   s_msg = "La fecha prevista del fin de Tarea no debe ser menor a la fecha prevista del inicio de la misma."
			CASE 35
  			   s_msg = "La fecha de inicio de Tareas no puede ser mayor que la fecha actual."
			CASE 36
  			   s_msg = "La Brigada ya esta trabajando en una Tarea u OT."
			CASE 37
  			   s_msg = "La Fecha de Inicio de Tarea no debe ser mayor que la fecha actual."
			CASE 38
  			   s_msg = "La Fecha de fin de Tarea no debe ser mayor que la fecha actual."
			CASE 39
  			   s_msg = "La Brigada se encuentra trabajando en la Tarea" 
			CASE 40
  			   s_msg = "No puede borrar una Orden de Trabajo"
			CASE 41
  			 //  s_msg = "Para gestionar esta OT deber$$HEX2$$e1002000$$ENDHEX$$hacerlo desde Incidencias."
				s_msg= "Para gestionar esta OT deber$$HEX2$$e1002000$$ENDHEX$$hacerlo desde Incidencias. Incidencia n$$HEX1$$fa00$$ENDHEX$$mero: %s" // GNU 4-5-2006. Mejora: 1/339429
			CASE 42
  			   s_msg = "La fecha de resoluci$$HEX1$$f300$$ENDHEX$$n de la Tarea no puede ser menor a la fecha de generaci$$HEX1$$f300$$ENDHEX$$n de la misma"
			CASE 43
  			   s_msg = "La fecha de fin de Tareas es incorrecta."
		   CASE 44
  			   s_msg = "No se encontraron Ordenes de Trabajo."
			CASE 45
  			   s_msg = "%s"	
			CASE 46
  			   s_msg = "No existen Instalaciones para el $$HEX1$$e100$$ENDHEX$$mbito seleccionado."
			CASE 47 
				s_msg = "El mantenimiento de materiales se efect$$HEX1$$fa00$$ENDHEX$$a mediante la interfase OPEN SGT"
			CASE 48
				s_msg = "No fue posible insertar el registro en la tabla GI_CAUSA: %s " 
		   CASE 49
				s_msg = "No se pudo actualizar el registro en la tabla GI_CAUSA"
			CASE 50
				s_msg = "No existen grupos de causas definidos"
			CASE 51
				s_msg = "No existe ninguna Acometida con alimentaci$$HEX1$$f300$$ENDHEX$$n en la Direcci$$HEX1$$f300$$ENDHEX$$n seleccionada."
			CASE 52
				s_msg = "No existe ning$$HEX1$$fa00$$ENDHEX$$n Suministro con alimentaci$$HEX1$$f300$$ENDHEX$$n en la Direcci$$HEX1$$f300$$ENDHEX$$n seleccionada."	
			CASE 53
				s_msg = "Esta brigada no tiene ninguna tarea asignada.$$HEX1$$bf00$$ENDHEX$$Desea asignarle una?"
			CASE 54 //DBE
				s_msg = "Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos de $$HEX1$$e900$$ENDHEX$$ste Informe. Necesita actualizarlos"
			CASE 55	
	         s_msg = "No ha sido posible grabar los datos en la Base de Datos. La tabla est$$HEX2$$e1002000$$ENDHEX$$completa"
			CASE 56
	         s_msg = "Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$el registro : %s . Necesita actualizar los datos"
			CASE 57
	         s_msg = "Ya existe esta descripc$$HEX1$$ed00$$ENDHEX$$on : %s "
			CASE 58
	         s_msg = "No se puede eliminar el registro : %s ~n Porque esta siendo utilizado en el sistema. Tabla %s1 "
			CASE 59 	
            s_msg = "Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$el Alcance : %s . Necesita actualizar los datos"
			CASE 60 	
            s_msg = "Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$el Tipo de Aviso : %s . Necesita actualizar los datos"
			CASE 61
				s_msg = "Esta brigada no tiene ninguna tarea asignada."	
			CASE 62
				s_msg = "No se encontr$$HEX2$$f3002000$$ENDHEX$$ninguna instalaci$$HEX1$$f300$$ENDHEX$$n en la red."	
			CASE 63
				s_msg = "No se encontraron datos para esa instalaci$$HEX1$$f300$$ENDHEX$$n."
			CASE 64
				s_msg = "Existe un brigadista con esos datos"
			CASE 65
				s_msg = "Para gestionar una Tarea deber$$HEX2$$e1002000$$ENDHEX$$hacerlo desde Brigadas"
			CASE 66
				s_msg = "No se han recuperado datos por referencia"
			CASE 67
				s_msg = "Las fechas de las interrupciones deben estar comprendidas entre las fechas de inicio y fin del descargo"
			CASE 68
				s_msg = "Ya existe un descargo con ese identificador"
		END CHOOSE
	
	CASE 'EM'   // Errores mantenimiento de base de datos
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No se pueden eliminar Brigadas que hayan estado asignadas a una Orden de Trabajo."
			CASE 02
				s_msg = "No se puede agregar una Brigada si se seleccion$$HEX2$$f3002000$$ENDHEX$$Puesto = Todos."
			CASE 03
				s_msg = "Debe ingresar un Nombre v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 04
				s_msg = "Debe ingresar un Apellido v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 05
				s_msg = "Debe ingresar un Apellido v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 06
				s_msg = "Debe ingresar un N$$HEX1$$fa00$$ENDHEX$$mero de Contratado v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 07
				s_msg = "Debe ingresar un Tipo de Documento correcto."
			CASE 08
				s_msg = "Debe ingresar un Documento de Identidad correcto."
			CASE 09
				s_msg = "Debe ingresar un Pa$$HEX1$$ed00$$ENDHEX$$s correcto."
			CASE 10
				s_msg = "No existe ninguna instalaci$$HEX1$$f300$$ENDHEX$$n del tipo seleccionado; zona,cmd y sector seleccionados o del usuario, cuyo nombre comience con: ~n~n~t'%s' "
			CASE 11
				s_msg = "No se pudo tomar el n$$HEX1$$fa00$$ENDHEX$$mero correlativo de instalaci$$HEX1$$f300$$ENDHEX$$n de la tabla 't_ultimo'."
			CASE 12
				s_msg = "Error al intentar actualizar un registro en la tabla 't_ultimo' con el nro. de instalaci$$HEX1$$f300$$ENDHEX$$n nuevo."		
			CASE 13
				s_msg = "%s"		
			CASE 14
				s_msg = "Los Datos Ingresados son Inconsistentes."
			CASE 15
				s_msg = "No se pudo Actualizar la B.D."
			CASE 16
				s_msg = "No se pudo Insertar fila."
			CASE 17
				s_msg = "La Fecha de Expiraci$$HEX1$$f300$$ENDHEX$$n no puede ser menor que la Fecha de Inicio."
			CASE 18
				s_msg = "No se pueden ingresar fechas nulas." 
			CASE 19
				s_msg = "La Fecha ingresada en el campo Hasta no puede ser menor que la Fecha de Inicio."				
			CASE 20
				s_msg = "Ya existe este Suministro Importante."
			CASE 21
				s_msg = "Ya fue ingresado un Reporte Meteorol$$HEX1$$f300$$ENDHEX$$gico para la Fecha Seleccionada."
			CASE 22
				s_msg = "Este Brigadista esta siendo modificado por otro Usuario."
			CASE 23
				s_msg = "Este Registro est$$HEX2$$e1002000$$ENDHEX$$siendo modificado por otra Estaci$$HEX1$$f300$$ENDHEX$$n"
			CASE 24
				s_msg = "No existe ninguna instalaci$$HEX1$$f300$$ENDHEX$$n del tipo seleccionado; zona,cmd y sector seleccionados."
			CASE 25
            s_msg = "Clave Duplicada."
			CASE 26
  				s_msg = "No existe en lista."
			CASE 27
				s_msg = "No se puede dar de baja %s por tener referencias en la tabla %s1"
			CASE 28
				s_msg = "Ya existe ese n$$HEX1$$fa00$$ENDHEX$$mero de Transformador."
			CASE 29
				s_msg = "El valor de 'Finca Desde' debe ser un n$$HEX1$$fa00$$ENDHEX$$mero."
			CASE 30
				s_msg = "El valor de 'Finca Hasta' debe ser un n$$HEX1$$fa00$$ENDHEX$$mero."
			CASE 31
				s_msg = "El valor de 'Finca Desde' debe ser menor que el de 'Finca Hasta'."
			CASE 32
				s_msg = "Debe cumplimentar todos los datos requeridos"
			CASE 33
				s_msg = "Error al intentar acceder a la tabla 'suministros_imp'."		
			CASE 34
				s_msg = "Este Suministro ya est$$HEX2$$e1002000$$ENDHEX$$alimentado por la acometida seleccionada."		
			CASE 35
				s_msg = "No se pudo actualizar la tabla 'aco_sum'."		
			CASE 36
				s_msg = "No se pudo actualizar la tabla 'aco_sum' debido a que existe una incidencia que afecta a la acometida seleccionada."		
			CASE 37
				s_msg = "El Suministro %s ya est$$HEX2$$e1002000$$ENDHEX$$alimentado por la acometida seleccionada."		
			CASE 38
				s_msg = "Se debe ingresar la Calle de la Instalaci$$HEX1$$f300$$ENDHEX$$n."		
			CASE 39
				s_msg = "Se debe ingresar toda la informaci$$HEX1$$f300$$ENDHEX$$n requerida en la pantalla."		
			CASE 40
				s_msg = "Se debe ingresar un n$$HEX1$$fa00$$ENDHEX$$mero de tel$$HEX1$$e900$$ENDHEX$$fono v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 41
				s_msg = "No se puede eliminar el registro por referencias."
			CASE 42
				s_msg = "No existen Brigadistas."	
			CASE 43
				s_msg = "Las fechas no son correctas, est$$HEX1$$e100$$ENDHEX$$n solapadas."
			CASE 44
  			   s_msg = "El problema de la instalaci$$HEX1$$f300$$ENDHEX$$n fue evaluado previamente."  					 
			CASE 45
  			   s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n tiene un Descargo asociado."
			CASE 46
  			   s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n tiene Avisos pendientes."
			CASE 47
  			   s_msg = "La Instalaci$$HEX1$$f300$$ENDHEX$$n tiene Incidencias asociadas."	
			CASE 48
  			   s_msg = "Debe introducir un Nombre v$$HEX1$$e100$$ENDHEX$$lido."
			CASE 49
  			   s_msg = "Debe introducir una Propiedad v$$HEX1$$e100$$ENDHEX$$lida."
			CASE 50
  			   s_msg = "Debe introducir una Matr$$HEX1$$ed00$$ENDHEX$$cula v$$HEX1$$e100$$ENDHEX$$lida."
			CASE 51
  			   s_msg = "Debe introducir una Potencia instalada v$$HEX1$$e100$$ENDHEX$$lida."
			CASE 52
  			   s_msg = "Debe introducir una Direccion v$$HEX1$$e100$$ENDHEX$$lida."
			CASE 53
  			   s_msg = "Debe introducir Kil$$HEX1$$f300$$ENDHEX$$metros a$$HEX1$$e900$$ENDHEX$$reos y/o subterr$$HEX1$$e100$$ENDHEX$$neos v$$HEX1$$e100$$ENDHEX$$lidos"
			CASE 54
  			   s_msg = "Debe seleccionar una zona, cmd y sector valido"
      	CASE 55
  			   s_msg = "Tiene materiales asociados"
			CASE 56
				s_msg = "Codigo de la instalaci$$HEX1$$f300$$ENDHEX$$n erroneo"
			CASE 57
				s_msg = "Debe introducir de una descripci$$HEX1$$f300$$ENDHEX$$n"
			CASE 58
				s_msg = "Otro usuario acaba de dar de alta a este suministro"
		   CASE 59
				s_msg = "Error SQL al intentar grabar. ~nError SQL: %s"
			CASE 60
				s_msg = "No fue posible grabar el calendario para la brigada."
			CASE 61
				s_msg = "Es posible que otro usuario haya cambiado los datos de alguno de los d$$HEX1$$ed00$$ENDHEX$$as modificados"
			CASE 62
				s_msg = "No se han podido actualizar los datos del suministro"
			CASE 63
				s_msg = "Debe seleccionar una fila"
			CASE 64
				s_msg = "El n$$HEX1$$fa00$$ENDHEX$$mero de tel$$HEX1$$e900$$ENDHEX$$fono no est$$HEX2$$e1002000$$ENDHEX$$registrado en el sistema"
		END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_f (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'MF'   // avisos mantenimiento de ficheros
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "El fichero Seleccionado no es de Tipo Correcto"
			CASE 02 
				s_msg = "No existe archivo de Configuraci$$HEX1$$f300$$ENDHEX$$n para este Reporte"
			CASE 03 
				s_msg = "No se pudo Crear la 'Datawindow'"
			CASE 04 
				s_msg = "Imposible grabar fichero de Configuraciones"
			CASE 05 
				s_msg = "Alguna parte de la WHERE se encuentra sin datos"
		END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_p (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'AP'   // Avisos de Reportes
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "La Fecha de comienzo no debe ser mayor que la Fecha de fin."
			CASE 02 
				s_msg = "Si hay aplicada una funci$$HEX1$$f300$$ENDHEX$$n a alg$$HEX1$$fa00$$ENDHEX$$n campo, no se puede ordenar."
			CASE 03 
				s_msg = "El campo por el que intenta ordenar, no esta seleccionado."
			CASE 04 
				s_msg = "La operaci$$HEX1$$f300$$ENDHEX$$n que esta realizando sobre este campo es incorrecta."
			CASE 05 
				s_msg = "No se puede aplicar funci$$HEX1$$f300$$ENDHEX$$n cuando se ordena por alg$$HEX1$$fa00$$ENDHEX$$n campo"
			CASE 06 
				s_msg = "Sobre este campo no se puede aplicar una funci$$HEX1$$f300$$ENDHEX$$n"
			CASE 07
				s_msg = "El n$$HEX1$$fa00$$ENDHEX$$mero de clientes importantes no puede ser negativo"
			CASE 08
				s_msg = "La cantidad de potencia no puede ser negativa"
			CASE 09
				s_msg = "El informe no tiene datos que exportar"
				
		END CHOOSE

			CASE 'CP'   // Mens. Confirmaci$$HEX1$$f300$$ENDHEX$$n de Reportes
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "La operaci$$HEX1$$f300$$ENDHEX$$n que ha seleccionado puede demorarse varios minutos."
			CASE 02 
		  	   s_msg = ""
  			CASE 03
		  	   s_msg = "No se puede abrir el documento,~n~r $$HEX2$$bf002000$$ENDHEX$$Desea abrir uno nuevo ?"
			CASE 04
				s_msg = "$$HEX1$$bf00$$ENDHEX$$Sobreescribir el fichero %s ya existente?"

		END CHOOSE

		
	CASE 'EP'   // Errores de Reportes
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Error en la conexi$$HEX1$$f300$$ENDHEX$$n con la BD.~n %s"
			CASE 02 
				s_msg = "Error en la creaci$$HEX1$$f300$$ENDHEX$$n de la 'DataWindow'.~n %s"
			CASE 03 
				s_msg = "La fecha ingresada en el per$$HEX1$$ed00$$ENDHEX$$odo no es correcta.Debe ingresar una fecha v$$HEX1$$e100$$ENDHEX$$lida"	
			CASE 04
				s_msg = "No se ha podido grabar el archivo %s"
		END CHOOSE	
		
END CHOOSE

return s_msg
end function

public function string f_mensaje_c (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo
	// DSA 27/03/2000			
	CASE 'EC'   //Mens. del modulo contratas 
		CHOOSE CASE pi_num
			CASE 01				
				s_msg = "Debe ingresar los parametros del coste" 
			CASE 02
				s_msg = "Este direcci$$HEX1$$f300$$ENDHEX$$n no existe en el sistema"
			CASE 03
				s_msg = "Tipo del campo es desconocido" 
			CASE 04
				s_msg = "Debe ingresar el campo %s"
			CASE 05
				s_msg = "Debe ingresar el $$HEX1$$c100$$ENDHEX$$mbito"
			CASE 06				
				s_msg = "No se pueden eliminar Contratas que hayan estado asignadas a una Orden de Trabajo or una Tarea."				
		END CHOOSE				
	CASE 'PC'   //Mens. desde Funci$$HEX1$$f300$$ENDHEX$$n <C>.  
		CHOOSE CASE pi_num
			CASE 01
				s_msg = " " //Cadena entrada err$$HEX1$$f300$$ENDHEX$$nea
			CASE 02
				s_msg = " " //Error al reservar memoria
			CASE 03
				s_msg = " " //Operaci$$HEX1$$f300$$ENDHEX$$n inexistente
			CASE 04
				s_msg = " " //Error de par$$HEX1$$e100$$ENDHEX$$metros
			CASE 05
				s_msg = " " //Error maipulaci$$HEX1$$f300$$ENDHEX$$n fechas
			CASE 06
				s_msg = " " //Error manejo estad$$HEX1$$ed00$$ENDHEX$$sticas
			CASE 07
				s_msg = "Error en la configuraci$$HEX1$$f300$$ENDHEX$$n de las comunicaciones"
	END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_x (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

CASE 'CX'
	CHOOSE CASE pi_num
			case 01
				s_msg="Servidor Gr$$HEX1$$e100$$ENDHEX$$fico no disponible.$$HEX1$$bf00$$ENDHEX$$Desea iniciarlo?"
	END CHOOSE	
CASE 'AX'
	CHOOSE CASE pi_num
			case 01
				s_msg="Se est$$HEX2$$e1002000$$ENDHEX$$levantando un servidor gr$$HEX1$$e100$$ENDHEX$$fico, $$HEX1$$bf00$$ENDHEX$$Desea esperar ?"
			case 02
				s_msg="Espere, en unos momentos estar$$HEX2$$e1002000$$ENDHEX$$disponible el servidor grafico"
			case 03
				s_msg="Instale el fichero puerto.bat en c:\"
			case 04
				s_msg="Por el momento no es posible mostrar informacion gr$$HEX1$$e100$$ENDHEX$$fica $$HEX1$$bf00$$ENDHEX$$desea continuar?"
			case 05
				s_msg="Antes de grabar la modificaci$$HEX1$$f300$$ENDHEX$$n debe seleccionar la instalaci$$HEX1$$f300$$ENDHEX$$n padre"
			case 06
				s_msg="Debe concretar mas la zona, cmd o sector de los trabajos"
			case 07
				s_msg="Sesi$$HEX1$$f300$$ENDHEX$$n sin soporte Gr$$HEX1$$e100$$ENDHEX$$fico"
			case 08
				s_msg="No es posible conectarse con el ONIS: %s"
			case 09
				s_msg="No es posible actualizar el trabajo en el ONIS: %s"
	END CHOOSE



CASE 'EX' //Error Mens. de BDI.$$HEX2$$a0002000$$ENDHEX$$
		CHOOSE CASE pi_num
		 	CASE 01
				s_msg = "C$$HEX1$$f300$$ENDHEX$$digo de Instalaci$$HEX1$$f300$$ENDHEX$$n Erroneo " 
		 	CASE 02
				s_msg = "Debe seleccionar al menos un criterio de b$$HEX1$$fa00$$ENDHEX$$squeda" 
			 CASE 03
				s_msg = "No hay ninguna instalaci$$HEX1$$f300$$ENDHEX$$n que cumpla dichos criterios, pertenece a otro ambito o se ha marcado para borrar" 
			 CASE 04
				s_msg = "Debe seleccionar el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n" 
			CASE 05
				s_msg = "Borrado no permitido, debe hacerlo graficamente" 
			CASE 06
				s_msg = "No se pudo grabar la modificacion" 
			CASE 07
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada est$$HEX2$$e1002000$$ENDHEX$$siendo modificada por otro trabajo" 
			CASE 08
				s_msg = "Instalaci$$HEX1$$f300$$ENDHEX$$n origen Incorrecta"
			CASE 09
				 s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada tiene interrupciones pendientes" 
			CASE 10
				 s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada tiene suministros importantes pendientes" 
			CASE 11
				 s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada tiene instalaciones dependientes de ella"
			 CASE 12
				 s_msg = "La insercci$$HEX1$$f300$$ENDHEX$$n del trabajo ha producido el siguiente error: %s" 
			 CASE 13
				 s_msg = "Trabajo en estado finalizado" 
			CASE 14
				s_msg = "Debe introducir el nombre del trabajo"
			CASE 15
				s_msg = "Debe introducir la descripci$$HEX1$$f300$$ENDHEX$$n del trabajo"
			case 16 
				 s_msg="No se puede crear el objeto de usuario ONIS"
			case 17
				 s_msg="No es posible establecer la comunicaci$$HEX1$$f300$$ENDHEX$$n con el ONIS"
			case 18 
				 s_msg="Versi$$HEX1$$f300$$ENDHEX$$n del SGI sin soporte gr$$HEX1$$e100$$ENDHEX$$fico. Compruebe el OPENSGI.INI" 
 			case 19
				 s_msg="No se pudo seleccionar la instalaci$$HEX1$$f300$$ENDHEX$$n solicitada" 
  			case 20
				 s_msg="No se pudo localizar la instalaci$$HEX1$$f300$$ENDHEX$$n"
			case 21
				 s_msg="Las capas no pudieron ser cargadas"
			case 22
				 s_msg="No se pudo seleccionar la calle solicitada"
 			case 23
				 s_msg="No se puede dar de alta el trabajo"
 			case 24
				 s_msg="No se puede modificar el trabajo"
 			case 25
				 s_msg="No se termin$$HEX2$$f3002000$$ENDHEX$$el trabajo correctamente"
 			case 26
				 s_msg="Existen instalaciones que carecen de instalaci$$HEX1$$f300$$ENDHEX$$n padre"
         case 27
				 s_msg="No se pudo dar de baja el trabajo"
			case 28
				 s_msg="No se pudo realizar la acci$$HEX1$$f300$$ENDHEX$$n"
			case 29
				 s_msg="No se pudo salir del trabajo"
 			case 30
				 s_msg="Las salidas de baja tensi$$HEX1$$f300$$ENDHEX$$n tienen acometidas dependientes de ellas"
  			case 31
				 s_msg="No se pudo digitalizar la instalaci$$HEX1$$f300$$ENDHEX$$n"
			case 32
				 s_msg="No existen capas definidas"
			case 33
				 s_msg="La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada"
			case 34
				 s_msg="Instalaci$$HEX1$$f300$$ENDHEX$$n padre incorrecta"
			case 35
				 s_msg="C$$HEX1$$f300$$ENDHEX$$digo nuevo incorrecto"
			case 36 
				s_msg="No se puede bloquear la instalacion seleccionada"
			case 37
				s_msg="No se pudo mover la instalacion seleccionada"
			case 38
				s_msg="No se pudo cargar las capas"
			case 39
				s_msg="Fallo al pasar el trabajo a explotaci$$HEX1$$f300$$ENDHEX$$n"
			case 40
				s_msg="No se pueden tener activas las interfaces BDI y OPERACIONES al mismo tiempo"
				
	END CHOOSE

	CASE 'IX' //Informacion Mens. de BDI.$$HEX2$$a0002000$$ENDHEX$$
		 CHOOSE CASE pi_num
			CASE 01
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n solicitada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada" 
			CASE 02
				s_msg = "C$$HEX1$$f300$$ENDHEX$$digo de la instalaci$$HEX1$$f300$$ENDHEX$$n solicitada: %s " 
			CASE 03
				s_msg = "La salida de media seleccionada carece de tramos" 
			CASE 04
				s_msg = "La instalaci$$HEX1$$f300$$ENDHEX$$n solicitada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada" 
			CASE 05
				s_msg = "C$$HEX1$$f300$$ENDHEX$$digo de la instalaci$$HEX1$$f300$$ENDHEX$$n solicitada: %s " 
			CASE 06
				s_msg = "La linea seleccionada carece de tramos" 
			CASE 07
				s_msg = "Ventana gr$$HEX1$$e100$$ENDHEX$$fica no disponible" 
			CASE 08
				s_msg = "No se puede cerrar esta ventana sin salir del trabajo" 
			CASE 09
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Actualizar Pantalla ? Las instalaciones se han modificado" 
			 CASE 10
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea dar de alta otra instalaci$$HEX1$$f300$$ENDHEX$$n del mismo tipo ?" 
			CASE 11
				s_msg = "$$HEX2$$bf002000$$ENDHEX$$Desea finalizar el trabajo ?"
			CASE 12
				s_msg = "No hay ninguna instalaci$$HEX1$$f300$$ENDHEX$$n que cumpla dichos criterios o pertenece a otro $$HEX1$$e100$$ENDHEX$$mbito o se ha marcado para borrar"
			CASE 13
				s_msg = "El rango de fechas no puede superar 365 d$$HEX1$$ed00$$ENDHEX$$as"
					 	
	END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_z (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

CASE 'IZ'    //Mensajes informaci$$HEX1$$f300$$ENDHEX$$n de interfase con Operaci$$HEX1$$f300$$ENDHEX$$n.
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "Se ha recibido nueva informaci$$HEX1$$f300$$ENDHEX$$n de la incidencia seleccionada por parte de Operaci$$HEX1$$f300$$ENDHEX$$n.Reinicie la ventana"
		END CHOOSE
		
CASE 'EZ'    //Mensajes informaci$$HEX1$$f300$$ENDHEX$$n de interfase con Operaci$$HEX1$$f300$$ENDHEX$$n.
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No se puede comunicar con OPERACIONES"
			CASE 02
				s_msg = "No se encuentra la instalaci$$HEX1$$f300$$ENDHEX$$n afectada por la incidencia"
			CASE 03
				s_msg = "No se puede activar el servidor de comunicaci$$HEX1$$f300$$ENDHEX$$n con OPERACIONES"
			CASE 04
				s_msg = "No se puede conectar a la Base de Datos"
		END CHOOSE

		
END CHOOSE

return s_msg
end function

public function string f_mensaje_t (string ps_tipo, integer pi_num);string s_msg

CHOOSE CASE ps_tipo

	CASE 'IT' //Avisos telegestiones	
		CHOOSE CASE pi_num
			CASE 01
				s_msg = "No se encontraron Registros con los criterios seleccionados"
		END CHOOSE						
		
END CHOOSE

return s_msg
end function

on n_msg_std_sgi.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_msg_std_sgi.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


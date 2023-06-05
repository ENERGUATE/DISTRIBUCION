HA$PBExportHeader$u_sum_ct.sru
forward
global type u_sum_ct from nonvisualobject
end type
end forward

global type u_sum_ct from nonvisualobject
end type
global u_sum_ct u_sum_ct

type variables
long il_nro_instalacion, il_nro_instalacion_ant
Long il_nro_aco_ant
String is_matricula
String is_info_doc
String is_fichero = ""

Int ii_estado_sbt, ii_estado_aco
Int ii_estado_sum

datastore ids_datos_arbol1
datastore ids_datos_arbol2
datastore ids_datos_sum_ct

constant int SUM_CT_OK = 1
constant int SUM_CT_CAMBIO_CT = 2
constant int SUM_CT_SIN_CAMBIO_CT = 3
constant int SUM_CT_ASIG_NUEVO_CT = 4
constant int SUM_CT_DATOS_ALFA_ERROR = -1
constant int SUM_CT_SIN_DATOS = -2
constant int SUM_CT_ERROR_INDEFINIDO = -3



end variables

forward prototypes
public function string of_validaciones_ct ()
public function string of_obtener_datos_ct (ref string ps_nom_instalacion)
public function string of_seleccionar_fichero ()
public subroutine of_error_imporfile (long pl_error)
public function string of_validaciones_suministro (long pl_nis_rad)
public subroutine of_set_datos (string ps_matricula)
public function integer of_procesar_fichero (integer pi_tipo_fichero)
public function string of_procesar_suministro (long pl_nis_rad)
public function string of_modif_aco_sum (long pl_nis_rad)
public function string of_alta_aco_sum (long pl_nis_rad)
public function string of_obtener_nuevo_codigo (string ps_tabla, ref long pl_codigo)
public function string of_obtener_datos_aco_nueva (ref string ps_nom_instalacion)
public function string of_obtener_datos_sbt_nueva (ref string ps_nom_instalacion)
public function string of_obtener_datos_aco (ref string ps_nom_instalacion)
public function string of_obtener_datos_sbt (ref string ps_nom_instalacion)
public function string of_alta_aco ()
public function string of_alta_sbt ()
public function string of_modif_aco ()
public function string of_modif_sbt ()
public function string of_modif_matricula_sumcon (long pl_nis_rad)
public function string of_cargar_sum_fichero ()
public subroutine of_origen_sum (integer pi_tipo)
public function long of_seleccionar_sum_lista ()
public subroutine of_mostrar_resultado ()
public function string of_actualizar_cant_cli ()
end prototypes

public function string of_validaciones_ct ();String ls_retorno = ""
Int li_num
Boolean lb_correcto = TRUE

// Se comprueba que la matr$$HEX1$$ed00$$ENDHEX$$cula exista en SGD_CT, y cu$$HEX1$$e100$$ENDHEX$$ntas veces existe.
SELECT COUNT(*)
INTO :li_num
FROM SGD_CT
WHERE MATRICULA = :is_matricula AND BDI_JOB = 0;

IF SQLCA.SQLCode <> 0 THEN
	lb_correcto = FALSE
	ls_retorno = "Error de BD comprobando matr$$HEX1$$ed00$$ENDHEX$$cula: " + SQLCA.SQLErrText
ELSE
	IF li_num = 0 THEN
		ls_retorno = "La matr$$HEX1$$ed00$$ENDHEX$$cula " + is_matricula + " no existe en la tabla SGD_CT"
		lb_correcto = FALSE
	ELSEIF li_num > 1 THEN
		ls_retorno = "La matr$$HEX1$$ed00$$ENDHEX$$cula " + is_matricula + " est$$HEX2$$e1002000$$ENDHEX$$duplicada en la tabla SGD_CT"
		lb_correcto = FALSE
	ELSE
		SELECT CODIGO
		INTO :il_nro_instalacion
		FROM SGD_CT
		WHERE MATRICULA = :is_matricula AND BDI_JOB = 0;
		
		IF SQLCA.SQLCode <> 0 THEN
			lb_correcto = FALSE
			ls_retorno = "Error de BD obteniendo los datos del CT: " + SQLCA.SQLErrText
		END IF

	END IF
END IF

IF lb_correcto THEN
	// Se comprueba que la matr$$HEX1$$ed00$$ENDHEX$$cula encontrada en SGD_CT est$$HEX2$$e9002000$$ENDHEX$$asignada a la misma instalaci$$HEX1$$f300$$ENDHEX$$n en SGD_INSTALACION
	SELECT COUNT(*)
	INTO :li_num
	FROM SGD_CT, SGD_INSTALACION
	WHERE SGD_CT.MATRICULA = :is_matricula AND 
			SGD_INSTALACION.MATRICULA = :is_matricula AND 
			SGD_CT.CODIGO = SGD_INSTALACION.NRO_INSTALACION AND 
			SGD_CT.BDI_JOB = 0 AND SGD_INSTALACION.BDI_JOB = 0;
	
	IF SQLCA.SQLCode <> 0 THEN
		lb_correcto = FALSE
		ls_retorno = "Error de BD comprobando matr$$HEX1$$ed00$$ENDHEX$$cula: " + SQLCA.SQLErrText
	ELSE
		IF li_num = 0 THEN
			// Los datos de SGD_INSTALACION y SGD_CT no coinciden
			lb_correcto = FALSE
			ls_retorno = "No coincide los datos de SGD_INSTALACION y SGD_CT para el CT con matr$$HEX1$$ed00$$ENDHEX$$cula: " + SQLCA.SQLErrText
		END IF
	END IF
END IF

Return ls_retorno
end function

public function string of_obtener_datos_ct (ref string ps_nom_instalacion);String ls_nombre, ls_cod_doc, ls_info_doc
String ls_retorno = ""
Long ll_fila

is_info_doc = ""

SELECT NOMBRE,
		 COD_DOC,
		 substr(cod_doc,1,length(cod_doc)-8) || '-' || substr(cod_doc,length(cod_doc)-3,4)
INTO :ls_nombre,
	  :ls_cod_doc,
	  :ls_info_doc
FROM SGD_CT
WHERE CODIGO = :il_nro_instalacion AND BDI_JOB = 0;

IF SQLCA.SQLCode <> 0 THEN
	ls_retorno = "Se ha producido un error de BD a la hora de obtener la informaci$$HEX1$$f300$$ENDHEX$$n del CT con matr$$HEX1$$ed00$$ENDHEX$$cula " + is_matricula
ELSE
	// Se comprueba que COD_DOC tenga datos
	IF ls_cod_doc = "" OR IsNull(ls_cod_doc) THEN
		ls_retorno = "El CT con matr$$HEX1$$ed00$$ENDHEX$$cula " + is_matricula + " no tiene datos v$$HEX1$$e100$$ENDHEX$$lidos en el campo COD_DOC en SGD_CT"
	ELSE
		// Identificador que se debe propagar en las instalaciones hijas del CT
		is_info_doc = ls_info_doc
		ll_fila = ids_datos_arbol1.InsertRow(0)
		ids_datos_arbol1.SetItem(ll_fila, 'cl_nro', il_nro_instalacion)
		ids_datos_arbol1.SetItem(ll_fila, 'cs_nombre', ls_nombre)
		ids_datos_arbol1.SetItem(ll_fila, 'cs_descripcion', ls_info_doc)
		ids_datos_arbol1.SetItem(ll_fila, 'cn_tipo', fgci_tipo_ct)
		ps_nom_instalacion = ls_nombre
	END IF
END IF


return ls_retorno
end function

public function string of_seleccionar_fichero ();string ls_fullname, ls_filename
integer li_value

li_value = GetFileOpenName("Seleccione el listado de suministros", &
									+ ls_fullname, ls_filename, "", &
									+ "Text Files (*.TXT),*.TXT," &
									+ "All Files (*.*),*.*")

IF li_value = 1 THEN 
	is_fichero = ls_fullname
	Return ls_fullname
ELSE
	is_fichero = ""
	Return ""
END IF
end function

public subroutine of_error_imporfile (long pl_error);
String ls_mensaje

CHOOSE CASE pl_error
	CASE 0 
		ls_mensaje = "Error, el archivo tiene demasiados registros."
	CASE -1
		ls_mensaje = "Error, el fichero no tiene datos."
	CASE -2
		ls_mensaje = "Error, el fichero est$$HEX2$$e1002000$$ENDHEX$$vac$$HEX1$$ed00$$ENDHEX$$o."
	CASE -3
		ls_mensaje = "Error, argumento no v$$HEX1$$e100$$ENDHEX$$lido."
	CASE -4
		ls_mensaje = "Error, el fichero tiene datos no v$$HEX1$$e100$$ENDHEX$$lidos."
	CASE -5
		ls_mensaje = "Error, no se ha podido abrir el fichero."
	CASE -6
		ls_mensaje = "Error, no se ha podido cerrar el fichero."
	CASE -7
		ls_mensaje = "Error leyendo el fichero."
	CASE -8
		ls_mensaje = "El archivo no es un fichero de texto v$$HEX1$$e100$$ENDHEX$$lido."
	CASE -9
		ls_mensaje = "El archivo no tiene el formato adecuado."
	CASE -10
		ls_mensaje = "Versi$$HEX1$$f300$$ENDHEX$$n incompatible en el fichero dBase"
			
END CHOOSE

Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
end subroutine

public function string of_validaciones_suministro (long pl_nis_rad);String ls_retorno=""
Long ll_nis_rad, ll_cod_calle, ll_nif, ll_nro_aco, ll_nro_ct
String ls_est_sum
Int li_hay

il_nro_aco_ant = 0

// Se comprueba el suministro en el SGC
SELECT EST_SUM, NIF
INTO :ls_est_sum, :ll_nif
FROM SUMCON
WHERE NIS_RAD = :pl_nis_rad;

IF SQLCA.SQLCode < 0 THEN
	// Se ha producido un error en la sentencia
	ls_retorno = "Se ha producido un error a la hora de obtener los datos en SUMCON del suministro " + string(pl_nis_rad) + " ." + SQLCA.SQLErrText
	ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
ELSEIF SQLCA.SQLCode = 100 THEN
	// El suministro no est$$HEX2$$e1002000$$ENDHEX$$en la BD del SGC
	ls_retorno = "El suministro " + string(pl_nis_Rad) + " no se ha encontrado en SUMCON"
	ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
ELSE
	// Se valida el estado del suministro
	SELECT 1 
	INTO :li_hay
	FROM SGD_VALOR
	WHERE CODIF = 'E_SU' AND VALOR = :ls_est_sum;
	
	IF SQLCA.SQLCode < 0 THEN
		// Se ha producido un error en la sentencia
		ls_retorno = "Se ha producido un error a la hora de obtener los datos del estado en SGD_VALOR del suministro " + string(pl_nis_rad) + " ." + SQLCA.SQLErrText
		ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
	ELSEIF SQLCA.SQLCode = 100 THEN
		// El estado del suministro no es v$$HEX1$$e100$$ENDHEX$$lido
		ls_retorno = "El suministro " + string(pl_nis_Rad) + " tiene un estado no v$$HEX1$$e100$$ENDHEX$$lido: " + ls_est_sum
		ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
	ELSE
		// Se comprueba si est$$HEX2$$e1002000$$ENDHEX$$ya dado de alta en ACO_SUM
		SELECT NRO_ACOMETIDA 
		INTO :ll_nro_aco
		FROM ACO_SUM
		WHERE NIS_RAD = :pl_nis_Rad;

		IF SQLCA.SQLCode < 0 THEN
			// Se ha producido un error en la sentencia
			ls_retorno = "Se ha producido un error a la hora de obtener los datos en ACO_SUM del suministro " + string(pl_nis_rad) + " ." + SQLCA.SQLErrText
			ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
		ELSEIF SQLCA.SQLCode = 100 THEN
			// El suministro no est$$HEX2$$e1002000$$ENDHEX$$en ACO_SUM
			
			// Hay que comprobar los datos del suministro en FINCAS y en CALLEJERO antes de darlo de alta
			SELECT COD_CALLE 
			INTO :ll_cod_calle
			FROM FINCAS
			WHERE NIF = :ll_nif;
			
			IF SQLCA.SQLCode < 0 THEN 
				// Se ha producido un error en la sentencia
				ls_retorno = "Se ha producido un error a la hora de obtener los datos de la finca para el suministro " + string(pl_nis_rad) + " ." + SQLCA.SQLErrText
				ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
			ELSEIF SQLCA.SQLCode = 100 THEN
				// El suministro no tiene asignada una finca
				ls_retorno = "El suministro " + string(pl_nis_rad) + " no tiene asignado una finca v$$HEX1$$e100$$ENDHEX$$lida."
				ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
			ELSE
				// Se comprueba ahora la calle
				SELECT 1 
				INTO :li_hay
				FROM CALLEJERO
				WHERE COD_CALLE = :ll_cod_calle;
				
				IF SQLCA.SQLCode < 0 THEN
					// Se ha producido un error en la sentencia
					ls_retorno = "Se ha producido un error a la hora de obtener los datos de la calle para el suministro " + string(pl_nis_rad) + " ." + SQLCA.SQLErrText
					ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
				ELSEIF SQLCA.SQLCode = 100 THEN
					// No se ha encontrado un calle asociada al suministro
					ls_retorno = "El suministro " + string(pl_nis_rad) + " no tiene asignado una calle v$$HEX1$$e100$$ENDHEX$$lida."
					ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO
				ELSE
					ii_estado_sum = This.SUM_CT_SIN_DATOS				
				END IF
			END IF
	
		ELSE
			// El suministro est$$HEX2$$e1002000$$ENDHEX$$en ACO_SUM. Hay que comprobar si se pretende cambiar de CT
			il_nro_aco_ant = ll_nro_aco
			
			SELECT SGD_CT.CODIGO
			INTO :ll_nro_ct
			FROM SGD_CT
			WHERE CODIGO IN (SELECT NRO_INSTALACION
								  FROM SGD_INSTALACION
								  WHERE BDI_JOB = 0 AND ESTADO = 0 AND TIPO_INSTALACION = :fgci_tipo_ct
								  START WITH NRO_INSTALACION = (SELECT INSTALACION_ORIGEN
								  										  FROM SGD_ACOMETIDA
																		  WHERE CODIGO = :ll_nro_aco AND BDI_JOB = 0)
									CONNECT BY PRIOR NRO_INST_PADRE = NRO_INSTALACION AND BDI_JOB = 0);
			
			IF SQLCA.SQLCode = 0 THEN
				// Se ha encontrado el CT que alimenta al suministro. Se comprueba si es el mismo que el que se pretende asignar
				IF ll_nro_ct = il_nro_instalacion THEN
					// Es el mismo
					ii_estado_sum = This.SUM_CT_SIN_CAMBIO_CT
				ELSE // Es diferente
					il_nro_instalacion_ant = ll_nro_ct
					ii_estado_sum = This.SUM_CT_CAMBIO_CT
				END IF
			ELSEIF SQLCA.SQLCode = 100 THEN
				// El suministro no tiene CT
				ii_estado_sum = This.SUM_CT_ASIG_NUEVO_CT
			ELSE
				// Error
				ls_retorno = "Se ha producido un error a la hora de obtener el CT que alimenta al suministro " + string(pl_nis_rad) + " ." + SQLCA.SQLErrText
				ii_estado_sum = This.SUM_CT_ERROR_INDEFINIDO

			END IF
		END IF
	END IF

END IF

Return ls_retorno
end function

public subroutine of_set_datos (string ps_matricula);is_matricula = ps_matricula

ids_datos_arbol1.Reset()
ids_datos_arbol2.Reset()

end subroutine

public function integer of_procesar_fichero (integer pi_tipo_fichero);long ll_contador, ll_nis_rad, ll_total
String ls_obs, ls_nom_salbt, ls_nom_aco, ls_nom_ct

SetPointer(HourGlass!)

ll_total = ids_datos_sum_ct.RowCount()
IF ll_total > 0 THEN
	Open(w_barra)
	W_BARRA.uo_barra.barra.f_resetea_barra()
	W_BARRA.UO_BARRA.gb_1.text="Procesando suministros..."
	W_BARRA.UO_BARRA.BARRA.visible=true
	W_BARRA.uo_barra.barra.f_amplia(0)
END IF

FOR ll_contador = 1 TO ll_total
	ids_datos_arbol1.Reset()
	ids_datos_arbol2.Reset()
	ls_obs = ""
	IF pi_tipo_fichero = 1 THEN
		// La matr$$HEX1$$ed00$$ENDHEX$$cula est$$HEX2$$e1002000$$ENDHEX$$en el fichero.
		is_matricula = ids_datos_sum_ct.GetItemString(ll_contador, 'matricula')
	//ELSE
	//	La matr$$HEX1$$ed00$$ENDHEX$$cula la ha especificado el usuario	
	END IF
	
	ll_nis_rad = ids_datos_sum_ct.GetItemNumber(ll_contador, 'nis_rad')
	
	IF NOT IsNull(ll_nis_rad) THEN
		W_BARRA.UO_BARRA.gb_1.text="Suministro " + string(ll_nis_rad)
		ls_obs = This.of_validaciones_ct()
		IF ls_obs = "" THEN // El CT ha pasado todas las validaciones
			ls_obs = of_obtener_datos_ct(ls_nom_ct)
			IF ls_obs = "" THEN
				ls_obs = of_obtener_datos_sbt(ls_nom_salbt)
			END IF
			IF ls_obs = "" THEN
				ls_obs = of_obtener_datos_aco(ls_nom_aco)
			END IF
			IF ls_obs = "" THEN
				ls_obs = of_obtener_datos_sbt_nueva(ls_nom_salbt)
			END IF
					
			IF ls_obs = "" THEN
				ls_obs = of_obtener_datos_aco_nueva(ls_nom_aco)
			END IF
			
			IF ls_obs = "" THEN
				ls_obs = of_validaciones_suministro(ll_nis_Rad)
			END IF
			
			IF ls_obs = "" AND ii_estado_sum <> This.SUM_CT_ERROR_INDEFINIDO THEN // El suministro ha pasado todas las validaciones
			
				//ls_obs2 = This.of_procesar_suministro(ll_nis_rad)
				IF ii_estado_sbt = This.SUM_CT_SIN_DATOS THEN
					ls_obs = of_alta_sbt()
				ELSEIF ii_estado_sbt = This.SUM_CT_DATOS_ALFA_ERROR THEN
					ls_obs = of_modif_sbt()
				END IF
	
				IF ls_obs = "" THEN
					IF ii_estado_aco = This.SUM_CT_SIN_DATOS THEN
						ls_obs = of_alta_aco()
					ELSEIF ii_estado_aco = This.SUM_CT_DATOS_ALFA_ERROR THEN
						ls_obs = of_modif_aco()
					END IF
				END IF
				
				IF ls_obs = "" THEN
					ls_obs = of_procesar_suministro(ll_nis_rad)
				END IF
				
				IF ls_obs = "" THEN
					ls_obs = of_modif_matricula_sumcon(ll_nis_rad)
				END IF

				IF ls_obs = "" THEN
					ls_obs = of_actualizar_cant_cli()
				END IF
			END IF
				
	//		//IF ls_obs2 <> "" THEN // El suministro se ha procesado de manera correcta
	//			ids_datos_sum_ct.SetItem(ll_contador, 'estado', ls_obs)
	//		ELSE
	//			// Se ha producido un error al procesar el suministro
	//			ids_datos_sum_ct.SetItem(ll_contador, 'estado', ls_obs2)
	//		END IF
	//		ELSE
	//			ids_datos_sum_ct.SetItem(ll_contador, 'estado', ls_obs)
	//		END IF
	//	ELSE
	//		ids_datos_sum_ct.SetItem(ll_contador, 'estado', ls_obs)
		END IF
		IF ls_obs <> "" THEN
			ls_obs = "Suministro no procesado. " + ls_obs
			gnu_u_transaction.uf_rollback()
		ELSE 
			ls_obs = "Suministro procesado correctamente. "
			IF ii_estado_sbt = This.SUM_CT_SIN_DATOS THEN
				ls_obs += "Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n dada de alta: " + ls_nom_salbt + ". "
			END IF	
			IF ii_estado_sbt = This.SUM_CT_DATOS_ALFA_ERROR  THEN
				ls_obs += "Datos alfanum$$HEX1$$e900$$ENDHEX$$ricos corregidos en la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n asociada al suministro. "
			END IF
			IF ii_estado_aco = This.SUM_CT_SIN_DATOS THEN
				ls_obs += "Acometida dada de alta: " + ls_nom_aco + ". "
			END IF	
			IF ii_estado_aco = This.SUM_CT_DATOS_ALFA_ERROR  THEN
				ls_obs += "Datos alfanum$$HEX1$$e900$$ENDHEX$$ricos corregidos en la Acometida asociada al suministro. "
			END IF
			IF ii_estado_sum = This.SUM_CT_SIN_DATOS THEN
				ls_obs += "Suministro dado de alta en ACO_SUM. "
			END IF
			IF ii_estado_sum = This.SUM_CT_CAMBIO_CT THEN
				ls_obs += "El suministro ha cambiado de CT. "
			END IF
			IF ii_estado_sum = This.SUM_CT_ASIG_NUEVO_CT THEN
				ls_obs += "El suministro ha sido conectado con el CT especificado. "
			END IF
			IF ii_estado_sum = This.SUM_CT_SIN_CAMBIO_CT THEN
				ls_obs += "No se han modificado los datos del suministro porque el CT seleccionado es el mismo que lo alimentaba. "
			END IF

			gnu_u_transaction.uf_commit()
		END IF
		ids_datos_sum_ct.SetItem(ll_contador, 'estado', ls_obs)
	END IF
	W_BARRA.uo_barra.barra.f_amplia((ll_contador * 100) / ll_total)
NEXT

IF is_fichero <> "" THEN
	IF ids_datos_sum_ct.SaveAs(is_fichero, Text!, TRUE) = -1 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Se ha producido un error a la hora de actualizar el fichero " + is_fichero + " con el resultado del proceso")
	END IF
END IF

IF ll_total > 0 THEN
	Close(w_barra)
END IF


SetPointer(Arrow!)

return 1

end function

public function string of_procesar_suministro (long pl_nis_rad);String ls_retorno = ""

IF ii_estado_sum = This.SUM_CT_CAMBIO_CT OR ii_estado_sum = This.SUM_CT_ASIG_NUEVO_CT THEN
	return of_modif_aco_sum(pl_nis_rad)
ELSEIF ii_estado_sum = This.SUM_CT_SIN_DATOS THEN
	return of_alta_aco_sum(pl_nis_rad)
END IF

Return ls_Retorno
end function

public function string of_modif_aco_sum (long pl_nis_rad);String ls_retorno = ""
Long ll_aco, ll_fila

ll_fila = ids_datos_arbol2.Find('cn_tipo=' + string(fgci_tipo_acometida), 1, ids_datos_arbol2.RowCount())


IF ll_fila > 0 THEN
	ll_aco = ids_datos_arbol2.GetItemNumber(ll_fila, 'cl_nro')
	
	UPDATE ACO_SUM
	SET NRO_ACOMETIDA = :ll_aco,
		 USUARIO = :gs_usuario,
		 PROGRAMA = 'CLTEINSTAL',
		 F_ACTUAL = SYSDATE
	WHERE NIS_RAD = :pl_nis_Rad;
	
	IF SQLCA.SQLCode < 0 THEN
		// Error en la actualizaci$$HEX1$$f300$$ENDHEX$$n
		ls_retorno = "Error al actualizar la acometida del suministro " + string(pl_nis_rad) + " en ACO_SUM. " + SQLCA.SQLErrText 
	END IF
ELSE
	ls_retorno = "No se ha podido obtener la acometida para el suministro " + string(pl_nis_rad)
END IF

Return ls_retorno
end function

public function string of_alta_aco_sum (long pl_nis_rad);String ls_retorno = ""
Long ll_aco, ll_fila
Int li_hay

ll_fila = ids_datos_arbol2.Find('cn_tipo=' + string(fgci_tipo_acometida), 1, ids_datos_arbol2.RowCount())


IF ll_fila > 0 THEN
	ll_aco = ids_datos_arbol2.GetItemNumber(ll_fila, 'cl_nro')

	INSERT INTO ACO_SUM
	(	 NRO_ACOMETIDA,
		 USUARIO,
		 F_ACTUAL,
		 H_ACTUAL,
		 PROGRAMA,
		 NIS_RAD,
		 POT_CONTRATADA,
		 COD_CALLE,
		 COD_DEPTO,
		 COD_LOC,
		 COD_PROV,
		 COD_MUNIC,
		 NUM_PUERTA,
		 DUPLICADOR,
		 KWH,
		 CGV_SUM,
		 NIF,
		 TIP_CLIENTE,
		 KWH_FACT,
		 REF_DIR)
	(SELECT :ll_aco,
			  :gs_usuario,
			  sysdate,
			  sysdate,
			  'CLTEINSTAL',
			  SUMCON.NIS_RAD,
			  SUMCON.POT,
			  CALLEJERO.COD_CALLE,
			  CALLEJERO.COD_DEPTO,   
			  CALLEJERO.COD_LOCAL,   
			  CALLEJERO.COD_PROV,    
			  CALLEJERO.COD_MUNIC,
			  FINCAS.NUM_PUERTA,
			  FINCAS.DUPLICADOR,
			  0,
			  SUMCON.CGV_SUM,
			  SUMCON.NIF,
			  CLIENTES.TIP_CLI,
			  0,
			  FINCAS.REF_DIR
	 FROM SUMCON, CALLEJERO, CLIENTES, FINCAS
	 WHERE SUMCON.NIS_RAD = :pl_nis_rad AND
			 SUMCON.NIF = FINCAS.NIF AND
			 FINCAS.COD_CALLE = CALLEJERO.COD_CALLE AND
			 SUMCON.COD_CLI = CLIENTES.COD_CLI);
			 
	IF SQLCA.SQLCode <> 0 THEN
		// Error en el insert
		ls_retorno = "Error al insertar el registro en ACO_SUM para el suministro " + string(pl_nis_rad) + ". " + SQLCA.SQLErrText 
	ELSE
		// Se comprueba que el suministro haya sido dado de alta
		SELECT 1 
		INTO :li_hay
		FROM ACO_SUM
		WHERE NIS_RAD = :pl_nis_rad;
		
		IF SQLCA.SQLCode < 0 THEN // Error de BD
			ls_retorno = "Error al comprobar el registro insertado en ACO_SUM para el suministro " + string(pl_nis_rad) + ". " + SQLCA.SQLErrText 
		ELSEIF SQLCA.SQLCode = 100 THEN // No se ha insertado registro. 
			ls_retorno = "No se ha podido insertar en ACO_SUM el suministro " + string(pl_nis_rad) + ". Compruebe que los datos de las tablas CLIENTES, FINCAS y CALLEJERO para ese suministro son correctos."
		END IF
	END IF
ELSE
	ls_retorno = "No se ha podido obtener la acometida para el suministro " + string(pl_nis_rad)
END IF
			
Return ls_retorno

end function

public function string of_obtener_nuevo_codigo (string ps_tabla, ref long pl_codigo);Long ll_codigo
String ls_mensaje = ""

SELECT CODIGO + 1
INTO :ll_codigo
FROM SGD_CODIGOS
WHERE UPPER(NOMBRE) = :ps_tabla;

IF SQLCA.SQLCode = 0 THEN
	UPDATE SGD_CODIGOS
	SET CODIGO = :ll_codigo
	WHERE UPPER(NOMBRE) = :ps_tabla;
	
	IF SQLCA.SQLCode = 0 THEN
		//gnu_u_transaction.uf_commit()
		pl_codigo = ll_codigo
	ELSE
		ls_mensaje = "Se ha producido un error a la hora de actualizar el c$$HEX1$$f300$$ENDHEX$$digo de instalaci$$HEX1$$f300$$ENDHEX$$n para la tabla " + ps_tabla + " ." + SQLCA.SQLErrText

	END IF
ELSE
	ls_mensaje = "Se ha producido un error a la hora de obtener un nuevo c$$HEX1$$f300$$ENDHEX$$digo de instalaci$$HEX1$$f300$$ENDHEX$$n para la tabla " + ps_tabla + " ." + SQLCA.SQLErrText

END IF

return ls_mensaje
end function

public function string of_obtener_datos_aco_nueva (ref string ps_nom_instalacion);String ls_nombre, ls_retorno=""
long ll_pos, ll_fila, ll_codigo = 0, ll_codigo_sbt


ll_fila = ids_datos_arbol1.Find("cn_tipo=" + string(fgci_tipo_acometida), 1, ids_datos_arbol1.RowCount())

IF (ii_estado_aco = This.SUM_CT_DATOS_ALFA_ERROR OR ii_estado_aco = This.SUM_CT_OK) &
	AND ll_fila > 0 THEN
	ls_nombre = ids_datos_arbol1.GetItemString(ll_fila, 'cs_nombre')
	
	IF ii_estado_aco <> This.SUM_CT_OK THEN
		// Se debe modificar el nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n
		ll_pos = Pos(ls_nombre, '(')
		IF ll_pos > 0 THEN
			ls_nombre = Left(ls_nombre, ll_pos - 1)
		END IF
	
		ls_nombre += '(' + is_info_doc +')'
	END IF
	
	ll_pos = ids_datos_arbol2.insertRow(0)
	ids_datos_arbol2.SetItem(ll_pos, 'cl_nro' , ids_datos_arbol1.GetItemNumber(ll_fila, 'cl_nro'))
	ids_datos_arbol2.SetItem(ll_pos, 'cl_padre' , ids_datos_arbol1.GetItemNumber(ll_fila, 'cl_padre'))
	ids_datos_arbol2.SetItem(ll_pos, 'cs_nombre' , ls_nombre)
	ids_datos_arbol2.SetItem(ll_pos, 'cn_tipo' , fgci_tipo_acometida)
	
	ps_nom_instalacion = ls_nombre
	
ELSEIF ii_estado_aco = This.SUM_CT_SIN_DATOS THEN
	// Se debe dar de alta una nueva ACO
	ls_retorno = This.of_obtener_nuevo_codigo('SGD_ACOMETIDA', ll_codigo)
	
	IF ll_codigo > 0 THEN
		ls_nombre = 'AC' + Right(string(ll_codigo),5) + "  (" + is_info_doc + ")" 
		ll_fila = ids_datos_arbol2.insertRow(0)
		
		IF ii_estado_sbt = This.SUM_CT_OK THEN
			ll_pos = ids_datos_arbol1.Find("cn_tipo=" + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol2.RowCount())
		ELSE
			ll_pos = ids_datos_arbol2.Find("cn_tipo=" + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol2.RowCount())
		END IF
		
		IF ll_pos > 0 THEN // Existe SBT padre
			ids_datos_arbol2.SetItem(ll_fila, 'cl_nro' , ll_codigo)
			ids_datos_arbol2.SetItem(ll_fila, 'cl_padre' , ids_datos_arbol2.GetItemNumber(ll_pos, 'cl_nro'))
			ids_datos_arbol2.SetItem(ll_fila, 'cs_nombre' , ls_nombre)
			ids_datos_arbol2.SetItem(ll_fila, 'cn_tipo' , fgci_tipo_acometida)
			
			ps_nom_instalacion = ls_nombre
		
		ELSE
			ls_retorno = "No se ha encontrado una SBT v$$HEX1$$e100$$ENDHEX$$lida"
		END IF
	
	END IF
	
END IF

return ls_retorno
end function

public function string of_obtener_datos_sbt_nueva (ref string ps_nom_instalacion);String ls_nombre, ls_retorno = ""
long ll_pos, ll_fila, ll_codigo
Int li_retorno = 1

ll_fila = ids_datos_arbol1.Find("cn_tipo=" + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol1.RowCount())

IF (ii_estado_sbt = This.SUM_CT_DATOS_ALFA_ERROR OR ii_estado_sbt = This.SUM_CT_OK ) &
	AND ll_fila > 0 THEN
	
	ls_nombre = ids_datos_arbol1.GetItemString(ll_fila, 'cs_nombre')
	
	IF ii_estado_sbt <> This.SUM_CT_OK THEN
		// Se debe modificar el nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n
		ll_pos = Pos(ls_nombre, '(')
		IF ll_pos > 0 THEN
			ls_nombre = Left(ls_nombre, ll_pos - 1)
		END IF
	
		ls_nombre += '(' + is_info_doc +')'
	END IF
	
	ll_pos = ids_datos_arbol2.insertRow(0)
	ids_datos_arbol2.SetItem(ll_pos, 'cl_nro' , ids_datos_arbol1.GetItemNumber(ll_fila, 'cl_nro'))
	ids_datos_arbol2.SetItem(ll_pos, 'cl_padre' , ids_datos_arbol1.GetItemNumber(ll_fila, 'cl_padre'))
	ids_datos_arbol2.SetItem(ll_pos, 'cs_nombre' , ls_nombre)
	ids_datos_arbol2.SetItem(ll_pos, 'cn_tipo' , fgci_tipo_salida_de_baja)
	
	ps_nom_instalacion = ls_nombre
	
ELSEIF ii_estado_sbt = This.SUM_CT_SIN_DATOS THEN
	// Se debe dar de alta una nueva SBT
	ls_retorno = This.of_obtener_nuevo_codigo('SGD_SALBT', ll_codigo)
	IF ll_codigo > 0 THEN
		ls_nombre = 'SB' + Right(string(ll_codigo),5) + "  (" + is_info_doc + ")" 
		ll_fila = ids_datos_arbol2.insertRow(0)
		ids_datos_arbol2.SetItem(ll_fila, 'cl_nro' , ll_codigo)
		ids_datos_arbol2.SetItem(ll_fila, 'cl_padre' , il_nro_instalacion)
		ids_datos_arbol2.SetItem(ll_fila, 'cs_nombre' , ls_nombre)
		ids_datos_arbol2.SetItem(ll_fila, 'cn_tipo' , fgci_tipo_salida_de_baja)
		
		ps_nom_instalacion = ls_nombre
	END IF
	
END IF

return ls_retorno
end function

public function string of_obtener_datos_aco (ref string ps_nom_instalacion);String ls_nombre, ls_retorno = ""
Long ll_codigo_sbt, ll_codigo, ll_fila
int li_alfa_correcta

// Se obtiene el c$$HEX1$$f300$$ENDHEX$$digo SBT en caso de que exista
IF ii_estado_sbt = This.SUM_CT_OK OR ii_estado_sbt = This.SUM_CT_DATOS_ALFA_ERROR THEN
	ll_fila = ids_datos_arbol1.Find('cn_tipo=' + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol1.RowCount() )
	IF ll_fila > 0 THEN
		ll_codigo_sbt = ids_datos_arbol1.GetItemNumber(ll_fila, 'cl_nro') 
		SELECT DESCRIPCION,
				 CODIGO,
		 		 INSTR(DESCRIPCION, '(' || :is_info_doc || ')' )
		INTO :ls_nombre,
			  :ll_codigo,
			  :li_alfa_correcta
		FROM SGD_ACOMETIDA
		WHERE INSTALACION_ORIGEN = :ll_codigo_sbt AND BDI_JOB = 0 AND ROWNUM = 1;
		
		IF SQLCA.SQLCode <> 0 THEN
			IF SQLCA.SQLCode = 100 THEN
				ii_estado_aco = This.SUM_CT_SIN_DATOS
			ELSE
				ls_retorno = "Se ha producido un error a la hora de obtener los datos de la acometida: " + SQLCA.SQLErrText
				ii_estado_aco = This.SUM_CT_ERROR_INDEFINIDO
			END IF
		ELSE
			// Se comprueba la informaci$$HEX1$$f300$$ENDHEX$$n alfanum$$HEX1$$e900$$ENDHEX$$rica, en concreto si en el nombre figura el parte del COD_DOC del CT
			IF li_alfa_correcta > 0 THEN
				ii_estado_aco = This.SUM_CT_OK
			ELSE
				ii_estado_aco = This.SUM_CT_DATOS_ALFA_ERROR
			END IF
		END IF
		
		IF ii_estado_aco = This.SUM_CT_OK OR ii_Estado_aco = This.SUM_CT_DATOS_ALFA_ERROR THEN
			ll_fila = ids_datos_arbol1.InsertRow(0)
			ids_datos_arbol1.SetItem(ll_fila, 'cl_nro', ll_codigo)
			ids_datos_arbol1.SetItem(ll_fila, 'cl_padre', ll_codigo_sbt)
			ids_datos_arbol1.SetItem(ll_fila, 'cs_nombre', ls_nombre)
			ids_datos_arbol1.SetItem(ll_fila, 'cs_descripcion', is_info_doc)
			ids_datos_arbol1.SetItem(ll_fila, 'cn_tipo', fgci_tipo_acometida)
			ps_nom_instalacion = ls_nombre
		END IF

	ELSE
		ii_estado_aco = This.SUM_CT_SIN_DATOS
	END IF
ELSE
	ii_estado_aco = This.SUM_CT_SIN_DATOS
END IF
	
return ls_retorno

end function

public function string of_obtener_datos_sbt (ref string ps_nom_instalacion);String ls_nombre
Long ll_codigo, ll_fila
int li_alfa_correcta
String ls_retorno = ""

SELECT NOMBRE,
		 CODIGO,
		 INSTR(NOMBRE, '(' || :is_info_doc || ')' )
INTO :ls_nombre,
	  :ll_codigo,
	  :li_alfa_correcta
FROM SGD_SALBT
WHERE INSTALACION_ORIGEN = :il_nro_instalacion AND BDI_JOB = 0 AND ROWNUM = 1;

IF SQLCA.SQLCode <> 0 THEN
	IF SQLCA.SQLCode = 100 THEN
		ii_estado_sbt = This.SUM_CT_SIN_DATOS
	ELSE
		ii_estado_sbt = This.SUM_CT_ERROR_INDEFINIDO
	END IF
ELSE
	// Se comprueba la informaci$$HEX1$$f300$$ENDHEX$$n alfanum$$HEX1$$e900$$ENDHEX$$rica, en concreto si en el nombre figura el parte del COD_DOC del CT
	IF li_alfa_correcta > 0 THEN
		ii_estado_sbt = This.SUM_CT_OK
	ELSE
		//ls_retorno = "Se ha producido un error a la hora de obtener los datos de la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n: " + SQLCA.SQLErrText
		ii_estado_sbt = This.SUM_CT_DATOS_ALFA_ERROR
	END IF
END IF
IF ii_estado_sbt = This.SUM_CT_OK OR ii_Estado_sbt = This.SUM_CT_DATOS_ALFA_ERROR THEN
	ll_fila = ids_datos_arbol1.InsertRow(0)
	ids_datos_arbol1.SetItem(ll_fila, 'cl_nro', ll_codigo)
	ids_datos_arbol1.SetItem(ll_fila, 'cl_padre', il_nro_instalacion)
	ids_datos_arbol1.SetItem(ll_fila, 'cs_nombre', ls_nombre)
	ids_datos_arbol1.SetItem(ll_fila, 'cs_descripcion', is_info_doc)
	ids_datos_arbol1.SetItem(ll_fila, 'cn_tipo', fgci_tipo_salida_de_baja)
	ps_nom_instalacion = ls_nombre
END IF

return ls_retorno

end function

public function string of_alta_aco ();String ls_nombre, ls_retorno = ""
Long ll_codigo_salbt, ll_fila, ll_codigo

ll_fila = ids_datos_arbol2.Find("cn_tipo=" + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol2.RowCount())

IF ll_fila > 0 THEN
	ll_codigo_salbt = ids_datos_arbol2.GetitemNumber(ll_fila, 'cl_nro')
	
	ll_fila = ids_datos_arbol2.Find("cn_tipo=" + string(fgci_tipo_acometida), 1, ids_datos_arbol2.RowCount())
	ll_codigo = ids_datos_arbol2.GetitemNumber(ll_fila, 'cl_nro')
	
	IF ll_fila > 0 THEN
		ls_nombre = ids_datos_arbol2.GetitemString(ll_fila, 'cs_nombre')
		
		INSERT INTO SGD_ACOMETIDA 
		( USUARIO, 
		  F_ACTUAL, 
		  PROGRAMA, 
		  INSTALACION_ORIGEN, 
		  CODIGO, 
		  BDI_JOB,
		  POT_CONTRATADA, 
		  KWH, 
		  NIF, 
		  CANT_CLI, 
		  COD_CALLE, 
		  COD_DEPTO, 
		  COD_LOC, 
		  COD_PROV, 
		  COD_MUNIC, 
		  NUM_PUERTA,
		  DESCRIPCION, 
		  DUPLICADOR, 
		  KWH_FACT, 
		  NRO_CENTRO, 
		  NRO_CMD, 
		  NRO_MESA, 
		  CANT_CLIENTES_IMP, 
		  PROPIEDAD,
		  POTENCIA_MAX, 
		  ESTA_EN, 
		  ESTA_EN1, 
		  LONGITUD, 
		  TENSION, 
		  TIP_PROTECCION, 
		  TIP_ACOMETIDA, 
		  REF_DIR,
		  CLASS_ID, 
		  STATFLG, 
		  NRO_ACO_SUM, 
		  TIPO_CONEXION, 
		  CLAVE_HORIZONTAL,
		  ONIS_VER, 
		  ONIS_STAT) 
		(SELECT :gs_usuario,  	 		/* USUARIO */
					sysdate,					/* F_ACTUAL */
					'CAMPA?AS',				/* PROGRAMA */
					:ll_codigo_salbt,		/* INSTALACION_ORIGEN */
					:ll_codigo,				/* CODIGO */
					0, 						/* BDI_JOB */
					0, 						/* POT_CONTRATADA */
					0, 						/* KWH */
					0, 						/* NIF */
					0, 						/* CANT_CLI */
					0,							/* COD_CALLE */
					COD_DEPTO,				/* COD_DEPTO */
					COD_LOCAL,				/* COD_LOC */
					COD_PROV,				/* COD_PROV */
					COD_MUNIC,				/* COD_MUNIC */
					0,							/* NUM_PUERTA */
					:ls_nombre,				/* DESCRIPCION */
					' ',						/* DUPLICADOR */
					0,							/* KWH_FACT */
					NRO_CENTRO,				/* NRO_CENTRO */
					NRO_CMD,					/* NRO_CMD */
					NRO_MESA,				/* NRO_MESA */
					0,							/* CANT_CLIENTES_IMP */
					PROPIEDAD,				/* PROPIEDAD */
					0,							/* POTENCIA_MAX */
					:ll_codigo_salbt,		/* ESTA_EN */
					NULL,						/* ESTA_EN1 */
					0,							/* LONGITUD */
					0,							/* TENSION */
					' ',						/* TIP_PROTECCION */
					' ',						/* TIP_ACOMETIDA */	
					NULL,						/* REF_DIR */
					17,						/* CLASS_ID */
					0,							/* STATFLG */
					0,							/* NRO_ACO_SUM */
					NULL,						/* TIPO_CONEXION */
					NULL,						/* CLAVE_HORIZONTAL */
					'0',						/* CLAVE PRINCIPAL */
					'0'						/* ESTADO */
			FROM SGD_CT WHERE CODIGO = :il_nro_instalacion AND BDI_JOB = 0);
		
		IF SQLCA.SQLCode <> 0 THEN
			ls_retorno = "Se ha producido un error a la hora de dar de alta la acometida: " + SQLCA.SQLErrText
		END IF
	ELSE		
		ls_retorno = "Imposible de determinar la acometida"
	END IF
ELSE 
	ls_retorno = "Imposible de determinar la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
END IF

Return ls_retorno


end function

public function string of_alta_sbt ();String ls_nombre, ls_retorno = ""
Long ll_codigo_salbt, ll_fila

ll_fila = ids_datos_arbol2.Find("cn_tipo=" + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol2.RowCount())

IF ll_fila > 0 THEN
	ls_nombre = ids_datos_arbol2.GetitemString(ll_fila, 'cs_nombre')
	ll_codigo_salbt = ids_datos_arbol2.GetitemNumber(ll_fila, 'cl_nro')
	
	INSERT INTO SGD_SALBT 
	( STATFLG, 
	  BDI_JOB, 
	  DESCRIPCION, 
	  MATRICULA, 
	  TENSION, 
	  CLASS_ID, 
	  TIP_SAL,
	  ESTA_EN, 
	  INSTALACION_ORIGEN, 
	  TIPO_COND, 
	  CANT_CLIENTES, 
	  CANT_CLIENTES_IMP, 
	  POTENCIA_CONTRATADA,
	  NOMBRE, 
	  PROPIEDAD, 
	  COD_TRAFO, 
	  CODIGO, 
	  NRO_CENTRO, 
	  NRO_CMD, 
	  NRO_MESA, 
	  USUARIO, 
	  F_ACTUAL, 
	  PROGRAMA,
	  SIMBOLOS_ESQ, 
	  TIPO_AREA, 
	  TIPO_CONEXION, 
	  CANT_CLI_AN, 
	  CANT_CLI_BN, 
	  CANT_CLI_CN, 
	  CANT_CLI_A1N,
	  CANT_CLI_B1N, 
	  CANT_CLI_C1N, 
	  CANT_CLI_AB, 
	  CANT_CLI_AC, 
	  CANT_CLI_BC, 
	  CANT_CLI_ABC, 
	  CANT_CLI_DESC,
	  SEC_FASE ) 
	(SELECT 0, 						/* STATFLG */
			 0,  						/* BDI_JOB */
			 NULL,   				/* DESCRIPCION */
			 NULL,   				/* MATRICULA */
			 NULL,   				/* TENSION */
			 15, 						/* CLASS_ID */
			 NULL,					/* TIPO_SAL */
			 CODIGO,					/* ESTA_EN */
			 CODIGO, 				/* INSTALACION_ORIGEN */
			 NULL,					/* TIPO_COND */ 
			 0, 						/* CANT_CLIENTES */
			 0,						/* CANT_CLIENTES_IMP */ 
			 NULL,					/* POTENCIA_CONTRATADA */
			 :ls_nombre,			/* NOMBRE */
			 PROPIEDAD,				/* PROPIEDAD */
			 CODIGO,					/* COD_TRAFO */
			 :ll_codigo_salbt,	/* CODIGO */
			 NRO_CENTRO,			/* NRO_CENTRO */
			 NRO_CMD,				/* NRO_CMD */
			 NRO_MESA,				/* NRO_MESA */
			 :gs_usuario,			/* USUARIO */
			 SYSDATE,				/* F_ACTUAL */
			 'CAMPA?AS', 			/* PROGRAMA */
			 NULL, 					/* SIMBOLOS_ESQ */
			 NULL, 					/* TIPO_AREA */
			 NULL, 					/* TIPO_CONEXION */
			 NULL, 					/* CANT_CLI_AN */
			 NULL, 					/* CANT_CLI_BN */
			 NULL, 					/* CANT_CLI_CN */
			 NULL, 					/* CANT_CLI_A1N */
			 NULL, 					/* CANT_CLI_B1N */ 
			 NULL, 					/* CANT_CLI_C1N */
			 NULL, 					/* CANT_CLI_AB */
			 NULL, 					/* CANT_CLI_AC */
			 NULL, 					/* CANT_CLI_BC */ 
			 NULL, 					/* CANT_CLI_ABC */
			 0, 						/* CANT_CLI_DESC */
			 NULL						/* SEC_FASE */
	FROM SGD_CT WHERE CODIGO = :il_nro_instalacion AND BDI_JOB = 0);
	
	IF SQLCA.SQLCode <> 0 THEN
		ls_retorno = "Se ha producido un error a la hora de insertar la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n: " + SQLCA.SQLErrText
	END IF
	
ELSE 
	ls_retorno = "Imposible de determinar la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
END IF

return ls_retorno
end function

public function string of_modif_aco ();String ls_nombre, ls_retorno = ""
Long ll_codigo, ll_fila

ll_fila = ids_datos_arbol2.Find("cn_tipo=" + string(fgci_tipo_acometida), 1, ids_datos_arbol2.RowCount())

IF ll_fila > 0 THEN
	ll_codigo = ids_datos_arbol2.GetitemNumber(ll_fila, 'cl_nro')
	ls_nombre = ids_datos_arbol2.GetitemString(ll_fila, 'cs_nombre')
		
	UPDATE SGD_ACOMETIDA 
	SET DESCRIPCION = :ls_nombre,
		 USUARIO = :gs_usuario,
		 PROGRAMA = 'CLTEINSTAL',
		 F_ACTUAL = SYSDATE
	WHERE CODIGO = :ll_codigo AND BDI_JOB = 0;
	
	IF SQLCA.SQLCode <> 0 THEN
		ls_retorno = "Se ha producido un error a la hora de actualizar los datos de la Acometida: " + SQLCA.SQLErrText
	END IF
ELSE
	ls_retorno = "No se ha podido determinar la acometida"
END IF

Return ls_retorno
end function

public function string of_modif_sbt ();String ls_nombre, ls_retorno = ""
Long ll_codigo, ll_fila

ll_fila = ids_datos_arbol2.Find("cn_tipo=" + string(fgci_tipo_salida_de_baja), 1, ids_datos_arbol2.RowCount())

IF ll_fila > 0 THEN
	ll_codigo = ids_datos_arbol2.GetitemNumber(ll_fila, 'cl_nro')
	ls_nombre = ids_datos_arbol2.GetitemString(ll_fila, 'cs_nombre')
		
	UPDATE SGD_SALBT
	SET NOMBRE = :ls_nombre,
		USUARIO = :gs_usuario,
		PROGRAMA = 'CLTEINSTAL',
		F_ACTUAL = SYSDATE
	WHERE CODIGO = :ll_codigo AND BDI_JOB = 0;
	
	IF SQLCA.SQLCode <> 0 THEN
		ls_retorno = "Se ha producido un error a la hora de actualizar los datos de la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n: " + SQLCA.SQLErrText
	END IF
ELSE
	ls_retorno = "No se ha podido determinar la Salida de Baja Tensi$$HEX1$$f300$$ENDHEX$$n"
END IF

Return ls_retorno
end function

public function string of_modif_matricula_sumcon (long pl_nis_rad);String ls_retorno = ""

// Se a$$HEX1$$f100$$ENDHEX$$ade la matr$$HEX1$$ed00$$ENDHEX$$cula del CT que alimenta al suministro en el campo USR_VARCHAR2 de SUMCON

IF ii_estado_sum <> This.SUM_CT_SIN_CAMBIO_CT AND &
	ii_estado_sum <> This.SUM_CT_ERROR_INDEFINIDO THEN

	UPDATE SUMCON
	SET USR_VARCHAR2 = :is_matricula
	WHERE NIS_RAD = :pl_nis_rad;
	
	IF SQLCA.SQLCode <> 0 THEN
		ls_retorno = "Se ha producido un error al actualizar la matr$$HEX1$$ed00$$ENDHEX$$cula de CT en SUMCON para el suministro " + string(pl_nis_rad) + ". " + SQLCA.SQLErrText
	END IF
END IF

Return ls_retorno

end function

public function string of_cargar_sum_fichero ();String ls_nom_fichero="", ls_nis
Long ll_ret

ls_nom_fichero = This.of_seleccionar_fichero()
IF ls_nom_fichero <> "" THEN
	ids_datos_sum_ct.Reset()
	ll_ret = ids_datos_sum_ct.ImportFile(ls_nom_fichero,2)
	IF ll_ret <= 0 THEN
		This.of_error_imporfile(ll_ret)
		ls_nom_fichero = ""
	ELSE // Se comprueba si el nis_rad tiene 7 d$$HEX1$$ed00$$ENDHEX$$gitos
		IF ids_datos_sum_ct.RowCount() > 0 THEN
			ls_nis = String(ids_datos_sum_ct.GetItemNumber(1, 'nis_rad'))
			IF Len(ls_nis) <> 7 THEN
				Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El fichero no tiene el formato adecuado. El nis_rad no tiene 7 d$$HEX1$$ed00$$ENDHEX$$gitos. El primer nis_rad encontrado es " + ls_nis)
				ids_datos_sum_ct.Reset()
				ls_nom_fichero = ""
			END IF
		END IF
	END IF

END IF

return ls_nom_fichero 
end function

public subroutine of_origen_sum (integer pi_tipo);ids_datos_sum_ct.Reset()

IF pi_tipo = 1 THEN
	ids_datos_sum_ct.dataobject = 'd_listado_asig_sum_ct'
ELSE
	ids_datos_sum_ct.dataobject = 'd_listado_asig_sum'
END IF
end subroutine

public function long of_seleccionar_sum_lista ();OpenWithParm(w_sel_sum_sin_alim, ids_datos_sum_ct)
is_fichero = ""


Return ids_datos_sum_ct.RowCount()

end function

public subroutine of_mostrar_resultado ();OpenWithParm(w_asig_alim_sum_ct_result, ids_datos_sum_ct)
end subroutine

public function string of_actualizar_cant_cli ();String ls_retorno = ""
Long ll_nro_aco, ll_fila

// Actualizaci$$HEX1$$f300$$ENDHEX$$n de SGD_CT

// Esta parte la realiza un trigger definido en Guatemala. En el resto de los pa$$HEX1$$ed00$$ENDHEX$$ses se actualiza la cantidad de clientes
IF gi_pais <> 2 THEN

	IF ii_estado_sum <> This.SUM_CT_SIN_CAMBIO_CT AND ii_estado_sum <> This.SUM_CT_ERROR_INDEFINIDO THEN

		UPDATE SGD_CT
		SET CANT_CLIENTES = NVL(CANT_CLIENTES,0) + 1
		WHERE CODIGO = :il_nro_instalacion AND BDI_JOB = 0;
		
		IF SQLCA.SQLCode <> 0 THEN
			ls_retorno = "Se ha producido un error al actualizar la cantidad de clientes en SGD_CT para la instalaci$$HEX1$$f300$$ENDHEX$$n " + string(il_nro_instalacion)
		END IF
	
	END IF

	IF ls_retorno = "" THEN
		IF ii_estado_sum = This.SUM_CT_CAMBIO_CT THEN
			UPDATE SGD_CT
			SET CANT_CLIENTES = DECODE(NVL(CANT_CLIENTES, 0), 0, 1, CANT_CLIENTES ) - 1
			WHERE CODIGO = :il_nro_instalacion_ant AND BDI_JOB = 0;
			
			IF SQLCA.SQLCode <> 0 THEN
				ls_retorno = "Se ha producido un error al actualizar la cantidad de clientes en SGD_CT para la antigua instalaci$$HEX1$$f300$$ENDHEX$$n " + string(il_nro_instalacion)
			END IF
			
		END IF
	END IF
END IF

// Actualizaci$$HEX1$$f300$$ENDHEX$$n de SGD_ACOMETIDA
IF ls_retorno = "" THEN
	IF ii_estado_sum <> This.SUM_CT_SIN_CAMBIO_CT AND ii_estado_sum <> This.SUM_CT_ERROR_INDEFINIDO THEN
		
		ll_fila = ids_datos_arbol2.Find('cn_tipo=' + string(fgci_tipo_acometida), 1, ids_datos_arbol2.RowCount())
	
		IF ll_fila > 0 THEN
			ll_nro_aco = ids_datos_arbol2.GetItemNumber(ll_fila, 'cl_nro')

			UPDATE SGD_ACOMETIDA
			SET CANT_CLI = NVL(CANT_CLI,0) + 1
			WHERE CODIGO = :ll_nro_aco AND BDI_JOB = 0 ;
		
			IF SQLCA.SQLCode <> 0 THEN
				ls_retorno = "Se ha producido un error al actualizar la cantidad de clientes en SGD_ACOMETIDA para la acometida " + string(ll_nro_aco)
			END IF
		ELSE
			ls_retorno = "No se ha podido determinar la acometida que alimenta al suministro."
		END IF
	END IF
END IF

IF ls_retorno = "" THEN
	IF ii_estado_sum = This.SUM_CT_CAMBIO_CT THEN
		UPDATE SGD_ACOMETIDA
		SET CANT_CLI = DECODE(NVL(CANT_CLI, 0), 0, 1, CANT_CLI) - 1
		WHERE CODIGO = :il_nro_aco_ant AND BDI_JOB = 0 ;
	
		IF SQLCA.SQLCode <> 0 THEN
			ls_retorno = "Se ha producido un error al actualizar la cantidad de clientes en SGD_ACOMETIDA para la acometida " + string(ll_nro_aco)
		END IF
	END IF
END IF

Return ls_retorno
end function

on u_sum_ct.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_sum_ct.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_datos_arbol1 = CREATE datastore
ids_datos_arbol2 = CREATE datastore
ids_datos_sum_ct = CREATE datastore

ids_datos_arbol1.dataobject = 'd_2120_datos_arbol'
ids_datos_arbol2.dataobject = 'd_2120_datos_arbol'


end event

event destructor;DESTROY ids_datos_arbol1
DESTROY ids_datos_arbol2
DESTROY ids_datos_sum_ct
end event


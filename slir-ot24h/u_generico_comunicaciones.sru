HA$PBExportHeader$u_generico_comunicaciones.sru
forward
global type u_generico_comunicaciones from nonvisualobject
end type
type sw_win_estandar from structure within u_generico_comunicaciones
end type
type sw_control_ventanas from structure within u_generico_comunicaciones
end type
end forward

type sw_win_estandar from structure
	integer		x
	integer		y
	integer		width
	integer		heigth
	string		fondo
	string		borde
	string		color
	string		programa_llamante
	window		w_llamante
	string		accion_llamada
	string		accion_retorno
	string		programa_retorno
	integer		intval1
	integer		intval2
	integer		intval3
	integer		intval4
	integer		intval5
	integer		intval6
	integer		intval7
	integer		intval8
	integer		intval9
	integer		intval10
	integer		intval11
	long		longval1
	long		longval2
	long		longval3
	long		longval4
	long		longval5
	string		strval1
	string		strval2
	string		strval3
	string		strval4
	string		strval5
	string		strval6
	string		strval7
	string		strval8
	string		strval9
	string		strval10
	datetime		datval1
	datetime		datval2
	decimal {0}	decval1
	decimal {0}	decval2
	datetime		datval3
	transaction		sqlpp
	decimal {0}	decval3
	decimal {0}	decval4
	datawindow		datawindow1
	integer		w_llamada_forma
	window		w_llamada
	integer		w_llamante_forma
end type

type sw_control_ventanas from structure
    window ventana_a_abrir
    integer ventana_a_abrir_forma
    long ventana_a_abrir_puntero
    window ventana_llamante
    integer ventana_llamante_forma
    long ventana_llamante_puntero
    string ventana_a_abrir_nombre
end type

global type u_generico_comunicaciones from nonvisualobject
end type
global u_generico_comunicaciones u_generico_comunicaciones

type variables
sw_win_estandar is_comunic
string etiqueta
sw_control_ventanas is_control[7]
window iw_ventana
int ii_posicion
int ii_ultima_posicion
window pepe
window iw_p_ventana
window iw_p_padre
string is_nombre
string is_forma
string is_retorno
integer il_modo
string response_pendientes[]
end variables

forward prototypes
public function integer f_cargar_estructura (string ps_programa_llamante, string ps_accion_llamada, string ps_accion_retorno, string ps_programa_retorno)
public function integer f_cambiar_etiquetas (ref datawindow dw)
public function string f_titulo_ventana (string ps_nombre, string ps_condicion)
public function boolean fnu_evaluar_apertura (string ps_nombre)
public function integer fnu_activar_ventana_response ()
public function STRING fnu_obtener_response_activa ()
public function STRING fnu_obtener_response_activa_ante ()
public function boolean fnu_puede_cerrar (window pw_ventana)
public function integer fnu_cambiar_modo (integer pi_modo, string ps_response_activa, string ps_response_activa_ante, window pw_ventana)
public function integer fnu_deshabilitar_ventanas (window p_principal, string p_accion, window p_ventana)
public function boolean fnu_cargar_vector (window pw_ventana, integer pw_modo, window pw_ventana_padre, string ps_nombre)
public function boolean fnu_cargar_vector_open (window pw_ventana, string ps_nombre)
public function integer fnu_abrir (ref window pw_ventana, string ps_nombre, integer ps_forma, integer ps_modo, ref window pw_padre, string ps_retorno)
public function integer fnu_volver_llamante (long pl_puntero)
end prototypes

public function integer f_cargar_estructura (string ps_programa_llamante, string ps_accion_llamada, string ps_accion_retorno, string ps_programa_retorno);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_cargar_estructura
// 
// Objetivo: Carga estructuras de comunicaciones.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_programa_llamante, ps_accion_llamada, ps_accion_retorno, ps_programa_retorno
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

is_comunic.programa_llamante	= ps_programa_llamante
is_comunic.accion_llamada 		= ps_accion_llamada
is_comunic.accion_retorno 		= ps_accion_retorno
is_comunic.programa_retorno	= ps_programa_retorno
RETURN 1
end function

public function integer f_cambiar_etiquetas (ref datawindow dw);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_cambiar_etiquetas 
//
// Objetivo: Cambia las etiquetas...
//	 
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

//if gi_idioma = "Espa$$HEX1$$f100$$ENDHEX$$ol" then
//
//	if g_pais = "Uruguay" then
//
//		// Como esta
//	end if
//end if
//
//if g_idioma = "Ingles" then
//	if g_pais = "Kenya" then
//		
//				dw.modify("tipo_instalacion_t.text =   'Installation Type:'") 
//				dw.modify("nombre_instalacion_t.text = 'Installation Name:'")
//		
//
//		dw.modify("tipo_instalacion_t.text = 'Installation Type:'") 
//		dw.modify("nombre_instalacion_t.text = 'Installation Name:'")
//	end if
//end if

return 1


	
end function

public function string f_titulo_ventana (string ps_nombre, string ps_condicion);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_titulo_ventana
// 
// Objetivo: Cambia los t$$HEX1$$ed00$$ENDHEX$$tulos de las ventanas seg$$HEX1$$fa00$$ENDHEX$$n acci$$HEX1$$f300$$ENDHEX$$n llamada.
//	
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: ps_nombre, ps_condicion
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE ps_nombre

CASE "iw_1233"
		if ps_condicion = "Consulta" then
			return "OPEN SGI - Consulta de Avisos"
		else
			if ps_condicion = "Seleccion" then
				return "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Avisos"
			else
				if ps_condicion = "Listado" then
					return "OPEN SGI - Listado de Avisos"
				end if
			end if
		end if 

CASE "w_1234" 
		IF ps_condicion ="Consulta" THEN
			return "OPEN SGI - Consulta de Incidencias"
		ELSE
			IF ps_condicion="Seleccion" THEN
				return "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Incidencias"
			ELSE
				return "OPEN SGI - Listado de Incidencias"
			END IF
		END IF
		

CASE "w_2033"
		if ps_condicion="Situacion" THEN
			return "OPEN SGI - Situaci$$HEX1$$f300$$ENDHEX$$n Actual del Centro Responsable"
		end if
	CASE "w_2270"
		if ps_condicion="Consulta" THEN
			return "OPEN SGI - Consulta de Brigadas"
		else 
			return "OPEN SGI - Mantenimiento de Brigadas"
		end if
	CASE "iw_1230"
		if ps_condicion = "con_avi_ayu_pen" then
			return "Consulta de Avisos de Ayuda Pendientes"
		end if

CASE "iw_2120"
		if ps_condicion = "Seleccion" then
			return "Selecci$$HEX1$$f300$$ENDHEX$$n de Instalacion"
		end if

CASE "w_1210"
		if ps_condicion = "Int.Horario" then
			return "OPEN SGI - Avisos Ingresados por Intervalo Horario"
		end if

CASE "iw_2102"

		If ps_condicion = "Seleccion" then 
			return "Seleccion de Incidencias"
		end if

		if ps_condicion = "Actualizacion" then
			return  " Alta y Actualizaci$$HEX1$$f300$$ENDHEX$$n de Incidencias"
		end if

		if ps_condicion = "Consulta" then
			return "Consulta de Incidencias"
		end if

CASE "iw_6201"
		IF ps_condicion = "Alta"	THEN
			return  "OPEN SGI - Generaci$$HEX1$$f300$$ENDHEX$$n de Orden de Trabajo"
		END IF
		IF ps_condicion = "Modificacion"	THEN
			return  "OPEN SGI - Modificaci$$HEX1$$f300$$ENDHEX$$n de Orden de Trabajo"		
		END IF
		IF ps_condicion = "Consulta" THEN
			return  "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n de Orden de Trabajo"		
		END IF

//TDA - EDM -14
CASE "iw_1201"
		if ps_condicion = "Ing.Aviso" then
			return "Ingreso de Avisos"
		end if

CASE "iw_1203"
		IF ps_condicion = "Inf.Aviso"	THEN
			return  "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n del Aviso"
		END IF

CASE "w_at0113"
		if ps_condicion = "Ident.Cliente" then
			return "OPEN SGI - Identificaci$$HEX1$$f300$$ENDHEX$$n del Cliente"
		end if

CASE "w_id0100"
		IF ps_condicion = "Ident.Geografica"	THEN
			return  "Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica"
		END IF

CASE "w_id0104"
		if ps_condicion = "ListaCalles" then
			//***************************************
			//**  OSGI 2001.1  	06/04/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	06/04/2001  			return "OPEN SGI - Listado de Calles de la Localidad"
			return "OPEN SGI - Listado de Calles de la " + fg_geografica('4', 'Localidad')
			//***************************************
			//**  OSGI 2001.1  	06/04/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		end if

CASE "w_id01041"
		IF ps_condicion = "ListaCalles2"	THEN
			//***************************************
			//**  OSGI 2001.1  	06/04/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	06/04/2001  			return  "OPEN SGI - Listado de Calles de la Localidad"
			return  "OPEN SGI - Listado de Calles de la " + fg_geografica('4', 'Localidad')
			//***************************************
			//**  OSGI 2001.1  	06/04/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		END IF

CASE "w_id0105"
		IF ps_condicion = "ListaInmuebles"	THEN
			return  "OPEN SGI - Listado de Inmuebles de la Calle"
		END IF

CASE "w_id0106"
		if ps_condicion = "ListaSuministros" then
			return "OPEN SGI - Listado de Suministros del Inmueble"
		end if

CASE "w_re0500_ss"
		IF ps_condicion = "Cli.Suministros"	THEN
			return  "OPEN SGI - Listado de Suministros del Cliente"
		END IF

CASE "w_1109"
		IF ps_condicion = "Doc.Clientes"	THEN
			return  "OPEN SGI - Listado de Clientes por Documento"
		END IF

CASE "w_1105"
		IF ps_condicion = "Gest.Avisos"	THEN
			return  "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Avisos Pendientes"
		END IF

CASE "W_1104"
		IF ps_condicion = "Listado de Ordenes" THEN
			return "OPEN SGI - Listado de Ordenes de Servicio"
		END IF

CASE "w_2120"
		IF ps_condicion = "Ident.Instalacion"	THEN
			return  "OPEN SGI - Listado de Instalaciones"
		END IF
		IF ps_condicion = "Sel.Instalacion" THEN
			return "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Instalaciones"
		END IF

CASE "w_2201"
		IF ps_condicion = "Jerarq.Interrup."	THEN
			return  "OPEN SGI - Mantenimiento de Interrupciones"
		END IF

CASE "w_3201"
		IF ps_condicion = "Jerarq.Instalac."	THEN
			return  "OPEN SGI - Mantenimiento de Instalaciones"
		END IF

CASE "w_2303"
		IF ps_condicion="Sum. Import." THEN
			return "OPEN SGI - Suministros Importantes"
		END IF

CASE "w_2307"
		IF ps_condicion="List.Aviso." THEN
			return "OPEN SGI - Avisos Asociados a la Incidencia "
		END IF

CASE "w_2309"
		IF ps_condicion="React_avisos." THEN
			//AHM (10/06/2009) Mejora 1/353285
			return "OPEN SGI - Reactivaci$$HEX1$$f300$$ENDHEX$$n de Avisos "
		END IF

CASE "w_2305"
		return "OPEN SGI - Acciones"
		

CASE "w_2030"
		If ps_condicion="Estadistica" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas de Avisos"
		END IF

CASE "w_3105"
		If ps_condicion="Asig.Brig." THEN
			return "OPEN SGI - Trabajos Asignados a las Brigadas"
		END IF

CASE "w_1108"
		If ps_condicion="List.Incid." THEN
			return "OPEN SGI - Incidencias que Pueden Afectar al Servicio"
		END IF

CASE "w_1207"
		If ps_condicion="Form.Orden." THEN
			return "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n de la Orden de Corte"
		END IF

CASE "w_1209"
		If ps_condicion="Info.Incid." THEN
			return "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n de la Incidencia"
		END IF

CASE "w_1501"
		If ps_condicion="Impre.Aviso." THEN
			return "OPEN-SGI  Impresi$$HEX1$$f300$$ENDHEX$$n de Avisos"
		END IF

CASE "w_2034"
		If ps_condicion="Aviso.Telefon." THEN
			return "OPEN SGI - Control de Telefonistas"
		END IF

CASE "w_1est"
		If ps_condicion="Estad.Zonas." THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas de Zonas Geogr$$HEX1$$e100$$ENDHEX$$ficas"
		END IF

CASE "w_5"
		If ps_condicion="Inc_Relevant" THEN
			return "OPEN SGI - Incidencias m$$HEX1$$e100$$ENDHEX$$s Relevantes"
		END IF

CASE "w_2000"
		If ps_condicion="Operac." THEN
			return "OPEN SGI - Sistema de Gesti$$HEX1$$f300$$ENDHEX$$n de Incidencias"
		END IF

CASE "w_2102"
		If ps_condicion="Seleccion." THEN
			return "OPEN SGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Incidencias"
		END IF

CASE "w_2102"
		If ps_condicion="List.Brig." THEN
			return "OPEN SGI - Consulta de Brigadas por Centro"
		END IF

CASE "w_2301"
		If ps_condicion="Info.Incid." THEN
			return "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n de Incidencia"
		END IF

CASE "w_2038"
		If ps_condicion="List.Incid." THEN
			return "OPEN SGI - Listado de Incidencias"
		END IF

CASE "w_2302"
		If ps_condicion="Observ." THEN
			return "OPEN SGI - Observaciones"
		END IF

CASE "w_2303"
		return "OPEN SGI - Suministros Importantes"

CASE "w_2304"
		If ps_condicion="Situ.Clima." THEN
			return "OPEN SGI - Reporte Climatol$$HEX1$$f300$$ENDHEX$$gico"
		END IF

CASE "w_2306"
		If ps_condicion="Cuadrilla" THEN
			return "OPEN SGI - Brigadas"
		END IF

CASE "w_2307"
		If ps_condicion="List.Aviso." THEN
			return "OPEN SGI - Listado de Avisos"
		END IF

CASE "w_2308"
		If ps_condicion="Mante.Inci." THEN
			return "OPEN SGI - Seguimiento de Incidencias"
		END IF

CASE "w_2104"
		If ps_condicion="Mantenim.Instalac." THEN
			return "OPEN SGI - Mantenimiento de Instalaciones y Estructura de la Red"
		END IF

CASE "w_2240"
		If ps_condicion="Brigadist.Asignados" THEN
			return "OPEN SGI - Brigadistas Asignados a la Incidencia"
		END IF

CASE "w_3101"
		If ps_condicion="Mantenim.Suminist." THEN
			return "OPEN SGI - Mantenimiento de Suministros Importantes"
		END IF

CASE "w_3203"
		If ps_condicion="Consulta.Suministro" THEN
			return "OPEN SGI - Consulta de Suministros Importantes"
		END IF

CASE "w_3204"
		If ps_condicion="Ingreso.Situacion.Clima" THEN
			return "OPEN SGI - Formulario de Ingreso de Situaciones Climatol$$HEX1$$f300$$ENDHEX$$gicas"
		END IF

CASE "w_3205"
		If ps_condicion="Suministr.Import." THEN
			return "OPEN SGI - Suministros Importantes"
		END IF

CASE "w_3206"
		If ps_condicion="observ." THEN
			return "OPEN SGI - Observaci$$HEX1$$f300$$ENDHEX$$n"
		END IF

CASE "w_arran_oper"
		If ps_condicion="sist_gest_incid" THEN
			return "OPEN SGI - SISTEMA DE GESTION DE INCIDENCIAS"
		END IF

CASE "w_arran_telegest"
		If ps_condicion="Sist.Gest.Incid." THEN
			return "OPEN SGI - SISTEMA DE GESTION DE INCIDENCIAS"
		END IF

CASE "w_oper"
		If ps_condicion="Modul_oper" THEN
			return "OPEN SGI -  M$$HEX1$$f300$$ENDHEX$$dulo de Operaciones"
		END IF

CASE "w_3201_clima"
		If ps_condicion="Report_clima" THEN
			return "OPEN SGI - Reportes Climatol$$HEX1$$f300$$ENDHEX$$gicos"
		END IF

CASE "w_prin"
		If ps_condicion="Telegest." THEN
			return "OPEN SGI - M$$HEX1$$f300$$ENDHEX$$dulo de Telegestiones"
		END IF

CASE "w_3202"
		If ps_condicion="Consult_Suminist." THEN
			return "OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n de Suministros Importantes"
		END IF

CASE "w_3201_Brig"
		If ps_condicion="Mantenim_Brig" THEN
			return "OPEN SGI - Mantenimiento de Brigadistas"
		END IF

CASE "w_3107"
		IF ps_condicion="Lista.Mante.Instalac." THEN
			RETURN "OPEN SGI - Mantenimiento de Instalaciones"
		ELSEIF ps_condicion="List.Aviso." THEN
			RETURN "OPEN SGI - Listado de Avisos"
		END IF

CASE "w_3108"
		IF ps_condicion="Form.Mante.Trafos" THEN
			RETURN "OPEN SGI - Mantenimiento de Transformadores"
		END IF

CASE "w_3111"
		IF ps_condicion="Form.Mante.Aco." THEN
			RETURN "OPEN SGI - Mantenimiento de Acometidas por Direcci$$HEX1$$f300$$ENDHEX$$n"
		ELSEIF ps_condicion="Form.Cons.Aco." THEN
			RETURN "OPEN SGI - Listado de Acometidas por Direcci$$HEX1$$f300$$ENDHEX$$n"
		END IF

CASE "w_3113"
		IF ps_condicion="Form.Mante.Sum." THEN
			RETURN "OPEN SGI - Mantenimiento de Suministros por Direcci$$HEX1$$f300$$ENDHEX$$n"
		ELSEIF ps_condicion="Form.Cons.Sum." THEN
			RETURN "OPEN SGI - Listado de Suministros por Direcci$$HEX1$$f300$$ENDHEX$$n"
		END IF

CASE "w_3110"
		IF ps_condicion="Form.Lista.Sum." THEN
			RETURN "OPEN SGI - Listado de Suministros"
		END IF

CASE "w_3109"
		IF ps_condicion="Form.Mante.Aco.Inst." THEN
			RETURN "OPEN SGI - Mantenimiento de Acometidas"
		ELSEIF ps_condicion="Form.Lista.Aco.Inst." THEN
			RETURN "OPEN SGI - Listado de Acometidas"
		ELSEIF ps_condicion="Form.Mante.Aco.Sin." THEN
			RETURN "OPEN SGI - Mantenimiento de Acometidas"
		ELSEIF ps_condicion="Form.Lista.Aco.Sin." THEN
			RETURN "OPEN SGI - Listado de Acometidas"
		END IF

CASE "w_3208"
		IF ps_condicion="Form.Mante.Instalac." THEN
			RETURN "OPEN SGI - Mantenimiento de Instalaciones"
		END IF

CASE "w_6"
		IF ps_condicion="brig" THEN
			return "OPEN SGI - Brigadas"
		END IF

CASE "w_6_2"
		If ps_condicion="brig" THEN
			return "OPEN SGI - Brigadas"
		END IF

CASE "w_7"
		If ps_condicion="llamada_distrib" THEN
			return "OPEN SGI - Llamadas de Distribuci$$HEX1$$f300$$ENDHEX$$n"
		END IF

CASE "w_8"
		If ps_condicion="tipo_llamada" THEN
			return "OPEN SGI - Tipo de Llamada"
		END IF

CASE "w_9"
		If ps_condicion="bonific" THEN
			return "OPEN SGI - Bonificaci$$HEX1$$f300$$ENDHEX$$n de Llamadas"
		END IF

CASE "w_alarm"
		If ps_condicion="alarma" THEN
			return "OPEN SGI - Alarmas de la BDG"
		END IF

CASE "w_cier_incid"
		If ps_condicion="Estadist_zona" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas por Zona Geogr$$HEX1$$e100$$ENDHEX$$fica"
		END IF

CASE "w_cier_dura"
		If ps_condicion="Estadist_zona" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas por Zona Geogr$$HEX1$$e100$$ENDHEX$$fica"
		END IF

CASE "w_cier_mant"
		If ps_condicion="Estadist_zona" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas por Zona Geogr$$HEX1$$e100$$ENDHEX$$fica"
		END IF

CASE "w_cier_baja"
		If ps_condicion="inst_afect" THEN
			return "OPEN SGI - Instalaciones Afectadas"
		END IF

CASE "w_est_inc"
		If ps_condicion="estadist_inc_sum" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas Incidencias a Suministro"
		END IF

CASE "w_ind"
		If ps_condicion="ind_cier" THEN
			return "OPEN SGI - Indices CIER"
		END IF

CASE "w_inst_afect"
		If ps_condicion="inst_afect" THEN
			return "OPEN SGI - Instalaciones Afectadas"
		END IF

CASE "w_inst_afect_mt"
		If ps_condicion="inst_afect_mt" THEN
			return "OPEN SGI - Instalaciones Afectadas por Mantenimiento"
		END IF

CASE "w_4001"
		If ps_condicion="inc_zgeo" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$stica de Incidencias por Zona Geogr$$HEX1$$e100$$ENDHEX$$fica"
		END IF

CASE "w_4002"
		If ps_condicion="inc_relev" THEN
			return "OPEN SGI - Incidencias M$$HEX1$$e100$$ENDHEX$$s Relevantes"
		END IF

CASE "w_4003"
		If ps_condicion="est_inc_sum" THEN
			return "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$sticas de Incidencias Sin Interrupcion"
		END IF

CASE "w_4004"
		If ps_condicion="instal_afect" THEN
			return "OPEN SGI - Instalaciones Afectadas"
		END IF

CASE "w_4005"
		If ps_condicion="aviso_distribucion" THEN
			return "OPEN SGI - Avisos de Distribuci$$HEX1$$f300$$ENDHEX$$n"
		END IF

CASE "w_4006"
		If ps_condicion="tipo_aviso" THEN
			return "OPEN SGI - Tipos de Aviso"
		END IF

CASE "w_4007"
		If ps_condicion="cons_brig" THEN
			return "OPEN SGI - Consulta de Trabajo de Brigadas"
		END IF

CASE "w_2035"
		IF ps_condicion = "cons_ot" THEN
			Return "OPEN SGI - Listado de Ordenes de Trabajo"
		END IF

CASE "iw_3211"
		IF ps_condicion = "form_aco" THEN
			Return "OPEN SGI - Formulario Mantenimiento de Acometidas"
		END IF

CASE "iw_3112"
		IF ps_condicion = "lista_sum" THEN
			Return "OPEN SGI - Lista de Suministros"
		END IF

CASE "iw_2220"
		IF ps_condicion = "lista" THEN
			Return "OPEN SGI - Lista de Acometidas para la Instalaci$$HEX1$$f300$$ENDHEX$$n"
		END IF

CASE ""
		If ps_condicion="" THEN
			return "OPEN SGI - Bonificacion de Avisos"
		END IF

CASE "w_6202"
		IF ps_condicion="Alta" THEN
			RETURN "OPEN SGI - Ingreso de Brigadas"
		ELSE
			RETURN "OPEN SGI - Consulta de Brigadas"
		END IF

CASE "w_6203"
		IF ps_condicion="modificar" THEN
			RETURN "OPEN SGI - Mantenimiento de Brigadistas"
		ELSEIF ps_condicion="consulta" THEN
			RETURN "OPEN SGI - Consulta de Brigadistas"
		END IF

CASE "w_6204"
		IF ps_condicion="modificar" THEN
			RETURN "OPEN SGI - Actualizaci$$HEX1$$f300$$ENDHEX$$n del Brigadista"
		ELSEIF ps_condicion="consulta" THEN
			RETURN "OPEN SGI - Consulta del Brigadista"
		ELSEIF ps_condicion="alta" THEN
			RETURN "OPEN SGI - Ingreso de Brigadistas"
		END IF


CASE "w_4007_perdidas"
      IF ps_condicion="perdidas_corte" THEN
        RETURN "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$stica de Perdidas por Corte"
      END IF


CASE "w_4008"
      IF ps_condicion="brigadas" THEN
        RETURN "OPEN SGI - Estad$$HEX1$$ed00$$ENDHEX$$stica de Brigadas"
      END IF


CASE "w_id0104_ref"
      IF ps_condicion = "ListaRef." THEN
        RETURN "OPEN SGI - Listado de Referencias de la Localidad"
      END IF
		

CASE "w_6205"
		return "OPEN SGI - Consulta de OT's y Tareas asignadas a una Brigada"
		
CASE "w_6205_co"
		return "OPEN SGI - Consulta de OT's y Tareas asignadas a una Contrata"

CASE "w_6206"
		IF ps_condicion="alta" THEN
			RETURN "OPEN SGI - Ingreso de Tareas"
		ELSE
			RETURN "OPEN SGI - Consulta de Tareas"
		END IF	

CASE "w_con_0001"
	   RETURN "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Contratas"

CASE "w_con_0002"
		IF ps_condicion="I" THEN
		   RETURN "OPEN SGI - Ingreso de Contrata"		
		ELSEIF ps_condicion="A" THEN
			RETURN "OPEN SGI - Actualizaci$$HEX1$$f300$$ENDHEX$$n de Contrata"		
		ELSEIF ps_condicion="C" THEN
			RETURN "OPEN SGI - Consulta de Contrata"					
		END IF
CASE "w_6207"
		IF ps_condicion="CO" THEN
			RETURN "OPEN SGI - Hist$$HEX1$$f300$$ENDHEX$$rico de Contrata"		
		ELSE
			RETURN "OPEN SGI - Hist$$HEX1$$f300$$ENDHEX$$rico de Brigada"		
		END IF		
END CHOOSE


return " "

end function

public function boolean fnu_evaluar_apertura (string ps_nombre);long cont, ll_incid, ll_nis, ll_acometida
long li_cantidad
decimal{0} ldec_nro_inst
int li_inc_servicio_repuesto

li_inc_servicio_repuesto = fgci_incidencia_servicio_repuesto

CHOOSE CASE ps_nombre
	
	CASE "w_2304_situacion_climatologica"
		datetime ld_fecha
		long ll_cmd
		IF is_comunic.accion_llamada = "Alta" THEN
			Return TRUE
		END IF
		ld_fecha = is_comunic.datval1
		ll_cmd = is_comunic.longval1
		SELECT count(*) into :cont
   		 FROM "GI_SIT_CLIMA"  
  				 WHERE ( "GI_SIT_CLIMA"."NRO_CMD" = :ll_cmd ) AND  
    		     ("GI_SIT_CLIMA"."FECHA" = :ld_fecha) ;
	   if cont <= 0 then
			gnv_msg.f_mensaje("AI17",STRING(DATE(is_comunic.datval1))," ",OK!)
			return false
		end if 

	CASE "w_2035_ordenes_trabajo"
		ldec_nro_inst = is_comunic.decval1
		SELECT COUNT(*) INTO :cont
			FROM "GI_OT"
			WHERE ("GI_OT"."NRO_INSTALACION" = :ldec_nro_inst) ;
		IF cont <= 0 THEN
			gnv_msg.f_mensaje("AG03","","",OK!)
			Return FALSE
		END IF



	CASE "w_2307_consulta_avisos"
		IF is_comunic.programa_llamante = "w_3107" THEN
			ldec_nro_inst = is_comunic.decval1
			SELECT COUNT(*) INTO :cont
		   FROM "GI_AVISOS"
		   WHERE ( GI_avisos.nro_instalacion = :ldec_nro_inst );
			IF cont <= 0 THEN
				gnv_msg.f_mensaje("AG03","","",OK!)
				Return FALSE
			END IF
		ELSEIF is_comunic.longval1 <> 0 THEN
			ll_nis = is_comunic.longval1
			SELECT COUNT(*) INTO :cont
		   FROM "GI_AVISOS"
		   WHERE ( GI_avisos.nis_rad = :ll_nis );
			IF cont <= 0 THEN
				gnv_msg.f_mensaje("AG03","","",OK!)
				Return FALSE
			END IF
		END IF

//	CASE "w_3108_lista_mante_trafos"
//		IF is_comunic.accion_llamada = "Consulta" THEN
//			ldec_nro_inst = is_comunic.decval1
//			SELECT COUNT(*) INTO :cont
//		   FROM "GI_TRANSFORMADORES"  
//		   WHERE "GI_TRANSFORMADORES"."NRO_POSTE" = :ldec_nro_inst ;
//			IF cont <= 0 THEN
//				gnv_msg.f_mensaje("AG03","","",OK!)
//				Return FALSE
//			END IF
//		END IF
//
	CASE "w_3109_consulta_acometidas"
		IF is_comunic.accion_llamada = "Consulta" THEN
			IF is_comunic.programa_llamante = "w_3107" OR &
					is_comunic.programa_llamante = "w_3208" THEN
				ldec_nro_inst = is_comunic.decval1
				SELECT COUNT(*) INTO :cont
			   FROM "SGD_ACOMETIDA"
			   WHERE ( SGD_ACOMETIDA.INSTALACION_ORIGEN = :ldec_nro_inst )
				and SGD_ACOMETIDA.BDI_JOB = 0  //DBE 11/01/2000
				; 
				IF cont <= 0 THEN
					gnv_msg.f_mensaje("AM14","","",OK!)
					Return FALSE
				END IF
			ELSE
//				SELECT COUNT(*)
//				INTO :cont
//			   FROM "SGD_ACOMETIDA"
//			   WHERE "SGD_ACOMETIDA"."INSTALACION_ORIGEN" = :gi_acometida_sin_alim ;
				// Descomentarlo --PACHO-- 2/7/1997// 
				IF cont <= 0 THEN
					gnv_msg.f_mensaje("AM16","","",OK!)
					Return FALSE
				END IF
			END IF
		END IF

	CASE "w_3110_lista_suministros_aco"
		IF is_comunic.accion_llamada = "Consulta" THEN
			IF is_comunic.programa_llamante = "w_3109" OR &
					is_comunic.programa_llamante = "w_3111" THEN
				ll_acometida = is_comunic.longval1
				SELECT COUNT(*) INTO :cont
			   FROM "ACO_SUM"
			   WHERE ( ACO_SUM.NRO_ACOMETIDA = :ll_acometida ); 
				IF cont <= 0 THEN
					gnv_msg.f_mensaje("AM15","","",OK!)
					Return FALSE
				END IF
			END IF
		END IF

//	CASE "w_1105_avisos_con_alim"
//		SELECT COUNT(*) INTO :cont
//      FROM "GI_AVISO_INS" 
//		WHERE nro_centro = :gi_nro_centro AND (nro_cmd = :gi_nro_cmd OR nro_cmd = 0 ) AND (nro_mesa = :gi_nro_puesto OR nro_mesa = 0 );
//		IF cont <= 0 THEN
//			gnv_msg.f_mensaje("AA06","","",OK!)
//			Return FALSE
//		END IF

	CASE "w_2220_identificacion_acometida"
		ldec_nro_inst = is_comunic.decval1
		SELECT COUNT(*) INTO :cont
      FROM "SGD_ACOMETIDA", "CALLEJERO" 
      WHERE ( "SGD_ACOMETIDA"."COD_CALLE" = "CALLEJERO"."COD_CALLE" ) and 
	 			( "SGD_ACOMETIDA"."INSTALACION_ORIGEN" = :ldec_nro_inst)
				 and "SGD_ACOMETIDA"."BDI_JOB" = 0 ;//DBE 11/01/2000
		IF cont <= 0 THEN
			gnv_msg.f_mensaje("AM14","","",OK!)
			RETURN FALSE
		END IF

	CASE "w_3112_lista_consulta_sum"
		ldec_nro_inst = is_comunic.decval1
	CASE "w_1234_seleccion_incidencias"
			select count(*) into :li_cantidad 
			from SGD_INCIDENCIA
			WHERE	SGD_INCIDENCIA.EST_ACTUAL < :li_inc_servicio_repuesto 
				and (SGD_INCIDENCIA.ALCANCE = :fgci_incidencia_con_interrupcion );
			if li_cantidad = 0 then 
				gnv_msg.f_mensaje("AI71"," "," ",OK!)
    			return false
			end if
	CASE "w_3105_lista_asignaciones_brigada"
		SELECT COUNT(*) INTO: LI_CANTIDAD
	   FROM "GI_BRIGADA",   
	         "GI_OT",   
	         "GI_AVISOS",   
	         "SGD_INCIDENCIA",   
	         "SGD_INSTALACION"  
	   WHERE ( GI_brigada.ot = GI_ot.nro_ot (+)) and  
	         ( GI_ot.nro_aviso = GI_avisos.nro_aviso (+)) and  
	         ( GI_ot.nro_instalacion = sgd_instalacion.nro_instalacion (+)) and  
				( NVL(sgd_instalacion.bdi_job,0)=0 ) and  //DBE 11/01/2000
	         ( GI_ot.nro_incidencia = SGD_INCIDENCIA.nro_incidencia (+)) and  
	         ( ( "GI_BRIGADA"."NRO_CENTRO" = :gi_nro_centro ) AND  
	         ( "GI_BRIGADA"."NRO_CMD" = :gi_nro_cmd ) AND  
	         ( "GI_BRIGADA"."NRO_MESA" = :gi_nro_puesto ) )    ;
		if li_cantidad>0 then
			return true
		else	
			gnv_msg.f_mensaje("AI69"," "," ",OK!)
			return false
		end if


END CHOOSE


RETURN TRUE


end function

public function integer fnu_activar_ventana_response ();//CHOOSE CASE GS_RESPONSE_ACTIVA
//	CASE "W_C1"
//		W_C1.POSTEVENT("TOMAR_FOCO")
//	CASE "W_B1"
//		W_C1.POSTEVENT("TOMAR_FOCO")
//END CHOOSE
RETURN 1
end function

public function STRING fnu_obtener_response_activa ();RETURN GS_RESPONSE_ACTIVA
end function

public function STRING fnu_obtener_response_activa_ante ();RETURN GS_RESPONSE_ACTIVA_ANTE
end function

public function boolean fnu_puede_cerrar (window pw_ventana);//INT LI_INDICE,LI_MAX
//LI_MAX = UPPERBOUND(IS_CONTROL[])
//FOR LI_INDICE = 1 TO LI_MAX
//	IF IS_CONTROL[LI_INDICE].VENTANA_LLAMANTE = PW_VENTANA THEN
//		RETURN TRUE
//	END IF
//NEXT
RETURN TRUE

end function

public function integer fnu_cambiar_modo (integer pi_modo, string ps_response_activa, string ps_response_activa_ante, window pw_ventana);window lw_ventana_Activa
INT LI_POSICION
IF PI_MODO = 0 THEN
	setnull(gs_response_activa)
	SETNULL(GS_RESPONSE_ACTIVA_ANTE)
	fnu_deshabilitar_ventanas(w_operaciones,"H",PW_VENTANA)
ELSE
	GS_RESPONSE_ACTIVA = PS_RESPONSE_ACTIVA
	GS_RESPONSE_ACTIVA_ANTE = PS_RESPONSE_ACTIVA_ANTE
	IS_CONTROL[LI_POSICION].VENTANA_A_ABRIR.ENABLED= FALSE
	LI_POSICION = fnu_deshabilitar_ventanas(w_operaciones,"D",PW_VENTANA)
	IS_CONTROL[LI_POSICION].VENTANA_LLAMANTE.enabled = true
	IS_CONTROL[LI_POSICION].VENTANA_LLAMANTE.POSTEVENT("TOMAR_FOCO")
	IS_CONTROL[LI_POSICION].VENTANA_LLAMANTE.enabled = FALSE
	IS_CONTROL[LI_POSICION].VENTANA_A_ABRIR.ENABLED= TRUE
	IS_CONTROL[LI_POSICION].VENTANA_A_ABRIR.postevent("TOMAR_FOCO")
END IF
return 1
end function

public function integer fnu_deshabilitar_ventanas (window p_principal, string p_accion, window p_ventana);WINDOW W_RETORNO
INT LI_INDICE,LI_MAX,LI_POSICION
LI_MAX = UPPERBOUND(IS_CONTROL[])
if li_max >= 1 then
FOR LI_INDICE = 1 TO LI_MAX 
	IF IS_CONTROL[LI_INDICE].VENTANA_A_ABRIR <> P_VENTANA AND&
			IS_CONTROL[LI_INDICE].VENTANA_A_ABRIR_PUNTERO <> 0 THEN
		IF p_accion = "H" THEN
			IS_CONTROL[LI_INDICE].VENTANA_A_ABRIR.ENABLED = TRUE
		ELSE
			IS_CONTROL[LI_INDICE].VENTANA_A_ABRIR.ENABLED = FALSE
		END IF
	ELSE
		LI_POSICION = LI_INDICE
	END IF
NEXT
else
	setnull(w_retorno)
end if
RETURN LI_POSICION



end function

public function boolean fnu_cargar_vector (window pw_ventana, integer pw_modo, window pw_ventana_padre, string ps_nombre);int li_indice
int li_maximo



int li_posnull,li_contador,li_existe
li_maximo = upperbound(is_control[])
li_existe = 0
int li_lugar
li_lugar = 0
FOR li_indice=1 TO li_maximo
	if  is_control[li_indice].ventana_a_abrir_puntero = 0 and li_lugar = 0 then
		li_lugar = li_indice
	end if		

	if is_control[li_indice].ventana_a_abrir_nombre = ps_nombre then
			li_existe = 1
	end if
NEXT


if li_existe = 0 then

if li_lugar <> 0 then
	ii_ultima_posicion = li_lugar
	gi_ultima_posicion = ii_ultima_posicion // Ale
//	is_control[ii_ultima_posicion].ventana_a_abrir =				pw_ventana
//	is_control[ii_ultima_posicion].ventana_a_abrir_puntero =	 	handle(pw_ventana)
	is_control[ii_ultima_posicion].ventana_a_abrir_forma = 		pw_modo
	is_control[ii_ultima_posicion].ventana_llamante =		 		pw_ventana_padre
	is_control[ii_ultima_posicion].ventana_llamante_puntero = 	handle(pw_ventana_padre)	
	is_control[ii_ultima_posicion].ventana_a_abrir_nombre = ps_nombre
	gs_ventana_nombre = ps_nombre
	return true
else
	messagebox("ATENCI$$HEX1$$d300$$ENDHEX$$N", "No puede abrir m$$HEX1$$e100$$ENDHEX$$s ventanas!!")
	return false
END IF
end if

return false
end function

public function boolean fnu_cargar_vector_open (window pw_ventana, string ps_nombre);int li_indice
int li_maximo



int li_posnull,li_contador,li_existe
li_maximo = upperbound(is_control[])
li_existe = 0
int li_lugar
li_lugar = 0
FOR li_indice=1 TO li_maximo
		if is_control[li_indice].ventana_a_abrir_nombre = ps_nombre then
         li_lugar = li_indice
			li_existe = 1

	end if
NEXT


if li_existe = 1 then

if li_lugar <> 0 then
	ii_ultima_posicion = li_lugar
	gi_ultima_posicion = ii_ultima_posicion
	is_control[ii_ultima_posicion].ventana_a_abrir =				pw_ventana
	is_control[ii_ultima_posicion].ventana_a_abrir_puntero =	 	handle(pw_ventana)
	return true
else
	messagebox("ATENCION", "no se puede abrir")

	return false
END IF
end if

return false
end function

public function integer fnu_abrir (ref window pw_ventana, string ps_nombre, integer ps_forma, integer ps_modo, ref window pw_padre, string ps_retorno);int li_posicion_ale // Puntero
int max,p_lugar,u_lugar,i
IF ISNULL(GS_RESPONSE_ACTIVA) or (gs_response_activa=ps_retorno) THEN
	IF FNU_EVALUAR_APERTURA(PS_NOMBRE) THEN
		IF PS_MODO = 1 then // SE ABRE COMO RESPONSE
			gs_response_activa_ante = gs_response_activa
		   max = upperbound(response_pendientes[])
			u_lugar = max
			p_lugar = 1
			for i = u_lugar to p_lugar step -1
				response_pendientes[i+1] = response_pendientes[i]
			next 
			response_pendientes[1] = ps_nombre 	
			GS_RESPONSE_ACTIVA = PS_NOMBRE
			GS_PADRE_RESPONSE = PS_RETORNO
			GI_BANDERA = 1
			FNU_DESHABILITAR_VENTANAS(W_OPERACIONES,"D",pw_ventana)
		ELSE
			SETNULL(GS_RESPONSE_ACTIVA)
		END IF
		IF PS_FORMA = 1 THEN // ORIGINAL
			CHOOSE CASE gs_programa_principal
				CASE "w_operaciones"
				
					 if fnu_cargar_vector(pw_ventana,ps_modo,pw_padre,ps_nombre) then
						if ps_modo = 1 then
							SETPOINTER(HOURGLASS!)
							is_comunic.intval11 = ii_ultima_posicion
//							open(pw_ventana)
							opensheet(pw_ventana,w_operaciones,0,ORIGINAL!)  // Ale
							is_control[ii_ultima_posicion].ventana_a_abrir_puntero = handle(pw_ventana) 
							is_control[ii_ultima_posicion].ventana_a_abrir = pw_ventana
//							pw_ventana.x=106
//							pw_ventana.y=169
							RETURN 1
						else
							OPENSHEET(pw_ventana,w_operaciones,0,ORIGINAL!)
							is_control[ii_ultima_posicion].ventana_a_abrir_puntero = handle(pw_ventana) 
							is_control[ii_ultima_posicion].ventana_a_abrir = pw_ventana
							pw_ventana.x=1
							pw_ventana.y=1
							RETURN 1
						end if
				 end if
				CASE "w_prin"
					 if fnu_cargar_vector(pw_ventana,ps_modo,pw_padre,ps_nombre) then
						if ps_modo = 1 then
							SETPOINTER(HOURGLASS!)
							is_comunic.intval11 = ii_ultima_posicion
							open(pw_ventana)
							RETURN 1
						else
							SETPOINTER(HOURGLASS!)
							OPENSHEET(pw_ventana,w_prin,0,ORIGINAL!)
//							open(pw_ventana)
							opensheet(pw_ventana,w_prin,0,ORIGINAL!)  // Ale
							is_control[ii_ultima_posicion].ventana_a_abrir_puntero = handle(pw_ventana) 
							is_control[ii_ultima_posicion].ventana_a_abrir = pw_ventana
//							pw_ventana.x=106
//							pw_ventana.y=169
																
							is_control[ii_ultima_posicion].ventana_a_abrir_puntero = handle(pw_ventana) 
							is_control[ii_ultima_posicion].ventana_a_abrir = pw_ventana
							pw_ventana.x=1
							pw_ventana.y=1
							RETURN 1
						end if
					end if
				END CHOOSE
		ELSE
			CHOOSE CASE gs_programa_principal
				CASE "w_operaciones"
				 	if fnu_cargar_vector(pw_ventana,ps_modo,pw_padre,ps_nombre) then
						SETPOINTER(HOURGLASS!)
						OPENSHEET(pw_ventana,w_operaciones,0,LAYERED!)
						pw_ventana.x=1
						pw_ventana.y=1
						
//						Esta linea es para cargar en la estructura is_control[] el puntero que
//						es necesario para cerrar la ventana despues y se debe hacer despues del 
//						opensheet porque antes la ventana no esta instanciada y el handle 
//						devuelve 0

						is_control[ii_ultima_posicion].ventana_a_abrir_puntero = handle(pw_ventana) 
						is_control[ii_ultima_posicion].ventana_a_abrir = pw_ventana
						RETURN 1				
						
					end if
				CASE "w_prin"
					if fnu_cargar_vector(pw_ventana,ps_modo,pw_padre,ps_nombre) then
						SETPOINTER(HOURGLASS!)
						OPENSHEET(pw_ventana,w_prin,0,layered!)
						is_control[ii_ultima_posicion].ventana_a_abrir_puntero = handle(pw_ventana) 
						is_control[ii_ultima_posicion].ventana_a_abrir = pw_ventana
						pw_ventana.x=1
						pw_ventana.y=1
						RETURN 1
					end if
			END CHOOSE
		END IF
	END IF
END IF

RETURN 1
end function

public function integer fnu_volver_llamante (long pl_puntero);int li_indice,li_max,li_puntero
li_max = upperbound(is_control[])

if li_max > 1 then

// busca en la estructura is_control[] donde esta cargada la 
// ventana a cerrar, buscando por puntero en vez de por la variable
// tipo window

	for li_indice = 1 to li_max 
		if is_control[li_indice].ventana_a_abrir_puntero = pl_puntero then
			li_puntero = li_indice
		end if
	next
   if li_puntero <> 0 then
		for li_indice = 1 to li_max
			if is_control[li_indice].ventana_a_abrir = is_control[li_puntero].ventana_llamante then
				setnull(is_control[li_puntero].ventana_a_abrir)
				setnull(is_control[li_puntero].ventana_a_abrir_forma)
				setnull(is_control[li_puntero].ventana_llamante)
				setnull(is_control[li_puntero].ventana_a_abrir_nombre)
				is_control[li_puntero].ventana_a_abrir_puntero = 0
				is_control[li_puntero].ventana_llamante_puntero = 0
				if not isnull(gs_response_activa) then
					FNU_DESHABILITAR_VENTANAS(W_OPERACIONES,"D",is_control[li_indice].ventana_a_abrir)
					is_control[li_indice].ventana_a_abrir.enabled=true
					is_control[li_indice].ventana_a_abrir.POSTEVENT("TOMAR_FOCO")
					RETURN 1
				else
        			IF IsValid(is_control[li_indice].ventana_a_abrir) THEN
						is_control[li_indice].ventana_a_abrir.POSTEVENT("TOMAR_FOCO")
						RETURN 1
//////
// COMENTADO J.CARLOS
//					ELSE
//						HALT CLOSE
//////
					END IF
				end if
			end if
		next
	end if
end if

RETURN 1

end function

on u_generico_comunicaciones.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_generico_comunicaciones.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


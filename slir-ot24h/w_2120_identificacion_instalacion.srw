HA$PBExportHeader$w_2120_identificacion_instalacion.srw
$PBExportComments$Identificaci$$HEX1$$f300$$ENDHEX$$n de una instalaci$$HEX1$$f300$$ENDHEX$$n.
forward
global type w_2120_identificacion_instalacion from w_sgigenerica
end type
type cb_aceitar from commandbutton within w_2120_identificacion_instalacion
end type
type cbx_ambito from checkbox within w_2120_identificacion_instalacion
end type
type cb_buscar from commandbutton within w_2120_identificacion_instalacion
end type
type st_1 from statictext within w_2120_identificacion_instalacion
end type
type tv_instala from u_2120_arbol_seleccion_instalacion within w_2120_identificacion_instalacion
end type
type d_tipo_inst from datawindow within w_2120_identificacion_instalacion
end type
type sle_nome from singlelineedit within w_2120_identificacion_instalacion
end type
type gb_busca from groupbox within w_2120_identificacion_instalacion
end type
type dw_fases from datawindow within w_2120_identificacion_instalacion
end type
type rb_nombre from radiobutton within w_2120_identificacion_instalacion
end type
type rb_matricula from radiobutton within w_2120_identificacion_instalacion
end type
end forward

global type w_2120_identificacion_instalacion from w_sgigenerica
integer x = 914
integer y = 500
integer width = 1938
integer height = 1548
string title = "OPEN SGI - Sele$$HEX2$$e700e300$$ENDHEX$$o de Instala$$HEX2$$e700f500$$ENDHEX$$es"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_aceitar cb_aceitar
cbx_ambito cbx_ambito
cb_buscar cb_buscar
st_1 st_1
tv_instala tv_instala
d_tipo_inst d_tipo_inst
sle_nome sle_nome
gb_busca gb_busca
dw_fases dw_fases
rb_nombre rb_nombre
rb_matricula rb_matricula
end type
global w_2120_identificacion_instalacion w_2120_identificacion_instalacion

type variables
w_2120_identificacion_instalacion iw_2120

u_generico_comunicaciones iu_comunic

// para distinguir desde que dw se llamo a esta 
// desde la ventana w_1105_avisos_con_alim
string is_nombre_dw

boolean ib_otras_inst = False

//EDELAP

long il_nro_aco, il_codigo
string is_descripcion

//Sergio
integer ii_op
integer ii_tipo_incid

string is_cadena

int ii_smt
end variables

event close;call super::close;Long ll_nro_inst

ll_nro_inst = iu_comunic.is_comunic.decval1
IF ll_nro_inst > 0 THEN

	// Fue seleccionada una instalacion
	// retorna el nombre de la dw desde donde se abrio
	iu_comunic.is_comunic.strval3 = is_nombre_dw
	iu_comunic.is_comunic.Accion_retorno = "Seleccionada"
	
	// Setamos la ventana de retorno
	IF iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_a" THEN
		iu_comunic.is_comunic.Programa_retorno = "iw_2120_a"
	ELSEIF iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_b" THEN
		iu_comunic.is_comunic.Programa_retorno = "iw_2120_b"
	ELSEIF iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_c" THEN
		iu_comunic.is_comunic.Programa_retorno = "iw_2120_c"
	ELSEIF iu_comunic.is_comunic.programa_llamante ="w_3113" THEN
		iu_comunic.is_comunic.Programa_retorno = "w_2120"
	ELSEIF iu_comunic.is_comunic.programa_llamante ="iw_2301" THEN
		IF iu_comunic.is_comunic.accion_llamada <> "Inc. Otras Int." THEN
			iu_comunic.is_comunic.Programa_retorno = "iw_2120"
		END IF
	END IF
ELSE

	// Ninguna instalacion selecionada
	iu_comunic.is_comunic.intval1 = 0
	iu_comunic.is_comunic.intval2 = 0
	iu_comunic.is_comunic.intval3 = 0
	iu_comunic.is_comunic.intval4 = 0
	iu_comunic.is_comunic.intval5 = 0
	iu_comunic.is_comunic.intval6 = 0   	
	iu_comunic.is_comunic.strval1 = " "
	iu_comunic.is_comunic.strval2 = " "
	iu_comunic.is_comunic.strval10 = " "

	iu_comunic.is_comunic.longval1 = 0
	iu_comunic.is_comunic.longval2 = 0
	iu_comunic.is_comunic.longval3 = 0
	iu_comunic.is_comunic.longval4 = 0
	iu_comunic.is_comunic.longval5 = 0

	iu_comunic.is_comunic.strval3 = is_nombre_dw

	iu_comunic.is_comunic.Accion_retorno = "No Seleccionada"
	iu_comunic.is_comunic.Programa_retorno = "iw_2120"
	
	IF iu_comunic.is_comunic.programa_llamante ="w_otras_inst" THEN
		iu_comunic.is_comunic.Programa_retorno = "Otras_Inst"
	END IF

END IF
////////////////////////////////////////////////////////////////////////////////////////////
// Comentado (rblengio) - Carga los datos de la instalacion y le pasa por arriba 
//								  a los de la acometida	
////////////////////////////////////////////////////////////////////////////////////////////
//IF gu_comunic1.is_comunic.programa_retorno = "w_2220" AND gu_comunic1.is_comunic.accion_retorno = "No Seleccionada" THEN
//	fgnu_resetear_s_comunicaciones(gu_comunic1)
//ELSE
//	gu_comunic1.is_comunic = iu_comunic.is_comunic
//	
//	IF ib_otras_inst THEN
//		gu_comunic.is_comunic.programa_retorno = "Otras_inst"
//	END IF
//END IF
////////////////////////////////////////////////////////////////////////////////////////////

// RB

// Reemplazado por
IF gu_comunic1.is_comunic.programa_retorno = "w_2220" AND gu_comunic1.is_comunic.accion_retorno = "No Seleccionada" THEN
	fgnu_resetear_s_comunicaciones(gu_comunic1)
	iu_comunic.is_comunic.accion_retorno = "No Seleccionada"
END IF

// Conservo el nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n y el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n
IF gu_comunic1.is_comunic.programa_retorno = "w_2220" AND gu_comunic1.is_comunic.accion_retorno = "Seleccionada" THEN
	gu_comunic1.is_comunic.strval2 = iu_comunic.is_comunic.strval2 // Nombre
	gu_comunic1.is_comunic.intval4 = iu_comunic.is_comunic.intval4 // Tipo
ELSE
	gu_comunic1.is_comunic = iu_comunic.is_comunic
END IF

//Destruccion de los objetos
DESTROY iu_comunic
Yield()
end event

event open;call super::open;/*
	Permite seleccionar una instalacion determinada
	Permite busqueda acotada por nombre o libre 
	Variables de trabajo
	La accion esperada para trabajar es "Seleccion"
	En caso de que se haya seleccionado una instalacion  con el boton de seleccionar ,
	devuelve el n$$HEX1$$fa00$$ENDHEX$$mero de instalacion e informacion de la instalacion
	seleccionada en la variable gu_comunic.is_comunic
	y en gu_comunic.is_comunic.Accion_retorno devuelve "Seleccionada"
	En caso de que no se haya efectuado la seleccion devuelve en gu_comunic.is_comunic valores reseteados
	y en gu_comunic.is_comunic.Accion_retorno devuelve "No Seleccionada"

	Los valores del objeto GU_COMUNIC son:
	
	IntVal1 - Nro del Centro
	IntVal2 - Nro del CMD
	IntVal3 - Nro de Mesa
	IntVal4 - ?
	IntVal5 - Tipo de la instalaci$$HEX1$$f300$$ENDHEX$$n
	IntVal6 - Tipo de Incidencia
*/
int li_co_nivel, li_contador
string ls_co_nivel, ls_filtro
string ls_select, ls_modificacion, retorno, ls_parametro
string ls_ventana, ls_condicion

ls_ventana = Message.StringParm
// Creo el objeto de comunicaciones locales
iu_comunic = create u_generico_comunicaciones

// Cargo la Estructura de trabajo
iu_comunic.is_comunic = gu_comunic.is_comunic

// Seteamos el numero de instalacion como 0
iu_comunic.is_comunic.decval1 =0


ib_otras_inst = False
ii_tipo_incid = iu_comunic.is_comunic.intval6 

SetPointer(HourGlass!)

// Setamos a dwchild
d_tipo_inst.SetTransObject(SQLCA)
d_tipo_inst.InsertRow(0)
DataWindowChild dwc_tipo
d_tipo_inst.GetChild('pi_tipo_inst',dwc_tipo)
dwc_tipo.SetTransObject(SQLCA)

CHOOSE CASE ls_ventana
	CASE 'w_1105_avisos_con_alim','w_1105_avisos_con_alim_c', &
		  'w_1105_avisos_con_alim_b','w_1105_avis_aviso'
		is_cadena = 'GAV_ACCESO'
	CASE 'iw_2301'
		is_cadena = 'INC_GENERAL'
	CASE 'w_7101_consulta'
		is_cadena = 'DES_ALTA'
	CASE ELSE
		is_cadena = ''
END CHOOSE
IF is_cadena <> '' THEN
	ls_parametro = gu_perfiles.of_obtener_tension(is_cadena)
ELSE
	ls_parametro = '0'
END IF

IF ls_parametro = ',' THEN
	// No esta seleccionado ningun tipo
	ls_condicion = 'AND SGD_VALOR.CODIGO > (select max (codigo) from sgd_valor where codif=~'T_IN~')'
ELSEIF ls_parametro = '0' THEN
		// Estan seleccionados todos los tipos de tension
//		ls_condicion = 'AND SGD_VALOR.CODIGO <= ' + string(fgci_tipo_acometida) + ' '
	ELSE
		ls_condicion = 'AND SGD_VALOR.CODIGO IN (' + ls_parametro + ') '	
END IF
// GNU 2-8-2006. Incidencia ramales EPSA
//ls_select =   'SELECT SGD_VALOR.CODIGO,   ' + &
//				  'SGD_VALOR.DESCRIPCION  ' + &
//				  'FROM SGD_VALOR  ' + &
//				  'WHERE SGD_VALOR.CODIF = ~'T_IN~'  ' + ls_condicion + &
//				  'AND SGD_VALOR.CODIGO NOT IN (98, 0, 10,11,12) '  + &
//			     'ORDER BY SGD_VALOR.CODIGO    ' 
//
ls_select =   'SELECT SGD_VALOR.CODIGO,   ' + &
				  'SGD_VALOR.DESCRIPCION  ' + &
				  'FROM SGD_VALOR  ' + &
				  'WHERE SGD_VALOR.CODIF = ~'T_IN~'  ' + ls_condicion + &
				  'AND SGD_VALOR.CODIGO NOT IN (98, 0, 10, 12) '  + &
			     'ORDER BY SGD_VALOR.CODIGO  '
// FIN GNU

ls_modificacion = "DataWindow.table.Select=~"" + ls_select + "~""
retorno = dwc_tipo.modify(ls_modificacion)

dwc_tipo.Retrieve()
dwc_tipo.Accepttext()


IF iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_b" OR &
	iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_c" THEN
	IF fgci_con_acometidas <> 1 then 
		ls_filtro = 'codigo <> ' + string(fgci_tipo_acometida)
	END IF		
ELSE
	ls_filtro = 'codigo <> ' + string(fgci_tipo_acometida)
END IF

dwc_tipo.SetFilter(ls_filtro)
dwc_tipo.Filter()

// Pongo lo titulo de la ventana
IF iu_comunic.is_comunic.programa_llamante = 'iw_2301' OR &
		iu_comunic.is_comunic.programa_llamante = 'iw_7104_descargos' THEN
	This.Title = iu_comunic.f_titulo_ventana("w_2120","Sel.Instalacion")
ELSE
	This.Title = iu_comunic.f_titulo_ventana("w_2120","Ident.Instalacion")
END IF

// se carga el nombre de la dw desde donde se llamo a esta ventana
is_nombre_dw = iu_comunic.is_comunic.strval1

// Cambio la posicion de la ventana para el Mant. de Instalaciones		
IF iu_comunic.is_comunic.programa_llamante ="w_man_inst" then
	This.X = 1050
END IF

// Indicador de Outras
IF iu_comunic.is_comunic.programa_llamante = "w_otras_inst" THEN
	ib_otras_inst = True
END IF
	
cbx_ambito.show()
cbx_ambito.Checked = False

IF iu_comunic.is_comunic.strval1 = "SMT" then
	ii_smt = 1
END  IF

// SI EL PARAMETRO DE RESTRICION DEL COR ESTA ACTIVO NO SE MUESTRAN LAS INSTALACIONES QUE NO SEAN DE TU  CMD


IF fg_verifica_parametro('RESTRICCION COR') THEN
	cbx_ambito.enabled = FALSE
	cbx_ambito.checked = TRUE
end if

// Cargamos el arbol con las subestaciones e instalaciones moviles o solo con las subestaciones ( descargos)

IF is_cadena = 'DES_ALTA'  THEN

			If cbx_ambito.Checked Then
				tv_instala.f_cargar_root_por_cmd_descargos(gi_nro_cmd)
			Else
				tv_instala.f_cargar_root_descargos()
			End If



else

			If cbx_ambito.Checked Then
				tv_instala.f_cargar_root_por_cmd(gi_nro_cmd)
			Else
				tv_instala.f_cargar_root()
			End If
end if
// Valido si el manejo es con red trif$$HEX1$$e100$$ENDHEX$$sica.

if gb_red_trifasica= false AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta' then
	dw_fases.settransobject(sqlca)
	dw_fases.visible=true
else
	dw_fases.visible=false
end if

cb_aceitar.Enabled = True

end event

on w_2120_identificacion_instalacion.create
int iCurrent
call super::create
this.cb_aceitar=create cb_aceitar
this.cbx_ambito=create cbx_ambito
this.cb_buscar=create cb_buscar
this.st_1=create st_1
this.tv_instala=create tv_instala
this.d_tipo_inst=create d_tipo_inst
this.sle_nome=create sle_nome
this.gb_busca=create gb_busca
this.dw_fases=create dw_fases
this.rb_nombre=create rb_nombre
this.rb_matricula=create rb_matricula
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_aceitar
this.Control[iCurrent+2]=this.cbx_ambito
this.Control[iCurrent+3]=this.cb_buscar
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.tv_instala
this.Control[iCurrent+6]=this.d_tipo_inst
this.Control[iCurrent+7]=this.sle_nome
this.Control[iCurrent+8]=this.gb_busca
this.Control[iCurrent+9]=this.dw_fases
this.Control[iCurrent+10]=this.rb_nombre
this.Control[iCurrent+11]=this.rb_matricula
end on

on w_2120_identificacion_instalacion.destroy
call super::destroy
destroy(this.cb_aceitar)
destroy(this.cbx_ambito)
destroy(this.cb_buscar)
destroy(this.st_1)
destroy(this.tv_instala)
destroy(this.d_tipo_inst)
destroy(this.sle_nome)
destroy(this.gb_busca)
destroy(this.dw_fases)
destroy(this.rb_nombre)
destroy(this.rb_matricula)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2120_identificacion_instalacion
end type

type cb_aceitar from commandbutton within w_2120_identificacion_instalacion
integer x = 635
integer y = 1288
integer width = 635
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string pointer = "Mano6.cur"
string text = "&Aceptar"
end type

event clicked;// Declaracion de Variables
Integer li_cargou, li_nivel_tension,li_permito
Long ll_nro_inst,ll_handle,ll_array[]
String ls_fase_a,ls_fase_b,ls_fase_c

int		li_indiceBloqueo;		//Indice de bloqueo de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada
string	ls_nomUsuBloqueo;		//Nombre del usuario que ha bloqueado la instalaci$$HEX1$$f300$$ENDHEX$$n
string	ls_usuarioBloqueo;	//Usuario que ha bloqueado la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada

// Cargo la estructura con una funcion de la TreeView 
// Compruebo si estoy haciendo un cambio de alimentacion 
// y es correcta la seleccion

IF	(iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_b" OR &
 	 iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_c" ) AND &
	((fgci_con_acometidas = 1 and iu_comunic.is_comunic.intval4 <> fgci_tipo_acometida) or &
   (fgci_con_acometidas = 0 and iu_comunic.is_comunic.intval4 < fgci_tipo_salida_de_baja)) THEN
	iu_comunic.is_comunic.decval1 = 0
ELSE
	li_cargou = tv_instala.f_cargar_estructura(iu_comunic,dw_fases)
	//AHM 14/02/2010	Incidencia 0/100158915
	//AHM 02/11/2009 mejora 1/565472
	IF iu_comunic.is_comunic.intval6 = 3 AND  iu_comunic.is_comunic.programa_llamante = 'iw_2301' THEN	//Comprobamos que es baja tensi$$HEX1$$f300$$ENDHEX$$n
		SELECT ind_bloqueo, usuario_bloqueo, nom_usuario
		INTO :li_indiceBloqueo, :ls_usuarioBloqueo, :ls_nomUsuBloqueo
		FROM sgd_instalacion, gi_usuario_sgi 
		WHERE nro_instalacion = :iu_comunic.is_comunic.decval1
		and gi_usuario_sgi.usuario (+) = sgd_instalacion.usuario_bloqueo;
		
		IF (li_indiceBloqueo > 0) THEN		//Comprobamos si la instalaci$$HEX1$$f300$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$bloqueada
		
			IF (ls_usuarioBloqueo<>gs_usuario) THEN	//Comprobamos que el usuario que ha ejecutado la aplicaci$$HEX1$$f300$$ENDHEX$$n no sea el que ha bloqueado la instalaci$$HEX1$$f300$$ENDHEX$$n
				iu_comunic.is_comunic.decval1 = 0
				messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada se encuentra bloqueada por el usuario :" + ls_nomUsuBloqueo )
				RETURN
			ELSE
				iu_comunic.is_comunic.decval1 = 0
				messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada se encuentra bloqueada en otra ventana de la aplicaci$$HEX1$$f300$$ENDHEX$$n" )
				RETURN
			END IF
		ELSE
			
			UPDATE sgd_instalacion
			SET ind_bloqueo = 1, 
				usuario_bloqueo = :gs_usuario
			WHERE nro_instalacion = :iu_comunic.is_comunic.decval1;
			
			COMMIT;
			
		END IF
		
	END IF
END IF


IF li_cargou = -1 THEN
	return
END IF

IF (iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_b" OR &
 	 iu_comunic.is_comunic.programa_llamante ="w_1105_avisos_con_alim_c" ) THEN
	
	IF gb_red_trifasica=false AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta'  then
		ll_handle = tv_instala.FindItem(CurrentTreeItem!, 0)
		If ll_handle < 1 Then
			// Debe seleccionar una instalaci$$HEX1$$f300$$ENDHEX$$n
			gnv_msg.f_mensaje("AM04", "", "", OK!)
			Return -1
		End If
		ls_fase_a = dw_fases.object.fase_a[1]
		ls_fase_b = dw_fases.object.fase_b[1]
		ls_fase_c = dw_fases.object.fase_c[1]
			
		IF (ls_fase_a = '0' or isnull(ls_fase_a)) and (ls_fase_b = '0' or isnull(ls_fase_b)) and (ls_fase_c = '0' or isnull(ls_fase_c)) then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar al menos una fase.")
			return
		end if
	
	END IF
	
	IF	fgci_con_acometidas = 1 and iu_comunic.is_comunic.intval4 <> fgci_tipo_acometida THEN
		// Para el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n debe escoger una acometida 
		gnv_msg.f_mensaje("AI148", "Acometida", "", OK!)
		iu_comunic.is_comunic.decval1 = 0
		Return
	ELSEIF fgci_con_acometidas = 0 and iu_comunic.is_comunic.intval4 < fgci_tipo_salida_de_baja THEN
		// Para el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n debe escoger una salida de baja
		gnv_msg.f_mensaje("AI148", "Salida de Baja", "", OK!)
		iu_comunic.is_comunic.decval1 = 0
		Return
	END IF
ELSE
	IF iu_comunic.is_comunic.programa_llamante = 'w_reportes' THEN
	
	// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	ELSEIF iu_comunic.is_comunic.programa_llamante = 'w_asig_sum_ct' THEN
		IF iu_comunic.is_comunic.intval4 <> fgci_tipo_ct THEN
			// La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada debe ser un CT
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada debe ser un CT")
			iu_comunic.is_comunic.decval1 = 0
			Return
		END IF
	// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	
	ELSEIF gb_operaciones_inst AND ii_tipo_incid <> fgci_incidencia_calidad	AND iu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta'  THEN
		
		ll_array[2] = iu_comunic.is_comunic.decval1
			
		li_permito = gu_rf.of_comprueba_inst_digitalizada(ll_array[],iu_comunic.is_comunic.intval4)
		
		if li_permito = 1 then
			gnv_msg.f_mensaje("AI147", "", "", OK!)
			iu_comunic.is_comunic.decval1 = 0
			Return
		elseif li_permito = -1 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n",gu_rf.is_mensaje,information!,ok!)
			iu_comunic.is_comunic.decval1 = 0
			return
		end if

	ELSEIF gb_operaciones = TRUE AND iu_comunic.is_comunic.intval6 <= gi_tension_nivel_min &
   	AND ii_tipo_incid <> fgci_incidencia_calidad THEN
		IF gi_tension_nivel_min = fgci_media_tension AND iu_comunic.is_comunic.intval4 <> fgci_tipo_ct &
		AND iu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta' &
		AND iu_comunic.is_comunic.accion_llamada <> 'alta' THEN
			// No se puede  seleccionar la instalaci$$HEX1$$f300$$ENDHEX$$n puesto que hay operaciones y
			// su nivel de tensi$$HEX1$$f300$$ENDHEX$$n tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
			gnv_msg.f_mensaje("AI147", "", "", OK!)
			iu_comunic.is_comunic.decval1 = 0
			Return
		END IF
	END IF
END IF

IF gb_red_trifasica = false AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta'THEN
 	ls_fase_a = dw_fases.object.fase_a[1]
	ls_fase_b = dw_fases.object.fase_b[1]
	ls_fase_c = dw_fases.object.fase_c[1]
	iu_comunic.is_comunic.strval4 = ls_fase_a + ls_fase_b + ls_fase_c
END IF

il_codigo = iu_comunic.is_comunic.decval1
ll_nro_inst = iu_comunic.is_comunic.decval1

// Verifica si cargou sin problemas
If li_cargou = -1 Then 	Return

// Verificamos si no hay ninguma incidencia asociada 
// a la instalacion o a un de sus padres (si vengo de alimentacion de suministros o acometidas)
IF iu_comunic.is_comunic.programa_llamante = 'w_3113' OR &
		iu_comunic.is_comunic.programa_llamante = 'w_3111' THEN

	u_ins_2008_nu_datos_instalacion luo_2008_nu
	luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
	
	if iu_comunic.is_comunic.intval4 < fgci_tipo_salida_de_baja and iu_comunic.is_comunic.programa_llamante = 'w_3111' THEN
		// Para el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n debe escoger una salida de baja
		gnv_msg.f_mensaje("AI152", "Salida de Baja", "", OK!)
		iu_comunic.is_comunic.decval1 = 0
		Return
	END IF
	
	if iu_comunic.is_comunic.intval4 < fgci_tipo_acometida and iu_comunic.is_comunic.programa_llamante = 'w_3113' THEN
		// Para el cambio de alimentaci$$HEX1$$f300$$ENDHEX$$n debe escoger una salida de baja
		gnv_msg.f_mensaje("AI152", "Acometida", "", OK!)
		iu_comunic.is_comunic.decval1 = 0
		Return
	END IF
	
	IF luo_2008_nu.fnu_v_inst_con_incidencia(ll_nro_inst) = -1 THEN
		DESTROY luo_2008_nu
		RETURN						
	END IF

	DESTROY luo_2008_nu
END IF

	IF iu_comunic.is_comunic.programa_llamante = 'w_3113' THEN
		
		IF gu_comunic1.is_comunic.accion_retorno = "No Seleccionada" THEN
			// Reseteo los valores de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada
			il_nro_aco = 0
			is_descripcion = ' '
			il_codigo = 0
			RETURN
		ELSE
			il_nro_aco = gu_comunic1.is_comunic.longval4
			is_descripcion = gu_comunic1.is_comunic.strval10
		END IF
		
	END IF

Yield()
string ls_parametro
ls_parametro = gu_perfiles.of_nivel_tension(is_cadena)

int indice, li_par
string ls_aux
boolean lb_sigo = true
li_nivel_tension = iu_comunic.is_comunic.intval6
for indice = 1 to len(ls_parametro)
	li_par =  mod (indice,2)
	IF li_par <> 0 then
		ls_aux = mid(ls_parametro,indice,1)
		if ls_aux <> ',' and lb_sigo = true then
			if (integer(ls_aux) = li_nivel_tension) OR (ls_aux = '0')then
				lb_sigo = false
			end if
		end if
	end if
next
Close (Parent)

end event

type cbx_ambito from checkbox within w_2120_identificacion_instalacion
integer x = 1458
integer y = 1316
integer width = 398
integer height = 68
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Ambito"
boolean checked = true
end type

event clicked;

IF is_cadena = 'DES_ALTA'  THEN

			If This.Checked Then
				tv_instala.f_cargar_root_por_cmd_descargos(gi_nro_cmd)
			Else
				tv_instala.f_cargar_root_descargos()
			End If



else

			If This.Checked Then
				tv_instala.f_cargar_root_por_cmd(gi_nro_cmd)
			Else
				tv_instala.f_cargar_root()
			End If
end if
end event

type cb_buscar from commandbutton within w_2120_identificacion_instalacion
integer x = 1426
integer y = 236
integer width = 379
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Buscar"
boolean default = true
end type

event clicked;treeviewitem ltvi_llave, ltvi_llave_origen
integer li_estado_llave, li_tipo
long ll_nro_instalacion, ll_llave_origen,  ll_fila, ll_handle
string ls_nom_llave_origen
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
Int li_tipo_busqueda
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

li_tipo = d_tipo_inst.GetItemNumber(1,'pi_tipo_inst')
// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
IF rb_nombre.checked THEN
	li_tipo_busqueda = 1
ELSE
	li_tipo_busqueda = 2
END IF
// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT

// Si el usuario informo alguna cosa en en SLE buscamos la instalacion
IF NOT IsNull(sle_nome.Text) AND len(trim(sle_nome.Text ))<> 0  AND NOT IsNull(li_tipo) THEN
	IF li_tipo = 0 THEN
		// Debe elegir un tipo de instalaci$$HEX1$$f300$$ENDHEX$$n espec$$HEX1$$ed00$$ENDHEX$$fico para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda
		gnv_msg.f_mensaje("AI151", "", "", OK!)
		Return
	END IF
	// LFE - Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	// Comento esta l$$HEX1$$ed00$$ENDHEX$$nea
	//ll_nro_instalacion = tv_instala.f_buscar_instalacion(sle_nome.Text, li_tipo)
	// Y la sustituyo por esta otra
	ll_nro_instalacion = tv_instala.f_buscar_instalacion(sle_nome.Text, li_tipo, li_tipo_busqueda)
	// LFE - Fin Modificaci$$HEX1$$f300$$ENDHEX$$n Mejora Guatemala: 1/312302 alimentaci$$HEX1$$f300$$ENDHEX$$n Suministro - CT
	if not gb_red_trifasica AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta' then  // RED MONOFASICA  --> MOSTRAMOS LA DATAWINDOW  DE FASES
		if ll_nro_instalacion> 0 then 
			ll_fila = tv_instala.ids_datos.Find("cl_nro = " +  String(ll_nro_instalacion), 1, tv_instala.ids_datos.RowCount() )
			ll_handle = tv_instala.ids_datos.GetItemNumber(ll_fila, "cl_handle")
			tv_instala.selectitem(ll_handle)
			tv_instala.triggerevent(clicked!,0, ll_handle)
			dw_fases.retrieve(ll_nro_instalacion)
		end if
	end if

ELSE
	// Escoja un nombre y un tipo de instalaci$$HEX1$$f300$$ENDHEX$$n para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda.
	gnv_msg.f_mensaje("AI151", "", "", OK!)
END IF

tv_instala.SetRedraw(TRUE)

end event

type st_1 from statictext within w_2120_identificacion_instalacion
integer x = 87
integer y = 248
integer width = 201
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Tipo:"
boolean focusrectangle = false
end type

type tv_instala from u_2120_arbol_seleccion_instalacion within w_2120_identificacion_instalacion
integer x = 50
integer y = 400
integer width = 1810
integer height = 664
integer taborder = 40
boolean border = true
boolean disabledragdrop = true
string picturename[] = {"subestaca.bmp","saltat.bmp","subest.bmp","sal_tra1.bmp","ct1.bmp","Transf2.bmp","Library!","termina.bmp","cr.bmp","alumbrado.bmp","brigada1.bmp"}
end type

event rightclicked;call super::rightclicked;//////////////////////////////////////////////////////////////////////
//// Funcion/Evento: Rightclicked
//// Objetivo: Despliega el men$$HEX2$$fa002000$$ENDHEX$$con el bot$$HEX1$$f300$$ENDHEX$$n derecho en el $$HEX1$$e100$$ENDHEX$$rbol
////
//// Fecha        Responsable  Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ------------------------------------------------------------
//// 03/04/2000   S. Koyounian Creaci$$HEX1$$f300$$ENDHEX$$n
//// 15/05/2000   IB945        Correci$$HEX1$$f300$$ENDHEX$$n y adaptaci$$HEX1$$f300$$ENDHEX$$n para EDELAP.
/////////////////////////////////////////////////////////////////////
//
//TreeViewItem ltvi_actual
//Long  li_cargou
//int li_tipo
//m_seleccion_acometida lm_seleccion_acometida
//
//// IB945 - 15/05/2000
//
////Si viene de Mant. acometidas por direccion salgo
//IF gu_comunic.is_comunic.programa_llamante = "w_3111" THEN RETURN
//
//THIS.GetItem(handle, ltvi_actual)
//il_codigo = ltvi_actual.data
//
//SELECT TIPO_INSTALACION
//  INTO :li_tipo
//  FROM SGD_INSTALACION
// WHERE NRO_INSTALACION = :il_codigo;
//
////Si viene de Mant. suministros por direccion solo habilito 
////las salidas de AT/MT/BT.
//IF gu_comunic.is_comunic.programa_llamante = "w_3113" AND &
//   NOT (li_tipo = fgci_tipo_salida_de_estacion OR &
//	     li_tipo = fgci_tipo_salida_at OR &
//	     li_tipo = fgci_tipo_salida_de_baja) THEN
//		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Solo existen acometidas asociadas a Salidas de Alta, Media o Baja Tensi$$HEX1$$f300$$ENDHEX$$n", Exclamation!)	  
//		RETURN	 
//END IF
//// IB945 - Fin.		
//
////Creo y habilito el men$$HEX1$$fa00$$ENDHEX$$
//ii_op = 0
//lm_seleccion_acometida = CREATE m_seleccion_acometida
//lm_seleccion_acometida.m_opciones.PopMenu(PointerX(), PointerY()+480)
//ii_op = gu_comunic.is_comunic.intval9
//
////Cuando vuelve del menu.
//IF ii_op = 1 THEN
//
//// IB945
////	THIS.GetItem(handle, ltvi_actual)
////	il_codigo = ltvi_actual.data
//	
////	SELECT TIPO_INSTALACION
////	  INTO :li_tipo
////	  FROM SGD_INSTALACION
////	 WHERE NRO_INSTALACION = :il_codigo;
//// IB945 - Fin.
//
//	IF iu_comunic.is_comunic.programa_llamante = 'iw_2301' OR &
//	   iu_comunic.is_comunic.programa_llamante = 'iw_7104_descargos' OR & 
//	   iu_comunic.is_comunic.programa_llamante = 'w_3113' THEN // IB945 - agregu$$HEX2$$e9002000$$ENDHEX$$condici$$HEX1$$f300$$ENDHEX$$n
//
//		gu_comunic.is_comunic.decval1 = il_codigo
//		
//		//Controlo que solo elija salidas de alta, media o baja
//		IF li_tipo = fgci_tipo_salida_de_estacion OR &
//			li_tipo = fgci_tipo_salida_at OR &
//			li_tipo = fgci_tipo_salida_de_baja THEN
//			OPEN(w_2220_identificacion_acometida,W_2120_identificacion_instalacion)
//			DESTROY lm_seleccion_acometida 
//		ELSE
//			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Solamente existen acometidas asociadas a Salidas de Alta, Media o Baja Tensi$$HEX1$$f300$$ENDHEX$$n", StopSign!)	
//			DESTROY lm_seleccion_acometida 
//			RETURN
//		END IF
//		
//		IF gu_comunic1.is_comunic.accion_retorno = "No Seleccionada" THEN
//			// Reseteo los valores de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada
//			il_nro_aco = 0
//			is_descripcion = ' '
//			il_codigo = 0
//			DESTROY lm_seleccion_acometida 
//			RETURN
//		ELSE
//			il_nro_aco = gu_comunic1.is_comunic.longval4
//			is_descripcion = gu_comunic1.is_comunic.strval10
//			// Cargo la variable de retorno para que se muestre la acometida en la 
//			// ventana w_2301_form_incidencia"			
//			gu_comunic1.is_comunic.programa_retorno = "iw_2220"
//			// Cargo la estructura con una funcion de la TreeView 
//			li_cargou =this.f_cargar_estructura_acometida(iu_comunic,il_nro_aco)
//			// Verifica si cargou sin problemas
//			If li_cargou = -1 THEN
//				DESTROY lm_seleccion_acometida 
//				RETURN
//			END IF
//		END IF
//	END IF
//ELSE
//	DESTROY lm_seleccion_acometida 
//	RETURN
//END IF
//
//// Destruyo la instancia del men$$HEX2$$fa002000$$ENDHEX$$creada anteriormente
//DESTROY lm_seleccion_acometida 
//
//YIELD()
//// Cierro la ventana
//// Las atribuiciones de las estructuras estan en el Close event
//CLOSE (Parent)
//
//
end event

event selectionchanged;call super::selectionchanged;if gb_red_trifasica = false AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta' then
	dw_fases.retrieve(il_codigo)
end if

//if newhandle> 0 then
//	
//	if ii_smt = 1 then // Si es una Salida de media y se est$$HEX2$$e1002000$$ENDHEX$$llamando desde descargos otras smt 
//		if tv_instala.ids_datos.GetItemNumber( tv_instala.ids_datos.Find("cl_handle = " + String(newhandle), 1,  tv_instala.ids_datos.RowCount() ), "cn_tipo") = fgci_tipo_salida_mt then
//			cb_aceitar.enabled = true
//		else
//			cb_aceitar.enabled = false
//		end if
//	else
//		cb_aceitar.enabled = true
//	end if
//end if
end event

event clicked;call super::clicked;long ll_fila
int li_tipo_inst
treeviewitem ltvi_actual

dw_fases.setredraw(false)

if isnull(handle) then  // SE TRIGGEA DESDE BUSCAR
	handle = message.longparm
end if


if handle> 0 then
	
	ll_fila = tv_instala.ids_datos.Find("cl_handle = " + String(handle), 1,  tv_instala.ids_datos.RowCount() )
	li_tipo_inst = tv_instala.ids_datos.GetItemNumber(ll_fila, "cn_tipo")
	iu_comunic.is_comunic.intval4 = li_tipo_inst
	This.GetItem(handle, ltvi_actual)
	
//	if ii_smt = 1 then // Si es una Salida de media y se est$$HEX2$$e1002000$$ENDHEX$$llamando desde descargos otras smt 
//		if li_tipo_inst = fgci_tipo_salida_mt then
//			cb_aceitar.enabled = true
//		else
//			cb_aceitar.enabled = false
//		end if
//	else
//		cb_aceitar.enabled = true
//	end if
//	
	if gb_red_trifasica= false AND gu_comunic.is_comunic.programa_llamante <> 'w_7101_consulta'then
		if li_tipo_inst = fgci_tipo_acometida and dw_fases.dataobject <> 'd_inst_2010_fases_acom' then
			dw_fases.dataobject='d_inst_2010_fases_acom'
			dw_fases.object.fase_a_t.text = "FASE " + gs_fase_a
			dw_fases.object.fase_b_t.text = "FASE " + gs_fase_b
			dw_fases.object.fase_c_t.text = "FASE " + gs_fase_c
			dw_fases.settransobject(sqlca)
		elseif li_tipo_inst <> fgci_tipo_acometida and dw_fases.dataobject <> 'd_inst_2010_fases' then
			dw_fases.dataobject='d_inst_2010_fases'
			dw_fases.object.fase_a_t.text = "FASE " + gs_fase_a
			dw_fases.object.fase_b_t.text = "FASE " + gs_fase_b
			dw_fases.object.fase_c_t.text = "FASE " + gs_fase_c
			dw_fases.settransobject(sqlca)
		end if
	
		
		il_codigo = ltvi_actual.data
		dw_fases.retrieve(il_codigo)
		
		dw_fases.object.fase_a[1] = '0'
		dw_fases.object.fase_b[1] = '0'
		dw_fases.object.fase_c[1] = '0'
	end if
end if

dw_fases.setredraw(true)
end event

event doubleclicked;call super::doubleclicked;//////////////////////////////////////////////////////////////
//
//	Evento : 	DoubleClicked
//
//	Objetivo: 	Insertar los itens de la instalacion cliqueada
//
//      Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//		  -----		-----------		---------
//		03/02/99		Marco Dias		Creacion
//
//////////////////////////////////////////////////////////////

TreeViewItem ltvi_actual
long ll_codigo

IF (handle <= 0 ) OR IsNull(handle) THEN
	Return
END IF


Yield()

// Verificamos si la instalacion actual ya fue expandida
This.GetItem(handle, ltvi_actual)

//If ltvi_actual.Expanded Then
//	// Esta expandida, aceitamos a instalacao
//	// IB945 - 15/05/2000
//	// cb_aceitar.TriggerEvent(Clicked!)
//	IF gu_comunic.is_comunic.programa_llamante <> "w_3113" AND &
//	   gu_comunic.is_comunic.programa_llamante <> "w_3111" THEN
//		cb_aceitar.TriggerEvent(Clicked!)
//	END IF
//	// IB945 - Fin.
//	RETURN
//End If

// Si vengo de marcar interrupciones, 
// no permito seleccionar una fase
il_codigo = ltvi_actual.data
//IF ib_otras_inst THEN
//	IF This.f_tipo_inst(ll_codigo) = fgci_tipo_salida_de_baja THEN
//		Return
//	END IF
//END IF


////////////////////////////////////////////////////
// Modificado rblengio
///////////////////////////////////////////////////
//If Not ltvi_actual.ExpandedOnce Then
//	// No fue expandida. Buscamos sus hijos
//	IF ib_jerarquia_permanente THEN
//		This.f_cargar_hijos(handle)
//	ELSE
//		This.f_cargar_hijos_tmp(handle)
//	End If
//End If
///////////////////////////////////////////////////

If Not ltvi_actual.Children Then
   // No fue expandida. Buscamos sus hijos
	IF iu_comunic.is_comunic.programa_llamante = 'w_1105_avisos_con_alim_b' OR &
		iu_comunic.is_comunic.programa_llamante = 'w_1105_avisos_con_alim_c' THEN
		IF fgci_con_acometidas= 1 then
			This.f_cargar_hijos(handle, TRUE)
		ELSE
			This.f_cargar_hijos(handle, FALSE)
		END IF

	ELSEIF gu_comunic.is_comunic.programa_llamante = "w_3113" THEN
		This.f_cargar_hijos(handle, TRUE)
	ELSE
		This.f_cargar_hijos(handle, FALSE)
	END IF

End If

end event

type d_tipo_inst from datawindow within w_2120_identificacion_instalacion
integer x = 274
integer y = 240
integer width = 1111
integer height = 116
integer taborder = 20
string dataobject = "dddw_2021_tipo_instalacion"
boolean border = false
boolean livescroll = true
end type

type sle_nome from singlelineedit within w_2120_identificacion_instalacion
integer x = 96
integer y = 116
integer width = 1262
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
textcase textcase = upper!
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type gb_busca from groupbox within w_2120_identificacion_instalacion
integer x = 50
integer y = 28
integer width = 1810
integer height = 340
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n a Buscar "
end type

type dw_fases from datawindow within w_2120_identificacion_instalacion
integer x = 50
integer y = 1096
integer width = 1806
integer height = 112
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_inst_2010_fases"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_fases.object.fase_a_t.text = "FASE " + gs_fase_a
dw_fases.object.fase_b_t.text = "FASE " + gs_fase_b
dw_fases.object.fase_c_t.text = "FASE " + gs_fase_c
end event

type rb_nombre from radiobutton within w_2120_identificacion_instalacion
integer x = 1422
integer y = 84
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por nombre"
boolean checked = true
end type

type rb_matricula from radiobutton within w_2120_identificacion_instalacion
integer x = 1422
integer y = 152
integer width = 402
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Por matr$$HEX1$$ed00$$ENDHEX$$cula"
end type


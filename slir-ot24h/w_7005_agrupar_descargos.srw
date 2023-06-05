HA$PBExportHeader$w_7005_agrupar_descargos.srw
forward
global type w_7005_agrupar_descargos from w_sgigenerica
end type
type dw_resultado from datawindow within w_7005_agrupar_descargos
end type
type cb_3 from commandbutton within w_7005_agrupar_descargos
end type
type cb_2 from commandbutton within w_7005_agrupar_descargos
end type
type tv_1 from uo_man_instalac within w_7005_agrupar_descargos
end type
type st_1 from statictext within w_7005_agrupar_descargos
end type
type gb_2 from groupbox within w_7005_agrupar_descargos
end type
type dw_lista_descargos from u_gen_0000_lista within w_7005_agrupar_descargos
end type
type dw_2 from datawindow within w_7005_agrupar_descargos
end type
type dw_1 from datawindow within w_7005_agrupar_descargos
end type
type sw_rama from structure within w_7005_agrupar_descargos
end type
end forward

type sw_rama from structure
	long		fila
	long		codigo
	long		tipo
end type

global type w_7005_agrupar_descargos from w_sgigenerica
integer x = 430
integer y = 588
integer width = 2816
integer height = 1224
string title = "Agrupar Descargos."
windowtype windowtype = response!
long backcolor = 79741120
dw_resultado dw_resultado
cb_3 cb_3
cb_2 cb_2
tv_1 tv_1
st_1 st_1
gb_2 gb_2
dw_lista_descargos dw_lista_descargos
dw_2 dw_2
dw_1 dw_1
end type
global w_7005_agrupar_descargos w_7005_agrupar_descargos

type variables
long il_fila, il_new_descargo
datetime idt_f_inicio
datetime idt_f_ini, idt_f_fin, idt_f_ini_new, idt_f_fin_new
long il_new_nro_descargo
long il_sesion_operacion
boolean ib_agrupado
int ii_grafica = 0
int ii_tipo_descargo = 1
end variables

forward prototypes
public subroutine fw_inst_descargo ()
public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo)
public subroutine fw_cargar_arbol (long co_nivel)
public function long fw_busqueda_arbol (long nro_padre)
public function integer fw_check_fechas ()
public function long fnu_obtener_ult_agrupado ()
public function long fnu_ult_descargo ()
public function integer fw_agrupa_padre ()
public function integer fw_agrupa_interrupciones ()
public function integer fw_graba ()
public function datetime fw_fecha_bd ()
public function integer fw_comprobar_estado (long pl_fila)
public function integer fw_agrupar_trabajos_bdi ()
public function integer fw_agrupar_descargos_trabajos ()
public function integer fw_agrupar_instalaciones_descargo ()
public function integer fw_agrupar_inst_afect ()
public function integer fw_agrupa_otras_inst ()
public function integer fw_agrupa_simulaciones ()
end prototypes

public subroutine fw_inst_descargo ();long ll_fila,ll_handle,ll_co_nivel, ll_codigo, ll_tipo,ll_icono
string ls_nombre
treeviewitem le_elemento
sw_rama sl_rama

//Obtengo el nombre, codigo de nivel
        
SELECT "SGD_INSTALACION"."NOM_INSTALACION",   
		 "SGD_INSTALACION"."TIPO_INSTALACION" , CO_NIVEL 
INTO :ls_nombre,   
	  :ll_tipo,:ll_co_nivel
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :gu_comunic.is_comunic.longval2   and 
    ( "SGD_INSTALACION"."BDI_JOB" = 0 );// DSA 10/01/2000			
        
// Compruebo si existe interrupciones para la instalacion en ese descargo
ll_fila = fw_tiene_interrupcion(dw_1,gu_comunic.is_comunic.longval2)

// Se crea la rama de primer nivel
ll_icono= tv_1.f_icono_arbol(ll_tipo)
ll_handle = tv_1.insertitemsort(0,ls_nombre,ll_icono)
tv_1.getitem(ll_handle,le_elemento)
sl_rama.codigo = gu_comunic.is_comunic.longval2
sl_rama.fila = 0
sl_rama.tipo= ll_tipo
// Si existe una interrupcion para esa instalacion se pone en negrilla
// Y se guarda el numero de fila donde se ha encontrado en interrupciones
if ll_fila > 0 then
	le_elemento.bold = true
	sl_rama.fila = ll_fila
end if

// Actualiza el elemento creado en el arbol
le_elemento.data = sl_rama
tv_1.setitem(ll_handle,le_elemento)

//Cargo el segundo nivel 
if ll_fila > 0 then
	return
end if

fw_cargar_arbol(ll_co_nivel+1)  
fw_cargar_arbol(ll_co_nivel+2)  
        
end subroutine

public function long fw_tiene_interrupcion (datawindow d_interrupcion, long codigo);long ll_fila
        
ll_fila = dw_1.find("cod_instalacion = " + string(codigo),1,dw_1.rowcount())

if sqlca.sqlcode = 0 then
	return ll_fila
else
	return 0
end if

end function

public subroutine fw_cargar_arbol (long co_nivel);// Recive co_nivel con el nivel de la instalacion que ha de aparecer en
// el siguiente nivel de la rama que tenemos ya cargada

Treeviewitem le_elemento, le_busqueda
string ls_nombre, ls_nombre_anterior
long ll_handle, ll_fila, ll_codigo, ll_nro_padre, ll_handle_buscado, ll_tipo,ll_icono
sw_rama sl_rama



setpointer(hourglass!)

DECLARE cu_nivel CURSOR FOR  
  SELECT "SGD_INSTALACION"."NOM_INSTALACION",
                        "SGD_INSTALACION"."NRO_INSTALACION",
                        "SGD_INSTALACION"."NRO_INST_PADRE", TIPO_INSTALACION
  FROM "SGD_INSTALACION",   
         "SGD_INTERRUPCION_DESCARGO"  
  WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" ) and  
			( "SGD_INSTALACION"."BDI_JOB" = 0 ) 	and // DSA 10/01/2000			
         ( "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :gu_comunic.is_comunic.longval1) and
         ( "SGD_INSTALACION"."CO_NIVEL" = :co_nivel ) ;

open cu_nivel ;


fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre, :ll_tipo ;

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
	//  Busca en el arbol alguna instalacion, que tenga el codigo de instalacion
	//  padre del que estoy intentando insertar.
	ll_handle_buscado = fw_busqueda_arbol(ll_nro_padre)
	
	// Si no existe el elemento buscado, solo puede ocurrir en tercer nivel
	// Busca el padre de la instalacion coge los datos
	// Interta la rama nueva y le dice el handle donde se ha insertado
	if ll_handle_buscado = -1 then
		long ll_tipo2
        
		SELECT "SGD_INSTALACION"."NOM_INSTALACION" , TIPO_INSTALACION
		INTO :ls_nombre_anterior, :ll_tipo2
		FROM "SGD_INSTALACION"  
		WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_padre   and
			 "SGD_INSTALACION"."BDI_JOB" = 0 ;// DSA 10/01/2000			

		ll_icono= tv_1.f_icono_arbol(ll_tipo2)
		ll_handle_buscado = tv_1.insertitemsort(1,ls_nombre_anterior,ll_icono)
		tv_1.getitem(ll_handle_buscado, le_elemento)
		sl_rama.codigo = ll_nro_padre
		sl_rama.fila = 0
		le_elemento.data = sl_rama
		tv_1.setitem(ll_handle_buscado,le_elemento)
		
	end if

	ll_icono= tv_1.f_icono_arbol(ll_tipo)        
	ll_handle = tv_1.insertitemsort(ll_handle_buscado,ls_nombre,ll_icono)
	tv_1.getitem(ll_handle, le_elemento)
	ll_fila = fw_tiene_interrupcion(dw_1,ll_codigo)
	sl_rama.codigo = ll_codigo
	sl_rama.fila = 0
	  
	if ll_fila > 0 then
		le_elemento.bold = true
		sl_rama.fila = ll_fila
	end if

   le_elemento.data = sl_rama
   tv_1.setitem(ll_handle,le_elemento)
        
   fetch cu_nivel into  :ls_nombre, :ll_codigo, :ll_nro_padre, :ll_tipo ;
        
loop

close cu_nivel ;


setpointer(arrow!)

end subroutine

public function long fw_busqueda_arbol (long nro_padre);Treeviewitem le_busqueda
long ll_handle_busqueda, ll_resultado
sw_rama sl_busqueda

ll_handle_busqueda = 1


setpointer(hourglass!)
DO
	ll_resultado = tv_1.getitem(ll_handle_busqueda, le_busqueda) 
        
	if ll_resultado = -1 then
		return -1
	end if

	sl_busqueda = le_busqueda.data

	if sl_busqueda.codigo = nro_padre then
		return ll_handle_busqueda
	end if

	ll_handle_busqueda ++

LOOP WHILE ll_handle_busqueda = ll_handle_busqueda

setpointer(arrow!)
end function

public function integer fw_check_fechas ();// Aqui tenemos 4 variable instanciadas idt_f_ini --> idt_f_fin
//                                                                                                       idt_f_ini_new --> idt_f_fin_new

// Comprobamos que la diferencia entre los tiempos de interrupcion no sea mayor de 6 horas
long ll_minutos, ll_minutos_new

ll_minutos = fg_duracion_minutos(idt_f_ini,idt_f_fin) 
ll_minutos_new = fg_duracion_minutos(idt_f_ini_new,idt_f_fin_new) 

if ll_minutos > ll_minutos_new then
	if (ll_minutos - ll_minutos_new) > 360 then
		return -1
	end if
end if

if ll_minutos < ll_minutos_new then
	if (ll_minutos_new - ll_minutos) > 360 then
		return -1
	end if
end if

ll_minutos = 0

if idt_f_ini_new > idt_f_ini then
	ll_minutos = fg_duracion_minutos(idt_f_ini,idt_f_ini_new) 
elseif idt_f_ini_new < idt_f_ini then
	ll_minutos = fg_duracion_minutos(idt_f_ini_new,idt_f_ini) 
end if

if ll_minutos > 360 then
	return -1
end if

ll_minutos = 0

if idt_f_fin_new > idt_f_fin then
	ll_minutos = fg_duracion_minutos(idt_f_fin,idt_f_fin_new) 
elseif idt_f_fin_new < idt_f_fin then
	ll_minutos = fg_duracion_minutos(idt_f_fin_new,idt_f_fin) 
end if

if ll_minutos > 360 then
	return -1
end if

// Si la diferencias entre las fechas no es superior a 6 horas
if idt_f_ini > idt_f_ini_new then
	idt_f_ini = idt_f_ini_new
end if

if idt_f_fin < idt_f_fin_new then
	idt_f_fin = idt_f_fin_new
end if
        
return 0
end function

public function long fnu_obtener_ult_agrupado ();long ll_nro_ult_descargo
long ll_encontrados
long ll_VALOR
date fecha

fecha = today()

SELECT count(*)  
INTO :ll_encontrados  
FROM "SGD_ULT_REG"  
WHERE "SGD_ULT_REG"."NOM_TABLA" = 'sgd_descargos_agrupados'   ;

if ll_encontrados > 0 then
	
	SELECT "SGD_ULT_REG"."VALOR"  
	INTO :ll_VALOR  
	FROM "SGD_ULT_REG"  
	WHERE "SGD_ULT_REG"."NOM_TABLA" = 'sgd_descargos_agrupados'  
	FOR UPDATE NOWAIT ;
                        
	IF sqlca.sqlcode<> 0 THEN       
		 gnv_msg.f_mensaje("AD22","","",ok!)
		 //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Espere un momento. Otro usuario est$$HEX2$$e1002000$$ENDHEX$$dando de alta un descargo.")
	ELSE
		UPDATE "SGD_ULT_REG"  
			SET "VALOR" = :ll_VALOR + 1,   
			"PROGRAMA" = 'DESCARGOS',   
			"F_ACTUAL" = :fecha,   
			"NOM_TABLA" = 'sgd_descargos_agrupados',   
			"USUARIO" = :gs_usuario  
		where "NOM_TABLA" = 'sgd_descargos_agrupados' ;
	END IF

else
	
	INSERT INTO "SGD_ULT_REG"  
		( "USUARIO",   
		"F_ACTUAL",   
		"PROGRAMA",   
		"NOM_TABLA",   
		"VALOR" )  
	VALUES ( :gs_usuario,   
				:fecha,   
				'DESCARGOS',   
				'sgd_descargos_agrupados',   
				1 )  ;
	
	ll_VALOR = 1
//	gnu_u_transaction.uf_commit();
end if

return ll_VALOR

end function

public function long fnu_ult_descargo ();long ll_nro_ult_descargo
long ll_encontrados
long ll_VALOR
date fecha

fecha = today()

SELECT count(*)  
INTO :ll_encontrados  
FROM "SGD_ULT_REG"  
WHERE "SGD_ULT_REG"."NOM_TABLA" = 'sgd_descargos'   ;

if ll_encontrados > 0 then
	
	SELECT "SGD_ULT_REG"."VALOR"  
	INTO :ll_VALOR  
	FROM "SGD_ULT_REG"  
	WHERE "SGD_ULT_REG"."NOM_TABLA" = 'sgd_descargos'  
	FOR UPDATE NOWAIT ;
			
	IF sqlca.sqlcode<> 0 THEN       
		 gnv_msg.f_mensaje("AD22","","",ok!)
		 //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Espere un momento. Otro usuario est$$HEX2$$e1002000$$ENDHEX$$dando de alta un descargo.")
	ELSE
		 
		UPDATE "SGD_ULT_REG"  
			SET "VALOR" = :ll_VALOR + 1,   
			"PROGRAMA" = 'DESCARGOS',   
			"F_ACTUAL" = :fecha,   
			"NOM_TABLA" = 'sgd_descargos',   
			"USUARIO" = :gs_usuario  
		where "NOM_TABLA" = 'sgd_descargos' ;
	END IF

else
        
	INSERT INTO "SGD_ULT_REG"  
		( "USUARIO",   
		"F_ACTUAL",   
		"PROGRAMA",   
		"NOM_TABLA",   
		"VALOR" )  
	VALUES ( :gs_usuario,   
				:fecha,   
				'DESCARGOS',   
				'sgd_descargos',   
				1 )  ;
	
	 ll_VALOR = 1
//	 gnu_u_transaction.uf_commit();
end if

return ll_VALOR
end function

public function integer fw_agrupa_padre ();long ll_fila=1, ll_cod_padre, ll_fila_padre, ll_fechas
dw_2.SetSort("#4 D")
dw_2.sort()


setpointer(hourglass!)

// Estas variables son las fechas hijas

idt_f_ini = dw_resultado.getitemdatetime(ll_fila,"f_ini_interrup")
idt_f_fin = dw_resultado.getitemdatetime(ll_fila,"f_fin_interrup")

// Conocemos quien es el padre
ll_cod_padre = dw_resultado.getitemnumber(ll_fila,"nro_inst_padre")

//Miramos si el padre tiene o no tiene interrupcion
ll_fila_padre = dw_resultado.find("nro_instalacion",1,dw_resultado.rowcount())

// Si no tiene padre ll_fila_padre = 0 entonces se ha agrupado todo bien
if ll_fila_padre = 0 then
        return 0
end if

setnull(idt_f_ini_new)
setnull(idt_f_fin_new)

idt_f_ini_new = dw_resultado.getitemdatetime(ll_fila_padre,"f_ini_interrup")
idt_f_fin_new = dw_resultado.getitemdatetime(ll_fila_padre,"f_fin_interrup")

if isnull(idt_f_ini_new) or isnull(idt_f_fin_new) then
        // En este caso la instalacion padre no tiene interrupcion
        // Hay que mirar el abuelo si tiene interrupcion
else
        // Si tiene interrupcion comprobamos que se pueda agrupar.
//                ll_fechas = fw_check_fechas() 
//        if ll_fechas < 0 then
//                // No se ha podido agrupar se genera mensaje de error y finaliza el agrupamiento
////              messagebox("Error","Existe un conflicto con alguna interrupcion superior")
//                gnv_msg.f_mensaje("ED27","","",Ok!)             
//                return -1
//        else
                // Se puede agrupar
                // Borrar el descargo hijo e intentamos buscar algun descargo que sea del mismo nivel
                dw_resultado.deleterow(ll_fila)
//        end if	GSE 05/04/2001
end if


setpointer(arrow!)

return 0
end function

public function integer fw_agrupa_interrupciones ();long ll_codigo_primero, ll_codigo_segundo, ll_fila = 1, ll_nro_descargo, ll_fechas
string ls_nombre
boolean lb_agrupado
int respuesta


setpointer(hourglass!)


if dw_2.rowcount() = 1 then
	dw_2.rowscopy(ll_fila, ll_fila,Primary!,dw_resultado,1,Primary!)        
   dw_2.deleterow(ll_fila)
else

do while dw_2.rowcount() > 0

	ll_codigo_primero = dw_2.getitemnumber(ll_fila,"nro_instalacion")
	ll_codigo_segundo = dw_2.getitemnumber(ll_fila+1,"nro_instalacion")
	  
	if ll_codigo_primero <> ll_codigo_segundo then
			 
		if lb_agrupado = true then
			lb_agrupado = false
			dw_2.rowscopy(ll_fila, ll_fila,Primary!,dw_resultado,1,Primary!)        
			dw_2.deleterow(ll_fila)
			if dw_2.rowcount() = 1 then
				exit
			end if
			
			continue
		end if
			 
		// Son diferentes el anterior al actual
		// Graba el primero en la nueva datawindow
	 
		dw_2.rowscopy(ll_fila, ll_fila,Primary!,dw_resultado,1,Primary!)
		dw_2.deleterow(ll_fila)
			 
		if dw_2.rowcount() = 1 then
			dw_2.rowscopy(ll_fila, ll_fila,Primary!,dw_resultado,1,Primary!)
			dw_2.deleterow(ll_fila)
			exit
		end if

	else
		// Obtengo las fechas
			 
		idt_f_ini = dw_2.getitemdatetime(ll_fila,"f_ini_interrup")
		idt_f_fin = dw_2.getitemdatetime(ll_fila,"f_fin_interrup")
		idt_f_ini_new = dw_2.getitemdatetime(ll_fila+1,"f_ini_interrup")
		idt_f_fin_new = dw_2.getitemdatetime(ll_fila+1,"f_fin_interrup")
			 
		// Valido las fechas para grabar el rango mayor
		IF idt_f_ini > idt_f_ini_new THEN
			idt_f_ini = idt_f_ini_new
		END IF 
		
		IF idt_f_fin < idt_f_fin_new THEN
			idt_f_fin = idt_f_fin_new
		END IF

//        ll_fechas = fw_check_fechas() 
//        if ll_fechas < 0 then
//           ls_nombre = dw_2.getitemstring(ll_fila,"nom_instalacion")
//           ll_nro_descargo = dw_2.getitemnumber(ll_fila,"descargo")                        
//           ll_nro_descargo_new = dw_2.getitemnumber(ll_fila+1,"descargo")                  
//           //messagebox("Error","Las duraciones de las interrupciones definidas en " + ls_nombre + " no puenden ser agrupadas para los descargos " + string(ll_nro_descargo) + " y " + string(ll_nro_descargo_new) + " excede de 6 horas")
//           gnv_msg.f_mensaje("ED28",ls_nombre,"",Ok!)                                      
//           return -1
//         else	
		lb_agrupado = true
		dw_2.setitem(ll_fila+1,"f_ini_interrup",idt_f_ini)
		dw_2.setitem(ll_fila+1,"f_fin_interrup",idt_f_fin)
		dw_2.accepttext()
		dw_2.deleterow(ll_fila)
		if dw_2.rowcount() = 1 then
			dw_2.rowscopy(ll_fila, ll_fila,Primary!,dw_resultado,1,Primary!)
			dw_2.deleterow(ll_fila)
		end if
//          end if
			 
	end if
loop
end if

if dw_2.rowcount() = 1 then
	dw_2.rowscopy(ll_fila, ll_fila,Primary!,dw_resultado,1,Primary!)        
   dw_2.deleterow(ll_fila)
end if

respuesta = fw_graba()

setpointer(arrow!)

return respuesta

//if respuesta = 0 then
//	return 1
//elseif respuesta = -2 then
//   return 0
//end if
//        
// Agrupados las interrupciones para la misma instalacion e instalaciones hijas
end function

public function integer fw_graba ();long ll_ult_agrupado, ll_fila = 1, ll_nro_inst, ll_nro_descargo, ll_nro_padre
string ls_desc, ls_obs
datetime ldt_f_ini, ldt_f_fin, ldt_aux_ini, ldt_aux_fin, ldt_new_ini, ldt_new_fin,ldt_fecha
int li_grafica, li_tipo_descargo, li_ind_obligada
string ls_ubicacion, ls_tel_solic, ls_jefe, ls_tel_trabajo, ls_tiempo_repos, ls_brigada, &
		 ls_agente, ls_tel_agente, ls_tel_aprueba
int li_unidad, li_trab_tension, li_plano, li_subest_movil
ldt_fecha = fw_fecha_bd()

il_new_descargo = il_new_nro_descargo
ll_ult_agrupado = fnu_obtener_ult_agrupado()
setnull(ldt_f_ini)
setnull(ldt_f_fin)
//Coloca el numero de agrupacion en los descargos seleccionados de la lista de descargos
dw_lista_descargos.setitem(il_fila,"sgd_descargos_nro_agrupacion",-1)

setpointer(hourglass!)

SELECT "SGD_DESCARGOS"."F_INI_SOLICITADO",
		 "SGD_DESCARGOS"."F_FIN_SOLICITADO",
		 NVL("SGD_DESCARGOS"."IND_ACT_GRAFICA", 0),
		 "SGD_DESCARGOS"."TIPO_DESCARGO",
		 "SGD_DESCARGOS"."UBICACION",
		 "SGD_DESCARGOS"."TEL_SOLIC",
		 "SGD_DESCARGOS"."TRAB_TENSION",
		 "SGD_DESCARGOS"."UNIDAD",
		 "SGD_DESCARGOS"."JEFE_TRABAJO",
		 "SGD_DESCARGOS"."TEL_TRABAJO",
		 "SGD_DESCARGOS"."PLANO",
		 "SGD_DESCARGOS"."TIEMPO_REPOS",
		 "SGD_DESCARGOS"."BRIGADA",
		 "SGD_DESCARGOS"."AGENTE",
		 "SGD_DESCARGOS"."TEL_AGENTE",
		 "SGD_DESCARGOS"."SUBEST_MOVIL",
		 "SGD_DESCARGOS"."TEL_APRUEBA"
INTO :ldt_f_ini,
	  :ldt_f_fin,
	  :ii_grafica,
	  :ii_tipo_descargo,
	  :ls_ubicacion,
	  :ls_tel_solic,
	  :li_trab_tension,
	  :li_unidad,
	  :ls_jefe,
	  :ls_tel_trabajo,
	  :li_plano,
	  :ls_tiempo_repos,
	  :ls_brigada,
	  :ls_agente,
	  :ls_tel_agente,
	  :li_subest_movil,
	  :ls_tel_aprueba
FROM "SGD_DESCARGOS"
WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :gu_comunic.is_comunic.longval1;


ll_fila = dw_lista_descargos.getselectedrow(0)
li_grafica = 0
ls_obs = string(gu_comunic.is_comunic.longval1)

do while ll_fila > 0
	dw_lista_descargos.setitem(ll_fila,"sgd_descargos_nro_agrupacion",-1)
	ldt_new_ini = dw_lista_descargos.GetItemDateTime (ll_fila,"sgd_descargos_f_ini_solicitado")
	ldt_new_fin = dw_lista_descargos.GetItemDateTime (ll_fila,"sgd_descargos_f_fin_solicitado")
	li_grafica = dw_lista_descargos.GetItemNumber (ll_fila,"ind_act_grafica")

	IF li_grafica > 0 and ii_grafica = 0 THEN
	  ii_grafica = 1
	END IF
	
	li_tipo_descargo = dw_lista_descargos.GetItemNumber (ll_fila,"tipo_descargo")
	
	IF li_tipo_descargo > 1 and ii_tipo_descargo = 1 THEN
		ii_tipo_descargo = li_tipo_descargo
	END IF
	
	IF IsNull(ldt_f_ini) then ldt_f_ini = ldt_new_ini
	
	IF IsNull(ldt_f_fin) then ldt_f_fin = ldt_new_fin
	
	IF ldt_new_ini < ldt_f_ini then ldt_f_ini = ldt_new_ini			  
	
	IF ldt_new_fin > ldt_f_fin then ldt_f_fin = ldt_new_fin
	
	ls_obs += ", " + string(dw_lista_descargos.GetitemNumber(ll_fila, 'nro_descargo'))
        //dw_lista_descargos.setitem(ll_fila,"estado",11)
   ll_fila = dw_lista_descargos.getselectedrow(ll_fila)


loop

ll_fila = 1

do while ll_fila <= dw_resultado.rowcount()
	ldt_aux_ini = dw_resultado.getitemdatetime(ll_fila,"f_ini_interrup")
	ldt_aux_fin = dw_resultado.getitemdatetime(ll_fila,"f_fin_interrup")
	if ldt_aux_ini < ldt_f_ini or isnull(ldt_f_ini) then
			 ldt_f_ini = ldt_aux_ini
	end if
	if ldt_aux_fin > ldt_f_fin or isnull(ldt_f_fin) then
			 ldt_f_fin = ldt_aux_fin
	end if
	ll_fila ++
	
loop

ll_nro_inst = dw_lista_descargos.getitemnumber(il_fila,"sgd_instalacion_nro_instalacion")
ls_desc = 'Agrupacion ' + string(ll_ult_agrupado)

INSERT INTO "SGD_DESCARGOS"  
	 ( "PROGRAMA", "USUARIO", "F_ALTA",   
		"NRO_DESCARGO", "ESTADO", "ID_SOLICITANTE",   
		"F_SOLICITADO", "F_INI_SOLICITADO", "F_FIN_SOLICITADO",   
		"TIPO_DESCARGO", "ID_ENVIADO", "COD_INST_ORIGEN",   
		"NRO_AGRUPACION",
		"NOM_DESC",
		"DESCRIPCION",
		"IND_ACT_GRAFICA",
		"IND_INTERRUPCION",
		"SGD_DESCARGOS"."UBICACION",
		"TEL_SOLIC",
		"TRAB_TENSION",
		"UNIDAD",
		"JEFE_TRABAJO",
		"TEL_TRABAJO",
		"PLANO",
		"TIEMPO_REPOS",
		"BRIGADA",
		"AGENTE",
		"TEL_AGENTE",
		"SUBEST_MOVIL",
		"TEL_APRUEBA")  
VALUES ( 'w_7005_agrupar', :gs_usuario, :ldt_fecha,   
			:il_new_nro_descargo, :fgci_descargo_solicitado, :GS_USUARIO,   
			:ldt_fecha, :ldt_f_ini, :ldt_f_fin,   
			:ii_tipo_descargo, 1, :ll_nro_inst,   
			:ll_ult_agrupado,
			:ls_desc,
			'Descargo Agrupado',
			:ii_grafica,
			1,
			:ls_ubicacion,
			:ls_tel_solic,
			:li_trab_tension,
			:li_unidad,
			:ls_jefe,
			:ls_tel_trabajo,
			:li_plano,
			:ls_tiempo_repos,
			:ls_brigada,
			:ls_agente,
			:ls_tel_agente,
			:li_subest_movil,
			:ls_tel_aprueba)  ;

if sqlca.sqlcode <> 0 then
   gnv_msg.f_mensaje("EG21","SGD_DESCARGOS " + sqlca.sqlerrtext ,"",Ok!)           
   //messagebox("Error","En SGD_DESCARGOS  " + sqlca.sqlerrtext)
   //gnu_u_transaction.uf_rollback();
   return 0
//else
//	gnu_u_transaction.uf_commit();
end if

ls_obs = 'Descargo resultante de agrupar los Descargos ' + ls_obs

IF fg_insertar_estado_descargo(il_new_nro_descargo, fgci_descargo_solicitado, &
										 ldt_f_ini, ldt_f_fin, fgnu_fecha_actual(), &
										 ls_obs, ll_nro_inst) = FALSE THEN

	messagebox("Aviso","El descargo no ha podido ser agrupado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
	return 0
END IF
//Se da de alta en la lista de descargos agrupados

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
ll_fila = 0

do while ll_nro_descargo > 0
	INSERT INTO "SGD_DESCARGOS_AGRUPADOS"  
	  ( "NRO_DESCARGO",   
		 "NRO_AGRUPACION",   
		 "OBSERVACIONES",   
		 "NRO_INSTALACION_AFECTADA",   
		 "USUARIO",   
		 "F_ACTUAL",   
		 "PROGRAMA" )  
   VALUES (:ll_nro_descargo,   
			 :ll_ult_agrupado,   
			 'Descargo Agrupado',   
			 :ll_nro_inst,   
			 :gs_usuario,   
			 :ldt_fecha,   
			 'w_7005_agrupar')  ;
												 
	ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
   
	if ll_fila = 0 then
   	exit
   end if
   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
loop

if sqlca.sqlcode <> 0 then
//      messagebox("Error","En SGD_DESCARGOS_AGRUPADOS  " + sqlca.sqlerrtext )
	gnv_msg.f_mensaje("EG21","SGD_DESCARGOS_AGRUPADOS " + sqlca.sqlerrtext ,"",Ok!)         
   //gnu_u_transaction.uf_rollback();
   return 0
//else
//	gnu_u_transaction.uf_commit();		  
end if

ll_fila = 1

//Se definen las interrupciones

do while ll_fila <= dw_resultado.rowcount()
	ldt_f_ini = dw_resultado.getitemdatetime(ll_fila,"f_ini_interrup")
	ldt_f_fin = dw_resultado.getitemdatetime(ll_fila,"f_fin_interrup")
	ll_nro_inst = dw_resultado.getitemnumber(ll_fila,"nro_instalacion")

	if isnull(ldt_f_ini) or isnull(ldt_f_fin) then
		ll_fila++
		continue
   end if
  
  	INSERT INTO "SGD_INTERRUPCION_DESCARGO"  
         ( "NRO_DESCARGO", "COD_INSTALACION", "F_INICIO",   
           "F_FIN", "F_ALTA", "PROGRAMA", "USUARIO" )  
  	VALUES ( :il_new_nro_descargo,    :ll_nro_inst,   :ldt_f_ini,   
           :ldt_f_fin,    :ldt_fecha,   'w_7005_agrupar',   :gs_usuario )  ;
   
	ll_fila ++
loop

if sqlca.sqlcode <> 0 then
//      messagebox("Error","En SGD_INTERRUPCION_DESCARGOS " + sqlca.sqlerrtext)
	gnv_msg.f_mensaje("EG21","SGD_INTERRUPCION_DESCARGOS " + sqlca.sqlerrtext ,"",Ok!)              
   //gnu_u_transaction.uf_rollback();
   return 0
//else
//	gnu_u_transaction.uf_commit();		  
end if

//gnu_u_transaction.uf_commit();
//dw_lista_descargos.update()

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
ldt_f_ini = dw_lista_descargos.GetItemDateTime (il_fila,"sgd_descargos_f_ini_solicitado")
ldt_f_fin = dw_lista_descargos.GetItemDateTime (il_fila,"sgd_descargos_f_fin_solicitado")

ll_fila = 0

do while ll_nro_descargo > 0
	UPDATE "SGD_DESCARGOS"  
	SET "NRO_AGRUPACION" = -1
	WHERE "NRO_DESCARGO" = :ll_nro_descargo;
	
//	IF SQLCA.SQLCODE= 0 THEN
//	  gnu_u_transaction.uf_commit();
//	ELSE
//	  gnu_u_transaction.uf_rollback();
//	END IF	
		
	IF fg_insertar_estado_descargo(ll_nro_descargo, fgci_descargo_agrupado, &
										 ldt_f_ini, ldt_f_fin, fgnu_fecha_actual(), "", 0) = FALSE THEN

		messagebox("Aviso","El descargo no ha podido ser agrupado debido a que no se ha podido guardar la infomaci$$HEX1$$f300$$ENDHEX$$n de los estados.")
		return 0
	END IF
	
   ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
	
	if ll_fila = 0 then
		 exit
	end if
	
   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
	ldt_f_ini = dw_lista_descargos.GetItemDateTime (ll_fila,"sgd_descargos_f_ini_solicitado")
	ldt_f_fin = dw_lista_descargos.GetItemDateTime (ll_fila,"sgd_descargos_f_fin_solicitado")

loop

if sqlca.sqlcode <> 0 then
//      messagebox("Error","En SGD_DESCARGOS_AGRUPADOS  " + sqlca.sqlerrtext )
//        gnv_msg.f_mensaje("EG21","SGD_DESCARGOS_AGRUPADOS " + sqlca.sqlerrtext ,"",Ok!)         
	//gnu_u_transaction.uf_rollback();
   return 0
//else
//	gnu_u_transaction.uf_commit();		  
end if

UPDATE "SGD_DESCARGOS"  
SET "ESTADO" = 11  
WHERE "SGD_DESCARGOS"."NRO_DESCARGO" IN (  SELECT "SGD_DESCARGOS_AGRUPADOS"."NRO_DESCARGO"  
                                           FROM "SGD_DESCARGOS_AGRUPADOS"  
                                           WHERE "SGD_DESCARGOS_AGRUPADOS"."NRO_AGRUPACION" = :ll_ult_agrupado  )  ;


/////////////////////////////////////////////////////////////////////////
// INDICATIVO OBLIGADA VERSION UNIFICADA AMR 22/08/2002
////////////////////////////////////////////////////////////////////////
  SELECT count(*)  
  INTO :li_ind_obligada
   FROM "SGD_DESCARGOS", "SGD_DESCARGOS_AGRUPADOS"
   WHERE ( ( "SGD_DESCARGOS_AGRUPADOS"."NRO_AGRUPACION" = :ll_ult_agrupado ) AND
          ("SGD_DESCARGOS"."NRO_DESCARGO" = "SGD_DESCARGOS_AGRUPADOS"."NRO_DESCARGO") AND          
         ( "SGD_DESCARGOS"."IND_OBLIGADA" = 1 ) )   ;		

			
	IF isnull(li_ind_obligada) then li_ind_obligada = 0
				
	IF li_ind_obligada > 0  THEN
	
		UPDATE "SGD_DESCARGOS"  
		SET "IND_OBLIGADA" = 1 
		WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_new_nro_descargo;
	ELSE
		UPDATE "SGD_DESCARGOS"  
		SET "IND_OBLIGADA" = 0 
		WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :il_new_nro_descargo;
		
	END IF
//////////////////////////////////////////////////////////////////////////

//IF SQLCA.SQLCODE= 0 THEN
//	gnu_u_transaction.uf_commit();
//ELSE
//	gnu_u_transaction.uf_rollback();
//END IF

setpointer(arrow!)

return 1
end function

public function datetime fw_fecha_bd ();datetime ldt_fecha

SELECT SYSDATE INTO :ldt_fecha FROM DUAL;

IF SQLCA.SQLCODE <> 0 THEN
	ldt_fecha = datetime(today(),now())
END IF

return ldt_fecha
end function

public function integer fw_comprobar_estado (long pl_fila);int li_estado, li_estado_bd
long ll_nro_descargo, ll_return

li_estado = dw_lista_descargos.GetItemNumber(pl_fila,'estado')
ll_nro_descargo = dw_lista_descargos.GetItemNumber(pl_fila,'nro_descargo')

SELECT ESTADO
INTO :li_estado_bd
FROM SGD_DESCARGOS
WHERE NRO_DESCARGO = :ll_nro_descargo;

IF (SQLCA.SQLCODE = 0) THEN
	IF (li_estado = li_estado_bd) THEN
		// NO HA CAMBIADO DE ESTADO
		ll_return = 0
	ELSE
		// SE HAN PRODUCIDO CAMBIOS 
		ll_return = 1
	END IF
ELSE
	// SE HAN PRODUCIDO CAMBIOS
	ll_return = 1
END IF

return ll_return
end function

public function integer fw_agrupar_trabajos_bdi ();// Cambio el estado de los trabajos asociados al descargo agrupado
// Los trabajos estar$$HEX1$$e100$$ENDHEX$$n en estado agrupado

int  li_total, li_res = 1
long ll_nro_descargo, ll_fila

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
ll_fila = 0

setpointer(hourglass!)

do while ll_nro_descargo > 0 and li_res = 1
	
	UPDATE SGD_TRABAJOS_BDI
	SET NRO_DESCARGO =:il_new_descargo,
		 DESC_ANTIGUO =:ll_nro_descargo
	WHERE NRO_DESCARGO = :ll_nro_descargo;

	if sqlca.sqlcode <> 0 then
		li_res = 0
		//gnu_u_transaction.uf_rollback();
	//else
		//gnu_u_transaction.uf_commit();
	end if	
	   
	ll_fila = dw_lista_descargos.getselectedrow(ll_fila)

   if ll_fila = 0 then
      ll_nro_descargo = 0
   else
	   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
	end if

loop

setpointer(arrow!)

return li_res
end function

public function integer fw_agrupar_descargos_trabajos ();long ll_fila = 0, ll_nro_descargo
datetime ldt_fecha
Int li_res = 1

ldt_fecha = fgnu_fecha_actual()
ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")


setpointer(hourglass!)

do while ll_nro_descargo > 0 AND li_res = 1
	INSERT INTO SGD_DESCARGOS_TRABAJOS
	(SELECT :gs_usuario,
			  F_ALTA,
			  'w_agrup_desc',
			  :il_new_descargo,
			  COD_OBRA,
			  COD_TRABAJO,
			  :ldt_fecha,
			  DESCRIPCION_TRAB,
			  DESCRIPCION_OBRA
	 FROM SGD_DESCARGOS_TRABAJOS
	 WHERE NRO_DESCARGO = :ll_nro_descargo AND
			 COD_OBRA || COD_TRABAJO NOT IN (SELECT COD_OBRA || COD_TRABAJO
														FROM SGD_DESCARGOS_TRABAJOS
														WHERE NRO_DESCARGO = :il_new_descargo));
														
	IF SQLCA.SQLCode <> 0 THEN
		li_res = 0
	END IF
	
	ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
   if ll_fila = 0 then
      ll_nro_descargo = 0
	else
	   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
	END IF

loop

setpointer(arrow!)

return li_res


//// Por cada descargo que ha sido agrupado inserto un nuevo registro con el nro del
//// nuevo descargo resultado de la agrupacion, si el codigo de obra y codigo de trabajo
//// es el mismo para varios descargos no inserto un nuevo registro ya que duplicaria la
//// clave primaria
//// GSE 05/04/2001
//
//int li_code
//long ll_fila, ll_nro_descargo
//string ls_cod_obra, ls_cod_trabajo, ls_descripcion_obra, ls_descripcion_trabajo
//boolean lb_inserto =true
//datetime ldt_fecha
//ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
//ll_fila = 0
//ldt_fecha = datetime(today(),now())
//DECLARE lcur_descargos CURSOR FOR
//	(SELECT COD_OBRA,
//			 COD_TRABAJO,
//			 DESCRIPCION_TRAB,
//			 DESCRIPCION_OBRA
//	FROM SGD_DESCARGOS_TRABAJOS
//	WHERE NRO_DESCARGO = :ll_nro_descargo);
//
//
//do while ll_nro_descargo > 0
// 
//	lb_inserto = true		
//	OPEN lcur_descargos;
//	FETCH lcur_descargos INTO :ls_cod_obra,:ls_cod_trabajo,:ls_descripcion_trabajo,:ls_descripcion_obra;
//	li_code = SQLCA.SQLCODE
//	do while (li_code =0)
//		IF lb_inserto THEN
//			INSERT INTO SGD_DESCARGOS_TRABAJOS
//					 (USUARIO,
//					  F_ALTA,
//					  PROGRAMA,
//					  NRO_DESCARGO,
//					  COD_OBRA,
//					  COD_TRABAJO,
//					  F_ACTUAL, 
//					  DESCRIPCION_TRAB,
//					  DESCRIPCION_OBRA)
//			VALUES (:gs_usuario,
//					  :ldt_fecha,
//					  'w_agrup_desc',
//					  :il_new_descargo,
//					  :ls_cod_obra,
//					  :ls_cod_trabajo,
//					  :ldt_fecha,
//					  :ls_descripcion_trabajo,
//					  :ls_descripcion_obra);
//		END IF					  
//		IF SQLCA.SQLCODE= 0 THEN
//			gnu_u_transaction.uf_commit();
//		ELSE
//			gnu_u_transaction.uf_rollback();
//		END IF
//		FETCH lcur_descargos INTO :ls_cod_obra,&
//										  :ls_cod_trabajo,&

//										  :ls_descripcion_trabajo,&
//										  :ls_descripcion_obra;
//		li_code = SQLCA.SQLCODE
//		IF (SQLCA.SQLCODE = 0) THEN
//			SELECT NRO_DESCARGO
//			INTO :ll_nro_descargo
//			FROM SGD_DESCARGOS_TRABAJOS
//			WHERE (COD_OBRA = :ls_cod_obra) 
//			AND (COD_TRABAJO = :ls_cod_trabajo) 
//			AND (NRO_DESCARGO = :il_new_Descargo);
//					
//			IF (SQLCA.SQLCODE = 0) THEN
//				lb_inserto = false
//			ELSE
//				lb_inserto = true
//			END IF
//		END IF		
//	loop
//	
//	Close lcur_descargos;
//	gnu_u_transaction.uf_commit();
//   ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
//   if ll_fila = 0 then
//      exit
//   end if
//   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
//
//loop
//
end function

public function integer fw_agrupar_instalaciones_descargo ();long ll_fila, ll_nro_descargo
DateTime ldt_f_actual
int li_res = 1

ldt_f_actual = fgnu_fecha_actual()

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
ll_fila = 0

setpointer(hourglass!)

do while ll_nro_descargo > 0 and li_res = 1
	INSERT INTO SGD_INSTALACIONES_DESCARGO
	( SELECT IDENTIFICADOR_INSTALACION,
				:il_new_descargo,
				DESCRIPCION,
				TIPO_CAMBIO,
				NRO_INSTALACION,
				TIPO_INSTALACION,
				F_ALTA,
				:gs_usuario,
				'w_agrup_desc',
				:ldt_f_actual
	 FROM SGD_INSTALACIONES_DESCARGO
	 WHERE NRO_DESCARGO = :ll_nro_descargo AND
			 IDENTIFICADOR_INSTALACION NOT IN (SELECT IDENTIFICADOR_INSTALACION 
														  FROM SGD_INSTALACIONES_DESCARGO
														  WHERE NRO_DESCARGO = :il_new_descargo)
	);
	
	IF SQLCA.SQLCode <> 0 THEN
		li_res = 0
	ELSE
			
		ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
	
		if ll_fila = 0 then
			ll_nro_descargo = 0
		else
			ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
		end if
	END IF
loop


setpointer(arrow!)

return li_res

//// Por cada descargo que ha sido agrupado inserto un nuevo registro con el nro del
//// nuevo descargo resultado de la agrupacion, si el numero de instalacion 
//// es el mismo para varios descargos no inserto un nuevo registro ya que duplicaria la
//// clave primaria
//// GSE 05/04/2001
//
//
//long ll_fila, ll_nro_descargo, ll_nro_instalacion
//string ls_id_instalacion, ls_descripcion, ls_tipo_cambio
//int li_tipo_instalacion, li_code
//boolean lb_inserto =true
//date ld_fecha
//ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
//ll_fila = 0
//ld_fecha = today()
//DECLARE lcur_descargos CURSOR FOR
//	(SELECT IDENTIFICADOR_INSTALACION,
//			 DESCRIPCION,
//			 TIPO_CAMBIO,
//			 NRO_INSTALACION,
//			 TIPO_INSTALACION
//	FROM SGD_INSTALACIONES_DESCARGO
//	WHERE NRO_DESCARGO = :ll_nro_descargo);
//
//
//do while ll_nro_descargo > 0
// 
//	lb_inserto = true		
//	OPEN lcur_descargos;
//	FETCH lcur_descargos INTO :ls_id_instalacion,&
//									  :ls_descripcion,&
//									  :ls_tipo_cambio,&
//			                    :ll_nro_instalacion,&
//									  :li_tipo_instalacion;
//	li_code = SQLCA.SQLCODE									  
//	do while (li_code =0)
//		IF lb_inserto THEN
//			INSERT INTO SGD_INSTALACIONES_DESCARGO
//					 (IDENTIFICADOR_INSTALACION,
//					  NRO_DESCARGO,
//					  DESCRIPCION,
//					  TIPO_CAMBIO,
//					  NRO_INSTALACION,
//					  TIPO_INSTALACION,
//					  F_ALTA,
//					  USUARIO,
//					  PROGRAMA,
//					  F_ACTUAL)
//					  
//			VALUES (:ls_id_instalacion,
//					  :il_new_descargo,
//					  :ls_descripcion,
//					  :ls_tipo_cambio,
//					  :ll_nro_instalacion,
//					  :li_tipo_instalacion,
//					  :ld_fecha,
//					  :gs_usuario,
//					  'w_agrup_desc',
//					  :ld_fecha);
//		END IF					  
//
//		IF SQLCA.SQLCODE= 0 THEN
//			gnu_u_transaction.uf_commit();
//		ELSE
//			gnu_u_transaction.uf_rollback();
//		END IF
//		
//		FETCH lcur_descargos INTO :ls_id_instalacion,&
//									  :ls_descripcion,&
//									  :ls_tipo_cambio,&
//			                    :ll_nro_instalacion,&
//									  :li_tipo_instalacion;
//		li_code = SQLCA.SQLCODE
//		IF (SQLCA.SQLCODE = 0) THEN
//			SELECT NRO_DESCARGO
//			INTO :ll_nro_descargo
//			FROM SGD_INSTALACIONES_DESCARGO
//			WHERE (IDENTIFICADOR_INSTALACION = :ls_id_instalacion) 
//			AND (NRO_DESCARGO = :il_new_Descargo);
//					
//			IF (SQLCA.SQLCODE = 0) THEN
//				lb_inserto = false
//			ELSE
//				lb_inserto = true
//			END IF
//		END IF		
//	loop
//	
//	Close lcur_descargos;
//	gnu_u_transaction.uf_commit();
//	
//   ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
//   if ll_fila = 0 then
//      exit
//   end if
//   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
//
//loop
//
end function

public function integer fw_agrupar_inst_afect ();DateTime ldt_f_actual
long ll_nro_descargo, ll_fila = 0
int li_res = 1

ldt_f_actual = fgnu_fecha_actual()

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")

setpointer(hourglass!)

do while ll_nro_descargo > 0 AND li_res = 1

	INSERT INTO SGD_DESCARGOS_INST_AFEC
	(SELECT :gs_usuario,
			  'w_agrup_desc',
			  :ldt_f_actual,
			  :il_new_descargo,
			  NRO_INSTALACION
	 FROM SGD_DESCARGOS_INST_AFEC
	 WHERE NRO_DESCARGO = :ll_nro_descargo AND
			 NRO_INSTALACION NOT IN (SELECT NRO_INSTALACION
											 FROM SGD_DESCARGOS_INST_AFEC
											 WHERE NRO_DESCARGO = :il_new_descargo)	);
	
	IF SQLCA.SQLCode <> 0 THEN
		li_res = 0 
	ELSE
		ll_fila = dw_lista_descargos.getselectedrow(ll_fila)

		if ll_fila = 0 then
			ll_nro_descargo = 0
		else
			ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
		end if
	END IF	
loop


setpointer(arrow!)

return li_res

end function

public function integer fw_agrupa_otras_inst ();long ll_fila, ll_nro_descargo
DateTime ldt_f_actual
int li_res = 1

ldt_f_actual = fgnu_fecha_actual()

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
ll_fila = 0

setpointer(hourglass!)

do while ll_nro_descargo > 0 and li_res = 1
	INSERT INTO SGD_DESCARGOS_INST_AFEC
	(  select :gs_usuario,
		'w_agrup_desc',
		:ldt_f_actual,
         :il_new_descargo,
         "SGD_DESCARGOS_INST_AFEC"."NRO_INSTALACION"  
    FROM "SGD_DESCARGOS_INST_AFEC"   
	 WHERE NRO_DESCARGO = :ll_nro_descargo AND
			 NRO_INSTALACION NOT IN (SELECT NRO_INSTALACION 
			 FROM  SGD_DESCARGOS_INST_AFEC
			 WHERE NRO_DESCARGO = :il_new_descargo ));
	 
//	INSERT INTO SGD_INSTALACIONES_DESCARGO
//	( SELECT IDENTIFICADOR_INSTALACION,
//				:il_new_descargo,
//				DESCRIPCION,
//				TIPO_CAMBIO,
//				NRO_INSTALACION,
//				TIPO_INSTALACION,
//				F_ALTA,
//				:gs_usuario,
//				'w_agrup_desc',
//				:ldt_f_actual
//	 FROM SGD_INSTALACIONES_DESCARGO
//	 WHERE NRO_DESCARGO = :ll_nro_descargo AND
//			 IDENTIFICADOR_INSTALACION NOT IN (SELECT IDENTIFICADOR_INSTALACION 
//														  FROM SGD_INSTALACIONES_DESCARGO
//														  WHERE NRO_DESCARGO = :il_new_descargo)
//	);
	
	IF SQLCA.SQLCode <> 0 THEN
		li_res = 0
	ELSE
			
		ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
	
		if ll_fila = 0 then
			ll_nro_descargo = 0
		else
			ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
		end if
	END IF
loop


setpointer(arrow!)

return li_res

//// Por cada descargo que ha sido agrupado inserto un nuevo registro con el nro del
//// nuevo descargo resultado de la agrupacion, si el numero de instalacion 
//// es el mismo para varios descargos no inserto un nuevo registro ya que duplicaria la
//// clave primaria
//// GSE 05/04/2001
//
//
//long ll_fila, ll_nro_descargo, ll_nro_instalacion
//string ls_id_instalacion, ls_descripcion, ls_tipo_cambio
//int li_tipo_instalacion, li_code
//boolean lb_inserto =true
//date ld_fecha
//ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
//ll_fila = 0
//ld_fecha = today()
//DECLARE lcur_descargos CURSOR FOR
//	(SELECT IDENTIFICADOR_INSTALACION,
//			 DESCRIPCION,
//			 TIPO_CAMBIO,
//			 NRO_INSTALACION,
//			 TIPO_INSTALACION
//	FROM SGD_INSTALACIONES_DESCARGO
//	WHERE NRO_DESCARGO = :ll_nro_descargo);
//
//
//do while ll_nro_descargo > 0
// 
//	lb_inserto = true		
//	OPEN lcur_descargos;
//	FETCH lcur_descargos INTO :ls_id_instalacion,&
//									  :ls_descripcion,&
//									  :ls_tipo_cambio,&
//			                    :ll_nro_instalacion,&
//									  :li_tipo_instalacion;
//	li_code = SQLCA.SQLCODE									  
//	do while (li_code =0)
//		IF lb_inserto THEN
//			INSERT INTO SGD_INSTALACIONES_DESCARGO
//					 (IDENTIFICADOR_INSTALACION,
//					  NRO_DESCARGO,
//					  DESCRIPCION,
//					  TIPO_CAMBIO,
//					  NRO_INSTALACION,
//					  TIPO_INSTALACION,
//					  F_ALTA,
//					  USUARIO,
//					  PROGRAMA,
//					  F_ACTUAL)
//					  
//			VALUES (:ls_id_instalacion,
//					  :il_new_descargo,
//					  :ls_descripcion,
//					  :ls_tipo_cambio,
//					  :ll_nro_instalacion,
//					  :li_tipo_instalacion,
//					  :ld_fecha,
//					  :gs_usuario,
//					  'w_agrup_desc',
//					  :ld_fecha);
//		END IF					  
//
//		IF SQLCA.SQLCODE= 0 THEN
//			gnu_u_transaction.uf_commit();
//		ELSE
//			gnu_u_transaction.uf_rollback();
//		END IF
//		
//		FETCH lcur_descargos INTO :ls_id_instalacion,&
//									  :ls_descripcion,&
//									  :ls_tipo_cambio,&
//			                    :ll_nro_instalacion,&
//									  :li_tipo_instalacion;
//		li_code = SQLCA.SQLCODE
//		IF (SQLCA.SQLCODE = 0) THEN
//			SELECT NRO_DESCARGO
//			INTO :ll_nro_descargo
//			FROM SGD_INSTALACIONES_DESCARGO
//			WHERE (IDENTIFICADOR_INSTALACION = :ls_id_instalacion) 
//			AND (NRO_DESCARGO = :il_new_Descargo);
//					
//			IF (SQLCA.SQLCODE = 0) THEN
//				lb_inserto = false
//			ELSE
//				lb_inserto = true
//			END IF
//		END IF		
//	loop
//	
//	Close lcur_descargos;
//	gnu_u_transaction.uf_commit();
//	
//   ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
//   if ll_fila = 0 then
//      exit
//   end if
//   ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
//
//loop
//
end function

public function integer fw_agrupa_simulaciones ();long ll_fila, ll_lista_desc[]
String ls_mensaje
Int li_res = 1, li_tension, li_tipo_instalacion

setpointer(hourglass!)

li_tension = dw_lista_descargos.getitemnumber(il_fila,"sgd_instalacion_tension")
li_tipo_instalacion = dw_lista_descargos.getitemnumber(il_fila,"sgd_instalacion_tipo_instalacion")

IF gb_operaciones AND (li_tension <=gi_tension_nivel_min AND li_tipo_instalacion <> fgci_tipo_ct) then 

	ll_lista_desc[1] = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")
	ll_fila = 1
	
	do while ll_fila > 0 
				
		ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
		
		if ll_fila > 0 then
			ll_lista_desc[upperbound(ll_lista_desc)+1] = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
		end if
	loop
	
	li_res = gu_rf_servidor_operacion.of_agrupa_simulacion_descargo(il_new_descargo, ll_lista_desc, ls_mensaje)
	
	If li_res = 0 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
	END IF
END IF

setpointer(arrow!)

return li_res
end function

on w_7005_agrupar_descargos.create
int iCurrent
call super::create
this.dw_resultado=create dw_resultado
this.cb_3=create cb_3
this.cb_2=create cb_2
this.tv_1=create tv_1
this.st_1=create st_1
this.gb_2=create gb_2
this.dw_lista_descargos=create dw_lista_descargos
this.dw_2=create dw_2
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_resultado
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.cb_2
this.Control[iCurrent+4]=this.tv_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.dw_lista_descargos
this.Control[iCurrent+8]=this.dw_2
this.Control[iCurrent+9]=this.dw_1
end on

on w_7005_agrupar_descargos.destroy
call super::destroy
destroy(this.dw_resultado)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.tv_1)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.dw_lista_descargos)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;call super::open; /////////////////////////////////////////////////////////////////////////
//	03/04/2000	DSA			Introducci$$HEX1$$f300$$ENDHEX$$n de Descargos sin interrupciones
//									En este caso agrupaci$$HEX1$$f300$$ENDHEX$$n no aplicable.
/////////////////////////////////////////////////////////////////////////

string ls_sql, ls_estado, ls_modi,ls_select
long ll_fila
Int li_tipo
datetime ldt_f_ini, ldt_f_fin

IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
	il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()
	SELECT "SGD_INSTALACION"."TIPO_INSTALACION" 
	INTO :li_tipo
	FROM "SGD_INSTALACION"  
	WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :gu_comunic.is_comunic.longval2   and 
    		( "SGD_INSTALACION"."BDI_JOB" = 0 );	
			 
	IF li_tipo < fgci_tipo_ct THEN
		li_tipo = fgci_tipo_salida_mt
	ELSE
		li_tipo = fgci_tipo_salida_de_baja
	END IF
ELSE
	li_tipo = fgci_tipo_salida_de_baja
END IF


dw_1.settransobject(sqlca)
dw_1.retrieve(gu_comunic.is_comunic.longval1)
fw_inst_descargo()
dw_lista_descargos.settransobject(sqlca)

IF gu_comunic.is_comunic.programa_llamante = "w_7006_gest_agrupacion" then

// Aqui lo que tengo que hacer es a$$HEX1$$f100$$ENDHEX$$adir una clausula en la que solo recupere los numeros de descargo
// existente en la tabla sgd_descargos_agrupados

	ls_sql =" SELECT SGD_DESCARGOS.ESTADO, GI_USUARIO_SGI.NOM_USUARIO, " + &
			  " SGD_DESCARGOS.F_SOLICITADO, SGD_DESCARGOS.F_APROBADO, " + &
			  " SGD_DESCARGOS.F_INI_APROBADO, SGD_DESCARGOS.F_FIN_APROBADO, " + &
			  " SGD_DESCARGOS.ID_ACTIVADO, SGD_DESCARGOS.F_ACTIVADO, " + &
			  " SGD_INSTALACION.NOM_INSTALACION, SGD_DESCARGOS.USUARIO, " + &
			  " SGD_INSTALACION.TENSION, SGD_DESCARGOS.NRO_DESCARGO, " + &
			  " SGD_DESCARGOS.ID_ENVIADO, SGD_DESCARGOS.F_INI_SOLICITADO, " + &
			  " SGD_DESCARGOS.F_FIN_SOLICITADO, SGD_INSTALACION.NRO_INSTALACION, " + &
			  " SGD_DESCARGOS.USUARIO, SGD_DESCARGOS.OBS_APROBADO, " + &
			  " SGD_DESCARGOS.ID_APROBACION, fgnu_duracion_str(F_INI_APROBADO,F_FIN_APROBADO), " + &
							" fg_duracion_int(F_INI_APROBADO,F_FIN_APROBADO) CL_DURACION , " + &
			  " SGD_DESCARGOS.COD_INST_ORIGEN, SGD_VALOR.DESCRIPCION, " + &
			  " SGD_DESCARGOS.OBS_SOLICITADO, SGD_DESCARGOS.NRO_AGRUPACION, 2, SGD_INSTALACION.TIPO_INSTALACION " + &
					 " FROM SGD_DESCARGOS, SGD_VALOR, GI_USUARIO_SGI, SGD_INSTALACION " + &
			  " WHERE (SGD_DESCARGOS.NRO_OT_OCEN IS NULL) AND " +&
                   "(SGD_DESCARGOS.USUARIO = GI_USUARIO_SGI.USUARIO (+)) AND " + &
							" (SGD_VALOR.CODIGO = SGD_DESCARGOS.ESTADO ) AND " + &
							" (SGD_VALOR.CODIF = 'ES_D') AND " + &
					      " (SGD_DESCARGOS.IND_INTERRUPCION <> 2) AND " + /* DSA 03/04/2000 */ &
							" (SGD_DESCARGOS.COD_INST_ORIGEN = SGD_INSTALACION.NRO_INSTALACION ) and " + &
							" (SGD_INSTALACION.BDI_JOB = 0 ) AND " + /* DSA 10/01/2000 */	& 
							" (SGD_DESCARGOS.NRO_DESCARGO in (SELECT NRO_DESCARGO " + &
							" FROM SGD_DESCARGOS_AGRUPADOS " + &
							" WHERE NRO_AGRUPACION = :nro_inst )) "
	ls_modi = "DataWindow.Table.Select=~" " + ls_sql + "~""
   ls_select= dw_lista_descargos.modify(ls_modi)

   dw_lista_descargos.retrieve(gu_comunic.is_comunic.longval3,gu_comunic.is_comunic.longval1,ldt_f_ini, ldt_f_fin, li_tipo)

else
        
                // SOLO LAS FECHAS DE INICIO DEL DESCARGO SELECCIONADO

  SELECT "SGD_DESCARGOS"."F_INI_SOLICITADO",   
         "SGD_DESCARGOS"."F_FIN_SOLICITADO"  
    INTO :ldt_f_ini,   
         :ldt_f_fin  
    FROM "SGD_DESCARGOS"  
   WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :gu_comunic.is_comunic.longval1   ;

//              messagebox("Longval3",gu_comunic.is_comunic.longval2)

                
	dw_lista_descargos.retrieve(gu_comunic.is_comunic.longval2,gu_comunic.is_comunic.longval1, ldt_f_ini, ldt_f_fin, li_tipo)
           
   if dw_lista_descargos.rowcount() < 2 then
   	gnv_msg.f_mensaje("AD43","","",OK!)
      close(w_7005_agrupar_descargos)
      return
   end if
                
   il_fila = dw_lista_descargos.find (" nro_descargo = " + string(gu_comunic.is_comunic.longval1), 1, dw_lista_descargos.rowcount())
   if il_fila > 0 then
   	dw_lista_descargos.setitem(il_fila,"seleccionada",1)
      dw_lista_descargos.accepttext()
   end if

end if
end event

event close;long ll_fila, ll_nro_descargo
if ib_agrupado then
	ll_fila = dw_lista_descargos.getselectedrow(ll_fila)
	
	do while ll_fila > 0 
		ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila,"nro_descargo")
		gnu_u_transaction.uf_commit(this,fgci_bloqueo_descargo,ll_nro_descargo)
		ll_fila = dw_lista_descargos.getselectedrow(ll_fila)        
		
	loop
end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7005_agrupar_descargos
end type

type dw_resultado from datawindow within w_7005_agrupar_descargos
boolean visible = false
integer x = 18
integer y = 1052
integer width = 3392
integer height = 444
integer taborder = 20
string dataobject = "dw_7005_agrup_desc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type cb_3 from commandbutton within w_7005_agrupar_descargos
integer x = 1362
integer y = 988
integer width = 320
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = " &Agrupar"
end type

event clicked;long ll_nro_instalacion, ll_fila, ll_nro_descargo, ll_fila_buscada = 0, ll_fila_reaux
long ll_nro_inst_interrup, ll_co_nivel, ll_nro_inst_padre
long ll_refresco
string ls_nombre, ls_buscada, ls_mensaje
datetime ldt_f_ini, ldt_f_fin
int li_islocked, respuesta


// SI  ES DE OPERACIONES ES NECESARIO COMPROBAR SI SE HA CAIDO EL SERVIDOR O
// HA HABIDO UN CORTE EN LA COMUNICACION, QUE PUEDA HACER QUE NO ESTE BLOQUEADA

// SI ES DE OPERACION entonces
IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) THEN
	if gu_rf_servidor_operacion.of_actualiza_icono() = 0  then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que no se puede conectar con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gnu_u_transaction.uf_rollback()
		Close(Parent)
		RETURN
		
	elseif gu_rf_servidor_operacion.of_devuelve_sesion() <> il_sesion_operacion then 
		// SE HA PRODUCIDO UN CORTE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que se ha producido un corte en la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gnu_u_transaction.uf_rollback()
		close(Parent)
		RETURN
	end if
end if

dw_2.reset()
dw_resultado.reset()

if dw_lista_descargos.getselectedrow(0) < 1 then
	//      messagebox("Error","Marque el descargo que quiere asociar")
   gnv_msg.f_mensaje("ED30","","",Ok!)                                     
   return
end if

ll_nro_descargo = dw_lista_descargos.getitemnumber(il_fila,"nro_descargo")

setpointer(Hourglass!)

do while ll_nro_descargo > 0

	DECLARE cu_descargos CURSOR FOR  
	SELECT "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION"  
	FROM "SGD_INTERRUPCION_DESCARGO"  
	WHERE "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :ll_nro_descargo   ; 
			 
	open cu_descargos;
			 
	fetch cu_descargos into :ll_nro_instalacion;
	do while sqlca.sqlcode = 0
	
		declare cu_carga cursor for
		(SELECT "NOM_INSTALACION","NRO_INSTALACION","CO_NIVEL","NRO_INST_PADRE"
		FROM "SGD_INSTALACION"  
		START WITH "SGD_INSTALACION"."NRO_INSTALACION" = :ll_nro_instalacion AND 
		"SGD_INSTALACION"."BDI_JOB" = 0
		CONNECT BY PRIOR "SGD_INSTALACION"."NRO_INST_PADRE" = "SGD_INSTALACION"."NRO_INSTALACION" AND 
		"SGD_INSTALACION"."BDI_JOB" = 0);
		
			
		open cu_carga;
		fetch cu_carga into :ls_nombre, :ll_nro_inst_interrup, :ll_co_nivel, :ll_nro_inst_padre;
		
		do while sqlca.sqlcode = 0
													 
			SELECT "USUARIO"  
			INTO :ls_buscada
			FROM "SGD_INTERRUPCION_DESCARGO"  
			WHERE "NRO_DESCARGO" = :ll_nro_descargo and "COD_INSTALACION" = :ll_nro_inst_interrup;
										  
			if sqlca.sqlcode = 100 then
				// No tiene interrupcion (Hay que comprobar que no exista ya en la datawindow
				ll_fila_reaux = dw_2.find("nro_instalacion = " + string(ll_nro_inst_interrup),1,dw_2.rowcount())                                        
		
				if ll_fila_reaux < 1 then
					// No tiene interrupcion y no esta en la lista se a$$HEX1$$f100$$ENDHEX$$ade
					ll_fila = dw_2.insertrow(0)
					dw_2.setitem(ll_fila,"nom_instalacion",ls_nombre)                                               
					dw_2.setitem(ll_fila,"nro_instalacion",ll_nro_inst_interrup)
					dw_2.setitem(ll_fila,"nro_inst_padre",ll_nro_inst_padre)
					dw_2.setitem(ll_fila,"descargo",0)
					dw_2.setitem(ll_fila,"procesado",0)
					dw_2.setitem(ll_fila,"co_nivel",ll_co_nivel)
					dw_2.setitem(ll_fila,"fila",ll_fila)
				end if
			else
				//Si tiene interrupcion se a$$HEX1$$f100$$ENDHEX$$ade pero hay que comprobar que no haya ninguna
				//instalacion sin interrupcion con el mismo codigo en la lista
				ll_fila_reaux = dw_2.find("descargo = 0 and nro_instalacion = " + string(ll_nro_inst_interrup),1,dw_2.rowcount())                                       
		
				if ll_fila_reaux > 0 then
					dw_2.deleterow(ll_fila_reaux)
				end if
				
				ll_fila = dw_2.insertrow(0)
				dw_2.setitem(ll_fila,"nom_instalacion",ls_nombre)
				dw_2.setitem(ll_fila,"nro_instalacion",ll_nro_inst_interrup)
				dw_2.setitem(ll_fila,"nro_inst_padre",ll_nro_inst_padre)
				dw_2.setitem(ll_fila,"descargo",ll_nro_descargo)
				dw_2.setitem(ll_fila,"procesado",0)
				dw_2.setitem(ll_fila,"co_nivel",ll_co_nivel)
				dw_2.setitem(ll_fila,"fila",ll_fila)
				
				//Obtengo las fecha de interrupcion
				
				SELECT "SGD_INTERRUPCION_DESCARGO"."F_INICIO",   
					  "SGD_INTERRUPCION_DESCARGO"."F_FIN"  
				INTO :ldt_f_ini,   
					  :ldt_f_fin
				FROM "SGD_INTERRUPCION_DESCARGO"  
				WHERE ( "SGD_INTERRUPCION_DESCARGO"."NRO_DESCARGO" = :ll_nro_descargo ) AND  
					  ( "SGD_INTERRUPCION_DESCARGO"."COD_INSTALACION" = :ll_nro_inst_interrup )   ;
		
				dw_2.setitem(ll_fila,"f_ini_interrup",ldt_f_ini)
				dw_2.setitem(ll_fila,"f_fin_interrup",ldt_f_fin)
											  
			end if
	
			fetch cu_carga into :ls_nombre, :ll_nro_inst_interrup, :ll_co_nivel, :ll_nro_inst_padre;                
		loop            

		close cu_carga;
		fetch cu_descargos into :ll_nro_instalacion;
	loop

	close cu_descargos;
	
	setpointer(arrow!)

	ll_fila_buscada = dw_lista_descargos.getselectedrow(ll_fila_buscada)
	
	if ll_fila_buscada > 0 then
		ll_nro_descargo = dw_lista_descargos.getitemnumber(ll_fila_buscada,"nro_descargo")              
		li_islocked=gnu_u_transaction.uf_lock(parent,'SGD_DESCARGOS','NRO_DESCARGO = '+ string(ll_nro_descargo),fgci_bloqueo_descargo,ll_nro_descargo)  	
		if  li_islocked <> 0 then 
		  return 
		end if
		
		ll_refresco = fw_comprobar_estado (ll_fila_buscada)
		IF ll_refresco = 1 THEN 
			gnv_msg.f_mensaje("ED32","","",Ok!)        
			gnu_u_transaction.uf_rollback(this,fgci_bloqueo_descargo,ll_nro_descargo)
			return
		end if
	
	else
		ll_nro_descargo = 0
	end if
loop

//Borro la instalacion 99999999 ya que no me hace falta

ll_fila_buscada = dw_2.find("nro_instalacion = " + string(fgcdec_aviso_con_alimentacion),1,dw_2.rowcount())                                     
dw_2.deleterow(ll_fila_buscada)

dw_2.SetSort("#1 A")
dw_2.sort()

il_new_nro_descargo = fnu_ult_descargo()

setpointer(hourglass!)

respuesta = fw_agrupa_interrupciones()
IF respuesta = 0 THEN
	ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de sus interrupciones"
END IF

IF respuesta > 0 THEN
	respuesta = fw_agrupar_trabajos_bdi()
	IF respuesta = 0 THEN
		ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de los trabajos de BDI"
	END IF
END IF

IF respuesta > 0 THEN
	respuesta = fw_agrupar_descargos_trabajos()
	IF respuesta = 0 THEN
		ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de los trabajos"
	END IF
END IF

IF respuesta > 0 THEN
	respuesta = fw_agrupar_instalaciones_descargo()
	IF respuesta = 0 THEN
		ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de las instalaciones"
	END IF
END IF

IF respuesta > 0 THEN
	respuesta = fw_agrupar_inst_afect()
	IF respuesta = 0 THEN
		ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de las instalaciones afectadas"
	END IF
END IF

IF respuesta > 0 THEN
	respuesta = fw_agrupa_otras_inst()
	IF respuesta = 0 THEN
		ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de las otras instalaciones agrupadas"
	END IF
END IF

IF respuesta > 0 THEN
	respuesta = fw_agrupa_simulaciones()
	IF respuesta = 0 THEN
		ls_mensaje = "No se ha podido efectuar la agrupaci$$HEX1$$f300$$ENDHEX$$n de los Descargos debido a un error en la agrupaci$$HEX1$$f300$$ENDHEX$$n de las simulaciones"
	END IF
END IF

IF respuesta > 0 THEN
	gnu_u_transaction.uf_commit()	
ELSE
	gnu_u_transaction.uf_rollback()	
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
END IF

ib_agrupado = true
setpointer(arrow!)
close(parent)


end event

type cb_2 from commandbutton within w_7005_agrupar_descargos
integer x = 1925
integer y = 988
integer width = 329
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;gnu_u_transaction.uf_rollback()
close(parent)
end event

type tv_1 from uo_man_instalac within w_7005_agrupar_descargos
integer x = 37
integer y = 140
integer width = 855
integer height = 928
integer taborder = 60
fontcharset fontcharset = ansi!
long backcolor = 81324524
boolean linesatroot = true
string picturename[] = {"SUBEST.bmp","Sal_tra1.bmp","CT1.bmp","TRANSFOR.bmp","SALBAJ.bmp"}
end type

type st_1 from statictext within w_7005_agrupar_descargos
integer x = 23
integer y = 24
integer width = 2734
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Agrupar descargo con:"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_7005_agrupar_descargos
integer x = 23
integer y = 84
integer width = 882
integer height = 1000
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
end type

type dw_lista_descargos from u_gen_0000_lista within w_7005_agrupar_descargos
event clicked pbm_dwnlbuttonclk
event doubleclicked pbm_dwnlbuttondblclk
event rbuttondown pbm_dwnrbuttondown
event ue_key_down pbm_dwnkey
integer x = 923
integer y = 116
integer width = 1838
integer height = 848
integer taborder = 80
string dataobject = "d_7001_lista_agrupacion"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;// No deja seleccionar el descargo origen del agrupamiento
if row = il_fila or row = 0 then
        return
end if

// Marco y desmarco la fila pulsada
if (this.getselectedrow(row - 1) = row) then
        this.selectrow(row,false)
else
        this.selectrow(row,true)
end if
end event

event ue_soltar_clicked;//
end event

event ue_mover_borde;//
end event

type dw_2 from datawindow within w_7005_agrupar_descargos
boolean visible = false
integer x = 82
integer y = 456
integer width = 3383
integer height = 436
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_7005_agrup_desc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
end type

type dw_1 from datawindow within w_7005_agrupar_descargos
boolean visible = false
integer x = 933
integer y = 216
integer width = 613
integer height = 288
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_descargo"
boolean livescroll = true
end type


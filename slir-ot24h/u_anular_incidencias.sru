HA$PBExportHeader$u_anular_incidencias.sru
forward
global type u_anular_incidencias from nonvisualobject
end type
type anulacion from structure within u_anular_incidencias
end type
type brigadas from structure within u_anular_incidencias
end type
end forward

type anulacion from structure
	string		usuario
	integer		cod_motivo
	datetime		fecha_anulacion
	string		descripcion
	long		nro_incidencia[ ]
end type

type brigadas from structure
	long		nro_brigada-contrata
	character		tipo
end type

global type u_anular_incidencias from nonvisualobject
end type
global u_anular_incidencias u_anular_incidencias

type variables
private anulacion ist_anulacion
private brigadas ot[]
u_avi_2004_pr_form_inf_resumen iu_avi_2004_pr
datastore dt_lista_avisos
datastore dt_lista_avisos_asociados
int fgci_anular = 1
int fgci_revocar = 2
int i_vez = 1
end variables

forward prototypes
public subroutine of_cargar_incidencia (long pl_nro_incidencia)
public subroutine of_ejecuta_anulacion ()
public function boolean of_verificar_cierre_mci (long pl_nro_incidencia)
public function boolean of_actualiza_estado (long pl_nro_incidencia)
public subroutine of_cargar_datos_motivo (long pl_cod_anulacion, string ps_usuario_anulacion, datetime pd_fecha_anulacion, string ps_descripcion)
public function boolean of_bloquear_ot (long pl_nro_incidencia)
public subroutine of_desbloquear_ot ()
public function boolean of_anular_ot (long pl_nro_incidencia)
public function boolean of_anular_avisos (long pl_nro_incidencia)
public subroutine of_desbloquear_avisos ()
public function boolean of_anula_incidencia (long pl_nro_incidencia, integer pi_comienzo_barra)
public function boolean of_comprobar_requisitos (long pl_nro_incidencia, ref string ps_mensaje_error)
public function boolean of_verifica_avisos (long pl_nro_incidencia, ref string ps_mensaje_error)
public function boolean of_verifica_interrupcion (long pl_nro_incidencia, ref string ps_mensaje_error)
public function boolean of_verifica_requisitos_anulacion (long pl_nro_incidencia, ref string ps_mensaje_error)
public subroutine of_revoca_anulacion (long pl_nro_incidencia)
public function boolean of_actualiza_estado_revocacion (long pl_nro_incidencia)
public function boolean of_anular_revocacion_ot (long pl_nro_incidencia)
public function boolean of_asociar_avisos (long pl_nro_incidencia)
public function boolean of_bloquea_avisos (long pl_incidencia, integer pi_accion)
public function boolean of_buscar_interrupcion (long pl_nro_incidencia, datetime pt_f_alta, datetime pdt_f_reposicion, datetime pdt_f_alta_a, datetime pdt_f_reposicion_a, datetime pdt_f_alta_b, datetime pdt_f_reposicion_b, datetime pdt_f_alta_c, datetime pdt_f_reposicion_c, long pl_nro_instalacion)
public function boolean of_busca_avisos_por_nis (long pl_nis, integer pi_ind_calidad)
public function boolean of_incidencia_operaciones (long pl_nro_incidencia)
public function boolean of_avisar_operacion (integer pi_accion, ref string ps_mensaje, long pl_nro_incidencia)
public subroutine of_cambiar_bitmap ()
public subroutine of_borra_datos_historicos (long pl_nro_incidencia)
end prototypes

public subroutine of_cargar_incidencia (long pl_nro_incidencia);// CARGA EN EL ARRAY EL/LOS  NUMEROS DE INCIDENCIAS SELECCIONADAS

long ll_contador 

ll_contador = long(upperbound(ist_anulacion.nro_incidencia) + 1)

ist_anulacion.nro_incidencia[ll_contador ] = pl_nro_incidencia
end subroutine

public subroutine of_ejecuta_anulacion ();int li_contador 
int li_avance_barra 

li_avance_barra = truncate(100 / upperbound(ist_anulacion.nro_incidencia),0)

OPEN(W_BARRA)
w_barra.enabled = false
W_BARRA.UO_BARRA.BARRA.visible=true



li_Contador = 1

do while li_Contador <=  upperbound(ist_anulacion.nro_incidencia)
			
				if not of_anula_incidencia(ist_anulacion.nro_incidencia[li_contador], ( li_contador -1 ) * li_avance_barra  ) then
					li_contador = upperbound(ist_anulacion.nro_incidencia) + 1 // NOS SALIMOS
				else
				 li_Contador  ++
				end if 
loop



W_BARRA.uo_barra.barra.f_amplia(100)
close(w_barra)

end subroutine

public function boolean of_verificar_cierre_mci (long pl_nro_incidencia);// verifica si las interrupciones de la incidencia son posteriores a la fecha del cierre del mci
// true ---> son posteriores
// false --> no son posteriores, no puede anular / desanular

boolean lb_resultado
lb_resultado = true
datetime ldt_fecha_cierre, ldt_fecha_min

//AHM (18/05/2009) 0/100080910
/*
  SELECT max("SCI_IND_TEC_HIST"."F_ACTUAL" )  
      INTO :ldt_fecha_cierre  
    FROM "SCI_IND_TEC_HIST";	 */
string	ls_fecha;		//Fecha del $$HEX1$$fa00$$ENDHEX$$ltimo cierre	 
	 
	 
SELECT max(to_char(anno)||decode(length(to_char(mes)), 2, to_char(mes), '0'||to_char(mes))) 
INTO :ls_fecha
FROM sci_ind_tec_hist;

ls_fecha = '01/' + mid(ls_fecha, 5, 6) + '/' + mid(ls_fecha, 1, 4)

ldt_fecha_cierre = datetime(date(ls_fecha))
	 
	 
IF IsNull(ldt_fecha_cierre) or sqlca.sqlcode<> 0  THEN
	// NO HAY CIERRE MCI -- > TRUE
	return true
end if	
	
SELECT min("SGD_INTERRUPCION"."F_REPOSICION")
INTO :ldt_fecha_min
FROM "SGD_INTERRUPCION" 
WHERE nro_incidencia = :pl_nro_incidencia;
 
IF IsNull(ldt_fecha_min) or sqlca.sqlcode<> 0  THEN			
// NO HAY INTERRUPCIONES -- > TRUE
	return true
end if	

if month(date(ldt_fecha_min)) <= month(date(ldt_fecha_cierre)) and &
   year(date(ldt_fecha_min)) <= year(date(ldt_fecha_cierre)) then 
	// TIENE INTERRUPCIONES TRATADAS EN EL MCI
	lb_resultado = false
end if


return lb_resultado
end function

public function boolean of_actualiza_estado (long pl_nro_incidencia);//////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_estado 
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Actualiza el estado de la incidencia e inserta un registro en el MCI
//	
//
//  Valores de retorno : true  --> No hay problemas 
//				  				 false --> Si hay problemas
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

boolean lb_resultado
int li_estado, li_alcance
lb_resultado = true

// OBTENEMOS EL ESTADO ANTERIOR DE LA INCIDENCIA
	
select est_Actual, alcance into :li_estado, :li_alcance from sgd_incidencia where nro_incidencia = :pl_nro_incidencia;
	
if sqlca.sqlcode = 0 then 
	
	UPDATE "SGD_INCIDENCIA"  
	SET "EST_ACTUAL" = :fgci_estado_anulado  ,
		cod_motivo  = :ist_anulacion.cod_motivo,
		descripcion_motivo = :ist_anulacion.descripcion,
		usuario_anulacion = :ist_anulacion.usuario,
		estado_anterior = :li_estado,
		ind_anulacion_sgi = 1,
		fecha_anulacion = :ist_anulacion.fecha_anulacion
	WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_incidencia   ;

	if sqlca.sqlcode = 0 then
		if li_alcance = fgci_incidencia_con_interrupcion then 	// SOLO CON PERDIDA
		
			// Se anulan las interrupciones
			UPDATE SGD_INTERRUPCION
			SET TIP_INTERRUPCION = 'A'
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

			// Se anulan las interrupciones
			UPDATE SGD_INTERRUPCION_RS
			SET TIP_INTERRUPCION = 'A'
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;		
			
			if sqlca.sqlcode = 0 then
		
			  INSERT INTO "SCI_INC_JUSTIFICADAS"  
				( "NRO_INCIDENCIA",   
				  "OBSERVACION",   
				  "USUARIO",   
				  "PROGRAMA",   
				  "F_ACTUAL" )  
			  VALUES ( :pl_nro_incidencia,   
				  'Incidencia anulada por OpenSgi',   
				  :ist_anulacion.usuario,   
				  'w_anulacion',   
				  :ist_anulacion.fecha_anulacion )  ;
				// NO HACE FALTA VERIFICAR EL ESTADO
			
			else
				lb_resultado = False
			end if
		end if
		
	else
		lb_resultado = false
	end if

else
	lb_resultado = false
end if
	
return lb_resultado 

end function

public subroutine of_cargar_datos_motivo (long pl_cod_anulacion, string ps_usuario_anulacion, datetime pd_fecha_anulacion, string ps_descripcion);
// Cargar generales de anulacion

this.ist_anulacion.cod_motivo = pl_cod_anulacion
this.ist_anulacion.usuario = ps_usuario_anulacion
this.ist_anulacion.fecha_anulacion = pd_fecha_anulacion
this.ist_anulacion.descripcion = ps_descripcion
end subroutine

public function boolean of_bloquear_ot (long pl_nro_incidencia);// BLOQUEA LAS BRIGADAS DE UNA OT, A  LA VEZ QUE GUARDA LAS BRIGADAS Y CONTRATAS QUE SE HAN DE TOCAR Y LIBERAR
long ll_nro_ot, ll_contador
int li_estado_ot
boolean lb_resultado
long ll_nro_brigada, ll_nro_contrata

brigadas lst_nula[]

Ot = lst_nula

lb_resultado = true

DECLARE cu_brigadas_ot CURSOR FOR  
  	SELECT GI_BRIGADA.nro_brigada	
			FROM GI_BRIGADA_OT, GI_BRIGADA
			WHERE GI_BRIGADA_OT.NRO_OT = :ll_nro_ot AND
					GI_BRIGADA_OT.NRO_BRIGADA = GI_BRIGADA.NRO_BRIGADA AND
					GI_BRIGADA_OT.EST_BRIGADA < :fgci_ot_resuelta AND
					GI_BRIGADA.IND_BLOQUEO = 0;
					
					
DECLARE cu_contratas_ot CURSOR FOR  
  	SELECT GI_contrataS.nro_contrata
			FROM GI_CONTRATA_OT, GI_CONTRATAS
			WHERE GI_CONTRATA_OT.NRO_OT = :ll_nro_ot AND
					GI_CONTRATA_OT.NRO_CONTRATA = GI_CONTRATAS.NRO_CONTRATA AND
					GI_CONTRATA_OT.EST_BRIGADA < :fgci_ot_resuelta ;
	
					


// OBTENEMOS LA OT 


select nvl(ot,0)  into :ll_nro_ot from sgd_incidencia where nro_incidencia = :pl_nro_incidencia ;

if sqlca.sqlcode <> 0 or ll_nro_ot =0  then 
	// NO TIENE OT
	lb_resultado = true
	
else
	// OBTENEMOS EL ESTADO DE LA OT --> SI ESTA RESUELTA NO HACE FALTA BLOQUEAR NADA SOLO SE CAMBIA EL ESTADO DE LA OT
	select est_ot into :li_estado_ot from gi_ot where nro_ot = :ll_nro_ot;

	
	if li_estado_ot = fgci_ot_resuelta then 
		lb_resultado = true
	else
	// NO ESTA RESUELTA  --> BLOQUEAMOS LA BRIGADAS
	
		open cu_brigadas_ot;
		fetch cu_brigadas_ot into :ll_nro_brigada;
		DO WHILE sqlca.sqlcode = 0 and lb_resultado 
		  
		  	  if 	gnu_u_transaction.uf_lock_brigada(ll_nro_brigada) = 0 then // BLOQUEO CORRECTO
			  		ll_contador = upperbound(ot) + 1
					ot[ll_contador].nro_brigada-contrata = ll_nro_brigada
					ot[ll_contador].tipo='B'
					fetch cu_brigadas_ot into :ll_nro_brigada;
			else
				lb_resultado = false
			end if

		LOOP
		close	cu_brigadas_ot;

		// Y ALMACENAMOS LAS CONTRATAS
		
		open cu_contratas_ot;
		fetch cu_contratas_ot into :ll_nro_contrata;
		DO WHILE sqlca.sqlcode = 0 and lb_resultado 
		  
		  	  		ll_contador = upperbound(ot) + 1
					ot[ll_contador].nro_brigada-contrata = ll_nro_contrata
					ot[ll_contador].tipo='C'
					fetch cu_contratas_ot into :ll_nro_contrata;
		LOOP
		
		close	cu_contratas_ot;
		
	
	end if
	
	
end if


return  lb_resultado
end function

public subroutine of_desbloquear_ot ();// DESBLOQUEA LAS BRIGADAS DE LA OT QUE HAN SIDO BLOQUEADAS PREVIAMENTE Y ESTEN ALMACENADAS EN OT[]

long ll_contador

for ll_contador = 1 to upperbound(ot)
	
	if ot[ll_contador].tipo='B' then  // ES UNA BRIGADA --> SE DESBLOQUEA
			gnu_u_transaction.uf_unlock_brigada(ot[ll_contador].nro_brigada-contrata)
	end if
	
next
end subroutine

public function boolean of_anular_ot (long pl_nro_incidencia);boolean lb_resultado
long ll_nro_ot
int li_estado_ot
long ll_contador
lb_resultado = true


// OBTENEMOS LA OT 


select nvl(ot,0)  into :ll_nro_ot from sgd_incidencia where nro_incidencia = :pl_nro_incidencia ;

if sqlca.sqlcode <> 0 or ll_nro_ot =0  then 
	// NO TIENE OT
	lb_resultado = true
	
else
	// OBTENEMOS EL ESTADO DE LA OT --> SI ESTA RESUELTA  SOLO SE CAMBIA EL ESTADO DE LA OT
	select est_ot into :li_estado_ot from gi_ot where nro_ot = :ll_nro_ot;
	
	if li_estado_ot = fgci_ot_resuelta then 
		update gi_ot set est_ot = :fgci_estado_anulado, f_hasta_anulacion=:ist_anulacion.fecha_anulacion where nro_ot = :ll_nro_ot;
		if sqlca.sqlcode = 0 then 
			lb_resultado = true
		else
			lb_resultado = false
			
		end if
	else // ESTADO_DISTINTO
		// ANULAMOS LA OT 
		update gi_ot set est_ot = :fgci_estado_anulado, f_hasta =:ist_anulacion.fecha_anulacion, f_hasta_anulacion=:ist_anulacion.fecha_anulacion  where nro_ot = :ll_nro_ot;
		
		for ll_contador = 1 to upperbound(ot)
			if ot[ll_contador].tipo='B' then 
				update gi_brigada set ind_disponible = 1 where nro_brigada = :ot[ll_contador].nro_brigada-contrata;
				  UPDATE "GI_BRIGADA_OT"   SET "F_HASTA" = :this.ist_anulacion.fecha_anulacion,   
		         "EST_BRIGADA" = :fgci_ot_resuelta  
					WHERE ( "GI_BRIGADA_OT"."NRO_BRIGADA" = :ot[ll_contador].nro_brigada-contrata ) AND  
			         ( "GI_BRIGADA_OT"."NRO_OT" = :ll_nro_ot )   ;

				
			else
				UPDATE "GI_CONTRATA_OT"   SET "F_HASTA" = :this.ist_anulacion.fecha_anulacion,   
		         "EST_BRIGADA" = :fgci_ot_resuelta  
					WHERE ( "GI_CONTRATA_OT"."NRO_CONTRATA" = :ot[ll_contador].nro_brigada-contrata ) AND  
			         ( "GI_CONTRATA_OT"."NRO_OT" = :ll_nro_ot )   ;

				
				
			end if
			
			
			
			
			
		next
		


	end if
	
	
end if










return lb_resultado



end function

public function boolean of_anular_avisos (long pl_nro_incidencia);// ANULA LOS AVISOS DE LA INCIDENCIA, LIBERANDOLOS

boolean lb_resultado 
lb_resultado = true


int li_nro_llamadas
long ll_incidencia_aux
long ll_instalacion,ll_clase_aviso,ll_nis
string ls_nombre_instalacion
int li_centro,li_mesa,li_cmd
datetime ldt_f_nula
datetime  ldt_f_alta,ldt_f_actual,ldt_f_nueva, ldt_f_res_anulacion, ldt_f_res

int li_tipo_red, li_retorno

long   ll_ot,  ll_nro_aviso,ll_ind_incidencia,ll_nro_inc
boolean lb_inc_asoc = False


/////////// Declaraci$$HEX1$$f300$$ENDHEX$$n de variables para la llamada a fnu_o_inf_comple_sum
long ll_orden_servicio
long ll_nro_inciden
boolean lb_incid_pos
string ls_nombre
long ll_contador 
ls_nombre = " "
///////////

iu_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen

ldt_f_nueva = fgnu_fecha_actual()

//fetch cu_avisos_asociados into :ll_nro_Aviso, :ll_nis,:li_cmd,:li_mesa, :li_centro, :ldt_f_actual,:ll_clase_aviso, :ll_instalacion,:ldt_f_alta;

for ll_contador = 1 to dt_lista_avisos.rowcount()
	
	ll_incidencia_aux = pl_nro_incidencia
	ll_nro_aviso = dt_lista_avisos.object.nro_aviso[ll_contador]

	ll_nis =  dt_lista_avisos.object.nis_rad[ll_contador]
	li_cmd =  dt_lista_avisos.object.nro_cmd[ll_contador]
	li_mesa =  dt_lista_avisos.object.nro_mesa[ll_contador]
	li_centro =  dt_lista_avisos.object.nro_centro[ll_contador]
	ldt_f_actual = dt_lista_avisos.object.f_Actual[ll_contador]
	ll_clase_aviso = dt_lista_avisos.object.clase_aviso[ll_contador]
	ll_instalacion = dt_lista_avisos.object.nro_instalacion[ll_contador]
	ldt_f_alta = dt_lista_avisos.object.f_Alta[ll_contador]
	ldt_f_res_anulacion = dt_lista_avisos.object.fecha_res[ll_contador]

	// SE BORRAN LOS REGISTROS EN GI_AVISOS_INSTALACION  SI EXISTEN (AVISOS NO RESUELTOS)
	
	delete from gi_Avisos_instalacion where nro_Aviso = : ll_nro_aviso;

	lb_incid_pos=false

		
	if ll_clase_aviso = fgci_clase_avi_calidad then
		iu_avi_2004_pr.is_avisos.gi_ind_calidad= 1
	end if
	
	
	
	iu_avi_2004_pr.is_avisos.gl_nro_aviso=ll_nro_aviso
	iu_avi_2004_pr.is_avisos.gd_f_alta=ldt_f_alta
	iu_avi_2004_pr.is_avisos.gl_nro_instalacion=ll_instalacion
	iu_avi_2004_pr.is_avisos.gs_ventana_carga = "w_anul"
	
	// llamo a inf comple sum para cargar conectividad y comprobar si me afecta alguna interrupcion
	
	IF ll_clase_aviso = fgci_clase_avi_calidad or  ll_clase_aviso = fgci_clase_avi_normal then
	
	
		li_retorno=iu_avi_2004_pr.fpr_o_inf_comple_sum(ll_orden_servicio,ll_incidencia_aux,ll_nis,lb_incid_pos,ls_nombre)
		
		if li_retorno = 2 then
		
//			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Una interrupci$$HEX1$$f300$$ENDHEX$$n afecta a la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada el aviso se asociar$$HEX2$$e1002000$$ENDHEX$$a la incidencia.")
			iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_asociado
			ll_nro_inc = iu_avi_2004_pr.is_avisos.gl_nro_incidencia
			ll_ind_incidencia = 1
			ldt_f_res= ldt_f_nula
			
		elseif li_retorno = 3 then
			if ll_incidencia_aux <> pl_nro_incidencia then /// SOLO SI NO  ES LA MISMA INCIDENCIA
	//			messagebox("Retorno",string(ll_incidencia_aux))
				ldt_f_res = iu_avi_2004_pr.is_avisos.gdt_f_res 
				iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_resuelto
				ll_nro_inc = iu_avi_2004_pr.is_avisos.gl_nro_incidencia
				ll_ind_incidencia = 0			
			else
				li_retorno =1 // SI SON IGUALES ESTARIA PENDIENTE
			end if 

			
			
		end if
		
		// llamo a avisos instalacion
		IF li_retorno <> 3 then
				ll_nro_inc = 0
				ll_ind_incidencia = 0
				ldt_f_res = ldt_f_nula
		if iu_avi_2004_pr.fpr_avisos_instalacion(ll_clase_aviso) = -1 then
				destroy iu_avi_2004_pr
				return false;
			end if
		end if
	
	ELSE
		
		iu_avi_2004_pr.is_avisos.gi_est_aviso = fgci_aviso_pendiente
		ldt_f_res = ldt_f_nula			
		ll_nro_inc = 0
		ll_ind_incidencia = 0
		
		//Ingresamos el aviso de ayuda o de alumbrado p$$HEX1$$fa00$$ENDHEX$$blico en gi_avisos_instalacion de nuevo.
		
 		SELECT "SGD_INSTALACION"."NOM_INSTALACION"  
    		INTO :ls_nombre_instalacion  
    		FROM "SGD_INSTALACION"  
   		WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ll_instalacion   ;

		  INSERT INTO "GI_AVISOS_INSTALACION"  
				( "F_ACTUAL",   
				  "USUARIO",   
				  "PROGRAMA",   
				  "TIPO_INSTALACION",   

				  "NRO_AVISO",   
				  "NRO_INSTALACION",   
				  "NRO_INST_PADRE",  
				  "EST_AVISO",   
				  "TIPO_AVISO",   
				  "NRO_ZONA",   
				  "NRO_CMD",   
				  "NRO_SECTOR",   
				  "F_ALTA",   
				  "IND_RED",   
				  "CLASE_AVISO",   
				  "NOM_INSTALACION" )  
	  VALUES ( 
				  :ldt_f_nueva,   
				  :gs_usuario,  
				  'ANULA',
				  0,   
				  :ll_nro_aviso,   
				  :ll_instalacion,   
				  0,   
				  :iu_avi_2004_pr.is_avisos.gi_est_aviso,   
				  :ll_clase_aviso,   
				  :li_centro,
				  :li_cmd,     
				  :li_mesa,   
				  :ldt_f_alta,   
				  0,   
				  :ll_clase_aviso,
				  :ls_nombre_instalacion)  ;
				  
		if sqlca.sqlcode = -1 then
				destroy iu_avi_2004_pr
   			return false
	end if

				  
	END IF
	
	if of_busca_avisos_por_nis(ll_nis,iu_avi_2004_pr.is_avisos.gi_ind_calidad) then // HAY AVISOS DEL MISMO NIS 
		li_nro_llamadas = 1
	else
		li_nro_llamadas = 0
	end if
	
	UPDATE GI_AVISOS 
	SET 	EST_AVISO = :iu_avi_2004_pr.is_avisos.gi_est_aviso,
			USUARIO = :gs_usuario,
			IND_IMPROCEDENTE = 0,
			F_ACTUAL = :ldt_f_nueva,
			FECHA_RES = decode (:iu_avi_2004_pr.is_avisos.gi_est_aviso,:fgci_aviso_resuelto,:iu_avi_2004_pr.is_avisos.gdt_f_res,null),
			PROGRAMA = 'ANULA',
			IND_INC_ASOC = :ll_ind_incidencia,
			NRO_INCIDENCIA = :ll_nro_inc,
			incidencia_anulacion = :pl_nro_incidencia,
			fecha_res_anulacion = :ldt_f_res_anulacion,
			NRO_LLAMADAS = NRO_LLAMADAS + :li_nro_llamadas 
	WHERE NRO_AVISO = :ll_nro_aviso;

//messagebox(string(ll_nro_aviso),string(sqlca.sqlcode))

//messagebox(string(iu_avi_2004_pr.is_avisos.gi_est_aviso),string(sqlca.sqlnrows))
	
	if sqlca.sqlcode = -1 then
				destroy iu_avi_2004_pr
   			return false
	end if

	UPDATE GI_AVISOS_INSTALACION
	SET F_ACTUAL = :ldt_f_nueva
	WHERE NRO_AVISO = :ll_nro_aviso;
	

	
	
	if sqlca.sqlcode = -1 then
				destroy iu_avi_2004_pr
   			return false
	end if


	
	iu_avi_2004_pr.is_avisos.gs_ventana_carga= ""
	


next
	
destroy iu_avi_2004_pr
return lb_resultado
end function

public subroutine of_desbloquear_avisos ();// DESBLOQUEA LOS AVISOS DE LA INCIDENCIA

long ll_contador, ll_nro_Aviso





if dt_lista_avisos.rowcount() > 0  then  // HAY AVISOS 
		for ll_contador = 1 to dt_lista_avisos.rowcount()
			ll_nro_aviso = dt_lista_Avisos.object.nro_aviso[ll_contador]
			 gnu_u_transaction.uf_desbloquea_avisos(  ll_nro_aviso,1)
		next
end if 

if isvalid(dt_lista_avisos_asociados) then  // SOLO PARA ANULACION
	if dt_lista_avisos_asociados.rowcount() > 0  then  // HAY AVISOS 
		for ll_contador = 1 to dt_lista_avisos_asociados.rowcount()
			ll_nro_aviso = dt_lista_avisos_asociados.object.nro_aviso[ll_contador]
			 gnu_u_transaction.uf_desbloquea_avisos(  ll_nro_aviso,1)
		next
	end if 
destroy dt_lista_avisos_asociados
end if




destroy dt_lista_avisos
end subroutine

public function boolean of_anula_incidencia (long pl_nro_incidencia, integer pi_comienzo_barra);int li_avance_barra 
long ll_nro_brig_bloq
string ls_mensaje_error
int li_lock_status
boolean lb_incidencia_operacion, lb_ok
long  ll_contador 

setpointer(hourglass!)

li_avance_barra = truncate(100 / upperbound(ist_anulacion.nro_incidencia),0)

W_BARRA.UO_BARRA.gb_1.text="Bloqueando Incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+"..."
W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + li_avance_barra /10 ,0))
w_operaciones.setfocus()
li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)
						
IF li_lock_status = 0 THEN
	// Se comprueba si existen brigadas asociadas a la incidencia bloqueadas
	SELECT COUNT(GI_BRIGADA.NRO_BRIGADA)
	INTO :ll_nro_brig_bloq
	FROM SGD_INCIDENCIA, GI_BRIGADA_OT, GI_BRIGADA
	WHERE SGD_INCIDENCIA.NRO_INCIDENCIA = :pl_nro_incidencia AND
			SGD_INCIDENCIA.OT = GI_BRIGADA_OT.NRO_OT AND
			GI_BRIGADA_OT.NRO_BRIGADA = GI_BRIGADA.NRO_BRIGADA AND
			GI_BRIGADA_OT.EST_BRIGADA < :fgci_ot_resuelta AND
			GI_BRIGADA.IND_BLOQUEO = 1;
	
	if SQLCA.SQLCode = 0 AND ll_nro_brig_bloq > 0 THEN
	// Existen brigadas bloqueadas, hay que indic$$HEX1$$e100$$ENDHEX$$rselo al usuario 
		li_lock_status=gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(pl_nro_incidencia), fgci_bloqueo_incidencia, pl_nro_incidencia)
		w_operaciones.setfocus()
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Algunas de las brigadas asociadas a la Incidencia n$$HEX1$$ba00$$ENDHEX$$: "+string(pl_nro_incidencia)+ " se encuentran siendo utilizadas por otro usuario. No es posible realizar la anulaci$$HEX1$$f300$$ENDHEX$$n")				
	else
			
		W_BARRA.UO_BARRA.gb_1.text="Verificando Incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+"..."
		W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 2 * li_avance_barra /10 ,0))
		// COMPRUEBA REQUISITOS POR ESTADO Y TIPO 
		if of_comprobar_requisitos(PL_NRO_INCIDENCIA,ls_mensaje_error) then 
			//  CRITERIO DEL MCI
			if of_verificar_cierre_mci(PL_NRO_INCIDENCIA) then 
				W_BARRA.UO_BARRA.gb_1.text="Anulando Incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+"..."
				W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 3 * li_avance_barra /10 ,0))
				// BLOQUEAMOS LA OT
				
				if of_bloquear_ot(pl_nro_incidencia) then 
					if of_bloquea_avisos(pl_nro_incidencia, fgci_anular) then 
						W_BARRA.UO_BARRA.gb_1.text="Bloqueando avisos..."
						W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 4 * li_avance_barra /10 ,0))
						if of_actualiza_estado(pl_nro_incidencia) then 
							W_BARRA.UO_BARRA.gb_1.text="Anulando avisos y Ot..."
							W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 5 * li_avance_barra /10 ,0))
							of_anular_ot(pl_nro_incidencia)
							W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 6 * li_avance_barra /10 ,0))
							if of_anular_avisos(pl_nro_incidencia) then 
								W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 7 * li_avance_barra /10 ,0))
								// AVISAMOS AL SERVIDOR DE OPERACION SOLO SI ES DE OPERACION
								if  of_avisar_operacion(fgci_anular,ls_mensaje_error,pl_nro_incidencia)  then /// HA IDO BIEN 				
									gnu_u_transaction.uf_commit(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)		
									W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 8 * li_avance_barra /10 ,0))
									of_desbloquear_ot()															
									of_desbloquear_avisos()
									W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 9 * li_avance_barra /10 ,0))
									W_BARRA.UO_BARRA.gb_1.text="Actualizando Incidencia..."
									// AVISAMOS A OTROS SGI
									if isvalid(gu_operaciones) then
										gu_operaciones.of_avisar_sgi(pl_nro_incidencia)
									end if
									// AVISAMOS AL PROPIO SGI
									if isvalid(gu_control_v_incidencias) then
										w_2301_form_incidencia ls_ventana
																					
										ls_ventana = gu_control_v_incidencias.of_busca_ventana(pl_nro_incidencia,-1)
										if  not isnull(ls_ventana) then // ESTA ABIERTA
											if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
												gu_control_v_incidencias.of_actualiza_operaciones(pl_nro_incidencia,true,-1)	
											end if
										end if			   																														
									end if
																							
									W_BARRA.uo_barra.barra.f_amplia( truncate(pi_comienzo_barra + 10 * li_avance_barra /10 ,0))
									
								else  
									w_operaciones.setfocus()
									messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No es posible continuar la anulaci$$HEX1$$f300$$ENDHEX$$n de la incidencia:"  + char(13)+char(10) + ls_mensaje_error )
																						
									gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
									of_desbloquear_ot()																							
									of_desbloquear_avisos()
									if not match(ls_mensaje_error,"SCADA") then // PROBLEMA DISTINTO DE PERMISO DENEGADO POR SCADA
										W_BARRA.visible = false	
										setpointer(Arrow!)													
										return false
									end if

								end if		
																
							else
								w_operaciones.setfocus()
								messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Los avisos de la incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" no se pueden liberar" )
								gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
								of_desbloquear_ot()																				
								of_desbloquear_avisos()
											
							end if 
						else
							w_operaciones.setfocus()
							messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" no se pudo cambiar de estado"  )
							gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
							of_desbloquear_ot()
							of_desbloquear_avisos()

						end if
					else
						w_operaciones.setfocus()
						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No ha sido posible bloquear los avisos de la incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA) )
						gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)						
						of_desbloquear_ot()
						of_desbloquear_avisos()
					end if	
				else
					w_operaciones.setfocus()
					messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No ha sido posible bloquear la ot de la incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA) )
					gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)						
					of_desbloquear_ot()
				end if	
	
											
			else	
				w_operaciones.setfocus()
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" tiene interrupciones anteriores a la fecha del cierre del MCI" )
				gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
									
			end if
		else	
			w_operaciones.setfocus()
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" no cumple los requisitos de anulaci$$HEX1$$f300$$ENDHEX$$n:" + ls_mensaje_error )
			gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
  									
		end if
	
	end if
end if	

setpointer(Arrow!)	

return true
end function

public function boolean of_comprobar_requisitos (long pl_nro_incidencia, ref string ps_mensaje_error);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_comprobar_requisitos
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Devueve si una incidencia se puede anular
//	
//
//  Valores de retorno : true  --> Se puede anular
//				  				 false --> No se puede anular
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_tip_incidencia, li_alcance, li_estado
double ld_diferencia
int li_tiempo_espera

ps_mensaje_error=""

boolean lb_resultado = false

// REQUISITOS 
select est_Actual, tip_incidencia, alcance into :li_estado,:li_tip_incidencia, :li_alcance from sgd_incidencia where nro_incidencia = :pl_nro_incidencia;

if sqlca.sqlcode = 0 then 

//CHOOSE CASE li_tip_incidencia
//
//CASE fgci_incidencia_imprevista, fgci_incidencia_obligada
		
		if (li_alcance = fgci_incidencia_de_suministro or li_alcance = fgci_incidencia_sin_interrupcion) then 
				 lb_resultado =  true 
		elseif (li_alcance = fgci_incidencia_con_interrupcion) and (li_estado  >= fgci_incidencia_servicio_repuesto) then 
				 lb_resultado =  true
   	else 
				 ps_mensaje_error = char(10) + char(13) + "La incidencia imprevista no est$$HEX2$$e1002000$$ENDHEX$$en SR (con perdida) o <=SR (suministro o sin perdida) o es un reenganche"						
				 lb_resultado = false
		end if		
		
		
//case fgci_incidencia_programada	
//	
//	lb_resultado = false
//	ps_mensaje_error = char(10) + char(13) + "Las incidencias programadas no se pueden anular"							
//	
//case fgci_incidencia_calidad
//	
//if (li_alcance = fgci_incidencia_de_suministro or li_alcance = fgci_incidencia_de_instalacion)  and (li_estado <= fgci_incidencia_servicio_repuesto) then 
//	 lb_resultado = true 
//else
//	lb_resultado = false
//	ps_mensaje_error = char(10) + char(13) + "La incidencia de calidad no est$$HEX2$$e1002000$$ENDHEX$$en estado <=SR"							
//end if
//
//END CHOOSE
//
end if

return lb_resultado
end function

public function boolean of_verifica_avisos (long pl_nro_incidencia, ref string ps_mensaje_error);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_verifica_avisos
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Devueve si una incidencia de calidad o suministro tiene aviso asociados
//	
//
//  Valores de retorno : true  --> Se puede desanular
//				  				 false --> No se puede desanular
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_tip_incidencia, li_alcance, li_estado, li_avisos_asociados
double ld_diferencia
int li_tiempo_espera

ps_mensaje_error=""

boolean lb_resultado = false

// REQUISITOS 
select est_Actual, tip_incidencia, alcance into :li_estado,:li_tip_incidencia, :li_alcance from sgd_incidencia where nro_incidencia = :pl_nro_incidencia;

if sqlca.sqlcode = 0 then 

CHOOSE CASE li_tip_incidencia

CASE fgci_incidencia_imprevista
	if li_alcance = fgci_incidencia_de_suministro then  // SOLO PARA INCIDENCIAS DE SUMINISTRO 
		
		select count(*) into :li_avisos_asociados from gi_avisos WHERE ( "GI_AVISOS"."INCIDENCIA_ANULACION" = :pl_nro_incidencia ) AND  
         ( "GI_AVISOS"."EST_AVISO" = :fgci_aviso_pendiente);
			
		if li_avisos_asociados > 0 then 
			return true // tiene avisos permitimos la desanulacion
			
		else
			ps_mensaje_error = char(10) + char(13) + "La incidencia de suministro no tiene avisos asociados"							
			return false // NO TIENE SENTIDO PERMITIR LA DESANULACION
		end if

	else
		return true
	end if 
	
case fgci_incidencia_obligada,  fgci_incidencia_programada	
		
 return true // NO ES NECESARIO VERIFICAR SI EXISTEN AUN AVISOS ASOCIADOS.		
		

case fgci_incidencia_calidad
	select count(*) into :li_avisos_asociados from gi_avisos WHERE ( "GI_AVISOS"."INCIDENCIA_ANULACION" = :pl_nro_incidencia ) AND  
         ( "GI_AVISOS"."EST_AVISO" = :fgci_aviso_pendiente);
			
		if li_avisos_asociados > 0 then 
			return true // tiene avisos permitimos la desanulacion
			
		else
			ps_mensaje_error = char(10) + char(13) + "La incidencia de calidad no tiene avisos asociados"							
			return false // NO TIENE SENTIDO PERMITIR LA DESANULACION
		end if

END CHOOSE

end if

return lb_resultado
end function

public function boolean of_verifica_interrupcion (long pl_nro_incidencia, ref string ps_mensaje_error);boolean lb_resultado = true
datetime ldt_f_alta, ldt_f_reposicion,ldt_f_alta_a, ldt_f_reposicion_a,ldt_f_alta_b, ldt_f_reposicion_b,ldt_f_alta_c, ldt_f_reposicion_c
long ll_nro_instalacion
long ll_contador = 1
 DECLARE cu_interrupcion_incidencia CURSOR FOR  
  SELECT "SGD_INTERRUPCION"."F_ALTA",   
         "SGD_INTERRUPCION"."F_REPOSICION",   
         "SGD_INTERRUPCION"."F_ALTA_FASE_A",   
         "SGD_INTERRUPCION"."F_ALTA_FASE_B",   
         "SGD_INTERRUPCION"."F_ALTA_FASE_C",   
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_A",   
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_B",   
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_C",   
         "SGD_INTERRUPCION"."NRO_INSTALACION"  
    FROM "SGD_INTERRUPCION" where nro_incidencia = :pl_nro_incidencia  ;

open cu_interrupcion_incidencia;
fetch cu_interrupcion_incidencia into :ldt_f_alta, :ldt_f_reposicion,:ldt_f_alta_a, :ldt_f_alta_b,:ldt_f_alta_c, :ldt_f_reposicion_a, :ldt_f_reposicion_b,:ldt_f_reposicion_c, :ll_nro_instalacion;
do while sqlca.sqlcode = 0 
	ll_contador ++
if mod(ll_contador,15) = 0 then   of_cambiar_bitmap()	
if of_buscar_interrupcion(pl_nro_incidencia,ldt_f_alta, ldt_f_reposicion,ldt_f_alta_a, ldt_f_reposicion_a,ldt_f_alta_b,ldt_f_reposicion_b,ldt_f_alta_c, ldt_f_reposicion_c, ll_nro_instalacion) then 
	close cu_interrupcion_incidencia;
	ps_mensaje_error = char(10) + char(13) +"Hay instalaciones interrumpidas al mismo tiempo en otra incidencia"
	w_barra.uo_barra.p_1.visible=false
	return false // EXISTE 
else		
		fetch cu_interrupcion_incidencia into :ldt_f_alta, :ldt_f_reposicion,:ldt_f_alta_a, :ldt_f_alta_b,:ldt_f_alta_c, :ldt_f_reposicion_a, :ldt_f_reposicion_b,:ldt_f_reposicion_c, :ll_nro_instalacion;
end if
loop

close cu_interrupcion_incidencia;



w_barra.uo_barra.p_1.visible=false
return lb_resultado
end function

public function boolean of_verifica_requisitos_anulacion (long pl_nro_incidencia, ref string ps_mensaje_error);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_verifica_requisitos_anulacion
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Devueve si una incidencia de calidad o suministro tiene aviso asociados o si una incidencia con perdida tiene interrupciones "iguales" en otra incidencia
//	
//
//  Valores de retorno : true  --> Se puede desanular
//				  				 false --> No se puede desanular
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_tip_incidencia, li_alcance, li_estado, li_avisos_asociados
double ld_diferencia
int li_tiempo_espera

ps_mensaje_error=""

boolean lb_resultado = false

// REQUISITOS 
select est_Actual, tip_incidencia, alcance into :li_estado,:li_tip_incidencia, :li_alcance from sgd_incidencia where nro_incidencia = :pl_nro_incidencia;

if sqlca.sqlcode = 0 then 

//CHOOSE CASE li_tip_incidencia
//
//CASE fgci_incidencia_imprevista
	
	if li_alcance = fgci_incidencia_de_suministro then  // SOLO PARA INCIDENCIAS DE SUMINISTRO 
		
		return of_verifica_avisos(pl_nro_incidencia,ps_mensaje_error)

	else
		
		if li_alcance = fgci_incidencia_con_interrupcion then 
			return of_verifica_interrupcion(pl_nro_incidencia,ps_mensaje_error)
		else
			return true  // NO ES NECESARIO
		end if
	end if 
	
//case fgci_incidencia_obligada,  fgci_incidencia_programada	
//		
//		if li_alcance = fgci_incidencia_con_interrupcion then 
//			return of_verifica_interrupcion(pl_nro_incidencia,ps_mensaje_error)
//		else
//			 return true // NO ES NECESARIO VERIFICAR SI EXISTEN AUN AVISOS ASOCIADOS.		
//		end if
		
		

//case fgci_incidencia_calidad
//		return of_verifica_avisos(pl_nro_incidencia,ps_mensaje_error)
//END CHOOSE

end if

return lb_resultado
end function

public subroutine of_revoca_anulacion (long pl_nro_incidencia);int li_avance_barra 

string ls_mensaje_error

int li_lock_status

long  ll_contador 

li_avance_barra = 100

open(w_barra)
w_barra.enabled = false

W_BARRA.UO_BARRA.gb_1.text="Bloqueando Incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+"..."
W_BARRA.uo_barra.barra.f_amplia( truncate(li_avance_barra /10 ,0))
w_operaciones.setfocus()
li_lock_status=gnu_u_transaction.uf_lock(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)
						
IF li_lock_status = 0 THEN
			
	W_BARRA.UO_BARRA.gb_1.text="Verificando Incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+"..."
	W_BARRA.uo_barra.barra.f_amplia( truncate(2 * li_avance_barra /10 ,0))
	// VERIFICAR SI EXISTEN AVISOS PARA CIERTOS TIPOS DE INCIDENCIAS
	if  of_verifica_requisitos_anulacion(pl_nro_incidencia, ls_mensaje_error) then 
	//  CRITERIO DEL MCI
	if of_verificar_cierre_mci(PL_NRO_INCIDENCIA) then 
	W_BARRA.UO_BARRA.gb_1.text="Revocando anulaci$$HEX1$$f300$$ENDHEX$$n Incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+"..."
	W_BARRA.uo_barra.barra.f_amplia( truncate(3 * li_avance_barra /10 ,0))
   if of_bloquea_avisos(pl_nro_incidencia, fgci_revocar) then 
		W_BARRA.UO_BARRA.gb_1.text="Bloqueando avisos..."
		W_BARRA.uo_barra.barra.f_amplia( truncate( 4 * li_avance_barra /10 ,0))
	   if of_actualiza_estado_revocacion(pl_nro_incidencia) then 
				W_BARRA.UO_BARRA.gb_1.text="Asociando avisos..."
				W_BARRA.uo_barra.barra.f_amplia( truncate( 5 * li_avance_barra /10 ,0))
				of_anular_revocacion_ot(pl_nro_incidencia)
															W_BARRA.uo_barra.barra.f_amplia( truncate(6 * li_avance_barra /10 ,0))
																if of_asociar_avisos(pl_nro_incidencia) then 
																				W_BARRA.uo_barra.barra.f_amplia( truncate(7 * li_avance_barra /10 ,0))
																				// AVISAMOS AL SERVIDOR DE OPERACION SOLO SI ES DE OPERACION
																																			
																																		
																				if of_avisar_operacion(fgci_revocar,ls_mensaje_error,pl_nro_incidencia)  then /// HA IDO BIEN 				
																						gnu_u_transaction.uf_commit(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)		
																						W_BARRA.uo_barra.barra.f_amplia( truncate( 8 * li_avance_barra /10 ,0))
																						of_desbloquear_avisos()
																						W_BARRA.uo_barra.barra.f_amplia( truncate( 9 * li_avance_barra /10 ,0))
																						W_BARRA.UO_BARRA.gb_1.text="Actualizando Incidencia..."
																						// AVISAMOS A OTROS SGI
																						if isvalid(gu_operaciones) then
																								gu_operaciones.of_avisar_sgi(pl_nro_incidencia)
																						end if
																						// AVISAMOS AL PROPIO SGI
																						if isvalid(gu_control_v_incidencias) then
																								
																							w_2301_form_incidencia ls_ventana
																									
																									ls_ventana = gu_control_v_incidencias.of_busca_ventana(pl_nro_incidencia,-1)
																									if  not isnull(ls_ventana) then // ESTA ABIERTA
																										 if ls_ventana.lu_comunic.is_comunic.Accion_llamada = "Consulta" then // SOLO PARA CONSULTA
																											gu_control_v_incidencias.of_actualiza_operaciones(pl_nro_incidencia,true,-1)	
																										end if
																									end if			   																														
																							end if
																																																																																				
																						
																						
  																			   		W_BARRA.uo_barra.barra.f_amplia( truncate(10 * li_avance_barra /10 ,0))																
																						
																				
																				else 
																					    w_operaciones.setfocus()
																						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No es posible realizar la revocaci$$HEX1$$f300$$ENDHEX$$n:"+char(10)+char(13) + ls_mensaje_error)											
																						gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
																						of_desbloquear_avisos()
																						W_BARRA.visible = false	
																						setpointer(Arrow!)	
																						
																				end if		
																
																			else
																				 w_operaciones.setfocus()
																				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Los avisos de la incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" no se pueden liberar" )
																				gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
																				of_desbloquear_avisos()
																		
																			end if 
														else
															 w_operaciones.setfocus()
															messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" no se pudo cambiar de estado " )
															gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
															of_desbloquear_avisos()

														end if
											else
												 w_operaciones.setfocus()
												messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No ha sido posible bloquear los avisos de la incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA) )
												gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)						
												of_desbloquear_avisos()
											end if	
	
											
										else	
										 w_operaciones.setfocus()
											messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" tiene interrupciones anteriores a la fecha del cierre del MCI" )
											gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
											
										end if
					else	
						 w_operaciones.setfocus()
						messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La incidencia n$$HEX2$$ba002000$$ENDHEX$$"+string(PL_NRO_INCIDENCIA)+" no cumple los requisitos para poder revocar la anulaci$$HEX1$$f300$$ENDHEX$$n:" + ls_mensaje_error )
						gnu_u_transaction.uf_rollback(THIS, "SGD_INCIDENCIA", "NRO_INCIDENCIA=" + string(PL_NRO_INCIDENCIA), fgci_bloqueo_incidencia, PL_NRO_INCIDENCIA)	
					
					end if
								

	end if	


W_BARRA.visible = false	
	
setpointer(Arrow!)	
		
close(w_barra)


end subroutine

public function boolean of_actualiza_estado_revocacion (long pl_nro_incidencia);//////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_estado_revocacion
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Recupera el estado de la incidencia  y borra el registro insertado en el MCI
//	
//
//  Valores de retorno : true  --> No hay problemas 
//				  				 false --> Si hay problemas
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

boolean lb_resultado
int li_estado, li_alcance
lb_resultado = true

// OBTENEMOS EL ESTADO ANTERIOR DE LA INCIDENCIA
	
select estado_anterior, alcance  into :li_estado, :li_alcance from sgd_incidencia where nro_incidencia = :pl_nro_incidencia;
	
if sqlca.sqlcode = 0 then 

	UPDATE "SGD_INCIDENCIA"  
	SET "EST_ACTUAL" = :li_estado,
		cod_motivo  = null,
		descripcion_motivo = null,
		usuario_anulacion = null,
		estado_anterior = null,
		ind_anulacion_sgi = 0,
		fecha_anulacion = null
	WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :pl_nro_incidencia   ;

	if sqlca.sqlcode = 0 then
		
		if li_alcance = fgci_incidencia_con_interrupcion then
			UPDATE SGD_INTERRUPCION
			SET TIP_INTERRUPCION = 'T'
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
			
			if sqlca.sqlcode = 0 then
				UPDATE SGD_INTERRUPCION_RS
				SET TIP_INTERRUPCION = 'T'
				WHERE NRO_INCIDENCIA = :pl_nro_incidencia;
				
				if sqlca.sqlcode <> 0 then
					lb_resultado = FALSE
				end if
			else
				lb_resultado = FALSE
			end if
		end if
		
		if sqlca.sqlcode = 0 then
			of_borra_datos_historicos(pl_nro_incidencia)
			// SOLO SE BORRA EL REGISTRO INSERTADO DESDE AQUI AL ANULAR
			delete from "SCI_INC_JUSTIFICADAS"   where nro_incidencia = :pl_nro_incidencia and programa = 'w_anulacion';
		end if
	else
		lb_resultado = FALSE
	end if
else
	lb_resultado = FALSE
end if
	
return lb_resultado 

end function

public function boolean of_anular_revocacion_ot (long pl_nro_incidencia);boolean lb_resultado
long ll_nro_ot
int li_estado_ot
long ll_contador
lb_resultado = true
datetime ldt_f_hasta, ldt_f_hasta_anulacion


// OBTENEMOS LA OT 


select nvl(ot,0)  into :ll_nro_ot from sgd_incidencia where nro_incidencia = :pl_nro_incidencia ;

if sqlca.sqlcode <> 0 or ll_nro_ot =0  then 
	// NO TIENE OT
	lb_resultado = true
	
else // OBTENEMOS LA FECHA HASTA DE LA OT 
	select f_hasta,  f_hasta_anulacion into :ldt_f_hasta, :ldt_f_hasta_anulacion  from gi_ot where nro_ot = :ll_nro_ot;
	
	if ldt_f_hasta = ldt_f_hasta_anulacion  then  // OT TRABAJANDO
			update gi_ot set est_ot = :fgci_ot_trabajando, f_hasta  = null, f_hasta_anulacion = null  where nro_ot = :ll_nro_ot;
	else	// OT RESUELTA	
		update gi_ot set est_ot = :fgci_ot_resuelta , f_hasta_anulacion = null  where nro_ot = :ll_nro_ot;
	end if
	
	if sqlca.sqlcode = 0 then 
			lb_resultado = true
	else
		lb_resultado = false
			
	end if
end if	





return lb_resultado



end function

public function boolean of_asociar_avisos (long pl_nro_incidencia);//////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_asociar_avisos
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Recupera el estado de los avisos.
//	
//
//  Valores de retorno : true  --> No hay problemas 
//				  				 false --> Si hay problemas
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


// BLOQUEA LOS AVISOS DE LA INCIDENCIA EN CASO DE ANULACION / REVOCACION
boolean lb_resultado 
long ll_contador, ll_nro_Aviso
datetime ldt_f_actual , ldt_f_res_anulacion,ldt_f_nueva
int li_result_func

lb_resultado = true

//	dt_lista_avisos = create datastore 
//	dt_lista_avisos.dataobject = 'd_lista_avisos_incidencia_anulados'
//	dt_lista_Avisos.settransobject(sqlca)
//	dt_lista_avisos.retrieve(pl_nro_incidencia,fgci_aviso_pendiente)
//

if dt_lista_avisos.rowcount() > 0  then  // HAY AVISOS 
		for ll_contador = 1 to dt_lista_avisos.rowcount()
			ldt_f_nueva = fgnu_fecha_actual()	
			ll_nro_aviso = dt_lista_Avisos.object.nro_aviso[ll_contador]
			ldt_f_res_anulacion = dt_lista_Avisos.object.fecha_res_anulacion[ll_contador]
			if isnull(ldt_f_res_anulacion) then // NO ESTABA RESUELTO AL ANULAR

					UPDATE GI_AVISOS 
					SET 	EST_AVISO = :fgci_aviso_asociado,
								USUARIO = :gs_usuario,
								IND_IMPROCEDENTE = 0,
								FECHA_RES = null,
								PROGRAMA = 'ANULA',
								IND_INC_ASOC = 1,
								NRO_INCIDENCIA = :pl_nro_incidencia,
								incidencia_anulacion = null,
								fecha_res_anulacion = null
						WHERE NRO_AVISO = :ll_nro_aviso;
						if sqlca.sqlcode <> 0 then 
							//destroy dt_lista_avisos
							return false
						else
							
							UPDATE GI_AVISOS_INSTALACION
								SET F_ACTUAL = :ldt_f_nueva, EST_AVISO = :fgci_aviso_asociado
								WHERE NRO_AVISO = :ll_nro_aviso;
						end if

			else
					UPDATE GI_AVISOS 
						SET 	EST_AVISO = :fgci_aviso_resuelto,
								USUARIO = :gs_usuario,
								IND_IMPROCEDENTE = 0,
								FECHA_RES = :ldt_f_res_anulacion,
								PROGRAMA = 'ANULA',
								IND_INC_ASOC = 1,
								NRO_INCIDENCIA = :pl_nro_incidencia,
								incidencia_anulacion = null,
								fecha_res_anulacion = null
							WHERE NRO_AVISO = :ll_nro_aviso;
						if sqlca.sqlcode <> 0 then 
							//destroy dt_lista_avisos
							return false
						else
							delete from gi_Avisos_instalacion where nro_aviso = :ll_nro_aviso;
						end if
			end if

			
			
			
		next
end if 

return lb_resultado

	







end function

public function boolean of_bloquea_avisos (long pl_incidencia, integer pi_accion);// BLOQUEA LOS AVISOS DE LA INCIDENCIA EN CASO DE ANULACION / REVOCACION
boolean lb_resultado 
long ll_contador, ll_nro_Aviso
datetime ldt_f_actual 
int li_result_func

lb_resultado = true

dt_lista_avisos = create datastore 

if pi_accion = 1 then // ANULACION
	dt_lista_avisos.dataobject = 'd_lista_avisos_incidencia'
	dt_lista_Avisos.settransobject(sqlca)
	dt_lista_avisos.retrieve(pl_incidencia)
	
	// AVISOS DEL MISMO NIS QUE LOS QUE SE VAN A LIBERAR
	dt_lista_avisos_asociados = create datastore 
	dt_lista_avisos_asociados.dataobject = 'd_lista_avisos_incidencia_asociados'
	dt_lista_Avisos_asociados.settransobject(sqlca)
	dt_lista_avisos_asociados.retrieve(pl_incidencia,fgci_aviso_pendiente)
	
	
	
	
else // REVOCACION
	dt_lista_avisos.dataobject = 'd_lista_avisos_incidencia_anulados'
	dt_lista_Avisos.settransobject(sqlca)
	dt_lista_avisos.retrieve(pl_incidencia,fgci_aviso_pendiente)
end if	

if dt_lista_avisos.rowcount() > 0  then  // HAY AVISOS 
		for ll_contador = 1 to dt_lista_avisos.rowcount()
			ldt_f_actual = dt_lista_Avisos.object.f_actual[ll_contador]
			ll_nro_aviso = dt_lista_Avisos.object.nro_aviso[ll_contador]
			li_result_func = gnu_u_transaction.uf_bloquea_avisos( ldt_f_actual, fgci_bloq_reactivar_avisos, ll_nro_aviso)
			if li_result_func= -2 or li_result_func= -54 then
				return false
			end if
		next
end if 

if pi_accion = 1 then // SOLO PARA EL CASO DE ANULACION
if dt_lista_avisos_asociados.rowcount() > 0  then  // HAY AVISOS 
		for ll_contador = 1 to dt_lista_avisos_asociados.rowcount()
			ldt_f_actual = dt_lista_avisos_asociados.object.f_actual[ll_contador]
			ll_nro_aviso = dt_lista_avisos_asociados.object.nro_aviso[ll_contador]
			li_result_func = gnu_u_transaction.uf_bloquea_avisos( ldt_f_actual, fgci_bloq_reactivar_avisos, ll_nro_aviso)
			if li_result_func= -2 or li_result_func= -54 then
				return false
			end if
		next
end if 

end if 



return lb_resultado

end function

public function boolean of_buscar_interrupcion (long pl_nro_incidencia, datetime pt_f_alta, datetime pdt_f_reposicion, datetime pdt_f_alta_a, datetime pdt_f_reposicion_a, datetime pdt_f_alta_b, datetime pdt_f_reposicion_b, datetime pdt_f_alta_c, datetime pdt_f_reposicion_c, long pl_nro_instalacion);//////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_busca_interrupcion
//
//  Argumentos :long pl_nro_incidencia,datetime pt_f_alta, datetime pdt_f_reposicion,datetime pdt_f_alta_a, datetime pdt_f_reposicion_a,datetime pdt_f_alta_b, datetime pdt_f_reposicion_b,datetime pdt_f_alta_c, datetime pdt_f_reposicion_c, long ll_nro_instalacion
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Busca si una instalacion est$$HEX2$$e1002000$$ENDHEX$$interrumpida dos veces en el mismo periodo en dos o mas incidencias
//	
//
//  Valores de retorno : true  --> hay interrupciones en otra incidencia
//				  				 false --> No hay
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


boolean lb_resultado = false
long ll_control


if gb_red_trifasica then 

	SELECT nvl(min("SGD_INTERRUPCION"."NRO_INCIDENCIA"),-1) 
	INTO :ll_control
    FROM "SGD_INTERRUPCION", sgd_incidencia  
   WHERE (("SGD_INTERRUPCION"."F_ALTA" <= :pt_f_alta  AND  
         "SGD_INTERRUPCION"."F_REPOSICION" >= :pt_f_alta ) 
		 OR ("SGD_INTERRUPCION"."F_ALTA" <= :pdt_f_reposicion AND  
         "SGD_INTERRUPCION"."F_REPOSICION" >= :pdt_f_reposicion)) 
		 AND "SGD_INTERRUPCION"."NRO_INCIDENCIA" <> :pl_nro_incidencia 
		 AND "SGD_INTERRUPCION"."NRO_INSTALACION" = :pl_nro_instalacion 
		AND "SGD_INTERRUPCION"."NRO_INCIDENCIA" = sgd_incidencia.nro_incidencia 
		and sgd_incidencia.est_actual < :fgci_incidencia_resuelta;
	if ll_control = -1 or sqlca.sqlcode <>0 then // BUSCAMOS EN SGD_INTERRUPCION_RS

					SELECT nvl(min("SGD_INTERRUPCION_RS"."NRO_INCIDENCIA"),-1) 
					INTO :ll_control
				 FROM "SGD_INTERRUPCION_RS", sgd_incidencia  
				WHERE (("SGD_INTERRUPCION_RS"."F_ALTA" <= :pt_f_alta  AND  
						"SGD_INTERRUPCION_RS"."F_REPOSICION" >= :pt_f_alta) 
					 OR ("SGD_INTERRUPCION_RS"."F_ALTA" <= :pdt_f_reposicion AND  
						"SGD_INTERRUPCION_RS"."F_REPOSICION" >= :pdt_f_reposicion)) 
					 AND  "SGD_INTERRUPCION_RS"."NRO_INCIDENCIA" <> :pl_nro_incidencia
					 AND "SGD_INTERRUPCION_RS"."NRO_INSTALACION" = :pl_nro_instalacion 
					 AND "SGD_INTERRUPCION_RS"."NRO_INCIDENCIA" = sgd_incidencia.nro_incidencia 
					and sgd_incidencia.est_actual < :fgci_incidencia_resuelta;
				
					if ll_control = -1 or sqlca.sqlcode <>0 then
						lb_resultado = false // NO HAY OTRA
					else
						lb_resultado =true // HAY OTRA
					end if
	else
				lb_resultado  = true
	end if

else // MONOFASICO

		SELECT nvl(min("SGD_INTERRUPCION"."NRO_INCIDENCIA"),-1)  into :ll_control
    FROM "SGD_INTERRUPCION"  , sgd_incidencia
   WHERE ((("SGD_INTERRUPCION"."F_ALTA_FASE_A" <= :pdt_f_alta_a AND  
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_A" >= :pdt_f_alta_a ) 
		 OR ("SGD_INTERRUPCION"."F_ALTA_FASE_A" <= :pdt_f_reposicion_a AND  
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_A" >= :pdt_f_reposicion_a)) 
		 OR
		 (("SGD_INTERRUPCION"."F_ALTA_FASE_B" <= :pdt_f_alta_b AND  
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_B" >= :pdt_f_alta_b )		 OR  
         ("SGD_INTERRUPCION"."F_ALTA_FASE_B" <= :pdt_f_reposicion_b  AND  
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_B" >= :pdt_f_reposicion_b))
		  OR 
		 (("SGD_INTERRUPCION"."F_ALTA_FASE_C" <= :pdt_f_alta_c AND  
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_C" >= :pdt_f_alta_c )		 OR  
         ("SGD_INTERRUPCION"."F_ALTA_FASE_C" <= :pdt_f_reposicion_c  AND  
         "SGD_INTERRUPCION"."F_REPOSICION_FASE_C" >= :pdt_f_reposicion_c)))
		 AND   "SGD_INTERRUPCION"."NRO_INCIDENCIA" <> :pl_nro_incidencia and nro_instalacion = :pl_nro_instalacion 
		 	AND "SGD_INTERRUPCION"."NRO_INCIDENCIA" = sgd_incidencia.nro_incidencia 
		and sgd_incidencia.est_actual < :fgci_incidencia_resuelta;


	if ll_control = -1 or sqlca.sqlcode <>0 then // BUSCAMOS EN SGD_INTERRUPCION_RS

		
			SELECT nvl(min("SGD_INTERRUPCION_RS"."NRO_INCIDENCIA"),-1)  into :ll_control
 		   FROM "SGD_INTERRUPCION_RS"  , SGD_INCIDENCIA
 		  WHERE ((("SGD_INTERRUPCION_RS"."F_ALTA_FASE_A" <= :pdt_f_alta_a AND  
         "SGD_INTERRUPCION_RS"."F_REPOSICION_FASE_A" >= :pdt_f_alta_a ) 
		 OR ("SGD_INTERRUPCION_RS"."F_ALTA_FASE_A" <= :pdt_f_reposicion_a AND  
         "SGD_INTERRUPCION_RS"."F_REPOSICION_FASE_A" >= :pdt_f_reposicion_a)) 
		 OR
		 (("SGD_INTERRUPCION_RS"."F_ALTA_FASE_B" <= :pdt_f_alta_b AND  
         "SGD_INTERRUPCION_RS"."F_REPOSICION_FASE_B" >= :pdt_f_alta_b )		 OR  
         ("SGD_INTERRUPCION_RS"."F_ALTA_FASE_B" <= :pdt_f_reposicion_b  AND  
         "SGD_INTERRUPCION_RS"."F_REPOSICION_FASE_B" >= :pdt_f_reposicion_b))
		  OR 
		 (("SGD_INTERRUPCION_RS"."F_ALTA_FASE_C" <= :pdt_f_alta_c AND  
         "SGD_INTERRUPCION_RS"."F_REPOSICION_FASE_C" >= :pdt_f_alta_c )		 OR  
         ("SGD_INTERRUPCION_RS"."F_ALTA_FASE_C" <= :pdt_f_reposicion_c  AND  
         "SGD_INTERRUPCION_RS"."F_REPOSICION_FASE_C" >= :pdt_f_reposicion_c)))
		 AND  "SGD_INTERRUPCION_RS"."NRO_INCIDENCIA" <> :pl_nro_incidencia 
		 and 	 "SGD_INTERRUPCION_RS"."NRO_INSTALACION" = :pl_nro_instalacion
		 AND "SGD_INTERRUPCION_RS"."NRO_INCIDENCIA" = sgd_incidencia.nro_incidencia 
			and sgd_incidencia.est_actual < :fgci_incidencia_resuelta;


			if ll_control = -1 or sqlca.sqlcode <>0 then
					lb_resultado = false // NO HAY OTRA
			else
					lb_resultado =true // HAY OTRA
			end if
	else
				lb_resultado  = true
	end if

end if

return lb_resultado

end function

public function boolean of_busca_avisos_por_nis (long pl_nis, integer pi_ind_calidad);//////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_busca_avisos_por_nis
//
//  Argumentos :
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Anula avisos pedientes o AI que esten relacionados con los avisos que se van a liberar (mismo nis, y tipo)
//	
//
//  Valores de retorno : true  --> Hay avisos, y no se han anulado.
//				  				 false --> No hay avisos
//
//  Realizado  Alfonso Coto
//
//  Fecha : 21/02/2002		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
long ll_otro_aviso, ll_contador
boolean lb_hay_aviso = false
string DWfilter2

DWfilter2 = "nis_rad ="+  string(pl_nis) + " and  " +"ind_calidad ="+ string(pi_ind_calidad)


dt_lista_avisos_asociados.setfilter(DWfilter2)


dt_lista_avisos_asociados.filter()

for ll_contador = 1 to dt_lista_avisos_asociados.rowcount()
	ll_otro_aviso = dt_lista_avisos_asociados.object.nro_aviso[ll_contador]
	
	// ANULAMOS EL AVISO 
	
	delete from gi_avisos_instalacion 
	where nro_aviso = :ll_otro_aviso
	and clase_aviso <> 1 and clase_aviso <> 2;
	
	update gi_Avisos 
	set est_aviso = :fgci_estado_anulado,
		 programa = 'w_anula',
		 usuario = :gs_usuario
	where nro_Aviso = :ll_otro_aviso and clase_aviso <> 1 and clase_aviso <> 2;
	
	lb_hay_aviso = true
next

dt_lista_avisos_asociados.setfilter("")
dt_lista_avisos_asociados.filter()

	
return lb_hay_aviso


 
end function

public function boolean of_incidencia_operaciones (long pl_nro_incidencia);int li_estado_red, li_tipo_instalacion, li_tension, li_est_actual,li_tip_incidencia
int li_alcance
long ll_cant_maniobras, ll_cant_int, ll_nro_instalacion

////////////////////////////////////////////////////////////////////////////
////////
// Esta Select es para saber si se trata de una incidencia dada de alta antes de la
// conversi$$HEX1$$f300$$ENDHEX$$n de los datos. Esto ocurre cuando el campo Estado_Red es -10
SELECT NVL(ESTADO_RED,0), NRO_INST_AFECTADA, TIP_TENSION, EST_ACTUAL,
TIP_INCIDENCIA,
		 ALCANCE
INTO :li_estado_red, :ll_nro_instalacion, :li_tension, :li_est_actual,
:li_tip_incidencia,
	  :li_alcance
FROM SGD_INCIDENCIA
WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

IF SQLCA.SQLCode = 0 AND li_estado_red = -10 Then return false
/////////////////////////////////////////////////////////////////////

IF IsNull(ll_nro_instalacion) THEN
	RETURN False
END IF


// LAS INCIDENCIAS PROGRAMAS NO SE ANULAN, SOLO LAS IMPREVISTAS Y DE ELLAS SOLO SON DE OPERACIONES LAS SIN PERDIDA Y CON PERDIDA

if not (li_tip_incidencia = fgci_incidencia_imprevista and ( li_alcance = fgci_incidencia_con_interrupcion or li_alcance = fgci_incidencia_sin_interrupcion)) then 
  return false
end if




SELECT TIPO_INSTALACION
INTO :li_tipo_instalacion
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :ll_nro_instalacion
		AND BDI_JOB = 0;

IF SQLCA.SQLCode <> 0 THEN
	return TRUE
END IF





IF gb_operaciones = TRUE AND li_tension <= gi_tension_nivel_min THEN

	IF gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion =fgci_tipo_ct THEN
		IF  li_tip_incidencia <>fgci_incidencia_programada THEN
			// Como la instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT se comprueba si existen maniobras.
			// En caso de que existan la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n
			SELECT COUNT(*)
			INTO :ll_cant_maniobras
			FROM SGD_MANIOBRA
			WHERE NRO_INCIDENCIA = :pl_nro_incidencia;

			IF SQLCA.SQLCode = 0 THEN
				Return ll_cant_maniobras > 0
			ELSE
				Return FALSE
			END IF

		end if
	ELSEIF gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion =fgci_tipo_subestacion THEN
		return FALSE

	ELSE
		return TRUE
	END IF

ELSE
	Return FALSE
END IF

end function

public function boolean of_avisar_operacion (integer pi_accion, ref string ps_mensaje, long pl_nro_incidencia);
// AVISA AL SERVIDOR DE OPERACION DE LA ANULACION  / REVOCACION DE INCIDENCIA

boolean lb_ok, lb_incidencia_operacion

long ll_instalacion_afectada,ll_estado
datetime ldt_f_deteccion
int li_tipo_incidencia

lb_incidencia_operacion = of_incidencia_operaciones(pl_nro_incidencia)


if lb_incidencia_operacion then // ES DE OPERACION --> SE AVISA SOLO SI ES IMPREVISTA 


  SELECT "SGD_INCIDENCIA"."NRO_INST_AFECTADA",   
						"SGD_INCIDENCIA"."F_DETECCION" , TIP_INCIDENCIA,EST_ACTUAL 
				 INTO :ll_instalacion_afectada,   
						:ldt_f_deteccion  , :li_tipo_incidencia,:ll_estado
				 FROM "SGD_INCIDENCIA" where nro_incidencia = :pl_nro_incidencia  ;
			

if isvalid(gu_rf_servidor_operacion) and li_tipo_incidencia =fgci_incidencia_imprevista and ll_estado < fgci_incidencia_resuelta then 
	
	
		if pi_accion  = fgci_anular then 
			// SE PRODUCE UNA BAJA	
			lb_ok = gu_rf_servidor_operacion.of_avisar_baja_incidencia(pl_nro_incidencia,ps_mensaje)=1 
		else // REVOCACION ---> ALTA 
				if sqlca.sqlcode  = 0 then 		
					lb_ok = gu_rf_servidor_operacion.of_avisar_alta_incidencia(pl_nro_incidencia,ll_instalacion_afectada,ldt_f_deteccion,1,ps_mensaje)=1 
				else	
					 lb_ok= false
					 ps_mensaje = " No se pueden obtener los datos de la incidencia."
				end if
		end if		
else
	lb_ok = true	// NO HAY OPERACION O ESTA RESUELTA																																						
end if


else
	lb_ok = true //  ES DEL SGI
end if 


return lb_ok
end function

public subroutine of_cambiar_bitmap ();
w_barra.uo_barra.p_1.visible=true
choose case i_vez
		case 1
			w_barra.uo_barra.p_1.picturename="reloj1.bmp"
		case 2
			w_barra.uo_barra.p_1.picturename="reloj2.bmp"
		case 3
			w_barra.uo_barra.p_1.picturename="reloj3.bmp"
		case 4
			w_barra.uo_barra.p_1.picturename="reloj4.bmp"
		case 5
			w_barra.uo_barra.p_1.picturename="reloj5.bmp"
		case 6
			w_barra.uo_barra.p_1.picturename="reloj6.bmp"
		case 7
			w_barra.uo_barra.p_1.picturename="reloj7.bmp"
		case 8
			w_barra.uo_barra.p_1.picturename="reloj8.bmp"
			i_vez=0
end choose
i_vez ++

end subroutine

public subroutine of_borra_datos_historicos (long pl_nro_incidencia);//////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_borra_datos_historicos
//
//  Argumentos :pl_nro_incidencia
//
//
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Borra los datos de los historicos asociados a la incidencia 
//	
//
//  Realizado  Alfonso Coto
//
//  Fecha : 27/11/2001		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



delete from GI_HIST_MANIOBRA where nro_incidencia = :pl_nro_incidencia;


delete from GI_HIST_MANIOBRA_BRIGADA where cod_maniobra in ( select cod_maniobra  from  sgd_maniobra where nro_incidencia = :pl_nro_incidencia);


delete from GI_HIST_BRIGADA_OT where  nro_ot in (select nvl(ot,0) from sgd_incidencia where nro_incidencia =  :pl_nro_incidencia);

delete from GI_HIST_CONTRATA_OT where nro_ot in (select nvl(ot,0) from sgd_incidencia where nro_incidencia =  :pl_nro_incidencia);

delete from GI_HIST_MATERIALES where nro_incidencia = :pl_nro_incidencia;

delete from GI_HIST_SUM_IMP where nro_incidencia = :pl_nro_incidencia;
end subroutine

on u_anular_incidencias.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_anular_incidencias.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


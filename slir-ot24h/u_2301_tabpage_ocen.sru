HA$PBExportHeader$u_2301_tabpage_ocen.sru
forward
global type u_2301_tabpage_ocen from userobject
end type
type cb_2 from commandbutton within u_2301_tabpage_ocen
end type
type cb_1 from commandbutton within u_2301_tabpage_ocen
end type
type cb_borrar from commandbutton within u_2301_tabpage_ocen
end type
type dw_servicios from datawindow within u_2301_tabpage_ocen
end type
type sle_servicio from singlelineedit within u_2301_tabpage_ocen
end type
type st_3 from statictext within u_2301_tabpage_ocen
end type
type cb_sim_cancela from commandbutton within u_2301_tabpage_ocen
end type
type cb_envia_ot from commandbutton within u_2301_tabpage_ocen
end type
type cb_selecciona from commandbutton within u_2301_tabpage_ocen
end type
type sle_instalacion from singlelineedit within u_2301_tabpage_ocen
end type
type st_2 from statictext within u_2301_tabpage_ocen
end type
type mle_comentarios from multilineedit within u_2301_tabpage_ocen
end type
type cb_guardar_log from commandbutton within u_2301_tabpage_ocen
end type
type cb_cerrar from commandbutton within u_2301_tabpage_ocen
end type
type cb_simula from commandbutton within u_2301_tabpage_ocen
end type
type dw_status from datawindow within u_2301_tabpage_ocen
end type
type st_1 from statictext within u_2301_tabpage_ocen
end type
type cb_refresh from commandbutton within u_2301_tabpage_ocen
end type
type cb_peticion from commandbutton within u_2301_tabpage_ocen
end type
type hpb_progress from hprogressbar within u_2301_tabpage_ocen
end type
type dw_ot_ocen from datawindow within u_2301_tabpage_ocen
end type
type gb_2 from groupbox within u_2301_tabpage_ocen
end type
type gb_1 from groupbox within u_2301_tabpage_ocen
end type
end forward

global type u_2301_tabpage_ocen from userobject
integer width = 3520
integer height = 1420
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_carga_datos ( )
event ue_grabar_datos ( )
cb_2 cb_2
cb_1 cb_1
cb_borrar cb_borrar
dw_servicios dw_servicios
sle_servicio sle_servicio
st_3 st_3
cb_sim_cancela cb_sim_cancela
cb_envia_ot cb_envia_ot
cb_selecciona cb_selecciona
sle_instalacion sle_instalacion
st_2 st_2
mle_comentarios mle_comentarios
cb_guardar_log cb_guardar_log
cb_cerrar cb_cerrar
cb_simula cb_simula
dw_status dw_status
st_1 st_1
cb_refresh cb_refresh
cb_peticion cb_peticion
hpb_progress hpb_progress
dw_ot_ocen dw_ot_ocen
gb_2 gb_2
gb_1 gb_1
end type
global u_2301_tabpage_ocen u_2301_tabpage_ocen

type variables
Long il_incidencia_nro
long il_row_status
long il_row_ot_ocen
long il_nro_instalacion
long il_validacion

w_2301_form_incidencia  iw_contenedora

Boolean ib_cambios=FALSE

integer ii_estado_incidencia

String is_descripcion

//AHU (12/03/2009) Fallo al grabar la causa OCEN
//boolean ib_error
boolean ib_insertarOt = FALSE
end variables

forward prototypes
public subroutine wf_inserta_texto (string as_text, string as_type)
public function boolean wf_comprobar_ot_abierta ()
public function string wf_recupera_parametro (integer pwi_parametro)
public function integer wf_inserta_transaccion (long pwl_transaccion, string pws_input, string pws_output)
public function string wf_anula_incidencia (long pl_nro_incidencia)
public function string wf_get_datos_ida ()
public subroutine wf_inserta_solicitud (long pwl_solicitud)
public function string wf_formatea_salida (string as_salida)
public function integer wf_formatea_entrada (string as_entrada, ref integer ai_rtn, ref string as_vuelta)
public function integer uf_altasolicitudequipomant (string ps_tipored, string ps_base, long pl_solicitud, long pl_padre, string ps_nompadre)
protected function integer uf_altasolicitudmantenimiento (string ps_tipored, string ps_base, long pl_solicitud, integer pi_tipobase, string ps_tipoactuacion, string ps_nomelemento, string ps_coddesc, string ps_descripcion)
private function integer uf_obtenerdatossolicitudmantenimiento (ref long pl_causa, ref integer pi_alcance, ref string ps_base, ref long pl_solicitud, ref integer pi_tipobase, ref string ps_tipoactuacion, ref string ps_nomelemento, ref string ps_coddesc, ref long pl_padre, ref string ps_nompadre, ref string ps_tipored, ref string ps_descripcion)
public function integer uf_insertar_solicitud_mantenimiento (ref long pl_solicitud)
public function integer wf_cargasolicitud ()
public function integer uf_cambiarestadomantincid (integer pi_estado)
end prototypes

event ue_carga_datos();
long ll_nro_row
String ls_control
//AHU Se puede reabrir la incidencia aunque se haya enviado a ocen
int 	li_numeroRegistros		//N$$HEX1$$fa00$$ENDHEX$$mero de registros que hay en la tabla gi_ocen_ot para la incidencia

SELECT count(*)
INTO   :li_numeroRegistros
FROM   gi_ocen_ot
WHERE  nro_incidencia = :il_incidencia_nro
		 AND NOT(nro_sol_ocen IS NULL);

IF (ii_estado_incidencia <> fgci_incidencia_servicio_repuesto) AND (ii_estado_incidencia <> 5) AND (li_numeroRegistros = 0) THEN
	wf_inserta_texto("Atenci$$HEX1$$f300$$ENDHEX$$n. La incidencia no esta resuelta","ANY")
	IF NOT gb_interfaseOsgm THEN
		wf_inserta_texto("Aviso. Este servicio solo est$$HEX2$$e1002000$$ENDHEX$$disponible para incidencias en Servicio Repuesto.","ANY")
	ELSE
		wf_inserta_texto("Aviso. Este servicio solo est$$HEX2$$e1002000$$ENDHEX$$disponible para incidencias en Servicio Repuesto o Pendientes de puesta en explotaci$$HEX1$$f300$$ENDHEX$$n.","ANY")
	END IF
	cb_refresh.enabled=FALSE
	cb_selecciona.enabled=FALSE
	cb_peticion.enabled=FALSE
	cb_borrar.enabled=FALSE
	dw_servicios.enabled=FALSE
   return
elseif ii_estado_incidencia = 5 OR (gb_interfaseOsgm AND dw_ot_ocen.rowCount() > 0) then
	mle_comentarios.enabled = FALSE
	cb_refresh.enabled=FALSE
	cb_selecciona.enabled=FALSE
	cb_peticion.enabled=FALSE
	cb_borrar.enabled=FALSE
	dw_servicios.enabled=FALSE
	//return
END IF

sle_instalacion.text=String(il_nro_instalacion)
//24/10/2008 YAF
IF sle_instalacion.text = "" OR sle_instalacion.text="0"  THEN
	sle_instalacion.text = "No hay instalacion"
	cb_peticion.enabled = false
END IF


// consultamos la variable de validacion
CHOOSE CASE il_validacion

CASE 0
   //wf_inserta_texto("Ok. Incidencia resuelta completamente.","ANY")
CASE -100
	//AHM (20/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
	IF NOT gb_interfaseOsgm THEN
   	wf_inserta_texto("Aviso. Incidencia sin instalacion origen.","ERROR")
	ELSE
		wf_inserta_texto("Aviso. Incidencia sin instalacion afectada.","ERROR")
	END IF
CASE -200
   wf_inserta_texto("Aviso. Incidencia sin causa.","ERROR")
CASE -300
	wf_inserta_texto("Aviso. Incidencia sin causa conocida.","ERROR")
CASE -400
   wf_inserta_texto("Aviso. Incidencia sin observaciones.","ERROR")
CASE -500
   wf_inserta_texto("Aviso. Incidencia sin agente.","ANY")
CASE -600
   wf_inserta_texto("Aviso. Incidencia con indisponibilidades.","ANY")
CASE -800
 	wf_inserta_texto("Aviso. Incidencia con trabajos en BDI.","ANY")
CASE -900   
	wf_inserta_texto("Aviso. No se pueden realizar peticiones Ocen para este tipo de interrupciones.","ERROR")
CASE ELSE
	wf_inserta_texto("ERROR. ERROR DESCONOCIDO.","ANY")
END CHOOSE

cb_borrar.enabled=FALSE

If il_validacion < 0 then 
	cb_refresh.enabled=FALSE
	cb_peticion.enabled=FALSE
	dw_servicios.enabled=FALSE
   return
else
	cb_refresh.enabled=TRUE
	cb_peticion.enabled=TRUE
	dw_servicios.enabled=TRUE
end if



ll_nro_row =dw_ot_ocen.Retrieve(il_incidencia_nro)

//AHM (20/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF NOT gb_interfaseOsgm THEN
	
	if ll_nro_row > 0 THEN 
	
		sle_instalacion.text=String(dw_ot_ocen.GetItemNumber(1,"nro_instalacion"))
		il_nro_instalacion=Long(sle_instalacion.text)
		sle_servicio.text=dw_ot_ocen.GetItemString(1,"servicio")
		mle_comentarios.text=dw_ot_ocen.GetItemString(1,"comentarios")


		ls_control=dw_ot_ocen.GetItemString(1,"estado")
	
		IF ls_control='DF' THEN
			cb_peticion.enabled=TRUE
			cb_refresh.enabled=TRUE
			cb_borrar.enabled=TRUE
			mle_comentarios.enabled=TRUE
			dw_servicios.enabled=TRUE
		ELSE
			cb_peticion.enabled=FALSE
			cb_refresh.enabled=TRUE
			mle_comentarios.enabled=FALSE
			dw_servicios.enabled=FALSE
		END IF
	
		dw_ot_ocen.SelectRow(0,FALSE)
		dw_ot_ocen.SetRow(1)
		dw_ot_ocen.SelectRow(1,TRUE)
	
		il_row_ot_ocen=1
		
	END IF

	//wf_inserta_texto("Ok. "+ String(ll_nro_Row)+ &
	//	" Ordenes de trabajo asociadas","ANY")
	
	dw_servicios.retrieve()
	
	IF sle_servicio.text <> '0' THEN
		dw_servicios.SetItem(1,"DESCRIPCION",sle_servicio.text)
		//dw_servicios.SetItem(1,'codigo',sle_servicio.text)
	END IF
	
ELSE
	IF dw_ot_ocen.rowcount() > 0 THEN
		mle_comentarios.text = dw_ot_ocen.getItemString(1, "descripcion")
	END IF
END IF 


end event

event ue_grabar_datos();Long  ll_control
long	ll_codCausa				//C$$HEX1$$f300$$ENDHEX$$digo de la causa

//Cambiamos los iconos habilitados cuando este control tiene el focus.
w_2301_form_incidencia lw_ventana
powerobject	lpo_parent

//Loop getting the parent of the object until it is of type window!
lpo_parent = this.GetParent()
do while lpo_parent.TypeOf() <> window! and IsValid (lpo_parent)
	lpo_parent = lpo_parent.GetParent()
loop

lw_ventana = lpo_parent

if dw_ot_ocen.Rowcount()=0  THEN
	/*AHU (12/03/2009) Error al insertar Ocen causa gen$$HEX1$$e900$$ENDHEX$$rica 
   wf_inserta_solicitud(0)*/
	ib_insertarOt = TRUE
END IF

IF dw_ot_ocen.rowcount() > 0 THEN
	IF dw_ot_ocen.getItemNumber(1, "nro_sol_ocen")=0 THEN
			ib_insertarOt = TRUE
	END IF
END  IF

lw_ventana.TriggerEvent("ue_grabar")

ll_control=dw_ot_ocen.SetFocus()

ll_control=dw_ot_ocen.SelectRow(0, FALSE)

ll_control=dw_ot_ocen.SetRow(1)

ll_control=dw_ot_ocen.SelectRow(1, TRUE)





end event

public subroutine wf_inserta_texto (string as_text, string as_type);
dw_status.Insertrow(0)

il_row_status++

IF UPPER(as_type) = 'ERROR' THEN
	dw_status.SetItem(il_row_status,"col_error",1)
ELSE
	dw_status.SetItem(il_row_status,"col_error",0)
END IF

as_text= String(now())+" "+ as_text

dw_status.SetItem(il_row_status,"col_message",as_text)

dw_status.ScrollToRow(il_row_status)







end subroutine

public function boolean wf_comprobar_ot_abierta ();Long ll_rows
Boolean lb_rtn

lb_rtn=FALSE

ll_rows=dw_ot_ocen.RowCount()

if ll_rows > 0 then

	DO WHILE ll_rows > 0 
		
		IF (dw_ot_ocen.GetItemString(ll_rows,"estado") = 'ABIERTA') THEN
			wf_inserta_texto("Imposible agregar, existe una Ot abierta "+ &
				 String(dw_ot_ocen.GetItemNumber(ll_rows,"nro_ot_ocen")), "")
			lb_rtn=TRUE
		END IF

		ll_rows = ll_rows - 1 

	LOOP

end if

Return lb_rtn
end function

public function string wf_recupera_parametro (integer pwi_parametro);STRING ls_rtn

SELECT "GI_OCEN_PARAMETROS"."VALOR"
INTO :ls_rtn
FROM "GI_OCEN_PARAMETROS"
WHERE "GI_OCEN_PARAMETROS"."NRO_PARAMETRO" = :pwi_parametro;

IF ((SQLCA.SQLCode <> 0) OR (ISNULL(ls_rtn))) THEN 
	wf_inserta_texto("Error recuperando parametro "+String(pwi_parametro)+ ". Error "+ &
						   SQLCA.SQLErrText,"ERROR")
	ls_rtn="ERROR"
END IF



return ls_rtn
end function

public function integer wf_inserta_transaccion (long pwl_transaccion, string pws_input, string pws_output);pws_input=mid(pws_input,1,1024)
pws_output=mid(pws_output,1,1024)

INSERT INTO "GI_OCEN_INTERFASE" 
				( "NRO_TRANSACTION" , 
				  "DATE_INSERT" , 
				  "INPUT", 
				  "OUTPUT",
				  "INTERFACE_NAME")
		VALUES ( :pwl_transaccion,
					SYSDATE,
					:pws_input,
					:pws_output,
					'CCCMAN011S');

IF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error insertando en GI_OCEN_INTERFASE . Error "+ &
						   SQLCA.SQLErrText,"ERROR")
END IF

return 1
end function

public function string wf_anula_incidencia (long pl_nro_incidencia);/////////////////////////////////////////////////////////////////////////////////////////
//
//
//	Funcion: Anula
//
//	Objetivo: Llamar al SERVLET de OCEN para comunicar la anulacion de una OT.
//
// Parametros:  Entrada: al_nro_incidencia
//                        
//
//              Salida:  	
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios: 
//
//			Responsable		Fecha			 Actuaci$$HEX1$$f300$$ENDHEX$$n	    		 
//       ===========	   ========     ============
//       SRE            11/02/2008   Creaci$$HEX1$$f300$$ENDHEX$$n.
////////////////////////////////////////////////////////////////////////////////////////


SetPointer(HourGlass!)	

string httprequest,ls_header
String ls_url,ls_headers
String ls_args
String ls_ot_pems, ls_user, ls_password, ls_function, ls_arguments, ls_remarks, ls_data
long ll_ot_pems
long ll_nro
long ll_ret
long ll_length
long ll_max
long ll_count
long ll_possalto
Blob lblb_args

inet linet_main
n_cst_internet luo_data
integer li_respuesta

//Comprobamos que se tiene que proceder a anular

SELECT count(*)
INTO :ll_count
FROM "GI_OCEN_OT"
WHERE "GI_OCEN_OT"."NRO_INCIDENCIA" = :pl_nro_incidencia AND
		"GI_OCEN_OT"."ESTADO" = 'ABIERTA';


IF ll_count = 0 THEN RETURN "OK"


//RECUPERAMOS. 

ls_url=wf_recupera_parametro(1)
IF ls_url='ERROR' THEN RETURN "Error recuperando URL"

ls_user=wf_recupera_parametro(2)
IF ls_user='ERROR' THEN RETURN "Error recuperando USER"

ls_password=wf_recupera_parametro(3)
IF ls_password='ERROR' THEN RETURN "Error recuperando PASSWORD"

ls_function=wf_recupera_parametro(4)
IF ls_function='ERROR' THEN RETURN "Error recuperando FUNCTION"

SELECT NVL(MAX("GI_OCEN_INTERFASE"."NRO_TRANSACTION"),0)
INTO :ll_max
FROM "GI_OCEN_INTERFASE";

IF (SQLCA.SQLCode <> 0) THEN 
	Return "Error IN GI_OCEN_INTERFASE. Error: " +SQLCA.SQLErrText
END IF

/* Example:
http://localhost/servlet/XML?user=Santiago&password=Nada&Function=CIMMAN0003Z&Param01=171197
*/

linet_main = CREATE inet

luo_data = CREATE n_cst_internet

// ARGUMENTS
ls_args = '<?xml version="1.0" encoding="ISO-8859-1" ?> ~n~n' + &
			 '<HttpInterfaceListener> ~n~n' + &
			 ' <CodInterface>'+ls_function+'</CodInterface> ~n~n' + &	
          '  <UserName>'+ls_user+'</UserName> ~n~n'+ &
			 '  <Password>'+ls_password+'</Password> ~n~n' + &
			 '  <XmlOut>0</XmlOut> '+ &
			 '  <ParamList> '+&
          '	 <Param>'+&
          '	  <Value>'+String(pl_nro_incidencia)+'</Value> '+&
          '   </Param>'+&
          ' </ParamList>'+&
          '</HttpInterfaceListener>'
	

/*ls_args = "user="+ ls_user + "&password=" + ls_password + &
          "&Function=" + ls_function + "~n" + ls_ot_pems*/
lblb_args = blob(ls_args)

// HEADERS
ll_length = Len(lblb_args)
ls_headers = "Content-Type: " + &
       "text/html~n" + &
       "Content-Length: " + String( ll_length ) + "~n~n"
// LLAMAMOS A SU FUNCION
//PASO 8/10
hpb_progress.StepIt()

MessageBox("Aviso","Se va a proceder a enviar la petici$$HEX1$$f300$$ENDHEX$$n de anulaci$$HEX1$$f300$$ENDHEX$$n ~n" +&
						 "Por favor sea paciente, esta operaci$$HEX1$$f300$$ENDHEX$$n puede tardar unos minutos")

ll_ret = linet_main.PostURL(ls_url,lblb_args,ls_headers,luo_data)

ll_max= ll_max+1

wf_inserta_transaccion(ll_max,ls_args,luo_data.is_data)

IF ll_ret = 1 THEN
   //La transacci$$HEX1$$f300$$ENDHEX$$n ha sido correcta tenemos que ver los dos primeros caracteres de la transacci$$HEX1$$f300$$ENDHEX$$n
	IF (Mid(luo_data.is_data,1,1)='0') THEN
		// TODO CORRECTO

		//RETURN 0
	ELSE
		// ERROR EN OCEN
		DESTROY luo_data
		DESTROY linet_main
		RETURN "Error OCEN: "+luo_data.is_data
	END IF
ELSE
	DESTROY luo_data
	DESTROY linet_main
	Return "Error :" + string(ll_ret) + ". Tal vez el servidor no est$$HEX2$$e1002000$$ENDHEX$$operativo"
END IF

DESTROY luo_data
DESTROY linet_main
//PASO 10/10

RETURN "OK"

end function

public function string wf_get_datos_ida ();String ls_rs 

String ls_nro_incidencia
String ls_descripcion
String ls_comentarios
String ls_nro_instalacion
String ls_nombre_brigada
String ls_descripcion_causa
String ls_cod_causa
String ls_servicio

Long ll_nro_instalacion
Long ll_cod_causa 
Long ll_nro_brigada

ls_rs='ERROR'

//INCIDENCIA
ls_nro_incidencia =  String(il_incidencia_nro)

DO WHILE  len(ls_nro_incidencia) <> 7
	ls_nro_incidencia  = '0' + ls_nro_incidencia  
loop 

wf_inserta_texto(" #"+String( len(ls_nro_incidencia))+"#INC="+ls_nro_incidencia,'ANY')

//DESCRIPCION
ls_descripcion = is_descripcion 

ls_descripcion=wf_formatea_salida(ls_descripcion)

DO WHILE  len(ls_descripcion) <> 80
	ls_descripcion  = ls_descripcion + ' ' 
loop 

ls_descripcion=Mid(ls_Descripcion,1,80)

wf_inserta_texto(" #"+String( len(ls_descripcion))+"#DES="+ls_descripcion,'ANY')

//COMENTARIOS
ls_comentarios=mle_comentarios.text

ls_comentarios=wf_formatea_salida(ls_comentarios)

DO WHILE  len(ls_comentarios) <> 100
	ls_comentarios  = ls_comentarios + ' ' 
loop 

ls_comentarios=mid(ls_comentarios,1,100)

wf_inserta_texto(" #"+String( len(ls_comentarios))+"#COM="+ls_comentarios,'ANY')

//INSTALACION
ls_nro_instalacion = String (il_nro_instalacion)

DO WHILE  len(ls_nro_instalacion) <> 8
	ls_nro_instalacion  = '0' + ls_nro_instalacion  
loop 

wf_inserta_texto(" #"+String( len(ls_nro_instalacion))+"#INS="+ls_nro_instalacion,'ANY')

//SERVICIO
ls_servicio=sle_servicio.text

DO WHILE  len(ls_servicio) <> 10
	ls_servicio  = ls_servicio + ' ' 
loop 

wf_inserta_texto(" #"+String( len(ls_servicio))+"#SRV="+ls_servicio,'ANY')

//CAUSA Y BRIGADA
SELECT "SGD_INCIDENCIA"."COD_CAUSA", "SGD_INCIDENCIA"."NRO_BRIGADA" 
INTO :ll_cod_causa, :ll_nro_brigada
FROM "SGD_INCIDENCIA"
WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :il_incidencia_nro;

IF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error Recuperando Causa y Brigada. Error: " +SQLCA.SQLErrText,"ERROR")
	Return 'ERROR'
END IF

wf_inserta_texto(" #"+String( len(string(ll_cod_causa)))+"#CAU1="+String(ll_cod_causa),'ANY')
wf_inserta_texto(" #"+String( len(string(ll_nro_brigada)))+"#BRI1="+String(ll_nro_brigada),'ANY')

//NOMBRE BRIGADA

SELECT RPAD("GI_BRIGADA"."NOMBRE",25)
INTO :ls_nombre_brigada
FROM "GI_BRIGADA" 
WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada;

IF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error Recuperando nombre Brigada. Error: " +SQLCA.SQLErrText,"ERROR")
	Return 'ERROR'
END IF

wf_inserta_texto(" #"+String( len(ls_nombre_brigada))+"#BRI="+ls_nombre_brigada,'ANY')

//DESCRIPCION CAUSA Y CODIGO DE CAUSA
SELECT RPAD("GI_CAUSA"."DESCRIPCION",60), 
		 LPAD("GI_CAUSA"."COD_CAUSA",4,'0')
INTO :ls_descripcion_causa, :ls_cod_causa
FROM "GI_CAUSA"
WHERE "GI_CAUSA"."COD_CAUSA"= :ll_cod_causa;

IF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error Recuperando causa. Error: " +SQLCA.SQLErrText,"ERROR")
	Return 'ERROR'
END IF

wf_inserta_texto(" #"+String( len(ls_descripcion_causa))+"#CAD="+ls_descripcion_causa,'ANY')
wf_inserta_texto(" #"+String( len(ls_cod_causa))+"#CAU="+ls_cod_causa,'ANY')



//Left(ls_modelo_economico,gf_get_mod_long(ls_nivel_ME)) + space(15 - gf_get_mod_long(ls_nivel_ME))

ls_rs= ls_nro_incidencia + ls_descripcion + ls_comentarios + ls_nro_instalacion + ls_cod_causa + ls_descripcion_causa + ls_nombre_brigada + ls_servicio

return ls_rs

end function

public subroutine wf_inserta_solicitud (long pwl_solicitud);Long ll_control
String ls_control

//AHM (13/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF NOT gb_interfaseOsgm THEN
	//IF wf_comprobar_ot_abierta() = FALSE THEN
	IF dw_ot_ocen.RowCount() = 0 THEN
		dw_ot_ocen.InsertRow(0)
	ELSE
		//NADA hace update sobre la $$HEX1$$fa00$$ENDHEX$$nica linea
	END IF
		
	
	
	ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"nro_incidencia",il_incidencia_nro)
	ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"nro_sol_ocen",pwl_solicitud)
	ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"fecha_ini",today())
	ls_control=mle_comentarios.text
	ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"comentarios",ls_control)
	ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"nro_instalacion",Long(sle_instalacion.text))
	
	if (pwl_solicitud=0) THEN
		ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"estado",'DF')
	else
		ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"estado",'SO')
	end if
	ls_control=sle_servicio.text
	ll_control=dw_ot_ocen.SetItem(dw_ot_ocen.Rowcount(),"servicio",ls_control)
	//AHU No se graba nro_sol_ocen
	dw_ot_ocen.acceptText()
	ll_control=dw_ot_ocen.Update()
	
	ll_control= 0
	
ELSE

	dw_ot_ocen.retrieve(il_incidencia_nro)

END IF

end subroutine

public function string wf_formatea_salida (string as_salida);//sustituci$$HEX1$$f300$$ENDHEX$$n de retorno de carro por espacios

String ls_rtn
string ls_caracter
Long ll_len
Long ll_start


ls_rtn=""

ll_start=1
ll_len=len(as_salida)

do while ll_start <=ll_len
	
	ls_caracter = mid(as_salida,ll_start,1)
	
	IF ((char(10) <> char(ls_caracter)) AND (char(13) <> char(ls_caracter))) THEN
		ls_rtn= ls_rtn + ls_caracter
	ELSE
		ls_rtn=ls_rtn + " "
	END IF	
	ll_start= ll_start + 1 
loop

return ls_rtn
end function

public function integer wf_formatea_entrada (string as_entrada, ref integer ai_rtn, ref string as_vuelta);String ls_entrada
String ls_error
String ls_value


Long ll_posicion_ini, ll_posicion_fin

ls_entrada=as_entrada

//detectamos el error
ll_posicion_ini=Pos(ls_entrada,"<Error>",1)

ls_error=Mid(ls_entrada,ll_posicion_ini + 7,1)

ai_rtn=Integer (ls_error)

//detectamos el valor de vuelta

if ai_rtn=0 then 

	ll_posicion_ini=Pos(ls_entrada,"<Value>",1) + 7

	ll_posicion_fin=Pos(ls_entrada,"</Value>",1)	

	ll_posicion_fin= ll_posicion_fin - ll_posicion_ini
	
else
	
	ll_posicion_ini=Pos(ls_entrada,"<ErrorMessage>",1) + 14

	ll_posicion_fin=Pos(ls_entrada,"</ErrorMessage>",1)	

	ll_posicion_fin= ll_posicion_fin - ll_posicion_ini
end if 


as_vuelta=Mid(ls_entrada,ll_posicion_ini ,ll_posicion_fin)


return 1
end function

public function integer uf_altasolicitudequipomant (string ps_tipored, string ps_base, long pl_solicitud, long pl_padre, string ps_nompadre);/******************************************************************************/
/*	Descripci$$HEX1$$f300$$ENDHEX$$n	:	Damos de alta en base de datos la solicitud de los equipos 	*/
/*						de mantenimiento.															*/
/* Argumentos	:	ps_tipoRed			-> Tipo de red (Transporte (alta) o 		*/
/*													distribuci$$HEX1$$f300$$ENDHEX$$n (media o baja)).				*/
/*						ps_base				-> C$$HEX1$$f300$$ENDHEX$$digo base.									*/
/*						pl_solicitud		-> N$$HEX1$$fa00$$ENDHEX$$mero de solicitud.							*/
/*						pl_padre				-> N$$HEX1$$fa00$$ENDHEX$$mero de instalaci$$HEX1$$f300$$ENDHEX$$n padre.				*/
/*						ps_nomPadre			-> Nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n padre.			*/
/*	Devuelve		:	 1 -> Correcto.															*/
/*						-1 -> Error.																*/
/*					Autor							Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					*/
/*					 AHM						 14/09/2011			  Creaci$$HEX1$$f300$$ENDHEX$$n					*/
/******************************************************************************/

//Insertamos el nuevo registro
INSERT INTO GM_R_SOLICITUDES_EQUIPOS 
 			(TIPO_RED, PLAN, COD_BASE, COD_SOLICITUD, 
			 COD_EQUIPO, PROGRAMA, USUARIO, FECHA, COD_EQUIPO_PADRE, 
			 DESC_EQUIPO, DESC_EQUIPO_PADRE) 
       VALUES 
		  	(:ps_tipoRed, TO_NUMBER (TO_CHAR(SYSDATE,'YYYY')), :ps_base, :pl_solicitud, 
		  	 :pl_padre, 'MTSGI001', 'CMD', sysdate, :pl_padre,
          :ps_nomPadre, :ps_nomPadre);


//Comprobamos que la inserci$$HEX1$$f300$$ENDHEX$$n ha ido correctamente
IF SQLCA.SQLCODE = 0 THEN
	RETURN 1
ELSE
	messageBox(" Error", "Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
	RETURN -1
END IF

end function

protected function integer uf_altasolicitudmantenimiento (string ps_tipored, string ps_base, long pl_solicitud, integer pi_tipobase, string ps_tipoactuacion, string ps_nomelemento, string ps_coddesc, string ps_descripcion);/******************************************************************************/
/*	Descripci$$HEX1$$f300$$ENDHEX$$n	:  Se pasan los datos e inserta una nueva solicitud para 		*/
/*						mantenimiento.																*/
/* Argumentos	:  ps_tipoRed			-> Tipo de red (Transporte (alta) o 		*/
/*													distribuci$$HEX1$$f300$$ENDHEX$$n (media o baja)).				*/
/*						ps_base				-> C$$HEX1$$f300$$ENDHEX$$digo base.									*/
/*						pl_solicitud		-> N$$HEX1$$fa00$$ENDHEX$$mero de solicitud.							*/
/*						pi_tipoBase			-> C$$HEX1$$f300$$ENDHEX$$digo tipo base.								*/
/*						ps_tipoActuacion	-> Cod_tipo2.										*/
/*						ps_nomElemento		-> Cod_tipo3.										*/
/*						ps_codDesc			-> Cod_tipo4.										*/
/*						ps_descripcion		-> Descripci$$HEX1$$f300$$ENDHEX$$n de la incidencia				*/
/*	Devuelve		:	 1 -> Correcto.															*/
/*						-1 -> Error.																*/
/*					Autor							Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					*/
/*					 AHM						 14/09/2011			  Creaci$$HEX1$$f300$$ENDHEX$$n					*/
/******************************************************************************/

//Insertamos la solicitud
INSERT INTO GM_SOLICITUDES
	(TIPO_RED, PLAN, COD_BASE, COD_SOLICITUD,
	 PROGRAMA, USUARIO, FECHA,
	 COD_TIPO1, COD_TIPO2, COD_TIPO3, COD_TIPO4,
	 CONTRATA, FECHA_ALTA_SOLICITUD,
	 FECHA_INICIO, FECHA_FIN, COD_SERV_SOLICITANTE,
	 DESCRIPCION, GASTO_INVERSION, COD_PRIORIDAD,
	 COD_USUARIO, COD_ESTADO, PROCEDENCIA,
	 COD_INCIDENCIA, FRECUENCIA, DESCARGO, IMPORTE, HORAS_HOMBRE)
VALUES (:ps_tipoRed , TO_NUMBER (TO_CHAR(SYSDATE,'YYYY')), :ps_base, :pl_solicitud,
	 'MTSGI001', 'CMD', sysdate,
	 :pi_tipoBase , :ps_tipoActuacion , :ps_nomElemento , :ps_codDesc, 
	 1, SYSDATE, 
	 SYSDATE, SYSDATE, 5,
	 :ps_descripcion , 'G', 2, 
	 'CMD', '40', 'NO_PLAN',
	 :il_incidencia_nro, 0, 0, 0, 0);


//Comprobamos que la inserci$$HEX1$$f300$$ENDHEX$$n ha ido correctamente
IF SQLCA.SQLCODE = 0 THEN
	RETURN 1
ELSE
	messageBox(" Error", "Error en la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
	RETURN -1
END IF
end function

private function integer uf_obtenerdatossolicitudmantenimiento (ref long pl_causa, ref integer pi_alcance, ref string ps_base, ref long pl_solicitud, ref integer pi_tipobase, ref string ps_tipoactuacion, ref string ps_nomelemento, ref string ps_coddesc, ref long pl_padre, ref string ps_nompadre, ref string ps_tipored, ref string ps_descripcion);/******************************************************************************/
/*	Descripci$$HEX1$$f300$$ENDHEX$$n	:	Obtenemos los datos necesarios para inserta una solicitud 	*/
/*						para mantenimiento.														*/
/* Argumentos	:	pl_causa				-> C$$HEX1$$f300$$ENDHEX$$digo de la causa.							*/
/*						pi_alcance			-> Alcance de la incidencia.					*/
/*						ps_base				-> C$$HEX1$$f300$$ENDHEX$$digo base.									*/
/*						pl_solicitud		-> N$$HEX1$$fa00$$ENDHEX$$mero de solicitud.							*/
/*						pi_tipoBase			-> C$$HEX1$$f300$$ENDHEX$$digo tipo base.								*/
/*						ps_tipoActuacion	-> Cod_tipo2.										*/
/*						ps_nomElemento		-> Cod_tipo3.										*/
/*						ps_codDesc			-> Cod_tipo4.										*/
/*						pl_padre				-> N$$HEX1$$fa00$$ENDHEX$$mero de instalaci$$HEX1$$f300$$ENDHEX$$n padre.				*/
/*						ps_nomPadre			-> Nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n padre.			*/
/*						ps_tipoRed			-> Tipo de red (Transporte (alta) o 		*/
/*													distribuci$$HEX1$$f300$$ENDHEX$$n (media o baja)).				*/
/*						ps_descripcion		-> descripci$$HEX1$$f300$$ENDHEX$$n de la solicitud de 			*/
/*													mantenimiento.									*/
/*	Devuelve		:	 1 -> Correcto.															*/
/*						-1 -> Error.																*/
/*					Autor							Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					*/
/*					 AHM						 14/09/2011			  Creaci$$HEX1$$f300$$ENDHEX$$n					*/
/******************************************************************************/
int		li_mesa					// N$$HEX1$$fa00$$ENDHEX$$mero de mesa de la instalaci$$HEX1$$f300$$ENDHEX$$n origen
int		li_tension				// Tensi$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n origen (1 alta, 2 media o 3 baja)
int		li_tipoInstalacion	// Tipo de la instalaci$$HEX1$$f300$$ENDHEX$$n origen


//Obtenemos los datos que necesitamos de la incidencia
SELECT alcance, cod_causa
INTO   :pi_alcance, :pl_causa
FROM   sgd_incidencia
WHERE  nro_incidencia = :il_incidencia_nro;

//Comprobamos la recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de la incidencia 
IF SQLCA.SQLCODE <> 0 THEN
	messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de la incidencia para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
	RETURN -1
END IF

//Obtenemos los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n
SELECT a.tipo_instalacion, a.tension, a.nro_mesa, a.nro_inst_padre, NVL(b.nom_instalacion, ' ')
INTO	 :li_tipoInstalacion, :li_tension, :li_mesa, :pl_padre, :ps_nomPadre
FROM	 sgd_instalacion a, sgd_instalacion b
WHERE	 a.nro_instalacion = :il_nro_instalacion
       AND  a.nro_inst_padre = + b.nro_instalacion;
		 
//Comprobamos la recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n
IF SQLCA.SQLCODE <> 0 THEN
	messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de las instalaciones para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
	RETURN -1
END IF


// Transporte (Alta tensi$$HEX1$$f300$$ENDHEX$$n)
IF li_tension = 1 THEN 

	ps_tipoRed = "T"				// Tipo de red de tranporte
	
	IF (li_tipoInstalacion = 3) THEN		// La instalaci$$HEX1$$f300$$ENDHEX$$n es una subestaci$$HEX1$$f300$$ENDHEX$$n
		ps_tipoActuacion = "7"
		ps_nomElemento   = "52"
		ps_codDesc       = "104"
	ELSE
		ps_tipoActuacion = "3"
		ps_nomElemento   = "23"
		ps_codDesc			= "53"
	END IF
	
	//Obtenemos los c$$HEX1$$f300$$ENDHEX$$digos base
	SELECT cod_sector
	INTO :ps_base
	FROM sgd_instalacion, sgd_salat
	WHERE sgd_instalacion.nro_instalacion = sgd_salat.codigo;
	
	IF sqlca.sqlcode = 100 THEN

		SELECT cod_sector
		INTO :ps_base
		FROM sgd_instalacion, sgd_subestac
		WHERE sgd_instalacion.nro_instalacion = sgd_subestac.codigo;
	
		//Comprobamos la recuperaci$$HEX1$$f300$$ENDHEX$$n de los c$$HEX1$$f300$$ENDHEX$$digos base
		IF SQLCA.SQLCODE <> 0 THEN
			IF SQLCA.SQLCODE = 100 THEN
				messageBox(" Error", "Esta base no existe en mantenimiento")
			ELSE	
				messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de las bases para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
			END IF
			RETURN -1
		END IF
	ELSEIF sqlca.sqlcode <> 0 THEN
		messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de las bases para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
	END IF
	
	SELECT cod_uo
	INTO :pi_tipoBase
	FROM gm_unidades_operativas
	WHERE tipo_red = 'T'
	and tipo_instal_padre = substr(:il_nro_instalacion, 1, 2);
	
	//Comprobamos la recuperaci$$HEX1$$f300$$ENDHEX$$n de los c$$HEX1$$f300$$ENDHEX$$digos base
	IF SQLCA.SQLCODE <> 0 THEN
		IF SQLCA.SQLCODE = 100 THEN
			messageBox(" Error", "Esta base no existe en mantenimiento")
		ELSE	
			messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de las bases para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
		END IF
		RETURN -1
	END IF
		
ELSE  // Distribuci$$HEX1$$f300$$ENDHEX$$n (media y baja tensi$$HEX1$$f300$$ENDHEX$$n)
	
	ps_tipoRed = "D"							// Tipo de red de distribuci$$HEX1$$f300$$ENDHEX$$n
	
    IF li_tipoInstalacion = 4 THEN		// La instalaci$$HEX1$$f300$$ENDHEX$$n es una salida de media tensi$$HEX1$$f300$$ENDHEX$$n
		ps_tipoActuacion = "501"
		ps_nomElemento   = "509"
	ELSEIF (li_tipoInstalacion = 7 OR pi_alcance = 1) THEN				// La instalaci$$HEX1$$f300$$ENDHEX$$n es una salida de baja y es una incidencia de suministro
		ps_tipoActuacion = "501"
		ps_nomElemento   = "509"
	ELSEIF (li_tipoInstalacion = 5 OR li_tipoInstalacion = 6) THEN		// La instalaci$$HEX1$$f300$$ENDHEX$$n es un ct o un trafo
      ps_tipoActuacion = "503"
		ps_nomElemento   = "509"
	ELSEIF li_tipoInstalacion = 3 THEN	// La instalaci$$HEX1$$f300$$ENDHEX$$n es una subestaci$$HEX1$$f300$$ENDHEX$$n
      ps_tipoActuacion = "501" 
		ps_nomElemento   = "509"                       
	ELSE
      ps_tipoActuacion = "501"
		ps_nomElemento   = "509"                       
	END IF
 
 	// Obtiene cod_desc
   SELECT COD_TIPO4 
	INTO   :ps_codDesc
   FROM   GM_TIPO4 
   WHERE  SGI_TIPO_INCIDENCIA = :pl_causa
			 AND ACTIVO = 1; 
	
	//Comprobamos la recuperaci$$HEX1$$f300$$ENDHEX$$n de los tipos
	IF SQLCA.SQLCODE <> 0 THEN
		messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del c$$HEX1$$f300$$ENDHEX$$digo para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
		RETURN -1
	END IF
	
	//Obtenemos los c$$HEX1$$f300$$ENDHEX$$digos base
	SELECT cod_base, tipo_base
	INTO 	 :ps_base, :pi_tipoBase
	FROM 	 gm_bases
	WHERE  cod_nivel3_bdi = to_char(:li_mesa) // cod_centro_sgd = to_char(:li_mesa)
			 AND tipo_red = :ps_tipoRed;
	
	//Comprobamos la recuperaci$$HEX1$$f300$$ENDHEX$$n de los c$$HEX1$$f300$$ENDHEX$$digos base
	IF SQLCA.SQLCODE <> 0 THEN
		IF SQLCA.SQLCODE = 100 THEN
			messageBox(" Error", "Esta base no existe en mantenimiento")
		ELSE	
			messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de las bases para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
		END IF
		RETURN -1
	END IF
	
END IF

//Obtenemos el n$$HEX1$$fa00$$ENDHEX$$mero de solicitud
SELECT NVL(MAX(COD_SOLICITUD) + 1,1) 
INTO  :pl_solicitud
FROM  GM_SOLICITUDES 
WHERE PLAN = TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) AND 
      COD_BASE = :ps_base  AND 
  	   TIPO_RED = :ps_tipoRed;

//Comprobamos la obtenci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de solicitud
IF SQLCA.SQLCODE <> 0 THEN
	messageBox(" Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de solicitud para la inserci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento: " + String(sqlca.sqlcode) + " " + sqlca.SQLErrText)
	RETURN -1
END IF

//Obtenemos la descripci$$HEX1$$f300$$ENDHEX$$n de la solicitud de mantenimiento
ps_descripcion = mle_comentarios.text

RETURN 1
end function

public function integer uf_insertar_solicitud_mantenimiento (ref long pl_solicitud);/******************************************************************************/
/*	Descripci$$HEX1$$f300$$ENDHEX$$n	:	Inserta una solicitud para mantenimiento.							*/
/* Argumentos	:	pl_solicitud		-> N$$HEX1$$fa00$$ENDHEX$$mero de solicitud.							*/
/*	Devuelve		:	 1 -> Correcto.															*/
/*						-1 -> Error.																*/
/*					Autor							Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					*/
/*					 AHM						 14/09/2011			  Creaci$$HEX1$$f300$$ENDHEX$$n					*/
/******************************************************************************/
int		li_alcance				// Alcance de la incidencia
int		li_mesa					// N$$HEX1$$fa00$$ENDHEX$$mero de mesa de la instalaci$$HEX1$$f300$$ENDHEX$$n origen
int		li_tension				// Tensi$$HEX1$$f300$$ENDHEX$$n de la instalaci$$HEX1$$f300$$ENDHEX$$n origen (1 alta, 2 media o 3 baja)
int		li_tipoBase				// C$$HEX1$$f300$$ENDHEX$$digo tipo base
int		li_tipoInstalacion	// Tipo de la instalaci$$HEX1$$f300$$ENDHEX$$n origen
long		ll_causa					//	C$$HEX1$$f300$$ENDHEX$$digo de la causa de la incidencia
long		ll_padre					// N$$HEX1$$fa00$$ENDHEX$$mero de instalaci$$HEX1$$f300$$ENDHEX$$n padre
string	ls_base					// C$$HEX1$$f300$$ENDHEX$$digo base
string	ls_codDesc				// Cod_tipo4
string	ls_descripcion			// Descripci$$HEX1$$f300$$ENDHEX$$n de la solicitud
string	ls_nomElemento			// Cod_tipo3
string	ls_nomPadre				// Nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n padre
string	ls_tipoActuacion		// Cod_tipo2
string	ls_tipoRed				// Tipo de red (Transporte (alta) o distribuci$$HEX1$$f300$$ENDHEX$$n (media o baja))

//Obtenemos los datos necesarios para dar de alta una solicitud
IF uf_obtenerDatosSolicitudMantenimiento(ll_causa, li_alcance, ls_base, pl_solicitud, li_tipoBase, ls_tipoActuacion, ls_nomElemento, ls_codDesc, ll_padre, ls_nomPadre, ls_tipoRed, ls_descripcion) = -1 THEN
	ROLLBACK;
	RETURN -1
END IF	

//Insertamos la solicitud en Base de datos
IF uf_altaSolicitudMantenimiento(ls_tipoRed, ls_base, pl_solicitud, li_tipoBase, ls_tipoActuacion, ls_nomElemento, ls_codDesc, ls_descripcion) = -1 THEN
	ROLLBACK;
	RETURN -1
END IF

//Insertamos la solicitud del equipo de mantenimiento
IF uf_altaSolicitudEquipoMant(ls_tipoRed, ls_base, pl_solicitud, ll_padre, ls_nomPadre) = -1 THEN
	ROLLBACK;
	RETURN -1
END IF

//Actualizamos el estado de mantenimiento
IF uf_cambiarEstadoMantIncid(2) = -1 THEN
	ROLLBACK;
	RETURN -1
END IF

RETURN 1

end function

public function integer wf_cargasolicitud ();/***************************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Inicializa y carga los datos del dw de la solicitud.						*/
/*	Par$$HEX1$$e100$$ENDHEX$$metros	: -																							*/
/* Devuelve		:  1 OK																						*/
/*					  -1 KO																						*/
/*						Autor						Fecha							Acci$$HEX1$$f300$$ENDHEX$$n						*/
/*						 AHM					 02/11/2011					  Creaci$$HEX1$$f300$$ENDHEX$$n						*/
/***************************************************************************************/
int		li_fila			// N$$HEX1$$fa00$$ENDHEX$$mero de solicitudes que recuperamos

setRedraw(FALSE)

//Asignaci$$HEX1$$f300$$ENDHEX$$n del objeto transacci$$HEX1$$f300$$ENDHEX$$n
dw_ot_ocen.SetTransObject(SQLCA)

//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos de la solicitud
li_fila = dw_ot_ocen.retrieve(il_incidencia_nro)
IF li_fila < 0 THEN
	messageBox("Error", "Error en la recuperaci$$HEX1$$f300$$ENDHEX$$n de la solicitud")
	RETURN -1
END IF

//Carga de la descripci$$HEX1$$f300$$ENDHEX$$n de la solicitud
IF li_fila > 0 THEN
	mle_comentarios.text = dw_ot_ocen.getItemString(1, "descripcion")
END IF

setRedraw(TRUE)

RETURN 1

end function

public function integer uf_cambiarestadomantincid (integer pi_estado);/******************************************************************************/
/*	Descripci$$HEX1$$f300$$ENDHEX$$n	:	Cambiarmos el estado de mantenimiento de la incidencia.		*/
/* Argumentos	:	pi_estado			-> Estado de manteniemiento al que debe	*/
/*													pasar la incidencia.							*/
/*	Devuelve		:	 1 -> Correcto.															*/
/*						-1 -> Error.																*/
/*					Autor							Fecha					Acci$$HEX1$$f300$$ENDHEX$$n					*/
/*					 AHM						 15/11/2011			  Creaci$$HEX1$$f300$$ENDHEX$$n					*/
/******************************************************************************/
w_2301_form_incidencia	lw_ventana		//Variable que hace referencia a la ventana padre
powerobject					lpo_parent		//Objeto necesario para la b$$HEX1$$fa00$$ENDHEX$$squeda de la ventana padre


//B$$HEX1$$fa00$$ENDHEX$$squeda de la ventana padre
lpo_parent = this.GetParent()
do while lpo_parent.TypeOf() <> window! and IsValid (lpo_parent)
	lpo_parent = lpo_parent.GetParent()
loop

lw_ventana = lpo_parent


lw_ventana.tab_1.tabpage_formulario.d_inf_general.setItem(1, 'estado_mantenimiento', 2)	
lw_ventana.tab_1.ii_estado_mant = 2
gi_resuelve_mant = 1
lw_ventana.tab_1.tabpage_seguimiento.chk_resolucion_mant.Checked = TRUE


RETURN 1
end function

on u_2301_tabpage_ocen.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_borrar=create cb_borrar
this.dw_servicios=create dw_servicios
this.sle_servicio=create sle_servicio
this.st_3=create st_3
this.cb_sim_cancela=create cb_sim_cancela
this.cb_envia_ot=create cb_envia_ot
this.cb_selecciona=create cb_selecciona
this.sle_instalacion=create sle_instalacion
this.st_2=create st_2
this.mle_comentarios=create mle_comentarios
this.cb_guardar_log=create cb_guardar_log
this.cb_cerrar=create cb_cerrar
this.cb_simula=create cb_simula
this.dw_status=create dw_status
this.st_1=create st_1
this.cb_refresh=create cb_refresh
this.cb_peticion=create cb_peticion
this.hpb_progress=create hpb_progress
this.dw_ot_ocen=create dw_ot_ocen
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_2,&
this.cb_1,&
this.cb_borrar,&
this.dw_servicios,&
this.sle_servicio,&
this.st_3,&
this.cb_sim_cancela,&
this.cb_envia_ot,&
this.cb_selecciona,&
this.sle_instalacion,&
this.st_2,&
this.mle_comentarios,&
this.cb_guardar_log,&
this.cb_cerrar,&
this.cb_simula,&
this.dw_status,&
this.st_1,&
this.cb_refresh,&
this.cb_peticion,&
this.hpb_progress,&
this.dw_ot_ocen,&
this.gb_2,&
this.gb_1}
end on

on u_2301_tabpage_ocen.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_borrar)
destroy(this.dw_servicios)
destroy(this.sle_servicio)
destroy(this.st_3)
destroy(this.cb_sim_cancela)
destroy(this.cb_envia_ot)
destroy(this.cb_selecciona)
destroy(this.sle_instalacion)
destroy(this.st_2)
destroy(this.mle_comentarios)
destroy(this.cb_guardar_log)
destroy(this.cb_cerrar)
destroy(this.cb_simula)
destroy(this.dw_status)
destroy(this.st_1)
destroy(this.cb_refresh)
destroy(this.cb_peticion)
destroy(this.hpb_progress)
destroy(this.dw_ot_ocen)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event constructor;dw_ot_ocen.SetTransObject(SQLCA)
dw_status.SetTransObject(SQLCA)
dw_servicios.SetTransObject(SQLCA)

//AHM(13/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF gb_interfaseOsgm THEN
	mle_comentarios.limit = 256
END IF






end event

type cb_2 from commandbutton within u_2301_tabpage_ocen
integer x = 2962
integer y = 1484
integer width = 343
integer height = 92
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
end type

event clicked;String l1,l2,l3
integer i1
wf_formatea_entrada(l1,i1,l3)
end event

type cb_1 from commandbutton within u_2301_tabpage_ocen
integer x = 2587
integer y = 1484
integer width = 343
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "none"
end type

event clicked;mle_comentarios.text=wf_formatea_salida(mle_comentarios.text)
end event

type cb_borrar from commandbutton within u_2301_tabpage_ocen
integer x = 2999
integer y = 1184
integer width = 361
integer height = 92
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Borrar Petici$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;if il_row_ot_ocen > 0 THEN
	dw_ot_ocen.DeleteRow(1)
	wf_inserta_texto("Ok. OT Borrada","")
	mle_comentarios.text=""
	sle_servicio.text="0"
	dw_servicios.SetItem(1,"DESCRIPCION",sle_servicio.text)
	dw_ot_ocen.Update()
	il_row_ot_ocen=0
	//parent.postEvent("ue_grabar_datos")	
else
	wf_inserta_texto("Ok. Por favor seleccione una Ot.","")
end if
end event

type dw_servicios from datawindow within u_2301_tabpage_ocen
integer x = 1243
integer y = 1216
integer width = 841
integer height = 96
integer taborder = 120
string title = "none"
string dataobject = "d_ot_servicio"
borderstyle borderstyle = stylelowered!
end type

event itemchanged;this.AcceptText()
sle_servicio.text=This.getItemString(row,"descripcion")

ib_cambios=TRUE
end event

type sle_servicio from singlelineedit within u_2301_tabpage_ocen
integer x = 73
integer y = 1440
integer width = 658
integer height = 96
integer taborder = 130
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within u_2301_tabpage_ocen
integer x = 987
integer y = 1248
integer width = 256
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicio :"
boolean focusrectangle = false
end type

type cb_sim_cancela from commandbutton within u_2301_tabpage_ocen
integer x = 1755
integer y = 1472
integer width = 379
integer height = 92
integer taborder = 140
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Simula Cancela"
end type

event clicked;
if il_row_ot_ocen > 0 THEN
	dw_ot_ocen.SetItem(il_row_ot_ocen,"fecha_fin",today())
	dw_ot_ocen.SetItem(il_row_ot_ocen,"estado",'CA')
	wf_inserta_texto("Ok. OT Cancelada.","")
	dw_ot_ocen.Update()
	parent.postEvent("ue_grabar_datos")	
else
	wf_inserta_texto("Ok. Por favor seleccione una Ot.","")
end if

end event

type cb_envia_ot from commandbutton within u_2301_tabpage_ocen
integer x = 1024
integer y = 1472
integer width = 343
integer height = 92
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Simula OT"
end type

event clicked;if il_row_ot_ocen > 0 THEN
	dw_ot_ocen.SetItem(il_row_ot_ocen,"nro_ot_ocen",dw_ot_ocen.RowCount())
	dw_ot_ocen.SetItem(il_row_ot_ocen,"estado",'CR')
	wf_inserta_texto("Ok. OT Creada.","")
	dw_ot_ocen.Update()
	parent.postEvent("ue_grabar_datos")	
else
	wf_inserta_texto("Ok. Por favor seleccione una Ot.","")
end if
end event

type cb_selecciona from commandbutton within u_2301_tabpage_ocen
integer x = 73
integer y = 1568
integer width = 535
integer height = 92
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Selecciona Instalacion"
end type

event clicked;gu_comunic.is_comunic.intval1=gi_nro_centro
gu_comunic.is_comunic.intval2=gi_nro_cmd
gu_comunic.is_comunic.intval3=gi_nro_puesto

IF gb_operador_cmd THEN		// filtra por centro y cmd solo
	gu_comunic.is_comunic.intval4 = 2
ELSE
	gu_comunic.is_comunic.intval4 = 1
END IF
gu_comunic.is_comunic.intval6 = 1 //Tipo inciencia

gu_comunic.is_comunic.Accion_Llamada="Seleccion"
gu_comunic.is_comunic.Programa_Retorno=" "
gu_comunic.is_comunic.Accion_Retorno=" "
gu_comunic.is_comunic.longval1=0
gu_comunic.is_comunic.longval2=0
gu_comunic.is_comunic.longval3=0
gu_comunic.is_comunic.strval1=""
gu_comunic.is_comunic.strval2=""
gu_comunic.is_comunic.intval5=0
gu_comunic.is_comunic.programa_llamante="u_ocen"


OpenWithParm(w_2120_identificacion_instalacion, gu_comunic.is_comunic.programa_llamante)

IF gu_comunic1.is_comunic.decval1 > 0  THEN 
	
	sle_instalacion.text = String(gu_comunic1.is_comunic.decval1 )
			
			
END IF
end event

type sle_instalacion from singlelineedit within u_2301_tabpage_ocen
integer x = 466
integer y = 1248
integer width = 485
integer height = 96
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean enabled = false
string text = "No hay instalacion"
boolean border = false
boolean displayonly = true
end type

type st_2 from statictext within u_2301_tabpage_ocen
integer x = 137
integer y = 1248
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Instalaci$$HEX1$$f300$$ENDHEX$$n :"
boolean focusrectangle = false
end type

type mle_comentarios from multilineedit within u_2301_tabpage_ocen
integer x = 183
integer y = 448
integer width = 1865
integer height = 736
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;ib_cambios=TRUE
end event

type cb_guardar_log from commandbutton within u_2301_tabpage_ocen
integer x = 2167
integer y = 1476
integer width = 343
integer height = 92
integer taborder = 150
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Guarda Log"
end type

event clicked;/**/

string docname, named
integer li_FileNum
integer value, li_x
integer li_count

String ls_texto

value = GetFileSaveName("Select File", docname, named, "TXT", &
		 						"Text Files (*.TXT),*.TXT")

IF value = 1 THEN

	li_count = dw_status.Rowcount()
	
	ls_texto = "Log creado " + String(Today())+ " a las " + String (now()) + "~n"

	FOR li_x=1 TO li_count
		
		ls_texto= ls_texto + dw_status.GetItemString(li_count,"col_message") + "~n"
	
	NEXT

	li_FileNum = FileOpen(docname, StreamMode!, Write!, Shared!, Replace!)

	FileWrite(li_FileNum, ls_texto)

	FileClose(li_FileNum)
END IF



end event

type cb_cerrar from commandbutton within u_2301_tabpage_ocen
integer x = 1390
integer y = 1472
integer width = 329
integer height = 92
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Simula Cerrar"
end type

event clicked;
if il_row_ot_ocen > 0 THEN
	dw_ot_ocen.SetItem(il_row_ot_ocen,"fecha_fin",today())
	dw_ot_ocen.SetItem(il_row_ot_ocen,"estado",'CE')
	wf_inserta_texto("Ok. OT Cerrada.","")
	dw_ot_ocen.Update()
	parent.postEvent("ue_grabar_datos")	
else
	wf_inserta_texto("Ok. Por favor seleccione una Ot.","")
end if

end event

type cb_simula from commandbutton within u_2301_tabpage_ocen
integer x = 658
integer y = 1568
integer width = 402
integer height = 92
integer taborder = 110
integer textsize = -6
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sumula Solicitud"
end type

event clicked;Long ll_nro_sol
Integer li_respuesta

ll_nro_sol = dw_ot_ocen.Rowcount()

if ll_nro_sol = 0 THEN

/*
	li_respuesta = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a proceder a iniciar la comunicaci$$HEX1$$f300$$ENDHEX$$n con OCEN.~n"+ &
	   "Una vez OCEN valide la orden de trabajo se guardar$$HEX1$$e100$$ENDHEX$$n todos los datos de la incidencia autom$$HEX1$$e100$$ENDHEX$$ticamente.~n" +&
		"$$HEX1$$bf00$$ENDHEX$$Desea continuar?" ,Question!, YesNo!, 2)

	IF li_respuesta = 1 THEN
  	// Process OK.
*/
		wf_inserta_solicitud(ll_nro_sol)
		dw_ot_ocen.Update()
		//parent.postEvent("ue_grabar_datos")	
/*
	ELSE
		RETURN 1
  	// Process CANCEL.

	END IF
*/
END IF






end event

type dw_status from datawindow within u_2301_tabpage_ocen
integer x = 2158
integer y = 384
integer width = 1207
integer height = 768
integer taborder = 50
string title = "none"
string dataobject = "d_ot_message"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within u_2301_tabpage_ocen
integer x = 2194
integer y = 1312
integer width = 183
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Status"
boolean focusrectangle = false
end type

type cb_refresh from commandbutton within u_2301_tabpage_ocen
integer x = 2633
integer y = 1184
integer width = 338
integer height = 92
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Refresco Log"
end type

event clicked;dw_status.Reset()

il_row_status=0

wf_inserta_texto("Ok. Refresco","")
//wf_inserta_texto("Ok. "+ String(dw_ot_ocen.Retrieve(il_incidencia_nro))+ &
//	" Ordenes de trabajo asociadas","ANY")

hpb_progress.position=0

parent.TriggerEvent("ue_carga_datos")


end event

type cb_peticion from commandbutton within u_2301_tabpage_ocen
integer x = 2158
integer y = 1184
integer width = 434
integer height = 92
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Petici$$HEX1$$f300$$ENDHEX$$n Ocen"
end type

event clicked;/////////////////////////////////////////////////////////////////////////////////////////
//
//
//	Funcion: Peticion 
//
//	Objetivo: Llamar al SERVLET de OCEN para comunicar la peticion de una OT.
//
// Parametros:  Entrada: al_nro_incidencia
//                        
//
//              Salida:  	
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios: 
//
//			Responsable		Fecha			 Actuaci$$HEX1$$f300$$ENDHEX$$n	    		 
//       ===========	   ========     ============
//       SRE            11/02/2008   Creaci$$HEX1$$f300$$ENDHEX$$n.
////////////////////////////////////////////////////////////////////////////////////////


SetPointer(HourGlass!)	

string httprequest,ls_header
String ls_url,ls_headers
String ls_args
String ls_ot_pems, ls_user, ls_password, ls_function, ls_arguments, ls_remarks, ls_data
String ls_datos_ida
String ls_port
long ll_port
long ll_ot_pems
long ll_nro
long ll_ret
long ll_length
long ll_max
long ll_possalto
long ll_cod_causa
long ll_solicitud				// N$$HEX1$$fa00$$ENDHEX$$mero de la solicitud de mantenimiento insertada
Blob lblb_args
inet linet_main
n_cst_internet luo_data
int	li_valor
integer li_respuesta
integer li_error
String ls_error

// A$$HEX1$$f100$$ENDHEX$$adido por RCA (05/02/2009) A peticion de Santiago Reparaz.
w_2301_form_incidencia lw_ventana
powerobject	lpo_parent

//Comentado por AHU
////Loop getting the parent of the object until it is of type window!
//lpo_parent = this.GetParent()
//do while lpo_parent.TypeOf() <> window! and IsValid (lpo_parent)
//	lpo_parent = lpo_parent.GetParent()
//loop
//
//lw_ventana = lpo_parent
//
///*IF lw_ventana.fw_verifica_otros_graba() = 0 THEN
//	return 1
//END IF	
//// Fin a$$HEX1$$f100$$ENDHEX$$adido RCA (05/02/2009)*/
//
////AHU
//SELECT valor
//INTO :li_valor
//FROM gi_parametros
//WHERE cod_parametro = 110;
//	 
////Comprueba la obligatoriedad del campo agente de la capeta otros y que este campo est$$HEX2$$e9002000$$ENDHEX$$relleno
//IF li_valor = 1 and (isnull(lw_ventana.tab_1.tabpage_otros.dw_otros.getitemnumber(1,"agente")) or &
//						   lw_ventana.tab_1.tabpage_otros.dw_otros.getitemnumber(1,"agente") = 0) then
//			
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Es necesario rellenar el campo agente en la pesta$$HEX1$$f100$$ENDHEX$$a OTROS")
//	return  0
//end if
//

//Comprobar desglose y la instalacion
IF mle_comentarios.text = "" THEN
 	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe rellenar el desglose de la solicitud con las acciones a realizar")
	return 1
END IF

IF sle_instalacion.text = "" THEN
 	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar la instalaci$$HEX1$$f300$$ENDHEX$$n afectada")
	return 1
END IF

//AHM (13/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI - OSGM
IF NOT gb_interfaseOsgm THEN
	
	IF sle_servicio.text="0" THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe seleccionar un servicio ejecutor")
		return 1
	END IF
	
	li_respuesta = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a proceder a iniciar la comunicaci$$HEX1$$f300$$ENDHEX$$n con OCEN.~n"+ &
			"Una vez OCEN valide la orden de trabajo se guardar$$HEX1$$e100$$ENDHEX$$n todos los datos de la incidencia autom$$HEX1$$e100$$ENDHEX$$ticamente.~n" +&
			"$$HEX1$$bf00$$ENDHEX$$Desea continuar?" ,Question!, YesNo!, 2)
ELSE
	li_respuesta = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a proceder a generar la solicitud a mantenimiento.~n"+ &
			"Una vez se valide la orden de trabajo, se guardar$$HEX1$$e100$$ENDHEX$$n todos los datos de la incidencia autom$$HEX1$$e100$$ENDHEX$$ticamente.~n" +&
			"$$HEX1$$bf00$$ENDHEX$$Desea continuar?" ,Question!, YesNo!, 2)
END IF

IF li_respuesta = 1 THEN
	
	if iw_contenedora.tab_1.fnu_comprueba_fin_ot(fgnu_fecha_actual())= -1 then
   	MessageBox("Error","No se ha podido finalizar los trabajos de las brigadas en el SGI")  
		return 1
	end if
	
   parent.TriggerEvent("ue_grabar_datos")	
	
  // Process OK.
ELSE
	RETURN 1
  // Process CANCEL.

END IF

//AHU (12/03/2009) Fallo al grabar la causa OCEN
/*SELECT NVL("SGD_INCIDENCIA"."COD_CAUSA",999)
INTO :ll_cod_causa
FROM "SGD_INCIDENCIA" 
WHERE "SGD_INCIDENCIA"."NRO_INCIDENCIA" = :il_incidencia_nro;

IF ll_cod_causa=999 THEN
	wf_inserta_texto("Debe ingresar una causa que no sea gen$$HEX1$$e900$$ENDHEX$$rica","ERROR")
	return 1
END IF*/

//AHU 13/03/2009 OCEN error al enviar la ot por causa gen$$HEX1$$e900$$ENDHEX$$rica
IF Ib_insertarOt THEN
	//PASO 1/10
	IF wf_comprobar_ot_Abierta() =TRUE THEN RETURN
	
	//AHM (13/10/2011) Integraci$$HEX1$$f300$$ENDHEX$$n OSGI- OSGM
	IF NOT gb_interfaseOsgm THEN
		hpb_progress.StepIt()	
		//RECUPERAMOS. 
		
		ls_url=wf_recupera_parametro(1)
		IF ls_url='ERROR' THEN RETURN
		wf_inserta_texto("Ok. Url "+ls_url,"ANY")
		//PASO 2/10
		hpb_progress.StepIt()
		
		//SRE PUERTO
		ls_port=wf_recupera_parametro(8)
		IF ls_url='ERROR' THEN RETURN
		wf_inserta_texto("Ok. PUERTO "+ls_port,"ANY")
		ll_port=Long(ls_port)
		
		
		ls_user=wf_recupera_parametro(2)
		IF ls_user='ERROR' THEN RETURN
		wf_inserta_texto("Ok. User "+ls_user,"ANY")
		//PASO 3/10
		hpb_progress.StepIt()
		
		ls_password=wf_recupera_parametro(3)
		IF ls_password='ERROR' THEN RETURN
		wf_inserta_texto("Ok. Password **********","ANY")
		
		//ELIMINO ESTE PASO...DEL stepit
		
		ls_function=wf_recupera_parametro(4)
		IF ls_function='ERROR' THEN RETURN
		wf_inserta_texto("Ok. Function " +ls_function,"ANY")
		
		//PASO 4/10
		hpb_progress.StepIt()
		
		// ARGUMENTS
		
		// NUMERO_INCIDENCIA A[10]
		// DESCRIPCION INCIDENCIA A[100]
		// COMENTARIOS A[100]
		// NRO INSTALACION N[8]
		ls_datos_ida = wf_get_datos_ida()
		
		IF ls_datos_ida='ERROR' THEN RETURN
		wf_inserta_texto("Ok. Datos ida ##" +ls_datos_ida+"##","ANY")
		wf_inserta_texto("Ok. Tama$$HEX1$$f100$$ENDHEX$$o trama "+ String(Len(ls_Datos_ida)),"ANY")
		
		//PASO 5/10
		hpb_progress.StepIt()
		
		
		SELECT NVL(MAX("GI_OCEN_INTERFASE"."NRO_TRANSACTION"),0)
		INTO :ll_max
		FROM "GI_OCEN_INTERFASE";
		//PASO 6/10
		hpb_progress.StepIt()
		
		
		IF (SQLCA.SQLCode <> 0) THEN 
			wf_inserta_texto("Error IN GI_OCEN_INTERFASE. Error: " +SQLCA.SQLErrText,"ERROR")
			Return -1
		END IF
		
		wf_inserta_texto("Ok. Maximo transaction "+string(ll_max),"ANY")
		//PASO 7/10
		hpb_progress.StepIt()
		/* Example:
		http://10.110.3.148:8080/SGIServlet/SGI?user=Santiago&password=Nada&CodInterface=CCCMAN00011S
		*/
		
		linet_main = CREATE inet
		
		luo_data = CREATE n_cst_internet
		
		ls_args = '<?xml version="1.0" encoding="ISO-8859-1"?> ~n~n' + &
					 '<content> ~n~n' + &
					 ' <CodInterface>'+ls_function+'</CodInterface> ~n~n' + &	
					 '  <UserName>'+ls_user+'</UserName> ~n~n'+ &
					 '  <Password>'+ls_password+'</Password> ~n~n' + &
					 '  <XmlOut>1</XmlOut> '+ &
					 '  <ParamList> '+&
					 '	 <Param>'+&
					 '	  <Value>'+ls_datos_ida+'</Value> '+&
					 '   </Param>'+&
					 ' </ParamList>'+&
					 '</content>'
			
		/*
		ls_args = '<?xml version="1.0" encoding="ISO-8859-1" ?> ~n~n' + &
					 '<HttpInterfaceListener> ~n~n' + &
					 ' <CodInterface>'+ls_function+'</CodInterface> ~n~n' + &	
					 '  <UserName>'+ls_user+'</UserName> ~n~n'+ &
					 '  <Password>'+ls_password+'</Password> ~n~n' + &
					 '  <XmlOut>1</XmlOut> '+ &
					 '  <ParamList> '+&
					 '	 <Param>'+&
					 '	  <Value>'+ls_datos_ida+'</Value> '+&
					 '   </Param>'+&
					 ' </ParamList>'+&
					 '</HttpInterfaceListener>'	
			*/
		
		/*ls_args = "user="+ ls_user + "&password=" + ls_password + &
					 "&Function=" + ls_function + "~n" + ls_ot_pems*/
		lblb_args = blob(ls_args)
		
		// HEADERS
		ll_length = Len(lblb_args)
		ls_headers = "Content-Type: " + &
				 "text/html~n" + &
				 "Content-Length: " + String( ll_length ) + "~n~n"
		// LLAMAMOS A SU FUNCION
		//PASO 8/10
		hpb_progress.StepIt()
		wf_inserta_texto("Ok. Comunicando petici$$HEX1$$f300$$ENDHEX$$n OCEN","")
		wf_inserta_texto("Ok. Por favor sea paciente.","")
		wf_inserta_texto("Ok. Esta operacion puede durar unos minutos...","")
		
		ll_ret = linet_main.PostURL(ls_url,lblb_args,ls_headers,ll_port,luo_data)
		
		//TEST
		//luo_data.is_data='<?xml version="1.0" encoding="ISO-8859-1"?><content><Error>0</Error><ParamList><Param><Name>str_retorno</Name><Value>0254</Value></Param></ParamList></content>'
		//ll_ret=1
		
		//FORMATEAMOS VUELTA
		wf_formatea_entrada(luo_data.is_data,li_error,ls_error)
		
		/*---------------------------------------------------------*/
		//PARCHE PRUEBAS LOCAL SRE
		
		IF ls_url="http://localhost/SGIServlet/SGI?" THEN
			wf_inserta_texto("AVISO. Servidor local. Datos Simulados.","")
			li_error=0 //Ninguno.
			ll_ret=1 //servidor levantado.
		
			SELECT '0'||TO_CHAR(MAX(NRO_SOL_OCEN) + 1)
			into :ls_error 
			FROM GI_OCEN_OT;
		
		END IF
		/*---------------------------------------------------------*/
		
		ll_max= ll_max+1
		//PASO 9/10
		hpb_progress.StepIt()
		//wf_inserta_transaccion(ll_max,ls_args,mid(luo_data.is_data,1,1024))
		wf_inserta_transaccion(ll_max,ls_datos_ida,ls_error)
		
		IF ((ll_ret = 1) and (ls_error <> '')) THEN
			//La transacci$$HEX1$$f300$$ENDHEX$$n ha sido correcta tenemos que ver los dos primeros caracteres de la transacci$$HEX1$$f300$$ENDHEX$$n
		//	IF (Mid(luo_data.is_data,1,1)='0') THEN
			IF li_error=0 THEN
				// TODO CORRECTO
				//wf_inserta_solicitud(long(mid(luo_data.is_data,1,10)))
				wf_inserta_solicitud(Long(ls_error))
				//wf_inserta_texto("Ok. Ot recibida"+luo_data.is_data,"ANY")
				wf_inserta_texto("Ok. Ot recibida" + ls_error,"ANY")
				//AHU No se guarda el n$$HEX1$$fa00$$ENDHEX$$mero de solicitud de OCEN
				ib_insertarOt = FALSE
				parent.triggerEvent("ue_grabar_datos")	
				//RETURN 0
			ELSE
				// ERROR EN PEMS
				/*
				IF LastPos(luo_data.is_data,'The page cannot be displayed') <> 0 THEN
					wf_inserta_texto("Error en OCEN: Tal vez el servidor no est$$HEX2$$e1002000$$ENDHEX$$operativo,  por favor revise la configuraci$$HEX1$$f300$$ENDHEX$$n","ERROR")
				ELSE
					wf_inserta_texto("Error OCEN: "+Mid(luo_data.is_data,1,950),"ERROR")
				END IF	
				*/
				wf_inserta_texto("Error OCEN "+String(li_error)+":"+ls_error,"ERROR")
				DESTROY luo_data
				DESTROY linet_main
				RETURN -1
			END IF
		ELSE
			wf_inserta_texto("Error :" + string(ll_ret) + ". Tal vez el servidor/URL no est$$HEX2$$e1002000$$ENDHEX$$operativo","ERROR")
			DESTROY luo_data
			DESTROY linet_main
			Return -1
		END IF
		
		ib_insertarOt = FALSE
		
		DESTROY luo_data
		DESTROY linet_main
		//PASO 10/10
		hpb_progress.StepIt()
	ELSE
		IF uf_insertar_solicitud_mantenimiento(ll_solicitud) = -1 THEN
			RETURN -1
		END IF

		parent.TriggerEvent("ue_grabar_datos")
		messageBox("Informaci$$HEX1$$f300$$ENDHEX$$n", "La solicitud de mantenimiento " + string(ll_solicitud) + " se ha insertado correctamente")
	END IF
END IF

ib_insertarOt = FALSE

RETURN 0



end event

type hpb_progress from hprogressbar within u_2301_tabpage_ocen
integer x = 2414
integer y = 1312
integer width = 914
integer height = 64
unsignedinteger maxposition = 100
integer setstep = 10
end type

type dw_ot_ocen from datawindow within u_2301_tabpage_ocen
integer x = 329
integer y = 96
integer width = 2853
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "d_ot_ocen"
borderstyle borderstyle = stylelowered!
end type

event clicked;String ls_control

SelectRow(0, FALSE)
if row > 0 then
	SetRow(row)
	SelectRow(row, TRUE)
//	wf_inserta_Texto("Ok. Seleccionada OT","Any")
	il_row_ot_ocen = row
	mle_comentarios.text=this.GetItemString(row,"comentarios")
	sle_instalacion.text=String(this.GetItemNumber(row,"nro_instalacion"))
	sle_servicio.text=this.GetItemString(row,"servicio")

	ls_control=dw_ot_ocen.GetItemString(1,"estado")
	IF ls_control='DF' THEN
		mle_comentarios.enabled=TRUE
		dw_servicios.enabled=TRUE
		cb_peticion.enabled=TRUE
		cb_refresh.enabled=TRUE
		cb_borrar.enabled=TRUE
	ELSE
		mle_comentarios.enabled=FALSE
		dw_servicios.enabled=FALSE
		cb_peticion.enabled=FALSE
		cb_refresh.enabled=TRUE
	END IF
	dw_servicios.SetItem(1,"DESCRIPCION",sle_servicio.text)

else
	il_row_ot_ocen=0
	mle_comentarios.text=""
	sle_instalacion.text=""
	sle_servicio.text=""
	dw_servicios.SetItem(1,"DESCRIPCION","0")
	mle_comentarios.enabled=TRUE
	dw_servicios.enabled=TRUE
	cb_peticion.enabled=TRUE
	cb_refresh.enabled=TRUE
	cb_borrar.enabled=FALSE
end if 

sle_instalacion.Enabled=FALSE


end event

type gb_2 from groupbox within u_2301_tabpage_ocen
integer x = 110
integer y = 352
integer width = 2011
integer height = 1024
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descripcion breve de la solicitud (M$$HEX1$$e100$$ENDHEX$$x. 100 caracteres)"
end type

type gb_1 from groupbox within u_2301_tabpage_ocen
integer x = 73
integer y = 32
integer width = 3328
integer height = 1376
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Listado de solicitudes asociadas a la indicencia"
end type


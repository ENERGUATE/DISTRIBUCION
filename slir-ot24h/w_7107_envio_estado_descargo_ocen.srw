HA$PBExportHeader$w_7107_envio_estado_descargo_ocen.srw
forward
global type w_7107_envio_estado_descargo_ocen from w_sgigenerica
end type
type dw_status from datawindow within w_7107_envio_estado_descargo_ocen
end type
type cb_1 from commandbutton within w_7107_envio_estado_descargo_ocen
end type
type cb_procesar from commandbutton within w_7107_envio_estado_descargo_ocen
end type
type dw_listado from datawindow within w_7107_envio_estado_descargo_ocen
end type
end forward

global type w_7107_envio_estado_descargo_ocen from w_sgigenerica
integer width = 2299
integer height = 1700
string title = "Envio de Estados a OCEN"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_status dw_status
cb_1 cb_1
cb_procesar cb_procesar
dw_listado dw_listado
end type
global w_7107_envio_estado_descargo_ocen w_7107_envio_estado_descargo_ocen

type variables
Long il_row_status
Long il_nro_descargo


end variables

forward prototypes
public subroutine wf_inserta_texto (string as_text, string as_type)
public function string wf_recupera_parametro (integer pwi_parametro)
private function integer wf_procesa_estado (integer pi_estado)
public function integer wf_inserta_transaccion (long pwl_transaccion, string pws_input, string pws_output)
public function string wf_get_datos_ida (integer pi_parametro)
public function integer wf_formatea_entrada (string as_entrada, ref integer ai_rtn, ref string as_vuelta)
public function string wf_formatea_salida (string as_salida)
end prototypes

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

private function integer wf_procesa_estado (integer pi_estado);/////////////////////////////////////////////////////////////////////////////////////////
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
long ll_ot_pems
long ll_nro
long ll_ret
long ll_length
long ll_max
long ll_possalto
Blob lblb_args
inet linet_main
n_cst_internet luo_data
integer li_respuesta
integer li_error
String ls_error
String ls_port
long ll_port

//Recuperamos la URL
ls_url=wf_recupera_parametro(1)
IF ls_url='ERROR' THEN RETURN 2
wf_inserta_texto("Ok. Url "+ls_url,"ANY")

//Recuperamos el usuario
ls_user=wf_recupera_parametro(2)
IF ls_user='ERROR' THEN RETURN 2
wf_inserta_texto("Ok. User "+ls_user,"ANY")

//Recuperamos la password
ls_password=wf_recupera_parametro(3)
IF ls_password='ERROR' THEN RETURN 2
wf_inserta_texto("Ok. Password **********","ANY")

//Recuperamos el nombre de la funcion
ls_function=wf_recupera_parametro(7)
IF ls_function='ERROR' THEN RETURN 2
wf_inserta_texto("Ok. Function " +ls_function,"ANY")

//SRE PUERTO
ls_port=wf_recupera_parametro(8)
IF ls_url='ERROR' THEN RETURN -1
wf_inserta_texto("Ok. PUERTO "+ls_port,"ANY")
ll_port=Long(ls_port)

// Recuperamos los parametros ida.

// NRO_OT 								N[10] SI
// PARAMETRO 							A[01] SI
//              A= aprobacion
//              r= rechazo
//              n= anulacion
//              m= modificacion
//              f= finalizacion
//              x= no activado
//              v= activado
//              z= aplazado 
// CODIGO DESCARGO					A[30] SI
// CODIGO USUARIO						A[16] SI
// TIPO DESCARGO                 N[03] NO
// CODIGO INSTALACION ORIGEN     A[25] NO
// FECHA INICIAL PREVISTA        A[19] NO
// FECHA INICIAL PREVISTA        A[19] NO
// AGENTE                        A[50] NO
// TIEMPO REPOSICION             A[11] NO
// MOTIVO SOLICITUD              A[160] NO
// FECHA INICIAL INTERVENCION    A[19] NO
// FECHA FINAL INTERVENCION      A[19] NO
// PUNTOS INTERVENCION           A[200] NO
// COMENTARIOS                   A[200] SI en caso de ser modificado

ls_datos_ida = wf_get_datos_ida(pi_estado)

IF ls_datos_ida='ERROR' THEN RETURN 2
wf_inserta_texto("Ok. Datos ida ##" +ls_datos_ida+"##","ANY")
wf_inserta_texto("Ok. Tama$$HEX1$$f100$$ENDHEX$$o trama "+ String(Len(ls_Datos_ida)),"ANY")

//Iniciamos las transacciones... 
SELECT NVL(MAX("GI_OCEN_INTERFASE"."NRO_TRANSACTION"),0)
INTO :ll_max
FROM "GI_OCEN_INTERFASE";

IF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error IN GI_OCEN_INTERFASE. Error: " +SQLCA.SQLErrText,"ERROR")
	Return 2
END IF

wf_inserta_texto("Ok. Maximo transaction "+string(ll_max),"ANY")

/* Example:
http://10.110.3.148:8080/SGIServlet/SGI?user=Santiago&password=Nada&CodInterface=CCCMAN00011S
*/

linet_main = CREATE inet

luo_data = CREATE n_cst_internet

/*
ls_args = '<?xml version="1.0" encoding="ISO-8859-1" ?> ~n~n' + &
			 '<HttpInterfaceListener> ~n~n' + &
			 ' <CodInterface>'+ls_function+'</CodInterface> ~n~n' + &	
          '  <UserName>'+ls_user+'</UserName> ~n~n'+ &
			 '  <Password>'+ls_password+'</Password> ~n~n' + &
			 '  <XmlOut>0</XmlOut> '+ &
			 '  <ParamList> '+&
          '	 <Param>'+&
          '	  <Value>'+ls_datos_ida+'</Value> '+&
          '   </Param>'+&
          ' </ParamList>'+&
          '</HttpInterfaceListener>'
	*/
	
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

lblb_args = blob(ls_args)

// HEADERS
ll_length = Len(lblb_args)
ls_headers = "Content-Type: " + &
       "text/html~n" + &
       "Content-Length: " + String( ll_length ) + "~n~n"

wf_inserta_texto("Ok. Comunicando estado a OCEN","")
wf_inserta_texto("Ok. Por favor sea paciente.","")
wf_inserta_texto("Ok. Esta operacion puede durar unos minutos...","")

ll_ret = linet_main.PostURL(ls_url,lblb_args,ls_headers,ll_port,luo_data)


wf_formatea_entrada(luo_data.is_data,li_error,ls_error)

//PARCHE PRUEBAS LOCAL SRE
/*---------------------------------------------------------------*/

IF ls_url="http://localhost/SGIServlet/SGI?" THEN
	wf_inserta_texto("AVISO. Servidor local. Datos Simulados.","")
	li_error=0 //Ninguno.
	ll_ret=1 //servidor levantado.
	ls_error="" //Respuesta. 
END IF
/*---------------------------------------------------------------*/
IF ll_ret=1 and li_error=0 THEN
	ls_error="Enviado correctamente"
END IF


ll_max= ll_max+1

//wf_inserta_transaccion(ll_max,ls_args,mid(luo_data.is_data,1,1024))
wf_inserta_transaccion(ll_max,ls_datos_ida,ls_error)

IF ll_ret = 1 THEN
   //La transacci$$HEX1$$f300$$ENDHEX$$n ha sido correcta tenemos que ver los dos primeros caracteres de la transacci$$HEX1$$f300$$ENDHEX$$n
	IF li_error=0 THEN
		// TODO CORRECTO
		wf_inserta_texto("Ok. Estado enviado correctamente ","ANY")
	ELSE
		// ERROR EN OCEN

		wf_inserta_texto("Error OCEN: "+ls_error,"ERROR")
		DESTROY luo_data
		DESTROY linet_main
		RETURN 2
	END IF
ELSE
	wf_inserta_texto("Error : " + string(ll_ret) + ". Tal vez el servidor no est$$HEX2$$e1002000$$ENDHEX$$operativo","ERROR")
	DESTROY luo_data
	DESTROY linet_main
	Return 2
END IF

DESTROY luo_data
DESTROY linet_main

Return 1
end function

public function integer wf_inserta_transaccion (long pwl_transaccion, string pws_input, string pws_output);pws_input=mid(pws_input,1,1024)
pws_output=mid(pws_output,1,1024)

INSERT INTO "GI_OCEN_INTERFASE" 
				( "NRO_TRANSACTION" , 
				  "DATE_INSERT" , 
				  "INPUT", 
				  "OUTPUT" ,
				  "INTERFACE_NAME")
		VALUES ( :pwl_transaccion,
					SYSDATE,
					:pws_input,
					:pws_output,
					'CCCMAN014S');

IF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error insertando en GI_OCEN_INTERFASE . Error "+ &
						   SQLCA.SQLErrText,"ERROR")
END IF

return 1
end function

public function string wf_get_datos_ida (integer pi_parametro);String ls_rs, ls_motivo, ls_parametro

// NRO_OT 								N[10] SI
// PARAMETRO 							A[01] SI
//              A= aprobacion
//              r= rechazo
//              n= anulacion
//              m= modificacion
//              f= finalizacion
//              x= no activado
//              v= activado
//              z= aplazado 
// CODIGO DESCARGO					A[30] SI
// CODIGO USUARIO						A[16] SI
// TIPO DESCARGO                 N[03] NO
// CODIGO INSTALACION ORIGEN     A[25] NO
// FECHA INICIAL PREVISTA        A[19] NO
// FECHA INICIAL PREVISTA        A[19] NO
// AGENTE                        A[50] NO
// TIEMPO REPOSICION             A[11] NO
// ACTUALZIACION GRAGFICA			N[1] SI 
// MOTIVO SOLICITUD              A[160] NO
// FECHA INICIAL INTERVENCION    A[19] NO
// FECHA FINAL INTERVENCION      A[19] NO
// PUNTOS INTERVENCION           A[200] NO
// COMENTARIOS                   A[200] SI en caso de ser modificado

choose case pi_parametro
	case 13
		ls_parametro="N" //Anulado
   case 8
		ls_parametro="F" //Finalizado
	case 6
		ls_parametro="V" //Activado
   case 16
		ls_parametro="Z" //Aplazado
	case 7
		ls_parametro="X" //No Activado
   case 3
		ls_parametro="A" //Aprobado
	case 5
		ls_parametro="M" //Modificado
   case 4
		ls_parametro="R" //Rechazado
	case else
		wf_inserta_texto("Parametro no admitido","ERROR")
		Return 'ERROR'
end choose

SELECT LPAD(NVL("SGD_DESCARGOS"."NRO_OT_OCEN",0),10,0)||
		 :ls_parametro ||
		 LPAD( NVL("SGD_DESCARGOS"."NRO_DESCARGO",0) ,30,' ') ||
		 LPAD( NVL("SGD_DESCARGOS"."USUARIO",' ') ,16,' ')||
		 LPAD( NVL("SGD_DESCARGOS"."TIPO_DESCARGO",0) ,3,0)||
		 LPAD( NVL("SGD_DESCARGOS"."COD_INST_ORIGEN",0) ,25,' ')||
		 LPAD(NVL(TO_CHAR( "SGD_ESTADOS_DESCARGO"."F_INICIO" , 'DD/MM/YYYY HH24:MI:SS'),' '),19,' ') ||
       LPAD(NVL(TO_CHAR( "SGD_ESTADOS_DESCARGO"."F_FIN" , 'DD/MM/YYYY HH24:MI:SS'),' '),19,' ') ||
		 LPAD( NVL("SGD_DESCARGOS"."AGENTE",' ') ,50,' ') ||
		 LPAD( NVL("SGD_DESCARGOS"."TIEMPO_REPOS",' ') ,11,' ') ||
		 NVL("SGD_DESCARGOS"."IND_ACT_GRAFICA",0) ||
		 LPAD("SGD_DESCARGOS"."OBS_SOLICITADO",160,' ')||
 		 TO_CHAR("SGD_DESCARGOS"."F_INI_SOLICITADO", 'DD/MM/YYYY HH24:MI:SS')||
		 TO_CHAR("SGD_DESCARGOS"."F_FIN_SOLICITADO", 'DD/MM/YYYY HH24:MI:SS')||
		 RPAD("SGD_DESCARGOS"."INST_DESCARGAR",200,' ')||
		 RPAD("SGD_DESCARGOS"."OBS_APROBADO",200,' ')
INTO :ls_rs 
FROM  "SGD_DESCARGOS", "SGD_ESTADOS_DESCARGO"

WHERE  "SGD_DESCARGOS"."NRO_DESCARGO"="SGD_ESTADOS_DESCARGO"."NRO_DESCARGO" AND 
       NVL("SGD_ESTADOS_DESCARGO"."ENVIADO_OCEN",0) <> 1 AND 
       "SGD_ESTADOS_DESCARGO"."ESTADO" IN (3,4,5,6,7,8,13,16) AND 
       "SGD_ESTADOS_DESCARGO"."NRO_DESCARGO" = :il_nro_descargo;

IF (SQLCA.SQLCode = 100) THEN
	wf_inserta_texto ("No se han encontrado estados para este descargo","ANY")
   Return 'ERROR'
ELSEIF (SQLCA.SQLCode <> 0) THEN 
	wf_inserta_texto("Error Recuperando datos. Error: " +SQLCA.SQLErrText,"ERROR")
	Return 'ERROR'
END IF
//Le quitamos todos los caracteres raros.
ls_rs=wf_formatea_salida(ls_rs)

return ls_rs

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

//SRE FIX error The Web site cannot be found
ll_posicion_ini= Pos(ls_entrada,"The Web site cannot be found",1)

if ll_posicion_ini = 0 THEN 

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

	//SRE FIX2 Error Apuntando a otro servidor...
	IF ll_posicion_fin < 0 THEN
		ai_rtn=1
   	as_vuelta="Posiblemente est$$HEX2$$e9002000$$ENDHEX$$apuntando a otro servidor que responde " + Mid(ls_entrada,1,500)
	END IF

ELSE
	ai_rtn=1
   as_vuelta="La URL no es correcta. Revise su configuraci$$HEX1$$f300$$ENDHEX$$n"
END IF

	

return 1
end function

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

on w_7107_envio_estado_descargo_ocen.create
int iCurrent
call super::create
this.dw_status=create dw_status
this.cb_1=create cb_1
this.cb_procesar=create cb_procesar
this.dw_listado=create dw_listado
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_status
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_procesar
this.Control[iCurrent+4]=this.dw_listado
end on

on w_7107_envio_estado_descargo_ocen.destroy
call super::destroy
destroy(this.dw_status)
destroy(this.cb_1)
destroy(this.cb_procesar)
destroy(this.dw_listado)
end on

event open;call super::open;Long ll_descargo_ocen
Long ll_Cantidad

//SRE
IF fg_valor_parametro("OCEN")=1 THEN
	//Solo se hace algo si est$$HEX2$$e1002000$$ENDHEX$$el parametro.
ELSE
	close(this)
	return
END IF

//28/10/2008  YAF
IF fg_valor_parametro("OPERACION_OCEN")=1 THEN
	//Solo se hace algo si est$$HEX2$$e1002000$$ENDHEX$$el parametro.
ELSE
	close(this)
	return
END IF

dw_listado.SetTransObject(SQLCA)
dw_status.SetTransObject(SQLCA)

//Recibimos el parametro.

il_nro_descargo=Message.DoubleParm	

SELECT COUNT(*)
INTO :ll_descargo_ocen 
FROM "SGD_DESCARGOS"
WHERE "SGD_DESCARGOS"."NRO_DESCARGO"= :il_nro_descargo AND
		"SGD_DESCARGOS"."NRO_OT_OCEN" IS NOT NULL;


IF (sqlca.sqlcode <> 0) THEN
   MessageBox("Error","Error recuperando informacion Error: "+string(SQLCA.SQLDBCode)+"  "+ SQLCA.SQLErrtext, StopSign!)
   close(this)
	return
END IF

IF ll_descargo_ocen = 0 THEN 
	close(this)
	return
END IF

ll_cantidad=dw_listado.Retrieve(il_nro_Descargo)

wf_inserta_texto("Para el descargo " + String(il_nro_descargo) + " hay "+String(ll_cantidad)+" estados encontrados","ANY")


IF ll_cantidad > 0 THEN
	wf_inserta_texto("Pulse PROCESAR para enviar a OCEN.","ANY")
ELSE
	wf_inserta_texto("Pulse CERRAR.","ANY")
	cb_procesar.Enabled=FALSE
END IF


//28/10/2008  YAF
this.cb_procesar.enabled = false
this.cb_procesar.triggerevent("clicked")
end event

event closequery;call super::closequery;IF dw_listado.Rowcount() > 0 THEN

	IF MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Quedan descargos sin enviar ~n"+ &
									"$$HEX1$$bf00$$ENDHEX$$Desea continuar?", &
      	  Question!, YesNo!) = 2 THEN
        	RETURN 1
	ELSE
        	RETURN 0
	END IF
END IF
end event

event close;call super::close;close (this)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_7107_envio_estado_descargo_ocen
integer x = 73
integer y = 32
end type

type dw_status from datawindow within w_7107_envio_estado_descargo_ocen
integer x = 37
integer y = 512
integer width = 2194
integer height = 928
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_ot_message"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_7107_envio_estado_descargo_ocen
integer x = 1536
integer y = 1504
integer width = 343
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Cerrar"
end type

event clicked;Close(parent)
end event

type cb_procesar from commandbutton within w_7107_envio_estado_descargo_ocen
integer x = 366
integer y = 1504
integer width = 343
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Procesar"
end type

event clicked;Long ll_fila
Long ll_rtn
Long ll_estado
 
ll_fila=dw_listado.Rowcount()


DO WHILE ll_fila<> 0 

	ll_estado=dw_listado.GetItemNumber(ll_fila,"sgd_estados_descargo_estado")
	ll_rtn=wf_procesa_estado(ll_estado)

	dw_listado.SetITem(ll_fila,"sgd_estados_descargo_enviado_ocen",ll_rtn)
	dw_listado.update()
	gnu_u_transaction.uf_commit()
	ll_fila = ll_fila - 1 
LOOP

IF dw_listado.Retrieve(il_nro_descargo)> 0 THEN
	wf_inserta_texto("Hubo alg$$HEX1$$fa00$$ENDHEX$$n error, por favor revise el log y env$$HEX1$$ed00$$ENDHEX$$e nuevamente si procede","ERROR")
ELSE
	wf_inserta_texto("Todos los estados fueron enviados correctamente","ANY")
	cb_procesar.Enabled=FALSE
END IF


//28/10/2008  YAF
cb_procesar.enabled=TRUE
cb_1.enabled=true


end event

type dw_listado from datawindow within w_7107_envio_estado_descargo_ocen
integer x = 37
integer y = 32
integer width = 2194
integer height = 448
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "d_descargo_ocen"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


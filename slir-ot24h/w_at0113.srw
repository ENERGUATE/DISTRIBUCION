HA$PBExportHeader$w_at0113.srw
$PBExportComments$Identificaci$$HEX1$$f300$$ENDHEX$$n del cliente.
forward
global type w_at0113 from w_sgigenerica
end type
type cbx_telef from checkbox within w_at0113
end type
type cb_1 from u_cb within w_at0113
end type
type cb_3 from u_cb within w_at0113
end type
type cb_2 from u_cb within w_at0113
end type
type cbx_1 from checkbox within w_at0113
end type
type sle_telef from singlelineedit within w_at0113
end type
type st_telef from statictext within w_at0113
end type
type dw_1 from u_gen_at0113_1 within w_at0113
end type
type sle_1 from singlelineedit within w_at0113
end type
type sle_2 from singlelineedit within w_at0113
end type
type sle_3 from singlelineedit within w_at0113
end type
type st_primer_ap from statictext within w_at0113
end type
type st_1 from statictext within w_at0113
end type
type st_segundo_ape from statictext within w_at0113
end type
type st_2 from statictext within w_at0113
end type
type st_3 from statictext within w_at0113
end type
type st_inicial from statictext within w_at0113
end type
end forward

global type w_at0113 from w_sgigenerica
integer x = 663
integer y = 564
integer width = 2336
integer height = 1280
string title = "OPEN SGI - Identificaci$$HEX1$$f300$$ENDHEX$$n del Cliente"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cbx_telef cbx_telef
cb_1 cb_1
cb_3 cb_3
cb_2 cb_2
cbx_1 cbx_1
sle_telef sle_telef
st_telef st_telef
dw_1 dw_1
sle_1 sle_1
sle_2 sle_2
sle_3 sle_3
st_primer_ap st_primer_ap
st_1 st_1
st_segundo_ape st_segundo_ape
st_2 st_2
st_3 st_3
st_inicial st_inicial
end type
global w_at0113 w_at0113

type variables
Int FilaSelecc,  Fila1
string CodDepto[]
int cant_cli

s_cliente str_cliente

u_generico_comunicaciones		iu_gen_comunic  

boolean ib_segunda_entrada

// Indica que el click para el retrieve se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open 
// y como no trajo datos hay que cerrar la ventana.

boolean ib_viene_del_open, ib_por_telef

// Variables para medir tiempos ANG
long il_start
// Fin Variables para medir tiempos ANG

boolean ib_cierre_con_boton = FALSE
end variables

forward prototypes
public function integer frn_validar_telefono (string ps_nro_telefono)
public function integer f_habilitar_campos (boolean pb_habilito)
end prototypes

public function integer frn_validar_telefono (string ps_nro_telefono);IF NOT IsNumber(ps_nro_telefono) OR IsNull(ps_nro_telefono) THEN
	gnv_msg.f_mensaje("EM65","","",OK!)
	Return -1
END IF

Return 1

end function

public function integer f_habilitar_campos (boolean pb_habilito);IF NOT pb_habilito THEN
	sle_1.Text = ""
	sle_2.Text = ""
	sle_1.Enabled = False
	sle_2.Enabled = False
//	this.dwmodify("nombre.background.color=" + string(rgb(192,192,192)))
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	sle_1.BackColor = Long(string(65536*192+256*192+192))
//	sle_2.BackColor = Long(string(65536*192+256*192+192))
	sle_1.BackColor = Long(gs_gris)
	sle_2.BackColor = Long(gs_gris)
// Fin. Sgo.
ELSE
	sle_1.Enabled = True
	sle_2.Enabled = True
	sle_1.BackColor = Long(string(65536*255+256*255+255))
	sle_2.BackColor = Long(string(65536*255+256*255+255))

END IF

Return 1
end function

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Identificaci$$HEX1$$f300$$ENDHEX$$n de clientes
//
// Objetivo: 
//	Vienen como par$$HEX1$$e100$$ENDHEX$$metros  tres campos donde pueden venir el nombre y apellidos.
// En $$HEX1$$e900$$ENDHEX$$stos se devolver$$HEX1$$e100$$ENDHEX$$n los datos del cliente seleccionado.
//		
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//  Fecha		Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
// 	25/7/95	SAS		Adaptaci$$HEX1$$f300$$ENDHEX$$n con estructura instance y par$$HEX1$$e100$$ENDHEX$$metros de e/s
//		25/9/96	AFS		Modificaci$$HEX1$$f300$$ENDHEX$$n para permitir b$$HEX1$$fa00$$ENDHEX$$squeda por telefono,
//								cambio para ENEL
//
////////////////////////////////////////////////////////////////////////////////////////////////

String	Ape1, Ape2, Nombre
char Nom
SetPointer(Hourglass!)

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_at0113","Ident.Cliente")

ib_por_telef = FALSE

IF IsValid(message.PowerObjectParm) THEN
	//Llam$$HEX2$$f3002000$$ENDHEX$$con par$$HEX1$$e100$$ENDHEX$$metros
	str_cliente = message.PowerObjectParm
ELSE
	//Llamado desde la versi$$HEX1$$f300$$ENDHEX$$n I 
	str_cliente.gl_cod_cli = 0
	str_cliente.gs_ape1_cli = parmstr1
	str_cliente.gs_ape2_cli = parmstr2 
	str_cliente.gs_nom_cli = parmstr3 
	sle_1.text = parmstr1
	sle_2.text = parmstr2
	sle_3.text = Left(str_cliente.gs_nom_cli,1)
END IF


//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  OSGI 2001.2  	24/09/2002				//***************************************
//**  OSGI 2001.2  	24/09/2002				//**  OSGI 2001.1  	05/04/2001			**
//**  OSGI 2001.2  	24/09/2002				//**  Jair Padilla / Soluziona PANAMA  **
//**  OSGI 2001.2  	24/09/2002				//***************************************
//**  OSGI 2001.2  	24/09/2002				fg_ventana_parametro(This.ClassName(), dw_1)
//**  OSGI 2001.2  	24/09/2002				fg_alto_texto(dw_1, dw_1.ClassName(), 0)
//**  OSGI 2001.2  	24/09/2002				//***************************************
//**  OSGI 2001.2  	24/09/2002				//**  OSGI 2001.1  	05/04/2001			**
//**  OSGI 2001.2  	24/09/2002				//**  Jair Padilla / Soluziona PANAMA  **
//**  OSGI 2001.2  	24/09/2002				//***************************************		
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************


IF sle_1.text <> "" AND sle_1.text <> " " AND NOT IsNull(sle_1.text) THEN

	// Hago retrieve indicandole que se lanza desde el open.

	ib_viene_del_open = TRUE
//	yield()
	cb_1.PostEvent(clicked!)
	

END IF

		
//ib_segunda_entrada = False
end event

on w_at0113.create
int iCurrent
call super::create
this.cbx_telef=create cbx_telef
this.cb_1=create cb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cbx_1=create cbx_1
this.sle_telef=create sle_telef
this.st_telef=create st_telef
this.dw_1=create dw_1
this.sle_1=create sle_1
this.sle_2=create sle_2
this.sle_3=create sle_3
this.st_primer_ap=create st_primer_ap
this.st_1=create st_1
this.st_segundo_ape=create st_segundo_ape
this.st_2=create st_2
this.st_3=create st_3
this.st_inicial=create st_inicial
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_telef
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.cb_3
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.sle_telef
this.Control[iCurrent+7]=this.st_telef
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.sle_1
this.Control[iCurrent+10]=this.sle_2
this.Control[iCurrent+11]=this.sle_3
this.Control[iCurrent+12]=this.st_primer_ap
this.Control[iCurrent+13]=this.st_1
this.Control[iCurrent+14]=this.st_segundo_ape
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.st_inicial
end on

on w_at0113.destroy
call super::destroy
destroy(this.cbx_telef)
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cbx_1)
destroy(this.sle_telef)
destroy(this.st_telef)
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.sle_2)
destroy(this.sle_3)
destroy(this.st_primer_ap)
destroy(this.st_1)
destroy(this.st_segundo_ape)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_inicial)
end on

event close;IF NOT ib_cierre_con_boton THEN
	//Clicked Script para Bot$$HEX1$$f300$$ENDHEX$$n Anular
	s_cliente str_cliente_vacio
	s_direccion_cliente ls_direccion_vacia
	
	parmstr1 = ""
	parmstr2 = ""
	parmstr3 = ""
	parnum2  = 1
	
	parnum1 = 0  //No se seleccion$$HEX2$$f3002000$$ENDHEX$$un cliente
	
	CloseWithReturn(THIS,ls_direccion_vacia)
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_at0113
end type

type cbx_telef from checkbox within w_at0113
integer x = 1390
integer y = 44
integer width = 498
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = "Telefono No."
end type

event clicked;IF This.Checked THEN
	sle_3.Visible = False
	st_3.Visible = False
	cbx_1.Visible = False

	st_telef.Visible = True
	sle_telef.Visible = True
	sle_telef.text = ""
		
	Parent.f_habilitar_campos(False)

	ib_por_telef = TRUE
	sle_telef.SetFocus()
	
	dw_1.ScrollToRow(dw_1.RowCount()+1)
	dw_1.Reset()

ELSE
	sle_3.Visible = TRUE
	st_3.Visible = TRUE
	cbx_1.Visible = TRUE

	st_telef.Visible = FALSE
	sle_telef.Visible = FALSE
	
	Parent.f_habilitar_campos(True)
	
	dw_1.ScrollToRow(dw_1.RowCount()+1)
	dw_1.reset()

	ib_por_telef = FALSE
	
END IF
end event

type cb_1 from u_cb within w_at0113
integer x = 1902
integer y = 236
integer width = 352
integer height = 92
integer taborder = 90
integer textsize = -8
string facename = "MS Sans Serif"
string text = "C&onsultar"
boolean default = true
end type

event clicked;//Modificaci$$HEX1$$f300$$ENDHEX$$n:
// El control de calle no codificada se pas$$HEX2$$f3002000$$ENDHEX$$al evento RetrieveRow, ya
// la dw_1 tiene la opci$$HEX1$$f300$$ENDHEX$$n Retrieve Only As Needed y no es posible 
// verificar todas las filas en este evento
//Autor: S.A.
//Fecha: 4/5/95
//Lugar: San Luis

string Ape1 , Ape2, Inic, ls_select, ls_select_2, ls_where, ls_modstring, rc
string Prov, Tipo
// MERC string Dir
int Filas, Fila, Nulo, li_resp_mens
long CodCalle, CodCli, ll_telefono

SetPointer(HourGlass!)
parent.SetRedraw(false)

Ape1    = sle_1.text
Ape2	  = sle_2.text
Inic 	  = sle_3.text 
ll_telefono = Long(sle_telef.Text)

SetNull(Nulo)

Tipo = "1"

dw_1.SetTransObject(SQLCA)

IF ib_por_telef THEN
	IF Parent.frn_validar_telefono(sle_telef.Text) = -1 THEN
		SetPointer(Arrow!)
		parent.SetRedraw(true)
		Return
	END IF

	SetPointer(HourGlass!)
	
	
	dw_1.DataObject = 'd_at0113_a' + Tipo	


	//******************************************
	//**  OSGI 2001.2  	25/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ls_select = "SELECT CLIENTES.NOM_CLI, CLIENTES.APE1_CLI,CLIENTES.APE2_CLI,CLIENTES.COD_CALLE," + &   
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV           		"CLIENTES.NUM_PUERTA,CLIENTES.DUPLICADOR,CLIENTES.CGV_CLI, CLIENTES.COD_CLI," + &   
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV           		"'',CALLEJERO.NOM_CALLE,fgnu_calle_referencia(callejero.nom_calle, fincas.num_puerta, fincas.duplicador, 0, callejero.cod_calle, 0, '', 0, '') cdireccion, " +&    
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  					" FINCAS.REF_DIR, NVL(FINCAS.PAN_NOMBRE_FINCA,'') FINCAS, SGD_CENTRO.NOM_CENTRO "	+ &
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  					",SUMCON.NIS_RAD AS C_NIS_RAD, 0 AS C_NIC, '     ' AS C_TIP_SERV" + &
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV      				" FROM CALLEJERO, CLIENTES,FINCAS,GI_CENTRO_LOC,SGD_CENTRO, SUMCON " + &
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  					" WHERE (CLIENTES.COD_CLI = SUMCON.COD_CLI) AND (SUMCON.NIF = FINCAS.NIF) AND " +&					
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  					" ( CALLEJERO.COD_CALLE = FINCAS.COD_CALLE ) and CLIENTES.TFNO_CLI = '" + String(ll_telefono) + "'" + &
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  					" AND (CALLEJERO.COD_LOCAL = GI_CENTRO_LOC.COD_LOC ) AND  " + &
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV        			" (GI_CENTRO_LOC.NRO_CENTRO=SGD_CENTRO.NRO_CENTRO AND SGD_CENTRO.TIP_CENTRO=1) "
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  SE AGREGO LA COLUMNA (CLIENTES.APE1_CLI||'  '||CLIENTES.APE2_CLI APE1_CLI),
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  YA QUE EN EL DATAWINDOW SE USA ESTA COLUMNA Y NO LAS COLUMNAS INDIVIDUALES DE
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  APELLIDOS (CLIENTES.APE1_CLI,CLIENTES.APE2_CLI).  SE CAMBIO LAS COLUMNAS
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  INDIVIDUALES DE APELLIDOS POR LOS APELLIDOS CONCATENADOS.
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  TAMBIEN SE AGREGO LAS COLUMNAS:
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  ( ,SUMCON.NIS_RAD AS C_NIS_RAD, 0 AS C_NIC, '     ' AS C_TIP_SERV )


	String ls_tfno_cli

	ls_select = "SELECT CLIENTES.NOM_CLI,  CLIENTES.APE1_CLI||'  '||CLIENTES.APE2_CLI APE1_CLI, CLIENTES.COD_CALLE," /* OSGI 2001.2  	25/09/2002 */ + &   
         		"CLIENTES.NUM_PUERTA,CLIENTES.DUPLICADOR,CLIENTES.CGV_CLI, CLIENTES.COD_CLI," + &   
         		"'',CALLEJERO.NOM_CALLE,fgnu_calle_referencia(callejero.nom_calle, fincas.num_puerta, fincas.duplicador, 0, callejero.cod_calle, 0, '', 0, '') cdireccion, " +&    
					" FINCAS.REF_DIR, SGD_CENTRO.NOM_CENTRO "	+ &
					",SUMCON.NIS_RAD AS C_NIS_RAD, 0 AS C_NIC, '     ' AS C_TIP_SERV" /* OSGI 2001.2  	25/09/2002 */ + &
    				" FROM CALLEJERO, CLIENTES,FINCAS,GI_CENTRO_LOC,SGD_CENTRO, SUMCON " + &
					" WHERE (CLIENTES.COD_CLI = SUMCON.COD_CLI) AND (SUMCON.NIF = FINCAS.NIF) AND " +&					
					" ( CALLEJERO.COD_CALLE = FINCAS.COD_CALLE ) " + &
					" AND (CALLEJERO.COD_LOCAL = GI_CENTRO_LOC.COD_LOC ) AND " + &
      			" (GI_CENTRO_LOC.NRO_CENTRO=SGD_CENTRO.NRO_CENTRO AND SGD_CENTRO.TIP_CENTRO=1) "

	ls_tfno_cli = fg_tfno_cli_type(0, String(ll_telefono))

	If IsNull(ls_tfno_cli) Then
		ls_tfno_cli = " AND ROWNUM = 0 "
	End If

	ls_select += ls_tfno_cli
	//******************************************
	//**  OSGI 2001.2  	25/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	ls_modstring = "DataWindow.Table.Select=~"" + ls_select + "~""


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************	
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************

	
	rc = dw_1.Modify(ls_modstring)

	dw_1.SetTransObject(SQLCA)


	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)


   parent.SetRedraw(true)
	
	IF not IsValid(w_at0113) THEN return
	
	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		SetPointer(Arrow!)
		Close(w_at0113)
	ELSEIF Filas = 0 THEN
		gnv_msg.f_mensaje("ER65","","",OK!)
		SetPointer(Arrow!)
		sle_1.Setfocus()
		parent.SetRedraw(true)
		Return
	END IF

ELSE

	If Not (Ape1  > "") or isNull(ape1) THEN
		gnv_msg.f_mensaje("ER35","","",OK!)
		SetPointer(Arrow!)
		parent.SetRedraw(true)
		sle_1.Setfocus()
		RETURN
	END IF

	//dw_1.SetRedraw(False)
//access using d_at0113_13 instead of d_at0113_12 which is non-existent 
// or d_at0113_123 which is malfunctioning - Antony
//	IF (Ape2 > "") THEN
//		Tipo = Tipo + "2"
//	END IF
	IF (Ape2 > "") or (Inic > "")THEN
		Tipo = Tipo + "3"
	END IF

//	IF (Inic > "") THEN
//		Tipo = Tipo + "3"
//	END IF
//
	Inic = Inic + "%"  // por el like

	IF cbx_1.Checked = False THEN
		dw_1.DataObject = 'd_at0113_' + Tipo
	ELSE						//Sin$$HEX1$$f300$$ENDHEX$$nimos
		cbx_1.Checked = True
		dw_1.DataObject = 'd_at0113_a' + Tipo
	END IF


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002				//	fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************		
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	cant_cli = 0 										//Contador de filas que voy trayendo  S.A.

	dw_1.SetTransObject(sqlca)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)		//Siempre el mismo arg, pero uso solo los necesarios

	IF not IsValid(w_at0113) THEN return

	parent.SetRedraw(true)
	//dw_1.SetRedraw(True)

	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		SetPointer(Arrow!)
		Close(w_at0113)
	ELSEIF Filas = 0 THEN
//		YIELD()
		IF cbx_1.Checked = True THEN
			gnv_msg.f_mensaje("ER37","","",OK!)
			//cb_3.PostEvent(clicked!)
		ELSE
			li_resp_mens = gnv_msg.f_mensaje("CR02","","",YESNO!)
			IF li_resp_mens = 1 THEN
				cbx_1.Checked = True
				ib_segunda_entrada = True
//				YIELD()
				SetPointer(Arrow!)
				This.PostEvent(clicked!)
			ELSE

				// Si se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open prendo bandera para que
	         // cierre la ventana.
				if ib_viene_del_open then
//					YIELD()
					SetPointer(Arrow!)
					cb_3.PostEvent(clicked!)	
	//				RETURN
				end if
			END IF
		END IF
	ELSEIF Filas = 1 THEN
		filaselecc = 1
//		YIELD()
		SetPointer(Arrow!)
		cb_2.PostEvent(clicked!)
	ELSE
		cb_2.Enabled = True
		cb_2.SetFocus()
	END IF

END IF

IF IsValid(w_at0113) THEN
	ib_viene_del_open = FALSE
END IF

SetPointer(Arrow!)

end event

type cb_3 from u_cb within w_at0113
integer x = 1897
integer y = 132
integer width = 352
integer height = 92
integer taborder = 80
integer textsize = -8
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;call super::clicked;//Clicked Script para Bot$$HEX1$$f300$$ENDHEX$$n Anular
s_cliente str_cliente_vacio
s_direccion_cliente ls_direccion_vacia

parmstr1 = ""
parmstr2 = ""
parmstr3 = ""
parnum2  = 1

parnum1 = 0  //No se seleccion$$HEX2$$f3002000$$ENDHEX$$un cliente

ib_cierre_con_boton = TRUE
CloseWithReturn(Parent,ls_direccion_vacia)
end event

type cb_2 from u_cb within w_at0113
integer x = 1897
integer y = 28
integer width = 352
integer height = 92
integer taborder = 60
integer textsize = -8
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Aceptar"
end type

event clicked;call super::clicked;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Objetivo: Se devuelven los datos del cliente seleccionado
//	Se mantienen las dos versiones, con las variables globales y con la
//	estructura local
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//
//  Fecha		Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
// 				SAS		Versi$$HEX1$$f300$$ENDHEX$$n original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long posnull, largo
string ls_ap1, ls_ap2, ls_cadena
SetPointer(HourGlass!)

IF FilaSelecc = 0 THEN
	gnv_msg.f_mensaje("ER34","","",OK!)
	Return
END IF

ls_cadena = dw_1.GetItemString(filaselecc,'ape1_cli')

largo = len(ls_cadena)
posnull = pos(ls_cadena, '  ')

ls_ap1 = mid(ls_cadena, 1, posnull)
ls_ap2 = mid(ls_cadena, (posnull+1))

//Versi$$HEX1$$f300$$ENDHEX$$n nueva
str_cliente.gl_cod_cli 	= dw_1.GetItemNumber(filaselecc,'cod_cli')	//Cod. Cliente
//str_cliente.gs_ape1_cli = dw_1.GetItemString(filaselecc,'ape1_cli')	//Ape 1	
str_cliente.gs_ape1_cli = ls_ap1	//Ape 1	
//str_cliente.gs_ape2_cli = dw_1.GetItemString(filaselecc,3)	//Ape 2
str_cliente.gs_ape2_cli = ls_ap2 //Ape 2
str_cliente.gs_nom_cli	= dw_1.GetItemString(filaselecc,'nom_cli')	//Nombre

//Versi$$HEX1$$f300$$ENDHEX$$n Open I
//parmstr1 = dw_1.GetItemString(filaselecc,'ape1_cli')	//Ape 1	
parmstr1 = ls_ap1	//Ape 1	
Parmstr2 = ls_ap2	//Ape 2
parmstr3 = dw_1.GetItemString(filaselecc,'nom_cli')	//Nombre
parnum2  = dw_1.GetItemNumber(filaselecc,'cod_cli')	//Cod. Cliente

parnum1 = 1   //Termino bien

//CloseWithReturn(Parent, str_cliente)

//Versi$$HEX1$$f300$$ENDHEX$$n SGI
dir.gs_ape1 = 	 parmstr1	//Ape 1	
dir.gs_ape2 = 	 parmstr2	//Ape 2
dir.gs_nom  =   parmstr3	//Nombre


// Abro ventana para identificar el suministro
Open(w_re0500_ss)
W_operaciones.SetFocus()
Parent.SetFocus()

//gu_comunic.fnu_abrir(w_re0500_ss,"w_re0500_ss",1,1,w_at0113,"w_at0113")

// Si no encontr$$HEX2$$f3002000$$ENDHEX$$el suministro
IF parnum1 = 0 THEN
	dir.gl_nis = 0
END IF

ib_cierre_con_boton = TRUE
// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 
CloseWithReturn(Parent, dir)



end event

type cbx_1 from checkbox within w_at0113
integer x = 1106
integer y = 260
integer width = 795
integer height = 68
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = "Buscar Parecidos"
end type

type sle_telef from singlelineedit within w_at0113
boolean visible = false
integer x = 622
integer y = 252
integer width = 448
integer height = 84
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_telef from statictext within w_at0113
boolean visible = false
integer x = 27
integer y = 260
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "N$$HEX2$$ba002000$$ENDHEX$$de Tel$$HEX1$$e900$$ENDHEX$$fono"
boolean focusrectangle = false
end type

type dw_1 from u_gen_at0113_1 within w_at0113
integer x = 32
integer y = 420
integer width = 2222
integer height = 736
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;call super::itemchanged;// Clicked Script para dw_1 

dw_1.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila


FilaSelecc = row


IF FilaSelecc > 0 THEN dw_1.SelectRow(FilaSelecc, TRUE)		
												// Se selecciona la fila nueva

end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	cb_2.TriggerEvent(Clicked!)
END IF
end event

event clicked;call super::clicked;// Clicked Script para dw_1 
if row > 0 then

	dw_1.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
	
	
	FilaSelecc = row
	
	
	IF FilaSelecc > 0 THEN dw_1.SelectRow(FilaSelecc, TRUE)		
													// Se selecciona la fila nueva
													
end if


end event

event ue_as_need;call super::ue_as_need;SetPointer(HourGlass!)
end event

event sqlpreview;call super::sqlpreview;////******************************************
////**  OSGI 2001.2  	25/09/2002				**
////**  Jair Padilla / Soluziona PANAMA  	**
////**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
////******************************************
//String ls_syntax, ls_tfno_cli
//
//
//
//If fg_valida_nic_tip_serv() = 1 And ib_por_telef Then
//	ls_syntax = Trim(sqlsyntax)
//
//	ls_tfno_cli = fg_tfno_cli_type(0, is_tfno_cli)
//
//	If IsNull(ls_tfno_cli) Then
//		ls_tfno_cli = " AND ROWNUM = 0 "
//	End If
//
//	ls_syntax += Trim(ls_tfno_cli)
//
//	MessageBox("ls_syntax", ls_syntax)
//
//	This.SetSQLPreview(ls_syntax)
//End If
////******************************************
////**  OSGI 2001.2  	25/09/2002				**
////**  Jair Padilla / Soluziona PANAMA  	**
////**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
////******************************************
end event

type sle_1 from singlelineedit within w_at0113
integer x = 622
integer y = 36
integer width = 736
integer height = 84
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_at0113
integer x = 622
integer y = 144
integer width = 736
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_at0113
integer x = 622
integer y = 252
integer width = 146
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

type st_primer_ap from statictext within w_at0113
integer x = 27
integer y = 52
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
string text = "Primer Apellido"
boolean focusrectangle = false
end type

event clicked;//Modificaci$$HEX1$$f300$$ENDHEX$$n:
// El control de calle no codificada se pas$$HEX2$$f3002000$$ENDHEX$$al evento RetrieveRow, ya
// la dw_1 tiene la opci$$HEX1$$f300$$ENDHEX$$n Retrieve Only As Needed y no es posible 
// verificar todas las filas en este evento
//Autor: S.A.
//Fecha: 4/5/95
//Lugar: San Luis

string Ape1 , Ape2, Inic, ls_select, ls_select_2, ls_where, ls_modstring, rc, ls_nulo
string Prov, Tipo
// MERC string Dir
int Filas, Fila, Nulo, li_resp_mens
long CodCalle, CodCli, ll_telefono


SetPointer(HourGlass!)
parent.SetRedraw(false)

Ape1    = sle_1.text
Ape2	  = sle_2.text
Inic 	  = sle_3.text 
ll_telefono = Long(sle_telef.Text)

SetNull(Nulo)
SetNull(ls_nulo)

Tipo = "1"

dw_1.SetTransObject(SQLCA)

IF ib_por_telef THEN
	IF Parent.frn_validar_telefono(sle_telef.Text) = -1 THEN
		parent.SetRedraw(true)
		Return
	END IF

	SetPointer(HourGlass!)
	dw_1.DataObject = 'd_at0113_a' + Tipo	

	ls_select = "SELECT ~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~",~"CLIENTES~".~"COD_CALLE~",~"CLIENTES~".~"NUM_PUERTA~",~"CLIENTES~".~"DUPLICADOR~",~"CLIENTES~".~"CGV_CLI~",~"CLIENTES~".~"COD_CLI~",~~'~~',~"CALLEJERO~".~"NOM_CALLE~",~"CLIENTES~".~"TFNO_CLI~" FROM ~"CALLEJERO~",~"CLIENTES~" WHERE ( ~"CALLEJERO~".~"COD_CALLE~" = ~"CLIENTES~".~"COD_CALLE~" ) and ( ~"CLIENTES~".~"TFNO_CLI~" = " + String(ll_telefono) + " ) "

	ls_modstring = "DataWindow.Table.Select='" + ls_select + "'"


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************	
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	
	rc = dw_1.Modify(ls_modstring)

	dw_1.SetTransObject(SQLCA)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)
	parent.SetRedraw(true)
	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		parent.SetRedraw(TRUE)
		Close(Parent)
	ELSEIF Filas = 0 THEN
		gnv_msg.f_mensaje("ER65","","",OK!)
		sle_1.Setfocus()
		parent.SetRedraw(true)
		Return
	END IF

ELSE

	If Not (Ape1  > "") or isNull(ape1) THEN
		gnv_msg.f_mensaje("ER35","","",OK!)
		sle_1.Setfocus()
		parent.SetRedraw(true)
	else

	//dw_1.SetRedraw(False)
	//access using d_at0113_13 instead of d_at0113_12 which is non-existent 
	// or d_at0113_123 which is malfunctioning - Antony
	//	IF (Ape2 > "") THEN
	//		Tipo = Tipo + "2"
	//	END IF
		IF (Ape2 > "") or (Inic > "")THEN
			Tipo = Tipo + "3"
		END IF
	
	//	IF (Inic > "") THEN
	//		Tipo = Tipo + "3"
	//	END IF
	//
		Inic = Inic + "%"  // por el like
	
		IF cbx_1.Checked = False THEN
			dw_1.DataObject = 'd_at0113_' + Tipo
		ELSE						//Sin$$HEX1$$f300$$ENDHEX$$nimos
			cbx_1.Checked = True
			dw_1.DataObject = 'd_at0113_a' + Tipo
		END IF

	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************		
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	
		cant_cli = 0 										//Contador de filas que voy trayendo  S.A.
	
		dw_1.SetTransObject(sqlca)
	
	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)		//Siempre el mismo arg, pero uso solo los necesarios
	parent.SetRedraw(true)
	
		//dw_1.SetRedraw(True)
	
		IF Filas < 0 THEN
			gnv_msg.f_mensaje("ER36","","",OK!)
			parent.SetRedraw(true)
			Close(Parent)
			
		ELSEIF Filas = 0 THEN
	//		YIELD()
			IF cbx_1.Checked = True THEN
				gnv_msg.f_mensaje("ER37","","",OK!)
				sle_1.text=""
				sle_2.text=""
				sle_3.text=""
				sle_1.setfocus()
			ELSE
				li_resp_mens = gnv_msg.f_mensaje("CR02","","",YESNO!)
				IF li_resp_mens = 1 THEN
					cbx_1.Checked = True
					ib_segunda_entrada = True
	//				YIELD()
					This.PostEvent(clicked!)
				ELSE
	
					// Si se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open prendo bandera para que
					// cierre la ventana.
					if ib_viene_del_open then
	//					YIELD()
						sle_1.text=""
						sle_2.text=""
						sle_3.text=""
						sle_1.setfocus()
		//				RETURN
					end if
				END IF
			END IF
		ELSEIF Filas = 1 THEN
			filaselecc = 1
	//		YIELD()
			cb_2.PostEvent(clicked!)
		ELSE
			cb_2.Enabled = True
			cb_2.SetFocus()
		END IF
	END IF
END IF

ib_viene_del_open = FALSE

end event

type st_1 from statictext within w_at0113
integer x = 27
integer y = 52
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Primer Apellido:"
boolean focusrectangle = false
end type

type st_segundo_ape from statictext within w_at0113
integer x = 27
integer y = 160
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
string text = "Segundo Apellido"
boolean focusrectangle = false
end type

event clicked;//Modificaci$$HEX1$$f300$$ENDHEX$$n:
// El control de calle no codificada se pas$$HEX2$$f3002000$$ENDHEX$$al evento RetrieveRow, ya
// la dw_1 tiene la opci$$HEX1$$f300$$ENDHEX$$n Retrieve Only As Needed y no es posible 
// verificar todas las filas en este evento
//Autor: S.A.
//Fecha: 4/5/95
//Lugar: San Luis

string Ape1 , Ape2, Inic, ls_select, ls_select_2, ls_where, ls_modstring, rc
string Prov, Tipo
// MERC string Dir
int Filas, Fila, Nulo, li_resp_mens
long CodCalle, CodCli, ll_telefono


SetPointer(HourGlass!)
parent.SetRedraw(false)

Ape1    = sle_1.text
Ape2	  = sle_2.text
Inic 	  = sle_3.text 
ll_telefono = Long(sle_telef.Text)

SetNull(Nulo)

Tipo = "1"

dw_1.SetTransObject(SQLCA)

IF ib_por_telef THEN
	IF Parent.frn_validar_telefono(sle_telef.Text) = -1 THEN
		parent.SetRedraw(true)
		Return
	END IF

	SetPointer(HourGlass!)
	
	dw_1.DataObject = 'd_at0113_a' + Tipo	

	ls_select = "SELECT ~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~",~"CLIENTES~".~"COD_CALLE~",~"CLIENTES~".~"NUM_PUERTA~",~"CLIENTES~".~"DUPLICADOR~",~"CLIENTES~".~"CGV_CLI~",~"CLIENTES~".~"COD_CLI~",~~'~~',~"CALLEJERO~".~"NOM_CALLE~",~"CLIENTES~".~"TFNO_CLI~" FROM ~"CALLEJERO~",~"CLIENTES~" WHERE ( ~"CALLEJERO~".~"COD_CALLE~" = ~"CLIENTES~".~"COD_CALLE~" ) and ( ~"CLIENTES~".~"TFNO_CLI~" = " + String(ll_telefono) + " ) "

	ls_modstring = "DataWindow.Table.Select='" + ls_select + "'"


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************	
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	rc = dw_1.Modify(ls_modstring)

	dw_1.SetTransObject(SQLCA)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)
	parent.SetRedraw(true)
	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		Close(Parent)
	ELSEIF Filas = 0 THEN
		gnv_msg.f_mensaje("ER65","","",OK!)
		sle_1.Setfocus()
		parent.SetRedraw(true)
		Return
	END IF

ELSE

	If Not (Ape1  > "") or isNull(ape1) THEN
		gnv_msg.f_mensaje("ER35","","",OK!)
		sle_1.SetFocus()
		parent.SetRedraw(true)
		RETURN
	END IF

	//dw_1.SetRedraw(False)
//access using d_at0113_13 instead of d_at0113_12 which is non-existent 
// or d_at0113_123 which is malfunctioning - Antony
//	IF (Ape2 > "") THEN
//		Tipo = Tipo + "2"
//	END IF
	IF (Ape2 > "") or (Inic > "")THEN
		Tipo = Tipo + "3"
	END IF

//	IF (Inic > "") THEN
//		Tipo = Tipo + "3"
//	END IF
//
	Inic = Inic + "%"  // por el like
	IF cbx_1.Checked = False THEN
		dw_1.DataObject = 'd_at0113_' + Tipo
	ELSE						//Sin$$HEX1$$f300$$ENDHEX$$nimos
		cbx_1.Checked = True
		dw_1.DataObject = 'd_at0113_a' + Tipo
	END IF

//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  OSGI 2001.2  	24/09/2002				//***************************************
//**  OSGI 2001.2  	24/09/2002				//**  OSGI 2001.1  	05/04/2001			**
//**  OSGI 2001.2  	24/09/2002				//**  Jair Padilla / Soluziona PANAMA  **
//**  OSGI 2001.2  	24/09/2002				//***************************************
//**  OSGI 2001.2  	24/09/2002				fg_ventana_parametro(parent.ClassName(), dw_1)
//**  OSGI 2001.2  	24/09/2002				fg_alto_texto(dw_1, dw_1.ClassName(), 0)
//**  OSGI 2001.2  	24/09/2002				//***************************************
//**  OSGI 2001.2  	24/09/2002				//**  OSGI 2001.1  	05/04/2001			**
//**  OSGI 2001.2  	24/09/2002				//**  Jair Padilla / Soluziona PANAMA  **
//**  OSGI 2001.2  	24/09/2002				//***************************************		
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************

	cant_cli = 0 										//Contador de filas que voy trayendo  S.A.

	dw_1.SetTransObject(sqlca)

Filas = dw_1.Retrieve(Ape1,Ape2,Inic)		//Siempre el mismo arg, pero uso solo los necesarios
parent.SetRedraw(true)

	//dw_1.SetRedraw(True)

	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		Close(Parent)
	ELSEIF Filas = 0 THEN
//		YIELD()
		IF cbx_1.Checked = True THEN
			gnv_msg.f_mensaje("ER37","","",OK!)
		ELSE
			li_resp_mens = gnv_msg.f_mensaje("CR02","","",YESNO!)
			IF li_resp_mens = 1 THEN
				cbx_1.Checked = True
				ib_segunda_entrada = True
//				YIELD()
				This.PostEvent(clicked!)
			ELSE

				// Si se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open prendo bandera para que
	         // cierre la ventana.
				if ib_viene_del_open then
//					YIELD()
					sle_1.text=""
					sle_2.text=""
					sle_3.text=""
					sle_2.setfocus()
	//				RETURN
				end if
			END IF
		END IF
	ELSEIF Filas = 1 THEN
		filaselecc = 1
//		YIELD()
		cb_2.PostEvent(clicked!)
	ELSE
		cb_2.Enabled = True
		cb_2.SetFocus()
	END IF

END IF

ib_viene_del_open = FALSE

end event

type st_2 from statictext within w_at0113
integer x = 27
integer y = 160
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Segundo Apellido:"
boolean focusrectangle = false
end type

event doubleclicked;//Modificaci$$HEX1$$f300$$ENDHEX$$n:
// El control de calle no codificada se pas$$HEX2$$f3002000$$ENDHEX$$al evento RetrieveRow, ya
// la dw_1 tiene la opci$$HEX1$$f300$$ENDHEX$$n Retrieve Only As Needed y no es posible 
// verificar todas las filas en este evento
//Autor: S.A.
//Fecha: 4/5/95
//Lugar: San Luis

string Ape1 , Ape2, Inic, ls_select, ls_select_2, ls_where, ls_modstring, rc
string Prov, Tipo
// MERC string Dir
int Filas, Fila, Nulo, li_resp_mens
long CodCalle, CodCli, ll_telefono

SetPointer(HourGlass!)
parent.SetRedraw(false)

Ape1    = sle_1.text
Ape2	  = sle_2.text
Inic 	  = sle_3.text 
ll_telefono = Long(sle_telef.Text)

SetNull(Nulo)

Tipo = "1"

dw_1.SetTransObject(SQLCA)

IF ib_por_telef THEN
	IF Parent.frn_validar_telefono(sle_telef.Text) = -1 THEN
		parent.SetRedraw(TRUE)
		Return
	END IF

	SetPointer(HourGlass!)

	dw_1.SetRedraw(false)
	dw_1.DataObject = 'd_at0113_a' + Tipo	

	ls_select = "SELECT ~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~",~"CLIENTES~".~"COD_CALLE~",~"CLIENTES~".~"NUM_PUERTA~",~"CLIENTES~".~"DUPLICADOR~",~"CLIENTES~".~"CGV_CLI~",~"CLIENTES~".~"COD_CLI~",~~'~~',~"CALLEJERO~".~"NOM_CALLE~",~"CLIENTES~".~"TFNO_CLI~" FROM ~"CALLEJERO~",~"CLIENTES~" WHERE ( ~"CALLEJERO~".~"COD_CALLE~" = ~"CLIENTES~".~"COD_CALLE~" ) and ( ~"CLIENTES~".~"TFNO_CLI~" = " + String(ll_telefono) + " ) "

	ls_modstring = "DataWindow.Table.Select='" + ls_select + "'"
	

	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************	
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	dw_1.SetRedraw(true)
	
	rc = dw_1.Modify(ls_modstring)

	dw_1.SetTransObject(SQLCA)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)
	parent.SetRedraw(true)
	
	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		parent.SetRedraw(TRUE)
		Close(Parent)
	ELSEIF Filas = 0 THEN
		gnv_msg.f_mensaje("ER65","","",OK!)
		parent.SetRedraw(TRUE)
		Return
	END IF

ELSE

	If Not (Ape1  > "") or isNull(ape1) THEN
		gnv_msg.f_mensaje("ER35","","",OK!)
		parent.SetRedraw(TRUE)
		RETURN
	END IF

	//dw_1.SetRedraw(False)
//access using d_at0113_13 instead of d_at0113_12 which is non-existent 
// or d_at0113_123 which is malfunctioning - Antony
//	IF (Ape2 > "") THEN
//		Tipo = Tipo + "2"
//	END IF
	IF (Ape2 > "") or (Inic > "")THEN
		Tipo = Tipo + "3"
	END IF

//	IF (Inic > "") THEN
//		Tipo = Tipo + "3"
//	END IF
//
	Inic = Inic + "%"  // por el like
	dw_1.setRedraw(false)
	IF cbx_1.Checked = False THEN
		dw_1.DataObject = 'd_at0113_' + Tipo
	ELSE						//Sin$$HEX1$$f300$$ENDHEX$$nimos
		cbx_1.Checked = True
		dw_1.DataObject = 'd_at0113_a' + Tipo
	END IF


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************		
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	dw_1.SetRedraw(true)

	cant_cli = 0 										//Contador de filas que voy trayendo  S.A.

	dw_1.SetTransObject(sqlca)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)		//Siempre el mismo arg, pero uso solo los necesarios
	parent.SetRedraw(true)

	//dw_1.SetRedraw(True)

	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		parent.SetRedraw(TRUE)
		Close(Parent)
	ELSEIF Filas = 0 THEN
//		YIELD()
		IF cbx_1.Checked = True THEN
			gnv_msg.f_mensaje("ER37","","",OK!)
		ELSE
			li_resp_mens = gnv_msg.f_mensaje("CR02","","",YESNO!)
			IF li_resp_mens = 1 THEN
				cbx_1.Checked = True
				ib_segunda_entrada = True
//				YIELD()
				This.PostEvent(clicked!)
			ELSE

				// Si se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open prendo bandera para que
	         // cierre la ventana.
				if ib_viene_del_open then
//					YIELD()
					sle_1.text=""
					sle_2.text=""
					sle_3.text=""
					sle_2.setfocus()
	//				RETURN
				end if
			END IF
		END IF
	ELSEIF Filas = 1 THEN
		filaselecc = 1
//		YIELD()
		cb_2.PostEvent(clicked!)
	ELSE
		cb_2.Enabled = True
		cb_2.SetFocus()
	END IF

END IF

ib_viene_del_open = FALSE

end event

type st_3 from statictext within w_at0113
integer x = 27
integer y = 268
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Inicial:"
boolean focusrectangle = false
end type

event doubleclicked;//Modificaci$$HEX1$$f300$$ENDHEX$$n:
// El control de calle no codificada se pas$$HEX2$$f3002000$$ENDHEX$$al evento RetrieveRow, ya
// la dw_1 tiene la opci$$HEX1$$f300$$ENDHEX$$n Retrieve Only As Needed y no es posible 
// verificar todas las filas en este evento
//Autor: S.A.
//Fecha: 4/5/95
//Lugar: San Luis

string Ape1 , Ape2, Inic, ls_select, ls_select_2, ls_where, ls_modstring, rc
string Prov, Tipo
// MERC string Dir
int Filas, Fila, Nulo, li_resp_mens
long CodCalle, CodCli, ll_telefono

SetPointer(HourGlass!)
parent.SetRedraw(false)

Ape1    = sle_1.text
Ape2	  = sle_2.text
Inic 	  = sle_3.text 
ll_telefono = Long(sle_telef.Text)

SetNull(Nulo)

Tipo = "1"

dw_1.SetTransObject(SQLCA)

IF ib_por_telef THEN
	IF Parent.frn_validar_telefono(sle_telef.Text) = -1 THEN
		parent.SetRedraw(true)
		Return
	END IF

	SetPointer(HourGlass!)

	dw_1.SetRedraw(false)
	dw_1.DataObject = 'd_at0113_a' + Tipo	

	ls_select = "SELECT ~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~",~"CLIENTES~".~"COD_CALLE~",~"CLIENTES~".~"NUM_PUERTA~",~"CLIENTES~".~"DUPLICADOR~",~"CLIENTES~".~"CGV_CLI~",~"CLIENTES~".~"COD_CLI~",~~'~~',~"CALLEJERO~".~"NOM_CALLE~",~"CLIENTES~".~"TFNO_CLI~" FROM ~"CALLEJERO~",~"CLIENTES~" WHERE ( ~"CALLEJERO~".~"COD_CALLE~" = ~"CLIENTES~".~"COD_CALLE~" ) and ( ~"CLIENTES~".~"TFNO_CLI~" = " + String(ll_telefono) + " ) "

	ls_modstring = "DataWindow.Table.Select='" + ls_select + "'"


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************	
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	dw_1.SetRedraw(true)

	rc = dw_1.Modify(ls_modstring)

	dw_1.SetTransObject(SQLCA)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)
	parent.SetRedraw(true)
	
	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		parent.SetRedraw(true)
		Close(Parent)
	ELSEIF Filas = 0 THEN
		gnv_msg.f_mensaje("ER65","","",OK!)
		parent.SetRedraw(true)
		Return
	END IF

ELSE

	If Not (Ape1  > "") or isNull(ape1) THEN
		gnv_msg.f_mensaje("ER35","","",OK!)
		sle_1.SetFocus()
		parent.SetRedraw(true)
	ELSE	
	

	//dw_1.SetRedraw(False)
	//access using d_at0113_13 instead of d_at0113_12 which is non-existent 
	// or d_at0113_123 which is malfunctioning - Antony
	//	IF (Ape2 > "") THEN
	//		Tipo = Tipo + "2"
	//	END IF
		IF (Ape2 > "") or (Inic > "")THEN
			Tipo = Tipo + "3"
		END IF
	
	//	IF (Inic > "") THEN
	//		Tipo = Tipo + "3"
	//	END IF
	//
		Inic = Inic + "%"  // por el like
		dw_1.SetRedraw(false)
		IF cbx_1.Checked = False THEN
			dw_1.DataObject = 'd_at0113_' + Tipo
		ELSE						//Sin$$HEX1$$f300$$ENDHEX$$nimos
			cbx_1.Checked = True
			dw_1.DataObject = 'd_at0113_a' + Tipo
		END IF


		//******************************************
		//**  OSGI 2001.2  	24/09/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************
		//**  OSGI 2001.2  	24/09/2002						//***************************************
		//**  OSGI 2001.2  	24/09/2002						//**  OSGI 2001.1  	05/04/2001			**
		//**  OSGI 2001.2  	24/09/2002						//**  Jair Padilla / Soluziona PANAMA  **
		//**  OSGI 2001.2  	24/09/2002						//***************************************
		//**  OSGI 2001.2  	24/09/2002						fg_ventana_parametro(parent.ClassName(), dw_1)
		//**  OSGI 2001.2  	24/09/2002						fg_alto_texto(dw_1, dw_1.ClassName(), 0)
		//**  OSGI 2001.2  	24/09/2002						//***************************************
		//**  OSGI 2001.2  	24/09/2002						//**  OSGI 2001.1  	05/04/2001			**
		//**  OSGI 2001.2  	24/09/2002						//**  Jair Padilla / Soluziona PANAMA  **
		//**  OSGI 2001.2  	24/09/2002						//***************************************		
		//******************************************
		//**  OSGI 2001.2  	24/09/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************


		dw_1.SetRedraw(true)
		cant_cli = 0 										//Contador de filas que voy trayendo  S.A.
	
		dw_1.SetTransObject(sqlca)
	
		Filas = dw_1.Retrieve(Ape1,Ape2,Inic)		//Siempre el mismo arg, pero uso solo los necesarios
		parent.SetRedraw(true)
	
		//dw_1.SetRedraw(True)
	
		IF Filas < 0 THEN
			gnv_msg.f_mensaje("ER36","","",OK!)
			parent.SetRedraw(true)
			Close(Parent)
		ELSEIF Filas = 0 THEN
	//		YIELD()
			IF cbx_1.Checked = True THEN
				gnv_msg.f_mensaje("ER37","","",OK!)
			ELSE
				li_resp_mens = gnv_msg.f_mensaje("CR02","","",YESNO!)
				IF li_resp_mens = 1 THEN
					cbx_1.Checked = True
					ib_segunda_entrada = True
	//				YIELD()
					This.PostEvent(clicked!)
				ELSE
	
					// Si se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open prendo bandera para que
					// cierre la ventana.
					if ib_viene_del_open then
	//					YIELD()
						sle_1.text=""
						sle_2.text=""
						sle_3.text=""
						sle_3.setfocus()
						
		//				RETURN
					end if
				END IF
			END IF
		ELSEIF Filas = 1 THEN
			filaselecc = 1
	//		YIELD()
			cb_2.PostEvent(clicked!)
		ELSE
			cb_2.Enabled = True
			cb_2.SetFocus()
		END IF
	END IF
END IF

ib_viene_del_open = FALSE

end event

type st_inicial from statictext within w_at0113
integer x = 27
integer y = 268
integer width = 594
integer height = 68
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "MS Serif"
boolean italic = true
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Inicial"
boolean focusrectangle = false
end type

event clicked;//Modificaci$$HEX1$$f300$$ENDHEX$$n:
// El control de calle no codificada se pas$$HEX2$$f3002000$$ENDHEX$$al evento RetrieveRow, ya
// la dw_1 tiene la opci$$HEX1$$f300$$ENDHEX$$n Retrieve Only As Needed y no es posible 
// verificar todas las filas en este evento
//Autor: S.A.
//Fecha: 4/5/95
//Lugar: San Luis

string Ape1 , Ape2, Inic, ls_select, ls_select_2, ls_where, ls_modstring, rc
string Prov, Tipo
// MERC string Dir
int Filas, Fila, Nulo, li_resp_mens
long CodCalle, CodCli, ll_telefono

SetPointer(HourGlass!)
parent.SetRedraw(false)

Ape1    = sle_1.text
Ape2	  = sle_2.text
Inic 	  = sle_3.text 
ll_telefono = Long(sle_telef.Text)

SetNull(Nulo)

Tipo = "1"

dw_1.SetTransObject(SQLCA)

IF ib_por_telef THEN
	IF Parent.frn_validar_telefono(sle_telef.Text) = -1 THEN
		parent.SetRedraw(true)
		Return
	END IF

	SetPointer(HourGlass!)
	dw_1.SetRedraw(false)
	dw_1.DataObject = 'd_at0113_a' + Tipo	

	ls_select = "SELECT ~"CLIENTES~".~"NOM_CLI~",~"CLIENTES~".~"APE1_CLI~",~"CLIENTES~".~"APE2_CLI~",~"CLIENTES~".~"COD_CALLE~",~"CLIENTES~".~"NUM_PUERTA~",~"CLIENTES~".~"DUPLICADOR~",~"CLIENTES~".~"CGV_CLI~",~"CLIENTES~".~"COD_CLI~",~~'~~',~"CALLEJERO~".~"NOM_CALLE~",~"CLIENTES~".~"TFNO_CLI~" FROM ~"CALLEJERO~",~"CLIENTES~" WHERE ( ~"CALLEJERO~".~"COD_CALLE~" = ~"CLIENTES~".~"COD_CALLE~" ) and ( ~"CLIENTES~".~"TFNO_CLI~" = " + String(ll_telefono) + " ) "

	ls_modstring = "DataWindow.Table.Select='" + ls_select + "'"


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************	
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	dw_1.SetRedraw(true)

	rc = dw_1.Modify(ls_modstring)

	dw_1.SetTransObject(SQLCA)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)
	parent.SetRedraw(true)
	
	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		Close(Parent)
	ELSEIF Filas = 0 THEN
		gnv_msg.f_mensaje("ER65","","",OK!)
		Return
	END IF

ELSE

	If Not (Ape1  > "") or isNull(ape1) THEN
		gnv_msg.f_mensaje("ER35","","",OK!)
		parent.SetRedraw(true)
		RETURN
	END IF

	//dw_1.SetRedraw(False)
//access using d_at0113_13 instead of d_at0113_12 which is non-existent 
// or d_at0113_123 which is malfunctioning - Antony
//	IF (Ape2 > "") THEN
//		Tipo = Tipo + "2"
//	END IF
	IF (Ape2 > "") or (Inic > "")THEN
		Tipo = Tipo + "3"
	END IF

//	IF (Inic > "") THEN
//		Tipo = Tipo + "3"
//	END IF
//
	Inic = Inic + "%"  // por el like
	
	dw_1.setRedraw(false)
	IF cbx_1.Checked = False THEN
		dw_1.DataObject = 'd_at0113_' + Tipo
	ELSE						//Sin$$HEX1$$f300$$ENDHEX$$nimos
		cbx_1.Checked = True
		dw_1.DataObject = 'd_at0113_a' + Tipo
	END IF


	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					fg_ventana_parametro(parent.ClassName(), dw_1)
	//**  OSGI 2001.2  	24/09/2002					fg_alto_texto(dw_1, dw_1.ClassName(), 0)
	//**  OSGI 2001.2  	24/09/2002					//***************************************
	//**  OSGI 2001.2  	24/09/2002					//**  OSGI 2001.1  	05/04/2001			**
	//**  OSGI 2001.2  	24/09/2002					//**  Jair Padilla / Soluziona PANAMA  **
	//**  OSGI 2001.2  	24/09/2002					//***************************************		
	//******************************************
	//**  OSGI 2001.2  	24/09/2002				**
	//**  Jair Padilla / Soluziona PANAMA  	**
	//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
	//******************************************


	dw_1.SetRedraw(true)

	cant_cli = 0 										//Contador de filas que voy trayendo  S.A.

	dw_1.SetTransObject(sqlca)

	Filas = dw_1.Retrieve(Ape1,Ape2,Inic)		//Siempre el mismo arg, pero uso solo los necesarios
	parent.SetRedraw(true)

	//dw_1.SetRedraw(True)

	IF Filas < 0 THEN
		gnv_msg.f_mensaje("ER36","","",OK!)
		parent.SetRedraw(true)
		Close(Parent)
	ELSEIF Filas = 0 THEN
//		YIELD()
		IF cbx_1.Checked = True THEN
			gnv_msg.f_mensaje("ER37","","",OK!)
		ELSE
			li_resp_mens = gnv_msg.f_mensaje("CR02","","",YESNO!)
			IF li_resp_mens = 1 THEN
				cbx_1.Checked = True
				ib_segunda_entrada = True
//				YIELD()
				This.PostEvent(clicked!)
			ELSE

				// Si se lanz$$HEX2$$f3002000$$ENDHEX$$desde el open prendo bandera para que
	         // cierre la ventana.
				if ib_viene_del_open then
//					YIELD()
					sle_1.text=""
					sle_2.text=""
					sle_3.text=""
					sle_3.setfocus()
	//				RETURN
				end if
			END IF
		END IF
	ELSEIF Filas = 1 THEN
		filaselecc = 1
//		YIELD()
		cb_2.PostEvent(clicked!)
	ELSE
		cb_2.Enabled = True
		cb_2.SetFocus()
	END IF

END IF

ib_viene_del_open = FALSE

end event


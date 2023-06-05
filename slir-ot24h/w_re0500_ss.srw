HA$PBExportHeader$w_re0500_ss.srw
$PBExportComments$Suministros del cliente
forward
global type w_re0500_ss from w_sgigenerica
end type
type dw_1 from u_gen_re0500_ss within w_re0500_ss
end type
type cb_1 from u_cb within w_re0500_ss
end type
type sle_3 from singlelineedit within w_re0500_ss
end type
type sle_2 from singlelineedit within w_re0500_ss
end type
type sle_1 from singlelineedit within w_re0500_ss
end type
type st_1 from statictext within w_re0500_ss
end type
type cb_2 from u_cb within w_re0500_ss
end type
end forward

global type w_re0500_ss from w_sgigenerica
integer x = 677
integer y = 700
integer width = 2299
integer height = 996
string title = "OPEN SGI - Suministros de Clientes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_post_open ( )
dw_1 dw_1
cb_1 cb_1
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_1 st_1
cb_2 cb_2
end type
global w_re0500_ss w_re0500_ss

type variables
int FilaSelecc

long CodCli

u_generico_comunicaciones		iu_gen_comunic 

boolean ib_nis_nic
end variables

event ue_post_open();//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//Se cambio todo el script del open a 
//este evento
//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


SetPointer(HourGlass!)

//Open Script para w_re0500_ss

int Filas
long ll_cod_cli
string ls_est_sum
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual
Long ll_nif  //**  OSGI 2001.1  21/06/2001

ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)

codcli = parnum2
sle_1.text = parmstr1
sle_2.text = parmstr2
sle_3.text = parmstr3

// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_re0500_ss","Cli.Suministros")

dw_1.SetTransObject(SQLCA)



//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.2  	11/09/2002				**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  String ls_cadena
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  If fg_verifica_parametro('NIC') Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ls_cadena = dw_1.Object.sumcon_nis_rad_t.Text
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	If Len(Trim(ls_cadena)) > 0 And Not IsNull(ls_cadena) Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		fg_replace_text(ls_cadena, ls_cadena, "NIC")
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		dw_1.Object.sumcon_nis_rad_t.Text = ls_cadena
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.2  	11/09/2002				**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************



Filas = dw_1.Retrieve(codcli)

IF Filas < 0 THEN	
	gnv_msg.f_mensaje("ER48","","",OK!)
	Close(This)
ELSEIF Filas = 0 THEN
	gnv_msg.f_mensaje("AR08","","",OK!)
	parnum1 = 0
	parnum2 = 1
	Close(This)
ELSEIF Filas = 1 THEN

	dir.gl_nis = dw_1.GetItemNumber(1,1)		//Nis Rad
	
	// Si el suministro existe en la tabla 'Suministros',
	// verifico su existencia en 'SumCon' y/o 'PetSum'.
	// En caso afirmativo proceso, sino despliego mensaje,
	// explicando que el sum. ni tiene contrato vigente.
		
	SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF  /*  OSGI 2001.1  21/06/2001  (, SUMCON.NIF)  */
	INTO :ll_cod_cli, :ls_est_sum, :ll_nif					/*  OSGI 2001.1  21/06/2001  (, :ll_nif)  */
	FROM SUMCON
	WHERE	(SUMCON.NIS_RAD = :dir.gl_nis);
	
	IF sqlca.SqlCode = 100 THEN
	
		SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE
		INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte
		FROM PETSUM
		WHERE (PETSUM.NIS_RAD = :dir.gl_nis);
	
		IF sqlca.SqlCode < 0 THEN
			gnv_msg.f_mensaje("ER31","","",OK!)
			Close(This)
		END IF	
	ELSEIF sqlca.SqlCode = -1 THEN
		gnv_msg.f_mensaje("ER31","","",OK!)
		Close(This)
	END IF
	
	// Si el suministro no esta en corte proceso.
//	IF ls_est_sum <> "EC013" THEN
	
		// Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
		// v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
		// Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
		// enganche y corte, del suministro en 'petsum'
		IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
				 OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR ls_est_sum = "EC023" OR &
				(ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

			// Si el suministro existe en las tres tablas, 
			// cargo la inf. en la estructura.
				
			// Carga de la estructura dir para el SGI
			dir.gl_cod_cli  = parnum2							//C$$HEX1$$f300$$ENDHEX$$digo del Cliente
			dir.gs_ape1  	 = parmstr1							//Apellido1
			dir.gs_ape2  	 = parmstr2							//Apellido2
			dir.gs_nom	 	 = parmstr3							//Nombre
			dir.gl_codcalle = dw_1.GetItemNumber(1,3)		//Cod Calle
			dir.gl_numero   = dw_1.GetItemNumber(1,4)		//Numero
			dir.gs_duplic	 = dw_1.GetItemString(1,5)		//Duplic
			dir.gs_pisodpto = dw_1.GetItemString(1,6)		//Cgv
			dir.gl_codloc	 = dw_1.GetItemNumber(1,7)		//Cod Loc
			dir.gl_codmun	 = dw_1.GetItemNumber(1,8)		//Cod Munic
			dir.gl_codprov	 = dw_1.GetItemNumber(1,9)		//Cod Prov
			dir.gl_coddepto = dw_1.GetItemNumber(1,10)	//Cod Depto
			dir.gs_telefono = dw_1.GetItemString(1,11)	//Tel$$HEX1$$e900$$ENDHEX$$fono	
			dir.gs_doc		 = dw_1.GetItemString(1,12)	//Doc Id
			dir.gs_tipo_doc = dw_1.GetItemString(1,13)	//Tip Doc 
			dir.gs_co_pais	 = dw_1.GetItemString(1,14)	//Co Pa$$HEX1$$ed00$$ENDHEX$$s
			dir.gs_calle	 = dw_1.GetItemString(1,15)	//Calle 
			dir.gs_depto	 = dw_1.GetItemString(1,16)	//Depto
			dir.gs_prov		 = dw_1.GetItemString(1,17)	//Provincia 
			dir.gs_local	 = dw_1.GetItemString(1,18)	//Localidad 
			dir.gs_munic	 = dw_1.GetItemString(1,19)	//Municipio 
			dir.gs_pais		 = dw_1.GetItemString(1,20)	//Pa$$HEX1$$ed00$$ENDHEX$$s 
			
			parnum1 = 1										//Salida OK
			parnum2 = 1


			//***************************************
			//**  OSGI 2001.1  	21/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			dir.gs_ref = fg_referencia(dir.gl_codloc, ll_nif, dir.gs_ref)
			//***************************************
			//**  OSGI 2001.1  	21/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************


			IF ls_est_sum = "EC013" THEN
				gu_comunic.is_comunic.intval10 = 1
			ELSEIF ls_est_sum = "EC023" THEN
				gu_comunic.is_comunic.intval10 = 2
			ELSE
				gu_comunic.is_comunic.intval10 = 0
			END IF
			Close(This)
		ELSE
	
			gnv_msg.f_mensaje("AR13","","",OK!)
			parnum1 = 0	
			Close(This)
		END IF
//	ELSE
//
//		gnv_msg.f_mensaje("AR15","","",OK!)
//		Close(This)
//	END IF
END IF	
	

end event

on close;//GU_COMUNIC.FNU_CERRAR(THIS)
//gu_comunic.fnu_cerrar_hijas(this)
end on

on w_re0500_ss.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_1=create cb_1
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.sle_3
this.Control[iCurrent+4]=this.sle_2
this.Control[iCurrent+5]=this.sle_1
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.cb_2
end on

on w_re0500_ss.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_1)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_2)
end on

event open;call super::open;//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.PostEvent("ue_post_open")
//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_re0500_ss
end type

type dw_1 from u_gen_re0500_ss within w_re0500_ss
integer x = 41
integer y = 304
integer width = 2199
integer height = 572
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;// Clicked Script para dw_1 

if row > 0 then
	
	dw_1.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
	
	FilaSelecc = row
	
	
	IF FilaSelecc > 0 THEN dw_1.SelectRow(FilaSelecc, TRUE)		
													// Se selecciona la fila nueva

END IF

end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	cb_1.TriggerEvent(Clicked!)
END IF
end event

event constructor;call super::constructor;//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //***************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.1  	28/07/2001			**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //***************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  If IsValid(Parent) Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ib_nis_nic = fg_verifica_parametro(Parent.ClassName())
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	If ib_nis_nic Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		fg_ventana_parametro(Parent.ClassName(), This)
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //***************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.1  	28/07/2001			**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //***************************************
//******************************************
//**  OSGI 2001.2  	25/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event

event retrieveend;call super::retrieveend;//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  OSGI 2001.2  	24/09/2002				Long ll_i, &
//**  OSGI 2001.2  	24/09/2002					  ll_row, &
//**  OSGI 2001.2  	24/09/2002					  ll_nis_rad, &
//**  OSGI 2001.2  	24/09/2002					  ll_nic
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002					  
//**  OSGI 2001.2  	24/09/2002				String ls_cadena
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002				IF FG_VERIFICA_PARAMETRO("NIC") THEN 
//**  OSGI 2001.2  	24/09/2002				If IsValid(Parent) And Lower(This.DataObject) = "d_re0500_ss" Then
//**  OSGI 2001.2  	24/09/2002					ll_row = This.RowCount()
//**  OSGI 2001.2  	24/09/2002					
//**  OSGI 2001.2  	24/09/2002					For ll_i = 1 To ll_row
//**  OSGI 2001.2  	24/09/2002						//***************
//**  OSGI 2001.2  	24/09/2002						//**  NIS NIC  **
//**  OSGI 2001.2  	24/09/2002						//***************
//**  OSGI 2001.2  	24/09/2002						ll_nis_rad = This.GetItemNumber(ll_i, "nis_rad")
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002						ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad)
//**  OSGI 2001.2  	24/09/2002						
//**  OSGI 2001.2  	24/09/2002						DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
//**  OSGI 2001.2  	24/09/2002						PREPARE SQLSA FROM :ls_cadena ;
//**  OSGI 2001.2  	24/09/2002						OPEN DYNAMIC my_cursor ;
//**  OSGI 2001.2  	24/09/2002						FETCH my_cursor INTO :ll_nic ;
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002						If sqlca.sqlcode <> 0 Or IsNull(ll_nic) Or ll_nic <= 0 Then
//**  OSGI 2001.2  	24/09/2002							ll_nic = 0
//**  OSGI 2001.2  	24/09/2002						End If
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002						CLOSE my_cursor;
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002						This.SetItem(ll_i, "nis_rad", ll_nic)
//**  OSGI 2001.2  	24/09/2002						//***************
//**  OSGI 2001.2  	24/09/2002						//**  NIS NIC  **
//**  OSGI 2001.2  	24/09/2002						//***************
//**  OSGI 2001.2  	24/09/2002					Next
//**  OSGI 2001.2  	24/09/2002					
//**  OSGI 2001.2  	24/09/2002					This.AcceptText()
//**  OSGI 2001.2  	24/09/2002				
//**  OSGI 2001.2  	24/09/2002				END IF
//**  OSGI 2001.2  	24/09/2002				End If
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************

end event

type cb_1 from u_cb within w_re0500_ss
integer x = 1728
integer y = 52
integer width = 411
integer height = 96
integer taborder = 30
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;//Clicked Script para cb_1

long ll_cod_cli
string ls_est_sum
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual
Long ll_nif  //**  OSGI 2001.1  	21/06/2001




ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)


IF FilaSelecc = 0 THEN
	gnv_msg.f_mensaje("ER47","","",OK!)
	Return
END IF

dir.gl_nis  	 = dw_1.GetItemNumber(FilaSelecc,1)		//Nis Rad

// Si el suministro existe en la tabla 'Suministros',
// verifico su existencia en 'SumCon' y/o 'PetSum'.
// En caso afirmativo proceso, sino despliego mensaje,
// explicando que el sum. ni tiene contrato vigente.
	
SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF  /*  OSGI 2001.1  21/06/2001  (, SUMCON.NIF)  */
INTO :ll_cod_cli, :ls_est_sum, :ll_nif					/*  OSGI 2001.1  21/06/2001  (, :ll_nif)  */
FROM SUMCON
WHERE	(SUMCON.NIS_RAD = :dir.gl_nis);

IF sqlca.SqlCode = 100 THEN

	SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE
	INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte
	FROM PETSUM
	WHERE (PETSUM.NIS_RAD = :dir.gl_nis);

	IF sqlca.SqlCode < 0 THEN
		gnv_msg.f_mensaje("ER31","","",OK!)
		Close(Parent)
	END IF

ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER31","","",OK!)
	Close(Parent)
END IF


// Si el suministro no esta en corte proceso.
//IF ls_est_sum <> "EC013" THEN
	
	// Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
	// v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
	// Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
	// enganche y corte, del suministro en 'petsum'
	IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
			 OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR ls_est_sum = "EC023" OR &
			(ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

		// Si el suministro existe en las tres tablas, 
		// cargo la inf. en la estructura.
				
		// Carga de la estructura dir para el SGI
		dir.gl_cod_cli  = parnum2							//C$$HEX1$$f300$$ENDHEX$$digo del Cliente
		dir.gs_ape1  	 = parmstr1							//Apellido1
		dir.gs_ape2  	 = parmstr2							//Apellido2
		dir.gs_nom	 	 = parmstr3							//Nombre
		dir.gl_codcalle = dw_1.GetItemNumber(FilaSelecc,3)		//Cod Calle
		dir.gl_numero   = dw_1.GetItemNumber(FilaSelecc,4)		//Numero
		dir.gs_duplic	 = dw_1.GetItemString(FilaSelecc,5)		//Duplic
		dir.gs_pisodpto = dw_1.GetItemString(FilaSelecc,6)		//Cgv
		dir.gl_codloc	 = dw_1.GetItemNumber(FilaSelecc,7)		//Cod Loc
		dir.gl_codmun	 = dw_1.GetItemNumber(FilaSelecc,8)		//Cod Munic
		dir.gl_codprov	 = dw_1.GetItemNumber(FilaSelecc,9)		//Cod Prov
		dir.gl_coddepto = dw_1.GetItemNumber(FilaSelecc,10)	//Cod Depto
		dir.gs_telefono = string(dw_1.object.tfno_cli[FilaSelecc])	//Tel$$HEX1$$e900$$ENDHEX$$fono	
		dir.gs_doc		 = dw_1.GetItemString(FilaSelecc,12)	//Doc Id
		dir.gs_tipo_doc = dw_1.GetItemString(FilaSelecc,13)	//Tip Doc 
		dir.gs_co_pais	 = dw_1.GetItemString(FilaSelecc,14)	//Co Pa$$HEX1$$ed00$$ENDHEX$$s
		dir.gs_calle	 = dw_1.GetItemString(FilaSelecc,15)	//Calle 
		dir.gs_depto	 = dw_1.GetItemString(FilaSelecc,16)	//Depto
		dir.gs_prov		 = dw_1.GetItemString(FilaSelecc,17)	//Provincia 
		dir.gs_local	 = dw_1.GetItemString(FilaSelecc,18)	//Localidad 
		dir.gs_munic	 = dw_1.GetItemString(FilaSelecc,19)	//Municipio 
		dir.gs_pais		 = dw_1.GetItemString(FilaSelecc,20)	//Pa$$HEX1$$ed00$$ENDHEX$$s 
		
		parnum1 = 1										//Salida OK


		//***************************************
		//**  OSGI 2001.1  	21/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		dir.gs_ref = fg_referencia(dir.gl_codloc, ll_nif, dir.gs_ref)
		//***************************************
		//**  OSGI 2001.1  	21/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************


		IF ls_est_sum = "EC013" THEN
			gu_comunic.is_comunic.intval10 = 1
		ELSEIF ls_est_sum = "EC023" THEN
			gu_comunic.is_comunic.intval10 = 2
		ELSE
			gu_comunic.is_comunic.intval10 = 0
		END IF
		Close(Parent)
	ELSE
	
		gnv_msg.f_mensaje("AR13","","",OK!)
		parnum1 = 0	
		Close(Parent)
	END IF
//ELSE
//
//	gnv_msg.f_mensaje("AR15","","",OK!)
//	Close(Parent)
//END IF


end event

type sle_3 from singlelineedit within w_re0500_ss
integer x = 384
integer y = 176
integer width = 1157
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_re0500_ss
integer x = 992
integer y = 60
integer width = 549
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_re0500_ss
integer x = 384
integer y = 60
integer width = 549
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_re0500_ss
integer x = 41
integer y = 68
integer width = 343
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
string text = "Cliente"
boolean focusrectangle = false
end type

type cb_2 from u_cb within w_re0500_ss
integer x = 1728
integer y = 164
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Salir"
end type

on clicked;call u_cb::clicked;//int resp

//Resp = 	gnv_msg.f_mensaje("CR01","","",OKCancel!)

//IF Resp = 1 	THEN	

	parnum1 = 0
	Close(Parent)

//END IF


end on


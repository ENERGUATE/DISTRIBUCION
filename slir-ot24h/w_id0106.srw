HA$PBExportHeader$w_id0106.srw
$PBExportComments$Lista de suministros del inmueble
forward
global type w_id0106 from w_sgigenerica
end type
type dw_1 from u_gen_id0106 within w_id0106
end type
type cb_2 from u_cb within w_id0106
end type
type cb_1 from u_cb within w_id0106
end type
end forward

global type w_id0106 from w_sgigenerica
int X=553
int Y=788
int Width=2569
int Height=820
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Suministros de Inmuebles"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
dw_1 dw_1
cb_2 cb_2
cb_1 cb_1
end type
global w_id0106 w_id0106

type variables
long filaselecc

u_generico_comunicaciones		iu_gen_comunic 

end variables

event open;call super::open;int Fila, li_filas
long ll_cod_cli
string ls_est_sum
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual

ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)


// Creo el objeto de comunicaciones para tener acceso a la funci$$HEX1$$f300$$ENDHEX$$n
// de t$$HEX1$$ed00$$ENDHEX$$tulo.
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_id0106","ListaSuministros")

SetPointer(HourGlass!)

dw_1.SetTransObject(SQLCA)


//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  TODO ESTO SE HACE DESDE EL EVENTO
//**  PADRE DEL DW SQLPREVIEW Y 
//**  RETRIEVESTART
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
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ls_cadena = dw_1.Object.nis_t.Text
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	If Len(Trim(ls_cadena)) > 0 And Not IsNull(ls_cadena) Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		fg_replace_text(ls_cadena, ls_cadena, "NIC")
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		dw_1.Object.nis_t.Text = ls_cadena
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.2  	11/09/2002				**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************


li_filas = dw_1.Retrieve(dir.gl_nif)  

If li_filas = -1  THEN

	gnv_msg.f_mensaje("ER45","","",OK!)
	Close(This)
ELSEIF li_filas = 1 THEN

	dir.gl_nis  = dw_1.GetItemNumber(1,"nis")

	// Si el suministro existe en la tabla 'Suministros',
	// verifico su existencia en 'SumCon' y/o 'PetSum'.
	// En caso afirmativo proceso, sino despliego mensaje,
	// explicando que el sum. ni tiene contrato vigente.
	
	SELECT SUMCON.COD_CLI, SUMCON.EST_SUM
	INTO :ll_cod_cli, :ls_est_sum
	FROM SUMCON
	WHERE	(SUMCON.NIS_RAD = :dir.gl_nis);

	IF sqlca.SqlCode = 100 THEN

		SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE
		INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte
		FROM PETSUM
		WHERE (PETSUM.NIS_RAD = :dir.gl_nis);

		IF sqlca.SqlCode < 0 THEN
			gnv_msg.f_mensaje("ER31","","",OK!)
			dir.gl_nis = -1
			Close(This)
		END IF

	ELSEIF sqlca.SqlCode = -1 THEN
		gnv_msg.f_mensaje("ER31","","",OK!)
		dir.gl_nis = -1
		Close(This)
	END IF

	// Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
	// v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
	// Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
	// enganche y corte, del suministro en 'petsum'
	IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
			 OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR ls_est_sum = "EC023" OR &
			(ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

		// Si el suministro existe en las tres tablas, 
		// cargo la inf. en la estructura.
			
		dir.gl_nis  = dw_1.GetItemNumber(1,"nis")
		dir.gs_pisodpto = dw_1.GetItemString(1,"suministros_cgv_sum")
		dir.gs_ape1 = dw_1.GetItemString(1,"clientes_ape1_cli")
		dir.gs_ape2 = dw_1.GetItemString(1,"clientes_ape2_cli")
		dir.gs_nom = dw_1.GetItemString(1,"clientes_nom_cli")
		dir.gs_doc = dw_1.GetItemString(1,"clientes_doc_id")
		dir.gs_tipo_doc = dw_1.GetItemString(1,"clientes_tip_doc")
		dir.gs_pais = dw_1.GetItemString(1,"codigos_desc_cod")
		dir.gs_co_pais = dw_1.GetItemString(1,"clientes_co_pais")
		dir.gs_telefono = string(dw_1.object.clientes_tfno_cli[1])
	
		IF ls_est_sum = "EC013"	THEN
			gu_comunic.is_comunic.intval10 = 1
		ELSEIF ls_est_sum = "EC023" THEN
			gu_comunic.is_comunic.intval10 = 2
		ELSE
			gu_comunic.is_comunic.intval10 = 0
		END IF

		Close(This)
	ELSE
		gnv_msg.f_mensaje("AR13","","",OK!)
		dir.gl_nis = -1
		Close(This)
	END IF

ELSEIF li_filas = 0 THEN
	SetNull(dir.gl_nis)
	SetNull(parmstr3)
	SetNull(parmstr4)
	if gu_comunic.is_comunic.programa_llamante  = 'm_recepcion_de_avisos_m_agregar' or &
	 gu_comunic.is_comunic.programa_llamante  = 'w_3202' or &
	 gu_comunic.is_comunic.programa_llamante = "w_man_instalacion_alta" or &
	 gu_comunic.is_comunic.programa_llamante = "w_operaciones" then
		gnv_msg.f_mensaje("ER46","","",OK!)
	end if
	Close(This)
END IF


end event

on w_id0106.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.cb_2=create cb_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
end on

on w_id0106.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.cb_2)
destroy(this.cb_1)
end on

event close;DESTROY iu_gen_comunic
end event

type dw_1 from u_gen_id0106 within w_id0106
int X=46
int Y=32
int Width=2441
int Height=512
int TabOrder=30
BorderStyle BorderStyle=StyleRaised!
end type

event clicked;call super::clicked;// Clicked Script para dw
if row > 0 then
	
	this.SelectRow(FilaSelecc, FALSE)	// Se deselecciona la fila
	
	FilaSelecc =row
	
	
	IF FilaSelecc > 0 THEN this.SelectRow(FilaSelecc, TRUE)		
													// Se selecciona la fila nueva

END IF
end event

event doubleclicked;call super::doubleclicked;if row > 0 then
	cb_1.TriggerEvent(Clicked!)
END IF
end event

event sqlpreview;call super::sqlpreview;//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  TODO ESTO SE HACE DESDE EL EVENTO
//**  PADRE DEL DW SQLPREVIEW Y 
//**  RETRIEVESTART
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.2  	10/09/2002				**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  String ls_cadena
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  If fg_verifica_parametro('NIC') Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	ls_cadena = sqlsyntax + fg_tip_serv()
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	If Len(Trim(ls_cadena)) > 0 Then
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		fg_replace_text(ls_cadena, "NIS_RAD", "NIC")
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		This.SetSQLPreview(ls_cadena)
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  	End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  End If
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  OSGI 2001.2  	10/09/2002				**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  //******************************************
//******************************************
//**  OSGI 2001.2  	24/09/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
end event

type cb_2 from u_cb within w_id0106
int X=1920
int Y=580
int TabOrder=10
string Text="&Salir"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

on clicked;call u_cb::clicked;//Evento Clicked para el bot$$HEX1$$f300$$ENDHEX$$n Salir

SetNull(dir.gl_nis)
Close(parent)
end on

type cb_1 from u_cb within w_id0106
int X=174
int Y=580
int TabOrder=20
string Text="&Aceptar"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;//Evento Clicked para bot$$HEX1$$f300$$ENDHEX$$n Confirmar

long ll_cod_cli
string ls_est_sum
datetime ldt_f_enganche, ldt_f_corte, ldt_f_actual
Long ll_nif  //**  OSGI 2001.1  	21/06/2001



ldt_f_actual = fgnu_fecha_actual()
SetNull(ldt_f_enganche)
SetNull(ldt_f_corte)


SetPointer(HourGlass!)

IF FilaSelecc > 0 THEN

	dir.gl_nis  = dw_1.GetItemNumber(FilaSelecc,"nis")

	// Si el suministro existe en la tabla 'Suministros',
	// verifico su existencia en 'SumCon' y/o 'PetSum'.
	// En caso afirmativo proceso, sino despliego mensaje,
	// explicando que el sum. ni tiene contrato vigente.
	
	SELECT SUMCON.COD_CLI, SUMCON.EST_SUM, SUMCON.NIF  /*  OSGI 2001.1  	21/06/2001  (, SUMCON.NIF)*/
	INTO :ll_cod_cli, :ls_est_sum, :ll_nif  /*  OSGI 2001.1  	21/06/2001  (, :ll_nif)*/
	FROM SUMCON
	WHERE	(SUMCON.NIS_RAD = :dir.gl_nis);

	IF sqlca.SqlCode = 100 THEN

		SELECT PETSUM.COD_CLI, PETSUM.F_ENGANCHE , PETSUM.F_CORTE
		INTO :ll_cod_cli, :ldt_f_enganche, :ldt_f_corte
		FROM PETSUM
		WHERE (PETSUM.NIS_RAD = :dir.gl_nis);

		IF sqlca.SqlCode < 0 THEN
			gnv_msg.f_mensaje("ER31","","",OK!)
			dir.gl_nis = -1
			Close(Parent)
		END IF

	ELSEIF sqlca.SqlCode = -1 THEN
		gnv_msg.f_mensaje("ER31","","",OK!)
		dir.gl_nis = -1
		Close(Parent)
	END IF

	// Si encontre al suministro, y est$$HEX2$$e1002000$$ENDHEX$$en 'sumcon' con un estado
	// v$$HEX1$$e100$$ENDHEX$$lido, o lo fu$$HEX2$$ed002000$$ENDHEX$$a buscar a 'petsum'
	// Si la fecha actual est$$HEX2$$e1002000$$ENDHEX$$entre las fechas de:
	// enganche y corte, del suministro en 'petsum'
 	IF sqlca.SqlCode = 0 AND (ls_est_sum = "EC011" OR ls_est_sum = "EC012"&
			OR ls_est_sum = "EC013" OR ls_est_sum = "EC014" OR ls_est_sum = "EC023" OR &
			(ldt_f_actual >= ldt_f_enganche AND ldt_f_actual <= ldt_f_corte)) THEN

		// Si el suministro existe en las tres tablas, 
		// cargo la inf. en la estructura.
			
		dir.gl_nis  = dw_1.GetItemNumber(filaselecc,"nis")
		dir.gs_pisodpto = dw_1.GetItemString(filaselecc,"suministros_cgv_sum")
		dir.gs_ape1 = dw_1.GetItemString(filaselecc,"clientes_ape1_cli")
		dir.gs_ape2 = dw_1.GetItemString(filaselecc,"clientes_ape2_cli")
		dir.gs_nom = dw_1.GetItemString(filaselecc,"clientes_nom_cli")
		dir.gs_doc = dw_1.GetItemString(filaselecc,"clientes_doc_id")
		dir.gs_tipo_doc = dw_1.GetItemString(filaselecc,"clientes_tip_doc")
		dir.gs_pais = dw_1.GetItemString(filaselecc,"codigos_desc_cod")
		dir.gs_co_pais = dw_1.GetItemString(filaselecc,"clientes_co_pais")



		//**********************************************
		//**  OSGI 2001.2  	01/10/2002					 **
		//**  Jair Padilla / Soluziona PANAMA  		 **
		//**  TIPO COLUMNA TFNO_CLI TELEFONO CLIENTE  **
		//**********************************************
		//**  TIPO COLUMNA TFNO_CLI TELEFONO CLIENTE  		dir.gs_telefono = string(dw_1.GetItemNumber(filaselecc,"clientes_tfno_cli"))

		dir.gs_telefono = fg_tfno_cli_type(ll_cod_cli, "")
		//**********************************************
		//**  OSGI 2001.2  	01/10/2002					 **
		//**  Jair Padilla / Soluziona PANAMA  		 **
		//**  TIPO COLUMNA TFNO_CLI TELEFONO CLIENTE  **
		//**********************************************



		//***************************************
		//**  OSGI 2001.1  	21/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		dir.gs_ref = fg_referencia(dir.gl_codloc, ll_nif, dir.gs_ref)
		//***************************************
		//**  OSGI 2001.1  	21/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************


		IF ls_est_sum = "EC013"	THEN
			gu_comunic.is_comunic.intval10 = 1
		ELSEIF ls_est_sum = "EC023" THEN
			gu_comunic.is_comunic.intval10 = 2
		ELSE
			gu_comunic.is_comunic.intval10 = 0
		END IF

		Close(Parent)

	ELSE
		gnv_msg.f_mensaje("AR13","","",OK!)
		dir.gl_nis = -1
		Close(Parent)
	END IF
ELSE
	SetNull(dir.gl_nis)
	SetNull(parmstr3)
	SetNull(parmstr4)
	gnv_msg.f_mensaje("ER47","","",OK!)
	RETURN
END IF



end event


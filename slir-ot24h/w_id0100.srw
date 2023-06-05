HA$PBExportHeader$w_id0100.srw
$PBExportComments$Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica
forward
global type w_id0100 from w_sgigenerica
end type
type cbx_referencia from checkbox within w_id0100
end type
type st_6 from statictext within w_id0100
end type
type st_5 from statictext within w_id0100
end type
type st_7 from statictext within w_id0100
end type
type sle_7 from singlelineedit within w_id0100
end type
type sle_6 from singlelineedit within w_id0100
end type
type sle_5 from singlelineedit within w_id0100
end type
type sle_4 from singlelineedit within w_id0100
end type
type st_4 from statictext within w_id0100
end type
type sle_3 from singlelineedit within w_id0100
end type
type sle_2 from singlelineedit within w_id0100
end type
type sle_1 from singlelineedit within w_id0100
end type
type st_3 from statictext within w_id0100
end type
type dw_4 from datawindow within w_id0100
end type
type dw_3 from datawindow within w_id0100
end type
type st_2 from statictext within w_id0100
end type
type st_1 from statictext within w_id0100
end type
type dw_1 from datawindow within w_id0100
end type
type dw_2 from datawindow within w_id0100
end type
type sle_8 from singlelineedit within w_id0100
end type
type st_8 from statictext within w_id0100
end type
type ln_1 from line within w_id0100
end type
type ln_2 from line within w_id0100
end type
type ln_3 from line within w_id0100
end type
type ln_4 from line within w_id0100
end type
type ln_5 from line within w_id0100
end type
type ln_6 from line within w_id0100
end type
type ln_7 from line within w_id0100
end type
type ln_8 from line within w_id0100
end type
type st_prov from statictext within w_id0100
end type
type cbx_1 from checkbox within w_id0100
end type
end forward

global type w_id0100 from w_sgigenerica
integer x = 741
integer y = 564
integer width = 2181
integer height = 1268
string title = "OPEN SGI - Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_enter pbm_dwnkey
cbx_referencia cbx_referencia
st_6 st_6
st_5 st_5
st_7 st_7
sle_7 sle_7
sle_6 sle_6
sle_5 sle_5
sle_4 sle_4
st_4 st_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
st_3 st_3
dw_4 dw_4
dw_3 dw_3
st_2 st_2
st_1 st_1
dw_1 dw_1
dw_2 dw_2
sle_8 sle_8
st_8 st_8
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
st_prov st_prov
cbx_1 cbx_1
end type
global w_id0100 w_id0100

type variables
long filaSelecc1, filaSelecc2, filaSelecc3
datawindowchild dddw
string TipCons

u_generico_comunicaciones	iu_gen_comunic

boolean ib_calle

Boolean ib_cuarto_nivel, ib_ayuda_ap  //**  OSGI 2001.1  01/06/2001

string is_localidad
long il_localidad
string is_prov
long il_provincia
end variables

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

//IF KeyDown(KeyEnter!) THEN  st_4.TriggerEvent("doubleclicked")
end event

event open;call super::open;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Ventana Identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica 
//
// Comentario general: Encuentra una direcci$$HEX1$$f300$$ENDHEX$$n que la devuelve en una 
//	estructura que se carga en PowerObjectParm
//
//	Entrada: 
//		parmstr1 (o message.stringparm para ventanas nuevas). Tipo de
//		 consulta (ver el CASE)
//	Salida:
//		dir Estructura con la direcci$$HEX1$$f300$$ENDHEX$$n que se carga en el objeto Message
//
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:      
//
//  Fecha		Resp.		Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------	----------------------------------------
// 21/7/95	 	SAS		Comentarios y adaptaci$$HEX1$$f300$$ENDHEX$$n
//	20/03/96		HMA		Modificaci$$HEX1$$f300$$ENDHEX$$n para SGI
//
////////////////////////////////////////////////////////////////////////////////////////////////
int li_fila , li_nro_prov, li_fila_municipio
long ll_nulo ,aux
s_direccion_cliente ls_dir_reset
SetPointer(HourGlass!)
iu_gen_comunic = CREATE u_generico_comunicaciones

// Le coloco el t$$HEX1$$ed00$$ENDHEX$$tulo a la ventana.
This.Title = iu_gen_comunic.f_titulo_ventana("w_id0100","Ident.Geografica")
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

//// Los cargo en las var. globales corresp.
//parnum2 = iu_gen_comunic.is_comunic.intval1		//Prov
//parnum3 = iu_gen_comunic.is_comunic.intval2		//Depto
//parnum4 = iu_gen_comunic.is_comunic.longval4		//Munic
//parnum5 = iu_gen_comunic.is_comunic.longval5		//Local

dw_1.SetTransObject(sqlca)
dw_2.SetTransObject(sqlca)
dw_3.SetTransObject(sqlca)
dw_4.SetTransObject(sqlca)

dw_1.InsertRow(0)			//Provincias ACO
dw_1.GetChild("cod_prov",dddw)

parnum1 = 0

dir = ls_dir_reset

//iu_gen_comunic = Message.PowerObjectParm

// Por defecto aparece la provincia del centro al que pertenezco

dw_1.SetItem(1,"cod_prov",parnum2)
//dw_2.SetItem(1,"cod_depto",parnum3)
//dw_3.SetItem(1,"cod_munic",parnum4)
//dw_4.SetItem(1,"cod_local",parnum5)
	
dw_1.TriggerEvent("itemchanged")

// Menos en la consulta de dir del cliente la prov es SL,
// a no ser que se traiga un valor de recepci$$HEX1$$f300$$ENDHEX$$n de avisos.
//IF NOT IsNull(iu_gen_comunic.is_comunic.strval1) THEN
//	dir.gs_prov = iu_gen_comunic.is_comunic.strval1 //merc
//	ELSE
//	dir.gs_prov = "SAN LUIS"
//END IF
//

//// Seteo la var. que le indica a la Id. Geo. si busco por 
//// 'Calle' o 'Referencia'.
//IF ib_calle THEN
//	iu_gen_comunic.is_comunic.strval9 = "Calle"
//ELSE
//	iu_gen_comunic.is_comunic.strval9 = "Referencia"
//END IF


CHOOSE CASE iu_gen_comunic.is_comunic.strval10
	CASE  "Ent Geo" 
		sle_5.Visible = False
		sle_6.Visible = False
		sle_7.Visible = False
//		sle_8.Visible = False
		st_5.Visible = False
		st_6.Visible = False
		st_7.Visible = False
//		st_8.Visible = False

	CASE	"Calle"
		sle_5.Visible = False
		sle_6.Visible = False
		sle_7.Visible = False
//		sle_8.Visible = False
		st_5.Visible = False
		st_6.Visible = False
		st_7.Visible = False
//		st_8.Visible = False

	CASE 	"Nif"
		sle_7.Visible = False
//		sle_8.Visible = False
		st_7.Visible = False
//		st_8.Visible = False

	CASE	"Calle o Nif" 
		tipcons = "Calle"		//As$$HEX2$$ed002000$$ENDHEX$$se habilita en calle
		sle_7.Visible = False
//		sle_8.Visible = False
		st_7.Visible = False
//		st_8.Visible = False

	CASE "Nif o Nis"
		tipcons = "Nif"		//As$$HEX2$$ed002000$$ENDHEX$$se habilita en finca

	CASE "Nif cliente"
		tipcons = "Calle"		//As$$HEX2$$ed002000$$ENDHEX$$se habilita en calle
		sle_7.Visible = False
//		sle_8.Visible = False
		st_7.Visible = False
//		st_8.Visible = False

	CASE "Cuenta"
		tipcons = "Calle"		//As$$HEX2$$ed002000$$ENDHEX$$se habilita en calle

	CASE "Nis"
		tipcons = "Nis"
		//Se habilita solo en Nis		

	CASE "Nis_imp"
		tipcons =  "Nis"
//		st_8.Visible = FALSE
//		sle_8.Visible = FALSE
END CHOOSE


// Despliego en la ventana los datos que traigo de la anterior

//dw_1.SetItem(1,1,iu_gen_comunic.is_comunic.intval1)	// Provincia cargada
//aux=dw_2.Retrieve(iu_gen_comunic.is_comunic.intval1)
//dw_2.SetItem(1,1,iu_gen_comunic.is_comunic.intval2)	// Departamento cargado
//sle_1.text = iu_gen_comunic.is_comunic.strval2
//aux=dw_3.Retrieve(iu_gen_comunic.is_comunic.intval2)
//dw_3.SetItem(1,1,iu_gen_comunic.is_comunic.longval4)	// Municipio cargado
//sle_2.text = iu_gen_comunic.is_comunic.strval3
//aux=dw_4.Retrieve(iu_gen_comunic.is_comunic.longval4)
//dw_4.SetItem(1,1,iu_gen_comunic.is_comunic.longval5)	// Localidad cargada
//sle_3.text = iu_gen_comunic.is_comunic.strval4
//

// Lo cargo con las varibles globales del usuario

dw_1.SetItem(1,1,gi_cod_provincia)	// Provincia cargada
aux=dw_2.Retrieve(gi_cod_provincia)
//dw_2.SetItem(1,1,gi_cod_departamento)	// Departamento cargado
sle_1.text = gs_departamento
aux=dw_3.Retrieve(gi_cod_departamento)
//dw_3.SetItem(1,1,gl_cod_municipio)	// Municipio cargado
sle_2.text = gs_municipio
aux=dw_4.Retrieve(gl_cod_municipio)
//dw_4.SetItem(1,1,gl_cod_localidad)	// Localidad cargada
sle_3.text = gs_localidad

parnum2=gi_cod_provincia
parnum3=gi_cod_departamento
parnum4=gl_cod_municipio
parnum5=gl_cod_localidad

// Si voy a identificar por calle.

// Elijo Calle o Referencia a trav$$HEX1$$e900$$ENDHEX$$s del checkbox cbx_referencia

//IF iu_gen_comunic.is_comunic.strval9 = "Calle" THEN
	
	 iu_gen_comunic.is_comunic.strval9 = "Calle"
	
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval5) THEN
//		sle_4.text = iu_gen_comunic.is_comunic.strval5		// Calle cargada
		
		// Comentado para la apertura de esta ventana desde 
		// alta de contratas 05/02/2002  GSE
		// sle_4.text = parmstr6
		
		//	END IF
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval6) THEN
//		sle_5.text = iu_gen_comunic.is_comunic.strval6		// N$$HEX1$$fa00$$ENDHEX$$mero cargado
//	END IF
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval7) THEN
//		sle_6.text = iu_gen_comunic.is_comunic.strval7		// Duplicador cargado
//	END IF

	sle_5.text = parmstr7
	sle_6.text = parmstr8
	sle_7.text = parmstr9
	
	sle_4.SetFocus()
	sle_8.Enabled = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	sle_8.BackColor = (65536*192+256*192+192)
	sle_8.BackColor = long(gs_gris)
// Fin. Sgo.
	st_8.Enabled = False
		
//ELSEIF iu_gen_comunic.is_comunic.strval9 = "Referencia" THEN
//
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval5) THEN
//		sle_8.text = iu_gen_comunic.is_comunic.strval5		// Referencia cargada
//	END IF
//	sle_8.SetFocus()
//	sle_4.Enabled = False
//	sle_4.BackColor = (65536*192+256*192+192)
//	sle_5.Enabled = False
//	sle_6.Enabled = False
//	sle_7.Enabled = False
//	st_4.Enabled = False
//END IF

// Selecciono las filas respectivas de las datawindows.

//li_fila = dw_2.Find(" nom_depto = '" &
//	+ iu_gen_comunic.is_comunic.strval2 +"'",1,dw_2.RowCount())

li_fila = dw_2.Find(" nom_depto = '" &
	+ gs_departamento +"'",1,dw_2.RowCount())

dw_2.SelectRow(li_fila,True)
dw_2.ScrollToRow(li_fila)

//li_fila = dw_3.Find("nom_munic = '"+ iu_gen_comunic.is_comunic.strval3&
//	+"'",1,dw_3.RowCount())

li_fila = dw_3.Find("nom_munic = '"+ gs_municipio&
	+"'",1,dw_3.RowCount())

dw_3.SelectRow(li_fila,True)
dw_3.ScrollToRow(li_fila)

li_fila_municipio=li_fila // GNU 26-4-2006. Mejora 1/327511

//li_fila = dw_4.Find("nom_local = '"+ iu_gen_comunic.is_comunic.strval4&
//	+"'",1,dw_4.RowCount())

li_fila = dw_4.Find("nom_local = '"+ gs_localidad&
	+"'",1,dw_4.RowCount())

dw_4.SelectRow(li_fila,True)
dw_4.ScrollToRow(li_fila)


// Cargo en la estructura los datos tra$$HEX1$$ed00$$ENDHEX$$dos

dir.gl_codprov		= iu_gen_comunic.is_comunic.intval1
dir.gl_coddepto	= iu_gen_comunic.is_comunic.intval2
dir.gl_codmun		= iu_gen_comunic.is_comunic.longval4
dir.gl_codloc		= iu_gen_comunic.is_comunic.longval5
dir.gs_prov			= iu_gen_comunic.is_comunic.strval1
dir.gs_depto		= iu_gen_comunic.is_comunic.strval2
dir.gs_munic		= iu_gen_comunic.is_comunic.strval3
dir.gs_local		= iu_gen_comunic.is_comunic.strval4

//// Los cargo en las var. globales corresp.
//parnum2 = iu_gen_comunic.is_comunic.intval1		//Prov
//parnum3 = iu_gen_comunic.is_comunic.intval2		//Depto
//parnum4 = iu_gen_comunic.is_comunic.longval4		//Munic
//parnum5 = iu_gen_comunic.is_comunic.longval5		//Local


//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_prov.Text = fg_geografica("1", st_prov.Text)
st_1.Text = fg_geografica("2", st_1.Text)
st_2.Text = fg_geografica("3", st_2.Text)
st_3.Text = fg_geografica("4", st_3.Text)
// GNU 2-5-2006. Mejora 1/327511
if fg_verifica_parametro ('GEO') then
	cbx_1.Text= 'Buscar por ' + st_3.Text
end if
// FIN GNU

//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//*******************************************
//**  OSGI 2002.1  	02/09/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  Mover la posici$$HEX1$$f300$$ENDHEX$$n de DW para que se  **
//**  muestre el texto completo provincia  **
//*******************************************
If fg_verifica_parametro('GEO') Then
	// GNU 2-5-2006. Mejora 1/327511
	// Lo pongo fijo para que no se mueva cuando cambio el buscar por localidad/barrio
	//dw_1.x = dw_1.x + 233
	dw_1.x=617
	// FIN GNU
End If
//*******************************************
//**  OSGI 2002.1  	02/09/2002				 **
//**  Jair Padilla / Soluziona PANAMA  	 **
//**  Mover la posici$$HEX1$$f300$$ENDHEX$$n de DW para que se  **
//**  muestre el texto completo provincia  **
//*******************************************


// Elijo Calle o Referencia a trav$$HEX1$$e900$$ENDHEX$$s del checkbox cbx_referencia

// Si voy a identificar por calle.
//IF iu_gen_comunic.is_comunic.strval9 = "Calle" THEN

	IF iu_gen_comunic.is_comunic.programa_llamante<>"w_man_instalacion" and sle_4.text <> "" AND sle_4.text <> " " AND NOT IsNull(sle_4.text) THEN //ACO
		st_4.TriggerEvent(doubleclicked!)
		close(this)//Matorra (Avisos-inc. 5)
	END IF

//ELSEIF iu_gen_comunic.is_comunic.strval9 = "Referencia" THEN
//	IF sle_8.text <> "" AND sle_8.text <> " " AND NOT IsNull(sle_8.text) THEN
//		st_8.TriggerEvent(doubleclicked!)
//	END IF
//END IF

gu_comunic.is_comunic.programa_retorno = "iw_id0100"


//***************************************
//**  OSGI 2001.1  	01/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
if isvalid(this) then
ib_cuarto_nivel= fg_verifica_parametro('aviso_cuarto_nivel')
ib_ayuda_ap = fg_verifica_parametro("avisos_ayuda_ap_prov_dist_corr_barrio")

// GNU 26-4-2006. Mejora 1/327511
if ib_cuarto_nivel and li_fila_municipio>0 then
	st_4.TextColor = RGB(128,0,0)
	st_5.TextColor = RGB(128,128,128)
	st_4.Enabled = True
	st_5.Enabled = False
end if
// FIN GNU

If gl_tipo_aviso = fgcdec_aviso_alumbrado_publico Or gl_tipo_aviso = fgcdec_aviso_de_ayuda And ib_ayuda_ap Then
	cbx_referencia.Enabled = False
	sle_4.Enabled = False
//	st_4.Enabled = False
	sle_5.Enabled = False
	st_5.Enabled = False
	sle_6.Enabled = False
	st_6.Enabled = False
	sle_7.Enabled = False
	st_7.Enabled = False
	sle_8.Enabled = False
	st_8.Enabled = False
End If
//***************************************
//**  OSGI 2001.1  	01/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end if 
end event

event close;boolean lb_comprueba


//Mato-->(Avisos Inc. 22)
//gu_comunic.is_comunic.strval2 = sle_1.text
//gu_comunic.is_comunic.strval3 = sle_2.text
//gu_comunic.is_comunic.strval4 = sle_3.text
is_prov = dddw.GetItemString(dddw.GetRow(),2)


if gu_comunic.is_comunic.programa_llamante = "w_3111_mante_aco" or &
	gu_comunic.is_comunic.programa_llamante = "w_3211"  or &
	gu_comunic.is_comunic.programa_llamante = "w_man_instalacion" then

	IF gu_comunic.is_comunic.longval1 <> 0 AND NOT IsNull(gu_comunic.is_comunic.longval1) THEN
		lb_comprueba = true	
		gu_comunic.is_comunic.longval4 = parnum4
		gu_comunic.is_comunic.longval5 = parnum5
		gu_comunic.is_comunic.intval1	 =	parnum2 
		gu_comunic.is_comunic.intval2  = parnum3	
	   if	gu_comunic.is_comunic.programa_llamante = "w_3211" then
			gu_comunic.is_comunic.strval1 = is_prov			
			gu_comunic.is_comunic.strval2 = dir.gs_depto		
			gu_comunic.is_comunic.strval3 = dir.gs_munic		
			gu_comunic.is_comunic.strval4 = dir.gs_local		
		end if
	else
		lb_comprueba = false
		if gu_comunic.is_comunic.programa_llamante <> "w_3211"  then
			parnum2 = il_provincia
			dir.gs_prov			= is_prov
//			dir.gl_codprov    = il_provincia
			
			dir.gl_codprov=parnum2
			dir.gl_coddepto=parnum3
			dir.gl_codmun=parnum4
			dir.gl_codloc=parnum5
			
			dir.gs_depto=sle_1.text
			dir.gs_munic=sle_2.text
			dir.gs_local=sle_3.text		
			dir.gs_calle=sle_4.text		
			//dir.gs_prov=is_prov
						
			gu_comunic.is_comunic.longval4 = parnum4
			gu_comunic.is_comunic.longval5 = parnum5
			gu_comunic.is_comunic.intval1	 =	parnum2 
			gu_comunic.is_comunic.intval2  = parnum3			
		else
			parnum4 = gu_comunic.is_comunic.longval4
			parnum5 = gu_comunic.is_comunic.longval5
			parnum2 = 	gu_comunic.is_comunic.intval1		//Prov
			parnum3 =	gu_comunic.is_comunic.intval2 	//Depto		
			
		end if

	end if


else
	IF gu_comunic.is_comunic.intval1 <> 0 AND NOT IsNull(gu_comunic.is_comunic.intval1) THEN
		lb_comprueba = true
//		parnum4 = gu_comunic.is_comunic.longval4
//		parnum5 = gu_comunic.is_comunic.longval5
//		parnum2 = 	gu_comunic.is_comunic.intval1		//Prov
//		parnum3 =	gu_comunic.is_comunic.intval2 	//Depto		
	else
		lb_comprueba = false
		
		//SMB 08/10/2007 Comento estas lineas porque al seleccionar
		//la acometida por barrio entra aqu$$HEX1$$ed00$$ENDHEX$$, gu_comunic.is_comunic
		//esta vacio y al cargarlo en pantalla dejamos todos los campos
		//vacios por lo que nos da un error. Con comentar esto vale.
		
		//dir.gl_codprov		= gu_comunic.is_comunic.intval1
		//dir.gl_coddepto	= gu_comunic.is_comunic.intval2
		//dir.gl_codmun		= gu_comunic.is_comunic.longval4
		//dir.gl_codloc		= gu_comunic.is_comunic.longval5
		//dir.gs_prov			= gu_comunic.is_comunic.strval1
		//dir.gs_depto		= gu_comunic.is_comunic.strval2
		//dir.gs_munic		= gu_comunic.is_comunic.strval3
		//dir.gs_local		= gu_comunic.is_comunic.strval4
		//gu_comunic.is_comunic.intval2  = parnum2 
		//gu_comunic.is_comunic.longval3 = parnum3 
		
	end if
end if


// Si voy a identificar por calle.
IF iu_gen_comunic.is_comunic.strval9 = "Calle" THEN

	IF lb_comprueba THEN
		gu_comunic.is_comunic.strval5 = sle_4.text
		gu_comunic.is_comunic.intval6 = integer(sle_5.text)
		gu_comunic.is_comunic.strval7 = sle_6.text
		gu_comunic.is_comunic.strval1 = dir.gs_prov
		gu_comunic.is_comunic.intval1 = parnum2  //Prov
		gu_comunic.is_comunic.intval2 = parnum3  //Depto
		gu_comunic.is_comunic.longval4 =	parnum4 //Munic
		gu_comunic.is_comunic.longval5 =	parnum5 //Local
		dir.gl_codprov=parnum2
		dir.gl_coddepto=parnum3
		dir.gl_codmun=parnum4
		dir.gl_codloc=parnum5
		dir.gs_depto=sle_1.text
		dir.gs_munic=sle_2.text
		dir.gs_local=sle_3.text		
		dir.gs_calle=sle_4.text		
		dir.gs_prov=is_prov
		
	ELSE
		//SetNull(gu_comunic.is_comunic.strval5)
	
		SetNull(gu_comunic.is_comunic.intval6)
		SetNull(gu_comunic.is_comunic.strval7)
	END IF
ELSEIF iu_gen_comunic.is_comunic.strval9 = "Referencia" THEN
	dir.gs_prov			= is_prov
	IF gu_comunic.is_comunic.longval1 <> 0 AND NOT IsNull(gu_comunic.is_comunic.longval1) THEN
		gu_comunic.is_comunic.strval5 = dir.gs_calle
		gu_comunic.is_comunic.intval6 = dir.gl_numero
		gu_comunic.is_comunic.strval7 = dir.gs_duplic
		gu_comunic.is_comunic.strval1 = dir.gs_prov
		dir.gl_codprov=parnum2
		dir.gl_coddepto=parnum3
		dir.gl_codmun=parnum4
		dir.gl_codloc=parnum5
		dir.gs_depto=sle_1.text
		dir.gs_munic=sle_2.text
		dir.gs_local=sle_3.text
		dir.gs_calle=sle_4.text
		gu_comunic.is_comunic.intval1 = parnum2 		//Prov
		gu_comunic.is_comunic.intval2 = parnum3 		//Depto
	ELSE
		//SetNull(gu_comunic.is_comunic.strval5)
		SetNull(gu_comunic.is_comunic.intval6)
		SetNull(gu_comunic.is_comunic.strval7)
	END IF
END IF

CloseWithReturn(This,dir) 
end event

event closequery;//IF iu_gen_comunic.is_comunic.intval10 = 0 THEN
//	IF parnum2 = 0 OR parnum3 = 0 OR parnum4 = 0 OR parnum5 = 0 THEN
//		gnv_msg.f_mensaje("AA05","","",OK!)
//		Message.ReturnValue = 1
//	END IF
//END IF


end event

event activate;sle_4.SetFocus()
end event

on w_id0100.create
int iCurrent
call super::create
this.cbx_referencia=create cbx_referencia
this.st_6=create st_6
this.st_5=create st_5
this.st_7=create st_7
this.sle_7=create sle_7
this.sle_6=create sle_6
this.sle_5=create sle_5
this.sle_4=create sle_4
this.st_4=create st_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.st_3=create st_3
this.dw_4=create dw_4
this.dw_3=create dw_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.dw_2=create dw_2
this.sle_8=create sle_8
this.st_8=create st_8
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.st_prov=create st_prov
this.cbx_1=create cbx_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_referencia
this.Control[iCurrent+2]=this.st_6
this.Control[iCurrent+3]=this.st_5
this.Control[iCurrent+4]=this.st_7
this.Control[iCurrent+5]=this.sle_7
this.Control[iCurrent+6]=this.sle_6
this.Control[iCurrent+7]=this.sle_5
this.Control[iCurrent+8]=this.sle_4
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.sle_3
this.Control[iCurrent+11]=this.sle_2
this.Control[iCurrent+12]=this.sle_1
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.dw_4
this.Control[iCurrent+15]=this.dw_3
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.dw_1
this.Control[iCurrent+19]=this.dw_2
this.Control[iCurrent+20]=this.sle_8
this.Control[iCurrent+21]=this.st_8
this.Control[iCurrent+22]=this.ln_1
this.Control[iCurrent+23]=this.ln_2
this.Control[iCurrent+24]=this.ln_3
this.Control[iCurrent+25]=this.ln_4
this.Control[iCurrent+26]=this.ln_5
this.Control[iCurrent+27]=this.ln_6
this.Control[iCurrent+28]=this.ln_7
this.Control[iCurrent+29]=this.ln_8
this.Control[iCurrent+30]=this.st_prov
this.Control[iCurrent+31]=this.cbx_1
end on

on w_id0100.destroy
call super::destroy
destroy(this.cbx_referencia)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_7)
destroy(this.sle_7)
destroy(this.sle_6)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.st_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.st_3)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.sle_8)
destroy(this.st_8)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.st_prov)
destroy(this.cbx_1)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_id0100
end type

type cbx_referencia from checkbox within w_id0100
integer x = 1435
integer y = 8
integer width = 475
integer height = 76
integer taborder = 140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Referencia"
end type

event clicked;IF This.Checked THEN
//	This.Checked = False
	ib_calle = False
ELSE
//	This.Checked = True
	ib_calle = True
END IF

// Seteo la var. que le indica a la Id. Geo. si busco por 
// 'Calle' o 'Referencia'.
IF ib_calle THEN
	iu_gen_comunic.is_comunic.strval9 = "Calle"
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval5) THEN
//		sle_4.text = iu_gen_comunic.is_comunic.strval5		// Calle cargada
//	END IF
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval6) THEN
//		sle_5.text = iu_gen_comunic.is_comunic.strval6		// N$$HEX1$$fa00$$ENDHEX$$mero cargado
//	END IF
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval7) THEN
//		sle_6.text = iu_gen_comunic.is_comunic.strval7		// Duplicador cargado
//	END IF
	sle_4.SetFocus()
	sle_4.Enabled = True 	
	sle_5.Enabled = True		// LFE	
	sle_6.Enabled = True		// LFE
	sle_7.Enabled = True		// LFE
	sle_8.Enabled = True		// LFE
	sle_8.Enabled = False
	sle_8.Text = ""
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	sle_8.BackColor = (65536*192+256*192+192)
//	sle_4.BackColor = (65536*255+256*255+255)
	sle_8.BackColor = long(gs_gris)
	sle_4.BackColor = long(gs_blanco)
// Fin. Sgo.
	st_8.Enabled = False
	st_4.Enabled = True
	IF sle_4.text <> "" AND sle_4.text <> " " AND NOT IsNull(sle_4.text) THEN
		st_4.TriggerEvent(doubleclicked!)
	END IF
ELSE
	iu_gen_comunic.is_comunic.strval9 = "Referencia"
	
//	IF NOT IsNull(iu_gen_comunic.is_comunic.strval5) THEN
//		sle_8.text = iu_gen_comunic.is_comunic.strval5		// Referencia cargada
//	END IF
	sle_8.SetFocus()
	sle_8.Enabled = True
	sle_4.Enabled = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	sle_4.BackColor = (65536*192+256*192+192)
	sle_4.BackColor = long(gs_gris)
// Fin. Sgo.
	sle_4.Text = ""
	sle_5.Enabled = False
	sle_5.Text = ""
	sle_6.Enabled = False
	sle_6.Text = ""
	sle_7.Enabled = False
	sle_7.Text = ""
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	sle_8.BackColor = (65536*255+256*255+255)
	sle_8.BackColor = long(gs_blanco)
// Fin. Sgo.
	st_4.Enabled = False
	st_8.Enabled = True
	
	IF sle_8.text <> "" AND sle_8.text <> " " AND NOT IsNull(sle_8.text) THEN
		st_8.TriggerEvent(doubleclicked!)
	END IF
	
END IF


end event

type st_6 from statictext within w_id0100
integer x = 1595
integer y = 912
integer width = 178
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Dup:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_id0100
integer x = 1161
integer y = 908
integer width = 178
integer height = 68
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "MANO.CUR"
long backcolor = 81324524
string text = "No.:"
boolean focusrectangle = false
end type

event doubleclicked;//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//

Long ll_num_sum
String ls_nulo

If ib_cuarto_nivel Then

	If Not IsNull(dir.gl_codcalle) AND dir.gl_codcalle <> 0 AND (dir.gl_numero = 0 OR IsNull(dir.gl_numero)) Then
		parmstr3 = sle_3.Text
		parmstr4 = dir.gs_calle
	
		Open(w_id0105)   // Elige Finca
	End If

	If Not IsNull(dir.gl_nif) AND dir.gl_nif <> 0 Then
		sle_5.Text = String(dir.gl_numero)
		sle_6.Text = dir.gs_duplic
	Else
		sle_4.Text = ""
		gu_comunic.is_comunic.longval1 = 0
		sle_5.Text = ""
		sle_6.Text = ""
		close(parent)
		Return
	End If

	If iu_gen_comunic.is_comunic.programa_llamante = "w_man_instalacion" or iu_gen_comunic.is_comunic.programa_llamante = "w_3208" OR &
	   iu_gen_comunic.is_comunic.programa_llamante = "w_3211" Then
		Close(Parent)
		Return
	End If

	If dir.gl_codcalle <> 0 AND dir.gl_numero <> 0 AND (gu_comunic.is_comunic.intval7 <> 1 OR IsNull(gu_comunic.is_comunic.intval7)) & 
		AND NOT IsNull(dir.gl_nif) AND (IsNull(dir.gl_nis) OR dir.gl_nis = 0) Then
		Open(w_id0106)  // Elige suministro
	End If

	If Not IsNull(dir.gl_nis) AND dir.gl_nis <> 0 Then
		sle_7.Text = dir.gs_pisodpto
		If tipcons = "Nis" Then
			dir.gs_esq_cond = sle_8.Text
			Close(Parent)
			Return
		Else
			Close(Parent)
			Return
		End If
	Elseif gu_comunic.is_comunic.intval7 = 1 Then
		// Estamos en un aviso de ayuda
		// Se comprueba si existe un suministro para esa finca
		SELECT COUNT("SUMCON"."NIF")
		INTO :ll_num_sum
			FROM "SUMCON","CLIENTES","CODIGOS"
			WHERE ("SUMCON"."COD_CLI" = "CLIENTES"."COD_CLI") and
					("CLIENTES"."CO_PAIS" = "CODIGOS"."COD") and
					("SUMCON"."NIF" = :dir.gl_nif);
		
		If sqlca.sqlcode <> 0 Then
			// Error al intentar traer los datos
			gnv_msg.f_mensaje("ER48","","",OK!)
			SetNull(dir.gl_nis)
		Else
			If ll_num_sum > 0 Then // Existe algun suministro
				dir.gl_nis = 1
			Else
				SetNull(dir.gl_nis)
				sle_5.Text = ""
				sle_6.Text = ""
				dir.gl_numero = 0
				dir.gs_duplic = ls_nulo
				gnv_msg.f_mensaje("ER46","","",OK!)
			End If
		End If
		Close(Parent)
		Return
	Else
		sle_5.Text = ""
		sle_6.Text = ""
		dir.gl_numero = 0
		dir.gs_duplic = ls_nulo
	End If

End If


end event

type st_7 from statictext within w_id0100
integer x = 69
integer y = 1028
integer width = 238
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "MANO.CUR"
long backcolor = 81324524
string text = "Planta:"
boolean focusrectangle = false
end type

type sle_7 from singlelineedit within w_id0100
event key_pressed pbm_char
integer x = 306
integer y = 1020
integer width = 229
integer height = 84
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

on key_pressed;//cb_2.enabled = False
//dir.gl_nis = 0 
end on

type sle_6 from singlelineedit within w_id0100
event key_pressed pbm_char
integer x = 1774
integer y = 900
integer width = 288
integer height = 84
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

on key_pressed;//cb_2.enabled = False
//dir.gl_nif = 0 
end on

type sle_5 from singlelineedit within w_id0100
event key_pressed pbm_char
integer x = 1339
integer y = 900
integer width = 224
integer height = 84
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

on key_pressed;//cb_2.enabled = False
//dir.gl_nif = 0 
end on

type sle_4 from singlelineedit within w_id0100
event key_pressed pbm_char
event ue_enter pbm_keydown
integer x = 306
integer y = 896
integer width = 837
integer height = 84
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) THEN  st_4.TriggerEvent("doubleclicked")
end event

type st_4 from statictext within w_id0100
integer x = 69
integer y = 912
integer width = 238
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Calle:"
boolean focusrectangle = false
end type

event doubleclicked;// Evento Doble click para la sle de calle
// AHM (13/05/2011) ASUR 1093853
boolean		lb_activarNumero					//Indicador de la activaci$$HEX1$$f300$$ENDHEX$$n del campo n$$HEX1$$fa00$$ENDHEX$$mero
long ll_num_sum
int cant, li_fila1, li_fila2, li_fila3
string ls_nulo, ls_calle, ls_numero, ls_duplicador, ls_piso, ls_localidad


// AHM (13/05/2011) ASUR 1093853
lb_activarNumero = FALSE
SetNull(ls_nulo)
SetPointer(HourGlass!)

li_fila1 = dw_2.Find(" UPPER(nom_depto) = '" + upper(sle_1.text) +"'",1,dw_2.RowCount())
li_fila2 = dw_3.Find(" UPPER(nom_munic) = '" + upper(sle_2.text) +"'",1,dw_3.RowCount())
li_fila3 = dw_4.Find(" UPPER(nom_local) = '" + upper(sle_3.text) +"'",1,dw_4.RowCount())

if isnull(li_fila3) or li_fila3= 0 then // Setea el codigo de localidad.
	li_fila3 = dw_4.Find(" nom_local = '" + is_localidad +"'",1,dw_4.RowCount())
	sle_3.text = is_localidad
	parmstr3 = is_localidad
	parnum5 = il_localidad
	dir.gl_codloc = il_localidad
	dir.gs_local  = is_localidad
end if

// IF li_fila1 = 0 or li_fila2 = 0 or li_fila3 = 0 then
IF (li_fila1 = 0 or li_fila2 = 0 or li_fila3 = 0) AND Not ib_cuarto_nivel then
	gnv_msg.f_mensaje("ER68","","",OK!)
	sle_1.text = ''
	sle_2.text = ''
	sle_3.text = ''
	sle_4.text = ''
	dw_2.SelectRow(0, FALSE)
	dw_3.SelectRow(0, FALSE)
	dw_4.SelectRow(0, FALSE)	
	return
END IF

iu_gen_comunic.is_comunic.strval9 = "Calle"

//**************************************************************************//
// Externalidad: Para los avisos de ayuda y alumbrado publico solo se       //
// Cumplimentara provincia, distrito, corregimiento y barrio                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//

If ib_ayuda_ap Then
	If gl_tipo_aviso = fgcdec_aviso_alumbrado_publico Or gl_tipo_aviso = fgcdec_aviso_de_ayuda Then
		
		if ib_cuarto_nivel then
			dir.gl_codprov=parnum2
			dir.gl_coddepto=parnum3
			dir.gl_codmun=parnum4
			dir.gl_codloc=parnum5
		end if
		
		gu_comunic.is_comunic.intval1 = 1
		DataStore lds_calle
		
		lds_calle = CREATE DATASTORE
		lds_calle.DataObject = 'dw_aviso_x_calle'
		lds_calle.SetTransObject(SQLCA)
		
		If lds_calle.Retrieve(dir.gl_codprov,dir.gl_coddepto,dir.gl_codmun,dir.gl_codloc) < 1 Then
			lds_calle.InsertRow(0)
			lds_calle.SetItem(1,"nom_calle","SIN/CALLE")
			lds_calle.SetItem(1,"cod_calle",1)
		End If
		
		filaselecc3 = 1
		//*******************************************************//
		// VALIDACION DEL BARRIO                                 //
		//*******************************************************//
		
/*
		sle_3.Text = lds_calle.GetItemString(1,"nom_local")
		parmstr3 = lds_calle.GetItemString(1,"nom_local")
		parmstr5 = lds_calle.GetItemNumber(1,"cod_local")
		dir.gl_codloc = parnum5
		dir.gs_local = sle_3.text
		
		
		
		dir.gl_codcalle = 0 */
		
		dir.gl_codcalle = lds_calle.GetItemNumber(1,"cod_calle")
		sle_4.Text = lds_calle.GetItemString(1,"nom_calle")
		sle_5.Text = ""
		sle_6.Text = ""
		sle_7.Text = ""
		
		dir.gl_nif = lds_calle.GetItemNumber(1,"nif")

	End If
End If

//**************************************************************************//
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//


//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//

//If fg_verifica_parametro('aviso_cuarto_nivel') Then
If ib_cuarto_nivel Then
	st_5.TextColor = RGB(128,128,128)
	st_5.Enabled = False
End If

//**************************************************************************//
//                 FIN CAMBIOS                                              //
//**************************************************************************//


//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
dir.gs_ref = fg_referencia(dir.gl_codloc, dir.gl_nif, dir.gs_ref)
//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


//Aparece una lista de ayuda

//**************************************************************************//
// Cambios Luis Eduardo Ortiz Abril 2001
//**************************************************************************//

If Not ib_cuarto_nivel Then  //**  OSGI 2001.1  	04/06/2001
	IF sle_3.text = "" THEN
		gnv_msg.f_mensaje("ER38","","",OK!)
		RETURN
	END IF
	
	IF len(sle_4.text) < 2 THEN
		//gnv_msg.f_mensaje("AR07","","",OK!) gse
	//	gnv_msg.f_mensaje("ER39","","",OK!)
		RETURN
	END IF
End If  //**  OSGI 2001.1  	04/06/2001

//**************************************************************************//
// Fin de cambios
//**************************************************************************//

parmstr1 = sle_3.text				// Localidad
parmstr2 = sle_4.text				// Calle
parmstr3 = sle_5.text				// N$$HEX1$$fa00$$ENDHEX$$mero
parmstr4 = sle_6.text				// Duplicador
parmstr5 = sle_7.text				// Piso/Depto

dir.gs_prov       = iu_gen_comunic.is_comunic.strval1 //provincia  GSE 12/06/2001
dir.gs_local 		= sle_3.text				// Localidad
dir.gs_calle 		= sle_4.text				// Calle
dir.gl_numero 		= Long(sle_5.text)	// N$$HEX1$$fa00$$ENDHEX$$mero
dir.gs_duplic 		= sle_6.text				// Duplicador
dir.gs_pisodpto	= sle_7.text				// Piso/Depto


//***********************
//**  AVISO FIJO 2000  **
//***********************
If gl_tipo_aviso <> fgcdec_aviso_alumbrado_publico And gl_tipo_aviso <> fgcdec_aviso_de_ayuda Then
//***********************
//**  AVISO FIJO 2000  **
//***********************
// En parnum5 est$$HEX2$$e1002000$$ENDHEX$$el codigo de localidad, nadie lo usa pues la ventana
// es response
	

//	IF filaselecc3 <= 0 THEN
//		parnum5 = iu_gen_comunic.is_comunic.longval5
//	END IF


	// Si se ingres$$HEX2$$f3002000$$ENDHEX$$n$$HEX1$$fa00$$ENDHEX$$mero pero no duplicador, filtro por n$$HEX1$$fa00$$ENDHEX$$mero.
	IF (parmstr3 <> '' AND NOT ISNULL(parmstr3) AND Mid(parmstr3,1,1) <> ' ') AND&
		(parmstr4 = '' OR ISNULL(parmstr4) OR parmstr4 = ' ') THEN
	
		Open(w_id01041)	//Elige calle por "Calle" y "Numero"
		W_operaciones.SetFocus()
		This.SetFocus()
		
		// AHM (13/05/2011) ASUR 1093853
		lb_activarNumero = TRUE
		
	// Si se ingres$$HEX2$$f3002000$$ENDHEX$$n$$HEX1$$fa00$$ENDHEX$$mero y duplicador pero no cgv, filtro por n$$HEX1$$fa00$$ENDHEX$$mero
	// y duplicador.
	ELSEIF (parmstr3 <> '' AND NOT ISNULL(parmstr3) AND Mid(parmstr3,1,1) <> ' ') AND&
	 		 (parmstr4 <> '' AND NOT ISNULL(parmstr4) AND parmstr4 <> ' ') AND&			
		 	 (parmstr5 = '' OR ISNULL(parmstr5) OR parmstr5 = ' ') THEN			
	   
		Open(w_id01041)	// Elige calle por "Calle", "Numero y "Duplicador"
		W_operaciones.SetFocus()
		This.SetFocus()
		
		// AHM (13/05/2011) ASUR 1093853
		lb_activarNumero = TRUE
		
//		IF Not IsNull(dir.gl_codcalle) THEN
//			sle_3.Text = ""
//		END IF
	   
	// Si se ingres$$HEX2$$f3002000$$ENDHEX$$n$$HEX1$$fa00$$ENDHEX$$mero, duplicador y cgv, filtro por los tres.
	//ELSEIF (parmstr3 <> '' AND NOT ISNULL(parmstr3) AND parmstr3 = ' ') AND&
	//		 (parmstr4 <> '' AND NOT ISNULL(parmstr4) AND parmstr4 <> ' ') AND&
	//		 (parmstr5 <> '' AND NOT ISNULL(parmstr5) AND parmstr5 <> ' ') THEN			
	//
	//	Open(w_id01042)	// Elige calle por "Calle", "Numero, "Duplicador" y
								// "CGV"
	ELSE
	
		Open(w_id0104)		// Elige calle unicamente por "Calle"
		W_operaciones.SetFocus()
		This.SetFocus()
	END IF

	IF Not IsNull(dir.gl_codcalle) THEN
		sle_4.text = dir.gs_calle
		parmstr6 = dir.gs_calle
		iu_gen_comunic.is_comunic.longval1 = dir.gl_codcalle //gse
		//****************
		//**  LOC 2001  **
		//****************
		If ib_cuarto_nivel Then
			// AHM (13/05/2011) ASUR 1093853
			If IsNull(sle_3.Text) Or sle_3.Text = " " Or sle_3.Text = "" OR (lb_activarNumero) Then
				FilaSelecc3 = dw_4.Find("cod_local=" + String(parnum5) , 1, dw_4.RowCount())
				IF ((parmstr3 <> '' AND NOT ISNULL(parmstr3) AND Mid(parmstr3,1,1) <> ' ') AND &
					(parmstr4 = '' OR ISNULL(parmstr4) OR parmstr4 = ' ')) Then
					setNull(sle_5.Text)
				END IF
				If FilaSelecc3 > 0 Then
					If ib_cuarto_nivel Then
						st_5.TextColor = RGB(128, 0, 0)		//**  LOC 2001
						st_5.Enabled = True		//**  LOC 2001
					End If
					
					dw_4.ScrollToRow(FilaSelecc3)
					dw_4.SelectRow(FilaSelecc3, TRUE)
					sle_3.text = dw_4.GetItemString(filaselecc3,"nom_local")
					parmstr3 = dw_4.GetItemString(filaselecc3,"nom_local")
					dir.gl_codloc = parnum5	
					dir.gs_local  = sle_3.text
				Else
					If ib_cuarto_nivel Then
						st_5.TextColor = RGB(128, 0, 0)		//**  LOC 2001
						st_5.Enabled = True		//**  LOC 2001
					End If
					
					Return
				End If
			End If
		End If
		//****************
		//**  LOC 2001  **
		//****************

	ELSE
		iu_gen_comunic.is_comunic.longval1 = 0 //gse
		sle_4.text = ""
		parmstr6=""
	//	close(parent)
		RETURN
	END IF

	IF (IsNull(parmstr3) OR parmstr3 = "") AND sle_5.Visible THEN
		//****************
		//**  LOC 2001  **
		//****************
		If ib_cuarto_nivel Then
			st_5.TextColor = RGB(128, 0, 0)		//**  LOC 2001
			st_5.Enabled = True		//**  LOC 2001
		End If
		//****************
		//**  LOC 2001  **
		//****************
		sle_5.text = ""
		sle_6.text = ""
	END IF

	IF iu_gen_comunic.is_comunic.programa_llamante = "w_3111_mante_aco" THEN
		Close(Parent)
		RETURN
	END IF

//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//

//	If Not fg_verifica_parametro('aviso_cuarto_nivel') Then
	If Not ib_cuarto_nivel Then

		IF Not IsNull(dir.gl_codcalle) AND dir.gl_codcalle <> 0  AND (dir.gl_numero = 0 OR IsNull(dir.gl_numero)) THEN	
			parmstr3 = sle_3.text	
			parmstr4 = dir.gs_calle					//sle_4.text
			Open(w_id0105)  	//Elige finca
			W_operaciones.SetFocus()
			This.SetFocus()
		END IF

		IF Not IsNull(dir.gl_nif) AND dir.gl_nif <> 0 THEN
			sle_5.text = string(dir.gl_numero)
			sle_6.text = dir.gs_duplic 
		ELSE
			sle_4.text = ""
			iu_gen_comunic.is_comunic.longval1 = 0 //gse
			sle_5.text = ""
			sle_6.text = ""
			return
		END IF

		IF  dir.gl_codcalle <> 0 AND dir.gl_numero <> 0 AND gu_comunic.is_comunic.intval7 <> 1 AND &
				NOT IsNull(dir.gl_nif) AND (IsNull(dir.gl_nis) OR dir.gl_nis = 0) THEN
			Open(w_id0106)  	//Elige suministro
		END IF

		IF Not IsNull(dir.gl_nis) AND dir.gl_nis <> 0 THEN
			sle_7.text = dir.gs_pisodpto
			IF tipcons = "Nis"	THEN
				dir.gs_esq_cond = sle_8.text
				Close(Parent)	
				Return
			ELSE	
				Close(Parent)	
				Return
			END IF	
		ELSEIF 	gu_comunic.is_comunic.intval7 = 1 THEN
			// estamos en un aviso de ayuda
			// Se comprueba si existe un suministro para esa finca
			SELECT COUNT ("SUMCON"."NIF")   
			INTO :ll_num_sum
			FROM "SUMCON", "CLIENTES", "CODIGOS"  
		   WHERE ( "SUMCON"."COD_CLI" = "CLIENTES"."COD_CLI" ) and  
		         ( "CLIENTES"."CO_PAIS" = "CODIGOS"."COD" ) and  
		         ( "SUMCON"."NIF" = :dir.gl_nif ) ;   

			IF SQLCA.SqlCode <> 0 THEN  
				// error al intentar traer los datos
				gnv_msg.f_mensaje("ER48","","",OK!)
				SetNull(dir.gl_nis)
			ELSE
				IF ll_num_sum > 0 THEN  // existe alg$$HEX1$$fa00$$ENDHEX$$n suministro
					dir.gl_nis = 1
				ELSE
					SetNull(dir.gl_nis)
					sle_4.text = ""
					sle_5.text = ""
					sle_6.text = ""
					dir.gl_numero = 0
					dir.gs_duplic = ls_nulo
					IF gu_comunic.is_comunic.programa_llamante <> 'w_3211' THEN
						gnv_msg.f_mensaje("ER46","","",OK!)
						//Error para el n$$HEX2$$ba002000$$ENDHEX$$de puerta seleccionado no existe ningun suministro
					END IF
				END IF
			END IF
			Close(Parent)	
			Return
		ELSE
			sle_5.text = ""
			sle_6.text = ""
			dir.gl_numero = 0
			dir.gs_duplic = ls_nulo
		END IF
	End If
	
//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//

ELSE
//***********************
//**  AVISO FIJO 2000  **
//***********************
	sle_4.text = dir.gs_calle
	parmstr6 = dir.gs_calle
	iu_gen_comunic.is_comunic.longval1 = dir.gl_codcalle //gse
	
	
	parmstr3 = sle_3.text	
	parmstr4 = dir.gs_calle					//sle_4.text
	
	
	sle_5.text = string(dir.gl_numero)
	sle_6.text = dir.gs_duplic 
	
	
	sle_7.text = dir.gs_pisodpto
	
	dir.gl_nis = 1
	Close(Parent)	
	Return
//***********************
//**  AVISO FIJO 2000  **
//***********************
END IF
//***********************
//**  AVISO FIJO 2000  **
//***********************

IF iu_gen_comunic.is_comunic.programa_llamante = "w_man_instalacion" THEN
	Close(Parent)
	RETURN
END IF
end event

type sle_3 from singlelineedit within w_id0100
event key_pressed pbm_char
event busqueda pbm_custom01
integer x = 1440
integer y = 228
integer width = 672
integer height = 84
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

on key_pressed;this.postEvent("busqueda")
end on

event busqueda;// Script for Busqueda event

long		found_row

//cb_2.Enabled = False

if Len(this.text) > 0 then							// Search
	found_row = dw_4.Find("#2 >=~"" + this.text + "~"",1, 99999)
	if found_row > 0 then
		// Recupera el codigo de localidad si no se ha clickeado sobre el campo FDO
		is_localidad=dw_4.object.nom_local[found_row]
		il_localidad = dw_4.object.cod_local[found_row]
		// Fin de recupera el c$$HEX1$$f300$$ENDHEX$$digo de localidad.
		dw_4.ScrollToRow(found_row)
		dw_4.SetRedraw(FALSE)
		dw_4.SelectRow(filaselecc3, FALSE)
		dw_4.SelectRow(found_row, TRUE)
		dw_4.SetRedraw(TRUE)
	else	// Filter function did not find any matching row
	   Beep(1)
		dw_4.SelectRow(filaselecc3, FALSE)
		message.processed = true
		end if
else		// Filter length is 0, so unhighlight former selected row
	dw_4.SelectRow(filaselecc3, FALSE)
end if	

filaselecc3 = found_row				// Remember number of highlighted row

end event

event modified;if keydown(KeyEnter!) or KeyDown(KeyTab!) then 
	dw_4.triggerevent(clicked!)
end if
end event

type sle_2 from singlelineedit within w_id0100
event key_pressed pbm_char
event busqueda pbm_custom01
integer x = 736
integer y = 228
integer width = 672
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

on key_pressed;this.Postevent("busqueda")
end on

event busqueda;// Script for Busqueda event

long		found_row

//cb_2.Enabled = False

if Len(this.text) > 0 then							// Search
	found_row = dw_3.Find("#2 >=~"" + this.text + "~"",1, 99999)
	if found_row > 0 then 
		dw_3.ScrollToRow(found_row)
		dw_3.SetRedraw(FALSE)
		dw_3.SelectRow(filaselecc2, FALSE)
		dw_3.SelectRow(found_row, TRUE)
		dw_3.SetRedraw(TRUE)
	else	// Filter function did not find any matching row
	   Beep(1)
		dw_3.SelectRow(filaselecc2, FALSE)
		message.processed = true
		end if
else		// Filter length is 0, so unhighlight former selected row
	dw_3.SelectRow(filaselecc2, FALSE)
end if	

filaselecc2 = found_row				// Remember number of highlighted row

end event

event modified;if keydown(KeyEnter!) or KeyDown(KeyTab!) then 
	dw_3.triggerevent(clicked!)
end if
end event

type sle_1 from singlelineedit within w_id0100
event key_pressed pbm_char
event busqueda pbm_custom01
integer x = 27
integer y = 232
integer width = 672
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event key_pressed;
this.PostEvent("busqueda")

end event

event busqueda;// Script for Busqueda event

long		found_row

//cb_2.Enabled = False

if Len(this.text) > 0 then							// Search
	found_row = dw_2.Find("#2 >=~"" + this.text + "~"",1, 99999)
	if found_row > 0 then 
		
		dw_2.ScrollToRow(found_row)
		dw_2.SetRedraw(FALSE)
		dw_2.SelectRow(FilaSelecc1, FALSE)
		dw_2.SelectRow(found_row, TRUE)
		dw_2.SetRedraw(TRUE)
		filaSelecc1=found_row
else	// Filter function did not find any matching row
	   Beep(1)
		dw_2.SelectRow(FilaSelecc1, FALSE)
		message.processed = true
		end if
else		// Filter length is 0, so unhighlight former selected row
	dw_2.SelectRow(FilaSelecc1, FALSE)
end if	

FilaSelecc1 = found_row				// Remember number of highlighted row

end event

event modified;if keydown(KeyEnter!) or KeyDown(KeyTab!) then 
	dw_2.triggerevent(clicked!)
end if
end event

type st_3 from statictext within w_id0100
integer x = 1440
integer y = 148
integer width = 672
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Localidad / Barrio"
boolean focusrectangle = false
end type

type dw_4 from datawindow within w_id0100
integer x = 1440
integer y = 340
integer width = 672
integer height = 500
integer taborder = 70
string dataobject = "d_id0103"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieveend;dir.gl_codcalle = 0		//Vuelve a empezar
end event

event clicked;// Clicked Script para dw
string ls_provincia, ls_departamento, ls_municipio
int li_provincia, li_departamento, li_municipio

//IF tipcons <> "Ent Geo" THEN	cb_2.enabled = False
this.SelectRow(FilaSelecc3, FALSE)	// Se deselecciona la fila
if not IsNull(row) then 	FilaSelecc3 = row	

IF FilaSelecc3 > 0 THEN 
	this.SelectRow(FilaSelecc3, TRUE)		
	sle_3.text = this.GetItemString(filaselecc3,"nom_local")
	parmstr3 = this.GetItemString(filaselecc3,"nom_local")
	parnum5 = this.GetItemNumber(filaselecc3,"cod_local")	
	dir.gl_codloc = parnum5	
	dir.gs_local  = sle_3.text
	dir.gl_codcalle = 0 
	sle_4.text = ""
	sle_5.text = ""
	sle_6.text = ""
	sle_7.text = ""
	// GNU 26-4-2006. Mejora 1/327511
	if cbx_1.checked then
		select cod_prov, cod_depto, cod_munic
		into :li_provincia, :li_departamento, :li_municipio
		from localidades
		where cod_local= :parnum5;
		
		select nom_prov
		into :ls_provincia
		from provincias
		where cod_prov= :li_provincia;
		
		select nom_depto
		into :ls_departamento
		from deptos
		where cod_depto= :li_departamento;
		
		select nom_munic
		into :ls_municipio
		from municipios
		where cod_munic= :li_municipio;
		
		parnum4= li_municipio
		parnum3= li_departamento
		parnum2= li_provincia
		dir.gl_codmun=parnum4
		dir.gs_munic=ls_municipio
		dir.gl_coddepto=parnum3
		dir.gs_depto=ls_departamento
		dir.gl_codprov=parnum2
		dir.gs_prov=ls_provincia
		sle_2.text= ls_municipio
		sle_1.text= ls_departamento
		dw_1.SetItem(1,"cod_prov",parnum2)
		dw_2.SetItem(1, "nom_depto", wordcap(ls_departamento))
		dw_3.SetItem(1, "nom_munic", wordcap(ls_municipio))
	end if
	// FIN GNU
END IF

//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//
If ib_cuarto_nivel Then
	st_4.TextColor = RGB(128,0,0) // GNU 26-4-2006. Mejora 1/327511
	st_5.TextColor = RGB(128,128,128)
	st_4.Enabled = true // GNU 26-4-2006. Mejora 1/327511
	st_5.Enabled = False
End If
//**************************************************************************//
//                 FIN DE CAMBIOS                                           //
//**************************************************************************//

end event

event doubleclicked;//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//
If gl_tipo_aviso = fgcdec_aviso_alumbrado_publico Or gl_tipo_aviso = fgcdec_aviso_de_ayuda Then
	st_4.TriggerEvent(DoubleClicked!)
End If
//**************************************************************************//
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//
end event

type dw_3 from datawindow within w_id0100
integer x = 736
integer y = 340
integer width = 672
integer height = 500
integer taborder = 50
string dataobject = "d_id0102"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieveend;dw_4.Reset()
parnum5 = 0
end event

event clicked;// Clicked Script para dw

//IF tipcons <> "Ent Geo" THEN cb_2.enabled = False
this.SelectRow(FilaSelecc2, FALSE)	// Se deselecciona la fila

if not IsNull(row) then 	FilaSelecc2 = row	



IF FilaSelecc2 > 0 THEN 
		this.SelectRow(FilaSelecc2, TRUE)	
		parnum4 = this.GetItemNumber(filaselecc2,"cod_munic")
		parnum5 = 0	
		dw_4.Retrieve(parnum4)
		sle_2.text = this.GetItemString(filaselecc2,"nom_munic")
		dir.gl_codmun = parnum4
		dir.gs_munic = sle_2.text
		sle_3.text = ""
		sle_4.text = ""
		sle_5.text = ""
		sle_6.text = ""
		sle_7.text = ""
END IF

//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//
If ib_cuarto_nivel Then
	st_4.TextColor = RGB(128,0,0)
	st_5.TextColor = RGB(128,128,128)
	st_4.Enabled = True
	st_5.Enabled = False
End If
//**************************************************************************//
//                  FIN DE CAMBIOS                                          //
//**************************************************************************//

end event

type st_2 from statictext within w_id0100
integer x = 736
integer y = 148
integer width = 672
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Municipio"
boolean focusrectangle = false
end type

type st_1 from statictext within w_id0100
integer x = 27
integer y = 148
integer width = 672
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Departamento"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_id0100
integer x = 384
integer y = 28
integer width = 823
integer height = 92
integer taborder = 10
string dataobject = "d_id0100_prov"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//IF tipcons <> "Ent Geo" THEN cb_2.enabled = False
int li_provincia

il_provincia = long(this.GetText())
//parnum2 	= long(this.Gettext())
//parnum3	= 0
//parnum4	= 0
//parnum5	= 0
//
sle_1.text = ""
sle_2.text = ""
sle_3.text = ""

iu_gen_comunic.is_comunic.intval1 = il_provincia
iu_gen_comunic.is_comunic.strval1 = dddw.GetItemString(dddw.GetRow(),2)
//dir.gl_codprov = li_provincia
//Para inicializar los datos si me salgo sin seleccionar muni, loc, depto
iu_gen_comunic.is_comunic.longval1 = 0
is_prov = dddw.GetItemString(dddw.GetRow(),2)

dw_2.Retrieve(il_provincia)
parnum2 	= il_provincia
dir.gl_codprov = il_provincia
dir.gs_prov = is_prov

IF gu_comunic.is_comunic.intval1 = 0 OR IsNull(gu_comunic.is_comunic.intval1) THEN
	gu_comunic.is_comunic.intval1 = il_provincia
END IF

//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//
If ib_cuarto_nivel Then
	st_4.TextColor = RGB(128,128,128)
	st_5.TextColor = RGB(128,128,128)
	st_4.Enabled = False
	st_5.Enabled = False
End If
//**************************************************************************//
//                 FIN DE CAMBIOS                                           //
//**************************************************************************//

end event

type dw_2 from datawindow within w_id0100
integer x = 32
integer y = 344
integer width = 672
integer height = 500
integer taborder = 30
string dataobject = "d_id0101"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;// Clicked Script para dw

//IF tipcons <> "Ent Geo" THEN cb_2.enabled = False
this.SelectRow(FilaSelecc1, FALSE)	// Se deselecciona la fila
if not IsNull(row) then 	FilaSelecc1 = row	



IF FilaSelecc1 > 0 THEN 
		this.SelectRow(FilaSelecc1, TRUE)		
		parnum3 = this.GetItemNumber(filaselecc1,"cod_depto")
		parnum4 = 0
		parnum5 = 0
		dw_3.Retrieve(parnum3)
		sle_1.text = this.GetItemString(filaselecc1,"nom_depto")
		dir.gl_coddepto = parnum3
		dir.gs_depto = sle_1.text
		sle_2.text = ""
		sle_3.text = ""
		sle_4.text = ""
		sle_5.text = ""
		sle_6.text = ""
		sle_7.text = ""
END IF

//**************************************************************************//
//                 CAMBIOS RECUPERACION DE CLIENTES SIN ESPECIFICAR         //
//                 CUARTO NIVEL DE IDENTIFICACION GEOGR$$HEX1$$c000$$ENDHEX$$FICA                //
//                 LUIS EDUARDO ORTIZ ABRIL/2001                            //
//**************************************************************************//
If ib_cuarto_nivel Then
	st_4.TextColor = RGB(128,128,128)
	st_5.TextColor = RGB(128,128,128)
	st_4.Enabled = False
	st_5.Enabled = False
End If
//**************************************************************************//
//                 FIN DE CAMBIOS                                           //
//**************************************************************************//

end event

event retrieveend;dw_3.reset()
dw_4.reset()
//parnum4 = 0 
//parnum5 = 0
end event

type sle_8 from singlelineedit within w_id0100
event ue_enter pbm_keydown
integer x = 997
integer y = 1020
integer width = 1070
integer height = 84
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
textcase textcase = upper!
integer limit = 60
borderstyle borderstyle = stylelowered!
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) THEN  st_8.TriggerEvent("doubleclicked")
end event

type st_8 from statictext within w_id0100
integer x = 613
integer y = 1028
integer width = 384
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Referencia:"
boolean focusrectangle = false
end type

event doubleclicked;////////////////////////////////////////////////////////////////////////
// Evento Doble click para la sle de calle
////////////////////////////////////////////////////////////////////////
int cant

SetPointer(HourGlass!)

iu_gen_comunic.is_comunic.strval9 = "Referencia"

//Aparece una lista de ayuda

IF sle_3.text = "" THEN
	gnv_msg.f_mensaje("ER38","","",OK!)
	RETURN
END IF

parmstr1 = sle_3.text				// Localidad
parmstr2 = sle_8.text				// Referencia

//parmstr3 = sle_5.text				// N$$HEX1$$fa00$$ENDHEX$$mero
//parmstr4 = sle_6.text				// Duplicador
//parmstr5 = sle_7.text				// Piso/Depto

dir.gs_local 		= sle_3.text				// Localidad
dir.gs_ref  		= sle_8.text				// Referencia

//dir.gi_numero 		= Integer(sle_5.text)	// N$$HEX1$$fa00$$ENDHEX$$mero
//dir.gs_duplic 		= sle_6.text				// Duplicador
//dir.gs_pisodpto	= sle_7.text				// Piso/Depto

// En parnum5 est$$HEX2$$e1002000$$ENDHEX$$el codigo de localidad, nadie lo usa pues la ventana
// es "response".
IF filaselecc3 <= 0 THEN
	parnum5 = iu_gen_comunic.is_comunic.longval5
END IF

// Accedo a la ventana de selecci$$HEX1$$f300$$ENDHEX$$n de 'Referencia'.
Open(w_id0104_ref)
W_operaciones.SetFocus()
This.SetFocus()

IF Not IsNull(dir.gl_codcalle) THEN
//	sle_8.text = dir.gs_calle
   sle_8.text = dir.gs_ref
	sle_4.text = dir.gs_calle
	parmstr6 = dir.gs_calle //Mato-->(Avisos Inc. 15)
	iu_gen_comunic.is_comunic.longval1 = dir.gl_codcalle //gse
ELSE
	iu_gen_comunic.is_comunic.longval1 = 0 //
	sle_8.text = ""
	parmstr6 = "" //Mato-->(Avisos Inc. 15)
	//close(parent)
	RETURN
END IF

//Close(Parent)


IF (IsNull(parmstr3) OR parmstr3 = "") AND sle_5.Visible THEN
	sle_5.text = ""
	sle_6.text = ""
END IF

IF iu_gen_comunic.is_comunic.programa_llamante = "w_3111_mante_aco" THEN
	Close(Parent)
	RETURN
END IF


IF Not IsNull(dir.gl_codcalle) AND dir.gl_codcalle <> 0  AND (dir.gl_numero = 0 OR IsNull(dir.gl_numero)) THEN	
	parmstr3 = sle_3.text	
	parmstr4 = dir.gs_calle					//sle_8.text

	Open(w_id0105)  	//Elige finca
	W_operaciones.SetFocus()
	This.SetFocus()
END IF

IF Not IsNull(dir.gl_nif) AND dir.gl_nif <> 0 THEN
	sle_5.text = string(dir.gl_numero)
	sle_6.text = dir.gs_duplic 
ELSE
	sle_8.text = ""
	iu_gen_comunic.is_comunic.longval1 = 0 //gse
	sle_5.text = ""
	sle_6.text = ""
	//close(parent)
	return
END IF


IF iu_gen_comunic.is_comunic.programa_llamante = "w_3208"  OR iu_gen_comunic.is_comunic.programa_llamante = "w_3211" &
   OR iu_gen_comunic.is_comunic.programa_llamante = "w_man_instalacion" THEN
	Close(Parent)
	RETURN
END IF

// Fuerzo el acceso a la ventana de selecci$$HEX1$$f300$$ENDHEX$$n
// del cliente para aprovechar su l$$HEX1$$f300$$ENDHEX$$gica ya probada.
dir.gl_nis = 0						

IF dir.gl_codcalle <> 0 AND dir.gl_numero <> 0 AND NOT IsNull(dir.gl_nif) & 
        AND (IsNull(dir.gl_nis) OR dir.gl_nis = 0) THEN
	Open(w_id0106)  //Elige suministro
	W_operaciones.SetFocus()
	This.SetFocus()
	//Mato
	if IsNull(dir.gl_nis) then //and IsNull(parmstr3) and IsNull(parmstr4) then
		sle_4.text = ""
		sle_5.text = ""
		sle_6.text = ""
		sle_7.text = ""
		sle_8.text = ""
	end if	
END IF

IF Not IsNull(dir.gl_nis) AND dir.gl_nis <> 0 THEN
	sle_7.text = dir.gs_pisodpto
//	IF tipcons = "Nis"	THEN
//		dir.gs_esq_cond = sle_8.text
		Close(Parent)	
//	END IF	
END IF

end event

type ln_1 from line within w_id0100
long linecolor = 8421504
integer linethickness = 4
integer beginx = 41
integer beginy = 868
integer endx = 2103
integer endy = 868
end type

type ln_2 from line within w_id0100
long linecolor = 8421504
integer linethickness = 4
integer beginx = 41
integer beginy = 1140
integer endx = 2112
integer endy = 1140
end type

type ln_3 from line within w_id0100
long linecolor = 8421504
integer linethickness = 4
integer beginx = 37
integer beginy = 868
integer endx = 37
integer endy = 1144
end type

type ln_4 from line within w_id0100
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2107
integer beginy = 864
integer endx = 2107
integer endy = 1140
end type

type ln_5 from line within w_id0100
long linecolor = 16777215
integer linethickness = 4
integer beginx = 37
integer beginy = 1136
integer endx = 2107
integer endy = 1136
end type

type ln_6 from line within w_id0100
long linecolor = 16777215
integer linethickness = 4
integer beginx = 32
integer beginy = 864
integer endx = 32
integer endy = 1140
end type

type ln_7 from line within w_id0100
long linecolor = 16777215
integer linethickness = 4
integer beginx = 32
integer beginy = 864
integer endx = 2098
integer endy = 864
end type

type ln_8 from line within w_id0100
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2103
integer beginy = 864
integer endx = 2103
integer endy = 1140
end type

type st_prov from statictext within w_id0100
integer x = 27
integer y = 36
integer width = 471
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Provincia"
boolean focusrectangle = false
end type

type cbx_1 from checkbox within w_id0100
integer x = 1435
integer y = 76
integer width = 722
integer height = 76
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Buscar por Localidad"
end type

event clicked;// GNU 25-4-2006. Mejora 1/ 327511
string ls_select

if this.checked then
	dw_4.reset()
	dw_4.dataobject='d_id0103_a'
	dw_4.settransobject(sqlca)
	dw_4.insertrow(0)
	dw_4.Retrieve()
	dw_1.Enabled=False
	dw_2.Enabled=False
	dw_3.Enabled=False
	sle_1.Enabled=False
	sle_2.Enabled=False
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
	dw_1.InsertRow(0)
	dw_2.InsertRow(0)
	dw_3.InsertRow(0)
	sle_1.text=''
	sle_2.text=''
	sle_3.text=''
	sle_4.text = ""
	sle_5.text = ""
	sle_6.text = ""
	sle_7.text = ""
	if ib_cuarto_nivel then
		st_4.TextColor = RGB(128,128,128)
		st_5.TextColor = RGB(128,128,128)
		st_4.enabled= false
		st_5.enabled= false
	end if
else
	dw_4.dataobject='d_id0103'
//	dw_4.settransobject(sqlca)
//	dw_4.insertrow(0)
	dw_1.Enabled=True
	dw_2.Enabled=True
	dw_3.Enabled=True
	sle_1.Enabled=True
	sle_2.Enabled=True
	dw_1.reset()
	dw_2.reset()
	dw_3.reset()
	dw_4.reset()
	dw_1.InsertRow(0)
	sle_1.text=''
	sle_2.text=''
	sle_3.text=''
	sle_4.text = ""
	sle_5.text = ""
	sle_6.text = ""
	sle_7.text = ""
	parent.triggerevent('open')

end if

			
end event


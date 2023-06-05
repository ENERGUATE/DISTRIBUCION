HA$PBExportHeader$w_6204_ingreso_brigadistas.srw
$PBExportComments$Ventana usada para el ingreso o consulta de los datos de un brigadista
forward
global type w_6204_ingreso_brigadistas from w_sgigenerica
end type
type dw_datos_brigadista from u_bri_2015_pr_ingreso_brigadistas within w_6204_ingreso_brigadistas
end type
type cb_aceptar from u_cb within w_6204_ingreso_brigadistas
end type
type cb_cancelar from u_cb within w_6204_ingreso_brigadistas
end type
type dw_ambito_brigadista from u_bri_2016_pr_ambito_brigadistas within w_6204_ingreso_brigadistas
end type
type cb_1 from commandbutton within w_6204_ingreso_brigadistas
end type
type dw_1 from datawindow within w_6204_ingreso_brigadistas
end type
end forward

global type w_6204_ingreso_brigadistas from w_sgigenerica
int X=466
int Y=652
int Width=2725
int Height=1096
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Modificaci$$HEX1$$f300$$ENDHEX$$n e Ingreso de Brigadistas"
long BackColor=79741120
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
string Icon="brigadista.ico"
event ue_retrieve pbm_custom21
dw_datos_brigadista dw_datos_brigadista
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_ambito_brigadista dw_ambito_brigadista
cb_1 cb_1
dw_1 dw_1
end type
global w_6204_ingreso_brigadistas w_6204_ingreso_brigadistas

type variables
u_generico_comunicaciones lu_comunic
u_bri_2015_nu_ingreso_brigadistas iu_bri_2015_nu
u_bri_2015_rn_ingreso_brigadistas iu_bri_2015_rn
u_bri_2015_pr_ingreso_brigadistas iu_bri_2015_pr
u_cli_2001_pr_cliente_std iu_cli_2001_pr

boolean ib_valido
string is_columna, is_modstring

integer ii_fila_seleccionada
end variables

forward prototypes
public subroutine f_crear_objetos ()
public subroutine f_destruir_objetos ()
public subroutine fw_editar_campos (datawindow pdw_datos)
public function integer fw_comprobar_repetidos ()
end prototypes

public subroutine f_crear_objetos ();lu_comunic = CREATE u_generico_comunicaciones
iu_bri_2015_nu = CREATE u_bri_2015_nu_ingreso_brigadistas
iu_bri_2015_rn = CREATE u_bri_2015_rn_ingreso_brigadistas
iu_cli_2001_pr = CREATE u_cli_2001_pr_cliente_std

end subroutine

public subroutine f_destruir_objetos ();DESTROY lu_comunic
DESTROY iu_bri_2015_nu
DESTROY iu_bri_2015_rn
DESTROY iu_cli_2001_pr
end subroutine

public subroutine fw_editar_campos (datawindow pdw_datos);string ls_centro, ls_cmd, ls_mesa, ls_profesion, ls_empresa
string ls_documento, ls_pais, ls_codigo, ls_tipo
int li_empresa, li_profesion

SELECT  nvl(NOM_CENTRO,'')
INTO :ls_centro
FROM  SGD_CENTRO
WHERE ( NRO_CENTRO = :gu_comunic.is_comunic.intval1) AND 
	   ( TIP_CENTRO  = 1   );
         
SELECT nvl(NOM_CENTRO, '')
INTO :ls_cmd
FROM SGD_CENTRO
WHERE ( NRO_CENTRO = :gu_comunic.is_comunic.intval2) AND
      ( TIP_CENTRO = 2   ) ;
		 
SELECT  nvl(NOM_CENTRO,'')
INTO :ls_mesa
FROM SGD_CENTRO  
WHERE ( TIP_CENTRO = 3   ) AND    
      ( NRO_CENTRO = :gu_comunic.is_comunic.intval3)  ;	
		
ls_codigo = pdw_datos.GetItemString(1,'co_pais')
SELECT "CODIGOS"."DESC_COD"
INTO :ls_pais
FROM "CODIGOS" 
WHERE "CODIGOS"."COD" = :ls_codigo ;

ls_tipo = pdw_datos.GetItemString(1,'tip_doc')
SELECT  "TIPOS"."DESC_TIPO"  
INTO :ls_documento
FROM "TIPOS"  
WHERE "TIPOS"."TIPO" = :ls_tipo  ;

li_profesion = dw_datos_brigadista.GetItemNumber(1,'cod_profesion')
SELECT "SGD_VALOR"."DESCRIPCION"
INTO :ls_profesion
FROM "SGD_VALOR"  
WHERE ("SGD_VALOR"."CODIF" = 'PROF' ) AND  
      ("SGD_VALOR"."CODIGO" = :li_profesion )    ;
			
li_empresa = dw_datos_brigadista.GetItemNumber(1,'nro_contrata')			
SELECT "SGD_VALOR"."DESCRIPCION"  
INTO :ls_empresa
FROM "SGD_VALOR"  
WHERE ("SGD_VALOR"."CODIF" = 'EMPR' ) AND  
      ("SGD_VALOR"."CODIGO" = :li_empresa )    		;
		
IF dw_datos_brigadista.GetItemNumber(1,'ind_disponible') = 0 THEN
	dw_1.Modify("disponible_t.Text='No Disponible'")
ELSE
	dw_1.Modify("disponible_t.Text='Disponible'")
END IF

dw_1.Modify("tip_doc_t.text = '" + ls_documento + "'")
dw_1.Modify("co_pais_t.text ='" + ls_pais + "'")		

if ls_centro <> '' then
	dw_1.modify("centro_t.text = '" + ls_centro + "'")
end if

if ls_cmd <> '' then
	dw_1.modify("cmd_t.text = '" + ls_cmd + "'")
end if

if ls_cmd <> '' then
	dw_1.modify("puesto_t.text = '" + ls_mesa + "'")
end if

dw_1.modify("profesion_t.text = '" + ls_profesion + "'")
dw_1.modify("empresa_t.text = '" + ls_empresa + "'")
dw_1.modify("nom_cmd_t.Text = '" +dw_ambito_brigadista.Describe("nro_cmd_t.Text") + "'")
end subroutine

public function integer fw_comprobar_repetidos ();string ls_tip, ls_doc
int li_nro, li_return

ls_tip = dw_datos_brigadista.GetItemString(1,"tip_doc")
ls_doc = dw_datos_brigadista.GetItemString(1,"doc_id")

SELECT "GI_BRIGADISTA"."NRO_BRIGADISTAS"
INTO  :li_nro
FROM "GI_BRIGADISTA"
WHERE "GI_BRIGADISTA"."TIP_DOC" = :ls_tip AND
		"GI_BRIGADISTA"."DOC_ID" = :ls_doc;
		
IF SQLCA.SQLCODE = 0 THEN
	li_return = 1
ELSE
	li_return = 0
END IF

RETURN li_return
end function

event open;call super::open;long ll_nro_brigadista 
int li_hora
int li_centro,li_cmd,li_mesa
int li_devuelto
//Creo objetos de Trabajo
This.f_crear_objetos()

//Recibo parametros de entrada
lu_comunic.is_comunic = gu_comunic.is_comunic
lu_comunic.is_comunic.accion_retorno="No refrescar"

ib_valido = TRUE
cb_aceptar.enabled = True

//////////////////////////////
//Inicializo objetos de trabajo
dw_datos_brigadista.SetTransObject(SQLCA)
dw_ambito_brigadista.SetTransObject(SQLCA)
//Mato--<Volcado datos para seleccionar el ambito
dw_ambito_brigadista.AcceptText()

li_centro=gu_comunic.is_comunic.intval1
li_cmd=gu_comunic.is_comunic.intval2
li_mesa=gu_comunic.is_comunic.intval3

//dddw Centro
dw_ambito_brigadista.fnu_cargo_dddw_centro()
dw_ambito_brigadista.object.nro_centro[1]=li_centro
//dddw Cmd
dw_ambito_brigadista.fnu_cargo_dddw_cmd()
dw_ambito_brigadista.object.nro_cmd[1]=li_cmd
//dddw Mesa
//Filtramos el puesto por el nro. del Cmd obtenido
if dw_ambito_brigadista.fnu_filtro_por_cmd(li_cmd)= 0 then 
  
  dw_ambito_brigadista.object.nro_mesa[1]=li_mesa

end if



///////////////////////////
CHOOSE CASE lu_comunic.is_comunic.accion_llamada
	CASE "Alta"
		This.title = gu_comunic.f_titulo_ventana("w_6204","alta")
		iu_cli_2001_pr.fpr_conectar(dw_datos_brigadista)
		dw_datos_brigadista.InsertRow(0)
		ll_nro_brigadista = iu_bri_2015_nu.fnu_actualiza_nro_brigadista()
		dw_datos_brigadista.Setitem(1,"nro_brigadistas",ll_nro_brigadista)
		dw_datos_brigadista.Setitem(1,"ind_disponible",1)
		dw_datos_brigadista.Setitem(1,"usuario",1)
		// Rutina para calcular la hora
		li_hora=hour(now())
//		if li_hora >= 0 and li_hora < 8 then
//				dw_datos_brigadista.Setitem(1,"pi_turno",1)
//		elseif li_hora >= 8 and li_hora< 16 then
//				dw_datos_brigadista.Setitem(1,"pi_turno",2)
//		elseif li_hora >=16 and li_hora< 24 then
//				dw_datos_brigadista.Setitem(1,"pi_turno",3)
//		end if
		dw_datos_brigadista.fpr_habilitar_campos(TRUE)
		dw_ambito_brigadista.fpr_habilitar_mesa(FALSE)
		dw_datos_brigadista.SetText(" ")
		dw_datos_brigadista.fpr_limpiar_campos()
		lu_comunic.is_comunic.accion_retorno = "Alta"
	CASE "Modificar"
		This.title = gu_comunic.f_titulo_ventana("w_6204","modificar")
		iu_cli_2001_pr.fpr_conectar(dw_datos_brigadista)
		iu_bri_2015_nu.fnu_obtener_datos(dw_datos_brigadista,lu_comunic.is_comunic.longval1)
		dw_datos_brigadista.fpr_habilitar_campos(TRUE)
		dw_ambito_brigadista.object.nro_centro[1] = dw_datos_brigadista.object.nro_centro[1]
		dw_ambito_brigadista.object.nro_cmd[1] = dw_datos_brigadista.object.nro_cmd[1]
		dw_ambito_brigadista.object.nro_mesa[1] = dw_datos_brigadista.object.nro_puesto[1]
		dw_ambito_brigadista.fpr_habilitar_mesa(FALSE)
		dw_datos_brigadista.fpr_color_texto()
	CASE "Consulta"
		This.title = gu_comunic.f_titulo_ventana("w_6204","consulta")
		iu_cli_2001_pr.fpr_conectar(dw_datos_brigadista)
		iu_bri_2015_nu.fnu_obtener_datos(dw_datos_brigadista,lu_comunic.is_comunic.longval1)
		cb_aceptar.visible = False
		cb_cancelar.visible = False
		dw_datos_brigadista.fpr_habilitar_campos(FALSE)
		
//		dw_ambito_brigadista.setitem(1,"nro_centro",dw_datos_brigadista.object.nro_centro[1])
//		dw_ambito_brigadista.setitem(1,"nro_cmd",dw_datos_brigadista.object.nro_cmd[1])
//		dw_ambito_brigadista.setitem(1,"nro_mesa",dw_datos_brigadista.object.nro_puesto[1])	
//		dw_ambito_brigadista.accepttext()
		
		dw_ambito_brigadista.object.nro_centro[1] = dw_datos_brigadista.object.nro_centro[1]
		dw_ambito_brigadista.object.nro_cmd[1] = dw_datos_brigadista.object.nro_cmd[1]
		dw_ambito_brigadista.object.nro_mesa[1] = dw_datos_brigadista.object.nro_puesto[1]
		
		dw_ambito_brigadista.fpr_habilitar_mesa(FALSE)
		dw_datos_brigadista.fpr_color_texto()

END CHOOSE
//
end event

event close;call super::close;//ROLLBACK; //DBE 16/12/1999
gnu_u_transaction.uf_rollback() //DBE 16/12/1999

//Destruyo objetos creados en evento "open"
This.f_destruir_objetos()

end event

event closequery;call super::closequery;fgnu_resetear_s_comunicaciones(gu_comunic)
lu_comunic.is_comunic.accion_retorno="Refrescar"
gu_comunic.is_comunic = lu_comunic.is_comunic


end event

on w_6204_ingreso_brigadistas.create
int iCurrent
call super::create
this.dw_datos_brigadista=create dw_datos_brigadista
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_ambito_brigadista=create dw_ambito_brigadista
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_datos_brigadista
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.dw_ambito_brigadista
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.dw_1
end on

on w_6204_ingreso_brigadistas.destroy
call super::destroy
destroy(this.dw_datos_brigadista)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_ambito_brigadista)
destroy(this.cb_1)
destroy(this.dw_1)
end on

type dw_datos_brigadista from u_bri_2015_pr_ingreso_brigadistas within w_6204_ingreso_brigadistas
event ue_post_itemchanged pbm_custom25
event ue_key_down pbm_dwnkey
int X=18
int Y=160
int Width=2683
int Height=672
int TabOrder=50
BorderStyle BorderStyle=StyleRaised!
end type

on ue_post_itemchanged;call u_bri_2015_pr_ingreso_brigadistas::ue_post_itemchanged;This.SetColumn(is_columna)
end on

event itemchanged;call super::itemchanged;//is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista,This.GetColumnName(),1)
//ib_valido=true
//IF is_modstring <> "" THEN
//	is_columna = This.GetColumnName()
//	This.SetActionCode(1)
//END IF
//
//////////////////////////////////////////////////
long ll_anterior
string ls_anterior, ls_nulo
Setnull(ls_nulo)

is_columna=this.getcolumnname()

ib_valido=true  //prendo bandera de validacion en true

CHOOSE CASE is_columna
	CASE "nombre"
		ls_anterior = This.GetItemString(1,is_columna)
		is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista,is_columna,1)
	
		IF is_modstring <> "" THEN
//			This.SetItem(1,is_columna,ls_nulo)
			Return 2
//			This.postevent("ue_post_itemchanged")
//			ib_valido = False
		END IF

	CASE "ape1"
		ls_anterior = This.GetItemString(1,is_columna)
		is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista,is_columna,1)
	
		IF is_modstring <> "" THEN
			This.SetItem(1,is_columna,ls_anterior)
			Return 2
//			This.postevent("ue_post_itemchanged")
//			ib_valido = False
		END IF

	CASE "ape2"
		ls_anterior = This.GetItemString(1,is_columna)
		is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista,is_columna,1)
	
		IF is_modstring <> "" THEN
			This.SetItem(1,is_columna,ls_anterior)
			Return 2
//			This.postevent("ue_post_itemchanged")
//			ib_valido = False
		END IF

	CASE "doc_id"
		ls_anterior = This.GetItemString(1,is_columna)
		is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista,is_columna,1)
	
		IF is_modstring <> "" THEN
			This.SetItem(1,is_columna,ls_anterior)
			Return 2
//			This.postevent("ue_post_itemchanged")
//			ib_valido = False
		END IF

END CHOOSE
end event

event itemerror;//string ls_titulo, a
//
//is_columna = This.GetColumnName()
//is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista,This.GetColumnName(),1)
//
//ls_titulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
//a=This.Modify(ls_titulo)
//is_modstring=is_columna+".ValidationMsg='"+is_modstring+"'"
//a=This.Modify(is_modstring)
//ib_valido=false
///////////////////////////////////////////////////////////////

string ls_titulo, a
is_columna=this.getcolumnname()
//integer li_columna

//li_columna=integer(this.gettext())

CHOOSE CASE is_columna
	CASE "nombre" 
		IF IsNull(This.GetText()) OR This.GetText() = "" THEN
			is_modstring="Debe ingresar un nombre v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
	CASE "ape1" 
		IF IsNull(This.GetText()) OR This.GetText() = "" THEN
			is_modstring = "Debe ingresar un apellido v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
	CASE "nro_contrata"
		IF IsNull(Long(This.GetText())) OR Long(This.GetText()) <= 0 THEN 
			is_modstring = "Debe ingresar un n$$HEX1$$fa00$$ENDHEX$$mero de contrato v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
	CASE "doc_id" 
		IF IsNull(This.GetText()) OR This.GetText() = "" THEN
			is_modstring = "Debe ingresar un documento de identidad v$$HEX1$$e100$$ENDHEX$$lido"
		END IF
END CHOOSE

//if li_columna=0 then

	ls_titulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
	a=This.Modify(ls_titulo)
	is_modstring=is_columna+".ValidationMsg='"+is_modstring+"'"
	a=This.Modify(is_modstring)

//end if
ib_valido=false
This.SetFocus()

end event

event editchanged;// En este evento se controla que el usuario no pueda introducir como nombre, apellido1 o
// apellido 2 un $$HEX1$$fa00$$ENDHEX$$nico espacio en blanco.   (LFE)

string ls_column

ls_column=this.getcolumnname()
IF ls_column = "nombre" OR ls_column ="ape1" OR ls_column = "ape2" THEN
	// en el nombre, ape1 o ape2, no dejo que el usuario introduzca un car$$HEX1$$e100$$ENDHEX$$cter de 
	// espacio en primer lugar
	IF this.GetText() = " "	THEN
		This.SetText("")
	END IF
END IF
end event

type cb_aceptar from u_cb within w_6204_ingreso_brigadistas
int X=119
int Y=872
int TabOrder=30
string Text="Aceptar"
boolean Default=true
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;string ls_nombre, ls_ape1, ls_ape2, ls_nulo
int li_mesa
SetNull(ls_nulo)

dw_datos_brigadista.AcceptText()
//yield()


IF ib_valido=false THEN
	ib_valido = True
	dw_datos_brigadista.SetFocus()
	RETURN
END IF
IF lu_comunic.is_comunic.accion_llamada = "Alta" THEN
	is_modstring = iu_bri_2015_rn.frn_validar_brigadista(dw_datos_brigadista," ",2)
	IF is_modstring <> "" THEN
		gnv_msg.f_mensaje("AA18",is_modstring,"",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",is_modstring)
		is_modstring = ""
		dw_datos_brigadista.SetFocus()
		RETURN
	END IF
	IF fw_comprobar_repetidos() = 1 THEN
		gnv_msg.f_mensaje("AM64","","",OK!)
		return
	END IF
	ls_nombre = dw_datos_brigadista.GetItemString(1,"nombre")
	ls_ape1 = dw_datos_brigadista.GetItemString(1,"ape1")
	ls_ape2 = dw_datos_brigadista.GetItemString(1,"ape2")
	IF ISNUMBER(ls_nombre)  THEN
		gnv_msg.f_mensaje("AM26","","",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe introducir un Nombre v$$HEX1$$e100$$ENDHEX$$lido")
		dw_datos_brigadista.SetItem(1,"nombre",ls_nulo)
		Return
	END IF	
	IF ISNUMBER(ls_ape1) THEN
		gnv_msg.f_mensaje("AM27","","",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe introducir un Apellido v$$HEX1$$e100$$ENDHEX$$lido")
		dw_datos_brigadista.SetItem(1,"ape1",ls_nulo)
		Return
	END IF	
	IF ISNUMBER(ls_ape2) THEN
		gnv_msg.f_mensaje("AM27","","",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe introducir un Apellido v$$HEX1$$e100$$ENDHEX$$lido")
		dw_datos_brigadista.SetItem(1,"ape2",ls_nulo)
		Return
	END IF	
	
END IF

//Retorno a la ventana de Brigadistas
lu_comunic.is_comunic.programa_retorno = "w_6204_ingreso_brigadistas"
datetime ld_fecha
ld_fecha = fgcd_fecha_del_dia()
dw_datos_brigadista.SetItem(1,"usuario",gs_usuario)
dw_datos_brigadista.SetItem(1,"f_actual",ld_fecha)
dw_datos_brigadista.SetItem(1,"h_actual",ld_fecha)
dw_datos_brigadista.SetItem(1,"programa","w_6304")
dw_datos_brigadista.SetItem(1,"encargado",0)
//Mato--<(Brigadistas Inc. 2)
li_mesa=dw_ambito_brigadista.object.nro_mesa[1]
//dw_datos_brigadista.SetItem(1,"nro_centro",gi_nro_centro)
//dw_datos_brigadista.SetItem(1,"nro_cmd",gi_nro_cmd)
//dw_datos_brigadista.SetItem(1,"nro_puesto",li_mesa)
//>


IF lu_comunic.is_comunic.accion_llamada = "Alta" THEN
	dw_datos_brigadista.SetItem(1,"nro_centro",gu_comunic.is_comunic.intval1)
	dw_datos_brigadista.SetItem(1,"nro_cmd",gu_comunic.is_comunic.intval2)
	dw_datos_brigadista.SetItem(1,"nro_puesto",gu_comunic.is_comunic.intval3)
	dw_datos_brigadista.SetItem(1,"ind_disponible",1)

end if
	
	
	


dw_datos_brigadista.Update()

//COMMIT; //DBE 16/12/1999
gnu_u_transaction.uf_commit() //DBE 16/12/1999
lu_comunic.is_comunic.accion_retorno="Refrescar"
Close(Parent)
end event

type cb_cancelar from u_cb within w_6204_ingreso_brigadistas
int X=1134
int Y=872
int TabOrder=20
string Text="Cancelar"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

on clicked;call u_cb::clicked;
Close(Parent)
end on

type dw_ambito_brigadista from u_bri_2016_pr_ambito_brigadistas within w_6204_ingreso_brigadistas
int X=18
int Y=32
int Width=2683
int TabOrder=10
BorderStyle BorderStyle=StyleRaised!
end type

type cb_1 from commandbutton within w_6204_ingreso_brigadistas
int X=2149
int Y=872
int Width=411
int Height=96
int TabOrder=40
boolean BringToTop=true
string Text="&Imprimir"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_brigadista
string ls_titulo
long ll_longitud

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Datos de Brigadista ' 
ll_longitud = len (ls_titulo)*100
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_1.getchild ("d_brigadista",dwc_brigadista)
dw_datos_brigadista.sharedata(dwc_brigadista)
lst_impresion.pa_todos[1]=dw_datos_brigadista
lst_impresion.pa_nombres[1]='d_brigadista'


//messagebox('string(dw_datos_brigadista.object.nro_centro[1]) ', string(dw_datos_brigadista.object.nro_centro[1]) )

dw_1.Modify("centro_t.text = '" + string(dw_datos_brigadista.object.nro_centro[1]) + "'")
dw_1.Modify("centro_t.text = '" + string(1100) + "'")
dw_1.Modify("cmd_t.text = '" + string (dw_datos_brigadista.object.nro_cmd[1]) + "'")
dw_1.Modify("puesto_t.text = '" + string(dw_datos_brigadista.object.nro_puesto[1]) + "'")

//dw_1.Modify("centro_t.text = '" + string(gu_comunic.is_comunic.intval1) + "'")
//dw_1.Modify("cmd_t.text = '" + string (gu_comunic.is_comunic.intval2) + "'")
//dw_1.Modify("puesto_t.text = '" + string(gu_comunic.is_comunic.intval3) + "'")



lst_impresion.total = 1
//IF d_lista_brigada.RowCount() = 0 THEN
//	gnv_msg.f_mensaje( "AB02","","",OK!)
//	return
//END IF

fw_editar_campos (dw_datos_brigadista)
dw_1.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada
lst_impresion.pdw_compuesto = dw_1
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)

	
	

end event

type dw_1 from datawindow within w_6204_ingreso_brigadistas
int X=73
int Y=96
int Width=2633
int Height=736
int TabOrder=50
boolean Visible=false
boolean BringToTop=true
string DataObject="d_brigadista_imp"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type


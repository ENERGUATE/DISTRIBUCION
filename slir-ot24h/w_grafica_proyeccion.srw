HA$PBExportHeader$w_grafica_proyeccion.srw
forward
global type w_grafica_proyeccion from Window
end type
type ddlb_mes from dropdownlistbox within w_grafica_proyeccion
end type
type st_mes from statictext within w_grafica_proyeccion
end type
type rb_actual from radiobutton within w_grafica_proyeccion
end type
type rb_historicos from radiobutton within w_grafica_proyeccion
end type
type st_ratios from statictext within w_grafica_proyeccion
end type
type st_titulo from statictext within w_grafica_proyeccion
end type
type dw_datos_ext from datawindow within w_grafica_proyeccion
end type
type st_annio from statictext within w_grafica_proyeccion
end type
type pb_recuperar from picturebutton within w_grafica_proyeccion
end type
type em_annio from editmask within w_grafica_proyeccion
end type
type dw_grafica from datawindow within w_grafica_proyeccion
end type
type st_marco1 from statictext within w_grafica_proyeccion
end type
type gb_datos_mes from groupbox within w_grafica_proyeccion
end type
type gb_grafica from groupbox within w_grafica_proyeccion
end type
type dw_proyeccion_datos from datawindow within w_grafica_proyeccion
end type
type gb_datos_historicos from groupbox within w_grafica_proyeccion
end type
end forward

global type w_grafica_proyeccion from Window
int X=233
int Y=464
int Width=3227
int Height=1652
boolean TitleBar=true
string Title="OPEN SGI - Gr$$HEX1$$e100$$ENDHEX$$fica"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
event ue_recuperar ( )
ddlb_mes ddlb_mes
st_mes st_mes
rb_actual rb_actual
rb_historicos rb_historicos
st_ratios st_ratios
st_titulo st_titulo
dw_datos_ext dw_datos_ext
st_annio st_annio
pb_recuperar pb_recuperar
em_annio em_annio
dw_grafica dw_grafica
st_marco1 st_marco1
gb_datos_mes gb_datos_mes
gb_grafica gb_grafica
dw_proyeccion_datos dw_proyeccion_datos
gb_datos_historicos gb_datos_historicos
end type
global w_grafica_proyeccion w_grafica_proyeccion

type variables
s_grafica_ratios istr_ratios
Integer ii_barra_data = 1,  ii_barra_proyeccion = 5


/********************************************/
/* CAMBIO SGI DESARROLLO 2000*/
/*******************************************/
Integer ii_index
end variables

forward prototypes
public subroutine fw_proyeccion_historicos (readonly integer pi_ultimo_mes, double pd_ultimo_valor)
public function double fw_valor (integer pi_ratio, double pl_linea)
public subroutine fw_carga_meses ()
end prototypes

event ue_recuperar;////////////////////////////////////////////////////////////
//
// Evento:		ue_recuperar
// 
// Objetivo:	
//					Recupera los datos para hacer el c$$HEX1$$e100$$ENDHEX$$lculo de
//					los ratios.
//
//  Fecha		Responsable		Actuacion
// --------		-----------		--------------------
// 24/11/99		JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////
Integer li_annio, li_ult_mes_con_valor, li_primer_mes_valor, li_ultimo_mes_valor
Double  ldbl_valor,         &
		  ldbl_valor_ant,     &
		  ldbl_primer_valor,  &
		  ldbl_ultimo_valor,  &
		  ldbl_proyeccion 
		  
Long 	  ll_i,             &
		  ll_row,           &
		  ll_mes,           &
		  ll_lineas,        &
		  ll_setting,		  &
		  ll_periodo_ini,	  &
		  ll_periodo_fin
		  
Boolean lb_primer_valor, lb_ultimo_valor

Date ldt_fecha_ini, ldt_fecha_fin


dw_grafica.SetRedraw(False)

li_annio = Integer(em_annio.Text)

FOR ll_i = 1 TO 12
	 dw_grafica.SetItem(ll_i, "cantidad", 0)
	 dw_grafica.SetItem(ll_i, "valor_sn", ii_barra_data)
	 dw_datos_ext.SetItem(ll_i, "cantidad", 0)
NEXT

dw_grafica.AcceptText()


/******************************/
/* CAMBIO SGI DESARROLLO 2000 */
/******************************/
//ll_row = dw_proyeccion_datos.Retrieve(li_annio)
String ls_fecha, ls_fecha2

 IF rb_actual.Checked THEN	
 	ls_fecha = "01/" + String(ii_index) + "/" + em_annio.Text
	ls_fecha2= "01/" + String(ii_index) + "/" + String((Integer(em_annio.Text)+1))
	ls_fecha2 = String(RelativeDate(date(ls_fecha2),-1))
	
	ldt_fecha_ini = Date(ls_fecha)
	ll_periodo_ini = Long(String(Year(ldt_fecha_ini)) + String(Month(ldt_fecha_ini), '00') + String(Day(ldt_fecha_ini), '00'))
	
	ldt_fecha_fin = Date(ls_fecha2)
	ll_periodo_fin = Long(String(Year(ldt_fecha_fin)) + String(Month(ldt_fecha_fin), '00') + String(Day(ldt_fecha_fin), '00'))
 ELSE 
	ls_fecha = "01/" + String(ii_index) + "/" + String((Integer(em_annio.Text)-1))
	ls_fecha2= "01/" + String(ii_index) + "/" + String((Integer(em_annio.Text)))
	ls_fecha2 = String(RelativeDate(date(ls_fecha2),-1))
	
	ldt_fecha_ini = Date(ls_fecha)
	ll_periodo_ini = Long(String(Year(ldt_fecha_ini)) + String(Month(ldt_fecha_ini), '00') + String(Day(ldt_fecha_ini), '00'))
	
	ldt_fecha_fin = Date(ls_fecha2)
	ll_periodo_fin = Long(String(Year(ldt_fecha_fin)) + String(Month(ldt_fecha_fin), '00') + String(Day(ldt_fecha_fin), '00'))
 END IF

//ll_row = dw_proyeccion_datos.Retrieve(ls_fecha, ls_fecha2)
ll_row = dw_proyeccion_datos.Retrieve(ll_periodo_ini, ll_periodo_fin)


/******************************/
/* CAMBIO SGI DESARROLLO 2000 */
/******************************/

IF ll_row < 1 THEN
	dw_datos_ext.Modify("c_color.Expression = '1'")
	dw_grafica.SetRedraw(True)
	MessageBox("Aviso", "No existen datos para hacer los c$$HEX1$$e100$$ENDHEX$$lculos.")	
	RETURN
END IF


/* CARGA LOS VALORES DEL INDICADOR */
FOR ll_i = 1 TO ll_row
	 /*contador por grupo -- mes*/
	 ll_lineas  = dw_proyeccion_datos.GetItemNumber(ll_i, "c_lineas")
	 
	 IF rb_actual.Checked THEN	/*actuales*/
	 	If istr_ratios.ratios = 4 Or istr_ratios.ratios = 5 Then
		 	ldbl_valor = fw_valor(istr_ratios.ratios, ll_i)
		Else
		 	ldbl_valor = fw_valor(istr_ratios.ratios, ll_i) + ldbl_valor
		End If
	 ELSE 							/*historicos*/
	 	ldbl_valor = fw_valor(istr_ratios.ratios, ll_i)
	 END IF
	 
	 ll_mes	   = dw_proyeccion_datos.GetItemNumber(ll_i, "mes")
	 ll_mes	   = ll_mes - ii_index + 1
	 
	 If ll_mes < 1 Then ll_mes = ll_mes + 12
	 
	 ll_i       = ll_i + ll_lineas - 1
	 
	 IF IsNull(ldbl_valor) THEN ldbl_valor = 0
	 
	 dw_grafica.SetItem(ll_mes, "cantidad", ldbl_valor)
	 
	 dw_grafica.SetItem(ll_i, "valor_sn", ii_barra_data)
	 
NEXT
dw_grafica.AcceptText()

/*PROYECCION*/
FOR ll_i = 1 TO 12
	
	 ldbl_valor = dw_grafica.GetItemNumber(ll_i, "cantidad")
	 
	 IF ldbl_valor <= 0 THEN
		 IF lb_primer_valor AND NOT lb_ultimo_valor THEN
			 lb_ultimo_valor = TRUE
			 ldbl_ultimo_valor = ldbl_valor_ant
		 END IF
	 ELSE
		 IF NOT lb_primer_valor THEN
			 lb_primer_valor = TRUE
			 ldbl_primer_valor = ldbl_valor
			 li_primer_mes_valor = ll_i
		END IF
		 lb_ultimo_valor = FALSE
		 li_ult_mes_con_valor = ll_i + 1
		 
	 END IF
	 
	 ldbl_valor_ant = ldbl_valor
NEXT

/******************************/
/* CAMBIO SGI DESARROLLO 2000 */
/******************************/
If li_ultimo_mes_valor = 0 AND li_primer_mes_valor = 0 And dw_proyeccion_datos.RowCount() <= 0 THEN 
	MessageBox("Aviso", "No existen datos hist$$HEX1$$f300$$ENDHEX$$ricos.  La proyecci$$HEX1$$f300$$ENDHEX$$n no ser$$HEX2$$e1002000$$ENDHEX$$generada.")
	return 
End If

If li_ultimo_mes_valor = 0 AND li_primer_mes_valor = 0 THEN 
	MessageBox("Aviso", "No hay valores para generar la proyecci$$HEX1$$f300$$ENDHEX$$n.")
	return 
End If
/******************************/
/* CAMBIO SGI DESARROLLO 2000 */
/******************************/

	

li_ultimo_mes_valor = li_ult_mes_con_valor - 1


/******************************/
/* CAMBIO SGI DESARROLLO 2000 */
/******************************/
/*TOTAL DE DIAS*/
Integer li_num_mes,  li_dias, li_ii = 1

ll_i = 0

For ll_i = li_primer_mes_valor To li_ultimo_mes_valor 
	 li_num_mes = dw_grafica.GetItemNumber(ll_i, "no_mes")
    li_annio = dw_datos_ext.GetItemNumber(li_ii,"annio")
	 li_dias += Day(fg_fecha_max(li_num_mes,li_annio ))
	 li_ii++
Next			 



/******************************/
/* CAMBIO SGI DESARROLLO 2000 */
/******************************/

IF rb_actual.Checked THEN	
//	IF IsNull(ldbl_ultimo_valor) THEN ldbl_ultimo_valor = 0
//	IF IsNull(ldbl_primer_valor) THEN ldbl_primer_valor = 0
	
	ldbl_proyeccion = ldbl_ultimo_valor - ldbl_primer_valor
	ldbl_valor		 = ldbl_ultimo_valor
	
	/******************************/
   /* CAMBIO SGI DESARROLLO 2000 */
   /******************************/
	//ldbl_proyeccion = ldbl_proyeccion / (li_ultimo_mes_valor - li_primer_mes_valor) 
    
	ldbl_proyeccion = ldbl_proyeccion / li_dias
	
	/******************************/
   /* CAMBIO SGI DESARROLLO 2000 */
   /******************************/

//	IF IsNull(ldbl_valor) THEN ldbl_valor = 0
//	IF IsNull(ldbl_proyeccion) THEN ldbl_proyeccion = 0
	
	FOR ll_i = li_ult_mes_con_valor TO 12
		
		/******************************/
		/* CAMBIO SGI DESARROLLO 2000 */
		/******************************/
		DOUBLE 	 ldbl_proyeccion_2
   	 li_num_mes = dw_grafica.GetItemNumber(ll_i, "no_mes")
       li_annio = dw_datos_ext.GetItemNumber(ll_i,"annio")
	 	 li_dias = Day(fg_fecha_max(li_num_mes,li_annio ))
		  
//  	/* CAMBIO SGI DESARROLLO 2000 */  ldbl_proyeccion = (ldbl_proyeccion * li_dias)
	  	 ldbl_proyeccion_2 = (ldbl_proyeccion * li_dias)

		/******************************/
		/* CAMBIO SGI DESARROLLO 2000 */
		/******************************/
		
		 ldbl_valor += ldbl_proyeccion_2
		 
		 dw_grafica.SetItem(ll_i, "cantidad", ldbl_valor)
		 dw_grafica.SetItem(ll_i, "valor_sn", ii_barra_proyeccion)
	NEXT
	
ELSE /*HISTORICO*/
	
	/* CAMBIO SGI DESARROLLO 2000 */ //ll_row = dw_proyeccion_datos.Retrieve(li_annio - 1)
	
	 IF ll_row < 1 THEN
		MessageBox("Aviso", "No existen datos hist$$HEX1$$f300$$ENDHEX$$ricos.  La proyecci$$HEX1$$f300$$ENDHEX$$n no ser$$HEX2$$e1002000$$ENDHEX$$generada.")
	 END IF

	//	IF IsNull(ldbl_ultimo_valor) THEN ldbl_ultimo_valor = 0

	 fw_proyeccion_historicos(li_ult_mes_con_valor, ldbl_ultimo_valor)

END IF

dw_grafica.AcceptText()

FOR ll_i = 1 TO 12
   dw_datos_ext.SetItem(ll_i, "cantidad", dw_grafica.GetItemDecimal(ll_i, "cantidad"))
NEXT

dw_datos_ext.AcceptText()
dw_grafica.AcceptText()
dw_datos_ext.Modify("c_color.Expression = '" + String(li_ult_mes_con_valor) + "'")


/********************************/
/** CAMBIO SGI DESARROLLO 2000 **/ 
/********************************/
dw_grafica.INSERTROW(0)
dw_grafica.SetRedraw(True)

If dw_datos_ext.GetItemDecimal(1,"cantidad") = 0 then
	MessageBox("Aviso", "No existen datos de todos lo meses...")
End If	


/********************************/
/** CAMBIO SGI DESARROLLO 2000 **/ 
/********************************/




end event

public subroutine fw_proyeccion_historicos (readonly integer pi_ultimo_mes, double pd_ultimo_valor);
///////////////////////////////////////////////////////
//								
// Funcion/Evento: fw_proyeccion_historicos
// 
// Objetivo: Obtiene las proyecciones historicas de los ratios,
//				 A$$HEX1$$f100$$ENDHEX$$o seleccionado contra el anterior.
//
// Responsable: JPE
//
//    Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_ultimo_mes, pd_ultimo_valor
//    Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 24/11/99    JPE
//
///////////////////////////////////////////////////////



Long   ll_i, ll_row, ll_mes, ll_lineas
Double ldbl_valor, ldbl_valor_ant, ldbl_valor_act


ll_row = dw_proyeccion_datos.RowCount()

FOR ll_i = 1 TO ll_row
	 ll_lineas = dw_proyeccion_datos.GetItemNumber(ll_i, "c_lineas")
	 
	 ll_mes	  = dw_proyeccion_datos.GetItemNumber(ll_i, "mes")
	 
	 IF pi_ultimo_mes < ll_mes AND ll_i = 1 THEN
		 MessageBox("Aviso", "No existen datos hist$$HEX1$$f300$$ENDHEX$$ricos.  La proyecci$$HEX1$$f300$$ENDHEX$$n no ser$$HEX2$$e1002000$$ENDHEX$$generada.")
		 RETURN
	 END IF
	 
	 IF pi_ultimo_mes <= ll_mes AND ll_mes > 1 AND ll_i > 1 THEN
		
		ldbl_valor_ant = fw_valor(istr_ratios.ratios, (ll_i - 1))
		 
		 ldbl_valor_act = fw_valor(istr_ratios.ratios, ll_i)

		 ldbl_valor = (ldbl_valor_act - ldbl_valor_ant)		 
		 ldbl_valor = (ldbl_valor / ldbl_valor_ant)
		 
		 pd_ultimo_valor = (pd_ultimo_valor * ldbl_valor) + pd_ultimo_valor
		 
		 If IsNull(pd_ultimo_valor) THEN pd_ultimo_valor = 0
		 
		 dw_grafica.SetItem(ll_mes, "cantidad", pd_ultimo_valor)
		 dw_grafica.SetItem(ll_mes, "valor_sn", ii_barra_proyeccion)
	END IF
	
   ll_i = ll_i + ll_lineas - 1
NEXT
end subroutine

public function double fw_valor (integer pi_ratio, double pl_linea);
///////////////////////////////////////////////////////
//								
// Funcion/Evento: fw_valor
// 
// Objetivo: Coloca los valores de los ratios dependiendo
//				 de la selecci$$HEX1$$f300$$ENDHEX$$n, que recibe como parametro.
//
// Responsable: JPE
//
//    Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_ratio, pl_linea
//    Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 24/11/99    JPE
//
///////////////////////////////////////////////////////

Double ldbl_return


CHOOSE CASE pi_ratio
	CASE 0
		ldbl_return = dw_proyeccion_datos.GetItemNumber(pl_linea, "c_valor_tiebt")
	CASE 1
		ldbl_return = dw_proyeccion_datos.GetItemNumber(pl_linea, "c_valor_tiepi")
	CASE 2
		ldbl_return = dw_proyeccion_datos.GetItemNumber(pl_linea, "c_valor_saifi")
	CASE 3
		ldbl_return = dw_proyeccion_datos.GetItemNumber(pl_linea, "c_valor_saidi")
	CASE 4
		ldbl_return = dw_proyeccion_datos.GetItemNumber(pl_linea, "c_valor_caidi")
	CASE 5
		ldbl_return = dw_proyeccion_datos.GetItemNumber(pl_linea, "c_valor_asai")

END CHOOSE


RETURN ldbl_return
end function

public subroutine fw_carga_meses ();Integer li_mes, ld_i, li_annio
String  ls_arr_meses[12], ls_mes
String  ls_arr_nom[12] = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"}

dw_grafica.Reset()
dw_datos_ext.Reset()

FOR ld_i = 1 TO 12
	 dw_grafica.InsertRow(0)
	 dw_datos_ext.InsertRow(0)
NEXT

li_mes = ii_index  /*mes seleccionado*/
li_annio = Integer(em_annio.Text)

/*Se va a cargar el arreglo*/
FOR ld_i = 1 TO 12
	
	ls_arr_meses[ld_i] = String(li_mes)+ ls_arr_nom[li_mes] 
   
	IF (12 - li_mes ) = 0 then li_annio++
		
   dw_datos_ext.SetItem(ld_i, "no_mes", li_mes)	 
   dw_datos_ext.SetItem(ld_i, "cantidad", 0)
   dw_datos_ext.SetItem(ld_i, "mes", ls_arr_nom[li_mes]  )
	dw_datos_ext.SetItem(ld_i, "annio", li_annio  )
   
	If ld_i <= 9 then 
		ls_mes = String(0) + String(ld_i)
	Else
		ls_mes = String(ld_i)
	End IF	
		
   dw_grafica.SetItem(ld_i, "no_mes", li_mes) 
   dw_grafica.SetItem(ld_i, "mes", ls_mes + ls_arr_nom[li_mes] )
	dw_grafica.SetItem(ld_i, "cantidad", 0)
	
   li_mes++
	
	If li_mes > 12 then li_mes = li_mes - 12
	
NEXT



end subroutine

on w_grafica_proyeccion.create
this.ddlb_mes=create ddlb_mes
this.st_mes=create st_mes
this.rb_actual=create rb_actual
this.rb_historicos=create rb_historicos
this.st_ratios=create st_ratios
this.st_titulo=create st_titulo
this.dw_datos_ext=create dw_datos_ext
this.st_annio=create st_annio
this.pb_recuperar=create pb_recuperar
this.em_annio=create em_annio
this.dw_grafica=create dw_grafica
this.st_marco1=create st_marco1
this.gb_datos_mes=create gb_datos_mes
this.gb_grafica=create gb_grafica
this.dw_proyeccion_datos=create dw_proyeccion_datos
this.gb_datos_historicos=create gb_datos_historicos
this.Control[]={this.ddlb_mes,&
this.st_mes,&
this.rb_actual,&
this.rb_historicos,&
this.st_ratios,&
this.st_titulo,&
this.dw_datos_ext,&
this.st_annio,&
this.pb_recuperar,&
this.em_annio,&
this.dw_grafica,&
this.st_marco1,&
this.gb_datos_mes,&
this.gb_grafica,&
this.dw_proyeccion_datos,&
this.gb_datos_historicos}
end on

on w_grafica_proyeccion.destroy
destroy(this.ddlb_mes)
destroy(this.st_mes)
destroy(this.rb_actual)
destroy(this.rb_historicos)
destroy(this.st_ratios)
destroy(this.st_titulo)
destroy(this.dw_datos_ext)
destroy(this.st_annio)
destroy(this.pb_recuperar)
destroy(this.em_annio)
destroy(this.dw_grafica)
destroy(this.st_marco1)
destroy(this.gb_datos_mes)
destroy(this.gb_grafica)
destroy(this.dw_proyeccion_datos)
destroy(this.gb_datos_historicos)
end on

event open;////////////////////////////////////////////////////////////
//
// Evento:		Open
// 
// Objetivo:	
//					Carga de datos iniciales para	la ventana
//
//  Fecha		Responsable		Actuacion
// --------		-----------		--------------------
// 24/11/99		JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

String  ls_centro
Double  ld_i, ld_row
//String  ls_arr_meses[12] = {"01Enero", "02Febrero", "03Marzo", "04Abril", "05Mayo", "06Junio", "07Julio", "08Agosto", "09Septiembre", "10Octubre", "11Noviembre", "12Diciembre"}
Integer li_todos_centros

li_todos_centros = 0

istr_ratios = Message.PowerObjectParm

dw_proyeccion_datos.SetTransObject(SQLCA)
dw_grafica.SetTransObject(SQLCA)
dw_datos_ext.SetTransObject(SQLCA)

em_annio.Text = String(Year(Today()))



//ld_row = dw_grafica.RowCount()
//
//FOR ld_i = ld_row TO 12
//	 dw_grafica.InsertRow(0)
//NEXT
//
//ld_row = dw_datos_ext.RowCount()
//
//FOR ld_i = ld_row TO 12
//	 dw_datos_ext.InsertRow(0)
//NEXT
//
//FOR ld_i = 1 TO 12
//	 dw_grafica.SetItem(ld_i, "no_mes", ld_i)
//	 dw_datos_ext.SetItem(ld_i, "no_mes", ld_i)	 
//	 dw_grafica.SetItem(ld_i, "mes", ls_arr_meses[ld_i])
//	 dw_datos_ext.SetItem(ld_i, "mes", Mid(ls_arr_meses[ld_i],3))
//	 dw_grafica.SetItem(ld_i, "cantidad", 0)
//	 dw_datos_ext.SetItem(ld_i, "cantidad", 0)
//NEXT
//

SELECT "SGD_CENTRO"."NOM_CENTRO"  
  INTO :ls_centro  
  FROM "SGD_CENTRO"  
 WHERE "SGD_CENTRO"."NRO_CENTRO" = :istr_ratios.centro   ;

IF istr_ratios.centro <= li_todos_centros THEN
	ls_centro = "Gr$$HEX1$$e100$$ENDHEX$$fica de " + ls_centro + " los Centros"
ELSE
	ls_centro = "Gr$$HEX1$$e100$$ENDHEX$$fica de " + ls_centro
END IF

st_titulo.Text = ls_centro

CHOOSE CASE istr_ratios.ratios
	CASE 0
		st_ratios.Text = "Tiebt"
	CASE 1
		st_ratios.Text = "Tiepi"
	CASE 2
		st_ratios.Text = "Saifi"
	CASE 3
		st_ratios.Text = "Saidi"
	CASE 4
		st_ratios.Text = "Caidi"
	CASE 5
		st_ratios.Text = "Asai"
END CHOOSE

dw_grafica.Modify("gr_1.Title = '" + ls_centro + "'")

//fg_centrar_ventana(THIS)


/*********************************/
/** CAMBIO SGI DESARROLLO 2000  **/
/*********************************/
    ddlb_mes.SelectItem ( "Enero", 1 )
    ii_index = 1
    fw_carga_meses()
	 THIS.TriggerEvent("ue_recuperar")
	  
/*********************************/
/** CAMBIO SGI DESARROLLO 2000  **/
/*********************************/

end event

type ddlb_mes from dropdownlistbox within w_grafica_proyeccion
int X=2368
int Y=160
int Width=626
int Height=240
int TabOrder=50
BorderStyle BorderStyle=StyleLowered!
boolean Sorted=false
boolean VScrollBar=true
long TextColor=33554432
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
string Item[]={"Enero",&
"Febrero",&
"Marzo",&
"Abril",&
"Mayo",&
"Junio",&
"Julio",&
"Agosto",&
"Septiembre",&
"Octubre",&
"Noviembre",&
"Diciembre"}
end type

event selectionchanged;ii_index = index
end event

type st_mes from statictext within w_grafica_proyeccion
int X=2245
int Y=176
int Width=128
int Height=76
boolean Enabled=false
string Text="Mes"
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=276856960
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_actual from radiobutton within w_grafica_proyeccion
int X=2281
int Y=1452
int Width=343
int Height=68
string Text="Actuales"
boolean Checked=true
long BackColor=79741120
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_historicos from radiobutton within w_grafica_proyeccion
int X=2752
int Y=1452
int Width=379
int Height=68
string Text="Hist$$HEX1$$f300$$ENDHEX$$ricos"
long BackColor=79741120
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_ratios from statictext within w_grafica_proyeccion
int X=2866
int Y=288
int Width=288
int Height=88
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="none"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_titulo from statictext within w_grafica_proyeccion
int X=2208
int Y=32
int Width=983
int Height=92
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="none"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=8388608
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_datos_ext from datawindow within w_grafica_proyeccion
int X=2213
int Y=432
int Width=960
int Height=960
int TabOrder=30
string DataObject="d_grafica_proyeccion_datos"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type st_annio from statictext within w_grafica_proyeccion
int X=2258
int Y=292
int Width=123
int Height=76
boolean Enabled=false
string Text="A$$HEX1$$f100$$ENDHEX$$o"
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=276856960
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type pb_recuperar from picturebutton within w_grafica_proyeccion
int X=3008
int Y=156
int Width=142
int Height=124
int TabOrder=70
string PictureName="lupa3.bmp"
Alignment HTextAlign=Right!
boolean OriginalSize=true
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;////////////////////////////////////////////////////////////
//
// Evento:		clicked
// 
// Objetivo:	
//					Ejecuta el evento ue_recuperar de la ventana.
//
//  Fecha		Responsable		Actuacion
// --------		-----------		--------------------
// 24/11/99		JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

/****************************/
/*CAMBIO SGI DESARROLLO 2000*/
/****************************/
 fw_carga_meses()
/****************************/
/*CAMBIO SGI DESARROLLO 2000*/
/****************************/



PARENT.TriggerEvent("ue_recuperar")
end event

type em_annio from editmask within w_grafica_proyeccion
int X=2400
int Y=288
int Width=343
int Height=92
int TabOrder=80
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="####"
boolean Spin=true
string DisplayData="$$HEX1$$c400$$ENDHEX$$"
string MinMax="1900~~3000"
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_grafica from datawindow within w_grafica_proyeccion
int X=41
int Y=44
int Width=2135
int Height=1480
int TabOrder=90
string DataObject="d_grafica_proyeccion_grafica"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type st_marco1 from statictext within w_grafica_proyeccion
int X=2222
int Y=144
int Width=955
int Height=276
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long BackColor=276856960
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_datos_mes from groupbox within w_grafica_proyeccion
int X=2208
int Y=100
int Width=983
int Height=1300
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_grafica from groupbox within w_grafica_proyeccion
int X=27
int Width=2162
int Height=1536
int TabOrder=10
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_proyeccion_datos from datawindow within w_grafica_proyeccion
int X=96
int Y=916
int Width=2089
int Height=616
int TabOrder=60
boolean Visible=false
boolean BringToTop=true
string DataObject="d_grafica_proyeccion_datos_oculto"
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
end type

event sqlpreview;String ls_where


IF istr_ratios.centro <> 0 THEN
	ls_where = "AND (GI_INCIDENCIA_BDG.NRO_CENTRO = " + String(istr_ratios.centro) + ")"
ELSE
	ls_where = "AND (GI_INCIDENCIA_BDG.NRO_CENTRO = 0)"
END IF	

sqlsyntax = sqlsyntax + ls_where

IF gu_comunic.is_comunic.accion_llamada = 'RELEVANTES' THEN
	fg_replace_text(sqlsyntax,'GI_INCIDENCIA_BDG','GI_RELEVANTES_BDG')
END IF

THIS.SetSQLPreview(sqlsyntax)
end event

type gb_datos_historicos from groupbox within w_grafica_proyeccion
int X=2208
int Y=1400
int Width=983
int Height=132
int TabOrder=40
string Text=" Proyecci$$HEX1$$f300$$ENDHEX$$n con Datos "
long TextColor=8388608
long BackColor=79741120
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


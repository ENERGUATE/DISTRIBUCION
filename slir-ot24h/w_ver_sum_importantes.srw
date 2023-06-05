HA$PBExportHeader$w_ver_sum_importantes.srw
forward
global type w_ver_sum_importantes from w_sgigenerica
end type
type pb_1 from picturebutton within w_ver_sum_importantes
end type
type cb_2 from commandbutton within w_ver_sum_importantes
end type
type cb_1 from commandbutton within w_ver_sum_importantes
end type
type dw_clientes from dw_co_cliente_imp_instalacion_padre within w_ver_sum_importantes
end type
end forward

shared variables

end variables

global type w_ver_sum_importantes from w_sgigenerica
integer x = 1056
integer y = 484
integer width = 3209
integer height = 1676
string title = "OPEN SGI - Suministros Afectados"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
event ue_post_open ( )
pb_1 pb_1
cb_2 cb_2
cb_1 cb_1
dw_clientes dw_clientes
end type
global w_ver_sum_importantes w_ver_sum_importantes

type variables
long il_instalacion
long il_instalaciones [ ]  //GNU 22-07-2005
string is_nomcab_borde,is_nomcab, is_datos
integer ii_orden

s_grupo_int is_grupo_int

end variables

forward prototypes
public subroutine fw_open_clientes_imp_afect ()
public subroutine fw_open_clientes_afect ()
end prototypes

event ue_post_open();//date ld_fecha
integer li_net

	li_net = messagebox('Aviso','Esta consulta puede demorar unos minutos, Desea continuar?',Exclamation!, OKCancel!,2)
	w_operaciones.setfocus()
	IF li_net = 1 THEN
	
		fw_open_clientes_afect()
	ELSE
	  close(w_ver_sum_importantes)
	END IF
	

end event

public subroutine fw_open_clientes_imp_afect ();///////////////////////////////////////////////////////
//										
// Funcion/Evento: open
// 
// Objetivo: cargar los datos del datawindow
// Responsable: JHE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 05/04/2001   JHE
//
///////////////////////////////////////////////////////
String ls_nom_instalacion

//JPE 07/03/2002 il_instalacion = Message.DoubleParm
is_grupo_int = Message.PowerObjectParm


il_instalacion = is_grupo_int.nro_instalacion
//JPE 07/03/2002

dw_clientes.SettransObject(SQLCA)

dw_clientes.Retrieve(is_grupo_int.nro_instalacion, is_grupo_int.f_deteccion, fgci_tipo_ct, fgci_tipo_transformador, fgci_tipo_salida_de_baja)


//JPE 07/03/2002


SELECT "SGD_INSTALACION"."NOM_INSTALACION"
  INTO :is_datos
  FROM "SGD_INSTALACION"  
 WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :il_instalacion And BDI_JOB <= 0  ;


IF dw_clientes.RowCount() <= 0 THEN
	cb_2.enabled = False

	ls_nom_instalacion = is_datos

	If IsNull(ls_nom_instalacion) Then
		ls_nom_instalacion = "C$$HEX1$$f300$$ENDHEX$$digo de Instalaci$$HEX1$$f300$$ENDHEX$$n: " + String(il_instalacion)
	Else
		ls_nom_instalacion = "Instalaci$$HEX1$$f300$$ENDHEX$$n: " + is_datos
	End If

	MessageBox("Aviso", "No existen suministros importantes para la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada.  " + is_datos + ".")
	Close(This)
	Return

///////////////////////////////////////////////
END IF


dw_clientes.Modify("st_instalacion.Text='Suministros importantes de: "+is_datos+"'")
dw_clientes.Modify("st_fecha.Text='Fecha: "+String(fgnu_fecha_actual(), 'dd/mm/yyyy hh:mm')+"'")
end subroutine

public subroutine fw_open_clientes_afect ();///////////////////////////////////////////////////////
//										
// Funcion/Evento: open
// 
// Objetivo: cargar los datos del datawindow
// Responsable: 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 02/08/2002   AMR
//
///////////////////////////////////////////////////////

//sw_elemento lst_elemento
date ld_fecha
int ls_indice
is_grupo_int = Message.PowerObjectParm
	
il_instalacion = is_grupo_int.nro_instalacion

// GNU 25-07-2005
il_instalaciones= is_grupo_int.nro_instalacion_int

dw_clientes.SettransObject(SQLCA)
	
SELECT "SGD_INSTALACION"."NOM_INSTALACION"
INTO :is_datos
FROM "SGD_INSTALACION"  
WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :il_instalaciones[1] AND 
	"SGD_INSTALACION"."BDI_JOB" <= 0;

dw_clientes.Retrieve(il_instalaciones)
/*//if isnull(lst_elemento.fecha_ini) then
//	ld_fecha = today()
//else
 ld_fecha = date(is_grupo_int.inicio[1])
//end if

dw_clientes.SettransObject(SQLCA)


 SELECT "SGD_INSTALACION"."NOM_INSTALACION"
    INTO :is_datos
    FROM "SGD_INSTALACION"  
   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :il_instalacion AND 
	      "SGD_INSTALACION"."BDI_JOB" <= 0;

dw_clientes.Retrieve(il_instalacion, ld_fecha)*/

IF dw_clientes.RowCount() <= 0 THEN 
	MessageBox("Aviso", "No existen suministros afectados para la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada.  " + is_datos + ".")
	Close(This)
   Return
END IF

dw_clientes.Modify("inst_afect.text='Suministros pertenecientes a "+is_datos+"'")
 


end subroutine

on w_ver_sum_importantes.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_clientes=create dw_clientes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.cb_2
this.Control[iCurrent+3]=this.cb_1
this.Control[iCurrent+4]=this.dw_clientes
end on

on w_ver_sum_importantes.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_clientes)
end on

event open;call super::open;
if gi_clientes_afec = 1 then	
	dw_clientes.dataobject = 'dw_co_cliente_imp_instalacion'
	fw_open_clientes_imp_afect()
else
	dw_clientes.dataobject = 'dw_sum_x_instal'
	this.postevent('ue_post_open')
end if
end event

event activate;//if gi_clientes_afec <> 1 then
//	w_ver_sum_importantes.visible = false
//end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_ver_sum_importantes
end type

type pb_1 from picturebutton within w_ver_sum_importantes
integer x = 2976
integer y = 1460
integer width = 174
integer height = 104
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string picturename = "print.bmp"
alignment htextalign = left!
end type

event clicked;If dw_clientes.RowCount() <= 0 Then Return

dw_clientes.Print()
end event

type cb_2 from commandbutton within w_ver_sum_importantes
integer x = 2555
integer y = 1464
integer width = 370
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Guardar..."
end type

event clicked;dw_clientes.SaveAS()
end event

type cb_1 from commandbutton within w_ver_sum_importantes
integer x = 2162
integer y = 1464
integer width = 352
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Salir"
end type

event clicked;///////////////////////////////////////////////////////
//										
// Funcion/Evento: clicked
// 
// Objetivo: cierra la ventana
// Responsable: JHE
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	    -----------   ---------
// 05/04/2001   JHE
//
///////////////////////////////////////////////////////

close(parent)
end event

type dw_clientes from dw_co_cliente_imp_instalacion_padre within w_ver_sum_importantes
integer x = 37
integer y = 40
integer width = 3113
integer height = 1392
integer taborder = 20
boolean hscrollbar = true
boolean vscrollbar = true
end type


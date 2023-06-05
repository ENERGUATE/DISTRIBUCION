HA$PBExportHeader$u_bri_2016_pr_ambito_brigadistas.sru
forward
global type u_bri_2016_pr_ambito_brigadistas from datawindow
end type
end forward

global type u_bri_2016_pr_ambito_brigadistas from datawindow
integer width = 2647
integer height = 128
integer taborder = 1
string dataobject = "d_bri_2016_ingreso_ambito_brigadista"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type
global u_bri_2016_pr_ambito_brigadistas u_bri_2016_pr_ambito_brigadistas

type variables
datawindowchild ddw_centro
datawindowchild ddw_cmd
end variables

forward prototypes
public function integer fnu_cargo_dddw_centro ()
public function integer fnu_cargo_dddw_cmd ()
public function integer fnu_filtro_por_cmd (integer pi_nro_cmd)
public function integer fpr_habilitar_mesa (boolean pb_habilitar)
end prototypes

public function integer fnu_cargo_dddw_centro ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargo_dddw_centro
// 
// Objetivo: Crea las dddw. internas del user object para 
//           ingreso de brigadistas.
//
// Ambito:	
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	09/09/98		AGO			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int ii

int l_cantidad
int i_fila

this.GetChild("nro_centro",ddw_centro)
ddw_centro.reset()	
for l_cantidad=1 to ddw_centro_shared.rowcount() 
		i_fila=ddw_centro.insertrow(0)
		ddw_centro.setitem(i_fila,"SGD_CENTRO_nro_centro",ddw_centro_shared.getitemnumber(l_cantidad,"SGD_CENTRO_nro_centro"))
		ddw_centro.setitem(i_fila,"SGD_CENTRO_nom_centro",ddw_centro_shared.getitemstring(l_cantidad,"SGD_CENTRO_nom_centro"))
		ddw_centro.setitem(i_fila,"SGD_relacion_centro_centro_resp",ddw_centro_shared.getitemnumber(l_cantidad,"SGD_relacion_centro_centro_resp"))
next

RETURN 1
end function

public function integer fnu_cargo_dddw_cmd ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_cargo_dddw_cmd
// 
// Objetivo: crea las drop down datawindows internas del user object.
//	
//
// Ambito:	
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  -- pd_dw -- datawindow
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	09/09/98		AGO			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
int ii

int l_cantidad
int i_fila

this.GetChild("nro_cmd",ddw_cmd)
ddw_cmd.reset()

for l_cantidad=1 to ddw_cmd_shared.rowcount() 
		i_fila=ddw_cmd.insertrow(0)
		ddw_cmd.setitem(i_fila,"SGD_CENTRO_nro_centro",ddw_cmd_shared.getitemnumber(l_cantidad,"SGD_CENTRO_nro_centro"))
		ddw_cmd.setitem(i_fila,"SGD_CENTRO_nom_centro",ddw_cmd_shared.getitemstring(l_cantidad,"SGD_CENTRO_nom_centro"))
		ddw_cmd.setitem(i_fila,"SGD_RELACION_CENTRO_centro_resp",ddw_cmd_shared.getitemnumber(l_cantidad,"SGD_RELACION_CENTRO_centro_resp"))
next


RETURN 1
end function

public function integer fnu_filtro_por_cmd (integer pi_nro_cmd);/////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_filtro_por_cmd
// 
// Objetivo: Filtrar datos del puesto para DDW. en funcion del Cmd ya 
//           seleccionado
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pd_dw
//       Salida:  pi_nro_centro
//
// Devuelve: integer
//
// Fecha		   Responsable	 Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		   -----------	 ---------
// 04/09/1998  AG Matorra   Original(copia UO. 2001) (Brigadistas Inc. 3) 
////////////////////////////////////////////////////////////////////////
integer li_centro
DataWindowChild dw_centro
long aux
string xx

this.getchild("nro_mesa",dw_centro)
dw_centro.SetFilter("")
dw_centro.Filter()
dw_centro.SetTransObject(sqlca)
dw_centro.retrieve(1)
//li_centro=pd_dw.GetItemNumber(1,"nro_cmd")
li_centro=pi_nro_cmd
IF NOT IsNull(li_centro) AND (li_centro<>0) THEN
	dw_centro.SetFilter("sgd_relacion_centro_centro_resp = " + string(li_centro)+" OR  sgd_relacion_centro_centro_resp = 0")
	aux=dw_centro.Filter()
	aux=dw_centro.Filteredcount()
	return 0
Else
	return -1
END IF

end function

public function integer fpr_habilitar_mesa (boolean pb_habilitar);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos de....  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: 
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	19/07/96		  AF	     	Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

   IF pb_habilitar THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//       this.modify("nro_mesa.background.color=" + string(65536*255+256*255+255))
       this.modify("nro_mesa.background.color=" + gs_blanco)
//Fin. Sgo.
       this.SetTabOrder("nro_mesa",20)
   ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	    this.modify("nro_mesa.background.color=" + string(65536*192+256*192+192))
	    this.modify("nro_mesa.background.color=" + gs_gris)
// Fin. Sgo.
       this.SetTabOrder("nro_mesa",0)
   END IF


RETURN 1
end function

event constructor;//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("nro_cmd_t.Text = '" + fg_cor_dw("CMD:", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

on u_bri_2016_pr_ambito_brigadistas.create
end on

on u_bri_2016_pr_ambito_brigadistas.destroy
end on


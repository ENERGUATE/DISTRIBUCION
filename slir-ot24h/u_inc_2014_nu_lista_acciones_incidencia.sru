HA$PBExportHeader$u_inc_2014_nu_lista_acciones_incidencia.sru
forward
global type u_inc_2014_nu_lista_acciones_incidencia from nonvisualobject
end type
end forward

global type u_inc_2014_nu_lista_acciones_incidencia from nonvisualobject
end type
global u_inc_2014_nu_lista_acciones_incidencia u_inc_2014_nu_lista_acciones_incidencia

type variables

end variables

forward prototypes
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_incidencia)
public function integer fnu_quitar_accion (datawindow pd_dw, long pl_row)
public function integer fnu_grabar_acciones_inc (ref datawindow pd_dw)
public function integer fnu_obtener_obs_accion (multilineedit mle_obs_accion, string ps_observacion)
public function integer fnu_devolver_obs_accion (ref datawindow pd_dw, multilineedit mle_obs_accion, long pl_row_inc)
public function integer fnu_agregar_accion (ref datawindow pd_dw, integer pi_nro_accion, string ps_descripcion, long pl_nro_incidencia, long pl_row, boolean pb_usuario_mant)
end prototypes

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_incidencia);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_obtener_datos
//
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n con la base de datos y retrieve de la
//	          datawindow del n$$HEX1$$fa00$$ENDHEX$$mero de incidencia.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pl_nro_incidencia
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

pd_dw.SetTransObject(SQLCA)
pd_dw.Retrieve(pl_nro_incidencia)

Return 1
end function

public function integer fnu_quitar_accion (datawindow pd_dw, long pl_row);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_quitar_accion
//
// Objetivo: Obtiene datos si los encuentra, marca y desmarca la fila.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pl_row
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


long ll_fila
string ls_obs

ll_fila=pd_dw.RowCount()
IF ll_fila>0 THEN
	pd_dw.Deleterow(pl_row)
	IF ll_fila=1  THEN
			Return 1
	END IF
	if pd_dw.rowcount() > 0 then 
	pd_dw.SelectRow(0,False)
	pd_dw.SelectRow(1,True)
end if 

	
END IF
return 1
end function

public function integer fnu_grabar_acciones_inc (ref datawindow pd_dw);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_grabar_acciones_inc
// 
// Objetivo: Graba datos de incidencia.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


datetime ld_fecha1,ld_fecha2,ld_fecha3
long i,ll_inc
int li_cod_accion
string ls_usu,ls_prog,ls_obs


//for i=1 to pd_dw.RowCount()
//	ld_fecha1=pd_dw.getitemDatetime(i,"f_actual")
//	ld_fecha2=pd_dw.getitemDatetime(i,"h_actual")
//	ld_fecha3=pd_dw.getitemDatetime(i,"f_alta")
//	ls_usu=pd_dw.getitemstring(i,"usuario")
//	ls_prog=pd_dw.getitemstring(i,"programa")
//	li_cod_accion=pd_dw.getitemnumber(i,"cod_accion")
//	ll_inc=pd_dw.getitemnumber(i,"nro_incidencia")
//	ls_obs=pd_dw.getitemstring(i,"observacion")
//NEXT
pd_dw.Update()

return 1
end function

public function integer fnu_obtener_obs_accion (multilineedit mle_obs_accion, string ps_observacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_obs_accion
// 
// Objetivo: Carga el MultiLineEdit de observacion de acciones
//				 de incidencia con el texto pasado como par$$HEX1$$e100$$ENDHEX$$metro
//	Ambito:	 P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: mle_obs_accion, ps_observacion
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF ISNULL(ps_observacion) THEN
	ps_observacion=" "
END IF
mle_obs_accion.text=ps_observacion

return 1
end function

public function integer fnu_devolver_obs_accion (ref datawindow pd_dw, multilineedit mle_obs_accion, long pl_row_inc);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_obs_accion
// 
// Objetivo: Inserta en la datawindow de lista de incidencia la 
//				observacion de la accion y la fecha y hora de alta. 
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: pd_dw, mle_obs_accion, pl_row_inc
//		Salida:  --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	29/2/96		SAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_fila
pd_dw.SetItem(pl_row_inc,"Observacion",mle_obs_accion.text)
pd_dw.SetItem(pl_row_inc,"f_actual",fgnu_fecha_actual())
pd_dw.SetItem(pl_row_inc,"h_actual",fgnu_fecha_actual())
pd_dw.SetItem(1,"usuario",gs_usuario)

Return 1
end function

public function integer fnu_agregar_accion (ref datawindow pd_dw, integer pi_nro_accion, string ps_descripcion, long pl_nro_incidencia, long pl_row, boolean pb_usuario_mant);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_agregar_accion
//
// Objetivo: Setea los datos de la datawindow seg$$HEX1$$fa00$$ENDHEX$$n los par$$HEX1$$e100$$ENDHEX$$metros recibidos.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pd_dw, pi_nro_accion, ps_descripcion, pl_nro_incidencia,
//             pl_row
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


long ll_cant_filas

pd_dw.InsertRow(pl_row)
pd_dw.SetItem(1,"nro_incidencia",pl_nro_incidencia)
pd_dw.SetItem(1,"usuario",gs_usuario)
pd_dw.SetItem(1,"f_actual",fgnu_fecha_actual())
pd_dw.SetItem(1,"h_actual",fgnu_fecha_actual())
pd_dw.SetItem(1,"programa","fnu_agr")
pd_dw.SetItem(1,"f_alta",fgcd_fecha_con_seg())
pd_dw.SetItem(1,"cod_accion",pi_nro_accion)
pd_dw.SetItem(1,"accion",ps_descripcion)
pd_dw.SetItem(1,"observacion"," ")
if pb_usuario_mant=true THEN
	pd_dw.SetItem(1,"accion_inc_tip_accion",gi_usuario_mant)
ELSE
	pd_dw.SetItem(1,"accion_inc_tip_accion",gi_usuario_oper)
END IF
return 1
end function


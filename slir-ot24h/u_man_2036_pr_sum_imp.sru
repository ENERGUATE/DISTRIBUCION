HA$PBExportHeader$u_man_2036_pr_sum_imp.sru
forward
global type u_man_2036_pr_sum_imp from datawindow
end type
end forward

global type u_man_2036_pr_sum_imp from datawindow
integer width = 2272
integer height = 400
integer taborder = 1
string dataobject = "d_man_2036_pr_sum_imp"
boolean border = false
boolean livescroll = true
end type
global u_man_2036_pr_sum_imp u_man_2036_pr_sum_imp

forward prototypes
public function integer fpr_habilitar_campos (ref datawindow pd_dw, boolean pb_todos)
public function integer fpr_insertar_fila ()
public function integer fpr_limpiar_campos ()
public function integer fpr_llenar_campos (long pl_cod_cli)
end prototypes

public function integer fpr_habilitar_campos (ref datawindow pd_dw, boolean pb_todos);//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
//// 
//// Objetivo:	Habilita los campos de....  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
////	en color blanco o gris.
////
//// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
////
//// Par$$HEX1$$e100$$ENDHEX$$metros:
////	Entrada: 
////
////	Salida:  -- 
////						
//// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
////
////  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ---------	-------		----------------------------------------
////	19/07/96		AF	     	Versi$$HEX1$$f300$$ENDHEX$$n Original
////
//////////////////////////////////////////////////////////////////////////////////////////////////

IF pb_todos = FALSE THEN
	pd_dw.modify("f_desde.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("f_desde.background.color="+string(65536*192+256*192+192))
////	pd_dw.modify("f_fin.protect=1")
////	pd_dw.modify("f_fin.background.color="+string(rgb(192,192,192)))
//	pd_dw.modify("f_expiracion.protect=1")
//	pd_dw.modify("f_expiracion.background.color="+string(65536*192+256*192+192))
//	pd_dw.modify("observacion.protect=1")
//	pd_dw.modify("observacion.background.color="+string(65536*192+256*192+192))
//	pd_dw.modify("telefono.protect=1")
//	pd_dw.modify("telefono.background.color="+string(65536*192+256*192+192))
//	pd_dw.modify("contacto.protect=1")
//	pd_dw.modify("contacto.background.color="+string(65536*192+256*192+192))

	pd_dw.modify("f_desde.background.color="+gs_gris)
	pd_dw.modify("f_expiracion.protect=1")
	pd_dw.modify("f_expiracion.background.color="+gs_gris)
	pd_dw.modify("observacion.protect=1")
	pd_dw.modify("observacion.background.color="+gs_gris)
	pd_dw.modify("telefono.protect=1")
	pd_dw.modify("telefono.background.color="+gs_gris)
	pd_dw.modify("contacto.protect=1")
	pd_dw.modify("contacto.background.color="+gs_gris)
// Fin. Sgo.
ELSE
	pd_dw.modify("f_desde.protect=0")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	pd_dw.modify("f_desde.background.color="+string(65536*255+256*255+255))
////	pd_dw.modify("f_fin.protect=0")
////	pd_dw.modify("f_fin.background.color="+string(rgb(255,255,255)))
//	pd_dw.modify("f_expiracion.protect=0")
//	pd_dw.modify("f_expiracion.background.color="+string(65536*255+256*255+255))
//	pd_dw.modify("observacion.protect=0")
//	pd_dw.modify("observacion.background.color="+string(65536*255+256*255+255))
//	pd_dw.modify("telefono.protect=0")
//	pd_dw.modify("telefono.background.color="+string(65536*255+256*255+255))
//	pd_dw.modify("contacto.protect=0")
//	pd_dw.modify("contacto.background.color="+string(65536*255+256*255+255))

	pd_dw.modify("f_desde.background.color="+gs_blanco)
	pd_dw.modify("f_expiracion.protect=0")
	pd_dw.modify("f_expiracion.background.color="+gs_blanco)
	pd_dw.modify("observacion.protect=0")
	pd_dw.modify("observacion.background.color="+gs_blanco)
	pd_dw.modify("telefono.protect=0")
	pd_dw.modify("telefono.background.color="+gs_blanco)
	pd_dw.modify("contacto.protect=0")
	pd_dw.modify("contacto.background.color="+gs_blanco)
// Fin. Sgo.
END IF

RETURN 1

end function

public function integer fpr_insertar_fila ();This.InsertRow(0)

RETURN 1
end function

public function integer fpr_limpiar_campos ();string ls_nula

SetNull(ls_nula)

This.SetItem(1,"observacion",ls_nula)

AcceptText()

RETURN 1
end function

public function integer fpr_llenar_campos (long pl_cod_cli);Date ld_fecha, ld_fecha_maniana
DateTime ldt_fecha, ldt_fecha_maniana, ldt_nula

SetNull(ldt_nula)
ld_fecha = Date(fgnu_fecha_actual())
ld_fecha_maniana = RelativeDate(ld_fecha,1)

ldt_fecha = DateTime(ld_fecha)
ldt_fecha_maniana = DateTime(ld_fecha_maniana)

This.SetItem(1,"f_desde",ldt_fecha)
//This.SetItem(1,"f_fin",ldt_nula)
This.SetItem(1,"f_expiracion",ldt_fecha_maniana)
This.Setitem(1,"cod_Cli",pl_cod_cli)
return 1
end function

on u_man_2036_pr_sum_imp.create
end on

on u_man_2036_pr_sum_imp.destroy
end on


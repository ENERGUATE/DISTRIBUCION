HA$PBExportHeader$u_dir_2011_pr_direccion_std.sru
forward
global type u_dir_2011_pr_direccion_std from datawindow
end type
end forward

global type u_dir_2011_pr_direccion_std from datawindow
integer width = 2176
integer height = 336
string dataobject = "d_direccion"
end type
global u_dir_2011_pr_direccion_std u_dir_2011_pr_direccion_std

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_dir_global, boolean pb_dir_particular)
end prototypes

public function integer fpr_habilitar_campos (boolean pb_dir_global, boolean pb_dir_particular);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fpr_habilitar_campos
// 
// Objetivo:	Habilita los campos numero, duplicador y cgv en funci$$HEX1$$f300$$ENDHEX$$n del
// valor de los par$$HEX1$$e100$$ENDHEX$$metros que recibe.  Adem$$HEX1$$e100$$ENDHEX$$s coloca el fondo de los mismos
//	en color blanco o gris
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//	Entrada: pb_dir_global (boolean que indica si se habilita la provincia,departamento,municipio y localidad)
//				pb_dir_particular (boolean que indica si se habilita la calle,nro. puerta,duplicador y cgv)
//
//	Salida:  -- 
//						
// Devuelve:	c$$HEX1$$f300$$ENDHEX$$digo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	22/01/96		  	HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

IF pb_dir_global THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//    this.modify("Provincia.background.color= " + string(65536*255+256*255+255))
//	 this.modify("depto.background.color= " + string(65536*255+256*255+255))
//	 this.modify("Municipio.background.color= " + string(65536*255+256*255+255))
//	 this.modify("Localidad.background.color= " + string(65536*255+256*255+255))
    this.modify("Provincia.background.color= " + gs_blanco)
	 this.modify("depto.background.color= " + gs_blanco)
	 this.modify("Municipio.background.color= " + gs_blanco)
	 this.modify("Localidad.background.color= " + gs_blanco)
// Fin. Sgo.
    this.SetTabOrder("Provincia",10)
    this.SetTabOrder("depto",20)
    this.SetTabOrder("Municipio",30)
    this.SetTabOrder("Localidad",40)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
	this.modify("Provincia.background.color=" + gs_gris +&
			 "~t depto.background.color=" + gs_gris +&
			 "~t Municipio.background.color=" + gs_gris +&
			 "~t Localidad.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("Provincia",0)
	this.SetTabOrder("depto",0)
	this.SetTabOrder("Municipio",0)
	this.SetTabOrder("Localidad",0)
END IF

IF pb_dir_particular THEN
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("calle.background.color=" + string(65536*255+256*255+255) +&
//			"~t numero.background.color=" + string(65536*255+256*255+255) +&
//			"~t duplic.background.color=" + string(65536*255+256*255+255) +&
//			"~t cgv.background.color=" + string(65536*255+256*255+255))
	this.modify("calle.background.color=" + gs_blanco +&
			"~t numero.background.color=" + gs_blanco +&
			"~t duplic.background.color=" + gs_blanco +&
			"~t cgv.background.color=" + gs_blanco)
// Fin. Sgo.
	this.SetTabOrder("calle",50)
	this.SetTabOrder("numero",60)
	this.SetTabOrder("duplic",70)
	this.SetTabOrder("cgv",80)
ELSE
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	this.modify("calle.background.color=" + string(65536*192+256*192+192) +&
//			"~t numero.background.color=" + string(65536*192+256*192+192) +&
//			"~t duplic.background.color=" + string(65536*192+256*192+192) +&
//			"~t cgv.background.color=" + string(65536*192+256*192+192))
	this.modify("calle.background.color=" + gs_gris +&
			"~t numero.background.color=" + gs_gris +&
			"~t duplic.background.color=" + gs_gris +&
			"~t cgv.background.color=" + gs_gris)
// Fin. Sgo.
	this.SetTabOrder("calle",0)
	this.SetTabOrder("numero",0)
	this.SetTabOrder("duplic",0)
	this.SetTabOrder("cgv",0)
END IF

RETURN 1
end function

event constructor;//this.SetTransObject(SQLCA)
//**************************************************
//**  AMR PM_U003MOSTRAR TIPOS DE VIAS 13/06/2002  **
//**************************************************
If gb_tipos_de_via Then
	This.Modify("c_tipo_via_t.Visible=1")
	This.Modify("calle.Visible=0")
End If

fg_mover_campos_num_puerta_duplic(This)
//**************************************************
//**  AMR PM_U003MOSTRAR TIPOS DE VIAS 13/06/2002  **
//**************************************************

end event

event itemerror;RETURN(2)
end event

on clicked;//
end on

on dberror;//
end on

on rowfocuschanged;//
end on

on u_dir_2011_pr_direccion_std.create
end on

on u_dir_2011_pr_direccion_std.destroy
end on


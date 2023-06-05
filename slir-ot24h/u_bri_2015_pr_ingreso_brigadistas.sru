HA$PBExportHeader$u_bri_2015_pr_ingreso_brigadistas.sru
forward
global type u_bri_2015_pr_ingreso_brigadistas from datawindow
end type
end forward

global type u_bri_2015_pr_ingreso_brigadistas from datawindow
integer width = 2597
integer height = 580
string dataobject = "d_bri_2015_ingreso_brigadistas"
end type
global u_bri_2015_pr_ingreso_brigadistas u_bri_2015_pr_ingreso_brigadistas

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_todos)
public function integer fpr_color_texto ()
public function integer fpr_limpiar_campos ()
end prototypes

public function integer fpr_habilitar_campos (boolean pb_todos);////////////////////////////////////////////////////////////////////////////////////////////////
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
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	    this.modify("nro_brigadistas.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("nro_brigadistas",0)
//
//   IF pb_todos THEN
//
//       this.modify("nombre.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("nombre",20)
//       this.modify("ape1.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("ape1",30)
//       this.modify("ape2.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("ape2",40)
//       this.modify("nro_contrata.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("nro_contrata",70)
//       this.modify("tip_doc.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("tip_doc",80)
//       this.modify("doc_id.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("doc_id",90)
//       this.modify("co_pais.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("co_pais",100)
//		 this.modify("cod_profesion.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("cod_profesion",50)
//		 this.modify("cod_contrata.background.color=" + string(65536*255+256*255+255))
//       this.SetTabOrder("cod_contrata",60)
//		 this.modify("ind_disponible.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("ind_disponible",0)
//		 //this.modify("pi_turno.background.color=" + string(65536*255+256*255+255))
//       //this.SetTabOrder("pi_turno",120)
//   ELSE
//	    this.modify("nombre.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("nombre",0)
//	    this.modify("ape1.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("ape1",0)
//	    this.modify("ape2.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("ape2",0)
//	    this.modify("nro_contrata.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("nro_contrata",0)
//	    this.modify("tip_doc.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("tip_doc",0)
//	    this.modify("doc_id.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("doc_id",0)
//	    this.modify("co_pais.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("co_pais",0)
//		 this.modify("cod_profesion.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("cod_profesion",0)
//		 this.modify("cod_contrata.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("cod_contrata",0)
//	 	 this.modify("ind_disponible.background.color=" + string(65536*192+256*192+192))
//       this.SetTabOrder("ind_disponible",0)
//		 //this.modify("pi_turno.background.color=" + string(65536*192+256*192+192))
//       //this.SetTabOrder("pi_turno",0)
//   END IF
//
//
//RETURN 1

	    this.modify("nro_brigadistas.background.color=" + gs_gris)
       this.SetTabOrder("nro_brigadistas",0)

   IF pb_todos THEN

       this.modify("nombre.background.color=" + gs_blanco)
       this.SetTabOrder("nombre",20)
       this.modify("ape1.background.color=" + gs_blanco)
       this.SetTabOrder("ape1",30)
       this.modify("ape2.background.color=" + gs_blanco)
       this.SetTabOrder("ape2",40)
       this.modify("nro_contrata.background.color=" + gs_blanco)
       this.SetTabOrder("nro_contrata",70)
       this.modify("tip_doc.background.color=" + gs_blanco)
       this.SetTabOrder("tip_doc",80)
       this.modify("doc_id.background.color=" + gs_blanco)
       this.SetTabOrder("doc_id",90)
       this.modify("co_pais.background.color=" + gs_blanco)
       this.SetTabOrder("co_pais",100)
		 this.modify("cod_profesion.background.color=" + gs_blanco)
       this.SetTabOrder("cod_profesion",50)
		 this.modify("cod_contrata.background.color=" + gs_blanco)
       this.SetTabOrder("cod_contrata",60)
		 this.modify("ind_disponible.background.color=" + gs_gris)
       this.SetTabOrder("ind_disponible",0)
		 //this.modify("pi_turno.background.color=" + string(65536*255+256*255+255))
       //this.SetTabOrder("pi_turno",120)
   ELSE
	    this.modify("nombre.background.color=" + gs_gris)
       this.SetTabOrder("nombre",0)
	    this.modify("ape1.background.color=" + gs_gris)
       this.SetTabOrder("ape1",0)
	    this.modify("ape2.background.color=" + gs_gris)
       this.SetTabOrder("ape2",0)
	    this.modify("nro_contrata.background.color=" + gs_gris)
       this.SetTabOrder("nro_contrata",0)
	    this.modify("tip_doc.background.color=" + gs_gris)
       this.SetTabOrder("tip_doc",0)
	    this.modify("doc_id.background.color=" + gs_gris)
       this.SetTabOrder("doc_id",0)
	    this.modify("co_pais.background.color=" + gs_gris)
       this.SetTabOrder("co_pais",0)
		 this.modify("cod_profesion.background.color=" + gs_gris)
       this.SetTabOrder("cod_profesion",0)
		 this.modify("cod_contrata.background.color=" + gs_gris)
       this.SetTabOrder("cod_contrata",0)
	 	 this.modify("ind_disponible.background.color=" + gs_gris)
       this.SetTabOrder("ind_disponible",0)
		 //this.modify("pi_turno.background.color=" + string(65536*192+256*192+192))
       //this.SetTabOrder("pi_turno",0)
   END IF


RETURN 1
// Fin. Sgo.
end function

public function integer fpr_color_texto ();this.Modify("nombre.color=" + string(65536*128))
this.Modify("ape1.color=" + string(65536*128))
this.Modify("ape2.color=" + string(65536*128))
this.Modify("nro_contrata.color=" + string(65536*128))
this.Modify("tip_doc.color=" + string(65536*128))
this.Modify("doc_id.color=" + string(65536*128))
this.Modify("co_pais.color=" + string(65536*128))
this.Modify("cod_profesion.color=" + string(65536*128))
this.Modify("cod_contrata.color=" + string(65536*128))

RETURN 1

end function

public function integer fpr_limpiar_campos ();string ls_nulo
long ll_nulo

SetNull(ls_nulo)
SetNull(ll_nulo)

This.SetItem(1,"nombre","")
This.SetItem(1,"ape1","")
This.SetItem(1,"ape2","")
This.SetItem(1,"nro_contrata",1)
This.SetItem(1,"tip_doc","TD001")	//DNI
This.SetItem(1,"doc_id",1)
This.SetItem(1,"co_pais","PD005")	// Uruguay
This.SetItem(1,"cod_profesion",1)
//This.SetItem(1,"cod_contrata",1)

Return 1
end function

on u_bri_2015_pr_ingreso_brigadistas.create
end on

on u_bri_2015_pr_ingreso_brigadistas.destroy
end on


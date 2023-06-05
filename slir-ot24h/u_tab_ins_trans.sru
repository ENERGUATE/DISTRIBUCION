HA$PBExportHeader$u_tab_ins_trans.sru
forward
global type u_tab_ins_trans from tab
end type
type tabpage_1 from userobject within u_tab_ins_trans
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within u_tab_ins_trans
dw_1 dw_1
end type
type tabpage_2 from userobject within u_tab_ins_trans
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within u_tab_ins_trans
dw_2 dw_2
end type
end forward

global type u_tab_ins_trans from tab
integer width = 2523
integer height = 1092
integer taborder = 1
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
global u_tab_ins_trans u_tab_ins_trans

type variables
boolean ib_modifico
BOOLEAN IB_ALTA
boolean ib_vacio

end variables

forward prototypes
public function integer f_obtener_datos (ref decimal pdec_nro_instalacion)
public function integer f_deshabilitar_campos ()
public function integer f_modificar ()
public function integer f_dar_alta (decimal pd_numins)
public function integer f_preparar_alta ()
end prototypes

public function integer f_obtener_datos (ref decimal pdec_nro_instalacion);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_obtener_datos
// 
// Objetivo:	Realiza el retrive de las DW y si no encontrara datos, inserta una fila 
//					en blanco
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
//	11/02/1997		FDB	    Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

date ld_hoy=today()
time lt_hoy=now()
long ll_retrieve

tabpage_1.dw_1.settransobject(sqlca)
tabpage_2.dw_2.settransobject(sqlca)

ll_retrieve = tabpage_1.dw_1.retrieve(pdec_nro_instalacion)
tabpage_2.dw_2.retrieve(pdec_nro_instalacion)

if ll_retrieve <= 0 then
	w_3301_detalle_instalacion.cb_borrar.visible=false
	f_preparar_alta()
   tabpage_1.dw_1.insertrow(0)
	tabpage_2.dw_2.insertrow(0)
	IB_ALTA=TRUE
	this.tabpage_1.dw_1.SETITEM(1,"YEAR",DATETIME(ld_hoy, lt_hoy))
	this.tabpage_2.dw_2.SETITEM(1,"DATE_OVERHAUL",DATETIME(ld_hoy, lt_hoy))
ELSE 
	ib_alta=FALSE
end if

return 1

end function

public function integer f_deshabilitar_campos ();////////////////////////////////////////////////////////////////////////////////////////////////
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
//	11/02/1997		FDB	    Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//// deshabilita datawindows1
//	    tabpage_1.dw_1.modify("company_no.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("company_no",0)
//	    tabpage_1.dw_1.modify("manufacturer.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("manufacturer",0)
//	    tabpage_1.dw_1.modify("model.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("model",0)
//	    tabpage_1.dw_1.modify("make.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("make",0)
//	    tabpage_1.dw_1.modify("serial_no.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("serial_no",0)
//	    tabpage_1.dw_1.modify("year.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("year",0)
//	    tabpage_1.dw_1.modify("weight.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("weight",0)
//		 tabpage_1.dw_1.modify("construction.background.color=" + string(65536*192+256*192+192))
//       tabpage_1.dw_1.SetTabOrder("construction",0)
//// deshabilita datawindows 2
//
// 		 tabpage_2.dw_2.modify("phases.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("phases",0)
//	    tabpage_2.dw_2.modify("type_tap.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("type_tap",0)
//	    tabpage_2.dw_2.modify("TYPE_BUSHING.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("TYPE_BUSHING",0)
//	    tabpage_2.dw_2.modify("range_tap.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("range_tap",0)
//	    tabpage_2.dw_2.modify("SC_IMPEDANCE.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("SC_IMPEDANCE",0)
//	    tabpage_2.dw_2.modify("volt_ratio.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("volt_ratio",0)
//	    tabpage_2.dw_2.modify("type_a_horn.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("type_a_horn",0)
//		 tabpage_2.dw_2.modify("a_horn_gap.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("a_horn_gap",0)
//		 tabpage_2.dw_2.modify("DATE_OVERHAUL.background.color=" + string(65536*192+256*192+192))
//       tabpage_2.dw_2.SetTabOrder("DATE_OVERHAUL",0)
//return 1

// deshabilita datawindows1
	    tabpage_1.dw_1.modify("company_no.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("company_no",0)
	    tabpage_1.dw_1.modify("manufacturer.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("manufacturer",0)
	    tabpage_1.dw_1.modify("model.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("model",0)
	    tabpage_1.dw_1.modify("make.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("make",0)
	    tabpage_1.dw_1.modify("serial_no.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("serial_no",0)
	    tabpage_1.dw_1.modify("year.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("year",0)
	    tabpage_1.dw_1.modify("weight.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("weight",0)
		 tabpage_1.dw_1.modify("construction.background.color=" + gs_gris)
       tabpage_1.dw_1.SetTabOrder("construction",0)
// deshabilita datawindows 2

 		 tabpage_2.dw_2.modify("phases.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("phases",0)
	    tabpage_2.dw_2.modify("type_tap.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("type_tap",0)
	    tabpage_2.dw_2.modify("TYPE_BUSHING.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("TYPE_BUSHING",0)
	    tabpage_2.dw_2.modify("range_tap.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("range_tap",0)
	    tabpage_2.dw_2.modify("SC_IMPEDANCE.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("SC_IMPEDANCE",0)
	    tabpage_2.dw_2.modify("volt_ratio.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("volt_ratio",0)
	    tabpage_2.dw_2.modify("type_a_horn.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("type_a_horn",0)
		 tabpage_2.dw_2.modify("a_horn_gap.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("a_horn_gap",0)
		 tabpage_2.dw_2.modify("DATE_OVERHAUL.background.color=" + gs_gris)
       tabpage_2.dw_2.SetTabOrder("DATE_OVERHAUL",0)
return 1
// Fin. Sgo.

end function

public function integer f_modificar ();    string LS_COMP
	 LS_COMP=tabpage_1.dw_1.GETITEMSTRING(1,"company_no")
	 string ls_manu
	 ls_manu=tabpage_1.dw_1.GETITEMSTRING(1,"manufacturer")
	 string ls_model
	 ls_model=tabpage_1.dw_1.GETITEMSTRING(1,"model")
	 String ls_make
	 ls_make=tabpage_1.dw_1.GETITEMSTRING(1,"make")
	 string ls_serial
	 ls_serial=tabpage_1.dw_1.GETITEMSTRING(1,"serial_no")
	 datetime ld_year
	 ld_year=tabpage_1.dw_1.GETITEMDATETIME(1,"year")
	 LONG ll_phases
	 ll_phases=tabpage_2.dw_2.GETITEMnumber(1,"phases")
	 LONG ll_construction
	 ll_construction=tabpage_1.dw_1.GETITEMnumber(1,"construction")
	 LONG ll_typetap
	 ll_typetap=tabpage_2.dw_2.GETITEMnumber(1,"type_tap")
	 LONG ll_typebus
	 ll_typebus=tabpage_2.dw_2.GETITEMnumber(1,"type_bushing")
	 string ls_range
	 ls_range=tabpage_2.dw_2.GETITEMstring(1,"range_tap")
	 string ls_imp
	 ls_imp=tabpage_2.dw_2.GETITEMstring(1,"sc_impedance")
	 string ls_voltr
	 ls_voltr=tabpage_2.dw_2.GETITEMstring(1,"volt_ratio")
	 string ls_typea
	 ls_typea=tabpage_2.dw_2.GETITEMstring(1,"type_a_horn")
	 LONG ll_ahorn
	 ll_ahorn=tabpage_2.dw_2.GETITEMnumber(1,"a_horn_gap")
	 LONG ll_weight
	 ll_weight=tabpage_1.dw_1.GETITEMnumber(1,"weight")
	 datetime ld_date
	 ld_date=tabpage_2.dw_2.GETITEMdatetime(1,"date_overhaul")
	

	   UPDATE "DETALLES_INSTALACION"  
      SET "COMPANY_NO" = :LS_COMP,   
         "MANUFACTURER" = :ls_manu,   
         "MODEL" = :ls_model,   
         "MAKE" = :ls_make,   
         "SERIAL_NO" = :ls_serial,   
         "YEAR" = :ld_year,   
         "PHASES" =:ll_phases,   
         "CONSTRUCTION" = :ll_construction,   
         "TYPE_TAP" = :ll_typetap,   
         "TYPE_BUSHING" = :ll_typebus,   
         "RANGE_TAP" = :ls_range,   
         "SC_IMPEDANCE" = :ls_imp,   
         "VOLT_RATIO" = :ls_voltr,   
         "TYPE_A_HORN" =:ls_typea,   
         "A_HORN_GAP" = :ll_ahorn,   
         "WEIGHT" = :ll_weight,   
         "DATE_OVERHAUL" = :ld_date;   
if sqlca.sqlcode<0 then 
	return 0
else	
	return 1
end if
end function

public function integer f_dar_alta (decimal pd_numins);	 DEC LD_NUMIST
	 LD_NUMIST=PD_NUMINS
    string LS_COMP
	 LS_COMP=tabpage_1.dw_1.GETITEMSTRING(1,"company_no")
	 string ls_manu
	 ls_manu=tabpage_1.dw_1.GETITEMSTRING(1,"manufacturer")
	 string ls_model
	 ls_model=tabpage_1.dw_1.GETITEMSTRING(1,"model")
	 String ls_make
	 ls_make=tabpage_1.dw_1.GETITEMSTRING(1,"make")
	 string ls_serial
	 ls_serial=tabpage_1.dw_1.GETITEMSTRING(1,"serial_no")
	 datetime ld_year
	 ld_year=tabpage_1.dw_1.GETITEMDATETIME(1,"year")
	 LONG ll_phases
	 ll_phases=tabpage_2.dw_2.GETITEMnumber(1,"phases")
	 LONG ll_construction
	 ll_construction=tabpage_1.dw_1.GETITEMnumber(1,"construction")
	 LONG ll_typetap
	 ll_typetap=tabpage_2.dw_2.GETITEMnumber(1,"type_tap")
	 LONG ll_typebus
	 ll_typebus=tabpage_2.dw_2.GETITEMnumber(1,"type_bushing")
	 string ls_range
	 ls_range=tabpage_2.dw_2.GETITEMstring(1,"range_tap")
	 string ls_imp
	 ls_imp=tabpage_2.dw_2.GETITEMstring(1,"sc_impedance")
	 string ls_voltr
	 ls_voltr=tabpage_2.dw_2.GETITEMstring(1,"volt_ratio")
	 string ls_typea
	 ls_typea=tabpage_2.dw_2.GETITEMstring(1,"type_a_horn")
	 LONG ll_ahorn
	 ll_ahorn=tabpage_2.dw_2.GETITEMnumber(1,"a_horn_gap")
	 LONG ll_weight
	 ll_weight=tabpage_1.dw_1.GETITEMnumber(1,"weight")
	 datetime ld_date
	 ld_date=tabpage_2.dw_2.GETITEMdatetime(1,"date_overhaul")
	
  INSERT INTO "DETALLES_INSTALACION"  
         ( "COMPANY_NO",   
           "MANUFACTURER",   
           "MODEL",   
           "MAKE",   
           "SERIAL_NO",   
           "YEAR",   
           "PHASES",   
           "CONSTRUCTION",   
           "TYPE_TAP",   
           "TYPE_BUSHING",   
           "RANGE_TAP",   
           "SC_IMPEDANCE",   
           "VOLT_RATIO",   
           "TYPE_A_HORN",   
           "A_HORN_GAP",   
           "WEIGHT",   
           "DATE_OVERHAUL",   
           "INSTALLATION_NO" )  
  VALUES ( :LS_COMP,   
           :ls_manu,   
           :ls_model,   
           :ls_make,   
           :ls_serial,   
           :ld_year,   
           :ll_phases,   
           :ll_construction,   
           :ll_typetap,   
           :ll_typebus,   
           :ls_range,   
           :ls_imp,   
           :ls_voltr,   
           :ls_typea,   
           :ll_ahorn,   
           :ll_weight,   
           :ld_date,   
           :LD_NUMIST )  ;
if sqlca.sqlcode<0 then 
	return 0
else	
	return 1
end if
RETURN 1
end function

public function integer f_preparar_alta ();// deshabilita datawindows1
	    tabpage_1.dw_1.modify("company_no.color=" + string(0))
	    tabpage_1.dw_1.modify("manufacturer.color=" + string(0))
	    tabpage_1.dw_1.modify("model.color=" + string(0))
	    tabpage_1.dw_1.modify("make.color=" + string(0))
	    tabpage_1.dw_1.modify("serial_no.color=" + string(0))
	    tabpage_1.dw_1.modify("year.color=" + string(0))
	    tabpage_1.dw_1.modify("weight.color=" + string(0))
		 tabpage_1.dw_1.modify("construction.color=" + string(0))

// deshabilita datawindows 2

 		 tabpage_2.dw_2.modify("phases.color=" + string(0))
	    tabpage_2.dw_2.modify("type_tap.color=" + string(0))
	    tabpage_2.dw_2.modify("TYPE_BUSHING.color=" + string(0))
	    tabpage_2.dw_2.modify("range_tap.color=" + string(0))
	    tabpage_2.dw_2.modify("SC_IMPEDANCE.color=" + string(0))
	    tabpage_2.dw_2.modify("volt_ratio.color=" + string(0))
	    tabpage_2.dw_2.modify("type_a_horn.color=" + string(0))
		 tabpage_2.dw_2.modify("a_horn_gap.color=" + string(0))
		 tabpage_2.dw_2.modify("DATE_OVERHAUL.color=" + string(0))
return 1


end function

on u_tab_ins_trans.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on u_tab_ins_trans.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event constructor;ib_modifico=FALSE
end event

type tabpage_1 from userobject within u_tab_ins_trans
integer x = 18
integer y = 112
integer width = 2487
integer height = 964
long backcolor = 79741120
string text = "GENERIC"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Continue!"
long picturemaskcolor = 553648127
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer x = 14
integer y = 76
integer width = 2459
integer height = 852
integer taborder = 2
string dataobject = "d_generico_trans"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;
ib_modifico=true

end event

event editchanged;ib_modifico=true
end event

event losefocus;accepttext()
string ls_nombcampo
string ls_spaces
ls_spaces=trim(this.gettext())
ls_nombcampo=getcolumnname()
if ((ls_nombcampo="COMPANY_NO") and (isnull(ls_spaces)) or ls_spaces="") then
	ib_vacio=true
ELSE 
	ib_vacio=FALSE	
end if
end event

type tabpage_2 from userobject within u_tab_ins_trans
integer x = 18
integer y = 112
integer width = 2487
integer height = 964
long backcolor = 79741120
string text = "TECNICALS"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Custom056!"
long picturemaskcolor = 553648127
dw_2 dw_2
end type

on tabpage_2.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on tabpage_2.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within tabpage_2
integer x = 64
integer y = 92
integer width = 2359
integer height = 820
integer taborder = 2
string dataobject = "d_tecn_trans"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;ib_modifico=true
end event

event editchanged;ib_modifico=true
end event


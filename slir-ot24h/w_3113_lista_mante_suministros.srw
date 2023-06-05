HA$PBExportHeader$w_3113_lista_mante_suministros.srw
forward
global type w_3113_lista_mante_suministros from w_sgigenerica
end type
type ln_12 from line within w_3113_lista_mante_suministros
end type
type ln_10 from line within w_3113_lista_mante_suministros
end type
type ln_16 from line within w_3113_lista_mante_suministros
end type
type ln_13 from line within w_3113_lista_mante_suministros
end type
type ln_14 from line within w_3113_lista_mante_suministros
end type
type ln_11 from line within w_3113_lista_mante_suministros
end type
type ln_3 from line within w_3113_lista_mante_suministros
end type
type sle_calle from singlelineedit within w_3113_lista_mante_suministros
end type
type sle_departamento from singlelineedit within w_3113_lista_mante_suministros
end type
type sle_desde from singlelineedit within w_3113_lista_mante_suministros
end type
type sle_hasta from singlelineedit within w_3113_lista_mante_suministros
end type
type sle_localidad from singlelineedit within w_3113_lista_mante_suministros
end type
type sle_municipio from singlelineedit within w_3113_lista_mante_suministros
end type
type sle_provincia from singlelineedit within w_3113_lista_mante_suministros
end type
type st_1 from statictext within w_3113_lista_mante_suministros
end type
type st_2 from statictext within w_3113_lista_mante_suministros
end type
type st_3 from statictext within w_3113_lista_mante_suministros
end type
type st_4 from statictext within w_3113_lista_mante_suministros
end type
type st_5 from statictext within w_3113_lista_mante_suministros
end type
type st_8 from statictext within w_3113_lista_mante_suministros
end type
type st_desde from statictext within w_3113_lista_mante_suministros
end type
type st_hasta from statictext within w_3113_lista_mante_suministros
end type
type cbx_todas from checkbox within w_3113_lista_mante_suministros
end type
type p_acometida from picture within w_3113_lista_mante_suministros
end type
type st_nom_inst from statictext within w_3113_lista_mante_suministros
end type
type cb_sel_aco from u_cb within w_3113_lista_mante_suministros
end type
type cb_buscar from u_cb within w_3113_lista_mante_suministros
end type
type cbx_sin_alim from checkbox within w_3113_lista_mante_suministros
end type
type st_desc_acometida from statictext within w_3113_lista_mante_suministros
end type
type st_u_geografica from statictext within w_3113_lista_mante_suministros
end type
type cb_desasociar from u_cb within w_3113_lista_mante_suministros
end type
type st_6 from statictext within w_3113_lista_mante_suministros
end type
type dw_suministros from u_ins_2016_pr_lista_sum_dir within w_3113_lista_mante_suministros
end type
type cbx_referencia from checkbox within w_3113_lista_mante_suministros
end type
type ln_7 from line within w_3113_lista_mante_suministros
end type
type ln_1 from line within w_3113_lista_mante_suministros
end type
type ln_2 from line within w_3113_lista_mante_suministros
end type
type ln_6 from line within w_3113_lista_mante_suministros
end type
type ln_4 from line within w_3113_lista_mante_suministros
end type
type ln_8 from line within w_3113_lista_mante_suministros
end type
type ln_5 from line within w_3113_lista_mante_suministros
end type
type ln_9 from line within w_3113_lista_mante_suministros
end type
type ln_15 from line within w_3113_lista_mante_suministros
end type
type cbx_una_acom from checkbox within w_3113_lista_mante_suministros
end type
type cb_1 from commandbutton within w_3113_lista_mante_suministros
end type
type dw_1 from datawindow within w_3113_lista_mante_suministros
end type
end forward

global type w_3113_lista_mante_suministros from w_sgigenerica
integer x = 14
integer y = 16
integer width = 3607
integer height = 2372
string title = ""
event ue_retrieve pbm_custom21
event ue_deshabilitar pbm_custom22
ln_12 ln_12
ln_10 ln_10
ln_16 ln_16
ln_13 ln_13
ln_14 ln_14
ln_11 ln_11
ln_3 ln_3
sle_calle sle_calle
sle_departamento sle_departamento
sle_desde sle_desde
sle_hasta sle_hasta
sle_localidad sle_localidad
sle_municipio sle_municipio
sle_provincia sle_provincia
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_8 st_8
st_desde st_desde
st_hasta st_hasta
cbx_todas cbx_todas
p_acometida p_acometida
st_nom_inst st_nom_inst
cb_sel_aco cb_sel_aco
cb_buscar cb_buscar
cbx_sin_alim cbx_sin_alim
st_desc_acometida st_desc_acometida
st_u_geografica st_u_geografica
cb_desasociar cb_desasociar
st_6 st_6
dw_suministros dw_suministros
cbx_referencia cbx_referencia
ln_7 ln_7
ln_1 ln_1
ln_2 ln_2
ln_6 ln_6
ln_4 ln_4
ln_8 ln_8
ln_5 ln_5
ln_9 ln_9
ln_15 ln_15
cbx_una_acom cbx_una_acom
cb_1 cb_1
dw_1 dw_1
end type
global w_3113_lista_mante_suministros w_3113_lista_mante_suministros

type variables
string is_where, is_seleccion
decimal{0} idec_nro_instal, idec_nro_padre_ant, idec_nro_padre_act
int ii_cod_prov, ii_cod_depto
long il_cod_munic, il_cod_loc
long il_cod_calle, il_desde, il_hasta, il_nro_aco, il_nro_sum

u_generico_comunicaciones       iu_resetear      
u_generico_comunicaciones       iu_gen_comunic
u_generico_comunicaciones       iu_gen_comunic1

u_ins_2016_nu_lista_sum_dir iu_ins_2016_nu

int ii_fila_selec, ii_fila_selec_ant

long il_nro_acometida, il_acometida_ant
Decimal  il_pot_contrata 

string  is_prov, is_depto, is_munic, is_local
string is_accion_llamada, is_descripcion, is_ref, is_calle_ref
boolean ib_sin_permisos
end variables

event ue_retrieve;call super::ue_retrieve;string ls_rc, ls_mod_string, ls_original_select

SetPointer(HourGlass!)

ls_original_select = dw_suministros.Describe("DataWindow.Table.Select")

ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + is_where + "'"

ls_rc = dw_suministros.Modify(ls_mod_string)

IF ls_rc = "" THEN
        IF dw_suministros.Retrieve() = 0 THEN
                gnv_msg.f_mensaje("AB02","","",OK!)
        END IF

        ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + "'" 

        ls_rc = dw_suministros.Modify(ls_mod_string)


END IF


end event

on ue_deshabilitar;call w_sgigenerica::ue_deshabilitar;sle_desde.Enabled      = False
sle_hasta.Enabled      = False
st_desde.Enabled       = False
st_hasta.Enabled       = False

cb_sel_aco.Visible    = False
cb_desasociar.Visible  = False


end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana con la lista de acometidas
//                               a mantener .
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        02/09/96   HMA
//
/////////////////////////////////////////////////////////////////////////

long ll_calle
string ls_calle
int li_tipo_inst

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//      iu_gen_comunic  --> para cargar la estructura local 
// iu_gen_comunic1 --> para cargar los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada

SetPointer(HourGlass!)
cb_sel_aco.enabled = FALSE
IF gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_SUMIN','ACC_CONSULTA') = 1 and &
	gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_SUMIN','ACC_MANTEN') <> 1 THEN
	cb_1.visible = False
//	cb_borrar.visible = False
	cb_desasociar.visible = False
	cb_sel_aco.visible = False
	
END IF



iu_resetear      = CREATE u_generico_comunicaciones
iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_gen_comunic1  = CREATE u_generico_comunicaciones

iu_ins_2016_nu = CREATE u_ins_2016_nu_lista_sum_dir

iu_gen_comunic.is_comunic = gu_comunic.is_comunic

is_accion_llamada = iu_gen_comunic.is_comunic.accion_llamada

// Cambiar los atributos de la ventana
//this.fpr_cambiar_atributos()

//sle_provincia.Text = gs_provincia
//sle_departamento.Text = gs_departamento
//sle_municipio.Text = gs_municipio
//sle_localidad.Text = gs_localidad
//
//ii_cod_prov   = gi_cod_provincia
//ii_cod_depto  = gi_cod_departamento
//ii_cod_munic  = gi_cod_municipio
//ii_cod_loc            = gi_cod_localidad
//il_cod_calle  = 0

is_prov = iu_gen_comunic.is_comunic.strval1
is_depto = iu_gen_comunic.is_comunic.strval2
is_munic = iu_gen_comunic.is_comunic.strval3
is_local = iu_gen_comunic.is_comunic.strval4

parnum2 = iu_gen_comunic.is_comunic.intval1                                     // Cod. Prov.
parnum3 = iu_gen_comunic.is_comunic.intval2                             // Cod. Depto.
parnum4 = iu_gen_comunic.is_comunic.longval4                                    // Cod. Munic.
parnum5 = iu_gen_comunic.is_comunic.longval5                                    // Cod. Loc.

sle_provincia.Text              = is_prov
sle_departamento.Text   = is_depto
sle_municipio.Text              = is_munic
sle_localidad.Text              = is_local

//// Si el perfil del usuario no es de mantenimiento de red,
//// se setea el acceso a la ventana como en modo "Consulta".
//IF NOT fgnu_tiene_perfil(fgci_perfil_oper_mante_red()) THEN
//
//      iu_gen_comunic.is_comunic.accion_llamada = "Consulta"
//END IF


IF iu_gen_comunic.is_comunic.accion_llamada = "Consulta" THEN

        This.Title = iu_gen_comunic.f_titulo_ventana("w_3113","Form.Cons.Sum.")
        This.TriggerEvent("ue_deshabilitar")
ELSEIF iu_gen_comunic.is_comunic.accion_llamada = "Actualizacion" THEN

        This.Title = iu_gen_comunic.f_titulo_ventana("w_3113","Form.Mante.Sum.")        
END IF

dw_suministros.SetTransObject(sqlca)

// Entra por defecto la Id. Geo. por Calle.
is_calle_ref = "Calle"

dw_1.modify("data_1.DataObject ='" + dw_suministros.DataObject + "'")


//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_1.Text = fg_geografica("1", st_1.Text)
st_2.Text = fg_geografica("2", st_2.Text)
st_3.Text = fg_geografica("3", st_3.Text)
st_4.Text = fg_geografica("4", st_4.Text)
//***************************************
//**  OSGI 2001.1  	04/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

event close;call super::close;IF isvalid(gu_comunic) then fgnu_resetear_s_comunicaciones(gu_comunic)

DESTROY iu_gen_comunic1
DESTROY iu_gen_comunic
DESTROY iu_resetear

DESTROY iu_ins_2016_nu
end event

on w_3113_lista_mante_suministros.create
int iCurrent
call super::create
this.ln_12=create ln_12
this.ln_10=create ln_10
this.ln_16=create ln_16
this.ln_13=create ln_13
this.ln_14=create ln_14
this.ln_11=create ln_11
this.ln_3=create ln_3
this.sle_calle=create sle_calle
this.sle_departamento=create sle_departamento
this.sle_desde=create sle_desde
this.sle_hasta=create sle_hasta
this.sle_localidad=create sle_localidad
this.sle_municipio=create sle_municipio
this.sle_provincia=create sle_provincia
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_8=create st_8
this.st_desde=create st_desde
this.st_hasta=create st_hasta
this.cbx_todas=create cbx_todas
this.p_acometida=create p_acometida
this.st_nom_inst=create st_nom_inst
this.cb_sel_aco=create cb_sel_aco
this.cb_buscar=create cb_buscar
this.cbx_sin_alim=create cbx_sin_alim
this.st_desc_acometida=create st_desc_acometida
this.st_u_geografica=create st_u_geografica
this.cb_desasociar=create cb_desasociar
this.st_6=create st_6
this.dw_suministros=create dw_suministros
this.cbx_referencia=create cbx_referencia
this.ln_7=create ln_7
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_6=create ln_6
this.ln_4=create ln_4
this.ln_8=create ln_8
this.ln_5=create ln_5
this.ln_9=create ln_9
this.ln_15=create ln_15
this.cbx_una_acom=create cbx_una_acom
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ln_12
this.Control[iCurrent+2]=this.ln_10
this.Control[iCurrent+3]=this.ln_16
this.Control[iCurrent+4]=this.ln_13
this.Control[iCurrent+5]=this.ln_14
this.Control[iCurrent+6]=this.ln_11
this.Control[iCurrent+7]=this.ln_3
this.Control[iCurrent+8]=this.sle_calle
this.Control[iCurrent+9]=this.sle_departamento
this.Control[iCurrent+10]=this.sle_desde
this.Control[iCurrent+11]=this.sle_hasta
this.Control[iCurrent+12]=this.sle_localidad
this.Control[iCurrent+13]=this.sle_municipio
this.Control[iCurrent+14]=this.sle_provincia
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.st_2
this.Control[iCurrent+17]=this.st_3
this.Control[iCurrent+18]=this.st_4
this.Control[iCurrent+19]=this.st_5
this.Control[iCurrent+20]=this.st_8
this.Control[iCurrent+21]=this.st_desde
this.Control[iCurrent+22]=this.st_hasta
this.Control[iCurrent+23]=this.cbx_todas
this.Control[iCurrent+24]=this.p_acometida
this.Control[iCurrent+25]=this.st_nom_inst
this.Control[iCurrent+26]=this.cb_sel_aco
this.Control[iCurrent+27]=this.cb_buscar
this.Control[iCurrent+28]=this.cbx_sin_alim
this.Control[iCurrent+29]=this.st_desc_acometida
this.Control[iCurrent+30]=this.st_u_geografica
this.Control[iCurrent+31]=this.cb_desasociar
this.Control[iCurrent+32]=this.st_6
this.Control[iCurrent+33]=this.dw_suministros
this.Control[iCurrent+34]=this.cbx_referencia
this.Control[iCurrent+35]=this.ln_7
this.Control[iCurrent+36]=this.ln_1
this.Control[iCurrent+37]=this.ln_2
this.Control[iCurrent+38]=this.ln_6
this.Control[iCurrent+39]=this.ln_4
this.Control[iCurrent+40]=this.ln_8
this.Control[iCurrent+41]=this.ln_5
this.Control[iCurrent+42]=this.ln_9
this.Control[iCurrent+43]=this.ln_15
this.Control[iCurrent+44]=this.cbx_una_acom
this.Control[iCurrent+45]=this.cb_1
this.Control[iCurrent+46]=this.dw_1
end on

on w_3113_lista_mante_suministros.destroy
call super::destroy
destroy(this.ln_12)
destroy(this.ln_10)
destroy(this.ln_16)
destroy(this.ln_13)
destroy(this.ln_14)
destroy(this.ln_11)
destroy(this.ln_3)
destroy(this.sle_calle)
destroy(this.sle_departamento)
destroy(this.sle_desde)
destroy(this.sle_hasta)
destroy(this.sle_localidad)
destroy(this.sle_municipio)
destroy(this.sle_provincia)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_8)
destroy(this.st_desde)
destroy(this.st_hasta)
destroy(this.cbx_todas)
destroy(this.p_acometida)
destroy(this.st_nom_inst)
destroy(this.cb_sel_aco)
destroy(this.cb_buscar)
destroy(this.cbx_sin_alim)
destroy(this.st_desc_acometida)
destroy(this.st_u_geografica)
destroy(this.cb_desasociar)
destroy(this.st_6)
destroy(this.dw_suministros)
destroy(this.cbx_referencia)
destroy(this.ln_7)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_6)
destroy(this.ln_4)
destroy(this.ln_8)
destroy(this.ln_5)
destroy(this.ln_9)
destroy(this.ln_15)
destroy(this.cbx_una_acom)
destroy(this.cb_1)
destroy(this.dw_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN triggerevent("ue_retrieve")

//IF dw_suministros.RowCount() = 0 THEN
//	messagebox("Atencion","No se han recuperado datos")
//	return
//END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_suministros

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3113_lista_mante_suministros
end type

type ln_12 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2665
integer beginy = 480
integer endx = 3374
integer endy = 480
end type

type ln_10 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2674
integer beginy = 224
integer endx = 3383
integer endy = 224
end type

type ln_16 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2661
integer beginy = 220
integer endx = 2661
integer endy = 484
end type

type ln_13 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 3383
integer beginy = 220
integer endx = 3383
integer endy = 488
end type

type ln_14 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 3378
integer beginy = 224
integer endx = 3378
integer endy = 488
end type

type ln_11 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2670
integer beginy = 484
integer endx = 3383
integer endy = 484
end type

type ln_3 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 101
integer beginy = 36
integer endx = 101
integer endy = 516
end type

type sle_calle from singlelineedit within w_3113_lista_mante_suministros
integer x = 2432
integer y = 100
integer width = 955
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_departamento from singlelineedit within w_3113_lista_mante_suministros
integer x = 823
integer y = 196
integer width = 919
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_desde from singlelineedit within w_3113_lista_mante_suministros
integer x = 3040
integer y = 256
integer width = 256
integer height = 84
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;IF Len(Trim(sle_desde.Text)) <> 0 AND &
   Not IsNumber(sle_desde.Text) THEN
       gnv_msg.f_mensaje("EM29","","",OK!)
		 this.text =''
ELSEIF Len(Trim(sle_desde.Text)) <> 0 AND &	
  		(integer(sle_desde.text) <= 0) THEN
		messagebox("Atencion","El valor de finca debe se mayor que cero")
		this.text=''
END IF
end event

type sle_hasta from singlelineedit within w_3113_lista_mante_suministros
integer x = 3045
integer y = 368
integer width = 256
integer height = 84
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean enabled = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

event modified;IF Len(Trim(sle_hasta.Text)) <> 0 AND &
   Not IsNumber(sle_hasta.Text) THEN
       gnv_msg.f_mensaje("EM29","","",OK!)
		 this.text = ''
ELSEIF Len(Trim(sle_hasta.Text)) <> 0 AND &	
  		(integer(sle_hasta.text) <= 0) THEN
		messagebox("Atencion","El valor de finca debe se mayor que cero")
		this.text = ''
END IF
end event

type sle_localidad from singlelineedit within w_3113_lista_mante_suministros
integer x = 823
integer y = 388
integer width = 919
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_municipio from singlelineedit within w_3113_lista_mante_suministros
integer x = 823
integer y = 292
integer width = 919
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_provincia from singlelineedit within w_3113_lista_mante_suministros
integer x = 823
integer y = 100
integer width = 919
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_3113_lista_mante_suministros
integer x = 247
integer y = 108
integer width = 576
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Provincia:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_3113_lista_mante_suministros
integer x = 247
integer y = 204
integer width = 576
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Departamento:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_3113_lista_mante_suministros
integer x = 247
integer y = 300
integer width = 576
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Municipio:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_3113_lista_mante_suministros
integer x = 247
integer y = 396
integer width = 576
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Localidad:"
boolean focusrectangle = false
end type

type st_5 from statictext within w_3113_lista_mante_suministros
integer x = 2021
integer y = 108
integer width = 411
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Calle:"
boolean focusrectangle = false
end type

type st_8 from statictext within w_3113_lista_mante_suministros
integer x = 2715
integer y = 192
integer width = 315
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Fincas"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_desde from statictext within w_3113_lista_mante_suministros
integer x = 2725
integer y = 272
integer width = 315
integer height = 68
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANO.CUR"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Desde:"
boolean focusrectangle = false
end type

event clicked;gu_comunic.is_comunic.programa_retorno   = ""
gu_comunic.is_comunic.accion_retorno     = ""
gu_comunic.is_comunic.strval8 = sle_desde.text
gu_comunic.is_comunic.strval9 = sle_hasta.text

//parmstr3 = gu_comunic.is_comunic.strval4                                    // Localidad
//parmstr4 = gu_comunic.is_comunic.strval5                                  // Calle

parmstr3 = sle_localidad.Text                              // Localidad
parmstr4 = sle_calle.Text                                  // Calle
parmstr6 = sle_calle.Text                                  // Calle

dir.gl_codcalle = il_cod_calle

Open(w_id0105)

iu_gen_comunic.is_comunic.intval5 = gu_comunic.is_comunic.intval5
iu_gen_comunic.is_comunic.strval6 = gu_comunic.is_comunic.strval6
iu_gen_comunic.is_comunic.strval4 = gu_comunic.is_comunic.strval4
iu_gen_comunic.is_comunic.strval5 = gu_comunic.is_comunic.strval5

IF iu_gen_comunic.is_comunic.intval5 > 0 THEN
        sle_desde.Text = String(iu_gen_comunic.is_comunic.intval5)      // Nro Calle
END IF

end event

type st_hasta from statictext within w_3113_lista_mante_suministros
integer x = 2725
integer y = 380
integer width = 315
integer height = 68
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANO.CUR"
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "Hasta:"
boolean focusrectangle = false
end type

event clicked;gu_comunic.is_comunic.programa_retorno   = ""
gu_comunic.is_comunic.accion_retorno     = ""
gu_comunic.is_comunic.strval8 = sle_desde.text
gu_comunic.is_comunic.strval9 = sle_hasta.text

//parmstr3 = gu_comunic.is_comunic.strval4                                    // Localidad
//parmstr4 = gu_comunic.is_comunic.strval5                                 // Calle

parmstr3 = sle_localidad.Text                              // Localidad
parmstr4 = sle_calle.Text                                  // Calle
parmstr6 = sle_calle.Text                                  // Calle

dir.gl_codcalle = il_cod_calle

Open(w_id0105)

iu_gen_comunic.is_comunic.intval5 = gu_comunic.is_comunic.intval5
iu_gen_comunic.is_comunic.strval6 = gu_comunic.is_comunic.strval6
iu_gen_comunic.is_comunic.strval4 = gu_comunic.is_comunic.strval4
iu_gen_comunic.is_comunic.strval5 = gu_comunic.is_comunic.strval5

IF iu_gen_comunic.is_comunic.intval5 > 0 THEN
        sle_hasta.Text = String(iu_gen_comunic.is_comunic.intval5)      // Nro Calle
END IF

end event

type cbx_todas from checkbox within w_3113_lista_mante_suministros
boolean visible = false
integer x = 2286
integer y = 664
integer width = 626
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = "Asociar Todas"
end type

event clicked;int i, li_cant_filas, li_veces, li_lock_status
long ll_aco, ll_nis, ll_cant_cli_imp
Decimal ll_pot_contrata
decimal{0} ldec_inst
datetime ldt_f_actual
string ls_descrip

ldt_f_actual = fgnu_fecha_actual()

Parent.SetRedraw(False)

IF This.Checked THEN

	IF gnv_msg.f_mensaje("CM10","","",YesNo!) <> 1 THEN
   	This.Checked = False
      Parent.SetRedraw(True)
      RETURN
   END IF

   // Asocio todas los suministros seleccionadas a 
   // la acometida elegida.

   SetPointer(HourGlass!)

   u_ins_2008_nu_datos_instalacion luo_2008_nu
   luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
                        
   li_cant_filas = dw_suministros.RowCount()

   FOR i = 1 TO li_cant_filas 
   
		ll_nis = dw_suministros.GetItemNumber(i,"aco_sum_nis_rad")
		li_lock_status = gnu_u_transaction.uf_lock(PARENT, "ACO_SUM", "NIS_RAD = " + string(ll_nis))	
		IF li_lock_status <> 0 THEN  // el registro lo tiene bloqueado otro usuario
			DESTROY luo_2008_nu
      	cb_buscar.PostEvent(clicked!)
      	Parent.SetRedraw(True)
      	RETURN
		END IF
   	
		ldec_inst = dw_suministros.GetItemDecimal(i,"SGD_instalacion_nro_instalacion")
   	ll_aco = dw_suministros.GetItemNumber(i,"aco_sum_nro_acometida")
      ll_pot_contrata = dw_suministros.GetItemNumber(i,"aco_sum_pot_contratada")

      // Controlo que ese suministro no este alimentado ya por esa acometida
      li_veces = iu_ins_2016_nu.fnu_existe_en_acosum(ll_nis,il_nro_acometida)

      Parent.SetRedraw(TRUE)
      dw_suministros.setrow(i)
      dw_suministros.SelectRow(i,True)
      Parent.SetRedraw(False)

		IF li_veces = 0 THEN
		// Controlo la existencia de Incidencias.
      	IF luo_2008_nu.fnu_v_inst_con_incidencia(ldec_inst) = -1 THEN
         	IF gnv_msg.f_mensaje("CM08",String(ll_aco),"",OK!) = 2 THEN
            	DESTROY luo_2008_nu
					gnu_u_transaction.uf_rollback(Parent)
               cb_buscar.PostEvent(clicked!)
               Parent.SetRedraw(True)
            	RETURN
         	END IF
     		ELSE

				IF iu_ins_2016_nu.fnu_actualizar_aco_sum(ll_nis,il_nro_acometida) <> 0 THEN
					gnv_msg.f_mensaje("EM35","","",OK!)
					gnu_u_transaction.uf_rollback(Parent)
					DESTROY luo_2008_nu
					Parent.SetRedraw(True)
					RETURN
			  
				END IF
	
				IF iu_ins_2016_nu.fnu_actualizar_aco_ins(ll_aco,il_nro_acometida,ll_pot_contrata,1) <> 0 THEN
					gnv_msg.f_mensaje("AM19","","",OK!)
					gnu_u_transaction.uf_rollback(Parent)
					DESTROY luo_2008_nu
					Parent.SetRedraw(True)
					RETURN  
				END IF
				
				// Actualizar la informacion de la red
				ll_cant_cli_imp = iu_ins_2016_nu.fnu_v_sum_imp_nis(ll_nis)
		
				IF luo_2008_nu.fnu_actualizar_red(ldec_inst,idec_nro_instal,0,ll_pot_contrata,1,ll_cant_cli_imp) = -1 THEN
					gnv_msg.f_mensaje("EA12","","",OK!)
					DESTROY luo_2008_nu             
					gnu_u_transaction.uf_rollback(parent)
					Parent.SetRedraw(True)
					RETURN
				ELSE
					gnu_u_transaction.uf_commit(parent)
				END IF
		
				dw_suministros.SetItem(i,"SGD_instalacion_nro_instalacion",idec_nro_instal)     
				dw_suministros.SetItem(i,"aco_sum_nro_acometida",il_nro_acometida)
				dw_suministros.SetItem(i,"SGD_instalacion_nom_instalacion",st_nom_inst.Text)    
	
			END IF          
		ELSE
			gnu_u_transaction.uf_rollback(Parent)
			ls_descrip = dw_suministros.GetItemString(i,"compute_0008") + " "
			ls_descrip = ls_descrip + dw_suministros.GetItemString(i,"compute_0009")+ " "
			ls_descrip = ls_descrip + dw_suministros.GetItemString(i,"compute_0010")
			gnv_msg.f_mensaje("EM37"," " + ls_descrip + " ","",OK!)
		END IF
	NEXT
	
	
	DESTROY luo_2008_nu
	This.Checked = False
	
	IF ii_fila_selec > 0 THEN
		cb_desasociar.Enabled = TRUE
	END IF
	
	st_nom_inst.Visible = FALSE
	st_desc_acometida.Visible = FALSE
	p_acometida.Visible = FALSE
	cbx_todas.Visible = FALSE
	cbx_una_acom.Visible = FALSE
END IF

cb_buscar.TriggerEvent(Clicked!)
Parent.SetRedraw(True)


end event

type p_acometida from picture within w_3113_lista_mante_suministros
boolean visible = false
integer x = 1225
integer y = 612
integer width = 133
integer height = 64
string picturename = "termina1.bmp"
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;//int li_veces 
//long ll_cant_cli_imp
//decimal{0} ldec_inst
//
//SetPointer(HourGlass!)
//
//// Pide confirmacion
//IF gnv_msg.f_mensaje("CM10","","",YesNo!) <> 1 THEN
//        dw_suministros.Drag(End!)
//        RETURN
//END IF
//
//// Controlo que ese suministro no este alimentado ya por esa acometida
//li_veces = iu_ins_2016_nu.fnu_existe_en_acosum(il_nro_sum,il_nro_acometida)
//
//IF li_veces <> 0 THEN
//        gnv_msg.f_mensaje("EM34","","",OK!)
//        dw_suministros.Drag(End!)
//        RETURN
//END IF
//
//// Controlo la existencia de Incidencias.
//u_ins_2008_nu_datos_instalacion luo_2008_nu
//luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
//
//ldec_inst = dw_suministros.GetItemDecimal(ii_fila_selec,"instalacion_nro_instalacion")
//
//IF luo_2008_nu.fnu_v_inst_con_incidencia(ldec_inst) = -1 THEN
//        gnv_msg.f_mensaje("EM36","","",OK!)
//        DESTROY luo_2008_nu
//        RETURN
//ELSE
//
//        IF iu_ins_2016_nu.fnu_actualizar_aco_sum(il_nro_sum,il_nro_acometida) <> 0 THEN
//                gnv_msg.f_mensaje("EM35","","",OK!)
//                gnu_u_transaction.uf_rollback();
//                DESTROY luo_2008_nu
//                RETURN
//        END IF
//
////      IF il_acometida_ant > 0 THEN    
//                IF iu_ins_2016_nu.fnu_actualizar_aco_ins(il_acometida_ant,il_nro_acometida,il_pot_contrata,1) <> 0 THEN
//                        gnv_msg.f_mensaje("AM19","","",OK!)
//                        gnu_u_transaction.uf_rollback();
//                        DESTROY luo_2008_nu
//                        RETURN
//                END IF
////      END IF
//
//// Actualizo la informacion de la red
//// llamar una funcion que devuelva si es sum imp por nis
//        ll_cant_cli_imp = iu_ins_2016_nu.fnu_v_sum_imp_nis(il_nro_sum)
//
//        IF luo_2008_nu.fnu_actualizar_red(idec_nro_padre_ant,idec_nro_instal,0,il_pot_contrata,1,ll_cant_cli_imp) = -1 THEN
//                gnv_msg.f_mensaje("EA12","","",OK!)
//                DESTROY luo_2008_nu             
//                gnu_u_transaction.uf_rollback();
//                RETURN
//        END IF
//
//        dw_suministros.SetItem(ii_fila_selec,"instalacion_nro_instalacion",idec_nro_instal)     
//        dw_suministros.SetItem(ii_fila_selec,"instalacion_nom_instalacion",st_nom_inst.Text)    
//        dw_suministros.SetItem(ii_fila_selec,"aco_sum_nro_acometida",il_nro_acometida)  
//
//        gnu_u_transaction.uf_commit();
//
//END IF
//
//DESTROY luo_2008_nu
//
//cb_desasociar.Enabled = True
//
//dw_suministros.Drag(End!)
//
This.Border = false
st_desc_acometida.Border = FALSE		
st_nom_inst.Border = FALSE	

cbx_una_acom.checked = True
cbx_una_acom.TriggerEvent('clicked')

dw_suministros.Drag(End!)
end event

event dragenter;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragEnter
// 
// Objetivo: Unde el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00     LFE			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_ins_2016_lista_sum_dir"  THEN
		This.Border = true
		This.BorderStyle = StyleLowered!
		st_desc_acometida.Border = TRUE		
		st_desc_acometida.BorderStyle = StyleLowered!
		st_nom_inst.Border = TRUE		
		st_nom_inst.BorderStyle = StyleLowered!
 	END IF
END IF
end event

event dragleave;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragLeave
// 
// Objetivo: Levanta el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_ins_2016_lista_sum_dir" THEN
		
		This.Border = false
		st_desc_acometida.Border = FALSE		
		st_nom_inst.Border = FALSE		
		
 	END IF
END IF

end event

type st_nom_inst from statictext within w_3113_lista_mante_suministros
boolean visible = false
integer x = 1440
integer y = 648
integer width = 809
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
string text = "Acometida No:"
boolean focusrectangle = false
end type

event dragleave;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragLeave
// 
// Objetivo: Levanta el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_ins_2016_lista_sum_dir" THEN
		
		This.Border = false
		p_acometida.Border = FALSE		
		st_desc_acometida.Border = FALSE		
		
 	END IF
END IF

end event

event dragenter;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragEnter
// 
// Objetivo: Unde el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00     LFE			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_ins_2016_lista_sum_dir"  THEN
		This.Border = true
		This.BorderStyle = StyleLowered!
		p_acometida.Border = TRUE		
		p_acometida.BorderStyle = StyleLowered!
		st_desc_acometida.Border = TRUE		
		st_desc_acometida.BorderStyle = StyleLowered!
 	END IF
END IF
end event

event dragdrop;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragDrop
// 
// Objetivo: Asigna alimetaci$$HEX1$$f300$$ENDHEX$$n a un suministro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00     LFE			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

This.Border = false
p_acometida.Border = FALSE		
st_desc_acometida.Border = FALSE	

cbx_una_acom.checked = True
cbx_una_acom.TriggerEvent('clicked')

dw_suministros.Drag(End!)
end event

type cb_sel_aco from u_cb within w_3113_lista_mante_suministros
integer x = 645
integer y = 592
integer width = 439
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Alimentaci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;SetPointer(HourGlass!)

ii_fila_selec = dw_suministros.GetSelectedRow(0)
IF ii_fila_selec = 0 then 
	 gnv_msg.f_mensaje("EM63","","",OK!)
	return
END IF

// Se carga la estructura con los valores para la
// llamada a la ventana w_2120 de identific. de instalacion
                                
gu_comunic.is_comunic.programa_llamante = "w_3111"
gu_comunic.is_comunic.accion_llamada = 'Seleccion'
                                                
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
                                        
// Va a permitir traer las instalaciones para el centro
// y cmd dado ( sin considerar la mesa)
gu_comunic.is_comunic.intval4 = 2

gu_comunic.is_comunic.programa_llamante = "w_3113"
gu_comunic.is_comunic.strval1 = "dw_lista_instal"
gu_comunic.is_comunic.programa_retorno = ' '

//gu_comunic.fnu_abrir(w_2120_identificacion_instalacion,"w_2120_identificacion_instalacion",1,1,w_3113_lista_mante_suministros,"w_3113_lista_mante_suministros")

Open(w_2120_identificacion_instalacion)

iu_gen_comunic1.is_comunic = gu_comunic1.is_comunic

// Controlo que haya sido seleccionada una instalaci$$HEX1$$f300$$ENDHEX$$n.
IF iu_gen_comunic1.is_comunic.accion_retorno = "Seleccionada" THEN
        
        p_acometida.Visible = True
        st_nom_inst.Visible = True
        st_desc_acometida.Visible = True

        IF dw_suministros.RowCount() > 0 THEN
                cbx_todas.Visible = True
                cbx_una_acom.Visible = True
        END IF

//        il_nro_acometida = iu_gen_comunic1.is_comunic.longval4
		  il_nro_acometida = iu_gen_comunic1.is_comunic.decval1
        idec_nro_instal  = iu_gen_comunic1.is_comunic.decval1

        st_nom_inst.Text = iu_gen_comunic1.is_comunic.strval2
        st_desc_acometida.Text = iu_gen_comunic1.is_comunic.strval10

END IF

end event

type cb_buscar from u_cb within w_3113_lista_mante_suministros
integer x = 119
integer y = 592
integer width = 411
integer height = 96
integer taborder = 40
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Buscar"
end type

event clicked;string ls_original_select, ls_original_select2, ls_mod_string, ls_rc, ls_ref_dir 

SetPointer(HourGlass!)
parent.setredraw(false)


IF NOT cbx_referencia.Checked THEN
   IF Len(Trim(sle_desde.Text)) <> 0 AND &
      Not IsNumber(sle_desde.Text) THEN
      gnv_msg.f_mensaje("EM29","","",OK!)

   END IF
        
   IF Len(Trim(sle_hasta.Text)) <> 0 AND &
      NOT IsNumber(sle_hasta.Text) THEN
      gnv_msg.f_mensaje("EM30","","",OK!)

   END IF
        
   IF Len(Trim(sle_desde.Text)) = 0 THEN
      il_desde = 0
   ELSE
      il_desde = Long(sle_desde.Text)
   END IF
       
   IF Len(Trim(sle_hasta.Text)) = 0 THEN
      il_hasta = 0
   ELSE
      il_hasta = Long(sle_hasta.Text)
   END IF
 
   IF il_desde > il_hasta AND (il_desde > 0 AND il_hasta > 0) THEN                                 
      gnv_msg.f_mensaje("EM31","","",OK!)

   END IF
 
   IF il_desde > 0 AND il_hasta > 0 THEN
      is_where = ' AND ACO_SUM.COD_PROV = ' + String(ii_cod_prov) + ' AND ACO_SUM.COD_DEPTO = ' + String(ii_cod_depto) + ' AND ACO_SUM.COD_MUNIC = ' + String(il_cod_munic) + ' AND ACO_SUM.COD_LOC = ' + String(il_cod_loc) + ' AND ACO_SUM.COD_CALLE = ' + String(il_cod_calle) + ' AND ACO_SUM.NUM_PUERTA >= ' + String(il_desde) + ' AND ACO_SUM.NUM_PUERTA <= ' + String(il_hasta) + ' '
   ELSEIF il_desde > 0 THEN
          is_where = ' AND ACO_SUM.COD_PROV = ' + String(ii_cod_prov) + ' AND ACO_SUM.COD_DEPTO = ' + String(ii_cod_depto) + ' AND ACO_SUM.COD_MUNIC = ' + String(il_cod_munic) + ' AND ACO_SUM.COD_LOC = ' + String(il_cod_loc) + ' AND ACO_SUM.COD_CALLE = ' + String(il_cod_calle) + ' AND ACO_SUM.NUM_PUERTA >= ' + String(il_desde) + ' '
   ELSEIF il_hasta > 0 THEN
          is_where = ' AND ACO_SUM.COD_PROV = ' + String(ii_cod_prov) + ' AND ACO_SUM.COD_DEPTO = ' + String(ii_cod_depto) + ' AND ACO_SUM.COD_MUNIC = ' + String(il_cod_munic) + ' AND ACO_SUM.COD_LOC = ' + String(il_cod_loc) + ' AND ACO_SUM.COD_CALLE = ' + String(il_cod_calle) + ' AND ACO_SUM.NUM_PUERTA <= ' + String(il_hasta) + ' '
   ELSE
          is_where = ' AND ACO_SUM.COD_PROV = ' + String(ii_cod_prov) + ' AND ACO_SUM.COD_DEPTO = ' + String(ii_cod_depto) + ' AND ACO_SUM.COD_MUNIC = ' + String(il_cod_munic) + ' AND ACO_SUM.COD_LOC = ' + String(il_cod_loc) + ' AND ACO_SUM.COD_CALLE = ' + String(il_cod_calle) + ' '
   END IF

// GNU 18-5-2006. Incidencia 0/395404
   ls_original_select  = " SELECT ACO_SUM.POT_CONTRATADA, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, ACO_SUM.CGV_SUM, SGD_ACOMETIDA.DESCRIPCION, CALLEJERO.NOM_CALLE, SGD_INSTALACION.NOM_INSTALACION, NVL(A.APE1_CLI,B.APE1_CLI), NVL(A.APE2_CLI,B.APE2_CLI), NVL(A.NOM_CLI,B.NOM_CLI) , ACO_SUM.NIS_RAD, SGD_INSTALACION.NRO_INSTALACION, ACO_SUM.NRO_ACOMETIDA, fgnu_calle_referencia(CALLEJERO.NOM_CALLE, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, ACO_SUM.NIF, ACO_SUM.COD_CALLE, 0, ' ', 0, ' ') cdireccion"
////______DSA INI 10/01/2000								 		  
//        ls_original_select2 = " FROM SGD_ACOMETIDA, ACO_SUM, SUMCON, PETSUM, SGD_INSTALACION, CLIENTES B, CLIENTES A, CALLEJERO WHERE ( ACO_SUM.COD_CALLE = CALLEJERO.COD_CALLE ) and ( B.COD_CLI (+)= SUMCON.COD_CLI ) and ( A.COD_CLI (+)= PETSUM.COD_CLI ) and  ( SGD_INSTALACION.nro_instalacion (+) = SGD_ACOMETIDA.INSTALACION_ORIGEN) and ( SGD_ACOMETIDA.CODIGO (+) = aco_sum.nro_acometida) and ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) "
// GNU 20-11-2006. Incidencia 0/443237 - Dejo las selects como antes
//   ls_original_select  = " SELECT ACO_SUM.POT_CONTRATADA, " + &
//						" NVL(A.NUM_PUERTA,B.NUM_PUERTA) aco_sum_num_puerta," + & 
//						" NVL(A.DUPLICADOR,B.DUPLICADOR) aco_sum_duplicador," + &
//						" ACO_SUM.CGV_SUM," + &
//						" SGD_ACOMETIDA.DESCRIPCION," + &
//						" CALLEJERO.NOM_CALLE," + &
//						" SGD_INSTALACION.NOM_INSTALACION," + &
//						" NVL(A.APE1_CLI,B.APE1_CLI)," + &
//						" NVL(A.APE2_CLI,B.APE2_CLI)," + &
//						" NVL(A.NOM_CLI,B.NOM_CLI) ," + &
//						" ACO_SUM.NIS_RAD," + &
//						" SGD_INSTALACION.NRO_INSTALACION," +&
//						" ACO_SUM.NRO_ACOMETIDA," + &
//						" fgnu_calle_referencia(CALLEJERO.NOM_CALLE, NVL(A.NUM_PUERTA,B.NUM_PUERTA), NVL(A.DUPLICADOR,B.DUPLICADOR), ACO_SUM.NIF, NVL(A.COD_CALLE,B.COD_CALLE), 0, ' ', 0, ' ') cdireccion"
//// FIN GNU
  ls_original_select2 = " FROM SGD_ACOMETIDA, ACO_SUM, SUMCON, PETSUM, SGD_INSTALACION, CLIENTES B, CLIENTES A, CALLEJERO WHERE ( ACO_SUM.COD_CALLE = CALLEJERO.COD_CALLE ) and ( B.COD_CLI (+)= SUMCON.COD_CLI ) and ( A.COD_CLI (+)= PETSUM.COD_CLI ) and ( SGD_INSTALACION.BDI_JOB(+) = 0 ) AND  ( SGD_INSTALACION.nro_instalacion (+) = SGD_ACOMETIDA.INSTALACION_ORIGEN) and ( SGD_ACOMETIDA.BDI_JOB (+) = 0) and ( SGD_ACOMETIDA.CODIGO (+) = aco_sum.nro_acometida) and ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) "
//______DSA INI 10/01/2000								 


ELSE //Por referencia

    ls_ref_dir = Trim(is_ref)

    IF IsNull(ls_ref_dir) OR ls_ref_dir = "" OR ls_ref_dir = " " THEN
       is_where = " AND ACO_SUM.NIF = FINCAS.NIF AND Length(RTrim(LTrim(FINCAS.REF_DIR))) > 0 AND ACO_SUM.COD_PROV = " + String(ii_cod_prov) + " AND ACO_SUM.COD_DEPTO = " + String(ii_cod_depto) + " AND ACO_SUM.COD_MUNIC = " + String(il_cod_munic) + " AND ACO_SUM.COD_LOC = " + String(il_cod_loc) + " "
// GNU 18-5-2006. Incidencia 0/395404		 
       ls_original_select  = " SELECT ACO_SUM.POT_CONTRATADA, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, ACO_SUM.CGV_SUM, SGD_ACOMETIDA.DESCRIPCION, CALLEJERO.NOM_CALLE, SGD_INSTALACION.NOM_INSTALACION, NVL(A.APE1_CLI,B.APE1_CLI), NVL(A.APE2_CLI,B.APE2_CLI), NVL(A.NOM_CLI,B.NOM_CLI) , ACO_SUM.NIS_RAD, SGD_INSTALACION.NRO_INSTALACION, ACO_SUM.NRO_ACOMETIDA, fgnu_calle_referencia(FINCAS.REF_DIR, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, FINCAS.NIF, FINCAS.COD_CALLE, 0, ' ', 0, ' ') cdireccion"
//	ls_original_select  = " SELECT ACO_SUM.POT_CONTRATADA," + &
//							 " NVL(A.NUM_PUERTA,B.NUM_PUERTA) aco_sum_num_puerta," + & 
//							 " NVL(A.DUPLICADOR,B.DUPLICADOR) aco_sum_duplicador," + &
//							 " ACO_SUM.CGV_SUM," + &
//							 " SGD_ACOMETIDA.DESCRIPCION," + &
//							 " CALLEJERO.NOM_CALLE," + & 
//							 " SGD_INSTALACION.NOM_INSTALACION," + &
//							 " NVL(A.APE1_CLI,B.APE1_CLI)," + &
//							 " NVL(A.APE2_CLI,B.APE2_CLI)," + &
//							 " NVL(A.NOM_CLI,B.NOM_CLI), " + &
//							 " ACO_SUM.NIS_RAD," + &
//							 " SGD_INSTALACION.NRO_INSTALACION," + &
//							 " ACO_SUM.NRO_ACOMETIDA," + &
//							 " fgnu_calle_referencia(FINCAS.REF_DIR, NVL(A.NUM_PUERTA,B.NUM_PUERTA), NVL(A.DUPLICADOR,B.DUPLICADOR), FINCAS.NIF, FINCAS.COD_CALLE, 0, ' ', 0, ' ') cdireccion"
							 // FIN GNU
//______DSA INI 10/01/2000								 
//                ls_original_select2 = " FROM SGD_ACOMETIDA, ACO_SUM, SUMCON, PETSUM, SGD_INSTALACION, CLIENTES B, CLIENTES A, CALLEJERO, FINCAS WHERE ( CALLEJERO.COD_CALLE = ACO_SUM.COD_CALLE ) and ( B.COD_CLI (+)= SUMCON.COD_CLI ) and ( A.COD_CLI (+)= PETSUM.COD_CLI ) and ( SGD_INSTALACION.nro_instalacion (+) = SGD_ACOMETIDA.INSTALACION_ORIGEN) and ( SGD_ACOMETIDA.CODIGO (+) = aco_sum.nro_acometida) and ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) "
       ls_original_select2 = " FROM SGD_ACOMETIDA, ACO_SUM, SUMCON, PETSUM, SGD_INSTALACION, CLIENTES B, CLIENTES A, CALLEJERO, FINCAS WHERE ( CALLEJERO.COD_CALLE = ACO_SUM.COD_CALLE ) and ( B.COD_CLI (+)= SUMCON.COD_CLI ) and ( A.COD_CLI (+)= PETSUM.COD_CLI ) and ( SGD_INSTALACION.BDI_JOB(+) = 0 ) AND  ( SGD_INSTALACION.nro_instalacion (+) = SGD_ACOMETIDA.INSTALACION_ORIGEN) and ( SGD_ACOMETIDA.CODIGO (+) = aco_sum.nro_acometida) and ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) "
//______DSA INI 10/01/2000								 
    ELSE
       is_where = " AND ACO_SUM.NIF = FINCAS.NIF AND FINCAS.REF_DIR = '"  + ls_ref_dir + "' AND ACO_SUM.COD_PROV = " + String(ii_cod_prov) + " AND ACO_SUM.COD_DEPTO = " + String(ii_cod_depto) + " AND ACO_SUM.COD_MUNIC = " + String(il_cod_munic) + " AND ACO_SUM.COD_LOC = " + String(il_cod_loc) + " "
		 // GNU 18-5-2006. Incidencia 0/395404		
       ls_original_select  = " SELECT ACO_SUM.POT_CONTRATADA, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, ACO_SUM.CGV_SUM, SGD_ACOMETIDA.DESCRIPCION, CALLEJERO.NOM_CALLE, SGD_INSTALACION.NOM_INSTALACION, NVL(A.APE1_CLI,B.APE1_CLI), NVL(A.APE2_CLI,B.APE2_CLI), NVL(A.NOM_CLI,B.NOM_CLI) , ACO_SUM.NIS_RAD, SGD_INSTALACION.NRO_INSTALACION, ACO_SUM.NRO_ACOMETIDA, fgnu_calle_referencia(FINCAS.REF_DIR, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, FINCAS.NIF, FINCAS.COD_CALLE, 0, ' ', 0, ' ') cdireccion"
// 	ls_original_select  = " SELECT ACO_SUM.POT_CONTRATADA," + &
//	 						 " NVL(A.NUM_PUERTA,B.NUM_PUERTA) aco_sum_num_puerta," + & 
//							 " NVL(A.DUPLICADOR,B.DUPLICADOR) aco_sum_duplicador," + &
//							 " ACO_SUM.CGV_SUM," + &
//							 " SGD_ACOMETIDA.DESCRIPCION," + &
//							 " CALLEJERO.NOM_CALLE," + &
//							 " SGD_INSTALACION.NOM_INSTALACION," + &
//							 " NVL(A.APE1_CLI,B.APE1_CLI)," + &
//							 " NVL(A.APE2_CLI,B.APE2_CLI)," + &
//							 " NVL(A.NOM_CLI,B.NOM_CLI) ," +&
//							 " ACO_SUM.NIS_RAD," + &
//							 " SGD_INSTALACION.NRO_INSTALACION," + &
//							 " ACO_SUM.NRO_ACOMETIDA," + &
//							 " fgnu_calle_referencia(FINCAS.REF_DIR, NVL(A.NUM_PUERTA,B.NUM_PUERTA), NVL(A.DUPLICADOR,B.DUPLICADOR), FINCAS.NIF, FINCAS.COD_CALLE, 0, ' ', 0, ' ') cdireccion"
//______DSA INI 10/01/2000			
//	             ls_original_select2 = " FROM SGD_ACOMETIDA, ACO_SUM, SUMCON, PETSUM, SGD_INSTALACION, CLIENTES B, CLIENTES A, CALLEJERO, FINCAS WHERE ( CALLEJERO.COD_CALLE = ACO_SUM.COD_CALLE ) and ( B.COD_CLI (+)= SUMCON.COD_CLI ) and ( A.COD_CLI (+)= PETSUM.COD_CLI ) and ( SGD_INSTALACION.nro_instalacion (+) = SGD_ACOMETIDA.INSTALACION_ORIGEN) and ( SGD_ACOMETIDA.CODIGO (+) = aco_sum.nro_acometida) and ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) "
       ls_original_select2 = " FROM SGD_ACOMETIDA, ACO_SUM, SUMCON, PETSUM, SGD_INSTALACION, CLIENTES B, CLIENTES A, CALLEJERO, FINCAS WHERE ( CALLEJERO.COD_CALLE = ACO_SUM.COD_CALLE ) and ( B.COD_CLI (+)= SUMCON.COD_CLI ) and ( A.COD_CLI (+)= PETSUM.COD_CLI ) and ( SGD_INSTALACION.BDI_JOB(+) = 0 ) AND ( SGD_INSTALACION.nro_instalacion (+) = SGD_ACOMETIDA.INSTALACION_ORIGEN) and ( SGD_ACOMETIDA.CODIGO (+) = aco_sum.nro_acometida) and ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) "				  
//______DSA FIN 10/01/2000								 
    END IF
  
END IF //Por referencia

ls_rc = dw_suministros.Modify('DataWindow.Table.Select="' + ls_original_select + ls_original_select2 + is_where + '"')
IF ls_rc = "" THEN
   IF dw_suministros.Retrieve(ls_ref_dir) = 0  THEN
//AMH(21/12/2010) ASUR 839829
//      gnv_msg.f_mensaje("AM18","","",OK!) 
	ELSE
		IF p_acometida.Visible THEN
	  		cbx_todas.Visible = True
		END IF
	END IF
END IF


//cbx_sin_alim.Enabled = True
//cbx_sin_alim.Checked = False
IF cbx_sin_alim.Checked THEN
	// Filtro los datos recuperados para obtener sin alimentacion
   dw_suministros.SetFilter("aco_sum_nro_acometida = 0 ")
ELSE
	// Filtro los datos recuperados para obtener con alimentacion
	dw_suministros.SetFilter("aco_sum_nro_acometida > 0 ")
END IF
dw_suministros.Filter()


//AMH(21/12/2010) ASUR 839829
IF dw_suministros.rowCount() = 0 THEN
	 gnv_msg.f_mensaje("AM18","","",OK!) 
END IF

parent.SetRedraw(True)
//if dw_suministros.rowcount() = 0 AND &
//    cb_desasociar.Enabled = FALSE THEN
//     gnv_msg.f_mensaje("AM18","","",OK!)
//end if
// GSE
DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

IF dw_suministros.RowCount() > 0 THEN

	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista de Suministros'
	ll_longitud = len (ls_titulo)*100
	
	dw_1.modify("nulo_desde.visible = '0")
	dw_1.modify("f_desde.visible='0'")
	dw_1.modify("desde.Visible='0'")
	dw_1.modify("nulo_hasta.visible = '0'")
	dw_1.modify("f_hasta.visible='0'")
	dw_1.modify("hasta.Visible='0'")
	
	// si no son nulas las inserto
	dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
	dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
	dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
	
//	dw_suministros.ShareData(dw_datos)

	// Habilito o deshabilito botones dependiendo de si tengo o no alimentacion
	IF cbx_sin_alim.checked THEN 
		// Suministros con alimentacion
		cb_sel_aco.enabled = true
		cb_desasociar.enabled = false
	ELSE
		// Suministros sin alimentacion
		cb_sel_aco.enabled = false
		cb_desasociar.enabled = true
	END IF
ELSE // No se han recuperado datos
	cb_sel_aco.enabled = false
	cb_desasociar.enabled = false
END IF 

end event

type cbx_sin_alim from checkbox within w_3113_lista_mante_suministros
integer x = 2770
integer y = 1784
integer width = 741
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = "Sin Alimentaci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;dw_suministros.Reset()

cb_desasociar.enabled = false
cb_sel_aco.enabled = false

//int li_cant_filas
//
//SetPointer(HourGlass!)
//
//Parent.SetRedraw(False)
//
//li_cant_filas = dw_suministros.RowCount()
//
//dw_suministros.SetFilter("")
//dw_suministros.Filter()
//
//IF This.Checked THEN
//      dw_suministros.SetFilter("aco_sum_nro_acometida = 0 ")
//      dw_suministros.Filter()
//		if gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_SUMIN','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
//	        cb_sel_aco.Enabled = True
//		end if
//ELSE
//        dw_suministros.SetFilter("aco_sum_nro_acometida > 0 ")
//        dw_suministros.Filter()
//        cb_sel_aco.Enabled = False
//END IF
//
//IF li_cant_filas <> dw_suministros.RowCount() THEN
//        dw_suministros.SelectRow(0,False)
//        dw_suministros.SetRow(0)
//        cb_desasociar.Enabled = False
//END IF
//
//DataWindowChild dw_datos
//long ll_longitud
//datetime ldt_desde, ldt_hasta
//string ls_columna, ls_visible, ls_wid, ls_titulo
//
//IF dw_suministros.RowCount() > 0 THEN
//
//	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("d_1",dw_datos)
//	
//	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
//	ls_titulo = 'Lista de Suministros'
//	ll_longitud = len (ls_titulo)*100
//	
//	dw_1.modify("nulo_desde.visible = '0")
//	dw_1.modify("f_desde.visible='0'")
//	dw_1.modify("desde.Visible='0'")
//	dw_1.modify("nulo_hasta.visible = '0'")
//	dw_1.modify("f_hasta.visible='0'")
//	dw_1.modify("hasta.Visible='0'")
//	
//	// si no son nulas las inserto
//	dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
//	dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
//	dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
//	dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
//	
//	dw_suministros.ShareData(dw_datos)
//END IF 
//IF ib_sin_permisos THEN
//	cb_sel_aco.enabled = FALSE
//END IF
//Parent.SetRedraw(True)
//
//
end event

type st_desc_acometida from statictext within w_3113_lista_mante_suministros
boolean visible = false
integer x = 1440
integer y = 588
integer width = 809
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
string text = "Descripci$$HEX1$$f300$$ENDHEX$$n de la Acometida."
boolean focusrectangle = false
end type

event dragdrop;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragDrop
// 
// Objetivo: Asigna alimetaci$$HEX1$$f300$$ENDHEX$$n a un suministro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00     LFE			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

This.Border = false
p_acometida.Border = FALSE		
st_nom_inst.Border = FALSE	

cbx_una_acom.checked = True
cbx_una_acom.TriggerEvent('clicked')

dw_suministros.Drag(End!)
end event

event dragenter;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragEnter
// 
// Objetivo: Unde el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00     LFE			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_ins_2016_lista_sum_dir"  THEN
		This.Border = true
		This.BorderStyle = StyleLowered!
		p_acometida.Border = TRUE		
		p_acometida.BorderStyle = StyleLowered!
		st_nom_inst.Border = TRUE		
		st_nom_inst.BorderStyle = StyleLowered!
 	END IF
END IF
end event

event dragleave;///////////////////////////////////////////////////////
//										
// Funcion/Evento: DragLeave
// 
// Objetivo: Levanta el bot$$HEX1$$f300$$ENDHEX$$n cuando el dragueo esta dentro
//	
//
// Responsable: LFE 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 1/12/00    FDO			  Creaci$$HEX1$$f300$$ENDHEX$$n
//
///////////////////////////////////////////////////////

datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_ins_2016_lista_sum_dir" THEN
		
		This.Border = false
		p_acometida.Border = FALSE		
		st_nom_inst.Border = FALSE		
		
 	END IF
END IF

end event

type st_u_geografica from statictext within w_3113_lista_mante_suministros
integer x = 155
integer y = 4
integer width = 805
integer height = 68
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANO.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Ubicaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica"
alignment alignment = center!
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)

fgnu_resetear_s_comunicaciones(iu_gen_comunic)

// Cargo en la est. el valor que corresponde para llamar a la ventana
// de ident. geogr$$HEX1$$e100$$ENDHEX$$fica.
gu_comunic.is_comunic.programa_llamante = "w_3111_mante_aco"
gu_comunic.is_comunic.strval10 = "Calle"

//SELECT "DEPTOS"."COD_DEPTO"  
//INTO :iu_gen_comunic.is_comunic.intval2
//FROM "DEPTOS"  
//WHERE ( "DEPTOS"."NOM_DEPTO" = :sle_departamento.text )  ; 
//
//SELECT "DEPTOS"."COD_PROV"  
//INTO :iu_gen_comunic.is_comunic.intval1
//FROM "DEPTOS"  
//WHERE ( "DEPTOS"."NOM_DEPTO" = :sle_provincia.text )  ; 
//
//SELECT "MUNICIPIOS"."COD_MUNIC"
//INTO :iu_gen_comunic.is_comunic.longval4
//FROM "MUNICIPIOS"  
//WHERE "MUNICIPIOS"."COD_DEPTO" = :gu_comunic.is_comunic.intval2  ;
//
//SELECT "LOCALIDADES"."COD_LOCAL"   
//INTO :iu_gen_comunic.is_comunic.longval5
//FROM "LOCALIDADES"  
//WHERE "LOCALIDADES"."COD_MUNIC" = :iu_gen_comunic.is_comunic.longval4;   

//gu_comunic.is_comunic.intval2 = gi_cod_departamento
//gu_comunic.is_comunic.longval4 = gl_cod_municipio
//gu_comunic.is_comunic.longval5 = gl_cod_localidad
//gu_comunic.is_comunic.intval1 = gi_cod_provincia

gu_comunic.is_comunic.strval1 = sle_provincia.text//gs_provincia
gu_comunic.is_comunic.strval2 = sle_departamento.text//gs_departamento
gu_comunic.is_comunic.strval3 = sle_municipio.text//gs_municipio
gu_comunic.is_comunic.strval4 = sle_localidad.text//gs_localidad

gu_comunic.is_comunic.strval8 = ''
gu_comunic.is_comunic.strval9 = ''

//iu_gen_comunic.is_comunic.strval9 = is_calle_ref
//iu_gen_comunic.is_comunic.intval1 = gi_cod_provincia

iu_gen_comunic.is_comunic.intval1  = gi_cod_provincia
iu_gen_comunic.is_comunic.intval2  = gi_cod_departamento
iu_gen_comunic.is_comunic.longval4 = gl_cod_municipio
iu_gen_comunic.is_comunic.longval5 = gl_cod_localidad
iu_gen_comunic.is_comunic.strval1  = gs_provincia
iu_gen_comunic.is_comunic.strval2  = gs_departamento
iu_gen_comunic.is_comunic.strval3  = gs_municipio
iu_gen_comunic.is_comunic.strval4  = gs_localidad
//
//Volcado datos de estruc. Global
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica siempre 
sle_calle.Text = "" //MATO
parmstr6 = sle_calle.Text

parnum2 = gu_comunic.is_comunic.intval1
parnum3 = gu_comunic.is_comunic.intval2
parnum4 = gu_comunic.is_comunic.longval4
parnum5 = gu_comunic.is_comunic.longval5

OpenWithParm(w_id0100,iu_gen_comunic)

//iu_gen_comunic.is_comunic = gu_comunic.is_comunic

//sle_provincia.Text = iu_gen_comunic.is_comunic.strval1
//sle_departamento.Text = iu_gen_comunic.is_comunic.strval2
//sle_municipio.Text = iu_gen_comunic.is_comunic.strval3
//sle_localidad.Text = iu_gen_comunic.is_comunic.strval4
//sle_calle.Text = iu_gen_comunic.is_comunic.strval5
//is_ref = iu_gen_comunic.is_comunic.strval5
//ii_cod_prov = iu_gen_comunic.is_comunic.intval1
//ii_cod_depto = iu_gen_comunic.is_comunic.intval2
//ii_cod_munic = iu_gen_comunic.is_comunic.intval3
//ii_cod_loc = iu_gen_comunic.is_comunic.intval4
//il_cod_calle = iu_gen_comunic.is_comunic.longval1

// Restablecemos cajas texto con los valores de Estruc. Global 
// "s_direccion_cliente" -->MATO
sle_provincia.Text = dir.gs_prov
sle_departamento.Text = dir.gs_depto
sle_municipio.Text = dir.gs_munic
sle_localidad.Text = dir.gs_local
sle_calle.Text = dir.gs_calle
is_ref=dir.gs_calle
ii_cod_prov = dir.gl_codprov
ii_cod_depto = dir.gl_coddepto
il_cod_munic = dir.gl_codmun
il_cod_loc = dir.gl_codloc
il_cod_calle = dir.gl_codcalle
//---------------------------->

IF il_cod_calle > 0 THEN
        IF NOT cbx_referencia.Checked THEN
                st_desde.Enabled  = True
                st_hasta.Enabled  = True
                sle_desde.Enabled = True
                sle_hasta.Enabled = True
                cb_buscar.Enabled = True
        END IF
ELSE
        st_desde.Enabled  = False
        st_hasta.Enabled  = False
        sle_desde.Enabled = False
        sle_hasta.Enabled = False
        IF NOT cbx_referencia.Checked THEN
                cb_buscar.Enabled = False
        END IF
        cbx_todas.Visible = False
END IF

sle_desde.Text = ""
sle_hasta.Text = ""

fgnu_resetear_s_comunicaciones(iu_gen_comunic)


end event

type cb_desasociar from u_cb within w_3113_lista_mante_suministros
integer x = 96
integer y = 1776
integer width = 434
integer height = 96
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Desasociar"
end type

event clicked;decimal{0} ldec_inst
int li_cant_cli_imp, li_lock_status, li_tension
long ll_nis
string ls_desc, ls_aux
int indice, li_par
boolean lb_sigo=true

ii_fila_selec = dw_suministros.GetSelectedRow(0)
IF ii_fila_selec = 0 then 
	 gnv_msg.f_mensaje("EM63","","",OK!)
	return
END IF

ll_nis = dw_suministros.GetItemNumber(ii_fila_selec, "aco_sum_nis_rad")
li_lock_status = gnu_u_transaction.uf_lock(PARENT, "ACO_SUM", "NIS_RAD = " + string(ll_nis))	
	
IF li_lock_status <> 0 THEN  // el registro lo tiene bloqueado otro usuario
	RETURN			
END IF

IF gnv_msg.f_mensaje("CM10","","",YesNo!) <> 1 THEN
	gnu_u_transaction.uf_rollback(Parent)
	Return
END IF

SetPointer(HourGlass!)

// Controlo la existencia de Incidencias.
u_ins_2008_nu_datos_instalacion luo_2008_nu
luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion

ldec_inst = dw_suministros.GetItemDecimal(ii_fila_selec,"sgd_instalacion_nro_instalacion")

IF luo_2008_nu.fnu_v_inst_con_incidencia(ldec_inst) = -1 THEN
	DESTROY luo_2008_nu
	gnu_u_transaction.uf_rollback(Parent)
   RETURN
ELSE
	//      Llamar funcion que desasocie
   IF iu_ins_2016_nu.fnu_desasociar_suministro(il_nro_sum,il_acometida_ant) <> 0 THEN
   	gnv_msg.f_mensaje("EM35","","",OK!)
      gnu_u_transaction.uf_rollback(Parent)
      DESTROY luo_2008_nu
		RETURN

	END IF

	// Llamar a funcion que actualize la red
   li_cant_cli_imp = iu_ins_2016_nu.fnu_v_sum_imp_nis(il_nro_sum)

   IF luo_2008_nu.fnu_actualizar_red_des(idec_nro_padre_ant,il_pot_contrata,li_cant_cli_imp) = -1 THEN
   	gnu_u_transaction.uf_rollback(Parent)
      DESTROY luo_2008_nu
      Return
   END IF

   dw_suministros.SetItem(ii_fila_selec,"sgd_instalacion_nro_instalacion",0)       
   dw_suministros.SetItem(ii_fila_selec,"sgd_instalacion_nom_instalacion","")      
   dw_suministros.SetItem(ii_fila_selec,"aco_sum_nro_acometida",0) 

   gnu_u_transaction.uf_commit(Parent)
        
END IF

cb_buscar.TriggerEvent(clicked!)
This.Enabled = False

DESTROY luo_2008_nu

end event

type st_6 from statictext within w_3113_lista_mante_suministros
integer x = 91
integer y = 760
integer width = 3415
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 8421376
boolean enabled = false
string text = "Acometidas de la Finca"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_suministros from u_ins_2016_pr_lista_sum_dir within w_3113_lista_mante_suministros
integer x = 91
integer y = 848
integer width = 3419
integer height = 896
integer taborder = 10
string dragicon = "EXPED.ICO"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;decimal{0} ldec_inst_padre

//cb_sel_aco.enabled = TRUE
ii_fila_selec = row

IF ii_fila_selec > 0 THEN
		  
        ii_fila_selec_ant = ii_fila_selec

        This.SelectRow(0,False)
        This.SelectRow(ii_fila_selec,True)
        This.SetRow(ii_fila_selec)

        il_nro_sum = This.GetItemNumber(ii_fila_selec,"aco_sum_nis_rad")
        idec_nro_padre_ant = This.GetItemDecimal(ii_fila_selec,"sgd_instalacion_nro_instalacion")
        il_pot_contrata = This.GetItemNumber(ii_fila_selec,"aco_sum_pot_contratada")
        il_acometida_ant = This.GetItemNumber(ii_fila_selec,"aco_sum_nro_acometida")

        IF il_acometida_ant  > 0 THEN
				if gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_SUMIN','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
                cb_desasociar.Enabled = True
				end if
//              cb_sel_aco.Enabled = False
        ELSE
                cb_desasociar.Enabled = False
//              cb_sel_aco.Enabled = True
        END IF


        // Si se entr$$HEX2$$f3002000$$ENDHEX$$con "Consulta" deshabilito el drageo.
        IF is_accion_llamada <> "Consulta" THEN

                // Si a$$HEX1$$fa00$$ENDHEX$$n no fue seleccionada una Instalaci$$HEX1$$f300$$ENDHEX$$n lo deshabilito.
                IF p_acometida.Visible = True THEN
                        This.Drag(Begin!)
                END IF
        END IF
		  IF ib_sin_permisos THEN
			  cb_desasociar.enabled = FALSE
		  END IF
			  
ELSE

        ii_fila_selec = ii_fila_selec_ant
END IF


end event

type cbx_referencia from checkbox within w_3113_lista_mante_suministros
boolean visible = false
integer x = 2921
integer y = 600
integer width = 585
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = "Por Referencia"
end type

event clicked;sle_calle.Text = ""
sle_desde.Text = ""
sle_hasta.Text = ""
il_cod_calle   = 0

IF This.Checked THEN
        is_calle_ref = "Referencia"
        is_ref = ''
        il_cod_calle = 0
        cb_buscar.Enabled = True
        st_desde.Enabled  = False
        st_hasta.Enabled  = False
        sle_desde.Enabled = False
        sle_hasta.Enabled = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//        sle_desde.BackColor =(65536*192+256*192+192)
//        sle_hasta.BackColor =(65536*192+256*192+192)
        sle_desde.BackColor = long(gs_gris)
        sle_hasta.BackColor = long(gs_gris)
// Fin. Sgo.
ELSE
        is_calle_ref = "Calle"
        cb_buscar.Enabled = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//        sle_desde.BackColor = (65536*255+256*255+255)
//        sle_hasta.BackColor = (65536*255+256*255+255)
        sle_desde.BackColor = long(gs_blanco)
        sle_hasta.BackColor = long(gs_blanco)
// Fin. Sgo.
END IF


end event

type ln_7 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 96
integer beginy = 28
integer endx = 96
integer endy = 512
end type

type ln_1 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 101
integer beginy = 32
integer endx = 3493
integer endy = 32
end type

type ln_2 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 101
integer beginy = 512
integer endx = 3515
integer endy = 512
end type

type ln_6 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 101
integer beginy = 508
integer endx = 3502
integer endy = 508
end type

type ln_4 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 3506
integer beginy = 32
integer endx = 3506
integer endy = 512
end type

type ln_8 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 3497
integer beginy = 32
integer endx = 3497
integer endy = 508
end type

type ln_5 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 105
integer beginy = 28
integer endx = 3493
integer endy = 28
end type

type ln_9 from line within w_3113_lista_mante_suministros
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2670
integer beginy = 220
integer endx = 3383
integer endy = 220
end type

type ln_15 from line within w_3113_lista_mante_suministros
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2665
integer beginy = 220
integer endx = 2665
integer endy = 488
end type

type cbx_una_acom from checkbox within w_3113_lista_mante_suministros
boolean visible = false
integer x = 2286
integer y = 564
integer width = 626
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asoc.Acom."
end type

event clicked;int i, li_cant_filas, li_veces,li_fila, li_lock_status
long ll_aco, ll_nis, ll_cant_cli_imp
Decimal ll_pot_contrata
decimal{0} ldec_inst
datetime ldt_f_actual
string ls_descrip

ldt_f_actual = fgnu_fecha_actual()

Parent.SetRedraw(False)

IF This.Checked THEN

	IF gnv_msg.f_mensaje("CM10","","",YesNo!) <> 1 THEN
   	This.Checked = False
      Parent.SetRedraw(True)
      RETURN
   END IF

   // Asocio todas los suministros seleccionadas a 
   // la acometida elegida.

   SetPointer(HourGlass!)

	u_ins_2008_nu_datos_instalacion luo_2008_nu
   luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
                        
   //li_cant_filas = dw_suministros.RowCount()
	li_fila = dw_suministros.GetRow()
   
	ll_nis = dw_suministros.GetItemNumber(li_fila,"aco_sum_nis_rad")
	// Se bloquea el registro para que ning$$HEX1$$fa00$$ENDHEX$$n otro usuario pueda manipularlo
	li_lock_status = gnu_u_transaction.uf_lock(PARENT, "ACO_SUM", "NIS_RAD = " + string(ll_nis))	
	
	IF li_lock_status <> 0 THEN  // el registro lo tiene bloqueado otro usuario
		DESTROY luo_2008_nu
      cb_buscar.PostEvent(clicked!)
      Parent.SetRedraw(True)
      RETURN
	END IF
	ldec_inst = dw_suministros.GetItemDecimal(li_fila,"SGD_instalacion_nro_instalacion")
   ll_aco = dw_suministros.GetItemNumber(li_fila,"aco_sum_nro_acometida")
   ll_pot_contrata = dw_suministros.GetItemNumber(li_fila,"aco_sum_pot_contratada")

   // Controlo que ese suministro no este alimentado ya por esa acometida
   li_veces = iu_ins_2016_nu.fnu_existe_en_acosum(ll_nis,il_nro_acometida)

   IF li_veces = 0 THEN

   	// Controlo la existencia de Incidencias.
      IF luo_2008_nu.fnu_v_inst_con_incidencia(ldec_inst) = -1 THEN
      	IF gnv_msg.f_mensaje("CM08",String(ll_aco),"",OK!) = 2 THEN
         	DESTROY luo_2008_nu
				gnu_u_transaction.uf_rollback(Parent);
            cb_buscar.PostEvent(clicked!)
            Parent.SetRedraw(True)
            RETURN
         END IF
      ELSE

      	IF iu_ins_2016_nu.fnu_actualizar_aco_sum(ll_nis,il_nro_acometida) <> 0 THEN
         	gnv_msg.f_mensaje("EM35","","",OK!)
            gnu_u_transaction.uf_rollback(Parent);
            DESTROY luo_2008_nu
            Parent.SetRedraw(True)
         	RETURN
         END IF

		   //      IF ll_aco > 0 THEN      
         IF iu_ins_2016_nu.fnu_actualizar_aco_ins(ll_aco,il_nro_acometida,ll_pot_contrata,1) <> 0 THEN
        		gnv_msg.f_mensaje("AM19","","",OK!)
            gnu_u_transaction.uf_rollback(Parent);
            DESTROY luo_2008_nu
            Parent.SetRedraw(True)
            RETURN  
         END IF
         // Actualizar la informacion de la red
			ll_cant_cli_imp = iu_ins_2016_nu.fnu_v_sum_imp_nis(ll_nis)

         IF luo_2008_nu.fnu_actualizar_red(ldec_inst,idec_nro_instal,0,ll_pot_contrata,1,ll_cant_cli_imp) = -1 THEN
         	gnv_msg.f_mensaje("EA12","","",OK!)
            DESTROY luo_2008_nu             
            gnu_u_transaction.uf_rollback(Parent)
            Parent.SetRedraw(True)
            RETURN
         ELSE
         	gnu_u_transaction.uf_commit(Parent)
         END IF

         dw_suministros.SetItem(li_fila,"SGD_instalacion_nro_instalacion",idec_nro_instal)       
         dw_suministros.SetItem(li_fila,"aco_sum_nro_acometida",il_nro_acometida)
         dw_suministros.SetItem(li_fila,"SGD_instalacion_nom_instalacion",st_nom_inst.Text)      

		END IF          
	ELSE
		gnu_u_transaction.uf_rollback(Parent);
   	ls_descrip = dw_suministros.GetItemString(li_fila,"compute_0008") + " "
      ls_descrip = ls_descrip + dw_suministros.GetItemString(li_fila,"compute_0009")+ " "
      ls_descrip = ls_descrip + dw_suministros.GetItemString(li_fila,"compute_0010")
      gnv_msg.f_mensaje("EM37"," " + ls_descrip + " ","",OK!)
   END IF

   DESTROY luo_2008_nu
        
   This.Checked = False

   IF ii_fila_selec > 0 THEN
   	cb_desasociar.Enabled = TRUE
   END IF
	st_nom_inst.Visible = FALSE     
	st_desc_acometida.Visible = FALSE
	p_acometida.Visible = FALSE
	cbx_una_acom.Visible = FALSE
	cbx_todas.Visible= FALSE
END IF

cb_buscar.TriggerEvent(Clicked!)
Parent.SetRedraw(True)

end event

type cb_1 from commandbutton within w_3113_lista_mante_suministros
integer x = 841
integer y = 1776
integer width = 434
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_3113_lista_mante_suministros
boolean visible = false
integer x = 146
integer y = 992
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


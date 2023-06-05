HA$PBExportHeader$w_3111_lista_mante_acometidas.srw
forward
global type w_3111_lista_mante_acometidas from w_sgigenerica
end type
type ln_7 from line within w_3111_lista_mante_acometidas
end type
type ln_3 from line within w_3111_lista_mante_acometidas
end type
type cb_desasociar from u_cb within w_3111_lista_mante_acometidas
end type
type cb_suministros from u_cb within w_3111_lista_mante_acometidas
end type
type cbx_todas from checkbox within w_3111_lista_mante_acometidas
end type
type p_instalacion from picture within w_3111_lista_mante_acometidas
end type
type st_nom_inst from statictext within w_3111_lista_mante_acometidas
end type
type cb_sel_inst from u_cb within w_3111_lista_mante_acometidas
end type
type cb_agregar from u_cb within w_3111_lista_mante_acometidas
end type
type cb_borrar from u_cb within w_3111_lista_mante_acometidas
end type
type cbx_sin_alim from checkbox within w_3111_lista_mante_acometidas
end type
type st_6 from statictext within w_3111_lista_mante_acometidas
end type
type sle_provincia from singlelineedit within w_3111_lista_mante_acometidas
end type
type sle_departamento from singlelineedit within w_3111_lista_mante_acometidas
end type
type sle_municipio from singlelineedit within w_3111_lista_mante_acometidas
end type
type sle_localidad from singlelineedit within w_3111_lista_mante_acometidas
end type
type sle_desde from singlelineedit within w_3111_lista_mante_acometidas
end type
type sle_hasta from singlelineedit within w_3111_lista_mante_acometidas
end type
type st_1 from statictext within w_3111_lista_mante_acometidas
end type
type st_2 from statictext within w_3111_lista_mante_acometidas
end type
type st_3 from statictext within w_3111_lista_mante_acometidas
end type
type st_4 from statictext within w_3111_lista_mante_acometidas
end type
type st_5 from statictext within w_3111_lista_mante_acometidas
end type
type st_hasta from statictext within w_3111_lista_mante_acometidas
end type
type st_desde from statictext within w_3111_lista_mante_acometidas
end type
type sle_calle from singlelineedit within w_3111_lista_mante_acometidas
end type
type cb_buscar from u_cb within w_3111_lista_mante_acometidas
end type
type cbx_referencia from checkbox within w_3111_lista_mante_acometidas
end type
type st_u_geografica from statictext within w_3111_lista_mante_acometidas
end type
type ln_6 from line within w_3111_lista_mante_acometidas
end type
type ln_2 from line within w_3111_lista_mante_acometidas
end type
type ln_1 from line within w_3111_lista_mante_acometidas
end type
type ln_4 from line within w_3111_lista_mante_acometidas
end type
type ln_5 from line within w_3111_lista_mante_acometidas
end type
type ln_8 from line within w_3111_lista_mante_acometidas
end type
type ln_9 from line within w_3111_lista_mante_acometidas
end type
type ln_11 from line within w_3111_lista_mante_acometidas
end type
type ln_12 from line within w_3111_lista_mante_acometidas
end type
type ln_13 from line within w_3111_lista_mante_acometidas
end type
type ln_14 from line within w_3111_lista_mante_acometidas
end type
type ln_10 from line within w_3111_lista_mante_acometidas
end type
type ln_15 from line within w_3111_lista_mante_acometidas
end type
type ln_16 from line within w_3111_lista_mante_acometidas
end type
type st_8 from statictext within w_3111_lista_mante_acometidas
end type
type d_lista_acometidas from u_ins_2015_pr_lista_acometidas within w_3111_lista_mante_acometidas
end type
type cbx_una_inst from checkbox within w_3111_lista_mante_acometidas
end type
type cb_imprimir from commandbutton within w_3111_lista_mante_acometidas
end type
type dw_1 from datawindow within w_3111_lista_mante_acometidas
end type
end forward

global type w_3111_lista_mante_acometidas from w_sgigenerica
integer x = 5
integer y = 4
integer width = 3616
integer height = 2272
string title = ""
event ue_retrieve pbm_custom21
event ue_deshabilitar pbm_custom22
ln_7 ln_7
ln_3 ln_3
cb_desasociar cb_desasociar
cb_suministros cb_suministros
cbx_todas cbx_todas
p_instalacion p_instalacion
st_nom_inst st_nom_inst
cb_sel_inst cb_sel_inst
cb_agregar cb_agregar
cb_borrar cb_borrar
cbx_sin_alim cbx_sin_alim
st_6 st_6
sle_provincia sle_provincia
sle_departamento sle_departamento
sle_municipio sle_municipio
sle_localidad sle_localidad
sle_desde sle_desde
sle_hasta sle_hasta
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_hasta st_hasta
st_desde st_desde
sle_calle sle_calle
cb_buscar cb_buscar
cbx_referencia cbx_referencia
st_u_geografica st_u_geografica
ln_6 ln_6
ln_2 ln_2
ln_1 ln_1
ln_4 ln_4
ln_5 ln_5
ln_8 ln_8
ln_9 ln_9
ln_11 ln_11
ln_12 ln_12
ln_13 ln_13
ln_14 ln_14
ln_10 ln_10
ln_15 ln_15
ln_16 ln_16
st_8 st_8
d_lista_acometidas d_lista_acometidas
cbx_una_inst cbx_una_inst
cb_imprimir cb_imprimir
dw_1 dw_1
end type
global w_3111_lista_mante_acometidas w_3111_lista_mante_acometidas

type variables
string is_where, is_seleccion
decimal{0} idec_nro_instal, idec_nro_inst_padre_ant
int ii_cod_prov, ii_cod_depto
long  il_cod_munic, il_cod_loc
long il_cod_calle, il_desde, il_hasta, il_nro_aco

u_generico_comunicaciones       iu_resetear      
u_generico_comunicaciones       iu_gen_comunic
u_generico_comunicaciones       iu_gen_comunic1

//u_ins_2015_nu_lista_acometidas iu_ins_2015_nu

int ii_fila_selec, ii_fila_selec_ant

string is_accion_llamada, is_nom_inst_padre_ant
string  is_prov, is_depto, is_munic, is_local

Decimal il_pot_contr
long il_cant_cli, il_cant_cli_imp

string is_id_geo
s_direccion_cliente	 is_direccion

end variables

forward prototypes
public subroutine fw_cargar_direccion ()
end prototypes

event ue_retrieve;string ls_rc, ls_mod_string, ls_original_select

SetPointer(HourGlass!)
									
ls_original_select = d_lista_acometidas.Describe("DataWindow.Table.Select")

ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + is_where + "'"

ls_rc = d_lista_acometidas.Modify(ls_mod_string)

IF ls_rc = "" THEN
        IF d_lista_acometidas.Retrieve() = 0 THEN
                gnv_msg.f_mensaje("AB02","","",OK!)
        END IF

        ls_mod_string = "DataWindow.Table.Select='" + ls_original_select + "'" 

        ls_rc = d_lista_acometidas.Modify(ls_mod_string)


END IF


end event

on ue_deshabilitar;call w_sgigenerica::ue_deshabilitar;cb_suministros.Enabled = False
sle_desde.Enabled      = False
sle_hasta.Enabled      = False
st_desde.Enabled       = False
st_hasta.Enabled       = False

cb_sel_inst.Visible    = False
cb_desasociar.Visible  = False
cb_agregar.Visible     = False
cb_borrar.Visible      = False
end on

public subroutine fw_cargar_direccion ();// Carga la ventana de ubicacion geografica con los valores que tengo en mi ventana de 
// acometidas

SELECT "DEPTOS"."COD_DEPTO", "DEPTOS"."COD_PROV"  
INTO :iu_gen_comunic.is_comunic.intval2,
	  :iu_gen_comunic.is_comunic.intval1
FROM "DEPTOS"  
WHERE ( "DEPTOS"."NOM_DEPTO" = :sle_departamento.text )  ; 

SELECT "MUNICIPIOS"."COD_MUNIC"
INTO :iu_gen_comunic.is_comunic.longval4
FROM "MUNICIPIOS"  
WHERE "MUNICIPIOS"."COD_DEPTO" = :iu_gen_comunic.is_comunic.intval2 AND
		"MUNICIPIOS"."NOM_MUNIC" = :sle_municipio.text;

SELECT "LOCALIDADES"."COD_LOCAL"   
INTO :iu_gen_comunic.is_comunic.longval5
FROM "LOCALIDADES"  
WHERE "LOCALIDADES"."COD_MUNIC" = :iu_gen_comunic.is_comunic.longval4 AND 
		"LOCALIDADES"."NOM_LOCAL" = :sle_localidad.text;   

end subroutine

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
int li_tipo_inst,li_indice,li_tension,li_par
string ls_desc, ls_aux


// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//      iu_gen_comunic  --> para cargar la estructura local 
// iu_gen_comunic1 --> para cargar los datos de la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada

SetPointer(HourGlass!)

iu_resetear      = CREATE u_generico_comunicaciones
iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_gen_comunic1  = CREATE u_generico_comunicaciones

//iu_ins_2015_nu = CREATE u_ins_2015_nu_lista_acometidas

iu_gen_comunic.is_comunic = gu_comunic.is_comunic

is_accion_llamada = iu_gen_comunic.is_comunic.accion_llamada

// Cambiar los atributos de la ventana
//this.fpr_cambiar_atributos()

//sle_provincia.Text            = gs_provincia
//sle_departamento.Text   = gs_departamento
//sle_municipio.Text            = gs_municipio
//sle_localidad.Text            = gs_localidad
//
//ii_cod_prov   = gi_cod_provincia
//ii_cod_depto  = gi_cod_departamento
//ii_cod_munic  = gi_cod_municipio
//ii_cod_loc            = gi_cod_localidad
//il_cod_calle  = 0
//
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

cb_sel_inst.Enabled = FALSE

IF gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') = 1 THEN
	This.Title = iu_gen_comunic.f_titulo_ventana("w_3111","Form.Mante.Aco.")        
	is_accion_llamada = 'Actualizacion'
ELSE
	This.Title = iu_gen_comunic.f_titulo_ventana("w_3111","Form.Mante.Aco.")        
	is_accion_llamada = 'Consulta'
	cb_agregar.visible = False
	cb_borrar.visible = False
	cb_desasociar.visible = False
	cb_sel_inst.visible = False
	
END IF

d_lista_acometidas.SetTransObject(sqlca)

// Entra por defecto la Id. Geo. por Calle.
is_id_geo = "Calle"

dw_1.modify("data_1.DataObject ='" + d_lista_acometidas.DataObject + "'")


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

event activate;call super::activate;iu_gen_comunic.is_comunic = gu_comunic.is_comunic

//CHOOSE CASE iu_gen_comunic.is_comunic.programa_retorno 
//        CASE "w_3211"
//                IF iu_gen_comunic.is_comunic.accion_retorno = "Actualizo" THEN
//                        IF il_cod_calle > 0 THEN
//                                iu_gen_comunic.is_comunic.accion_retorno = "No Actualizo"               
//                                cb_buscar.TriggerEvent(clicked!)
//                        END IF
//                ELSEIF iu_gen_comunic.is_comunic.accion_retorno = "No Actualizo" THEN
//
//                END IF
//        CASE ELSE
//
//END CHOOSE
//

end event

event close;call super::close;IF isvalid(gu_comunic) THEN
fgnu_resetear_s_comunicaciones(gu_comunic)
END IF

DESTROY iu_gen_comunic1
DESTROY iu_gen_comunic
DESTROY iu_resetear

//DESTROY iu_ins_2015_nu 
end event

on w_3111_lista_mante_acometidas.create
int iCurrent
call super::create
this.ln_7=create ln_7
this.ln_3=create ln_3
this.cb_desasociar=create cb_desasociar
this.cb_suministros=create cb_suministros
this.cbx_todas=create cbx_todas
this.p_instalacion=create p_instalacion
this.st_nom_inst=create st_nom_inst
this.cb_sel_inst=create cb_sel_inst
this.cb_agregar=create cb_agregar
this.cb_borrar=create cb_borrar
this.cbx_sin_alim=create cbx_sin_alim
this.st_6=create st_6
this.sle_provincia=create sle_provincia
this.sle_departamento=create sle_departamento
this.sle_municipio=create sle_municipio
this.sle_localidad=create sle_localidad
this.sle_desde=create sle_desde
this.sle_hasta=create sle_hasta
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_hasta=create st_hasta
this.st_desde=create st_desde
this.sle_calle=create sle_calle
this.cb_buscar=create cb_buscar
this.cbx_referencia=create cbx_referencia
this.st_u_geografica=create st_u_geografica
this.ln_6=create ln_6
this.ln_2=create ln_2
this.ln_1=create ln_1
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_8=create ln_8
this.ln_9=create ln_9
this.ln_11=create ln_11
this.ln_12=create ln_12
this.ln_13=create ln_13
this.ln_14=create ln_14
this.ln_10=create ln_10
this.ln_15=create ln_15
this.ln_16=create ln_16
this.st_8=create st_8
this.d_lista_acometidas=create d_lista_acometidas
this.cbx_una_inst=create cbx_una_inst
this.cb_imprimir=create cb_imprimir
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.ln_7
this.Control[iCurrent+2]=this.ln_3
this.Control[iCurrent+3]=this.cb_desasociar
this.Control[iCurrent+4]=this.cb_suministros
this.Control[iCurrent+5]=this.cbx_todas
this.Control[iCurrent+6]=this.p_instalacion
this.Control[iCurrent+7]=this.st_nom_inst
this.Control[iCurrent+8]=this.cb_sel_inst
this.Control[iCurrent+9]=this.cb_agregar
this.Control[iCurrent+10]=this.cb_borrar
this.Control[iCurrent+11]=this.cbx_sin_alim
this.Control[iCurrent+12]=this.st_6
this.Control[iCurrent+13]=this.sle_provincia
this.Control[iCurrent+14]=this.sle_departamento
this.Control[iCurrent+15]=this.sle_municipio
this.Control[iCurrent+16]=this.sle_localidad
this.Control[iCurrent+17]=this.sle_desde
this.Control[iCurrent+18]=this.sle_hasta
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.st_2
this.Control[iCurrent+21]=this.st_3
this.Control[iCurrent+22]=this.st_4
this.Control[iCurrent+23]=this.st_5
this.Control[iCurrent+24]=this.st_hasta
this.Control[iCurrent+25]=this.st_desde
this.Control[iCurrent+26]=this.sle_calle
this.Control[iCurrent+27]=this.cb_buscar
this.Control[iCurrent+28]=this.cbx_referencia
this.Control[iCurrent+29]=this.st_u_geografica
this.Control[iCurrent+30]=this.ln_6
this.Control[iCurrent+31]=this.ln_2
this.Control[iCurrent+32]=this.ln_1
this.Control[iCurrent+33]=this.ln_4
this.Control[iCurrent+34]=this.ln_5
this.Control[iCurrent+35]=this.ln_8
this.Control[iCurrent+36]=this.ln_9
this.Control[iCurrent+37]=this.ln_11
this.Control[iCurrent+38]=this.ln_12
this.Control[iCurrent+39]=this.ln_13
this.Control[iCurrent+40]=this.ln_14
this.Control[iCurrent+41]=this.ln_10
this.Control[iCurrent+42]=this.ln_15
this.Control[iCurrent+43]=this.ln_16
this.Control[iCurrent+44]=this.st_8
this.Control[iCurrent+45]=this.d_lista_acometidas
this.Control[iCurrent+46]=this.cbx_una_inst
this.Control[iCurrent+47]=this.cb_imprimir
this.Control[iCurrent+48]=this.dw_1
end on

on w_3111_lista_mante_acometidas.destroy
call super::destroy
destroy(this.ln_7)
destroy(this.ln_3)
destroy(this.cb_desasociar)
destroy(this.cb_suministros)
destroy(this.cbx_todas)
destroy(this.p_instalacion)
destroy(this.st_nom_inst)
destroy(this.cb_sel_inst)
destroy(this.cb_agregar)
destroy(this.cb_borrar)
destroy(this.cbx_sin_alim)
destroy(this.st_6)
destroy(this.sle_provincia)
destroy(this.sle_departamento)
destroy(this.sle_municipio)
destroy(this.sle_localidad)
destroy(this.sle_desde)
destroy(this.sle_hasta)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_hasta)
destroy(this.st_desde)
destroy(this.sle_calle)
destroy(this.cb_buscar)
destroy(this.cbx_referencia)
destroy(this.st_u_geografica)
destroy(this.ln_6)
destroy(this.ln_2)
destroy(this.ln_1)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_8)
destroy(this.ln_9)
destroy(this.ln_11)
destroy(this.ln_12)
destroy(this.ln_13)
destroy(this.ln_14)
destroy(this.ln_10)
destroy(this.ln_15)
destroy(this.ln_16)
destroy(this.st_8)
destroy(this.d_lista_acometidas)
destroy(this.cbx_una_inst)
destroy(this.cb_imprimir)
destroy(this.dw_1)
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;DataWindowChild dw_datos

dw_1.GetChild ("data_1",dw_datos)
IF dw_datos.RowCount() = 0 THEN triggerevent("ue_retrieve")

//IF d_lista_acometidas.RowCount() = 0 THEN
//	messagebox("Atencion","No se han recuperado datos")
//	return
//END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_acometidas

// 24-7-2006. Incidencia 0/443592
// gf_impresion_preliminar (lst_impresion, True, 0)
OpenWithParm ( w_generica_impresion_preliminar,  lst_impresion)	
// FIN GNU

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3111_lista_mante_acometidas
end type

type ln_7 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 105
integer beginy = 32
integer endx = 105
integer endy = 572
end type

type ln_3 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 110
integer beginy = 24
integer endx = 110
integer endy = 572
end type

type cb_desasociar from u_cb within w_3111_lista_mante_acometidas
integer x = 114
integer y = 1760
integer width = 416
integer height = 96
integer taborder = 90
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Desasociar"
end type

event clicked;long ll_nro_aco
int li_cant_cli_imp, li_par, li_tension, indice
string ls_Desc, ls_aux
boolean lb_sigo = true
//AHM(03/03/2010)
string	ls_nulo		//Constante con un valor nulo

setNull(lS_nulo)

SetPointer(HourGlass!)
ii_fila_selec = d_lista_acometidas.GetSelectedRow(0)
IF ii_fila_selec = 0 then 
	 gnv_msg.f_mensaje("EM63","","",OK!)
	return
END IF
// Controlo la existencia de Incidencias.
u_ins_2008_nu_datos_instalacion luo_2008_nu
luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
                
IF luo_2008_nu.fnu_v_inst_con_incidencia(idec_nro_inst_padre_ant) = -1 THEN
        DESTROY luo_2008_nu
        RETURN
END IF

if gnu_u_transaction.uf_lock(this, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(il_nro_aco)) <> 0 then
        DESTROY luo_2008_nu
        RETURN	
end if

// Pido confirmaci$$HEX1$$f300$$ENDHEX$$n
IF gnv_msg.f_mensaje("CM10","","",YesNo!) = 1 THEN

        // Obtengo la cantidad de clientes importantes.
        li_cant_cli_imp = luo_2008_nu.fnu_v_sum_imp_aco(il_nro_aco)

        IF li_cant_cli_imp < 0 THEN
                gnu_u_transaction.uf_rollback(this);
                DESTROY luo_2008_nu
                RETURN 
        END IF

        // Actualizo la informaci$$HEX1$$f300$$ENDHEX$$n de la red,
        // para aquellas instalaciones que fueron afectadas.
        IF luo_2008_nu.fnu_actualizar_red_aco(idec_nro_inst_padre_ant,gi_acometida_sin_alim,il_pot_contr,il_cant_cli,li_cant_cli_imp) = -1 THEN
                gnu_u_transaction.uf_rollback(this);
                DESTROY luo_2008_nu
                RETURN
        END IF
        
        // Actualizo la Acometida
        d_lista_acometidas.SetItem(ii_fila_selec,"INSTALACION_ORIGEN",0)        
        d_lista_acometidas.SetItem(ii_fila_selec,"instalacion_nom_instalacion","")      
  		  //AHM(03/03/2010)
		  d_lista_acometidas.SetItem(ii_fila_selec,"SGD_ACOMETIDA_INSTALACION_ORIGEN_V10", ls_nulo)        
		  d_lista_acometidas.SetItem(ii_fila_selec,"SGD_ACOMETIDA_ONIS_STAT", ls_nulo)        
		  
        //AHM (14/12/2009) Incidencia  0/100109670
		  d_lista_acometidas.SetItem(ii_fila_selec,"f_actual",string(fgnu_fecha_actual()))        
        d_lista_acometidas.SetItem(ii_fila_selec,"programa",'w_3111')
        d_lista_acometidas.SetItem(ii_fila_selec,"usuario",gs_usuario)

        d_lista_acometidas.Update()
        cb_buscar.triggerEvent(clicked!)
END IF
gnu_u_transaction.uf_commit(this);        
DESTROY luo_2008_nu

//This.Enabled = False


end event

type cb_suministros from u_cb within w_3111_lista_mante_acometidas
integer x = 2482
integer y = 1760
integer width = 416
integer height = 96
integer taborder = 120
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Suministros"
end type

event clicked;SetPointer(HourGlass!)

ii_fila_selec = d_lista_acometidas.GetSelectedRow(0)
IF ii_fila_selec = 0 then 
	 gnv_msg.f_mensaje("EM63","","",OK!)
	return
END IF


gu_comunic.is_comunic.longval1 = il_nro_aco

gu_comunic.is_comunic.programa_llamante = "w_3111"

//IF is_accion_llamada = "Consulta" THEN
        gu_comunic.is_comunic.accion_llamada = "Consulta"
//ELSE
//      gu_comunic.is_comunic.accion_llamada = "Actualizacion"
//END IF

//gu_comunic.fnu_abrir(w_3112_lista_consulta_sum,"w_3112_lista_consulta_sum",1,1,w_3111_lista_mante_acometidas,"w_3111_lista_mante_acometidas")
Open(w_3112_lista_consulta_sum)


IF gu_comunic.is_comunic.intval11= 0  THEN
                gnv_msg.f_mensaje("AM15","","",OK!)
                
END IF


end event

type cbx_todas from checkbox within w_3111_lista_mante_acometidas
boolean visible = false
integer x = 2203
integer y = 736
integer width = 635
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Asociar Todas"
end type

event clicked;int i, li_cant_filas, li_cant_cli_imp
long ll_aco,  ll_cant_cli
Decimal ll_pot_contr
decimal{0} ldec_inst
datetime ldt_f_actual
string ls_nom_inst_padre_ant

ldt_f_actual = fgnu_fecha_actual()

SetPointer(HourGlass!)


Parent.SetRedraw(False)

IF This.Checked THEN

        // Asocio todas las acometidas seleccionadas a 
        // la instalaci$$HEX1$$f300$$ENDHEX$$n elegida.


        SetPointer(HourGlass!)

        // Aviso de que la operaci$$HEX1$$f300$$ENDHEX$$n a procesar puede ser costosa,
        // y pido confirmaci$$HEX1$$f300$$ENDHEX$$n.
        
        IF gnv_msg.f_mensaje("CM09","","",YesNo!) = 1 THEN
        
                // Controlo la existencia de Incidencias.
                u_ins_2008_nu_datos_instalacion luo_2008_nu
                luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
                                
                li_cant_filas = d_lista_acometidas.RowCount()

                FOR i = 1 TO li_cant_filas 
                        ldec_inst = d_lista_acometidas.GetItemDecimal(i,"INSTALACION_ORIGEN")
								
								 ll_aco = d_lista_acometidas.GetItemNumber(i,"codigo")
								if gnu_u_transaction.uf_lock(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco)) <> 0 then 
									continue
								end if 
                        
                        Parent.SetRedraw(TRUE)
                        d_lista_acometidas.setrow(i)
                        d_lista_acometidas.SelectRow(i,True)
                        Parent.SetRedraw(False)

                        IF ldec_inst <> 0 THEN
                                IF luo_2008_nu.fnu_v_inst_con_incidencia(ldec_inst) = -1 THEN
                                       
                                        IF gnv_msg.f_mensaje("CM08",String(ll_aco),"",OK!) = 2 THEN
                                                DESTROY luo_2008_nu
                                                cb_buscar.PostEvent(clicked!)
                                                This.Checked = False
                                                Parent.SetRedraw(True)
                                                RETURN                          
                                        END IF
                                END IF
                        END IF  

                        ls_nom_inst_padre_ant = d_lista_acometidas.GetItemString(i,"instalacion_nom_instalacion")

                        // Realizo la operaci$$HEX1$$f300$$ENDHEX$$n si la nueva instalaci$$HEX1$$f300$$ENDHEX$$n es diferente 
                        // a la anterior.
                        IF IsNull(ls_nom_inst_padre_ant) OR ls_nom_inst_padre_ant <> st_nom_inst.Text THEN
                        
                                ll_pot_contr = d_lista_acometidas.GetItemNumber(i,"pot_contratada")
                                ll_cant_cli  = d_lista_acometidas.GetItemNumber(i,"cant_cli")

                                // Obtengo la cantidad de clientes importantes.
                                li_cant_cli_imp = luo_2008_nu.fnu_v_sum_imp_aco(ll_aco)
                
                                IF li_cant_cli_imp < 0 THEN
                                        gnu_u_transaction.uf_rollback(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco));
                                        DESTROY luo_2008_nu
                                        This.Checked = False
                                        Parent.SetRedraw(True)
                                        RETURN 
                                END IF
                
                                // Actualizo la informaci$$HEX1$$f300$$ENDHEX$$n de la red,
                                // para aquellas instalaciones que fueron afectadas.
                                IF luo_2008_nu.fnu_actualizar_red_aco(ldec_inst,idec_nro_instal,ll_pot_contr,ll_cant_cli,li_cant_cli_imp) = -1 THEN
                                        gnu_u_transaction.uf_rollback(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco));
                                        DESTROY luo_2008_nu
                                        This.Checked = False
                                        Parent.SetRedraw(True)
                                        RETURN
                                END IF
                        
                                // Actualizo la Acometida
                                d_lista_acometidas.SetItem(i,"INSTALACION_ORIGEN",idec_nro_instal)      
                                d_lista_acometidas.SetItem(i,"instalacion_nom_instalacion",st_nom_inst.Text)    
                        
   									  //AHM(03/03/2010)
										  d_lista_acometidas.SetItem(ii_fila_selec,"SGD_ACOMETIDA_INSTALACION_ORIGEN_V10", "15:" + string(idec_nro_instal))        
										  d_lista_acometidas.SetItem(ii_fila_selec,"SGD_ACOMETIDA_ONIS_STAT", '0')  
								
                                d_lista_acometidas.SetItem(i,"f_actual",ldt_f_actual)   
                                d_lista_acometidas.SetItem(i,"programa",'w_3111')
                                d_lista_acometidas.SetItem(i,"usuario",gs_usuario)
               
							END IF          
						d_lista_acometidas.Update()
                 gnu_u_transaction.uf_commit(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco));
                NEXT
               
                


                DESTROY luo_2008_nu
        
                This.Checked = False

                IF ii_fila_selec > 0 THEN
                        cb_desasociar.Enabled = True
                END IF
                st_nom_inst.Visible = FALSE
                p_instalacion.Visible = FALSE
                cbx_todas.Visible = FALSE
                cbx_una_inst.Visible = FAlSE
                cb_buscar.TriggerEvent(Clicked!)
        END IF
END IF

This.Checked = False

Parent.SetRedraw(True)


end event

type p_instalacion from picture within w_3111_lista_mante_acometidas
boolean visible = false
integer x = 1458
integer y = 676
integer width = 73
integer height = 64
string picturename = "sal_baja.bmp"
boolean border = true
boolean focusrectangle = false
end type

event dragdrop;//int li_cant_cli_imp
//
//SetPointer(HourGlass!)
//
//// Controlo la existencia de Incidencias.
//u_ins_2008_nu_datos_instalacion luo_2008_nu
//luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
//
//IF idec_nro_inst_padre_ant <> 0 THEN
//	IF luo_2008_nu.fnu_v_inst_con_incidencia(idec_nro_inst_padre_ant) = -1 THEN
//   	DESTROY luo_2008_nu
//      d_lista_acometidas.Drag(End!)
//      RETURN
//   END IF
//END IF
//
//// Realizo la operaci$$HEX1$$f300$$ENDHEX$$n si la nueva instalaci$$HEX1$$f300$$ENDHEX$$n es diferente 
//// a la anterior.
//IF IsNull(is_nom_inst_padre_ant) OR is_nom_inst_padre_ant <> st_nom_inst.Text THEN
//
//        // Pido confirmaci$$HEX1$$f300$$ENDHEX$$n
//	IF gnv_msg.f_mensaje("CM10","","",YesNo!) = 1 THEN
//   	// Obtengo la cantidad de clientes importantes.
//      li_cant_cli_imp = luo_2008_nu.fnu_v_sum_imp_aco(il_nro_aco)
//      
//		IF li_cant_cli_imp < 0 THEN
//      	gnu_u_transaction.uf_rollback();
//         DESTROY luo_2008_nu
//         d_lista_acometidas.Drag(End!)
//         RETURN 
//      END IF
//        
//      // Actualizo la informaci$$HEX1$$f300$$ENDHEX$$n de la red,
//      // para aquellas instalaciones que fueron afectadas.
//      IF luo_2008_nu.fnu_actualizar_red_aco(idec_nro_inst_padre_ant,idec_nro_instal,il_pot_contr,il_cant_cli,li_cant_cli_imp) = -1 THEN
// 	   	gnu_u_transaction.uf_rollback();
//         DESTROY luo_2008_nu
//         d_lista_acometidas.Drag(End!)
//         RETURN
//      END IF
//                
//      // Actualizo la Acometida
//      d_lista_acometidas.SetItem(ii_fila_selec,"nro_instalacion",idec_nro_instal)     
//      d_lista_acometidas.SetItem(ii_fila_selec,"instalacion_nom_instalacion",st_nom_inst.Text)        
//                
//      d_lista_acometidas.SetItem(ii_fila_selec,"f_actual",fgnu_fecha_actual())        
//      d_lista_acometidas.SetItem(ii_fila_selec,"programa",'w_3111')
//      d_lista_acometidas.SetItem(ii_fila_selec,"usuario",gs_usuario)
//                
//      d_lista_acometidas.Update()
//      gnu_u_transaction.uf_commit();
//
//      cb_desasociar.Enabled = True
//	END IF
//END IF
//        
//DESTROY luo_2008_nu
//
//d_lista_acometidas.Drag(End!)
//
//cb_desasociar.Enabled = True
//

cbx_una_inst.checked = True
cbx_una_inst.TriggerEvent('clicked')
end event

type st_nom_inst from statictext within w_3111_lista_mante_acometidas
boolean visible = false
integer x = 1586
integer y = 648
integer width = 544
integer height = 132
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean enabled = false
string text = " Instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type cb_sel_inst from u_cb within w_3111_lista_mante_acometidas
integer x = 795
integer y = 644
integer width = 453
integer height = 96
integer taborder = 80
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "I&nstalaci$$HEX1$$f300$$ENDHEX$$n:"
end type

event clicked;// Se carga la estructura con los valores para la
// llamada a una ventana
long li_fila
                                
SetPointer(HourGlass!)

ii_fila_selec = d_lista_acometidas.GetSelectedRow(0)
IF ii_fila_selec = 0 then 
	 gnv_msg.f_mensaje("EM63","","",OK!)
	return
END IF

gu_comunic.is_comunic.programa_llamante = "w_3111"
gu_comunic.is_comunic.accion_llamada = 'Seleccion'
                                                
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
                                        
// Va a permitir traer las instalaciones para el centro
// y cmd dado ( sin considerar la mesa)
gu_comunic.is_comunic.intval4 = 2
                                                
gu_comunic.is_comunic.strval1 = "dw_lista_instal"
gu_comunic.is_comunic.programa_retorno = ' '

//gu_comunic.fnu_abrir(w_2120_identificacion_instalacion,"w_2120_identificacion_instalacion",1,1,w_3111_lista_mante_acometidas,"w_3111_lista_mante_acometidas")

Open(w_2120_identificacion_instalacion)

iu_gen_comunic1.is_comunic = gu_comunic1.is_comunic

// Controlo que haya sido seleccionada una instalaci$$HEX1$$f300$$ENDHEX$$n.
IF iu_gen_comunic1.is_comunic.accion_retorno = "Seleccionada" THEN

   p_instalacion.Visible = True
   st_nom_inst.Visible = True
  

   IF d_lista_acometidas.RowCount() >= 1 THEN
      cbx_una_inst.Visible = TRUE
   	IF d_lista_acometidas.RowCount() > 1 THEN
			cbx_todas.Visible = TRUE
		END IF
   END IF

   idec_nro_instal  = iu_gen_comunic1.is_comunic.decval1
   st_nom_inst.Text = iu_gen_comunic1.is_comunic.strval2
END IF

gu_comunic.is_comunic.intval1 = ii_cod_prov
gu_comunic.is_comunic.intval2 = ii_cod_depto
gu_comunic.is_comunic.longval4 = il_cod_munic
gu_comunic.is_comunic.longval5 = il_cod_loc
gu_comunic.is_comunic.longval3 = il_cod_calle
gu_comunic.is_comunic.longval1 = il_nro_aco
gu_comunic.is_comunic.strval1 = sle_provincia.Text
gu_comunic.is_comunic.strval2 = sle_departamento.Text
gu_comunic.is_comunic.strval3 = sle_municipio.Text
gu_comunic.is_comunic.strval4 = sle_localidad.Text
gu_comunic.is_comunic.strval5 = sle_calle.Text

end event

type cb_agregar from u_cb within w_3111_lista_mante_acometidas
integer x = 690
integer y = 1760
integer width = 416
integer height = 96
integer taborder = 100
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "A&gregar"
end type

event clicked;//IF is_accion_llamada <> "Consulta" THEN
        gu_comunic.is_comunic.accion_llamada = "Alta"
		  
	// GNU 12-5-2006. Incidencia 0/421756
	gu_comunic.is_comunic.strval8=sle_desde.text
	gu_comunic.is_comunic.strval9=sle_hasta.text
	// FIN GNU
//      gu_comunic.fnu_abrir(w_3211_form_mante_acometidas,"w_3211_form_mante_acometidas",1,1,w_3111_lista_mante_acometidas,"w_3111_lista_mante_acometidas")
//OpenSheet(w_3211_form_mante_acometidas,w_3111_lista_mante_acometidas,4,Original!)
Open(w_3211_form_mante_acometidas)
//END IF

cbx_sin_alim.Enabled = TRUE
end event

type cb_borrar from u_cb within w_3111_lista_mante_acometidas
integer x = 1257
integer y = 1760
integer width = 416
integer height = 96
integer taborder = 110
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Eliminar"
end type

event clicked;call super::clicked;decimal{0} ldec_inst
int li_tension, indice, li_par
string ls_Aux, ls_desc
boolean lb_sigo = true

ii_fila_selec = d_lista_acometidas.GetSelectedRow(0)
IF ii_fila_selec = 0 then 
	 gnv_msg.f_mensaje("EM63","","",OK!)
	return
END IF

// Controlo la existencia de Incidencias.
u_ins_2008_nu_datos_instalacion luo_2008_nu
luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion

IF luo_2008_nu.fnu_v_inst_con_incidencia(idec_nro_inst_padre_ant) = -1 THEN
        DESTROY luo_2008_nu
        RETURN
END IF

DESTROY luo_2008_nu

if gnu_u_transaction.uf_lock(this, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(il_nro_aco)) <> 0 then
        DESTROY luo_2008_nu
        RETURN
END IF
	
IF gnv_msg.f_mensaje("CM05","","",YesNo!) = 1 THEN

        d_lista_acometidas.DeleteRow(ii_fila_selec)
        d_lista_acometidas.Update()
END IF

gnu_u_transaction.uf_commit(this);

if d_lista_acometidas.rowcount() = 0 then
	cb_desasociar.enabled  = false
	cb_suministros.enabled = false
	cb_desasociar.enabled  = false
	cb_borrar.enabled = false
end if
end event

type cbx_sin_alim from checkbox within w_3111_lista_mante_acometidas
integer x = 1760
integer y = 1760
integer width = 640
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = "Sin Alimentaci$$HEX1$$f300$$ENDHEX$$n"
end type

event clicked;d_lista_acometidas.RESET()
cb_borrar.enabled = false

//AHM(09/05/2011) ASUR 1084547
cb_sel_inst.enabled = FALSE
cb_desasociar.enabled = FALSE
cb_suministros.enabled = FALSE
cb_buscar.enabled = TRUE
cb_agregar.enabled = TRUE
cbx_sin_alim.enabled = TRUE
cb_imprimir.enabled = TRUE
st_nom_inst.visible = FALSE
p_instalacion.visible = FALSE
cbx_una_inst.visible = FALSE
//int li_cant_filas
//
//SetPointer(HourGlass!)
//
//Parent.SetRedraw(False)
//
//li_cant_filas = d_lista_acometidas.RowCount()
//
//
//d_lista_acometidas.SetFilter("")
//d_lista_acometidas.Filter()
//
//IF This.Checked THEN
//        d_lista_acometidas.SetFilter("instalacion_origen = " + String(gi_acometida_sin_alim) + " ")
//        d_lista_acometidas.Filter()
//
////      cb_suministros.Enabled = False
////      cb_borrar.Enabled = False
//		  if gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
//				  cb_sel_inst.Enabled = TRUE
//  		  end if
//
//else
//                d_lista_acometidas.SetFilter("instalacion_origen <> " + String(gi_acometida_sin_alim) + " ")
//                d_lista_acometidas.Filter()
//                cb_sel_inst.Enabled = FALSE
//
//END IF  
//
//
//IF li_cant_filas <> d_lista_acometidas.RowCount() THEN
//        d_lista_acometidas.SelectRow(0,False)
//        d_lista_acometidas.SetRow(0)
//   cb_desasociar.Enabled = False
//END IF
//
//DataWindowChild dw_datos
//long ll_longitud
//datetime ldt_desde, ldt_hasta
//string ls_columna, ls_visible, ls_wid, ls_titulo
//
//
//
////Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("d_1",dw_datos)
//
////Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
//ls_titulo = 'Lista de Acometidas'
//ll_longitud = len (ls_titulo)*100
//
//dw_1.modify("nulo_desde.visible = '0")
//dw_1.modify("f_desde.visible='0'")
//dw_1.modify("desde.Visible='0'")
//dw_1.modify("nulo_hasta.visible = '0'")
//dw_1.modify("f_hasta.visible='0'")
//dw_1.modify("hasta.Visible='0'")
//
//// si no son nulas las inserto
//dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
//dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
//dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
//dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
//
//d_lista_acometidas.ShareData(dw_datos)
//d_lista_acometidas.setredraw(true)
//Parent.SetRedraw(True)
//
//
end event

type st_6 from statictext within w_3111_lista_mante_acometidas
integer x = 105
integer y = 824
integer width = 3365
integer height = 84
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16777215
long backcolor = 8421440
boolean enabled = false
string text = "Acometidas de la Finca"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type sle_provincia from singlelineedit within w_3111_lista_mante_acometidas
integer x = 773
integer y = 120
integer width = 1010
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_departamento from singlelineedit within w_3111_lista_mante_acometidas
integer x = 773
integer y = 204
integer width = 1010
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_municipio from singlelineedit within w_3111_lista_mante_acometidas
integer x = 773
integer y = 288
integer width = 1010
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_localidad from singlelineedit within w_3111_lista_mante_acometidas
integer x = 773
integer y = 372
integer width = 1010
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_desde from singlelineedit within w_3111_lista_mante_acometidas
integer x = 2994
integer y = 292
integer width = 256
integer height = 84
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type sle_hasta from singlelineedit within w_3111_lista_mante_acometidas
integer x = 2994
integer y = 400
integer width = 256
integer height = 84
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
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

type st_1 from statictext within w_3111_lista_mante_acometidas
integer x = 261
integer y = 120
integer width = 512
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

type st_2 from statictext within w_3111_lista_mante_acometidas
integer x = 261
integer y = 208
integer width = 512
integer height = 64
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

type st_3 from statictext within w_3111_lista_mante_acometidas
integer x = 261
integer y = 296
integer width = 512
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

type st_4 from statictext within w_3111_lista_mante_acometidas
integer x = 261
integer y = 384
integer width = 512
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

type st_5 from statictext within w_3111_lista_mante_acometidas
integer x = 1966
integer y = 96
integer width = 361
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

type st_hasta from statictext within w_3111_lista_mante_acometidas
integer x = 2693
integer y = 408
integer width = 233
integer height = 68
integer taborder = 30
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

event doubleclicked;gu_comunic.is_comunic.programa_llamante = "w_3111_mante_aco"
gu_comunic.is_comunic.programa_retorno   = ""
gu_comunic.is_comunic.accion_retorno     = ""
gu_comunic.is_comunic.strval8 = sle_desde.text
gu_comunic.is_comunic.strval9 = sle_hasta.text

//parmstr3 = gu_comunic.is_comunic.strval4                                    // Localidad
//parmstr4 = gu_comunic.is_comunic.strval5                                        // Calle

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

type st_desde from statictext within w_3111_lista_mante_acometidas
integer x = 2683
integer y = 308
integer width = 233
integer height = 68
integer taborder = 20
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

event doubleclicked;gu_comunic.is_comunic.programa_llamante = "w_3111_mante_aco"
gu_comunic.is_comunic.programa_retorno   = ""
gu_comunic.is_comunic.accion_retorno     = ""
gu_comunic.is_comunic.strval8 = sle_desde.text
gu_comunic.is_comunic.strval9 = sle_hasta.text

//parmstr3 = gu_comunic.is_comunic.strval4                                    // Localidad
//parmstr4 = gu_comunic.is_comunic.strval5                                    // Calle

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

type sle_calle from singlelineedit within w_3111_lista_mante_acometidas
integer x = 2327
integer y = 88
integer width = 1019
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 81324524
boolean autohscroll = false
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_buscar from u_cb within w_3111_lista_mante_acometidas
integer x = 128
integer y = 640
integer width = 411
integer height = 96
integer taborder = 70
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Buscar"
end type

event clicked;string ls_original_select, ls_original_select2, ls_mod_string, ls_rc, ls_ref_dir

SetPointer(HourGlass!)
parent.setredraw(false)

//gs_localidad =sle_localidad.text
//gs_municipio=sle_municipio.text
//gs_provincia=sle_provincia.text
//gs_departamento=sle_departamento.text


	IF NOT cbx_referencia.Checked THEN
	
			  IF Len(Trim(sle_desde.Text)) <> 0 AND &
									Not IsNumber(sle_desde.Text) THEN
						 gnv_msg.f_mensaje("EM29","","",OK!)
						 setfocus(sle_desde)
	
			  END IF
			  
			  IF Len(Trim(sle_hasta.Text)) <> 0 AND &
									NOT IsNumber(sle_hasta.Text) THEN
						 gnv_msg.f_mensaje("EM30","","",OK!)
						 setfocus(sle_hasta)
	  
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
						 is_where = " AND CALLEJERO.COD_PROV = " + String(ii_cod_prov) + " AND CALLEJERO.COD_DEPTO = "  + & 
						 String(ii_cod_depto) + " AND CALLEJERO.COD_MUNIC = " + String(il_cod_munic) + " AND CALLEJERO.COD_LOCAL = "   + & 
						 String(il_cod_loc) + " AND FINCAS.COD_CALLE = " + String(il_cod_calle) + " AND FINCAS.NUM_PUERTA >= "   + & 
						 String(il_desde) + " AND FINCAS.NUM_PUERTA <= " + String(il_hasta) + " " 						 
			  ELSEIF il_desde > 0 THEN
						 is_where = " AND CALLEJERO.COD_PROV = " + String(ii_cod_prov) + " AND CALLEJERO.COD_DEPTO = " + String(ii_cod_depto)  + & 
						 " AND CALLEJERO.COD_MUNIC = " + String(il_cod_munic) + " AND CALLEJERO.COD_LOCAL = " + String(il_cod_loc) +  & 
						 " AND FINCAS.COD_CALLE = " + String(il_cod_calle) + " AND FINCAS.NUM_PUERTA <= " + String(il_desde) + " "
			  ELSEIF il_hasta > 0 THEN
						 is_where = " AND CALLEJERO.COD_PROV = " + String(ii_cod_prov) + " AND CALLEJERO.COD_DEPTO = " + &
						 String(ii_cod_depto) + " AND CALLEJERO.COD_MUNIC = " + String(il_cod_munic) + " AND CALLEJERO.COD_LOCAL = " + &
						 String(il_cod_loc) + " AND FINCAS.COD_CALLE = " + String(il_cod_calle) + " AND FINCAS.NUM_PUERTA <= " + &
						 String(il_hasta) + " "
			  ELSE
						 is_where = " AND CALLEJERO.COD_PROV = " + String(ii_cod_prov) + " AND CALLEJERO.COD_DEPTO = " + String(ii_cod_depto) + &
						 " AND CALLEJERO.COD_MUNIC = " + String(il_cod_munic) + " AND CALLEJERO.COD_LOCAL = " + String(il_cod_loc) + &
						 " AND FINCAS.COD_CALLE = " + String(il_cod_calle) + " "
			  END IF
	
			  //AHM (03/03/2010)
			  ls_original_select  = " SELECT SGD_ACOMETIDA.PROGRAMA, SGD_ACOMETIDA.CODIGO, SGD_ACOMETIDA.INSTALACION_ORIGEN, "  + &
			  "SGD_ACOMETIDA.POT_CONTRATADA, SGD_ACOMETIDA.KWH, SGD_ACOMETIDA.NIF, SGD_ACOMETIDA.CANT_CLI,"  + &
			  "CALLEJERO.COD_DEPTO, CALLEJERO.COD_LOCAL, CALLEJERO.COD_PROV, CALLEJERO.COD_MUNIC, "  + &
			  "SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.KWH_FACT, FINCAS.COD_CALLE, FINCAS.NUM_PUERTA, "  + &
			  "FINCAS.DUPLICADOR, SGD_ACOMETIDA.F_ACTUAL, SGD_ACOMETIDA.USUARIO, SGD_INSTALACION.NOM_INSTALACION,"  + &
			  " SGD_ACOMETIDA.ONIS_STAT, SGD_ACOMETIDA.INSTALACION_ORIGEN_V10," + &
			  "CALLEJERO.NOM_CALLE, fgnu_calle_referencia(callejero.nom_calle, FINCAS.num_puerta, FINCAS.duplicador, "  + &
			  "SGD_ACOMETIDA.nif, FINCAS.cod_calle, 0, '', 0, '') cdireccion"
			  
			  ls_original_select2 = " FROM SGD_ACOMETIDA, FINCAS,SGD_INSTALACION, CALLEJERO WHERE ( SGD_INSTALACION.BDI_JOB(+) = 0 ) "  + &
			  "AND( SGD_ACOMETIDA.BDI_JOB =0 ) AND ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion(+)) and "  + &
			  "( FINCAS.COD_CALLE = CALLEJERO.COD_CALLE (+)) AND (FINCAS.NIF = SGD_ACOMETIDA.NIF)"
	
	ELSE
	
						 
			  IF IsNull(sle_calle.text) OR sle_calle.text = "" OR sle_calle.text = " " THEN
				
						 is_where = " AND SGD_ACOMETIDA.NIF = FINCAS.NIF AND Length(RTrim(LTrim(FINCAS.REF_DIR))) > 0 "
						 
						 //AHM (03/03/2010)
						 ls_original_select  = " SELECT  SGD_ACOMETIDA.PROGRAMA, SGD_ACOMETIDA.CODIGO, SGD_ACOMETIDA.INSTALACION_ORIGEN, "  + &
						 "SGD_ACOMETIDA.POT_CONTRATADA, SGD_ACOMETIDA.KWH, SGD_ACOMETIDA.NIF, SGD_ACOMETIDA.CANT_CLI, CALLEJERO.COD_DEPTO, "  + &
						 "CALLEJERO.COD_LOCAL, CALLEJERO.COD_PROV, CALLEJERO.COD_MUNIC, SGD_ACOMETIDA.DESCRIPCION,  "  + &
						 "SGD_ACOMETIDA.KWH_FACT, FINCAS.COD_CALLE, FINCAS.NUM_PUERTA, FINCAS.DUPLICADOR, "  + &
						 "SGD_ACOMETIDA.F_ACTUAL, SGD_ACOMETIDA.USUARIO, SGD_INSTALACION.NOM_INSTALACION, CALLEJERO.NOM_CALLE, "  + &
						" SGD_ACOMETIDA.ONIS_STAT, SGD_ACOMETIDA.INSTALACION_ORIGEN_V10," + &
						 "fgnu_calle_referencia('', FINCAS.num_puerta, FINCAS.duplicador, SGD_ACOMETIDA.nif, FINCAS.cod_calle, 0, '', 0, '') cdireccion"
						 
						 ls_original_select2 = " FROM SGD_ACOMETIDA, SGD_INSTALACION, FINCAS, CALLEJERO WHERE ( SGD_INSTALACION.BDI_JOB(+) = 0 ) "  + &
						 " and ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion (+)) and ( FINCAS.COD_CALLE = CALLEJERO.COD_CALLE (+)) "
			  ELSE
						 ls_ref_dir = Trim(sle_calle.text)
						 
						 is_where = " AND SGD_ACOMETIDA.NIF = FINCAS.NIF AND FINCAS.COD_CALLE = " + String(il_cod_calle) + " AND FINCAS.REF_DIR = '"  + ls_ref_dir + "' "
						 
						 //AHM (03/03/2010)
						 ls_original_select  = " SELECT SGD_ACOMETIDA.PROGRAMA, SGD_ACOMETIDA.CODIGO, SGD_ACOMETIDA.INSTALACION_ORIGEN, "  + & 
						 "SGD_ACOMETIDA.POT_CONTRATADA, SGD_ACOMETIDA.KWH, SGD_ACOMETIDA.NIF, SGD_ACOMETIDA.CANT_CLI, "  + & 
						 "CALLEJERO.COD_DEPTO, CALLEJERO.COD_LOCAL, CALLEJERO.COD_PROV, CALLEJERO.COD_MUNIC, "  + & 
						 "SGD_ACOMETIDA.DESCRIPCION, SGD_ACOMETIDA.KWH_FACT, FINCAS.COD_CALLE, FINCAS.NUM_PUERTA, "  + & 
						 "FINCAS.DUPLICADOR, SGD_ACOMETIDA.F_ACTUAL, SGD_ACOMETIDA.USUARIO, SGD_INSTALACION.NOM_INSTALACION,"  + & 
						 " SGD_ACOMETIDA.ONIS_STAT, SGD_ACOMETIDA.INSTALACION_ORIGEN_V10," + &
						 "CALLEJERO.NOM_CALLE, fgnu_calle_referencia('', FINCAS.num_puerta, FINCAS.duplicador, SGD_ACOMETIDA.nif, "  + & 
						 "FINCAS.cod_calle, 0, '', 0, '') cdireccion"
						 
						 ls_original_select2 = " FROM SGD_ACOMETIDA, SGD_INSTALACION, CALLEJERO, FINCAS WHERE ( SGD_INSTALACION.BDI_JOB(+) = 0 ) " + & 
						 "AND ( SGD_ACOMETIDA.INSTALACION_ORIGEN = sgd_instalacion.nro_instalacion (+)) and ( FINCAS.COD_CALLE = CALLEJERO.COD_CALLE (+)) "
			  END IF
	END IF
	string ls_select_modificado
	ls_select_modificado= 'DataWindow.Table.Select="' + ls_original_select + ls_original_select2 + is_where + '"'
	ls_rc = d_lista_acometidas.Modify(ls_select_modificado)
	
	Parent.SetRedraw(False)
	
	IF ls_rc = "" THEN
			  
			  IF d_lista_acometidas.Retrieve(ls_ref_dir) = 0 AND &
						 cb_sel_inst.Enabled = FALSE AND &
						 cb_desasociar.Enabled = FALSE THEN 
	        //      gnv_msg.f_mensaje("AM17","","",OK!)
	
			  END IF
	END IF
	//cbx_sin_alim.Enabled = True
	cb_suministros.Enabled = False
	cb_borrar.Enabled = False
	//cbx_sin_alim.Checked = False
	IF cbx_sin_alim.checked THEN
		d_lista_acometidas.SetFilter("INSTALACION_ORIGEN = " + String(gi_acometida_sin_alim) + " ")	
	ELSE
		d_lista_acometidas.SetFilter("INSTALACION_ORIGEN <> " + String(gi_acometida_sin_alim) + " ")
	END IF	
	d_lista_acometidas.Filter()
	
	//AMH(21/12/2010) ASUR 839829
	if d_lista_acometidas.rowcount() = 0 THEN // AND &
//						 cb_desasociar.Enabled = FALSE THEN
		IF cbx_referencia.Checked THEN
			gnv_msg.f_mensaje("AM66","","",OK!)
		ELSE
			 gnv_msg.f_mensaje("AM17","","",OK!)
		END IF
	end if
	
	
	
	DataWindowChild dw_datos
	long ll_longitud
	datetime ldt_desde, ldt_hasta
	string ls_columna, ls_visible, ls_wid, ls_titulo
	
	
	
	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista de Acometidas'
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
	
//	d_lista_acometidas.ShareData(dw_datos)
	d_lista_acometidas.setredraw(true)
	
	IF d_lista_acometidas.RowCount() > 0 THEN
		IF cbx_sin_alim.checked THEN
			cb_sel_inst.Enabled = true
			cb_desasociar.enabled = false
		ELSE
			cb_sel_inst.Enabled = false
			cb_desasociar.enabled = true
		END IF 
	ELSE
		cb_sel_inst.Enabled = false
		cb_desasociar.enabled = false
	END IF
	
	
	Parent.SetRedraw(True)

end event

type cbx_referencia from checkbox within w_3111_lista_mante_acometidas
boolean visible = false
integer x = 2875
integer y = 680
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
        is_id_geo = "Referencia"
        cb_buscar.Enabled = True
        st_desde.Enabled  = False
        st_hasta.Enabled  = False
        sle_desde.Enabled = False
        sle_hasta.Enabled = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//        sle_desde.BackColor = (65536*192+256*192+192)
//        sle_hasta.BackColor = (65536*192+256*192+192)
        sle_desde.BackColor = long(gs_gris)
        sle_hasta.BackColor = long(gs_gris)
// Fin. Sgo.
ELSE
        is_id_geo = "Calle"
        cb_buscar.Enabled = False
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//        sle_desde.BackColor = (65536*255+256*255+255)
//        sle_hasta.BackColor = (65536*255+256*255+255)
        sle_desde.BackColor = long(gs_blanco)
        sle_hasta.BackColor = long(gs_blanco)
// Fin. Sgo.
END IF


end event

type st_u_geografica from statictext within w_3111_lista_mante_acometidas
integer x = 169
integer y = 4
integer width = 722
integer height = 68
integer taborder = 10
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

iu_gen_comunic.is_comunic = gu_comunic.is_comunic 

// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica siempre 
sle_calle.Text = "" //MATO
parmstr6 = sle_calle.Text

fw_cargar_direccion()

//SELECT "DEPTOS"."COD_DEPTO", "DEPTOS"."COD_PROV"  
//INTO :gu_comunic.is_comunic.intval2,
//	  :gu_comunic.is_comunic.intval1
//FROM "DEPTOS"  
//WHERE ( "DEPTOS"."NOM_DEPTO" = :sle_departamento.text )  ; 
//
//SELECT "MUNICIPIOS"."COD_MUNIC"
//INTO :gu_comunic.is_comunic.longval4
//FROM "MUNICIPIOS"  
//WHERE "MUNICIPIOS"."COD_DEPTO" = :gu_comunic.is_comunic.intval2 AND
//		"MUNICIPIOS"."NOM_MUNIC" = :sle_municipio.text;
//
//SELECT "LOCALIDADES"."COD_LOCAL"   
//INTO :gu_comunic.is_comunic.longval5
//FROM "LOCALIDADES"  
//WHERE "LOCALIDADES"."COD_MUNIC" = :gu_comunic.is_comunic.longval4 AND 
//		"LOCALIDADES"."NOM_LOCAL" = :sle_localidad.text;   

gu_comunic.is_comunic.strval1 = sle_provincia.Text
gu_comunic.is_comunic.strval2 = sle_departamento.Text
gu_comunic.is_comunic.strval3 = sle_municipio.Text 
gu_comunic.is_comunic.strval4 = sle_localidad.Text
gu_comunic.is_comunic.strval5 = sle_calle.Text 
gu_comunic.is_comunic.strval8 = ''
gu_comunic.is_comunic.strval9 = ''
//iu_gen_comunic.is_comunic.longval4 =  gu_comunic.is_comunic.longval4
gu_comunic.is_comunic.intval1  = gi_cod_provincia
gu_comunic.is_comunic.intval2  = gi_cod_departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad
gu_comunic.is_comunic.strval1  = gs_provincia
gu_comunic.is_comunic.strval2  = gs_departamento
gu_comunic.is_comunic.strval3  = gs_municipio
gu_comunic.is_comunic.strval4  = gs_localidad

OpenWithParm(w_id0100,iu_gen_comunic)
is_direccion = Message.PowerObjectParm
//iu_gen_comunic.is_comunic = gu_comunic.is_comunic 

//ii_cod_prov = iu_gen_comunic.is_comunic.intval1
//ii_cod_depto = iu_gen_comunic.is_comunic.intval2
//ii_cod_munic = iu_gen_comunic.is_comunic.intval3
//ii_cod_loc = iu_gen_comunic.is_comunic.intval4
//il_cod_calle = iu_gen_comunic.is_comunic.longval1

// Restablecemos cajas texto con los valores de Estruc. Global 
// "s_direccion_cliente" -->MATO

sle_provincia.Text = is_direccion.gs_prov
sle_departamento.Text = is_direccion.gs_depto
sle_municipio.Text = is_direccion.gs_munic
sle_localidad.Text = is_direccion.gs_local
sle_calle.Text = is_direccion.gs_calle
ii_cod_prov = is_direccion.gl_codprov
ii_cod_depto = is_direccion.gl_coddepto
il_cod_munic = is_direccion.gl_codmun
il_cod_loc = is_direccion.gl_codloc
il_cod_calle = is_direccion.gl_codcalle

//gs_provincia 		= dir.gs_prov
//gs_departamento 	= dir.gs_depto
//gs_municipio		= dir.gs_munic
//gs_localidad		= dir.gs_local

//sle_provincia.enabled = false
//sle_departamento.enabled = false
//sle_municipio.enabled = false
//sle_localidad.enabled = false
//sle_calle.enabled = false
//---------------------------->

IF il_cod_calle > 0 THEN
        IF NOT cbx_referencia.Checked THEN
                st_desde.Enabled  = True
                st_hasta.Enabled  = True
                sle_desde.Enabled = True
                sle_hasta.Enabled = True
                cb_buscar.Enabled = True
					 if gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
	                cb_agregar.Enabled = True
					end if
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

// Muestro las etiquetas
//Parent.TriggerEvent("ue_mostrar_campos")


end event

type ln_6 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 110
integer beginy = 564
integer endx = 3461
integer endy = 564
end type

type ln_2 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 114
integer beginy = 568
integer endx = 3465
integer endy = 568
end type

type ln_1 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 114
integer beginy = 28
integer endx = 3465
integer endy = 28
end type

type ln_4 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 3461
integer beginy = 28
integer endx = 3461
integer endy = 568
end type

type ln_5 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 110
integer beginy = 24
integer endx = 3461
integer endy = 24
end type

type ln_8 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 3456
integer beginy = 32
integer endx = 3456
integer endy = 564
end type

type ln_9 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2615
integer beginy = 248
integer endx = 3346
integer endy = 248
end type

type ln_11 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2615
integer beginy = 516
integer endx = 3346
integer endy = 516
end type

type ln_12 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2619
integer beginy = 512
integer endx = 3346
integer endy = 512
end type

type ln_13 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 3342
integer beginy = 252
integer endx = 3342
integer endy = 516
end type

type ln_14 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 3337
integer beginy = 248
integer endx = 3337
integer endy = 516
end type

type ln_10 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2606
integer beginy = 244
integer endx = 3346
integer endy = 244
end type

type ln_15 from line within w_3111_lista_mante_acometidas
long linecolor = 8421504
integer linethickness = 4
integer beginx = 2615
integer beginy = 252
integer endx = 2615
integer endy = 516
end type

type ln_16 from line within w_3111_lista_mante_acometidas
long linecolor = 16777215
integer linethickness = 4
integer beginx = 2610
integer beginy = 248
integer endx = 2610
integer endy = 516
end type

type st_8 from statictext within w_3111_lista_mante_acometidas
integer x = 2638
integer y = 220
integer width = 329
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Fincas"
alignment alignment = center!
end type

type d_lista_acometidas from u_ins_2015_pr_lista_acometidas within w_3111_lista_mante_acometidas
integer x = 114
integer y = 916
integer width = 3355
integer height = 720
integer taborder = 60
string dragicon = "EXPED.ICO"
boolean hscrollbar = true
boolean vscrollbar = true
string icon = "None!"
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;decimal{0} ldec_inst_padre

ii_fila_selec = row

IF ii_fila_selec > 0 THEN

        ii_fila_selec_ant = ii_fila_selec

        This.SelectRow(0,False)
        This.SelectRow(ii_fila_selec,True)
        This.SetRow(ii_fila_selec)

        cb_suministros.Enabled = True
		  if	  gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
        		cb_borrar.Enabled = True
			end if
        il_nro_aco = This.GetItemNumber(ii_fila_selec,"CODIGO")
        ldec_inst_padre = This.GetItemDecimal(ii_fila_selec,"INSTALACION_ORIGEN")
        is_nom_inst_padre_ant = This.GetItemString(ii_fila_selec,"instalacion_nom_instalacion")
        idec_nro_inst_padre_ant = ldec_inst_padre
        il_pot_contr = This.GetItemNumber(ii_fila_selec,"pot_contratada")
        il_cant_cli  = This.GetItemNumber(ii_fila_selec,"cant_cli")

        IF IsNull(il_cant_cli) THEN
                il_cant_cli = 0
        END IF

        IF ldec_inst_padre > 0 THEN
			  if	  gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
                cb_desasociar.Enabled = True
			  end if
        ELSE
                cb_desasociar.Enabled = False
        END IF

        gu_comunic.is_comunic.decval1 = ldec_inst_padre 

        // Si se entr$$HEX2$$f3002000$$ENDHEX$$con "Consulta" deshabilito el drageo.
        IF is_accion_llamada <> "Consulta" THEN

                // Si a$$HEX1$$fa00$$ENDHEX$$n no fue seleccionada una Instalaci$$HEX1$$f300$$ENDHEX$$n lo deshabilito.
                IF p_instalacion.Visible = True THEN
                        This.Drag(Begin!)
                END IF
        END IF
ELSE

        ii_fila_selec = ii_fila_selec_ant
END IF


end event

event doubleclicked;long ll_numero_puerta
string ls_dup

IF row > 0 AND gu_perfiles.of_acceso_perfil(gi_perfil,'ACO_DIR','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
	
	
	if gnu_u_transaction.uf_lock(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(il_nro_aco)) <> 0 then 
	 return
	end if
	
	SetPointer(HourGlass!)
   gu_comunic.is_comunic.intval1 = ii_cod_prov
   gu_comunic.is_comunic.intval2 = ii_cod_depto
   gu_comunic.is_comunic.longval4 = il_cod_munic
   gu_comunic.is_comunic.longval5 = il_cod_loc
   gu_comunic.is_comunic.longval3 = il_cod_calle
   gu_comunic.is_comunic.longval1 = il_nro_aco
   gu_comunic.is_comunic.strval1 = sle_provincia.Text
   gu_comunic.is_comunic.strval2 = sle_departamento.Text
   gu_comunic.is_comunic.strval3 = sle_municipio.Text
   gu_comunic.is_comunic.strval4 = sle_localidad.Text
	gu_comunic.is_comunic.strval5 = this.GetItemString(row, 'callejero_nom_calle')
   gu_comunic.is_comunic.accion_llamada = "Modificacion"
	gu_comunic.is_comunic.programa_llamante = "Modificacion Ubicacion"
	//OpenSheet(w_3211_form_mante_acometidas,w_3111_lista_mante_acometidas,4,Original!)
	Open(w_3211_form_mante_acometidas, w_3111_lista_mante_acometidas)

END IF
end event

type cbx_una_inst from checkbox within w_3111_lista_mante_acometidas
boolean visible = false
integer x = 2203
integer y = 640
integer width = 635
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Asociar Inst. "
end type

event clicked;int i, li_cant_filas, li_cant_cli_imp, li_fila
long ll_aco, ll_cant_cli
Decimal ll_pot_contr
decimal{0} ldec_inst
datetime ldt_f_actual
string ls_nom_inst_padre_ant

ldt_f_actual = fgnu_fecha_actual()

SetPointer(HourGlass!)

Parent.SetRedraw(False)

IF This.Checked THEN

 	// Asocio todas las acometidas seleccionadas a 
   // la instalaci$$HEX1$$f300$$ENDHEX$$n elegida.
   SetPointer(HourGlass!)

	// Aviso de que la operaci$$HEX1$$f300$$ENDHEX$$n a procesar puede ser costosa,
   // y pido confirmaci$$HEX1$$f300$$ENDHEX$$n.
   IF gnv_msg.f_mensaje("CM14","","",YesNo!) = 1 THEN
        
   	// Controlo la existencia de Incidencias.
      u_ins_2008_nu_datos_instalacion luo_2008_nu
      luo_2008_nu = CREATE u_ins_2008_nu_datos_instalacion
                                
		//li_cant_filas = d_lista_acometidas.RowCount()
		li_fila = d_lista_acometidas.GetRow()
      
      IF li_fila > 0 THEN
      	ldec_inst = d_lista_acometidas.GetItemDecimal(li_fila,"INSTALACION_ORIGEN")
      END IF
		
		ll_aco = d_lista_acometidas.GetItemNumber(li_fila,"CODIGO")
		
		if gnu_u_transaction.uf_lock(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco)) <> 0 then 
					DESTROY luo_2008_nu
               cb_buscar.PostEvent(clicked!)
               This.Checked = False
               Parent.SetRedraw(True)
               RETURN                
		end if

      IF ldec_inst <> 0 THEN
      	IF luo_2008_nu.fnu_v_inst_con_incidencia(ldec_inst) = -1 THEN
         	
            IF gnv_msg.f_mensaje("CM08",String(ll_aco),"",OK!) = 2 THEN
            	DESTROY luo_2008_nu
               cb_buscar.PostEvent(clicked!)
               This.Checked = False
               Parent.SetRedraw(True)
               RETURN                          
            END IF
         END IF
      END IF  

      ls_nom_inst_padre_ant = d_lista_acometidas.GetItemString(li_fila,"instalacion_nom_instalacion")

      // Realizo la operaci$$HEX1$$f300$$ENDHEX$$n si la nueva instalaci$$HEX1$$f300$$ENDHEX$$n es diferente 
      // a la anterior.
      IF IsNull(ls_nom_inst_padre_ant) OR ls_nom_inst_padre_ant <> st_nom_inst.Text THEN
                        
      	ll_pot_contr = d_lista_acometidas.GetItemNumber(li_fila,"pot_contratada")
         ll_cant_cli  = d_lista_acometidas.GetItemNumber(li_fila,"cant_cli")

         // Obtengo la cantidad de clientes importantes.
         li_cant_cli_imp = luo_2008_nu.fnu_v_sum_imp_aco(il_nro_aco)
                
         IF li_cant_cli_imp < 0 THEN
         	gnu_u_transaction.uf_rollback(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco));
            DESTROY luo_2008_nu
            This.Checked = False
            Parent.SetRedraw(True)
            RETURN 
         END IF
                
         // Actualizo la informaci$$HEX1$$f300$$ENDHEX$$n de la red,
         // para aquellas instalaciones que fueron afectadas.
         IF luo_2008_nu.fnu_actualizar_red_aco(ldec_inst,idec_nro_instal,ll_pot_contr,ll_cant_cli,li_cant_cli_imp) = -1 THEN
         	gnu_u_transaction.uf_rollback(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco));
            DESTROY luo_2008_nu
            This.Checked = False
            Parent.SetRedraw(True)
         	RETURN
			END IF
                        
      	// Actualizo la Acometida
                                  
			d_lista_acometidas.SetItem(li_fila,"INSTALACION_ORIGEN",idec_nro_instal)        
      	d_lista_acometidas.SetItem(li_fila,"instalacion_nom_instalacion",st_nom_inst.Text)      
			//AHM (20/07/2009) Problemas al alimentar una acometida
			//AHM (25/08/2009) Incidencia 0/100115411
      	d_lista_acometidas.SetItem(li_fila,"f_actual",ldt_f_actual)
      	d_lista_acometidas.SetItem(li_fila,"programa",'w_3111')
      	d_lista_acometidas.SetItem(li_fila,"usuario",gs_usuario)
			//AHM(03/03/2010)
 		   d_lista_acometidas.SetItem(ii_fila_selec,"SGD_ACOMETIDA_INSTALACION_ORIGEN_V10", "15:" + string(idec_nro_instal))        
		   d_lista_acometidas.SetItem(ii_fila_selec,"SGD_ACOMETIDA_ONIS_STAT", '0') 
			
		END IF          

   	d_lista_acometidas.Update()
      gnu_u_transaction.uf_commit(parent, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_aco));

   	DESTROY luo_2008_nu
        
   	This.Checked = False

   	IF ii_fila_selec > 0 THEN
   		cb_desasociar.Enabled = True
   	END IF
   	st_nom_inst.Visible = FALSE
   	p_instalacion.Visible = FALSE
   	cbx_una_inst.Visible = FALSE
   	cbx_todas.Visible = FALSE
   	cb_buscar.TriggerEvent(Clicked!)
	END IF
END IF

This.Checked = False

Parent.SetRedraw(True)


end event

type cb_imprimir from commandbutton within w_3111_lista_mante_acometidas
integer x = 3054
integer y = 1760
integer width = 416
integer height = 96
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;w_3111_lista_mante_acometidas.triggerevent ("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_3111_lista_mante_acometidas
boolean visible = false
integer x = 146
integer y = 1056
integer width = 494
integer height = 360
integer taborder = 140
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


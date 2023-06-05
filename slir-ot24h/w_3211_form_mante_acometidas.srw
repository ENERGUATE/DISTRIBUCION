HA$PBExportHeader$w_3211_form_mante_acometidas.srw
forward
global type w_3211_form_mante_acometidas from w_sgigenerica
end type
type sle_esq_cond from singlelineedit within w_3211_form_mante_acometidas
end type
type sle_telefono from singlelineedit within w_3211_form_mante_acometidas
end type
type st_1 from statictext within w_3211_form_mante_acometidas
end type
type st_2 from statictext within w_3211_form_mante_acometidas
end type
type cb_cancelar from u_cb within w_3211_form_mante_acometidas
end type
type cb_aceptar from u_cb within w_3211_form_mante_acometidas
end type
type d_form_acometidas from u_ins_2017_pr_form_mante_acometidas within w_3211_form_mante_acometidas
end type
type st_dir from statictext within w_3211_form_mante_acometidas
end type
type d_direccion from u_dir_2001_pr_direccion_std within w_3211_form_mante_acometidas
end type
type st_dir2 from statictext within w_3211_form_mante_acometidas
end type
end forward

global type w_3211_form_mante_acometidas from w_sgigenerica
integer x = 640
integer y = 564
integer width = 2903
integer height = 1296
string title = "OPEN SGI - Formulario de Mantenimiento de Acometidas"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_buscar pbm_custom40
event ue_nuevo pbm_custom42
event ue_proc_sum pbm_custom43
sle_esq_cond sle_esq_cond
sle_telefono sle_telefono
st_1 st_1
st_2 st_2
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
d_form_acometidas d_form_acometidas
st_dir st_dir
d_direccion d_direccion
st_dir2 st_dir2
end type
global w_3211_form_mante_acometidas w_3211_form_mante_acometidas

type variables
u_dir_2001_nu_direccion_std             iu_dir_2001_nu
//u_dir_2001_rn_direccion_std           iu_dir_2001_rn
u_generico_comunicaciones               iu_gen_comunic
u_ins_2017_nu_form_mante_acometidas iu_ins_2017_nu
//u_ins_2017_rn_form_mante_acometidas iu_ins_2017_rn

s_direccion_cliente                     is_direccion

long    il_ord_servicio, il_nro_incid, il_ex_avi_pendiente

string  is_prov, is_depto, is_munic, is_local

int ii_fila_ant
string is_clausula_where
string is_modificacion
string is_select_original

string retorno, is_modstring, is_columna
//u_avi_2004_nu_form_inf_resumen lu_avi_2004_nu
int il_trajo_datos
boolean ib_valido
end variables

forward prototypes
public function integer fw_obtengo_centros (ref long pl_zona, ref long pl_cmd, ref long pl_sector, long pl_localidad)
end prototypes

on ue_buscar;call w_sgigenerica::ue_buscar;int li_v_doc

SetPointer(HourGlass!)

IF  (Len(string(is_direccion.gl_nis)) = 7) THEN

        This.TriggerEvent("ue_proc_sum")
END IF
end on

on ue_nuevo;call w_sgigenerica::ue_nuevo;s_direccion_cliente ls_direccion

SetRedraw(False)

// Limpio los campos

d_direccion.fpr_limpiar_campos()
d_direccion.accepttext()

// Habilito los campos de los user-object que utilizo

d_direccion.fpr_habilitar_campos(False,True)

// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
st_dir.Show()

// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

SetRedraw(True)

end on

on ue_proc_sum;call w_sgigenerica::ue_proc_sum;int li_imp, li_pend, li_posib

SetPointer(HourGlass!)

// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de la ventana

d_direccion.fpr_llenar_campos(is_direccion)
IF NOT IsNull(is_direccion.gs_esq_cond) THEN
        fpr_llenar_campo_sle(sle_esq_cond,string(is_direccion.gs_esq_cond))
END IF
fpr_llenar_campo_sle(sle_telefono,is_direccion.gs_telefono)

// Deshabilito campos de user-object Nis_Rad,direcci$$HEX1$$f300$$ENDHEX$$n y cliente
d_direccion.fpr_habilitar_campos(False,False)

st_dir.Hide()

end on

public function integer fw_obtengo_centros (ref long pl_zona, ref long pl_cmd, ref long pl_sector, long pl_localidad);// Obtiene la zona, cmd, sector de la localidad para grabar en la acometida

long ll_zona, ll_cmd, ll_sector


  SELECT nvl("GI_CENTRO_LOC"."NRO_CENTRO", 0),
         nvl("GI_CENTRO_LOC"."NRO_CMD",   0),
        	nvl( "GI_CENTRO_LOC"."NRO_PUESTO", 0)  
    INTO :ll_zona,   
         :ll_cmd,  
         :ll_sector
    FROM "GI_CENTRO_LOC"  
   WHERE "GI_CENTRO_LOC"."COD_LOC" = :pl_localidad ;

if sqlca.sqlcode<>0 or ll_zona = 0 or ll_cmd = 0 or ll_sector = 0 then 
	// No se puede seguir con el alta de la acometida
//	messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "C$$HEX1$$f300$$ENDHEX$$digo de error " + string(sqlca.sqlcode) + ", " + sqlca.sqlerrtext + " zona: " + &
//					string(ll_zona) + " cmd: " + string(ll_cmd) + " sector: " + string(ll_sector) + &
//					" localidad: " + string(pl_localidad));
	return 0 
else
	pl_zona = ll_zona
	pl_cmd  = ll_cmd
	pl_sector = ll_sector
	return 1
	
end if
end function

on close;call w_sgigenerica::close;iu_gen_comunic.is_comunic.programa_retorno = "w_3211"

gu_comunic.is_comunic = iu_gen_comunic.is_comunic

// Destruyo los objetos creados en la ventana
DESTROY iu_dir_2001_nu
//DESTROY iu_dir_2001_rn

DESTROY iu_gen_comunic  
DESTROY iu_ins_2017_nu
//DESTROY iu_ins_2017_rn

end on

event open;call super::open;long ll_ultima_acometida
datawindowchild ddw_fase
long ll_row

// Cargo el objeto de comunicaciones para tener acceso 
// a la estructura
// iu_gen_comunic  --> para cargar la estructura local 

iu_gen_comunic = CREATE u_generico_comunicaciones
iu_gen_comunic.is_comunic = gu_comunic.is_comunic

// El puntero del mouse toma la forma del reloj de arena
SetPointer(HourGlass!)

// Creo los objetos con los que trabajar$$HEX2$$e1002000$$ENDHEX$$esta ventana, y no pertenecen 
// a la misma (no fueron creados en el painter).
iu_dir_2001_nu  = CREATE u_dir_2001_nu_direccion_std
//iu_dir_2001_rn        = CREATE u_dir_2001_rn_direccion_std
iu_ins_2017_nu = CREATE u_ins_2017_nu_form_mante_acometidas
//iu_ins_2017_rn = CREATE u_ins_2017_rn_form_mante_acometidas

d_direccion.SetTransObject(sqlca)
d_form_acometidas.SetTransObject(sqlca)

ib_valido = True

// Obtener los atributos para abrir la ventana
This.Title = iu_gen_comunic.f_titulo_ventana("iw_3211","form_aco")

//AHM(22/08/2008) Incidencia 0/592603

//is_prov  = dir.gs_prov
//is_depto = dir.gs_depto
//is_munic = dir.gs_munic
//is_local = dir.gs_local


IF gu_comunic.is_comunic.programa_llamante = "Modificacion Ubicacion" THEN
	is_prov		= gu_comunic.is_comunic.strval1
   is_depto		= gu_comunic.is_comunic.strval2
   is_munic		= gu_comunic.is_comunic.strval3
   is_local		= gu_comunic.is_comunic.strval4
ELSE
	is_prov		= gs_provincia
	is_depto		= gs_departamento
	is_munic		= gs_municipio
	is_local		= gs_localidad
END IF

is_direccion.gl_nif = 0

SetRedraw(False)

// Inserto un registro en los user-object de trabajo
ll_row = d_direccion.f_insertar_fila()

// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n geografica
d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

// Habilito/deshabilito los campos de los user-object que utilizo
d_direccion.fpr_habilitar_campos(False,False)


 
if gb_tipos_de_via then
	//**************************************************
	//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 12/06/2002  **
	//**************************************************
	fg_datos_tipo_calle(d_direccion, iu_gen_comunic.is_comunic.longval3, 0)
	//**************************************************
	//**  AMR PM_U003 MOSTRAR TIPOS DE VIAS 12/06/2002  **
	//**************************************************
end if


CHOOSE CASE iu_gen_comunic.is_comunic.accion_llamada
        CASE "Alta"

//              // Habilito/deshabilito los campos de los user-object que utilizo
//              d_direccion.fpr_habilitar_campos(True,True)

                //      Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
                st_dir.Show()
                
               
					 
					  this.d_form_acometidas.getchild('tipo_conexion',ddw_fase)
					  ddw_fase.settransobject(sqlca)
					  ddw_fase.retrieve()
					  
					 ll_row = d_form_acometidas.InsertRow(0)  
                ll_ultima_acometida = iu_ins_2017_nu.fnu_ultima_acometida()
                d_form_acometidas.SetItem(1,"CODIGO",ll_ultima_acometida)
                d_form_acometidas.fpr_habilito(True,"negro")

                
        CASE "Modificacion"

//              // Habilito/deshabilito los campos de los user-object que utilizo
            //  d_direccion.fpr_habilitar_campos(True,True)

                //      Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
                st_dir.Show()

                
                iu_dir_2001_nu.fnu_datos_por_acom(d_direccion,iu_gen_comunic.is_comunic.longval1)
					 d_direccion.SetItem(1,"calle",iu_gen_comunic.is_comunic.strval5)
                iu_ins_2017_nu.fnu_traer_datos(d_form_acometidas,iu_gen_comunic.is_comunic.longval1)
					 IF d_form_acometidas.RowCount() > 0 THEN
						 iu_gen_comunic.is_comunic.intval1 = d_form_acometidas.GetItemNumber(1,"cod_prov")
						 iu_gen_comunic.is_comunic.intval2 = d_form_acometidas.GetItemNumber(1,"cod_depto")
						 iu_gen_comunic.is_comunic.longval4 = d_form_acometidas.GetItemNumber(1,"cod_munic")
						 iu_gen_comunic.is_comunic.longval5 = d_form_acometidas.GetItemNumber(1,"cod_loc")
						 is_direccion.gl_codcalle = d_form_acometidas.GetItemNumber(1,"cod_calle")
						 is_direccion.gl_nif = d_form_acometidas.GetItemNumber(1,"nif")
					 END IF
             	 d_form_acometidas.fpr_habilito(True,"azul")
            	 d_direccion.accepttext()
					 cb_aceptar.enabled = true
             
        CASE "Consulta"

//              // Habilito/deshabilito los campos de los user-object que utilizo
//              d_direccion.fpr_habilitar_campos(False,False)

                iu_ins_2017_nu.fnu_traer_datos(d_form_acometidas,iu_gen_comunic.is_comunic.longval1)
                d_form_acometidas.fpr_habilito(False,"azul")

                cb_aceptar.enabled = False
END CHOOSE

SetRedraw(True)

end event

on w_3211_form_mante_acometidas.create
int iCurrent
call super::create
this.sle_esq_cond=create sle_esq_cond
this.sle_telefono=create sle_telefono
this.st_1=create st_1
this.st_2=create st_2
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.d_form_acometidas=create d_form_acometidas
this.st_dir=create st_dir
this.d_direccion=create d_direccion
this.st_dir2=create st_dir2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_esq_cond
this.Control[iCurrent+2]=this.sle_telefono
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.cb_cancelar
this.Control[iCurrent+6]=this.cb_aceptar
this.Control[iCurrent+7]=this.d_form_acometidas
this.Control[iCurrent+8]=this.st_dir
this.Control[iCurrent+9]=this.d_direccion
this.Control[iCurrent+10]=this.st_dir2
end on

on w_3211_form_mante_acometidas.destroy
call super::destroy
destroy(this.sle_esq_cond)
destroy(this.sle_telefono)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.d_form_acometidas)
destroy(this.st_dir)
destroy(this.d_direccion)
destroy(this.st_dir2)
end on

event closequery;long ll_nro_acometida

ll_nro_acometida = d_form_acometidas.getitemnumber(1, "codigo")

gnu_u_transaction.uf_rollback(w_3111_lista_mante_acometidas, "SGD_ACOMETIDA", "BDI_JOB = 0 AND CODIGO = " + string(ll_nro_acometida));

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3211_form_mante_acometidas
end type

type sle_esq_cond from singlelineedit within w_3211_form_mante_acometidas
boolean visible = false
integer x = 649
integer y = 468
integer width = 1490
integer height = 84
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type sle_telefono from singlelineedit within w_3211_form_mante_acometidas
boolean visible = false
integer x = 457
integer y = 884
integer width = 416
integer height = 84
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_3211_form_mante_acometidas
boolean visible = false
integer x = 41
integer y = 484
integer width = 608
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Esquina/Condominio"
boolean focusrectangle = false
end type

type st_2 from statictext within w_3211_form_mante_acometidas
boolean visible = false
integer x = 23
integer y = 892
integer width = 434
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "N$$HEX2$$ba002000$$ENDHEX$$de Tel$$HEX1$$e900$$ENDHEX$$fono"
alignment alignment = center!
boolean focusrectangle = false
end type

type cb_cancelar from u_cb within w_3211_form_mante_acometidas
integer x = 1829
integer y = 1024
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Cancelar"
boolean default = true
end type

event clicked;call super::clicked;long ll_nro_acometida
iu_gen_comunic.is_comunic.accion_retorno = "No Actualizo"


Close(Parent)
end event

type cb_aceptar from u_cb within w_3211_form_mante_acometidas
integer x = 549
integer y = 1024
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Aceptar"
end type

event clicked;long ll_salida, ll_zona, ll_cmd, ll_sector, ll_nro_acometida,Ll_CLASSID
int LI_VALOR

datetime ldt_f_nula
SetNull(ldt_f_nula)

IF ib_valido=false THEN
        ib_valido = True
        d_form_acometidas.SetFocus()
        RETURN
END IF

// FDO Incidencia 0/426103

// Se comprueba si est$$HEX2$$e1002000$$ENDHEX$$BDI

SELECT VALOR 
INTO :LI_VALOR
FROM SGD_PARAMETROS
WHERE COD_PARAMETRO = 3;

// Se intenta recuperar el CLASS ID de las ACOMETIDAS

IF LI_VALOR = 1 THEN 
	SELECT CLASS_ID 
	INTO :Ll_CLASSID
	FROM SGD_ENTIDADES
	WHERE TABLA_ALFA LIKE 'sgd_acometida';
END IF

if isnull(ll_classid) then ll_classid = 0

CHOOSE CASE iu_gen_comunic.is_comunic.accion_llamada
        
        CASE "Alta"
                d_form_acometidas.SetItem(1,"usuario",gs_usuario)
                d_form_acometidas.SetItem(1,"f_actual",fgnu_fecha_actual())
//              d_form_acometidas.SetItem(1,"h_actual",fgnu_fecha_actual())
                d_form_acometidas.SetItem(1,"programa",gs_programa_principal)
                d_form_acometidas.SetItem(1,"cod_prov",iu_gen_comunic.is_comunic.intval1)
                d_form_acometidas.SetItem(1,"cod_depto",iu_gen_comunic.is_comunic.intval2)
                d_form_acometidas.SetItem(1,"cod_munic",iu_gen_comunic.is_comunic.longval4)
                d_form_acometidas.SetItem(1,"cod_loc",iu_gen_comunic.is_comunic.longval5)
                d_form_acometidas.SetItem(1,"cod_calle",is_direccion.gl_codcalle)
                d_form_acometidas.SetItem(1,"num_puerta",is_direccion.gl_numero)
                d_form_acometidas.SetItem(1,"duplicador",is_direccion.gs_duplic)
                d_form_acometidas.SetItem(1,"nif",is_direccion.gl_nif)
                d_form_acometidas.SetItem(1,"pot_contratada",0)
                d_form_acometidas.SetItem(1,"kwh",0)
//              d_form_acometidas.SetItem(1,"tip_reg",0)
                d_form_acometidas.SetItem(1,"cant_cli",0)
                d_form_acometidas.SetItem(1,"kwh_fact",0)
                d_form_acometidas.SetItem(1,"INSTALACION_ORIGEN",0)
                d_form_acometidas.SetItem(1,"nro_centro",0)
                d_form_acometidas.SetItem(1,"nro_cmd",0)
                d_form_acometidas.SetItem(1,"nro_mesa",0)
                d_form_acometidas.SetItem(1,"cant_clientes_imp",0)
                d_form_acometidas.SetItem(1,"propiedad"," ")
                d_form_acometidas.SetItem(1,"potencia_max",0)
                d_form_acometidas.SetItem(1,"esta_en",0)
                d_form_acometidas.SetItem(1,"tip_proteccion","p")
                d_form_acometidas.SetItem(1,"tip_acometida","p")
                d_form_acometidas.SetItem(1,"ref_dir","p")
                d_form_acometidas.SetItem(1,"bdi_job",0)
                d_form_acometidas.SetItem(1,"statflg",0)                
					 d_form_acometidas.SetItem(1,"class_id",Ll_CLASSID)
					 //AHU Error al insertar una acometida nueva
					 d_form_acometidas.SetItem(1,"onis_ver","0")
					 d_form_acometidas.SetItem(1,"onis_stat","0")

CASE "Modificacion"
					 d_form_acometidas.SetItem(1,"cod_prov",iu_gen_comunic.is_comunic.intval1)
                d_form_acometidas.SetItem(1,"cod_depto",iu_gen_comunic.is_comunic.intval2)
                d_form_acometidas.SetItem(1,"cod_munic",iu_gen_comunic.is_comunic.longval4)
                d_form_acometidas.SetItem(1,"cod_loc",iu_gen_comunic.is_comunic.longval5)
                d_form_acometidas.SetItem(1,"cod_calle",is_direccion.gl_codcalle)
                d_form_acometidas.SetItem(1,"num_puerta",Integer(d_direccion.GetItemString(1,"numero")))
                d_form_acometidas.SetItem(1,"duplicador",d_direccion.GetItemString(1,"duplic"))
                d_form_acometidas.SetItem(1,"nif",is_direccion.gl_nif)

END CHOOSE

// obtenemos el centro, cmd y sector de la localidad

if fw_obtengo_centros(ll_zona, ll_cmd, ll_sector, iu_gen_comunic.is_comunic.longval5) = 0  then  // No se obtuvo la zona, centro, cmd.
   messageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "C$$HEX1$$f300$$ENDHEX$$digo de error " + string(sqlca.sqlcode) + ", " + sqlca.sqlerrtext + " zona: " + &
					string(ll_zona) + " cmd: " + string(ll_cmd) + " sector: " + string(ll_sector) + &
					" localidad: " + string(iu_gen_comunic.is_comunic.longval5));
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se pudo obtener los centros asociados a la localidad",Information!)
	return 	
end if

 d_form_acometidas.SetItem(1,"nro_centro",ll_zona)
 d_form_acometidas.SetItem(1,"nro_cmd",ll_cmd)
 d_form_acometidas.SetItem(1,"nro_mesa",ll_sector)



d_form_acometidas.AcceptText()




ll_nro_acometida = d_form_acometidas.getitemnumber(1, "codigo")

ll_salida = d_form_acometidas.Update()

IF ll_salida = -1 THEN
		 gnv_msg.f_mensaje("EG21",string(sqlca.sqlcode)+"  "+sqlca.sqlerrtext,"",ok!)
       // gnv_msg.f_mensaje("EM39","","",OK!)
		 gnu_u_transaction.uf_rollback();
       RETURN 
END IF

iu_gen_comunic.is_comunic.accion_retorno = "Actualizo"



gnu_u_transaction.uf_commit();

Close(Parent)

//cb_sel_inst.Enabled = TRUE
end event

type d_form_acometidas from u_ins_2017_pr_form_mante_acometidas within w_3211_form_mante_acometidas
event ue_post_itemchanged pbm_custom25
integer x = 18
integer y = 632
integer width = 2848
integer height = 320
integer taborder = 30
end type

on ue_post_itemchanged;call u_ins_2017_pr_form_mante_acometidas::ue_post_itemchanged;This.SetColumn(is_columna)
end on

event itemerror;string ls_titulo, a
is_columna=this.getcolumnname()
integer li_columna

li_columna=integer(this.gettext())

IF is_columna = "kwh" THEN
//      is_modString="Se debe ingresar una Potencia v$$HEX1$$e100$$ENDHEX$$lida"
ELSEIF is_columna = "pot_contratada" THEN
//      is_modstring = "Se debe ingresar una Potencia Contratada v$$HEX1$$e100$$ENDHEX$$lida"
ELSEIF is_columna = "kwh_fact" THEN
//      is_modstring = "Se debe ingresar una Potencia Facturada v$$HEX1$$e100$$ENDHEX$$lida"
ELSEIF is_columna = "cant_cli" THEN
//      is_modstring = "Se debe ingresar un Cantidad de Clientes v$$HEX1$$e100$$ENDHEX$$lida"

END IF

messagebox('debug', 'li_columna: ' + string(li_columna) + ' columna: ' + is_columna )


if li_columna=0 then
        ls_titulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
        a=This.Modify(ls_titulo)
        is_modstring=is_columna+".ValidationMsg='"+is_modstring+"'"
        a=This.Modify(is_modstring)
end if
ib_valido=false
This.SetFocus()

end event

event itemchanged;call super::itemchanged;long ll_anterior

is_columna = This.GetColumnName()

ib_valido=true  //prendo bandera de validacion en true

IF is_columna <> "descripcion" THEN
		//AHU (02/04/2009) Campo onis_red
		ll_anterior = long(data)
/*        ll_anterior = This.GetItemNumber(1,is_columna)*/
//      is_modstring = iu_ins_2017_rn.frn_validar(d_form_acometidas,is_columna,1)
//
//      IF is_modstring <> "" THEN
//              messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",is_modstring)
//              This.SetItem(1,is_columna,ll_anterior)
//              This.SetActionCode(2)
//              This.postevent("ue_post_itemchanged")
////            ib_valido = False
//      //      This.SetFocus()
//      END IF
END IF
end event

event dberror;call super::dberror;//////////////////////////////////////////////////////////////////////
//
//      Evento:         DBerror
//
//      Objetivo:       Si hubo error al grabar la datawindow, se despliega un 
//                                      mensaje al usuario indicando en que tabla fue.
//                                      La tabla se setea a trav$$HEX1$$e900$$ENDHEX$$s de la funci$$HEX1$$f300$$ENDHEX$$n f_tabla_error(nro)
//
//      Hist$$HEX1$$f300$$ENDHEX$$rico de Cambios:
//
//                              Actualizaci$$HEX1$$f300$$ENDHEX$$n                   Fecha                           Responsable
//                              -------------                   --------                        -----------
//                              Creaci$$HEX1$$f300$$ENDHEX$$n                                        28/9/95                         EGF
//
//////////////////////////////////////////////////////////////////////

SQLCA.SQLCode = -1 
SQLCA.SQLDbCode = sqldbcode
SQLCA.SQLErrText = sqlerrtext
//gnv_msg.f_error(ii_tabla)

RETURN 1
end event

type st_dir from statictext within w_3211_form_mante_acometidas
integer x = 32
integer y = 412
integer width = 334
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
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)

// Limpio la estructura
//Actualizacion a PB6
//SetNull(is_direccion.)

SetNull(is_direccion.gs_prov)
SetNull(is_direccion.gs_depto)
SetNull(is_direccion.gs_munic)
SetNull(is_direccion.gs_local)
SetNull(is_direccion.gs_calle)
SetNull(is_direccion.gl_numero)
SetNull(is_direccion.gs_duplic)
SetNull(is_direccion.gs_pisodpto)
SetNull(is_direccion.gl_codcalle)
SetNull(is_direccion.gl_codloc)
SetNull(is_direccion.gl_codmun)
SetNull(is_direccion.gl_codprov)
SetNull(is_direccion.gl_coddepto)
SetNull(is_direccion.gl_nis)
SetNull(is_direccion.gl_nif)
SetNull(is_direccion.gs_esq_cond)
SetNull(is_direccion.gs_ape1)
SetNull(is_direccion.gs_ape2)
SetNull(is_direccion.gs_nom)
SetNull(is_direccion.gs_doc)
SetNull(is_direccion.gs_tipo_doc)
SetNull(is_direccion.gs_pais)
SetNull(is_direccion.gs_telefono)
SetNull(is_direccion.gs_co_pais)
SetNull(is_direccion.gl_cod_cli)
SetNull(is_direccion.gs_ref)

//iu_gen_comunic.is_comunic.strval10 = "Nif"
//iu_gen_comunic.is_comunic.intval1 = gi_cod_provincia
//iu_gen_comunic.is_comunic.intval2 = gi_cod_departamento
//iu_gen_comunic.is_comunic.longval4 = gl_cod_municipio
//iu_gen_comunic.is_comunic.longval5 = gl_cod_localidad
////iu_gen_comunic.is_comunic.strval1 = gs_provincia
////iu_gen_comunic.is_comunic.strval2 = gs_departamento
////iu_gen_comunic.is_comunic.strval3 = gs_municipio
////iu_gen_comunic.is_comunic.strval4 = gs_localidad
////
//iu_gen_comunic.is_comunic.strval1 = d_direccion.object.provincia[1]
//iu_gen_comunic.is_comunic.strval2 = d_direccion.object.depto[1]
//iu_gen_comunic.is_comunic.strval3 = d_direccion.object.municipio[1]
//iu_gen_comunic.is_comunic.strval4 = d_direccion.object.localidad[1]
//
//
//gu_comunic.is_comunic.strval10 = "Nif"
//gu_comunic.is_comunic.intval1 = gi_cod_provincia
//gu_comunic.is_comunic.intval2 = gi_cod_departamento
//gu_comunic.is_comunic.longval4 = gl_cod_municipio
//gu_comunic.is_comunic.longval5 = gl_cod_localidad
////gu_comunic.is_comunic.strval1 = gs_provincia
////gu_comunic.is_comunic.strval2 = gs_departamento
////gu_comunic.is_comunic.strval3 = gs_municipio
////gu_comunic.is_comunic.strval4 = gs_localidad
////
//
//gu_comunic.is_comunic.strval1 = d_direccion.object.provincia[1]
//gu_comunic.is_comunic.strval2 = d_direccion.object.depto[1]
//gu_comunic.is_comunic.strval3 = d_direccion.object.municipio[1]
//gu_comunic.is_comunic.strval4 = d_direccion.object.localidad[1]
//
//gu_comunic.is_comunic.programa_llamante = "w_3211"
//iu_gen_comunic.is_comunic.longval4 = parnum4
//iu_gen_comunic.is_comunic.longval5 = parnum5
//iu_gen_comunic.is_comunic.intval1  = parnum2 
//iu_gen_comunic.is_comunic.intval2  = parnum3	
//
//gu_comunic.is_comunic.longval4 = parnum4
//gu_comunic.is_comunic.longval5 = parnum5
//gu_comunic.is_comunic.intval1	 =	parnum2 
//gu_comunic.is_comunic.intval2  = parnum3	
//
//iu_gen_comunic.is_comunic.programa_llamante = "w_3211"
//
//parmstr6 = "" //MATO
//// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
//
//






// Acepto los datos ingresados
d_direccion.AcceptText() 

// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n ingresada, carg$$HEX1$$e100$$ENDHEX$$ndola en la est. de comunic.
d_direccion.fpr_c_datos(iu_gen_comunic,sle_esq_cond)

// Cargo en la est. el valor que corresponde para llamar a la ventana
// de ident. geogr$$HEX1$$e100$$ENDHEX$$fica.
gu_comunic.is_comunic.strval10 = "Nif"

// Seteo la var. que le indica a la Id. Geo. si busco por 
// 'Calle' o 'Referencia'.
//IF ib_calle THEN
//	iu_gen_comunic.is_comunic.strval9 = "Calle"
//ELSE
//	iu_gen_comunic.is_comunic.strval9 = "Referencia"
//END IF
//

// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
parmstr6 = d_direccion.GetItemString(1,"calle")
parmstr7 = d_direccion.GetItemString(1,"numero")
parmstr8 = d_direccion.GetItemString(1,"duplic")
parmstr9 = d_direccion.GetItemString(1,"cgv")
//
//if d_clase_avi.GetItemNumber(1,1) = fgci_clase_avi_normal OR &
//   d_clase_avi.GetItemNumber(1,1) = fgci_clase_avi_calidad then
//	gu_comunic.is_comunic.intval7 = 0
//else
//	gu_comunic.is_comunic.intval7 = 1
//end if	
//

gu_comunic.is_comunic.intval1  = gi_cod_provincia
gu_comunic.is_comunic.intval2  = gi_cod_departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad
gu_comunic.is_comunic.strval1  = gs_provincia
gu_comunic.is_comunic.strval2  = gs_departamento
gu_comunic.is_comunic.strval3  = gs_municipio
gu_comunic.is_comunic.strval4  = gs_localidad



//gu_comunic.is_comunic.intval1 = iu_gen_comunic.is_comunic.intval1 
//gu_comunic.is_comunic.intval2 = iu_gen_comunic.is_comunic.intval2  // Cod. Depto.
//gu_comunic.is_comunic.longval4 = iu_gen_comunic.is_comunic.longval4		// Cod. Munic.
//gu_comunic.is_comunic.longval5 = iu_gen_comunic.is_comunic.longval5	// Cod. Loc.
//
parnum2 = iu_gen_comunic.is_comunic.intval1
parnum3 = iu_gen_comunic.is_comunic.intval2
parnum4 = iu_gen_comunic.is_comunic.longval4
parnum5 = iu_gen_comunic.is_comunic.longval5




parnum2 = gu_comunic.is_comunic.intval1
parnum3 = gu_comunic.is_comunic.intval2
parnum4 = gu_comunic.is_comunic.longval4
parnum5 = gu_comunic.is_comunic.longval5













gu_comunic.is_comunic.programa_llamante='w_3211'


Openwithparm(w_id0100,iu_gen_comunic)
//Parent.TriggerEvent("Activate")

d_form_acometidas.setfocus()
// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
// geogr$$HEX1$$e100$$ENDHEX$$fica (estructura "s_direcci$$HEX1$$f300$$ENDHEX$$n")
is_direccion = Message.PowerObjectParm

IF is_direccion.gl_nif > 0 THEN	
	
	iu_gen_comunic.is_comunic.intval1 = is_direccion.gl_codprov
	iu_gen_comunic.is_comunic.intval2 = is_direccion.gl_coddepto
	iu_gen_comunic.is_comunic.longval4 = is_direccion.gl_codmun
	iu_gen_comunic.is_comunic.longval5 = is_direccion.gl_codloc
	iu_gen_comunic.is_comunic.longval3 = is_direccion.gl_codcalle
	iu_gen_comunic.is_comunic.strval1 = is_direccion.gs_prov
	iu_gen_comunic.is_comunic.strval2 = is_direccion.gs_depto
	iu_gen_comunic.is_comunic.strval3 = is_direccion.gs_munic
	iu_gen_comunic.is_comunic.strval4 = is_direccion.gs_local
	iu_gen_comunic.is_comunic.strval5 = is_direccion.gs_calle		
   d_direccion.fpr_llenar_campos(is_direccion)

	//  Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
   st_dir2.Show()
   cb_aceptar.enabled = True
END IF
// Lo siguiente se hace para que la ventana no pierda el foco de la aplicaci$$HEX1$$f300$$ENDHEX$$n.
// El problema est$$HEX2$$e1002000$$ENDHEX$$en que si la ventana que se ha abierto desde aqu$$HEX1$$ed00$$ENDHEX$$, w_id0100,
// si muestra un messagebox, las ventanas abiertas de tipo response pierden el foco
// si se hace click con el rat$$HEX1$$f300$$ENDHEX$$n fuera de ellas
W_operaciones.SetFocus()
Parent.SetFocus()


end event

type d_direccion from u_dir_2001_pr_direccion_std within w_3211_form_mante_acometidas
integer x = 18
integer y = 92
integer width = 2848
integer height = 532
integer taborder = 50
end type

event constructor;call super::constructor;//***************************************
//**  OSGI 2001.1  	14/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fg_ventana_parametro(Parent.ClassName(), d_direccion)
//***************************************
//**  OSGI 2001.1  	14/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type st_dir2 from statictext within w_3211_form_mante_acometidas
integer x = 41
integer y = 400
integer width = 274
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type


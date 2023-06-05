HA$PBExportHeader$w_3210_lista_suministros_imp.srw
forward
global type w_3210_lista_suministros_imp from w_sgigenerica
end type
type dw_lista_sum_imp from u_man_2037_pr_lista_sum_imp2 within w_3210_lista_suministros_imp
end type
type cb_1 from commandbutton within w_3210_lista_suministros_imp
end type
type dw_1 from datawindow within w_3210_lista_suministros_imp
end type
end forward

global type w_3210_lista_suministros_imp from w_sgigenerica
integer x = 407
integer y = 688
integer width = 2848
integer height = 1176
string title = "OPEN SGI - Lista de Suministros Importantes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_retrieve pbm_custom21
dw_lista_sum_imp dw_lista_sum_imp
cb_1 cb_1
dw_1 dw_1
end type
global w_3210_lista_suministros_imp w_3210_lista_suministros_imp

type variables
u_generico_comunicaciones		lu_comunic
u_man_2036_nu_sum_imp                   iu_man_2036_nu
u_man_2036_rn_sum_imp                    iu_man_2036_rn

s_direccion_cliente			is_direccion

string	is_prov, is_depto, is_munic, is_local
long il_provincia, il_departamento, il_municipio, il_localidad

int ii_fila_ant
string is_clausula_where
string is_modificacion
string is_select_original
string retorno
int il_trajo_datos, ii_fila_seleccionada

end variables

forward prototypes
public function integer fnu_obtener_direccion ()
end prototypes

public function integer fnu_obtener_direccion ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_direccion
// 
// Objetivo: Obtengo datos centros y departamentos.
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada:  --
//		Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	23/1/96		AFS			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

  SELECT "CENTRO"."COD_PROV",   
         "CENTRO"."COD_DEPTO",   
         "CENTRO"."COD_MUNIC",   
         "CENTRO"."COD_LOCAL",   
         "PROVINCIAS"."NOM_PROV",   
         "DEPTOS"."NOM_DEPTO",   
         "MUNICIPIOS"."NOM_MUNIC",   
         "LOCALIDADES"."NOM_LOCAL"  
    INTO :IL_PROVINCIA,   
         :IL_DEPARTAMENTO,   
         :IL_MUNICIPIO,   
         :IL_LOCALIDAD,   
         :IS_PROV,   
         :IS_DEPTO,   
         :IS_MUNIC,   
         :IS_LOCAL  
    FROM "DEPTOS",   
         "LOCALIDADES",   
         "MUNICIPIOS",   
         "PROVINCIAS" ,
			"CENTRO" 
   WHERE ( "CENTRO"."COD_PROV" = "PROVINCIAS"."COD_PROV" ) and  
         ( "CENTRO"."COD_DEPTO" = "DEPTOS"."COD_DEPTO" ) and  
         ( "CENTRO"."COD_MUNIC" = "MUNICIPIOS"."COD_MUNIC" ) and  
         ( "CENTRO"."COD_LOCAL" = "LOCALIDADES"."COD_LOCAL" ) and  
         ( ( "CENTRO"."NRO_CENTRO" = :GI_NRO_CMD ) )   ;


//if sqlca.sqlcode <> 0 then
//		ii_centro_dep = gi_nro_centro
//		ii_cmd_dep = gi_nro_cmd
//		ii_puesto_dep = gi_nro_puesto
//end if


RETURN 1
end function

event open;call super::open;// Cargo el objeto de comunicaciones para tener acceso 
// a la estructura
// lu_comunic  --> para cargar la estructura local 

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

lu_comunic = CREATE u_generico_comunicaciones

// Recibo parametros de entrada
lu_comunic.is_comunic = gu_comunic.is_comunic

dw_lista_sum_imp.SetTransObject(SQLCA)

// Si se esta mostrando los clientes imp. que hay para una instalacion grafica modifica el datawindow
if gu_comunic.is_comunic.programa_llamante = "w_1105_avisos_con_alim_graf" then
		
		string rc, mod_string, where_clause, ls_nises
		where_clause = 'SELECT CLIENTES.APE1_CLI,CLIENTES.APE2_CLI,CLIENTES.NOM_CLI, GI_SUMINISTROS_IMP.F_DESDE, GI_SUMINISTROS_IMP.F_FIN, GI_SUMINISTROS_IMP.F_EXPIRACION, GI_SUMINISTROS_IMP.OBSERVACION, GI_SUMINISTROS_IMP.NIS_RAD FROM CLIENTES, GI_SUMINISTROS_IMP WHERE GI_SUMINISTROS_IMP.COD_CLI= CLIENTES.COD_CLI and NIS_RAD IN (' + gu_comunic.is_comunic.strval9 + ')'
		mod_string = "DataWindow.Table.Select='" + where_clause + "'"
		rc = dw_lista_sum_imp.Modify(mod_string)
		IF rc <> "" THEN
			MessageBox("Status", "Modify Failed" + rc)
		END IF

end if
//Inicializo objetos de trabajo
IF dw_lista_sum_imp.Retrieve(lu_comunic.is_comunic.decval1) = 0 THEN
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada no tiene ning$$HEX1$$fa00$$ENDHEX$$n Suministro Importante.",information!,OK!)
	Yield()
	Close(This)
ELSE
	dw_1.modify("data_1.DataObject ='" + dw_lista_sum_imp.DataObject + "'")

	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista Suministros Importantes'
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
	
//	dw_lista_sum_imp.ShareData(dw_datos)
	dw_lista_sum_imp.setredraw(true)
END IF

end event

on w_3210_lista_suministros_imp.create
int iCurrent
call super::create
this.dw_lista_sum_imp=create dw_lista_sum_imp
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_lista_sum_imp
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_3210_lista_suministros_imp.destroy
call super::destroy
destroy(this.dw_lista_sum_imp)
destroy(this.cb_1)
destroy(this.dw_1)
end on

on close;call w_sgigenerica::close;DESTROY lu_comunic
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;IF dw_lista_sum_imp.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_lista_sum_imp

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3210_lista_suministros_imp
end type

type dw_lista_sum_imp from u_man_2037_pr_lista_sum_imp2 within w_3210_lista_suministros_imp
integer x = 27
integer y = 16
integer width = 2784
integer height = 900
integer taborder = 10
boolean border = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;int li_fila_seleccionada

li_fila_seleccionada = row

IF li_fila_seleccionada > 0 THEN
	This.SelectRow(0,False)
	This.SelectRow(li_fila_seleccionada,True)
END IF

end event

type cb_1 from commandbutton within w_3210_lista_suministros_imp
integer x = 1202
integer y = 944
integer width = 430
integer height = 108
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_3210_lista_suministros_imp
boolean visible = false
integer x = 37
integer y = 224
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


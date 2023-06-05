HA$PBExportHeader$w_3112_lista_consulta_sum.srw
forward
global type w_3112_lista_consulta_sum from w_sgigenerica
end type
type d_lista_sum from u_ins_2018_pr_lista_sum within w_3112_lista_consulta_sum
end type
type cb_1 from commandbutton within w_3112_lista_consulta_sum
end type
type dw_1 from datawindow within w_3112_lista_consulta_sum
end type
end forward

global type w_3112_lista_consulta_sum from w_sgigenerica
integer x = 581
integer y = 600
integer width = 2496
integer height = 1332
string title = "OPEN SGI - Lista de Suministros"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_sql_inst pbm_custom25
event ue_sql_acom pbm_custom26
event ue_sql_inst_todos pbm_custom27
d_lista_sum d_lista_sum
cb_1 cb_1
dw_1 dw_1
end type
global w_3112_lista_consulta_sum w_3112_lista_consulta_sum

type variables
u_generico_comunicaciones  lu_comunic
//u_ins_2018_nu_lista_sum iu_ins_2018_nu
end variables

event ue_sql_inst;string ls_rc, ls_mod_string, ls_original_select, ls_where
int li_msg
long  ll_cod_instal,ll_tipo_inst


SetPointer(HourGlass!)

ls_original_select = d_lista_sum.Describe("DataWindow.Table.Select")

ls_original_select = ls_original_select + ", SGD_ACOMETIDA "

ls_where = " WHERE   ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+))and  ( B.cod_cli (+) = sumcon.cod_cli) and ( A.cod_cli (+) = petsum.cod_cli) AND ( ACO_SUM.COD_CALLE = CALLEJERO.COD_CALLE )  and ( SGD_ACOMETIDA.BDI_JOB =0 ) and ( SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA ) and ( SGD_ACOMETIDA.INSTALACION_ORIGEN = '" + String(lu_comunic.is_comunic.decval1) + "' ) "

ls_mod_string = 'DataWindow.Table.Select="' + ls_original_select + ls_where + '" '

ls_rc = d_lista_sum.Modify(ls_mod_string)


 d_lista_sum.Retrieve()

// No quitar. -- LFE: soluci$$HEX1$$f300$$ENDHEX$$n de un problema del retrieve as need
d_lista_sum.setfilter("")
d_lista_sum.filter()

// Cambia de mensaje en funcion de la ventana desde la que se llama a $$HEX1$$e900$$ENDHEX$$sta
if d_lista_sum.rowCount() = 0  then

	if lu_comunic.is_comunic.programa_llamante = "w_3107" then
	
	ll_cod_instal = long(lu_comunic.is_comunic.decval1)
	
	SELECT  SGD_INSTALACION.TIPO_INSTALACION
	INTO    :ll_tipo_inst
   FROM    SGD_INSTALACION
   WHERE   SGD_INSTALACION.NRO_INSTALACION = :ll_cod_instal  ;


		// si no esta en la ultima nivel
	
		if ll_tipo_inst <>fgci_tipo_salida_de_baja then
		
		li_msg = MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No existe ning$$HEX1$$fa00$$ENDHEX$$n suministro alimentado directamente"+&
				" por esta intalaci$$HEX1$$f300$$ENDHEX$$n.$$HEX1$$bf00$$ENDHEX$$Queres mostrar los alimentados de manera indirecta?",Exclamation!,YesNo!,1)
		end if			
    	// Va Buscar todas suministros por instalacion en script "ue_sql_inst_todos" quando fue clicked "YES"
			if li_msg = 1 then 
				
			  this.triggerevent("ue_sql_inst_todos")
   		else
//			gnv_msg.f_mensaje('AI73',"","",OK!)
			end if
				
	else	
			gnv_msg.f_mensaje('AM21',"","",OK!)
	end if	
end if

end event

event ue_sql_acom;string ls_rc, ls_mod_string, ls_original_select, ls_where

SetPointer(HourGlass!)

ls_original_select = d_lista_sum.Describe("DataWindow.Table.Select")

// GNU 6-6-2006. Actualizaci$$HEX1$$f300$$ENDHEX$$n 1/446762

ls_original_select="  SELECT ACO_SUM.POT_CONTRATADA," + &   
         " FINCAS.NUM_PUERTA,"  + &
	  " FINCAS.DUPLICADOR," + &
         " ACO_SUM.CGV_SUM," + &  
         " CALLEJERO.NOM_CALLE," + &    
         " NVL(A.APE1_CLI,B.APE1_CLI), " + &  
         " NVL(A.APE2_CLI,B.APE2_CLI),  " + &
         " NVL(A.NOM_CLI, B.NOM_CLI),  " + &
         " ACO_SUM.NIF,"   + &
         " FINCAS.COD_CALLE, " + &
         " ACO_SUM.NIS_RAD," + &   
         " fgnu_calle_referencia(CALLEJERO.NOM_CALLE, FINCAS.NUM_PUERTA, FINCAS.DUPLICADOR, ACO_SUM.NIF, FINCAS.COD_CALLE, 0, ' ', 0, ' ') cdireccion" + &  
    	  " FROM ACO_SUM, SUMCON, PETSUM, CLIENTES B, CLIENTES A, CALLEJERO, FINCAS "
ls_where = " WHERE (FINCAS.NIF = ACO_SUM.NIF) AND  ( B.cod_cli (+) = sumcon.cod_cli) and ( A.cod_cli (+) = petsum.cod_cli) AND  ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) AND ( FINCAS.COD_CALLE = CALLEJERO.COD_CALLE ) and ( ACO_SUM.NRO_ACOMETIDA = '" + String(lu_comunic.is_comunic.longval1) + "' ) "
//ls_where = " WHERE  ( B.cod_cli (+) = sumcon.cod_cli) and ( A.cod_cli (+) = petsum.cod_cli) AND  ( aco_sum.nis_rad = sumcon.nis_rad (+)) and ( aco_sum.nis_rad = petsum.nis_rad (+)) AND ( ACO_SUM.COD_CALLE = CALLEJERO.COD_CALLE ) and ( ACO_SUM.NRO_ACOMETIDA = '" + String(lu_comunic.is_comunic.longval1) + "' ) "
// FIN GNU

ls_mod_string = 'DataWindow.Table.Select="' + ls_original_select + ls_where + '" '

ls_rc = d_lista_sum.Modify(ls_mod_string)

d_lista_sum.Retrieve()

// No quitar. -- LFE: soluci$$HEX1$$f300$$ENDHEX$$n de un problema del retrieve as need
d_lista_sum.setfilter("")
d_lista_sum.filter()


end event

event ue_sql_inst_todos;string ls_from, ls_where, ls_clausula_where, ls_rc, ls_modificacion, ls_select
int li_tipo_instalacion

li_tipo_instalacion = fgci_tipo_salida_de_baja // Salida de Baja tension 


// GNU 28-2-2006. Incidencia correo Panam$$HEX1$$e100$$ENDHEX$$
// SELECT  de SQL
//ls_select = "SELECT ACO_SUM.POT_CONTRATADA, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, ACO_SUM.CGV_SUM, " + &
//      " CALLEJERO.NOM_CALLE, NVL(A.APE1_CLI,B.APE1_CLI), NVL(A.APE2_CLI,B.APE2_CLI), NVL(A.NOM_CLI, B.NOM_CLI), " + &
//      " fgnu_calle_referencia(CALLEJERO.NOM_CALLE, ACO_SUM.NUM_PUERTA, ACO_SUM.DUPLICADOR, ACO_SUM.NIF, ACO_SUM.COD_CALLE, 0, ' ', 0, ' ') cdireccion, " + &
//      " ACO_SUM.NIF, ACO_SUM.COD_CALLE,  ACO_SUM.NIS_RAD "
//
ls_select = "SELECT ACO_SUM.POT_CONTRATADA, NVL(A.NUM_PUERTA,B.NUM_PUERTA) aco_sum_num_puerta, NVL(A.DUPLICADOR,B.DUPLICADOR) aco_sum_duplicador, ACO_SUM.CGV_SUM, " + &
      " CALLEJERO.NOM_CALLE, NVL(A.APE1_CLI,B.APE1_CLI), NVL(A.APE2_CLI,B.APE2_CLI), NVL(A.NOM_CLI, B.NOM_CLI), " + &
	" ACO_SUM.NIF, NVL(A.COD_CALLE,B.COD_CALLE) aco_sum_cod_calle,  ACO_SUM.NIS_RAD, "  + &
      " fgnu_calle_referencia(CALLEJERO.NOM_CALLE,  NVL(A.NUM_PUERTA,B.NUM_PUERTA), NVL(A.DUPLICADOR,B.DUPLICADOR), ACO_SUM.NIF, NVL(A.COD_CALLE,B.COD_CALLE), 0, ' ', 0, ' ') cdireccion   " 
// FIN GNU    

// FROM de SQL		 
ls_from = "FROM ACO_SUM, SUMCON, PETSUM, CLIENTES B, CLIENTES A, CALLEJERO , SGD_ACOMETIDA "
	
// WHERE de SQL
ls_where = " WHERE ( aco_sum.nis_rad = sumcon.nis_rad (+))  and ( aco_sum.nis_rad = petsum.nis_rad (+)) " + &
           " and  ( B.cod_cli (+) = sumcon.cod_cli) and ( A.cod_cli (+) = petsum.cod_cli) " + & 
			  " AND ( ACO_SUM.COD_CALLE = CALLEJERO.COD_CALLE )  and ( SGD_ACOMETIDA.BDI_JOB =0 ) " + &
			  " and ( SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA ) " + &
			  "AND (SUMCON.EST_SUM IN ('EC012', 'EC013', 'EC014'))" + &
			     " AND (SGD_ACOMETIDA.INSTALACION_ORIGEN IN " + &
				  "( SELECT SGD_INSTALACION.NRO_INSTALACION " + &
              "FROM SGD_INSTALACION " + &
              " WHERE tipo_instalacion = '" + string(li_tipo_instalacion) + "' " + &
              " START WITH SGD_INSTALACION.BDI_JOB = 0 AND NRO_INSTALACION =  '" + String(lu_comunic.is_comunic.decval1) + "' " + &
              " CONNECT BY PRIOR NRO_INSTALACION = NRO_INST_PADRE AND SGD_INSTALACION.BDI_JOB = 0 ))" 


	ls_clausula_where = ls_select + " " + ls_from + " " + ls_where
	ls_modificacion = "DataWindow.table.Select=~"" +ls_clausula_where + "~""
   ls_rc = d_lista_sum.Modify(ls_modificacion)

   d_lista_sum.Retrieve()
	
	// No quitar. -- LFE: soluci$$HEX1$$f300$$ENDHEX$$n de un problema del retrieve as need
	d_lista_sum.setfilter("")
	d_lista_sum.filter()

   // Cambia de mensaje en funcion de la ventana desde la que se llama a $$HEX1$$e900$$ENDHEX$$sta
   if d_lista_sum.rowCount() = 0  then
		  if lu_comunic.is_comunic.programa_llamante = "w_3107" then
			 MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No existe ning$$HEX1$$fa00$$ENDHEX$$n suministro alimentado "+&
				 " por esta intalaci$$HEX1$$f300$$ENDHEX$$n.",Exclamation!,OK!)
   		else	
	   		gnv_msg.f_mensaje('AM21',"","",OK!)
		   end if	
		
		
    end if

end event

event activate;call super::activate;//
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana con la lista de suministros
//				 a consultar.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        10/09/96  	 AFS
//
/////////////////////////////////////////////////////////////////////////

// Para abrirse debe recibir en la estructura de comunicaciones
// en decval1 el numero de instalacion o en longval1 el numero
// de acometida dependiendo de cual sea la consulta
DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

SetPointer(HourGlass!)

lu_comunic = CREATE u_generico_comunicaciones

lu_comunic.is_comunic = gu_comunic.is_comunic

//fgnu_resetear_s_comunicaciones(gu_comunic)

This.Title = gu_comunic.f_titulo_ventana("iw_3112","lista_sum")

d_lista_sum.SetTransObject(sqlca)

CHOOSE CASE lu_comunic.is_comunic.programa_llamante
	CASE "w_3107"
		This.TriggerEvent("ue_sql_inst")
     
	CASE "w_3111"
		This.TriggerEvent("ue_sql_acom")		

	CASE "w_3109"
		This.TriggerEvent("ue_sql_acom")		

END CHOOSE

d_lista_sum.SelectRow(0,False)

if d_lista_sum.rowCount() = 0 then
//	postevent("ue_postopen")
gu_comunic.is_comunic.intval11 =0
	YIELD()
	close(this)
else
gu_comunic.is_comunic.intval11 = 1
dw_1.modify("data_1.DataObject ='" + d_lista_sum.DataObject + "'")

	//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//	dw_1.GetChild ("data_1",dw_datos)
	
	//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
	ls_titulo = 'Lista Suministro'
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
	
//	d_lista_sum.ShareData(dw_datos)
	d_lista_sum.setredraw(true)
end if

end event

on w_3112_lista_consulta_sum.create
int iCurrent
call super::create
this.d_lista_sum=create d_lista_sum
this.cb_1=create cb_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_sum
this.Control[iCurrent+2]=this.cb_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_3112_lista_consulta_sum.destroy
call super::destroy
destroy(this.d_lista_sum)
destroy(this.cb_1)
destroy(this.dw_1)
end on

on close;call w_sgigenerica::close;//DESTROY iu_ins_2018_nu
DESTROY lu_comunic
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;IF d_lista_sum.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = d_lista_sum

// GNU 22-6-2006. Incidencia Correo Panam$$HEX1$$e100$$ENDHEX$$
//gf_impresion_preliminar (lst_impresion, True, 0)
OpenWithParm ( w_generica_impresion_preliminar,  lst_impresion)	
// FIN GNU
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3112_lista_consulta_sum
end type

type d_lista_sum from u_ins_2018_pr_lista_sum within w_3112_lista_consulta_sum
integer x = 46
integer y = 60
integer width = 2386
integer height = 992
integer taborder = 10
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;int li_fila_seleccionada

li_fila_seleccionada = row

IF li_fila_seleccionada > 0 THEN
	This.SelectRow(0,False)
	This.SelectRow(li_fila_seleccionada,True)
END IF

end event

type cb_1 from commandbutton within w_3112_lista_consulta_sum
integer x = 1065
integer y = 1088
integer width = 352
integer height = 108
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

type dw_1 from datawindow within w_3112_lista_consulta_sum
boolean visible = false
integer x = 73
integer y = 256
integer width = 494
integer height = 360
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


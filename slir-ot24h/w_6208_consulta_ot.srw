HA$PBExportHeader$w_6208_consulta_ot.srw
forward
global type w_6208_consulta_ot from w_sgigenerica
end type
type d_filtro_tareas from datawindow within w_6208_consulta_ot
end type
type gb_2 from groupbox within w_6208_consulta_ot
end type
type cbx_1 from checkbox within w_6208_consulta_ot
end type
type cbx_2 from checkbox within w_6208_consulta_ot
end type
type dw_fecha_inicio from ue_gen_filtro_fechas within w_6208_consulta_ot
end type
type dw_fecha_fin from ue_gen_filtro_fechas within w_6208_consulta_ot
end type
type gb_3 from groupbox within w_6208_consulta_ot
end type
type dw_1 from datawindow within w_6208_consulta_ot
end type
type gb_1 from groupbox within w_6208_consulta_ot
end type
type dw_lista_tareas from u_bri_2017_pr_datos_cons_ot within w_6208_consulta_ot
end type
type d_filtro_ots from datawindow within w_6208_consulta_ot
end type
type sle_1 from singlelineedit within w_6208_consulta_ot
end type
type cb_total from commandbutton within w_6208_consulta_ot
end type
type st_8 from statictext within w_6208_consulta_ot
end type
end forward

global type w_6208_consulta_ot from w_sgigenerica
integer x = 9
integer y = 124
integer width = 3653
integer height = 2148
string title = "OPEN SGI - Consulta de Tareas y OT"
string menuname = "md_lista_ot"
string icon = "ot.ico"
event ue_retrieve pbm_custom21
event ue_armar_sql pbm_custom74
event ue_avisos_asociados ( )
d_filtro_tareas d_filtro_tareas
gb_2 gb_2
cbx_1 cbx_1
cbx_2 cbx_2
dw_fecha_inicio dw_fecha_inicio
dw_fecha_fin dw_fecha_fin
gb_3 gb_3
dw_1 dw_1
gb_1 gb_1
dw_lista_tareas dw_lista_tareas
d_filtro_ots d_filtro_ots
sle_1 sle_1
cb_total cb_total
st_8 st_8
end type
global w_6208_consulta_ot w_6208_consulta_ot

type variables
u_generico_comunicaciones iuo_gen_comunic1

u_bri_2016_nu_prop_tareas_ot  iu_bri_2016_nu
u_bri_2016_pr_prop_tareas_ot  iu_bri_2016_pr
u_bri_2017_pr_datos_orden_tarea  iu_bri_2017_pr
u_bri_2018_nu_datos_brigada  iu_bri_2018_nu

int ii_tipo_llamada
long il_nro_instalacion
long il_nro_aviso
long fila_ant=1
boolean ib_es_calle
string sqlselect1, sqlselect2

long  il_ind_cli_imp, il_ind_peligro

end variables

forward prototypes
public function integer fw_buscar ()
public function integer fw_datos_tareas (long pl_nro_ot)
end prototypes

event ue_retrieve;DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

if dw_lista_tareas.retrieve() < 1 then
	gnv_msg.f_mensaje("IA01","","",OK!)
	// GNU 1-6-2007. Mejora 1/424517
	sle_1.text='0'
else
	sle_1.text= string(dw_lista_tareas.rowcount())
	// FIN GNU	
end if

//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista de tareas'
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

//dw_lista_tareas.ShareData(dw_datos)
dw_lista_tareas.setredraw(true)
									
end event

event ue_armar_sql;////////////////////////////////////////////////////////////////////////
//
// Evento:  ue_armar_sql
//
// Objetivo: Dependiendo de valores en objetos selecci$$HEX1$$f300$$ENDHEX$$n fechas etc..
//				 Validaremos y armaremos la sentencia para el volcado datos 
//           sobre Dw.
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n       22/01/1998   FDO
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   21/09/1998   MATO
//
/////////////////////////////////////////////////////////////////////////
string retorno
string ls_clausula_where = '', ls_signo 
long ll_estado,ll_tareas
string ls_fecha_desde_menor,ls_fecha_desde_mayor,ls_fecha_hasta_menor,ls_fecha_hasta_mayor
datetime ld_fecha_nula
string  ls_tipo//dsa
long ll_ot_desde, ll_ot_hasta, ll_brigada,ll_contrata, ll_pos	// GNU 4-5-2006. Mejora 1/339429
string ls_sqlselect1_bri, ls_sqlselect1_where
datawindowchild dwc_brigadas, dwc_contratas


SetNull(ld_fecha_nula)
Ll_estado =  d_filtro_tareas.GetItemNumber(1,"pi_estado")
Ll_tareas =  d_filtro_tareas.GetItemNumber(1,"pi_tareas")
//ls_tipo   =  d_filtro_tareas.GetItemString(1,"ps_tipo")
// GNU 4-5-2006. Mejora 1/339429
ls_tipo = '00'
d_filtro_OTs.AcceptText()
ll_ot_desde= d_filtro_OTs.GetItemNumber(1,"t_desde")
ll_ot_hasta= d_filtro_OTs.GetItemNumber(1,"t_hasta")
if isnull (ll_ot_desde) then ll_ot_desde=0
if isnull (ll_ot_hasta) then ll_ot_hasta=0
ll_brigada= d_filtro_OTs.GetItemNumber(1,"pi_brigadas")
ll_contrata= d_filtro_OTs.GetItemNumber(1,"pi_contratas")
// FIN GNU

//ls_clausula_where= " WHERE ( GI_BRIGADA.NRO_BRIGADA = GI_OT.ULT_BRIGADA ) AND " + &  
//        				 "( SGD_INSTALACION.NRO_INSTALACION (+) = GI_OT.NRO_INSTALACION ) AND " + &   
//       				 "( SGD_VALOR.CODIF = 'E_OT' ) AND " + &  
//     				    "( SGD_VALOR.CODIGO = GI_OT.EST_OT  )"

//DBE 11/01/2000
// GNU 4-5-2006. Mejora 1/339429
IF ll_ot_desde <> 0 and ll_ot_hasta=0 THEN
	ls_clausula_where= ls_clausula_where + " AND (GI_OT.NRO_OT= " + string(ll_ot_desde) + ")"
	d_filtro_OTs.SetTabOrder("pi_brigadas",10)
	d_filtro_OTs.Modify("pi_brigadas.background.color=" + gs_blanco)
	d_filtro_OTs.getchild('pi_brigadas',dwc_brigadas)
	dwc_brigadas.settransobject(sqlca)
	dwc_brigadas.retrieve()
	dwc_brigadas.InsertRow(1)
	dwc_brigadas.SetItem(1,'nombre','<Todas>')
	dwc_brigadas.SetItem(1,'nro_brigada',0)
	d_filtro_OTs.SetTabOrder("pi_contratas",20)
	d_filtro_OTs.Modify("pi_contratas.background.color=" + gs_blanco)
	d_filtro_OTs.getchild('pi_contratas',dwc_contratas)
	dwc_contratas.settransobject(sqlca)
	dwc_contratas.retrieve()
	dwc_contratas.InsertRow(1)
	dwc_contratas.SetItem(1,'nombre','<Todas>')
	dwc_contratas.SetItem(1,'nro_contrata',0)
	d_filtro_OTs.setitem(1,"pi_brigadas",0)
	d_filtro_OTs.setitem(1,"pi_contratas",0)
	d_filtro_tareas.setitem(1,"pi_tareas",0)
	d_filtro_tareas.setitem(1,"pi_estado",0)
ELSEIF ll_ot_desde = 0 and ll_ot_hasta <>0 THEN
	ls_clausula_where= ls_clausula_where + " AND (GI_OT.NRO_OT= " + string(ll_ot_hasta) + ")"
	d_filtro_OTs.SetTabOrder("pi_brigadas",10)
	d_filtro_OTs.Modify("pi_brigadas.background.color=" + gs_blanco)
	d_filtro_OTs.getchild('pi_brigadas',dwc_brigadas)
	dwc_brigadas.settransobject(sqlca)
	dwc_brigadas.retrieve()
	dwc_brigadas.InsertRow(1)
	dwc_brigadas.SetItem(1,'nombre','<Todas>')
	dwc_brigadas.SetItem(1,'nro_brigada',0)
	d_filtro_OTs.SetTabOrder("pi_contratas",20)
	d_filtro_OTs.Modify("pi_contratas.background.color=" + gs_blanco)
	d_filtro_OTs.getchild('pi_contratas',dwc_contratas)
	dwc_contratas.settransobject(sqlca)
	dwc_contratas.retrieve()
	dwc_contratas.InsertRow(1)
	dwc_contratas.SetItem(1,'nombre','<Todas>')
	dwc_contratas.SetItem(1,'nro_contrata',0)
	d_filtro_OTs.setitem(1,"pi_brigadas",0)
	d_filtro_OTs.setitem(1,"pi_contratas",0)
	d_filtro_tareas.setitem(1,"pi_tareas",0)
	d_filtro_tareas.setitem(1,"pi_estado",0)
ELSE
	IF ll_ot_desde <> 0 and ll_ot_hasta <> 0 THEN	
		ls_clausula_where= ls_clausula_where + " AND (GI_OT.NRO_OT >= " + string(ll_ot_desde) + &
			" AND GI_OT.NRO_OT <= " + string(ll_ot_hasta) + ")"
	END IF

	IF LL_tareas <> 0 THEN 
		ls_clausula_where = ls_clausula_where + " AND (GI_OT.IND_TRABAJO= " + string(ll_tareas) + ")"
	END IF

	IF LL_ESTADO <> 0 THEN
		ls_clausula_where = ls_clausula_where + " AND (GI_OT.EST_OT= " + string(ll_estado) + ")"
	END IF
	
	IF ll_brigada <> 0 THEN
		ls_clausula_where= ls_clausula_where + " AND (GI_BRIGADA_OT.NRO_BRIGADA= " + string (ll_brigada) + ")" + &
			" AND GI_BRIGADA_OT.NRO_OT= GI_OT.NRO_OT"
		ls_tipo = 'BR'
		ll_pos= pos (sqlselect1,'WHERE')
		ls_sqlselect1_bri= mid(sqlselect1, 1, ll_pos -2)
		ls_sqlselect1_bri= ls_sqlselect1_bri + ', "GI_BRIGADA_OT" ~n '
		ls_sqlselect1_where= mid(sqlselect1, ll_pos)
		ls_sqlselect1_bri=ls_sqlselect1_bri + ls_sqlselect1_where	
	ELSEIF ll_contrata <> 0 THEN
		ls_clausula_where= ls_clausula_where + " AND (GI_CONTRATA_OT.NRO_CONTRATA= " + string (ll_contrata) + ")" 
		ls_tipo = 'CO'
	END IF	
// FIN GNU	
	
END IF

IF ll_ot_desde = 0 and ll_ot_hasta = 0 THEN	
	IF cbx_1.checked = true then
		dw_fecha_inicio.AcceptText()
		ls_fecha_desde_menor= string(date(dw_fecha_inicio.object.f_desde[1]))
		ls_fecha_desde_mayor= string(date(dw_fecha_inicio.object.f_hasta[1]))
		if date(ls_fecha_desde_menor) >= date(ls_fecha_desde_mayor) then
			dw_fecha_inicio.object.f_desde[1]=ld_fecha_nula
			//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El Rango establecido para F. Inicio no es correcto")
			gnv_msg.f_mensaje("EO01","","",OK!)
		   return
	  	 end if	
		if IsNull(ls_fecha_desde_menor) and IsNull(ls_fecha_desde_mayor) then
			//recupero todos
		elseif IsNull(ls_fecha_desde_menor) and not IsNull(ls_fecha_desde_mayor) then
			ls_clausula_where = ls_clausula_where +  " AND ((GI_OT.F_DESDE <= to_date( '" + ls_fecha_desde_mayor  + "' ,'DD/MM/YYYY'))"
		elseif  IsNull(ls_fecha_desde_mayor) and not IsNull(ls_fecha_desde_menor) then
  	   		ls_clausula_where = ls_clausula_where + " AND (GI_OT.F_DESDE >= to_date( '" + ls_fecha_desde_menor  + "' ,'DD/MM/YYYY'))"
		else
  	   	ls_clausula_where = ls_clausula_where + " AND (GI_OT.F_DESDE >= to_date( '" + ls_fecha_desde_menor  + "' ,'DD/MM/YYYY'))" +&
							    " AND (GI_OT.F_DESDE <= to_date( '" + ls_fecha_desde_mayor  + "' ,'DD/MM/YYYY'))"	
		end if						  
	END IF	

	IF cbx_2.checked = true then
	   
		dw_fecha_fin.AcceptText()
		ls_fecha_hasta_menor= string(date(dw_fecha_fin.object.f_desde[1]))
		ls_fecha_hasta_mayor= string(date(dw_fecha_fin.object.f_hasta[1]))
	
		if date(ls_fecha_hasta_menor) >= date(ls_fecha_hasta_mayor) then
			dw_fecha_fin.object.f_desde[1]=ld_fecha_nula
			//messagebox("no vale pepe","El Rango establecido para F. Fin no es correcto")
			gnv_msg.f_mensaje("EO02","","",OK!)  
			return
   		end if	
	
		if IsNull(ls_fecha_hasta_menor) and IsNull(ls_fecha_hasta_mayor) then
		//recupero todos
		elseif IsNull(ls_fecha_hasta_menor) and not IsNull(ls_fecha_hasta_mayor) then
			ls_clausula_where = ls_clausula_where +  " AND( TO_DATE(TO_CHAR(GI_OT.F_HASTA,'DD/MM/YYYY'),'DD/MM/YYYY')  <= to_date( '" + ls_fecha_hasta_mayor  + "' ,'DD/MM/YYYY'))" + &
										" OR (GI_OT.F_HASTA IS NULL))"
		elseif IsNull(ls_fecha_hasta_mayor) and not IsNull(ls_fecha_hasta_menor) then
  	   		ls_clausula_where = ls_clausula_where + " AND (TO_DATE(TO_CHAR(GI_OT.F_HASTA,'DD/MM/YYYY'),'DD/MM/YYYY') > to_date( '" + ls_fecha_hasta_menor  + "' ,'DD/MM/YYYY'))" + &
				  						" OR (GI_OT.F_HASTA IS NULL))"
		else							
	   		ls_clausula_where = ls_clausula_where + " AND (TO_DATE(TO_CHAR(GI_OT.F_HASTA,'DD/MM/YYYY'),'DD/MM/YYYY') > to_date( '" + ls_fecha_hasta_menor  + "' ,'DD/MM/YYYY'))" +&
							  " AND (TO_DATE(TO_CHAR(GI_OT.F_HASTA,'DD/MM/YYYY'),'DD/MM/YYYY') <= to_date( '" + ls_fecha_hasta_mayor  + "' ,'DD/MM/YYYY'))"
		end if						  
	END IF
END IF


//
//is_select =	"SELECT GI_OT.NRO_OT, " + &     
//        		"GI_OT.EST_OT, " + &     
//            "GI_OT.DESCRIPCION, "  + &    
//            "GI_OT.NRO_AVISO, " + &     
//            "GI_OT.NRO_INSTALACION, " + &     
//            "GI_OT.NRO_INCIDENCIA, " + &     
//            "GI_OT.F_DESDE, " + &     
//            "GI_OT.F_HASTA, " + &     
//            "GI_OT.ULT_BRIGADA, " + &     
//            "GI_OT.F_INI_PREV, " + &     
//            "GI_OT.F_FIN_PREV, "  + &    
//            "GI_OT.IND_TRABAJO, " + &     
//            "GI_BRIGADA.NOMBRE, "  + &    
//            "SGD_INSTALACION.NOM_INSTALACION, " + &     
//            "SGD_VALOR.DESCRIPCION " + &    
//       		"FROM GI_BRIGADA, " + &     
//				"GI_OT, " + &      
//            "SGD_INSTALACION, " + &     
//            "SGD_VALOR "   

string ls_select

if ls_tipo = '00' then
		ls_select = sqlselect1 + ls_clausula_where + ' UNION '+sqlselect2 + ls_clausula_where
elseif ls_tipo = 'BR' then
// GNU 31-5-2006. Mejora 1/339429
		ls_select = ls_sqlselect1_bri + ls_clausula_where
//		ls_select = sqlselect1 + ls_clausula_where
// FIN GNU
elseif ls_tipo = 'CO' then
		ls_select = sqlselect2 + ls_clausula_where
end if


dw_lista_tareas.SetSqlSelect(ls_select)


end event

event ue_avisos_asociados();/********************************************************************************/
/* Descripcion : Muestra los avisos asociados a la ot									  */
/* Argumentos  : -																				  */
/* Devuelve    : -																				  */
/*						Autor					Fecha							Acci$$HEX1$$f300$$ENDHEX$$n        		  */
/*						AHM				29/09/2009			Creaci$$HEX1$$f300$$ENDHEX$$n(Mejora 1/468636)	  */
/********************************************************************************/

long		ll_nroInstalacion
long 		ll_fila					//Fila seleccionada

SetPointer(HourGlass!)


ll_fila = dw_lista_tareas.GetSelectedRow(ll_fila)

IF ll_fila > 0 THEN
	
	
	gu_comunic.is_comunic.longval1=dw_lista_tareas.getItemNumber(1, "nro_ot")
	
	SELECT NRO_INSTALACION
	INTO   :ll_nroInstalacion
	FROM   GI_OT
	WHERE  NRO_OT = :gu_comunic.is_comunic.longval1 ;
	
	gu_comunic.is_comunic.longval2=ll_nroInstalacion
	gu_comunic.is_comunic.Accion_llamada='Desasociar'
	gu_comunic.is_comunic.programa_llamante="iw_ot_av"
		
	
	open(w_2307_consulta_avisos)
	
ELSE
	messageBox("Aviso", "No hay OT seleccionada")
END IF
end event

public function integer fw_buscar ();This.triggerevent("ue_armar_sql")
This.triggerevent("ue_retrieve")

return 1
end function

public function integer fw_datos_tareas (long pl_nro_ot);int li_tip_brigada, li_retorno


SELECT "GI_OT"."NRO_CENTRO",
		 "GI_OT"."NRO_CMD",
		 "GI_OT"."NRO_MESA",
		 "GI_OT"."TIP_BRIGADA"
INTO :gu_comunic.is_comunic.intval1,
	  :gu_comunic.is_comunic.intval2,
	  :gu_comunic.is_comunic.intval3,
	  :li_tip_brigada
FROM "GI_OT"
WHERE "GI_OT"."NRO_OT" = :pl_nro_ot;

IF SQLCA.SQLCODE = 0 THEN
	li_retorno = 0
ELSE
	li_Retorno = 1
END IF 

IF li_retorno = 0  THEN
	IF li_tip_brigada = 1 THEN //BRIGADA
		
		SELECT "GI_BRIGADA_OT"."NRO_BRIGADA"
		INTO :gu_comunic.is_comunic.longval1
		FROM "GI_BRIGADA_OT"
		WHERE "GI_BRIGADA_OT"."NRO_OT" = :pl_nro_ot;
		
		SELECT "GI_BRIGADA"."NOMBRE"
		INTO :gu_comunic.is_comunic.strval1
		FROM "GI_BRIGADA"
		WHERE "GI_BRIGADA"."NRO_BRIGADA" = :gu_comunic.is_comunic.longval1;
		
		gu_comunic.is_comunic.strval2 = 'BR'
	
	ELSEIF li_tip_brigada = 2 THEN //CONTRATA
		
		SELECT "GI_CONTRATA_OT"."NRO_CONTRATA"
		INTO :gu_comunic.is_comunic.longval1
		FROM "GI_CONTRATA"
		WHeRE "GI_CONTRATA"."NRO_OT" = :pl_nro_ot;
		
		SELECT "GI_CONTRATA"."NOMBRE"
		INTO :gu_comunic.is_comunic.strval1
		FROM "GI_CONTRATA"
		WHERE "GI_CONTRATA"."NRO_OT" = :pl_nro_ot;
		
		gu_comunic.is_comunic.strval2 = 'CO'
		
	END IF
END IF

Return li_retorno
end function

on w_6208_consulta_ot.create
int iCurrent
call super::create
if this.MenuName = "md_lista_ot" then this.MenuID = create md_lista_ot
this.d_filtro_tareas=create d_filtro_tareas
this.gb_2=create gb_2
this.cbx_1=create cbx_1
this.cbx_2=create cbx_2
this.dw_fecha_inicio=create dw_fecha_inicio
this.dw_fecha_fin=create dw_fecha_fin
this.gb_3=create gb_3
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_lista_tareas=create dw_lista_tareas
this.d_filtro_ots=create d_filtro_ots
this.sle_1=create sle_1
this.cb_total=create cb_total
this.st_8=create st_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_filtro_tareas
this.Control[iCurrent+2]=this.gb_2
this.Control[iCurrent+3]=this.cbx_1
this.Control[iCurrent+4]=this.cbx_2
this.Control[iCurrent+5]=this.dw_fecha_inicio
this.Control[iCurrent+6]=this.dw_fecha_fin
this.Control[iCurrent+7]=this.gb_3
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.dw_lista_tareas
this.Control[iCurrent+11]=this.d_filtro_ots
this.Control[iCurrent+12]=this.sle_1
this.Control[iCurrent+13]=this.cb_total
this.Control[iCurrent+14]=this.st_8
end on

on w_6208_consulta_ot.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.d_filtro_tareas)
destroy(this.gb_2)
destroy(this.cbx_1)
destroy(this.cbx_2)
destroy(this.dw_fecha_inicio)
destroy(this.dw_fecha_fin)
destroy(this.gb_3)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_lista_tareas)
destroy(this.d_filtro_ots)
destroy(this.sle_1)
destroy(this.cb_total)
destroy(this.st_8)
end on

event open;call super::open;md_lista_ot			lm_menu				//Men$$HEX2$$fa002000$$ENDHEX$$asociado a la ventana
string ls_error, ls_filter
datawindowchild	dwc_Estado
// creo objetos de trabajo
iuo_gen_comunic1 = create u_generico_comunicaciones 

// Creo variable de trabajo de comunicaciones propia
iu_bri_2016_nu = CREATE u_bri_2016_nu_prop_tareas_ot
iu_bri_2016_pr = CREATE u_bri_2016_pr_prop_tareas_ot
iu_bri_2017_pr = CREATE u_bri_2017_pr_datos_orden_tarea
iu_bri_2018_nu = CREATE u_bri_2018_nu_datos_brigada

// GNU 5-5-2006. Mejora 1/339429
datawindowchild dwc_brigadas, dwc_contratas
d_filtro_OTs.insertrow(0)
d_filtro_OTs.getchild('pi_brigadas',dwc_brigadas)
dwc_brigadas.settransobject(sqlca)
dwc_brigadas.retrieve()
dwc_brigadas.InsertRow(1)
dwc_brigadas.SetItem(1,'nombre','<Todas>')
dwc_brigadas.SetItem(1,'nro_brigada',0)

d_filtro_OTs.getchild('pi_contratas',dwc_contratas)
dwc_contratas.settransobject(sqlca)
dwc_contratas.retrieve()
dwc_contratas.InsertRow(1)
dwc_contratas.SetItem(1,'nombre','<Todas>')
dwc_contratas.SetItem(1,'nro_contrata',0)

d_filtro_OTs.setitem(1,"pi_brigadas",0)
d_filtro_OTs.setitem(1,"pi_contratas",0)
d_filtro_OTs.setitem(1,"t_desde",0)
d_filtro_OTs.setitem(1,"t_hasta",0)
// FIN GNU




iu_bri_2016_nu.fnu_crea_dddw(d_filtro_tareas)
//d_filtro_tareas.AcceptText()
d_filtro_tareas.InsertRow(0)
d_filtro_tareas.getchild ('pi_estado',dwc_estado)
dwc_estado.setTransObject(sqlca)
dwc_estado.retrieve()
ls_filter = 'codigo <> '+ string (fgci_ot_pendiente)
dwc_estado.setFilter(ls_filter)
dwc_estado.filter()	
d_filtro_tareas.setitem(1,"pi_tareas",0)
d_filtro_tareas.setitem(1,"pi_estado",0)

dw_lista_tareas.settransobject(sqlca)

dw_fecha_inicio.insertrow(0)
dw_fecha_fin.insertrow(0)

dw_fecha_inicio.f_inicializar_actual()
dw_fecha_fin.f_inicializar_actual()

dw_fecha_inicio.fnu_habilitar_f_desde(true)
dw_fecha_inicio.fnu_habi_f_hasta(true)

dw_fecha_fin.fnu_habilitar_f_desde(true)
dw_fecha_fin.fnu_habi_f_hasta(true)

SetFocus(dw_lista_tareas)

if gb_bdi then 
	if gb_hay_sesion  then
		 md_lista_ot.m_consultar.visible=true
   	md_lista_ot.m_consultar.m_grafico.visible=true
       md_lista_ot.m_consultar.m_grafico.toolbaritemvisible=true
		 md_lista_ot.m_consultar.m_grafico.m_localizacion.toolbaritemvisible=true
		 md_lista_ot.m_consultar.m_grafico.m_selecciondecapas.toolbaritemvisible=true
		 md_lista_ot.m_consultar.m_grafico.m_quitarblink.toolbaritemvisible=true
      md_lista_ot.m_consultar.m_grafico.m_localizacion.enabled=false
		md_lista_ot.m_consultar.m_grafico.m_quitarblink.enabled=false
		md_lista_ot.m_consultar.m_grafico.m_instalacionesconbrigadas.toolbaritemvisible=true
   else  
	   //if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Por el momento no es posible mostrar informaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica, $$HEX1$$bf00$$ENDHEX$$desea continuar?",Information!,YesNo!)=2 then 
  	   if gnv_msg.f_mensaje("CD01","","",YesNo!) = 2 then 
//	      timer(0)	
		   close(this)
			return
	   end if	  
  end if 
end if
dw_1.modify("d_1.DataObject ='" + dw_lista_tareas.DataObject + "'")
long union_pos = 0
sqlselect1 = dw_lista_tareas.GetSqlSelect()
union_pos = pos(sqlselect1,'~nUNION')
sqlselect2 = mid(sqlselect1, union_pos + 7)
sqlselect1 = mid(sqlselect1, 1, union_pos - 1)

//AHM (29/09/2009) Mejora 1/468636
lm_menu = THIS.menuid

lm_menu.m_consultar.m_avisosasociadosaot.enabled = TRUE
lm_menu.m_consultar.m_avisosasociadosaot.toolbarItemVisible = TRUE

end event

event close;call super::close;DESTROY iu_bri_2016_nu
DESTROY iu_bri_2016_pr
DESTROY iu_bri_2017_pr
DESTROY iu_bri_2018_nu
DESTROY iuo_gen_comunic1
 
 

end event

event activate;////////////////////////////////////////////////////////////////////////
//
// Evento:  Activate
//
// Objetivo: Dependiendo desde que ventana se retorna a esta 
//					se realizan distintas acciones
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        22-1-96   JH
//                       Modificaci$$HEX1$$f300$$ENDHEX$$n   09/04/96   HMA
//
/////////////////////////////////////////////////////////////////////////

yield()
u_avi_1002_nu_generico u_avi_1002_nu
u_avi_2004_pr_form_inf_resumen u_avi_2004_pr // GNU 4-5-2006. Mejora 1/339429



// Obtengo el valor de la variable global de comunicaciones
// enviada por alguna de las ventanas llamadas

SetPointer(HourGlass!)

iuo_gen_comunic1.is_comunic = gu_comunic1.is_comunic 

CHOOSE CASE iuo_gen_comunic1.is_comunic.programa_retorno 
			   
CASE "iw_6201"		

	u_avi_1002_nu = CREATE u_avi_1002_nu_generico
	u_avi_2004_pr = CREATE u_avi_2004_pr_form_inf_resumen // GNU 4-5-2006. Mejora 1/339429
	
	IF iuo_gen_comunic1.is_comunic.accion_retorno = "Anulada" THEN

		IF ii_tipo_llamada=2 THEN // ot instalaci$$HEX1$$f300$$ENDHEX$$n

		// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza el nro. de OT 
		// en Avisos y Avisos_res

		/* INICIO.TDA EDM-12 02/10/2017 */
			IF(il_nro_instalacion = 99999999) THEN
				MessageBox("Error", "Ha seleccionado una instalaci$$HEX1$$f300$$ENDHEX$$n no valida.")
			ELSE
				u_avi_1002_nu.fnu_anular_ot_inst(il_nro_instalacion)
			END IF
			/* FIN.TDA EDM-12 02/10/2017 */
			
		ELSEIF ii_tipo_llamada=1 THEN

		// Se llama a la funci$$HEX1$$f300$$ENDHEX$$n que actualiza el nro. de OT 
		// en Avisos y Avisos_res

			u_avi_1002_nu.fnu_anular_ot_avi(il_nro_aviso)
	
		END IF
	// GNU 4-5-2006. Mejora 1/339429
	ELSEIF iuo_gen_comunic1.is_comunic.accion_retorno = "Asignada" THEN
		u_avi_1002_nu.fnu_asignar_brigada_avi( iuo_gen_comunic1.is_comunic.longval2, il_nro_aviso)
	ELSEIF  iuo_gen_comunic1.is_comunic.accion_retorno = "Finalizada" THEN
		u_avi_1002_nu.fnu_asignar_brigada_avi( iuo_gen_comunic1.is_comunic.longval2, il_nro_aviso)
		u_avi_2004_pr.fpr_act_avi_por_fin_ot(il_nro_aviso, il_nro_instalacion,il_ind_cli_imp, il_ind_peligro)
	END IF

	DESTROY u_avi_1002_nu
	DESTROY u_avi_2004_pr
end choose	





//fw_buscar()
// Si se activa esta ventana se oculta la grafica.
if isvalid(this) then 
if gb_bdi and gb_hay_sesion then 
	gl_instalacion_afectada = 0
	fg_mostrar(false)
end if 	
end if 

SetPointer(Arrow!)

end event

event ue_arch_imprimir;call super::ue_arch_imprimir;
IF dw_lista_tareas.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

//dw_1.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_1
lst_impresion.pdw_lista = dw_lista_tareas
lst_impresion.compuesto = false
gf_impresion_preliminar (lst_impresion, True, 0)

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6208_consulta_ot
end type

type d_filtro_tareas from datawindow within w_6208_consulta_ot
integer x = 2085
integer y = 96
integer width = 1367
integer height = 248
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_bri_2016_pr_prop_cons_ots"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;integer li_valor_estado, li_valor_tarea
datawindowchild dwc_estado
string ls_filtro

//parent.triggerEvent("ue_resetear_datos")
This.AcceptText()
li_valor_estado=This.object.pi_estado[1]


CHOOSE CASE dwo.name
	CASE "pi_tareas"
		li_valor_tarea = d_filtro_tareas.GetItemNumber(row,'pi_tareas')
		
		this.getchild ('pi_estado',dwc_estado)
		dwc_estado.setTransObject(sqlca)
		dwc_estado.retrieve()
		
		IF li_valor_tarea = 2 THEN
			ls_filtro = 'codigo <> '+ string (fgci_estado_anulado)
		ELSE
			ls_filtro = ''
		END IF

		dwc_estado.setFilter(ls_filtro)
		dwc_estado.filter()		

END CHOOSE

return
end event

event constructor;//datawindowchild ddw_estado_ot_t
//
//This.GetChild('pi_estado', ddw_estado_ot_t)
//ddw_estado_ot.ShareData(ddw_estado_ot_t)
//
//return 1
end event

type gb_2 from groupbox within w_6208_consulta_ot
integer x = 2011
integer y = 32
integer width = 1458
integer height = 656
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Criterio de Selecci$$HEX1$$f300$$ENDHEX$$n"
end type

type cbx_1 from checkbox within w_6208_consulta_ot
integer x = 206
integer y = 240
integer width = 366
integer height = 76
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "F. Inicio"
boolean lefttext = true
end type

event clicked;if this.checked = true then
	dw_fecha_inicio.fnu_habilitar_f_desde(false)
	dw_fecha_inicio.fnu_habi_f_hasta(false)
else
	dw_fecha_inicio.fnu_habilitar_f_desde(true)
	dw_fecha_inicio.fnu_habi_f_hasta(true)
end if
end event

type cbx_2 from checkbox within w_6208_consulta_ot
integer x = 206
integer y = 340
integer width = 366
integer height = 76
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "F. Fin"
boolean lefttext = true
end type

event clicked;if this.checked = true then
	dw_fecha_fin.fnu_habilitar_f_desde(false)
	dw_fecha_fin.fnu_habi_f_hasta(false)
else
	dw_fecha_fin.fnu_habilitar_f_desde(true)
	dw_fecha_fin.fnu_habi_f_hasta(true)
end if
end event

type dw_fecha_inicio from ue_gen_filtro_fechas within w_6208_consulta_ot
integer x = 581
integer y = 164
integer width = 1006
integer height = 176
integer taborder = 0
boolean bringtotop = true
end type

event rbuttondown;IF cbx_1.Checked = true THEN
	m_der_fechas lm_gestion_avi
	lm_gestion_avi = CREATE m_der_fechas
	m_der_fechas.idw_dw=this
	m_der_fechas.ii_tipo_uo =2
	lm_gestion_avi.PopMenu(PointerX(), PointerY()+600)
	destroy lm_gestion_avi
END IF

end event

type dw_fecha_fin from ue_gen_filtro_fechas within w_6208_consulta_ot
integer x = 581
integer y = 264
integer width = 1006
integer height = 176
integer taborder = 0
end type

event rbuttondown;IF cbx_2.Checked = true THEN
	m_der_fechas lm_gestion_avi
	lm_gestion_avi = CREATE m_der_fechas
	m_der_fechas.idw_dw=this
	m_der_fechas.ii_tipo_uo =2
	lm_gestion_avi.PopMenu(PointerX(), PointerY()+600)
	destroy lm_gestion_avi
END IF

end event

type gb_3 from groupbox within w_6208_consulta_ot
integer x = 169
integer y = 124
integer width = 1440
integer height = 352
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:"
end type

type dw_1 from datawindow within w_6208_consulta_ot
boolean visible = false
integer x = 219
integer y = 928
integer width = 3072
integer height = 704
integer taborder = 50
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_6208_consulta_ot
integer x = 151
integer y = 796
integer width = 3319
integer height = 980
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "OT~'s / Tareas"
end type

type dw_lista_tareas from u_bri_2017_pr_datos_cons_ot within w_6208_consulta_ot
integer x = 210
integer y = 896
integer width = 3195
integer height = 800
integer taborder = 10
boolean bringtotop = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;integer li_otra_consulta = -1
datetime ldt_f_actual
integer li_result_func
long ll_nro_ot

if row > 0 then
	
	if this.object.nro_incidencia[row] <> 0  then
		gnv_msg.f_mensaje( "AM41",string(this.object.nro_incidencia[row]),"",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Para gestionar esta OT deber$$HEX2$$e1002000$$ENDHEX$$hacerlo desde Incidencias.")
		SetPointer(Arrow!)
		return
	end if
	
	if this.object.ind_trabajo[row]=1 and 	this.object.est_ot[row] <  3 then	

		SetPointer(HourGlass!)
		fgnu_resetear_s_comunicaciones(gu_comunic1)
			
		// Se crea el objeto con el que se va a recibir la estructura
		// de la ventana que se llama (la de Asignacion de brigada)
					
		// Se carga la estructura con los valores para la
		// llamada a la ventana Asignacion de brigada
				
		gu_comunic1.is_comunic.programa_llamante = "w_6208_consulta_ot"
				
		IF this.GetItemNumber(row, "nro_ot") <>  0 THEN
			
			if this.object.nro_instalacion[row] = 0  then
				ii_tipo_llamada = 1 // tipo de ot aviso
				il_nro_aviso= this.object.nro_aviso[row]
				// GNU 21-6-2007. Mejora 1/339347
				// GNU 4-5-2006. Mejora 1/339429
//				select nro_ot, f_alta, nro_instalacion, ind_cli_imp, ind_peligro
//				into :gu_comunic1.is_comunic.longval2, :gu_comunic1.is_comunic.datval1, :il_nro_instalacion, :il_ind_cli_imp, :il_ind_peligro
//				from gi_avisos
//				where nro_aviso = :il_nro_aviso;
				// FIN GNU
				select nro_ot, f_alta, nro_instalacion, ind_cli_imp, ind_peligro, nro_centro, nro_cmd, nro_mesa, f_actual
				into :gu_comunic1.is_comunic.longval2, :gu_comunic1.is_comunic.datval1, :il_nro_instalacion, :il_ind_cli_imp, :il_ind_peligro, :gu_comunic1.is_comunic.intval3, :gu_comunic1.is_comunic.intval4, :gu_comunic1.is_comunic.intval5, :ldt_f_actual
				from gi_avisos
				where nro_aviso = :il_nro_aviso;
				li_result_func = gnu_u_transaction.uf_bloquea_avisos(ldt_f_actual, fgci_bloq_ot_suministro, il_nro_aviso)
				// FIN GNU
			else
				ii_tipo_llamada = 2 // tipo de ot instalaci$$HEX1$$f300$$ENDHEX$$n
				il_nro_instalacion = this.object.nro_instalacion[row]
				
				// GNU 2-7-2007. Mejora 1/339347
				select nro_centro, nro_cmd, nro_mesa
				INTO :gu_comunic1.is_comunic.intval3, :gu_comunic1.is_comunic.intval4, :gu_comunic1.is_comunic.intval5
				from sgd_instalacion
				WHERE nro_instalacion= :il_nro_instalacion 
					and bdi_job=0;
				// FIN GNU
			end if
			if gu_perfiles.of_acceso_perfil(gi_perfil,'CONS_OT','ACC_MANTEN')=1 then 
//			
//					Select count(*) 
//					into :li_otra_consulta
//					from gi_avisos_instalacion
//					where est_aviso=1 and nro_instalacion=:il_nro_instalacion;
//								
//					if (li_otra_consulta=0) then
						gu_comunic1.is_comunic.accion_llamada = "Modificacion"
//					else
//						gu_comunic1.is_comunic.accion_llamada = "Consulta"
//					end if 
//				else
//					gu_comunic1.is_comunic.accion_llamada = "Consulta"
//				end if 
			// FIN GNU
			// GNU 3-7-2007. Mejora 23 (avisos)
			if this.object.nro_instalacion[row] = 0  then
				gnu_u_transaction.uf_desbloquea_avisos(il_nro_aviso,1)
			end if
			ll_nro_ot=this.GetItemNumber(row, "nro_ot")
			li_result_func=gnu_u_transaction.uf_lock(parent, "GI_OT", "NRO_OT=" + string(ll_nro_ot),fgci_bloqueo_ot,ll_nro_ot)
		
			if li_result_func < 0 then
				gu_comunic1.is_comunic.accion_llamada = "Consulta"
			end if
			// FIN GNU
			else
				gu_comunic1.is_comunic.accion_llamada = "Consulta"
			end if
			gu_comunic1.is_comunic.longval2 = this.GetItemNumber(row,"nro_ot")//ii_nro_ot
			// GNU 21-6-2007. Mejora 1/339347 
			IF not fg_verifica_parametro("ambito ot") THEN
				gu_comunic1.is_comunic.intval3 = gi_nro_centro
				gu_comunic1.is_comunic.intval4 = gi_nro_cmd
				gu_comunic1.is_comunic.intval5 = gi_nro_puesto	
			END IF

		END IF
		
		//LSH INI 08/09/2013 evolutivo DEO12-00000263
		gl_tipo_aviso = il_nro_aviso
		//LSH FIN 08/09/2013 evolutivo DEO12-00000263
		
		//gu_comunic1.is_comunic.datval1 = fw_o_f_primer_aviso()
		OPEN(w_6201_asignacion_de_brigada)
		// GNU 3-7-2007. Mejora 23 (avisos)
		
		gnu_u_transaction.uf_commit( parent, "GI_OT", "NRO_OT=" + STRING(ll_nro_ot),fgci_bloqueo_ot,ll_nro_ot)
		// FIN GNU
		Parent.TriggerEvent("ue_retrieve")

	elseif this.object.ind_trabajo[row]=2 then
		messagebox("Aviso","Para gestionar una Tarea deber$$HEX2$$e1002000$$ENDHEX$$hacerlo desde Brigadas")
	end if 
	

end if
end event

event clicked;call super::clicked;int li_ind_trabajo
long ll_nro_aviso

yield()	

if row> 0 then
	this.selectrow(fila_ant,False)
	fila_ant = row
	this.selectrow(row,true)
	ib_es_calle=false
	gl_instalacion_afectada = this.getitemnumber(row,"nro_instalacion")
	// SI NO HAY INSTALACION AFECTADA OBTENEMOS LA CALLE
	
	if isnull(gl_instalacion_afectada) or gl_instalacion_afectada=0 or gl_instalacion_afectada=99999998 then
   	ll_nro_aviso = this.getitemnumber(row,"nro_aviso")
		if isnull(ll_nro_aviso) or (ll_nro_aviso=0) then 
			gl_instalacion_afectada=0
		else
		 SELECT "GI_AVISOS"."COD_CALLE"  
   		 INTO :gl_instalacion_afectada
	    FROM "GI_AVISOS"  
		 WHERE "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso;
			 if isnull(gl_instalacion_afectada) then 
				gl_instalacion_afectada=0
			else
				ib_es_calle=true
			 end if
		end if
	end if
	
	
	if gb_bdi then 
		if gb_hay_sesion  then
	
	li_ind_trabajo = this.getitemnumber(row,"IND_TRABAJO")
	if li_ind_trabajo=1 then
      md_lista_ot.m_consultar.m_grafico.m_localizacion.enabled=true
		md_lista_ot.m_consultar.m_grafico.m_quitarblink.enabled=true
	else
      md_lista_ot.m_consultar.m_grafico.m_localizacion.enabled=false
		md_lista_ot.m_consultar.m_grafico.m_quitarblink.enabled=false
	end if
end if
end if
end if

end event

event ue_key_down;/////////////////////////////////////////////////////
//	Permite borrar o agregar incidencias desde el teclado
//	dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row 

IF keyflags = 0 THEN  // Controlo que no haya presionado
							// control ni shift
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
		this.selectrow(ll_row - 1,true)

	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		this.selectrow(ll_row + 1,true)
	
	END IF

END IF
end event

event retrievestart;call super::retrievestart;this.show()
end event

event constructor;call super::constructor;this.show()
end event

event scrollvertical;call super::scrollvertical;// GNU 1-6-2007. Mejora 1/424517
sle_1.text= string(dw_lista_tareas.rowcount())
// FIN GNU	
end event

type d_filtro_ots from datawindow within w_6208_consulta_ot
integer x = 2085
integer y = 320
integer width = 1367
integer height = 316
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "d_brigadas_contratas_2"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;string ls_columna
datawindowchild dwc_brigadas, dwc_contratas

ls_columna=This.getcolumnname()
if (ls_columna= "t_desde" or ls_columna="t_hasta") and Long(data)<0 then
		MessageBox("Aviso", "El n$$HEX1$$fa00$$ENDHEX$$mero OT no puede ser menor que 0")
else
	if ls_columna= 'pi_brigadas' and Long(data)<>0 then
		This.SetTabOrder("pi_contratas",0)
		This.Modify("pi_contratas.background.color=" + gs_gris)
	elseif ls_columna= 'pi_brigadas' and Long(data)=0 then
		This.SetTabOrder("pi_contratas",20)
		This.Modify("pi_contratas.background.color=" + gs_blanco)
		d_filtro_OTs.getchild('pi_contratas',dwc_contratas)
		dwc_contratas.settransobject(sqlca)
		dwc_contratas.retrieve()
		dwc_contratas.InsertRow(1)
		dwc_contratas.SetItem(1,'nombre','<Todas>')
		dwc_contratas.SetItem(1,'nro_contrata',0)
	elseif ls_columna= 'pi_contratas' and Long(data)<>0 then
		This.SetTabOrder("pi_brigadas",0)
		This.Modify("pi_brigadas.background.color=" + gs_gris)
	elseif ls_columna= 'pi_contratas' and Long(data)=0 then
		This.SetTabOrder("pi_brigadas",10)
		This.Modify("pi_brigadas.background.color=" + gs_blanco)
		d_filtro_OTs.getchild('pi_brigadas',dwc_brigadas)
		dwc_brigadas.settransobject(sqlca)
		dwc_brigadas.retrieve()
		dwc_brigadas.InsertRow(1)
		dwc_brigadas.SetItem(1,'nombre','<Todas>')
		dwc_brigadas.SetItem(1,'nro_brigada',0)
	end if	
end if	





end event

event doubleclicked;int li_nulo
setnull(li_nulo)

if dwo.Name = 't_desde_t' then
	this.object.t_desde[row] = li_nulo
	this.object.t_hasta[row]= li_nulo
//	d_filtro_aviso.SetColumn ('nro_incid_desde')
//	d_deteccion.modify("desde.background.color ="+gs_blanco)
//	d_deteccion.modify("hasta.background.color ="+gs_blanco)
//	d_deteccion.enabled = true
end if
end event

type sle_1 from singlelineedit within w_6208_consulta_ot
integer x = 2853
integer y = 692
integer width = 183
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "0"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type cb_total from commandbutton within w_6208_consulta_ot
integer x = 3072
integer y = 704
integer width = 78
integer height = 76
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "T"
end type

event clicked;string ls_select
long ll_row, ll_contador

dw_lista_tareas.Object.DataWindow.Retrieve.AsNeeded='No'
ll_row = dw_lista_tareas.RowCount()
sle_1.text=string(ll_row)
dw_lista_tareas.Object.DataWindow.Retrieve.AsNeeded='Yes'
end event

type st_8 from statictext within w_6208_consulta_ot
integer x = 2085
integer y = 708
integer width = 731
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Registros Seleccionados:"
boolean focusrectangle = false
end type


HA$PBExportHeader$w_6201_asignacion_de_brigada.srw
$PBExportComments$Ventana usada para la asignaci$$HEX1$$f300$$ENDHEX$$n de brigadas.
forward
global type w_6201_asignacion_de_brigada from w_sgigenerica
end type
type d_lista_brigadas_ot from u_bri_2002_pr_list_brigadas_ot within w_6201_asignacion_de_brigada
end type
type bmp_brigada_responsable from picture within w_6201_asignacion_de_brigada
end type
type dw_bri_ant from datawindow within w_6201_asignacion_de_brigada
end type
type dw_control_brigadas from datawindow within w_6201_asignacion_de_brigada
end type
type dw_brigadas_calendario_rango from datawindow within w_6201_asignacion_de_brigada
end type
type rb_1 from radiobutton within w_6201_asignacion_de_brigada
end type
type dw_lista_contratas from u_gen_0002_pr_generico within w_6201_asignacion_de_brigada
end type
type tab_lista_brigadas from u_tab_brigadas_avisos within w_6201_asignacion_de_brigada
end type
type tab_lista_brigadas from u_tab_brigadas_avisos within w_6201_asignacion_de_brigada
end type
type d_crit_seleccion from datawindow within w_6201_asignacion_de_brigada
end type
type d_datos_ot from u_ot_2001_pr_form_orden_de_trabajo within w_6201_asignacion_de_brigada
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_6201_asignacion_de_brigada
end type
type rb_2 from radiobutton within w_6201_asignacion_de_brigada
end type
type gb_2 from groupbox within w_6201_asignacion_de_brigada
end type
type gb_1 from groupbox within w_6201_asignacion_de_brigada
end type
end forward

global type w_6201_asignacion_de_brigada from w_sgigenerica
integer x = 9
integer y = 564
integer width = 3584
integer height = 1572
string title = "OPEN SGI - Ordenes de Trabajo"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
event ue_validar_grabar pbm_custom20
event ue_armar_sql ( )
event pressdwn pbm_dwnkey
d_lista_brigadas_ot d_lista_brigadas_ot
bmp_brigada_responsable bmp_brigada_responsable
dw_bri_ant dw_bri_ant
dw_control_brigadas dw_control_brigadas
dw_brigadas_calendario_rango dw_brigadas_calendario_rango
rb_1 rb_1
dw_lista_contratas dw_lista_contratas
tab_lista_brigadas tab_lista_brigadas
d_crit_seleccion d_crit_seleccion
d_datos_ot d_datos_ot
dw_ambito dw_ambito
rb_2 rb_2
gb_2 gb_2
gb_1 gb_1
end type
global w_6201_asignacion_de_brigada w_6201_asignacion_de_brigada

type variables
u_generico_comunicaciones lu_comunic
u_ot_2001_nu_form_orden_de_trabajo iu_2001_nu_ot
u_ot_2001_rn_form_orden_de_trabajo iu_2001_rn_ot
u_bri_2001_nu_form_ingreso_brigada iu_2001_nu_bri
u_bri_2002_nu_lista_brigadas_ot iu_2002_nu_bri
u_bri_2002_rn_lista_brigadas_ot iu_2002_rn_bri
u_bri_2004_nu_lista_brigadas iu_2004_nu_bri
u_bri_2004_rn_lista_brigadas iu_2004_rn_bri
u_bri_2020_nu_crit_seleccion iu_2020_nu_bri
int  li_centro
int li_cmd
int li_puesto
int i_grabo
datetime idt_fec_deteccion
//////     ORDEN DE TRABAJO    ////////// 
int click_row, click_row_brig_ot
int i_grabo_ot
int ii_brigada_resp
// variable para las brigadas
// 0 fuera de turno        1 en turno
int ii_turno = 1
boolean ib_cambios_ot = False
datetime ldt_fecha_eb
long ll_estado_oper
long il_nro_aviso
long il_nro_instal
boolean ib_tipo
boolean ib_valido
int il_segur[]
int il_conta
boolean ib_devolver_alta=false
string is_contrata = 'BR', sql_contratas=""

u_gen_0000_nu_filtro iu_filtro //Para dropdown
u_bri_0000_rn_validar_brigada iu_validar_brigada
boolean ib_open = TRUE //Estamos en open event

string is_select_no_disp=''
long il_sesion_operacion
end variables

forward prototypes
public function integer fw_crear_objetos ()
public function integer fw_close_objetos ()
public function integer fnu_liberar_brigadas ()
public function integer frn_validar_quitar_brigada (ref datawindow pd_dw, long pl_nro_brigada)
public subroutine wf_loadant ()
public subroutine wf_cambiar_ot_tipo (string mode)
public function boolean fw_equipo_disponible (long pl_nro_equipo, string ps_tipo_equipo)
public function integer wf_valida_drag_brigada_no_disp (long pl_nro_brigada)
public function integer wf_validar_fecha_fin ()
public function integer wf_bloquear_brigadas_asignadas (integer pi_ind_bloqueo)
public function integer fw_desbloq_brig_fin_trab ()
public subroutine fw_deshabilitar_campos (datawindow pdw_datos)
public function integer fw_finalizar_ot ()
public function boolean fw_ot_de_operaciones (long pl_nro_ot)
public subroutine fw_deshabilitartodaventana ()
public function boolean fw_hayotrabrigadatrabajando (long al_nro, datawindow adw_datos)
end prototypes

event ue_armar_sql();//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
// 23/02/2000     DSA				Introducir las contratas
//
////////////////////////////////////////////////////////////////////////////////////////////////

string ls_select,ls_select_no_disp
string ls_where, ls_where_no_disp
string ls_clausula1,ls_clausula2,ls_modificacion1,ls_modificacion2, ls_sqlcontratas
int li_turno,li_tipo
int li_nro_brigadas = 0
string ls_retorno, ls_filtro_ambito_brig, ls_filtro_ambito_cont
int li_rows_bri //DBE
int li_counter //DBE
DATETIME ldt_fecha_turno
long ll_zona, ll_cmd, ll_sector

ls_filtro_ambito_brig=""
ls_filtro_ambito_cont=""

ll_zona = dw_ambito.getitemnumber(1,"nro_centro")
ll_cmd = dw_ambito.getitemnumber(1,"nro_cmd") 
ll_sector = dw_ambito.getitemnumber(1,"nro_mesa")

IF ll_zona > 0 THEN
	ls_filtro_ambito_brig = " AND GI_BRIGADA.NRO_CENTRO = " + string(ll_zona)
	ls_filtro_ambito_cont = " AND GI_CONTRATAS.NRO_CENTRO = " + string(ll_zona)
END IF
IF ll_cmd > 0 THEN
	ls_filtro_ambito_brig = ls_filtro_ambito_brig + " AND GI_BRIGADA.NRO_CMD = " + string(ll_cmd)
	ls_filtro_ambito_cont = ls_filtro_ambito_cont + " AND GI_CONTRATAS.NRO_CMD = " + string(ll_cmd)
END IF
IF ll_sector > 0 THEN
	ls_filtro_ambito_brig = ls_filtro_ambito_brig + " AND GI_BRIGADA.NRO_MESA = " + string(ll_sector)
	ls_filtro_ambito_cont = ls_filtro_ambito_cont + " AND GI_CONTRATAS.NRO_MESA = " + string(ll_sector)
END IF

// DSA INI 23/02/2000
//if is_contrata = 'CO' THEN
	IF sql_contratas = "" THEN
		sql_contratas = dw_lista_contratas.GetSqlSelect()	
	END IF
	ls_sqlcontratas = sql_contratas
	
	li_tipo=d_crit_seleccion.object.pi_tipo_brig[1]
	//d_lista_brigadas_ot.SetFilter("est_brigada < 3 and tipo = 'Cont.'")
	//d_lista_brigadas_ot.Filter()
	//No incluir las contratas que estan trabajando
   ls_where =ls_where + ' AND NRO_CONTRATA not in (-1'
	
	for li_counter	= 1 to d_lista_brigadas_ot.RowCount()		
		if d_lista_brigadas_ot.object.est_brigada[li_counter] < 3 AND &
			d_lista_brigadas_ot.object.tipo[li_counter] = "Cont." then// DSA 27/03/2000			
			ls_where =ls_where + ',' + &
				string(d_lista_brigadas_ot.getitemnumber(li_counter,'nro_brigada'))
		end if
	next	
	
   ls_where =ls_where +")" + ls_filtro_ambito_cont
	
	//d_lista_brigadas_ot.SetFilter("")
	//d_lista_brigadas_ot.Filter()
	//dw_seleccion.AcceptText()
	//li_tipo = dw_seleccion.object.codigo[1]
	
	if li_tipo <> 0 then  
		ls_where = ls_where + " AND ( GI_CONTRATAS.TIPO =" + STRING(LI_TIPO) + ") " 
	end if
	
	ls_where =	dw_lista_contratas.Modify('DataWindow.Table.Select="' + ls_sqlcontratas + ls_where + '"')

	
//else

// FORMAR ARMAR SQL PARA BRIGADAS DISPONIBLES

ls_select = "SELECT DISTINCT GI_BRIGADA.NOMBRE," + &   
            "GI_BRIGADA.NRO_MESA, " + &
            "GI_BRIGADA.NRO_CMD, " + &  
            "GI_BRIGADA.NRO_CENTRO, " + &   
            "GI_BRIGADA.IND_DISPONIBLE, "  + &   
            "GI_BRIGADA.MOVIL," + &   
            "GI_BRIGADA.NRO_BRIGADA ," + &   
            "GI_BRIGADA.FREC_RADIO , "+ &   
            "GI_BRIGADA.IND_PREVISTO, "  + & 
				"GI_BRIGADA.TIP_BRIGADA "  + & 
            " FROM GI_BRIGADA"

//ls_where =" WHERE ( GI_BRIGADA.NRO_CENTRO = :pi_zona ) AND " + &  
//          "( GI_BRIGADA.NRO_CMD = :pi_cmd ) AND " + &  
//          "( GI_BRIGADA.NRO_MESA = :pi_sector ) AND " + &
//          "( GI_BRIGADA.IND_DISPONIBLE = 1 and GI_BRIGADA.NRO_BRIGADA not in (select nro_brigada from gi_brigada_ot where nro_ot = :pi_nro_ot AND gi_brigada_ot.est_brigada <> 3))"

ls_where =" WHERE ( GI_BRIGADA.IND_DISPONIBLE = 1 and GI_BRIGADA.NRO_BRIGADA not in (select nro_brigada from gi_brigada_ot where nro_ot = :pi_nro_ot AND gi_brigada_ot.est_brigada <> 3))"

IF d_crit_seleccion.GetItemNumber(1, 'pi_brigadas_en_turno') = 1 THEN
	ldt_fecha_turno = d_crit_seleccion.GetItemDatetime(1, 'pdt_fecha_turno')
 
 	ls_select = ls_select + ",GI_BRIGADAS_CAL "
	ls_where = ls_where + " AND GI_BRIGADA.NRO_BRIGADA = GI_BRIGADAS_CAL.NRO_BRIGADA " + &
			 " AND gi_brigadas_cal.fecha_inicio <= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
			 " AND gi_brigadas_cal.fecha_fin >= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
			 " AND TO_CHAR(gi_brigadas_cal.hora_desde,'HH24:MI:SS') <= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') " + &
			 " AND TO_CHAR(gi_brigadas_cal.hora_hasta,'HH24:MI:SS') >= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') "
END IF			


//IF d_lista_brigadas_ot.RowCount() > 0 THEN
//	d_lista_brigadas_ot.SetFilter("est_brigada < 3 and tipo = 'Brig.'")
//	d_lista_brigadas_ot.Filter()
//END IF

li_rows_bri=d_lista_brigadas_ot.RowCount( )
if li_rows_bri>0 and li_rows_bri<100 then
        
        ls_where =ls_where + ' AND GI_BRIGADA.NRO_BRIGADA not in (-1'
        for li_counter=1 to li_rows_bri
					 if d_lista_brigadas_ot.object.est_brigada[li_counter] < 3 AND &
					 	 d_lista_brigadas_ot.object.tipo[li_counter] = 'Brig.' then// DSA 27/03/2000			
					 	
	                ls_where =ls_where + "," + string(d_lista_brigadas_ot.getitemnumber(li_counter,'nro_brigada'))
						 li_nro_brigadas++
			       end if						 
        next
        ls_where =ls_where +")"
end if

//IF d_lista_brigadas_ot.RowCount() > 0 THEN
//	d_lista_brigadas_ot.SetFilter("")
//	d_lista_brigadas_ot.Filter()
//END IF

d_crit_seleccion.accepttext()
li_tipo=d_crit_seleccion.object.pi_tipo_brig[1]

//ls_select_no_disp = is_select_no_disp
// FORMAR ARMAR SQL PARA BRIGADAS NO DISPONIBLES

ls_select_no_disp= "SELECT DISTINCT GI_BRIGADA.NRO_BRIGADA, " + &  
         			 "GI_BRIGADA.NRO_MESA, " + &   
         			 "GI_BRIGADA.NRO_CMD, " + &   
         			 "GI_BRIGADA.NRO_CENTRO, " + &   
         			 "GI_BRIGADA.IND_DISPONIBLE," + &   
         			 "GI_BRIGADA.MOVIL," + &   
        				 "GI_BRIGADA.NOMBRE," + & 
						 "GI_BRIGADA.TIP_BRIGADA," + & 
        				 "SGD_INCIDENCIA.EST_ACTUAL," + &   
        				 "SGD_INSTALACION.NOM_INSTALACION," + &   
       				 "SGD_INCIDENCIA.CCLI_AFEC," + &   
        				 "GI_BRIGADA_OT.NRO_OT," + &   
        				 "SGD_INCIDENCIA.TIP_INCIDENCIA," + &   
         			 "SGD_INCIDENCIA.NRO_INCIDENCIA," + &   
        				 "SGD_INCIDENCIA.F_DETECCION," + &   
        				 "GI_BRIGADA_OT.F_DESDE," + &   
        				 "GI_BRIGADA.FREC_RADIO," + &   
        				 "GI_OT.NRO_INSTALACION,"  + & 
					 "GI_OT.IND_TRABAJO, " + &
					" FGNU_EST_INC2(	SGD_INCIDENCIA.EST_ACTUAL ,SGD_INCIDENCIA.ALCANCE,SGD_INCIDENCIA.TIP_INCIDENCIA)      est_act, " + &
					" Fgnu_brigada_bitmap(	GI_BRIGADA_OT.NRO_OT, GI_OT.IND_TRABAJO,SGD_INCIDENCIA.NRO_INCIDENCIA ,GI_OT.NRO_INSTALACION , SGD_INCIDENCIA.TIP_INCIDENCIA , SGD_INCIDENCIA.ALCANCE ) bitmap, " +&
					" fgnu_asignacion_ot( gi_ot.nro_aviso , gi_ot.nro_incidencia , gi_ot.nro_instalacion , gi_avisos.nom_calle , gi_avisos.num_puerta , gi_avisos.duplicador , gi_avisos.ref_dir , SGD_INCIDENCIA.desc_incidencia , sgd_instalacion.nom_instalacion ) " +&
					"	FROM " + &
						 " GI_OT, " + &
						 " GI_BRIGADA_OT, " + &
						 " SGD_INSTALACION, " + &
						 " SGD_INCIDENCIA, " + &
						 " GI_BRIGADA, " + &
						 " GI_AVISOS "
							
ls_where_no_disp= " WHERE gi_brigada.nro_brigada = gi_brigada_ot.nro_brigada and " + &
  						" gi_brigada_ot.nro_ot = gi_ot.nro_ot and " + &
						" gi_ot.nro_instalacion = sgd_instalacion.nro_instalacion (+) and " + &
						" gi_ot.nro_ot = SGD_incidencia.ot (+) and " + &
						" gi_brigada_ot.est_brigada = 2 AND " + &
						" ( gi_brigada_ot.f_hasta is Null) AND " + &
						" GI_BRIGADA.IND_DISPONIBLE = 0 AND " + &
						" GI_BRIGADA_OT.EST_BRIGADA <> 3 AND " + &
						" GI_AVISOS.NRO_AVISO(+) = GI_OT.NRO_AVISO "

IF d_crit_seleccion.GetItemNumber(1, 'pi_brigadas_en_turno') = 1 THEN
	ls_select_no_disp = ls_select_no_disp + ",GI_BRIGADAS_CAL "
	ls_where_no_disp = ls_where_no_disp + " AND GI_BRIGADA.NRO_BRIGADA = GI_BRIGADAS_CAL.NRO_BRIGADA " + &
			 " AND gi_brigadas_cal.fecha_inicio <= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
			 " AND gi_brigadas_cal.fecha_fin >= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
			 " AND TO_CHAR(gi_brigadas_cal.hora_desde,'HH24:MI:SS') <= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') " + &
			 " AND TO_CHAR(gi_brigadas_cal.hora_hasta,'HH24:MI:SS') >= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') "
END IF	

if li_tipo <> 0 then
        ls_where = ls_where + " AND ( GI_BRIGADA.TIP_BRIGADA =" + STRING(LI_TIPO) + ") "
        ls_where_no_disp = ls_where_no_disp + " AND ( GI_BRIGADA.TIP_BRIGADA =" + STRING(LI_TIPO) + ") "
end if

ls_clausula1= ls_select + ls_where + ls_filtro_ambito_brig 
ls_clausula2= ls_select_no_disp + ls_where_no_disp + ls_filtro_ambito_brig

ls_modificacion1="Datawindow.table.select=~" "+ls_clausula1 + " ~" "
ls_modificacion2="Datawindow.table.select=~" "+ls_clausula2 + " ~" "

ls_retorno=tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.modify(ls_modificacion1)
ls_retorno=tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.modify(ls_modificacion2)
//end if
end event

public function integer fw_crear_objetos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_crear_objetos
// 
// Objetivo: Realiza el create de los objetos utilizados en la ventada
//
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada:  --
//      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//
//
////////////////////////////////////////////////////////////////////////////////////////////////

                                                        // Creo el objeto de comunicaciones locales
lu_comunic = CREATE u_generico_comunicaciones

                                                        // Creo los objetos de trabajo
//iu_2001_nu_inc        = CREATE u_inc_2001_nu_form_inf_ot
iu_2001_nu_ot           = CREATE u_ot_2001_nu_form_orden_de_trabajo
iu_2001_rn_ot           = CREATE u_ot_2001_rn_form_orden_de_trabajo
//iu_2001_nu_inf_inc = CREATE u_inc_2001_nu_form_inf_ot
//iu_2008_nu_inf_avi = CREATE u_avi_2008_nu_form_inf_ot
//iu_2001_nu_inf_ins = CREATE u_ins_2001_nu_form_instalaciones
iu_2001_nu_bri  = CREATE u_bri_2001_nu_form_ingreso_brigada
iu_2002_nu_bri          = CREATE u_bri_2002_nu_lista_brigadas_ot
iu_2002_rn_bri          = CREATE u_bri_2002_rn_lista_brigadas_ot
iu_2004_nu_bri          = CREATE u_bri_2004_nu_lista_brigadas
iu_2004_rn_bri          = CREATE u_bri_2004_rn_lista_brigadas
iu_2020_nu_bri          = CREATE u_bri_2020_nu_crit_seleccion
iu_filtro = Create u_gen_0000_nu_filtro // DSA 23/02/2000                         


return 1
end function

public function integer fw_close_objetos ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_close_objetos
// 
// Objetivo: Realiza el close de los objetos utilizados en la ventada
//
//      Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada:  --
//      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//
//
////////////////////////////////////////////////////////////////////////////////////////////////

                                                                                //DESTRUCCION DE OBJETOS
DESTROY lu_comunic 
//DESTROY iu_2001_nu_inc 
DESTROY iu_2001_nu_ot 
DESTROY iu_2001_rn_ot 
//DESTROY iu_2001_nu_inf_inc 
//DESTROY iu_2008_nu_inf_avi
//DESTROY iu_2001_nu_inf_ins
DESTROY iu_2001_nu_bri
DESTROY iu_2002_nu_bri
DESTROY iu_2002_rn_bri
DESTROY iu_2004_nu_bri
DESTROY iu_2004_rn_bri
DESTROY iu_2020_nu_bri

return 1
end function

public function integer fnu_liberar_brigadas ();////////////////////////
//
//      Libera las brigadas que finalizaron tareas
//      siempre y cuando no esten asociadas a otra OT
//
//
//      AFS             02/10/97                
//
///////////////////

datetime ld_desde,ld_hasta
int li_contador
//int li_cont, li_ind_disponible
long ll_nro_brigada
//int li_fila_ant
int li_disponible
int li_no_disponible
d_lista_brigadas_ot.accepttext()
//int li_total_filas_ant
//
li_disponible = fgci_disponible
li_no_disponible = fgci_no_disponible
//
//FOR li_cont = 1 TO d_lista_brigadas_ot.RowCount()
//      ll_nro_brigada = d_lista_brigadas_ot.GetItemNumber(li_cont,"nro_brigada")
//      
//      li_fila_ant = dw_bri_ant.Find("nro_brigada="+string(ll_nro_brigada),1,dw_bri_ant.RowCount())
//      
//      // Si estaba asignada al abrir la ventana
//      IF li_fila_ant > 0 THEN
//              // Si hab$$HEX1$$ed00$$ENDHEX$$a finalizado tareas
//              IF NOT IsNull(dw_bri_ant.GetItemDateTime(li_fila_ant,"f_hasta")) THEN
//                      // Si ahora no finalizo tareas (le borre la fecha hasta)
//                      IF IsNull(d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_hasta")) and &
//                              not IsNull(d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_desde")) THEN
//
//                              UPDATE "GI_BRIGADA"  
//                              SET "IND_DISPONIBLE" = :li_no_disponible  
//                              WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;
//
//                      END IF
//              // Si no hab$$HEX1$$ed00$$ENDHEX$$a finalizado tareas
//              ELSE
//                      // Si ahora finaliz$$HEX2$$f3002000$$ENDHEX$$tareas
//                      IF NOT IsNull(d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_hasta")) THEN
//
//                              UPDATE "GI_BRIGADA"  
//                              SET "IND_DISPONIBLE" = :li_disponible  
//                              WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;
//
//                      END IF
//                      
//              END IF          // Fin de hab$$HEX2$$e1002000$$ENDHEX$$finalizado tareas
//              
//      // Si no existia al abrir la ventana    
//      ELSE            
//              // Si ahora finaliz$$HEX2$$f3002000$$ENDHEX$$tareas
//              IF NOT IsNull(d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_hasta")) THEN
//
//                      UPDATE "GI_BRIGADA"  
//                      SET "IND_DISPONIBLE" = :li_disponible  
//                      WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;
//                      
//              // Si ahora no finaliz$$HEX2$$f3002000$$ENDHEX$$tareas
//              ELSE 
//                      if not IsNull(d_lista_brigadas_ot.GetItemDateTime(li_cont,"f_desde")) THEN
//                              UPDATE "GI_BRIGADA"  
//                                      SET "IND_DISPONIBLE" = :li_no_disponible  
//                                      WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;
//                      end if          
//              END IF
//                      
//      END IF          // Fin de estaba asignada antes
//      
//NEXT
//
//// Proceso las brigadas que estaban asignadas en el momento de abrir
//// la ventana y ahora ya no lo estan, o sea que se borraron de la lista de asignadas
//li_total_filas_ant = dw_bri_ant.RowCount()
//
//IF li_total_filas_ant > 0 THEN
//      FOR li_fila_ant = 1 TO li_total_filas_ant
//              
//              ll_nro_brigada = dw_bri_ant.GetItemNumber(li_fila_ant,"nro_brigada")
//              // Si no esta en las brigadas asignadas actualmente
//              IF d_lista_brigadas_ot.Find("nro_brigada="+string(ll_nro_brigada),1,li_total_filas_ant) < 1 THEN
//                      // Si no hab$$HEX1$$ed00$$ENDHEX$$a finalizado tareas
//                      IF IsNull(dw_bri_ant.GetItemDateTime(li_fila_ant,"f_hasta")) THEN
//                              /////
//                              // disponible
//                              UPDATE "GI_BRIGADA"  
//                              SET "IND_DISPONIBLE" = :li_disponible  
//                              WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;
//                      END IF
//                      
//              END IF  // Fin de no existe actualmente
//      NEXT
//END IF
//
//gnu_u_transaction.uf_commit()
for li_contador=1 to d_lista_brigadas_ot.rowcount()
	IF d_lista_brigadas_ot.object.tipo[li_contador] = 'Brig.' THEN
		ld_desde = d_lista_brigadas_ot.object.f_desde[li_contador]
		ld_hasta = d_lista_brigadas_ot.object.f_hasta[li_contador]
		ll_nro_brigada = d_lista_brigadas_ot.object.nro_brigada[li_contador]
		
		if not isnull(ld_desde) and not isnull(ld_hasta) then
				 UPDATE "GI_BRIGADA"  
							SET "IND_DISPONIBLE" = :li_disponible  
							WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;  
		end if
		if not isnull(ld_desde) and isnull(ld_hasta) then
				 UPDATE "GI_BRIGADA"  
							SET "IND_DISPONIBLE" = :li_no_disponible  
							WHERE "GI_BRIGADA"."NRO_BRIGADA" = :ll_nro_brigada   ;  
		end if
	END IF
next    

gnu_u_transaction.uf_commit(); //DBE 15/12/1999

Return 1
end function

public function integer frn_validar_quitar_brigada (ref datawindow pd_dw, long pl_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: frn_validar_quitar_brigada
// 
// Objetivo: Indica si se puede quitar la brigada segun tenga fecha de fin
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//                      Entrada: datawindow
//                                              nro de brigada
//                      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_row

pd_dw.AcceptText()

ll_row = pd_dw.Find("nro_brigada = "+string(pl_nro_brigada)+"AND ISNULL(f_hasta)",0,pd_dw.RowCount()) 
IF ll_row <> 0 THEN
        Return 1
END IF

Return 0

end function

public subroutine wf_loadant ();// Cargo la dw de brigadas anteriores con las brigadas
// asignadas a la ot en el momento de abrir la ventana.
// Se utiliza para comparar con las brigadas asignadas en el 
// momento de cerrar para asignar o liberar brigadas.


long ll_row,lll;	
dw_bri_ant.Reset()
FOR ll_row = 1 TO d_lista_brigadas_ot.RowCount()
					 lll = dw_bri_ant.InsertRow(0)                
                dw_bri_ant.SetItem(ll_row,"nro_brigada",d_lista_brigadas_ot.GetItemNumber(ll_row,"nro_brigada"))
                dw_bri_ant.SetItem(ll_row,"f_hasta",d_lista_brigadas_ot.GetItemDateTime(ll_row,"f_hasta"))
                dw_bri_ant.SetItem(ll_row,"f_desde",d_lista_brigadas_ot.GetItemDateTime(ll_row,"f_desde"))
NEXT

lll = dw_bri_ant.RowCount()
end subroutine

public subroutine wf_cambiar_ot_tipo (string mode);////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_cambiar_ot_tipo
//
// Objetivo: Cambiar la ventana para utilizar las contratas or las brigadas
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
// 23/02/2000     DSA				Introducir las contratas
//
////////////////////////////////////////////////////////////////////////////////////////////////

if mode = 'CO' then
	d_datos_ot.object.tip_brigada[1] = 2
	//bmp_brigada_responsable.Visible = FALSE
	//d_lista_brigadas_ot.dataobject = 'd_con_2002_pr_list_contratas_ot'
	//d_lista_brigadas_ot.SetTransObject(SQLCA)
	dw_brigadas_calendario_rango.DataObject = 'd_contratas_calendario_rango_fechas'
	dw_brigadas_calendario_rango.SetTransObject(SQLCA)
	is_contrata = 'CO'
	//gb_1.width = 1074
	//gb_1.height = 192
	tab_lista_brigadas.Hide()
	dw_lista_contratas.Show()
	//d_crit_seleccion.Hide()
	//st_seleccion.Show()
	//dw_seleccion.Show()	
	
	d_crit_seleccion.object.pi_tipo_brigada_t.Text = 'Tipo de Contrata:'
	d_crit_seleccion.object.pi_brigadas_en_turno.CheckBox.Text = 'Contratas en turno'
	rb_2.Checked = TRUE		
else
	//bmp_brigada_responsable.Visible = TRUE
	d_datos_ot.object.tip_brigada[1] = 1
	is_contrata = 'BR'
	//gb_1.width = 2162
	//gb_1.height = 192
	tab_lista_brigadas.Show()
	//d_crit_seleccion.Show()
	//st_seleccion.Hide()
	//dw_seleccion.Hide()
	dw_lista_contratas.Hide()
	//d_lista_brigadas_ot.dataobject = 'd_bri_2002_pr_list_brigadas_ot'
	//d_lista_brigadas_ot.SetTransObject(SQLCA)
	dw_brigadas_calendario_rango.DataObject = 'd_brigadas_calendario_rango_fechas'
	dw_brigadas_calendario_rango.SetTransObject(SQLCA)
	d_crit_seleccion.object.pi_tipo_brigada_t.Text = 'Tipo de Brigada:'
	d_crit_seleccion.object.pi_brigadas_en_turno.CheckBox.Text	='Brigadas en turno'
	rb_1.Checked = TRUE	
end if
end subroutine

public function boolean fw_equipo_disponible (long pl_nro_equipo, string ps_tipo_equipo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_equipo_disponible
// 
// Objetivo: Indica si una brigada o contrata est$$HEX2$$e1002000$$ENDHEX$$disponible a una hora concreta
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//   Entrada: pl_nro_equipo : nro de brigada o contrata
//            ps_tipo_equipo: indica si se pide la disponibilidad para una brigada o contrata
//   Salida:   --
//                                              
// Devuelve: True  - en caso de que la brigada est$$HEX2$$e9002000$$ENDHEX$$diponible para esa hora
//				 False - en caso de qu eno trabaje a esa hora      
//
//  Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------   -----------  ----------------------------------------
// 10/04/2000     LFE         Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

Long  ll_fila_calen, ll_fila_horarios 
Datetime ldt_hora_desde, ldt_hora_hasta
string ls_tipo_equipo
		
// Verifico el horario de la brigada
IF dw_brigadas_calendario_rango.RowCount() = 0 THEN
	Return False
END IF
IF ps_tipo_equipo = 'CO' THEN
	ls_tipo_equipo = "nro_contrata="
ELSE
	ls_tipo_equipo = "nro_brigada="
END IF

ll_fila_calen = dw_brigadas_calendario_rango.Find("nro_contrata=" + String(pl_nro_equipo), 1, dw_brigadas_calendario_rango.RowCount())
RETURN ll_fila_calen > 0
end function

public function integer wf_valida_drag_brigada_no_disp (long pl_nro_brigada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: wf_valida_drag_brigada_no_disp
// 
// Objetivo: Indica si se puede asignar una brigada no disponible a una OT
//
//	Ambito:	p$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//			Entrada: pl_nro_brigada -> nro de brigada que se desea asignar a la OT


//						
//			Salida:  
//						
// Devuelve: 1 -> en caso de que se pueda asignar
//				 0 -> en caso de que no se pueda asignar
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	17/08/2000  LFE	      
//
////////////////////////////////////////////////////////////////////////////////////////////////

int li_nro_brigadas, li_retorno
long ll_row, ll_nro_ot

// Se comprueba si la brigada se encuentra trabajando en esta OT
ll_row = d_lista_brigadas_ot.Find("nro_brigada = "+string(pl_nro_brigada)+" AND ISNULL(f_hasta)", 0, d_lista_brigadas_ot.RowCount())

IF ll_row > 0 THEN
	// La brigada se encuentra trabajando en esta OT. No se puede volver a asignar
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La brigada ya se encuentra trabajando en la OT")
	li_retorno = 0
ELSE
	li_retorno = 1
//	// Se comprueba en la OT de la brigada si hay m$$HEX1$$e100$$ENDHEX$$s brigadas trabajando
//	
//	// En primer lugar se busca la OT en la que traja la brigada
//	ll_nro_ot = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_ot")
//	
//	IF ll_nro_ot = -1 THEN 
//		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede desasignar la brigada de la OT")
//		li_retorno = 0
//	ELSE
//		// Se comprueba ahora cu$$HEX1$$e100$$ENDHEX$$ntas brigadas est$$HEX1$$e100$$ENDHEX$$n trabajando en la OT
//		SELECT count(*)
//		INTO :li_nro_brigadas
//		FROM GI_BRIGADA_OT
//		WHERE NRO_OT = :ll_nro_ot AND
//				EST_BRIGADA = :fgci_ot_trabajando;
//		
//		IF SQLCA.SQLCode = 0 THEN
//			IF li_nro_brigadas > 1 THEN
//				// Hay m$$HEX1$$e100$$ENDHEX$$s de una brigada trabajando en la OT. Se permite cambiar a la brigada de OT
//				li_retorno = 1
//			ELSE
//				// Es la $$HEX1$$fa00$$ENDHEX$$nica brigada que trabaja en la OT, luego no se puede desasignar de la OT
//				li_retorno = 0
//				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede desasignar la brigada de la OT en la que se encuentra trabajando debido a que es la $$HEX1$$fa00$$ENDHEX$$nica trabaja en ella")
//			END IF
//		ELSE
//			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se puede desasignar la brigada de la OT")
//			li_retorno = 0
//		END IF
//	END IF
END IF

return li_retorno
		

end function

public function integer wf_validar_fecha_fin ();int li_contador
boolean lb_brigadas_trabajando = FALSE
d_lista_brigadas_ot.Accepttext()
for li_contador= 1 to d_lista_brigadas_ot.rowcount()
	if isnull(d_lista_brigadas_ot.object.f_hasta[li_contador]) or &
	   (d_lista_brigadas_ot.object.f_hasta[li_contador]) < (d_lista_brigadas_ot.object.f_desde[li_contador])then
 		lb_brigadas_trabajando = TRUE  // hay m$$HEX1$$e100$$ENDHEX$$s brigadas/contratas trabajando en la OT
		exit
   end if
	next 
IF lb_brigadas_trabajando = FALSE THEN
	gnv_msg.f_mensaje('AI76',"","",OKCancel!)
	return 0
END IF
return 1
end function

public function integer wf_bloquear_brigadas_asignadas (integer pi_ind_bloqueo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_bloquear_brigadas_asignadas
// 
// Objetivo: Bloquea todas las brigadas que est$$HEX1$$e900$$ENDHEX$$n trabajando en la incidencia
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//   Fecha	   Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-----------		----------------------------------------
//	08/11/2000	   LFE			Creaci$$HEX1$$f300$$ENDHEX$$n de la funci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_brigada
int li_indice, li_lock_status

li_lock_status = 0 
li_indice = 1

DO WHILE li_indice <= d_lista_brigadas_ot.RowCount() AND li_lock_status = 0
	// Se bloquea/desbloquea cada brigada que se encuentre trabajando en la OT asociada a la incidencia
	// Las brigadas que han finalizado su trabajo ya han sido desbloqueadas en el ue_grabar
	IF (d_lista_brigadas_ot.getitemnumber(li_indice,'est_brigada') <= fgci_ot_trabajando &
	    OR d_lista_brigadas_ot.getitemnumber(li_indice,'est_brigada') = fgci_ot_resuelta AND &
	     d_lista_brigadas_ot.getitemString(li_indice, 'trabajo_resuelto') = '1') &
		AND d_lista_brigadas_ot.GetItemString(li_indice,'tipo') = 'Brig.' THEN
		
		ll_nro_brigada=d_lista_brigadas_ot.getitemnumber(li_indice,'nro_brigada')
		
		IF pi_ind_bloqueo = 1 THEN
			// Estamos bloqueando las brigadas
			li_lock_status=gnu_u_transaction.uf_lock_brigada(ll_nro_brigada)
		ELSE
			li_lock_status=gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
		END IF
	END IF
	li_indice ++
LOOP

IF pi_ind_bloqueo = 1 AND li_lock_status<>0 THEN
  	gnv_msg.f_mensaje("AI96","Una de las Brigadas asociadas a la incidencia","modificada",OK!)
	Return -1
ELSE
	Return 1	
END IF

end function

public function integer fw_desbloq_brig_fin_trab ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_desbloq_brig_fin_trab
// 
// Objetivo: Desbloquea todas las brigadas cuyo trabajo se haya finalizado en la incidencia
//
//	Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//		Entrada: --
//		Salida:  --
//						
// Devuelve:	
//
//   Fecha	   Responsable			Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------	-----------		----------------------------------------
//	03/05/2001	   LFE			Creaci$$HEX1$$f300$$ENDHEX$$n de la funci$$HEX1$$f300$$ENDHEX$$n
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_brigada
int li_indice, li_lock_status

li_lock_status = 0
li_indice = 1

DO WHILE li_indice <= d_lista_brigadas_ot.RowCount() AND li_lock_status = 0
	// Se desbloquean las brigadas cuyo valor en el campo 'trabajo_resuelto' sea uno
	IF d_lista_brigadas_ot.GetItemString(li_indice,'trabajo_resuelto') = '1' THEN
		d_lista_brigadas_ot.SetItem(li_indice, 'trabajo_resuelto', 0)
		ll_nro_brigada=d_lista_brigadas_ot.getitemnumber(li_indice,'nro_brigada')
		li_lock_status=gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
	END IF
	li_indice ++
LOOP

Return 1
end function

public subroutine fw_deshabilitar_campos (datawindow pdw_datos);string ls_columna, ls_visible, ls_nomcol
int li_total, li_columna
//pd_dw.modify("descripcion.background.Color ="+string(65536*192+256*192+192))
ls_columna = pdw_datos.describe("DataWindow.Column.Count")
li_total = integer(ls_columna)

FOR li_columna = 1 TO li_total
	ls_visible = pdw_datos.Describe("#" + string(li_columna) + ".visible")
	IF ls_visible = '1' THEN
		
//		ls_nomcol=pdw_datos.Describe("#" + string(li_columna) + ".name")
//		messagebox("nombre",ls_nomcol)
// Modificaci$$HEX1$$f300$$ENDHEX$$n por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//		pdw_datos.modify("#" + string(li_columna) + ".background.Color ="+string(65536*192+256*192+192))	
		pdw_datos.modify("#" + string(li_columna) + ".background.Color =" + gs_gris)
// Fin. Sgo.
		pdw_datos.modify("#" + string(li_columna) + ".protect=1")
	END IF
NEXT
end subroutine

public function integer fw_finalizar_ot ();Int li_cont, li_contador
boolean lb_todos
datetime fecha, ldt_generada, ldt_f_finalizada
//d_datos_ot.accepttext()

d_lista_brigadas_ot.accepttext()

IF d_lista_brigadas_ot.RowCount() = 0 THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Para finalizar la OT deber$$HEX2$$e1002000$$ENDHEX$$tener al menos una brigada o contrata trabajando")
	Return -1
END IF

lb_todos=true
        
ldt_generada = d_datos_ot.getItemDatetime(1,"f_desde")
ldt_f_finalizada = d_datos_ot.getItemDatetime(1,"f_hasta")

/*INI.FFB. DDAG-5358 28/07/16 */
gl_nro_ot = d_datos_ot.object.nro_ot[1]
/*FIN.FFB. DDAG-5358 28/07/16 */


if messagebox("Aviso","La opci$$HEX1$$f300$$ENDHEX$$n 'Finalizar OT' pondr$$HEX2$$e1002000$$ENDHEX$$una Fecha de Fin a la OT y" + &
							 " a todas las brigadas que en ella se encuentran trabajando. La fecha de" + &
							 " fin de la Ot ser$$HEX2$$e1002000$$ENDHEX$$la fecha actual. $$HEX1$$bf00$$ENDHEX$$Esta seguro de realizar la operaci$$HEX1$$f300$$ENDHEX$$n?", information!, OKCANCEL!)=1 then

	//d_datos_ot.SetItem(1, "fin_ot",1)
	
	if not isnull(d_datos_ot.object.f_desde[1]) then
						
		for li_cont = 1 to d_lista_brigadas_ot.rowcount()
			if isnull(d_lista_brigadas_ot.object.f_desde[li_cont]) or &
				(d_lista_brigadas_ot.object.f_desde[li_cont] < ldt_generada) then 
				lb_todos=false
			end if
		next
		for li_cont = 1 to d_lista_brigadas_ot.rowcount()
			if (d_lista_brigadas_ot.object.f_hasta[li_cont] < d_lista_brigadas_ot.object.f_desde[li_cont]) then 
				lb_todos=false
			end if
		next
		
		for li_cont = 1 to d_lista_brigadas_ot.rowcount()
			if (d_lista_brigadas_ot.object.f_desde[li_cont] > fgnu_fecha_actual()) then 
				lb_todos=false
			end if
		next
			 
		if lb_todos=true then
			//d_datos_ot.setitem(1,"f_hasta",fgnu_fecha_actual())
			//iu_2001_rn_ot.frn_deshabilitar(d_datos_ot,1)
			bmp_brigada_responsable.Enabled=False
			tab_lista_brigadas.enabled=false
			d_datos_ot.enabled=false
			il_conta = 0
			
			for li_contador=1 to d_lista_brigadas_ot.rowcount()
				if isnull(d_lista_brigadas_ot.object.f_hasta[li_contador]) then 
					// GNU 18-7-2006. Incidencia pruebas SAT
					// d_lista_brigadas_ot.setitem(li_contador,"f_hasta",fgnu_fecha_actual())
					// FIN GNU
					d_lista_brigadas_ot.setitem(li_contador,"f_hasta",ldt_f_finalizada)
					d_lista_brigadas_ot.SetItem(li_contador, 'trabajo_resuelto', '1')	
					il_conta ++
					il_segur[il_conta]=li_contador
					//d_datos_ot.settaborder("fin_ot",0)
					
				end if
			next    
			fw_deshabilitar_campos(d_lista_brigadas_ot)   
			fw_deshabilitar_campos(d_datos_ot)
			fw_deshabilitar_campos(dw_ambito)
			fw_deshabilitar_campos(d_crit_seleccion)
			rb_1.enabled=false
			rb_2.enabled=false
			
			/// Si solo hay un registro en la datawindow de las brigadas setea 
			// autom$$HEX1$$e100$$ENDHEX$$ticamente las fechas de esta
			
			if d_lista_brigadas_ot.rowcount()=1 then
				  
				if not isnull(d_datos_ot.object.f_desde[1]) and &
					d_datos_ot.object.f_desde[1]<= fgnu_fecha_actual() then
				
					if isnull(d_lista_brigadas_ot.object.f_desde[1]) then // FDO Validaci$$HEX1$$f300$$ENDHEX$$n de las fechas de las brigadas Incidencia 0/372386
						d_lista_brigadas_ot.object.f_desde[1]= d_datos_ot.object.f_desde[1]
					end if
				end if          
					  // fecha hasta
				if not isnull(d_datos_ot.object.f_hasta[1]) and &
								 d_datos_ot.object.f_desde[1] > d_datos_ot.object.f_hasta[1] then
					if isnull(d_lista_brigadas_ot.object.f_hasta[1]) then // FDO Validaci$$HEX1$$f300$$ENDHEX$$n de las fechas de las brigadas Incidencia 0/372386
						d_lista_brigadas_ot.object.f_hasta[1]= d_datos_ot.object.f_hasta[1]
					end if
				end if          
			end if
		else
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Las Brigadas Deber$$HEX1$$e100$$ENDHEX$$n Tener Fecha correcta de Inicio/Fin de Tareas")
			//d_datos_ot.setItem(1,'fin_ot',0)
			return -1
			//this.postevent("ue_post_item")
		end if
		
	end if
	
else
	//d_datos_ot.setitem(1,"f_hasta",setnull(fecha))
	//iu_2001_rn_ot.frn_deshabilitar(d_datos_ot,0)
	bmp_brigada_responsable.Enabled=True
	tab_lista_brigadas.enabled=true
//	for li_contador=1 to il_conta
//		d_lista_brigadas_ot.setitem(il_segur[li_contador],"f_hasta",setnull(fecha))
//	next
	
//	il_conta=0
	return -1
end if

return 1


end function

public function boolean fw_ot_de_operaciones (long pl_nro_ot);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fw_ot_de_operacion
// 
// Objetivo: Funci$$HEX1$$f300$$ENDHEX$$n que indica si la OT est$$HEX2$$e1002000$$ENDHEX$$bloqueada por el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n o por
// 			 ORACLE
//
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada:  --
//      Salida:   --
//                                              
// Devuelve:    
//			TRUE  --> La OT la bloquea el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n
//			FALSE --> La OT la bloquea ORACLE
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------   	 -------     ----------------------------------------
//	16/01/2002			LFE			Creaci$$HEX1$$f300$$ENDHEX$$n	
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_instalacion
int li_tipo_instalacion, li_tension
Boolean lb_salida 

IF NOT gb_operaciones THEN
	lb_salida = FALSE
ELSE
	SELECT NVL(GI_OT.NRO_INSTALACION,0),
			 SGD_INSTALACION.TIPO_INSTALACION,
			 SGD_INSTALACION.TENSION
	INTO 	:ll_nro_instalacion,
			:li_tipo_instalacion,
			:li_tension
	FROM GI_OT,SGD_INSTALACION
	WHERE GI_OT.NRO_OT = :pl_nro_ot and 
			GI_OT.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION(+) and 
			SGD_INSTALACION.BDI_JOB(+) = 0;
				
	IF SQLCA.SQLCode <> 0 THEN
		lb_salida = FALSE
	ELSE
		IF ll_nro_instalacion = 0 THEN
			lb_salida = FALSE
		ELSE
			// Se bloquea con el servidor de operaciones
			IF li_tension <= gi_tension_nivel_min THEN 
				// El nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la incidencia tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
				IF (gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct) OR &
					(gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion = fgci_tipo_subestacion) THEN
					// La OT la gestiona el SGI
					lb_salida = FALSE
				ELSE
					// Bloquear con la llamada al servidor de operaciones
					lb_salida = TRUE
				END IF
			ELSE
				// El nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la OT no tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
				// por lo que la ha dado de alta el SGI
				lb_salida = FALSE
			END IF
		END IF
	END IF
END IF

Return lb_salida
end function

public subroutine fw_deshabilitartodaventana ();/*
	Descripci$$HEX1$$f300$$ENDHEX$$n	:	Desahabilita la ventana para que no es puedan modificar los datos
	Argumentos	:	-
	Devuelve		:	-
	Autor			:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas
	Fecha			:	17/12/2007
*/

fw_deshabilitar_campos(d_crit_seleccion)
fw_deshabilitar_campos(d_lista_brigadas_ot)
fw_deshabilitar_campos(dw_lista_contratas)
fw_deshabilitar_campos(d_datos_ot)
fw_deshabilitar_campos(dw_ambito)
d_crit_seleccion.enabled = FALSE
d_lista_brigadas_ot.enabled = FALSE
dw_lista_contratas.enabled = FALSE
d_datos_ot.enabled = FALSE
dw_ambito.enabled = FALSE
rb_1.enabled = FALSE
rb_2.enabled = FALSE
end subroutine

public function boolean fw_hayotrabrigadatrabajando (long al_nro, datawindow adw_datos);/*
	Descripci$$HEX1$$f300$$ENDHEX$$n	:	Indica si hay otra brigada trabajando
	Argumentos	:	al_nro 		-> n$$HEX1$$fa00$$ENDHEX$$mero de la brigada que acabamos de insertar
						adw_datos	->	datawindows del que se obtienen los datos
	Devuelve		:	TRUE 	-> Hay otra brigada trabajando
						FALSE	->	No hay brigadas trabajando
	Autor			:	Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas Miguel$$HEX2$$e100f100$$ENDHEX$$ez
	Fecha			:	17/12/2007
*/

boolean	lb_hayBrigadas		//Indica si hay brigadas ya asignadas que est$$HEX1$$e900$$ENDHEX$$n trabajando
int		li_filas				//N$$HEX1$$fa00$$ENDHEX$$mero de brigadas que ya est$$HEX1$$e100$$ENDHEX$$n trabajando
int		li_filaSinFecha	//Fila en la que la fecha de finalizaci$$HEX1$$f300$$ENDHEX$$n es nula

li_filas = adw_datos.rowCount()
li_filaSinFecha = adw_datos.find('(isNull(f_hasta))', 1, li_filas)
lb_hayBrigadas = ((li_filas > 0) AND li_filaSinFecha < li_filas)

RETURN lb_hayBrigadas
end function

event closequery;long ll_nro_aviso,ll_ult_ot,ll_nro_incidencia
Decimal{0} ld_nro_instalacion
long ll_brigada_resp
int  li_accion_pregunta,li_conta
boolean lb_validar_grabar
string lb_grabar
datetime ldt_fecha_generada_ot, ld_1,ld_2,ld_hasta,ld_desde
datetime ld_fecha_generada, ld_fecha_finalizada

IF d_lista_brigadas_ot.AcceptText() = -1 THEN
	return 1
END IF

IF d_datos_ot.AcceptText() = -1 THEN
	return 1
END IF

IF lu_comunic.is_comunic.Accion_llamada = "Modificacion" AND &
	gb_operaciones AND IsValid(gu_rf_servidor_operacion) AND &
	fw_ot_de_operaciones(d_datos_ot.GetItemNumber(1, 'nro_ot')) THEN
	// SI  ES DE OPERACIONES ES NECESARIO COMPROBAR SI SE HA CAIDO EL SERVIDOR O
	// HA HABIDO UN CORTE EN LA COMUNICACION, QUE PUEDA HACER QUE NO ESTE BLOQUEADA
	
	if gu_rf_servidor_operacion.of_actualiza_icono() = 0  then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que no se puede conectar con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gu_comunic1.is_comunic.Programa_Retorno="iw_6201"
      gu_comunic1.is_comunic.accion_retorno="Sin Seleccionar"
		gu_comunic1.is_comunic.longval2=lu_comunic.is_comunic.longval2
      gu_comunic1.is_comunic.longval4=lu_comunic.is_comunic.longval4 
		gnu_u_transaction.uf_rollback()
		RETURN 0
	elseif gu_rf_servidor_operacion.of_devuelve_sesion() <> il_sesion_operacion then 
		// SE HA PRODUCIDO UN CORTE
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se va a cerrar la ventana sin guardar los cambios, debido a que se ha producido un corte en la comunicaci$$HEX1$$f300$$ENDHEX$$n con el Servidor de Operaci$$HEX1$$f300$$ENDHEX$$n")
		gu_comunic1.is_comunic.Programa_Retorno="iw_6201"
      gu_comunic1.is_comunic.accion_retorno="Sin Seleccionar"
		gu_comunic1.is_comunic.longval2=lu_comunic.is_comunic.longval2
      gu_comunic1.is_comunic.longval4=lu_comunic.is_comunic.longval4 
		gnu_u_transaction.uf_rollback()
		RETURN 0
	end if
end if

// DSA INI 22/03/2000
//recalcular valores de OT
d_datos_ot.object.f_desde[1] = 	 fg_minfechahora(d_lista_brigadas_ot, "f_desde")
// DSA FIN 22/03/2000

//BLANQUE LAS VARIABLES DE COMUNICACIONES CON NULOS
fgnu_resetear_s_comunicaciones(gu_comunic1)

lb_validar_grabar=FALSE

//valida si quiere grabar, cancelar o salir sin efectuar cambios
IF lu_comunic.is_comunic.accion_llamada="Consulta" THEN
	li_accion_pregunta= 2
ELSEIF d_lista_brigadas_ot.rowcount() > 0 then
   li_accion_pregunta=gnv_msg.f_mensaje('CG001',"","",YesNoCancel!)
ELSE 
	li_accion_pregunta= 2
END IF

CHOOSE CASE li_accion_pregunta 
	CASE 1
        lb_grabar="SI"
	CASE 2
        lb_grabar="NO"
	CASE 3, -1
        lb_grabar="CANCEL"

END CHOOSE

        
CHOOSE CASE lb_grabar
                        
CASE "SI" //SI CONFIRMO GRABAR
                
	lb_validar_grabar=TRUE
			                 
   //ld_nro_instalacion= lu_comunic.is_comunic.Decval1
   ll_nro_aviso = lu_comunic.is_comunic.longval3
	if d_lista_brigadas_ot.Find("tipo = 'Brig.'", 0, d_lista_brigadas_ot.RowCount()) > 0 THEN //dsa
		lu_comunic.is_comunic.longval4=iu_2002_nu_bri.fnu_devolver_brigada_resp(d_lista_brigadas_ot)
	end if	
   //maria
	ll_brigada_resp=lu_comunic.is_comunic.longval4
                
   /////////////////////// FINALIZADA LA OT
	d_datos_ot.accepttext()
	IF d_lista_brigadas_ot.accepttext() <> 1 THEN
		lb_validar_grabar=false
		return 1
		
	END IF
					
   ld_hasta=d_datos_ot.getitemdatetime(1,"f_hasta")
	ld_desde = d_lista_brigadas_ot.getItemdatetime(1,"f_desde")
	ld_fecha_generada = d_datos_ot.getItemDatetime(1,"f_desde")
	ld_fecha_finalizada = d_datos_ot.GetItemDatetime(1,"f_hasta")
   If d_datos_ot.object.est_ot[1] = fgci_ot_resuelta then
   	if (ld_hasta <= fgnu_fecha_actual()) and ld_hasta > ld_desde and not isnull(ld_hasta) then
      	if (ld_hasta >= d_datos_ot.getitemdatetime(1,"f_desde")) then
				if (ld_desde >= ld_fecha_generada) then
					if (ld_fecha_finalizada > ld_fecha_generada) then
						d_datos_ot.setitem(1,"est_ot",fgci_ot_resuelta)
						//pongo fecha de fin a las brigadas que esten a nulos
						for li_conta=1 to d_lista_brigadas_ot.rowcount()
							ld_1=d_lista_brigadas_ot.getitemdatetime(li_conta,"f_hasta")
							ld_2=d_lista_brigadas_ot.getitemdatetime(li_conta,"f_desde")
							if (ld_1 <= ld_2) or isnull(ld_1) then
								d_lista_brigadas_ot.setitem(li_conta,"f_hasta",fgnu_fecha_actual())
							end if
								gu_comunic1.is_comunic.accion_retorno="Finalizada"
								lu_comunic.is_comunic.longval4= (ll_brigada_resp)
								SetNull(ll_brigada_resp)
						next
						d_datos_ot.accepttext()
						d_lista_brigadas_ot.accepttext()
						d_datos_ot.update()
					else
						messagebox("Atencion","La fecha finalizada no puede ser menor que la fecha generada")
						lb_validar_grabar = false
						Message.returnvalue=1
					end if
				else
					messagebox("Atencion","Las fechas desde deben ser mayores o iguales a la fecha de generaci$$HEX1$$f300$$ENDHEX$$n")
					lb_validar_grabar=false
					Message.returnvalue=1	
				end if
       	else
         	gnv_msg.f_mensaje("AI77","","",OK!)
            //messagebox("Aviso","La Fecha de Inicio de trabajo no puede ser mayor que la fecha de fin")
            Message.returnvalue=1
				lb_validar_grabar=false
            ///mensaje de la fecha de inicio no puede ser menor que a f fin
         end if
     	else
      	gnv_msg.f_mensaje("AI78","","",OK!)
         //messagebox("Aviso","La Fecha de fin de trabajo es nula o es mayor que la del d$$HEX1$$ed00$$ENDHEX$$a")
         Message.returnvalue=1
			lb_validar_grabar=false
         ///mensaje de rellenar correctamente el campo
      end if
	else
		if ld_fecha_generada > ld_fecha_finalizada then
			messagebox("Atencion","La fecha finalizada no puede ser menor que la fecha generada")
			lb_validar_grabar = false
			Message.returnvalue=1
		end if
  	End if
   ////////////////////////
        
//              //Actualiza los valores en las datawindow como ser cargar el nro de ot
//              iu_2002_nu_bri.fnu_actualizar_Datawindow(d_lista_brigadas_ot,ch_ot_anulada.checked)
//      
                
   //VALIDA QUE EXISTA ALGUNA BRIGADA ASIGNADA y
   // que sea una responsable si no es incidencia programada
	
//   IF (lu_comunic.is_comunic.intval6<>fgci_incidencia_programada OR &
//   	ISNULL(lu_comunic.is_comunic.intval6)) AND is_contrata = 'BR' THEN //DSA
//     	IF NOT iu_2002_rn_bri.frn_validar_asigno_brigada(d_lista_brigadas_ot) THEN
//			gnv_msg.f_mensaje("AI03","una Brigada","",OK!)
//         lb_validar_grabar=FALSE
//      ELSE
      	ll_brigada_resp=iu_2002_nu_bri.fnu_devolver_brigada_resp(d_lista_brigadas_ot)
         lu_comunic.is_comunic.longval4=ll_brigada_resp
//      END IF
//   END IF
                
//              IF NOT iu_2002_rn_bri.frn_v_fechas_brigadas(d_lista_brigadas_ot) THEN
//                      lb_validar_grabar= FALSE
//              END IF

                //la fecha de generada la OT no puede estar fuera del rango 
                //de fechas pasado por parametro
                //LA FECHAS DE INICIO DE TAREAS DE LAS BRIGADAS NO PUEDEN SER 
                //ANTERIORES A LA FEHA DE GENERADA LA OT y posteriores a la del d$$HEX1$$ed00$$ENDHEX$$a
//              ldt_fecha_generada_ot=iu_2001_nu_ot.fnu_devolver_fec_ini_ot(d_datos_ot)
//              IF iu_2001_rn_ot.frn_validar_fecha_generada(ldt_fecha_generada_ot,d_lista_brigadas_ot,lu_comunic.is_comunic.DatVal1,lu_comunic.is_comunic.DatVal2,lu_comunic.is_comunic.intval6)=0 THEN
//                      lb_validar_grabar=FALSE
//              END IF
        
   IF d_datos_ot.object.est_ot[1] = fgci_ot_resuelta THEN  //si la ot esta Finalizada
      //gu_comunic1.is_comunic.accion_retorno="Anulada"
   	gu_comunic1.is_comunic.accion_retorno="Finalizada"
      lu_comunic.is_comunic.longval4=(ll_brigada_resp)
      SetNull(ll_brigada_resp)
   ELSE
   	if ib_devolver_alta=true and isnull(d_datos_ot.object.f_hasta[1]) then
      	gu_comunic1.is_comunic.accion_retorno="Sin Seleccionar"
      	gu_comunic1.is_comunic.Programa_Retorno="iw_6201"
      else
         gu_comunic1.is_comunic.accion_retorno="Asignada"
         lu_comunic.is_comunic.longval4=ll_brigada_resp
      //maria
      end if
   END IF

   //SI CONFIRMO GRABAR Y NO PASO LAS VALIDACIONES RETORNA A LA PANTALLA
   IF lb_validar_grabar THEN
   	ib_valido=true
		IF d_lista_brigadas_ot.RowCount() > 0 THEN
	      This.TriggerEvent("ue_arch_grabar")
		ELSE
			gnv_msg.f_mensaje("AI37","","",OK!)
			return 	 
   	END IF                     
   	//DBE ini 15/12/1999
    	if ib_valido then 
      	gnu_u_transaction.uf_commit()
      end if
      //DBE fin 15/12/1999
                        
//                      gnu_u_transaction.uf_commit();//DBE fin 15/12/1999
		if ib_valido=false then
      	return 1
      end if
      IF i_grabo=0 THEN 
      	Message.returnvalue=1
      END IF
   ELSE
   	Message.returnvalue=1   
   END IF

CASE "NO"
                //SI ES NO, RETORNA EN EL MISMO ESTADO EN QUE SE LLAMO A LA VENTANA
                IF lu_comunic.is_comunic.accion_llamada="Alta" THEN
                        SetNull(ll_brigada_resp)
                        gu_comunic1.is_comunic.longval4=ll_brigada_resp
                        gu_comunic1.is_comunic.programa_retorno="Sin Seleccionar"
                        SetNull(lu_comunic.is_comunic.longval2)

                        gu_comunic1.is_comunic.longval2=lu_comunic.is_comunic.longval2
                        gu_comunic1.is_comunic.Programa_Retorno="iw_6201"
                ELSE
                        gu_comunic1.is_comunic.Programa_Retorno="iw_6201"
                        gu_comunic1.is_comunic.accion_retorno="Sin Seleccionar"
                        gu_comunic1.is_comunic.longval2=lu_comunic.is_comunic.longval2
                        gu_comunic1.is_comunic.longval4=lu_comunic.is_comunic.longval4 
                END IF
                
//DBE ini 14/12/1999
gnu_u_transaction.uf_rollback()
//DBE fin

CASE "CANCEL"
                //SI ES CANCELAR RETORNA A LA PANTALLA
                IF lb_grabar="CANCEL" THEN
                        Message.returnvalue=1   
                END IF

END CHOOSE

end event

event ue_opcion1;call super::ue_opcion1;iu_2002_nu_bri.fnu_asignar_responsable(d_lista_brigadas_ot,d_lista_brigadas_ot.GetRow())
end event

event ue_arch_grabar;////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     ue_arch_grabar
// Objetivo:    Graba los datos ingresados <Online> previa validaci$$HEX1$$f300$$ENDHEX$$n
//              
//
// Ambito:      Ventana
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada: --      
//      Salida:  -- 
//                                              
// Devuelve:    1 
//
//  Fecha         Resp.     Actuaci$$HEX1$$f300$$ENDHEX$$n
// ----------      -------   ---------------------
// 22/09/1997           AFS         Modificacion
//                FDO       Modificacion
// 29/09/1998     MATO      Modif. Valid."d_bri_2002..." con tres fechas h$$HEX1$$e100$$ENDHEX$$biles al arrancar)
//////////////////////////////////////////////////////////////////
long row
long est_brigada, est_brigada_new, est_ot_new , ll_nro_brigada
long ll_ult_ot


datetime ldt_f_prev_desde_descargo

est_ot_new = 5
ll_ult_ot=lu_comunic.is_comunic.longval2        

if lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
        ldt_f_prev_desde_descargo=lu_comunic.is_comunic.datval1
end if

for row = 1 to d_lista_brigadas_ot.RowCount()
	datetime f_desde, f_hasta, f_actual
	
	est_brigada	=	d_lista_brigadas_ot.getitemnumber(row,'est_brigada')
	f_desde	 	=	d_lista_brigadas_ot.getitemdatetime(row,'f_desde')
	f_hasta	 	=	d_lista_brigadas_ot.getitemdatetime(row,'f_hasta')
	f_actual    =  d_lista_brigadas_ot.getitemdatetime(row,'f_actual')
	ll_nro_brigada =d_lista_brigadas_ot.getitemnumber(row,'nro_brigada')

	est_brigada_new =  iu_validar_brigada.obtener_estado (f_desde, f_hasta,	&
																			est_brigada, f_actual) 			
	
	 
	if est_brigada_new < 1 then 
			iu_validar_brigada.limpiar_fecha_invalida (d_lista_brigadas_ot , row, &
																	 est_brigada_new)
	      ib_valido=false
         return 1
	end if
	
	if est_brigada_new < 3 then 
	  	if lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
           	if (est_brigada_new = 2) and (f_desde < ldt_f_prev_desde_descargo) then //MATO
                   gnv_msg.f_mensaje("AI133","","",OK!)
                  //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio del Trabajo de la Brigada en la <OT> del DESCARGO...
				      ib_valido=false
         			return 1						
				 end if
		end if			
		if d_lista_brigadas_ot.getitemString(row, 'tipo') = 'Brig.' then
	      dw_control_brigadas.settransobject(sqlca)
   	   dw_control_brigadas.RETRIEVE(ll_nro_brigada,ll_ult_ot)
			if dw_control_brigadas.rowcount() > 0 then
				gnv_msg.f_mensaje("AI89","","",OK!)
	   		ib_valido=false
   	      return 1			
			end if			
		end if	
	end if
	
	d_lista_brigadas_ot.Setitem(row,'est_brigada',est_brigada_new)						
	if est_ot_new > est_brigada_new then est_ot_new = est_brigada_new //Nuevo estado es el menor
next

if est_ot_new < 3 then
	d_datos_ot.object.est_ot[1] = est_ot_new
end if
	
	
	
	
	
	
	
	
	


long ll_nro_aviso,ll_nro_incidencia
Decimal{0} ld_nro_instalacion
long  ll_brigada_resp
datetime ldt_f_desde_ot

DECLARE PB_SET_COMIENZO PROCEDURE FOR set_comienzo USING SQLCA;
DECLARE PB_SET_BACK PROCEDURE FOR back_to_comienzo USING SQLCA;

i_grabo=1

d_datos_ot.accepttext()
d_lista_brigadas_ot.accepttext()


ld_nro_instalacion=lu_comunic.is_comunic.decval1
ll_nro_aviso=lu_comunic.is_comunic.longval3
ll_brigada_resp=lu_comunic.is_comunic.longval4
ll_nro_incidencia=lu_comunic.is_comunic.longval1        


        
/////////////////////////////////////
//// VALIDACIONES PARA BRIGADAS Y OT
//
//// VALIDAR OT$$HEX1$$b400$$ENDHEX$$s
//
//ldt_f_prev_desde_ot = d_datos_ot.object.f_ini_prev[1]
//ldt_f_prev_hasta_ot = d_datos_ot.object.f_fin_prev[1]
ldt_f_desde_ot = d_datos_ot.object.f_desde[1]
//ldt_f_hasta_ot = d_datos_ot.object.f_hasta[1]
//li_estado_ot= d_datos_ot.object.est_ot[1]
//ldt_f_actual = d_datos_ot.object.f_actual[1]
//
//if d_datos_ot.object.est_ot[1] = 0 then
//
//        if isnull(ldt_f_prev_desde_ot) or isnull(ldt_f_prev_hasta_ot) then
//                gnv_msg.f_mensaje("AI79","","",OK!)
//                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Algunas de las fechas previstas de la OT, est$$HEX1$$e100$$ENDHEX$$n con valores nulos")
//                ib_valido=false
//                return 1
//        else
//                if (ldt_f_prev_desde_ot < ldt_f_actual) then
//                        gnv_msg.f_mensaje("AI80","","",OK!)
//                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha prevista de inicio de la OT no puede ser menor que la fecha actual")
//                        ib_valido=false
//                        return 1
//                else
//                        if (ldt_f_prev_desde_ot >= ldt_f_prev_hasta_ot) then
//                                gnv_msg.f_mensaje("AI81","","",OK!)
//                                messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha prevista del fin de la OT no debe ser menor a la fecha prevista del inicio de la misma")
//                                ib_valido=false
//                                return 1
//                        else
//                                if isnull(ldt_f_desde_ot) then
//                                        lb_valido=true
//                                        d_datos_ot.object.est_ot[1] = 1
//                                else
//                                        if (ldt_f_desde_ot > ldt_f_actual) then
//                                                gnv_msg.f_mensaje("AI82","","",OK!)
//                                                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de la OT no puede ser mayor que la fecha actual")
//                                                ib_valido=false
//                                                return 1
//                                        else
//                                                lb_valido=true
//                                                d_datos_ot.object.est_ot[1] = 2
//                                        end if
//                                end if
//                        end if
//                end if
//        end if
//else 
//        if d_datos_ot.object.est_ot[1] = 1 and &
//        not isnull(ldt_f_desde_ot) then
//                if ldt_f_desde_ot > fgnu_fecha_actual() then
//                        gnv_msg.f_mensaje("AI83","","",OK!)
//                        //messagebox("Aviso","La Fecha de Inicio de la Ot no debe ser mayor que la fecha actual")
//                        d_datos_ot.object.f_desde[1]=ldt_f_nula
//                        ib_valido=false
//                        return 1
//                else
//                        d_datos_ot.object.est_ot[1] = 2
//                        lb_valido=true
//                end if
//        else
//                if d_datos_ot.object.est_ot[1] = 2 and &
//                not isnull(ldt_f_hasta_ot) then
//                // si modifique y finaliz$$HEX2$$e9002000$$ENDHEX$$tareas
//                        if ldt_f_hasta_ot > fgnu_fecha_actual() then
//                                gnv_msg.f_mensaje("AI84","","",OK!)
//                                //messagebox("Aviso","La Fecha de fin de la Ot no debe ser mayor que la fecha actual")
//                                d_datos_ot.object.f_desde[1]=ldt_f_nula
//                                ib_valido=false
//                                return 1
//                        else
//                                d_datos_ot.object.est_ot[1] = 3
//                                lb_valido=true
//                        end if
//                end if
//        end if
//end if
//
//// VALIDAR Brigadas
//
//if lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
//        ldt_f_prev_desde_descargo=lu_comunic.is_comunic.datval1
//end if
//
//for li_contador = 1 to d_lista_brigadas_ot.rowcount()
//        
//        ldt_f_prev_desde = d_lista_brigadas_ot.object.gi_brigada_ot_f_ini_prev[li_contador]
//        ldt_f_prev_hasta = d_lista_brigadas_ot.object.gi_brigada_ot_f_fin_prev[li_contador]
//        ldt_f_desde = d_lista_brigadas_ot.object.f_desde[li_contador]
//        ldt_f_hasta = d_lista_brigadas_ot.object.f_hasta[li_contador]
//        ldt_f_actual = d_lista_brigadas_ot.object.f_actual[li_contador]
//        ll_nro_brigada = d_lista_brigadas_ot.object.nro_brigada[li_contador]
//        
//   //MATO-->Obtenemos los dias entre las fechas se$$HEX1$$f100$$ENDHEX$$aladas
//   //if li_contador = 1 then
//   //   ll_minutos = fg_duracion_minutos(ldt_f_desde , ldt_f_actual)
//   //   ll_dias_entre = ll_minutos / 1440
//   //end if
// 
////      si la brigada existia se validar$$HEX2$$e1002000$$ENDHEX$$normal, pero si no existia, habra que 
////      validar todo a cap$$HEX1$$f300$$ENDHEX$$n
//
//        ll_nro_brigada = d_lista_brigadas_ot.object.nro_brigada[li_contador]
//        
//        li_fila_ant = dw_bri_ant.Find("nro_brigada="+string(ll_nro_brigada),1,dw_bri_ant.RowCount())
//        
////      fg_mostrar_dw(dw_bri_ant)
////      fg_mostrar_dw(dw_control_brigadas)
//          
//        IF li_fila_ant > 0 then
//
//                if d_datos_ot.object.est_ot[1] = 1 then
//
//                        if isnull(ldt_f_prev_desde) or isnull(ldt_f_prev_hasta) then
//                                gnv_msg.f_mensaje("AI85","","",OK!)
//                                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Algunas de las fechas previstas de las Brigadas, est$$HEX1$$e100$$ENDHEX$$n con valores nulos")
//                                ib_valido=false
//                                return 1
//                        else
//                                if (ldt_f_prev_desde < ldt_f_actual) then
//                                        gnv_msg.f_mensaje("AI86","","",OK!)
//                                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha prevista de inicio de la Brigada en la OT no puede ser menor que la fecha actual")
//                                        ib_valido=false
//                                        return 1
//                                else
//                                        if (ldt_f_prev_desde >= ldt_f_prev_hasta) then
//                                                gnv_msg.f_mensaje("AI87","","",OK!)
//                                                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha prevista del fin de la Brigada en la OT no debe ser menor a la fecha prevista del inicio de la misma")
//                                                d_lista_brigadas_ot.object.gi_brigada_ot_f_fin_prev[li_contador]=ldt_f_nula
//                                                ib_valido=false
//                                                return 1
//                                        else
//                                                if isnull(ldt_f_desde) then
//                                                        lb_valido=true
//                                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 1
//                                                else
//                                                        if lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
//                                                                if (ldt_f_desde > ldt_f_actual) or (ldt_f_desde < ldt_f_prev_desde_descargo) then //MATO
//                                                                        gnv_msg.f_mensaje("AI133","","",OK!)
//                                                                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio del Trabajo de la Brigada en la <OT> del DESCARGO...
//                                                                        ib_valido=false
//                                                                        return 1
//                                                                else
//                                                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 2
//                                                                        lb_valido=true
//                                                                end if
//                                                        else
//                                                                if (ldt_f_desde > ldt_f_actual) or (ldt_f_desde < ldt_f_prev_desde) then //MATO
//                                                                        gnv_msg.f_mensaje("AI88","","",OK!)
//                                                                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio del Trabajo de la Brigada en la OT no puede ser mayor que la fecha actual")
//                                                                        ib_valido=false
//                                                                        return 1
//                                                                else
//                                                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 2
//                                                                        lb_valido=true
//                                                                end if
//                                                        end if  
//                                                end if
//                                        end if
//                                end if
//                        end if
//                else 
//                        if d_datos_ot.object.est_ot[1] = 2 and &
//                        not isnull(ldt_f_desde) then
//                                if ldt_f_desde > fgnu_fecha_actual() or (ldt_f_desde < ldt_f_prev_desde) then //MATO
//                                        gnv_msg.f_mensaje("AI88","","",OK!)
//                                        d_lista_brigadas_ot.object.f_desde[li_contador]=ldt_f_nula
//                                        ib_valido=false
//                                        return 1
//                                else
//                                
//                                        // chequeo la brigada para ver si esta trabajando en otra OT o Tarea
//
//                                        dw_control_brigadas.settransobject(sqlca)
//                                        dw_control_brigadas.RETRIEVE(ll_nro_brigada,ll_ult_ot)
//                                
//                                        if dw_control_brigadas.rowcount() > 0 then
//                                                gnv_msg.f_mensaje("AI89","","",OK!)
//                                                //messagebox("Aviso","La Brigada se encuentra trabajando en otra OT / Tarea")
//                                                d_lista_brigadas_ot.object.f_desde[li_contador]=ldt_f_nula
//                                                ib_valido = false
//                                                return 1
//                                        else
//                                                d_lista_brigadas_ot.object.est_brigada[li_contador] = 2
//                                                lb_valido=true
//                                        end if
//                                end if
//                                else
//                                if d_datos_ot.object.est_ot[1] = 3 and &
//                                not isnull(ldt_f_hasta) then
//                                // si modifique y finaliz$$HEX2$$e9002000$$ENDHEX$$tareas
//                                        if ldt_f_hasta > fgnu_fecha_actual() then
//                                                gnv_msg.f_mensaje("AI90","","",OK!)
//                                                //messagebox("Aviso","La Fecha de fin de Trabajo de la brigada en la OT no debe ser mayor que la fecha actual")
//                                                d_lista_brigadas_ot.object.f_hasta[li_contador]=ldt_f_nula
//                                                ib_valido=false
//                                                return 1
//                                        else
//                                                if ldt_f_hasta < ldt_f_desde then
//                                                        gnv_msg.f_mensaje("AI91","","",OK!)
//                                                        //messagebox("Aviso","La Fecha de fin de Trabajo de la brigada no puede ser menor a la fecha de inicio de la misma")
//                                                        d_lista_brigadas_ot.object.f_hasta[li_contador]=ldt_f_nula
//                                                        ib_valido=false
//                                                        RETURN 1
//                                                else
//                                                        lb_valido=true
//                                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 3
//                                                end if
//                                        end if
//                                end if
//                        end if
//                end if
//        ELSE ///////////////li_fila_ant > 0 then
//                if isnull(ldt_f_prev_desde) or isnull(ldt_f_prev_hasta) then
//                        gnv_msg.f_mensaje("AI85","","",OK!)
//                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Algunas de las fechas previstas de las Brigadas, est$$HEX1$$e100$$ENDHEX$$n con valores nulos")
//                        ib_valido=false
//                        return 1
//                else
//                        if (ldt_f_prev_desde < ldt_f_actual) then
//                                gnv_msg.f_mensaje("AI86","","",OK!)
//                                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha prevista de inicio de la Brigada en la OT no puede ser menor que la fecha actual")
//                                ib_valido=false
//                                return 1
//                        else
//                                if (ldt_f_prev_desde >= ldt_f_prev_hasta) then
//                                        gnv_msg.f_mensaje("AI87","","",OK!)
//                                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha prevista del fin de la Brigada en la OT no debe ser menor a la fecha prevista del inicio de la misma")
//                                        d_lista_brigadas_ot.object.gi_brigada_ot_f_fin_prev[li_contador]=ldt_f_nula
//                                        ib_valido=false
//                                        return 1
//                                else
//                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 1
//                                        lb_valido=true
//                                end if
//                        end if
//                end if
//                if not isnull(ldt_f_desde) then
//                        //////
//                        If lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
//                                if ldt_f_desde > fgnu_fecha_actual() OR (ldt_f_desde < ldt_f_prev_desde_descargo) then //MATO
//                                        gnv_msg.f_mensaje("AI133","","",OK!)
//                                        d_lista_brigadas_ot.object.f_desde[li_contador]=ldt_f_nula
//                                        ib_valido=false
//                                        return 1
//                                else
//                                        // chequeo la brigada para ver si esta trabajando en otra OT o Tarea
//                                        dw_control_brigadas.settransobject(sqlca)
//                                        dw_control_brigadas.RETRIEVE(ll_nro_brigada,ll_ult_ot)
//                                        
//                                        if dw_control_brigadas.rowcount() > 0 then
//                                                gnv_msg.f_mensaje("AI89","","",OK!)
//                                                d_lista_brigadas_ot.object.f_desde[li_contador]=ldt_f_nula
//                                                ib_valido = false
//                                                return 1
//                                        else
//                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 2
//                                        lb_valido=true
//                                        end if
//                                end if
//                        Else    
//                           if ldt_f_desde > fgnu_fecha_actual() OR (ldt_f_desde < ldt_f_prev_desde) then //MATO
//                                        gnv_msg.f_mensaje("AI88","","",OK!)
//                                        d_lista_brigadas_ot.object.f_desde[li_contador]=ldt_f_nula
//                                        ib_valido=false
//                                        return 1
//                                else
//                                
//                                        // chequeo la brigada para ver si esta trabajando en otra OT o Tarea
//                                        dw_control_brigadas.settransobject(sqlca)
//                                        dw_control_brigadas.RETRIEVE(ll_nro_brigada,ll_ult_ot)
//                                        
//                                        if dw_control_brigadas.rowcount() > 0 then
//                                                gnv_msg.f_mensaje("AI89","","",OK!)
//                                                d_lista_brigadas_ot.object.f_desde[li_contador]=ldt_f_nula
//                                                ib_valido = false
//                                                return 1
//                                        else
//                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 2
//                                        lb_valido=true
//                                        end if
//                                end if
//                        End If//programa_llamante...    
//                        //////
//                end if
//                if not isnull(ldt_f_hasta) then 
//                        if ldt_f_hasta > fgnu_fecha_actual() then
//                                gnv_msg.f_mensaje("AI90","","",OK!)
//                                d_lista_brigadas_ot.object.f_hasta[li_contador]=ldt_f_nula
//                                ib_valido=false
//                                return 1
//                        else
//                                if ldt_f_hasta < ldt_f_desde then
//                                        gnv_msg.f_mensaje("AI91","","",OK!)
//                                        d_lista_brigadas_ot.object.f_hasta[li_contador]=ldt_f_nula
//                                        ib_valido=false
//                                        RETURN 1
//                                else
//                                        lb_valido=true
//                                        d_lista_brigadas_ot.object.est_brigada[li_contador] = 3
//                                end if
//                        end if
//                end if  
//        END IF
//next
//
// Si viene de Descargos
if lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
        if isnull(ldt_f_desde_ot) then
                gnv_msg.f_mensaje("AI92","","",OK!)
                //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe Comenzar la OT, para poder activar el descargo.")
                ib_valido=false
                RETURN 1
        end if
end if  
//grabar los datos de la ot

iu_2001_nu_ot.fnu_cargar_ot(d_datos_ot,ld_nro_instalacion,ll_nro_aviso,ll_ult_ot,ll_brigada_resp,li_centro,li_cmd,li_puesto,ll_nro_incidencia,ib_tipo)
EXECUTE PB_SET_COMIENZO;

i_grabo=iu_2001_nu_ot.fnu_grabar_ot(lu_comunic.is_comunic.Accion_llamada,d_datos_ot)
IF i_grabo=0 THEN
        EXECUTE PB_SET_BACK;
        ib_valido=false
        return 1
END IF

// actualiza los estados de las brigadas a disponibles o no
// i_grabo=iu_2002_nu_bri.fnu_actualizar_brigadas_ot(d_lista_brigadas_ot,ll_ult_ot,ch_ot_anulada.checked) //Actualiza el estado 
//if is_contrata = 'BR' then //dsa

This.fnu_liberar_brigadas()
	//This.fw_marcar_previstas()
	//This.fw_comprobar_desdragueo()
//end if

IF i_grabo=0 THEN
        EXECUTE PB_SET_BACK;
        ib_valido=false
        return 1
END IF  
        
// graba las nuevas brigadas asignadas a la ot  

i_grabo=iu_2002_nu_bri.fnu_grabar_brigadas_ot(d_lista_brigadas_ot)

IF i_grabo=0 THEN
        EXECUTE PB_SET_BACK;
        ib_valido=false
        return 1
END IF

// Cargo objeto de comunicaciones para retornar.
        
gu_comunic1.is_comunic.datval1=iu_2001_nu_ot.fnu_devolver_fec_ini_ot(d_datos_ot)
gu_comunic1.is_comunic.longval4=ll_brigada_resp
gu_comunic1.is_comunic.longval2=ll_ult_ot
gu_comunic1.is_comunic.Programa_Retorno="iw_6201"

ib_valido=true
return 1

end event

event open;call super::open;// Permite asignar un abrigada
// Permite asignar un a orden de trabajo 
// Variables de trabajo
// La accion esperada para trabajar es "Alta" o "Modificacion"
// Se retornaran los datos en la variable gu_comunic1.is_comunic
// En gu_comunic1.is_comunic.Accion_retorno devuelve "Asignada"
// En caso de que no se haya efectuado la seleccion devuelve en
// gu_comunic1.is_comunic valores reseteados y en 
// gu_comunic1.is_comunic.Accion_retorno devuelve "No Asignada"
// CODIGO DEL EVENTO
//realiza el create de los objetos utilizados

int		li_filaW			//Fila en la que se encuentra la brigada wireless
int		li_numeroFilas	//N$$HEX1$$fa00$$ENDHEX$$mero de registros que contiene el dw de brigadas asignadas
string	ls_estado		//Estado wireless del aviso

//LSH INI 08/09/2013 evolutivo DEO12-00000263
Integer li_peligro;
//LSH FIN 08/09/2013 evolutivo DEO12-00000263

this.SetRedraw(FALSE)																		  
fw_crear_objetos() 

dw_ambito.fpr_crea_dddw()
dw_ambito.f_insertar_fila()
// GNU 20-6-2007. Mejora 1/327511
//dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)
dw_ambito.fnu_insertar_datos(gu_comunic1.is_comunic.intval3, gu_comunic1.is_comunic.intval4, gu_comunic1.is_comunic.intval5, 0)
// FIN GNU
dw_ambito.AcceptText()

// DSA INI 23/02/2000
sql_contratas = dw_lista_contratas.GetSqlSelect()
//iu_filtro.load(dw_seleccion)
iu_filtro.load(dw_lista_contratas)
//dw_seleccion.insertrow(0)
// DSA FIN 23/02/2000                            

// Cargo a Estructura de trabajo
lu_comunic.is_comunic = gu_comunic1.is_comunic

d_lista_brigadas_ot.SetTransObject(SQLCA)
                                                        // Analizo los parametros pasados
//IF lu_comunic.is_comunic.intval2 > fgci_incidencia_enviado_brigada THEN
//      ch_ot_anulada.Enabled=FALSE
//END IF

//IF IsNull(gu_comunic1.is_comunic.longval1) THEN      
//      lu_comunic.is_comunic.longval1=0   //N'umero de Incidencia 0
//END IF
IF IsNull(gu_comunic1.is_comunic.longval2) OR &
        gu_comunic1.is_comunic.longval2=0 THEN
        lu_comunic.is_comunic.longval2=iu_2001_nu_ot.fnu_actualizar_ultima_ot()
END IF

// Analizo  que programa me llamo y que accion me pide que realice
//Alta

//d_seleccion_brigada.InsertRow(0)
iu_2001_nu_ot.fnu_crea_dddw(d_datos_ot) 
iu_2020_nu_bri.fnu_crea_dddw(d_crit_seleccion)  
d_crit_seleccion.InsertRow(0)
//d_crit_seleccion.SetItem(1,"pi_turno",1)
d_crit_seleccion.SetItem(1,"pi_brigadas_en_turno",1)
d_crit_seleccion.SetItem(1,"pi_tipo_brig",1)
d_crit_seleccion.SetItem(1,"pdt_fecha_turno", fgnu_fecha_actual())
d_crit_seleccion.accepttext()
//iu_2001_nu_bri.fnu_mostrar_datos(d_seleccion_brigada)                          
iu_2001_nu_ot.fnu_mostrar_datos(d_datos_ot,lu_comunic.is_comunic.longval2)      




li_centro=gu_comunic1.is_comunic.intval3
li_cmd=gu_comunic1.is_comunic.intval4
li_puesto=gu_comunic1.is_comunic.intval5

dw_brigadas_calendario_rango.settransobject(sqlca)
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(fgnu_fecha_actual())), fgnu_fecha_actual())
tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.settransobject(sqlca)
tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.settransobject(sqlca)

// DSA 08/05/2000	
is_select_no_disp = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetSqlSelect()

// GNU 21-3-2007. Mejora 1/365151
if gi_pais=8 then
	d_crit_seleccion.SetItem(1,"pi_brigadas_en_turno",1)
else
	d_crit_seleccion.SetItem(1,"pi_brigadas_en_turno",0)
end if
// FIN GNU

if d_datos_ot.object.tip_brigada[1] = 1 then
	wf_cambiar_ot_tipo('BR')
//	iu_2002_nu_bri.fnu_obtener_brigadas_ot(d_lista_brigadas_ot,lu_comunic.is_comunic.longval2)
//   tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.retrieve(li_centro,li_cmd,li_puesto)
//   tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.retrieve(li_centro,li_cmd,li_puesto,lu_comunic.is_comunic.longval2)
	d_lista_brigadas_ot.Retrieve(lu_comunic.is_comunic.longval2)
	d_crit_seleccion.triggerevent('itemchanged')	
else
	wf_cambiar_ot_tipo('CO')
	d_lista_brigadas_ot.Retrieve(lu_comunic.is_comunic.longval2)	
	d_crit_seleccion.triggerevent('itemchanged')			
end if

//iu_2004_nu_bri.fnu_obtener_lista_brigadas(d_lista_brigadas,fgci_en_turno,fgci_disponible,li_centro,li_cmd,li_puesto)



/// Segun el programa que llama a la ventana, analizamos los datos a cargar

//*******************    ACCION LLAMADA ALTA     *********************//

IF lu_comunic.is_comunic.Accion_llamada = "Alta" then
        ib_tipo=true
        This.Title = lu_comunic.f_titulo_ventana("iw_6201",lu_comunic.is_comunic.accion_llamada)
		  d_datos_ot.object.f_desde[1] = gu_comunic1.is_comunic.datval1
		  d_datos_ot.object.est_ot[1] = fgci_ot_pendiente
		  //      this.fw_ocultar_ch_anulada(1)   //check box de anular oculto
END IF

//*******************   ACCION LLAMADA MODIFICACION    ***************//

IF lu_comunic.is_comunic.Accion_llamada = "Modificacion" then
	IF gb_operaciones AND IsValid(gu_rf_servidor_operacion) AND &
		fw_ot_de_operaciones(lu_comunic.is_comunic.longval2) THEN
		
		il_sesion_operacion = gu_rf_servidor_operacion.of_devuelve_sesion()
	END IF
	ib_tipo=false
   This.Title = lu_comunic.f_titulo_ventana("iw_6201",lu_comunic.is_comunic.accion_llamada)
   ib_devolver_alta=true
	IF wf_bloquear_brigadas_asignadas(1) = -1 THEN
		Close(This)
		Return
	END IF
END IF

//*****************    ACCION LLAMADA CONSULTA     ********************//

IF lu_comunic.is_comunic.Accion_llamada = "Consulta" THEN
        ib_tipo=false
        This.Title = lu_comunic.f_titulo_ventana("iw_6201",lu_comunic.is_comunic.accion_llamada)
//      this.fw_marcar_anulada()
//      ch_ot_anulada.Enabled=False
	
		  fw_deshabilitar_campos(dw_ambito)
	     fw_deshabilitar_campos(d_crit_seleccion)
		  fw_deshabilitar_campos(d_datos_ot)
		  fw_deshabilitar_campos(d_lista_brigadas_ot)
		  rb_1.enabled=false
		  rb_2.enabled=false
		  bmp_brigada_responsable.Enabled=False
END IF

//**********************************************************************//
if lu_comunic.is_comunic.programa_llamante = "w_1105_avi_aviso" or &
	lu_comunic.is_comunic.programa_llamante = "w_1203_inf_aviso" then // GNU 4-5-2006. Mejora 1/339429
        il_nro_aviso=lu_comunic.is_comunic.longval3
        d_datos_ot.setitem(1,"nro_aviso",il_nro_aviso)
elseif lu_comunic.is_comunic.programa_llamante="w_1105_avi_instal" or &
                 lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
            il_nro_instal=lu_comunic.is_comunic.decval1
            d_datos_ot.setitem(1,"nro_instalacion",il_nro_instal)
end if

//rb_turno.checked=true
this.SetRedraw(TRUE)

//inicializo el campo de finalizar ot a la fecha de hoy

if lu_comunic.is_comunic.programa_llamante="w_7101_consulta_descargos" then
        this.title="Asignar OT a Descargo"
//      ch_ot_anulada.visible=false
        d_lista_brigadas_ot.modify("f_desde.protect=0")
        d_lista_brigadas_ot.modify("f_desde.background.color="+gs_blanco)
end if  




tab_lista_brigadas.il_nro_ot=lu_comunic.is_comunic.longval2
wf_loadant()
ib_open = FALSE //Fuera del open event


//AHM(18/12/2007)
li_numeroFilas = d_lista_brigadas_ot.rowCount()
IF gi_pais = 6 AND li_numeroFilas > 0 THEN		//Comprobamos que estamos en EPSA
	li_filaw = d_lista_brigadas_ot.find('nro_brigada = 9001', 1, li_numeroFilas)	//Se busca si tiene asignada la brigada wireless
	IF li_filaw > 0 THEN									//Comprueba si se ha encontrado la brigada wireless
	
		SELECT est_wireless
		INTO	 :ls_estado
		FROM 	 gi_avisos
		WHERE  nro_aviso = :il_nro_aviso;
		
		IF NOT(ls_estado = 'R') THEN				//Comprueba si el estado wireless del aviso no es 'R'-> rechazado
			fw_deshabilitarTodaVentana()
		END IF
	END IF
END IF

//LSH INI 08/09/2013 evolutivo DEO12-00000263
//Validamos si existe peligro para el aviso
SELECT ind_peligro
INTO     :li_peligro
FROM    gi_avisos
WHERE  nro_aviso = :gl_tipo_aviso;

IF li_peligro <> 0 THEN
	 d_datos_ot.modify("t_1.Visible='1'")
	 d_datos_ot.modify("f_elim_peligro.Visible='1'")
END IF

gl_tipo_aviso = 0

//LSH FIN 08/09/2013 evolutivo DEO12-00000263
end event

event close;call super::close;int li_brigada

//PARAMETROS DE SALIDA
//              gu_comunic1.is_comunic.intval1= nro de brigada
//              gu_comunic1.is_comunic.longval1= nro de instalacion
//              gu_comunic1.is_comunic.longval2= nro de ot
//              gu_comunic1.is_comunic.intval2= estado incidencia

IF lu_comunic.is_comunic.Accion_llamada <> "Consulta" THEN
	wf_bloquear_brigadas_asignadas(0)
	fw_desbloq_brig_fin_trab()
END IF

gu_comunic1.is_comunic.programa_llamante=       lu_comunic.is_comunic.programa_llamante
gu_comunic1.is_comunic.accion_llamada=  lu_comunic.is_comunic.accion_llamada
gu_comunic2.is_comunic.longval5 = lu_comunic.is_comunic.longval2

fw_close_objetos()



end event

on w_6201_asignacion_de_brigada.create
int iCurrent
call super::create
this.d_lista_brigadas_ot=create d_lista_brigadas_ot
this.bmp_brigada_responsable=create bmp_brigada_responsable
this.dw_bri_ant=create dw_bri_ant
this.dw_control_brigadas=create dw_control_brigadas
this.dw_brigadas_calendario_rango=create dw_brigadas_calendario_rango
this.rb_1=create rb_1
this.dw_lista_contratas=create dw_lista_contratas
this.tab_lista_brigadas=create tab_lista_brigadas
this.d_crit_seleccion=create d_crit_seleccion
this.d_datos_ot=create d_datos_ot
this.dw_ambito=create dw_ambito
this.rb_2=create rb_2
this.gb_2=create gb_2
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_brigadas_ot
this.Control[iCurrent+2]=this.bmp_brigada_responsable
this.Control[iCurrent+3]=this.dw_bri_ant
this.Control[iCurrent+4]=this.dw_control_brigadas
this.Control[iCurrent+5]=this.dw_brigadas_calendario_rango
this.Control[iCurrent+6]=this.rb_1
this.Control[iCurrent+7]=this.dw_lista_contratas
this.Control[iCurrent+8]=this.tab_lista_brigadas
this.Control[iCurrent+9]=this.d_crit_seleccion
this.Control[iCurrent+10]=this.d_datos_ot
this.Control[iCurrent+11]=this.dw_ambito
this.Control[iCurrent+12]=this.rb_2
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.gb_1
end on

on w_6201_asignacion_de_brigada.destroy
call super::destroy
destroy(this.d_lista_brigadas_ot)
destroy(this.bmp_brigada_responsable)
destroy(this.dw_bri_ant)
destroy(this.dw_control_brigadas)
destroy(this.dw_brigadas_calendario_rango)
destroy(this.rb_1)
destroy(this.dw_lista_contratas)
destroy(this.tab_lista_brigadas)
destroy(this.d_crit_seleccion)
destroy(this.d_datos_ot)
destroy(this.dw_ambito)
destroy(this.rb_2)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6201_asignacion_de_brigada
integer x = 594
end type

type d_lista_brigadas_ot from u_bri_2002_pr_list_brigadas_ot within w_6201_asignacion_de_brigada
integer x = 55
integer y = 424
integer width = 2354
integer height = 384
integer taborder = 50
string dragicon = "ENV_MAN.ICO"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event dragdrop;//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
// 23/02/2000     DSA				Introducir las contratas
//
////////////////////////////////////////////////////////////////////////////////////////////////

long     ll_nro_brigada //DBE 13/12/1999
int li_lock_status     //DBE 13/12/1999

su_drag_brigada_ot s_estructura 
long i, ll_cant_row
int li_brig_permitida,li_turno,li_disponible
datawindow objeto
//datetime ld_fecha_ini_ot
long ll_nro_ot
long ll_ccli_afec
int li_unica_brig
long ll_nro_aviso
int li_error

int li_fila
long ll_est_ot

d_datos_ot.accepttext()
ll_nro_aviso=d_datos_ot.getitemnumber(1,"nro_aviso")

objeto=DraggedObject()
IF typeof(Objeto)=DataWindow! and (objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp" or &
	objeto.DataObject="d_bri_2004_pr_lista_brigadas") then 
	
   ll_nro_brigada=objeto.getitemnumber(click_row,'nro_brigada')
        
//   dw_control_brigadas.settransobject(sqlca)
//   dw_control_brigadas.RETRIEVE(ll_nro_brigada,d_datos_ot.getitemnumber(1,'nro_ot'))
//                  
//   if dw_control_brigadas.rowcount() > 0 and objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp" then
//	   gnv_msg.f_mensaje("AI89","","",OK!)
//      //messagebox("Aviso","La Brigada se encuentra trabajando en otra OT / Tarea")
//      parent.d_crit_seleccion.triggerevent('itemchanged')
//      return
//   end if
                
end if


IF typeof(Objeto)=DataWindow! THEN
	IF objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp" or &
		objeto.DataObject="d_con_2004_pr_lista_contratas"	THEN// DSA 23/02/2000
			
      //ld_fecha_ini_ot=iu_2001_nu_ot.fnu_devolver_fec_ini_ot(d_datos_ot)
	 
		IF objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp" THEN
      
			s_estructura=tab_lista_brigadas.fpr_devolver_brigada &
				 				(fgnu_fecha_actual(),click_row, &
								 tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles)
		
		else
          s_estructura=tab_lista_brigadas.fpr_devolver_brigada &
				 				(fgnu_fecha_actual(),click_row, &
								 dw_lista_contratas)
		end if							

      s_estructura.nro_ot=d_datos_ot.GetItemNumber(1,"nro_ot")
      
		if objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp"  then 
		
			li_lock_status=gnu_u_transaction.uf_lock_brigada(ll_nro_brigada)
   	   IF li_lock_status<>0 THEN
      		this.SelectRow(0, FALSE)
         	//gnv_msg.f_mensaje("AI96","La Brigada","modificada",OK!)
	         li_brig_permitida = 0
			ELSE
				dw_control_brigadas.settransobject(sqlca)
   			dw_control_brigadas.RETRIEVE(ll_nro_brigada,d_datos_ot.getitemnumber(1,'nro_ot'))
                  
   			if dw_control_brigadas.rowcount() > 0 then
	   			gnv_msg.f_mensaje("AI89","","",OK!)
			      //messagebox("Aviso","La Brigada se encuentra trabajando en otra OT / Tarea")
      			//parent.d_crit_seleccion.triggerevent('itemchanged')
      			li_brig_permitida = 0 
					gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
				ELSE
					li_brig_permitida = iu_2002_rn_bri.frn_validar_drag_brigada(d_lista_brigadas_ot,s_estructura.nro_brigada)
					IF li_brig_permitida <> 1 THEN
						gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
					END IF
				END IF
			END IF
		else
				li_brig_permitida = iu_2002_rn_bri.frn_validar_drag_brigada(d_lista_brigadas_ot,s_estructura.nro_brigada)			//dsa
		END IF
		//li_brig_permitida=iu_2002_rn_bri.frn_validar_drag_brigada(d_lista_brigadas_ot,s_estructura.nro_brigada)
      
		IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
      	
			iu_2002_nu_bri.fnu_agregar_brigada(d_lista_brigadas_ot,s_estructura, is_contrata)
         // A$$HEX1$$f100$$ENDHEX$$ado estado de la ot PACHO
         d_lista_brigadas_ot.accepttext()
         ll_est_ot=d_datos_ot.object.est_ot[1]
         li_fila=this.rowcount()

			if  is_contrata = 'BR' then// DSA 23/02/2000
			   tab_lista_brigadas.fpr_quitar_brigada&
						 					(s_estructura.nro_brigada,&
											 tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles,&
											 li_turno,li_disponible,&
											 tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles)

         	tab_lista_brigadas.fpr_actualizar_dw_no_disp(s_estructura, &
            	                     0,0,fgnu_fecha_actual(), &
                                    0,"",1, &
			                           1,d_datos_ot.GETITEMDECIMAL(1,"NRO_OT"),click_row,1)

			else
			   tab_lista_brigadas.fpr_quitar_brigada&
						 					(s_estructura.nro_brigada,&
											 dw_lista_contratas,&
											 0,0, dw_lista_contratas)
			end if                             					 
      END IF
	END IF
 
 	IF objeto.DataObject="d_bri_2004_pr_lista_brigadas" THEN
		// SE INTENTA ASIGNAR UNA BRIGADA NO DISPONIBLE
	
   	d_datos_ot.AcceptText()
      //ld_fecha_ini_ot = d_datos_ot.GetItemDateTime(1,"f_desde")
      s_estructura=tab_lista_brigadas.fpr_devolver_brigada(fgnu_fecha_actual(),click_row,tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles)
      s_estructura.nro_ot=d_datos_ot.GetItemNumber(1,"nro_ot")
		// Se bloquea la brigada
		li_lock_status=gnu_u_transaction.uf_lock_brigada(ll_nro_brigada)
  	   IF li_lock_status<>0 THEN
     		this.SelectRow(0, FALSE)
        	//gnv_msg.f_mensaje("AI96","La Brigada","modificada",OK!)
         li_brig_permitida = 0
		ELSE
	      li_brig_permitida = wf_valida_drag_brigada_no_disp(s_estructura.nro_brigada)
			IF li_brig_permitida <> 1 THEN
				// La brigada no se puede asignar. Se desbloquea
				gnu_u_transaction.uf_unlock_brigada(ll_nro_brigada)
			END IF
		END IF

      IF (s_estructura.Click_Row > 0) AND (li_brig_permitida = 1) THEN

	      // Llamo a la ventana de desasignar a la brigada de la OT / Tarea 
         // en que esta trabajando para asignarla a la OT actual
                 
         // Cargo en la estructura de comunicaciones las variables necesarias 
         // para abrir la ventana de desasignar brigada
                    
         fgnu_resetear_s_comunicaciones(gu_comunic)
                      
//	     	ld_fecha_ini_ot=iu_2001_nu_ot.fnu_devolver_fec_ini_ot(d_datos_ot)
//       s_estructura=tab_lista_brigadas.fpr_devolver_brigada(ld_fecha_ini_ot,click_row,tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles)
//       s_estructura.nro_ot=d_datos_ot.GetItemNumber(1,"nro_ot")
//       li_brig_permitida=iu_2002_rn_bri.frn_validar_drag_brigada(d_lista_brigadas_ot,s_estructura.nro_brigada)
        
		  	IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
         	// Si esta asignada a una tarea
            IF tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_ot") = 0 OR &
            	IsNull(tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_ot")) THEN
                              
               gu_comunic.is_comunic.accion_llamada = "tarea" 
               gu_comunic.is_comunic.intval4 = 0
					gu_comunic.is_comunic.longval4 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_tarea")
                              
            ELSE            // Si esta asignada a una ot
               gu_comunic.is_comunic.accion_llamada = "ot" 
             	gu_comunic.is_comunic.intval2 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"gi_incidencia_est_actual")
                         
               ll_nro_ot = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_ot")
					gu_comunic.is_comunic.longval4 = ll_nro_ot
					
               SELECT count(*) 
					into :li_unica_brig 
					FROM GI_BRIGADA_OT
               WHERE NRO_OT = :ll_nro_ot AND 
							F_HASTA IS NULL;
                              
               gu_comunic.is_comunic.intval4 = li_unica_brig
               gu_comunic.is_comunic.longval1 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_instalacion")
               gu_comunic.is_comunic.longval2 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_incidencia")
               gu_comunic.is_comunic.strval1 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemString(click_row,"instalacion_afectada")
               gu_comunic.is_comunic.datval2 = idt_fec_deteccion
//               gu_comunic.is_comunic.strval3 = ls_nomcalle
				                              
          	END IF
            gu_comunic.is_comunic.programa_llamante = "w_2301"
            gu_comunic.is_comunic.longval3 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemNumber(click_row,"nro_brigada")
            gu_comunic.is_comunic.strval2 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemString(click_row,"brigada")
            gu_comunic.is_comunic.datval1 = tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.GetItemDateTime(click_row,"f_inicio_tarea_ot")
                      
            // Llamo a la ventana de desasignar brigada             
            Open(w_2302_asignar_brigada)
                      
            // Si la ventana pudo desasignar la brigada, proceso
            IF gu_comunic.is_comunic.programa_retorno="w_2302" THEN
					IF gu_comunic.is_comunic.accion_retorno = "aceptado"  THEN
               	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.DeleteRow(click_row)
                  iu_2002_nu_bri.fnu_agregar_brigada(d_lista_brigadas_ot,s_estructura,is_contrata)
                  // A$$HEX1$$f100$$ENDHEX$$ado estado de la ot PACHO
                  d_lista_brigadas_ot.accepttext()
                  d_lista_brigadas_ot.object.est_brigada[this.scrolltorow(this.rowcount())]=fgci_ot_trabajando
                  li_disponible = 0
                  // tab_lista_brigadas.fpr_quitar_brigada(s_estructura.nro_brigada,tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles,li_turno,li_disponible,tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles)
                  
						// Actualizo en la datawindow la nueva OT a la que esta asignada
                  tab_lista_brigadas.fpr_actualizar_dw_no_disp(s_estructura, &
                                        0,0,fgnu_fecha_actual(), &
                                        0,"",1, &
                                        1,d_datos_ot.GETITEMDECIMAL(1,"NRO_OT"),click_row,1)
						
                              
	           	ELSE            // Si cancelo
   			  		gnu_u_transaction.uf_unlock_brigada(s_estructura.nro_brigada)
                  Return
               END IF
                              
           	END IF
       	END IF
	 	END IF
/////////////////////////////////// DBE fin comment 17/12/1999
	END IF
END IF
this.Drag(End!)

IF This.RowCount() > 0 THEN
	d_datos_ot.object.est_ot[1] = fgci_ot_trabajando
end if

if This.RowCount() > 1 and objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp"  then
	li_fila = This.Find("tipo = 'Brig.'", 0, this.rowCount())
	IF li_fila > 0 and li_fila < This.RowCount() THEN
		li_fila = This.Find("tipo = 'Brig.'", li_fila + 1 , this.rowCount())
		
		IF li_fila > 0 THEN
			bmp_brigada_responsable.visible=true	
		ELSE
			bmp_brigada_responsable.visible=False
		END IF	
	END IF
END IF

//AHM (17/12/2007)
IF gi_pais = 6 AND rb_2.checked THEN			//Comprueba que estamos en EPSA y que es una contrata
	IF s_estructura.nro_brigada = 9001 THEN	//Se ha seleccionado la brigada wireless
		IF NOT(fw_hayOtraBrigadaTrabajando(s_estructura.nro_brigada, THIS)) THEN			//No hay otra brigada trabajando
			PARENT.fw_deshabilitarTodaVentana()
		ELSE
			messageBox('Error', 'La brigada wireless no puede ser asignada a una OT que ya tiene otra brigada trabajando', exclamation!)
			d_lista_brigadas_ot.DeleteRow(d_lista_brigadas_ot.find("nro_brigada = " + string (9001), 1, d_lista_brigadas_ot.rowCount()))
			SetPointer(HourGlass!)
			PARENT.triggerevent("ue_armar_sql")
			dw_lista_contratas.Retrieve()	
		END IF
	END IF
END IF


end event

on destructor;call u_bri_2002_pr_list_brigadas_ot::destructor;//gnv_msg.f_error(15)
end on

event dragenter;call super::dragenter;datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
        IF objeto.DataObject="d_bri_2004_pr_lista_brigadas" OR &
           objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp"   or &
			  objeto.DataObject="d_con_2004_pr_lista_contratas"		THEN //dsa
			  
                This.BorderStyle = StyleLowered!
                                
        END IF
END IF
end event

event dragleave;call super::dragleave;datawindow objeto

objeto = source 
IF typeof(Objeto)=DataWindow! THEN
        IF objeto.DataObject="d_bri_2004_pr_lista_brigadas" OR &
           objeto.DataObject="d_bri_2004_pr_lista_brigadas_disp"   or &
   		  objeto.DataObject="d_con_2004_pr_lista_contratas" THEN //dsa               
                This.BorderStyle = StyleRaised!
                                
        END IF
END IF

end event

event itemchanged;int li_nueva_brig_resp
datetime ldt_fecha_ingresada, ldt_f_nula, ldt_f_brigada_old
string ls_columna_bri_ot 

this.Drag(End!)

SetNull(ldt_f_nula)
ls_columna_bri_ot = dwo.name
ldt_f_brigada_old = This.GetItemDateTime(row,ls_columna_bri_ot)


This.AcceptText()

if row>0 then
	
	this.SetItem(row,"f_hasta",fgnu_valido_fecha_nula(This.GetItemDateTime(row,"f_hasta")))
	
	ldt_fecha_ingresada = This.GetItemDateTime(row,ls_columna_bri_ot)

	IF ldt_fecha_ingresada > fgnu_fecha_actual() THEN
		gnv_msg.f_mensaje("AI93","","",OK!)
		//MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Fecha ingresada no puede ser mayor que la fecha actual.")
		This.SetItem(row, ls_columna_bri_ot, ldt_f_brigada_old)
		This.AcceptText()
		This.SetColumn(ls_columna_bri_ot)
		
		Return 1
	END IF
	
	IF ls_columna_bri_ot = "f_desde" AND ldt_fecha_ingresada < gu_comunic1.is_comunic.datval1 THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La fecha de inicio de la brigada no puede ser menor que la fecha del aviso")	
		This.SetItem(row, ls_columna_bri_ot, ldt_f_brigada_old)
		This.AcceptText()
		This.SetColumn(ls_columna_bri_ot)
		
		Return 1
	END IF	
	
	IF ls_columna_bri_ot = "f_hasta" THEN
		// Si la fecha de hasta es menor que la fecha de desde, error
		IF ldt_fecha_ingresada < this.GetItemDateTime(row,"f_desde") THEN
			// La fecha de fin de tareas no puede ser menor que la fecha de inicio.
			//gnv_msg.f_mensaje("AI90", "", "", OK!)
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La fecha de fin de tareas no puede ser menor que la fecha de inicio.")
			This.SetItem(row,"f_hasta",ldt_f_nula)
			This.AcceptText()
			return 1
		END IF
		
	END IF
end if

IF ls_columna_bri_ot = "f_hasta" AND NOT IsNull(ldt_fecha_ingresada) THEN
	IF This.GetItemstring(row,'tipo') = 'Brig.' THEN
		This.SetItem(row, 'trabajo_resuelto', '1')		
		This.SetItem(row, 'ind_disponible', '1')
	END IF
	This.SetItem(row, 'est_brigada', fgci_ot_trabajando) // Se finaliza el trabajo de la brigada /contrata
																			  // al grabar la OT
	// Si es una brigada la que ha terminado su trabajo se comprueba si es responsable de la OT.
	// En caso de que sea responsable hay que escoger otra brigada responsable en caso de que 
	// exista. Si no hay m$$HEX1$$e100$$ENDHEX$$s brigadas se tiene que verificar que exista al menos una contrata
	IF This.GetItemstring(row,'tipo') = 'Brig.' AND &
		This.GetItemNumber(row, 'ind_responsable') = 1 THEN
		
		li_nueva_brig_resp = This.Find("ind_responsable = 0 and isnull(f_hasta) and tipo = 'Brig.'", 0, this.rowcount())
		IF li_nueva_brig_resp > 0 THEN
			iu_2002_nu_bri.fnu_asignar_responsable(d_lista_brigadas_ot,li_nueva_brig_resp)
		END IF
	END IF
END IF





end event

event clicked;call super::clicked;
long ll_nro_brigada, est_brigada
int li_encontrado
datetime ldt_1,ldt_2,ldt_3,ldt_4

IF lu_comunic.is_comunic.accion_llamada="Consulta" THEN
        Return
END IF



click_row_brig_ot = this.GetRow()     //ANG

ScrollToRow(row)			

//IF click_row_brig_ot>0 THEN //DBE 14/12/1999
if row > 0 then               //DBE 14/12/1999

	
	click_row_brig_ot=row      //DBE 14/12/1999
	this.setrow(row)           //DBE 14/12/1999        
	ll_nro_brigada = d_lista_brigadas_ot.object.nro_brigada[click_row_brig_ot]
	est_brigada	  = d_lista_brigadas_ot.object.est_brigada[click_row_brig_ot]		
	fg_SetRow(d_lista_brigadas_ot)
	li_encontrado = dw_bri_ant.Find("nro_brigada="+string(ll_nro_brigada),1,dw_bri_ant.RowCount())
//	IF NOT fgnu_es_nula (d_lista_brigadas_ot.GetItemDateTime(click_row_brig_ot,"f_desde")) and li_encontrado > 0  THEN
//			 Return
//	END IF	
	
	// DSA 22/03/2000 Para deshabilitar Drag mientras editando 
	if dwo.Type = 'column' then	
		if dwo.name = 'f_desde' OR dwo.name = 'f_hasta' then	
			return
		end if
	end if
	IF This.object.est_brigada[click_row_brig_ot] < fgci_ot_trabajando THEN
		this.Drag(Begin!)	
	END IF
	this.triggerevent(scrollhorizontal!)
		  
END IF


end event

event itemerror;return 1
end event

event rowfocuschanged;call super::rowfocuschanged;//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
// 23/02/2000     DSA				Introducir las contratas
//
////////////////////////////////////////////////////////////////////////////////////////////////

// DSA INI 23/02/2000
// Dishabilitarlo para no poder elegir otro tipo de los trabajadores (brigadas/contratas) si 
// ya hemos seleccionado uno.
//if  currentrow > 0 then 
//		rb_1.enabled = FALSE
//		rb_2.enabled = FALSE		
//else
//		rb_1.enabled = TRUE
//		rb_2.enabled = TRUE
//end if
// DSA FIN 23/02/2000
int li_fila

This.SetRedraw(False)
IF currentrow > 0 THEN
	
	IF This.GetItemstring(currentrow,'tipo') = 'Brig.' THEN
		li_fila = This.Find("tipo = 'Brig.'", 0, this.rowCount())
		IF li_fila > 0 and li_fila < This.RowCount() THEN
			li_fila = This.Find("tipo = 'Brig.'", li_fila + 1 , this.rowCount())
		
			IF li_fila > 0 THEN
				bmp_brigada_responsable.visible=true	
			ELSE
				bmp_brigada_responsable.visible=False
			END IF	
		END IF
	ELSE
		bmp_brigada_responsable.visible=False	
	END IF
END IF

ScrollToRow(currentrow)	

This.SetRedraw(True)
end event

event losefocus;call super::losefocus;This.Accepttext()
end event

event scrollhorizontal;call super::scrollhorizontal;// Este Script soluciona el problema de que cuando un campo fecha esta cortado por la mitad 
// y se escribe se cae el sistema

// Estado 0 Deshabilitado
// Estado 1 Habilitado

// Este Script soluciona el problema de que cuando un campo fecha esta cortado por la mitad 
// y se escribe se cae el sistema

long rows, ll_desp = 0
rows = this.rowcount() 

if  rows > 0 then

	if rows > 2 then
		ll_desp = 70

	end if
	//Guardamos el valor del campo para caso cuando el campo pierde el foco 
   //this.AcceptText() 
	

	if scrollpos < 150 + ll_desp  then
		SetTabOrder("f_hasta",0)
	else
		SetTabOrder("f_hasta",40)
	end if
	
end if


end event

event retrieveend;call super::retrieveend;//if rowcount > 0 then
//		rb_1.enabled = FALSE
//		rb_2.enabled = FALSE		
//end if
end event

event sqlpreview;//
end event

type bmp_brigada_responsable from picture within w_6201_asignacion_de_brigada
string tag = "ujujujujujuj"
boolean visible = false
integer x = 1262
integer y = 84
integer width = 174
integer height = 140
string picturename = "altcontr.bmp"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;long ll_row

ll_row=d_lista_brigadas_ot.GetRow()     //ANG

IF ll_row >0 THEN
        iu_2002_nu_bri.fnu_asignar_responsable(d_lista_brigadas_ot,ll_row)
ELSE
	gnv_msg.f_mensaje("AI04","Brigada","",OK!)
END IF
end event

type dw_bri_ant from datawindow within w_6201_asignacion_de_brigada
boolean visible = false
integer x = 512
integer y = 68
integer width = 174
integer height = 140
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_inc_2050_brigadas_anteriores"
borderstyle borderstyle = stylelowered!
end type

type dw_control_brigadas from datawindow within w_6201_asignacion_de_brigada
boolean visible = false
integer x = 137
integer y = 60
integer width = 64
integer height = 76
boolean bringtotop = true
string dataobject = "d_2001_bri_control_brig_trab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_brigadas_calendario_rango from datawindow within w_6201_asignacion_de_brigada
boolean visible = false
integer x = 2414
integer y = 1024
integer width = 494
integer height = 360
boolean bringtotop = true
string dataobject = "d_brigadas_calendario_rango_fechas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_1 from radiobutton within w_6201_asignacion_de_brigada
integer x = 2962
integer y = 156
integer width = 338
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Brigadas"
boolean checked = true
end type

event clicked;Datetime ldt_fecha_turno

wf_cambiar_ot_tipo('BR')

// GNU 23-5-2006. Mejora 1/442721
d_crit_seleccion.SetItem(1,"pi_tipo_brig",1)
parent.triggerevent("ue_armar_sql")
// FIN GNU

ldt_fecha_turno = d_crit_seleccion.GetItemDatetime(1, 'pdt_fecha_turno')
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(ldt_fecha_turno)), ldt_fecha_turno)
if tab_lista_brigadas.SelectedTab = 2 and tab_lista_brigadas.il_retrieve = 0 then
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.SetRedraw(False)
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.retrieve()
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.SetRedraw(True)
END IF	
tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.SetRedraw(False)
tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.retrieve(lu_comunic.is_comunic.longval2)
tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.SetRedraw(True)

tab_lista_brigadas.il_retrieve = 0
//
end event

type dw_lista_contratas from u_gen_0002_pr_generico within w_6201_asignacion_de_brigada
boolean visible = false
integer x = 55
integer y = 808
integer width = 2359
integer height = 632
integer taborder = 80
string dataobject = "d_con_2004_pr_lista_contratas"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;w_6201_asignacion_de_brigada.click_row = Row	//ANG

IF w_6201_asignacion_de_brigada.lu_comunic.is_comunic.accion_llamada="Consulta" THEN
	Return
END IF

IF w_6201_asignacion_de_brigada.click_row > 0 THEN
	this.SelectRow(0, FALSE)

	this.SetRow(w_6201_asignacion_de_brigada.Click_row)
	this.SelectRow(w_6201_asignacion_de_brigada.Click_row,true)
				//Si la ot no esta anulada permito el draged
	fg_SetRow(dw_lista_contratas)
	this.Drag(Begin!)
END IF
end event

event doubleclicked;call super::doubleclicked;if row>0 then
	if this.object.cantidad_ot[row] > 0 or this.object.cantidad_tp[row] > 0 then

		gu_comunic.is_comunic.intval1 = gi_nro_centro
		gu_comunic.is_comunic.intval2 = gi_nro_cmd
		gu_comunic.is_comunic.intval3 = gi_nro_puesto
		gu_comunic.is_comunic.longval1 = this.object.nro_brigada[row]
		gu_comunic.is_comunic.strval1 = this.object.brigada[row]
		gu_comunic.is_comunic.strval2 = 'CO'
		gu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA"
		open(w_6205_consulta_tareas)
	end if
end if
end event

event dragdrop;call super::dragdrop;su_drag_brigada_ot s_estructura 
long i, ll_cant_row
int li_brig_permitida,li_turno,li_disponible,li_fila,li_fila_no_disp
datawindow objeto
//datetime ld_fecha_ini_ot
this.setredraw(FALSE)
this.accepttext()

objeto=DraggedObject()
IF typeof(Objeto)=DataWindow! THEN

		IF objeto.DataObject="d_bri_2002_pr_list_brigadas_ot" THEN
		long xx
		xx=w_6201_asignacion_de_brigada.click_row_brig_ot
		
		IF d_lista_brigadas_ot.GetItemString(xx, 'tipo') = 'Cont.' THEN
			s_estructura=iu_2002_nu_bri.fnu_devolver_brigada_ot( &
														d_lista_brigadas_ot,&
														 click_row_brig_ot)
			li_brig_permitida=iu_2002_rn_bri.frn_validar_quitar_brigada_ot(&
														d_lista_brigadas_ot,&
														s_estructura.nro_brigada)
														
			IF (s_estructura.Click_Row >0) AND (li_brig_permitida=1) THEN
				d_lista_brigadas_ot.DeleteRow(s_estructura.Click_Row )
				//d_crit_seleccion.triggerevent("itemchanged")
				SetPointer(HourGlass!)
				parent.triggerevent("ue_armar_sql")
				//dw_lista_contratas.SetRedraw(FALSE)
				dw_lista_contratas.Retrieve()	
//				if (not ib_open) and dw_lista_contratas.rowcount() < 1 then 
//					gnv_msg.f_mensaje("IT01","","",OK!) 
//				end if
			END IF
		END IF
	END IF
END IF

this.Drag(End!)

IF d_lista_brigadas_ot.RowCount()= 0 THEN
	d_datos_ot.object.est_ot[1] = fgci_ot_pendiente
END IF

this.setredraw(TRUE)
end event

event retrieveend;// Filtro por calendario
long ll_fila
long ll_nro_cont

SetPointer(HourGlass!)

IF rowcount <= 0 THEN Return 0


// Si no esta seleccionado "Brigadas en turno"
// entonces no filtro
IF Parent.d_crit_seleccion.GetItemNumber(1,"pi_brigadas_en_turno") = 1 THEN
	
	FOR ll_fila = 1 TO rowcount
		ll_nro_cont = This.Object.nro_brigada[ll_fila]
		
		IF NOT fw_equipo_disponible(ll_nro_cont,'CO') THEN
			SetPointer(HourGlass!)
			This.Object.ind_disponible[ll_fila] = 0
		END IF
	NEXT
	
	This.SetFilter('ind_disponible <> 0')
	This.Filter()
ELSE
	This.SetFilter('')
	This.Filter()
END IF
This.SetFilter('')

// Vuelvo a dibujar la pantalla
This.SetRedraw(True)

end event

event sqlpreview;//
end event

event ue_as_need;//
end event

type tab_lista_brigadas from u_tab_brigadas_avisos within w_6201_asignacion_de_brigada
integer x = 50
integer y = 808
integer width = 2359
integer height = 632
integer taborder = 70
integer textsize = 0
integer weight = 0
fontcharset fontcharset = ansi!
fontpitch fontpitch = default!
fontfamily fontfamily = anyfont!
string facename = ""
long backcolor = 81324524
boolean boldselectedtext = false
integer selectedtab = 0
end type

event selectionchanged;call super::selectionchanged;setpointer(hourglass!)

if newindex = 2 and tab_lista_brigadas.il_retrieve = 0 then
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.SetRedraw(False)
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.dbcancel()
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.reset()
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.retrieve()
	tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.SetRedraw(True)
	tab_lista_brigadas.il_retrieve = 1
END IF
if newindex=-1 then
	tab_lista_brigadas.selecttab(1)
end if
end event

type d_crit_seleccion from datawindow within w_6201_asignacion_de_brigada
event ue_itemchanged ( )
integer x = 1659
integer y = 120
integer width = 1257
integer height = 236
integer taborder = 30
string dataobject = "d_bri_2019_crit_seleccion_2"
boolean border = false
boolean livescroll = true
end type

event ue_itemchanged;int ll_en_turno
Datetime ldt_fecha_turno
string ls_campo

This.AcceptText()
ls_campo = this.GetColumnName()
// si el campo modificado es el de las brigadas en turno, entonces se conmuta el valor a mano
// para que el cambio tenga efecto antes de traer los datos, ya que de no ser a s$$HEX1$$ed00$$ENDHEX$$, el 
// cambio no tiene efecto hasta que no se sale de este script

IF ls_campo = "pi_brigadas_en_turno" OR ls_campo = "pdt_fecha_turno"THEN 
	IF ls_campo = "pi_brigadas_en_turno" THEN
		ll_en_turno = getItemNumber(1, "pi_brigadas_en_turno")
		IF ll_en_turno = 0 THEN
			This.Object.pdt_fecha_turno.Protect = 0
			This.Object.pdt_fecha_turno.Background.color = gs_blanco
			SetItem(1, "pi_brigadas_en_turno",1)
		
		ELSE
			SetItem(1, "pi_brigadas_en_turno",0)
			This.Object.pdt_fecha_turno.Protect = 1
			This.Object.pdt_fecha_turno.Background.color = gs_gris
		END IF
	END IF
END IF

SetPointer(HourGlass!)
parent.triggerevent("ue_armar_sql")

// Se traen las brigadas o contratas en turno
ldt_fecha_turno = This.GetItemDatetime(1, 'pdt_fecha_turno')
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(ldt_fecha_turno)), ldt_fecha_turno)

if is_contrata = 'BR' then//dsa     
	tab_lista_brigadas.il_retrieve = 0
	// Se traen las brigadas disponibles, as$$HEX2$$ed002000$$ENDHEX$$como las no disponibles
	if tab_lista_brigadas.SelectedTab = 2 and tab_lista_brigadas.il_retrieve = 0 then
		tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.SetRedraw(False)
		tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.dbcancel()
		tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.reset()
		tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.retrieve()
		tab_lista_brigadas.tabpage_no_disponibles.dw_brigadas_no_disponibles.SetRedraw(True)
		tab_lista_brigadas.il_retrieve = 1
	
	END IF
	tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.SetRedraw(False)
	tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.retrieve(lu_comunic.is_comunic.longval2)
	tab_lista_brigadas.tabpage_disponibles.dw_brigadas_disponibles.SetRedraw(True)
	
else	
	// Se traen las contratas
	dw_lista_contratas.SetRedraw(FALSE)
	dw_lista_contratas.Retrieve()	
	dw_lista_contratas.SetRedraw(TRUE)
//	if (not ib_open) and dw_lista_contratas.rowcount() < 1 then 
//		gnv_msg.f_mensaje("IT01","","",OK!) 
//	end if
end if

end event

event itemchanged;This.TriggerEvent('ue_itemchanged')

end event

event losefocus;This.AcceptText()
end event

type d_datos_ot from u_ot_2001_pr_form_orden_de_trabajo within w_6201_asignacion_de_brigada
event ue_post_item ( )
integer x = 2423
integer y = 424
integer width = 1102
integer height = 1016
integer taborder = 60
borderstyle borderstyle = styleraised!
end type

event ue_post_item;//long il_error
//il_error=this.setitem(1,"fin_ot",0)
end event

on destructor;call u_ot_2001_pr_form_orden_de_trabajo::destructor;//gnv_msg.f_error(55)
end on

event itemchanged;call super::itemchanged;int li_contador,li_cont
//boolean lb_todos
datetime fecha, ldt_f_antigua,ldt_f_desde,ldt_f_hasta, ldt_f_elim_antigua

//LSH INI 08/09/2013 evolutivo DEO12-00000263
datetime ld_gen_max,ld_fecha_generada

ld_fecha_generada = This.GetItemDateTime(row, 'f_desde')
ld_gen_max = datetime(RelativeDate(date(ld_fecha_generada), 3) , time(ld_fecha_generada))

IF dwo.name = 'f_elim_peligro' THEN
	ldt_f_elim_antigua = This.GetItemDateTime(row, 'f_elim_peligro')
END IF
//LSH FIN 08/09/2013 evolutivo DEO12-00000263

IF dwo.name = 'f_hasta' THEN
	ldt_f_antigua = This.GetItemDateTime(row, 'f_hasta')
END IF

this.accepttext()

d_lista_brigadas_ot.accepttext()

//lb_todos=true

//LSH INI 08/09/2013 evolutivo DEO12-00000263
IF dwo.name = 'f_elim_peligro' THEN
	IF This.GetItemDateTime(row, 'f_elim_peligro') <= This.GetItemDateTime(row, 'f_desde') THEN
		Messagebox("Atencion","La fecha de eliminacion de peligro no puede ser menor o igual que la fecha generada",Exclamation!)
		This.SetItem(row, 'f_elim_peligro', ldt_f_elim_antigua)
		This.AcceptText()
		This.SetColumn('f_elim_peligro')		
		Return 1
	END IF

	IF This.GetItemDateTime(row, 'f_elim_peligro') > ld_gen_max THEN
		Messagebox("Atencion","La fecha de eliminacion de peligro no debe sobrepasar 3 dias despues de la fecha generada", Exclamation!)
		This.SetItem(row, 'f_elim_peligro', ldt_f_elim_antigua)
		This.AcceptText()
		This.SetColumn('f_elim_peligro')		
		Return 1
	END IF
END IF
//LSH FIN 08/09/2013 evolutivo DEO12-00000263



IF dwo.name = 'f_hasta' THEN
	
	// FDO Validaci$$HEX1$$f300$$ENDHEX$$n de las fechas de las brigadas Incidencia 0/372386
	ldt_f_hasta = d_lista_brigadas_ot.object.f_hasta[1]
	ldt_f_desde = d_lista_brigadas_ot.object.f_desde[1]

	For li_cont = 1 to d_lista_brigadas_ot.rowcount()
		if ldt_f_desde > d_lista_brigadas_ot.object.f_desde[li_cont] then
				ldt_f_desde = d_lista_brigadas_ot.object.f_desde[li_cont]
   	end if

	   if ldt_f_hasta < d_lista_brigadas_ot.object.f_hasta[li_cont] then
				ldt_f_hasta = d_lista_brigadas_ot.object.f_hasta[li_cont]
      end if
	next

	IF This.GetItemDateTime(row, 'f_hasta') > fgnu_fecha_actual() THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La fecha de fin de la OT no puede ser mayor que la fecha actual")	
		This.SetItem(row, 'f_hasta', ldt_f_antigua)
		This.AcceptText()
		This.SetColumn('f_hasta')		
		Return 1
	END IF
	
	IF This.GetItemDateTime(row, 'f_hasta') <= This.GetItemDateTime(row, 'f_desde') THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La fecha de fin de la OT no puede ser menor o igual que la fecha de inicio")	
		This.SetItem(row, 'f_hasta', ldt_f_antigua)
		This.AcceptText()
		This.SetColumn('f_hasta')		
		Return 1
	END IF

	IF This.GetItemDateTime(row, 'f_hasta') < ldt_f_hasta or This.GetItemDateTime(row, 'f_desde') > ldt_f_desde THEN
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Las fechas de inicio y fin de las brigadas deben estar comprendidas entre las fechas de inicio y fin de la OT.")	
		This.SetItem(row, 'f_hasta', ldt_f_antigua)
		This.AcceptText()
		This.SetColumn('f_hasta')		
		Return 1
	END IF	
	
	IF fw_finalizar_ot() = -1 THEN
		This.SetItem(row, 'f_hasta', ldt_f_antigua)
		This.AcceptText()
		This.SetColumn('f_hasta')		
		Return 1
	END IF

	d_datos_ot.setitem(1, 'est_ot', fgci_ot_resuelta)
	this.accepttext()
	Parent.SetFocus()
	
END IF

//if this.GetColumnName()="fin_ot" then 
//        
//	
//	if data='1' then
//		if messagebox("Aviso","La opci$$HEX1$$f300$$ENDHEX$$n 'Finalizar OT' pondr$$HEX2$$e1002000$$ENDHEX$$una Fecha de Fin a la OT y" + &
//                         " a todas las brigadas que en ella se encuentran trabajando. La fecha de" + &
//                         " fin de la Ot ser$$HEX2$$e1002000$$ENDHEX$$la fecha actual. $$HEX1$$bf00$$ENDHEX$$Esta seguro de realizar la operaci$$HEX1$$f300$$ENDHEX$$n?", information!, OKCANCEL!)=1 then
//   
//			SetItem(1, "fin_ot",1)
//      	if not isnull(d_datos_ot.object.f_desde[1]) then
//                        
//         	for li_cont = 1 to d_lista_brigadas_ot.rowcount()
//            	if isnull(d_lista_brigadas_ot.object.f_desde[li_cont]) then 
//               	lb_todos=false
//               end if
//            next
//                                
//            if lb_todos=true then
//					d_datos_ot.setitem(1,"f_hasta",fgnu_fecha_actual())
//               iu_2001_rn_ot.frn_deshabilitar(d_datos_ot,1)
//               bmp_brigada_responsable.Enabled=False
//               tab_lista_brigadas.enabled=false
//               this.enabled=false
//               il_conta = 0
//               
//					for li_contador=1 to d_lista_brigadas_ot.rowcount()
//               	if isnull(d_lista_brigadas_ot.object.f_hasta[li_contador]) then
//                  	d_lista_brigadas_ot.setitem(li_contador,"f_hasta",fgnu_fecha_actual())
//                     il_conta ++
//                     il_segur[il_conta]=li_contador
//                     d_datos_ot.settaborder("fin_ot",0)
//                  end if
//               next    
//               
//				else
//            	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Las Brigadas Deber$$HEX1$$e100$$ENDHEX$$n Tener Fecha de Inicio de Tareas")
//               this.postevent("ue_post_item")
//            end if
//        	end if
//        	
//		else
//			SetItem(1, "fin_ot",0)
//      	d_datos_ot.setitem(1,"f_hasta",setnull(fecha))
//         iu_2001_rn_ot.frn_deshabilitar(d_datos_ot,0)
//         bmp_brigada_responsable.Enabled=True
//         tab_lista_brigadas.enabled=true
//         for li_contador=1 to il_conta
//         	d_lista_brigadas_ot.setitem(il_segur[li_contador],"f_hasta",setnull(fecha))
//         next
//         
//			il_conta=0
//     	end if
//	else
//      //this.postevent("ue_post_item")
//	end if
//end if
///// Si solo hay un registro en la datawindow de las brigadas setea 
//// autom$$HEX1$$e100$$ENDHEX$$ticamente las fechas de esta
//
//if d_lista_brigadas_ot.rowcount()=1 then
//     
//   if not isnull(this.object.f_desde[1]) and &
//      this.object.f_desde[1]<= fgnu_fecha_actual() then
//   
//   	d_lista_brigadas_ot.object.f_desde[1]= this.object.f_desde[1]
//   end if          
//        // fecha hasta
//   if not isnull(this.object.f_hasta[1]) and &
//                this.object.f_desde[1] > this.object.f_hasta[1] then
//  		d_lista_brigadas_ot.object.f_hasta[1]= this.object.f_hasta[1]
//   end if          
//end if
end event

event itemerror;call super::itemerror;return 1
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_6201_asignacion_de_brigada
integer x = 82
integer y = 12
integer width = 987
integer height = 400
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

event itemchanged;call super::itemchanged;d_crit_seleccion.setcolumn('pi_tipo_brig')
d_crit_seleccion.TriggerEvent("itemchanged")
end event

type rb_2 from radiobutton within w_6201_asignacion_de_brigada
integer x = 2962
integer y = 240
integer width = 343
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Contratas"
end type

event clicked;Datetime ldt_fecha_turno

wf_cambiar_ot_tipo('CO')	

// GNU 23-5-2006. Mejora 1/442721
long ll_tipo_brig

SELECT CODIGO
INTO :ll_tipo_brig
FROM SGD_VALOR
WHERE  "SGD_VALOR"."CODIF" = 'TBRD';

IF sqlca.sqlcode=100 THEN ll_tipo_brig=1;

d_crit_seleccion.SetItem(1,"pi_tipo_brig",ll_tipo_brig)
// FIN GNU

parent.triggerevent("ue_armar_sql")
ldt_fecha_turno = d_crit_seleccion.GetItemDatetime(1, 'pdt_fecha_turno')
dw_brigadas_calendario_rango.Retrieve(Datetime(Date(ldt_fecha_turno)), ldt_fecha_turno)

dw_lista_contratas.SetRedraw(FALSE)
dw_lista_contratas.Retrieve()	
dw_lista_contratas.SetRedraw(TRUE)
//if (not ib_open) and dw_lista_contratas.rowcount() < 1 then 
//	gnv_msg.f_mensaje("IT01","","",OK!) 
//end if



end event

type gb_2 from groupbox within w_6201_asignacion_de_brigada
integer x = 2926
integer y = 96
integer width = 475
integer height = 240
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_6201_asignacion_de_brigada
integer x = 1595
integer y = 44
integer width = 1865
integer height = 332
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
string text = " Criterios de selecci$$HEX1$$f300$$ENDHEX$$n "
end type


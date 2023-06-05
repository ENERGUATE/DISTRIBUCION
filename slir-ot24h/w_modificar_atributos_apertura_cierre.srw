HA$PBExportHeader$w_modificar_atributos_apertura_cierre.srw
$PBExportComments$Ventana  que se llama desde el tab Maniobras de una incidencia
forward
global type w_modificar_atributos_apertura_cierre from window
end type
type cb_cancelar from commandbutton within w_modificar_atributos_apertura_cierre
end type
type cb_aceptar from commandbutton within w_modificar_atributos_apertura_cierre
end type
type tab_1 from tab within w_modificar_atributos_apertura_cierre
end type
type tabpage_apertura from userobject within tab_1
end type
type cb_aceptar_apertura from commandbutton within tabpage_apertura
end type
type uo_atributos_apertura from u_modificar_atributos within tabpage_apertura
end type
type tabpage_apertura from userobject within tab_1
cb_aceptar_apertura cb_aceptar_apertura
uo_atributos_apertura uo_atributos_apertura
end type
type tabpage_cierre from userobject within tab_1
end type
type cb_aceptar_cierre from commandbutton within tabpage_cierre
end type
type uo_atributos_cierre from u_modificar_atributos within tabpage_cierre
end type
type tabpage_cierre from userobject within tab_1
cb_aceptar_cierre cb_aceptar_cierre
uo_atributos_cierre uo_atributos_cierre
end type
type tab_1 from tab within w_modificar_atributos_apertura_cierre
tabpage_apertura tabpage_apertura
tabpage_cierre tabpage_cierre
end type
end forward

global type w_modificar_atributos_apertura_cierre from window
integer width = 2889
integer height = 2192
boolean titlebar = true
string title = "Atributos de la Indisponibilidad"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_cancelar cb_cancelar
cb_aceptar cb_aceptar
tab_1 tab_1
end type
global w_modificar_atributos_apertura_cierre w_modificar_atributos_apertura_cierre

type variables


boolean ib_modificacion_tabpg1 = false
boolean ib_modificacion_tabpg2 = false

str_atributos_maniobra_indisponibilidad istr_atributos
end variables

forward prototypes
public subroutine wf_open_atributos_maniobra (datastore pds_atributos)
public subroutine wf_open_atributos_indisponibilidad_apert (datawindow pdw_atributos, long pl_row)
public subroutine wf_open_atributos_indisponibilidad (datawindow pdw_atributos, long pl_row)
public subroutine wf_open_atributos_indisponibilidad_cierr (datawindow pdw_atributos, long pl_row)
public function integer wf_close_atributos_maniobra (datastore pds_atributos)
public function integer wf_close_atributos_indisponibilidad ()
public function integer wf_close_atributos_indisp_apertura ()
public function integer wf_close_atributos_indisp_cierre ()
public function long wf_set_activo_maniobra (long pl_cm_activo)
public function long wf_set_tipo_movimiento (long pl_cod_maniobra, long pl_estado)
end prototypes

public subroutine wf_open_atributos_maniobra (datastore pds_atributos);
long ll_codigo_activo
str_atributos_str_ext lstr_atributos

if not isnull(pds_atributos.object.cod_maniobra[1]) then 
	lstr_atributos.pl_codigo_evento =  pds_atributos.object.cod_maniobra[1] 
end if  

if not isnull(pds_atributos.object.tipo_evento[1]) then 
	lstr_atributos.pl_tipo_reporte =  pds_atributos.object.tipo_evento[1] 
end if  


if not isnull(pds_atributos.object.cod_elemento[1]) then 
	
	ll_codigo_activo = wf_set_activo_maniobra(pds_atributos.object.cod_elemento[1])
	lstr_atributos.pl_activo =  ll_codigo_activo
	//hallar los valores asociados
end if                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
if not isnull(pds_atributos.object.estado[1]) then 
	lstr_atributos.pl_tipo_movimiento = pds_atributos.object.estado[1] 
end if                                                                                                                                                                                                                                                                                                                                                                                                                                                     

if not isnull(pds_atributos.object.fecha_maniobra[1]) then 
	lstr_atributos.pdt_tiempo_ocurrencia = pds_atributos.object.fecha_maniobra[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pds_atributos.object.fecha_reporte_cnd[1]) then 
	lstr_atributos.pdt_tiempo_reporte = pds_atributos.object.fecha_reporte_cnd[1] 
end if                                                                                                                                                                                                                                                                                                                                                                                                                                          

if not isnull(pds_atributos.object.fecha_instruccion_cnd[1]) then 
	lstr_atributos.pdt_tiempo_instruccion 	=  pds_atributos.object.fecha_instruccion_cnd[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pds_atributos.object.disponibilidad[1]) then 
	lstr_atributos.pl_disponibilidad_act = pds_atributos.object.disponibilidad[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
if not isnull(pds_atributos.object.cod_causa[1]) then
	lstr_atributos.pl_causa_detallada =  pds_atributos.object.cod_causa[1] 
end if                                                                                                                                                                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
if not isnull(pds_atributos.object.fec_causa[1]) then 
	lstr_atributos.pdt_fecha_causa = pds_atributos.object.fec_causa[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
if not isnull(pds_atributos.object.consignacion[1]) then 
	lstr_atributos.pl_consignacion_nac_check =  pds_atributos.object.consignacion[1] 
end if	

if not isnull(pds_atributos.object.numero[1]) then 
	lstr_atributos.ps_consignacion_nacional =  pds_atributos.object.numero[1] 
end if	

if not isnull(pds_atributos.object.tipo_psm[1]) then 
	lstr_atributos.pl_psm = pds_atributos.object.tipo_psm[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
if not isnull(pds_atributos.object.demora[1]) then 
	lstr_atributos.pl_demora_justificada = pds_atributos.object.demora[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     

if not isnull(pds_atributos.object.descripcion_demora[1]) then 
	lstr_atributos.ps_descripcion_demora =  pds_atributos.object.descripcion_demora[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pds_atributos.object.cm_activo_causante[1]) then 
	lstr_atributos.pl_activo_causante = LONG(pds_atributos.object.cm_activo_causante[1] )
end if                                                                                                                                                                                                                                                                                                                                                                                                                                         

if not isnull(pds_atributos.object.observaciones[1]) then 
	lstr_atributos.ps_observaciones = pds_atributos.object.observaciones[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pds_atributos.object.fecha_bypass[1]) then 
	lstr_atributos.pdt_fecha_bypass = pds_atributos.object.fecha_bypass[1] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             
	      
tab_1.tabpage_apertura.uo_atributos_apertura.uf_set_atributos(lstr_atributos)	








end subroutine

public subroutine wf_open_atributos_indisponibilidad_apert (datawindow pdw_atributos, long pl_row);

long ll_codigo_activo, ll_estado
str_atributos_str_ext lstr_atributos

lstr_atributos.pl_codigo_evento = pdw_atributos.object.t_mapertura[pl_row] 
lstr_atributos.pl_tipo_movimiento = 0

if not isnull(pdw_atributos.object.nro_instalacion[pl_row]) then 
	ll_codigo_activo = pdw_atributos.object.nro_instalacion[pl_row]
	lstr_atributos.pl_activo =  pdw_atributos.object.nro_instalacion[pl_row] 
	//hallar los valores asociados
end if                                                                                                                                                                                                                                                                                                                                                                                                                                            
        
		  
		  
if not isnull(pdw_atributos.object.tipo_reporte[pl_row]) then 
	lstr_atributos.pl_tipo_reporte =  pdw_atributos.object.tipo_reporte[pl_row] 
end if 

ll_estado = 1 //Estamos en apertura	
//AHM (06/04/2010) Tipo de movimiento depende del estado de la maniobra
//ll_estado = wf_set_tipo_movimiento(ll_codigo_activo, ll_estado)
ll_estado = wf_set_tipo_movimiento(pdw_atributos.object.t_mapertura[pl_row], ll_estado)
lstr_atributos.pl_tipo_movimiento = ll_estado
if ll_estado = 3 then
	lstr_atributos.pl_tipo_reporte = 3 
end if

if not isnull(pdw_atributos.object.f_alta[pl_row]) then 
	lstr_atributos.pdt_tiempo_ocurrencia = pdw_atributos.object.f_alta[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_reporte[pl_row]) then 
	lstr_atributos.pdt_tiempo_reporte = pdw_atributos.object.tiempo_reporte[pl_row] 
end if                                                                                                                                                                                                                                                                                                                                                                                                                                          

if not isnull(pdw_atributos.object.tiempo_instruccion[pl_row]) then 
	lstr_atributos.pdt_tiempo_instruccion 	=  pdw_atributos.object.tiempo_instruccion[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.disponibilidad_act[pl_row]) then 
	lstr_atributos.pl_disponibilidad_act = pdw_atributos.object.disponibilidad_act[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
if not isnull(pdw_atributos.object.cod_causa[pl_row]) then
	lstr_atributos.pl_causa_detallada =  pdw_atributos.object.cod_causa[pl_row] 
end if                                                                                                                                                                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
if not isnull(pdw_atributos.object.fecha_causa[pl_row]) then 
	lstr_atributos.pdt_fecha_causa = pdw_atributos.object.fecha_causa[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
if not isnull(pdw_atributos.object.consignacion_nacional[pl_row]) then 
	lstr_atributos.ps_consignacion_nacional =  pdw_atributos.object.consignacion_nacional[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     

if not isnull(pdw_atributos.object.psm[pl_row]) then 
	lstr_atributos.pl_psm = pdw_atributos.object.psm[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
if not isnull(pdw_atributos.object.demora_justificada[pl_row]) then 
	lstr_atributos.pl_demora_justificada = pdw_atributos.object.demora_justificada[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     

if not isnull(pdw_atributos.object.descripcion_demora[pl_row]) then 
	lstr_atributos.ps_descripcion_demora =  pdw_atributos.object.descripcion_demora[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.cm_activo_causante[pl_row]) then 
	lstr_atributos.pl_activo_causante = LONG(pdw_atributos.object.cm_activo_causante[pl_row] )
end if                                                                                                                                                                                                                                                                                                                                                                                                                                         

if not isnull(pdw_atributos.object.observaciones[pl_row]) then 
	lstr_atributos.ps_observaciones = pdw_atributos.object.observaciones[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.fecha_bypass[pl_row]) then 
	lstr_atributos.pdt_fecha_bypass = pdw_atributos.object.fecha_bypass[pl_row] 
end if	

//JME 01/02/2010
if not isnull(pdw_atributos.object.tiempo_instruccion_despeje[pl_row]) then 
	lstr_atributos.pdt_tiempo_instruccion_despeje = pdw_atributos.object.tiempo_instruccion_despeje[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_ocurrencia_despeje[pl_row]) then 
	lstr_atributos.pdt_tiempo_ocurrencia_despeje = pdw_atributos.object.tiempo_ocurrencia_despeje[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_reporte_despeje[pl_row]) then 
	lstr_atributos.pdt_tiempo_reporte_despeje = pdw_atributos.object.tiempo_reporte_despeje[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_instruccion_tierra[pl_row]) then 
	lstr_atributos.pdt_tiempo_instruccion_tierra = pdw_atributos.object.tiempo_instruccion_tierra[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_ocurrencia_tierra[pl_row]) then 
	lstr_atributos.pdt_tiempo_ocurrencia_tierra = pdw_atributos.object.tiempo_ocurrencia_tierra[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_reporte_tierra[pl_row]) then 
	lstr_atributos.pdt_tiempo_reporte_tierra = pdw_atributos.object.tiempo_reporte_tierra[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

tab_1.tabpage_apertura.uo_atributos_apertura.uf_set_atributos(lstr_atributos)			

end subroutine

public subroutine wf_open_atributos_indisponibilidad (datawindow pdw_atributos, long pl_row);
str_atributos_str_ext lstr_atributos

wf_open_atributos_indisponibilidad_apert(pdw_atributos, pl_row)

if istr_atributos.ps_accion_llamada = 'Consulta' then 
	tab_1.tabpage_apertura.uo_atributos_apertura.Enabled = false
	tab_1.tabpage_apertura.cb_aceptar_apertura.enabled = false
end if


if not isnull(pdw_atributos.object.t_mcierre[pl_row]) or &
   (not isnull( pdw_atributos.object.f_reposicion[pl_row]) ) then 
	
	wf_open_atributos_indisponibilidad_cierr(pdw_atributos, pl_row)
	tab_1.tabpage_cierre.visible = true
	
	if istr_atributos.ps_accion_llamada = 'Consulta' then 
		tab_1.tabpage_cierre.uo_atributos_cierre.Enabled = false
		tab_1.tabpage_cierre.cb_aceptar_cierre.enabled = false
	end if	
else 
	tab_1.tabpage_cierre.visible = false
end if
end subroutine

public subroutine wf_open_atributos_indisponibilidad_cierr (datawindow pdw_atributos, long pl_row);
str_atributos_str_ext lstr_atributos
long ll_codigo_activo, ll_estado

lstr_atributos.pl_codigo_evento = pdw_atributos.object.t_mcierre[pl_row] 
lstr_atributos.pl_tipo_movimiento = 1
                                                	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
if not isnull(pdw_atributos.object.nro_instalacion[pl_row]) then 
	ll_codigo_activo = pdw_atributos.object.nro_instalacion[pl_row]
	lstr_atributos.pl_activo =  pdw_atributos.object.nro_instalacion[pl_row] 
	//hallar los valores asociados
end if                                                                                                                                                                                                                                                                                                                                                                                                                                            

if not isnull(pdw_atributos.object.tipo_reporte_m_c[pl_row]) then 
	lstr_atributos.pl_tipo_reporte =  pdw_atributos.object.tipo_reporte_m_c[pl_row] 
end if 
                                          	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
																																																																																																																																																																																											  
ll_estado = 0 //Estamos en CIERRE	
//AHM (06/04/2010) Tipo de movimiento depende del estado de la maniobra
//ll_estado = wf_set_tipo_movimiento(ll_codigo_activo, ll_estado)
ll_estado = wf_set_tipo_movimiento(pdw_atributos.object.t_mcierre[pl_row], ll_estado)
lstr_atributos.pl_tipo_movimiento = ll_estado
if ll_estado = 3 then
	lstr_atributos.pl_tipo_reporte = 3 
end if

if not isnull(pdw_atributos.object.f_alta[pl_row]) then 
	lstr_atributos.pdt_tiempo_ocurrencia = pdw_atributos.object.f_reposicion[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.tiempo_reporte_m_c[pl_row]) then 
	lstr_atributos.pdt_tiempo_reporte = pdw_atributos.object.tiempo_reporte_m_c[pl_row] 
end if                                                                                                                                                                                                                                                                                                                                                                                                                                          

if not isnull(pdw_atributos.object.tiempo_instruccion_m_c[pl_row]) then 
	lstr_atributos.pdt_tiempo_instruccion 	=  pdw_atributos.object.tiempo_instruccion_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.disponibilidad_act_m_c[pl_row]) then 
	lstr_atributos.pl_disponibilidad_act = pdw_atributos.object.disponibilidad_act_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
if not isnull(pdw_atributos.object.cod_causa_m_c[pl_row]) then
	lstr_atributos.pl_causa_detallada =  pdw_atributos.object.cod_causa_m_c[pl_row] 
end if                                                                                                                                                                                                                                                                                                                                                                                                       
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
if not isnull(pdw_atributos.object.fecha_causa[pl_row]) then 
	lstr_atributos.pdt_fecha_causa = pdw_atributos.object.fecha_causa[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
if not isnull(pdw_atributos.object.consignacion_nacional_m_c[pl_row]) then 
	lstr_atributos.ps_consignacion_nacional =  pdw_atributos.object.consignacion_nacional_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     

if not isnull(pdw_atributos.object.psm_m_c[pl_row]) then 
	lstr_atributos.pl_psm = pdw_atributos.object.psm_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     
                                                	                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
if not isnull(pdw_atributos.object.demora_justificada_m_c[pl_row]) then 
	lstr_atributos.pl_demora_justificada = pdw_atributos.object.demora_justificada_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                     

if not isnull(pdw_atributos.object.descripcion_demora_m_c[pl_row]) then 
	lstr_atributos.ps_descripcion_demora =  pdw_atributos.object.descripcion_demora_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.cm_activo_causante[pl_row]) then 
	lstr_atributos.pl_activo_causante = LONG(pdw_atributos.object.cm_activo_causante_m_c[pl_row] )
end if                                                                                                                                                                                                                                                                                                                                                                                                                                         

if not isnull(pdw_atributos.object.observaciones[pl_row]) then 
	lstr_atributos.ps_observaciones = pdw_atributos.object.observaciones_m_c[pl_row] 
end if	                                                                                                                                                                                                                                                                                                                                                                                                                                             

if not isnull(pdw_atributos.object.fecha_bypass_m_c[pl_row]) then 
	lstr_atributos.pdt_fecha_bypass = pdw_atributos.object.fecha_bypass_m_c[pl_row] 
end if	   

//AHM (16/03/2010)
IF NOT isnull(pdw_atributos.object.observaciones_m_c[pl_row]) THEN 
	lstr_atributos.ps_observaciones = pdw_atributos.object.observaciones_m_c[pl_row] 
END IF
	      
tab_1.tabpage_cierre.uo_atributos_cierre.uf_set_atributos(lstr_atributos)			

end subroutine

public function integer wf_close_atributos_maniobra (datastore pds_atributos);
int li_status = 0
long ll_status 
boolean lb_status


tab_1.tabpage_apertura.uo_atributos_apertura.dw_atributos.AcceptText()

lb_status = tab_1.tabpage_apertura.uo_atributos_apertura.uf_verificacion_campos_correctos()

if lb_status then 
	
	li_status = tab_1.tabpage_apertura.uo_atributos_apertura.uf_get_maniobra_updated(istr_atributos.pds_atributos_maniobra)
	
	if li_status = 1 then 	
		istr_atributos.pb_ind_modificaciones = true			
	//else
	//	istr_atributos.pb_ind_modificaciones = false
	end if
else
	li_status = -1
end if


return li_status 
	







end function

public function integer wf_close_atributos_indisponibilidad ();
int li_status = 0


li_status = wf_close_atributos_indisp_apertura()

if li_status <> -1 then 

	if li_status = 1 then 	
		ib_modificacion_tabpg1 = true	
	end if
	
	if tab_1.tabpage_cierre.visible = true then 
		
		li_status = wf_close_atributos_indisp_cierre()
	
		if li_status <> -1 then 
			
			if li_status = 1 then ib_modificacion_tabpg2 = true	
			
		end if
	end if
end if

if li_status <> -1 then 
	if ib_modificacion_tabpg2 or ib_modificacion_tabpg1 then 
		istr_atributos.pb_ind_modificaciones = true			
	end if	
end if
	
return li_status



	

	
	
	
	

end function

public function integer wf_close_atributos_indisp_apertura ();
int li_status = 0
boolean lb_status

tab_1.tabpage_apertura.uo_atributos_apertura.dw_atributos.AcceptText()

lb_status = tab_1.tabpage_apertura.uo_atributos_apertura.uf_verificacion_campos_correctos() //(istr_atributos.pds_atributos_maniobra)

if lb_status then 

	li_status = tab_1.tabpage_apertura.uo_atributos_apertura.uf_get_indisponibilidad_apertura_updated(istr_atributos.pdw_indisponibilidad, istr_atributos.pl_row)
	
	if li_status = 1 then 	
		istr_atributos.pb_ind_modificaciones = true
	else
		istr_atributos.pb_ind_modificaciones = false
	end if

else
	li_status = -1
end if

return li_status 
	







end function

public function integer wf_close_atributos_indisp_cierre ();

int li_status = 0
boolean lb_status

tab_1.tabpage_cierre.uo_atributos_cierre.dw_atributos.AcceptText()

lb_status = tab_1.tabpage_cierre.uo_atributos_cierre.uf_verificacion_campos_correctos() 

if lb_status then 
	li_status = tab_1.tabpage_cierre.uo_atributos_cierre.uf_get_indisponibilidad_cierre_updated(istr_atributos.pdw_indisponibilidad, istr_atributos.pl_row)
	
	if li_status = 1 then 	
		istr_atributos.pb_ind_modificaciones = true
	else
		istr_atributos.pb_ind_modificaciones = false
	end if
else
	li_status = -1
end if

return li_status 
	







end function

public function long wf_set_activo_maniobra (long pl_cm_activo);
long ll_activo

select nvl(cm_activo, 0)
  into :ll_activo
  from VISTA_ACTIVO_ELEMENTO
 where cm = :pl_cm_activo;
 
 return ll_activo
end function

public function long wf_set_tipo_movimiento (long pl_cod_maniobra, long pl_estado);
//Estado de la maniobra:  1 Apertura
//								0 Cierre
//
//Tipo activo: 1 Bah$$HEX1$$ed00$$ENDHEX$$a								
//								


long ll_tipo_movimiento, ll_tipo_activo

//Quitamos este control poque ahora puede haber cambio de estado y de tap.

//AHM (06/04/2010) Tipo de movimiento depende del estado de la maniobra
SELECT estado
INTO :ll_tipo_movimiento
FROM sgd_maniobra
WHERE cod_maniobra = :pl_cod_maniobra;

//return pl_estado

RETURN ll_tipo_movimiento

//select nvl(tipo_activo, 0)
//  into :ll_tipo_activo
//  from sgd_instalacion_at
//  where nro_instalacion = :pl_cod_activo;
//  
//  
//if ll_tipo_activo = 1 then   
//	//Si es bah$$HEX1$$ed00$$ENDHEX$$a el tipo de movimiento es el de la maniobra
//	ll_tipo_movimiento = pl_estado
//else
//	ll_tipo_movimiento = 3	
//end if
  
//return ll_tipo_movimiento
end function

on w_modificar_atributos_apertura_cierre.create
this.cb_cancelar=create cb_cancelar
this.cb_aceptar=create cb_aceptar
this.tab_1=create tab_1
this.Control[]={this.cb_cancelar,&
this.cb_aceptar,&
this.tab_1}
end on

on w_modificar_atributos_apertura_cierre.destroy
destroy(this.cb_cancelar)
destroy(this.cb_aceptar)
destroy(this.tab_1)
end on

event open;

istr_atributos = Message.PowerObjectParm

////AHM (06/04/2010) No se debe visualizar los tiempo de tierra y despeje cuando se entra desde maniobras
tab_1.tabpage_apertura.uo_atributos_apertura.uf_asignartipomodificacion(istr_atributos.ps_tipo_modificacion)
tab_1.tabpage_cierre.uo_atributos_cierre.uf_asignartipomodificacion(istr_atributos.ps_tipo_modificacion)


if (istr_atributos.ps_tipo_modificacion = 'MANIOBRA') then 
	this.Title = 'Atributos de la Maniobra'
	tab_1.tabpage_cierre.Visible = False	
	wf_open_atributos_maniobra(istr_atributos.pds_atributos_maniobra)	
	if istr_atributos.ps_accion_llamada = 'Consulta' then 
		tab_1.tabpage_apertura.uo_atributos_apertura.Enabled = false
		tab_1.tabpage_apertura.cb_aceptar_apertura.enabled = false
	end if


else
	this.Title = 'Atributos de la Indisponibilidad'
	wf_open_atributos_indisponibilidad(istr_atributos.pdw_indisponibilidad, istr_atributos.pl_row)
end if

this.SetRedraw(True)
end event

event close;

CloseWithReturn(w_modificar_atributos_apertura_cierre,istr_atributos)
end event

type cb_cancelar from commandbutton within w_modificar_atributos_apertura_cierre
boolean visible = false
integer x = 1280
integer y = 1920
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Cancelar"
end type

event clicked;

istr_atributos.pb_ind_modificaciones = FALSE
Close(Parent)

end event

type cb_aceptar from commandbutton within w_modificar_atributos_apertura_cierre
boolean visible = false
integer x = 951
integer y = 1920
integer width = 343
integer height = 92
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Aceptar"
end type

event clicked;
int li_status = 0 

if (istr_atributos.ps_tipo_modificacion = 'MANIOBRA') then 
	li_status = wf_close_atributos_maniobra(istr_atributos.pds_atributos_maniobra)
else
	li_status = wf_close_atributos_indisponibilidad()
end if

if li_status <> -1 then 
	Close(Parent)
end if




end event

type tab_1 from tab within w_modificar_atributos_apertura_cierre
integer y = 12
integer width = 2875
integer height = 2100
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_apertura tabpage_apertura
tabpage_cierre tabpage_cierre
end type

on tab_1.create
this.tabpage_apertura=create tabpage_apertura
this.tabpage_cierre=create tabpage_cierre
this.Control[]={this.tabpage_apertura,&
this.tabpage_cierre}
end on

on tab_1.destroy
destroy(this.tabpage_apertura)
destroy(this.tabpage_cierre)
end on

type tabpage_apertura from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2839
integer height = 1984
long backcolor = 67108864
string text = "Alta"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_aceptar_apertura cb_aceptar_apertura
uo_atributos_apertura uo_atributos_apertura
end type

on tabpage_apertura.create
this.cb_aceptar_apertura=create cb_aceptar_apertura
this.uo_atributos_apertura=create uo_atributos_apertura
this.Control[]={this.cb_aceptar_apertura,&
this.uo_atributos_apertura}
end on

on tabpage_apertura.destroy
destroy(this.cb_aceptar_apertura)
destroy(this.uo_atributos_apertura)
end on

type cb_aceptar_apertura from commandbutton within tabpage_apertura
integer x = 2446
integer y = 1872
integer width = 343
integer height = 92
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Aceptar"
end type

event clicked;int li_status = 0 

if (istr_atributos.ps_tipo_modificacion = 'MANIOBRA') then 
	li_status = wf_close_atributos_maniobra(istr_atributos.pds_atributos_maniobra)
else
	li_status = wf_close_atributos_indisp_apertura()
end if

if li_status = 1 then 
	messagebox("", "El sistema ha guardado la informaci$$HEX1$$f300$$ENDHEX$$n de alta con $$HEX1$$e900$$ENDHEX$$xito", Exclamation!, OK!)
	tab_1.tabpage_apertura.uo_atributos_apertura.Enabled = false
end if
end event

type uo_atributos_apertura from u_modificar_atributos within tabpage_apertura
integer width = 2839
integer height = 1868
integer taborder = 30
end type

on uo_atributos_apertura.destroy
call u_modificar_atributos::destroy
end on

type tabpage_cierre from userobject within tab_1
integer x = 18
integer y = 100
integer width = 2839
integer height = 1984
long backcolor = 67108864
string text = "Cierre"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_aceptar_cierre cb_aceptar_cierre
uo_atributos_cierre uo_atributos_cierre
end type

on tabpage_cierre.create
this.cb_aceptar_cierre=create cb_aceptar_cierre
this.uo_atributos_cierre=create uo_atributos_cierre
this.Control[]={this.cb_aceptar_cierre,&
this.uo_atributos_cierre}
end on

on tabpage_cierre.destroy
destroy(this.cb_aceptar_cierre)
destroy(this.uo_atributos_cierre)
end on

type cb_aceptar_cierre from commandbutton within tabpage_cierre
integer x = 2446
integer y = 1872
integer width = 343
integer height = 92
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Aceptar"
end type

event clicked;int li_status = 0 

if (istr_atributos.ps_tipo_modificacion = 'MANIOBRA') then 
	li_status = wf_close_atributos_maniobra(istr_atributos.pds_atributos_maniobra)
else
	li_status = wf_close_atributos_indisp_cierre()
end if

if li_status = 1 then 
	messagebox("", "El sistema ha guardado la informaci$$HEX1$$f300$$ENDHEX$$n de cierre con $$HEX1$$e900$$ENDHEX$$xito", Exclamation!, OK!)
	tab_1.tabpage_cierre.uo_atributos_cierre.Enabled = false
end if


//
//if li_status <> -1 then 
//	Close(Parent)
//end if
end event

type uo_atributos_cierre from u_modificar_atributos within tabpage_cierre
integer height = 1880
integer taborder = 20
end type

on uo_atributos_cierre.destroy
call u_modificar_atributos::destroy
end on


HA$PBExportHeader$w_1201_recepcion_aviso.srw
$PBExportComments$Permite registrar los distintos avisos que ingresan al sistema.
forward
global type w_1201_recepcion_aviso from w_sgigenerica
end type
type sle_telefono from singlelineedit within w_1201_recepcion_aviso
end type
type d_imp_aviso from datawindow within w_1201_recepcion_aviso
end type
type st_nro_aviso2 from statictext within w_1201_recepcion_aviso
end type
type st_ord_corte from statictext within w_1201_recepcion_aviso
end type
type st_avi_peligro from statictext within w_1201_recepcion_aviso
end type
type st_clase_avi from statictext within w_1201_recepcion_aviso
end type
type d_inf_resumen from u_avi_2004_pr_form_inf_resumen within w_1201_recepcion_aviso
end type
type st_aviso_pend from statictext within w_1201_recepcion_aviso
end type
type p_aviso_pend from picture within w_1201_recepcion_aviso
end type
type p_ord_corte from picture within w_1201_recepcion_aviso
end type
type st_nis2 from statictext within w_1201_recepcion_aviso
end type
type st_nis from statictext within w_1201_recepcion_aviso
end type
type d_nis_rad from u_nis_2001_pr_nis_rad within w_1201_recepcion_aviso
end type
type st_3 from statictext within w_1201_recepcion_aviso
end type
type d_clase_avi from u_avi_2013_pr_clase_aviso within w_1201_recepcion_aviso
end type
type st_4 from statictext within w_1201_recepcion_aviso
end type
type st_5 from statictext within w_1201_recepcion_aviso
end type
type p_avi_calidad from picture within w_1201_recepcion_aviso
end type
type st_avi_calidad from statictext within w_1201_recepcion_aviso
end type
type st_inc_asign from statictext within w_1201_recepcion_aviso
end type
type p_inc_rs from picture within w_1201_recepcion_aviso
end type
type p_inc_asign from picture within w_1201_recepcion_aviso
end type
type p_sin_alim from picture within w_1201_recepcion_aviso
end type
type st_nic from statictext within w_1201_recepcion_aviso
end type
type st_1 from statictext within w_1201_recepcion_aviso
end type
type calle_tapa from statictext within w_1201_recepcion_aviso
end type
type st_ape from statictext within w_1201_recepcion_aviso
end type
type st_ape2 from statictext within w_1201_recepcion_aviso
end type
type st_dir from statictext within w_1201_recepcion_aviso
end type
type d_direccion from u_dir_2001_pr_direccion_std within w_1201_recepcion_aviso
end type
type st_dir2 from statictext within w_1201_recepcion_aviso
end type
type st_tel_cli_r from statictext within w_1201_recepcion_aviso
end type
type st_2 from statictext within w_1201_recepcion_aviso
end type
type st_tel_cli_r2 from statictext within w_1201_recepcion_aviso
end type
type st_doc2 from statictext within w_1201_recepcion_aviso
end type
type st_doc from statictext within w_1201_recepcion_aviso
end type
type d_cliente from u_cli_2001_pr_cliente_std within w_1201_recepcion_aviso
end type
type st_area from statictext within w_1201_recepcion_aviso
end type
type sle_area from singlelineedit within w_1201_recepcion_aviso
end type
type sle_esq_cond from multilineedit within w_1201_recepcion_aviso
end type
type st_medidor from statictext within w_1201_recepcion_aviso
end type
type em_medidor from singlelineedit within w_1201_recepcion_aviso
end type
type p_2 from picture within w_1201_recepcion_aviso
end type
type p_1 from picture within w_1201_recepcion_aviso
end type
type p_avi_peligro from picture within w_1201_recepcion_aviso
end type
type p_esencial from picture within w_1201_recepcion_aviso
end type
type gb_1 from groupbox within w_1201_recepcion_aviso
end type
type p_cli_imp from picture within w_1201_recepcion_aviso
end type
type st_esencial from statictext within w_1201_recepcion_aviso
end type
type st_cli_imp from statictext within w_1201_recepcion_aviso
end type
type d_causa_ot24h from datawindow within w_1201_recepcion_aviso
end type
type gb_3 from groupbox within w_1201_recepcion_aviso
end type
type gb_4 from groupbox within w_1201_recepcion_aviso
end type
type gb_5 from groupbox within w_1201_recepcion_aviso
end type
type gb_7 from groupbox within w_1201_recepcion_aviso
end type
type gb_8 from groupbox within w_1201_recepcion_aviso
end type
type st_incid_rs from statictext within w_1201_recepcion_aviso
end type
type st_sin_alim from statictext within w_1201_recepcion_aviso
end type
type st_7 from statictext within w_1201_recepcion_aviso
end type
type st_6 from statictext within w_1201_recepcion_aviso
end type
type st_nro_aviso from statictext within w_1201_recepcion_aviso
end type
type st_nro_inc from statictext within w_1201_recepcion_aviso
end type
type st_8 from statictext within w_1201_recepcion_aviso
end type
type st_error from statictext within w_1201_recepcion_aviso
end type
type p_kawoq from picture within w_1201_recepcion_aviso
end type
type st_kawoq from statictext within w_1201_recepcion_aviso
end type
type p_corte from picture within w_1201_recepcion_aviso
end type
type st_corte from statictext within w_1201_recepcion_aviso
end type
type gb_2 from groupbox within w_1201_recepcion_aviso
end type
type gb_10 from groupbox within w_1201_recepcion_aviso
end type
type gb_6 from groupbox within w_1201_recepcion_aviso
end type
end forward

global type w_1201_recepcion_aviso from w_sgigenerica
integer width = 5897
integer height = 2236
string title = "Ingreso de Avisos"
string menuname = "md_ing_avisos"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowstate windowstate = maximized!
string icon = "ingavi.ico"
event ue_buscar pbm_custom40
event ue_grabar pbm_custom41
event ue_nuevo pbm_custom42
event ue_proc_sum pbm_custom43
event ue_nis_por_ct ( )
event u_tab pbm_keydown
sle_telefono sle_telefono
d_imp_aviso d_imp_aviso
st_nro_aviso2 st_nro_aviso2
st_ord_corte st_ord_corte
st_avi_peligro st_avi_peligro
st_clase_avi st_clase_avi
d_inf_resumen d_inf_resumen
st_aviso_pend st_aviso_pend
p_aviso_pend p_aviso_pend
p_ord_corte p_ord_corte
st_nis2 st_nis2
st_nis st_nis
d_nis_rad d_nis_rad
st_3 st_3
d_clase_avi d_clase_avi
st_4 st_4
st_5 st_5
p_avi_calidad p_avi_calidad
st_avi_calidad st_avi_calidad
st_inc_asign st_inc_asign
p_inc_rs p_inc_rs
p_inc_asign p_inc_asign
p_sin_alim p_sin_alim
st_nic st_nic
st_1 st_1
calle_tapa calle_tapa
st_ape st_ape
st_ape2 st_ape2
st_dir st_dir
d_direccion d_direccion
st_dir2 st_dir2
st_tel_cli_r st_tel_cli_r
st_2 st_2
st_tel_cli_r2 st_tel_cli_r2
st_doc2 st_doc2
st_doc st_doc
d_cliente d_cliente
st_area st_area
sle_area sle_area
sle_esq_cond sle_esq_cond
st_medidor st_medidor
em_medidor em_medidor
p_2 p_2
p_1 p_1
p_avi_peligro p_avi_peligro
p_esencial p_esencial
gb_1 gb_1
p_cli_imp p_cli_imp
st_esencial st_esencial
st_cli_imp st_cli_imp
d_causa_ot24h d_causa_ot24h
gb_3 gb_3
gb_4 gb_4
gb_5 gb_5
gb_7 gb_7
gb_8 gb_8
st_incid_rs st_incid_rs
st_sin_alim st_sin_alim
st_7 st_7
st_6 st_6
st_nro_aviso st_nro_aviso
st_nro_inc st_nro_inc
st_8 st_8
st_error st_error
p_kawoq p_kawoq
st_kawoq st_kawoq
p_corte p_corte
st_corte st_corte
gb_2 gb_2
gb_10 gb_10
gb_6 gb_6
end type
global w_1201_recepcion_aviso w_1201_recepcion_aviso

type variables
boolean ib_redo


u_generico_comunicaciones		iu_gen_comunic

s_direccion_cliente			is_direccion, is_dir_reset

long	il_ord_servicio, il_nro_incid, il_ex_avi_pendiente
long         il_nro_llamada, il_inst_afect_inc

string	is_prov, is_depto, is_munic, is_local

s_avisos  is_avisos,is_avi_reset,is_aviso_pend

// Bandera que se prende al ocurrir un error de acceso
// a la base.
boolean ib_error, ib_calle

boolean ib_en_corte, ib_incidencia_pos

long	il_parnum2, il_parnum3, il_parnum4, il_parnum5
long il_nis
time t1,t2,t3,t4,t5

integer  ii_nro_llamada, ii_cli_imp
long  il_nro_aviso,il_pend
boolean ib_bloqueado
int i_vez=1
int ii_clase_aviso
boolean ib_con_datos

Boolean ib_param_nic  //**  OSGI 2001.1  15/06/2001
Boolean ib_set_val_dir  //**  OSGI 2001.1  18/06/2001
Boolean ib_retorno=true

string is_tip_doc, is_co_pais

boolean ib_param_medidor // GNU 12/12/2006. Mejora 1/327511
// FCA 17092014 DDAG-259
int ii_indicativo_incidencia
// FCA 17092014 DDAG-259

//indicativo para clientes kawoq
integer ind_cli_kawoq
int li_kawoq, li_corte
//cliente a50
int li_a50
end variables

forward prototypes
public function integer f_imp_aviso (long pl_nro_aviso)
public function integer f_limpiar_camp_imp ()
public function integer wf_bloquear_tab_basicas ()
public function integer fw_nic ()
public subroutine fw_visible_enabled_nic (readonly boolean ab_estado)
public function integer fw_nis ()
public subroutine fw_enviar_mail (long pl_nro_aviso, long pl_nro_centro, integer pl_alcance)
public function integer fw_comprueba_int ()
public function integer f_kawoq (long pl_nisrad)
public function integer f_sum_corte (long pl_nisrad)
public function integer f_gi_a50_2 (long nis_rad)
end prototypes

event ue_buscar;call super::ue_buscar;int li_v_doc


SetPointer(HourGlass!)

// Valido Nis_Rad
is_direccion.gl_nis = long(d_nis_rad.fpr_v_nis_rad(d_nis_rad))

IF  (Len(string(is_direccion.gl_nis)) = 7) THEN
// Cargo en la estructura el resto de los datos necesarios
	IF d_nis_rad.fpr_c_estruc_dir_por_nis(is_direccion) = 1 THEN

		//	Procedimiento Almacenado Datos_suministro ???

		This.TriggerEvent("ue_proc_sum")

		// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
		st_doc.Hide()

	ELSE
		gnv_msg.f_mensaje("AR03","","",OK!)

		ib_error = True

		// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
		md_ing_avisos.f_habilitar("GRABAR",false)

		RETURN
	END IF
ELSE
	IF is_direccion.gl_nis = long("0") THEN
		gnv_msg.f_mensaje("ER32","","",OK!)
	END IF

	// Valido el Documento
	d_cliente.AcceptText()
	is_direccion.gs_doc = d_cliente.fpr_v_documento(d_cliente) 
	IF is_direccion.gs_doc <> " " THEN

		// Cargo en la estructura el resto de los datos necesarios
		li_v_doc = d_cliente.fpr_c_estruc_dir_por_doc(is_direccion) 
		IF li_v_doc = 1 THEN

			//	Procedimiento Almacenado Datos_suministro ???

			This.TriggerEvent("ue_proc_sum")					

			// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
			st_nis.Show()

		ELSEIF li_v_doc = 0 THEN
			gnv_msg.f_mensaje("AR04","","",OK!)

			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)

			RETURN
		END IF

	ELSEIF is_direccion.gl_nis = long("-1") THEN
		gnv_msg.f_mensaje("AR05","","",OK!)
	END IF
END IF




end event

event ue_grabar;//no guardar
return

int  li_retorno,  li_nro_llamada
long ll_nro_aviso, ll_aviso_pend, ldec_inst_sin_alim, pepe
int li_co_alcance, li_tip_aviso
string ls_observaciones
int li_lock_status , li_clase_aviso //DBE
int l_cod_causa //TDA-EDM-11
string ls_descripcion
datetime ldt_fecha_actual

ldt_fecha_actual= fgnu_fecha_Actual()
SetPointer(HourGlass!)

ldec_inst_sin_alim = fgcdec_aviso_sin_alimentacion
li_retorno = 1

//2018 agregado para guardar la oficina y la region en la tabla registro_geo

aux_coddepto=is_direccion.gl_coddepto
aux_codmun=is_direccion.gl_codmun
aux_codloc=is_direccion.gl_codloc
aux_codprov=is_direccion.gl_codprov

// Si el aviso est$$HEX2$$e1002000$$ENDHEX$$pendiente s$$HEX1$$f300$$ENDHEX$$lo se pueden a$$HEX1$$f100$$ENDHEX$$adir observaciones
if il_pend > 1 then
	
	d_inf_resumen.accepttext()
	
	ls_observaciones = d_inf_resumen.object.obs_telegestiones[1]
	
	if ls_observaciones <> "" then
	
	// GNU a$$HEX1$$f100$$ENDHEX$$ado fecha de la $$HEX1$$fa00$$ENDHEX$$ltima llamada
		UPDATE "GI_AVISOS"  
     	SET 	"OBS_TELEGESTIONES" = :ls_observaciones,
		  	"F_ULTIMO_AVISO"= :ldt_fecha_actual
		  WHERE "NRO_AVISO" = :il_pend;
		 
		gnu_u_transaction.uf_commit(THIS);		
		
		return 
	else
		
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar Observaciones de la gesti$$HEX1$$f300$$ENDHEX$$n telef$$HEX1$$f300$$ENDHEX$$nica.",information!,ok!)
		
		return
		// Retorna sin grabar nada
	end if
end if

// Si se ingres$$HEX2$$f3002000$$ENDHEX$$la "inf. resumen" del aviso

d_inf_resumen.AcceptText()

li_clase_aviso = d_clase_avi.getitemnumber(1,1) //DBE 28/03/2000 16:24

//TDA-EDM-11

l_cod_causa = d_causa_ot24h.getitemnumber(1,1)

if IsNull(l_cod_causa) then
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Debe ingresar una causa de OT24H",information!,ok!)
	return
else	
	d_inf_resumen.is_avisos.gs_causa_ot24h = l_cod_causa
end if

//TDA-EDM-11

if li_clase_aviso>=0 then 
	//OK
else
	//Malo
	RETURN
end if
if not isnull(d_inf_resumen.getitemdatetime(1,"fecha_problema")) then 
	if d_inf_resumen.getitemdatetime(1,"fecha_problema")> fgnu_fecha_Actual() then 
		gnv_msg.f_mensaje("EA26","","",OK!)
		RETURN
	END IF	
end if

// validacion del area rep PACHO

if fg_verifica_parametro('area_densidad') and fg_verifica_parametro('area_obligatoria') then
// si exigimos al telefonista que ingrese en $$HEX1$$e100$$ENDHEX$$rea obligatoriamente.

	if isnull(sle_area.text) or  sle_area.text = "" then
		messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar un $$HEX1$$e100$$ENDHEX$$rea representativa v$$HEX1$$e100$$ENDHEX$$lida.")
		md_ing_avisos.f_habilitar("GRABAR",false)
		gnu_u_transaction.uf_rollback(THIS);
		RETURN
	end if

end if

IF NOT IsNull(d_inf_resumen.GetItemString(1,"obs_telegestiones")) AND &
		trim(d_inf_resumen.GetItemString(1,"obs_telegestiones")) <> "" AND &
		NOT IsNull(d_inf_resumen.GetItemNumber(1,"co_alcance")) AND &
		NOT IsNull(d_inf_resumen.GetItemNumber(1,"tip_aviso")) AND &
		(Len(string(is_direccion.gl_nis)) = 7 or (li_clase_aviso <> fgci_clase_avi_normal&
		and li_clase_aviso <> fgci_clase_avi_calidad) ) &
		THEN
		

	// Si la clase del aviso es normal 
	IF li_clase_aviso = fgci_clase_avi_normal or &
		li_clase_aviso = fgci_clase_avi_calidad THEN //DBE tmp 24/03/2000 15:34

		// Asigno como nro. de aviso al valor que para el mismo se encuentra
		// en la tabla "t_ultimo" + 1.
		ll_nro_aviso = d_inf_resumen.fpr_o_nro_aviso()
		li_nro_llamada = 0
		
		//EDM-16-FASE-02
		st_nro_aviso.text = String(ll_nro_aviso) 
		
		
		
		//    Muestro el n$$HEX1$$fa00$$ENDHEX$$mero del Aviso y el n$$HEX1$$fa00$$ENDHEX$$mero de llamadas 	
		d_inf_resumen.SetItem(1,"Nro_Aviso",ll_nro_aviso)
		d_inf_resumen.SetItem(1,"Nro_llamadas",li_nro_llamada)
				 
		IF ll_nro_aviso = -1 THEN

			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)

			gnu_u_transaction.uf_rollback(THIS);
			RETURN
		END IF

		// FDO - INCIDENCIA 0/335149
		
		IF li_clase_aviso = fgci_clase_avi_normal then
			if fw_comprueba_int() = 1 then
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La interrupci$$HEX1$$f300$$ENDHEX$$n que afectaba al aviso se ha resuelto por lo que el aviso tambi$$HEX1$$e900$$ENDHEX$$n se resolver$$HEX1$$e100$$ENDHEX$$.",information!,ok!)
			end if
		end if

//		Modificado MERC /  PM: Parametrizaci$$HEX1$$f300$$ENDHEX$$n del n$$HEX1$$fa00$$ENDHEX$$mero de Aviso

//**********************************************************************************//
//   Parametrizacion: Agregar campo de referencia en recepcion de aviso             //
//   Luis Eduardo Ortiz Mayo/2001                                                   //
//**********************************************************************************//

		// Cargo en la est. "is_direccion" lo ingresado como Esquina/Condominio
		is_direccion.gs_esq_cond = sle_esq_cond.text

//**********************************************************************************//
//   Luis Eduardo Ortiz Mayo/2001                                                   //
//**********************************************************************************//

		// Cargo en la est. "is_direccion" lo ingresado como Tel$$HEX1$$e900$$ENDHEX$$fono.
		is_direccion.gs_telefono = sle_telefono.text
	
		// Cargo toda la inf. obtenida en la estructura de avisos
		IF d_inf_resumen.fpr_c_estructura_avisos(is_direccion,ll_nro_aviso,&
			d_inf_resumen) = -1 THEN

			ib_error = True
			gnu_u_transaction.uf_rollback(THIS);
			RETURN
		END IF

		IF d_inf_resumen.is_avisos.gl_nro_instalacion = 0 THEN
			choose case li_clase_aviso
				case  fgci_clase_avi_normal
						d_inf_resumen.is_avisos.gl_nro_instalacion = ldec_inst_sin_alim 
		      case fgci_clase_avi_calidad //DBE tmp 25/03/2000 20:04
						d_inf_resumen.is_avisos.gl_nro_instalacion = fgcdec_aviso_de_calidad_sin_alim	
      		end choose
		END IF
	
		// Grabo el nuevo aviso.
	
		// Si datos estructura OK
		
		// Grabo el nuevo registro en la tabla "Avisos"

		ll_aviso_pend =d_inf_resumen.fpr_g_aviso(li_clase_aviso)
		IF ll_aviso_pend = -1 THEN
		
			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)
			gnu_u_transaction.uf_rollback(THIS);
			RETURN

		// Si existe un aviso pendiente se lanza el evento ue_nuevo	
		ELSEIF ll_aviso_pend > 0 THEN
			This.TriggerEvent("ue_nuevo")
			d_inf_resumen.SetItem(1,"nro_aviso",ll_aviso_pend)	
			st_nro_aviso2.TriggerEvent(doubleclicked!)
			RETURN 
		END IF

		// Si identifiqu$$HEX2$$e9002000$$ENDHEX$$una instalaci$$HEX1$$f300$$ENDHEX$$n, y no existe una interrupci$$HEX1$$f300$$ENDHEX$$n 
		// pendiente para la misma, doy de alta los registros correspondientes
		// en "Avisos_instalacion"
		
		IF d_inf_resumen.is_avisos.gl_nro_instalacion <> 0 THEN
				IF d_inf_resumen.fpr_avisos_instalacion(li_clase_aviso) = -1 THEN 

				ib_error = True

				// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
				md_ing_avisos.f_habilitar("GRABAR",false)
				gnu_u_transaction.uf_rollback(THIS);
				RETURN
	

			END IF
		END IF
	
	ELSE
		
		// Acepto todo el texto ingresado
		d_cliente.AcceptText()
		d_direccion.AcceptText()
		d_inf_resumen.AcceptText()

		// Cargo toda la inf. obtenida en la estructura de avisos
		li_retorno = d_inf_resumen.fpr_v_aviso_ayuda(d_cliente,d_direccion,&
		d_inf_resumen,sle_esq_cond,sle_telefono,ll_nro_aviso,li_clase_aviso)

   	   	//Mato (Avisos Inc. 20)--Asignaci$$HEX1$$f300$$ENDHEX$$n codigo calle a estruc. de Avisos
		d_inf_resumen.is_avisos.gl_cod_calle = is_direccion.gl_codcalle
      	pepe = d_inf_resumen.is_avisos.gl_cod_calle
		
		//Validaci$$HEX1$$f300$$ENDHEX$$n de la direcci$$HEX1$$f300$$ENDHEX$$n 
		if  isnull(is_direccion.gl_codcalle) or  is_direccion.gl_codcalle = 0 then
			messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe ingresar una direcci$$HEX1$$f300$$ENDHEX$$n para ingresar el aviso.")
			md_ing_avisos.f_habilitar("GRABAR",false)
			gnu_u_transaction.uf_rollback(THIS);
			RETURN
		end if
		// Pacho.
		IF li_retorno = 1 THEN
	
			// Asigno como nro. de aviso al valor que para el mismo se encuentra
			// en la tabla "t_ultimo" + 1.

			ll_nro_aviso = d_inf_resumen.fpr_o_nro_aviso()
			
			//EDM-16-FASE-02
			st_nro_aviso.text = String(ll_nro_aviso)
			
			li_nro_llamada = 1 
			// GNU a$$HEX1$$f100$$ENDHEX$$ado fecha de la $$HEX1$$fa00$$ENDHEX$$ltima llamada
			UPDATE "GI_AVISOS"  
     			SET "NRO_LLAMADAS" = :li_nro_llamada,
				  "F_ULTIMO_AVISO"=  :ldt_fecha_actual
    			WHERE "NIS_RAD" = :is_direccion.gl_nis AND
				 	   "NRO_AVISO" = :ll_nro_aviso;
			
						 
			gnu_u_transaction.uf_commit(THIS);			 
						
			//Muestro el n$$HEX1$$fa00$$ENDHEX$$mero del Aviso // MERC
		
			d_inf_resumen.SetItem(1,"Nro_Aviso",ll_nro_aviso)
			
			IF NOT IsNull(is_direccion.gi_nro_area) THEN
				d_inf_resumen.is_avisos.gi_nro_area   = is_direccion.gi_nro_area
			END IF
			IF NOT IsNull(is_direccion.gs_poblacion) THEN
				d_inf_resumen.is_avisos.gs_poblacion   = is_direccion.gs_poblacion
			END IF
			
			// Pacho.

			IF ll_nro_aviso = -1 THEN

				ib_error = True

				// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
				md_ing_avisos.f_habilitar("GRABAR",false)
				gnu_u_transaction.uf_rollback(THIS);
				RETURN
			END IF

			d_inf_resumen.is_avisos.gl_nro_aviso = ll_nro_aviso
		
		   	// Grabo el nuevo aviso de ayuda  

			IF d_inf_resumen.fpr_g_aviso(li_clase_aviso) = -1 THEN

				ib_error = True

				// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
				md_ing_avisos.f_habilitar("GRABAR",false)
				gnu_u_transaction.uf_rollback(THIS);
				RETURN
			END IF

			IF d_inf_resumen.fpr_avisos_instalacion(li_clase_aviso) = -1 THEN 

				ib_error = True

				// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
				md_ing_avisos.f_habilitar("GRABAR",false)
				gnu_u_transaction.uf_rollback(THIS);
				RETURN
			END IF

		ELSEIF li_retorno = -1 THEN

			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)
			gnu_u_transaction.uf_rollback(THIS);
			RETURN
		END IF
	END IF
	
	IF li_retorno = 1 THEN
		// Bajo la informaci$$HEX1$$f300$$ENDHEX$$n a la B.D.
		//COMMIT USING sqlca ;
		gnu_u_transaction.uf_commit(THIS)
		
		IF sqlca.SqlCode < 0 THEN
			
			md_ing_avisos.f_habilitar("GRABAR",false)
			gnv_msg.f_mensaje("ER33","","",OK!)
			//ROLLBACK USING sqlca;	
			gnu_u_transaction.uf_rollback(THIS)
			RETURN 
			
		ELSE
			if fg_verifica_parametro('Envio de Email en ingreso de avisos') then
				fw_enviar_mail(ll_nro_aviso,d_inf_resumen.is_avisos.gi_nro_centro,d_inf_resumen.is_avisos.gi_co_alcance)
			end if
			
			//AHM (16/07/2009) Mejora 1/486709
			IF p_cli_imp.visible THEN
				fg_reproducirSonido("clientesImportantes.wav")
			END IF
			// FCA 17092014 DDAG-259 se integro este codigo para resolver el caso sobre los aviso que estan asociados a incidencia 
            // al resolverse la incidencia en algunas ocaciones los aviso no se  pasan a estado resuelto,esto sucede por que no se actualiza
			
			INT li_indi_asoc,intalacion_co_in,intalacion_co_in1,li_instalacion_con_int
			LONG ll_nro_incide,ll_nro_insta_afectada
			intalacion_co_in= 1
			IF ii_indicativo_incidencia = 1 THEN
				
		                   SELECT IND_INC_ASOC,NRO_INCIDENCIA INTO : li_indi_asoc,:ll_nro_incide
		                   FROM GI_AVISOS WHERE NRO_AVISO = :ll_nro_aviso;
								
						         IF li_indi_asoc = 1 THEN
								
								SELECT NRO_INST_AFECTADA INTO :ll_nro_insta_afectada
								FROM SGD_INCIDENCIA WHERE NRO_INCIDENCIA=:ll_nro_incide;
							
								SELECT INSTALACION_CON_INT INTO :li_instalacion_con_int
								FROM GI_AVISOS_INSTALACION WHERE NRO_INSTALACION = :ll_nro_insta_afectada AND NRO_AVISO =:ll_nro_aviso;
									
								IF li_instalacion_con_int = 0 THEN
								
								      UPDATE "GI_AVISOS_INSTALACION"  
                                          SET "INSTALACION_CON_INT" = :intalacion_co_in,
								     "PROGRAMA"='w_1201_asocia'
									  WHERE  NRO_INSTALACION = :ll_nro_insta_afectada AND NRO_AVISO =:ll_nro_aviso;
			COMMIT USING SQLCA;
		    END IF
			END IF
				END IF

			// FCA 17092014 DDAG-259
			gnv_msg.f_mensaje("AR06","","",OK!) //DBE 20/03/2000 16:14
			
			double l_no_aviso
			l_no_aviso = 0
			
			//HESPINOZA comentado para verificar tiempos congelados ini
//			select no_aviso
//			into :l_no_aviso
//			from registro where no_aviso = :ll_nro_aviso 
//			and persona_que_reporta is null
//			and tipo like 'RT'
//			using sqlca2;
//			
//			if sqlca2.SqlCode = 100 then
//				messagebox("Error OT24H","No se pudo grabar  evento en la OT, favor de registrarlo manualmente")				
//			end if

			//HESPINOZA --fin
			
			This.PostEvent("ue_nuevo")
							
		END IF
	END IF
ELSE
	gnv_msg.f_mensaje("ER52","","",OK!)
	RETURN
END IF		

// Limpio las estructuras de trabajo
ii_indicativo_incidencia =0
li_instalacion_con_int =0
is_direccion = is_dir_reset
d_inf_resumen.is_avisos = is_avi_reset



end event

event ue_nuevo;

gnu_u_transaction.uf_rollback(THIS)
SetRedraw(False)
string ls_nulo
SetNull(ls_nulo)

// Limpio los campos

//DBE ini 02/03/2000
//cbx_av_calidad.enabled=true
//cbx_av_calidad.checked=false
//cbx_av_calidad.show() 
p_avi_calidad.visible=false
st_avi_calidad.visible=false
d_clase_avi.enabled=true
d_clase_avi.object.clase_avi.background.color="0~t"+gs_blanco
d_causa_ot24h.enabled = true
d_causa_ot24h.object.descripcion.background.color="0~t"+ gs_blanco


if not ib_redo then 
d_clase_avi.setitem(1,1,fgci_clase_avi_normal)
d_causa_ot24h.Reset()
d_causa_ot24h.insertrow(0)
end if 
//ib_redo=false
//DBE fin 02/03/2000

d_nis_rad.fpr_limpiar_campos()
d_cliente.fpr_limpiar_campos()
d_direccion.fpr_limpiar_campos()
fpr_limpiar_campo_sle(sle_telefono)
// GNU 21-12-2005. Incidencia referencia Avisos
//fpr_limpiar_campo_sle(sle_esq_cond)
sle_esq_cond.text=""
st_nro_aviso.text=""
st_nro_inc.text = ""
// FIN GNU
d_inf_resumen.fpr_limpiar_campos()
d_nis_rad.fpr_habilitar_campos(False)
// GNU 25-4-2006. Mejora 1/327511
d_cliente.setitem(1, "tip_doc", is_tip_doc )
d_cliente.setitem(1, "co_pais", is_co_pais)
// FIN GNU
d_clase_avi.SetFocus()
sle_area.text = ''
st_area.enabled = true



//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
gl_tipo_aviso = 0
//***************************************
//**  OSGI 2001.1  	18/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



// Habilito los campos de los user-object que utilizo

d_nis_rad.fpr_habilitar_campos(True)
d_direccion.fpr_habilitar_campos(False,True)
fpr_habilitar_campo_sle(sle_telefono,True)
// GNU 21-12-2005. Incidencia referencia avisos
//fpr_habilitar_campo_sle(sle_esq_cond,True)
fpr_habilitar_campo_mle(sle_esq_cond,True)
// FIN GNU
d_cliente.fpr_habilitar_campos(True,True)
d_clase_avi.Enabled = True


// Deshabilito los campos de la D.W. inf. resumen del aviso
d_inf_resumen.fpr_habilitar_campos(True,True,False,False,False,True,False)


// Oculto las alarmas
p_avi_peligro.Hide()
//AHM (24/06/2009) Mejora1/372585
p_1.Hide()
p_2.Hide()

/*** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
p_esencial.Hide()
st_esencial.Hide()
/*** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */

p_aviso_pend.Hide()
p_cli_imp.Hide()
p_inc_asign.Hide()
p_ord_corte.Hide()
p_sin_alim.Hide()
p_inc_rs.hide()
p_kawoq.Hide()
p_corte.Hide()
st_avi_peligro.Hide()
st_aviso_pend.Hide()
st_cli_imp.Hide()
st_inc_asign.Hide()
st_ord_corte.Hide()
st_incid_rs.Hide()
st_kawoq.Hide()
st_corte.Hide()

// Eliminamos el estado posiblemente asociado.29/08/2000 GSH
//st_posib_incid.Hide()
st_sin_alim.Hide()

// Habilito clase de aviso y la dejo "normal" por default
d_clase_avi.Enabled = True
//d_clase_avi.SetItem(1,1,1) //DBE tmp comment 23/03/2000 19:38

//***************************************************************************************//
// Externalidad: Avisos de ayuda y ap. solo prov,distr,corr y barrio                     //
//       Luis Eduardo Ortiz Abril/2001                                                   //
//***************************************************************************************//

// Se coloca la tapa de la direccion invisible, por default.
calle_tapa.Visible = False

//************************************************************************************//
//       Luis Eduardo Ortiz Abril/2001                                                //
//************************************************************************************//



// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
st_nis2.Show()
st_dir.Show()
st_ape.Show()
//st_doc2.Show()



//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

If fg_verifica_parametro("ingreso_clientes_telefono") Then
	st_tel_cli_r2.Show()
	st_tel_cli_r.Show()
end if

////PMS 2000 DOM II  d_direccion.Modify("calle_tapa.Visible=0")
//
//d_direccion.Modify("calle.Visible=1")
//d_direccion.Modify("numero.Visible=1")
//d_direccion.Modify("duplic.Visible=1")
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



IF gl_nro_aviso_visible  THEN    // LFE
//	st_nro_aviso2.Show()				// LFE
END IF									// LFE


// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not ib_set_val_dir Then d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

iu_gen_comunic.is_comunic.intval1 = il_parnum2
iu_gen_comunic.is_comunic.intval2 = il_parnum3
iu_gen_comunic.is_comunic.longval4 = il_parnum4
iu_gen_comunic.is_comunic.longval5 = il_parnum5
iu_gen_comunic.is_comunic.strval1 = is_prov
iu_gen_comunic.is_comunic.strval2 = is_depto
iu_gen_comunic.is_comunic.strval3 = is_munic
iu_gen_comunic.is_comunic.strval4 = is_local


// Me paro en el campo nis_rad
d_nis_rad.SetFocus()


// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n "grabar" del men$$HEX1$$fa00$$ENDHEX$$
md_ing_avisos.f_habilitar("GRABAR",false)



// Habilito la opci$$HEX1$$f300$$ENDHEX$$n "buscar" del men$$HEX1$$fa00$$ENDHEX$$
md_ing_avisos.f_habilitar("BUSCAR",true)


SetRedraw(True)

// Limpio las estructuras de trabajo
is_direccion = is_dir_reset
d_inf_resumen.is_avisos = is_avi_reset




//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	15/06/2001  d_direccion.SetItem(1,"calle",ls_nulo)

//If Not ib_set_val_dir Then d_direccion.SetItem(1,"calle",ls_nulo)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************



ib_error = False
ib_en_corte = False
ib_con_datos= false


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
st_nic.Text = ''
fw_visible_enabled_nic(False)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// GNU 12/12/2006. Mejora 1/327511
IF ib_param_medidor THEN
	em_medidor.BackColor = Long(d_nis_rad.Describe("nis_rad.BackGround.Color"))
	em_medidor.TextColor = Long(d_nis_rad.Describe("nis_rad.Color"))
	em_medidor.text=''
END IF
end event

event ue_proc_sum;int li_imp, li_posib, li_local, li_co_alcance, li_tip_aviso
string ls_error, ls_observaciones,ls_nombre,ls_area
long ll_nro_aviso, ll_inc, ll_nro_llamada
datetime ldt_f_problema
datetime ldt_fecha_actual

ldt_fecha_actual= fgnu_fecha_Actual()
long ll_nro_incidencia_calidad //Se usan solo para avisos de calidad //DBE 08/03/2000
int li_est_aviso, l_cod_causa  //TDA-EDM-11

SetPointer(HourGlass!)

d_clase_avi.accepttext()     //DBE tmp 23/03/2000 19:42
// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de la ventana
// y cargo la estructura de avisos

IF d_nis_rad.fpr_llenar_campos(is_direccion.gl_nis) = 0 THEN
	ib_bloqueado = true;
	return
END IF



d_cliente.fpr_llenar_campos(is_direccion)
d_direccion.fpr_llenar_campos(is_direccion)
parmstr6 = d_direccion.GetItemString(1,"calle")

IF is_direccion.gs_telefono = "0" THEN
	is_direccion.gs_telefono = ""
END IF

fpr_llenar_campo_sle(sle_telefono,is_direccion.gs_telefono)

// Deshabilito campos de user-object Nis_Rad,direcci$$HEX1$$f300$$ENDHEX$$n y cliente
d_nis_rad.fpr_habilitar_campos(False)
d_direccion.fpr_habilitar_campos(False,False)
d_cliente.fpr_habilitar_campos(False,False)

// DBE ini 24/03/2000 8:44
d_clase_avi.enabled=false
d_clase_avi.object.clase_avi.background.color="0~t"+ gs_gris
// DBE fin 24/03/2000 8:44

// Habilito los campos de datos del aviso

//SELECT NRO_AVISO , NRO_LLAMADAS
//INTO :ll_nro_aviso, :ll_nro_llamada
//FROM GI_AVISOS
//WHERE NIS_RAD = :is_direccion.gl_nis and est_aviso <> 5; // CORREGIDO POR FDO
//
//IF ll_nro_aviso = 0 and ll_nro_llamada = 0 then
//	
//		il_nro_aviso = d_inf_resumen.fpr_o_nro_aviso()  
//		ii_nro_llamada = 0
//		
//						
//		//Muestro el n$$HEX1$$fa00$$ENDHEX$$mero del Aviso y el n$$HEX1$$fa00$$ENDHEX$$mero de llamadas // MERC
//		
//		d_inf_resumen.SetItem(1,"Nro_Aviso",il_nro_aviso) 
//		d_inf_resumen.SetItem(1,"Nro_llamadas",ii_nro_llamada)
//				 
//		IF il_nro_aviso = -1 THEN
//
//			ib_error = True
//
//			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
//			md_ing_avisos.f_habilitar("GRABAR",false)
//
//			ROLLBACK;
//			RETURN
//		END IF
//END If
//	
//ii_nro_aviso = ll_nro_aviso //MATO
	
d_inf_resumen.fpr_habilitar_campos(True,True,True,True,True,False,False)

	
// Cargo la clave geogr$$HEX1$$e100$$ENDHEX$$fica vertical y c$$HEX1$$f300$$ENDHEX$$digos en la estructura
d_inf_resumen.fpr_c_cgv_y_cods(is_direccion)


// Habilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
//md_ing_avisos.f_habilitar("GRABAR",true)
//sigeme
md_ing_avisos.f_habilitar("GRABAR",false)


// Leo Suministros_Imp por Nis_Rad			
// Si S_I.fecha_expiracion >= Today()
//	est:importante = 1.

li_imp = d_inf_resumen.fpr_v_importante(is_direccion.gl_nis)
 
IF  li_imp = 1 THEN
	/*** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
	IF d_inf_resumen.is_avisos.gi_ind_cli_esen = 1 THEN
		// Es cliente importante, entonces muestro indicativo
		p_cli_imp.Hide()
		st_cli_imp.Hide()	
		
		p_esencial.PictureName = ".\pict\" + d_inf_resumen.is_avisos.gs_img_carga
		p_esencial.show()
		st_esencial.Show()
		
	ELSE
		p_cli_imp.Show()
		st_cli_imp.Show()
	END IF

	//p_cli_imp.Hide()
	//st_cli_imp.Hide()
	
	/* ** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
	
	
	//AHM (16/07/2009) Mejora 1/486709
	IF p_cli_imp.visible THEN
		fg_reproducirSonido("clientesImportantes.wav")
	END IF
	
ELSEIF li_imp = -1 THEN

	ib_error = True
	RETURN
ELSE
	/*** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
	p_esencial.Hide()
	st_esencial.Hide()
	/*** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */
	p_cli_imp.Hide()
	st_cli_imp.Hide()
END IF

//Mejora de alarma KAWOQ - TDA

li_kawoq = f_kawoq(is_direccion.gl_nis)

IF  li_kawoq = 1 THEN
	// Cliente Kawoq
	p_kawoq.Show()
	st_kawoq.Show()
ELSEIF li_kawoq = -1 THEN
	ib_error = True
	RETURN
ELSE
	p_kawoq.Hide()
	st_kawoq.Hide()
END IF

//fin Mejora de alarma KAWOQ

//Mejora de alarma Corte en media tension - TDA

li_corte = f_sum_corte(is_direccion.gl_nis)

IF  li_corte = 1 THEN
	// Cliente en corte
	p_corte.PictureName = pathOriginal + "\pict\sumCorte.bmp"
	p_corte.Show()
	st_corte.Show()
ELSEIF li_corte = -1 THEN
	ib_error = True
	RETURN
ELSE
	p_corte.Hide()
	st_corte.Hide()
END IF

//fin Mejora de alarmaCorte en media tension


// Leo Avisos por Nis_Rad
// Si Avisos.estado = Pendiente (1)
// est:Existe_Aviso_Pendiente = 1


//DBE ini 02/03/2000

ib_incidencia_pos = False

IF d_clase_avi.getitemnumber(1,1)=fgci_clase_avi_calidad THEN
	d_inf_resumen.is_avisos.gi_ind_calidad = 1
END IF

ls_nombre = is_direccion.gs_nom + " " + is_direccion.gs_ape1+ " " + is_direccion.gs_ape2	
	
//st_nro_inc.Text  = String(il_nro_incid)
//st_nro_inc.visible = true
// Obtengo informaci$$HEX1$$f300$$ENDHEX$$n complementaria del Suministro  
// y verifica la existencia de una incidencia que lo afecte.
il_inst_afect_inc = d_inf_resumen.fpr_o_inf_comple_sum(il_ord_servicio,il_nro_incid,is_direccion.gl_nis,ib_incidencia_pos,ls_nombre)

st_nro_inc.Text =  String(param_nro_incidencia)
st_nro_inc.visible = true

IF il_inst_afect_inc = -1 THEN 
	this.TriggerEvent("ue_nuevo")
	// Si salgo por error de datos la variable se inicializa a false
	ib_retorno = false
	return
END IF

ib_con_datos = true

if ib_incidencia_pos = true then
//	fpr_habilitar_campo_sle(sle_esq_cond,False)
//	fpr_habilitar_campo_sle(sle_telefono,False)
//	d_inf_resumen.fpr_habilitar_campos(False,False,False,False,False,False,False)
	p_inc_rs.show()
	st_incid_rs.show()
end if

if d_clase_avi.getitemnumber(1,1)=fgci_clase_avi_calidad then   
	IF il_nro_incid = 0 THEN	
		//il_nro_incid=0                             //DBE 28/03/2000 17:16
		il_ord_servicio=0                          //DBE 28/03/2000 17:16
		d_inf_resumen.is_avisos.gl_nro_incidencia=0 //DBE 28/03/2000 17:16
	END IF
	
	p_avi_calidad.visible=true
	st_avi_calidad.visible=true
else
	p_avi_calidad.visible=false
	st_avi_calidad.visible=false		
end if
	
   d_clase_avi.enabled=false
//   cbx_av_calidad.enabled=false
	
il_pend = d_inf_resumen.fpr_v_aviso_pendiente(il_ex_avi_pendiente,&
is_direccion.gl_nis,p_avi_calidad.visible,ll_nro_incidencia_calidad,li_est_aviso)

//DBE fin 02/03/2000

//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
// GNU 8-11-2007. Incidencia 0/535285
//SELECT ESQUINA
//INTO :is_direccion.gs_ref
//FROM GI_AVISOS
//WHERE NRO_AVISO = :il_pend;

SELECT ESQUINA, TFNO_CLI
INTO :is_direccion.gs_ref, :is_direccion.gs_telefono
FROM GI_AVISOS
WHERE NRO_AVISO = :il_pend;

fpr_llenar_campo_sle(sle_telefono,is_direccion.gs_telefono)
// FIN GNU


sle_esq_cond.text = is_direccion.gs_ref
//***************************************
//**  OSGI 2001.1  	21/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
IF  il_pend <> 0  THEN
	
	SELECT "GI_AVISOS"."NRO_LLAMADAS","SGD_VALOR"."DESCRIPCION"
	INTO :ll_nro_llamada,:ls_area
	FROM "GI_AVISOS","SGD_VALOR"
	WHERE "GI_AVISOS"."NIS_RAD" = :is_direccion.gl_nis AND
		   "GI_AVISOS"."NRO_AVISO" = :il_pend AND
		"SGD_VALOR"."CODIF" (+) = 'ARE' and 
		"SGD_VALOR"."CODIGO" (+) = "GI_AVISOS"."AREA_REP";

	// Existe aviso pendiente, entonces muestro indicativo
	p_aviso_pend.Show()
	st_aviso_pend.Show()
	   
	
	ll_nro_llamada = ll_nro_llamada + 1
	
	//Muestro el N$$HEX1$$fa00$$ENDHEX$$mero del Aviso //MERC
	
	d_inf_resumen.SetItem (1,"nro_aviso",il_pend )
	
		
	//TDA-EDM-11	
	
//	SELECT COD_CAUSA 
//	INTO :l_cod_causa
//	//EDM-16-FASE-02
////	FROM OT24H.REGISTRO@DBLOT24H 
//	FROM REGISTRO
//	WHERE NIS = :is_direccion.gl_nis
//	AND NO_AVISO = :il_pend
//	USING sqlca2;
//	
//	if sqlca.sqlcode = 0 then
//		d_causa_ot24h.enabled = false
//		d_causa_ot24h.object.descripcion.background.color="0~t"+ gs_gris
//		d_causa_ot24h.SetItem (1,"descripcion",l_cod_causa)
//	END IF	
	//TDA-EDM-11
	
	//EDM-16-FASE-02
	
	double l_inc
	
	st_nro_aviso.text =	String(il_pend)
	
	SELECT NRO_INCIDENCIA INTO :l_inc  FROM GI_AVISOS WHERE NRO_AVISO = :il_pend USING SQLCA;  
	
	SELECT OT_CAUSA INTO  :l_cod_causa  FROM GI_AVISOS WHERE NRO_AVISO = :il_pend USING SQLCA;  
	
	
	double l_ind_peligro
	
	select ind_peligro
	into :l_ind_peligro 
	from gi_avisos 
	where nro_aviso = :il_pend
	USING SQLCA; 

	if l_ind_peligro = 1 then
		p_avi_peligro.Show()
		st_avi_peligro.Show()
	end if
	
	if sqlca.sqlcode = 0 then
		d_causa_ot24h.enabled = false
		d_causa_ot24h.object.descripcion.background.color="0~t"+ gs_gris
		d_causa_ot24h.SetItem (1,"descripcion",l_cod_causa)
	END IF	
	
	if l_inc = 0 then 
		st_nro_inc.text = ""
	else
		st_nro_inc.text = String(l_inc)
	end if
	
	//EDM-16-FASE-02
	
	// Seteo el area rep
	
	sle_Area.text = ls_area
	st_area.enabled = false
	
	//Muestro el N$$HEX1$$fa00$$ENDHEX$$mero de Llamada //MERC
	
	d_inf_resumen.SetItem (1,"nro_llamadas",ll_nro_llamada )
	
	//Muestro el resto de la informaci$$HEX1$$f300$$ENDHEX$$n del aviso
	
 SELECT "CO_ALCANCE", "TIP_AVISO", "OBS_TELEGESTIONES", FECHA_PROBLEMA
 INTO :li_co_alcance, :li_tip_aviso, :ls_observaciones,:ldt_f_problema
 FROM "GI_AVISOS"
 WHERE NRO_AVISO = :il_pend ;
 
d_inf_resumen.SetItem(1,"co_alcance",li_co_alcance)
d_inf_resumen.SetItem(1,"tip_aviso",li_tip_aviso)
d_inf_resumen.SetItem(1,"obs_telegestiones",ls_observaciones)
d_inf_resumen.SetItem(1,"fecha_problema",ldt_f_problema)

	
	UPDATE "GI_AVISOS"  
     SET "NRO_LLAMADAS" = :ll_nro_llamada,
	  "F_ULTIMO_AVISO"=  :ldt_fecha_actual
     WHERE "NIS_RAD" = :is_direccion.gl_nis and
	  		  "NRO_AVISO" = :il_pend ;
				 
	gnu_u_transaction.uf_commit(THIS) 
	
	// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n de grabar del men$$HEX1$$fa00$$ENDHEX$$
	//md_ing_avisos.f_habilitar("GRABAR",true)
	//sigeme
	md_ing_avisos.f_habilitar("GRABAR",false)

	// Deshabilito resto de campos de la ventana
	// GNU 21-12-2005. Incidencia referencia avisos
	//fpr_habilitar_campo_sle(sle_esq_cond,False)
	fpr_habilitar_campo_mle(sle_esq_cond,False)
	// FIN GNU
	fpr_habilitar_campo_sle(sle_telefono,False)
	d_inf_resumen.fpr_habilitar_campos(False,False,false,False,true,False,False)
	
ELSEIF il_pend = -1 THEN

	ib_error = True
	RETURN
ELSE

	p_aviso_pend.Hide()
	st_aviso_pend.Hide()
   
	//DBE commenttmp 25/03/2000 20:00
//	//DBE ini 03/03/2000 
//	if d_clase_avi.getitemnumber(1,1)=3 then 
//		is_avisos.gl_nro_instalacion=ifgcdec_aviso_de_calidad
//		d_inf_resumen.is_avisos.gl_nro_instalacion=ifgcdec_aviso_de_calidad
//	end if
//	//DBE fin 03/03/2000
//	
	// Habilito la opci$$HEX1$$f300$$ENDHEX$$n de grabar del men$$HEX1$$fa00$$ENDHEX$$
	//md_ing_avisos.f_habilitar("GRABAR",True)
	//sigeme
	md_ing_avisos.f_habilitar("GRABAR",false)
END IF

// Invoco al procedimiento almacenado que me trae la informaci$$HEX1$$f300$$ENDHEX$$n
// complementaria del suministro.
	

// DBE commentado ini 06/03/2000
//ib_en_petsum = False
//
//// Obtengo informaci$$HEX1$$f300$$ENDHEX$$n complementaria del Suministro  
//// y verifica la existencia de una incidencia que lo afecte.
//il_inst_afect_inc = d_inf_resumen.fpr_o_inf_comple_sum(il_ord_servicio,il_nro_incid,is_direccion.gl_nis,ib_en_petsum)
// DBE commentado fin 06/03/2000 

//IF il_nro_incid > 0 AND d_inf_resumen.is_avisos.gl_nro_incidencia > 0 OR THEN

//CHOOSE CASE d_clase_avi.getitemnumber(1,1)  // Comentado --LFE
//	CASE fgci_clase_avi_normal,fgci_clase_avi_ayuda,fgci_clase_avi_alum_publ
		IF il_inst_afect_inc = 1 or  ib_incidencia_pos = true THEN
			//aviso normal
			p_inc_asign.Hide()
			st_inc_asign.Hide()
			// Eliminamos el estado posiblemente asociado.29/08/2000 GSH
			//p_posib_incid.Hide()
			//st_posib_incid.Hide()
		ELSE//IF il_inst_afect_inc = 2 THEN	
			//aviso asociado a incidencia
				p_inc_asign.Show()
				st_inc_asign.Show()
				// FCA 17092014 DDAG-259
				ii_indicativo_incidencia =1
				// FCA 17092014 DDAG-259
// Eliminamos el estado posiblemente asociado.29/08/2000 GSH
//		ELSE
//			//aviso con posible incidencia asociada
//			p_posib_incid.Show()
//			st_posib_incid.Show()
		END IF
//   CASE fgci_clase_avi_calidad //Aviso de calidad // Comentado --LFE
//	  p_inc_asign.Hide()
//	  st_inc_asign.Hide()

//// Eliminamos el estado posiblemente asociado.29/08/2000 GSH
////	  p_posib_incid.Hide()
////	  st_posib_incid.Hide()
 
//END CHOOSE

// Verifico si el suministro tiene una instalaci$$HEX1$$f300$$ENDHEX$$n que lo alimente.
IF d_inf_resumen.is_avisos.gl_nro_instalacion = 0 THEN
	IF p_inc_asign.visible = FALSE THEN
		p_sin_alim.Show()
		st_sin_alim.Show()
	END IF
	//Verifico si tiene una localidad existente en el sistema
	li_local = 	d_inf_resumen.fpr_busco_localidad(is_direccion.gl_nis)
	IF li_local <= 0 THEN
		gnv_msg.f_mensaje("AA09","","",OK!)
		md_ing_avisos.f_habilitar("GRABAR",false)

		// Deshabilito resto de campos de la ventana
		// GNU 21-12-2005. Incidencia referencia avisos
		//fpr_habilitar_campo_sle(sle_esq_cond,False)
		fpr_habilitar_campo_mle(sle_esq_cond,False)
		// FIN GNU
		fpr_habilitar_campo_sle(sle_telefono,False)
		d_inf_resumen.fpr_habilitar_campos(False,False,False,False,False,False,False)

		Return
	END IF
ELSE
	p_sin_alim.Hide()
	st_sin_alim.Hide()
END IF


// Verifico si existen ordenes de servicio de corte
IF (il_ord_servicio > 0) THEN				

	p_ord_corte.Show()
	st_ord_corte.Show()

	// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n de grabar del men$$HEX1$$fa00$$ENDHEX$$
	md_ing_avisos.f_habilitar("GRABAR",false)
ELSE
	p_ord_corte.Hide()
	st_ord_corte.Hide()
END IF

// Verifico si el suministro esta cortado
IF  li_corte = 1 THEN
	md_ing_avisos.f_habilitar("GRABAR",false)
	d_inf_resumen.enabled = false
	d_inf_resumen.fpr_habilitar_campos(False,False,false,False,False,False,False)
	fpr_habilitar_campo_mle(sle_esq_cond,False)
	fpr_habilitar_campo_sle(sle_telefono,False)
	d_causa_ot24h.enabled = false
	d_causa_ot24h.object.descripcion.background.color="0~t"+ gs_gris

END IF

// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
st_dir.Hide()
st_dir2.Hide()
st_ape.Hide()
st_ape2.Hide()
st_nro_Aviso2.Hide()



st_tel_cli_r.Hide()  //**  OSGI 2001.1  18/06/2001

// Si se ejecuta correctamente el evento y no sale por ningun return anteriro la
// vable queda inicializada a true
ib_retorno = true

IF ib_error OR ib_en_corte THEN
	// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
	md_ing_avisos.f_habilitar("GRABAR",false)
END IF


end event

event ue_nis_por_ct();//// GNU 28-4-2006. Mejora 1/327511
//open(w_nis_por_ct)
//d_nis_rad.setitem(1,"nis_rad",gu_comunic1.is_comunic.longval1)
//st_nic.text=string(gu_comunic1.is_comunic.longval1)
end event

public function integer f_imp_aviso (long pl_nro_aviso);// Imprime datos b$$HEX1$$e100$$ENDHEX$$sicos del aviso.
String ls_calle,ls_duplicador,ls_numero,ls_apto
String ls_direccion
string co_alcance,tip_aviso
DataWindowChild dw1
DataWindowChild dw2
f_limpiar_camp_imp()
d_imp_aviso.setitem(1,"nro_aviso",String(pl_nro_aviso))



CHOOSE CASE d_clase_avi.getitemnumber(1,"clase_avi")
	CASE fgci_clase_avi_normal
		d_imp_aviso.setitem(1,"cla_avi","Normal")    //tip_aviso
	CASE fgci_clase_avi_ayuda
		d_imp_aviso.setitem(1,"cla_avi","Ayuda")
	CASE fgci_clase_avi_alum_publ
		d_imp_aviso.setitem(1,"cla_avi","Alum. Publico")
	CASE fgci_clase_avi_calidad
		d_imp_aviso.setitem(1,"cla_avi","Calidad")
END CHOOSE
d_imp_aviso.setitem(1,"esquina",sle_esq_cond.text)
d_imp_aviso.setitem(1,"telefono",sle_telefono.text)
d_imp_aviso.setitem(1,"tip_aviso","")
ls_calle=d_direccion.getitemstring(1,"calle")
ls_numero=d_direccion.getitemstring(1,"numero")
ls_duplicador=d_direccion.getitemstring(1,"duplic")
ls_apto=d_direccion.getitemstring(1,"cgv")
ls_direccion=" "
If not isnull(ls_calle) THEN
	ls_direccion=ls_direccion+" "+ls_calle
END IF
IF not isnull(ls_numero) THEN
	ls_direccion=ls_direccion+" "+ls_numero
END IF
IF NOT ISNULL(ls_duplicador) THEN
	ls_direccion=ls_direccion+" "+ls_duplicador
END IF
d_inf_resumen.getchild("co_alcance",dw1)
d_inf_resumen.getchild("tip_aviso",dw2)

co_alcance=dw1.getitemstring(dw1.GetRow(),"descripcion")
tip_aviso=dw2.getitemstring(dw2.GetRow(),"descripcion")

d_imp_aviso.setitem(1,"direccion",ls_direccion)
d_imp_aviso.setitem(1,"tip_aviso",tip_aviso)
d_imp_aviso.setitem(1,"alc_avi",co_alcance)
d_imp_aviso.accepttext()
d_imp_aviso.print()

return 1
end function

public function integer f_limpiar_camp_imp ();//Setea en nulo los campos de la datawindows de impresion
Long ll_nro_aviso
SetNull(ll_nro_aviso)
d_imp_aviso.setitem(1,"nro_aviso",ll_nro_aviso)
d_imp_aviso.setitem(1,"tip_aviso","")
d_imp_aviso.setitem(1,"esquina","")
d_imp_aviso.setitem(1,"telefono","")
d_imp_aviso.setitem(1,"direccion","")
return 1
end function

public function integer wf_bloquear_tab_basicas ();int li_lock_status
string ls_descripcion
int li_null
setnull(li_null)
datawindowchild ldwch_tip_aviso
datawindowchild ldwch_co_alcance	
	//DBE ini 28/02/2000 .Bloquear c$$HEX1$$f300$$ENDHEX$$digo
		li_lock_status = gnu_u_transaction.uf_lock &
	 (this, "SGD_VALOR", "CODIGO = " + string(d_inf_resumen.getitemnumber(d_inf_resumen.getrow(),'co_alcance')) + " AND CODIF = 'ALC'",FALSE)
					
  	    choose case  li_lock_status 
				  case 100 	
					 d_inf_resumen.getchild("co_alcance",ldwch_co_alcance)
					 ls_descripcion=ldwch_co_alcance.getitemstring(ldwch_co_alcance.getrow(),'descripcion')
					 d_inf_resumen.setitem(d_inf_resumen.getrow(),'co_alcance',li_null)
					 ldwch_co_alcance.settransobject(sqlca)
					 ldwch_co_alcance.setfilter("co_alcance > 0")
					 ldwch_co_alcance.retrieve()
					 ldwch_co_alcance.filter()
					 gnv_msg.f_mensaje("AM59",ls_descripcion,"",OK!)
					 return li_lock_status
				  case  -54 
					//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0	
	  end choose 
	  
	  		li_lock_status = gnu_u_transaction.uf_lock &
	 (this, "GI_T_TIP_AVISO", "TIP_AVISO = " + string(d_inf_resumen.getitemnumber(d_inf_resumen.getrow(),'tip_aviso')),FALSE)
					
  	    choose case  li_lock_status 
				  case 100 	
					 d_inf_resumen.getchild("tip_aviso",ldwch_tip_aviso)
					 ls_descripcion=ldwch_tip_aviso.getitemstring(ldwch_tip_aviso.getrow(),'descripcion')					 
					 d_inf_resumen.setitem(d_inf_resumen.getrow(),'tip_aviso',li_null)
					 ldwch_tip_aviso.settransobject(sqlca)
					 ldwch_tip_aviso.setfilter("tip_aviso > 0")
					 ldwch_tip_aviso.retrieve()
					 ldwch_tip_aviso.filter()
					 gnv_msg.f_mensaje("AM60",ls_descripcion,"",OK!)
					 return li_lock_status
				  case  -54 
					//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este elemento")
		        case 0	
			end choose

return li_lock_status

end function

public function integer fw_nic ();//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_nis_rad, ll_nic, ll_reg
Integer li_return
String ls_cadena
Boolean lb_abrio_cur


li_return = 1

If ib_param_nic And d_nis_rad.RowCount() > 0 Then
	If gl_tipo_aviso <> fgcdec_aviso_alumbrado_publico And gl_tipo_aviso <> fgcdec_aviso_de_ayuda Then
		d_nis_rad.AcceptText()
		ll_nic = d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")
		st_nic.Text = String(ll_nic)



		//******************************************
		//**  OSGI 2001.2  	09/09/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  		ls_cadena = "SELECT NIS_RAD FROM SUMCON WHERE NIC = " + String(ll_nic)

		ls_cadena = "SELECT MAX(NIS_RAD), COUNT(*) FROM SUMCON WHERE NIC = " + String(ll_nic) + fg_tip_serv()
		//******************************************
		//**  OSGI 2001.2  	09/09/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************



		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		PREPARE SQLSA FROM :ls_cadena ;
		OPEN DYNAMIC my_cursor ;

		If sqlca.sqlcode = 0 Then lb_abrio_cur = True

		FETCH my_cursor INTO :ll_nis_rad, :ll_reg ;

		//******************************************
		//**  OSGI 2001.2  	02/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************
		If sqlca.sqlcode <> 0 Or IsNull(ll_nis_rad) Then
			ll_nis_rad = 0
			ll_reg = 0
			li_return = 0
		End If

		If ll_reg > 1 Then
			OpenWithParm(w_at0113_tel, String(ll_nic) + "~t2")

			is_direccion = Message.PowerObjectParm
			
//			MessageBox("RECIBIDO 1", "is_direccion.gl_nis")
//			MessageBox("RECIBIDO 2", is_direccion.gl_nis)
			
			// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
			IF (Len(string(is_direccion.gl_nis)) = 7) THEN
				ll_nis_rad = is_direccion.gl_nis
				li_return = 1
			Else
				If IsNull(is_direccion.gl_nis) Then
					li_return = -1
					SetNull(ll_nis_rad)
				Else
					li_return = 0
					ll_nis_rad = 0
				End If
			END IF
		End If
		//******************************************
		//**  OSGI 2001.2  	02/10/2002				**
		//**  Jair Padilla / Soluziona PANAMA  	**
		//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
		//******************************************

		If li_return = 1 Then
			fw_visible_enabled_nic(True)
		Else
			st_nic.Text = ""
		End If
	End If

	If lb_abrio_cur Then
		CLOSE my_cursor ;
	End If

	d_nis_rad.SetItem(d_nis_rad.GetRow(), "nis_rad", ll_nis_rad)
	d_nis_rad.AcceptText()
End If

Return li_return
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public subroutine fw_visible_enabled_nic (readonly boolean ab_estado);//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If Not ab_estado Or Not ib_param_nic Then
	st_nic.Visible = False
Else
	st_nic.Visible = True
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end subroutine

public function integer fw_nis ();//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
Long ll_nis_rad, ll_nic
Integer li_return
String ls_cadena
Boolean lb_abrio_cur


li_return = 1

If ib_param_nic And d_nis_rad.RowCount() > 0 Then
	If gl_tipo_aviso <> fgcdec_aviso_alumbrado_publico And gl_tipo_aviso <> fgcdec_aviso_de_ayuda Then
		d_nis_rad.AcceptText()
		ll_nis_rad = d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")	
		
		If IsNull(ll_nis_rad) Or ll_nis_rad <= 0 Then
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La informaci$$HEX1$$f300$$ENDHEX$$n solicitada no cuenta con ningun suministro asociado.")
			li_return = 0
		Else
			//******************************************
			//**  OSGI 2001.2  	14/10/2002				**
			//**  Jair Padilla / Soluziona PANAMA  	**
			//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
			//******************************************
			//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  			ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad)

			ls_cadena = "SELECT NIC FROM SUMCON WHERE NIS_RAD = " + String(ll_nis_rad) + fg_tip_serv()
			//******************************************
			//**  OSGI 2001.2  	14/10/2002				**
			//**  Jair Padilla / Soluziona PANAMA  	**
			//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
			//******************************************
		
			DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
			PREPARE SQLSA FROM :ls_cadena ;
			OPEN DYNAMIC my_cursor ;

			If sqlca.sqlcode = 0 Then lb_abrio_cur = True

			FETCH my_cursor INTO :ll_nic ;
	
			 
			If sqlca.sqlcode <> 0 Or IsNull(ll_nic) Or ll_nic <= 0 Then
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La informaci$$HEX1$$f300$$ENDHEX$$n solicitada no cuenta con ningun contrato asociado.")
				li_return = 0
			Else
				st_nic.Text = String(ll_nic)
				fw_visible_enabled_nic(True)
			End If
		End If
	End If

	If lb_abrio_cur Then
		CLOSE my_cursor;
	End If
End If

Return li_return
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end function

public subroutine fw_enviar_mail (long pl_nro_aviso, long pl_nro_centro, integer pl_alcance);
datetime ldt_f_solicitado
string  ls_cadena, ls_descripcion, ls_nom_instalacion, ls_observacion, ls_mail
int li_codigo, li_fila, li_conta
datetime ldt_ini_descargo, ldt_fin_Descargo
string ls_html, ls_txt
ls_cadena = ''

DECLARE lc_mail cursor for 
	select email from gi_usuario_sgi, sgd_valor 
	where informar_aviso = 1 and 
	nro_centro = :pl_nro_centro and  
	SGD_VALOR.CODIF = 'ALC' and 
	sgd_valor.valor = 'SI'  and 
	sgd_valor.codigo = :pl_alcance ;

//Funcion que arma el texto del mail 
mailSession mSes 
mailReturnCode mRet  
mailMessage mMsg    

mSes = create mailSession
mRet = mSes.mailLogon(mailNewSession!)

IF mRet <> mailReturnSuccess! THEN  
        MessageBox("Mail", 'Error al conectarse.')  
        RETURN  
END IF    

//Carga el asunto del mail
mMsg.Subject = 'Ingreso del aviso N.  ' + string(pl_nro_aviso)


OPEN LC_MAIL;

FETCH LC_MAIL INTO :ls_mail;

DO WHILE sqlca.sqlcode = 0
	//Carga el email a enviar
	li_conta ++
	mMsg.Recipient[li_conta].name = ls_mail
	mMsg.Recipient[li_conta].RecipientType = mailTo!
	mMsg.Recipient[li_conta].Address = ls_mail
	mMsg.NoteText = 'El usuario ' + gs_usuario + ' ha ingresado el aviso Nro. ' + string(pl_nro_aviso)
	FETCH LC_MAIL INTO :ls_mail;
LOOP

CLOSE LC_MAIL;

mRet = mSes.mailSend(mMsg)    

IF mRet <> mailReturnSuccess! THEN  
		messagebox("mret",string(mret))
   	MessageBox("Envio Mail", 'No se pudo enviar el Mail')  
   	RETURN
END IF  

mSes.mailLogoff()
DESTROY mSes
end subroutine

public function integer fw_comprueba_int ();
string ls_h_rep_a,ls_h_rep_b,ls_h_rep_c,ls_h_rep,ls_t_interrupcion,ls_ind_dec
long ll_incidencia,ll_inst_int
datetime ldt_f_rep_fase_a,ldt_f_rep_fase_b,ldt_f_rep_fase_c,ldt_f_rep,ldt_f_res	
int li_devuelve
date ld_f_res
//AHU Incidencia 0/100055689
long		ll_posicionFinal			//Posici$$HEX1$$f300$$ENDHEX$$n final de la clausula de las instalaciones en la select
long		ll_posicionInicial		//Posici$$HEX1$$f300$$ENDHEX$$n de inicio de la clausula de las instalaciones en la select
string	ls_selectCursor			//Select del cursor que busca las interrupciones a las que se puede asociar el aviso


ll_posicionInicial = pos(upper(d_inf_resumen.is_sql_statement), "SGD_INTERRUPCION.NRO_INSTALACION IN")
ll_posicionFinal = pos(upper(d_inf_resumen.is_sql_statement), " AND ", ll_posicionInicial)

ls_selectCursor = "SELECT TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_A,'hh24:mi'), "
ls_selectCursor += "TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_B,'hh24:mi'), "
ls_selectCursor += "TO_CHAR(SGD_INTERRUPCION.F_REPOSICION_FASE_C,'hh24:mi'), "
ls_selectCursor += "TO_CHAR(SGD_INTERRUPCION.F_REPOSICION,'hh24:mi'), "
ls_selectCursor += "SGD_INTERRUPCION.TIP_INTERRUPCION, "
ls_selectCursor += "SGD_INTERRUPCION.NRO_INCIDENCIA, "
ls_selectCursor += "SGD_INTERRUPCION.NRO_INSTALACION, "
ls_selectCursor += "SGD_INTERRUPCION.F_REPOSICION_FASE_A, "
ls_selectCursor += "SGD_INTERRUPCION.F_REPOSICION_FASE_B, "
ls_selectCursor += "SGD_INTERRUPCION.F_REPOSICION_FASE_C, "
ls_selectCursor += "SGD_INTERRUPCION.F_REPOSICION, "
ls_selectCursor += "Fgci_int_suministro( 1 ,F_REPOSICION_FASE_A,  F_ALTA_FASE_A,  F_REPOSICION_FASE_B,  F_ALTA_FASE_B,  F_REPOSICION_FASE_C,  F_ALTA_FASE_C,  F_REPOSICION, F_ALTA,0,0,111) DECISION "
ls_selectCursor += "FROM SGD_INTERRUPCION   "
ls_selectCursor += "WHERE "
ls_selectCursor += mid(d_inf_resumen.is_sql_statement, ll_posicionInicial, (ll_posicionFinal - 1) - ll_posicionInicial)
ls_selectCursor += "AND (SGD_INTERRUPCION.F_REPOSICION IS NULL "
ls_selectCursor += "AND SGD_INTERRUPCION.F_ALTA IS NOT NULL) "

IF d_inf_resumen.is_avisos.gl_nro_incidencia > 0 THEN

	// Exist$$HEX1$$ed00$$ENDHEX$$a una incidencia abierta a la cual se asoci$$HEX2$$f3002000$$ENDHEX$$el aviso. 
	// Antes de grabar vamos a comprobar si la interrupcion que afectaba queda resuelta.

	DECLARE LC_INTERRUPCIONES DYNAMIC CURSOR FOR SQLSA;
		
		
//	PREPARE SQLSA FROM :d_inf_resumen.is_sql_statement;
	PREPARE SQLSA FROM :ls_selectCursor;
		
	OPEN DYNAMIC LC_INTERRUPCIONES ;

	FETCH LC_INTERRUPCIONES 
	
	INTO 	 :ls_h_rep_a,
		 :ls_h_rep_b,
		 :ls_h_rep_c,
		 :ls_h_rep,
		 :ls_t_interrupcion,
		 :ll_incidencia,
		 :ll_inst_int,
		 :ldt_f_rep_fase_a,
		 :ldt_f_rep_fase_b,
		 :ldt_f_rep_fase_c,
		 :ldt_f_rep,
		 :ls_ind_dec;
		
	DO WHILE SQLCA.SQLCODE = 0 
			
		IF ls_ind_dec <> '0' THEN
			
			If ls_h_rep <> ('01/01/1900') and not isnull(ls_h_rep) Then
			
				// La incidencia que existia se ha resuelto en el transcurso del ingreso del aviso, por lo que el propio aviso entrar$$HEX2$$e1002000$$ENDHEX$$como resuelto.
				 
				 Select to_date(:ls_ind_dec,'DD/MM/YYYY hh24:mi:ss') into :ldt_f_res from dual;
				 
				 d_inf_resumen.is_avisos.gdt_f_res = ldt_f_res
				 d_inf_resumen.is_avisos.gl_nro_incidencia = ll_incidencia
				 d_inf_resumen.is_avisos.gi_est_aviso = fgci_aviso_resuelto
				 d_inf_resumen.is_avisos.gl_instalacion_int = ll_inst_int
				 d_inf_resumen.is_avisos.gs_programa = 'ING_RES'
			
				CLOSE LC_INTERRUPCIONES;
								
				RETURN 1

			End If
									
		END IF
			
	FETCH LC_INTERRUPCIONES 
	INTO 	:ls_h_rep_a,
		:ls_h_rep_b,
		:ls_h_rep_c,
		:ls_h_rep,
		:ls_t_interrupcion,
		:ll_incidencia,
		:ll_inst_int,
		:ldt_f_rep_fase_a,
		:ldt_f_rep_fase_b,
		:ldt_f_rep_fase_c,
		:ldt_f_rep,
		:ls_ind_dec;
		
	LOOP
		
CLOSE LC_INTERRUPCIONES;

END IF

RETURN 0
end function

public function integer f_kawoq (long pl_nisrad);
////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     f_kawoq
//
// Objetivo:    Verifico si el cliente al grupo de suministros con alarma tipo kawoq
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nisRad (id. del suministro del cliente)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (cliente kawoq o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   
// ---------    -------        
//      14/8/2019                TDA
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

long ls_nis

SELECT "NIS_RAD"
INTO :ls_nis
FROM "GI_KAWOQ"
WHERE "NIS_RAD" = :pl_nisRad
USING sqlca;
/* ** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */

IF sqlca.SqlCode = 0 THEN
	IF ls_nis = pl_nisRad THEN
		ind_cli_kawoq = 1
	END IF
ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER05","","",OK!)
	RETURN -1
ELSE
	ind_cli_kawoq = 0
	RETURN 0
END IF

RETURN 1
end function

public function integer f_sum_corte (long pl_nisrad);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     f_sum_corte
//
// Objetivo:    Verifico si el cliente al grupo de suministros en corte de media tension
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                pl_nisrad (id. del suministro del cliente)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (cliente en corte o no)
//
//  Fecha         Responsable   
// ---------    -------        
//      7/11/2019                TDA
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

long ls_nis

SELECT "NIS_RAD"
INTO :ls_nis
FROM "GI_NISES_EN_CORTE"
WHERE "NIS_RAD" = :pl_nisrad
USING sqlca;
/* ** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */

IF sqlca.SqlCode = 0 THEN
	IF ls_nis = pl_nisRad THEN
		RETURN 1
	END IF
ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER05","","",OK!)
	RETURN -1
ELSE
	RETURN 0
END IF
end function

public function integer f_gi_a50_2 (long nis_rad);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:     f_gi_a50_2
//
// Objetivo:    Verifico si el cliente a la tabla GI_A50_2, si existe no se permite el ingreso de avisos
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//      Entrada:                nis_rad (id. del suministro del cliente)
//                                      
//      Salida:  -- 
//                                              
// Devuelve:    1 o 0 (cliente A50-2 o n$$HEX1$$f300$$ENDHEX$$)
//
//  Fecha         Responsable   
// ---------    -------        
//      03/03/2020                TDA
//
////////////////////////////////////////////////////////////////////////////////////////////////

SetPointer(HourGlass!)

long ls_nis2

SELECT "NIS_RAD"
INTO :ls_nis2
FROM "GI_A50_2"
WHERE "NIS_RAD" = :nis_rad
USING sqlca;
/**********************************************/

IF sqlca.SqlCode = 0 THEN
	IF ls_nis2 = nis_rad THEN
		li_a50 = 1
		RETURN 1
	END IF
ELSEIF sqlca.SqlCode = -1 THEN
	gnv_msg.f_mensaje("ER05","","",OK!)
	RETURN -1
ELSE
	li_a50 = 0
	RETURN 0
END IF




end function

event open;call super::open;THIS.Title = "Ingreso de Avisos"

// Cargo el objeto de comunicaciones para tener acceso 
// a la estructura
// iu_gen_comunic  --> para cargar la estructura local 
t1= now()
iu_gen_comunic = CREATE u_generico_comunicaciones

//TDA-EDM-14
string ls_usuario
ls_usuario="DR001473"
String ls_nombre
String ls_clave
ls_clave = "2BFFQC"

SELECT "GI_USUARIO_SGI"."USUARIO",   
       "GI_USUARIO_SGI"."NRO_CENTRO",   
       "GI_USUARIO_SGI"."NRO_CMD",   
       "GI_USUARIO_SGI"."NRO_MESA",   
       "GI_USUARIO_SGI"."NOM_USUARIO", CLAVE  
INTO  
		:gs_usuario,
		:gi_nro_centro,
		:gi_nro_cmd,
		:gi_nro_puesto,
		:ls_nombre, :ls_clave
FROM "GI_USUARIO_SGI" 
WHERE "GI_USUARIO_SGI"."USUARIO" = :ls_usuario 
USING SQLCA;


gu_comunic = create u_generico_comunicaciones

gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto

//TDA-EDM-14

iu_gen_comunic.is_comunic = gu_comunic.is_comunic

// El puntero del mouse toma la forma del reloj de arena
SetPointer(HourGlass!)

// DBE tmp ini 23/03/2000 19:18
datawindowchild ldwch_clase_avi
d_clase_avi.getchild('clase_avi',ldwch_clase_avi)
ldwch_clase_avi.settransobject(sqlca)
ldwch_clase_avi.retrieve('C_AV')
ldwch_clase_avi.SetSort("codigo A")
ldwch_clase_avi.Sort()


//TDA-EDM-11
datawindowchild ldwch_causa_ot
d_causa_ot24h.getchild('descripcion',ldwch_causa_ot)
ldwch_causa_ot.settransobject(sqlca)
ldwch_causa_ot.retrieve()


//d_clase_avi.insertrow(0)
// DBE tmp fin 23/03/2000 19:18


// Conecto las D.D.D.W
d_inf_resumen.ddw_tipo_aviso = d_inf_resumen.fpr_conectar(d_inf_resumen)
d_cliente.fpr_conectar(d_cliente)

// Obtener los atributos para abrir la ventana
This.Title = iu_gen_comunic.f_titulo_ventana("iw_1201","Ing.Aviso")

is_prov = iu_gen_comunic.is_comunic.strval1
is_depto = iu_gen_comunic.is_comunic.strval2
is_munic = iu_gen_comunic.is_comunic.strval3
is_local = iu_gen_comunic.is_comunic.strval4

// Repetici$$HEX1$$f300$$ENDHEX$$n de Variables

parnum2 = iu_gen_comunic.is_comunic.intval1					// Cod. Prov.
parnum3 = iu_gen_comunic.is_comunic.intval2  				// Cod. Depto.
parnum4 = iu_gen_comunic.is_comunic.longval4		// Cod. Munic.
parnum5 = iu_gen_comunic.is_comunic.longval5					// Cod. Loc.

// Guarda los valores por defecto en variables de instancia de la ventana
il_parnum2 = iu_gen_comunic.is_comunic.intval1
il_parnum3 = iu_gen_comunic.is_comunic.intval2
il_parnum4 = iu_gen_comunic.is_comunic.longval4
il_parnum5 = iu_gen_comunic.is_comunic.longval5

SetRedraw(False)
t2 = now()
// Habilito/deshabilito los campos de los user-object que utilizo
d_nis_rad.fpr_habilitar_campos(True)
d_direccion.fpr_habilitar_campos(False,True)
d_cliente.fpr_habilitar_campos(True,True)
d_inf_resumen.fpr_habilitar_campos(True,True,False,False,False,True,False)
IF gl_nro_aviso_visible  THEN
//	st_nro_aviso2.Visible = TRUE
ELSE
	st_nro_aviso2.Visible = FALSE	
END IF

d_clase_avi.Enabled = True
t3 = now()
// Inserto un registro en los user-object de trabajo
//d_nis_rad.f_insertar_fila()
//d_clase_avi.f_insertar_fila()
//d_direccion.f_insertar_fila()
//d_cliente.f_insertar_fila()
//d_inf_resumen.f_insertar_fila()
//d_imp_aviso.insertrow(0)
//
d_nis_rad.insertrow(0)
d_clase_avi.insertrow(0)
d_direccion.insertrow(0)
d_cliente.insertrow(0)
d_inf_resumen.insertrow(0)
d_imp_aviso.insertrow(0)

//TDA-EDM-11
d_causa_ot24h.insertrow(0)

// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)

// Selecciono por defecto clase de aviso normal
d_clase_avi.SetItem(1,1,fgci_clase_avi_normal)

// GNU 25-4-2006. Mejora 1/327511
select valor
into :is_tip_doc
from sgd_valor
where codif='DOCU' and codigo= 1;

/*select desc_tipo
into :is_tip_doc
from tipos
where tipo= :is_tip_doc;*/

select valor
into :is_co_pais
from sgd_valor
where codif='DOCU' and codigo= 2;

/*select desc_cod
into :is_co_pais
from codigos
where cod= :is_co_pais;*/

d_cliente.setitem(1, "tip_doc",is_tip_doc)
d_cliente.setitem(1, "co_pais",is_co_pais )
// FIN GNU

// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
st_nis2.Show()

// TDA - EDM - 14
//se comento
//st_dir.Show()

st_ape.Show()
//st_doc2.Show()
st_clase_avi.Show()

//************************************************************************************//
//			Externalidad:  Ingreso de Clientes por Numero Telefonico                     //
//       Luis Eduardo Ortiz Abril/2001                                                //
//************************************************************************************//

If fg_verifica_parametro("ingreso_clientes_telefono") Then
	//EDM-16-FASE-02
//	st_tel_cli_r2.Show()

//	st_tel_cli_r.Show()
//	st_tel_cli_r.Enabled = True
End If

//************************************************************************************//
//       Luis Eduardo Ortiz Abril/2001                                                //
//************************************************************************************//

if gl_nro_aviso_visible then
//	st_nro_aviso2.Show()
else	
	st_nro_aviso2.Hide()
end if	
	
SetRedraw(True)
t4 = now()
// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
md_ing_avisos.f_habilitar("GRABAR",false)

//// GNU 28-4-2006. Mejora 1/327511
//md_ing_avisos.m_buscar.visible=true
//md_ing_avisos.m_buscar.enabled=true
//// FIN GNU

ib_error = False
ib_en_corte = False
ib_calle = True
t5 = now()

//******************************************************************************//
// Externalidad: Referencia en pantalla principal de recepcion de avisos        //
// Luis Eduardo Ortiz Abril/2001                                                //
//******************************************************************************//
	
	If fg_verifica_parametro("referencia_recepcion_avisos") Then
		sle_esq_cond.Visible = True
		st_1.Visible = True
		sle_esq_cond.text = is_direccion.gs_ref
		//TDA - EDM -14
		d_direccion.Modify("provincia_t.x = 0")
		d_direccion.Modify("provincia_t.y = 0")
		d_direccion.Modify("provincia_t.text = 'Departamento                                   |Municipio'")		
		d_direccion.Modify("provincia_t.width = 2030")
		d_direccion.Modify("provincia_t.height = 64")
		d_direccion.Modify("provincia.x = 5")
		d_direccion.Modify("provincia.y = 68")
		d_direccion.Modify("provincia.width = 1001")
		d_direccion.Modify("provincia.height = 76")
		d_direccion.Modify("depto.x = 1024")
		d_direccion.Modify("depto.y = 68")
		d_direccion.Modify("depto.width = 1001")
		d_direccion.Modify("depto.height = 76")
		d_direccion.Modify("municipio_t.x = 0")
		d_direccion.Modify("municipio_t.y = 160")
		d_direccion.Modify("municipio_t.width = 2030")
		d_direccion.Modify("municipio_t.height = 64")
		d_direccion.Modify("municipio_t.text = 'Localidad                                         |Zona'")
		d_direccion.Modify("municipio.x = 5")
		d_direccion.Modify("municipio.y = 228")
		d_direccion.Modify("municipio.width = 1001")
		d_direccion.Modify("municipio.height = 76")
		d_direccion.Modify("localidad.x = 1024")
		d_direccion.Modify("localidad.y = 228")
		d_direccion.Modify("localidad.width = 1001")
		d_direccion.Modify("localidad.height = 76")
		d_direccion.Modify("calle_t.x = 0")
		d_direccion.Modify("calle_t.y = 320")
		d_direccion.Modify("calle_t.width = 2030")
		d_direccion.Modify("calle_t.height = 64")
		d_direccion.Modify("duplic.x = 1353")
		d_direccion.Modify("duplic.y = 388")
		d_direccion.Modify("duplic.width = 251")
		d_direccion.Modify("duplic.height = 76")
		d_direccion.Modify("numero.x = 1088")
		d_direccion.Modify("numero.y = 388")
		d_direccion.Modify("numero.width = 251")
		d_direccion.Modify("numero.height = 76")
		d_direccion.Modify("calle.x = 5")
		d_direccion.Modify("calle.y = 388")
		d_direccion.Modify("calle.width = 1070")
		d_direccion.Modify("calle.height = 76")
		d_direccion.Modify("cgv.x = 1623")
		d_direccion.Modify("cgv.y = 388")
		d_direccion.Modify("cgv.width = 402")
		d_direccion.Modify("cgv.height = 76")
		d_direccion.Modify("c_tipo_via_t.x = 5")
		d_direccion.Modify("c_tipo_via_t.y = 600")
		d_direccion.Modify("c_tipo_via_t.width = 1440")
		d_direccion.Modify("c_tipo_via_t.height = 76")
//		d_direccion.Modify("municipio_t.y = 132")
//		d_direccion.Modify("localidad_t.y = 132")
//		d_direccion.Modify("municipio.y = 132")
//		d_direccion.Modify("localidad.y = 132")
//		d_direccion.Modify("provincia_t.y = 20")
//		d_direccion.Modify("depto_t.y = 20")
//		d_direccion.Modify("provincia.y = 20")
//		d_direccion.Modify("depto.y = 20")
//		d_direccion.Modify("calle_t.y = 248")
//		d_direccion.Modify("cgv_t.y = 248")
//		d_direccion.Modify("calle.y = 248")
//		d_direccion.Modify("numero.y = 248")
//		d_direccion.Modify("duplic.y = 248")
//		d_direccion.Modify("cgv.y = 248")
//		//TDA - EDM -14
		//se comento
//		st_dir.y = 500
//		st_dir2.y = 500
	//	calle_tapa.y = 500
	End If

if fg_verifica_parametro('area_densidad') then
	sle_area.visible=true
	st_area.visible=true
else
	sle_area.visible=false
	st_area.visible=false
end if
//******************************************************************************//
// Luis Eduardo Ortiz Abril/2001                                                //
//******************************************************************************//


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
ib_param_nic = fg_verifica_parametro('NIC')
//ib_set_val_dir = fg_verifica_parametro('DEFAULT_DIR')

If ib_param_nic Then
	st_nis2.Text = 'NIC:'
	st_nis.Text = 'NIC:'
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// GNU 12/12/2006. Mejora 1/327511
ib_param_medidor= fg_verifica_parametro('avisos por medidor')

IF ib_param_medidor THEN
	st_5.Y= st_5.Y - 30
	st_nis2.Y= st_nis2.Y - 65
	d_nis_rad.Y= d_nis_rad.Y - 65
	d_nis_rad.X= d_nis_rad.X + 20
	st_nic.Y=st_nic.Y - 65
	st_nis.Y=st_nis.Y - 65
	st_4.Y= st_4.Y - 30
	st_clase_avi.Y= st_clase_avi.Y - 15
	d_clase_avi.Y= d_clase_avi.Y - 15
	st_5.Height= st_5.Height + 30
	st_nis2.Height= st_nis2.Height + 30
	d_nis_rad.Height= d_nis_rad.Height + 30
	st_nis.Height=st_nis.Height + 30
//	st_nic.Height=st_nic.Height + 30
	st_4.Height= st_4.Height + 30
	st_clase_avi.Height= st_clase_avi.Height + 15
	d_clase_avi.Height= d_clase_avi.Height + 15
	st_medidor.visible= True
	em_medidor.visible= True
END IF

//AHM (04/12/2007)
IF gi_pais = 8 THEN				//Estamos en Moldavia
	d_cliente.modify("doc_id.visible = 0")
	d_cliente.modify("tip_doc.visible = 0")
	d_cliente.modify("co_pais.visible = 0")
	d_cliente.modify("doc_id_t.visible = 0")
	d_cliente.modify("t_1.visible = 0")
	d_cliente.modify("t_2.visible = 0")
	st_doc2.visible = FALSE
	st_doc.visible = FALSE
END IF



	


end event

event close;call super::close;// $$HEX1$$bf00$$ENDHEX$$Inicializar objeto para acto seguido destrurilo? MATO
//fgnu_resetear_s_comunicaciones(gu_comunic) 
gnu_u_transaction.uf_rollback(THIS)  // desbloqueamos lo que hayamos bloqueado (LFE)
DESTROY iu_gen_comunic  


end event

on w_1201_recepcion_aviso.create
int iCurrent
call super::create
if this.MenuName = "md_ing_avisos" then this.MenuID = create md_ing_avisos
this.sle_telefono=create sle_telefono
this.d_imp_aviso=create d_imp_aviso
this.st_nro_aviso2=create st_nro_aviso2
this.st_ord_corte=create st_ord_corte
this.st_avi_peligro=create st_avi_peligro
this.st_clase_avi=create st_clase_avi
this.d_inf_resumen=create d_inf_resumen
this.st_aviso_pend=create st_aviso_pend
this.p_aviso_pend=create p_aviso_pend
this.p_ord_corte=create p_ord_corte
this.st_nis2=create st_nis2
this.st_nis=create st_nis
this.d_nis_rad=create d_nis_rad
this.st_3=create st_3
this.d_clase_avi=create d_clase_avi
this.st_4=create st_4
this.st_5=create st_5
this.p_avi_calidad=create p_avi_calidad
this.st_avi_calidad=create st_avi_calidad
this.st_inc_asign=create st_inc_asign
this.p_inc_rs=create p_inc_rs
this.p_inc_asign=create p_inc_asign
this.p_sin_alim=create p_sin_alim
this.st_nic=create st_nic
this.st_1=create st_1
this.calle_tapa=create calle_tapa
this.st_ape=create st_ape
this.st_ape2=create st_ape2
this.st_dir=create st_dir
this.d_direccion=create d_direccion
this.st_dir2=create st_dir2
this.st_tel_cli_r=create st_tel_cli_r
this.st_2=create st_2
this.st_tel_cli_r2=create st_tel_cli_r2
this.st_doc2=create st_doc2
this.st_doc=create st_doc
this.d_cliente=create d_cliente
this.st_area=create st_area
this.sle_area=create sle_area
this.sle_esq_cond=create sle_esq_cond
this.st_medidor=create st_medidor
this.em_medidor=create em_medidor
this.p_2=create p_2
this.p_1=create p_1
this.p_avi_peligro=create p_avi_peligro
this.p_esencial=create p_esencial
this.gb_1=create gb_1
this.p_cli_imp=create p_cli_imp
this.st_esencial=create st_esencial
this.st_cli_imp=create st_cli_imp
this.d_causa_ot24h=create d_causa_ot24h
this.gb_3=create gb_3
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_7=create gb_7
this.gb_8=create gb_8
this.st_incid_rs=create st_incid_rs
this.st_sin_alim=create st_sin_alim
this.st_7=create st_7
this.st_6=create st_6
this.st_nro_aviso=create st_nro_aviso
this.st_nro_inc=create st_nro_inc
this.st_8=create st_8
this.st_error=create st_error
this.p_kawoq=create p_kawoq
this.st_kawoq=create st_kawoq
this.p_corte=create p_corte
this.st_corte=create st_corte
this.gb_2=create gb_2
this.gb_10=create gb_10
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_telefono
this.Control[iCurrent+2]=this.d_imp_aviso
this.Control[iCurrent+3]=this.st_nro_aviso2
this.Control[iCurrent+4]=this.st_ord_corte
this.Control[iCurrent+5]=this.st_avi_peligro
this.Control[iCurrent+6]=this.st_clase_avi
this.Control[iCurrent+7]=this.d_inf_resumen
this.Control[iCurrent+8]=this.st_aviso_pend
this.Control[iCurrent+9]=this.p_aviso_pend
this.Control[iCurrent+10]=this.p_ord_corte
this.Control[iCurrent+11]=this.st_nis2
this.Control[iCurrent+12]=this.st_nis
this.Control[iCurrent+13]=this.d_nis_rad
this.Control[iCurrent+14]=this.st_3
this.Control[iCurrent+15]=this.d_clase_avi
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.p_avi_calidad
this.Control[iCurrent+19]=this.st_avi_calidad
this.Control[iCurrent+20]=this.st_inc_asign
this.Control[iCurrent+21]=this.p_inc_rs
this.Control[iCurrent+22]=this.p_inc_asign
this.Control[iCurrent+23]=this.p_sin_alim
this.Control[iCurrent+24]=this.st_nic
this.Control[iCurrent+25]=this.st_1
this.Control[iCurrent+26]=this.calle_tapa
this.Control[iCurrent+27]=this.st_ape
this.Control[iCurrent+28]=this.st_ape2
this.Control[iCurrent+29]=this.st_dir
this.Control[iCurrent+30]=this.d_direccion
this.Control[iCurrent+31]=this.st_dir2
this.Control[iCurrent+32]=this.st_tel_cli_r
this.Control[iCurrent+33]=this.st_2
this.Control[iCurrent+34]=this.st_tel_cli_r2
this.Control[iCurrent+35]=this.st_doc2
this.Control[iCurrent+36]=this.st_doc
this.Control[iCurrent+37]=this.d_cliente
this.Control[iCurrent+38]=this.st_area
this.Control[iCurrent+39]=this.sle_area
this.Control[iCurrent+40]=this.sle_esq_cond
this.Control[iCurrent+41]=this.st_medidor
this.Control[iCurrent+42]=this.em_medidor
this.Control[iCurrent+43]=this.p_2
this.Control[iCurrent+44]=this.p_1
this.Control[iCurrent+45]=this.p_avi_peligro
this.Control[iCurrent+46]=this.p_esencial
this.Control[iCurrent+47]=this.gb_1
this.Control[iCurrent+48]=this.p_cli_imp
this.Control[iCurrent+49]=this.st_esencial
this.Control[iCurrent+50]=this.st_cli_imp
this.Control[iCurrent+51]=this.d_causa_ot24h
this.Control[iCurrent+52]=this.gb_3
this.Control[iCurrent+53]=this.gb_4
this.Control[iCurrent+54]=this.gb_5
this.Control[iCurrent+55]=this.gb_7
this.Control[iCurrent+56]=this.gb_8
this.Control[iCurrent+57]=this.st_incid_rs
this.Control[iCurrent+58]=this.st_sin_alim
this.Control[iCurrent+59]=this.st_7
this.Control[iCurrent+60]=this.st_6
this.Control[iCurrent+61]=this.st_nro_aviso
this.Control[iCurrent+62]=this.st_nro_inc
this.Control[iCurrent+63]=this.st_8
this.Control[iCurrent+64]=this.st_error
this.Control[iCurrent+65]=this.p_kawoq
this.Control[iCurrent+66]=this.st_kawoq
this.Control[iCurrent+67]=this.p_corte
this.Control[iCurrent+68]=this.st_corte
this.Control[iCurrent+69]=this.gb_2
this.Control[iCurrent+70]=this.gb_10
this.Control[iCurrent+71]=this.gb_6
end on

on w_1201_recepcion_aviso.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.sle_telefono)
destroy(this.d_imp_aviso)
destroy(this.st_nro_aviso2)
destroy(this.st_ord_corte)
destroy(this.st_avi_peligro)
destroy(this.st_clase_avi)
destroy(this.d_inf_resumen)
destroy(this.st_aviso_pend)
destroy(this.p_aviso_pend)
destroy(this.p_ord_corte)
destroy(this.st_nis2)
destroy(this.st_nis)
destroy(this.d_nis_rad)
destroy(this.st_3)
destroy(this.d_clase_avi)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.p_avi_calidad)
destroy(this.st_avi_calidad)
destroy(this.st_inc_asign)
destroy(this.p_inc_rs)
destroy(this.p_inc_asign)
destroy(this.p_sin_alim)
destroy(this.st_nic)
destroy(this.st_1)
destroy(this.calle_tapa)
destroy(this.st_ape)
destroy(this.st_ape2)
destroy(this.st_dir)
destroy(this.d_direccion)
destroy(this.st_dir2)
destroy(this.st_tel_cli_r)
destroy(this.st_2)
destroy(this.st_tel_cli_r2)
destroy(this.st_doc2)
destroy(this.st_doc)
destroy(this.d_cliente)
destroy(this.st_area)
destroy(this.sle_area)
destroy(this.sle_esq_cond)
destroy(this.st_medidor)
destroy(this.em_medidor)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.p_avi_peligro)
destroy(this.p_esencial)
destroy(this.gb_1)
destroy(this.p_cli_imp)
destroy(this.st_esencial)
destroy(this.st_cli_imp)
destroy(this.d_causa_ot24h)
destroy(this.gb_3)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_7)
destroy(this.gb_8)
destroy(this.st_incid_rs)
destroy(this.st_sin_alim)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_nro_aviso)
destroy(this.st_nro_inc)
destroy(this.st_8)
destroy(this.st_error)
destroy(this.p_kawoq)
destroy(this.st_kawoq)
destroy(this.p_corte)
destroy(this.st_corte)
destroy(this.gb_2)
destroy(this.gb_10)
destroy(this.gb_6)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1201_recepcion_aviso
integer x = 8000
integer y = 0
end type

type sle_telefono from singlelineedit within w_1201_recepcion_aviso
event ue_enter pbm_keydown
event u_tab_ pbm_keydown
event u_tab_ref pbm_keydown
integer x = 859
integer y = 1508
integer width = 1001
integer height = 76
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////
long ll_row

If fg_verifica_parametro('ingreso_clientes_telefono') Then
	IF KeyDown(KeyEnter!) THEN
		IF NOT IsNull(sle_telefono.Text) THEN
			IF st_tel_cli_r.enabled = True AND st_tel_cli_r.visible = True THEN
				st_tel_cli_r.TriggerEvent("doubleclicked")
			END IF
		END IF		
	END IF
End if
end event

event modified;if len(this.text) > 15 then 
	this.text = Mid ( this.text, 1, 15 )
end if
end event

type d_imp_aviso from datawindow within w_1201_recepcion_aviso
boolean visible = false
integer x = 7758
integer y = 612
integer width = 114
integer height = 152
string dataobject = "d_avi_2035_imp_avisos"
boolean livescroll = true
end type

type st_nro_aviso2 from statictext within w_1201_recepcion_aviso
event doubleclicked pbm_bndoubleclicked
boolean visible = false
integer x = 6647
integer y = 700
integer width = 425
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 16777215
long backcolor = 553648127
string text = "Nro Aviso"
boolean focusrectangle = false
end type

event doubleclicked;int li_v_doc, li_res_c_estr, li_mensaje
string ls_error, ls_nulo
long ll_nro_aviso, ll_nulo, ll_estado
int li_ind_calidad

SetPointer(HourGlass!)

d_inf_resumen.AcceptText()
ll_nro_aviso = d_inf_resumen.GetItemNumber (1,"nro_aviso")

if isnull(ll_nro_aviso) or ll_nro_aviso=0 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Debe introducir un N$$HEX1$$fa00$$ENDHEX$$mero de aviso.",information!,ok!)
	d_inf_resumen.setfocus()
	return
end if
	
SetNull(ll_nulo)

SELECT GI_AVISOS.EST_AVISO , 
       GI_AVISOS.IND_CALIDAD //DBE 07/03/2000
	INTO :ll_estado ,
	     :li_ind_calidad
    FROM GI_AVISOS  
   WHERE GI_AVISOS.NRO_AVISO = :ll_nro_aviso   ;


//DBE tmp ini 23/03/2000 18:55
IF li_ind_calidad = 1 THEN
//		p_avi_calidad.visible=true
//		st_avi_calidad.visible=true
		d_clase_avi.setitem(1,1,fgci_clase_avi_calidad)
END IF

//DBE tmp fin 23/03/2000 18:55


IF ll_estado = 0 THEN 
	gnv_msg.f_mensaje("AR17","","",OK!)
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Ese aviso no existe en el sistema",exclamation!)
	d_inf_resumen.SetItem(1,"nro_aviso",ll_nulo)
		
ELSEIF ll_estado > 4 THEN
	gnv_msg.f_mensaje("AR18","","",OK!)
	Parent.TriggerEvent("ue_nuevo")
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Este aviso ya ha sido resuelto",exclamation!)
		
ELSE

	SELECT GI_AVISOS.NIS_RAD  
    	INTO :il_nis  
    	FROM GI_AVISOS  
   	WHERE GI_AVISOS.NRO_AVISO = :ll_nro_aviso   ;
	
	is_direccion.gl_nis= il_nis  


	IF (Len(string(is_direccion.gl_nis)) = 7) THEN
		//**********************************************
		//**  OSGI 2001.2  	12/11/2002					 **
		//**  Jair Padilla / Soluziona PANAMA  		 **
		//**  MOSTRAR NIC AL RECUPERAR POR NRO_AVISO  **
		//**********************************************
 		If ib_param_nic Then st_nic.Visible = True
		//**********************************************
		//**  OSGI 2001.2  	12/11/2002					 **
		//**  Jair Padilla / Soluziona PANAMA  		 **
		//**  MOSTRAR NIC AL RECUPERAR POR NRO_AVISO  **
		//**********************************************

	// Cargo en la estructura el resto de los datos necesarios


		ib_en_corte = False

		li_res_c_estr = d_nis_rad.fpr_c_estruc_dir_por_nis(is_direccion) 


	
		IF li_res_c_estr = 1 OR li_res_c_estr = 3 THEN
	
			//	Procedimiento Almacenado Datos_suministro ???
	
			IF li_res_c_estr = 3 THEN
				ib_en_corte = True
			END IF
			
			parmstr6 = d_direccion.GetItemString(1,"calle")
			Parent.TriggerEvent("ue_proc_sum")
			
			// Compruebo si ha salido del evento por un error o si todo ha ido bien
			IF ib_retorno THEN
				// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
				st_doc.Hide()
				st_doc2.Hide()
				st_nis.Show()
				st_nis2.Hide()
				st_ape.Hide()
				st_ape2.Hide()
				st_dir2.Hide()
				st_dir.Hide()
				st_nro_aviso2.Hide()
				//**********************************************
				//**  OSGI 2001.2  	12/11/2002					 **
				//**  Jair Padilla / Soluziona PANAMA  		 **
				//**  MOSTRAR NIC AL RECUPERAR POR NRO_AVISO  **
				//**********************************************
				st_tel_cli_r2.Hide()
				st_tel_cli_r.Hide()

				If fw_nis() = 0  Then
					Parent.TriggerEvent("ue_nuevo")
					RETURN
				End If
				//**********************************************
				//**  OSGI 2001.2  	12/11/2002					 **
				//**  Jair Padilla / Soluziona PANAMA  		 **
				//**  MOSTRAR NIC AL RECUPERAR POR NRO_AVISO  **
				//**********************************************
			END IF	
		ELSEIF li_res_c_estr = 0 THEN
			gnv_msg.f_mensaje("AR03","","",OK!)
		ELSEIF li_res_c_estr = 2 THEN
			gnv_msg.f_mensaje("AR13","","",OK!)
			
		ELSEIF li_res_c_estr = -1 THEN

			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)

			//**********************************************
			//**  OSGI 2001.2  	12/11/2002					 **
			//**  Jair Padilla / Soluziona PANAMA  		 **
			//**  MOSTRAR NIC AL RECUPERAR POR NRO_AVISO  **
			//**********************************************
			st_nic.Visible = False
			//**********************************************
			//**  OSGI 2001.2  	12/11/2002					 **
			//**  Jair Padilla / Soluziona PANAMA  		 **
			//**  MOSTRAR NIC AL RECUPERAR POR NRO_AVISO  **
			//**********************************************

			d_inf_resumen.setfocus()
			RETURN
		END IF
	
	ELSE
		gnv_msg.f_mensaje("ER32","","",OK!)
	END IF
END IF

d_inf_resumen.setfocus()
end event

type st_ord_corte from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 3826
integer y = 76
integer width = 416
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Orden de Corte"
boolean focusrectangle = false
end type

type st_avi_peligro from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 5225
integer y = 76
integer width = 457
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Aviso de Peligro"
boolean focusrectangle = false
end type

type st_clase_avi from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 535
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = " Clase de Aviso : "
boolean focusrectangle = false
end type

type d_inf_resumen from u_avi_2004_pr_form_inf_resumen within w_1201_recepcion_aviso
event ue_enter pbm_dwnkey
integer x = 23
integer y = 1060
integer width = 4741
integer height = 848
integer taborder = 90
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_enter;call super::ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

//IF KeyDown(KeyEnter!) THEN  st_nro_aviso2.TriggerEvent("doubleclicked")
end event

event rbuttondown;call super::rbuttondown;//messagebox("t1",string(t1))
//messagebox("t2",string(t2))
//messagebox("t3",string(t3))
//messagebox("t4",string(t4))
//messagebox("t5",string(t5))
//
end event

event itemchanged;call super::itemchanged;
string ls_colum_act
int li_ind_pel, li_tipo_avi
int	li_claseAviso			//Clase de aviso asociado al tipo de aviso
int	li_numeroRegistros	//N$$HEX1$$fa00$$ENDHEX$$mero de registros que hay en la tabla sgd_valor con codif = 'T_CA'


ls_colum_act = This.GetColumnName()

This.AcceptText()

IF ls_colum_act = "tip_aviso" THEN
	li_tipo_avi = This.GetItemNumber(This.GetRow(),"tip_aviso")
		
	//AHM (16/09/2009) Mejora 1/468671 -> Mejora ingreso aviso clase aviso
	SELECT count(*)
	INTO   :li_numeroRegistros
	FROM   sgd_valor
	WHERE  codif = 'T_CA';
	
	IF li_numeroRegistros > 0 THEN		//Comprueba que existe la relaci$$HEX1$$f300$$ENDHEX$$n entre el tipo de aviso y la clase
 	
		SELECT NVL(codigo, 300)
		INTO   :li_claseAviso
		FROM   sgd_valor
		WHERE  codif = 'T_CA' 
				 AND valor = :li_tipo_avi;
		
		d_clase_avi.setItem(1, "clase_avi", li_claseAviso)
	
	
	END IF
	
	SELECT "GI_T_TIP_AVISO"."IND_PELIGRO"  
   INTO :li_ind_pel  
   FROM "GI_T_TIP_AVISO"  
   WHERE "GI_T_TIP_AVISO"."TIP_AVISO" = :li_tipo_avi;
	
	IF li_ind_pel = 1 THEN
		
		//AHM (15/06/2009) Mejora 1/372585
		IF ( gi_pais <> 8) OR (gi_pais = 8 AND li_tipo_avi = 5) THEN
			p_avi_peligro.Show()
			st_avi_peligro.Show()
		ELSEIF (gi_pais = 8 AND li_tipo_avi = 4) THEN
			p_2.Show()
			st_avi_peligro.Show()
		ELSEIF (gi_pais = 8 AND li_tipo_avi = 9) THEN
			p_1.Show()
			st_avi_peligro.Show()	
		END IF
				
//		p_avi_peligro.Show()
//		st_avi_peligro.Show()

		// Habilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
		//md_ing_avisos.f_habilitar("GRABAR",true)
		//sigemee
		md_ing_avisos.f_habilitar("GRABAR",false)
	ELSE
		p_avi_peligro.Hide()
		st_avi_peligro.Hide()

		//AHM (21/07/2009) Mejora 1/372585
		p_1.hide()
		p_2.hide()

		IF p_ord_corte.Visible AND p_cli_imp.Visible THEN
			IF fgci_grabar = 1 THEN

				// Habilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
				//md_ing_avisos.f_habilitar("GRABAR",true)
				//sigeme
				md_ing_avisos.f_habilitar("GRABAR",false)
			ELSE

				// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
				md_ing_avisos.f_habilitar("GRABAR",false)			
			END IF
		ELSEIF p_ord_corte.Visible OR ib_en_corte THEN

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)			
		ELSE

			// Habilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			//md_ing_avisos.f_habilitar("GRABAR",true)
			//sigeme
			md_ing_avisos.f_habilitar("GRABAR",false)
		END IF
	

	END IF
END IF
end event

event editchanged;call super::editchanged;// En este evento se controla que el usuario no introduzca como primer caracter del
// Nis, el signo negativo.   (LFE)
string ls_aviso

ls_aviso = this.GetText()
if ls_aviso = "-" and this.getcolumnname()= "nro_aviso" then
	this.SetText("")
end if

end event

event ue_soltar_click;//
end event

event ue_soltar_clicked;//
end event

event dberror;//

end event

event itemerror;if dwo.name= "fecha_problema" then
	gnv_msg.f_mensaje("AA24","","",OK!)
end if	
return 1

end event

type st_aviso_pend from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 3817
integer y = 248
integer width = 443
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Aviso Pendiente"
boolean focusrectangle = false
end type

type p_aviso_pend from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 3657
integer y = 228
integer width = 146
integer height = 128
string pointer = "MANOOK.CUR"
string picturename = ".\pict\SEMAF2.BMP"
boolean focusrectangle = false
end type

event doubleclicked;SetPointer(HourGlass!)

gu_comunic.is_comunic.programa_llamante = "w_1201_avi"
gu_comunic.is_comunic.accion_llamada = 'Consulta'
gu_comunic.is_comunic.longval1 = il_ex_avi_pendiente
gu_comunic.is_comunic.programa_retorno = ' '
gu_comunic.is_comunic.intval5=d_clase_avi.GetItemNumber(1,1)
//if gs_programa_principal = "w_prin" then

//Sustituir la funci$$HEX1$$f300$$ENDHEX$$n fnu_abrir() por	OpenSheet

	//Open(w_1203_inf_aviso) 
	//OpenSheet(w_1203_inf_aviso,w_operaciones,8, Layered!)
	OpenSheet (w_1203_inf_aviso, w_genapp_frame, menu, layered!)
	
//	gu_comunic.fnu_abrir(w_1203_inf_aviso,"w_1203_inf_aviso",0,1,w_1201_recepcion_aviso,"w_1201_recepcion_aviso")	
//else
	
//	Opensheet(w_1203_inf_aviso,w_operaciones,2,layered!)
	
//	gu_comunic.fnu_abrir(w_1203_inf_aviso,"w_1203_inf_aviso",0,1,w_1201_recepcion_aviso,"w_1201_recepcion_aviso")	
//end if
end event

type p_ord_corte from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 3657
integer y = 60
integer width = 146
integer height = 128
string pointer = "MANOOK.CUR"
string picturename = ".\pict\SEMAF2.BMP"
boolean focusrectangle = false
end type

on doubleclicked;SetPointer(HourGlass!)

parnum1 = Parent.d_nis_rad.GetItemNumber(1,1)
parnum2 = il_ord_servicio

Open(w_1104_listado_ordenes_servicio)
//gu_comunic.fnu_abrir(w_1104_listado_ordenes_servicio,"w_1104_listado_ordenes_servicio",0,1,w_1201_recepcion_aviso,"w_1201_recepcion_aviso")	


end on

type st_nis2 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 183
integer height = 64
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
string text = "Nis:"
alignment alignment = center!
boolean focusrectangle = false
end type

event doubleclicked;int li_v_doc, li_res_c_estr, li_mensaje, li_return_nic
string ls_error
long ll_nulo
long ll_nis_rad// GNU 12-12-2006. Mejora 1/327511
int li_a50_2 //Mejora  A50-2 3/3/2020

//close(w_consulta_incidencia)
SetPointer(HourGlass!)
SetNull(ll_nulo)


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
li_return_nic = fw_nic()
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// Valido Nis_Rad
is_direccion.gl_nis = long(d_nis_rad.fpr_v_nis_rad(d_nis_rad))

//03/03/2020 - hespinoza/tda
//Se verifica si el cliente se encuentra en A50-2 para restringir el reclamo
li_a50_2 = f_gi_a50_2(is_direccion.gl_nis)
	
if li_a50_2 = 1 then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","Este Suministro se encuentra en A502, Por lo que NO se le Generar$$HEX2$$e1002000$$ENDHEX$$Aviso.",Exclamation!)
	d_nis_rad.SetText("")
	Parent.TriggerEvent("ue_nuevo")
else
	//Continua como normalmente no realiza
	
	IF  (Len(string(is_direccion.gl_nis)) = 7) AND is_direccion.gl_nis > 0 And li_return_nic = 1  THEN
	// Cargo en la estructura el resto de los datos necesarios


	ib_en_corte = False

	li_res_c_estr = d_nis_rad.fpr_c_estruc_dir_por_nis(is_direccion) 


	
		IF li_res_c_estr = 1 OR li_res_c_estr = 3 THEN
	
			//	Procedimiento Almacenado Datos_suministro ???
	
			IF li_res_c_estr = 3 THEN
				ib_en_corte = True
			END IF

			parmstr6 = d_direccion.GetItemString(1,"calle")
			
			
	
			

			Parent.TriggerEvent("ue_proc_sum")
			// Compruebo si salimos del evento por un error o todo ha ido bien
			IF ib_retorno THEN
				// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
				st_doc.Hide()
				st_doc2.Hide()
				st_nis.Show()
				st_nis2.Hide()
				st_ape.Hide()
				st_ape2.Hide()
				st_dir2.Hide()
				st_dir.Hide()
				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				st_tel_cli_r2.Hide()
				st_tel_cli_r.Hide()
				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************	
			END IF
		ELSEIF li_res_c_estr = 0 THEN
			gnv_msg.f_mensaje("AR03","","",OK!)

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************	
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************	
		ELSEIF li_res_c_estr = 2 THEN
			gnv_msg.f_mensaje("AR13","","",OK!)
			d_nis_rad.fpr_limpiar_campos()

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************	
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************	
		ELSEIF li_res_c_estr = -1 THEN

			ib_error = True

			// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n grabar del men$$HEX1$$fa00$$ENDHEX$$
			md_ing_avisos.f_habilitar("GRABAR",false)

			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************	
			fw_visible_enabled_nic(False)
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************	

			RETURN
		END IF
	
ELSE
	If li_return_nic = 0 Then gnv_msg.f_mensaje("ER32","","",OK!)

	d_nis_rad.fpr_limpiar_campos()
	
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************	
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************	
END IF

	d_inf_resumen.SetFocus()	


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************	
st_nic.BackColor = Long(d_nis_rad.Describe("nis_rad.BackGround.Color"))
st_nic.TextColor = Long(d_nis_rad.Describe("nis_rad.Color"))
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// GNU 12-12-2006. Mejora 1/327511
IF ib_param_medidor then
	em_medidor.BackColor = Long(d_nis_rad.Describe("nis_rad.BackGround.Color"))
	em_medidor.TextColor = Long(d_nis_rad.Describe("nis_rad.Color"))
	
	IF long(em_medidor.text)=0 THEN
		ll_nis_rad=d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")
		// GNU 18-4-2007. Incidencia Panam$$HEX1$$e100$$ENDHEX$$
		//SELECT NIF_APA
		SELECT NUM_APA
		INTO :em_medidor.text
		FROM APMEDIDA_AP
		WHERE NIS_RAD= :ll_nis_rad
		USING SQLCA;
		
		IF sqlca.sqlcode<>0 THEN
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se ha encotrado informaci$$HEX1$$f300$$ENDHEX$$n del medidor")
		END IF
	END IF
END IF
// FIN GNU

d_nis_rad.setfocus()


	
end if
//fin - tda
end event

type st_nis from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 224
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Nis:"
alignment alignment = center!
boolean focusrectangle = false
end type

type d_nis_rad from u_nis_2001_pr_nis_rad within w_1201_recepcion_aviso
event ue_enter pbm_dwnkey
integer x = 18
integer y = 88
integer width = 626
integer height = 100
integer taborder = 10
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) THEN
	IF 	d_nis_rad.object.nis_rad.background.color = gs_blanco then
		st_nis2.TriggerEvent("doubleclicked")
		if li_a50 = 1 then
			d_nis_rad.setfocus()
		else
			sle_telefono.setFocus()
		end if
	END IF
END IF
end event

event editchanged;// En este evento se controla que el usuario no introduzca como primer caracter del
// Nis, el signo negativo.   (LFE)
string ls_nis

ls_nis = d_nis_rad.GetText()
if ls_nis = "-" then
	d_nis_rad.SetText("")
end if


end event

type st_3 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 398
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Alarmas"
alignment alignment = center!
boolean focusrectangle = false
end type

type d_clase_avi from u_avi_2013_pr_clase_aviso within w_1201_recepcion_aviso
event ue_itemchanged pbm_custom72
integer x = 18
integer y = 236
integer width = 1138
integer height = 88
integer taborder = 20
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_itemchanged;// Si el aviso a ingresar es normal



IF This.GetItemNumber(1,1) = 0 or This.GetItemNumber(1,1)= 3 THEN

   ib_redo=true
	
	If fg_verifica_parametro("ingreso_clientes_telefono") Then
		st_tel_cli_r2.Show()
		st_tel_cli_r.Show()
	end if
	
	if ib_con_datos = true then
		Parent.TriggerEvent("ue_nuevo")
	else
		
		IF (This.GetItemNumber(1,1) = fgci_clase_avi_normal or This.GetItemNumber(1,1) = fgci_clase_avi_calidad) and &
		    (ii_clase_aviso= fgci_clase_avi_ayuda or ii_clase_aviso = fgci_clase_avi_alum_publ) THEN
			
			d_nis_rad.fpr_habilitar_campos(True)
			d_direccion.fpr_habilitar_campos(False,True)
			fpr_habilitar_campo_sle(sle_telefono,True)
			// GNU 21-12-2005. Incidencia referencia avisos
			//fpr_habilitar_campo_sle(sle_esq_cond,True)
			fpr_habilitar_campo_mle(sle_esq_cond,True)
			// FIN GNU
			d_cliente.fpr_habilitar_campos(True,True)
			d_clase_avi.Enabled = True
			
			
			// Deshabilito los campos de la D.W. inf. resumen del aviso
			d_inf_resumen.fpr_habilitar_campos(True,True,False,False,False,True,False)
			
			// GNU 25-4-2006. Mejora 1/327511
			d_cliente.setitem(1, "tip_doc", is_tip_doc )
			d_cliente.setitem(1, "co_pais", is_co_pais)
			// FIN GNU
			
			/*** LSH *** INI *** DEO14-00001064 *** 22/09/2014 */
			p_esencial.Hide()
			st_esencial.Hide()
			/*** LSH *** FIN *** DEO14-00001064 *** 22/09/2014 */
			
			// Oculto las alarmas
			p_avi_peligro.Hide()
			p_aviso_pend.Hide()
			p_cli_imp.Hide()
			p_inc_asign.Hide()
			p_ord_corte.Hide()
			p_sin_alim.Hide()
			st_avi_peligro.Hide()
			st_aviso_pend.Hide()
			st_cli_imp.Hide()
			st_inc_asign.Hide()
			st_ord_corte.Hide()
			// Eliminamos el estado posiblemente asociado.29/08/2000 GSH
			//st_posib_incid.Hide()
			st_sin_alim.Hide()
			
			// Habilito clase de aviso y la dejo "normal" por default
			d_clase_avi.Enabled = True
			//d_clase_avi.SetItem(1,1,1) //DBE tmp comment 23/03/2000 19:38
			
			
			// Muestro las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda
			st_nis2.Show()
			st_dir.Show()
			st_ape.Show()
//			st_doc2.Show()
			
			IF gl_nro_aviso_visible  THEN    // LFE
//				st_nro_aviso2.Show()				// LFE
			END IF									// LFE
			
			
			// Cargo por defecto los valores de la localizaci$$HEX1$$f300$$ENDHEX$$n del usuario
			d_direccion.fpr_setear_campos(is_prov, is_depto, is_munic, is_local)
			
			iu_gen_comunic.is_comunic.intval1 = il_parnum2
			iu_gen_comunic.is_comunic.intval2 = il_parnum3
			iu_gen_comunic.is_comunic.longval4 = il_parnum4
			iu_gen_comunic.is_comunic.longval5 = il_parnum5
			iu_gen_comunic.is_comunic.strval1 = is_prov
			iu_gen_comunic.is_comunic.strval2 = is_depto
			iu_gen_comunic.is_comunic.strval3 = is_munic
			iu_gen_comunic.is_comunic.strval4 = is_local
			
			
			// Me paro en el campo nis_rad
			d_nis_rad.SetFocus()
			d_nis_rad.object.nis_rad.background.color = gs_blanco
		end if
	end if
	
	IF This.GetItemNumber(1,1) = 0 THEN
		d_inf_resumen.is_avisos.gi_ind_calidad= 0
	ELSEIF This.GetItemNumber(1,1) = 3 THEN
		d_inf_resumen.is_avisos.gi_ind_calidad= 1
	END IF

ELSE
		ib_redo=false
		// Limpio el nis
		d_nis_rad.fpr_limpiar_campos()
		d_cliente.fpr_limpiar_campos()
		d_direccion.fpr_limpiar_campos()
		fpr_limpiar_campo_sle(sle_telefono)
		// GNU 21-12-2005. Incidencia referencia  avisos
//		fpr_limpiar_campo_sle(sle_esq_cond)
		sle_esq_cond.text=""
		st_nro_aviso.text=""
		st_nro_inc.text = ""
		// FIN GNU
		d_inf_resumen.fpr_limpiar_campos()
		
		// Habilito/deshabilito los campos de los user-object que utilizo
		d_nis_rad.fpr_habilitar_campos(False)
		d_direccion.fpr_habilitar_campos(False,True)
		// GNU 21-12-2005. Incidencia referencia  avisos
		//fpr_habilitar_campo_sle(sle_esq_cond,True)
		fpr_habilitar_campo_mle(sle_esq_cond,True)
		// FIN GNU
		fpr_habilitar_campo_sle(sle_telefono,True)
		d_cliente.fpr_habilitar_campos(True,True)
		d_inf_resumen.fpr_habilitar_campos(True,True,True,True,True,False,False)

	
		// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n "buscar" del men$$HEX1$$fa00$$ENDHEX$$
		md_ing_avisos.f_habilitar("BUSCAR",False)
	
		// Deshabilito la opci$$HEX1$$f300$$ENDHEX$$n "grabar" del men$$HEX1$$fa00$$ENDHEX$$
		md_ing_avisos.f_habilitar("GRABAR",False)
		
					// GNU 25-4-2006. Mejora 1/327511
			d_cliente.setitem(1, "tip_doc", is_tip_doc )
			d_cliente.setitem(1, "co_pais", is_co_pais)
			// FIN GNU
	
		// Oculto las etiquetas de b$$HEX1$$fa00$$ENDHEX$$squeda, menos la de ident. geogr$$HEX1$$e100$$ENDHEX$$fica
		st_ape.Hide()
		st_ape2.Hide()
		st_dir2.Hide()
		st_doc.Hide()
		st_doc2.Hide()
		st_nis2.Hide()

		// GNU 7-11-2007. Incidencia 0/535285
		IF gl_nro_aviso_visible  THEN    // LFE
//			st_nro_aviso2.Show()				// LFE
		ELSE									// LFE
			st_nro_aviso2.Hide()
		END IF
		// FIN GNU


		//***************************************
		//**  OSGI 2001.1  	20/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		st_tel_cli_r2.Hide()
		st_tel_cli_r.Hide()
		//***************************************
		//**  OSGI 2001.1  	20/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************


		//Muestro la etiqueta de Nis
		st_nis.Show()
		
		//Muestro la etiqueta activa de Direcci$$HEX1$$f300$$ENDHEX$$n
		st_dir.show()
	
		// Doy el foco a la D.W. de direcci$$HEX1$$f300$$ENDHEX$$n
		d_direccion.SetFocus()

		// Escondo las alarmas irrelevantes
		p_aviso_pend.Hide()
		p_inc_asign.Hide()
		p_ord_corte.Hide()
		p_sin_alim.Hide()
		st_aviso_pend.Hide()
		st_inc_asign.Hide()
		st_ord_corte.Hide()
		st_sin_alim.Hide()
		
		// Reseteo toda la inf. relacionada con la alimentaci$$HEX1$$f300$$ENDHEX$$n del Suministro.
		SetNull(d_inf_resumen.is_avisos.gl_nro_instalacion) 
		SetNull(d_inf_resumen.is_avisos.gl_nro_incidencia ) 

END IF
gnu_u_transaction.uf_rollback(PARENT)
//Parent.SetRedraw(True)
ii_clase_aviso = this.object.clase_avi[1]		

//********************************************************************************************************//
// Externalidad: Avisos de ayuda y ap, solo se cumplimentara provincia, distrito, corregimiento y barrio  //
// Luis Eduardo Ortiz Mayo/2001                                                                           //
//********************************************************************************************************//

calle_tapa.Visible = False
If fg_verifica_parametro("avisos_ayuda_ap_prov_dist_corr_barrio") Then
	Integer li_tipo_aviso
	String result

	li_tipo_aviso = d_clase_avi.GetItemNumber(d_clase_avi.GetRow(),"clase_avi")

	If li_tipo_aviso = 1 Then
		gl_tipo_aviso = 77777777
	ElseIf li_tipo_aviso = 2 Then
		gl_tipo_aviso = 66666666
	Else
		gl_tipo_aviso = 0
	End If

	If gl_tipo_aviso = fgcdec_aviso_alumbrado_publico Or gl_tipo_aviso = fgcdec_aviso_de_ayuda Then
		calle_tapa.Visible=True
	End If
End If

//********************************************************************************************************//
// Luis Eduardo Ortiz Mayo/2001                                                                           //
//********************************************************************************************************//

end event

on itemerror;// Nada
end on

on ue_ctrlclicked;// Nada
end on

event itemchanged;call super::itemchanged;
This.PostEvent("ue_itemchanged")
end event

on clicked;// Nada
end on

on constructor;// Nada
end on

on dberror;// Nada
end on

on rowfocuschanged;// Nada
end on

on ue_shiftclicked;// Nada
end on

type st_4 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 2098
integer height = 152
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 81324524
boolean enabled = false
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_5 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 731
integer height = 152
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
alignment alignment = right!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type p_avi_calidad from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 5093
integer y = 228
integer width = 110
integer height = 104
boolean bringtotop = true
string picturename = ".\pict\ACTIV_IM.BMP"
boolean border = true
boolean focusrectangle = false
end type

type st_avi_calidad from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 5225
integer y = 240
integer width = 453
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Aviso de Calidad"
boolean focusrectangle = false
end type

type st_inc_asign from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 4471
integer y = 84
integer width = 535
integer height = 84
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Incidencia Asociada"
boolean focusrectangle = false
end type

type p_inc_rs from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 5687
integer y = 48
integer width = 146
integer height = 128
string pointer = "MANOOK.CUR"
string picturename = ".\pict\SEMAF2.BMP"
boolean focusrectangle = false
end type

event doubleclicked;char lch_tip_int
//AHM(08/03/2011) ASUR 975759
//window		lw_ventanaActiva		//Ventana activa despu$$HEX1$$e900$$ENDHEX$$s de abrir la ventada de aviso pendiente

SetPointer(HourGlass!)

//lch_tip_int = iu_avi_2004_nu.fnu_v_interrup_total(iu_avi_2004_nu.&
//					is_avisos.gl_nro_incidencia) 
//
//IF lch_tip_int = fgcs_interrupcion_ultimo_nivel() OR &
//		lch_tip_int = fgcs_interrupcion_total() THEN

//AHM(08/03/2011) ASUR 975759
//IF gi_pais = 4 THEN		//Comprueba que estamos en Panam$$HEX1$$e100$$ENDHEX$$
//	
//	p_aviso_pend.triggerEvent("doubleclicked")
//	
//	lw_ventanaActiva = w_operaciones.getActiveSheet()
//	
//	CLOSE(lw_ventanaActiva)
//	
//END IF

gu_comunic.is_comunic.programa_llamante = "w_1201_rec_aviso"

gu_comunic.is_comunic.accion_llamada = "Consulta"

gu_comunic.is_comunic.longval3 = il_nro_incid

// Sustituir fnu_abrir() por OpenSheet
gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,3)

//OpenSheet(w_2301_form_incidencia,w_1201_recepcion_aviso,4,Layered!)

//gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_1201_recepcion_aviso,"w_1201_recepcion_aviso")	


//ELSE
//	parnum1 = iu_avi_2004_nu.is_avisos.gl_nro_instalacion
//	Open(w_1108_list_incid_afectan)
//END IF

end event

type p_inc_asign from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 4297
integer y = 60
integer width = 146
integer height = 128
string pointer = "MANOOK.CUR"
string picturename = ".\pict\SEMAF2.BMP"
boolean focusrectangle = false
end type

event doubleclicked;char lch_tip_int

//AHM(21/03/2011) ASUR 991143
//AHM(08/03/2011) ASUR 975759
long			ll_nic					//Nis introducido por el operador
powerobject lpo_origen				//Objeto para realizar la b$$HEX1$$fa00$$ENDHEX$$squeda de la ventana origen
window		lw_ventanaActiva		//Ventana que tiene el foco
w_1201_recepcion_aviso	lw_aviso	//Ventana desde la que se introducen los avisos

close(w_consulta_incidencia)

SetPointer(HourGlass!)

//lch_tip_int = iu_avi_2004_nu.fnu_v_interrup_total(iu_avi_2004_nu.&
//					is_avisos.gl_nro_incidencia) 
//
//IF lch_tip_int = fgcs_interrupcion_ultimo_nivel() OR &
//		lch_tip_int = fgcs_interrupcion_total() THEN

gu_comunic.is_comunic.programa_llamante = "w_1201_rec_aviso"

gu_comunic.is_comunic.accion_llamada = "Consulta"

gu_comunic.is_comunic.longval3 = il_nro_incid



//AHM(08/03/2011) ASUR 975759
IF gi_pais = 3 THEN
	
	//Capturamos el nis
	d_nis_rad.AcceptText()
	
	ll_nic = long(st_nic.Text)
	IF ll_nic = 0 THEN
		ll_nic = d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")
	END IF
	
	//Buscamos la ventana actual para cerrarla
	lpo_origen = THIS

	DO WHILE (lpo_origen.typeOf() <>Window! )
		lpo_origen = lpo_origen.Getparent()
		IF NOT isvalid(lpo_origen) THEN EXIT
	LOOP
	
	CLOSE(lpo_origen)
	
//	//Apertura de la incidencia
	gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,3)
		
	//Apertura de la ventana de ingreso de avisos
	w_operaciones.TriggerEvent("ue_ingreso_reclamos")
	
	//Apertura de la ventana de los datos del cliente y recuperaci$$HEX1$$f300$$ENDHEX$$n de los datos
		
	//Recuperamos los datos generales
	lw_ventanaActiva = w_operaciones.GetActiveSheet ( )
	
	lw_aviso = lw_ventanaActiva
	
	lw_aviso.d_nis_rad.setItem(1, "nis_rad", ll_nic)
	lw_aviso.st_nic.text = string(ll_nic)
	
	lw_aviso.d_nis_rad.AcceptText()
	
	lw_aviso.st_nis2.TriggerEvent("doubleclicked")
	
	w_operaciones.GetNextSheet(lw_aviso).setfocus()

//	p_aviso_pend.triggerEvent("doubleclicked")
//	
//	lw_ventanaActiva = w_operaciones.getActiveSheet()
//	
//	CLOSE(lw_ventanaActiva)
	
ELSE

	// Sustituir fnu_abrir() por OpenSheet
	//EDM-16-FASE-02
	Long	nis_rad , nro_aviso
	d_nis_rad.AcceptText()
	nis_rad = d_nis_rad.GetItemNumber(d_nis_rad.GetRow(), "nis_rad")
	
	nro_aviso  = il_pend


	gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,3,nis_rad,nro_aviso)

END IF

//OpenSheet(w_2301_form_incidencia,w_1201_recepcion_aviso,4,Layered!)

//gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_1201_recepcion_aviso,"w_1201_recepcion_aviso")	


//ELSE
//	parnum1 = iu_avi_2004_nu.is_avisos.gl_nro_instalacion
//	Open(w_1108_list_incid_afectan)
//END IF

end event

type p_sin_alim from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 4297
integer y = 60
integer width = 146
integer height = 128
string picturename = ".\pict\COR_PRO1.BMP"
boolean focusrectangle = false
end type

type st_nic from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 357
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_1201_recepcion_aviso
integer x = 859
integer y = 1068
integer width = 2030
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Referencia"
boolean focusrectangle = false
end type

type calle_tapa from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 1842
integer height = 84
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean enabled = false
boolean focusrectangle = false
end type

type st_ape from statictext within w_1201_recepcion_aviso
integer x = 41
integer y = 620
integer width = 498
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 16777215
long backcolor = 553648127
string text = "Apellidos:"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)

// Lo inhabilito
This.Enabled = False


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_visible_enabled_nic(True)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


// Cargo datos ingresados en las var. globales corresp.
d_cliente.AcceptText()
parmstr1 = d_cliente.GetItemString(1,"ap1")
parmstr2 = d_cliente.GetItemString(1,"ap2")
parmstr3 = d_cliente.GetItemString(1,"nombre")

if d_cliente.fpr_cargarDatosCliente(parmstr3,parmstr1,parmstr2) then

	// Abro ventana para identificar el suministro

	Open(w_re0500_ss)
	W_operaciones.SetFocus()
	Parent.SetFocus()

	// Si no encontr$$HEX2$$f3002000$$ENDHEX$$el suministro

	IF parnum1 = 0 THEN
		dir.gl_nis = 0
	END IF

	// Cierro la ventana, pasando como par$$HEX1$$e100$$ENDHEX$$m. la estructura con los datos 



	is_direccion = dir
	
else
	// Abro la ventana de identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
	Open(w_at0113)

	// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
	// de cliente
	is_direccion = Message.PowerObjectParm
end if

// Lo habilito
This.Enabled = True

SetPointer(HourGlass!)

// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
IF (Len(string(is_direccion.gl_nis)) = 7) THEN
	
	iu_gen_comunic.is_comunic = gu_comunic.is_comunic

	IF iu_gen_comunic.is_comunic.intval10 = 1 THEN
		ib_en_corte = True
		gnv_msg.f_mensaje("AR15","","",OK!)
	ELSEIF iu_gen_comunic.is_comunic.intval10 = 0 THEN
		ib_en_corte = False
	ELSEIF iu_gen_comunic.is_comunic.intval10 = 2 THEN
		gnv_msg.f_mensaje("AR22","","",OK!)
		ib_en_corte = true
	END IF
	
   parmstr6 = d_direccion.GetItemString(1,"calle") 
	Parent.TriggerEvent("ue_proc_sum")
	IF ib_bloqueado=TRUE THEN
		ib_bloqueado=FALSE
		Parent.TriggerEvent("ue_nuevo")
		RETURN
	END IF
	SetRedraw(False)
	
	// Compruebo si ha salido del evento por un erro o si todo ha ido bien
	IF ib_retorno THEN
		// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
		st_doc.Hide()
		st_doc2.Hide()
		st_nis.Hide()
		st_nis2.Hide()
		st_ape.Hide()
		st_ape2.Show()
		st_dir2.Hide()
		st_dir.Hide()
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		st_tel_cli_r2.Hide()
		st_tel_cli_r.Hide()
 	END IF
	If fw_nis() = 0  Then
		Parent.TriggerEvent("ue_nuevo")
		RETURN
	End If	
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	
	
	SetRedraw(True)
	
ELSE
	d_cliente.fpr_limpiar_campos()
	//	Cargar estructura de comunicaciones con mensaje de error.
	
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF
end event

type st_ape2 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 293
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Apellido:"
boolean focusrectangle = false
end type

type st_dir from statictext within w_1201_recepcion_aviso
integer x = 2117
integer y = 780
integer width = 402
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 16777215
long backcolor = 553648127
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

event doubleclicked;// Seteo el mouse con formato de reloj de arena
long ll_valor_inicial

SetPointer(HourGlass!)
string ls_nulo

SetNull(ls_nulo)
ll_valor_inicial = gl_tipo_aviso
If not fg_verifica_parametro("avisos_ayuda_ap_prov_dist_corr_barrio") Then
	gl_tipo_aviso = 0
END IF
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
If gl_tipo_aviso <> fgcdec_aviso_alumbrado_publico And gl_tipo_aviso <> fgcdec_aviso_de_ayuda Then
	fw_visible_enabled_nic(True)
End If
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

// Limpio la estructura
//SetNull(is_direccion)



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
SetNull(is_direccion.gs_poblacion)
SetNull(is_direccion.gi_nro_area)
SetNull(is_direccion.gs_area)
//

// Acepto los datos ingresados
d_direccion.AcceptText() 


// Obtengo la informaci$$HEX1$$f300$$ENDHEX$$n ingresada, carg$$HEX1$$e100$$ENDHEX$$ndola en la est. de comunic. // AQUIIIII
// GNU 21-12-2005. Incidencia referencia Avisos
//d_direccion.fpr_c_datos(iu_gen_comunic,sle_esq_cond) 
iu_gen_comunic.is_comunic.strval5 = d_direccion.GetItemString(d_direccion.GetRow(),"calle")
iu_gen_comunic.is_comunic.strval6 = d_direccion.GetItemString(d_direccion.GetRow(),"numero")
iu_gen_comunic.is_comunic.strval7 = d_direccion.GetItemString(d_direccion.GetRow(),"duplic")
iu_gen_comunic.is_comunic.strval8 = sle_esq_cond.text
// FIN GNU

// Cargo en la est. el valor que corresponde para llamar a la ventana
// de ident. geogr$$HEX1$$e100$$ENDHEX$$fica.
iu_gen_comunic.is_comunic.strval10 = "Nis"

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

if d_clase_avi.GetItemNumber(1,1) = fgci_clase_avi_normal OR &
   d_clase_avi.GetItemNumber(1,1) = fgci_clase_avi_calidad then
	gu_comunic.is_comunic.intval7 = 0
else
	gu_comunic.is_comunic.intval7 = 1
end if	



gu_comunic.is_comunic.intval1 = iu_gen_comunic.is_comunic.intval1 
gu_comunic.is_comunic.intval2 = iu_gen_comunic.is_comunic.intval2  // Cod. Depto.
gu_comunic.is_comunic.longval4 = iu_gen_comunic.is_comunic.longval4		// Cod. Munic.
gu_comunic.is_comunic.longval5 = iu_gen_comunic.is_comunic.longval5	// Cod. Loc.

parnum2 = iu_gen_comunic.is_comunic.intval1
parnum3 = iu_gen_comunic.is_comunic.intval2
parnum4 = iu_gen_comunic.is_comunic.longval4
parnum5 = iu_gen_comunic.is_comunic.longval5

OpenWithParm(w_id0100,iu_gen_comunic,w_1201_recepcion_aviso)
//OpensheetWithParm(w_id0100,iu_gen_comunic,w_1201_recepcion_aviso)

//if isValid (w_id0100) then
//	w_id0100.SetFocus()
//end if

// Tomo el valor del par$$HEX1$$e100$$ENDHEX$$metro devuelto por la rutina de identificaci$$HEX1$$f300$$ENDHEX$$n
// geogr$$HEX1$$e100$$ENDHEX$$fica (estructura "s_direcci$$HEX1$$f300$$ENDHEX$$n")
is_direccion = Message.PowerObjectParm
iu_gen_comunic.is_comunic.intval1 = is_direccion.gl_codprov
iu_gen_comunic.is_comunic.intval2 = is_direccion.gl_coddepto
iu_gen_comunic.is_comunic.longval4 = is_direccion.gl_codmun
iu_gen_comunic.is_comunic.longval5 = is_direccion.gl_codloc
iu_gen_comunic.is_comunic.strval1 = is_direccion.gs_prov
iu_gen_comunic.is_comunic.strval2 = is_direccion.gs_depto
iu_gen_comunic.is_comunic.strval3 = is_direccion.gs_munic
iu_gen_comunic.is_comunic.strval4 = is_direccion.gs_local

// Si el tipo del aviso es "Normal"
IF d_clase_avi.GetItemNumber(1,1) = fgci_clase_avi_normal &
or  d_clase_avi.GetItemNumber(1,1) = fgci_clase_avi_calidad  THEN

	// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica
	IF (Len(string(is_direccion.gl_nis)) = 7) THEN
		
		iu_gen_comunic.is_comunic = gu_comunic.is_comunic

		IF iu_gen_comunic.is_comunic.intval10 = 1 THEN
			ib_en_corte = True
			gnv_msg.f_mensaje("AR15","","",OK!)
		ELSEIF iu_gen_comunic.is_comunic.intval10 = 0 THEN
			ib_en_corte = False
		ELSEIF iu_gen_comunic.is_comunic.intval10 = 2 THEN
			gnv_msg.f_mensaje("AR22","","",OK!)
			ib_en_corte = true	
		END IF

		Parent.TriggerEvent("ue_proc_sum")
		// Comprueba si salimos del evento por un error o si todo ha ido bien
		IF ib_retorno THEN
			// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
			st_doc.Hide()
			st_doc2.Hide()
			st_nis.Hide()
			st_nis2.Hide()
			st_ape.Hide()
			st_ape2.Hide()
			st_dir2.Show()
			st_dir.Hide()
			st_tel_cli_r2.Hide()
			st_tel_cli_r.Hide()
		END IF
		IF ib_bloqueado=TRUE THEN // el aviso pare ese NIS lo est$$HEX2$$e1002000$$ENDHEX$$dando de alta otro usuario
			ib_bloqueado=FALSE
			Parent.TriggerEvent("ue_nuevo")
			gl_tipo_aviso = ll_valor_inicial
			return
		END IF
		
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		
		
		IF fw_nis() = 0 Then
			Parent.TriggerEvent("ue_nuevo")
			gl_tipo_aviso = ll_valor_inicial			
			Return
		End If		
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
	ELSE
		//	Cargar estructura de comunicaciones con mensaje de error.
		// Coloco la informaci$$HEX1$$f300$$ENDHEX$$n en los campos de direcci$$HEX1$$f300$$ENDHEX$$n 
      //d_direccion.fpr_llenar_campos(is_direccion)
		d_direccion.Setitem(1,"calle",ls_nulo)	
		//Mato
		d_direccion.object.calle[1] = ""
		d_direccion.object.numero[1] = ""
		d_direccion.object.duplic[1] = ""
		gu_comunic.is_comunic.strval4 = d_direccion.GetItemString(1,"localidad")
		
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		fw_visible_enabled_nic(False)
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************		
	END IF
ELSE
	IF not IsNull(dir.gl_nis) AND dir.gl_nis > 0 THEN
		d_direccion.fpr_llenar_campos(is_direccion)
		st_doc.Hide()
		st_doc2.Hide()
		st_nis.Hide()
		st_nis2.Hide()
		st_ape.Hide()
		st_ape2.Hide()
		st_dir2.Show()
		st_dir.Hide()


		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		st_tel_cli_r2.Hide()
		st_tel_cli_r.Hide()

		IF fw_nis() = 0 Then
			Parent.TriggerEvent("ue_nuevo")
			gl_tipo_aviso = ll_valor_inicial			
			Return
		End If
		//***************************************
		//**  OSGI 2001.1  	15/06/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************


		d_direccion.fpr_habilitar_campos(False, False)
		// Habilito la opci$$HEX1$$f300$$ENDHEX$$n "grabar" del men$$HEX1$$fa00$$ENDHEX$$
		//md_ing_avisos.f_habilitar("GRABAR",True)
		//sigeme
		md_ing_avisos.f_habilitar("GRABAR",false)
	END IF
END IF
gl_tipo_aviso = ll_valor_inicial
end event

type d_direccion from u_dir_2001_pr_direccion_std within w_1201_recepcion_aviso
event ue_enter pbm_dwnkey
integer x = 2117
integer y = 460
integer width = 2039
integer height = 480
integer taborder = 40
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////

IF KeyDown(KeyEnter!) THEN
	IF 	d_direccion.object.calle.background.color = gs_blanco then
		st_dir.TriggerEvent("doubleclicked")
		
	END IF
END IF
end event

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

type st_dir2 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 329
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

type st_tel_cli_r from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 3145
integer y = 784
integer width = 306
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "Manook.cur"
long textcolor = 16777215
long backcolor = 553648127
boolean enabled = false
string text = "Tel Nro.:"
boolean focusrectangle = false
end type

event doubleclicked;//*******************************************************************************//
//             Externalidad: Ingreso de clientes por numero de telefono          //
//             Luis Eduardo Ortiz Abril/2001                                     //
//*******************************************************************************//


String ls_tel_cli

ls_tel_cli = Trim(sle_telefono.Text)

If IsNull(ls_tel_cli) Or ls_tel_cli = "" Then
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La informaci$$HEX1$$f300$$ENDHEX$$n solicitada no cuenta con ningun suministro asociado.")
	Return
End If


//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
fw_visible_enabled_nic(True)
//***************************************
//**  OSGI 2001.1  	15/06/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************


SetPointer(HourGlass!)

This.Enabled = False


//******************************************
//**  OSGI 2001.2  	02/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  OpenWithParm(w_at0113_tel, ls_tel_cli)

OpenWithParm(w_at0113_tel, ls_tel_cli + "~t1"  )
//******************************************
//**  OSGI 2001.2  	02/10/2002				**
//**  Jair Padilla / Soluziona PANAMA  	**
//**  TIPOS DE SERVICIOS SUMCON TIP_SERV  **
//******************************************


is_direccion = Message.PowerObjectParm

This.Enabled = True

SetPointer(HourGlass!)

// Si traigo datos desde la identificaci$$HEX1$$f300$$ENDHEX$$n de cliente
IF (Len(string(is_direccion.gl_nis)) = 7) THEN
	
	iu_gen_comunic.is_comunic = gu_comunic.is_comunic

	IF iu_gen_comunic.is_comunic.intval10 = 1 THEN
		ib_en_corte = True
		gnv_msg.f_mensaje("AR15","","",OK!)
	ELSEIF iu_gen_comunic.is_comunic.intval10 = 0 THEN
		ib_en_corte = False
	END IF

   parmstr6 = d_direccion.GetItemString(1,"calle") 
	Parent.TriggerEvent("ue_proc_sum")
	IF ib_bloqueado=TRUE THEN
		ib_bloqueado=FALSE
		Parent.TriggerEvent("ue_nuevo")
		RETURN
	END IF
	SetRedraw(False)
	
	// Compruebo si ha salido del evento por un error o si todo ha ido bien
	IF ib_retorno THEN
		// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
		st_doc.Hide()
		st_doc2.Hide()
		st_nis.Hide()
		st_nis2.Hide()
		st_ape.Hide()
		st_ape2.Hide()
		st_dir2.Hide()
		st_dir.Hide()
	END IF
	st_tel_cli_r2.Show()
	st_tel_cli_r.Hide()
	
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	IF fw_nis() = 0 Then
		Parent.TriggerEvent("ue_nuevo")
		Return
	End If
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	
	SetRedraw(True)
ELSE
	sle_telefono.Text = ""

	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(False)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
END IF
end event

type st_2 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 6912
integer y = 484
integer width = 1115
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Area:"
boolean focusrectangle = false
end type

type st_tel_cli_r2 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 306
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 128
long backcolor = 79741120
boolean enabled = false
string text = "Tel Nro.:"
boolean focusrectangle = false
end type

type st_doc2 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 7159
integer y = 700
integer width = 347
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 16777215
long backcolor = 553648127
string text = "ID Nro.:"
boolean focusrectangle = false
end type

event doubleclicked;int li_v_doc
string ls_doc

SetPointer(HourGlass!)

// Valido el Documento
d_cliente.AcceptText()

is_direccion.gs_doc = d_cliente.fpr_v_documento(d_cliente)
is_direccion.gs_tipo_doc = d_cliente.getItemString(1,"tip_doc")
is_direccion.gs_pais = d_cliente.getItemString(1,"co_pais")

if is_direccion.gs_doc = " " or isNull(is_direccion.gs_tipo_doc) or is_direccion.gs_tipo_doc = "" or isNull(is_direccion.gs_pais ) or is_direccion.gs_pais = "" then
	gnv_msg.f_mensaje("ER41","","",OK!)	
	return
end if

IF is_direccion.gs_doc <> " " THEN
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	fw_visible_enabled_nic(True)
	//***************************************
	//**  OSGI 2001.1  	15/06/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************

	// Abro ventana con lista de clientes con dicho documento
	OpenWithParm(w_1109_list_clientes_por_doc,is_direccion)
	IF parnum1 = 1 THEN
	
		is_direccion.gl_cod_cli = Message.DoubleParm

		// Cargo en la estructura el resto de los datos necesarios
		li_v_doc = d_cliente.fpr_c_estruc_dir_por_doc(is_direccion) 
		IF li_v_doc = 1 THEN
			
			IF gu_comunic.is_comunic.intval10 = 2 THEN
				gnv_msg.f_mensaje("AR22","","",OK!)
				ib_en_corte = true
			END IF
			//	Procedimiento Almacenado Datos_suministro ???
			
			parmstr6 = d_direccion.GetItemString(1,"calle")
			Parent.TriggerEvent("ue_proc_sum")	
			IF ib_bloqueado=TRUE THEN
				ib_bloqueado=FALSE
				Parent.TriggerEvent("ue_nuevo")
				RETURN
			END IF
			IF ib_retorno THEN
				// Oculto las etiquetas de identificaci$$HEX1$$f300$$ENDHEX$$n
				st_doc.Show()
				st_doc2.Hide()
				st_nis.Hide()
				st_nis2.Hide()
				st_ape.Hide()
				st_ape2.Hide()
				st_dir2.Hide()
				st_dir.Hide()
				
				//***************************************
				//**  OSGI 2001.1  	15/06/2001			**
				//**  Jair Padilla / Soluziona PANAMA  **
				//***************************************
				st_tel_cli_r2.Hide()
				st_tel_cli_r.Hide()
			END IF
			If fw_nis() = 0 Then
				Parent.TriggerEvent("ue_nuevo")
				Return
			End If
			//***************************************
			//**  OSGI 2001.1  	15/06/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		ELSEIF li_v_doc = 0 THEN
			gnv_msg.f_mensaje("AR04","","",OK!)
			fw_visible_enabled_nic(False)  //**  OSGI 2001.1  	15/06/2001
		END IF
	ELSEIF parnum1 = 0 THEN
		d_cliente.fpr_limpiar_campos()
		// GNU 25-4-2006. Mejora 1/327511
		d_cliente.setitem(1, "tip_doc", is_tip_doc )
		d_cliente.setitem(1, "co_pais", is_co_pais)
		// FIN GNU
		fw_visible_enabled_nic(False)  //**  OSGI 2001.1  	15/06/2001
   END IF

ELSEIF is_direccion.gl_nis = long("-1") THEN
	gnv_msg.f_mensaje("ER51","","",OK!)

	fw_visible_enabled_nic(False)  //**  OSGI 2001.1  	15/06/2001
END IF







end event

type st_doc from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 329
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean underline = true
long textcolor = 128
long backcolor = 81324524
boolean enabled = false
string text = "ID Nro.:"
boolean focusrectangle = false
end type

type d_cliente from u_cli_2001_pr_cliente_std within w_1201_recepcion_aviso
event ue_enter pbm_dwnkey
integer x = 41
integer y = 460
integer width = 2030
integer height = 480
integer taborder = 30
boolean border = false
end type

event ue_enter;///////////////////////////////////////////////////////////////////////
//
//	Event:	ue_enter
//
//	Objetivo: Introducir datos presionando <Enter> en lugar de hacer
//				 doubleclick
///////////////////////////////////////////////////////////////////////
long ll_row
int li_clase_Aviso
AcceptText()
li_clase_aviso = d_clase_avi.object.clase_avi[d_clase_avi.getRow()]

IF li_clase_aviso = fgci_ayuda OR li_clase_aviso = fgci_alumbrado_publico THEN
	return
END IF
IF KeyDown(KeyEnter!) THEN
	IF 	d_cliente.object.doc_id.background.color = gs_blanco then
		ll_row=RowCount()
		AcceptText()
			IF NOT IsNull(GetItemString(ll_row,"doc_id")) AND IsNull(GetItemString(ll_row,"ap1")) THEN
				st_doc2.TriggerEvent("doubleclicked")
			ELSE
				st_ape.TriggerEvent("doubleclicked")
			END IF
		END IF
		
END IF

end event

type st_area from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 6638
integer y = 588
integer width = 238
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 16777215
long backcolor = 553648127
string text = "Area:"
boolean focusrectangle = false
end type

event doubleclicked;string ls_municipio
ls_municipio = d_direccion.object.municipio[1]

if is_direccion.gl_codmun > 0 AND ls_municipio <> '' then
	
	iu_gen_comunic.is_comunic.longval1 = is_direccion.gl_codprov
	iu_gen_comunic.is_comunic.longval2 = is_direccion.gl_coddepto
	iu_gen_comunic.is_comunic.longval3 = is_direccion.gl_codmun
	iu_gen_comunic.is_comunic.intval1 = is_direccion.gi_nro_area
	iu_gen_comunic.is_comunic.strval5 = is_direccion.gs_area
	iu_gen_comunic.is_comunic.strval4 = is_direccion.gs_poblacion
	iu_gen_comunic.is_comunic.strval3 = is_direccion.gs_munic
	iu_gen_comunic.is_comunic.strval2 = is_direccion.gs_depto	
	iu_gen_comunic.is_comunic.strval1 = is_direccion.gs_prov	
	gu_comunic.is_comunic =iu_gen_comunic.is_comunic 
	
	open(w_id0107_areas)
	
	iu_gen_comunic.is_comunic = gu_comunic.is_comunic
	
	is_direccion.gi_nro_area = iu_gen_comunic.is_comunic.intval1
	is_direccion.gs_area = iu_gen_comunic.is_comunic.strval5
	is_direccion.gs_poblacion = iu_gen_comunic.is_comunic.strval4 

	if is_direccion.gs_area <> '' then
		sle_area.text = is_direccion.gs_area
		
		if fg_verifica_parametro('area_obligatoria') then
			//md_ing_avisos.f_habilitar("GRABAR",true)
			//sigeme
			md_ing_avisos.f_habilitar("GRABAR",false)
		end if
	end if

else
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Para seleccionar una poblaci$$HEX1$$f300$$ENDHEX$$n, debe tener seleccionado previamente una Provincia, Distrito y Corregimiento v$$HEX1$$e100$$ENDHEX$$lido.",information!,ok!)
end if



end event

type sle_area from singlelineedit within w_1201_recepcion_aviso
boolean visible = false
integer x = 6624
integer y = 792
integer width = 1399
integer height = 76
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
boolean autohscroll = false
textcase textcase = upper!
integer limit = 40
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type sle_esq_cond from multilineedit within w_1201_recepcion_aviso
integer x = 859
integer y = 1132
integer width = 2030
integer height = 300
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
integer limit = 60
end type

type st_medidor from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 288
integer height = 64
boolean bringtotop = true
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
string text = "Medidor:"
alignment alignment = center!
boolean focusrectangle = false
end type

event doubleclicked;long ll_nis_rad, ll_medidor

// GNU 5-6-2007. Incidencia Panam$$HEX1$$e100$$ENDHEX$$
// Cuento los NIS_RAD que hay.
// Si hay m$$HEX1$$e100$$ENDHEX$$s de uno muestro una ventana para seleccionar el NIS_RAD

SELECT COUNT(*)
INTO: ll_medidor
FROM APMEDIDA_AP
WHERE NUM_APA= :em_medidor.text;

IF ll_medidor=0 THEN
	MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se encuentra el medidor")
	return
ELSEIF ll_medidor=1 THEN
	SELECT nis_rad
	INTO :ll_nis_rad
	FROM APMEDIDA_AP
	WHERE NUM_APA= :em_medidor.text;
// GNU 18-4-2007. Incidencia Panam$$HEX1$$e100$$ENDHEX$$
//WHERE NIF_APA = :ll_medidor;
	IF SQLCA.sqlcode <> 0 THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se encuentra el medidor")
		return
	END IF
ELSE
	gu_comunic1.is_comunic.strval1= em_medidor.text
	// Abrir la ventana del medidor
	open(w_medidor_nis)
	ll_nis_rad=gu_comunic1.is_comunic.longval1
	IF ll_nis_rad=0 THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No se encuentra el medidor")
		return
	END IF
END IF 


d_nis_rad.SetItem(d_nis_rad.GetRow(), "nis_rad", ll_nis_rad)
fw_nic()

st_nis2.TriggerEvent("doubleclicked")
end event

type em_medidor from singlelineedit within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 352
integer height = 80
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8388608
borderstyle borderstyle = stylelowered!
end type

event modified;IF KeyDown(KeyEnter!) THEN
	IF 	d_nis_rad.object.nis_rad.background.color = gs_blanco then
		st_medidor.TriggerEvent("doubleclicked")
	END IF
END IF
end event

type p_2 from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 5093
integer y = 60
integer width = 110
integer height = 104
string picturename = ".\pict\er.bmp"
boolean focusrectangle = false
end type

type p_1 from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 5093
integer y = 228
integer width = 110
integer height = 104
string picturename = ".\pict\cortocircuito.bmp"
boolean focusrectangle = false
end type

type p_avi_peligro from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 5093
integer y = 60
integer width = 110
integer height = 104
string picturename = ".\pict\PELIGRO1.BMP"
boolean focusrectangle = false
end type

type p_esencial from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 4297
integer y = 228
integer width = 146
integer height = 148
boolean bringtotop = true
string picturename = ".\pict\hospital.gif"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_1201_recepcion_aviso
boolean visible = false
integer x = 8000
integer width = 736
integer height = 1124
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
borderstyle borderstyle = styleraised!
end type

type p_cli_imp from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 4297
integer y = 228
integer width = 110
integer height = 92
boolean bringtotop = true
string picturename = ".\pict\CLIIMP.BMP"
boolean focusrectangle = false
end type

type st_esencial from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 4489
integer y = 244
integer width = 430
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Carga Esencial"
boolean focusrectangle = false
end type

type st_cli_imp from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 4489
integer y = 244
integer width = 498
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Cliente Importante"
boolean focusrectangle = false
end type

type d_causa_ot24h from datawindow within w_1201_recepcion_aviso
integer x = 1353
integer y = 1596
integer width = 1015
integer height = 80
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "d_avi_causa_ot24h"
boolean minbox = true
boolean border = false
boolean livescroll = true
end type

type gb_3 from groupbox within w_1201_recepcion_aviso
integer y = 28
integer width = 658
integer height = 160
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
end type

type gb_4 from groupbox within w_1201_recepcion_aviso
integer y = 188
integer width = 1161
integer height = 160
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
end type

type gb_5 from groupbox within w_1201_recepcion_aviso
integer x = 2094
integer y = 404
integer width = 2080
integer height = 560
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 79741120
string text = "DIRECCI$$HEX1$$d300$$ENDHEX$$N DEL SUMINISTRO"
borderstyle borderstyle = styleraised!
end type

type gb_7 from groupbox within w_1201_recepcion_aviso
integer y = 404
integer width = 2098
integer height = 560
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 81324524
string text = "INFORMACION DEL SUMINISTRO"
borderstyle borderstyle = styleraised!
end type

type gb_8 from groupbox within w_1201_recepcion_aviso
integer y = 992
integer width = 4800
integer height = 940
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 67108864
string text = "INFORMACI$$HEX1$$d300$$ENDHEX$$N DE AVISO"
end type

type st_incid_rs from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 4471
integer y = 60
integer width = 553
integer height = 132
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Incidencia Resuelta Actualmente"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_sin_alim from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 4512
integer y = 88
integer width = 471
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "Sin Alimentaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type st_7 from statictext within w_1201_recepcion_aviso
integer x = 859
integer y = 1444
integer width = 1001
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 128
boolean enabled = false
string text = "Tel Nro.:"
boolean focusrectangle = false
end type

type st_6 from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 859
integer y = 1444
integer width = 402
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 553648127
string text = "Tel Nro.:"
boolean focusrectangle = false
end type

type st_nro_aviso from statictext within w_1201_recepcion_aviso
integer x = 1312
integer y = 188
integer width = 786
integer height = 144
boolean bringtotop = true
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
alignment alignment = center!
boolean focusrectangle = false
end type

type st_nro_inc from statictext within w_1201_recepcion_aviso
integer x = 2144
integer y = 188
integer width = 800
integer height = 144
boolean bringtotop = true
integer textsize = -26
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
alignment alignment = center!
boolean focusrectangle = false
end type

event clicked;st_params st_parametros

st_parametros.l_nro_aviso = double(st_nro_aviso.Text)

if st_parametros.l_nro_aviso > 0 then
//	OpenWithParm(w_consulta_incidencia, double(st_nro_inc.Text))
//	OpenSheet (w_1201_recepcion_aviso, w_genapp_frame, menu, layered!)
	OpenSheetWithParm (w_consulta_incidencia,st_parametros, w_genapp_frame, menu, layered!)
end if
end event

type st_8 from statictext within w_1201_recepcion_aviso
integer x = 859
integer y = 1592
integer width = 494
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 128
string text = "Causa OT24H: "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_error from statictext within w_1201_recepcion_aviso
boolean visible = false
integer y = 1940
integer width = 82
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "X"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_kawoq from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 3017
integer y = 76
integer width = 146
integer height = 128
boolean bringtotop = true
string pointer = "MANOOK.CUR"
string picturename = ".\recursos\kawoq1.png"
boolean focusrectangle = false
end type

type st_kawoq from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 3200
integer y = 100
integer width = 261
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Kawoq"
boolean focusrectangle = false
end type

type p_corte from picture within w_1201_recepcion_aviso
boolean visible = false
integer x = 3017
integer y = 232
integer width = 146
integer height = 128
boolean bringtotop = true
string pointer = "MANOOK.CUR"
string picturename = ".\pict\sumCorte.bmp"
boolean focusrectangle = false
end type

type st_corte from statictext within w_1201_recepcion_aviso
boolean visible = false
integer x = 3168
integer y = 232
integer width = 434
integer height = 124
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Corte en Media Tensi$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_1201_recepcion_aviso
integer x = 2126
integer y = 96
integer width = 841
integer height = 292
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
string text = "Numero de Incidencia"
borderstyle borderstyle = styleraised!
end type

type gb_10 from groupbox within w_1201_recepcion_aviso
integer x = 1285
integer y = 96
integer width = 841
integer height = 292
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
string text = "Numero Aviso"
borderstyle borderstyle = styleraised!
end type

type gb_6 from groupbox within w_1201_recepcion_aviso
integer x = 2967
integer width = 2898
integer height = 388
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 81324524
string text = "ALARMAS"
borderstyle borderstyle = styleraised!
end type


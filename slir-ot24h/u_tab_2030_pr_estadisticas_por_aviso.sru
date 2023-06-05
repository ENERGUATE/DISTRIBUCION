HA$PBExportHeader$u_tab_2030_pr_estadisticas_por_aviso.sru
forward
global type u_tab_2030_pr_estadisticas_por_aviso from tab
end type
type int_horario from userobject within u_tab_2030_pr_estadisticas_por_aviso
end type
type cb_imprimir from commandbutton within int_horario
end type
type cbx_centro_cmd from checkbox within int_horario
end type
type st_centro from statictext within int_horario
end type
type cbx_3 from checkbox within int_horario
end type
type dw_usuario from datawindow within int_horario
end type
type cbx_1 from checkbox within int_horario
end type
type dw_tipo from datawindow within int_horario
end type
type pb_2 from picturebutton within int_horario
end type
type st_1 from statictext within int_horario
end type
type em_fecha from editmask within int_horario
end type
type st_5 from statictext within int_horario
end type
type p_avanza from picturebutton within int_horario
end type
type p_retrocede from picturebutton within int_horario
end type
type st_4 from statictext within int_horario
end type
type cb_buscar from u_cb within int_horario
end type
type r_4 from rectangle within int_horario
end type
type u_amb from u_2030_ambito_estadisticas within int_horario
end type
type dw_1 from datawindow within int_horario
end type
type dw_2 from datawindow within int_horario
end type
type pb_1 from picturebutton within int_horario
end type
type gb_2 from groupbox within int_horario
end type
type gr_1 from datawindow within int_horario
end type
type dw_esta_avisos from u_avi_2031_pr_esta_avisos within int_horario
end type
type int_horario from userobject within u_tab_2030_pr_estadisticas_por_aviso
cb_imprimir cb_imprimir
cbx_centro_cmd cbx_centro_cmd
st_centro st_centro
cbx_3 cbx_3
dw_usuario dw_usuario
cbx_1 cbx_1
dw_tipo dw_tipo
pb_2 pb_2
st_1 st_1
em_fecha em_fecha
st_5 st_5
p_avanza p_avanza
p_retrocede p_retrocede
st_4 st_4
cb_buscar cb_buscar
r_4 r_4
u_amb u_amb
dw_1 dw_1
dw_2 dw_2
pb_1 pb_1
gb_2 gb_2
gr_1 gr_1
dw_esta_avisos dw_esta_avisos
end type
type avisos_pendientes from userobject within u_tab_2030_pr_estadisticas_por_aviso
end type
type cb_imprimir2 from commandbutton within avisos_pendientes
end type
type cbx_centro_cmd_pend from checkbox within avisos_pendientes
end type
type st_centro_dur from statictext within avisos_pendientes
end type
type u_amb_dur from u_2030_ambito_estadisticas within avisos_pendientes
end type
type cbx_4 from checkbox within avisos_pendientes
end type
type dw_usuario_dur from datawindow within avisos_pendientes
end type
type cbx_2 from checkbox within avisos_pendientes
end type
type pb_5 from picturebutton within avisos_pendientes
end type
type pb_3 from picturebutton within avisos_pendientes
end type
type cb_buscar2 from u_cb within avisos_pendientes
end type
type dw_tipo_pend from datawindow within avisos_pendientes
end type
type st_2 from statictext within avisos_pendientes
end type
type p_avanzar from picturebutton within avisos_pendientes
end type
type p_retroceder from picturebutton within avisos_pendientes
end type
type st_3 from statictext within avisos_pendientes
end type
type gb_1 from groupbox within avisos_pendientes
end type
type dw_3 from datawindow within avisos_pendientes
end type
type gr_2 from datawindow within avisos_pendientes
end type
type dw_avisos_pendientes from u_avi_2032_pr_esta_avisos_pend within avisos_pendientes
end type
type dw_4 from datawindow within avisos_pendientes
end type
type avisos_pendientes from userobject within u_tab_2030_pr_estadisticas_por_aviso
cb_imprimir2 cb_imprimir2
cbx_centro_cmd_pend cbx_centro_cmd_pend
st_centro_dur st_centro_dur
u_amb_dur u_amb_dur
cbx_4 cbx_4
dw_usuario_dur dw_usuario_dur
cbx_2 cbx_2
pb_5 pb_5
pb_3 pb_3
cb_buscar2 cb_buscar2
dw_tipo_pend dw_tipo_pend
st_2 st_2
p_avanzar p_avanzar
p_retroceder p_retroceder
st_3 st_3
gb_1 gb_1
dw_3 dw_3
gr_2 gr_2
dw_avisos_pendientes dw_avisos_pendientes
dw_4 dw_4
end type
end forward

global type u_tab_2030_pr_estadisticas_por_aviso from tab
integer width = 3465
integer height = 1760
integer taborder = 1
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
integer selectedtab = 1
int_horario int_horario
avisos_pendientes avisos_pendientes
end type
global u_tab_2030_pr_estadisticas_por_aviso u_tab_2030_pr_estadisticas_por_aviso

type variables
u_avi_2031_pr_esta_avisos iu_avi_2031_pr
u_gen_nu_gra_0001 iu_gen_gra_nu
Date id_fec_ant
Int in_fila_ant
Int in_nro_nivel=0
Int in_padre1_AVIS_PEND
Int in_padre2_AVIS_PEND
Int in_padre3_AVIS_PEND
Int in_padre1
Int in_padre2
Int in_padre3
Int in_open
Int vector[14]
Int vectory[15]
int vectorp[19]
Int vectoryp[17]

Int in_prim_vez
int in_prim_vez_AVIS_PEND
Int in_fila_ant_AVIS_PEND
int in_nro_nivel_AVIS_PEND
boolean ib_zoom
long il_nro_centro
long il_nro_cmd
long il_nro_mesa
long il_nro_centro_dur
long il_nro_cmd_dur
long il_nro_mesa_dur
// tab int_horario

boolean ib_cb_buscar
boolean ib_p_avanza
boolean ib_p_retrocede
boolean ib_cbx_3
boolean ib_pb_1
boolean ib_pb_2
boolean ib_em_fecha
boolean ib_ambito_abierto
boolean ib_cambio_tab=false
boolean ib_cbx_1
boolean ib_dw_usuario
string is_color_dw_usuario
// tab pendientes

boolean ib_cb_buscar_dur
boolean ib_p_avanza_dur
boolean ib_p_retrocede_dur
boolean ib_cbx_4_dur
boolean ib_pb_3_dur
boolean ib_pb_5_dur
boolean ib_ambito_abierto_dur
boolean ib_cambio_tab_dur=false
boolean ib_cbx_2
boolean ib_dw_usuario_dur
string is_color_dw_usuario_dur

string is_usuario
datetime idt_fecha1

long il_clase_aviso //DBE 21/01/2000
long il_todos_ambitos //DBE 21/01/2000

string is_cmd_text  //**  OSGI 2001.1  	04/05/2001
end variables

forward prototypes
public function integer f_habilito_campos (integer n_nro_nivel)
public function string f_nombre_nivel (integer pn_nro_nivel)
public function boolean fnu_cambio_la_fecha ()
public function integer f_graficar (integer x1, integer x2, integer y1, integer y2)
public function long fnu_total (string ps_tipo_suma)
public function integer f_realizar_bdg ()
public subroutine f_datos_prueba (datetime pd_fecha)
public subroutine f_actualizo (integer pn_nombre, datetime pd_fecha, integer pn_tipo)
public function string f_nombre_nivel_pend (long pn_nro_nivel)
public subroutine fnu_datos_prueba_pend ()
public function integer f_habilito_campos_pend (integer pn_nro_nivel)
public function integer f_graficar_pend (integer x1, integer x2, integer y1, integer y2)
public function integer fnu_calcula_estadistica_av_int_hor (datetime pd_fecha, integer pi_tipo_centro, integer pi_nro_centro)
public function integer fnu_calcula_estadistica_av_por_dur (datetime pd_fecha, integer pi_tipo_centro, integer pi_nro_centro)
public subroutine fnu_busco_centro_cmd_puesto (ref integer pi_centros_hijos[], ref integer pi_contador, integer pi_tipo_centro, ref integer pi_array_tipos[], integer pi_tipo_centro_padre)
end prototypes

public function integer f_habilito_campos (integer n_nro_nivel);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_habilito_campos
// 
// Objetivo: Habilita y Deshabilita los campos de avanzar y retroceder.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: n_nro_nivel
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




CHOOSE CASE n_nro_nivel
	case 1
		int_horario.p_retrocede.enabled = False
		int_horario.p_avanza.enabled = TRUE

	case 2
		int_horario.p_retrocede.enabled = True
		int_horario.p_avanza.enabled = FALSE

	case 0
		int_horario.p_retrocede.enabled = False
		int_horario.p_avanza.enabled = FALSE
END CHOOSE
return 1
end function

public function string f_nombre_nivel (integer pn_nro_nivel);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_nombre_nivel
// 
// Objetivo: 
//	 		
//       
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pn_nro_nivel
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

CHOOSE CASE pn_nro_nivel
	CASE 1
		
		if int_horario.cbx_centro_cmd.checked = false then
			int_horario.dw_esta_avisos.modify("nombre.Visible = true")
			int_horario.dw_esta_avisos.modify("cmd.Visible = false")
			int_horario.dw_esta_avisos.modify("sector.Visible = false")
		else
			//***************************************
			//**  OSGI 2001.1  	04/05/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	04/05/2001  			int_horario.dw_esta_avisos.modify("nombre.text=~"Hr / CMD~"")

			int_horario.dw_esta_avisos.modify("cmd.text=~"Hr / " + is_cmd_text + "~"")
			int_horario.dw_esta_avisos.modify("nombre.Visible = false")
			int_horario.dw_esta_avisos.modify("sector.Visible = false")
			int_horario.dw_esta_avisos.modify("cmd.Visible = true")

			//***************************************
			//**  OSGI 2001.1  	04/05/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		end if
		
		RETURN "1"
	CASE 2
		int_horario.dw_esta_avisos.modify("sector.Visible = true")
		int_horario.dw_esta_avisos.modify("nombre.Visible = false")
		int_horario.dw_esta_avisos.modify("cmd.Visible = false")


		RETURN "1"
END CHOOSE
	
end function

public function boolean fnu_cambio_la_fecha ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  fnu_cambio_la_fecha
// 
/////////////////////////////////////////////////////////////////////
IF id_fec_ant <> Date(int_horario.em_fecha.text) THEN
	id_fec_ant = Date(int_horario.em_fecha.text)
	Return True
END IF
RETURN False
end function

public function integer f_graficar (integer x1, integer x2, integer y1, integer y2);////////////////////////////////////////////////////////////
////
//// Funci$$HEX1$$f300$$ENDHEX$$n: f_graficar
////
//// Objetivo: Crea grafica de barras asociada a los datos de la dw.
////
//// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
////
//// Par$$HEX1$$e100$$ENDHEX$$metros:
////			Entrada: 
////			Salida: 
////
//// Devuelve:
//// 
//// Fecha		   Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
//// -------		-----------		----------------
//// 11/5/96        AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
/////////////////////////////////////////////////////////////
//
////int vector[13]
//int i_columna
//int i_fila
//int posicion
//posicion=1
//for i_columna=1 to 13
//	vector[posicion]=i_columna
//	posicion=(posicion+1)
//next
//for i_fila=1 to int_horario.dw_esta_avisos.rowcount() 
//	vectory[i_fila]=i_fila
//next
//vectory[int_horario.dw_esta_avisos.rowcount()+1]=0
//vector[14]=0
//int_horario.dw_esta_avisos.setredraw(True)
//iu_gen_gra_nu = CREATE u_gen_nu_gra_0001
////THIS.SETREDRAW(FALSE)
//iu_gen_gra_nu.fnu_gra_titulo(int_horario.gr_1,"Avisos Por Intervalo Horario")
////iu_gen_gra_nu.fnu_gra_
//iu_gen_gra_nu.fnu_gra_cargo_datos(int_horario.gr_1,int_horario.dw_esta_avisos,1,TRUE,vector[],vectory[])
//iu_gen_gra_nu.fnu_titulo_x(int_horario.gr_1,right(int_horario.dw_esta_avisos.describe("nombre.text"),len(int_horario.dw_esta_avisos.describe("nombre.text"))-4))
//iu_gen_gra_nu.fnu_gra_titulo_y(int_horario.gr_1,"Num$$HEX1$$e900$$ENDHEX$$ro de Avisos")
//
////THIS.SETREDRAW(TRUE)
//destroy iu_gen_gra_nu
RETURN 1
end function

public function long fnu_total (string ps_tipo_suma);INT XX  // ESTA FUNCION SE DEBE PONER EN LOS CHECKBOX	//ANG
If ps_TIPO_suma="T" THEN   // SI ES SUMA TOTAL   //PARA QUE SUME TODOS
	FOR XX=1 TO int_horario.dw_esta_avisos.rowcount()
		int_horario.dw_esta_avisos.setitem(XX,"int2",1)
	Next
ELSE    // SI ES PARCIAL     // A MEDIDA QUE VOY CLIQUEANDO VOY PONIENDO LA COLUMNA EN 1 O EN 0
	FOR XX=1 TO int_horario.dw_esta_avisos.rowcount()
		int_horario.dw_esta_avisos.setitem(XX,"int2",0)
	Next
END IF
return 1
end function

public function integer f_realizar_bdg ();//Long l_Vec_Inc[3]    // vector de tipos de incidencias 

RETURN 1
end function

public subroutine f_datos_prueba (datetime pd_fecha);//--------------------------------------------------------------------------------
//----------------------------------------------------------------
//---
//--- Funci$$HEX1$$f300$$ENDHEX$$n fnu_obtengo_datos_2031
//---
//--- Objetivo Obtiene todos los avisos de un dia
//---                             y llama a la funcion actualizo_centro para que
//---                             los grabe en la tabla est_avisos
//--- Ambito      P$$HEX1$$fa00$$ENDHEX$$blico
//---
//--- Par$$HEX1$$e100$$ENDHEX$$metros pd_fecha_avisos (d$$HEX1$$ed00$$ENDHEX$$a para el que se quiere la estadistica)
//---     Entrada
//---     Salida
//---
//--- Devuelve
//---
//---  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//--- ---------      -------     ----------------------------------------
//---  11/5/96         AAB          Versi$$HEX1$$f300$$ENDHEX$$n Original
//---
//----------------------------------------------------------------
//----------------------------------------------------------------

 datetime ld_alta 
 datetime lh_alta 
 date d_fecha_aux
 string lsNomUsu_Est 
 integer ln_Nro_Centro 
 integer ln_Nro_Cmd 
 integer ln_Nro_Mesa 
 integer l_fin_cursor 
 datetime ld_fecha_avisos 
 string ls_fecha
 long ll_nro=00000000,ll_nro2=99999999
 ls_fecha=string(date(pd_fecha))
/////
if isvalid(int_horario.dw_tipo) then
	int_horario.dw_tipo.accepttext()
	choose case int_horario.dw_tipo.getitemnumber(1,1)
		case 0
			ll_nro=00000000
			ll_nro2=fgcdec_aviso_con_alimentacion
		case 1
			ll_nro=00000000
			ll_nro2=66666665
		case 2
			ll_nro=88888888
			ll_nro2=88888888
		case 3
			ll_nro=77777777
			ll_nro2=77777777
		case 4
			ll_nro=66666666
			ll_nro2=66666666
	end choose
end if
	if il_nro_centro >0 then
		if il_nro_cmd >0 then
			if il_nro_mesa >0 then
				declare lc_cur_est_1 CURSOR  for
			     (SELECT gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA
      			FROM gi_AVISOS 
					WHERE trunc(gi_AVISOS.F_ALTA) = to_date(:ls_fecha,'DD/MM/YYYY')
					and (GI_AVISOS.NRO_CENTRO=:il_nro_centro) 
					and (GI_AVISOS.NRO_CMD=:il_nro_cmd) 
					and (GI_AVISOS.NRO_MESA=:il_nro_mesa)
       			and gi_avisos.nro_instalacion between :ll_nro and :ll_nro2
       			GROUP BY gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA,gi_avisos.nro_aviso)
					using sqlca;
			elseif il_nro_mesa=0 then
					declare lc_cur_est_2 CURSOR for
			      (SELECT gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA
      			FROM gi_AVISOS WHERE trunc(gi_AVISOS.F_ALTA) = to_date(:ls_fecha,'DD/MM/YYYY') and GI_AVISOS.NRO_CENTRO=:il_nro_centro 
					and GI_AVISOS.NRO_CMD=:il_nro_cmd and (gi_avisos.nro_instalacion between :ll_nro and :ll_nro2)
       			GROUP BY gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA,gi_avisos.nro_aviso)
					using sqlca;
			end if
		elseif il_nro_cmd=0 then
			declare lc_cur_est_3 CURSOR  for
			     (SELECT gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA
      			FROM gi_AVISOS WHERE trunc(gi_AVISOS.F_ALTA) = to_date(:ls_fecha,'DD/MM/YYYY') and GI_AVISOS.NRO_CENTRO=:il_nro_centro 
					AND gi_avisos.nro_instalacion between :ll_nro and :ll_nro2
       			GROUP BY gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA,gi_avisos.nro_aviso)
			using sqlca;			
		end if
	elseif il_nro_centro=0 then
		declare lc_cur_est_4 CURSOR  for
       (SELECT gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA
       FROM gi_AVISOS WHERE trunc(gi_AVISOS.F_ALTA) = to_date(:ls_fecha,'DD/MM/YYYY')
       AND (gi_avisos.nro_instalacion between :ll_nro and :ll_nro2)
       GROUP BY gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA,gi_avisos.nro_aviso)
		using sqlca;
	end if
	/////
  ld_fecha_avisos= fgnu_fecha_actual()
  d_fecha_aux = date(pd_fecha)

//--- Elimina los posibles registros de la tabla auxiliar de estadisticas de
//--- avisos que tengan el mismo usuario con el que estoy trabajando

  Delete from gi_est_Aviso where usuario_est =:gs_usuario and tipo_de_consulta=1;
if il_nro_centro >0 then
	if il_nro_cmd >0 then
		if il_nro_mesa >0 then
			OPEN lc_cur_est_1;
  			FETCH lc_cur_est_1 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
		elseif il_nro_mesa=0 then
			OPEN lc_cur_est_2;
  			FETCH lc_cur_est_2 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
		end if	  
	elseif il_nro_cmd=0 then
		OPEN lc_cur_est_3;
  		FETCH lc_cur_est_3 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
	END IF
elseif il_nro_centro=0 then
		OPEN lc_cur_est_4;
  		FETCH lc_cur_est_4 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
end if
//  WHILE lc_cur_est%FOUND LOOP
 DO WHILE sqlca.sqlcode=0 
     f_Actualizo(ln_nro_centro,lh_alta,1)
     f_Actualizo(ln_nro_cmd,lh_alta,1)
     f_Actualizo(ln_nro_mesa,lh_alta,1)
	  if il_nro_centro >0 then
			if il_nro_cmd >0 then
				if il_nro_mesa >0 then
					FETCH lc_cur_est_1 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
				elseif il_nro_mesa=0 then
					FETCH lc_cur_est_2 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
				end if	  
			elseif il_nro_cmd=0 then
				FETCH lc_cur_est_3 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
			END IF
		elseif il_nro_centro=0 then
			FETCH lc_cur_est_4 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta;
		end if
 LOOP // WHILE sqlca.sqlcode=0 // Ale
 
  	  if il_nro_centro >0 then
			if il_nro_cmd >0 then
				if il_nro_mesa >0 then
					 CLOSE lc_cur_est_1;
				elseif il_nro_mesa=0 then
					 CLOSE lc_cur_est_2;
				end if	  
			elseif il_nro_cmd=0 then
				 CLOSE lc_cur_est_3;
			END IF
		elseif il_nro_centro=0 then
			 CLOSE lc_cur_est_4;
		end if
  //COMMIT 	
  gnu_u_transaction.uf_commit(THIS)
end subroutine

public subroutine f_actualizo (integer pn_nombre, datetime pd_fecha, integer pn_tipo);/////////////////////////////////////////////////////////////////////////////
//---
//--- Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizo_centro_2031
//---
//--- Objetivo: Carga en la tabla est_avisos, la informaci$$HEX1$$f300$$ENDHEX$$n necesaria
//---                             para poder realizar la consulta de estadisticas
//											 de aviso.
//---                             Carga la tabla en el intervalo correspondiente,
//											 seg$$HEX1$$fa00$$ENDHEX$$n la
//---                             Hora en que fue el aviso
//--- Ambito:     P$$HEX1$$fa00$$ENDHEX$$blico
//---
//--- Par$$HEX1$$e100$$ENDHEX$$metros: pn_nro_centro  (n$$HEX1$$fa00$$ENDHEX$$mero de centro,de cmd, o de puesto)
//---             pd_hora_aviso  (hora en que fue realizado
//---										 el aviso)
//---     Entrada:
//---     Salida:
//---
//--- Devuelve:
//---
//---  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//--- ---------   -------         ----------------------------------------
//---     11/5/96         AAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//---
//---/////////////////////////////////////////////////////////////////////////////

date ld_fecha
int   ln_nro_centro 
int   nTip_Reg 
int   ln_hora 
int   ln_Int1 
int   ln_Int2 
int   ln_Int3 
int   ln_Int4 
int   ln_Int5 
int   ln_Int6 
int   ln_Int7 
int   ln_Int8 
int   ln_Int9 
int   ln_Int10
int   ln_Int11
int   ln_Int12
int   ln_Int_Tot
declare est_aviso_cur CURSOR for
  SELECT NRO_CENTRO,INT1,INT2,INT3,INT4,INT5,INT6,INT7,INT8,INT9,INT10,INT11,
         INT12,TOT_INT
  FROM gi_EST_AVISO
  WHERE gi_EST_AVISO.NRO_CENTRO = :pn_nombre
    AND gi_EST_AVISO.USUARIO_EST = :gs_usuario
	 and tipo_de_consulta=1;



  ln_int1 = 0 
  ln_int2 = 0 
  ln_int3 = 0 
  ln_int4 = 0 
  ln_int5 = 0 
  ln_int6 = 0
  ln_int7 = 0 
  ln_int8 = 0 
  ln_int9 = 0 
  ln_int10= 0 
  ln_int11 = 0 
  ln_int12 = 0 
  ln_int_tot = 0
  ln_hora = hour(time(pd_fecha))
  ld_fecha = date(fgnu_fecha_actual())
  nTip_Reg = 1

  OPEN est_aviso_cur;
  FETCH est_aviso_cur
  INTO :ln_nro_centro, :ln_int1, :ln_int2, :ln_int3, :ln_int4, :ln_int5, :ln_int6,
       :ln_int7, :ln_int8, :ln_int9, :ln_int10, :ln_int11, :ln_int12, :ln_Int_tot;
  IF ln_hora>=0 AND ln_hora<=1 THEN
     ln_int1 = ln_int1 + 1
  END IF
  IF ln_hora>=2 AND ln_hora<=3 THEN
     ln_int2 = ln_int2 + 1
  END IF
  IF ln_hora>=4 AND ln_hora<=5 THEN
     ln_int3 = ln_int3 + 1
  END IF
  IF ln_hora>=6 AND ln_hora<=7 THEN
     ln_int4 = ln_int4 + 1
  END IF
  IF ln_hora>=8 AND ln_hora<=9 THEN
     ln_int5 = ln_int5 + 1
  END IF
  IF ln_hora>=10 AND ln_hora<=11 THEN
     ln_int6 = ln_int6 + 1
  END IF
  IF ln_hora>=12 AND ln_hora<=13 THEN
     ln_int7 = ln_int7 + 1
  END IF
  IF ln_hora>=14 AND ln_hora<=15 THEN
     ln_int8 = ln_int8 + 1
  END IF
  IF ln_hora>=16 AND ln_hora<=17 THEN
     ln_int9 = ln_int9 + 1
  END IF
  IF ln_hora>=18 AND ln_hora<=19 THEN
     ln_int10 = ln_int10 + 1
  END IF
  IF ln_hora>=20 AND ln_hora<=21 THEN
     ln_int11 = ln_int11+ 1
  END IF
  IF ln_hora>=22 AND ln_hora<=23 THEN
     ln_int12 = ln_int12 + 1
  END IF
  ln_int_tot = ln_int_tot + 1
  IF sqlca.sqlcode=0 THEN
     UPDATE gi_EST_AVISO SET INT1= :ln_Int1,INT2=:ln_int2,INT3= :ln_int3,
         INT4= :ln_Int4,INT5=:ln_int5,INT6= :ln_int6,
         INT7= :ln_Int7,INT8=:ln_int8,INT9= :ln_int9,
         INT10= :ln_Int10,INT11=:ln_int11,INT12= :ln_int12,TOT_INT=:ln_Int_tot,
         F_ACTUAL=:ld_fecha,USUARIO = :gs_usuario,USUARIO_EST = :gs_usuario
     WHERE NRO_CENTRO= :pn_nombre AND USUARIO_EST =:gs_usuario and tipo_de_consulta=1;
  ELSE
    INSERT INTO gi_EST_AVISO (NRO_CENTRO,INT1,INT2,INT3,INT4,INT5,INT6,INT7,INT8,
           INT9,INT10,INT11,INT12,TOT_INT,USUARIO_EST,F_ACTUAL,USUARIO,TIPO_REG,Tipo_de_consulta)
    VALUES(:pn_nombre, :ln_int1,:ln_int2,:ln_int3,:ln_int4,:ln_int5,:ln_int6,
           :ln_int7,:ln_int8,:ln_int9,:ln_int10,:ln_int11,:ln_int12,:ln_int_tot,
           :gs_usuario,:ld_fecha,:gs_usuario,:nTip_Reg,1);
  END IF

close est_aviso_cur;  // Ale
end subroutine

public function string f_nombre_nivel_pend (long pn_nro_nivel);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_nombre_nivel_pend
// 
// Objetivo: Modica el texto recibido de estadisticas de avisos.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pn_nro_nivel
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////


CHOOSE CASE pn_nro_nivel
	CASE 1
		
		if avisos_pendientes.cbx_centro_cmd_pend.checked = false then
			avisos_pendientes.dw_avisos_pendientes.modify("nombre.text=~"Hr / Zona~"")
		else
			//***************************************
			//**  OSGI 2001.1  	04/05/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
			//**  OSGI 2001.1  	04/05/2001  			avisos_pendientes.dw_avisos_pendientes.modify("nombre.text=~"Hr / CMD~"")

			avisos_pendientes.dw_avisos_pendientes.modify("nombre.text=~"Hr / " + is_cmd_text + "~"")
			//***************************************
			//**  OSGI 2001.1  	04/05/2001			**
			//**  Jair Padilla / Soluziona PANAMA  **
			//***************************************
		end if
		
		RETURN "1"
	CASE 2
		avisos_pendientes.dw_avisos_pendientes.modify("nombre.text=~"Hr / Sector~"")
		RETURN "1"
END CHOOSE
	
end function

public subroutine fnu_datos_prueba_pend ();////--------------------------------------------------------------------------------
//----------------------------------------------------------------
//---
//--- Funci$$HEX1$$f300$$ENDHEX$$n fnu_obtengo_datos_2031
//---
//--- Objetivo Obtiene todos los avisos de un dia
//---                             y llama a la funcion actualizo_centro para que
//---                             los grabe en la tabla est_avisos
//--- Ambito      P$$HEX1$$fa00$$ENDHEX$$blico
//---
//--- Par$$HEX1$$e100$$ENDHEX$$metros pd_fecha_avisos (d$$HEX1$$ed00$$ENDHEX$$a para el que se quiere la estadistica)
//---     Entrada
//---     Salida
//---
//--- Devuelve
//---
//---  Fecha        Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
//--- ---------      -------     ----------------------------------------
//---  11/5/96         AAB          Versi$$HEX1$$f300$$ENDHEX$$n Original
//---
//----------------------------------------------------------------
//----------------------------------------------------------------

 datetime ld_alta 
 datetime lh_alta 
 date d_fecha_aux
 string lsNomUsu_Est 
 integer ln_Nro_Centro 
 integer ln_Nro_Cmd 
 integer ln_Nro_Mesa 
 datetime ld_fechares
 integer l_fin_cursor 
 datetime ld_fecha_avisos 
 long ll_nro=00000000,ll_nro2=99999999
/////
if isvalid(avisos_pendientes.dw_tipo_pend) then
	avisos_pendientes.dw_tipo_pend.accepttext()
	choose case avisos_pendientes.dw_tipo_pend.getitemnumber(1,1)
		case 0
			ll_nro=00000000
			ll_nro2=99999999
		case 1
			ll_nro=00000000
			ll_nro=66666665
		case 2
			ll_nro=88888888
			ll_nro2=88888888
		case 3
			ll_nro=77777777
			ll_nro2=77777777
		case 4
			ll_nro=66666666
			ll_nro2=66666666
	end choose
end if
	declare lc_cur_est_1 CURSOR  for
		(SELECT gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA,gi_avisos.fecha_res
      FROM gi_AVISOS WHERE gi_avisos.est_aviso<>5 and
		gi_avisos.nro_instalacion between :ll_nro and :ll_nro2 
      GROUP BY gi_AVISOS.NRO_CENTRO,gi_AVISOS.NRO_CMD,gi_AVISOS.NRO_MESA,gi_AVISOS.F_ALTA,gi_avisos.fecha_res)
	using sqlca;

  ld_fecha_avisos= fgnu_fecha_actual()
  d_fecha_aux = date(ld_fecha_avisos)

//--- Elimina los posibles registros de la tabla auxiliar de estadisticas de
//--- avisos que tengan el mismo usuario con el que estoy trabajando

  Delete from gi_est_Aviso where usuario_est =:gs_usuario;
			OPEN lc_cur_est_1;
  			FETCH lc_cur_est_1 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta,:ld_fechares;

//  WHILE lc_cur_est%FOUND LOOP
 DO WHILE sqlca.sqlcode=0 

DECLARE ACTC2032 PROCEDURE FOR ACTUALIZO_CENTRO_2032(:ln_nro_centro,:lh_alta,:ld_fecha_avisos,:gs_usuario);
EXECUTE ACTC2032;
DECLARE ACTC20321 PROCEDURE FOR ACTUALIZO_CENTRO_2032(:ln_nro_cmd,:lh_alta,:ld_fecha_avisos,:gs_usuario);
EXECUTE ACTC20321;
DECLARE ACTC20322 PROCEDURE FOR ACTUALIZO_CENTRO_2032(:ln_nro_mesa,:lh_alta,:ld_fecha_avisos,:gs_usuario);
EXECUTE ACTC20322;

FETCH lc_cur_est_1 INTO :ln_Nro_centro, :ln_Nro_Cmd, :ln_Nro_mesa, :lh_alta,:ld_fechares;
 LOOP // WHILE sqlca.sqlcode=0 // Ale
 
 CLOSE lc_cur_est_1;
 //Commit;
 gnu_u_transaction.uf_commit(THIS)
end subroutine

public function integer f_habilito_campos_pend (integer pn_nro_nivel);/////////////////////////////////////////////////////////////////////
//
// Funcion:  f_habilito_campos
// 
// Objetivo: Habilita y Deshabilita los campos de avanzar y retroceder.
//	 		
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: n_nro_nivel
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////




CHOOSE CASE Pn_nro_nivel
	case 1
		avisos_pendientes.p_retroceder.enabled = False
		avisos_pendientes.p_avanzar.enabled = TRUE

	case 2
		avisos_pendientes.p_retroceder.enabled = True
		avisos_pendientes.p_avanzar.enabled = false

	case 0
		avisos_pendientes.p_retroceder.enabled = False
		avisos_pendientes.p_avanzar.enabled = False
END CHOOSE
return 1
end function

public function integer f_graficar_pend (integer x1, integer x2, integer y1, integer y2);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_graficar
//
// Objetivo: Crea grafica de barras asociada a los datos de la dw.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: 
//			Salida: 
//
// Devuelve:
// 
// Fecha		   Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -------		-----------		----------------
// 11/5/96        AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
///////////////////////////////////////////////////////////

//int vector[13]
//setpointer(hourglass!)
//int i_columna
//int i_fila
//int posicion
//posicion=1
//avisos_pendientes.setredraw(false)
//for i_columna=1 to 13
//	vectorp[posicion]=i_columna
//	posicion=(posicion+1)
//next
//for i_fila=1 to avisos_pendientes.dw_avisos_pendientes.rowcount() 
//	vectoryp[i_fila]=i_fila
//next
//vectoryp[avisos_pendientes.dw_avisos_pendientes.rowcount()+1]=0
//vectorp[14]=0
//iu_gen_gra_nu = CREATE u_gen_nu_gra_0001
//iu_gen_gra_nu.fnu_gra_titulo(avisos_pendientes.gr_2,"Avisos Pendientes Por Duraci$$HEX1$$f300$$ENDHEX$$n")
////iu_gen_gra_nu.fnu_gra_
//iu_gen_gra_nu.fnu_gra_cargo_datos(avisos_pendientes.gr_2,avisos_pendientes.dw_avisos_pendientes,1,TRUE,vectorp[],vectoryp[])
//iu_gen_gra_nu.fnu_titulo_x(avisos_pendientes.gr_2,right(avisos_pendientes.dw_avisos_pendientes.describe("nombre.text"),len(avisos_pendientes.dw_avisos_pendientes.describe("nombre.text"))-4))
//iu_gen_gra_nu.fnu_gra_titulo_y(avisos_pendientes.gr_2,"Num$$HEX1$$e900$$ENDHEX$$ro de Avisos")
//avisos_pendientes.setredraw(True)
//
//destroy iu_gen_gra_nu
RETURN 1
end function

public function integer fnu_calcula_estadistica_av_int_hor (datetime pd_fecha, integer pi_tipo_centro, integer pi_nro_centro);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_calcula estadistica_av_int_hor
// 
// Objetivo: Calcula la estad$$HEX1$$ed00$$ENDHEX$$stica e introduce los datos en la tabla.
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_nro_centro,
//					pi_tipo_centro
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

long ll_nro,ll_nro2,ll_nro3, ll_nro_horas,ll_hora,ll_total
long ll_valor[25]
int li_contador,l_fin_Cursor,li_pos,li_estado_est, li_calidad1, li_calidad2
string ls_select, ls_where,ls_fecha,ls_usuario,ls_usuario_bd
datetime ldt_fecha_actual
int li_alimentacion
int il_tipo_aviso

ldt_fecha_actual=fgnu_fecha_actual()
//ls_fecha=string(date(pd_fecha))  
ls_fecha=string(date(pd_fecha),'DD/MM/YYYY')  //DBE 19/01/2000

li_pos=Pos(ls_fecha,"/")

if int_horario.cbx_centro_cmd.checked=false then
	li_estado_est=1
else
	li_estado_est=2
end if

if int_horario.cbx_1.checked=true then
	ls_usuario=int_horario.dw_usuario.object.usuario[1] 
	ls_usuario_bd= ls_usuario
	ls_usuario = ls_usuario + "%"
else
	ls_usuario="%"
	ls_usuario_bd="TODOS"
end if

if li_pos = 2 then
	ls_fecha= "0" + ls_fecha
end if

if isvalid(int_horario.dw_tipo) then
	int_horario.dw_tipo.accepttext()
	// Si el aviso es normal o de calidad se mira la alimentaci$$HEX1$$f300$$ENDHEX$$n escogida
	IF int_horario.dw_tipo.getitemnumber(1,1) = 1 OR &
		int_horario.dw_tipo.getitemnumber(1,1) = 4 THEN
		
		li_alimentacion = int_horario.dw_tipo.getitemnumber(1,2)
	END IF
	
	//SMB 03/10/2007 al cambiar la forma de rellenar el combo 'tipo de aviso'
	//los valores que recibo son distintos. Los cambio para que sean los mismos
	//de antes y no deje de funcionar
	
	if integer(string(int_horario.dw_tipo.getitemnumber(1,'tipo_aviso'))) = 101 then
		il_tipo_aviso = 0
	else
		il_tipo_aviso = integer(string(int_horario.dw_tipo.getitemnumber(1,'tipo_aviso'))) + 1	
	end if
	
	//choose case int_horario.dw_tipo.getitemnumber(1,1)
	choose case il_tipo_aviso
		case 0  // Clase de Aviso: <Todos>
			ll_nro=00000000
			ll_nro2=99999999
			ll_nro3=00000000
			li_calidad1 = 0 // avisos que no son de calidad
 			li_calidad2 = 1 // avisos que son de calidad
		
		case 1 // Clase de Aviso: <Normal>
			choose case li_alimentacion
				case 0 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Todos>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1  
					ll_nro3= fgcdec_aviso_sin_alimentacion
				case 1 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Con alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1  
					ll_nro3=00000000
			
				case 2 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Sin alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=fgcdec_aviso_sin_alimentacion
					ll_nro2=fgcdec_aviso_sin_alimentacion
					ll_nro3=fgcdec_aviso_sin_alimentacion
			end choose
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case 2 // Clase de Aviso: <Ayuda>
			ll_nro=fgcdec_aviso_de_ayuda
			ll_nro2=fgcdec_aviso_de_ayuda
			ll_nro3=fgcdec_aviso_de_ayuda
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case 3 // Clase de Aviso: <Alumbrado p$$HEX1$$fa00$$ENDHEX$$blico>
			ll_nro=fgcdec_aviso_alumbrado_publico
			ll_nro2=fgcdec_aviso_alumbrado_publico
			ll_nro3=fgcdec_aviso_alumbrado_publico
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case 4 // Clase de Aviso: <Calidad>
			choose case li_alimentacion
				case 0 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Todos>
					ll_nro=00000000
					ll_nro2 = fgcdec_aviso_de_calidad - 1  
					ll_nro3= fgcdec_aviso_de_calidad_sin_alim
				
				case 1 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Con alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1
					ll_nro3=00000000
			
				case 2 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Sin alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=fgcdec_aviso_de_calidad_sin_alim
					ll_nro2=fgcdec_aviso_de_calidad_sin_alim
					ll_nro3=fgcdec_aviso_de_calidad_sin_alim
			end choose
			li_calidad1 = 1
			li_calidad2 = 1 // los avisos son s$$HEX1$$f300$$ENDHEX$$lo de calidad
	end choose
end if

li_contador=0

// Si el Tipo de centro es un centro (valga la redundancia) 

if pi_tipo_centro = 1 then
	
	Declare lc_cursor1 cursor for 
	select count(to_char(gi_avisos.f_alta,'HH24')),to_char(gi_avisos.f_alta,'HH24')
	from gi_avisos, sgd_centro
	where gi_avisos.nro_centro = :pi_nro_centro and 
			sgd_centro.nro_centro = gi_avisos.nro_centro and 
			sgd_centro.tip_centro = :pi_tipo_centro and
			(gi_avisos.nro_instalacion between :ll_nro and :ll_nro2 
			 OR gi_avisos.nro_instalacion = :ll_nro3) and
			to_char(gi_avisos.f_alta,'DD/MM/YYYY') = :ls_fecha and
			gi_avisos.usuario LIKE :ls_usuario
			and gi_avisos.ind_calidad >= :li_calidad1
			and gi_avisos.ind_calidad <= :li_calidad2
	group by to_char(gi_avisos.f_alta,'HH24') order by to_char(gi_avisos.f_alta,'HH24');
		
	OPEN lc_cursor1;

	FETCH lc_cursor1 INTO :ll_nro_horas, :ll_hora;
		
	DO 
		ll_valor[ll_hora+1]=ll_nro_horas		

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF
		
		FETCH lc_cursor1 INTO :ll_nro_horas, :ll_hora;
		
	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor1;
			
end if	

// Si el Tipo de centro es un CMD

if pi_tipo_centro = 2 then

	Declare lc_cursor2 cursor for 
	select count(to_char(gi_avisos.f_alta,'HH24')),to_char(gi_avisos.f_alta,'HH24')
	from gi_avisos, sgd_centro
	where gi_avisos.nro_cmd = :pi_nro_centro and
			sgd_centro.nro_centro = gi_avisos.nro_cmd and 
			sgd_centro.tip_centro = :pi_tipo_centro and
			(gi_avisos.nro_instalacion between :ll_nro and :ll_nro2 
			 OR gi_avisos.nro_instalacion = :ll_nro3) and
			to_char(gi_avisos.f_alta,'DD/MM/YYYY') = :ls_fecha and
			gi_avisos.usuario LIKE :ls_usuario
			and gi_avisos.ind_calidad >= :li_calidad1
			and gi_avisos.ind_calidad <= :li_calidad2
	group by to_char(gi_avisos.f_alta,'HH24') order by to_char(gi_avisos.f_alta,'HH24');
		
	OPEN lc_cursor2;

	FETCH lc_cursor2 INTO :ll_nro_horas, :ll_hora;
		
	DO 
		ll_valor[ll_hora+1]=ll_nro_horas		

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

		FETCH lc_cursor2 INTO :ll_nro_horas, :ll_hora;

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor2;
			
end if	

// Si el Tipo de centro es una Mesa

if pi_tipo_centro = 3 then
			
	Declare lc_cursor3 cursor for 
	select count(to_char(gi_avisos.f_alta,'HH24')),to_char(gi_avisos.f_alta,'HH24')
	from gi_avisos, sgd_centro
	where gi_avisos.nro_mesa = :pi_nro_centro and
			sgd_centro.nro_centro = gi_avisos.nro_mesa and 
			sgd_centro.tip_centro = :pi_tipo_centro and
			(gi_avisos.nro_instalacion between :ll_nro and :ll_nro2 
			 OR gi_avisos.nro_instalacion = :ll_nro3) and
			to_char(gi_avisos.f_alta,'DD/MM/YYYY') = :ls_fecha and
			gi_avisos.usuario LIKE :ls_usuario
			and gi_avisos.ind_calidad >= :li_calidad1
			and gi_avisos.ind_calidad <= :li_calidad2
	group by to_char(gi_avisos.f_alta,'HH24') order by to_char(gi_avisos.f_alta,'HH24');
		
	OPEN lc_cursor3;

	FETCH lc_cursor3 INTO :ll_nro_horas, :ll_hora;
		
	DO 
		ll_valor[ll_hora+1]=ll_nro_horas		

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

		FETCH lc_cursor3 INTO :ll_nro_horas, :ll_hora;

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor3;
			
END IF

for li_contador=1 to 24
	ll_total = ll_valor[li_contador] + ll_total
next

if ll_total = 0 then return 0	
			
INSERT INTO "GI_EST_AVISO"  
	       ( "NRO_CENTRO",   
            "INT1",   
            "INT2",   
            "INT3",   
            "INT4",   
            "INT5",   
            "INT6",   
            "INT7",   
            "INT8",   
            "INT9",   
            "INT10",   
            "INT11",   
            "INT12",   
            "TOT_INT",   
            "USUARIO_EST",   
            "TIPO_REG",   
            "USUARIO",    
            "F_ACTUAL",   
            "INT13",   
            "INT14",   
            "INT15",   
            "INT16",   
            "INT17",   
            "TIPO_DE_CONSULTA",
				"F_ESTADISTICA",
				"CLASE_AVISO",//DBE 19/01/2000
				"TODOS_AMBITOS", //DBE 20/01/2000
				"TIP_CENTRO")  
  VALUES ( :pi_nro_centro ,   
           :ll_valor[1] + :ll_valor[2],   
           :ll_valor[3] + :ll_valor[4],  
           :ll_valor[5] + :ll_valor[6], 
           :ll_valor[7] + :ll_valor[8],   
           :ll_valor[9] + :ll_valor[10],   
           :ll_valor[11] + :ll_valor[12],    
           :ll_valor[13] + :ll_valor[14],  
           :ll_valor[15] + :ll_valor[16],    
           :ll_valor[17] + :ll_valor[18],   
           :ll_valor[19] + :ll_valor[20], 
           :ll_valor[21] + :ll_valor[22], 
           :ll_valor[23] + :ll_valor[24], 
           :ll_total,
           :ls_usuario_bd,   
           :li_estado_est,   
           :gs_usuario,   
           :ldt_fecha_actual,   
           null,   
           null,   
           null,   
           null,   
           null,   
           1,
			  :pd_fecha,
			  :il_clase_aviso, //DBE 19/01/2000
			  :il_todos_ambitos, //DBE 20/01/2000
			  :pi_tipo_centro)  ;

//DBE 04/02/2000 ini comment
	//commit;
//	gnu_u_transaction.uf_commit(THIS)
//	
//	IF SQLCA.SQLCODE <>0 THEN
////		MESSAGEBOX("Atencion","Error al intentar grabar")
//		gnv_msg.f_mensaje("AA19","","",Ok!)
//		return 0
//	end if
////DBE 04/02/2000 fin comment
	return 1
	

end function

public function integer fnu_calcula_estadistica_av_por_dur (datetime pd_fecha, integer pi_tipo_centro, integer pi_nro_centro);///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_calcula estadistica_av_por_dur
// 
// Objetivo: Calcula la estad$$HEX1$$ed00$$ENDHEX$$stica e introduce los datos en la tabla.
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pi_nro_centro,
//					pi_tipo_centro
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

long ll_nro,ll_nro2,ll_nro3, ll_nro_horas,ll_hora,ll_total=0,ll_nro_dias,ll_dia
long ll_valor[24],ll_valor_dias[],ll_maximo,ll_valor_dias_est[8]
int li_contador,l_fin_Cursor,li_pos,li_estado_est, li_calidad1, li_calidad2, li_alimentacion
string ls_select, ls_where,ls_fecha,ls_usuario,ls_usuario_bd
datetime ldt_fecha_actual
datetime ldt_f_estadistica
int il_tipo_aviso


ldt_fecha_actual=fgnu_fecha_actual()
ldt_f_estadistica=datetime(date(fgnu_fecha_actual())) //DBE 20/01/2000
ls_fecha=string(date(pd_fecha))

if avisos_pendientes.cbx_centro_cmd_pend.checked=false then
	li_estado_est=1
else
	li_estado_est=2
end if

if avisos_pendientes.cbx_2.checked=true then
	ls_usuario=avisos_pendientes.dw_usuario_dur.object.usuario[1] 
	ls_usuario_bd= ls_usuario
	ls_usuario = ls_usuario + "%"
else
	ls_usuario="%"
	ls_usuario_bd="TODOS"
end if

li_pos=Pos(ls_fecha,"/")

if li_pos = 2 then
	ls_fecha= "0" + ls_fecha
end if

if isvalid(avisos_pendientes.dw_tipo_pend) then
	avisos_pendientes.dw_tipo_pend.accepttext()
	IF avisos_pendientes.dw_tipo_pend.getitemnumber(1,1) = 1 OR &
		avisos_pendientes.dw_tipo_pend.getitemnumber(1,1) = 4 THEN
		
		li_alimentacion = avisos_pendientes.dw_tipo_pend.getitemnumber(1,2)
	END IF
	
	//SMB 03/10/2007 al cambiar la forma de rellenar el combo 'tipo de aviso'
	//los valores que recibo son distintos. Los cambio para que sean los mismos
	//de antes y no deje de funcionar
	
	if integer(string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_aviso'))) = 101 then
		il_tipo_aviso = 0
	else
		il_tipo_aviso = integer(string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_aviso'))) + 1	
	end if
	
	choose case il_tipo_aviso
		case 0  // Clase de Aviso: <Todos>
			ll_nro=00000000
			ll_nro2=99999999
			ll_nro3=00000000
			li_calidad1 = 0 // avisos que no son de calidad
 			li_calidad2 = 1 // avisos que son de calidad
		
		case 1 // Clase de Aviso: <Normal>
			choose case li_alimentacion
				case 0 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Todos>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1  
					ll_nro3= fgcdec_aviso_sin_alimentacion
				case 1 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Con alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1  
					ll_nro3=00000000
			
				case 2 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Sin alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=fgcdec_aviso_sin_alimentacion
					ll_nro2=fgcdec_aviso_sin_alimentacion
					ll_nro3=fgcdec_aviso_sin_alimentacion
			end choose
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case 2 // Clase de Aviso: <Ayuda>
			ll_nro=fgcdec_aviso_de_ayuda
			ll_nro2=fgcdec_aviso_de_ayuda
			ll_nro3=fgcdec_aviso_de_ayuda
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case 3 // Clase de Aviso: <Alumbrado p$$HEX1$$fa00$$ENDHEX$$blico>
			ll_nro=fgcdec_aviso_alumbrado_publico
			ll_nro2=fgcdec_aviso_alumbrado_publico
			ll_nro3=fgcdec_aviso_alumbrado_publico
			li_calidad1 = 0
			li_calidad2 = 0 // los avisos no son de calidad
			
		case 4 // Clase de Aviso: <Calidad>
			choose case li_alimentacion
				case 0 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Todos>
					ll_nro=00000000
					ll_nro2 = fgcdec_aviso_de_calidad - 1  
					ll_nro3= fgcdec_aviso_de_calidad_sin_alim
				
				case 1 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Con alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=00000000
					ll_nro2=fgcdec_aviso_de_calidad - 1
					ll_nro3=00000000
			
				case 2 // Alimentaci$$HEX1$$f300$$ENDHEX$$n: <Sin alimentaci$$HEX1$$f300$$ENDHEX$$n>
					ll_nro=fgcdec_aviso_de_calidad_sin_alim
					ll_nro2=fgcdec_aviso_de_calidad_sin_alim
					ll_nro3=fgcdec_aviso_de_calidad_sin_alim
			end choose
			li_calidad1 = 1
			li_calidad2 = 1 // los avisos son s$$HEX1$$f300$$ENDHEX$$lo de calidad
	end choose
end if

li_contador=0

// Si el Tipo de centro es un centro (valga la redundancia) 

if pi_tipo_centro = 1 then
	
	SELECT COUNT(*)
		into :ll_total
		from gi_avisos
		where est_aviso=1 and
				nro_centro = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2;	
	
	if ll_total < 1 then return 0
	
	Declare lc_cursor_horas_1 cursor for 
		SELECT COUNT(to_char(f_alta,'HH24')),
		DECODE(TRUNC((sysdate - f_alta)*24,0),0,1,TRUNC((sysdate - f_alta)*24,0)) //DBE 25/01/2000
		from gi_avisos
		where (sysdate - f_alta) <1 and 
				est_aviso=1 and
				nro_centro = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2
		group by TRUNC((sysdate - f_alta)*24,0)
		order by TRUNC((sysdate - f_alta)*24,0);
		
	OPEN lc_cursor_horas_1;

	FETCH lc_cursor_horas_1 INTO :ll_nro_horas, :ll_hora;
		
	DO 
		ll_valor[ll_hora+1]=ll_nro_horas		

		FETCH lc_cursor_horas_1 INTO :ll_nro_horas, :ll_hora;

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor_horas_1;
	l_fin_cursor = 0
	
	Declare lc_cursor_dias_1 cursor for 
		SELECT COUNT(trunc(sysdate - f_alta)),trunc(sysdate - f_alta)
		from gi_avisos
		where (sysdate - f_alta) >= 1 and 
				est_aviso = 1 and
				nro_centro = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario 
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2
		group by trunc(sysdate - f_alta)
		order by trunc(sysdate - f_alta);

	OPEN lc_cursor_dias_1;

	FETCH lc_cursor_dias_1 INTO :ll_nro_dias, :ll_dia;
		
	DO 
		//DBE ini 24/01/2000		
		if isnull(ll_dia) or ll_dia=0 then
			for li_contador=1 to 31 
		       ll_valor_dias[li_contador]=0
			next
			exit
		end if
			
		if ll_dia <=30 then
			ll_dia=ll_dia + 1
		end if
		//DBE fin 24/01/2000		
		ll_valor_dias[ll_dia]=ll_nro_dias		

		FETCH lc_cursor_dias_1 INTO :ll_nro_dias, :ll_dia;

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor_dias_1;
	l_fin_cursor = 0
				
end if

// Si el Tipo de centro es un CMD

if pi_tipo_centro = 2 then
	
	SELECT COUNT(*)
		into :ll_total
		from gi_avisos
		where est_aviso=1 and
				nro_cmd = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario	
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2;

	if ll_total < 1 then return 0

	Declare lc_cursor_horas_2 cursor for 
	
	SELECT COUNT(to_char(f_alta,'HH24')),
	DECODE(TRUNC((sysdate - f_alta)*24,0),0,1,TRUNC((sysdate - f_alta)*24,0)) //DBE 25/01/2000
		from gi_avisos
		where (sysdate - f_alta) <1 and est_aviso=1 and
				nro_cmd = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2
		group by TRUNC((sysdate - f_alta)*24,0)
		order by TRUNC((sysdate - f_alta)*24,0);
		
	OPEN lc_cursor_horas_2;

	FETCH lc_cursor_horas_2 INTO :ll_nro_horas, :ll_hora;
		
	DO 
		ll_valor[ll_hora+1]=ll_nro_horas		

		FETCH lc_cursor_horas_2 INTO :ll_nro_horas, :ll_hora;

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor_horas_2;
	l_fin_cursor = 0
				

	Declare lc_cursor_dias_2 cursor for 
	
		SELECT COUNT(trunc(sysdate - f_alta)),trunc(sysdate - f_alta)
		from gi_avisos
		where (sysdate - f_alta) >= 1 and 
				est_aviso = 1 and
				nro_cmd = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario 
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2
		group by trunc(sysdate - f_alta)
		order by trunc(sysdate - f_alta);


	OPEN lc_cursor_dias_2;

	FETCH lc_cursor_dias_2 INTO :ll_nro_dias, :ll_dia;
		
	DO 
		//DBE ini 24/01/2000		
		if isnull(ll_dia) or ll_dia=0 then
			for li_contador=1 to 31 
		       ll_valor_dias[li_contador]=0
			next
			exit
		end if
		
		if ll_dia <=30 then
			ll_dia=ll_dia + 1
		end if
		//DBE fin 24/01/2000	
		
		ll_valor_dias[ll_dia]=ll_nro_dias		

		FETCH lc_cursor_dias_2 INTO :ll_nro_dias, :ll_dia;

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor_dias_2;
	l_fin_cursor = 0
				
end if

// Si el Tipo de centro es una Mesa

if pi_tipo_centro = 3 then	

	SELECT COUNT(*)
		into :ll_total
		from gi_avisos
		where est_aviso=1 and
				nro_mesa = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2;
	
	if ll_total < 1 then return 0
	
	Declare lc_cursor_horas_3 cursor for 
	SELECT COUNT(to_char(f_alta,'HH24')),
	DECODE(TRUNC((sysdate - f_alta)*24,0),0,1,TRUNC((sysdate - f_alta)*24,0)) //DBE 25/01/2000
		from gi_avisos
		where (sysdate - f_alta) <1 and est_aviso=1 and
				nro_mesa = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2
		group by TRUNC((sysdate - f_alta)*24,0)
		order by TRUNC((sysdate - f_alta)*24,0);
		
	OPEN lc_cursor_horas_3;

	FETCH lc_cursor_horas_3 INTO :ll_nro_horas, :ll_hora;
		
	DO 
		ll_valor[ll_hora+1]=ll_nro_horas		

		FETCH lc_cursor_horas_3 INTO :ll_nro_horas, :ll_hora;

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF

	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor_horas_3;
	l_fin_cursor = 0
	
	Declare lc_cursor_dias_3 cursor for 
		//DBE ini 24/01/2000
		SELECT COUNT(trunc(sysdate - f_alta)),trunc(sysdate - f_alta)
		from gi_avisos
		where (sysdate - f_alta) >= 1 and 
				est_aviso = 1 and
				nro_mesa = :pi_nro_centro and
				(nro_instalacion between :ll_nro and :ll_nro2 
				 OR nro_instalacion = :ll_nro3) and 
				usuario LIKE :ls_usuario 
				and gi_avisos.ind_calidad >= :li_calidad1
				and gi_avisos.ind_calidad <= :li_calidad2
		group by trunc(sysdate - f_alta)
		order by trunc(sysdate - f_alta);

		//DBE fin 24/01/2000
	OPEN lc_cursor_dias_3;

	FETCH lc_cursor_dias_3 INTO :ll_nro_dias, :ll_dia;
		
	DO 
		//DBE ini 24/01/2000		
		if isnull(ll_dia) or ll_dia=0 then
			for li_contador=1 to 31 
		       ll_valor_dias[li_contador]=0
			next
			exit
		end if
		
		if ll_dia <=30 then
			ll_dia=ll_dia + 1
		end if
		//DBE fin 24/01/2000			
		ll_valor_dias[ll_dia]=ll_nro_dias		

		FETCH lc_cursor_dias_3 INTO :ll_nro_dias, :ll_dia;

		IF sqlca.sqlcode <> 0 THEN
			l_fin_cursor = 1
		END IF
 
	LOOP UNTIL (l_fin_Cursor = 1)
		
	CLOSE lc_cursor_dias_3;
	l_fin_cursor = 0
				
END IF

if ll_dia<31 then 
	ll_valor_dias[31]=0
end if

ll_valor_dias_est[1] = ll_valor_dias[1] + ll_valor_dias[2]
ll_valor_dias_est[2] = ll_valor_dias[3] + ll_valor_dias[4]
ll_valor_dias_est[3] = ll_valor_dias[5] + ll_valor_dias[6] + ll_valor_dias[7] + ll_valor_dias[8]
ll_valor_dias_est[4] = ll_valor_dias[9] + ll_valor_dias[10] + ll_valor_dias[11] + ll_valor_dias[12]
ll_valor_dias_est[5] = ll_valor_dias[13] + ll_valor_dias[14] + ll_valor_dias[15] + ll_valor_dias[16]
ll_valor_dias_est[6] = ll_valor_dias[17] + ll_valor_dias[18] + ll_valor_dias[19] + ll_valor_dias[20]

for li_contador = 21 to 30
	ll_valor_dias_est[7] = ll_valor_dias[li_contador] + ll_valor_dias_est[7]
next

for li_contador = 31 to ll_dia
	ll_valor_dias_est[8] = ll_valor_dias[li_contador] + ll_valor_dias_est[8]
next

INSERT INTO "GI_EST_AVISO"  
	       ( "NRO_CENTRO",   
            "INT1",   
            "INT2",   
            "INT3",   
            "INT4",   
            "INT5",   
            "INT6",   
            "INT7",   
            "INT8",   
            "INT9",   
            "INT10",   
            "INT11",   
            "INT12",   
            "TOT_INT",   
            "USUARIO_EST",   
            "TIPO_REG",   
            "USUARIO",    
            "F_ACTUAL",   
            "INT13",   
            "INT14",   
            "INT15",   
            "INT16",   
            "INT17",   
            "TIPO_DE_CONSULTA",
				"F_ESTADISTICA",  //DBE 21/01/2000
				"CLASE_AVISO",    //DBE 21/01/2000
				"TODOS_AMBITOS",  //DBE 21/01/2000
				"TIP_CENTRO")
  VALUES ( :pi_nro_centro ,   
           :ll_valor[1] + :ll_valor[2] + :ll_valor[3] + :ll_valor[4],    
           :ll_valor[5] + :ll_valor[6] + :ll_valor[7] + :ll_valor[8],   
           :ll_valor[9] + :ll_valor[10] + :ll_valor[11] + :ll_valor[12],    
           :ll_valor[13] + :ll_valor[14] + :ll_valor[15] + :ll_valor[16],    
           :ll_valor[17] + :ll_valor[18] + :ll_valor[19] + :ll_valor[20], 
           :ll_valor[21] + :ll_valor[22] + :ll_valor[23] + :ll_valor[24],
			  :ll_valor_dias_est[1],
			  :ll_valor_dias_est[2],
			  :ll_valor_dias_est[3],
			  :ll_valor_dias_est[4],
           :ll_valor_dias_est[5],
			  :ll_valor_dias_est[6],
			  :ll_total,
           :ls_usuario_bd,   
           :li_estado_est,   
           :gs_usuario,   
           :ldt_fecha_actual,   
           :ll_valor_dias_est[7],
           :ll_valor_dias_est[8], 
           null,   
           null,   
           null,   
           2,
			  :ldt_f_estadistica,//DBE 21/01/2000
			  :il_clase_aviso, //DBE 21/01/2000
			  :il_todos_ambitos,  //DBE 21/01/2000
			  :pi_tipo_centro);

	//commit;
//	gnu_u_transaction.uf_commit(THIS)//DBE 04/02/2000
	return 1
	

end function

public subroutine fnu_busco_centro_cmd_puesto (ref integer pi_centros_hijos[], ref integer pi_contador, integer pi_tipo_centro, ref integer pi_array_tipos[], integer pi_tipo_centro_padre);///////////////////////////////////////////////////////////////////////////// 
//
// w_2030_estadisticas.tab_1.fnu_busco_centro_cmd_puesto
//
// FUNCION ALGORITMICA RECURSIVA QUE BUSCA LOS CENTROS ASOCIADOS DE UN
// DETERMINADO CENTRO GENERICO. 
// 
// Muy Importante:
// Esta funci$$HEX1$$f300$$ENDHEX$$n determina los centros a partir de la informaci$$HEX1$$f300$$ENDHEX$$n
// de la tabla SGD_RELACION_CENTRO. Sobre esta tabla hay una peculiaridad:
//			
//		- el campo tip_centro tiene dos significados dependiendo de los registros que lo
//		  acompa$$HEX1$$f100$$ENDHEX$$en:
//		  		1) Si el campo CENTRO_RESP es 98 o es 99, implica que CENTRO_DEPEN contiene un
//				  	centro SI TIP_CENTRO ES IGUAL A 1; o contiene un CMD SI TIP_CENTRO ES IGUAL A 
//					0.
//				
//				2) Si el campo CENTRO_RESP no es 98 $$HEX2$$f3002000$$ENDHEX$$99, implica que CENTRO_DEPEN contiene un
//					sector que depende del centro o cmd que haya en CENTRO_RESP. TIP_CENTRO igual
//					a 1 implica que el valor que hay en CENTRO_RESP es el de un centro; y si
//					TIP_CENTRO = 2, implica que el valor  que hay en CENTRO_RESP es el de un CMD
//
// RECIBE:
//        pi_centros_hijos[] :   ARRAY QUE CONTIENE LOS CENTROS ENCONTRADOS
//											(POR REFERENCIA)
//			 pi_contador        :   CONTADOR DEL ARRAY.
//			 pi_tipo_centro     :	TIPO DE CENTRO, CMD O PUESTO
//			 pi_array_tipos[]   :	ARRAY CON LOS TIPOS DE CENTROS ENCONTRADOS
//
//
// RESPONSABLE: FDO
////////////////////////////////////////////////////////////////////////////

LONG LL_CODIGO,ll_tipo
int li_centro_resp

if pi_contador=0 then 
	li_centro_resp = fg_padre_centros
else
	li_centro_resp = pi_centros_hijos[pi_contador]
end if

CHOOSE CASE pi_tipo_centro

	CASE 1

		DECLARE lc_centro_resp1 CURSOR FOR  
		 SELECT "SGD_RELACION_CENTRO"."CENTRO_DEPEN"  
		 FROM "SGD_RELACION_CENTRO"
	 	 WHERE "SGD_RELACION_CENTRO"."CENTRO_RESP" = :li_centro_resp
				and "SGD_RELACION_CENTRO"."TIP_CENTRO" = 1 ;

	  	OPEN lc_centro_resp1;

	  	FETCH lc_centro_resp1 INTO :LL_CODIGO;
	
		  DO WHILE sqlca.sqlcode=0

				pi_contador++
				pi_centros_hijos[pi_contador]=LL_CODIGO
				pi_array_tipos[pi_contador]=1
	 			w_2030_estadisticas.tab_1.fnu_busco_centro_cmd_puesto(pi_centros_hijos,pi_contador,3,pi_array_tipos,1)
   		   FETCH lc_centro_resp1 INTO :LL_CODIGO;	
				
		  LOOP
	  
 		close lc_centro_resp1;

	CASE 2
		
		DECLARE lc_centro_resp2 CURSOR FOR  
		 SELECT "SGD_RELACION_CENTRO"."CENTRO_DEPEN"  
		 FROM "SGD_RELACION_CENTRO"  
		 WHERE "SGD_RELACION_CENTRO"."CENTRO_RESP" = :li_centro_resp 
				 and "SGD_RELACION_CENTRO"."TIP_CENTRO" = 2 ;

	  	OPEN lc_centro_resp2;

	  	FETCH lc_centro_resp2 INTO :LL_CODIGO;
	
		  DO WHILE sqlca.sqlcode=0

				pi_contador++
				pi_centros_hijos[pi_contador]=LL_CODIGO
				pi_array_tipos[pi_contador]=2
	 			w_2030_estadisticas.tab_1.fnu_busco_centro_cmd_puesto(pi_centros_hijos,pi_contador,3,pi_array_tipos,2)
   		   FETCH lc_centro_resp2 INTO :LL_CODIGO;	
				
		  LOOP
	  
 		close lc_centro_resp2;

		 
	CASE 3

		DECLARE lc_centro_resp3 CURSOR FOR  
		 SELECT "SGD_RELACION_CENTRO"."CENTRO_DEPEN"  
		 FROM "SGD_RELACION_CENTRO"  
		 WHERE "SGD_RELACION_CENTRO"."CENTRO_RESP" = :li_centro_resp and
			 	 "SGD_RELACION_CENTRO"."TIP_CENTRO" = :pi_tipo_centro_padre;
				
	  	OPEN lc_centro_resp3;

	  	FETCH lc_centro_resp3 INTO :LL_CODIGO;
	
		  DO WHILE sqlca.sqlcode=0

				pi_contador++
				pi_centros_hijos[pi_contador]=LL_CODIGO
				pi_array_tipos[pi_contador]=3
			   FETCH lc_centro_resp3 INTO :LL_CODIGO;		
		  LOOP
 		close lc_centro_resp3;
		 
end choose
end subroutine

on u_tab_2030_pr_estadisticas_por_aviso.create
this.int_horario=create int_horario
this.avisos_pendientes=create avisos_pendientes
this.Control[]={this.int_horario,&
this.avisos_pendientes}
end on

on u_tab_2030_pr_estadisticas_por_aviso.destroy
destroy(this.int_horario)
destroy(this.avisos_pendientes)
end on

event selectionchanging;YIELD()
if ib_ambito_abierto OR ib_ambito_abierto_dur then 
	return 1
end if
//W_2030_ESTADISTICAS.TAB_1.setredraw(false)
//	
//if ib_cambio_tab=TRUE AND newindex=1 then
//	YIELD()
//	in_nro_nivel_AVIS_PEND=in_nro_nivel
//	in_fila_ant_AVIS_PEND=in_fila_ant
//	in_prim_vez_AVIS_PEND=in_prim_vez
//	in_nro_nivel=in_nro_nivel_AVIS
//	in_fila_ant=in_fila_ant_AVIS
//	in_prim_vez=in_prim_vez_AVIS
//	W_2030_ESTADISTICAS.TAB_1.setredraw(true)
//end if
//
//if ib_cambio_tab=TRUE AND newindex=2 then
//	YIELD()
//	in_nro_nivel_AVIS=in_nro_nivel
//	in_fila_ant_AVIS=in_fila_ant
//	in_prim_vez_AVIS=in_prim_vez
//	in_nro_nivel=in_nro_nivel_AVIS_PEND
//	in_fila_ant=in_fila_ant_AVIS_PEND
//	in_prim_vez=in_prim_vez_AVIS_PEND
//W_2030_ESTADISTICAS.TAB_1.setredraw(true)
//END IF
//if newindex=2 and ib_cambio_tab=false then
//	ib_cambio_tab=true
//	YIELD()
//	in_nro_nivel_AVIS=in_nro_nivel
//	in_fila_ant_AVIS=in_fila_ant
//	in_prim_vez_AVIS=in_prim_vez
//	in_nro_nivel = 0
//	in_fila_ant = 1
//	in_prim_vez = 1
//	w_2030_estadisticas.tab_1.f_habilito_campos_PEND(in_nro_nivel)
//	W_2030_ESTADISTICAS.TAB_1.setredraw(true)
//	avisos_pendientes.dw_avisos_pendientes.triggerevent("ue_primera_vez")
//end if


end event

event selectionchanged;if newindex=2 and ib_cambio_tab=false then
	W_2030_ESTADISTICAS.TAB_1.setredraw(false)
	ib_cambio_tab=true
	YIELD()
	in_nro_nivel_AVIS_PEND = 0
	in_fila_ant_AVIS_PEND = 1
	in_prim_vez_AVIS_PEND = 1
	w_2030_estadisticas.tab_1.f_habilito_campos_PEND(in_nro_nivel_AVIS_PEND)
	W_2030_ESTADISTICAS.TAB_1.setredraw(true)
	
//	avisos_pendientes.dw_avisos_pendientes.postevent("ue_primera_vez")

//	if avisos_pendientes.dw_avisos_pendientes.rowcount()=0 then
//		avisos_pendientes.p_avanzar.enabled=false
//		avisos_pendientes.p_retroceder.enabled=false
//		avisos_pendientes.pb_3.enabled=false
//	end if
end if
end event

event constructor;//***************************************
//**  OSGI 2001.1  	04/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
is_cmd_text = fg_cor_dw("CMD", "CMD")

int_horario.cbx_centro_cmd.Text				 = fg_cor_dw(int_horario.cbx_centro_cmd.Text, "CMD")
avisos_pendientes.cbx_centro_cmd_pend.Text = fg_cor_dw(avisos_pendientes.cbx_centro_cmd_pend.Text, "CMD")
//***************************************
//**  OSGI 2001.1  	04/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event

type int_horario from userobject within u_tab_2030_pr_estadisticas_por_aviso
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3429
integer height = 1632
long backcolor = 81324524
string text = "Ingresados por Intervalo Horario"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = "Custom056!"
long picturemaskcolor = 553648127
cb_imprimir cb_imprimir
cbx_centro_cmd cbx_centro_cmd
st_centro st_centro
cbx_3 cbx_3
dw_usuario dw_usuario
cbx_1 cbx_1
dw_tipo dw_tipo
pb_2 pb_2
st_1 st_1
em_fecha em_fecha
st_5 st_5
p_avanza p_avanza
p_retrocede p_retrocede
st_4 st_4
cb_buscar cb_buscar
r_4 r_4
u_amb u_amb
dw_1 dw_1
dw_2 dw_2
pb_1 pb_1
gb_2 gb_2
gr_1 gr_1
dw_esta_avisos dw_esta_avisos
end type

on int_horario.create
this.cb_imprimir=create cb_imprimir
this.cbx_centro_cmd=create cbx_centro_cmd
this.st_centro=create st_centro
this.cbx_3=create cbx_3
this.dw_usuario=create dw_usuario
this.cbx_1=create cbx_1
this.dw_tipo=create dw_tipo
this.pb_2=create pb_2
this.st_1=create st_1
this.em_fecha=create em_fecha
this.st_5=create st_5
this.p_avanza=create p_avanza
this.p_retrocede=create p_retrocede
this.st_4=create st_4
this.cb_buscar=create cb_buscar
this.r_4=create r_4
this.u_amb=create u_amb
this.dw_1=create dw_1
this.dw_2=create dw_2
this.pb_1=create pb_1
this.gb_2=create gb_2
this.gr_1=create gr_1
this.dw_esta_avisos=create dw_esta_avisos
this.Control[]={this.cb_imprimir,&
this.cbx_centro_cmd,&
this.st_centro,&
this.cbx_3,&
this.dw_usuario,&
this.cbx_1,&
this.dw_tipo,&
this.pb_2,&
this.st_1,&
this.em_fecha,&
this.st_5,&
this.p_avanza,&
this.p_retrocede,&
this.st_4,&
this.cb_buscar,&
this.r_4,&
this.u_amb,&
this.dw_1,&
this.dw_2,&
this.pb_1,&
this.gb_2,&
this.gr_1,&
this.dw_esta_avisos}
end on

on int_horario.destroy
destroy(this.cb_imprimir)
destroy(this.cbx_centro_cmd)
destroy(this.st_centro)
destroy(this.cbx_3)
destroy(this.dw_usuario)
destroy(this.cbx_1)
destroy(this.dw_tipo)
destroy(this.pb_2)
destroy(this.st_1)
destroy(this.em_fecha)
destroy(this.st_5)
destroy(this.p_avanza)
destroy(this.p_retrocede)
destroy(this.st_4)
destroy(this.cb_buscar)
destroy(this.r_4)
destroy(this.u_amb)
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.pb_1)
destroy(this.gb_2)
destroy(this.gr_1)
destroy(this.dw_esta_avisos)
end on

type cb_imprimir from commandbutton within int_horario
integer x = 2395
integer y = 1460
integer width = 407
integer height = 96
integer taborder = 14
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_situacion
string ls_titulo
long ll_longitud


CHOOSE CASE in_nro_nivel
	CASE 1
		
		if int_horario.cbx_centro_cmd.checked = false then
			dw_1.modify("texto.text = 'Hr / Zona'")
		else
			dw_1.modify("texto.text='Hr / " + is_cmd_text+ "'" )
		end if
		
	CASE 2
		dw_1.modify("texto.text = 'Hr / Sector'")
END CHOOSE

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Estadistica de Avisos'
ll_longitud = len (ls_titulo)*100
IF gr_1.visible = false then
	dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
	
	dw_1.getchild ("d_estadistica",dwc_situacion)
	dw_esta_avisos.sharedata(dwc_situacion)
	lst_impresion.pa_todos[1]=dw_esta_avisos
	lst_impresion.pa_nombres[1]='d_estadistica'
	
	lst_impresion.total = 1
	IF dw_esta_avisos.RowCount() = 0 THEN
//		gnv_msg.f_mensaje("AI21"," "," ",OK!)
		gnv_msg.f_mensaje("IA01","","",OK!)
		return
	END IF
	dw_1.SetTransObject(SQLCA)
	lst_impresion.grafica = false
	lst_impresion.pdw_compuesto = dw_1
else
	dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")
	
	dw_2.getchild ("d_estadistica_graf",dwc_situacion)
	dw_esta_avisos.sharedata(dwc_situacion)
	lst_impresion.pa_todos[1]=dw_esta_avisos
	lst_impresion.pa_nombres[1]='d_estadistica_graf'
	
	lst_impresion.total = 1
	IF dw_esta_avisos.RowCount() = 0 THEN
//		gnv_msg.f_mensaje("AI21"," "," ",OK!)
		gnv_msg.f_mensaje("IA01","","",OK!)
		return
	END IF
	dw_2.SetTransObject(SQLCA)
	
	lst_impresion.pdw_compuesto = dw_2
	lst_impresion.grafica = true

end if
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)
lst_impresion.pdw_compuesto.ShareDataOff()
IF gr_1.visible = false then
	dw_1.ShareDataOff()		
else
	gr_1.ShareDataOff()	
end if


end event

type cbx_centro_cmd from checkbox within int_horario
integer x = 1065
integer y = 24
integer width = 997
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Estad$$HEX1$$ed00$$ENDHEX$$stica por CMD."
end type

event clicked;cb_buscar.triggerEvent(clicked!)
end event

type st_centro from statictext within int_horario
boolean visible = false
integer x = 2747
integer y = 120
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
boolean enabled = false
string text = "<Todos>"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cbx_3 from checkbox within int_horario
integer x = 2167
integer y = 120
integer width = 818
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Selec. Ambito"
boolean automatic = false
end type

event clicked;

ib_cb_buscar=cb_buscar.enabled
ib_p_avanza=p_avanza.enabled
ib_p_retrocede=p_retrocede.enabled
ib_cbx_3=cbx_3.enabled
ib_pb_1=pb_1.enabled
ib_pb_2=pb_2.enabled
ib_em_fecha=em_fecha.enabled
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//dw_tipo.modify("tipo_aviso.background.color=" + string(65536*192+256*192+192))
dw_tipo.modify("tipo_aviso.background.color=" + gs_gris)
// Fin. Sgo.
//dw_tipo.SetTabOrder("tipo_aviso",0)
dw_tipo.enabled = False
ib_cbx_1=cbx_1.enabled
ib_dw_usuario=dw_usuario.enabled

ib_ambito_abierto=true
u_amb.visible=true
cb_buscar.enabled=false
p_avanza.enabled=false
p_retrocede.enabled=false
cbx_3.enabled=false
pb_1.enabled=false
pb_2.enabled=false
em_fecha.enabled=false
cbx_1.enabled=false
cbx_centro_cmd.enabled=false
dw_usuario.enabled=false
is_color_dw_usuario = dw_usuario.describe("usuario.background.color")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//dw_usuario.modify("usuario.background.color=" + string(65536*192+256*192+192))
dw_usuario.modify("usuario.background.color=" + gs_gris)
// Fin. Sgo.
// this.checked=true // LFE
u_amb.is_ventana = "Avisos_int_horario"

if int_horario.cbx_centro_cmd.checked=false then
	u_amb.dw_ambito.fnu_deshab_puesto(u_amb.dw_ambito)
	u_amb.dw_ambito.fnu_deshab_cmd(u_amb.dw_ambito)
else
	u_amb.dw_ambito.fnu_deshab_puesto(u_amb.dw_ambito)
	u_amb.dw_ambito.fnu_deshab_centro(u_amb.dw_ambito)
end if


end event

type dw_usuario from datawindow within int_horario
integer x = 2240
integer y = 24
integer width = 782
integer height = 92
integer taborder = 3
boolean enabled = false
string dataobject = "dddw_usuarios"
boolean border = false
boolean livescroll = true
end type

type cbx_1 from checkbox within int_horario
integer x = 2153
integer y = 28
integer width = 73
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;if this.checked=true then
	dw_usuario.enabled=true
	dw_usuario.object.usuario[1]=gs_usuario
	dw_usuario.object.usuario.background.color=gs_blanco
else
	dw_usuario.enabled=false
	dw_usuario.object.usuario[1]=""
	dw_usuario.object.usuario.background.color=gs_gris
end if
end event

type dw_tipo from datawindow within int_horario
integer x = 46
integer y = 108
integer width = 2043
integer height = 92
integer taborder = 3
string dataobject = "d_est_filtro_aviso"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String ls_columna

ACCEPTTEXT()
ls_columna=this.getcolumnname()

// Si el tipo de aviso es normal o de calidad se habilita la lista de alimentaci$$HEX1$$f300$$ENDHEX$$n,
// en caso contrario se deshabilita
IF ls_columna = "tipo_aviso" THEN
	//SMB 03/10/2007 abierto para normal = 1 y calidad = 4. Al cambiar el
	//combo para que cargue la tabla pasa a ser normal = 0 y calidad = 3
	//IF This.getitemnumber(1,1) = 1 OR This.getitemnumber(1,1) = 4 THEN
	IF This.getitemnumber(1,1) = 0 OR This.getitemnumber(1,1) = 3 THEN		
		this.object.tipo_alim.protect=0
		this.object.tipo_alim.background.color=gs_blanco
	ELSE		
		This.setitem(1,2,0)
		this.object.tipo_alim.protect=1
		this.object.tipo_alim.background.color=gs_gris
	END IF
END IF
end event

type pb_2 from picturebutton within int_horario
boolean visible = false
integer x = 3035
integer y = 1444
integer width = 142
integer height = 124
integer taborder = 5
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
string picturename = "lupa3.bmp"
alignment htextalign = left!
end type

event clicked;//w_2030_estadisticas.tab_1.int_horario.setredraw(false)
//if ib_zoom=false then
//	gr_1.width=3411
//	gr_1.height=1352
//	gr_1.x=20
//	gr_1.y=15
//	ib_zoom=true
// 	pb_2.picturename="lupades.bmp"
//	pb_2.enabled=true
//	yield()
//else 
//	gr_1.width=3355
//	gr_1.height=1128
//	gr_1.x=41
//	gr_1.y=224
//	ib_zoom=false
// 	pb_2.picturename="lupa3.bmp"
//	pb_2.enabled=true
//	yield()
//end if
//w_2030_estadisticas.tab_1.int_horario.setredraw(true)

w_2030_estadisticas.tab_1.int_horario.setredraw(false)
if ib_zoom=false then
	gr_1.width=3411
	gr_1.height=1352
	gr_1.x=20
	gr_1.y=15
	ib_zoom=true
 	pb_2.picturename="lupades.bmp"
	pb_2.enabled=true
	yield()
else 
	gr_1.width=3355
	gr_1.height=1128
	gr_1.x=41
	gr_1.y=224
	ib_zoom=false
 	pb_2.picturename="lupa3.bmp"
	pb_2.enabled=true
	yield()
end if
w_2030_estadisticas.tab_1.int_horario.setredraw(true)


end event

type st_1 from statictext within int_horario
integer x = 59
integer y = 28
integer width = 343
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Fecha:"
boolean focusrectangle = false
end type

type em_fecha from editmask within int_horario
event getfocus pbm_ensetfocus
string tag = "3"
integer x = 402
integer y = 24
integer width = 443
integer height = 80
integer taborder = 2
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
string displaydata = ""
double increment = 1
end type

event constructor;String ls_tit
SETPOINTER(HOURGLASS!)
id_fec_ant = Date(em_fecha.text)

IF in_open = 1 THEN
	in_open=2
ELSE
	in_nro_nivel=0
END IF

end event

type st_5 from statictext within int_horario
integer x = 1874
integer y = 1476
integer width = 425
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Siguiente"
boolean focusrectangle = false
end type

type p_avanza from picturebutton within int_horario
event clicked pbm_bnclicked
integer x = 1714
integer y = 1452
integer width = 133
integer height = 108
integer taborder = 4
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "avanzar.bmp"
string disabledname = "avan_1.bmp"
alignment htextalign = left!
end type

event clicked;//IF w_2030_estadisticas.tab_1.fnu_cambio_la_fecha() or in_nro_nivel = 0 THEN
//	dw_esta_avisos.triggerevent("ue_primera_vez")
//ELSE
dw_esta_avisos.triggerevent("ue_avan_nivel")
//END IF
// PR095   INC. 30
//IF dw_esta_avisos.rowcount()>0 THEN
//	IF dw_esta_avisos.GetItemDecimal(1,"tot_int") > 0 THEN
//		pb_1.enabled = True
//	ELSE
//		pb_1.enabled = False
//	END IF
//ELSE
//	pb_1.enabled=FALSE
//END IF
end event

type p_retrocede from picturebutton within int_horario
event clicked pbm_bnclicked
integer x = 1371
integer y = 1452
integer width = 133
integer height = 108
integer taborder = 3
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "retroced.bmp"
string disabledname = "retro_1.bmp"
alignment htextalign = left!
end type

event clicked;int li_tip_centro
string ls_centro //DBE 24/01/2000
int ln_nro_centro
string ls_tit

IF w_2030_estadisticas.tab_1.fnu_cambio_la_fecha() THEN
	dw_esta_avisos.triggerevent("ue_primera_vez")
ELSE
	iu_avi_2031_pr = CREATE u_avi_2031_pr_esta_avisos
	IF in_nro_nivel = 2 THEN
		p_retrocede.enabled=false
		ln_nro_centro = in_padre1
	ELSE 
		ln_nro_centro = fg_padre_centros
	END IF
	SETPOINTER(HOURGLASS!)
	in_nro_nivel = in_nro_nivel -1
	ls_tit = w_2030_estadisticas.tab_1.f_nombre_nivel(in_nro_nivel)
	w_2030_estadisticas.tab_1.f_habilito_campos(in_nro_nivel)
	PARENT.SETREDRAW(FALSE)
	//Se comprueba el checkbox
	
	if cbx_centro_cmd.checked = true then
		li_tip_centro = 2
	else
		li_tip_centro = 1
	end if
	
	//DBE ini 24/01/2000
	if il_nro_centro + il_nro_cmd + il_nro_mesa > 0 then
	   choose case li_tip_centro
		   case 1 //centro
				ls_centro = string(il_nro_centro)
		   case 2 //cmd
				ls_centro = string(il_nro_cmd)
	   end choose
   else
	ls_centro = '%'
   end if	
	//DBE fin 24/01/2000
	
	
	iu_avi_2031_pr.fnu_despliego_datos&
	(dw_esta_avisos,ln_nro_centro,is_usuario,idt_fecha1,li_tip_centro,&
	il_clase_aviso,il_todos_ambitos,ls_centro,li_tip_centro) //DBE 21/01/2000
	
	gr_1.reset()
	dw_esta_avisos.RowsCopy &
	(1, dw_esta_avisos.RowCount(), Primary!, gr_1, 1, Primary!)//GSH 05/01/2001

//	w_2030_estadisticas.tab_1.f_graficar(2,13,1,dw_esta_avisos.rowcount())
	IF dw_esta_avisos.RowCount()>0 THEN
		dw_esta_avisos.SelectRow(in_fila_ant,False)    //elimino la marcar anterior
		dw_esta_avisos.SelectRow(1,True)  // marco el seleccionado
		in_fila_ant = 1
		pb_1.enabled=true
	END IF
	PARENT.SETREDRAW(TRUE)
	SETPOINTER(ARROW!)
	Destroy iu_avi_2031_pr
END IF

end event

type st_4 from statictext within int_horario
integer x = 923
integer y = 1476
integer width = 425
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Anterior"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_buscar from u_cb within int_horario
event clicked pbm_bnclicked
integer x = 256
integer y = 1460
integer width = 407
integer height = 96
integer taborder = 3
string text = "&Buscar"
boolean default = true
end type

event clicked;dw_esta_avisos.triggerevent("ue_primera_vez")
//w_2030_estadisticas.tab_1.f_habilito_campos(in_nro_nivel_AVIS_PEND)
IF dw_esta_avisos.rowcount()>0 THEN
	//p_retrocede.ENABLED=FALSE
	IF dw_esta_avisos.GetItemDecimal(1,"tot_int") > 0 THEN
		pb_1.enabled = True
		
	ELSE
		pb_1.enabled = False
		p_avanza.enabled = False
		p_retrocede.enabled = False
	END IF
ELSE
	dw_esta_avisos.reset()
	pb_1.enabled=FALSE
	p_retrocede.ENABLED=FALSE
	p_avanza.enabled = False
	gnv_msg.f_mensaje("IA01","","",OK!)
END IF
	pb_2.visible=false
	gr_1.width=2702
	gr_1.height=729
	gr_1.x=51
	gr_1.y=229
	ib_zoom=false
 	pb_2.picturename="lupa3.bmp"
end event

type r_4 from rectangle within int_horario
integer linethickness = 4
long fillcolor = 79741120
integer x = 7159
integer width = 2720
integer height = 164
end type

type u_amb from u_2030_ambito_estadisticas within int_horario
event constructor pbm_constructor
event destroy ( )
boolean visible = false
integer x = 1143
integer y = 280
integer taborder = 3
boolean bringtotop = true
borderstyle borderstyle = styleraised!
end type

event constructor;// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
u_amb.dw_ambito.reset()
u_amb.dw_ambito.show()
u_amb.dw_ambito.f_insertar_fila()

//Conecto las DDDW del objeto "ambito"
// filtro todos sus campos y seteo a los mismos con todos

u_amb.dw_ambito.fpr_crea_dddw()
u_amb.dw_ambito.fnu_filtro_centro()
u_amb.dw_ambito.setitem(1,"nro_centro",fgci_todos)
u_amb.dw_ambito.fpr_filtro_cmd()
u_amb.dw_ambito.setitem(1,"nro_cmd",fgci_todos)
u_amb.dw_ambito.fpr_filtro_mesa()
u_amb.dw_ambito.setitem(1,"nro_mesa",fgci_todos)

u_amb.dw_ambito.setcolumn("nro_centro")

end event

on u_amb.destroy
call u_2030_ambito_estadisticas::destroy
end on

type dw_1 from datawindow within int_horario
boolean visible = false
integer x = 873
integer y = 376
integer width = 951
integer height = 832
integer taborder = 23
string dataobject = "d_estadisticas_horario_impr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within int_horario
boolean visible = false
integer x = 165
integer y = 368
integer width = 951
integer height = 832
integer taborder = 23
string dataobject = "d_estadisticas_horario_graf_impr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_1 from picturebutton within int_horario
event clicked pbm_bnclicked
integer x = 3191
integer y = 1440
integer width = 155
integer height = 128
integer taborder = 3
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = " "
string picturename = "grafico.bmp"
string disabledname = "graf_dis.bmp"
alignment htextalign = left!
end type

event clicked;yield()
IF GR_1.VISIBLE=tRUE THEN
//	f_habilito_campos( in_nro_nivel_AVIS_PEND) 
	
	PARENT.SETREDRAW(FALSE)
	this.picturename="grafico.bmp"
	gr_1.visible=False
	dw_esta_avisos.visible=True
	em_fecha.enabled = True
	pb_2.visible=false
	gr_1.width=3355
	gr_1.height=1128
	gr_1.x=41
	gr_1.y=224
	ib_zoom=false
 	pb_2.picturename="lupa3.bmp"
	cb_buscar.enabled = True
cbx_centro_cmd.enabled = True
	PARENT.SETREDRAW(TRUE)
ELSE
	PARENT.SETREDRAW(FALSE)
	this.picturename="dw.bmp"
	dw_esta_avisos.Hide()
	gr_1.width=3355
	gr_1.height=1128
	gr_1.x=41
	gr_1.y=224
	gr_1.Show()
	em_fecha.enabled = False
	pb_2.visible=true
	cb_buscar.enabled = False
	cbx_centro_cmd.enabled = false
	PARENT.SETREDRAW(TRUE)
	END IF



end event

type gb_2 from groupbox within int_horario
integer x = 41
integer y = 1388
integer width = 3360
integer height = 200
integer taborder = 4
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gr_1 from datawindow within int_horario
boolean visible = false
integer x = 55
integer y = 336
integer width = 3072
integer height = 800
integer taborder = 13
string dataobject = "d_avi_2031_graf_avisos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_esta_avisos from u_avi_2031_pr_esta_avisos within int_horario
event clicked pbm_dwnlbuttonclk
event doubleclicked pbm_dwnlbuttondblclk
event rbuttondown pbm_dwnrbuttondown
event rowfocuschanged pbm_dwnrowchange
event ue_avan_nivel pbm_custom72
event ue_primera_vez pbm_custom73
string tag = "4"
integer x = 46
integer y = 224
integer width = 3365
integer height = 1128
integer taborder = 2
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;iF row > 0 THEN
	this.SelectRow(0,False)    //elimino la marca anterior
	this.SelectRow(row,True)  // marco el seleccionado
	in_fila_ant=row
END IF

end event

event doubleclicked;IF dw_esta_avisos.Rowcount() > 0 THEN
	if w_2030_estadisticas.tab_1.fnu_cambio_la_fecha() THEN
		dw_esta_avisos.Triggerevent("ue_primera_vez")
	ELSE
		dw_esta_avisos.Triggerevent("ue_avan_nivel")
	End if
END IF
end event

event rbuttondown;call super::rbuttondown;w_2030_estadisticas.tab_1.fnu_total("P")
end event

event rowfocuschanged;call super::rowfocuschanged;this.selectRow(0,False)
this.selectRow(currentrow,True)
end event

event ue_avan_nivel;////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: ue_avanzo_nivel
// 
// Objetivo:Carga los datos correspondiente al proximo nivel
//				en caso de no encontrar datos despliega mensaje de error
// PARAMETROS  
//	Entrada:  
//	Salida:   
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////////
string ls_tit
int li_origen
PARENT.SETREDRAW(FALSE)
IF in_nro_nivel < 2 THEN    // se asume que hay tres niveles
	IF dw_esta_avisos.Rowcount() > 0 THEN   // si tengo algo en la datawindows
		int ln_nro_centro
		iu_avi_2031_pr = CREATE u_avi_2031_pr_esta_avisos
		IF in_fila_ant > 0 THEN	 // Si tengo uno marcado
			IF NOT ISNULL(dw_esta_avisos.getitemnumber(in_fila_ant,"NRO_CENTRO")) THEN
				if cbx_centro_cmd.checked = true then
					li_origen = 2
				else
					li_origen = 1
				end if
				ln_nro_centro = dw_esta_avisos.getitemnumber(in_fila_ant,"NRO_CENTRO")
				SETPOINTER(HOURGLASS!)
				iu_avi_2031_pr.fnu_despliego_datos &
				(dw_esta_avisos,ln_nro_centro,is_usuario,idt_fecha1,3,&
				il_clase_aviso,il_todos_ambitos,'%',li_origen)//DBE 21/01/2000
				
				gr_1.reset()
				dw_esta_avisos.RowsCopy &
				(1, dw_esta_avisos.RowCount(), Primary!, gr_1, 1, Primary!)//DBE 26/01/2000

				
				in_nro_nivel = in_nro_nivel + 1
				IF in_nro_nivel = 2 THEN	
					in_padre2 = ln_nro_centro
				Else
					in_padre3 = ln_nro_centro
				END IF
				ls_tit = w_2030_estadisticas.tab_1.f_nombre_nivel(in_nro_nivel)
				w_2030_estadisticas.tab_1.f_graficar(2,13,1,dw_esta_avisos.rowcount())
            SETPOINTER(ARROW!)
				w_2030_estadisticas.tab_1.f_habilito_campos(in_nro_nivel)
				IF dw_esta_avisos.RowCount()>0 THEN
					dw_esta_avisos.SelectRow(in_fila_ant,False) //elimino la marcar anterior
					dw_esta_avisos.SelectRow(1,True)  // marco el seleccionado
					in_fila_ant = 1
				END IF
			END IF
		end if
		Destroy iu_avi_2031_pr
	else
		PARENT.SETREDRAW(TRUE)
		gnv_msg.f_mensaje("AI22"," "," ",Ok!)
	end if	
else
	gnv_msg.f_mensaje("AI22"," "," ",Ok!)
END IF

IF dw_esta_avisos.Rowcount() <= 0 THEN
	PARENT.SETREDRAW(TRUE)
	gnv_msg.f_mensaje("AI22"," "," ",Ok!)
	p_avanza.enabled=false
end if

if in_nro_nivel=2 then
	p_avanza.enabled=false
end if
PARENT.SETREDRAW(TRUE)
end event

event ue_primera_vez;/////////////////////////////////////////////////////////
//
//  ue_primera_vez
// 
// Objetivo: Lo que hace es llamar a funciones para que cargue la tabla
// 			est_aviso para poder realizar la consulta
// 			Esto se hace cada vez que cambian la fecha
//
/////////////////////////////////////////////////////////

String ls_tit,ls_fecha,ls_usuario_est, ls_mensaje,ls_mensaje1,ls_zona_cmd,ls_zona_cmd_msg
boolean lb_generar=false
Date ldt_fecha
DateTime ldt_f_estadistica
int li_ampliacion,li_centros[],li_contador,li_tipos[],li_bucle,li_nro_centro,li_estado_est
LONG LL_CENTRO_FUNC,ll_select
long ll_centro //DBE 19/01/2000
string ls_centro
datetime ldt_f_actual
int li_count, li_repite, li_start, li_gener
int il_tipo_aviso

iu_avi_2031_pr = CREATE u_avi_2031_pr_esta_avisos

parent.setredraw(false)
this.reset()
this.accepttext()
yield()
SETPOINTER(HOURGLASS!)

ldt_fecha=date(em_fecha.text)
idt_fecha1=dateTime(ldt_fecha)

dw_usuario.accepttext()

is_usuario=dw_usuario.object.usuario[1]

// Aqu$$HEX2$$ed002000$$ENDHEX$$es donde se fija la clase de los avisos para los que se quiere generar la estad$$HEX1$$ed00$$ENDHEX$$stica
// Este campo estar$$HEX2$$e1002000$$ENDHEX$$formado por un n$$HEX1$$fa00$$ENDHEX$$mero de 2 d$$HEX1$$ed00$$ENDHEX$$gitos: el primero de ellos representa el
// tipo del aviso, y el segundo representa la alimentaci$$HEX1$$f300$$ENDHEX$$n
if integer(string(int_horario.dw_tipo.getitemnumber(1,'tipo_aviso'))) = 101 then
	il_tipo_aviso = 0
else
	il_tipo_aviso = integer(string(int_horario.dw_tipo.getitemnumber(1,'tipo_aviso'))) + 1	
end if

il_clase_aviso = integer(string (il_tipo_aviso) + string(int_horario.dw_tipo.getitemnumber(1,'tipo_alim'))) 	

//il_clase_aviso = integer(string(int_horario.dw_tipo.getitemnumber(1,'tipo_aviso')) + &
//							    string(int_horario.dw_tipo.getitemnumber(1,'tipo_alim'))) 



//il_clase_aviso = int_horario.dw_tipo.getitemnumber(1,'tipo_aviso')
if int_horario.cbx_centro_cmd.checked=false then
	li_estado_est=1
	ls_zona_cmd= "ZONA"
	ls_zona_cmd_msg= "la ZONA"
else
	li_estado_est=2

	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	04/05/2001  	ls_zona_cmd="CMD"
	//**  OSGI 2001.1  	04/05/2001  	ls_zona_cmd_msg= "el CMD"

	ls_zona_cmd=is_cmd_text
	ls_zona_cmd_msg="el " + is_cmd_text
	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
end if

//DECLARE OBTE2031 PROCEDURE FOR OBTENGO_DATOS_2031(:ldt_fecha,:gs_usuario);
//EXECUTE OBTE2031;

//w_2030_estadisticas.tab_1.f_datos_prueba(idt_fecha1)

// Anteriormente ejecutaba este PLSQL, al realizar las pruebas de 
// volumen se comprob$$HEX2$$f3002000$$ENDHEX$$que no se pueden asumir sus tiempos y se ha
// cambiado la manera de generar la estad$$HEX1$$ed00$$ENDHEX$$stica.

// DBE ini comentado
//if is_usuario ="" or isnull(is_usuario) then
//	is_usuario = "TODOS"
//	select count(*) 
//	into :li_nro_centro 
//	from GI_EST_AVISO 
//	WHERE TIPO_DE_CONSULTA=1 
//	and usuario_est='TODOS' 
//	and f_estadistica=:idt_fecha1	
//	AND TIPO_REG = :li_estado_est; 
//else
//	select count(*) 
//	into :li_nro_centro 
//	from GI_EST_AVISO
//	WHERE USUARIO_EST=:is_usuario 
//	AND TIPO_DE_CONSULTA=1 
//	and f_estadistica=:idt_fecha1	
//	AND TIPO_REG = :li_estado_est; 
//end if
// DBE fin comentado

//DBE ini 19/01/2000
if is_usuario ="" or isnull(is_usuario) then
	is_usuario = "TODOS"
end if

if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then

	if il_nro_cmd>=0 and il_nro_mesa>0 then
		li_start=2
		li_repite=0
		ll_centro=il_nro_mesa
	elseif il_nro_mesa=0 and il_nro_cmd>=0 then
		li_start=1
		li_repite=0
		choose case li_estado_est
			case 1
				ll_centro=il_nro_centro
	      case 2
				ll_centro=il_nro_cmd
      end choose
	end if
	
	for li_count=li_start to li_repite step -1
		select max(f_actual) into :ldt_f_actual
		from GI_EST_AVISO 
		WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
		and f_estadistica=:idt_fecha1
		and tipo_reg=:li_estado_est
		and nro_centro = :ll_centro
		and todos_ambitos = :li_count
		and clase_aviso = :il_clase_aviso;
	
		if year(date(ldt_f_actual))>1900 then
			il_todos_ambitos=li_count
			exit
		end if
	
	next


else
	il_todos_ambitos=0
	select max(f_actual) into :ldt_f_actual
	from GI_EST_AVISO 
	WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
	and f_estadistica=:idt_fecha1
	and tipo_reg=:li_estado_est
	and todos_ambitos = 0
	and clase_aviso = :il_clase_aviso;
end if

ls_mensaje= "Existe una estad$$HEX1$$ed00$$ENDHEX$$stica generada el " +string(ldt_f_actual)+"~n que se ajusta para este criterio de seleccion:" +&
"~n Avisos ingresados para el d$$HEX1$$ed00$$ENDHEX$$a " + string(ldt_fecha) 

if is_usuario = "TODOS" then
else
	ls_mensaje=	ls_mensaje +"~n, el usuario " + is_usuario
end if

if  il_nro_mesa > 0 then 
	ls_mensaje=	ls_mensaje +"~n, Sector " + int_horario.st_centro.Text
elseif il_nro_cmd > 0 then
	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	04/05/2001  	ls_mensaje=	ls_mensaje +"~n, CMD " + int_horario.st_centro.Text

	ls_mensaje=	ls_mensaje +"~n, " + is_cmd_text + " " + int_horario.st_centro.Text
	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
elseif il_nro_centro > 0 then 
	ls_mensaje=	ls_mensaje +"~n, Zona " + int_horario.st_centro.Text
end if 


if il_clase_aviso>0 then
	ls_mensaje=	ls_mensaje +"~n, clase aviso " +&
	left( &
			int_horario.dw_tipo.getvalue('tipo_aviso',il_clase_aviso + 1), &
			len(int_horario.dw_tipo.getvalue('tipo_aviso',il_clase_aviso + 1)) - 1) 
end if

// DSA 7/08/2000
//ls_mensaje=ls_mensaje+ &
//		".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."	


// si encuentra una estad$$HEX1$$ed00$$ENDHEX$$stica anterior, pregunta al usuario si desea con-
// servar esta o generar una nueva.
if not isnull(ldt_f_actual) and  year(date(ldt_f_actual))>1900  then
	// DSA INI 7/08/2000 	Si no tiene el pergil mostrar lo que existe
	//li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)
	if gu_perfiles.of_acceso_perfil(gi_perfil,'EAV_GENERAL','ACC_MANTEN') =1 THEN			
		ls_mensaje=ls_mensaje+ &
		".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."	
		li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)		
	else
		gnv_msg.f_mensaje("AA18",ls_mensaje,"",Ok!)
		li_gener	= 1 	
	end if
	// DSA FIN 7/08/2000
	choose case li_gener		
			case  1 
			//$$HEX1$$bf00$$ENDHEX$$Todavia existe?
				if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then			
					select max(f_actual) into :ldt_f_actual
					from GI_EST_AVISO 
					WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
					and f_estadistica=:idt_fecha1
					and tipo_reg=:li_estado_est
					and nro_centro = :ll_centro
					and todos_ambitos = :il_todos_ambitos
					and clase_aviso = :il_clase_aviso;
				else
					select max(f_actual) into :ldt_f_actual
					from GI_EST_AVISO 
					WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
					and f_estadistica=:idt_fecha1
					and tipo_reg=:li_estado_est
					and todos_ambitos = :il_todos_ambitos
					and clase_aviso = :il_clase_aviso;
				end if
			
				if not isnull(ldt_f_actual) and  year(date(ldt_f_actual))>1900  then
					lb_generar=false
      		else
      			lb_generar=true
			   end if
			
		case 2
			lb_generar=true
	end choose

else
	// DSA INI 7/08/2000	Si no tiene el pergil mostrar lo que existe
	//	lb_generar=true
	if gu_perfiles.of_acceso_perfil(gi_perfil,'EAV_GENERAL','ACC_MANTEN') =1 THEN		
		lb_generar=true
	else
		lb_generar=false
	end if
	// DSA FIN 7/08/2000
end if


//DBE fin 19/01/2000


//DBE ini comentado 19/01/2000

//// si encuentra una estad$$HEX1$$ed00$$ENDHEX$$stica anterior, pregunta al usuario si desea con-
//// servar esta o generar una nueva.
//
//
//ls_mensaje= "Existe una estad$$HEX1$$ed00$$ENDHEX$$stica generada por " + ls_zona_cmd +", para el d$$HEX1$$ed00$$ENDHEX$$a " + string(ldt_fecha)+ &
//					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."
//ls_mensaje1="Existe una estad$$HEX1$$ed00$$ENDHEX$$stica para el usuario " + is_usuario + " por " + ls_zona_cmd +",del d$$HEX1$$ed00$$ENDHEX$$a " + string(ldt_fecha)+ &
//					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."
//		
//if not isnull(li_nro_centro) and li_nro_centro <>0 then
//	if is_usuario = "TODOS" then
//		if gnv_msg.f_mensaje("AA18",ls_mensaje,"", Okcancel!)=2 then
////		messagebox("Aviso","Existe una estad$$HEX1$$ed00$$ENDHEX$$stica para el d$$HEX1$$ed00$$ENDHEX$$a " + string(ldt_fecha)+ &
////					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva.",information!,okcancel!)=2 then
//		lb_generar=true
//		end if
//	else
//		if gnv_msg.f_mensaje("AA18",ls_mensaje1,"",Okcancel!)=2 then
////		messagebox("Aviso","Existe una estad$$HEX1$$ed00$$ENDHEX$$stica para el usuario " + is_usuario + "del d$$HEX1$$ed00$$ENDHEX$$a " + string(ldt_fecha)+ &
////					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva.",information!,okcancel!)=2 then
//		lb_generar=true
//		end if
//	end if
//else
//	lb_generar=true
//end if
//
////DBE fin comentado 19/01/2000


if lb_generar=true then
	li_ampliacion=0
	OPEN(W_BARRA)
	W_BARRA.uo_barra.barra.f_resetea_barra()
	W_BARRA.UO_BARRA.gb_1.text="Buscando Zonas Asociadas"
	W_BARRA.UO_BARRA.BARRA.visible=true
	W_BARRA.uo_barra.barra.f_amplia(li_ampliacion)
	
//	DELETE GI_EST_AVISO WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 and f_estadistica=:idt_fecha1; 
//DBE ini 19/01/2000

if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then
	choose case li_estado_est
   	case 1
      	ll_centro=il_nro_centro
      case 2
         ll_centro=il_nro_cmd
   end choose
 
 	if il_nro_cmd>=0 and il_nro_mesa>0 then
	  	il_todos_ambitos=2
							
	   DELETE GI_EST_AVISO 
	   WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
	    and f_estadistica=:idt_fecha1
	    and tipo_reg=:li_estado_est
	    and (nro_centro in (:il_nro_centro , :il_nro_cmd , :il_nro_mesa) or
	  		   nro_centro in (
                  select SGD_RELACION_CENTRO.CENTRO_DEPEN
                  from SGD_RELACION_CENTRO where 
                  SGD_RELACION_CENTRO.CENTRO_RESP = :ll_centro and 
                  SGD_RELACION_CENTRO.TIP_CENTRO =:li_estado_est and 
                  SGD_RELACION_CENTRO.CENTRO_RESP not in (98,99)))
	    and todos_ambitos = :il_todos_ambitos
	    and clase_aviso = :il_clase_aviso;
	
	elseif il_nro_mesa=0 and il_nro_cmd>=0 then
   	il_todos_ambitos=1
      DELETE GI_EST_AVISO 
      WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
        and f_estadistica=:idt_fecha1
        and tipo_reg=:li_estado_est
        and  (nro_centro=:ll_centro or
	           nro_centro in (
                  select SGD_RELACION_CENTRO.CENTRO_DEPEN
                  from SGD_RELACION_CENTRO where 
                  SGD_RELACION_CENTRO.CENTRO_RESP = :ll_centro and 
                  SGD_RELACION_CENTRO.TIP_CENTRO =:li_estado_est and 
                  SGD_RELACION_CENTRO.CENTRO_RESP not in (98,99)))
	     and todos_ambitos = :il_todos_ambitos
	     and clase_aviso = :il_clase_aviso;
   end if
	            
	else
		il_todos_ambitos=0
		DELETE GI_EST_AVISO 
		WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=1 
		and f_estadistica=:idt_fecha1
		and tipo_reg=:li_estado_est
		and todos_ambitos = :il_todos_ambitos
		and clase_aviso = :il_clase_aviso;
		
	end if
		
	//DBE fin 19/01/2000	
	IF SQLCA.SQLCODE = -1 THEN
		gnv_msg.f_mensaje("AA20","","",Ok!)
		return 0
	end if
	
	//commit;
	//	gnu_u_transaction.uf_commit(PARENT) //DBE 04/02/2000
	IF w_2030_estadisticas.TAB_1.IL_NRO_CENTRO=0 AND w_2030_estadisticas.TAB_1.IL_NRO_CMD=0 and int_horario.cbx_centro_cmd.checked=false THEN
			FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,1,li_tipos[],1)
		
	ELSEIF (w_2030_estadisticas.TAB_1.IL_NRO_CMD<>0 or int_horario.cbx_centro_cmd.checked=true) and w_2030_estadisticas.TAB_1.IL_NRO_MESA=0 THEN
		IF w_2030_estadisticas.TAB_1.IL_NRO_CMD<>0 THEN
			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CMD
			li_tipos[1] = 2
			LI_CONTADOR=1
			FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,3,li_tipos[],2)
		ELSE
			FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,2,li_tipos[],2)
		end if
			
	ELSEIF IL_NRO_MESA=0 THEN
		
		li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO
		li_tipos[1] = 1
		LI_CONTADOR=1
		FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,3,li_tipos[],1)
					
	ELSE
		if IL_NRO_CENTRO = 0 then
			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CMD
			li_tipos[1] = 2
		else
			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO
			li_tipos[1] = 1
		end if
			
		li_centros[2] = w_2030_estadisticas.TAB_1.IL_NRO_MESA
		li_tipos[2] = 3
		LI_CONTADOR=2
	
	END IF	
		
	for li_bucle= 1 to li_contador
		
		if li_tipos[li_bucle]=1 then W_BARRA.UO_BARRA.gb_1.text="Datos para la Zona " + string(li_centros[li_bucle])

		//***************************************
		//**  OSGI 2001.1  	04/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		//**  OSGI 2001.1  	04/05/2001  		if li_tipos[li_bucle]=2 then W_BARRA.UO_BARRA.gb_1.text="Datos para el CMD " + string(li_centros[li_bucle])

		if li_tipos[li_bucle]=2 then W_BARRA.UO_BARRA.gb_1.text="Datos para el " + is_cmd_text + " " + string(li_centros[li_bucle])
		//***************************************
		//**  OSGI 2001.1  	04/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************


		if li_tipos[li_bucle]=3 then W_BARRA.UO_BARRA.gb_1.text="Datos para el Sector " + string(li_centros[li_bucle])
	
		li_ampliacion= truncate((li_bucle*100)/li_contador,0)
			
		W_BARRA.uo_barra.barra.f_amplia(li_ampliacion)
			
		w_2030_estadisticas.tab_1.fnu_calcula_estadistica_av_int_hor(idt_fecha1,li_tipos[li_bucle],li_centros[li_bucle])
			
	next
	//DBE 04/02/2000 ini
	gnu_u_transaction.uf_commit(PARENT) 
	IF SQLCA.SQLCODE <>0 THEN
		// error al intentar grabar
		gnv_msg.f_mensaje("AA19","","",Ok!)
	end if
	//DBE 04/02/2000 fin
	
end if

if isvalid(w_barra) then
	W_BARRA.uo_barra.barra.f_amplia(100)
	close(w_barra)
end if

//DBE ini 24/01/2000
if il_nro_centro + il_nro_cmd + il_nro_mesa > 0 then
	choose case li_estado_est
		case 1 //centro
			ls_centro = string(il_nro_centro)
		case 2 //cmd
			ls_centro = string(il_nro_cmd)
	end choose
	
else
	ls_centro = '%'
end if	
//DBE fin 24/01/2000

iu_avi_2031_pr.fnu_despliego_datos &
(dw_esta_avisos,fg_padre_centros,is_usuario+"%",idt_fecha1,li_estado_est,&
il_clase_aviso,il_todos_ambitos,ls_centro,li_estado_est)
w_2030_estadisticas.tab_1.f_graficar(2,13,1,this.rowcount())
parent.setredraw(true)
Destroy iu_avi_2031_pr

gr_1.reset()
dw_esta_avisos.RowsCopy &
(1, dw_esta_avisos.RowCount(), Primary!, gr_1, 1, Primary!)//DBE 26/01/2000



SETPOINTER(ARROW!)
in_padre1 = fg_padre_centros
w_2030_estadisticas.tab_1.f_habilito_campos(in_nro_nivel)
id_fec_ant = Date(em_fecha.text)
IF This.rowcount() = 0 THEN
	pb_1.enabled=false
	IF in_open > 1 THEN
		gnv_msg.f_mensaje("AI21"," "," ",OK!)
	END IF
ELSE
	
	if il_nro_mesa<>0 then
		
		select count(*) 
		into :ll_select 
		from gi_est_aviso
		where USUARIO_EST=:is_usuario AND
				TIPO_DE_CONSULTA=1 and
				f_estadistica=:idt_fecha1 and 
				 clase_aviso = :il_clase_aviso and//DBE 19/01/2000
				 todos_ambitos= :il_todos_ambitos and//DBE 19/01/2000
				nro_centro=:il_nro_mesa;
				
		if  ll_select=0 or isnull(ll_select) then 		
//			Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Hay datos de " + ls_zona_cmd_msg + " especificado pero del Sector elegido no hay.")
			gnv_msg.f_mensaje("IA11",ls_zona_cmd_msg,"",Ok!)
		end if
		
	end if
	in_nro_nivel = 1
	w_2030_estadisticas.tab_1.f_habilito_campos(in_nro_nivel)
	This.SelectRow(in_fila_ant,False)    //elimino la marcar anterior
	This.SelectRow(1,True)  // marco el seleccionado
	in_fila_ant = 1
END IF
ls_tit = w_2030_estadisticas.tab_1.f_nombre_nivel(1)
parent.setredraw(true)
end event

type avisos_pendientes from userobject within u_tab_2030_pr_estadisticas_por_aviso
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3429
integer height = 1632
long backcolor = 81324524
string text = "Pendientes por Duraci$$HEX1$$f300$$ENDHEX$$n"
long tabtextcolor = 33554432
long tabbackcolor = 81324524
string picturename = "Custom015!"
long picturemaskcolor = 553648127
cb_imprimir2 cb_imprimir2
cbx_centro_cmd_pend cbx_centro_cmd_pend
st_centro_dur st_centro_dur
u_amb_dur u_amb_dur
cbx_4 cbx_4
dw_usuario_dur dw_usuario_dur
cbx_2 cbx_2
pb_5 pb_5
pb_3 pb_3
cb_buscar2 cb_buscar2
dw_tipo_pend dw_tipo_pend
st_2 st_2
p_avanzar p_avanzar
p_retroceder p_retroceder
st_3 st_3
gb_1 gb_1
dw_3 dw_3
gr_2 gr_2
dw_avisos_pendientes dw_avisos_pendientes
dw_4 dw_4
end type

on avisos_pendientes.create
this.cb_imprimir2=create cb_imprimir2
this.cbx_centro_cmd_pend=create cbx_centro_cmd_pend
this.st_centro_dur=create st_centro_dur
this.u_amb_dur=create u_amb_dur
this.cbx_4=create cbx_4
this.dw_usuario_dur=create dw_usuario_dur
this.cbx_2=create cbx_2
this.pb_5=create pb_5
this.pb_3=create pb_3
this.cb_buscar2=create cb_buscar2
this.dw_tipo_pend=create dw_tipo_pend
this.st_2=create st_2
this.p_avanzar=create p_avanzar
this.p_retroceder=create p_retroceder
this.st_3=create st_3
this.gb_1=create gb_1
this.dw_3=create dw_3
this.gr_2=create gr_2
this.dw_avisos_pendientes=create dw_avisos_pendientes
this.dw_4=create dw_4
this.Control[]={this.cb_imprimir2,&
this.cbx_centro_cmd_pend,&
this.st_centro_dur,&
this.u_amb_dur,&
this.cbx_4,&
this.dw_usuario_dur,&
this.cbx_2,&
this.pb_5,&
this.pb_3,&
this.cb_buscar2,&
this.dw_tipo_pend,&
this.st_2,&
this.p_avanzar,&
this.p_retroceder,&
this.st_3,&
this.gb_1,&
this.dw_3,&
this.gr_2,&
this.dw_avisos_pendientes,&
this.dw_4}
end on

on avisos_pendientes.destroy
destroy(this.cb_imprimir2)
destroy(this.cbx_centro_cmd_pend)
destroy(this.st_centro_dur)
destroy(this.u_amb_dur)
destroy(this.cbx_4)
destroy(this.dw_usuario_dur)
destroy(this.cbx_2)
destroy(this.pb_5)
destroy(this.pb_3)
destroy(this.cb_buscar2)
destroy(this.dw_tipo_pend)
destroy(this.st_2)
destroy(this.p_avanzar)
destroy(this.p_retroceder)
destroy(this.st_3)
destroy(this.gb_1)
destroy(this.dw_3)
destroy(this.gr_2)
destroy(this.dw_avisos_pendientes)
destroy(this.dw_4)
end on

type cb_imprimir2 from commandbutton within avisos_pendientes
integer x = 2359
integer y = 1412
integer width = 411
integer height = 96
integer taborder = 14
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_situacion
string ls_titulo
long ll_longitud

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Estadistica de Avisos Pendientes'
ll_longitud = len (ls_titulo)*100
IF gr_2.visible = false then
	dw_4.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_4.modify("titulo_t.Text = '" + ls_titulo + "'")
	
	dw_4.getchild ("d_pendientes",dwc_situacion)
	dw_avisos_pendientes.sharedata(dwc_situacion)
	lst_impresion.pa_todos[1]=dw_avisos_pendientes
	lst_impresion.pa_nombres[1]='d_pendientes'
	
	lst_impresion.total = 1
	IF dw_avisos_pendientes.RowCount() = 0 THEN
		gnv_msg.f_mensaje("IA01","","",OK!)
		return
	END IF
	dw_4.SetTransObject(SQLCA)
	lst_impresion.grafica = false
	lst_impresion.pdw_compuesto = dw_4
else
	dw_3.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
	dw_3.modify("titulo_t.Text = '" + ls_titulo + "'")
	
	dw_3.getchild ("d_pendientes_graf",dwc_situacion)
	dw_avisos_pendientes.sharedata(dwc_situacion)
	lst_impresion.pa_todos[1]=dw_avisos_pendientes
	lst_impresion.pa_nombres[1]='d_pendientes_graf'
	
	lst_impresion.total = 1
	IF dw_avisos_pendientes.RowCount() = 0 THEN
		gnv_msg.f_mensaje("IA01","","",OK!)
		return
	END IF
	dw_3.SetTransObject(SQLCA)
	
	lst_impresion.pdw_compuesto = dw_3
	lst_impresion.grafica = true

end if
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)
lst_impresion.pdw_compuesto.ShareDataOff()
IF gr_2.visible = false then
	dw_4.ShareDataOff()		
else
	gr_2.ShareDataOff()	
end if


end event

type cbx_centro_cmd_pend from checkbox within avisos_pendientes
integer x = 23
integer y = 24
integer width = 974
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Estad$$HEX1$$ed00$$ENDHEX$$stica por CMD."
end type

event clicked;cb_buscar2.triggerEvent(clicked!)
end event

type st_centro_dur from statictext within avisos_pendientes
boolean visible = false
integer x = 2734
integer y = 112
integer width = 654
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 81324524
boolean enabled = false
string text = "<Todos>"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type u_amb_dur from u_2030_ambito_estadisticas within avisos_pendientes
event constructor pbm_constructor
event destroy ( )
boolean visible = false
integer x = 1143
integer y = 484
integer taborder = 3
boolean bringtotop = true
borderstyle borderstyle = styleraised!
end type

event constructor;// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
u_amb_dur.dw_ambito.reset()
u_amb_dur.dw_ambito.show()
u_amb_dur.dw_ambito.f_insertar_fila()

//Conecto las DDDW del objeto "ambito"
// filtro todos sus campos y seteo a los mismos con todos

u_amb_dur.dw_ambito.fpr_crea_dddw()
u_amb_dur.dw_ambito.fnu_filtro_centro()
u_amb_dur.dw_ambito.setitem(1,"nro_centro",fgci_todos)
u_amb_dur.dw_ambito.fpr_filtro_cmd()
u_amb_dur.dw_ambito.setitem(1,"nro_cmd",fgci_todos)
u_amb_dur.dw_ambito.fpr_filtro_mesa()
u_amb_dur.dw_ambito.setitem(1,"nro_mesa",fgci_todos)

u_amb_dur.dw_ambito.setcolumn("nro_centro")

end event

on u_amb_dur.destroy
call u_2030_ambito_estadisticas::destroy
end on

type cbx_4 from checkbox within avisos_pendientes
event clicked pbm_bnclicked
integer x = 2135
integer y = 120
integer width = 818
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "  Selec. Ambito"
boolean automatic = false
end type

event clicked;ib_cb_buscar_dur=cb_buscar2.enabled
ib_p_avanza_dur=p_avanzar.enabled
ib_p_retrocede_dur=p_retroceder.enabled
ib_cbx_4_dur=cbx_4.enabled
ib_pb_3_dur=pb_3.enabled
ib_pb_5_dur=pb_5.enabled
ib_cbx_2=cbx_2.enabled
ib_dw_usuario_dur=dw_usuario_dur.enabled
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//dw_tipo_pend.modify("tipo_aviso.background.color=" + string(65536*192+256*192+192))
dw_tipo_pend.modify("tipo_aviso.background.color=" + gs_gris)
// Fin. Sgo.
//dw_tipo_pend.SetTabOrder("tipo_aviso",0)
dw_tipo_pend.enabled = False
is_color_dw_usuario_dur = dw_usuario_dur.describe("usuario.background.color")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//dw_usuario_dur.modify("usuario.background.color=" + string(65536*192+256*192+192))
dw_usuario_dur.modify("usuario.background.color=" + gs_gris)
// Fin. Sgo.
ib_ambito_abierto_dur=true
u_amb_dur.visible=true
cb_buscar2.enabled=false
p_avanzar.enabled=false
p_retroceder.enabled=false
cbx_4.enabled=false
pb_3.enabled=false
pb_5.enabled=false
cbx_2.enabled=false
cbx_centro_cmd_pend.enabled=false
dw_usuario_dur.enabled=false
//this.checked=true   // comentado LFE
u_amb_dur.is_ventana = "Avisos_por_duracion"

if avisos_pendientes.cbx_centro_cmd_pend.checked=false then
	u_amb_dur.dw_ambito.fnu_deshab_puesto(u_amb_dur.dw_ambito)
	u_amb_dur.dw_ambito.fnu_deshab_cmd(u_amb_dur.dw_ambito)
else
	u_amb_dur.dw_ambito.fnu_deshab_puesto(u_amb_dur.dw_ambito)
	u_amb_dur.dw_ambito.fnu_deshab_centro(u_amb_dur.dw_ambito)
end if


end event

type dw_usuario_dur from datawindow within avisos_pendientes
integer x = 2208
integer y = 24
integer width = 782
integer height = 92
integer taborder = 3
boolean enabled = false
string dataobject = "dddw_usuarios"
boolean border = false
boolean livescroll = true
end type

type cbx_2 from checkbox within avisos_pendientes
event clicked pbm_bnclicked
integer x = 2121
integer y = 28
integer width = 73
integer height = 76
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean lefttext = true
end type

event clicked;if this.checked=true then
	dw_usuario_dur.enabled=true
	dw_usuario_dur.object.usuario[1]=gs_usuario
	dw_usuario_dur.object.usuario.background.color=gs_blanco
else
	dw_usuario_dur.enabled=false
	dw_usuario_dur.object.usuario[1]=""
	dw_usuario_dur.object.usuario.background.color=gs_gris
end if
end event

type pb_5 from picturebutton within avisos_pendientes
event clicked pbm_bnclicked
boolean visible = false
integer x = 2967
integer y = 1400
integer width = 142
integer height = 124
integer taborder = 6
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "lupa3.bmp"
alignment htextalign = left!
end type

event clicked;w_2030_estadisticas.tab_1.avisos_pendientes.setredraw(false)
if ib_zoom=false then
	gr_2.width=3411
	gr_2.height=1352
	gr_2.x=20
	gr_2.y=15
	ib_zoom=true
 	pb_5.picturename="lupades.bmp"
	pb_5.enabled=true
	yield()
else 
	gr_2.width=3355
	gr_2.height=1128
	gr_2.x=41
	gr_2.y=224
	ib_zoom=false
 	pb_5.picturename="lupa3.bmp"
	pb_5.enabled=true
	yield()
end if
w_2030_estadisticas.tab_1.avisos_pendientes.setredraw(true)


end event

type pb_3 from picturebutton within avisos_pendientes
event clicked pbm_bnclicked
integer x = 3127
integer y = 1392
integer width = 160
integer height = 128
integer taborder = 4
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = " "
string picturename = "grafico.bmp"
string disabledname = "graf_dis.bmp"
alignment htextalign = left!
end type

event clicked;yield()
IF GR_2.VISIBLE=tRUE THEN
	f_habilito_campos_pend( in_nro_nivel_AVIS_PEND) //DBE 26/01/2000
	
	PARENT.SETREDRAW(FALSE)
	this.picturename="grafico.bmp"
	gr_2.visible=False
	dw_avisos_pendientes.visible=True
	pb_5.visible=false
	gr_2.width=3355
	gr_2.height=1128
	gr_2.x=41
	gr_2.y=224
	ib_zoom=false
 	pb_5.picturename="lupa3.bmp"
 	cb_buscar2.enabled = true
	 cbx_centro_cmd_pend.enabled = True
	 PARENT.SETREDRAW(TRUE)
ELSE
	
//	p_retroceder.enabled = False//DBE 26/01/2000
//	p_avanzar.enabled = false//DBE 26/01/2000

	PARENT.SETREDRAW(FALSE)
	this.picturename="dw.bmp"
	dw_avisos_pendientes.Hide()
	gr_2.Show()
	gr_2.width=3355
	gr_2.height=1128
	gr_2.x=41
	gr_2.y=224
	pb_5.visible=true
	cb_buscar2.enabled = false
	cbx_centro_cmd_pend.enabled = false
	PARENT.SETREDRAW(TRUE)
END IF

end event

type cb_buscar2 from u_cb within avisos_pendientes
event clicked pbm_bnclicked
integer x = 197
integer y = 1412
integer width = 411
integer height = 96
integer taborder = 4
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Buscar"
boolean default = true
end type

event clicked;call super::clicked;dw_avisos_pendientes.triggerevent("ue_primera_vez")
//in_nro_nivel_AVIS_PEND=0
w_2030_estadisticas.tab_1.f_habilito_campos_PEND(in_nro_nivel_AVIS_PEND)
IF dw_avisos_pendientes.rowcount()>0 THEN
	IF dw_avisos_pendientes.GetItemDecimal(1,"tot_int") > 0 THEN
		pb_3.enabled = True
	ELSE
		pb_3.enabled = False
	END IF
ELSE
	pb_3.enabled=FALSE
	p_avanzar.enabled=false
	p_retroceder.enabled=false
	gnv_msg.f_mensaje("IA01","","",OK!)
END IF
	pb_5.visible=false
	gr_2.width=2702
	gr_2.height=729
	gr_2.x=46
	gr_2.y=205
	ib_zoom=false
 	pb_5.picturename="lupa3.bmp"
end event

event getfocus;call super::getfocus;//
end event

type dw_tipo_pend from datawindow within avisos_pendientes
integer x = 14
integer y = 104
integer width = 2030
integer height = 92
integer taborder = 3
string dataobject = "d_est_filtro_aviso"
boolean border = false
boolean livescroll = true
end type

event itemchanged;String ls_columna

ACCEPTTEXT()
ls_columna=this.getcolumnname()

// Si el tipo de aviso es normal o de calidad se habilita la lista de alimentaci$$HEX1$$f300$$ENDHEX$$n,
// en caso contrario se deshabilita
IF ls_columna = "tipo_aviso" THEN
	//SMB 03/10/2007 abierto para normal = 1 y calidad = 4. Al cambiar el
	//combo para que cargue la tabla pasa a ser normal = 0 y calidad = 3
	//IF This.getitemnumber(1,1) = 1 OR This.getitemnumber(1,1) = 4 THEN
	IF This.getitemnumber(1,1) = 0 OR This.getitemnumber(1,1) = 3 THEN		
		this.object.tipo_alim.protect=0
		this.object.tipo_alim.background.color=gs_blanco
	ELSE	
		This.setitem(1,2,0)
		this.object.tipo_alim.protect=1
		this.object.tipo_alim.background.color=gs_gris
	END IF
END IF
end event

type st_2 from statictext within avisos_pendientes
integer x = 1751
integer y = 1424
integer width = 425
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Siguiente"
boolean focusrectangle = false
end type

type p_avanzar from picturebutton within avisos_pendientes
event clicked pbm_bnclicked
integer x = 1573
integer y = 1404
integer width = 137
integer height = 108
integer taborder = 4
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "avanzar.bmp"
string disabledname = "avan_1.bmp"
end type

event clicked;//IF in_nro_nivel_AVIS_PEND = 0 THEN
//	dw_avisos_pendientes.triggerevent("ue_primera_vez")
//ELSE
	dw_avisos_pendientes.triggerevent("ue_avan_nivel")
//END IF

// PR095   INC. 30
//IF dw_avisos_pendientes.rowcount()>0 THEN
//	IF dw_avisos_pendientes.GetItemDecimal(1,"tot_int") > 0 THEN
//		pb_3.enabled = True
//	ELSE
//		pb_3.enabled = False
//	END IF
//ELSE
//	pb_3.enabled=FALSE
//END IF
//
end event

type p_retroceder from picturebutton within avisos_pendientes
event clicked pbm_bnclicked
integer x = 1198
integer y = 1404
integer width = 137
integer height = 108
integer taborder = 3
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "retroced.bmp"
string disabledname = "retro_1.bmp"
end type

event clicked;
int ln_nro_centro, li_tip_centro
string ls_tit
string ls_centro

IF in_nro_nivel_AVIS_PEND = 3 THEN
	ln_nro_centro = in_padre2_AVIS_PEND
ELSEIF in_nro_nivel_AVIS_PEND = 2 THEN
	ln_nro_centro = in_padre1_AVIS_PEND
ELSEIF in_nro_nivel_AVIS_PEND = 1 THEN
	ln_nro_centro = fg_padre_centros
END IF

	if cbx_centro_cmd_pend.checked = true then
		li_tip_centro = 2
	else
		li_tip_centro = 1
	end if


//DBE ini 24/01/2000
if il_nro_centro_dur + il_nro_cmd_dur + il_nro_mesa_dur > 0 then
	choose case li_tip_centro
		case 1 //centro
			ls_centro = string(il_nro_centro_dur)
		case 2 //cmd
			ls_centro = string(il_nro_cmd_dur)
	end choose
else
	ls_centro = '%'
end if	
//DBE fin 24/01/2000



SETPOINTER(HOURGLASS!)
dw_avisos_pendientes.fnu_despliego_datos &
(dw_avisos_pendientes,ln_nro_centro,is_usuario,li_tip_centro,&
il_clase_aviso,il_todos_ambitos,ls_centro,li_tip_centro)
//w_2030_estadisticas.tab_1.f_graficar_pend(2,13,1,dw_avisos_pendientes.rowcount())
//gr_2.retrieve(ln_nro_centro,is_usuario) ///DBE 26/01/2000
if gr_2.visible = false then
	gr_2.reset()
	dw_avisos_pendientes.RowsCopy &
		(1, dw_avisos_pendientes.RowCount(), Primary!, gr_2, 1, Primary!)//DBE 26/01/2000
else
	gr_2.setredraw(false)
	gr_2.visible = false
	gr_2.reset()
	dw_avisos_pendientes.RowsCopy &
		(1, dw_avisos_pendientes.RowCount(), Primary!, gr_2, 1, Primary!)//DBE 26/01/2000
	gr_2.visible = true
	gr_2.setredraw(true)
end if

IF dw_avisos_pendientes.RowCount()>0 THEN
	dw_avisos_pendientes.SelectRow(in_fila_ant_AVIS_PEND,False)    //elimino la marcar anterior
	dw_avisos_pendientes.SelectRow(1,True)  // marco el seleccionado
	in_fila_ant_AVIS_PEND = 1
	pb_3.enabled=true
END IF
SETPOINTER(ARROW!)
in_nro_nivel_AVIS_PEND = in_nro_nivel_AVIS_PEND -1
ls_tit =w_2030_estadisticas.tab_1.f_nombre_nivel_pend(in_nro_nivel_AVIS_PEND)
w_2030_estadisticas.tab_1.f_habilito_campos_PEND(in_nro_nivel_AVIS_PEND)

end event

type st_3 from statictext within avisos_pendientes
integer x = 736
integer y = 1420
integer width = 425
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 81324524
boolean enabled = false
string text = "Anterior"
alignment alignment = right!
boolean focusrectangle = false
end type

type gb_1 from groupbox within avisos_pendientes
integer x = 5
integer y = 1336
integer width = 3360
integer height = 212
integer taborder = 3
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_3 from datawindow within avisos_pendientes
boolean visible = false
integer x = 2176
integer y = 272
integer width = 1189
integer height = 904
integer taborder = 23
string dataobject = "d_estadisticas_pendienes_graf_impr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gr_2 from datawindow within avisos_pendientes
boolean visible = false
integer x = 1627
integer y = 208
integer width = 1765
integer height = 1144
integer taborder = 4
string dataobject = "d_avi_2032_graf_avisos_pend"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_avisos_pendientes from u_avi_2032_pr_esta_avisos_pend within avisos_pendientes
event clicked pbm_dwnlbuttonclk
event doubleclicked pbm_dwnlbuttondblclk
event ue_primera_vez pbm_custom72
event ue_avan_nivel pbm_custom73
integer y = 208
integer width = 3424
integer height = 1120
integer taborder = 2
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event clicked;call super::clicked;iF row > 0 THEN
	this.SelectRow(0,False)    //elimino la marca anterior
	this.SelectRow(row,True)  // marco el seleccionado
	in_fila_ant_AVIS_PEND=row
END IF
end event

event doubleclicked;IF dw_avisos_pendientes.Rowcount() > 0 THEN
	dw_avisos_pendientes.Triggerevent("ue_avan_nivel")
END IF
end event

event ue_primera_vez;///////////////////////////////////////////////////////////////////////
//
// Evento: ue_primera_vez
// 
// Objetivo: Lo que hace es llamar a funciones para que cargue la tabla
// 			est_aviso para poder realizar la consulta
// 			Esto se hace cada vez que cambian la fecha
//					
// 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	11/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
// 21/01/2000  DBE         Modificaci$$HEX1$$f300$$ENDHEX$$n
///////////////////////////////////////////////////////////////////

String ls_tit
String ls_fecha,ls_fecha_actual,ls_mensaje,ls_mensaje1,ls_zona_cmd,ls_zona_cmd_msg
boolean lb_generar
DateTime ldt_f_actual
int li_ampliacion,li_centros[],li_contador,li_tipos[],li_bucle,li_estado_est
long ll_select
long ll_centro //DBE 19/01/2000
string ls_centro
int li_gener
int il_tipo_aviso

DateTime ldt_f_estadistica
int li_count, li_repite, li_start
Date ldt_fecha
parent.setredraw(false)

yield()
SETPOINTER(HOURGLASS!)

if cbx_centro_cmd_pend.checked=false then
	li_estado_est=1
	ls_zona_cmd= "ZONA"
	ls_zona_cmd_msg= "la ZONA"
else
	li_estado_est=2

	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	04/05/2001  	ls_zona_cmd="CMD"
	//**  OSGI 2001.1  	04/05/2001  	ls_zona_cmd_msg= "el CMD"

	ls_zona_cmd=is_cmd_text
	ls_zona_cmd_msg= "el " + is_cmd_text
	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
end if

//DECLARE OBTE2031 PROCEDURE FOR OBTENGO_DATOS_2031(:ldt_fecha,:gs_usuario);
//EXECUTE OBTE2031;

//w_2030_estadisticas.tab_1.f_datos_prueba(ldt_fecha1)

// Anteriormente ejecutaba este PLSQL, al realizar las pruebas de 
// volumen se comprob$$HEX2$$f3002000$$ENDHEX$$que no se pueden asumir sus tiempos y se ha
// cambiado la manera de generar la estad$$HEX1$$ed00$$ENDHEX$$stica.


dw_usuario_dur.accepttext()

is_usuario=dw_usuario_dur.object.usuario[1]

//il_clase_aviso = avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_aviso')//DBE 19/01/2000

// Aqu$$HEX2$$ed002000$$ENDHEX$$es donde se fija la clase de los avisos para los que se quiere generar la estad$$HEX1$$ed00$$ENDHEX$$stica
// Este campo estar$$HEX2$$e1002000$$ENDHEX$$formado por un n$$HEX1$$fa00$$ENDHEX$$mero de 2 d$$HEX1$$ed00$$ENDHEX$$gitos: el primero de ellos representa el
// tipo del aviso, y el segundo representa la alimentaci$$HEX1$$f300$$ENDHEX$$n
if integer(string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_aviso'))) = 101 then
	il_tipo_aviso = 0
else
	il_tipo_aviso = integer(string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_aviso'))) + 1	
end if

il_clase_aviso = integer(string (il_tipo_aviso) + string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_alim'))) 	

//il_clase_aviso = integer(string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_aviso')) + &
//							    string(avisos_pendientes.dw_tipo_pend.getitemnumber(1,'tipo_alim'))) 


//DBE ini 19/01/2000
ldt_f_estadistica=datetime(date(fgnu_fecha_actual()))


if is_usuario ="" or isnull(is_usuario) then
	is_usuario = "TODOS"
end if



if (il_nro_centro_dur + il_nro_cmd_dur + il_nro_mesa_dur)>0 then

	if il_nro_cmd_dur>=0 and il_nro_mesa_dur>0 then
		li_start=2
		li_repite=0
		ll_centro=il_nro_mesa_dur
	elseif il_nro_mesa_dur=0 and il_nro_cmd_dur>=0 then
		li_start=1
		li_repite=0
		choose case li_estado_est
			case 1
		ll_centro=il_nro_centro_dur
	      case 2
		ll_centro=il_nro_cmd_dur
      end choose
	end if

	
	
	for li_count=li_start to li_repite step -1
		select max(f_actual) into :ldt_f_actual
		from GI_EST_AVISO 
		WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2
		and f_estadistica=:ldt_f_estadistica
		and tipo_reg=:li_estado_est
		and nro_centro =:ll_centro
		and todos_ambitos = :li_count
		and clase_aviso = :il_clase_aviso;
		
		if year(date(ldt_f_actual))>1900 then
			il_todos_ambitos=li_count
			exit
		end if
	
	next


else
	il_todos_ambitos=0
	select max(f_actual) into :ldt_f_actual
	from GI_EST_AVISO 
	WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2 
	and f_estadistica=:ldt_f_estadistica
	and tipo_reg=:li_estado_est
	and todos_ambitos = 0
	and clase_aviso = :il_clase_aviso;
end if

ls_mensaje= "Existe una estad$$HEX1$$ed00$$ENDHEX$$stica generada el " +string(ldt_f_actual)+"~n que se ajusta para este criterio de seleccion:"


if is_usuario = "TODOS" then
else
	ls_mensaje=	ls_mensaje +"~n, el usuario " + is_usuario
end if

if  il_nro_mesa_dur > 0 then 
	ls_mensaje=	ls_mensaje +"~n, Sector " + avisos_pendientes.st_centro_dur.Text
elseif il_nro_cmd_dur > 0 then
	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
	//**  OSGI 2001.1  	04/05/2001  	ls_mensaje=	ls_mensaje +"~n, CMD " + avisos_pendientes.st_centro_dur.Text
	
	ls_mensaje=	ls_mensaje +"~n, " + is_cmd_text + " " + avisos_pendientes.st_centro_dur.Text
	//***************************************
	//**  OSGI 2001.1  	04/05/2001			**
	//**  Jair Padilla / Soluziona PANAMA  **
	//***************************************
elseif il_nro_centro_dur > 0 then 
	ls_mensaje=	ls_mensaje +"~n, Zona " + avisos_pendientes.st_centro_dur.Text
end if 


if il_clase_aviso>0 then
	ls_mensaje=	ls_mensaje +"~n, clase aviso " +&
	left( &
			avisos_pendientes.dw_tipo_pend.getvalue('tipo_aviso',il_clase_aviso + 1), &
			len(avisos_pendientes.dw_tipo_pend.getvalue('tipo_aviso',il_clase_aviso + 1)) - 1) 
end if

// DSA INI 7/08/2000
//ls_mensaje=ls_mensaje+ &
//".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."

// si encuentra una estad$$HEX1$$ed00$$ENDHEX$$stica anterior, pregunta al usuario si desea con-
// servar esta o generar una nueva.
if not isnull(ldt_f_actual) and  year(date(ldt_f_actual))>1900  then	
	// DSA INI 7/08/2000 Si no tiene el pergil mostrar lo que existe
	//li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)
	if gu_perfiles.of_acceso_perfil(gi_perfil,'EAV_GENERAL','ACC_MANTEN') =1 THEN	
		ls_mensaje=ls_mensaje+ &
			".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."
		li_gener=gnv_msg.f_mensaje("AA18",ls_mensaje,"",OkCancel!)
	else
		gnv_msg.f_mensaje("AA18",ls_mensaje,"",Ok!)
		li_gener = 1
	end if
	// DSA FIN 7/08/2000
	
	choose case li_gener		
		case  1 
			//$$HEX1$$bf00$$ENDHEX$$Todavia existe?
			if (il_nro_centro + il_nro_cmd + il_nro_mesa)>0 then			
	
				select max(f_actual) into :ldt_f_actual
				from GI_EST_AVISO 
				WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2
				and f_estadistica=:ldt_f_estadistica
				and tipo_reg=:li_estado_est
				and nro_centro =:ll_centro
				and todos_ambitos = :il_todos_ambitos
				and clase_aviso = :il_clase_aviso;

			else
	
				select max(f_actual) into :ldt_f_actual
				from GI_EST_AVISO 
				WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2 
				and f_estadistica=:ldt_f_estadistica
				and tipo_reg=:li_estado_est
				and todos_ambitos = :il_todos_ambitos
				and clase_aviso = :il_clase_aviso;
				
			end if
			
			if not isnull(ldt_f_actual) and  year(date(ldt_f_actual))>1900  then
				lb_generar=false
      	else
      		lb_generar=true
		   end if
			
		case 2
			lb_generar=true
	end choose
else
	// DSA INI 7/08/2000	Si no tiene el perfil mostrar lo que existe
	//lb_generar=true
	if gu_perfiles.of_acceso_perfil(gi_perfil,'EAV_GENERAL','ACC_MANTEN') =1 THEN		
		lb_generar=true
	else
		lb_generar=false
	end if		
	// DSA FIN 7/08/2000
end if


//DBE fin 19/01/2000


////////DBE ini comentado 21/01/2000
//if is_usuario ="" or isnull(is_usuario) then
//	is_usuario = "TODOS"
//	select distinct(to_char(f_actual,'DD/MM/YY')) 
//	into :ls_fecha_actual 
//	from GI_EST_AVISO 
//	WHERE TIPO_DE_CONSULTA=2 
//	and usuario_est='TODOS'
//	AND TIPO_REG = :li_estado_est; 
//else
//	select distinct(to_char(f_actual,'DD/MM/YY'))
//	into :ls_fecha_actual 
//	from GI_EST_AVISO 
//	WHERE USUARIO_EST=:is_usuario 
//	AND TIPO_DE_CONSULTA=2
//	AND TIPO_REG = :li_estado_est; 
//end if
//
//// si encuentra una estad$$HEX1$$ed00$$ENDHEX$$stica anterior, pregunta al usuario si desea con-
//// servar esta o generar una nueva.
//
//ls_mensaje= "Existe una estad$$HEX1$$ed00$$ENDHEX$$stica generada por " + ls_zona_cmd +", para el d$$HEX1$$ed00$$ENDHEX$$a " + ls_fecha_actual + &
//					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."
//
//ls_mensaje1= "Existe una estad$$HEX1$$ed00$$ENDHEX$$stica por " + ls_zona_cmd + " para el usuario " + is_usuario + "del d$$HEX1$$ed00$$ENDHEX$$a " + ls_fecha_actual + &
//					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva."				
//
//if sqlca.sqlcode <> 100 and sqlca.sqlcode <> -1 then
//	if is_usuario = "TODOS" then
//		if gnv_msg.f_mensaje("AA18",ls_mensaje,"",okcancel!)=2  then
//	//		messagebox("Aviso","Existe una estad$$HEX1$$ed00$$ENDHEX$$stica del d$$HEX1$$ed00$$ENDHEX$$a " + ls_fecha_actual + &
////					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva.",information!,okcancel!)=2 then
//			lb_generar=true
//		end if
//	else
//		if  gnv_msg.f_mensaje("AA18",ls_mensaje1,"",okcancel!)=2  then
////			messagebox("Aviso","Existe una estad$$HEX1$$ed00$$ENDHEX$$stica para el usuario " + is_usuario + "del d$$HEX1$$ed00$$ENDHEX$$a " + ls_fecha_actual + &
////					  ".~n~n- Pulse 'Aceptar' si desea visualizar esta.~n~n- Pulse 'Cancelar' si desea generar una nueva.",information!,okcancel!)=2 then
//			lb_generar=true
//		end if
//	end if
//else
//	lb_generar=true
//end if
//
//
////DBE fin comentado 21/01/2000


if lb_generar=true then
	ldt_f_actual=fgnu_fecha_actual()
	li_ampliacion=0
	OPEN(W_BARRA)
	W_BARRA.uo_barra.barra.f_resetea_barra()
	W_BARRA.UO_BARRA.gb_1.text="Buscando Zonas Asociadas"
	W_BARRA.UO_BARRA.BARRA.visible=true
	W_BARRA.uo_barra.barra.f_amplia(li_ampliacion)
	
//	DELETE GI_EST_AVISO WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2; //DBE 21/01/2000
	
	if (il_nro_centro_dur + il_nro_cmd_dur + il_nro_mesa_dur)>0 then
	   choose case li_estado_est
   	   case 1
      	   ll_centro=il_nro_centro_dur
         case 2
            ll_centro=il_nro_cmd_dur
     	end choose
    	
		if il_nro_cmd_dur>=0 and il_nro_mesa_dur>0 then
	   	il_todos_ambitos=2
							
	      DELETE GI_EST_AVISO 
	      WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2 
	      	and tipo_reg=:li_estado_est
	       	and (nro_centro in (:il_nro_centro , :il_nro_cmd , :il_nro_mesa)
				or nro_centro in (
                       select SGD_RELACION_CENTRO.CENTRO_DEPEN
                         from SGD_RELACION_CENTRO where 
                              SGD_RELACION_CENTRO.CENTRO_RESP = :ll_centro and 
                              SGD_RELACION_CENTRO.TIP_CENTRO =:li_estado_est and 
                              SGD_RELACION_CENTRO.CENTRO_RESP not in (98,99)))
	         and todos_ambitos = :il_todos_ambitos
	         and clase_aviso = :il_clase_aviso;

	  	elseif il_nro_mesa_dur=0 and il_nro_cmd_dur>=0 then
            il_todos_ambitos=1

            DELETE GI_EST_AVISO 
	         WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2 
	               and tipo_reg=:li_estado_est
                  and  (nro_centro=:ll_centro or
	               nro_centro in (
                       select SGD_RELACION_CENTRO.CENTRO_DEPEN
                         from SGD_RELACION_CENTRO where 
                              SGD_RELACION_CENTRO.CENTRO_RESP = :ll_centro and 
                              SGD_RELACION_CENTRO.TIP_CENTRO =:li_estado_est and 
                              SGD_RELACION_CENTRO.CENTRO_RESP not in (98,99)))
	               and todos_ambitos = :il_todos_ambitos
	               and clase_aviso = :il_clase_aviso;
  
       end if
	            
	else
		il_todos_ambitos=0
		DELETE GI_EST_AVISO 
		WHERE USUARIO_EST=:is_usuario AND TIPO_DE_CONSULTA=2 
		and tipo_reg=:li_estado_est
		and todos_ambitos = :il_todos_ambitos
		and clase_aviso = :il_clase_aviso;
		
	end if
	
//DBE fin 19/01/2000	

	
	
	
	
	//commit;
//	gnu_u_transaction.uf_commit(PARENT) //DBE 04/02/2000
	
//	IF w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR=0 THEN
//		
//		w_2030_estadisticas.tab_1.Fnu_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,1,li_tipos[])
//		
//		ELSEIF w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR=0 THEN
//			
//			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR
//			li_tipos[1] = 1
//			li_contador=1
//			w_2030_estadisticas.tab_1.Fnu_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,2,li_tipos[])
//
//			ELSEIF w_2030_estadisticas.TAB_1.IL_NRO_MESA_DUR=0 THEN
//
//				li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR
//				li_tipos[1] = 1
//				li_centros[2] = w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR
//				li_tipos[2] = 2
//				li_contador=2
//				w_2030_estadisticas.tab_1.Fnu_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,3,li_tipos[])
//				
//	ELSE
//		li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR
//		li_tipos[1] = 1
//		li_centros[2] = w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR
//		li_tipos[2] = 2
//		li_centros[3] = w_2030_estadisticas.TAB_1.IL_NRO_MESA_DUR
//		li_tipos[3] = 3
//		LI_CONTADOR=3
//	END IF

	IF w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR=0 AND w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR=0 and avisos_pendientes.cbx_centro_cmd_pend.checked=false THEN
		
		FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,1,li_tipos[],1)
		
	ELSEIF (w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR<>0 or avisos_pendientes.cbx_centro_cmd_pend.checked=true) and w_2030_estadisticas.TAB_1.IL_NRO_MESA_DUR=0 THEN
		
		IF w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR<>0 THEN
			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR
			li_tipos[1] = 2
			LI_CONTADOR=1
			FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,3,li_tipos[],2)
		ELSE
			FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,2,li_tipos[],2)
		end if
		
	ELSEIF IL_NRO_MESA_DUR=0 THEN
	
		li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR
		li_tipos[1] = 1
		LI_CONTADOR=1
		FNU_BUSCO_CENTRO_CMD_PUESTO(li_centros[],li_contador,3,li_tipos[],1)
				
	ELSE
		if IL_NRO_CENTRO_DUR = 0 then
			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CMD_DUR
			li_tipos[1] = 2
		else
			li_centros[1] = w_2030_estadisticas.TAB_1.IL_NRO_CENTRO_DUR
			li_tipos[1] = 1
		end if
		
		li_centros[2] = w_2030_estadisticas.TAB_1.IL_NRO_MESA_DUR
		li_tipos[2] = 3
		LI_CONTADOR=2

	END IF	
	for li_bucle= 1 to li_contador
		
		if li_tipos[li_bucle]=1 then W_BARRA.UO_BARRA.gb_1.text="Datos para la Zona " + string(li_centros[li_bucle])

		//***************************************
		//**  OSGI 2001.1  	04/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************
		//**  OSGI 2001.1  	04/05/2001  		if li_tipos[li_bucle]=2 then W_BARRA.UO_BARRA.gb_1.text="Datos para el CMD " + string(li_centros[li_bucle])

		if li_tipos[li_bucle]=2 then W_BARRA.UO_BARRA.gb_1.text="Datos para el " + is_cmd_text + " " + string(li_centros[li_bucle])
		//***************************************
		//**  OSGI 2001.1  	04/05/2001			**
		//**  Jair Padilla / Soluziona PANAMA  **
		//***************************************

		if li_tipos[li_bucle]=3 then W_BARRA.UO_BARRA.gb_1.text="Datos para el Sector " + string(li_centros[li_bucle])

		li_ampliacion= truncate((li_bucle*100)/li_contador,0)
		
		W_BARRA.uo_barra.barra.f_amplia(li_ampliacion)
		
		w_2030_estadisticas.tab_1.fnu_calcula_estadistica_av_por_dur(ldt_f_actual,li_tipos[li_bucle],li_centros[li_bucle])
		
	next
	//DBE 04/02/2000 ini
	   gnu_u_transaction.uf_commit(PARENT) 
		IF SQLCA.SQLCODE <>0 THEN
//		MESSAGEBOX("Atencion","Error al intentar grabar")
		gnv_msg.f_mensaje("AA19","","",Ok!)
	   end if
	//DBE 04/02/2000 fin
	
end if


if isvalid(w_barra) then
	W_BARRA.uo_barra.barra.f_amplia(100)
	close(w_barra)
end if

//DBE ini 24/01/2000
if il_nro_centro_dur + il_nro_cmd_dur + il_nro_mesa_dur > 0 then
	choose case li_estado_est
		case 1 //centro
			ls_centro = string(il_nro_centro_dur)
		case 2 //cmd
			ls_centro = string(il_nro_cmd_dur)
	end choose
else
	ls_centro = '%'
end if	
//DBE fin 24/01/2000



//w_2030_estadisticas.tab_1.fnu_datos_prueba_pend() 
//if sqlca.sqlcode <> 0  and sqlca.sqlcode <> 100 then 
//	gnv_msg.f_mensaje("AI74"," "," ",OK!)
//	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La consulta no pudo ser ejecutada")
//	return 
//end if
dw_avisos_pendientes.fnu_despliego_datos &
(dw_avisos_pendientes,fg_padre_centros,is_usuario+"%",li_estado_est,&
il_clase_aviso,il_todos_ambitos,ls_centro,li_estado_est)
//w_2030_estadisticas.tab_1.f_graficar_pend(2,13,1,this.rowcount())

//w_2030_estadisticas.tab_1.avisos_pendientes.gr_2.retrieve(fg_padre_centros,is_usuario+"%")//DBE 26/01/2000 

gr_2.reset()
dw_avisos_pendientes.RowsCopy &
(1, dw_avisos_pendientes.RowCount(), Primary!, gr_2, 1, Primary!)//DBE 26/01/2000



SETPOINTER(ARROW!)
in_padre1_AVIS_PEND = 98
in_nro_nivel_AVIS_PEND = 1
IF dw_avisos_pendientes.rowcount()=0 THEN
	pb_3.enabled=false
	If in_prim_vez_AVIS_PEND>1 THEN
		gnv_msg.f_mensaje("AI23"," "," ",OK!)
	END IF
ELSE
	
	if il_nro_mesa_dur<>0 then
		
		select count(*) 
		into :ll_select 
		from gi_est_aviso
		where USUARIO_EST=:is_usuario AND
				TIPO_DE_CONSULTA=2 and
				nro_centro=:il_nro_mesa_dur 
				and clase_aviso = :il_clase_aviso //DBE 21/01/2000
				and todos_ambitos = :il_todos_ambitos //DBE 21/01/2000
				;
				
		if  ll_select=0 or isnull(ll_select)  then 		
//			Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Hay datos de " + ls_zona_cmd_msg + " especificado pero del Sector elegido no hay.")
			gnv_msg.f_mensaje("IA11",ls_zona_cmd_msg,"",Ok!)
		end if
		
	end if
	
	dw_avisos_pendientes.SelectRow(in_fila_ant_AVIS_PEND,False)    //elimino la marcar anterior
	dw_avisos_pendientes.SelectRow(1,True)  // marco el seleccionado
	in_fila_ant_AVIS_PEND = 1
	p_avanzar.enabled=true
END IF
ls_tit = w_2030_estadisticas.tab_1.f_nombre_nivel_pend(1)
parent.setredraw(true)
//w_2030_estadisticas.tab_1.f_graficar_pend(2,13,1,dw_avisos_pendientes.rowcount())

end event

event ue_avan_nivel;//////////////////////////////////////////////////////////////////////////////////////////////////
////
//// Evento: ue_avanzo_nivel
////// 
//// Objetivo: Carga los datos correspondiente al proximo nivel
////				 en caso de no encontrar datos despliega mensaje de error
////
////						
//// 
////  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//// ---------	-------		----------------------------------------
////	11/5/96		AAB			Versi$$HEX1$$f300$$ENDHEX$$n Original
////
//////////////////////////////////////////////////////

string ls_tit
int li_origen

IF in_nro_nivel_AVIS_PEND < 2 THEN
	IF dw_avisos_pendientes.Rowcount() > 0 THEN
		int ln_nro_centro
		IF in_fila_ant_AVIS_PEND > 0 THEN	 // Si tengo uno marcado
			IF NOT ISNULL(dw_avisos_pendientes.getitemnumber(in_fila_ant_AVIS_PEND,"NRO_CENTRO")) THEN
				ln_nro_centro = dw_avisos_pendientes.getitemnumber(in_fila_ant_AVIS_PEND,"NRO_CENTRO")
				SETPOINTER(HOURGLASS!)
				if cbx_centro_cmd_pend.checked = true then
					li_origen = 2
				else
					li_origen = 1
				end if
				dw_avisos_pendientes.fnu_despliego_datos &
				(dw_avisos_pendientes,ln_nro_centro,is_usuario,3,il_clase_aviso,il_todos_ambitos,'%',li_origen)
				
//				gr_2.retrieve(ln_nro_centro,is_usuario) //DBE 26/01/2000
				if gr_2.visible = false then
					gr_2.reset()
					dw_avisos_pendientes.RowsCopy &
						(1, dw_avisos_pendientes.RowCount(), Primary!, gr_2, 1, Primary!)//DBE 26/01/2000
				else
					gr_2.SetRedraw(false)
					gr_2.visible = false
					gr_2.reset()
					dw_avisos_pendientes.RowsCopy &
						(1, dw_avisos_pendientes.RowCount(), Primary!, gr_2, 1, Primary!)//DBE 26/01/2000
					gr_2.visible = true
					gr_2.SetRedraw(true)
				end if
				SETPOINTER(ARROW!)
				in_nro_nivel_AVIS_PEND = in_nro_nivel_AVIS_PEND + 1
				IF in_nro_nivel_AVIS_PEND = 2 THEN	
					in_padre2_AVIS_PEND = ln_nro_centro
				Else
					in_padre3_AVIS_PEND = ln_nro_centro
				END IF
				ls_tit = w_2030_estadisticas.tab_1.f_nombre_nivel_pend(in_nro_nivel_AVIS_PEND)
				w_2030_estadisticas.tab_1.f_graficar_pend(2,13,1,dw_avisos_pendientes.rowcount())
				w_2030_estadisticas.tab_1.f_habilito_campos_pend(in_nro_nivel_AVIS_PEND)
				IF dw_avisos_pendientes.RowCount()>0 THEN
					dw_avisos_pendientes.SelectRow(in_fila_ant_AVIS_PEND,False)    //elimino la marca anterior
					dw_avisos_pendientes.SelectRow(1,True)  // marco el seleccionado
					in_fila_ant_AVIS_PEND = 1
				END IF
			END IF
		END IF 
	END IF
Else
	gnv_msg.f_mensaje("AI22"," "," ",Ok!)
END IF

IF dw_avisos_pendientes.Rowcount() <= 0 THEN
	PARENT.SETREDRAW(TRUE)
	gnv_msg.f_mensaje("AI22"," "," ",Ok!)
	p_avanzar.enabled=false
end if

end event

type dw_4 from datawindow within avisos_pendientes
boolean visible = false
integer x = 128
integer y = 336
integer width = 1883
integer height = 840
integer taborder = 23
string dataobject = "d_estadisticas_pendienes_impr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


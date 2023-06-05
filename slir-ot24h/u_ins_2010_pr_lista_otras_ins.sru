HA$PBExportHeader$u_ins_2010_pr_lista_otras_ins.sru
forward
global type u_ins_2010_pr_lista_otras_ins from u_gen_0000_lista
end type
end forward

global type u_ins_2010_pr_lista_otras_ins from u_gen_0000_lista
int Width=2043
end type
global u_ins_2010_pr_lista_otras_ins u_ins_2010_pr_lista_otras_ins

type variables
w_2301_form_incidencia iw_contenedora
end variables

forward prototypes
public subroutine of_habilitar_fechas (long pl_row, ref datawindow pd_dw)
end prototypes

public subroutine of_habilitar_fechas (long pl_row, ref datawindow pd_dw);long ll_nro_inst_padre_int, ll_tipo_instalacion=0, ll_fila
String ls_fase_int, ls_fases_extras 

IF pl_row > 0 THEN
	ll_nro_inst_padre_int = This.GetItemNumber(pl_row, 'instalacion_padre_int')
	
	IF NOT gb_red_trifasica THEN
	
		pd_dw.object.f_reposicion.protect = 0
		pd_dw.object.f_reposicion.background.color = gs_blanco
		pd_dw.object.f_alta.protect = 0
		pd_dw.object.f_alta.background.color = gs_blanco
		pd_dw.object.f_reposicion_fase_a.protect = 0
		pd_dw.object.f_reposicion_fase_a.background.color = gs_blanco
		pd_dw.object.f_alta_fase_a.protect = 0
		pd_dw.object.f_alta_fase_a.background.color = gs_blanco
		pd_dw.object.f_reposicion_fase_b.protect = 0
		pd_dw.object.f_reposicion_fase_b.background.color = gs_blanco
		pd_dw.object.f_alta_fase_b.protect = 0
		pd_dw.object.f_alta_fase_b.background.color = gs_blanco
		pd_dw.object.f_reposicion_fase_c.protect = 0
		pd_dw.object.f_reposicion_fase_c.background.color = gs_blanco
		pd_dw.object.f_alta_fase_c.protect = 0
		pd_dw.object.f_alta_fase_c.background.color = gs_blanco
	
		IF pd_dw.Find("nro_instalacion=" + string(this.GetitemNumber(pl_row, 'nro_instalacion')) + &
						  " and IsNull(f_reposicion)", 1, pd_dw.rowCount()) > 0 THEN

			// Buscamos interrupciones activas en la fase A
			ll_fila = pd_dw.Find("nro_instalacion=" + string(ll_nro_inst_padre_int) + " and IsNull(f_reposicion_fase_a) and not IsNull(f_alta_fase_a) ", 1, pd_dw.RowCount())
			IF ll_fila > 0 THEN
				ls_fase_int = '1'
				ll_tipo_instalacion = pd_dw.GetItemNumber(ll_fila, 'tipo_instalacion')
			ELSE
				ls_fase_int = '0'
			END IF
			
			// Buscamos interrupciones activas en la fase B
			ll_fila = pd_dw.Find("nro_instalacion=" + string(ll_nro_inst_padre_int) + " and IsNull(f_reposicion_fase_b) and not IsNull(f_alta_fase_b) ", 1, pd_dw.RowCount())
			IF ll_fila > 0 THEN
				ls_fase_int += '1'
				IF ll_tipo_instalacion = 0 THEN ll_tipo_instalacion = pd_dw.GetItemNumber(ll_fila, 'tipo_instalacion')
			ELSE
				ls_fase_int += '0'
			END IF
		
			// Buscamos interrupciones activas en la fase C
			ll_fila = pd_dw.Find("nro_instalacion=" + string(ll_nro_inst_padre_int) + " and IsNull(f_reposicion_fase_c) and not IsNull(f_alta_fase_c) ", 1, pd_dw.RowCount())
			IF ll_fila > 0 THEN
				ls_fase_int += '1'
				IF ll_tipo_instalacion = 0 THEN ll_tipo_instalacion = pd_dw.GetItemNumber(ll_fila, 'tipo_instalacion')
			ELSE
				ls_fase_int += '0'
			END IF
		
			IF this.GetItemNumber(pl_row, 'tipo_instalacion') > fgci_tipo_ct AND ll_tipo_instalacion <= fgci_tipo_ct THEN
				ls_fases_extras = iw_contenedora.tab_1.tabpage_interrupciones.tv_1.of_det_perdida_ct(this.getitemnumber(pl_row,'nro_instalacion'),ls_fase_int, this.GetitemNumber(pl_row,'tipo_conexion') , this.GetitemNumber(pl_row,'tipo_ct')  )
			ELSE
				ls_fases_extras = ls_fase_int
			END IF
		ELSE
			ls_fases_extras = '111'
		END IF
		
		IF Mid(ls_fases_extras,1,1) = '1' THEN
			pd_dw.object.f_alta_fase_a.protect = 1
			pd_dw.object.f_alta_fase_a.background.color = gs_gris
			pd_dw.object.f_reposicion_fase_a.protect = 1
			pd_dw.object.f_reposicion_fase_a.background.color = gs_gris
		END IF
		IF Mid(ls_fases_extras,2,1) = '1' THEN
			pd_dw.object.f_alta_fase_b.protect = 1
			pd_dw.object.f_alta_fase_b.background.color = gs_gris
			pd_dw.object.f_reposicion_fase_b.protect = 1
			pd_dw.object.f_reposicion_fase_b.background.color = gs_gris
		END IF
		IF Mid(ls_fases_extras,3,1) = '1' THEN
			pd_dw.object.f_alta_fase_c.protect = 1
			pd_dw.object.f_alta_fase_c.background.color = gs_gris
			pd_dw.object.f_reposicion_fase_c.protect = 1
			pd_dw.object.f_reposicion_fase_c.background.color = gs_gris
		END IF
	ELSE
		IF pd_dw.Find("nro_instalacion=" + string(this.GetitemNumber(pl_row, 'nro_instalacion')) + &
						  " and IsNull(f_reposicion)", 1, pd_dw.rowCount()) > 0 THEN

			ll_fila = pd_dw.Find("nro_instalacion=" + string(ll_nro_inst_padre_int) + " and IsNull(f_reposicion) and not IsNull(f_alta) ", 1, pd_dw.RowCount())
			IF ll_fila > 0 THEN
				pd_dw.object.f_alta.protect = 1
				pd_dw.object.f_alta.background.color = gs_gris
				pd_dw.object.f_reposicion.protect = 1
				pd_dw.object.f_reposicion.background.color = gs_gris
			ELSE
				pd_dw.object.f_reposicion.protect = 0
				pd_dw.object.f_reposicion.background.color = gs_blanco
				pd_dw.object.f_alta.protect = 0
				pd_dw.object.f_alta.background.color = gs_blanco
			END IF
		ELSE
			IF ll_fila > 0 THEN
				pd_dw.object.f_alta.protect = 1
				pd_dw.object.f_alta.background.color = gs_gris
				pd_dw.object.f_reposicion.protect = 1
				pd_dw.object.f_reposicion.background.color = gs_gris
			END IF
		END IF

	END IF
END IF


end subroutine

event constructor;call super::constructor;gu_control_v_incidencias.of_recupera_padre(iw_contenedora,this,"w_2301_form_incidencia")
end event


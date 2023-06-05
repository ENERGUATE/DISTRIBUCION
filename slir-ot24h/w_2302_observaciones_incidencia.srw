HA$PBExportHeader$w_2302_observaciones_incidencia.srw
forward
global type w_2302_observaciones_incidencia from w_sgigenerica
end type
type d_obs from multilineedit within w_2302_observaciones_incidencia
end type
end forward

global type w_2302_observaciones_incidencia from w_sgigenerica
integer x = 480
integer y = 640
integer width = 2674
integer height = 1128
string title = "OPEN SGI - Observaciones."
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
event ue_grabar pbm_custom53
d_obs d_obs
end type
global w_2302_observaciones_incidencia w_2302_observaciones_incidencia

type variables
u_generico_comunicaciones lu_comunic
long il_nro_incidencia, il_fila
boolean ib_grabo_bien
String is_texto_orig
//HLA.INI.DEO14-00000214.30/06/2014
int il_codigo
//HLA.FIN.DEO14-00000214.30/06/2014
end variables

event ue_grabar;

UPDATE SGD_INCIDENCIA
SET OBSERVACION = :d_obs.text
WHERE NRO_INCIDENCIA = :il_nro_incidencia;

IF (SQLCA.SQLCODE <> 0) THEN
	ib_grabo_bien = false
ELSE
	ib_grabo_bien = true
END IF
end event

event open;call super::open;// Actualiza, consulta , observaciones de incidencia
//HLA.INI.DEO14-00000214.30/06/2014
il_codigo=Message.DoubleParm
//HLA.FIN.DEO14-00000214.30/06/2014
lu_comunic = create u_generico_comunicaciones

//lu_resetear =exit create u_generico_comunicaciones
// capturo valores en variable local de trabajo
	
lu_comunic.is_comunic = gu_comunic.is_comunic
il_nro_incidencia = lu_comunic.is_comunic.longval3
il_fila = lu_comunic.is_comunic.longval2

// Cargo informacion
d_obs.text = lu_comunic.is_comunic.strval1
IF isnull(d_obs.text) THEN
	d_obs.text = ""
END IF

is_texto_orig = d_obs.text

This.title = gu_comunic.f_titulo_ventana("w_2302","Observ.")
CHOOSE CASE lu_comunic.is_comunic.accion_llamada
	CASE "Consulta"
	d_obs.displayonly = True
	d_obs.pointer = "Arrow!"
	CASE "Actualizacion"
		d_obs.displayonly = False
		d_obs.enabled= true
END CHOOSE

end event

event close;call super::close;//HLA.INI.DEO14-00000214.30/06/2014
int li_est
string ls_tabla,ls_mensaje

ls_tabla="SGD_INCIDENCIA"
ls_mensaje=""
if isvalid(gu_rf_servidor_operacion) then
	li_est = gu_rf_servidor_operacion.of_control_bloqueos(ls_tabla,il_codigo,ls_mensaje,false)
end if
//HLA.FIN.DEO14-00000214.30/06/2014

lu_comunic.is_comunic.strval1 = d_obs.text
lu_comunic.is_comunic.programa_retorno = "w_2302_observaciones_incidencia"
fgnu_resetear_s_comunicaciones(gu_comunic)
gu_comunic.is_comunic = lu_comunic.is_comunic
destroy lu_comunic
end event

on w_2302_observaciones_incidencia.create
int iCurrent
call super::create
this.d_obs=create d_obs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_obs
end on

on w_2302_observaciones_incidencia.destroy
call super::destroy
destroy(this.d_obs)
end on

event closequery;call super::closequery;IF lu_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
	IF d_obs.text <> is_texto_orig THEN
		
		CHOOSE CASE gnv_msg.f_mensaje('CG001',"","",YesNoCancel!)
			CASE 1
		
				this.triggerevent("ue_grabar")
				IF ib_grabo_bien = false THEN
					messagebox("Error","Se ha producido un error al grabar")
					return
				END IF 
				gnu_u_transaction.uf_commit(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(il_nro_incidencia), fgci_bloqueo_incidencia, il_nro_incidencia)
				w_1234_consulta_incidencias.d_lista_aviso.SetItem (il_fila,'observacion',d_obs.text)
			CASE 2
				gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(il_nro_incidencia), fgci_bloqueo_incidencia, il_nro_incidencia)
				
			CASE 3, -1
				Message.returnvalue=1
		END CHOOSE
	ELSE
		gnu_u_transaction.uf_rollback(w_1234_consulta_incidencias,"SGD_INCIDENCIA","NRO_INCIDENCIA=" + string(il_nro_incidencia), fgci_bloqueo_incidencia, il_nro_incidencia)
	END IF
END IF
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2302_observaciones_incidencia
end type

type d_obs from multilineedit within w_2302_observaciones_incidencia
integer x = 55
integer y = 32
integer width = 2546
integer height = 932
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 16777215
boolean enabled = false
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
end type


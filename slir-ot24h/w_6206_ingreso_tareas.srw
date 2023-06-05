HA$PBExportHeader$w_6206_ingreso_tareas.srw
forward
global type w_6206_ingreso_tareas from w_sgigenerica
end type
type cb_aceptar from commandbutton within w_6206_ingreso_tareas
end type
type cb_cancelar from commandbutton within w_6206_ingreso_tareas
end type
type dw_ingreso_tareas from datawindow within w_6206_ingreso_tareas
end type
end forward

global type w_6206_ingreso_tareas from w_sgigenerica
integer x = 786
integer y = 764
integer width = 2098
integer height = 864
string title = "OPEN SGI - Ingreso de Tareas"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "brigadas.ico"
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
dw_ingreso_tareas dw_ingreso_tareas
end type
global w_6206_ingreso_tareas w_6206_ingreso_tareas

type variables
u_generico_comunicaciones lu_comunic

 u_bri_2019_nu_ingreso_tareas iu_bri_2019_nu
 u_bri_2019_pr_ingreso_tareas iu_bri_2019_pr
 u_bri_2018_nu_datos_brigada iu_bri_2018_nu

boolean ib_valido, ib_fecha
int ii_fila_seleccionada
string is_modstring
end variables

on w_6206_ingreso_tareas.create
int iCurrent
call super::create
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.dw_ingreso_tareas=create dw_ingreso_tareas
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_aceptar
this.Control[iCurrent+2]=this.cb_cancelar
this.Control[iCurrent+3]=this.dw_ingreso_tareas
end on

on w_6206_ingreso_tareas.destroy
call super::destroy
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.dw_ingreso_tareas)
end on

event open;call super::open;long ll_nro_ot
long ll_nro_brigada
// longval2 --> nro_ot
// longval3 --> nro_brigada
//Creo objetos de Trabajo
lu_comunic = CREATE u_generico_comunicaciones
iu_bri_2019_nu = CREATE u_bri_2019_nu_ingreso_tareas
iu_bri_2019_pr = CREATE u_bri_2019_pr_ingreso_tareas

 
//Recibo parametros de entrada
lu_comunic.is_comunic = gu_comunic.is_comunic
lu_comunic.is_comunic.accion_retorno="No refrescar"

//Inicializo objetos de trabajo
dw_ingreso_tareas.SetTransObject(SQLCA)
ib_valido = TRUE
cb_aceptar.enabled = True


IF  lu_comunic.is_comunic.accion_llamada = "alta" THEN
        This.title = lu_comunic.f_titulo_ventana ("w_6206","alta" )
        dw_ingreso_tareas.InsertRow(0)
        ll_nro_ot = iu_bri_2019_nu.fnu_actualiza_nro_ot()
        dw_ingreso_tareas.Setitem(1,"brigada_ot_nro_ot",ll_nro_ot)
        dw_ingreso_tareas.Setitem(1,"pi_estado",1)
        dw_ingreso_tareas.Setitem(1,"prioridad",1)
//      dw_ingreso_tareas.SetText(" ")
        iu_bri_2019_pr.fpr_limpiar_campos()
        lu_comunic.is_comunic.accion_retorno = "alta"
ELSE            
        This.title = lu_comunic.f_titulo_ventana ("w_6206", "consulta")
        iu_bri_2019_nu.fnu_obtener_datos(dw_ingreso_tareas,lu_comunic.is_comunic.longval2)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//        dw_ingreso_tareas.object.pi_estado.background.color= string(RGB(192,192,192))
//        dw_ingreso_tareas.object.nro_tarea.background.color= string(RGB(192,192,192))
//   dw_ingreso_tareas.object.fecha_generada.background.color= string(RGB(192,192,192))
        dw_ingreso_tareas.object.pi_estado.background.color = gs_gris
        dw_ingreso_tareas.object.nro_tarea.background.color = gs_gris
        dw_ingreso_tareas.object.fecha_generada.background.color = gs_gris
// Fin. Sgo.
        dw_ingreso_tareas.SetTabOrder("nro_tarea",0)
   dw_ingreso_tareas.SetTabOrder("pi_estado",0)
   dw_ingreso_tareas.SetTabOrder("fecha_generada",0)
        iu_bri_2019_pr.fpr_color_texto()
        if dw_ingreso_tareas.GetItemNumber(1,"pi_estado")<>1 then
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//                dw_ingreso_tareas.object.prioridad.background.color= string(RGB(192,192,192))    
                dw_ingreso_tareas.object.prioridad.background.color = gs_gris
// Fin. Sgo.
                dw_ingreso_tareas.SetTabOrder("prioridad",0)
        end if  

END IF



end event

event closequery;call super::closequery;fgnu_resetear_s_comunicaciones(gu_comunic)
gu_comunic.is_comunic = lu_comunic.is_comunic
end event

event close;call super::close;DESTROY iu_bri_2019_nu
DESTROY iu_bri_2019_pr
DESTROY  lu_comunic
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6206_ingreso_tareas
end type

type cb_aceptar from commandbutton within w_6206_ingreso_tareas
integer x = 192
integer y = 588
integer width = 411
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
end type

event clicked;dw_ingreso_tareas.AcceptText()
long ll_nro_tarea, ll_nro_ot, ll_estado, ll_nro_brigada
dateTime ld_null
setNull(ld_null)

yield()
date d_dia
d_dia = today()
IF ib_valido=false THEN
        ib_valido = True
        dw_ingreso_tareas.SetFocus()
        RETURN
END IF
IF lu_comunic.is_comunic.accion_llamada = "alta" THEN
        is_modstring = iu_bri_2019_nu.frn_validar_tarea(dw_ingreso_tareas," ")
        IF is_modstring <> "" THEN
//              messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n",is_modstring)
                is_modstring = ""
                dw_ingreso_tareas.SetFocus()
                RETURN
        END IF
END IF
ib_fecha = iu_bri_2019_nu.fnu_v_fechas_tareas(dw_ingreso_tareas)

if ib_fecha = false then
        dw_ingreso_tareas.SetFocus()
        dw_ingreso_tareas.SetItem(1,"fecha_resolucion",ld_null)
else 
//Retorno a la ventana de Ots y tareas
lu_comunic.is_comunic.programa_retorno = "w_6206_ingreso_tareas"
datetime ld_fecha
ld_fecha = fgcd_fecha_del_dia()
dw_ingreso_tareas.SetItem(1,"nro_brigada",lu_comunic.is_comunic.longval2)
dw_ingreso_tareas.SetItem(1,"usuario",gs_usuario)
dw_ingreso_tareas.SetItem(1,"f_actual",ld_fecha)
dw_ingreso_tareas.SetItem(1,"programa","w_6206")

dw_ingreso_tareas.Update()

ll_nro_ot = dw_ingreso_tareas.GetItemNumber(1,"brigada_ot_nro_ot")
ll_estado = dw_ingreso_tareas.GetItemNumber(1,"pi_estado")
ll_nro_brigada = dw_ingreso_tareas.GetItemNumber(1,"nro_brigada")

INSERT INTO "GI_OT"  
         ( "NRO_OT",   
           "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "EST_OT",   
           "DESCRIPCION",   
           "NRO_AVISO",   
           "NRO_INSTALACION",   
           "NRO_INCIDENCIA",   
           "F_DESDE",   
           "F_HASTA",   
           "H_DESDE",   
           "H_HASTA",   
           "F_ALTA",   
           "H_ALTA",   
           "ULT_BRIGADA",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA" )  
  VALUES ( :ll_nro_ot,   
           :gs_usuario,   
           :d_dia,   
           null,   
           'w_6206',   
           :ll_estado, 
           null,   
           0,   
           0,   
           0,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           :ll_nro_brigada,   
           :gi_nro_centro,   
           :gi_nro_cmd,
                          :gi_nro_puesto); 

gnu_u_transaction.uf_commit();
lu_comunic.is_comunic.accion_retorno="Refrescar"
Close(Parent)
end if
end event

type cb_cancelar from commandbutton within w_6206_ingreso_tareas
integer x = 1317
integer y = 588
integer width = 411
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;Close (parent)
end event

type dw_ingreso_tareas from datawindow within w_6206_ingreso_tareas
integer x = 50
integer y = 44
integer width = 1952
integer height = 480
integer taborder = 1
boolean bringtotop = true
string dataobject = "d_bri_2019_ingreso_tareas"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type


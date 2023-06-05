HA$PBExportHeader$w_3201_consulta_situacion_climatologica.srw
forward
global type w_3201_consulta_situacion_climatologica from w_sgigenerica
end type
type cb_eliminar from u_cb within w_3201_consulta_situacion_climatologica
end type
type cb_consultar from u_cb within w_3201_consulta_situacion_climatologica
end type
type cb_agregar from u_cb within w_3201_consulta_situacion_climatologica
end type
type dw_filtro_fecha from ue_gen_filtro_fechas within w_3201_consulta_situacion_climatologica
end type
type cb_buscar from u_cb within w_3201_consulta_situacion_climatologica
end type
type cb_imprimir from u_cb within w_3201_consulta_situacion_climatologica
end type
type dw_1 from datawindow within w_3201_consulta_situacion_climatologica
end type
type d_lista_clima from u_sit_2003_pr_lista_situacion_climatolog within w_3201_consulta_situacion_climatologica
end type
end forward

global type w_3201_consulta_situacion_climatologica from w_sgigenerica
integer width = 3657
integer height = 2400
string title = "OPEN SGI - Consulta de Informes Climatol$$HEX1$$f300$$ENDHEX$$gicos"
long backcolor = 79741120
string icon = "comment.ico"
event ue_grabar pbm_custom34
event ue_modificar pbm_custom35
event ue_obtener_datos pbm_custom36
cb_eliminar cb_eliminar
cb_consultar cb_consultar
cb_agregar cb_agregar
dw_filtro_fecha dw_filtro_fecha
cb_buscar cb_buscar
cb_imprimir cb_imprimir
dw_1 dw_1
d_lista_clima d_lista_clima
end type
global w_3201_consulta_situacion_climatologica w_3201_consulta_situacion_climatologica

type variables
u_generico_comunicaciones iu_comunic
//u_cen_2001_nu_form_centro_cmd_mesa iu_cen_2001_nu
u_sit_2001_nu_form_situacion_clima iu_sit_2001_nu

// constantes
//int fgci_perfil_oper_encargado_turno
DateTime id_f_desde,id_f_hasta
end variables

forward prototypes
private function long wf_si_existe ()
end prototypes

event ue_modificar;int li_bloqueo

li_bloqueo = iu_sit_2001_nu.fnu_bloquear_registro(iu_comunic.is_comunic.longval1,iu_comunic.is_comunic.datval1)

IF li_bloqueo = 0 THEN
        Return
END IF


if d_lista_clima.getrow() > 0 then
  if gu_perfiles.of_acceso_perfil(gi_perfil,'SIT_CLIMA','ACC_MANTEN')=1 then   
//                iu_comunic.is_comunic.accion_llamada = "Consulta"
                gu_comunic.is_comunic.longval1 = d_lista_clima.getitemnumber(d_lista_clima.getselectedrow(0),"nro_cmd")
                gu_comunic.is_comunic.datval1    = d_lista_clima.getitemdatetime(d_lista_clima.getselectedrow(0),"fecha")
                if iu_comunic.is_comunic.accion_llamada = "Consulta" then
                        gu_comunic.is_comunic.accion_llamada = "Consulta"
                else
                        gu_comunic.is_comunic.accion_llamada = "Actualizacion"
                end if
        else
                gu_comunic.is_comunic.longval1 = d_lista_clima.getitemnumber(d_lista_clima.getselectedrow(0),"nro_cmd")
                gu_comunic.is_comunic.datval1    = d_lista_clima.getitemdatetime(d_lista_clima.getselectedrow(0),"fecha")
                gu_comunic.is_comunic.accion_llamada = "Consulta"
        end if 
end if
open(w_2304_situacion_climatologica)


end event

event ue_obtener_datos;d_lista_clima.settransobject(sqlca)

// GNU 19-5-2006. Incidencia 1/442434
if gi_pais=8 then
	d_lista_clima.modify("vel.text='m/s'")
end if
// FIN GNU

d_lista_clima.retrieve(iu_comunic.is_comunic.intval2,id_f_desde,id_f_hasta)
IF d_lista_clima.RowCount() > 0 THEN
        //d_lista_clima.selectrow(1,true)
		  if gu_perfiles.of_acceso_perfil(gi_perfil,'SIT_CLIMA','ACC_CONSULTA')=1 then 
				cb_consultar.enabled=true
		  else
				cb_consultar.enabled=false
		  end if
		  
		   if gu_perfiles.of_acceso_perfil(gi_perfil,'SIT_CLIMA','ACC_MANTEN')=1 then 
	        This.cb_eliminar.Enabled=True
			else
               This.cb_eliminar.Enabled=false
			end if

ELSE
        This.cb_eliminar.Enabled=FALSE
        This.cb_consultar.Enabled=FALSE
END IF  

DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo
//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//dw_1.GetChild ("data_1",dw_datos)

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Lista Climatologica'
ll_longitud = len (ls_titulo)*100

//Inserto las fechas, si son nulas visualizo el texto 00/00/0000 00:00:00
ldt_desde = dw_filtro_fecha.GetItemDatetime(1,'f_desde')
IF IsNull(ldt_desde) THEN 
	dw_1.modify("nulo_desde.visible = '1'")
	dw_1.modify("f_desde.visible='0'")
ELSE
	dw_1.modify("nulo_desde.visible = '0'")
	dw_1.modify("f_desde.visible='1'")
END IF
ldt_hasta = dw_filtro_fecha.GetItemDatetime(1,'f_hasta')
IF IsNull(ldt_hasta) THEN 
	dw_1.modify("nulo_hasta.visible = '1'")
	dw_1.modify("f_hasta.visible='0'")
ELSE
	dw_1.modify("nulo_hasta.visible = '0'")
	dw_1.modify("f_hasta.visible='1'")
END IF

// si no son nulas las inserto
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")
dw_1.modify("f_desde.text = '" + string(ldt_desde) + "'")
dw_1.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
dw_1.Modify("data_1.Width= '8000'")
//d_lista_clima.ShareData(dw_datos)
end event

private function long wf_si_existe ();datetime ldt_fecha
long ll_nro_cmd
long ll_existe, il_fila


il_fila = d_lista_clima.GetSelectedRow(0)
if il_fila >0 then

	ll_nro_cmd = d_lista_clima.getitemnumber(il_fila,'nro_cmd')
	ldt_fecha = d_lista_clima.getitemdatetime(il_fila,'fecha')
	
	
	
	select count(*) into :ll_existe from  GI_SIT_CLIMA 
	where 
			GI_SIT_CLIMA.NRO_CMD = :ll_nro_cmd
			and GI_SIT_CLIMA.FECHA = :ldt_fecha;




	if ll_existe = 0 then // no existe
		//messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos de $$HEX1$$e900$$ENDHEX$$ste Informe. Se necesita actualizarlos');
		gnv_msg.f_mensaje("AM54","","",OK!)
		
		cb_buscar.triggerevent('clicked')
	end if 
else
	return -1
end if
return ll_existe

end function

event open;call super::open;// PERMITE CONSULTAR Y ACTUALIZAR LAS SITUACIONES CLIMATOLOGICAS 
//      INGRESADAS AL SISTEMA
// VARIABLES DE COMUNICACIONES

// gu_comunic.is_comunic.intval1 =  centro
// gu_comunic.is_comunic.intval2 = cmd
// gu_comunic.is_comunic.accion_llamada = Consulta
//                                                                                                              Actualizacion
//                                                                                                              Alta

// recibo estructura de comunicaciones
window w_ventana
w_ventana= this
FG_COLOCAR_VENTANA_MAIN(w_3201_consulta_situacion_climatologica)

iu_comunic = create u_generico_comunicaciones
iu_comunic.is_comunic = gu_comunic.is_comunic

// creo los objetos de trabajo

iu_sit_2001_nu = CREATE u_sit_2001_nu_form_situacion_clima

This.title = gu_comunic.f_titulo_ventana("w_3201_clima","Report_clima")

dw_filtro_fecha.InsertRow(0)
dw_filtro_fecha.f_inicializar_actual()

dw_filtro_fecha.SetItem(1,"f_desde",DATETIME(RelativeDate(Today(),-15),Now()))
dw_filtro_fecha.AcceptText()

if gu_perfiles.of_acceso_perfil(gi_perfil,'SIT_CLIMA','ACC_MANTEN')=1 then 
	cb_agregar.enabled = True
else
  cb_agregar.enabled = False
end if

//dw_1.modify("d_1.DataObject ='" + d_lista_clima.DataObject + "'")
	


cb_eliminar.enabled = False
cb_consultar.enabled = False
cb_buscar.SetFocus()
end event

event ue_arch_agregar;call super::ue_arch_agregar;
if gu_perfiles.of_acceso_perfil(gi_perfil,'SIT_CLIMA','ACC_MANTEN')=1 then                 
					 gu_comunic.is_comunic.longval1 = iu_comunic.is_comunic.intval2 // iu_cen_2001_nu.fnu_obtener_cmd(d_ambito)
                gu_comunic.is_comunic.datval1    = fgnu_fecha_actual()
                gu_comunic.is_comunic.accion_llamada = "Alta"
                Open(w_2304_situacion_climatologica)
end if

end event

event activate;call super::activate;//This.TriggerEvent("ue_obtener_datos")
end event

event ue_arch_eliminar;int li_confirmo, li_fila, li_lock_status
datetime ldt_fecha_reporte
long ll_cmd

li_fila =d_lista_clima.getselectedrow(0) 

IF li_fila <= 0 THEN
        Return
END IF

li_confirmo = gnv_msg.f_mensaje("CG02","","",YesNo!)

IF li_confirmo <> 1 THEN
        Return
END IF

ldt_fecha_reporte = d_lista_clima.GetItemDateTime(li_fila, 'fecha')
ll_cmd = d_lista_clima.GetItemNumber(li_fila, 'nro_cmd')

// Se intenta bloquear el reporte climatol$$HEX1$$f300$$ENDHEX$$gico para que otro usuario no lo borre antes
li_lock_status = gnu_u_transaction.uf_lock(This, "GI_SIT_CLIMA", "FECHA = to_date('" + string(ldt_fecha_reporte) + "','dd/mm/yyyy hh24:mi:ss') AND NRO_CMD=" + string(ll_cmd))

IF li_lock_status = 0 THEN
	// Hemos podido bloquear el reporte
	d_lista_clima.deleterow(li_fila)
	d_lista_clima.Update()
	
	gnu_u_transaction.uf_commit(This);
	// Se selecciona ahora una nueva fila, si es que quedan datos en la dw.
	IF d_lista_clima.RowCount() = 0 THEN   // LFE
			  this.cb_eliminar.enabled = false                // LFE
			  this.cb_consultar.enabled = false       // LFE
	END IF                                                                                  // LFE
END IF
end event

on w_3201_consulta_situacion_climatologica.create
int iCurrent
call super::create
this.cb_eliminar=create cb_eliminar
this.cb_consultar=create cb_consultar
this.cb_agregar=create cb_agregar
this.dw_filtro_fecha=create dw_filtro_fecha
this.cb_buscar=create cb_buscar
this.cb_imprimir=create cb_imprimir
this.dw_1=create dw_1
this.d_lista_clima=create d_lista_clima
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_eliminar
this.Control[iCurrent+2]=this.cb_consultar
this.Control[iCurrent+3]=this.cb_agregar
this.Control[iCurrent+4]=this.dw_filtro_fecha
this.Control[iCurrent+5]=this.cb_buscar
this.Control[iCurrent+6]=this.cb_imprimir
this.Control[iCurrent+7]=this.dw_1
this.Control[iCurrent+8]=this.d_lista_clima
end on

on w_3201_consulta_situacion_climatologica.destroy
call super::destroy
destroy(this.cb_eliminar)
destroy(this.cb_consultar)
destroy(this.cb_agregar)
destroy(this.dw_filtro_fecha)
destroy(this.cb_buscar)
destroy(this.cb_imprimir)
destroy(this.dw_1)
destroy(this.d_lista_clima)
end on

on close;call w_sgigenerica::close;DESTROY iu_comunic
DESTROY iu_sit_2001_nu
end on

event ue_arch_imprimir;call super::ue_arch_imprimir;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_clima
string ls_estado, ls_nombre
long ll_codigo
int li_posy, li_indice
li_posy = 378

IF d_lista_clima.RowCount() = 0 THEN
	gnv_msg.f_mensaje( "AB02","","",OK!)
	return
END IF

dw_1.getchild ("d_impresion_climatologica",dwc_clima)
d_lista_clima.sharedata(dwc_clima)
lst_impresion.pa_todos[1]=d_lista_clima
lst_impresion.pa_nombres[1]='d_impresion_climatologica'


FOR li_indice = 1 TO d_lista_clima.RowCount() 
	//ls_estado = d_lista_clima.GetItemString (li_indice,'cod_est_clima')
//	ll_codigo = long (ls_estado)
	ll_codigo = d_lista_clima.GetItemNumber(li_indice,'cod_est_clima')
	SELECT  "SGD_VALOR"."DESCRIPCION" 
	INTO :ls_estado
	FROM    "SGD_VALOR"   
	WHERE   "SGD_VALOR"."CODIF"='E_CL'  and 
			  "SGD_VALOR"."CODIGO" = :ll_codigo;

   ls_nombre = "campo" + "_" + string(li_indice)
	
   // Para cada fila recuperada pegamos dinamicamente un texto con el estado del clima
   dw_1.Modify('create text(name=' + ls_nombre+ ' band=Foreground ' + &
   'font.charset="0" font.face="MS Sans Serif" font.family="2" font.height="-10" ' + &
   'font.pitch="2" font.weight="400" background.mode="2" background.color="16777215" ' + &
   'color="8388608" alignment="0" border="0" x="366" y="' + string (li_posy) +'" height="64" width="663" ' + &
   'text="' + ls_estado + '" )')
	
		if gi_pais=8 then
		   dw_1.Modify('create text(name= t_' + string (li_indice) +' band=Foreground ' + &
   		'font.charset="0" font.face="MS Sans Serif" font.family="2" font.height="-10" ' + &
   		'font.pitch="2" font.weight="400" background.mode="2" background.color="16777215" ' + &
   		'color="8388608" alignment="0" border="0" x="2280" y="' + string (li_posy) +'" height="64" width="120" ' + &
   		'text="m/s" )')
		end if
	
   // Se ha calculado la diferencia entre dos filas, por lo tanto cada vez que se pegue un texto
   // se incrementar$$HEX2$$e1002000$$ENDHEX$$la fila
   li_posy = li_posy + 90

   dw_1.modify(ls_nombre + ".text='" + ls_estado + "'")
	

	
NEXT

lst_impresion.total = 1


dw_1.SetTransObject(SQLCA)
lst_impresion.pdw_compuesto = dw_1
lst_impresion.zoom = 76
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)


//
//
//
//
//
//lst_impresion.pdw_datawindow = dw_1

//
//gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_3201_consulta_situacion_climatologica
end type

type cb_eliminar from u_cb within w_3201_consulta_situacion_climatologica
integer x = 1001
integer y = 1680
integer width = 411
integer height = 96
integer taborder = 50
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Eliminar"
end type

event clicked;call super::clicked;
if wf_si_existe()<=0 then return //DBE 14/01/2000

parent.triggerevent("ue_arch_eliminar")
end event

type cb_consultar from u_cb within w_3201_consulta_situacion_climatologica
integer x = 1591
integer y = 1680
integer width = 411
integer height = 96
integer taborder = 40
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Consultar"
boolean cancel = true
end type

event clicked;call super::clicked;if wf_si_existe()<=0 then return //DBE 14/01/2000
iu_comunic.is_comunic.accion_llamada = 'Consulta'
parent.triggerevent("ue_modificar")
end event

type cb_agregar from u_cb within w_3201_consulta_situacion_climatologica
event clicked pbm_bnclicked
integer x = 411
integer y = 1680
integer width = 411
integer height = 96
integer taborder = 60
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;parent.triggerevent("ue_arch_agregar")
parent.cb_buscar.triggerevent("clicked")  //DBE 14/01/2000
end event

type dw_filtro_fecha from ue_gen_filtro_fechas within w_3201_consulta_situacion_climatologica
integer x = 192
integer y = 116
integer width = 1061
integer height = 204
integer taborder = 30
boolean border = true
borderstyle borderstyle = styleraised!
end type

type cb_buscar from u_cb within w_3201_consulta_situacion_climatologica
integer x = 2181
integer y = 1680
integer width = 411
integer height = 96
integer taborder = 10
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Buscar"
boolean cancel = true
boolean default = true
end type

event clicked;call super::clicked;// obtengo datos para el cmd 



IF dw_filtro_fecha.fnu_validar_fechas() = 1 THEN
   id_f_desde = dw_filtro_fecha.GetItemDateTime(1,"f_desde")
   id_f_hasta = dw_filtro_fecha.GetItemDateTime(1,"f_hasta")

	Parent.triggerEvent("ue_obtener_datos")
   
	IF d_lista_clima.RowCount()  = 0 THEN
      gnv_msg.f_mensaje("AI72","","",oK!)
	END IF
	

        
END IF
end event

type cb_imprimir from u_cb within w_3201_consulta_situacion_climatologica
integer x = 2770
integer y = 1680
integer width = 411
integer height = 96
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Imprimir"
boolean cancel = true
boolean default = true
end type

event clicked;call super::clicked;parent.triggerevent("ue_arch_imprimir")
end event

type dw_1 from datawindow within w_3201_consulta_situacion_climatologica
boolean visible = false
integer x = 183
integer y = 576
integer width = 3218
integer height = 864
integer taborder = 80
string dataobject = "d_impresion_climatologica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type d_lista_clima from u_sit_2003_pr_lista_situacion_climatolog within w_3201_consulta_situacion_climatologica
event ue_key_down pbm_dwnkey
integer x = 174
integer y = 432
integer width = 3255
integer height = 1140
integer taborder = 70
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

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

event doubleclicked;// Si se ha pulsado sobre la cabecera sale GSE 03/05/2001
if row = 0 then return
iu_comunic.is_comunic.accion_llamada = 'Actualizacion'
if this.rowcount() > 0  then
	if wf_si_existe()<=0 then return //DBE 14/01/2000
	if gu_perfiles.of_acceso_perfil(gi_perfil,'SIT_CLIMA','ACC_MANTEN')=1 then 
		iu_comunic.is_comunic.accion_llamada = 'Actualizacion'
	else
		iu_comunic.is_comunic.accion_llamada = 'Consulta'
	end if
	Parent.TriggerEvent("ue_modificar")
end if
end event

event clicked;call super::clicked;long ll_fila


// Si se ha pulsado sobre la cabecera sale GSE 03/05/2001
if row = 0 then return

IF row > 0 THEN
	ll_fila = row
	this.ScrollToRow(ll_fila)
	this.selectrow(0,False)
	this.selectrow(ll_fila,true)
END IF



end event

event sqlpreview;call super::sqlpreview;//
end event

event rowfocuschanged;// 
end event


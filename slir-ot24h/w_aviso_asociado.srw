HA$PBExportHeader$w_aviso_asociado.srw
forward
global type w_aviso_asociado from window
end type
type dw_cor from datawindow within w_aviso_asociado
end type
type dw_informacion_aviso from datawindow within w_aviso_asociado
end type
type dw_mesa from datawindow within w_aviso_asociado
end type
type dw_centro from datawindow within w_aviso_asociado
end type
type st_14 from statictext within w_aviso_asociado
end type
type sle_coordenadas_y from singlelineedit within w_aviso_asociado
end type
type sle_coordenadas_x from singlelineedit within w_aviso_asociado
end type
type st_13 from statictext within w_aviso_asociado
end type
type mle_cor from multilineedit within w_aviso_asociado
end type
type mle_telegestiones from multilineedit within w_aviso_asociado
end type
type st_12 from statictext within w_aviso_asociado
end type
type sle_improcedente from singlelineedit within w_aviso_asociado
end type
type sle_fecha_resuelto from singlelineedit within w_aviso_asociado
end type
type sle_fecha_deteccion from singlelineedit within w_aviso_asociado
end type
type sle_prioridad from singlelineedit within w_aviso_asociado
end type
type st_11 from statictext within w_aviso_asociado
end type
type sle_llamadas_previas from singlelineedit within w_aviso_asociado
end type
type sle_tipo from singlelineedit within w_aviso_asociado
end type
type st_10 from statictext within w_aviso_asociado
end type
type sle_ingresado from singlelineedit within w_aviso_asociado
end type
type sle_alcance from singlelineedit within w_aviso_asociado
end type
type st_9 from statictext within w_aviso_asociado
end type
type sle_nro_aviso from singlelineedit within w_aviso_asociado
end type
type sle_estado from singlelineedit within w_aviso_asociado
end type
type st_8 from statictext within w_aviso_asociado
end type
type sle_ambito_sector from singlelineedit within w_aviso_asociado
end type
type st_7 from statictext within w_aviso_asociado
end type
type sle_ambito_cor from singlelineedit within w_aviso_asociado
end type
type st_6 from statictext within w_aviso_asociado
end type
type sle_ambito_zona from singlelineedit within w_aviso_asociado
end type
type st_5 from statictext within w_aviso_asociado
end type
type sle_nis from singlelineedit within w_aviso_asociado
end type
type sle_telefono from singlelineedit within w_aviso_asociado
end type
type sle_nombre from singlelineedit within w_aviso_asociado
end type
type st_4 from statictext within w_aviso_asociado
end type
type sle_apellidos_1 from singlelineedit within w_aviso_asociado
end type
type sle_apellidos from singlelineedit within w_aviso_asociado
end type
type st_3 from statictext within w_aviso_asociado
end type
type st_3x from statictext within w_aviso_asociado
end type
type mle_referencia from multilineedit within w_aviso_asociado
end type
type sle_piso from singlelineedit within w_aviso_asociado
end type
type sle_dirrecion_1 from singlelineedit within w_aviso_asociado
end type
type sle_dirrecion_2 from singlelineedit within w_aviso_asociado
end type
type sle_dirrecion from singlelineedit within w_aviso_asociado
end type
type st_2 from statictext within w_aviso_asociado
end type
type sle_zona from singlelineedit within w_aviso_asociado
end type
type sle_localidad from singlelineedit within w_aviso_asociado
end type
type st_1 from statictext within w_aviso_asociado
end type
type sle_municipio from singlelineedit within w_aviso_asociado
end type
type sle_departamento from singlelineedit within w_aviso_asociado
end type
type st_cliente from statictext within w_aviso_asociado
end type
type gb_1 from groupbox within w_aviso_asociado
end type
type gb_2 from groupbox within w_aviso_asociado
end type
type gb_4 from groupbox within w_aviso_asociado
end type
type gb_3 from groupbox within w_aviso_asociado
end type
type gb_5 from groupbox within w_aviso_asociado
end type
type gb_6 from groupbox within w_aviso_asociado
end type
end forward

global type w_aviso_asociado from window
integer width = 5673
integer height = 2524
boolean titlebar = true
string title = "Informaci$$HEX1$$f300$$ENDHEX$$n del Aviso"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_cor dw_cor
dw_informacion_aviso dw_informacion_aviso
dw_mesa dw_mesa
dw_centro dw_centro
st_14 st_14
sle_coordenadas_y sle_coordenadas_y
sle_coordenadas_x sle_coordenadas_x
st_13 st_13
mle_cor mle_cor
mle_telegestiones mle_telegestiones
st_12 st_12
sle_improcedente sle_improcedente
sle_fecha_resuelto sle_fecha_resuelto
sle_fecha_deteccion sle_fecha_deteccion
sle_prioridad sle_prioridad
st_11 st_11
sle_llamadas_previas sle_llamadas_previas
sle_tipo sle_tipo
st_10 st_10
sle_ingresado sle_ingresado
sle_alcance sle_alcance
st_9 st_9
sle_nro_aviso sle_nro_aviso
sle_estado sle_estado
st_8 st_8
sle_ambito_sector sle_ambito_sector
st_7 st_7
sle_ambito_cor sle_ambito_cor
st_6 st_6
sle_ambito_zona sle_ambito_zona
st_5 st_5
sle_nis sle_nis
sle_telefono sle_telefono
sle_nombre sle_nombre
st_4 st_4
sle_apellidos_1 sle_apellidos_1
sle_apellidos sle_apellidos
st_3 st_3
st_3x st_3x
mle_referencia mle_referencia
sle_piso sle_piso
sle_dirrecion_1 sle_dirrecion_1
sle_dirrecion_2 sle_dirrecion_2
sle_dirrecion sle_dirrecion
st_2 st_2
sle_zona sle_zona
sle_localidad sle_localidad
st_1 st_1
sle_municipio sle_municipio
sle_departamento sle_departamento
st_cliente st_cliente
gb_1 gb_1
gb_2 gb_2
gb_4 gb_4
gb_3 gb_3
gb_5 gb_5
gb_6 gb_6
end type
global w_aviso_asociado w_aviso_asociado

type variables
double l_avi
end variables

forward prototypes
public function integer f_limpiar_controles ()
end prototypes

public function integer f_limpiar_controles ();sle_nombre.text = ""
sle_apellidos.text = ""
sle_apellidos_1.text = ""
mle_referencia.text = ""
sle_departamento.text = ""
sle_municipio.text = ""
sle_localidad.text = ""
sle_zona.text = ""
sle_dirrecion.text = ""
sle_dirrecion_1.text = ""
sle_piso.text = ""
sle_telefono.text = ""
sle_nis.text = ""
sle_ambito_zona.text = ""
sle_ambito_sector.text = ""
sle_ambito_cor.text = ""
sle_estado.text = ""
sle_tipo.text = ""
sle_alcance.text ="" 
sle_prioridad.text = ""
sle_llamadas_previas.text = ""
sle_improcedente.text = ""		
sle_ingresado.text = ""
sle_fecha_deteccion.text = ""
sle_fecha_resuelto.text = ""
sle_coordenadas_x.text = ""
sle_coordenadas_y.text = ""
mle_telegestiones.text=""
mle_cor.text=""

return 0
end function

event open;f_limpiar_controles()

l_avi = Message.DoubleParm

sle_nro_aviso.text = STRING(l_avi)

dw_informacion_aviso.SetTransObject(SQLCA)
dw_informacion_aviso.Retrieve(l_avi)

IF dw_informacion_aviso.rowcount() <> 0 THEN
	
	dw_centro.SetTransObject(SQLCA)
	dw_centro.Retrieve(dw_informacion_aviso.Object.gi_avisos_nro_centro[1])
	dw_mesa.SetTransObject(SQLCA)
	dw_mesa.Retrieve(dw_informacion_aviso.Object.gi_avisos_nro_mesa[1],dw_informacion_aviso.Object.gi_avisos_nro_centro[1])
	dw_cor.SetTransObject(SQLCA)
	dw_cor.Retrieve(dw_informacion_aviso.Object.gi_avisos_nro_mesa[1],dw_informacion_aviso.Object.gi_avisos_nro_cmd[1])
	
	sle_nombre.text = dw_informacion_aviso.Object.gi_avisos_nombre[1]
	sle_apellidos.text = dw_informacion_aviso.Object.gi_avisos_apellido1[1]
	sle_apellidos_1.text = dw_informacion_aviso.Object.gi_avisos_apellido2[1]
	mle_referencia.text = dw_informacion_aviso.Object.gi_avisos_referencia[1]	
	sle_departamento.text = dw_informacion_aviso.Object.gi_avisos_departamento[1] 
	sle_municipio.text = dw_informacion_aviso.Object.gi_avisos_municipio[1]
	sle_localidad.text = dw_informacion_aviso.Object.gi_avisos_localidad[1]
	sle_zona.text = dw_informacion_aviso.Object.gi_avisos_zona[1]
	sle_dirrecion.text = dw_informacion_aviso.Object.gi_avisos_dirrecion[1]
	sle_dirrecion_1.text = String(dw_informacion_aviso.Object.gi_avisos_dirrecion1[1])
	sle_piso.text = String(dw_informacion_aviso.Object.gi_avisos_piso[1])
	sle_telefono.text = String(dw_informacion_aviso.Object.gi_avisos_telefono[1])
	sle_nis.text = String(dw_informacion_aviso.Object.gi_avisos_nis[1])
	IF dw_centro.rowcount() <> 0 THEN
		sle_ambito_zona.text = dw_centro.Object.nombre[1]
	END IF
	IF dw_mesa.rowcount() <> 0 THEN
		sle_ambito_sector.text = dw_mesa.Object.nombre[1]
	END IF
		IF dw_cor.rowcount() <> 0 THEN
		sle_ambito_cor.text = dw_cor.Object.nombre[1]
	END IF
	sle_estado.text = dw_informacion_aviso.Object.sgd_valor_estado_aviso[1]
	sle_tipo.text = dw_informacion_aviso.Object.gi_tip_aviso[1]
	sle_alcance.text = dw_informacion_aviso.Object.sgd_valor_alcance[1]
	sle_prioridad.text = dw_informacion_aviso.Object.sgd_valor_prioridad[1]
	sle_llamadas_previas.text = STRING(dw_informacion_aviso.Object.gi_avisos_nro_llamadas[1])
	IF dw_informacion_aviso.Object.gi_avisos_ind_improcedente[1] = 0 THEN
		sle_improcedente.text = "NO"
	END IF
	IF dw_informacion_aviso.Object.gi_avisos_ind_improcedente[1] = 1 THEN
		sle_improcedente.text = "SI"
	END IF	
	sle_ingresado.text = STRING(dw_informacion_aviso.Object.gi_avisos_f_alta[1])
	//sle_fecha_deteccion.text = STRING(dw_informacion_aviso.Object.gi_avisos_fecha_problema[1])
	sle_fecha_resuelto.text = STRING(dw_informacion_aviso.Object.gi_avisos_fecha_res[1])
	sle_coordenadas_x.text = STRING(dw_informacion_aviso.Object.gi_avisos_coordenada_x[1])
	sle_coordenadas_y.text = STRING(dw_informacion_aviso.Object.gi_avisos_coordenada_y[1])
	mle_telegestiones.text=STRING(dw_informacion_aviso.Object.gi_avisos_obs_telegestiones[1])
	mle_cor.text=STRING(dw_informacion_aviso.Object.gi_avisos_obs_cmd[1])
END IF
end event

on w_aviso_asociado.create
this.dw_cor=create dw_cor
this.dw_informacion_aviso=create dw_informacion_aviso
this.dw_mesa=create dw_mesa
this.dw_centro=create dw_centro
this.st_14=create st_14
this.sle_coordenadas_y=create sle_coordenadas_y
this.sle_coordenadas_x=create sle_coordenadas_x
this.st_13=create st_13
this.mle_cor=create mle_cor
this.mle_telegestiones=create mle_telegestiones
this.st_12=create st_12
this.sle_improcedente=create sle_improcedente
this.sle_fecha_resuelto=create sle_fecha_resuelto
this.sle_fecha_deteccion=create sle_fecha_deteccion
this.sle_prioridad=create sle_prioridad
this.st_11=create st_11
this.sle_llamadas_previas=create sle_llamadas_previas
this.sle_tipo=create sle_tipo
this.st_10=create st_10
this.sle_ingresado=create sle_ingresado
this.sle_alcance=create sle_alcance
this.st_9=create st_9
this.sle_nro_aviso=create sle_nro_aviso
this.sle_estado=create sle_estado
this.st_8=create st_8
this.sle_ambito_sector=create sle_ambito_sector
this.st_7=create st_7
this.sle_ambito_cor=create sle_ambito_cor
this.st_6=create st_6
this.sle_ambito_zona=create sle_ambito_zona
this.st_5=create st_5
this.sle_nis=create sle_nis
this.sle_telefono=create sle_telefono
this.sle_nombre=create sle_nombre
this.st_4=create st_4
this.sle_apellidos_1=create sle_apellidos_1
this.sle_apellidos=create sle_apellidos
this.st_3=create st_3
this.st_3x=create st_3x
this.mle_referencia=create mle_referencia
this.sle_piso=create sle_piso
this.sle_dirrecion_1=create sle_dirrecion_1
this.sle_dirrecion_2=create sle_dirrecion_2
this.sle_dirrecion=create sle_dirrecion
this.st_2=create st_2
this.sle_zona=create sle_zona
this.sle_localidad=create sle_localidad
this.st_1=create st_1
this.sle_municipio=create sle_municipio
this.sle_departamento=create sle_departamento
this.st_cliente=create st_cliente
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_5=create gb_5
this.gb_6=create gb_6
this.Control[]={this.dw_cor,&
this.dw_informacion_aviso,&
this.dw_mesa,&
this.dw_centro,&
this.st_14,&
this.sle_coordenadas_y,&
this.sle_coordenadas_x,&
this.st_13,&
this.mle_cor,&
this.mle_telegestiones,&
this.st_12,&
this.sle_improcedente,&
this.sle_fecha_resuelto,&
this.sle_fecha_deteccion,&
this.sle_prioridad,&
this.st_11,&
this.sle_llamadas_previas,&
this.sle_tipo,&
this.st_10,&
this.sle_ingresado,&
this.sle_alcance,&
this.st_9,&
this.sle_nro_aviso,&
this.sle_estado,&
this.st_8,&
this.sle_ambito_sector,&
this.st_7,&
this.sle_ambito_cor,&
this.st_6,&
this.sle_ambito_zona,&
this.st_5,&
this.sle_nis,&
this.sle_telefono,&
this.sle_nombre,&
this.st_4,&
this.sle_apellidos_1,&
this.sle_apellidos,&
this.st_3,&
this.st_3x,&
this.mle_referencia,&
this.sle_piso,&
this.sle_dirrecion_1,&
this.sle_dirrecion_2,&
this.sle_dirrecion,&
this.st_2,&
this.sle_zona,&
this.sle_localidad,&
this.st_1,&
this.sle_municipio,&
this.sle_departamento,&
this.st_cliente,&
this.gb_1,&
this.gb_2,&
this.gb_4,&
this.gb_3,&
this.gb_5,&
this.gb_6}
end on

on w_aviso_asociado.destroy
destroy(this.dw_cor)
destroy(this.dw_informacion_aviso)
destroy(this.dw_mesa)
destroy(this.dw_centro)
destroy(this.st_14)
destroy(this.sle_coordenadas_y)
destroy(this.sle_coordenadas_x)
destroy(this.st_13)
destroy(this.mle_cor)
destroy(this.mle_telegestiones)
destroy(this.st_12)
destroy(this.sle_improcedente)
destroy(this.sle_fecha_resuelto)
destroy(this.sle_fecha_deteccion)
destroy(this.sle_prioridad)
destroy(this.st_11)
destroy(this.sle_llamadas_previas)
destroy(this.sle_tipo)
destroy(this.st_10)
destroy(this.sle_ingresado)
destroy(this.sle_alcance)
destroy(this.st_9)
destroy(this.sle_nro_aviso)
destroy(this.sle_estado)
destroy(this.st_8)
destroy(this.sle_ambito_sector)
destroy(this.st_7)
destroy(this.sle_ambito_cor)
destroy(this.st_6)
destroy(this.sle_ambito_zona)
destroy(this.st_5)
destroy(this.sle_nis)
destroy(this.sle_telefono)
destroy(this.sle_nombre)
destroy(this.st_4)
destroy(this.sle_apellidos_1)
destroy(this.sle_apellidos)
destroy(this.st_3)
destroy(this.st_3x)
destroy(this.mle_referencia)
destroy(this.sle_piso)
destroy(this.sle_dirrecion_1)
destroy(this.sle_dirrecion_2)
destroy(this.sle_dirrecion)
destroy(this.st_2)
destroy(this.sle_zona)
destroy(this.sle_localidad)
destroy(this.st_1)
destroy(this.sle_municipio)
destroy(this.sle_departamento)
destroy(this.st_cliente)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_5)
destroy(this.gb_6)
end on

type dw_cor from datawindow within w_aviso_asociado
integer width = 5
integer height = 4
integer taborder = 60
string title = "none"
string dataobject = "ddw_cor"
boolean livescroll = true
end type

type dw_informacion_aviso from datawindow within w_aviso_asociado
integer width = 5
integer height = 4
integer taborder = 50
string title = "none"
string dataobject = "dw_informacion_aviso"
boolean livescroll = true
end type

type dw_mesa from datawindow within w_aviso_asociado
integer width = 5
integer height = 4
integer taborder = 40
string title = "none"
string dataobject = "ddw_mesa"
boolean livescroll = true
end type

type dw_centro from datawindow within w_aviso_asociado
integer width = 5
integer height = 8
integer taborder = 40
string title = "none"
string dataobject = "ddw_centro"
boolean livescroll = true
end type

type st_14 from statictext within w_aviso_asociado
integer x = 18
integer y = 2056
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Coordenada X:                                                         | Coordenada Y:"
boolean focusrectangle = false
end type

type sle_coordenadas_y from singlelineedit within w_aviso_asociado
integer x = 1504
integer y = 2116
integer width = 1481
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_coordenadas_x from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 2116
integer width = 1481
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_13 from statictext within w_aviso_asociado
integer x = 3017
integer y = 1056
integer width = 2501
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 128
string text = "Observaciones Cor:"
boolean focusrectangle = false
end type

type mle_cor from multilineedit within w_aviso_asociado
integer x = 3017
integer y = 1116
integer width = 2501
integer height = 884
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autovscroll = true
textcase textcase = upper!
boolean displayonly = true
end type

event getfocus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Nombre: mle_observacion
//Evento: getfocus()
//DESCRIBCI$$HEX1$$d300$$ENDHEX$$N:  Se Activa el scroll vertical
//EDM-14
//Creado:27/02/2018
//TDA-RODOLFO GUTI$$HEX1$$c900$$ENDHEX$$RREZ
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


This.VScrollBar = true
end event

event losefocus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Nombre: mle_observacion
//Evento: losefocus()
//DESCRIBCI$$HEX1$$d300$$ENDHEX$$N:  Se desactiva el scroll vertical
//EDM-14
//Creado:27/02/2018
//TDA-RODOLFO GUTI$$HEX1$$c900$$ENDHEX$$RREZ
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


This.VScrollBar = false
end event

type mle_telegestiones from multilineedit within w_aviso_asociado
integer x = 3017
integer y = 112
integer width = 2501
integer height = 884
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autovscroll = true
textcase textcase = upper!
boolean displayonly = true
end type

event getfocus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Nombre: mle_observacion
//Evento: getfocus()
//DESCRIBCI$$HEX1$$d300$$ENDHEX$$N:  Se Activa el scroll vertical
//EDM-14
//Creado:27/02/2018
//TDA-RODOLFO GUTI$$HEX1$$c900$$ENDHEX$$RREZ
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


This.VScrollBar = true
end event

event losefocus;////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Nombre: mle_observacion
//Evento: losefocus()
//DESCRIBCI$$HEX1$$d300$$ENDHEX$$N:  Se desactiva el scroll vertical
//EDM-14
//Creado:27/02/2018
//TDA-RODOLFO GUTI$$HEX1$$c900$$ENDHEX$$RREZ
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


This.VScrollBar = false
end event

type st_12 from statictext within w_aviso_asociado
integer x = 3017
integer y = 52
integer width = 2501
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 128
string text = "Observaciones Telegestiones:"
boolean focusrectangle = false
end type

type sle_improcedente from singlelineedit within w_aviso_asociado
integer x = 2258
integer y = 1948
integer width = 727
integer height = 100
integer taborder = 140
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_fecha_resuelto from singlelineedit within w_aviso_asociado
integer x = 1509
integer y = 1948
integer width = 741
integer height = 100
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_fecha_deteccion from singlelineedit within w_aviso_asociado
integer x = 768
integer y = 1948
integer width = 741
integer height = 100
integer taborder = 130
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_prioridad from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 1948
integer width = 741
integer height = 100
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_11 from statictext within w_aviso_asociado
integer x = 18
integer y = 1888
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Prioridad:                         |F.Detecci$$HEX1$$f300$$ENDHEX$$n:                    |F.Resuelto:                      |Improcedente:"
boolean focusrectangle = false
end type

type sle_llamadas_previas from singlelineedit within w_aviso_asociado
integer x = 2034
integer y = 1756
integer width = 951
integer height = 100
integer taborder = 60
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_tipo from singlelineedit within w_aviso_asociado
integer x = 1074
integer y = 1756
integer width = 951
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_10 from statictext within w_aviso_asociado
integer x = 1074
integer y = 1696
integer width = 1911
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Tipo:                                            |Llam. Previas:"
boolean focusrectangle = false
end type

type sle_ingresado from singlelineedit within w_aviso_asociado
integer x = 2034
integer y = 1592
integer width = 951
integer height = 100
integer taborder = 120
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_alcance from singlelineedit within w_aviso_asociado
integer x = 1074
integer y = 1592
integer width = 951
integer height = 100
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_9 from statictext within w_aviso_asociado
integer x = 1074
integer y = 1532
integer width = 1911
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Alcance:                                      |Ingresado:"
boolean focusrectangle = false
end type

type sle_nro_aviso from singlelineedit within w_aviso_asociado
integer x = 2034
integer y = 1428
integer width = 951
integer height = 100
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_estado from singlelineedit within w_aviso_asociado
integer x = 1074
integer y = 1428
integer width = 951
integer height = 100
integer taborder = 70
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_8 from statictext within w_aviso_asociado
integer x = 1074
integer y = 1368
integer width = 1911
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Estado:                                        |Nro. Aviso:"
boolean focusrectangle = false
end type

type sle_ambito_sector from singlelineedit within w_aviso_asociado
integer x = 37
integer y = 1760
integer width = 1001
integer height = 100
integer taborder = 50
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_7 from statictext within w_aviso_asociado
integer x = 37
integer y = 1700
integer width = 1001
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Sector:"
boolean focusrectangle = false
end type

type sle_ambito_cor from singlelineedit within w_aviso_asociado
integer x = 37
integer y = 1592
integer width = 1001
integer height = 100
integer taborder = 110
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_6 from statictext within w_aviso_asociado
integer x = 37
integer y = 1532
integer width = 1001
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "COR:"
boolean focusrectangle = false
end type

type sle_ambito_zona from singlelineedit within w_aviso_asociado
integer x = 37
integer y = 1428
integer width = 1001
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_5 from statictext within w_aviso_asociado
integer x = 37
integer y = 1368
integer width = 1001
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Zona:"
boolean focusrectangle = false
end type

type sle_nis from singlelineedit within w_aviso_asociado
integer x = 2249
integer y = 1116
integer width = 736
integer height = 100
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_telefono from singlelineedit within w_aviso_asociado
integer x = 1504
integer y = 1116
integer width = 741
integer height = 100
integer taborder = 80
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_nombre from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 1116
integer width = 1481
integer height = 100
integer taborder = 70
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_4 from statictext within w_aviso_asociado
integer x = 18
integer y = 1056
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Nombre                                                                    | Tel$$HEX1$$e900$$ENDHEX$$fono                          |Nis"
boolean focusrectangle = false
end type

type sle_apellidos_1 from singlelineedit within w_aviso_asociado
integer x = 1504
integer y = 952
integer width = 1481
integer height = 100
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_apellidos from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 952
integer width = 1481
integer height = 100
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_3 from statictext within w_aviso_asociado
integer x = 18
integer y = 892
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Apellidos"
boolean focusrectangle = false
end type

type st_3x from statictext within w_aviso_asociado
integer x = 18
integer y = 544
integer width = 2967
integer height = 60
integer textsize = -11
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

type mle_referencia from multilineedit within w_aviso_asociado
integer x = 18
integer y = 600
integer width = 2967
integer height = 180
integer taborder = 50
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autovscroll = true
textcase textcase = upper!
boolean displayonly = true
end type

type sle_piso from singlelineedit within w_aviso_asociado
integer x = 2386
integer y = 440
integer width = 599
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_dirrecion_1 from singlelineedit within w_aviso_asociado
integer x = 1504
integer y = 440
integer width = 448
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_dirrecion_2 from singlelineedit within w_aviso_asociado
integer x = 1957
integer y = 440
integer width = 425
integer height = 100
integer taborder = 40
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_dirrecion from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 440
integer width = 1481
integer height = 100
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_2 from statictext within w_aviso_asociado
integer x = 18
integer y = 380
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Dirrecci$$HEX1$$f300$$ENDHEX$$n                                                                                                                | Piso"
boolean focusrectangle = false
end type

type sle_zona from singlelineedit within w_aviso_asociado
integer x = 1504
integer y = 276
integer width = 1481
integer height = 100
integer taborder = 30
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_localidad from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 276
integer width = 1481
integer height = 100
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_1 from statictext within w_aviso_asociado
integer x = 18
integer y = 216
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Localidad                                                                 | Zona"
boolean focusrectangle = false
end type

type sle_municipio from singlelineedit within w_aviso_asociado
integer x = 1504
integer y = 112
integer width = 1481
integer height = 100
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type sle_departamento from singlelineedit within w_aviso_asociado
integer x = 18
integer y = 112
integer width = 1481
integer height = 100
integer taborder = 20
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean autohscroll = false
textcase textcase = upper!
boolean displayonly = true
end type

type st_cliente from statictext within w_aviso_asociado
integer x = 18
integer y = 52
integer width = 2967
integer height = 60
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 15793151
long backcolor = 128
boolean enabled = false
string text = "Departamento                                                          | Municipio"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_aviso_asociado
integer x = 5
integer y = 4
integer width = 2999
integer height = 804
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_2 from groupbox within w_aviso_asociado
integer x = 5
integer y = 812
integer width = 2999
integer height = 448
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_4 from groupbox within w_aviso_asociado
integer x = 18
integer y = 1304
integer width = 1047
integer height = 580
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ambito"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_aviso_asociado
integer x = 5
integer y = 1260
integer width = 2999
integer height = 984
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Helvetica LT Std"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_5 from groupbox within w_aviso_asociado
integer x = 3003
integer y = 4
integer width = 2542
integer height = 1040
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type

type gb_6 from groupbox within w_aviso_asociado
integer x = 3003
integer y = 1008
integer width = 2542
integer height = 1040
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
borderstyle borderstyle = styleraised!
end type


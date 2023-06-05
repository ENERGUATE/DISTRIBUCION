HA$PBExportHeader$w_alfa_criterio.srw
forward
global type w_alfa_criterio from window
end type
type cbx_ambito from checkbox within w_alfa_criterio
end type
type rb_baja from radiobutton within w_alfa_criterio
end type
type rb_modificacion from radiobutton within w_alfa_criterio
end type
type rb_alta from radiobutton within w_alfa_criterio
end type
type st_4 from statictext within w_alfa_criterio
end type
type sle_2 from singlelineedit within w_alfa_criterio
end type
type sle_1 from singlelineedit within w_alfa_criterio
end type
type sle_3 from singlelineedit within w_alfa_criterio
end type
type st_3 from statictext within w_alfa_criterio
end type
type st_2 from statictext within w_alfa_criterio
end type
type st_1 from statictext within w_alfa_criterio
end type
type cb_2 from commandbutton within w_alfa_criterio
end type
type cb_1 from commandbutton within w_alfa_criterio
end type
type dw_1 from datawindow within w_alfa_criterio
end type
type gb_3 from groupbox within w_alfa_criterio
end type
type gb_1 from groupbox within w_alfa_criterio
end type
end forward

global type w_alfa_criterio from window
integer x = 887
integer y = 728
integer width = 1883
integer height = 948
boolean titlebar = true
string title = "Mantenimiento alfanum$$HEX1$$e900$$ENDHEX$$rico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "None!"
cbx_ambito cbx_ambito
rb_baja rb_baja
rb_modificacion rb_modificacion
rb_alta rb_alta
st_4 st_4
sle_2 sle_2
sle_1 sle_1
sle_3 sle_3
st_3 st_3
st_2 st_2
st_1 st_1
cb_2 cb_2
cb_1 cb_1
dw_1 dw_1
gb_3 gb_3
gb_1 gb_1
end type
global w_alfa_criterio w_alfa_criterio

type variables
string ls_codigo,ls_matricula,ls_nombre,ls_tipo
string ls_ambito


end variables

forward prototypes
public function integer tipo_instalacion (long codigo)
end prototypes

public function integer tipo_instalacion (long codigo);CHOOSE CASE codigo
	CASE 11000000 to 11999999
		return 7
	CASE 19000000 to 19999999
		return 8	
	CASE 20000000 to 20999999
		return 1
	CASE 10000000 to 10999999
		return 2
	CASE 40000000 to 40499999
		return 3
	CASE 65000000 to 65999999
		return 4
	CASE 15000000 to 15999999
		return 5
	CASE ELSE
	 	gnv_msg.f_mensaje("EM56","","",Ok!)
//		messagebox("Error","Codigo de instalacion Erroneo")
	return 0	
END CHOOSE
end function

event open;// Rellenar el datawindowchild de las instalaciones, darle valores, etc.
DataWindowChild ldwc_entidades

dw_1.dataobject="dw_lista_entidad_alta"
dw_1.settransObject(sqlca)
dw_1.insertrow(0)
dw_1.ResetUpdate()
dw_1.GetChild("codigo",ldwc_entidades)
ldwc_entidades.SetTransObject(SQLCA)
ldwc_entidades.Retrieve()


end event

on w_alfa_criterio.create
this.cbx_ambito=create cbx_ambito
this.rb_baja=create rb_baja
this.rb_modificacion=create rb_modificacion
this.rb_alta=create rb_alta
this.st_4=create st_4
this.sle_2=create sle_2
this.sle_1=create sle_1
this.sle_3=create sle_3
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_1=create dw_1
this.gb_3=create gb_3
this.gb_1=create gb_1
this.Control[]={this.cbx_ambito,&
this.rb_baja,&
this.rb_modificacion,&
this.rb_alta,&
this.st_4,&
this.sle_2,&
this.sle_1,&
this.sle_3,&
this.st_3,&
this.st_2,&
this.st_1,&
this.cb_2,&
this.cb_1,&
this.dw_1,&
this.gb_3,&
this.gb_1}
end on

on w_alfa_criterio.destroy
destroy(this.cbx_ambito)
destroy(this.rb_baja)
destroy(this.rb_modificacion)
destroy(this.rb_alta)
destroy(this.st_4)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.sle_3)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_1)
destroy(this.gb_3)
destroy(this.gb_1)
end on

type cbx_ambito from checkbox within w_alfa_criterio
integer x = 1422
integer y = 396
integer width = 311
integer height = 76
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean enabled = false
string text = "Amb&ito"
boolean checked = true
boolean lefttext = true
end type

type rb_baja from radiobutton within w_alfa_criterio
integer x = 1257
integer y = 268
integer width = 453
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "&Baja"
boolean lefttext = true
end type

event clicked;//Modifica el aspecto para recibir los datos de la instalacion a borrar
int estado
DataWindowChild ldwc_entidades
//if dw_1.dataobject <> "dw_lista_entidad_alta" then 
   dw_1.SetRedraw(False)
	dw_1.dataobject="dw_lista_entidad_alta"
	dw_1.settransobject(sqlca)
	dw_1.insertrow(0)
	dw_1.ResetUpdate()	
	dw_1.GetChild("codigo",ldwc_entidades)
	ldwc_entidades.SetTransObject(SQLCA)
	ldwc_entidades.Retrieve()
	dw_1.SetRedraw(True)
//end if	
if gl_instalacion_afectada<>0 then
	
	  SELECT "SGD_INSTALACION"."MATRICULA",   
         "SGD_INSTALACION"."NOM_INSTALACION", "STAT_FLG"
			
    INTO :sle_2.text,   
         :sle_3.text,   
			:estado
    FROM "SGD_INSTALACION"  
	 WHERE "SGD_INSTALACION"."NRO_INSTALACION"=:gl_instalacion_afectada AND
	        BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_INSTALACION 
			  WHERE "SGD_INSTALACION"."NRO_INSTALACION"=:gl_instalacion_afectada) ;   


if estado=128 then 
	 	gnv_msg.f_mensaje("AG04","","",Ok!)
	//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n solicitada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada")
end if
sle_1.text=string(gl_instalacion_afectada)
if sqlca.sqlcode=100 or estado=128 then 
	sle_1.text=""   
   sle_2.text=""   
   sle_3.text=""  
end if    

cbx_ambito.enabled=true
gb_1.visible=true
sle_1.visible=true
sle_2.visible=true
sle_3.visible=true
st_1.visible=true
st_2.visible=true
st_3.visible=true
end if
end event

type rb_modificacion from radiobutton within w_alfa_criterio
integer x = 1262
integer y = 156
integer width = 453
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "&Modificaci$$HEX1$$f300$$ENDHEX$$n"
boolean lefttext = true
end type

event clicked;//Modifica el aspecto de la pantalla para realizar la modificacion
int estado
DataWindowChild ldwc_entidades
//if dw_1.dataobject <> "dw_lista_entidad" then 
	dw_1.dataobject="dw_lista_entidad"
	dw_1.settransObject(sqlca)
	dw_1.insertrow(0)
	dw_1.ResetUpdate()	
	dw_1.GetChild("codigo",ldwc_entidades)
	ldwc_entidades.SetTransObject(SQLCA)
	ldwc_entidades.Retrieve()

//end if	
if gl_instalacion_afectada<>0 then
	
	  SELECT "SGD_INSTALACION"."MATRICULA",   
         "SGD_INSTALACION"."NOM_INSTALACION", "STAT_FLG"
			
    INTO :sle_2.text,   
         :sle_3.text,   
			:estado
    FROM "SGD_INSTALACION"  
	 WHERE "SGD_INSTALACION"."NRO_INSTALACION"=:gl_instalacion_afectada AND
	        BDI_JOB=(SELECT MAX(BDI_JOB) FROM SGD_INSTALACION 
			  WHERE "SGD_INSTALACION"."NRO_INSTALACION"=:gl_instalacion_afectada) ;   


if estado=128 then 
 	gnv_msg.f_mensaje("AG04","","",Ok!)
//	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La instalaci$$HEX1$$f300$$ENDHEX$$n solicitada est$$HEX2$$e1002000$$ENDHEX$$marcada para ser borrada")
end if
sle_1.text=string(gl_instalacion_afectada)
if sqlca.sqlcode=100 or estado=128 then 
	sle_1.text=""   
   sle_2.text=""   
   sle_3.text=""  
end if    

cbx_ambito.enabled=true
gb_1.visible=true
sle_1.visible=true
sle_2.visible=true
sle_3.visible=true
st_1.visible=true
st_2.visible=true
st_3.visible=true
end if
end event

type rb_alta from radiobutton within w_alfa_criterio
integer x = 1253
integer y = 64
integer width = 453
integer height = 76
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "&Alta"
boolean checked = true
boolean lefttext = true
end type

event clicked;//Modifica el aspecto para insertar la nueva instalacion

DataWindowChild ldwc_entidades
if dw_1.dataobject <> "dw_lista_entidad_alta" then 
   dw_1.SetRedraw(False)
	dw_1.dataobject="dw_lista_entidad_alta"
	dw_1.settransObject(sqlca)
	dw_1.insertrow(0)
	dw_1.ResetUpdate()	
	dw_1.GetChild("codigo",ldwc_entidades)
	ldwc_entidades.SetTransObject(SQLCA)
	ldwc_entidades.Retrieve()
	dw_1.SetRedraw(True)
end if	
cbx_ambito.enabled=false
cbx_ambito.checked=true
gb_1.visible=false
sle_1.visible=false
sle_2.visible=false
sle_3.visible=false
st_1.visible=false
st_2.visible=false
st_3.visible=false

end event

type st_4 from statictext within w_alfa_criterio
integer x = 41
integer y = 36
integer width = 640
integer height = 76
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "&Tipo de entidades"
boolean focusrectangle = false
end type

event getfocus;dw_1.setfocus()
end event

type sle_2 from singlelineedit within w_alfa_criterio
boolean visible = false
integer x = 393
integer y = 488
integer width = 681
integer height = 92
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
integer limit = 80
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_alfa_criterio
boolean visible = false
integer x = 393
integer y = 388
integer width = 681
integer height = 92
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
integer limit = 8
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_alfa_criterio
boolean visible = false
integer x = 393
integer y = 588
integer width = 681
integer height = 92
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
textcase textcase = upper!
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_alfa_criterio
boolean visible = false
integer x = 73
integer y = 608
integer width = 297
integer height = 76
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "&Nombre"
boolean focusrectangle = false
end type

event getfocus;sle_3.setfocus()
end event

type st_2 from statictext within w_alfa_criterio
boolean visible = false
integer x = 73
integer y = 504
integer width = 297
integer height = 76
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "Mat&ricula"
boolean focusrectangle = false
end type

event getfocus;sle_2.setfocus()
end event

type st_1 from statictext within w_alfa_criterio
boolean visible = false
integer x = 73
integer y = 400
integer width = 297
integer height = 76
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
string text = "C$$HEX1$$f300$$ENDHEX$$&digo"
boolean focusrectangle = false
end type

event getfocus;sle_1.setfocus()
end event

type cb_2 from commandbutton within w_alfa_criterio
integer x = 1307
integer y = 668
integer width = 361
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;//Cierra la ventana
if isvalid(onis) then
 onis.instalaciones[1].class_mem=-1
 onis.is_tipo_mod="-1"
end if
close (parent)
end event

type cb_1 from commandbutton within w_alfa_criterio
integer x = 1307
integer y = 524
integer width = 361
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Aceptar"
boolean default = true
end type

event clicked;//Recibe los datos de la pantalla, y muestra un listado con las instalaciones que cumplen
// el ambito seleccionado.

long ll_trabajo

long ll_encontrados = 0, ll_nro_instalacion
datawindowchild ddw_propiedad
long ll_tipo
setpointer(hourglass!)
if isvalid(onis) then
	ll_trabajo=onis.trabajo
end if	




// MODIFICACION O BAJA
if rb_modificacion.checked=true or rb_baja.checked=true then 
	if rb_modificacion.checked=true then 
		 onis.is_tipo_mod="2" // MODIFICACION 
	else	
		 onis.is_tipo_mod="3" // BAJA
	end if

	ls_codigo = trim(sle_1.text)
	ls_matricula = trim(sle_2.text)
	ls_nombre = trim(sle_3.text) 
	ls_tipo = dw_1.GetItemString(1,"codigo")

	if Isnull(ls_tipo) and ls_matricula="" and ls_nombre="" and ls_codigo="" then
		 	gnv_msg.f_mensaje("EX02","","",Ok!)
//			messagebox("Error","Debe seleccionar al menos un criterio de b$$HEX1$$fa00$$ENDHEX$$squeda.",StopSign!)
		return	
	end if	
	
	ls_codigo = ls_codigo + '%'
	ls_matricula = ls_matricula + '%'
	ls_nombre = ls_nombre + '%'


	if IsNull(ls_tipo) then 
		ls_tipo='%'
	end if	
	
   if cbx_ambito.checked 	then
		ls_ambito='S'
	else 
		ls_ambito='N'	
	end if 	
	ll_tipo = long (ls_tipo)


	SELECT count(*)
	INTO :ll_encontrados
	FROM "SGD_INSTALACION"  
	WHERE ( "SGD_INSTALACION"."TIPO_INSTALACION" > 0) AND  
		  ( "SGD_INSTALACION"."TIPO_INSTALACION" like :ls_tipo) AND  
			(:ls_tipo='4' AND :ls_nombre='%' AND "SGD_INSTALACION"."NOM_INSTALACION" is null or
			"SGD_INSTALACION"."NOM_INSTALACION" like :ls_nombre)  AND
			("SGD_INSTALACION"."MATRICULA" like :ls_matricula ) AND
			( "SGD_INSTALACION"."NRO_INSTALACION" like :ls_codigo ) AND 
			( :ls_ambito='N' or (("SGD_INSTALACION"."NRO_CENTRO" = :onis.il_centro ) AND
			("SGD_INSTALACION"."NRO_MESA" = :onis.il_puesto ) AND
			("SGD_INSTALACION"."NRO_CMD" = :onis.il_cmd ))) AND
			("SGD_INSTALACION"."BDI_JOB" = 0  OR 
			("SGD_INSTALACION"."BDI_JOB" = :ll_trabajo  AND
			"SGD_INSTALACION"."STAT_FLG" <> 128 ))	;

	if ll_encontrados <= 0 then
//		messagebox("Error","No hay ninguna instalaci$$HEX1$$f300$$ENDHEX$$n que cumpla dichos criterios o pertenece a otro $$HEX1$$e100$$ENDHEX$$mbito o se ha marcado para borrar")
		gnv_msg.f_mensaje("IX12","","",OK!)
		
		
		
		return
	elseif ll_encontrados > 1 then
		open(w_sel_instala)
	   onis.instalaciones[1].class_mem=long(Message.DoubleParm)	
		ll_tipo=tipo_instalacion(onis.instalaciones[1].class_mem)
			if ll_tipo=0 then 
				return
		   end if
	else
		SELECT "SGD_INSTALACION"."NRO_INSTALACION"
		INTO :ll_nro_instalacion
		FROM "SGD_INSTALACION"  
		WHERE ( "SGD_INSTALACION"."TIPO_INSTALACION" > 0) AND
			( "SGD_INSTALACION"."TIPO_INSTALACION" like :ls_tipo) AND  
			(:ls_tipo='4' AND :ls_nombre='%' AND "SGD_INSTALACION"."NOM_INSTALACION" is null or
			"SGD_INSTALACION"."NOM_INSTALACION" like :ls_nombre)  AND			("SGD_INSTALACION"."MATRICULA" like :ls_matricula ) AND
 			( "SGD_INSTALACION"."NRO_INSTALACION" like :ls_codigo ) AND
         (:ls_ambito='N' or (("SGD_INSTALACION"."NRO_CENTRO" = :onis.il_centro ) AND
			("SGD_INSTALACION"."NRO_MESA" = :onis.il_puesto ) AND
			("SGD_INSTALACION"."NRO_CMD" = :onis.il_cmd )) )AND 
			("SGD_INSTALACION"."BDI_JOB" = 0  OR 
			("SGD_INSTALACION"."BDI_JOB" = :ll_trabajo AND
			"SGD_INSTALACION"."STAT_FLG" <> 128 ))
		group by "SGD_INSTALACION"."NRO_INSTALACION";
			
			onis.instalaciones[1].class_mem=ll_nro_instalacion
			ll_tipo=tipo_instalacion(ll_nro_instalacion)
			if ll_tipo=0 then 
				return
		   end if
	end if


else
	// ALTA 
   
	ls_tipo = dw_1.GetItemString(1,"codigo")
	if IsNull(ls_tipo) then 
		gnv_msg.f_mensaje("EX04","","",Ok!)
//		messagebox("Error","Debe seleccionar el tipo de instalaci$$HEX1$$f300$$ENDHEX$$n",StopSign!)
		return	
	end if
	onis.is_tipo_mod="1"+ls_tipo
	ll_tipo = long (ls_tipo)
end if

if  onis.is_tipo_mod="3" and (ll_tipo=1 or ll_tipo=3 or ll_tipo=7 or ll_tipo=8) then
	// NO SE PERMITE BAJA ALFANUMERICA DE ELEMENTOS GRAFICOS
	gnv_msg.f_mensaje("EX05","","",YesNo!)
//	messagebox("Error","Borrado no permitido, debe hacerlo graficamente",StopSign!)
	 onis.instalaciones[1].class_mem=-1
end if
close(parent)	
	
end event

type dw_1 from datawindow within w_alfa_criterio
integer x = 18
integer y = 104
integer width = 1042
integer height = 104
integer taborder = 80
string dataobject = "dw_lista_entidad"
boolean border = false
end type

event clicked;//long ll_fila = 1
//
////ll_fila = dw_1.getselectedrow(0)
////do while ll_fila <> 0
////	dw_1.selectrow(ll_fila,false)
////	ll_fila ++
////	ll_fila = dw_1.getselectedrow(ll_fila)
////loop
////dw_1.selectrow(row,true)
////cb_1.enabled = true
//
//for ll_fila=1 to dw_1.rowcount()
//	dw_1.selectrow(ll_fila,false)
//next
//dw_1.selectrow(row,true)
//cb_1.enabled = true
end event

event itemchanged;sle_1.text=""
sle_2.text=""
sle_3.text=""
end event

type gb_3 from groupbox within w_alfa_criterio
integer x = 1239
integer y = 8
integer width = 494
integer height = 360
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type

type gb_1 from groupbox within w_alfa_criterio
boolean visible = false
integer x = 37
integer y = 340
integer width = 1083
integer height = 380
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
end type


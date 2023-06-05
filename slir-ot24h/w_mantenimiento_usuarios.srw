HA$PBExportHeader$w_mantenimiento_usuarios.srw
forward
global type w_mantenimiento_usuarios from w_sgigenerica
end type
type cb_alta from commandbutton within w_mantenimiento_usuarios
end type
type cb_modificacion from commandbutton within w_mantenimiento_usuarios
end type
type cb_baja from commandbutton within w_mantenimiento_usuarios
end type
type cb_salir from commandbutton within w_mantenimiento_usuarios
end type
type dw_lista_usuarios from u_gen_0000_lista within w_mantenimiento_usuarios
end type
type dw_perfil from datawindow within w_mantenimiento_usuarios
end type
type st_2 from statictext within w_mantenimiento_usuarios
end type
type sle_filtro from singlelineedit within w_mantenimiento_usuarios
end type
type cb_1 from commandbutton within w_mantenimiento_usuarios
end type
type rb_usuario from radiobutton within w_mantenimiento_usuarios
end type
type rb_nombre from radiobutton within w_mantenimiento_usuarios
end type
type gb_1 from groupbox within w_mantenimiento_usuarios
end type
type gb_3 from groupbox within w_mantenimiento_usuarios
end type
type gb_2 from groupbox within w_mantenimiento_usuarios
end type
end forward

global type w_mantenimiento_usuarios from w_sgigenerica
integer width = 3630
integer height = 2272
string title = "OPEN SGI - Mantenimiento de Usuarios"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
cb_alta cb_alta
cb_modificacion cb_modificacion
cb_baja cb_baja
cb_salir cb_salir
dw_lista_usuarios dw_lista_usuarios
dw_perfil dw_perfil
st_2 st_2
sle_filtro sle_filtro
cb_1 cb_1
rb_usuario rb_usuario
rb_nombre rb_nombre
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type
global w_mantenimiento_usuarios w_mantenimiento_usuarios

type variables

end variables

on w_mantenimiento_usuarios.create
int iCurrent
call super::create
this.cb_alta=create cb_alta
this.cb_modificacion=create cb_modificacion
this.cb_baja=create cb_baja
this.cb_salir=create cb_salir
this.dw_lista_usuarios=create dw_lista_usuarios
this.dw_perfil=create dw_perfil
this.st_2=create st_2
this.sle_filtro=create sle_filtro
this.cb_1=create cb_1
this.rb_usuario=create rb_usuario
this.rb_nombre=create rb_nombre
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_alta
this.Control[iCurrent+2]=this.cb_modificacion
this.Control[iCurrent+3]=this.cb_baja
this.Control[iCurrent+4]=this.cb_salir
this.Control[iCurrent+5]=this.dw_lista_usuarios
this.Control[iCurrent+6]=this.dw_perfil
this.Control[iCurrent+7]=this.st_2
this.Control[iCurrent+8]=this.sle_filtro
this.Control[iCurrent+9]=this.cb_1
this.Control[iCurrent+10]=this.rb_usuario
this.Control[iCurrent+11]=this.rb_nombre
this.Control[iCurrent+12]=this.gb_1
this.Control[iCurrent+13]=this.gb_3
this.Control[iCurrent+14]=this.gb_2
end on

on w_mantenimiento_usuarios.destroy
call super::destroy
destroy(this.cb_alta)
destroy(this.cb_modificacion)
destroy(this.cb_baja)
destroy(this.cb_salir)
destroy(this.dw_lista_usuarios)
destroy(this.dw_perfil)
destroy(this.st_2)
destroy(this.sle_filtro)
destroy(this.cb_1)
destroy(this.rb_usuario)
destroy(this.rb_nombre)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : open
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Carga los valores de la datawindow y habilita / deshabilita los botones dependiendo del perfil 	
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 17/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_perfil

DataWindowChild ldwc_perfiles


dw_perfil.dataobject='d_perfil'
dw_perfil.settransobject(sqlca)
dw_perfil.insertrow(0)
dw_perfil.ResetUpdate()
dw_perfil.GetChild('perfil',ldwc_perfiles)
ldwc_perfiles.SetTransObject(sqlca)
li_perfil=ldwc_perfiles.Retrieve()
if ldwc_perfiles.rowcount()=0 then
	gnv_msg.f_mensaje("EG46","","",Ok!)		
//	messagebox("Aviso","No existen perfiles definidos")
	close(this)
	return
end if

ldwc_perfiles.scrolltorow(1)
ldwc_perfiles.selectrow(0,False)
ldwc_perfiles.selectrow(1,true)


li_perfil= ldwc_perfiles.getitemnumber(ldwc_perfiles.getselectedrow(0),"perfil")
dw_perfil.setitem(1,"perfil",li_perfil)


dw_perfil.accepttext()

dw_lista_usuarios.SetTransObject(sqlca)
dw_lista_usuarios.retrieve(string(li_perfil))

// No Hay registros
if dw_lista_usuarios.rowcount()=0 then
	cb_baja.enabled=  false
	cb_modificacion.enabled = false
else
	dw_lista_usuarios.ScrollToRow(1)
	dw_lista_usuarios.selectrow(0,False)
	dw_lista_usuarios.selectrow(1,true)
end if

if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN")= 0 then // CONSULTA
	cb_baja.enabled=  false
	cb_alta.enabled= false
	cb_modificacion.text="&Consulta"
end if


dw_perfil.setfocus()


timer(900,this)










end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_mantenimiento_usuarios
end type

type cb_alta from commandbutton within w_mantenimiento_usuarios
integer x = 357
integer y = 1668
integer width = 453
integer height = 108
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Agregar"
end type

event clicked;int li_perfil


li_perfil=dw_perfil.getitemnumber(1,"perfil")
gu_comunic.is_comunic.strval1="ALTA"
gu_comunic.is_comunic.intval1=li_perfil
open(w_datos_usuario_sgi)
dw_lista_usuarios.retrieve(string(li_perfil))
// No Hay registros
if dw_lista_usuarios.rowcount()=0 then
		cb_baja.enabled=  false
		cb_modificacion.enabled = false
else
if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN")= 1 then cb_baja.enabled=  true
		cb_modificacion.enabled = true
		dw_lista_usuarios.ScrollToRow(1)
		dw_lista_usuarios.selectrow(0,False)
		dw_lista_usuarios.selectrow(1,true)
end if
		
end event

type cb_modificacion from commandbutton within w_mantenimiento_usuarios
integer x = 1147
integer y = 1668
integer width = 453
integer height = 108
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Modificar"
boolean default = true
end type

event clicked;string ls_usuario
integer li_resultado
int li_fila, li_perfil
setpointer(hourglass!)

li_fila=dw_lista_usuarios.getselectedrow(0)
if li_fila>0 then
		li_perfil=dw_perfil.getitemnumber(1,"perfil")
		ls_usuario= dw_lista_usuarios.getitemstring(li_fila,"usuario")
		// ABRE VENTANA DE USUARIOS
		gu_comunic.is_comunic.strval2=ls_usuario
		gu_comunic.is_comunic.strval1="MOD"
		gu_comunic.is_comunic.intval1=li_perfil
		open(w_datos_usuario_sgi)
			//
		dw_lista_usuarios.retrieve(string(li_perfil))	
		// No Hay registros
			if dw_lista_usuarios.rowcount()=0 then
				cb_baja.enabled=  false
				cb_modificacion.enabled = false
			else
			if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN")= 1 then cb_baja.enabled=  true
				cb_modificacion.enabled = true
				dw_lista_usuarios.ScrollToRow(1)
				dw_lista_usuarios.selectrow(0,False)
				dw_lista_usuarios.selectrow(1,true)
			end if
		
		
end if
end event

type cb_baja from commandbutton within w_mantenimiento_usuarios
integer x = 1993
integer y = 1668
integer width = 453
integer height = 108
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Borrar"
end type

event clicked;string ls_usuario ,ls_resultado
integer li_resultado
int li_fila

li_fila=dw_lista_usuarios.getselectedrow(0)
if li_fila>0 then 
	ls_usuario= dw_lista_usuarios.getitemstring(li_fila,"usuario")
	
	IF ls_usuario = gs_usuario then
		gnv_msg.f_mensaje("CG21","","",Ok!)	
		return
	END IF
	
	if gnv_msg.f_mensaje("CG17","","",YesNo!) =2 then 		
//	if messagebox("Aviso","$$HEX1$$bf00$$ENDHEX$$Estas seguro de que quieres borrar el usuario?",Question!,YesNo!)=2 then 
		return
	end if
	

	// BORRAMOS LA FILA
		
		
		dw_lista_usuarios.deleterow(li_fila)
		if dw_lista_usuarios.Update()=1 then 
			  DELETE FROM "GI_USUARIO_PERFILES"  
			   WHERE "GI_USUARIO_PERFILES"."ID_USUARIO" = :ls_usuario;
				if sqlca.sqlcode<>0 then
					gnv_msg.f_mensaje("AA20","","",Ok!)		
//					messagebox("Aviso","No se pudo borrar el registro")
					gnu_u_transaction.uf_rollback();
					return 
				end if
			gnu_u_transaction.uf_commit();
			
					// No Hay registros
					if dw_lista_usuarios.rowcount()=0 then
						cb_baja.enabled=  false
						cb_modificacion.enabled = false
					else
     				if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN")= 1 then cb_baja.enabled=  true
						cb_modificacion.enabled = true
						dw_lista_usuarios.ScrollToRow(1)
						dw_lista_usuarios.selectrow(0,False)
						dw_lista_usuarios.selectrow(1,true)
					end if
					
					
		
		else
			gnv_msg.f_mensaje("AA20","","",Ok!)		
	//		messagebox("Aviso","No se puedo borrar el registro")
			gnu_u_transaction.uf_rollback();
		end if 
		

end if


end event

type cb_salir from commandbutton within w_mantenimiento_usuarios
integer x = 2825
integer y = 1668
integer width = 453
integer height = 108
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Salir"
boolean cancel = true
end type

event clicked;close(parent)
end event

type dw_lista_usuarios from u_gen_0000_lista within w_mantenimiento_usuarios
event ue_key_down pbm_dwnkey
integer x = 302
integer y = 588
integer width = 3031
integer height = 932
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_lista_usuarios"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
borderstyle borderstyle = styleraised!
end type

event ue_key_down;/////////////////////////////////////////////////////
//      Permite borrar o agregar incidencias desde el teclado
//      dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row 

IF keyflags = 0 THEN  // Controlo que no haya presionado
                                                        // control ni shift
			this.setredraw(false)																		  
        ll_row = This.Getselectedrow(0)
        
        IF key = KeyUpArrow! and ll_row > 1 THEN
//                this.ScrollToRow(ll_row - 1)
                this.selectrow(0,False)
                this.selectrow(ll_row - 1,true)
					 //this.setrow(ll_row - 1)		 
					 
					 
					 
					 
					 
        ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
//                this.ScrollToRow(ll_row - 1)
                this.selectrow(0,False)
                this.selectrow(ll_row + 1,true)
//	 				 this.setrow(ll_row + 1)		 
        END IF
			this.setredraw(true)
END IF

end event

event clicked;call super::clicked;if row > 0 then 
	this.setredraw(false)
	This.SelectRow(0, FALSE)
	dw_lista_usuarios.selectrow(row,true)
	This.Setrow(row)
	this.setredraw(true)
end if
end event

event doubleclicked;call super::doubleclicked;if row>0 then 
	cb_modificacion.triggerevent(clicked!)	
end if
end event

event losefocus;call super::losefocus;st_2.backcolor=long(276856960)
st_2.textcolor=long(79741120)


end event

event getfocus;call super::getfocus;st_2.backcolor=long(0)
st_2.textcolor=long(79741120)

end event

type dw_perfil from datawindow within w_mantenimiento_usuarios
integer x = 347
integer y = 240
integer width = 1257
integer height = 108
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_perfil"
boolean border = false
boolean livescroll = true
end type

event itemchanged;//LSH INI 10/06/2014 MEJORA DEO14-00000643
/*Se limpian los filtros utilizados para filtrar Id usuario y Nombre de usuario*/
dw_lista_usuarios.setfilter('')
dw_lista_usuarios.filter() 
sle_filtro.text = ''
//LSH FIN 10/06/2014 MEJORA DEO14-00000643

if row>0 then
	dw_lista_usuarios.retrieve(data)
	// No Hay registros
	if dw_lista_usuarios.rowcount()=0 then
		cb_baja.enabled=  false
		cb_modificacion.enabled = false
	else
		cb_baja.enabled=  true
		cb_modificacion.enabled = true
		dw_lista_usuarios.ScrollToRow(1)
		dw_lista_usuarios.selectrow(0,False)
		dw_lista_usuarios.selectrow(1,true)
	end if

	if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN")= 0 then // CONSULTA
		cb_baja.enabled=  false
		cb_alta.enabled= false
		cb_modificacion.text="&Consulta"
	end if

end if
end event

event getfocus;//st_1.backcolor=long(0)
//st_1.textcolor=long(79741120)
//
end event

event losefocus;//st_1.backcolor=long(276856960)
//st_1.textcolor=long(79741120)
//

end event

type st_2 from statictext within w_mantenimiento_usuarios
integer x = 302
integer y = 512
integer width = 3031
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 67108864
long backcolor = 8421504
string text = "Usuarios"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;dw_lista_usuarios.setfocus()

end event

type sle_filtro from singlelineedit within w_mantenimiento_usuarios
integer x = 2235
integer y = 244
integer width = 517
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_mantenimiento_usuarios
integer x = 2775
integer y = 244
integer width = 517
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Filtrar"
end type

event clicked;//LSH INI 10/06/2014 MEJORA DEO14-00000643
string ls_filter, ls_perfil,ls_filtro

ls_perfil = string(dw_perfil.GetItemNumber( 1, "perfil" ))

ls_filtro = upper(sle_filtro.text)

//dw_lista_usuarios.reset()
//dw_lista_usuarios.retrieve(ls_perfil)

IF rb_usuario.checked = TRUE THEN
	ls_filter = "UPPER(GI_USUARIO_SGI.USUARIO) LIKE '"+ls_filtro+"%'"
ELSE
	ls_filter = "UPPER(GI_USUARIO_SGI.NOM_USUARIO) LIKE '"+ls_filtro+"%'"
END IF

dw_lista_usuarios.SetFilter(ls_filter)
dw_lista_usuarios.Filter()

dw_lista_usuarios.retrieve(ls_perfil)
//LSH INI 10/06/2014 MEJORA DEO14-00000643
end event

type rb_usuario from radiobutton within w_mantenimiento_usuarios
integer x = 1797
integer y = 216
integer width = 366
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuario"
boolean checked = true
end type

type rb_nombre from radiobutton within w_mantenimiento_usuarios
integer x = 1797
integer y = 312
integer width = 366
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nombre"
end type

type gb_1 from groupbox within w_mantenimiento_usuarios
integer x = 297
integer y = 128
integer width = 1344
integer height = 288
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Perfil"
end type

type gb_3 from groupbox within w_mantenimiento_usuarios
integer x = 1765
integer y = 156
integer width = 443
integer height = 256
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_2 from groupbox within w_mantenimiento_usuarios
integer x = 1719
integer y = 92
integer width = 1614
integer height = 364
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtro"
end type


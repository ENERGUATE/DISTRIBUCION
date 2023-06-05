HA$PBExportHeader$w_mantenimiento_perfiles.srw
forward
global type w_mantenimiento_perfiles from w_sgigenerica
end type
type cb_modificacion from commandbutton within w_mantenimiento_perfiles
end type
type cb_alta from commandbutton within w_mantenimiento_perfiles
end type
type cb_baja from commandbutton within w_mantenimiento_perfiles
end type
type cb_cerrar from commandbutton within w_mantenimiento_perfiles
end type
type dw_lista_perfiles from u_gen_0000_lista within w_mantenimiento_perfiles
end type
type st_1 from statictext within w_mantenimiento_perfiles
end type
end forward

global type w_mantenimiento_perfiles from w_sgigenerica
int Width=3630
int Height=2272
boolean TitleBar=true
string Title="OPEN SGI - Mantenimiento de Perfiles"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
cb_modificacion cb_modificacion
cb_alta cb_alta
cb_baja cb_baja
cb_cerrar cb_cerrar
dw_lista_perfiles dw_lista_perfiles
st_1 st_1
end type
global w_mantenimiento_perfiles w_mantenimiento_perfiles

type variables
long il_row
boolean ib_borrar = true
end variables

forward prototypes
public function integer wf_siguiente_codigo_perfil ()
end prototypes

public function integer wf_siguiente_codigo_perfil ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : wf_siguiente_codigo_perfil
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Obtiene el nuevo c$$HEX1$$f300$$ENDHEX$$digo del perfil 
//	
//
//  Valores de retorno : 0 --> Error
//				  				 >0 --> codigo del perfil
//
//
//  Realizado  Alfonso Coto
//
//  Fecha : 22/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////





int li_perfil
  
  
   SELECT "GI_T_ULTIMO"."ULTIMO"  
    INTO :li_perfil 
    FROM "GI_T_ULTIMO"  
   WHERE "GI_T_ULTIMO"."TABLA" = 'GI_PERFILES'  FOR UPDATE NOWAIT USING sqlca  ;
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
	 	return 0
	end if
	
	
	li_perfil=li_perfil+1
	
	
	  UPDATE "GI_T_ULTIMO"  
     SET "ULTIMO" = :li_perfil  
   WHERE "GI_T_ULTIMO"."TABLA" = 'GI_PERFILES' USING sqlca  ;
	
	if sqlca.sqlcode<>0 then
		gnu_u_transaction.uf_rollback();
	 	return 0
	end if
	gnu_u_transaction.uf_commit();
	
	return li_perfil
end function

on w_mantenimiento_perfiles.create
int iCurrent
call super::create
this.cb_modificacion=create cb_modificacion
this.cb_alta=create cb_alta
this.cb_baja=create cb_baja
this.cb_cerrar=create cb_cerrar
this.dw_lista_perfiles=create dw_lista_perfiles
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modificacion
this.Control[iCurrent+2]=this.cb_alta
this.Control[iCurrent+3]=this.cb_baja
this.Control[iCurrent+4]=this.cb_cerrar
this.Control[iCurrent+5]=this.dw_lista_perfiles
this.Control[iCurrent+6]=this.st_1
end on

on w_mantenimiento_perfiles.destroy
call super::destroy
destroy(this.cb_modificacion)
destroy(this.cb_alta)
destroy(this.cb_baja)
destroy(this.cb_cerrar)
destroy(this.dw_lista_perfiles)
destroy(this.st_1)
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


dw_lista_perfiles.SetTransObject(sqlca)
dw_lista_perfiles.retrieve()

// No Hay registros
if dw_lista_perfiles.rowcount()=0 then
	cb_baja.enabled=  false
	cb_modificacion.enabled = false
else
	dw_lista_perfiles.ScrollToRow(1)
	dw_lista_perfiles.selectrow(0,False)
   dw_lista_perfiles.selectrow(1,true)
	il_row = 1
end if

if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN") = 0 then // MANTE
	cb_baja.enabled= false
	cb_alta.enabled= false
	cb_modificacion.text="&Consulta"
end if

timer(900,this)


cb_baja.enabled=false
end event

type cb_modificacion from commandbutton within w_mantenimiento_perfiles
int X=1143
int Y=1704
int Width=421
int Height=108
int TabOrder=30
boolean BringToTop=true
string Text="&Modificar"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;integer li_perfil
integer li_resultado
int li_fila

li_fila=dw_lista_perfiles.getselectedrow(0)
if li_fila>0 then
		li_perfil= dw_lista_perfiles.getitemnumber(li_fila,"perfil")
		gu_comunic.is_comunic.intval1=li_perfil
		gu_comunic.is_comunic.strval1="MOD"
		open(w_mantenimiento_opciones)
end if
end event

type cb_alta from commandbutton within w_mantenimiento_perfiles
int X=242
int Y=1704
int Width=411
int Height=108
int TabOrder=20
boolean BringToTop=true
string Text="&Agregar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;integer li_perfil
integer li_resultado
int li_fila
li_perfil= wf_siguiente_codigo_perfil()

if li_perfil=0 then 
	gnv_msg.f_mensaje("EG43","","",Ok!)		
//	messagebox("Aviso","No se ha obtenido el nuevo c$$HEX1$$f300$$ENDHEX$$digo del perfil")
	return
end if


// ABRE VENTANA DE ACCESOS
   gu_comunic.is_comunic.intval1=li_perfil
	gu_comunic.is_comunic.strval1="ALTA"
   open(w_mantenimiento_opciones)
	if gu_comunic.is_comunic.strval1="ALTA" then // SE HA DADO DE ALTA UN NUEVO REGISTRO
		dw_lista_perfiles.retrieve()
		li_fila= dw_lista_perfiles.find("perfil = "+ string(li_perfil),1,dw_lista_perfiles.rowcount())
		if li_fila<1 then li_fila=1
		dw_lista_perfiles.ScrollToRow(li_fila)
		dw_lista_perfiles.selectrow(0,False)
		dw_lista_perfiles.selectrow(li_fila,true)
end if

end event

type cb_baja from commandbutton within w_mantenimiento_perfiles
int X=2007
int Y=1704
int Width=407
int Height=108
int TabOrder=40
boolean BringToTop=true
string Text="Bo&rrar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;integer li_perfil
integer li_resultado
int li_fila

li_fila=dw_lista_perfiles.getselectedrow(0)
if li_fila>0 then 
	IF gnv_msg.f_mensaje("CG16","","",YesNo!)=2 THEN
//	if messagebox("Aviso","$$HEX1$$bf00$$ENDHEX$$Estas seguro que quieres borrar el perfil?",Question!,YesNo!)=2 then 
		return
	end if
	
		li_perfil= dw_lista_perfiles.getitemnumber(li_fila,"perfil")
		
// BLOQUEAMOS EL REGISTRO		 	
	SELECT PERFIL
   INTO :li_resultado
	FROM "GI_PERFILES"  
	WHERE ( "GI_PERFILES"."PERFIL" = :li_perfil ) AND  
			( "GI_PERFILES"."PERFIL" not in (SELECT distinct "GI_USUARIO_PERFILES"."PERFIL"  
				 FROM "GI_USUARIO_PERFILES" )) ;
			
	// EL PERFIL TIENE USUARIOS??		
		if isnull(li_resultado) OR li_resultado = 0 then
				gnv_msg.f_mensaje("EG44","","",Ok!)		
//				messagebox("Aviso","No se puede borrar el perfil, hay usuarios que lo est$$HEX1$$e100$$ENDHEX$$n usando")
				gnu_u_transaction.uf_rollback();
				return 
			end if	
					
		
		// BORRAMOS LA FILA
		
		
		dw_lista_perfiles.deleterow(li_fila)
		if dw_lista_perfiles.Update()=1 then 
			
			delete from gi_acceso_perfil where perfil = :li_perfil using sqlca;
			gnu_u_transaction.uf_commit();
					// No Hay registros
					if dw_lista_perfiles.rowcount()=0 then
						cb_baja.enabled=  false
						cb_alta.enabled= true
						cb_modificacion.enabled = false
					else
						cb_alta.enabled= true
						cb_modificacion.enabled = true
						dw_lista_perfiles.ScrollToRow(1)
						dw_lista_perfiles.selectrow(0,False)
						dw_lista_perfiles.selectrow(1,true)
					end if
				
		
		else
			gnv_msg.f_mensaje("AA20","","",Ok!)		
//			messagebox("Aviso","No se puedo borrar el registro")
gnu_u_transaction.uf_rollback();
		end if 
		

end if


end event

type cb_cerrar from commandbutton within w_mantenimiento_perfiles
int X=2857
int Y=1704
int Width=407
int Height=108
int TabOrder=50
boolean BringToTop=true
string Text="&Salir"
boolean Cancel=true
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;close(parent)
end event

type dw_lista_perfiles from u_gen_0000_lista within w_mantenimiento_perfiles
int X=370
int Y=264
int Width=2779
int Height=1272
int TabOrder=10
boolean BringToTop=true
string DataObject="d_lista_perfiles"
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
end type

event clicked;if isnull(row) then row = this.getselectedrow(0)
if row > 0  then 
	
	this.setredraw(false)
	This.SelectRow(0, FALSE)
	dw_lista_perfiles.selectrow(row,true)
	This.Setrow(row)
	this.setredraw(true)

	if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN") =  1 then
		if row>0 and This.Getselectedrow(0)<> 0 then
			if this.getitemnumber(row,"usuarios")=0 then
				cb_baja.enabled=true
			else	
				cb_baja.enabled=false
			end if
		end if
	
	end if

end if
end event

event doubleclicked;if row>0 then 
	cb_modificacion.triggerevent(clicked!)	
end if
end event

event losefocus;call super::losefocus;st_1.backcolor=long(276856960)
st_1.textcolor=long(79741120)


end event

event getfocus;call super::getfocus;st_1.backcolor=long(0)
st_1.textcolor=long(79741120)

end event

event rowfocuschanged;call super::rowfocuschanged;
//if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN") =  1 then
//if currentrow>0 and This.Getselectedrow(0)<> 0 then
//	if this.getitemnumber(currentrow,"usuarios")=0 and ib_borrar then
//		cb_baja.enabled=true
//	else	
//		cb_baja.enabled=false
//	end if
//end if
//
//end if
//


end event

event ue_key_down;/////////////////////////////////////////////////////
//	Permite moverse con los cursores desde el teclado
// GSE 18/05/2001
//
//////////////////////////////////////////////////////
long ll_row

IF keyflags = 0 and this.rowcount() > 1 THEN  
	ll_row = This.Getselectedrow(0)
	
	IF key = KeyUpArrow! and ll_row > 1 THEN
		this.selectrow(0,False)
      ll_row = ll_row - 1		
		this.selectrow(ll_row,true)
		this.triggerevent(clicked!)	
	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
		this.selectrow(0,False)
		ll_row = ll_row + 1
		this.selectrow(ll_row ,true)
		this.triggerevent(clicked!)	
	ELSEIF Key = KeyLeftArrow! or Key = KeyRightArrow! THEN
		RETURN
	END IF

END IF
end event

type st_1 from statictext within w_mantenimiento_perfiles
int X=370
int Y=192
int Width=2779
int Height=76
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="Perfiles del OpenSgi"
Alignment Alignment=Center!
long TextColor=79741120
long BackColor=276856960
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if backcolor<>0 then
	dw_lista_perfiles.setfocus()
end if
end event


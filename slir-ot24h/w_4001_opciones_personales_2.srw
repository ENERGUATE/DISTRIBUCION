HA$PBExportHeader$w_4001_opciones_personales_2.srw
forward
global type w_4001_opciones_personales_2 from w_sgigenerica
end type
type cbx_5 from checkbox within w_4001_opciones_personales_2
end type
type cbx_4 from checkbox within w_4001_opciones_personales_2
end type
type cbx_3 from checkbox within w_4001_opciones_personales_2
end type
type cbx_2 from checkbox within w_4001_opciones_personales_2
end type
type cbx_1 from checkbox within w_4001_opciones_personales_2
end type
type gb_1 from groupbox within w_4001_opciones_personales_2
end type
end forward

global type w_4001_opciones_personales_2 from w_sgigenerica
int X=974
int Y=652
int Width=1687
int Height=920
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Opciones Personalizadas"
long BackColor=79741120
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
gb_1 gb_1
end type
global w_4001_opciones_personales_2 w_4001_opciones_personales_2

event closequery;int li_avisos
datetime ldt_f_actual

ldt_f_actual = datetime(today(),now())

if gu_perfiles.of_acceso_perfil(gi_perfil,'OP_PERS','ACC_MANTEN')=1 then 
	if cbx_1.checked=true then
			  li_avisos=1
	else 
			  li_avisos=0
	end if
	
	UPDATE "SGD_PARAMETROS"  
			  SET "VALOR"   = :li_avisos,
			      "USUARIO" = :gs_usuario,
					"F_ACTUAL"= :ldt_f_actual
			  WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '1'   ;
	
	
	if cbx_2.checked=true then
			  li_avisos=1
	else 
			  li_avisos=0
	end if
	
	UPDATE "SGD_PARAMETROS"  
			  SET "VALOR"   = :li_avisos ,
			      "USUARIO" = :gs_usuario ,
					"F_ACTUAL"= :ldt_f_actual
			  WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '10'   ;
	
	
	if cbx_3.checked=true then
			  li_avisos=1
	else 
			  li_avisos=0
	end if
	
	UPDATE "SGD_PARAMETROS"  
			  SET "VALOR"   = :li_avisos,
			      "USUARIO" = :gs_usuario,
					"F_ACTUAL"= :ldt_f_actual
			  WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '9'   ;
	
	
	if cbx_4.checked=true then
			  li_avisos=1
	else 
			  li_avisos=0
	end if
	
	UPDATE "SGD_PARAMETROS"  
			  SET "VALOR"   = :li_avisos ,
			      "USUARIO" = :gs_usuario,
					"F_ACTUAL"= :ldt_f_actual
			  WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '14'  ;
	
	
	
	gnu_u_transaction.uf_commit(); 
	
	gl_nro_aviso_visible=cbx_1.checked
	gb_obs_obligatorias = cbx_2.checked 

end if
end event

event open;call super::open;cbx_1.checked = gl_nro_aviso_visible
cbx_2.checked= gb_obs_obligatorias 
if gu_perfiles.of_acceso_perfil(gi_perfil,'OP_PERS','ACC_MANTEN')=0 then 
	cbx_1.enabled=false
	cbx_2.enabled=false
	cbx_3.enabled=false
	cbx_4.enabled=false
end if

int li_avisos

SELECT "SGD_PARAMETROS"."VALOR"
INTO :li_avisos  
FROM  "SGD_PARAMETROS" 
WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '9'   ;

IF li_avisos = 1 THEN
	cbx_3.checked= true
ELSE
	cbx_3.checked= false
END IF

	
SELECT "SGD_PARAMETROS"."VALOR"
INTO :li_avisos  
FROM  "SGD_PARAMETROS" 
WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '14'   ;


cbx_4.checked= false


If gb_potencia Then
	cbx_5.checked= true
ELSE
	cbx_5.checked= false
END IF

end event

on w_4001_opciones_personales_2.create
int iCurrent
call super::create
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_5
this.Control[iCurrent+2]=this.cbx_4
this.Control[iCurrent+3]=this.cbx_3
this.Control[iCurrent+4]=this.cbx_2
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.gb_1
end on

on w_4001_opciones_personales_2.destroy
call super::destroy
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.gb_1)
end on

type cbx_5 from checkbox within w_4001_opciones_personales_2
int X=174
int Y=652
int Width=1330
int Height=76
string Text="Potencia Contratada en Consulta de Avisos"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//***************************************************************************//
//  Parametrizacion: Visualizar Potencia Contratada en Consulta de Avisos    //
//  Luis Eduardo Ortiz  Abril /2001                                          //
//***************************************************************************//

If This.Checked Then
	gb_potencia = TRUE
Else
	gb_potencia = FALSE
End If
end event

type cbx_4 from checkbox within w_4001_opciones_personales_2
int X=174
int Y=520
int Width=1330
int Height=76
boolean Enabled=false
string Text="Observaciones de Incidencias en Word"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_3 from checkbox within w_4001_opciones_personales_2
int X=174
int Y=388
int Width=1330
int Height=76
string Text="Env$$HEX1$$ed00$$ENDHEX$$o Email a Solicitantes Descargos           "
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_2 from checkbox within w_4001_opciones_personales_2
int X=174
int Y=256
int Width=1330
int Height=76
string Text="Observaciones Obligatorias en Incidencias"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cbx_1 from checkbox within w_4001_opciones_personales_2
int X=174
int Y=124
int Width=1330
int Height=76
string Text="Activar N$$HEX1$$fa00$$ENDHEX$$mero de Aviso en Consulta"
BorderStyle BorderStyle=StyleLowered!
boolean LeftText=true
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_4001_opciones_personales_2
int X=105
int Y=28
int Width=1449
int Height=760
int TabOrder=1
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-9
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


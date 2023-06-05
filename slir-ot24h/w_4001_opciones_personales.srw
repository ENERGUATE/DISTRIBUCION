HA$PBExportHeader$w_4001_opciones_personales.srw
forward
global type w_4001_opciones_personales from w_sgigenerica
end type
type cbx_4 from checkbox within w_4001_opciones_personales
end type
type cbx_3 from checkbox within w_4001_opciones_personales
end type
type cbx_2 from checkbox within w_4001_opciones_personales
end type
type cbx_1 from checkbox within w_4001_opciones_personales
end type
type cbx_5 from checkbox within w_4001_opciones_personales
end type
type dw_mante_email from u_sgt_instalaciones within w_4001_opciones_personales
end type
type cb_mas from commandbutton within w_4001_opciones_personales
end type
type cb_menos from commandbutton within w_4001_opciones_personales
end type
type gb_1 from groupbox within w_4001_opciones_personales
end type
end forward

global type w_4001_opciones_personales from w_sgigenerica
integer x = 974
integer y = 652
integer width = 1691
integer height = 1256
string title = "OPEN SGI - Opciones Personalizadas"
windowtype windowtype = response!
long backcolor = 79741120
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
cbx_5 cbx_5
dw_mante_email dw_mante_email
cb_mas cb_mas
cb_menos cb_menos
gb_1 gb_1
end type
global w_4001_opciones_personales w_4001_opciones_personales

forward prototypes
public function integer fw_anade_registro ()
end prototypes

public function integer fw_anade_registro ();int li_reg
datetime f_alta

li_reg = dw_mante_email.insertrow(0)
f_alta = fgnu_fecha_actual()

dw_mante_email.object.codif[li_reg] = 'MAIL'
dw_mante_email.object.f_actual[li_reg] = f_alta
dw_mante_email.object.usuario[li_reg] = gs_usuario
dw_mante_email.object.programa[li_reg] = 'OPCIONES'
dw_mante_email.object.valor[li_reg] = string(dw_mante_email.rowcount() + 1)
dw_mante_email.object.codigo[li_reg] = dw_mante_email.rowcount() + 1

return 1
end function

event closequery;int li_avisos
datetime ldt_f_actual
int li_conta
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
	
	if cbx_5.checked=true then
		
		for li_conta = 1 to dw_mante_email.rowcount()
			if isnull(dw_mante_email.object.descripcion[li_conta]) then 
				messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Debe rellenar el campo mail.",information!,ok!)
				return 1
			end if
		next
		
		dw_mante_email.accepttext()
		dw_mante_email.update()
		
		UPDATE "GI_PARAMETROS"  
			  SET "VALOR"   = 1 ,
			      "USUARIO" = :gs_usuario,
					"F_ACTUAL"= :ldt_f_actual
			  WHERE "GI_PARAMETROS"."COD_PARAMETRO" = '93'  ;
	else
	
		UPDATE "GI_PARAMETROS"  
			  SET "VALOR"   = 0 ,
			      "USUARIO" = :gs_usuario,
					"F_ACTUAL"= :ldt_f_actual
			  WHERE "GI_PARAMETROS"."COD_PARAMETRO" = '93'  ;
	
	end if	
	
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

SELECT "GI_PARAMETROS"."VALOR"
INTO :li_avisos  
FROM  "GI_PARAMETROS" 
WHERE "GI_PARAMETROS"."COD_PARAMETRO" = '93'   ;

IF li_avisos = 1 THEN
	cbx_5.checked= true
	dw_mante_email.enabled = true
	cb_mas.enabled = true
	cb_menos.enabled = true
ELSE
	cbx_5.checked= false
END IF
	
SELECT "SGD_PARAMETROS"."VALOR"
INTO :li_avisos  
FROM  "SGD_PARAMETROS" 
WHERE "SGD_PARAMETROS"."COD_PARAMETRO" = '14'   ;

cbx_4.checked= false

dw_mante_email.settransobject(sqlca)
dw_mante_email.retrieve()

end event

on w_4001_opciones_personales.create
int iCurrent
call super::create
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.cbx_5=create cbx_5
this.dw_mante_email=create dw_mante_email
this.cb_mas=create cb_mas
this.cb_menos=create cb_menos
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_4
this.Control[iCurrent+2]=this.cbx_3
this.Control[iCurrent+3]=this.cbx_2
this.Control[iCurrent+4]=this.cbx_1
this.Control[iCurrent+5]=this.cbx_5
this.Control[iCurrent+6]=this.dw_mante_email
this.Control[iCurrent+7]=this.cb_mas
this.Control[iCurrent+8]=this.cb_menos
this.Control[iCurrent+9]=this.gb_1
end on

on w_4001_opciones_personales.destroy
call super::destroy
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.cbx_5)
destroy(this.dw_mante_email)
destroy(this.cb_mas)
destroy(this.cb_menos)
destroy(this.gb_1)
end on

type st_bloqueo from w_sgigenerica`st_bloqueo within w_4001_opciones_personales
end type

type cbx_4 from checkbox within w_4001_opciones_personales
integer x = 174
integer y = 376
integer width = 1330
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
boolean enabled = false
string text = "Observaciones de Incidencias en Word"
boolean lefttext = true
end type

type cbx_3 from checkbox within w_4001_opciones_personales
integer x = 174
integer y = 496
integer width = 1330
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Env$$HEX1$$ed00$$ENDHEX$$o Email a Solicitantes Descargos           "
boolean lefttext = true
end type

type cbx_2 from checkbox within w_4001_opciones_personales
integer x = 174
integer y = 256
integer width = 1330
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Observaciones Obligatorias en Incidencias"
boolean lefttext = true
end type

type cbx_1 from checkbox within w_4001_opciones_personales
integer x = 174
integer y = 124
integer width = 1330
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Activar N$$HEX1$$fa00$$ENDHEX$$mero de Aviso en Consulta"
boolean lefttext = true
end type

type cbx_5 from checkbox within w_4001_opciones_personales
integer x = 174
integer y = 616
integer width = 1330
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Env$$HEX1$$ed00$$ENDHEX$$o Email en Ingreso de Avisos"
boolean lefttext = true
end type

event clicked;if this.checked = true then 
	dw_mante_email.enabled = true
	cb_mas.enabled = true
	cb_menos.enabled = true
else
	dw_mante_email.enabled = false
	cb_mas.enabled = false
	cb_menos.enabled = false
end if
end event

type dw_mante_email from u_sgt_instalaciones within w_4001_opciones_personales
integer x = 178
integer y = 736
integer width = 1198
integer height = 312
integer taborder = 31
boolean bringtotop = true
boolean enabled = false
string dataobject = "d_man_email"
boolean hscrollbar = true
boolean vscrollbar = true
end type

event itemchanged;call super::itemchanged;int li_contador = 1

if row > 0 then
	if dwo.name = 'identificador_instalacion' then
		// se comprueba que el identificador es $$HEX1$$fa00$$ENDHEX$$nico
		do while li_contador <= This.RowCount() and li_contador > 0
			if li_contador <> row then
				if string(data) = this.GetItemString(li_contador, 'identificador_instalacion') then
					li_contador = -2
				end if
			end if
			
			li_contador ++
		loop
		
		if li_contador < 0 then
			this.setitem(row, 'identificador_instalacion', '')
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "El identificador de la instalaci$$HEX1$$f300$$ENDHEX$$n no puede estar repetido.")
			return 2
		end if
		
	end if
	
end if
end event

event losefocus;call super::losefocus;this.AcceptText()
end event

type cb_mas from commandbutton within w_4001_opciones_personales
integer x = 1431
integer y = 760
integer width = 78
integer height = 64
integer taborder = 71
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "+"
end type

event clicked;IF dw_mante_email.AcceptText() = 1 THEN
	fw_anade_registro()
	dw_mante_email.setfocus()
END IF
end event

type cb_menos from commandbutton within w_4001_opciones_personales
integer x = 1431
integer y = 968
integer width = 78
integer height = 64
integer taborder = 61
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "-"
end type

event clicked;if dw_mante_email.getrow() > 0 then
	dw_mante_email.deleterow(dw_mante_email.getrow())
end if
end event

type gb_1 from groupbox within w_4001_opciones_personales
integer x = 101
integer y = 36
integer width = 1449
integer height = 1048
integer taborder = 1
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
end type


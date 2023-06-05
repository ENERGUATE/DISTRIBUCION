HA$PBExportHeader$w_man_ct_fases.srw
forward
global type w_man_ct_fases from w_sgigenerica
end type
type cb_1 from commandbutton within w_man_ct_fases
end type
type cb_aceptar from commandbutton within w_man_ct_fases
end type
type dw_mant_fases from datawindow within w_man_ct_fases
end type
type dw_tipos_ct from datawindow within w_man_ct_fases
end type
end forward

global type w_man_ct_fases from w_sgigenerica
int X=901
int Y=948
int Width=2889
int Height=1212
WindowType WindowType=response!
boolean TitleBar=true
string Title="Mantenimiento de Fases en Tipos de CT."
long BackColor=79741120
cb_1 cb_1
cb_aceptar cb_aceptar
dw_mant_fases dw_mant_fases
dw_tipos_ct dw_tipos_ct
end type
global w_man_ct_fases w_man_ct_fases

forward prototypes
public function integer fw_comprueba_mod ()
public function integer fw_guarda_mod ()
public function string fw_rec_numerico (string ps_fase)
end prototypes

public function integer fw_comprueba_mod ();
int li_conta
dwItemStatus lis_status

for li_conta = 1 to  dw_mant_fases.rowcount()
	lis_status = dw_mant_fases.GetItemStatus (li_conta, 0, primary! )
	if lis_status = newmodified! or lis_status = datamodified! then return 1
next
return 0
end function

public function integer fw_guarda_mod ();int li_conta,li_contacol
string ls_fase,ls_string,ls_fase_bin

for li_conta = 1 to 8
	dw_mant_fases.object.fase_sal[li_conta]=','
	dw_mant_fases.object.fase_sal_bin[li_conta]=','
next

for li_contacol = 8 to 14
	
	for li_conta = 4 to 8
		dw_mant_fases.SetItem ( li_conta, li_contacol, 0 )
	next

	Choose case li_contacol
		case 8
			ls_string = '100'
		case 9
			ls_string = '010'
		case 10
			ls_string = '001'
		case 11
			ls_string = '110'
		case 12
			ls_string = '101'
		case 13
			ls_string = '011'
		case 14
			ls_string = '111'
	end choose		

	if dw_mant_fases.getitemnumber(1,li_contacol)= 1 or  dw_mant_fases.getitemnumber(2,li_contacol)  = 1 then
		dw_mant_fases.SetItem ( 4, li_contacol, 1 )
		ls_fase = dw_mant_fases.object.fase_sal[4] + fw_rec_numerico(ls_string)
		dw_mant_fases.object.fase_sal[4] = ls_fase
		dw_mant_fases.object.fase_sal_bin[4] = dw_mant_fases.object.fase_sal_bin[4] + ls_string + ","
	end if
	if dw_mant_fases.getitemnumber(1,li_contacol) = 1 or  dw_mant_fases.getitemnumber(3,li_contacol)  = 1 then
		dw_mant_fases.SetItem ( 5, li_contacol, 1 )
		dw_mant_fases.object.fase_sal[5] = dw_mant_fases.object.fase_sal[5] + fw_rec_numerico(ls_string)
		dw_mant_fases.object.fase_sal_bin[5] = dw_mant_fases.object.fase_sal_bin[5] + ls_string + ","
	end if
	if dw_mant_fases.getitemnumber(2,li_contacol) = 1 or  dw_mant_fases.getitemnumber(3,li_contacol)  = 1 then
		dw_mant_fases.SetItem ( 6, li_contacol, 1 )
		dw_mant_fases.object.fase_sal[6] = dw_mant_fases.object.fase_sal[6] + fw_rec_numerico(ls_string)
		dw_mant_fases.object.fase_sal_bin[6] = dw_mant_fases.object.fase_sal_bin[6] + ls_string + ","
	end if
	if dw_mant_fases.getitemnumber(1,li_contacol) = 1 or dw_mant_fases.getitemnumber(2,li_contacol) = 1 or  dw_mant_fases.getitemnumber(3,li_contacol)  = 1 then
		dw_mant_fases.SetItem ( 7, li_contacol, 1 )
		dw_mant_fases.object.fase_sal[7] = dw_mant_fases.object.fase_sal[7] + fw_rec_numerico(ls_string)
		dw_mant_fases.object.fase_sal_bin[7] = dw_mant_fases.object.fase_sal_bin[7] + ls_string + ","
	end if

next

for li_conta = 1 to 3

	if  dw_mant_fases.getitemnumber(li_conta,8) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('100')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '100' + ","
	end if
	if  dw_mant_fases.getitemnumber(li_conta,9) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('010')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '010' + ","
	end if
	if  dw_mant_fases.getitemnumber(li_conta,10) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('001')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '001' + ","
	end if
	if  dw_mant_fases.getitemnumber(li_conta,11) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('110')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '110' + ","
	end if
	if  dw_mant_fases.getitemnumber(li_conta,12) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('101')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '101' + ","
	end if
	if  dw_mant_fases.getitemnumber(li_conta,13) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('011')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '011' + ","
	end if	
	if  dw_mant_fases.getitemnumber(li_conta,14) = 1 then
		dw_mant_fases.object.fase_sal[li_conta] = dw_mant_fases.object.fase_sal[li_conta] + fw_rec_numerico('111')
		dw_mant_fases.object.fase_sal_bin[li_conta] = dw_mant_fases.object.fase_sal_bin[li_conta] + '111' + ","
	end if	
next

dw_mant_fases.object.fase_sal_bin[8] = '0' + ","
dw_mant_fases.object.fase_sal[8] = '0' + ","

if dw_mant_fases.update() <> 1 then 
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Se produjo un error al ingresar los datos.",Exclamation!,ok!)
	gnu_u_transaction.uf_rollback()
else
	gnu_u_transaction.uf_commit()
end if

return 1

end function

public function string fw_rec_numerico (string ps_fase); int li_tipo_conexion
 string ls_fases_salida
 
 
 DECLARE lc_fases CURSOR FOR  
  SELECT "GI_CAMBIO_FORMATO_FASE"."TIPO_CONEXION"  
    FROM "GI_CAMBIO_FORMATO_FASE"  
   WHERE "GI_CAMBIO_FORMATO_FASE"."FASE_AFECTADA" = :ps_fase   ;
	

	OPEN lc_fases;
	
	Fetch lc_fases into :li_tipo_conexion;
	
	Do while (sqlca.sqlcode = 0)
	
		ls_fases_salida = ls_fases_salida + string(li_tipo_conexion) + ","
		Fetch lc_fases into :li_tipo_conexion;
	
	loop
	
CLOSE  lc_fases;

return ls_fases_salida;
	
end function

on w_man_ct_fases.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_aceptar=create cb_aceptar
this.dw_mant_fases=create dw_mant_fases
this.dw_tipos_ct=create dw_tipos_ct
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.dw_mant_fases
this.Control[iCurrent+4]=this.dw_tipos_ct
end on

on w_man_ct_fases.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_aceptar)
destroy(this.dw_mant_fases)
destroy(this.dw_tipos_ct)
end on

event open;call super::open;dw_mant_fases.settransobject(sqlca)

datawindowchild dws_tipos_ct

dw_tipos_ct.getchild('tipo_ct',dws_tipos_ct)
dws_tipos_ct.settransobject(sqlca)
dws_tipos_ct.retrieve()
dw_tipos_ct.insertrow(0)
cb_aceptar.enabled = false
end event

event closequery;if fw_comprueba_mod() = 1 then
	if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Las fases han cambiado $$HEX1$$bf00$$ENDHEX$$Desea Guardar los cambios?",information!,YesNo!) = 1 then 
		fw_guarda_mod()
	end if
end if

close(this)
end event

type cb_1 from commandbutton within w_man_ct_fases
int X=1472
int Y=928
int Width=443
int Height=108
int TabOrder=40
string Text="Cerrar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;//if fw_comprueba_mod() = 1 then
//	if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Las fases han cambiado $$HEX1$$bf00$$ENDHEX$$Desea Guardar los cambios?",Information!,okcancel!) = 1 then 
//		fw_guarda_mod()
//	end if
//end if

close(parent)
end event

type cb_aceptar from commandbutton within w_man_ct_fases
int X=777
int Y=928
int Width=421
int Height=108
int TabOrder=30
string Text="Aceptar"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_mant_fases.accepttext()
if fw_guarda_mod() = 1 then
	messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La relaci$$HEX1$$f300$$ENDHEX$$n entre CT y fase ha sido guardada",Information!,ok!)
end if

end event

type dw_mant_fases from datawindow within w_man_ct_fases
int X=133
int Y=260
int Width=2569
int Height=552
int TabOrder=20
string DataObject="d_mant_fases_ct"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event constructor;dw_mant_fases.object.e_r.text = upper(gs_fase_a)
dw_mant_fases.object.e_s.text = upper(gs_fase_b)
dw_mant_fases.object.e_t.text = upper(gs_fase_c)
dw_mant_fases.object.s_r.text = upper(gs_fase_a)
dw_mant_fases.object.s_s.text = upper(gs_fase_b)
dw_mant_fases.object.s_t.text = upper(gs_fase_c)
dw_mant_fases.object.s_rs.text = upper(gs_fase_a) + upper(gs_fase_b)
dw_mant_fases.object.s_rt.text =  upper(gs_fase_a) + upper(gs_fase_c)
dw_mant_fases.object.s_st.text = upper(gs_fase_b) + upper(gs_fase_c)
dw_mant_fases.object.s_rst.text = upper(gs_fase_a) + upper(gs_fase_b) + upper(gs_fase_c)
end event

type dw_tipos_ct from datawindow within w_man_ct_fases
int X=119
int Y=80
int Width=2098
int Height=116
int TabOrder=10
string DataObject="d_tipos_ct"
boolean Border=false
boolean LiveScroll=true
end type

event itemchanged;int li_conta
datetime ld_fecha

ld_fecha=fgnu_fecha_actual()

this.accepttext()

if fw_comprueba_mod() = 1 then
	if messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Las fases han cambiado $$HEX1$$bf00$$ENDHEX$$Desea Guardar los cambios?",information!,YesNo!) = 1 then 
		fw_guarda_mod()
	end if
end if
cb_aceptar.enabled = true
if dw_mant_fases.retrieve(this.object.tipo_ct[row]) = 0 then

	for li_conta=1 to 8
		dw_mant_fases.insertrow(li_conta)
		dw_mant_fases.object.usuario[li_conta] = gs_usuario
		dw_mant_fases.object.programa[li_conta] = 'Mante_ct'
		dw_mant_fases.object.f_actual[li_conta] = ld_fecha
		dw_mant_fases.object.tipo_ct[li_conta] = this.object.tipo_ct[row]
		dw_mant_fases.object.orden[li_conta] = li_conta
		if li_conta < 4 then
			dw_mant_fases.object.mostrar[li_conta] = 1
		end if
	next
	
		dw_mant_fases.object.fase_ent[1] = '100'
		dw_mant_fases.object.fase_a_ent[1] = '1'
		dw_mant_fases.object.fase_ent[2] = '010'
		dw_mant_fases.object.fase_b_ent[2] = '1'
		dw_mant_fases.object.fase_ent[3] = '001'
		dw_mant_fases.object.fase_c_ent[3] = '1'
		dw_mant_fases.object.fase_ent[4] = '110'
		dw_mant_fases.object.fase_a_ent[4] = '1'
		dw_mant_fases.object.fase_b_ent[4] = '1'
		dw_mant_fases.object.fase_ent[5] = '101'
		dw_mant_fases.object.fase_a_ent[5] = '1'
		dw_mant_fases.object.fase_c_ent[5] = '1'
		dw_mant_fases.object.fase_ent[6] = '011'
		dw_mant_fases.object.fase_b_ent[6] = '1'
		dw_mant_fases.object.fase_c_ent[6] = '1'
		dw_mant_fases.object.fase_ent[7] = '111'
		dw_mant_fases.object.fase_a_ent[7] = '1'
		dw_mant_fases.object.fase_b_ent[7] = '1'
		dw_mant_fases.object.fase_c_ent[7] = '1'
		dw_mant_fases.object.fase_ent[8] = '000'
		dw_mant_fases.object.fase_a_ent[8] = '0'
		dw_mant_fases.object.fase_b_ent[8] = '0'
		dw_mant_fases.object.fase_c_ent[8] = '0'
else
	
		for li_conta =  4  to 8
			dw_mant_fases.object.mostrar[li_conta] = 0
		next

end if

for li_conta=1 to 8
	dw_mant_fases.SetItemStatus(li_conta, 0, Primary!, NotModified!)
next
end event


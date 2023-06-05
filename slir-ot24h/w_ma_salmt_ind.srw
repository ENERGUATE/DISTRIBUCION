HA$PBExportHeader$w_ma_salmt_ind.srw
forward
global type w_ma_salmt_ind from window
end type
type st_grabar from statictext within w_ma_salmt_ind
end type
type st_buscar from statictext within w_ma_salmt_ind
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_ma_salmt_ind
end type
type pb_recuperar from picturebutton within w_ma_salmt_ind
end type
type st_buscar_inst from statictext within w_ma_salmt_ind
end type
type sle_buscar_inst from singlelineedit within w_ma_salmt_ind
end type
type dw_salmt from datawindow within w_ma_salmt_ind
end type
type gb_1 from groupbox within w_ma_salmt_ind
end type
type pb_guardar from picturebutton within w_ma_salmt_ind
end type
type gb_2 from groupbox within w_ma_salmt_ind
end type
end forward

global type w_ma_salmt_ind from window
integer x = 5
integer y = 4
integer width = 3621
integer height = 2040
boolean titlebar = true
string title = "Indicativos de SMT Interrumpibles"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
event ue_guardar ( )
st_grabar st_grabar
st_buscar st_buscar
dw_ambito dw_ambito
pb_recuperar pb_recuperar
st_buscar_inst st_buscar_inst
sle_buscar_inst sle_buscar_inst
dw_salmt dw_salmt
gb_1 gb_1
pb_guardar pb_guardar
gb_2 gb_2
end type
global w_ma_salmt_ind w_ma_salmt_ind

type variables
Long il_selected_rows, il_row_click
Boolean ib_aceptar
end variables

forward prototypes
public subroutine fw_retrieve ()
end prototypes

event ue_guardar;dwItemStatus lst_status
//***********************
//**  PMS 2000 DOM II  **
//***********************
Long ll_i, ll_row
//***********************
//**  PMS 2000 DOM II  **
//***********************



dw_salmt.AcceptText()

lst_status = dw_salmt.GetItemStatus(dw_salmt.GetRow(),0,PRIMARY!)


IF dw_salmt.ModifiedCount() > 0 OR dw_salmt.DeletedCount() > 0 OR lst_status = New! OR lst_status = NewModified! THEN
	//***********************
	//**  PMS 2000 DOM II  **
	//***********************
	
	ll_row = dw_salmt.RowCount()
	For ll_i = 1 To ll_row
//		 lst_status = dw_salmt.GetItemStatus(ll_i,0,PRIMARY!)
//		 
//		 IF lst_status = New! OR lst_status = NewModified! OR lst_status = DataModified! Then 
//			 IF dw_salmt.GetItemNumber(ll_i, "ind_no_interrupcion") = 0 Then dw_salmt.SetItem(ll_i, "desc_no_interrupcion", dw_salmt.GetItemString(ll_i, "c_desc_no_int"))
//			 IF dw_salmt.GetItemNumber(ll_i, "ind_industrial") = 0 Then dw_salmt.SetItem(ll_i, "desc_industrial", dw_salmt.GetItemString(ll_i, "c_desc_ind"))
//			 IF dw_salmt.GetItemNumber(ll_i, "ind_cliente_imp") = 0 Then dw_salmt.SetItem(ll_i, "desc_cliente_imp", dw_salmt.GetItemString(ll_i, "c_desc_clie"))
//			 IF dw_salmt.GetItemNumber(ll_i, "ind_evento_especial") = 0 Then dw_salmt.SetItem(ll_i, "desc_evento_especial", dw_salmt.GetItemString(ll_i, "c_desc_even"))
			 IF dw_salmt.GetItemNumber(ll_i, "ind_no_interrupcion") = 0 Then dw_salmt.SetItem(ll_i, "desc_no_interrupcion", "")
			 IF dw_salmt.GetItemNumber(ll_i, "ind_industrial") = 0 Then dw_salmt.SetItem(ll_i, "desc_industrial", "")
			 IF dw_salmt.GetItemNumber(ll_i, "ind_cliente_imp") = 0 Then dw_salmt.SetItem(ll_i, "desc_cliente_imp", "")
			 IF dw_salmt.GetItemNumber(ll_i, "ind_evento_especial") = 0 Then dw_salmt.SetItem(ll_i, "desc_evento_especial", "")
//		 End If
	Next
	
	dw_salmt.AcceptText()
	//***********************
	//**  PMS 2000 DOM II  **
	//***********************
	
	If dw_salmt.UpDate() <> 1 Then
		RollBack Using SQLCA;
	Else
		Commit;
	End If
End If
end event

public subroutine fw_retrieve ();////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n:		fw_retrieve
// 
// Objetivo:	
//					Recupera las salidas de MT por ambito.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////


Long ll_i, ll_row, ll_insert
Long ll_nro_centro, ll_nro_cmd, ll_nro_mesa
DataWindowChild ldwc_centro, ldwc_cmd, ldwc_mesa
DataStore lds_salmt



//CHOOSE CASE gf_update_mens(dw_salmt)
//	CASE 1
//		This.TriggerEvent("ue_guardar")		
//	CASE 3
//		Return
//END CHOOSE


dw_ambito.GetChild("nro_centro", ldwc_centro)
ll_nro_centro = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_centro")

dw_ambito.GetChild("nro_cmd", ldwc_cmd)
ll_nro_cmd = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_cmd")

dw_ambito.GetChild("nro_mesa", ldwc_mesa)
ll_nro_mesa = dw_ambito.GetItemNumber(dw_ambito.GetRow(), "nro_mesa")


lds_salmt = Create DataStore
lds_salmt.DataObject = "dw_co_salmt"
lds_salmt.SetTransObject(SQLCA)
ll_row = lds_salmt.Retrieve(fgci_tipo_salida_mt)


dw_salmt.SetTransObject(SQLCA)

////***********************
////**  PMS 2000 DOM II  **
////***********************
//MessageBox("", dw_salmt.Modify("desc_no_interrupcion.protect = If(ind_no_interrupcion = 1, '0', '1')"))
//
//
//dw_salmt.Modify("desc_industrial.protect = 'If(ind_industrial = 1, 0, 1)")
//dw_salmt.Modify("desc_cliente_imp.protect = 'If(ind_cliente_imp = 1, 0, 1)")
//dw_salmt.Modify("ind_evento_especial.protect = 'If(desc_evento_especial = 1, 0, 1)")
////***********************
////**  PMS 2000 DOM II  **
////***********************


dw_salmt.Retrieve(ll_nro_centro, ll_nro_cmd, ll_nro_mesa, fgci_tipo_salida_mt)


For ll_i = 1 To ll_row
	 ll_insert = dw_salmt.InsertRow(0)
	 dw_salmt.SetItem(ll_insert, "nro_instalacion", lds_salmt.GetItemNumber(ll_i, "nro_instalacion"))
	 dw_salmt.SetItem(ll_insert, "nom_instalacion", lds_salmt.GetItemString(ll_i, "nom_instalacion"))

	 dw_salmt.SetItem(ll_insert, "nro_centro", lds_salmt.GetItemNumber(ll_i, "nro_centro"))
	 dw_salmt.SetItem(ll_insert, "nro_cmd", lds_salmt.GetItemNumber(ll_i, "nro_cmd"))
	 dw_salmt.SetItem(ll_insert, "nro_mesa", lds_salmt.GetItemNumber(ll_i, "nro_mesa"))
Next


Destroy lds_salmt
end subroutine

on w_ma_salmt_ind.create
this.st_grabar=create st_grabar
this.st_buscar=create st_buscar
this.dw_ambito=create dw_ambito
this.pb_recuperar=create pb_recuperar
this.st_buscar_inst=create st_buscar_inst
this.sle_buscar_inst=create sle_buscar_inst
this.dw_salmt=create dw_salmt
this.gb_1=create gb_1
this.pb_guardar=create pb_guardar
this.gb_2=create gb_2
this.Control[]={this.st_grabar,&
this.st_buscar,&
this.dw_ambito,&
this.pb_recuperar,&
this.st_buscar_inst,&
this.sle_buscar_inst,&
this.dw_salmt,&
this.gb_1,&
this.pb_guardar,&
this.gb_2}
end on

on w_ma_salmt_ind.destroy
destroy(this.st_grabar)
destroy(this.st_buscar)
destroy(this.dw_ambito)
destroy(this.pb_recuperar)
destroy(this.st_buscar_inst)
destroy(this.sle_buscar_inst)
destroy(this.dw_salmt)
destroy(this.gb_1)
destroy(this.pb_guardar)
destroy(this.gb_2)
end on

event open;dw_ambito.fpr_crea_dddw()
dw_ambito.insertrow(0)	
dw_ambito.SetItem(1, "nro_centro", 0)	
dw_ambito.SetItem(1, "nro_cmd", 0)	
dw_ambito.SetItem(1, "nro_mesa", 0)	
dw_ambito.AcceptText()

dw_salmt.AcceptText()


If fg_verifica_parametro('CONS_SALMT_DEFICIT') Then
	If gu_perfiles.of_acceso_perfil(gi_perfil, 'SMT_MANT',"ACC_MANTEN") = 1 Then
		This.Title = 'Mantenimiento ' + This.Title
	Else
//		If gu_perfiles.of_acceso_perfil(gi_perfil, 'SMT_MANT',"ACC_CONSULTA") = 1 Then
			gf_set_tab_zero(dw_salmt)
			pb_guardar.Visible = False
			st_grabar.Visible = False
			This.Title = 'Consulta ' + This.Title
//		End If
	End If
End If
end event

event resize;dw_salmt.Width = This.Width - 130
dw_salmt.Height = This.Height - 570

gb_1.Width = dw_salmt.Width + 27
gb_1.Height = dw_salmt.Height + 50
end event

event closequery;If pb_guardar.Visible = True Then
//	CHOOSE CASE gf_update_mens(dw_salmt)
//		CASE 1
//			This.TriggerEvent("ue_guardar")		
//		CASE 3
//			Return 2
//	END CHOOSE
End If
end event

type st_grabar from statictext within w_ma_salmt_ind
integer x = 1271
integer y = 244
integer width = 370
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Grabar"
boolean focusrectangle = false
end type

type st_buscar from statictext within w_ma_salmt_ind
integer x = 1271
integer y = 112
integer width = 370
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Buscar"
boolean focusrectangle = false
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_ma_salmt_ind
integer x = 27
integer width = 997
integer taborder = 10
boolean border = false
end type

type pb_recuperar from picturebutton within w_ma_salmt_ind
integer x = 1088
integer y = 84
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lupa3.bmp"
alignment htextalign = left!
end type

event clicked;////////////////////////////////////////////////////////////
//
// Evento:		clicked
// 
// Objetivo:	
//					Recupera las salidas de MT por el ambito seleccionado.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

fw_retrieve()
end event

type st_buscar_inst from statictext within w_ma_salmt_ind
integer x = 1806
integer y = 172
integer width = 521
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
boolean enabled = false
string text = "Buscar Instalaci$$HEX1$$f300$$ENDHEX$$n"
boolean focusrectangle = false
end type

type sle_buscar_inst from singlelineedit within w_ma_salmt_ind
event ue_char pbm_char
event ue_post_char pbm_custom01
integer x = 2336
integer y = 160
integer width = 1070
integer height = 92
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 16777215
boolean autohscroll = false
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event ue_char;////////////////////////////////////////////////////////////
//
// Evento:		ue_char
// 
// Objetivo:	
//					Ejecuta el evento ue_post_char de la ventana.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

PostEvent ("ue_post_char")
end event

event ue_post_char;////////////////////////////////////////////////////////////
//
// Evento:		ue_post_char
// 
// Objetivo:	
//					Busca una instalacion seg$$HEX1$$fa00$$ENDHEX$$n la cadena de caracteres
//					que se encuentre en ella.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////
Long ll_find


If Len(This.Text) > 0 Then
	ll_find = dw_salmt.Find("UPPER(nom_instalacion) like '" + This.Text + "%'", 1, dw_salmt.RowCount())

	If ll_find > 0 Then
		dw_salmt.ScrollToRow(ll_find)
	End If
End If
end event

type dw_salmt from datawindow within w_ma_salmt_ind
integer x = 46
integer y = 412
integer width = 3451
integer height = 1456
integer taborder = 20
string dataobject = "dw_ma_salmt_ind"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;////////////////////////////////////////////////////////////
//
// Evento:		clicked
// 
// Objetivo:	
//					Ordena de forma ascendente o descente por columna seleccionada.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

String  ls_objeto, ls_sort, ls_column
Integer li_pos




If row < 1 Then	
	ls_objeto = This.GetObjectAtPointer()
	li_pos 	 = Pos(ls_objeto, "~t")
	ls_column = Left(ls_objeto, li_pos - 3)
	
	If Mid(ls_objeto, li_pos - 2, 2) = "_t" Then
		ls_sort = Right(This.Describe("DataWindow.Table.Sort"), 1)

		If ls_sort = "A" Then
			This.SetSort(ls_column + " D")
		Else
			This.SetSort(ls_column + " A")		
		End If
		This.Sort()
	End If

	This.SelectRow(0, False)

	Return
End If
end event

type gb_1 from groupbox within w_ma_salmt_ind
integer x = 32
integer y = 376
integer width = 3479
integer height = 1504
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
end type

type pb_guardar from picturebutton within w_ma_salmt_ind
string tag = "Guardar"
integer x = 1088
integer y = 216
integer width = 151
integer height = 132
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean originalsize = true
string picturename = "disco_pma2.bmp"
alignment htextalign = left!
end type

event clicked;////////////////////////////////////////////////////////////
//
// Evento:		clicked
// 
// Objetivo:	
//					Ejecuta el evento ue_guardar de la ventana.
//
//  Fecha		Responsable		Actuacion
// ----------  -----------		--------------------
// 08/09/2000	JPE				Versi$$HEX1$$f300$$ENDHEX$$n Inicial
//
///////////////////////////////////////////////////////////

Parent.TriggerEvent("ue_guardar")
end event

type gb_2 from groupbox within w_ma_salmt_ind
integer x = 1038
integer y = 4
integer width = 2473
integer height = 368
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 67108864
string text = " Opciones "
end type


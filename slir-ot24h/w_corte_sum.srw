HA$PBExportHeader$w_corte_sum.srw
forward
global type w_corte_sum from window
end type
type st_3 from statictext within w_corte_sum
end type
type p_baja from picture within w_corte_sum
end type
type st_2 from statictext within w_corte_sum
end type
type p_alta from picture within w_corte_sum
end type
type st_1 from statictext within w_corte_sum
end type
type r_1 from rectangle within w_corte_sum
end type
type r_2 from rectangle within w_corte_sum
end type
type r_3 from rectangle within w_corte_sum
end type
end forward

global type w_corte_sum from window
integer width = 2190
integer height = 1468
boolean titlebar = true
string title = "Administraci$$HEX1$$f300$$ENDHEX$$n de Suministros Cortados"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
p_baja p_baja
st_2 st_2
p_alta p_alta
st_1 st_1
r_1 r_1
r_2 r_2
r_3 r_3
end type
global w_corte_sum w_corte_sum

type variables
DataStore ds_nis_rad 
end variables

on w_corte_sum.create
this.st_3=create st_3
this.p_baja=create p_baja
this.st_2=create st_2
this.p_alta=create p_alta
this.st_1=create st_1
this.r_1=create r_1
this.r_2=create r_2
this.r_3=create r_3
this.Control[]={this.st_3,&
this.p_baja,&
this.st_2,&
this.p_alta,&
this.st_1,&
this.r_1,&
this.r_2,&
this.r_3}
end on

on w_corte_sum.destroy
destroy(this.st_3)
destroy(this.p_baja)
destroy(this.st_2)
destroy(this.p_alta)
destroy(this.st_1)
destroy(this.r_1)
destroy(this.r_2)
destroy(this.r_3)
end on

event close;DESTROY ds_nis_rad
end event

event open; p_alta.PictureName = pathOriginal + "\pict\sumCorte.bmp"
 p_baja.PictureName = pathOriginal + "\pict\corte_baja.bmp"
 p_alta.Show()
end event

type st_3 from statictext within w_corte_sum
integer x = 1344
integer y = 848
integer width = 457
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Baja de NISES"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_baja from picture within w_corte_sum
integer x = 1440
integer y = 540
integer width = 210
integer height = 180
string picturename = ".\pict\corte_baja.bmp"
boolean focusrectangle = false
end type

event clicked;ds_nis_rad = create DataStore
ds_nis_rad.DataObject = "dw_gi_nis_en_corte"
ds_nis_rad.SetTransObject(SQLCA)

OLEObject excel

Integer li_RetValue, li_rtn
Boolean lb_sheet_rtn
Long ll_cnt
String ls_ClipBoard

// Varibles for File Name,path

string docpath, docname[]
integer i, li_cnt, li_filenum
long ll_xls_cols,ll_xls_rows

// Get file path

GetFileOpenName("Select File", docpath, docname[], "DOC", "Excel Files (*.xlsx),*.xlsx," + "All Files (*.*), *.*", "C:\Program Files\Sybase", 18)

if docpath='' then return

excel = create OLEObject

li_rtn = excel.ConnectToNewObject("excel.application")
IF li_rtn <> 0 THEN
MessageBox('Excel error','No se puede correr el programa Excel, es necesario tenerlo instalado.')
DESTROY excel
RETURN 0
END IF

excel.WorkBooks.Open(docpath )
excel.Application.Visible = false
excel.windowstate = 2 // 1 : Normal, 2 : Minimize, 3 : Maximize

lb_sheet_rtn = excel.worksheets(1).Activate

ls_ClipBoard = Clipboard()

ll_xls_cols = excel.worksheets(1).Usedrange.columns.count
ll_xls_rows = excel.worksheets(1).Usedrange.rows.count
//ll_xls_rows = ll_xls_rows -1 // Considering row 1 has headers

excel.Worksheets (1).Range ("A1:A"+STRING(ll_xls_rows + 1)) .copy


ll_cnt = ds_nis_rad.importclipboard()

Clipboard(ls_ClipBoard) //Restore clipboard

IF ll_cnt <= 0 THEN
Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Error en cargar los datos")
END IF
excel.Application.Quit
excel.DisConnectObject()


long ll_row, ll_nis,  ll_existe, ll_existe_gi, ll_length, ll_total_reg 
ll_total_reg = ds_nis_rad.RowCount()
FOR ll_row = 1 TO ll_total_reg
       ll_nis = ds_nis_rad.GetItemNumber(ll_row,'nis_rad')
		
       Select count(1)
        into :ll_existe
        from sumcon
        where nis_rad = : ll_nis;
	
	 Select count(1)
        into :ll_existe_gi
        from gi_nises_en_corte
        where nis_rad = : ll_nis;
		  
	IF  ll_existe = 0 THEN
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El NIS de la Fila: "+string(ll_row)+" del Excel, no posee contrato con la empresa. NIS: "+String(ll_nis),StopSign!,OK!)
	   	Return
	END IF
	  
	 IF ll_existe_gi > 0 THEN
		DELETE FROM GI_NISES_EN_CORTE
		WHERE NIS_RAD = :ll_nis;
	//ELSE 
	//	ds_nis_rad.deleterow(ll_row)
	END IF
	 
     NEXT
	  
	  IF SQLCA.SQLCODE <> 0 THEN
		MessageBox("SQL Error","No se guardaron los cambios " &
	  	+string(sqlca.sqlerrtext)+" "+String(SQLCA.SQLDBCode) ,StopSign!,OK!)
		  ROLLBACK;	
	ELSE 
		  COMMIT;
		Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Datos actualizados correctamente!",Exclamation!, OK!)
	 END IF
	 
DESTROY excel
end event

type st_2 from statictext within w_corte_sum
integer x = 329
integer y = 840
integer width = 457
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Alta de NISES"
alignment alignment = center!
boolean focusrectangle = false
end type

type p_alta from picture within w_corte_sum
integer x = 448
integer y = 548
integer width = 219
integer height = 176
string picturename = ".\pict\sumCorte.bmp"
boolean focusrectangle = false
end type

event clicked;ds_nis_rad = create DataStore
ds_nis_rad.DataObject = "dw_gi_nis_en_corte"
ds_nis_rad.SetTransObject(SQLCA)

OLEObject excel

Integer li_RetValue, li_rtn
Boolean lb_sheet_rtn
Long ll_cnt
String ls_ClipBoard

// Varibles for File Name,path

string docpath, docname[]
integer i, li_cnt, li_filenum
long ll_xls_cols,ll_xls_rows

// Get file path

GetFileOpenName("Select File", docpath, docname[], "DOC", "Excel Files (*.xlsx),*.xlsx," + "All Files (*.*), *.*", "C:\Program Files\Sybase", 18)

if docpath='' then return

excel = create OLEObject

li_rtn = excel.ConnectToNewObject("excel.application")
IF li_rtn <> 0 THEN
MessageBox('Excel error','No se puede correr el programa Excel, es necesario tenerlo instalado.')
DESTROY excel
RETURN 0
END IF

excel.WorkBooks.Open(docpath )
excel.Application.Visible = false
excel.windowstate = 2 // 1 : Normal, 2 : Minimize, 3 : Maximize

lb_sheet_rtn = excel.worksheets(1).Activate

ls_ClipBoard = Clipboard()

ll_xls_cols = excel.worksheets(1).Usedrange.columns.count
ll_xls_rows = excel.worksheets(1).Usedrange.rows.count
//ll_xls_rows = ll_xls_rows -1 // Considering row 1 has headers

excel.Worksheets (1).Range ("A1:A"+STRING(ll_xls_rows + 1)) .copy


ll_cnt = ds_nis_rad.importclipboard()

Clipboard(ls_ClipBoard) //Restore clipboard

IF ll_cnt <= 0 THEN
Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Error en cargar los datos, verificar el excel.")
DESTROY excel
return
END IF
excel.Application.Quit
excel.DisConnectObject()


long ll_row = 1, ll_nis,  ll_existe, ll_existe_gi, ll_length, ll_total_reg 
ll_total_reg = ds_nis_rad.RowCount()

FOR ll_row = 1 TO ll_total_reg
       ll_nis = ds_nis_rad.GetItemNumber(ll_row,'nis_rad')
		 
		// IF isnull(ll_nis) then
		//	Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Error en cargar los datos, filas en null, verificar el excel.")
		//	return
		// end if
		
       Select count(1)
        into :ll_existe
        from sumcon
        where nis_rad = : ll_nis;
	
	 Select count(1)
        into :ll_existe_gi
        from gi_nises_en_corte
        where nis_rad = : ll_nis;
		  
	if  ll_existe = 0 then
		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El NIS de la Fila: "+string(ll_row)+" del Excel, no posee contrato con la empresa. NIS: "+String(ll_nis),StopSign!,OK!)
	   	Return
  	end if
	  
	 if ll_existe_gi = 0 then
		INSERT INTO GI_NISES_EN_CORTE VALUES (:ll_nis);	
	 end if

     NEXT

//long up = 0
//up = ds_nis_rad.update()

IF SQLCA.SQLCODE <> 0 THEN
		MessageBox("SQL Error","No se guardaron los cambios " &
	  	+string(sqlca.sqlerrtext)+" "+String(SQLCA.SQLDBCode) ,StopSign!,OK!)
		  ROLLBACK;	
	ELSE 
		  COMMIT;
		Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Datos insertados correctamente!",Exclamation!, OK!)
	 END IF

DESTROY excel
end event

type st_1 from statictext within w_corte_sum
integer x = 576
integer y = 132
integer width = 914
integer height = 148
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Nises con Corte en Media Tensi$$HEX1$$f300$$ENDHEX$$n"
alignment alignment = center!
boolean focusrectangle = false
boolean righttoleft = true
end type

type r_1 from rectangle within w_corte_sum
integer linethickness = 4
long fillcolor = 16777215
integer width = 2080
integer height = 1380
end type

type r_2 from rectangle within w_corte_sum
long linecolor = 15780518
integer linethickness = 4
long fillcolor = 16777215
integer x = 411
integer y = 516
integer width = 293
integer height = 236
end type

type r_3 from rectangle within w_corte_sum
long linecolor = 15780518
integer linethickness = 4
long fillcolor = 16777215
integer x = 1403
integer y = 516
integer width = 283
integer height = 232
end type


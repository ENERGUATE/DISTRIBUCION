HA$PBExportHeader$w_pro_a502.srw
forward
global type w_pro_a502 from window
end type
type tab_1 from tab within w_pro_a502
end type
type tabpage_insertar from userobject within tab_1
end type
type dw_import from datawindow within tabpage_insertar
end type
type st_1 from statictext within tabpage_insertar
end type
type pb_ingresar from picturebutton within tabpage_insertar
end type
type r_1 from rectangle within tabpage_insertar
end type
type tabpage_insertar from userobject within tab_1
dw_import dw_import
st_1 st_1
pb_ingresar pb_ingresar
r_1 r_1
end type
type tabpage_eliminar from userobject within tab_1
end type
type cb_1 from commandbutton within tabpage_eliminar
end type
type st_5 from statictext within tabpage_eliminar
end type
type ddlb_localidad from dropdownlistbox within tabpage_eliminar
end type
type ddlb_munic from dropdownlistbox within tabpage_eliminar
end type
type st_4 from statictext within tabpage_eliminar
end type
type st_3 from statictext within tabpage_eliminar
end type
type ddlb_depto from dropdownlistbox within tabpage_eliminar
end type
type st_2 from statictext within tabpage_eliminar
end type
type tabpage_eliminar from userobject within tab_1
cb_1 cb_1
st_5 st_5
ddlb_localidad ddlb_localidad
ddlb_munic ddlb_munic
st_4 st_4
st_3 st_3
ddlb_depto ddlb_depto
st_2 st_2
end type
type tab_1 from tab within w_pro_a502
tabpage_insertar tabpage_insertar
tabpage_eliminar tabpage_eliminar
end type
end forward

global type w_pro_a502 from window
integer width = 2830
integer height = 1956
boolean titlebar = true
string title = "Administraci$$HEX1$$f300$$ENDHEX$$n de proyecto A502"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
tab_1 tab_1
end type
global w_pro_a502 w_pro_a502

type variables
DataStore ds_datos 
string ls_deptoddlb = ""
string ls_municddlb = ""
string ls_localddlb = ""
end variables

forward prototypes
public subroutine f_llenar_depto ()
public subroutine f_llenar_munic ()
public subroutine f_llenar_localidad ()
end prototypes

public subroutine f_llenar_depto ();//Funci$$HEX1$$f300$$ENDHEX$$n para llenar DropDownListBox de Departamentos

String nombre_depto

//Limpiar el control
tab_1.tabpage_eliminar.ddlb_depto.Reset()

//Crea el cursor
DECLARE Cursor1 CURSOR FOR SELECT DISTINCT DEPTO FROM GI_A50_2;

Open Cursor1;

if sqlca.sqlcode < 0 then
MessageBox("Error de Base de datos!", sqlca.sqlerrtext)
end if

Fetch Cursor1 Into:nombre_depto;
//Cuando no hay m$$HEX1$$e100$$ENDHEX$$s registros que leer,
//la variable SqlCode toma el valor 100
DO While Sqlca.SqlCode<>100
tab_1.tabpage_eliminar.ddlb_depto.AddItem(nombre_depto)
Fetch Cursor1 Into:nombre_depto;

Loop

Close Cursor1;
tab_1.tabpage_eliminar.ddlb_depto.Insertitem('Seleccionar', 1)//este item lo pongo n la primera posicion
tab_1.tabpage_eliminar.ddlb_depto.selectitem(1)
//------Fin--------
end subroutine

public subroutine f_llenar_munic ();//Funci$$HEX1$$f300$$ENDHEX$$n para llenar DropDownListBox de Municipios

String nombre_munic

//Limpiar el control
tab_1.tabpage_eliminar.ddlb_munic.Reset()

//Crea el cursor
DECLARE Cursor1 CURSOR FOR SELECT DISTINCT MUNIC FROM GI_A50_2;

Open Cursor1;

if sqlca.sqlcode < 0 then
MessageBox("Error de Base de datos!", sqlca.sqlerrtext)
end if

Fetch Cursor1 Into:nombre_munic;
//Cuando no hay m$$HEX1$$e100$$ENDHEX$$s registros que leer,
//la variable SqlCode toma el valor 100
DO While Sqlca.SqlCode<>100
tab_1.tabpage_eliminar.ddlb_munic.AddItem(nombre_munic)
Fetch Cursor1 Into:nombre_munic;

Loop

Close Cursor1;
tab_1.tabpage_eliminar.ddlb_munic.Insertitem('Seleccionar', 1)//este item lo pongo n la primera posicion
tab_1.tabpage_eliminar.ddlb_munic.selectitem(1)
//------Fin--------
end subroutine

public subroutine f_llenar_localidad ();//Funci$$HEX1$$f300$$ENDHEX$$n para llenar DropDownListBox de Localidad

String nombre_local

//Limpiar el control
tab_1.tabpage_eliminar.ddlb_localidad.Reset()

//Crea el cursor
DECLARE Cursor1 CURSOR FOR SELECT DISTINCT LOCALIDAD FROM GI_A50_2;

Open Cursor1;

if sqlca.sqlcode < 0 then
MessageBox("Error de Base de datos!", sqlca.sqlerrtext)
end if

Fetch Cursor1 Into:nombre_local;
//Cuando no hay m$$HEX1$$e100$$ENDHEX$$s registros que leer,
//la variable SqlCode toma el valor 100
DO While Sqlca.SqlCode<>100
tab_1.tabpage_eliminar.ddlb_localidad.AddItem(nombre_local)
Fetch Cursor1 Into:nombre_local;

Loop

Close Cursor1;
tab_1.tabpage_eliminar.ddlb_localidad.Insertitem('Seleccionar', 1)//este item lo pongo n la primera posicion
tab_1.tabpage_eliminar.ddlb_localidad.selectitem(1)
//------Fin--------
end subroutine

on w_pro_a502.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_pro_a502.destroy
destroy(this.tab_1)
end on

type tab_1 from tab within w_pro_a502
integer x = 37
integer y = 32
integer width = 2784
integer height = 1832
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tabpage_insertar tabpage_insertar
tabpage_eliminar tabpage_eliminar
end type

on tab_1.create
this.tabpage_insertar=create tabpage_insertar
this.tabpage_eliminar=create tabpage_eliminar
this.Control[]={this.tabpage_insertar,&
this.tabpage_eliminar}
end on

on tab_1.destroy
destroy(this.tabpage_insertar)
destroy(this.tabpage_eliminar)
end on

event selectionchanged;//llenar los dropdowlistbox al seleccionar la pesta$$HEX1$$f100$$ENDHEX$$a

IF newindex = 2 then
	f_llenar_depto()
	f_llenar_munic()
	f_llenar_localidad()
	
end if
end event

type tabpage_insertar from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2747
integer height = 1704
long backcolor = 33554431
string text = "Ingreso de nises a bloquear"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_import dw_import
st_1 st_1
pb_ingresar pb_ingresar
r_1 r_1
end type

on tabpage_insertar.create
this.dw_import=create dw_import
this.st_1=create st_1
this.pb_ingresar=create pb_ingresar
this.r_1=create r_1
this.Control[]={this.dw_import,&
this.st_1,&
this.pb_ingresar,&
this.r_1}
end on

on tabpage_insertar.destroy
destroy(this.dw_import)
destroy(this.st_1)
destroy(this.pb_ingresar)
destroy(this.r_1)
end on

type dw_import from datawindow within tabpage_insertar
boolean visible = false
integer x = 1550
integer y = 296
integer width = 1568
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_gi_a502"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within tabpage_insertar
integer x = 187
integer y = 728
integer width = 503
integer height = 84
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 33554431
string text = "Adjuntar archivo"
boolean focusrectangle = false
end type

type pb_ingresar from picturebutton within tabpage_insertar
integer x = 270
integer y = 376
integer width = 338
integer height = 296
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = ".\recursos\ima.png"
alignment htextalign = left!
end type

event clicked;// Varibles for File Name,path

string docpath, docname
integer i, li_cnt, li_filenum,resp
long ll_xls_cols,ll_xls_rows

//// Get file path
resp = GetFileOpenName("Select File", &
docpath, docname, "csv", &
+ "Text Files (*.TXT),*.TXT,")

	//Se verifica el archivo txt que se importo 
	IF (resp < 0) THEN
			//No se puede abrir el fichero
			MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se puede abrir el fichero ",Information!) 
			RETURN
		ELSEIF resp = 0 THEN
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","No se cargo ning$$HEX1$$fa00$$ENDHEX$$n archivo plano ",Information!) 
				RETURN
			ELSE
		END IF
		
		IF (resp = 1) THEN
			dw_import.reset()
			resp = dw_import.ImportFile(docpath)
			  IF resp < 0 THEN
				CHOOSE CASE resp
					CASE -1
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","no hay filas para importar. ") 
					CASE -2
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","archivo vacio.") 
					CASE -3
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","argumetos invalidos.") 
					CASE -4
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","entrada invalida.") 
					CASE -5
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","no se pudo abrir el archivo.") 
					CASE -6
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","no se pudo cerrar el archivo.") 
					CASE -7
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","error al leer el archivo de texto.") 	
					CASE -8
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","no es un archivo de texto") 
					CASE ELSE
						MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","error al importar al archivo") 	
				END CHOOSE
					RETURN
				END IF
		ELSE
			RETURN
		END IF
		
long ll_row = 1, ll_nis,  ll_existe, ll_existe_gi, ll_length, ll_total_reg 
string ls_munic,ls_depto,ls_localidad
int li_nulo = 0
ll_xls_rows = dw_import.Rowcount()


openwithparm(w_msg,"Insertando datos... ")
FOR ll_row = 1 TO ll_xls_rows
       ll_nis = dw_import.GetItemNumber(ll_row,'nis_rad')
	   ls_depto = dw_import.GetItemString(ll_row,'depto')
	   ls_munic = dw_import.GetItemString(ll_row,'munic')
	   ls_localidad = dw_import.GetItemString(ll_row,'localidad')
	   li_nulo = 0
		
//       Select count(1)
//        into :ll_existe
//        from sumcon
//        where nis_rad = : ll_nis;
	
	 Select count(1)
        into :ll_existe_gi
        from gi_a50_2
        where nis_rad = : ll_nis;
		  
//	if  ll_existe = 0 then
//		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El NIS de la Fila: "+string(ll_row)+" del Excel, no posee contrato con la empresa. NIS: "+String(ll_nis),StopSign!,OK!)
//	   	Return
//  	end if
	 
	IF isnull(ls_depto) or isnull(ls_munic)  or isnull(ls_localidad)  then
		li_nulo = 1
	ELSE 
		IF ls_depto = ' ' or ls_munic = ' ' or ls_localidad = ' ' then
			li_nulo = 1
		END IF
	END IF

	  
	 if ll_existe_gi = 0 and li_nulo = 0 then
			
			UPPER(ls_depto)
			UPPER(ls_munic)
			UPPER(ls_localidad)
			
			INSERT INTO GI_A50_2 VALUES (:ll_nis, :ls_depto, :ls_munic, :ls_localidad);
	 end if

     NEXT

close(w_msg)

IF SQLCA.SQLCODE <> 0 THEN
		MessageBox("SQL Error","No se guardaron los cambios " &
	  	+string(sqlca.sqlerrtext)+" "+String(SQLCA.SQLDBCode) ,StopSign!,OK!)
		  ROLLBACK;	
ELSE 
		 COMMIT;
		Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Datos insertados correctamente!",Exclamation!, OK!)
END IF



















//ds_datos = create DataStore
//ds_datos.DataObject = "dw_gi_a502"
//ds_datos.SetTransObject(SQLCA)
//
//OLEObject excel
//
//Integer li_RetValue, li_rtn
//Boolean lb_sheet_rtn
//Long ll_cnt
//String ls_ClipBoard
//
//// Varibles for File Name,path
//
//string docpath, docname[]
//integer i, li_cnt, li_filenum
//long ll_xls_cols,ll_xls_rows
//
//// Get file path
//
//GetFileOpenName("Select File", docpath, docname[], "DOC", "Excel Files (*.xlsx),*.xlsx," + "All Files (*.*), *.*", "C:\Program Files\Sybase", 18)
//
//if docpath='' then return
//
//excel = create OLEObject
//
//li_rtn = excel.ConnectToNewObject("excel.application")
//IF li_rtn <> 0 THEN
//MessageBox('Excel error','No se puede correr el programa Excel, es necesario tenerlo instalado.')
//DESTROY excel
//RETURN 0
//END IF
//
//excel.WorkBooks.Open(docpath )
//excel.Application.Visible = false
//excel.windowstate = 2 // 1 : Normal, 2 : Minimize, 3 : Maximize
//
//lb_sheet_rtn = excel.worksheets(1).Activate
//
//ls_ClipBoard = Clipboard()
//
//ll_xls_cols = excel.worksheets(1).Usedrange.columns.count
//ll_xls_rows = excel.worksheets(1).Usedrange.rows.count
////ll_xls_rows = ll_xls_rows -1 // Considering row 1 has headers
//
//excel.Worksheets (1).Range ("A1:D"+STRING(ll_xls_rows + 1)) .copy
//
//openwithparm(w_msg,"Importando archivo... ")
//ll_cnt = ds_datos.ImportClipboard()
//
//Clipboard(ls_ClipBoard) //Restore clipboard
//close(w_msg)
//
//IF ll_cnt <= 0 THEN
//Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n", "Error en cargar los datos, verificar el excel.")
//DESTROY excel
//return
//END IF
//excel.Application.Quit
//excel.DisConnectObject()
//
//
//long ll_row = 1, ll_nis,  ll_existe, ll_existe_gi, ll_length, ll_total_reg 
//string ls_munic,ls_depto,ls_localidad
//int li_nulo = 0
//ll_total_reg = ds_datos.RowCount()
//
//openwithparm(w_msg,"Insertando datos... ")
//FOR ll_row = 1 TO ll_total_reg
//       ll_nis = ds_datos.GetItemNumber(ll_row,'nis_rad')
//	   ls_depto = ds_datos.GetItemString(ll_row,'depto')
//	   ls_munic = ds_datos.GetItemString(ll_row,'munic')
//	   ls_localidad = ds_datos.GetItemString(ll_row,'localidad')
//	   li_nulo = 0
//		
////       Select count(1)
////        into :ll_existe
////        from sumcon
////        where nis_rad = : ll_nis;
//	
//	 Select count(1)
//        into :ll_existe_gi
//        from gi_a50_2
//        where nis_rad = : ll_nis;
//		  
////	if  ll_existe = 0 then
////		MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n","El NIS de la Fila: "+string(ll_row)+" del Excel, no posee contrato con la empresa. NIS: "+String(ll_nis),StopSign!,OK!)
////	   	Return
////  	end if
//	 
//	IF isnull(ls_depto) or isnull(ls_munic)  or isnull(ls_localidad)  then
//		li_nulo = 1
//	ELSE 
//		IF ls_depto = ' ' or ls_munic = ' ' or ls_localidad = ' ' then
//			li_nulo = 1
//		END IF
//	END IF
//
//	  
//	 if ll_existe_gi = 0 and li_nulo = 0 then
//			
//			UPPER(ls_depto)
//			UPPER(ls_munic)
//			UPPER(ls_localidad)
//			
//			INSERT INTO GI_A50_2 VALUES (:ll_nis, :ls_depto, :ls_munic, :ls_localidad);
//	 end if
//
//     NEXT
//
////long up = 0
////up = ds_nis_rad.update()
//close(w_msg)
//
//IF SQLCA.SQLCODE <> 0 THEN
//		MessageBox("SQL Error","No se guardaron los cambios " &
//	  	+string(sqlca.sqlerrtext)+" "+String(SQLCA.SQLDBCode) ,StopSign!,OK!)
//		  ROLLBACK;	
//	ELSE 
//		  COMMIT;
//		Messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","Datos insertados correctamente!",Exclamation!, OK!)
//	 END IF
//
//DESTROY excel
end event

type r_1 from rectangle within tabpage_insertar
long linecolor = 128
integer linethickness = 4
long fillcolor = 16777215
integer x = 247
integer y = 356
integer width = 384
integer height = 336
end type

type tabpage_eliminar from userobject within tab_1
integer x = 18
integer y = 112
integer width = 2747
integer height = 1704
long backcolor = 33554431
string text = "Desbloqueo de nises"
long tabtextcolor = 33554432
long tabbackcolor = 33554431
long picturemaskcolor = 536870912
cb_1 cb_1
st_5 st_5
ddlb_localidad ddlb_localidad
ddlb_munic ddlb_munic
st_4 st_4
st_3 st_3
ddlb_depto ddlb_depto
st_2 st_2
end type

on tabpage_eliminar.create
this.cb_1=create cb_1
this.st_5=create st_5
this.ddlb_localidad=create ddlb_localidad
this.ddlb_munic=create ddlb_munic
this.st_4=create st_4
this.st_3=create st_3
this.ddlb_depto=create ddlb_depto
this.st_2=create st_2
this.Control[]={this.cb_1,&
this.st_5,&
this.ddlb_localidad,&
this.ddlb_munic,&
this.st_4,&
this.st_3,&
this.ddlb_depto,&
this.st_2}
end on

on tabpage_eliminar.destroy
destroy(this.cb_1)
destroy(this.st_5)
destroy(this.ddlb_localidad)
destroy(this.ddlb_munic)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.ddlb_depto)
destroy(this.st_2)
end on

type cb_1 from commandbutton within tabpage_eliminar
integer x = 1129
integer y = 1356
integer width = 526
integer height = 128
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Desbloquear"
boolean default = true
end type

event clicked;//Desbloqueo de NISES
string ls_condicion, ls_query
ls_condicion = ""
ls_query = "DELETE FROM GI_A50_2 WHERE "

IF ls_deptoddlb = "" AND ls_municddlb = "" AND ls_localddlb = "" THEN
	MessageBox('Atenci$$HEX1$$f300$$ENDHEX$$n', 'Debe seleccionar una opci$$HEX1$$f300$$ENDHEX$$n a desbloquear ',StopSign!)
	RETURN
END IF

IF ls_deptoddlb <> "" THEN
	ls_condicion += "DEPTO = '"+ ls_deptoddlb + "'"
END IF

IF ls_municddlb <> "" THEN
	IF ls_deptoddlb <> "" THEN
		ls_condicion += " AND "
	END IF
	ls_condicion += "MUNIC = '"+ ls_municddlb + "'"
END IF

IF ls_localddlb <> "" THEN
	IF ls_deptoddlb <> "" OR ls_municddlb <> "" THEN
		ls_condicion += " AND "
	END IF
	ls_condicion += "LOCALIDAD = '"+ ls_localddlb + "'"
END IF

ls_query = ls_query + ls_condicion 
EXECUTE IMMEDIATE  :ls_query  USING SQLCA;

IF SQLCA.SQLCODE=0 THEN
	commit using SQLCA;
	MessageBox('Informaci$$HEX1$$f300$$ENDHEX$$n', 'NISES desbloqueados con $$HEX1$$e900$$ENDHEX$$xito. ')
	f_llenar_depto()
	f_llenar_munic()
	f_llenar_localidad()
	ls_deptoddlb = ""
    ls_municddlb = ""
    ls_localddlb = ""
	
	
ELSE
	messagebox('ERROR', 'Error al desbloquear NISES, Error: ' + SQLCA.SQLERRTEXT)
END IF


end event

type st_5 from statictext within tabpage_eliminar
integer x = 366
integer y = 888
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
string text = "Localidad:"
boolean focusrectangle = false
end type

type ddlb_localidad from dropdownlistbox within tabpage_eliminar
integer x = 942
integer y = 888
integer width = 1056
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
IF index <> 1 THEN
	ls_localddlb = upper(ddlb_localidad.Text ( index ))
ELSE
	ls_localddlb = ""
END IF
end event

type ddlb_munic from dropdownlistbox within tabpage_eliminar
integer x = 942
integer y = 608
integer width = 1056
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
IF index <> 1 THEN
	ls_municddlb = upper(ddlb_munic.Text ( index ))
ELSE
	ls_municddlb = ""
END IF
end event

type st_4 from statictext within tabpage_eliminar
integer x = 366
integer y = 608
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
string text = "Municipio:"
boolean focusrectangle = false
end type

type st_3 from statictext within tabpage_eliminar
integer x = 361
integer y = 328
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 33554431
string text = "Departamento:"
boolean focusrectangle = false
end type

type ddlb_depto from dropdownlistbox within tabpage_eliminar
integer x = 942
integer y = 328
integer width = 1056
integer height = 400
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;
IF index <> 1 THEN
	ls_deptoddlb = upper(ddlb_depto.Text ( index ))
else
	ls_deptoddlb = ""
END IF
end event

type st_2 from statictext within tabpage_eliminar
integer x = 73
integer y = 112
integer width = 1065
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 128
long backcolor = 33554431
string text = "Seleccione las opciones a desbloquear:"
boolean focusrectangle = false
end type


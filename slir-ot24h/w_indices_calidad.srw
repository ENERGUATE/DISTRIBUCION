HA$PBExportHeader$w_indices_calidad.srw
forward
global type w_indices_calidad from w_sgigenerica
end type
type pb_acmd from picturebutton within w_indices_calidad
end type
type pb_asub from picturebutton within w_indices_calidad
end type
type st_1 from statictext within w_indices_calidad
end type
type pb_propio from picturebutton within w_indices_calidad
end type
type cbx_1 from checkbox within w_indices_calidad
end type
type dw_fechas from datawindow within w_indices_calidad
end type
type tv_1 from uo_man_instalac within w_indices_calidad
end type
type gb_2 from groupbox within w_indices_calidad
end type
type gb_1 from groupbox within w_indices_calidad
end type
type dw_indice_calidad from u_gen_0000_lista within w_indices_calidad
end type
type dw_grafico from datawindow within w_indices_calidad
end type
end forward

global type w_indices_calidad from w_sgigenerica
int Width=3657
int Height=2400
boolean TitleBar=true
string Title="OPEN SGI - $$HEX1$$cd00$$ENDHEX$$ndices de calidad"
string MenuName="md_lista_calidad"
long BackColor=79741120
string Icon="Open.ico"
event ue_ir_comienzo ( )
event ue_ir_final ( )
event ue_buscar ( )
pb_acmd pb_acmd
pb_asub pb_asub
st_1 st_1
pb_propio pb_propio
cbx_1 cbx_1
dw_fechas dw_fechas
tv_1 tv_1
gb_2 gb_2
gb_1 gb_1
dw_indice_calidad dw_indice_calidad
dw_grafico dw_grafico
end type
global w_indices_calidad w_indices_calidad

type variables
int ii_columna
datetime if_desde, if_hasta
int ii_estado=0
long il_codigo
string is_indice
int ii_tipo
end variables

forward prototypes
public subroutine fw_cargar_graficas (integer pi_estado)
end prototypes

event ue_ir_comienzo;SetPointer(HourGlass!)

	dw_indice_calidad.selectrow(dw_indice_calidad.getRow(),false)
	
	dw_indice_calidad.selectrow(1,true)
	dw_indice_calidad.scrolltorow(1)

end event

event ue_ir_final;SetPointer(HourGlass!)


	dw_indice_calidad.selectrow(dw_indice_calidad.getRow(),false)
	dw_indice_calidad.rowcount()
	dw_indice_calidad.selectrow(dw_indice_calidad.rowcount(),true)
	dw_indice_calidad.scrolltorow(dw_indice_calidad.rowcount())



end event

event ue_buscar;long ll_respuesta, ll_codigo
long tvi_hdl = 0
string ls_nombre
int li_cantidad
treeviewitem le_elemento
date lf_hasta2
dw_indice_calidad.reset()
dw_fechas.accepttext()
is_indice=""
gb_2.text="Gr$$HEX1$$e100$$ENDHEX$$ficas"
lf_hasta2= date(dw_fechas.getitemdatetime(1,'hasta'))
if_desde = dw_fechas.getitemdatetime(1,'desde')

if_hasta = datetime(date("28/" + string(month(lf_hasta2)) +"/"+ string(year(lf_hasta2))),now())

if  isnull(if_desde) or isnull(if_hasta) then
  gnv_msg.f_mensaje("EG22","","",OK!)
  //messagebox("Error","Las fechas no puede ser nulas")
  dw_fechas.setfocus()
  return
end if 



if if_desde > if_hasta or isnull(if_desde) or isnull(if_hasta)then
        gnv_msg.f_mensaje("EI26","","",OK!)
        //messagebox("Error","Las fechas no son correctas")
		  dw_fechas.setfocus()
       return
end if

// CARGAMOS EL ARBOL



DO UNTIL tv_1.FindItem(RootTreeItem!, 0) = -1
	tv_1.DeleteItem(tvi_hdl)
LOOP

DECLARE cu_cmd CURSOR FOR  
  SELECT "SGD_CENTRO"."NRO_CENTRO",   
         "SGD_CENTRO"."NOM_CENTRO"  
    FROM "SGD_CENTRO"  
   WHERE "SGD_CENTRO"."TIP_CENTRO" = 2  using sqlca ;

open cu_cmd;

fetch cu_cmd into :ll_codigo, :ls_nombre ;
do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1

	le_elemento.data = ll_codigo
	le_elemento.label = ls_nombre
	le_elemento.pictureindex = tv_1.f_icono_arbol(fgci_tipo_subestacion + tv_1.ii_cmd_padre)
	le_elemento.selectedpictureindex = tv_1.f_icono_arbol(fgci_tipo_subestacion+ tv_1.ii_cmd_padre)
	
   select count(*) into :li_cantidad  from gi_calidad_inst where nro_instalacion = :ll_codigo and F_ALTA < :if_hasta and F_ALTA > :if_desde and TIPO_INSTALACION = 3;
	
	if li_cantidad >0 then 
		le_elemento.bold = true
	else
		le_elemento.bold = false
	end if
	
	tv_1.insertitemsort(0,le_elemento)

fetch cu_cmd into :ll_codigo, :ls_nombre ;
loop
close cu_cmd;




tv_1.selectitem(tv_1.finditem(RootTreeItem!,0))

tv_1.getitem(tv_1.finditem(RootTreeItem!,0),le_elemento)
il_codigo = long(le_elemento.data)
//
////il_codigo = 
//
//ll_respuesta = dw_indice_calidad.retrieve(il_codigo,if_desde,if_hasta)
//if ll_respuesta=0 then 
//	GNV_MSG.F_MENSAJE("IT01","","",OK!)
//	ii_estado=0
//   pb_propio.enabled=false
//	pb_acmd.enabled= false
//   pb_asub.enabled=false
//	return 
//end if
//
//CHOOSE CASE ii_tipo
//	
//	CASE 1 // CMD
//	
//   	 pb_propio.enabled=true
//	 	 pb_acmd.enabled=false
//     	pb_asub.enabled=false	  
//
//	CASE 2  // SUBESTAC
// 	
//		 pb_propio.enabled=true
//	 	 pb_acmd.enabled=true
//     	 pb_asub.enabled=false
//		 		 
//	CASE 3  //SMT
//		
//		 pb_propio.enabled=true
//	 	 pb_acmd.enabled=true
//     	 pb_asub.enabled=true
//
//END CHOOSE
//
//
//
//fw_cargar_graficas(ii_estado)
//
//
//
//
//
//
//
//
//
//this.setredraw(true)
//dw_indice_calidad.setredraw(true)

//
//IF isnull(idt_f_desde) THEN
//        idt_f_desde=DateTime(Date("01/01/1900"))
//end if
//
//if idt_f_desde >= idt_f_hasta then
//        gnv_msg.f_mensaje("EI26","","",OK!)
//        //messagebox("Error","Las fechas no son correctas")
//        return
//end if
end event

public subroutine fw_cargar_graficas (integer pi_estado);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : fw_cargar_graficas
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Carga la grafica con los datos de la datawindow								
//	
//
//  Valores de retorno : 
//
//  Realizado por Alfonso Coto
//
//  Fecha : 08/09/2000		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

long ll_num_registros, ll_indice, ll_row
string   periodo
decimal ld_valor

ll_num_registros= dw_indice_calidad.rowcount()


if pi_estado=0 OR is_indice="" then 
	dw_grafico.visible=false
 
  return
end if
dw_grafico.setredraw(false)
dw_grafico.reset()



CHOOSE CASE is_indice
	CASE "SAIDI","CAIDI","TIEPI"
		dw_grafico.object.texto.text='(Min.)'
   CASE "ASAI"		
	 dw_grafico.object.texto.text='(%)'
	CASE ELSE
	  dw_grafico.object.texto.text=''
END CHOOSE


CHOOSE CASE is_indice 
			CASE "SAIFI"
				 dw_grafico.object.siguiente.text="   >SAIDI"
			CASE "SAIDI"
				 dw_grafico.object.siguiente.text="   >CAIDI"
			CASE "CAIDI"
				 dw_grafico.object.siguiente.text="   >ASAI"
			CASE "ASAI"
			 dw_grafico.object.siguiente.text="   >TIEPI"
			CASE "TIEPI"
			 dw_grafico.object.siguiente.text="   >SAIFI"
END CHOOSE



for ll_indice=1 to ll_num_registros
ll_row=dw_grafico.Insertrow(0)	

CHOOSE CASE pi_estado
	CASE 1 // VALORES PROPIOS
		dw_grafico.Object.gr_1.Title=is_indice +" (Valores propios)"
		periodo=dw_indice_calidad.getItemstring(ll_indice, "periodo")
		ld_valor=dw_indice_calidad.getitemnumber(ll_indice,is_indice)
		dw_grafico.setitem(ll_row,"periodo",periodo)
		dw_grafico.setitem(ll_row,"dato",ld_valor)
	
	CASE 2  // APORTADOS AL CMD
		dw_grafico.Object.gr_1.Title=is_indice +" (Valores aportados al cmd)"
		periodo=dw_indice_calidad.getItemstring(ll_indice, "periodo")
		ld_valor=dw_indice_calidad.getitemnumber(ll_indice,is_indice+"_cmd")
		dw_grafico.setitem(ll_row,"periodo",periodo)
		dw_grafico.setitem(ll_row,"dato",ld_valor)
	
	CASE 3
		dw_grafico.Object.gr_1.Title=is_indice +" (Valores aportados a la subestaci$$HEX1$$f300$$ENDHEX$$n)"
		periodo=dw_indice_calidad.getItemstring(ll_indice, "periodo")
		ld_valor=dw_indice_calidad.getitemnumber(ll_indice,is_indice+"_sub")
		dw_grafico.setitem(ll_row,"periodo",periodo)
		dw_grafico.setitem(ll_row,"dato",ld_valor)
	
		
END CHOOSE
next

dw_grafico.accepttext()
dw_grafico.visible= true
dw_grafico.setredraw(true)
end subroutine

on w_indices_calidad.create
int iCurrent
call super::create
if this.MenuName = "md_lista_calidad" then this.MenuID = create md_lista_calidad
this.pb_acmd=create pb_acmd
this.pb_asub=create pb_asub
this.st_1=create st_1
this.pb_propio=create pb_propio
this.cbx_1=create cbx_1
this.dw_fechas=create dw_fechas
this.tv_1=create tv_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_indice_calidad=create dw_indice_calidad
this.dw_grafico=create dw_grafico
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_acmd
this.Control[iCurrent+2]=this.pb_asub
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.pb_propio
this.Control[iCurrent+5]=this.cbx_1
this.Control[iCurrent+6]=this.dw_fechas
this.Control[iCurrent+7]=this.tv_1
this.Control[iCurrent+8]=this.gb_2
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.dw_indice_calidad
this.Control[iCurrent+11]=this.dw_grafico
end on

on w_indices_calidad.destroy
call super::destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.pb_acmd)
destroy(this.pb_asub)
destroy(this.st_1)
destroy(this.pb_propio)
destroy(this.cbx_1)
destroy(this.dw_fechas)
destroy(this.tv_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_indice_calidad)
destroy(this.dw_grafico)
end on

event open;datetime hoy
hoy=fgnu_fecha_actual()

dw_fechas.settransobject(sqlca)
dw_fechas.Insertrow(0)


	is_indice=""
	dw_fechas.setitem(1,'desde',date("01/"+string(month(date(hoy)))+"/"+string(year(date(hoy)))))
	dw_fechas.setitem(1,'hasta',date("28/"+string(month(date(hoy)))+"/"+string(year(date(hoy)))))
	dw_fechas.enabled=false
	dw_fechas.accepttext()

	cbx_1.checked=true

end event

type pb_acmd from picturebutton within w_indices_calidad
int X=2583
int Y=520
int Width=315
int Height=264
int TabOrder=70
string Text="A. Cmd"
string PictureName="gra_sec.bmp"
string DisabledName="gra_sec.bmp"
VTextAlign VTextAlign=Top!
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// ii_estado=2

if ii_estado=2 then // SE PULSA DOS VECES LA MISMA GRAFICA
	ii_estado=0
	dw_grafico.visible= false
else
	if is_indice="" then
		messagebox("Aviso","Seleccione la columna a mostrar graficamente")	
		return
	end if
	ii_estado=2
	fw_cargar_graficas(ii_estado)

end if


end event

type pb_asub from picturebutton within w_indices_calidad
int X=2939
int Y=520
int Width=315
int Height=264
int TabOrder=80
string Text="A. Sub."
string PictureName="gra_sec.bmp"
string DisabledName="gra_sec.bmp"
VTextAlign VTextAlign=Top!
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// ii_estado=3

if ii_estado=3 then // SE PULSA DOS VECES LA MISMA GRAFICA
	ii_estado=0
	dw_grafico.visible= false
else
	if is_indice="" then
		messagebox("Aviso","Seleccione la columna a mostrar graficamente")	
		return
	end if
	ii_estado=3
	fw_cargar_graficas(ii_estado)
	
end if

end event

type st_1 from statictext within w_indices_calidad
int X=224
int Y=844
int Width=2286
int Height=76
boolean Enabled=false
string Text="Cmd"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type pb_propio from picturebutton within w_indices_calidad
int X=2217
int Y=520
int Width=315
int Height=264
int TabOrder=60
string Text="Propio"
string PictureName="gra_sec.bmp"
string DisabledName="gra_sec.bmp"
VTextAlign VTextAlign=Top!
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// ii_estado=1

if ii_estado=1 then // SE PULSA DOS VECES LA MISMA GRAFICA
	ii_estado=0
	dw_grafico.visible= false
else
	if is_indice="" then
		messagebox("Aviso","Seleccione la columna a mostrar graficamente")	
		return
	end if
	ii_estado=1
	fw_cargar_graficas(ii_estado)
	
end if

end event

type cbx_1 from checkbox within w_indices_calidad
int X=2423
int Y=360
int Width=457
int Height=76
int TabOrder=40
string Text="Mes Actual"
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

event clicked;datetime f_desde, f_hasta
date hoy
hoy=today()

if checked then 
	dw_fechas.setitem(1,'desde',date("01/"+string(month(hoy))+"/"+string(year(hoy))))
	dw_fechas.setitem(1,'hasta',date("28/"+string(month(hoy))+"/"+string(year(hoy))))
	dw_fechas.Object.desde.Background.Color=gs_gris
	dw_fechas.Object.hasta.Background.Color=gs_gris
	dw_fechas.enabled=false
	dw_fechas.accepttext()
else
	dw_fechas.Object.desde.Background.Color=gs_blanco
	dw_fechas.Object.hasta.Background.Color=gs_blanco
	dw_fechas.enabled=true
end if
end event

type dw_fechas from datawindow within w_indices_calidad
int X=2199
int Y=36
int Width=969
int Height=344
int TabOrder=30
boolean Enabled=false
string DataObject="d_f_consulta"
boolean Border=false
boolean LiveScroll=true
end type

event losefocus;date lf_hasta2

dw_fechas.accepttext()

lf_hasta2= date(dw_fechas.getitemdatetime(1,'hasta'))
if_desde = dw_fechas.getitemdatetime(1,'desde')

if_hasta = datetime(date("28/" + string(month(lf_hasta2)) +"/"+ string(year(lf_hasta2))),now())



end event

type tv_1 from uo_man_instalac within w_indices_calidad
int X=379
int Y=136
int Width=1614
int Height=644
int TabOrder=10
boolean LinesAtRoot=true
string PictureName[]={"finca.bmp",&
"SUBEST.bmp",&
"sal_tra1.bmp"}
int PictureWidth=16
int PictureHeight=16
long TextColor=33554432
long BackColor=79741120
FontCharSet FontCharSet=Ansi!
grSortType SortType=Ascending!
end type

event constructor;call super::constructor;long ll_codigo
long ll_bdijob
string ls_nombre
treeviewitem le_elemento
setpointer(HourGlass!)
int li_cantidad
datetime hoy
hoy=fgnu_fecha_actual()

if_hasta = datetime(date("28/"+string(month(date(hoy)))+"/"+string(year(date(hoy)))))
if_desde = datetime(date("01/"+string(month(date(hoy)))+"/"+string(year(date(hoy)))))


DECLARE cu_cmd CURSOR FOR  
  SELECT "SGD_CENTRO"."NRO_CENTRO",   
         "SGD_CENTRO"."NOM_CENTRO"  
    FROM "SGD_CENTRO"  
   WHERE "SGD_CENTRO"."TIP_CENTRO" = 2  using sqlca ;

open cu_cmd;

fetch cu_cmd into :ll_codigo, :ls_nombre ;
do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1

	le_elemento.data = ll_codigo
	le_elemento.label = ls_nombre
	le_elemento.pictureindex = f_icono_arbol(fgci_tipo_subestacion + ii_cmd_padre)
	le_elemento.selectedpictureindex = f_icono_arbol(fgci_tipo_subestacion+ ii_cmd_padre)
	
   select count(*) into :li_cantidad  from gi_calidad_inst where nro_instalacion = :ll_codigo and F_ALTA < :if_hasta and F_ALTA > :if_desde and TIPO_INSTALACION = 3;
	
	if li_cantidad >0 then 
		le_elemento.bold = true
	else
		le_elemento.bold = false
	end if
	
	tv_1.insertitemsort(0,le_elemento)

fetch cu_cmd into :ll_codigo, :ls_nombre ;
loop
close cu_cmd;




tv_1.selectitem(0)
end event

event doubleclicked;long ll_codigo
long ll_tipo, ll_bdijob, ll_pict
long ll_codigo_padre
long ll_noserie, ll_tipo_instalacion
int li_item
string ls_nombre
treeviewitem le_elemento
treeviewitem le_elemento_nuevo
int li_cantidad 
SetPointer(HourGlass!)



this.getitem(handle,le_elemento)

//Comprueba si esa rama ya esta abierta o si esta contraida
//En negativo la abre haciendo un acceso a la B.D.

if le_elemento.Children = true then
	return
end if

ll_tipo = le_elemento.level
ll_codigo_padre = long(le_elemento.data)

if ll_codigo_padre < 1 then 
	return
end if



CHOOSE CASE ll_tipo
	
	CASE 1  // CMD --> SUBESTAC
		DECLARE cu_instala_1 CURSOR FOR 
		SELECT CODIGO, NOMBRE 
		FROM SGD_SUBESTAC 
		WHERE nro_cmd = :ll_codigo_padre AND BDI_JOB=0
		ORDER BY NOMBRE ASC using sqlca;
		li_item = f_icono_arbol(fgci_tipo_subestacion)
		ll_tipo_instalacion = 1
	CASE 2  // SUBESTAC --> SMT

		DECLARE cu_instala_2 CURSOR FOR 
		SELECT CODIGO, NOMBRE
		FROM SGD_SALMT
		WHERE INSTALACION_ORIGEN = :ll_codigo_padre AND BDI_JOB=0
		ORDER BY NOMBRE ASC using sqlca;  
		li_item = f_icono_arbol(fgci_tipo_salida_mt)
		ll_tipo_instalacion = 2
	case 3
		return

END CHOOSE


CHOOSE CASE ll_tipo
	
	CASE 1
		open cu_instala_1;
		fetch cu_instala_1 into :ll_codigo, :ls_nombre;
		
	CASE 2
		open cu_instala_2;
		fetch cu_instala_2 into :ll_codigo, :ls_nombre;
end choose

do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
	le_elemento_nuevo.label = ls_nombre
	le_elemento_nuevo.data = ll_codigo
	le_elemento_nuevo.pictureindex = li_item 
	le_elemento_nuevo.selectedpictureindex = li_item
	select count(*) into :li_cantidad  from gi_calidad_inst where nro_instalacion = :ll_codigo and F_ALTA < :if_hasta and F_ALTA > :if_desde and TIPO_INSTALACION = :ll_tipo_instalacion;
	
	if li_cantidad >0 then 
		le_elemento_nuevo.bold = true
	else
		le_elemento_nuevo.bold = false
	end if
	
	this.insertitemsort(handle,le_elemento_nuevo)

	CHOOSE CASE ll_tipo
	
		CASE 1
					fetch cu_instala_1 into :ll_codigo, :ls_nombre;
		CASE 2
    				fetch cu_instala_2 into :ll_codigo, :ls_nombre;
			end choose
loop

CHOOSE CASE ll_tipo
	
	CASE 1
			close cu_instala_1;
	CASE 2

			close cu_instala_2;
		

END CHOOSE



end event

event selectionchanged;long ll_tipo
long li_nro_centro, li_nro_cmd, li_nro_puesto
string ls_nombre
long row
treeviewitem le_elemento

long ll_respuesta
date hoy
int li_indicador

SetPointer(HourGlass!)

this.getitem(newhandle,le_elemento)


if  isnull(if_desde) or isnull(if_hasta) then
  gnv_msg.f_mensaje("EG22","","",OK!)
  //messagebox("Error","Las fechas no puede ser nulas")
  dw_fechas.setfocus()
  return 1
  
end if 



if if_desde > if_hasta or isnull(if_desde) or isnull(if_hasta)then
        gnv_msg.f_mensaje("EI26","","",OK!)
        //messagebox("Error","Las fechas no son correctas")
		  dw_fechas.setfocus()
       return 1
end if







Parent.setredraw(false)
dw_indice_calidad.setredraw(false)

//Comprueba si esa rama ya esta abierta o si esta contraida
//En negativo la abre haciendo un acceso a la B.D.

ll_tipo = le_elemento.level
ii_tipo= ll_tipo
il_codigo = long(le_elemento.data)

 Parent.dw_grafico.DataObject = 'd_gra_calidad'


CHOOSE CASE ll_tipo
	
	CASE 1 // CMD
	
   	 parent.pb_propio.enabled=true
	 	 parent.pb_acmd.enabled=false
     	 parent.pb_asub.enabled=false	  
		 Parent.dw_indice_Calidad.DataObject = 'd_calidad_cmd'
		 ls_nombre= "Cmd"

	CASE 2  // SUBESTAC
 	
		 parent.pb_propio.enabled=true
	 	 parent.pb_acmd.enabled=true
     	 parent.pb_asub.enabled=false
    	 Parent.dw_indice_Calidad.DataObject = 'd_calidad_sub'
      ls_nombre= "Subestaci$$HEX1$$f300$$ENDHEX$$n"
		 		 
	CASE 3  //SMT
		
		 parent.pb_propio.enabled=true
	 	 parent.pb_acmd.enabled=true
     	 parent.pb_asub.enabled=true
   	 Parent.dw_indice_calidad.DataObject = 'd_calidad_smt'
	  ls_nombre= "Salida de Media Tensi$$HEX1$$f300$$ENDHEX$$n"

END CHOOSE


Parent.dw_grafico.SetTransObject(sqlca)
Parent.dw_indice_calidad.SetTransObject(sqlca)
il_codigo = long(le_elemento.data)
ls_nombre = ls_nombre + " - " + le_elemento.label
st_1.text= ls_nombre

if ii_estado>ll_tipo then
	ii_estado=ll_tipo
	
end if

//parent.triggerevent("ue_buscar")





ll_respuesta = Parent.dw_indice_calidad.retrieve(il_codigo,if_desde,if_hasta)
if ll_respuesta=0 then 
	ii_estado=0
   parent.pb_propio.enabled=false
	parent.pb_acmd.enabled= false
   parent.pb_asub.enabled=false
end if

fw_cargar_graficas(ii_estado)


row = Parent.dw_indice_calidad.getrow()

Parent.setredraw(true)
dw_indice_calidad.setredraw(true)

end event

event selectionchanging;//Parent.setredraw(false)
//dw_indice_calidad.setredraw(false)

end event

event clicked;date lf_hasta2



dw_fechas.accepttext()

lf_hasta2= date(dw_fechas.getitemdatetime(1,'hasta'))
if_desde = dw_fechas.getitemdatetime(1,'desde')

if_hasta = datetime(date("28/" + string(month(lf_hasta2)) +"/"+ string(year(lf_hasta2))),now())


end event

type gb_2 from groupbox within w_indices_calidad
int X=2181
int Y=448
int Width=1125
int Height=376
int TabOrder=50
string Text="Gr$$HEX1$$e100$$ENDHEX$$ficas"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_indices_calidad
int X=206
int Y=44
int Width=1851
int Height=780
string Text="Instalaciones"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_indice_calidad from u_gen_0000_lista within w_indices_calidad
event ue_key_down pbm_dwnkey
int X=242
int Y=924
int Width=3045
int Height=868
int TabOrder=90
string DataObject="d_calidad_smt"
boolean VScrollBar=true
boolean LiveScroll=false
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
        ll_row = This.Getselectedrow(0)
        
        IF key = KeyUpArrow! and ll_row > 1 THEN
                dw_indice_calidad.ScrollToRow(ll_row - 1)
                this.selectrow(0,False)
                this.selectrow(ll_row - 1,true)
        ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
                dw_indice_calidad.ScrollToRow(ll_row - 1)
                this.selectrow(0,False)
                this.selectrow(ll_row + 1,true)
        END IF

END IF

end event

event clicked;call super::clicked;long ll_fila = 1
int li_posicion
decimal ldc_estado

if row = 0 then 

li_posicion= pos(string(dwo.name),"_t")
if li_posicion>0 then
	is_indice=UPPER(mid(string(dwo.name),1,li_posicion -1))
	if not match(is_indice,"PERIODO") then 
		gb_2.text ="Gr$$HEX1$$e100$$ENDHEX$$ficas ("+is_indice+")"
	else 
		gb_2.text ="Gr$$HEX1$$e100$$ENDHEX$$ficas"
		is_indice=""
	end if
end if

return
end if

dw_indice_calidad.setredraw(false)

//Buscar elementos marcados y  los desmarca, marcando el nuevo

ll_fila = dw_indice_calidad.getselectedrow(0)
do while ll_fila <> 0
        dw_indice_calidad.selectrow(ll_fila,false)
        ll_fila ++
        ll_fila = dw_indice_calidad.getselectedrow(ll_fila)
loop

dw_indice_calidad.selectrow(row,true)

dw_indice_calidad.setredraw(true)


end event

event doubleclicked;call super::doubleclicked;///////////////////////////////////////////////////////////////////////////
////
//// Event:  	doubleclicked
////
///////////////////////////////////////////////////////////////////////////
//string ls_color_fondo_norm, ls_color_fondo_mark, ls_color_texto_norm
//string ls_color_texto_mark
//string ls_column, ls_column2, ls_column3
//integer li_columna_foco
//
//ls_color_fondo_norm = String(12632256)
//ls_color_texto_norm = String(0)
//ls_color_fondo_mark = String(65536*128+256*128+128)
//ls_color_texto_mark = String(0)
//
//this.SetRedraw(False)		
//
//// Si cliqueo en una columna y no es la de "FECHA"
//IF ii_column_clicked > 0  and ii_column_clicked <> 5 THEN
//
//	// Si Clicke$$HEX2$$e9002000$$ENDHEX$$en la columna de zona, avanzo
//	IF ii_column_clicked = 6 OR ii_column_clicked = 7 OR ii_column_clicked = 8 THEN
//
//		// Si ya estoy en el nivel inferior no avanzo
//	   IF ii_nivel = 3 THEN
//			dw_datos_zona_geo.SetRedraw(True)
//			pb_retroceder.Enabled = TRUE
//			RETURN
//		END IF
//		IF ii_totales = 1 THEN
//			Parent.TriggerEvent("ue_actualizar")
//		END IF
//	ELSE 
//      // Si quiere marcar/desmarcar una columna
//		ls_column = This.Describe("#"+ String(ii_column_clicked) +".Name")
//		ls_column2 = ls_column + "_s"
//		ls_column3 = ls_column2 + "_m"
//
//		// Si estaba desmarcada, la marco
// 		IF This.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_norm THEN
//	
//			This.Modify(" "+ ls_column +".Background.Mode=0")
//			This.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_mark +" ")
//			This.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_mark +" ")
//
//			This.Modify(" "+ ls_column2 +".Background.Mode=0")
//			This.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_mark +" ")
//			This.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_mark +" ")
//
//			This.Modify(" "+ ls_column3 +".Background.Mode=0")
//			This.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_mark +" ")
//			This.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_mark +" ")
//
//			Parent.fw_marcar_col(ii_column_clicked)
//			ii_num_col_marca ++
//		
//		ELSEIF This.Describe(" "+ ls_column +".Background.Color") = ls_color_fondo_mark THEN
//
//			// Si estaba marcada, la desmarco
//			This.Modify(" "+ ls_column +".Background.Mode=1")
//			This.Modify(" "+ ls_column +".Background.Color="+ ls_color_fondo_norm +" ")
//			This.Modify(" "+ ls_column +".Text.Color="+ ls_color_texto_norm +" ")
//
//			This.Modify(" "+ ls_column2 +".Background.Mode=1")
//			This.Modify(" "+ ls_column2 +".Background.Color="+ ls_color_fondo_norm +" ")
//			This.Modify(" "+ ls_column2 +".Text.Color="+ ls_color_texto_norm +" ")
//
//			This.Modify(" "+ ls_column3 +".Background.Mode=1")
//			This.Modify(" "+ ls_column3 +".Background.Color="+ ls_color_fondo_norm +" ")
//			This.Modify(" "+ ls_column3 +".Text.Color="+ ls_color_texto_norm +" ")
//
//			Parent.fw_desmarcar_col(ii_column_clicked)
//			ii_num_col_marca --
//
//		END IF
//		
//	Parent.TriggerEvent("ue_botones")
//	
//	END IF
//END IF
//this.SetRedraw(True)
end event

type dw_grafico from datawindow within w_indices_calidad
int X=183
int Y=920
int Width=3182
int Height=868
int TabOrder=20
boolean Visible=false
string DataObject="d_gra_calidad"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

event clicked;Setpointer(HourGlass!)

if dwo.name <>'siguiente' then 

if this.height =868 then
	// Amplia
	parent.setredraw(false)
	this.x = 183
	this.y = 55
	this.width = 3209
	this.height = 1750
	this.show()
	parent.setredraw(true)
else
	// Reduce
	parent.setredraw(false)
	this.x = 183
	this.y = 920
	this.width = 3209
	this.height =868
	this.show()
	parent.setredraw(true)
end if

else 
		CHOOSE CASE is_indice 
			CASE "SAIFI"
				 is_indice="SAIDI"
			CASE "SAIDI"
				 is_indice="CAIDI"
			CASE "CAIDI"
				 is_indice="ASAI"
			CASE "ASAI"
			 is_indice="TIEPI"
			CASE "TIEPI"
			 is_indice="SAIFI"
		END CHOOSE
		gb_2.text ="Gr$$HEX1$$e100$$ENDHEX$$ficas ("+is_indice+")"
		fw_cargar_graficas(ii_estado)
end if
end event


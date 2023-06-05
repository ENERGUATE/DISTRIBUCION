HA$PBExportHeader$w_descargos_res.srw
forward
global type w_descargos_res from w_sgigenerica
end type
type st_2 from statictext within w_descargos_res
end type
type st_1 from statictext within w_descargos_res
end type
type dw_1 from uo_7002_pr_gestion_descargos within w_descargos_res
end type
type tv_1 from uo_man_instalac within w_descargos_res
end type
end forward

type s_arbol from structure
        long            ll_cod_instalacion
        long            ll_cod_instalacion_padre
end type

global type w_descargos_res from w_sgigenerica
int X=407
int Y=540
int Width=2848
int Height=1308
WindowType WindowType=response!
boolean TitleBar=true
string Title="Otros Descargos Relacionados"
long BackColor=79741120
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
string Icon="agrupacion_descargos.ico"
event ue_cerrar_ventana ( )
st_2 st_2
st_1 st_1
dw_1 dw_1
tv_1 tv_1
end type
global w_descargos_res w_descargos_res

type variables
long il_nro_instalacion
u_generico_comunicaciones iu_comunic
long ll_codigo
integer ii_grabo
long il_instalacion_origen
u_generico_comunicaciones iu_comunic2
boolean ib_primera_vez=false
integer ii_actualizo=0

end variables

forward prototypes
public subroutine inserta_arbol (long nro_instalacion, long handle)
public subroutine fw_inserta_rama_origen (long handle)
end prototypes

event ue_cerrar_ventana;close(this)
end event

public subroutine inserta_arbol (long nro_instalacion, long handle);treeviewitem le_elemento
long ll_nro_inst
long ll_nro_inst_padre
string ls_nombre
long ll_handle
long ll_cant_descargos, ll_tipo, ll_icono, ll_tipo_instalacion

s_arbol is_arbol

//Declaro un cursor que sacara las instalaciones que tengan como codigo padre 99999999

DECLARE cu_primer_nivel CURSOR FOR  
SELECT NRO_INSTALACION,   
		 NRO_INST_PADRE,   
		 NOM_INSTALACION,
		 TIPO_INSTALACION,
		 SUM(FGCI_NUM_DESCARGOS(NRO_INSTALACION)) 
FROM SGD_INSTALACION
WHERE NRO_INST_PADRE = :nro_instalacion and
		BDI_JOB = 0
GROUP BY NRO_INSTALACION,   
		 NRO_INST_PADRE,   
		 NOM_INSTALACION,
		 TIPO_INSTALACION
HAVING SUM(FGCI_NUM_DESCARGOS(NRO_INSTALACION))  > 0;

open cu_primer_nivel ;
        
fetch cu_primer_nivel 
into :ll_nro_inst, :ll_nro_inst_padre,:ls_nombre, :ll_tipo_instalacion,:ll_cant_descargos;
        
do while sqlca.sqlcode = 0
                
	ls_nombre = ls_nombre + "(" + string(ll_cant_descargos) + ")"
	ll_icono = tv_1.f_icono_arbol(ll_tipo_instalacion)
	ll_handle = tv_1.insertitemsort(handle,ls_nombre,ll_icono)
	tv_1.getitem(ll_handle, le_elemento)
	is_arbol.ll_cod_instalacion = ll_nro_inst
	is_arbol.ll_cod_instalacion_padre = ll_nro_inst_padre
	le_elemento.data = is_arbol
	tv_1.setitem(ll_handle, le_elemento)
	fetch cu_primer_nivel 
	into :ll_nro_inst, :ll_nro_inst_padre,:ls_nombre, :ll_tipo_instalacion,:ll_cant_descargos;

loop
				 
close cu_primer_nivel ;

end subroutine

public subroutine fw_inserta_rama_origen (long handle);treeviewitem le_elemento
long ll_nro_inst, ll_conta
long ll_nro_inst_padre
string ls_nombre
long ll_handle, ll_tipo, ll_icono
LONG ll_cant_descargos

if ib_primera_vez=false then
	il_instalacion_origen= Message.DoubleParm
	ib_primera_vez= true
end if

s_arbol is_arbol

SELECT NRO_INSTALACION,   
		 NRO_INST_PADRE,   
		 NOM_INSTALACION,
		 TIPO_INSTALACION,
		 SUM(FGCI_NUM_DESCARGOS(NRO_INSTALACION)) 
INTO  :ll_nro_inst,
		:ll_nro_inst_padre,
		:ls_nombre,
		:ll_tipo,
		:ll_cant_descargos
FROM SGD_INSTALACION
WHERE NRO_INSTALACION = :il_instalacion_origen and
		BDI_JOB = 0
GROUP BY NRO_INSTALACION,   
		 NRO_INST_PADRE,   
		 NOM_INSTALACION,
		 TIPO_INSTALACION
HAVING SUM(FGCI_NUM_DESCARGOS(NRO_INSTALACION))  > 0;

ls_nombre = ls_nombre + "(" + string(ll_cant_descargos) + ")"
ll_icono = tv_1.f_icono_arbol(ll_tipo)
ll_handle = tv_1.insertitemsort(handle,ls_nombre,ll_icono)
tv_1.getitem(ll_handle, le_elemento)
is_arbol.ll_cod_instalacion = ll_nro_inst
is_arbol.ll_cod_instalacion_padre = ll_nro_inst_padre
le_elemento.data = is_arbol
tv_1.setitem(ll_handle, le_elemento)
tv_1.Selectitem(ll_handle)
dw_1.retrieve(il_instalacion_origen)

for ll_conta=1 to dw_1.rowcount() 
	dw_1.setitem(ll_conta,"color",il_instalacion_origen)
next


end subroutine

on w_descargos_res.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.dw_1
this.Control[iCurrent+4]=this.tv_1
end on

on w_descargos_res.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.tv_1)
end on

event open;call super::open;SetPointer(HourGlass!)

s_arbol ls_arbol
treeviewitem le_elemento
long ll_handle, ll_icono


dw_1.settransobject(sqlca)

//Inserto el primer nivel con el simbolo de la carpeta
ll_icono = tv_1.f_icono_arbol(fgci_tipo_subestacion+tv_1.ii_cmd_padre)
ll_handle = tv_1.insertitemsort(0,"Descargos",ll_icono)
tv_1.getitem(ll_handle, le_elemento)
ls_arbol.ll_cod_instalacion = 0
ls_arbol.ll_cod_instalacion_padre = 0
le_elemento.data = ls_arbol
tv_1.setitem(ll_handle, le_elemento)

//Cargo todos los padres
fw_inserta_rama_origen(ll_handle)

IF dw_1.RowCount() = 0 THEN
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No existe ning$$HEX1$$fa00$$ENDHEX$$n descargo relacionado.")
	Close(this)
END IF
end event

event closequery;gu_comunic2.is_comunic.programa_retorno = "w_descargos"
gu_comunic2.is_comunic.intval1 = ii_actualizo
end event

type st_2 from statictext within w_descargos_res
int X=1349
int Y=16
int Width=1467
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="  Descargos selecionados con la instalacion."
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_descargos_res
int X=23
int Y=16
int Width=1303
int Height=76
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
string Text="  Descargos Relacionados"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_1 from uo_7002_pr_gestion_descargos within w_descargos_res
int X=1349
int Y=92
int Width=1467
int Height=1100
int TabOrder=20
BorderStyle BorderStyle=StyleRaised!
boolean HScrollBar=true
boolean VScrollBar=true
boolean HSplitScroll=true
end type

type tv_1 from uo_man_instalac within w_descargos_res
int X=14
int Y=92
int Width=1303
int Height=1100
int TabOrder=10
boolean BringToTop=true
string PictureName[]={"SUBEST.bmp",&
"Sal_tra1.bmp",&
"CT1.bmp",&
"TRANSFOR.bmp",&
"SALBAJ.bmp",&
"Folder01.ico",&
"Foldrs02.ico"}
long TextColor=33554432
int TextSize=-8
FontCharSet FontCharSet=Ansi!
grSortType SortType=Ascending!
end type

event doubleclicked;//Compruebo que no este esa rama ya abierta
treeviewitem le_elemento
s_arbol ls_arbol

if handle < 1 then 
        return
end if

tv_1.getitem(handle,le_elemento)
ls_arbol = le_elemento.data

//Si la rama estaba abierta o se intenta obtener los hijos de una bt sale
if le_elemento.expandedonce = true or le_elemento.level = 6 then
        return
end if

inserta_arbol(ls_arbol.ll_cod_instalacion,handle)
end event

event constructor;call super::constructor;//s_arbol ls_arbol
//treeviewitem le_elemento
//long ll_handle, ll_icono
//
//
//dw_1.settransobject(sqlca)
//
////Inserto el primer nivel con el simbolo de la carpeta
//ll_icono = tv_1.f_icono_arbol(fgci_tipo_subestacion+ii_cmd_padre)
//ll_handle = tv_1.insertitemsort(0,"Descargos",ll_icono)
//tv_1.getitem(ll_handle, le_elemento)
//ls_arbol.ll_cod_instalacion = 0
//ls_arbol.ll_cod_instalacion_padre = 0
//le_elemento.data = ls_arbol
//tv_1.setitem(ll_handle, le_elemento)
//
////Cargo todos los padres
//fw_inserta_rama_origen(ll_handle)
end event

event selectionchanged;long ll_conta
s_arbol ls_arbol
treeviewitem le_elemento

//Recupero en la datawindow
dw_1.setredraw(false)
tv_1.getitem(newhandle, le_elemento)
ls_arbol = le_elemento.data

dw_1.retrieve(ls_arbol.ll_cod_instalacion)

for ll_conta=1 to dw_1.rowcount() 
	dw_1.setitem(ll_conta,"color",ls_arbol.ll_cod_instalacion)
next

dw_1.setredraw(true)
end event

event clicked;////Compruebo que no este esa rama ya abierta
//treeviewitem le_elemento
//s_arbol ls_arbol
//int li_conta
//
//if handle < 1 then 
//        return
//end if
//
//tv_1.getitem(handle,le_elemento)
//ls_arbol = le_elemento.data
//
//for li_conta=1 to dw_1.rowcount() 
//        dw_1.setitem(li_conta,"color",ls_arbol.ll_cod_instalacion)
//next
end event


HA$PBExportHeader$w_lista_incidencia.srw
forward
global type w_lista_incidencia from w_sgigenerica
end type
type tv_1 from treeview within w_lista_incidencia
end type
end forward

global type w_lista_incidencia from w_sgigenerica
int X=1120
int Y=964
int Width=1390
int Height=476
WindowType WindowType=popup!
boolean TitleBar=true
string Title="OPEN SGI - Barra de Incidencias"
long BackColor=79741120
boolean MaxBox=false
boolean Resizable=false
string Icon="Open.ico"
tv_1 tv_1
end type
global w_lista_incidencia w_lista_incidencia

on w_lista_incidencia.create
int iCurrent
call super::create
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
end on

on w_lista_incidencia.destroy
call super::destroy
destroy(this.tv_1)
end on

event open;call super::open;//if isvalid(gu_control_v_incidencias) then gu_control_v_incidencias.of_actualiza_lista()
end event

event closequery;md_operaciones.m_editar.m_mostrar.checked=false
end event

event activate;tv_1.enabled=true
end event

event deactivate;tv_1.enabled=false
end event

type tv_1 from treeview within w_lista_incidencia
int X=37
int Y=36
int Width=1289
int Height=328
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
boolean DisableDragDrop=false
boolean LinesAtRoot=true
boolean HideSelection=false
string PictureName[]={"Watcom!",&
"inc_act.bmp",&
"inc_ope.bmp",&
"Window!"}
long PictureMaskColor=553648127
long StatePictureMaskColor=553648127
long TextColor=33554432
long BackColor=16777215
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
grSortType SortType=Ascending!
end type

event key;treeviewitem l_lvi
int handle
if key= keydelete! then 
w_2301_form_incidencia ventana
handle= this.FindItem(CurrentTreeItem!, 0)
if handle<>this.FindItem(RootTreeItem!, 0) then 
if getitem(handle,l_lvi)<>-1 then 
	ventana = gu_control_v_incidencias.of_busca_ventana(-1,l_lvi.data)
	close(ventana)
	end if
end if
end if
end event

event selectionchanged;treeviewitem l_lvi
if newhandle<>this.FindItem(RootTreeItem!, 0) then 

	if getitem(newhandle,l_lvi)<>-1 then 
		parent.enabled=false	
		parent.setredraw(false)
		
		gu_control_v_incidencias.of_abre_ventana(l_lvi.data,w_operaciones,2)
		
		IF NOT IsValid(This) THEN Return
		
		parent.setredraw(true)
		parent.enabled=true	
	end if
end if


end event

event clicked;long handle_actual, handle_root
handle_root=this.FindItem(RootTreeItem!, 0)
handle_actual = this.FindItem(CurrentTreeItem!, 0)
//messagebox(string(handle),string(handle_actual)+'/'+string(handle_root))
if handle<> handle_root then 
  if handle = handle_actual /* or handle_root = handle_actual */ then
	w_operaciones.show()
  end if
end if
end event


HA$PBExportHeader$w_2220_identificacion_acometida.srw
forward
global type w_2220_identificacion_acometida from w_sgigenerica
end type
type d_lista_acometidas from u_ins_2019_pr_lista_acometidas within w_2220_identificacion_acometida
end type
end forward

global type w_2220_identificacion_acometida from w_sgigenerica
int X=640
int Y=688
int Width=2377
int Height=1048
WindowType WindowType=response!
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
d_lista_acometidas d_lista_acometidas
end type
global w_2220_identificacion_acometida w_2220_identificacion_acometida

type variables
u_generico_comunicaciones  lu_comunic

decimal{0} idec_nro_instal

integer ii_fila_seleccionada

long il_nro_acometida

string is_descripcion
end variables

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana con la lista de acometidas
//				 para una instalaci$$HEX1$$f300$$ENDHEX$$n
//
//                       	Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                      	 ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                      	 Creaci$$HEX1$$f300$$ENDHEX$$n       14/09/96  	 AFS
//
/////////////////////////////////////////////////////////////////////////

// Para abrirse debe recibir en la estructura de comunicaciones
// en decval1 el numero de instalacion 

SetPointer(HourGlass!)

lu_comunic = CREATE u_generico_comunicaciones
lu_comunic.is_comunic = gu_comunic.is_comunic
fgnu_resetear_s_comunicaciones(gu_comunic)
This.Title = gu_comunic.f_titulo_ventana("iw_2220","lista")
d_lista_acometidas.SetTransObject(sqlca)
il_nro_acometida = 0
idec_nro_instal = lu_comunic.is_comunic.decval1
d_lista_acometidas.Retrieve(idec_nro_instal)
d_lista_acometidas.SelectRow(0,False)
d_lista_acometidas.SelectRow(1,False)

end event

event closequery;IF il_nro_acometida <= 0  OR IsNull(il_nro_acometida) THEN
	il_nro_acometida = 0
	lu_comunic.is_comunic.accion_retorno = "No Seleccionada"
ELSE
	lu_comunic.is_comunic.longval4 = il_nro_acometida
	lu_comunic.is_comunic.accion_retorno = "Seleccionada"
	lu_comunic.is_comunic.strval10 = is_descripcion
END IF	

lu_comunic.is_comunic.programa_retorno = "w_2220"
gu_comunic1.is_comunic = lu_comunic.is_comunic

end event

on close;call w_sgigenerica::close;DESTROY lu_comunic
end on

on w_2220_identificacion_acometida.create
int iCurrent
call super::create
this.d_lista_acometidas=create d_lista_acometidas
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_acometidas
end on

on w_2220_identificacion_acometida.destroy
call super::destroy
destroy(this.d_lista_acometidas)
end on

type d_lista_acometidas from u_ins_2019_pr_lista_acometidas within w_2220_identificacion_acometida
int X=73
int Y=64
int Width=2213
int Height=784
BorderStyle BorderStyle=StyleRaised!
boolean VScrollBar=true
end type

event doubleclicked;
if ii_fila_seleccionada > 0 then 
	is_descripcion = This.GetItemString(ii_fila_seleccionada,"descripcion")
	il_nro_acometida = This.GetItemNumber(ii_fila_seleccionada,"CODIGO")
	
	Close(Parent)
end if
end event

event clicked;call super::clicked;ii_fila_seleccionada = row

IF ii_fila_seleccionada <> 0 THEN
	This.SelectRow(0,False)
	This.SelectRow(ii_fila_seleccionada,True)
END IF
end event


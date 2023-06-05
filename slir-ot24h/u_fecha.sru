HA$PBExportHeader$u_fecha.sru
forward
global type u_fecha from userobject
end type
type dw_fecha from datawindow within u_fecha
end type
end forward

global type u_fecha from userobject
integer width = 517
integer height = 80
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_itemchanged ( )
dw_fecha dw_fecha
end type
global u_fecha u_fecha

forward prototypes
public function date uf_get_fecha ()
public subroutine uf_inicializar_fecha_actual ()
public subroutine uf_set_fecha (date pdate_fecha)
end prototypes

public function date uf_get_fecha ();

return dw_fecha.object.fecha[1] 
end function

public subroutine uf_inicializar_fecha_actual ();

date ldate_fecha

ldate_fecha = today()

dw_fecha.object.fecha[1] = today()
end subroutine

public subroutine uf_set_fecha (date pdate_fecha);
dw_fecha.object.fecha[1] = pdate_fecha
end subroutine

on u_fecha.create
this.dw_fecha=create dw_fecha
this.Control[]={this.dw_fecha}
end on

on u_fecha.destroy
destroy(this.dw_fecha)
end on

type dw_fecha from datawindow within u_fecha
integer width = 544
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "d_fecha"
boolean border = false
boolean livescroll = true
end type

event constructor;

dw_fecha.InsertRow(0)
end event

event itemchanged;

this.AcceptText()

parent.postevent('ue_itemchanged')

end event


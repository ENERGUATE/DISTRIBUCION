HA$PBExportHeader$w_1207_form_orden_servicio.srw
$PBExportComments$Ventana tipo response usada para desplegar los datos de la orden de servicio sobre el aviso en cuesti$$HEX1$$f300$$ENDHEX$$n.
forward
global type w_1207_form_orden_servicio from w_sgigenerica
end type
type d_inf_orden from u_ord_2003_pr_datos_orden within w_1207_form_orden_servicio
end type
end forward

global type w_1207_form_orden_servicio from w_sgigenerica
int X=654
int Y=816
int Width=2350
int Height=756
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Informaci$$HEX1$$f300$$ENDHEX$$n sobre Ordenes de Corte"
long BackColor=79741120
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
d_inf_orden d_inf_orden
end type
global w_1207_form_orden_servicio w_1207_form_orden_servicio

type variables
u_ord_2003_nu_datos_orden		iu_ord_2003_nu


end variables

on close;call w_sgigenerica::close;//GU_COMUNIC.FNU_CERRAR(THIS)
//gu_comunic.fnu_cerrar_hijas(this)

DESTROY iu_ord_2003_nu
end on

on tomar_foco;// NO
end on

event open;call super::open;
iu_ord_2003_nu = CREATE u_ord_2003_nu_datos_orden	

iu_ord_2003_nu.fnu_conectar(d_inf_orden,parnum2)
This.title = gu_comunic.f_titulo_ventana("w_1207","Form.Orden.")


end event

on w_1207_form_orden_servicio.create
int iCurrent
call super::create
this.d_inf_orden=create d_inf_orden
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_inf_orden
end on

on w_1207_form_orden_servicio.destroy
call super::destroy
destroy(this.d_inf_orden)
end on

on activate;// NO
end on

on deactivate;call w_sgigenerica::deactivate;// NO
end on

on timer;// NO
end on

type d_inf_orden from u_ord_2003_pr_datos_orden within w_1207_form_orden_servicio
int X=0
int Y=0
int Width=2318
int Height=648
end type


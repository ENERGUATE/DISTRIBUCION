HA$PBExportHeader$w_mant_paises.srw
forward
global type w_mant_paises from Window
end type
type dw_paises from datawindow within w_mant_paises
end type
end forward

global type w_mant_paises from Window
int X=1454
int Y=1316
int Width=1591
int Height=352
boolean TitleBar=true
string Title="Mantenimiento de Pais de implantaci$$HEX1$$f300$$ENDHEX$$n."
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
dw_paises dw_paises
end type
global w_mant_paises w_mant_paises

event open;int li_valor
datawindowchild lddw_dw_pais
dw_paises.getchild('codigo',lddw_dw_pais)
lddw_dw_pais.settransobject(sqlca)
lddw_dw_pais.retrieve()

this.dw_paises.retrieve()
this.dw_paises.insertrow(0)

select valor into :li_valor from gi_parametros where cod_parametro = 78;

this.dw_paises.object.codigo[1] = li_valor
end event

event closequery;int li_valor

li_valor = dw_paises.object.codigo[1]

update gi_parametros set valor = :li_valor where cod_parametro = 78;

gnu_u_transaction.uf_commit()
end event

on w_mant_paises.create
this.dw_paises=create dw_paises
this.Control[]={this.dw_paises}
end on

on w_mant_paises.destroy
destroy(this.dw_paises)
end on

type dw_paises from datawindow within w_mant_paises
int X=55
int Y=76
int Width=1362
int Height=104
int TabOrder=10
boolean BringToTop=true
string DataObject="d_sel_pais"
boolean Border=false
boolean LiveScroll=true
end type


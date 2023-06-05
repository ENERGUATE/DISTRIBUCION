HA$PBExportHeader$w_mensaje_improcedente.srw
$PBExportComments$Identificaci$$HEX1$$f300$$ENDHEX$$n Geogr$$HEX1$$e100$$ENDHEX$$fica
forward
global type w_mensaje_improcedente from window
end type
type tv_improc from treeview within w_mensaje_improcedente
end type
type mle_1 from multilineedit within w_mensaje_improcedente
end type
type gb_1 from groupbox within w_mensaje_improcedente
end type
end forward

global type w_mensaje_improcedente from window
integer x = 1056
integer y = 484
integer width = 1929
integer height = 1168
boolean titlebar = true
string title = "Gesti$$HEX1$$f300$$ENDHEX$$n Improcedente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
tv_improc tv_improc
mle_1 mle_1
gb_1 gb_1
end type
global w_mensaje_improcedente w_mensaje_improcedente

on w_mensaje_improcedente.create
this.tv_improc=create tv_improc
this.mle_1=create mle_1
this.gb_1=create gb_1
this.Control[]={this.tv_improc,&
this.mle_1,&
this.gb_1}
end on

on w_mensaje_improcedente.destroy
destroy(this.tv_improc)
destroy(this.mle_1)
destroy(this.gb_1)
end on

event open;// TDA.INI.EDM-3.19052017
string ll_nro_aviso
ll_nro_aviso = Message.StringParm

string ls_observaciones, ls_motivo_improc, ls_motivo_improc_subtipo
long ll_cod_motivo_improc, ll_cod_motivo_improc_subtipo

SELECT "GI_AVISOS"."OBS_IMPROC",
"GI_AVISOS"."COD_MOTIVO_IMPROC",
"GI_MOTIVO_IMPROC"."DE_MOTIVO_IMPROC",
"GI_AVISOS"."COD_MOTIVO_IMPROC_SUBTIPO",
"GI_MOTIVO_IMPROC_SUBTIPO"."DE_MOTIVO_IMPROC_SUBTIPO"
INTO :ls_observaciones, 
:ll_cod_motivo_improc, 
:ls_motivo_improc,
:ll_cod_motivo_improc_subtipo,
:ls_motivo_improc_subtipo
FROM "GI_AVISOS","GI_MOTIVO_IMPROC","GI_MOTIVO_IMPROC_SUBTIPO"
WHERE "GI_AVISOS"."COD_MOTIVO_IMPROC" = "GI_MOTIVO_IMPROC"."COD_MOTIVO_IMPROC"(+)
AND "GI_AVISOS"."COD_MOTIVO_IMPROC_SUBTIPO" = "GI_MOTIVO_IMPROC_SUBTIPO"."COD_MOTIVO_IMPROC_SUBTIPO"(+)
AND "GI_AVISOS"."NRO_AVISO" = :ll_nro_aviso;

// Llenado del Treview solamente con el Motivo y Sub-motivo que pusieron al 
// dar el aviso como improcedente
Treeviewitem le_elemento
long ll_handle
ll_handle = tv_improc.insertitemfirst(0,ls_motivo_improc,1)
tv_improc.getitem(ll_handle, le_elemento)
le_elemento.data = ll_cod_motivo_improc
tv_improc.setitem(ll_handle, le_elemento)

Treeviewitem le_elemento2
long ll_handle2
ll_handle2 = tv_improc.insertitemfirst(ll_handle,ls_motivo_improc_subtipo,2)
tv_improc.getitem(ll_handle2,le_elemento2)
le_elemento.data = ll_cod_motivo_improc_subtipo
tv_improc.setitem(ll_handle2,le_elemento2)

tv_improc.expandItem(ll_handle)

// Observaciones puesta cuando dieron el aviso como improcedente
mle_1.Text = ls_observaciones
// TDA.FIN.EDM-3.19052017
end event

type tv_improc from treeview within w_mensaje_improcedente
integer x = 59
integer y = 36
integer width = 1787
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string picturename[] = {"TreeView!","Next!"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 536870912
end type

type mle_1 from multilineedit within w_mensaje_improcedente
integer x = 59
integer y = 264
integer width = 1783
integer height = 728
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_mensaje_improcedente
integer x = 41
integer y = 4
integer width = 1819
integer height = 1008
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
end type


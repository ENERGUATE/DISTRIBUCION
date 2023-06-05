HA$PBExportHeader$w_1105_motivo_improc.srw
forward
global type w_1105_motivo_improc from w_sgigenerica
end type
type tv_1 from treeview within w_1105_motivo_improc
end type
type cb_1 from commandbutton within w_1105_motivo_improc
end type
end forward

global type w_1105_motivo_improc from w_sgigenerica
integer width = 1518
integer height = 1408
string title = "OPENSGI - Motivo Improcedencia"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 67108864
string icon = "OPEN.ICO"
boolean center = true
tv_1 tv_1
cb_1 cb_1
end type
global w_1105_motivo_improc w_1105_motivo_improc

type variables

end variables

on w_1105_motivo_improc.create
int iCurrent
call super::create
this.tv_1=create tv_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tv_1
this.Control[iCurrent+2]=this.cb_1
end on

on w_1105_motivo_improc.destroy
call super::destroy
destroy(this.tv_1)
destroy(this.cb_1)
end on

event open;call super::open;// TDA.INI.EDM-3.19052017// TDA.INI.EDM-3.19052017// TDA.INI.EDM-3.19052017// TDA.INI.EDM-3.19052017// TDA.INI.EDM-3.19052017// TDA.INI.EDM-3.19052017
Treeviewitem le_elemento

w_1105_avisos_con_alim.is_mot_improc = 0
w_1105_avisos_con_alim.is_mot_improc_subtipo = 0
		
string ls_sql = "SELECT GI_MOTIVO_IMPROC.COD_MOTIVO_IMPROC " + &
		"FROM GI_MOTIVO_IMPROC " + &
		"WHERE GI_MOTIVO_IMPROC.ACTIVO = 1 " + &
		"ORDER BY GI_MOTIVO_IMPROC.COD_MOTIVO_IMPROC "
	
DECLARE cu_motivo DYNAMIC CURSOR FOR SQLSA;
PREPARE SQLSA FROM :ls_sql ;
OPEN DYNAMIC cu_motivo ;
long ll_cod_motivo, ll_handle
string ls_descripcion;

fetch cu_motivo INTO  :ll_cod_motivo;
do while sqlca.sqlcode = 0
	
	SELECT "GI_MOTIVO_IMPROC"."DE_MOTIVO_IMPROC"
	INTO :ls_descripcion
	FROM "GI_MOTIVO_IMPROC"
	WHERE "GI_MOTIVO_IMPROC"."COD_MOTIVO_IMPROC" = :ll_cod_motivo
		AND "GI_MOTIVO_IMPROC"."ACTIVO" = 1;

	ll_handle = tv_1.insertitemfirst(0,ls_descripcion,1)	
	tv_1.getitem(ll_handle, le_elemento)
	le_elemento.data = ll_cod_motivo
	tv_1.setitem(ll_handle, le_elemento)
		
	fetch cu_motivo INTO :ll_cod_motivo;	
loop

close cu_motivo;
// TDA.FIN.EDM-3.19052017
end event

event closequery;call super::closequery;// TDA.INI.EDM-3.19052017
if w_1105_avisos_con_alim.is_mot_improc = 0 or w_1105_avisos_con_alim.is_mot_improc_subtipo = 0 then
	w_1105_avisos_con_alim.is_mot_improc = 0
	w_1105_avisos_con_alim.is_mot_improc_subtipo = 0
	w_1105_avisos_con_alim.ib_cancelado = true
end if
// TDA.FIN.EDM-3.19052017

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_1105_motivo_improc
end type

type tv_1 from treeview within w_1105_motivo_improc
integer x = 41
integer y = 36
integer width = 1422
integer height = 1156
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string picturename[] = {"Group!","ArrangeTables!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event doubleclicked;// TDA.INI.EDM-3.19052017
Treeviewitem le_elemento

long ll_handle, ll_cod_motivo_improc, ll_cod_motivo_improc_subtipo
string ls_descripcion

Setpointer(HourGlass!)

if handle > 0 then
	//	Comprobamos en que nivel se ha realizado el dbl click.
	//		Si nivel = 2 se ha seleccionado el sub motivo
	//		Si nivel = 1 se cargan los submotivos

	tv_1.getitem(handle,le_elemento)
	if le_elemento.level = 1 and le_elemento.expandedonce = false then

		ll_cod_motivo_improc = long(le_elemento.data)
		
		DECLARE cu_motivo CURSOR FOR  
		SELECT "GI_MOTIVO_IMPROC_SUBTIPO"."COD_MOTIVO_IMPROC_SUBTIPO",
				 "GI_MOTIVO_IMPROC_SUBTIPO"."DE_MOTIVO_IMPROC_SUBTIPO"
		FROM "GI_MOTIVO_IMPROC_SUBTIPO"
		WHERE "GI_MOTIVO_IMPROC_SUBTIPO"."COD_MOTIVO_IMPROC" = :ll_cod_motivo_improc AND
				"GI_MOTIVO_IMPROC_SUBTIPO"."ACTIVO"= 1;

		open cu_motivo;
		
		fetch cu_motivo INTO :ll_cod_motivo_improc_subtipo, :ls_descripcion;
		
		do while sqlca.sqlcode = 0
			ll_handle = tv_1.insertitemfirst(handle,ls_descripcion,2)
			tv_1.getitem(ll_handle,le_elemento)
			le_elemento.data = ll_cod_motivo_improc_subtipo
			tv_1.setitem(ll_handle,le_elemento)
		fetch cu_motivo INTO :ll_cod_motivo_improc_subtipo, :ls_descripcion;
		
		loop
		 
		close cu_motivo;
		
	elseif le_elemento.level = 2 then
		//Se ha seleccionado el motivo subtipo
		long li_cod_mot_improc
		long li_cod_mot_improc_subtipo
		
		li_cod_mot_improc_subtipo = long(le_elemento.data)
		SELECT "GI_MOTIVO_IMPROC_SUBTIPO"."COD_MOTIVO_IMPROC"
		INTO :li_cod_mot_improc
		FROM "GI_MOTIVO_IMPROC_SUBTIPO"
		WHERE "GI_MOTIVO_IMPROC_SUBTIPO"."COD_MOTIVO_IMPROC_SUBTIPO" = :li_cod_mot_improc_subtipo;
		
		
		w_1105_avisos_con_alim.is_mot_improc = li_cod_mot_improc
		w_1105_avisos_con_alim.is_mot_improc_subtipo = li_cod_mot_improc_subtipo
		close(parent)
	end if		
end if
// TDA.FIN.EDM-3.19052017
end event

type cb_1 from commandbutton within w_1105_motivo_improc
integer x = 507
integer y = 1212
integer width = 343
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Cancelar"
end type

event clicked;// TDA.INI.EDM-3.19052017
w_1105_avisos_con_alim.is_mot_improc = 0
w_1105_avisos_con_alim.is_mot_improc_subtipo = 0
w_1105_avisos_con_alim.ib_cancelado = true
close(parent)
// TDA.FIN.EDM-3.19052017
end event


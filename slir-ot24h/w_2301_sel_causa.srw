HA$PBExportHeader$w_2301_sel_causa.srw
forward
global type w_2301_sel_causa from w_sgigenerica
end type
type cb_1 from commandbutton within w_2301_sel_causa
end type
type tv_1 from treeview within w_2301_sel_causa
end type
end forward

global type w_2301_sel_causa from w_sgigenerica
integer x = 1120
integer y = 388
integer width = 1431
integer height = 1628
string title = "OPENSGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Causa"
windowtype windowtype = response!
long backcolor = 79741120
cb_1 cb_1
tv_1 tv_1
end type
global w_2301_sel_causa w_2301_sel_causa

event open;call super::open;Treeviewitem le_elemento


gu_comunic2.is_comunic.longval4 = 0
gu_comunic2.is_comunic.strval9 = ""
  

//***************************************
//**  OSGI 2001.1  	19/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
//**  OSGI 2001.1  	19/04/2001   DECLARE cu_causas CURSOR FOR  
//**  OSGI 2001.1  	19/04/2001  //  SELECT MIN("GI_CAUSA"."COD_CAUSA"),
//**  OSGI 2001.1  	19/04/2001  //			"GI_CAUSA"."GPO_CAUSA"
//**  OSGI 2001.1  	19/04/2001  //    FROM "GI_CAUSA"
//**  OSGI 2001.1  	19/04/2001  //GROUP BY "GI_CAUSA"."GPO_CAUSA"
//**  OSGI 2001.1  	19/04/2001  //ORDER BY "GI_CAUSA"."GPO_CAUSA" ASC  ;
//**  OSGI 2001.1  	19/04/2001      SELECT "GI_FAMILIA_CAUSAS"."GPO_CAUSA"
//**  OSGI 2001.1  	19/04/2001  	 FROM   "GI_FAMILIA_CAUSAS"
//**  OSGI 2001.1  	19/04/2001  	 ORDER BY "GI_FAMILIA_CAUSAS"."GPO_CAUSA";
//**  OSGI 2001.1  	19/04/2001  open cu_causas;
String ls_sql
Integer li_tipo_incidencia



//If fg_verifica_parametro('CAUSAS') Then
//	li_tipo_incidencia = Message.DoubleParm
//	
//	ls_sql = "SELECT DISTINCT GI_FAMILIA_CAUSAS.GPO_CAUSA " + &
//				"FROM GI_CAUSA, " + &
//				"GI_CAUSA_X_INCIDENCIA, " + &
//		      "GI_FAMILIA_CAUSAS " + &
//				"WHERE ( GI_CAUSA.GPO_CAUSA = GI_FAMILIA_CAUSAS.GPO_CAUSA ) and " + &
//				"( GI_CAUSA.COD_CAUSA = GI_CAUSA_X_INCIDENCIA.GI_CAUSA ) and " + &
//				"( ( GI_CAUSA_X_INCIDENCIA.GI_TIPO = " + String(li_tipo_incidencia) + ") )"
//Else

// GNU 28-11-2005. Mejora 1/342078
IF gu_comunic2.is_comunic.programa_llamante="w_reportes" THEN
	ls_sql = "SELECT GI_FAMILIA_CAUSAS.GPO_CAUSA " + &
				"FROM   GI_FAMILIA_CAUSAS " + &
				"ORDER BY GI_FAMILIA_CAUSAS.GPO_CAUSA "
ELSE
ls_sql = "SELECT GI_FAMILIA_CAUSAS.GPO_CAUSA " + &
				"FROM   GI_FAMILIA_CAUSAS " + &
				"WHERE GI_FAMILIA_CAUSAS.ACTIVO = 1 " + &
				"ORDER BY GI_FAMILIA_CAUSAS.GPO_CAUSA " 
END IF
// FIN GNU
				
//End If

DECLARE cu_causas DYNAMIC CURSOR FOR SQLSA ;
PREPARE SQLSA FROM :ls_sql ;
OPEN DYNAMIC cu_causas ;
//***************************************
//**  OSGI 2001.1  	19/04/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************

long ll_gpo_causa, ll_handle
string ls_descripcion;



fetch cu_causas INTO  :ll_gpo_causa;


do while sqlca.sqlcode = 0
// GNU 07-12-2005. Mejora 1/342078
IF gu_comunic2.is_comunic.programa_llamante="w_reportes" THEN
	SELECT "GI_FAMILIA_CAUSAS"."DESCRIPCION"
	INTO :ls_descripcion
	FROM "GI_FAMILIA_CAUSAS"
	WHERE "GI_FAMILIA_CAUSAS"."GPO_CAUSA" = :ll_gpo_causa;
ELSE
	SELECT "GI_FAMILIA_CAUSAS"."DESCRIPCION"
	INTO :ls_descripcion
	FROM "GI_FAMILIA_CAUSAS"
	WHERE "GI_FAMILIA_CAUSAS"."GPO_CAUSA" = :ll_gpo_causa
		AND GI_FAMILIA_CAUSAS.ACTIVO = 1;
END IF

	ll_handle = tv_1.insertitemfirst(0,ls_descripcion,1)	
	tv_1.getitem(ll_handle, le_elemento)
	le_elemento.data = ll_gpo_causa
	tv_1.setitem(ll_handle, le_elemento)
		
	fetch cu_causas INTO :ll_gpo_causa;	
loop

close cu_causas;


end event

on w_2301_sel_causa.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.tv_1=create tv_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.tv_1
end on

on w_2301_sel_causa.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.tv_1)
end on

event closequery;if gu_comunic2.is_comunic.longval4 = 0 or gu_comunic2.is_comunic.strval9 = "" then
	gu_comunic2.is_comunic.longval4 = 0
	gu_comunic2.is_comunic.strval9 = ""
end if
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_2301_sel_causa
end type

type cb_1 from commandbutton within w_2301_sel_causa
integer x = 503
integer y = 1416
integer width = 329
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
end type

event clicked;gu_comunic2.is_comunic.longval4 = 0
gu_comunic2.is_comunic.strval9 = ""
close(parent)
end event

type tv_1 from treeview within w_2301_sel_causa
integer x = 37
integer y = 40
integer width = 1335
integer height = 1340
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean hideselection = false
grsorttype sorttype = ascending!
string picturename[] = {"Group!","ArrangeTables!"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 536870912
end type

event doubleclicked;Treeviewitem le_elemento
long ll_handle, ll_gpo_causa, ll_cod_causa
string ls_descripcion

Setpointer(HourGlass!)

if handle > 0 then
	
//Comprobamos en que nivel se ha realizado el dbl click.
//		Si nivel = 2 se ha seleccionado la causa
//		Si nivel = 1 se cargan las causas

	tv_1.getitem(handle,le_elemento)
	if le_elemento.level = 1 and le_elemento.expandedonce = false then

		ll_gpo_causa = long(le_elemento.data)
		// GNU 28-11-2005. Mejora 1/342078
		IF gu_comunic2.is_comunic.programa_llamante="w_reportes" THEN
		//Carga las causas de las incidencias		
		DECLARE cu_causas_rep CURSOR FOR  
		SELECT "GI_CAUSA"."COD_CAUSA",
				 "GI_CAUSA"."DESCRIPCION"
		FROM "GI_CAUSA"
		WHERE "GI_CAUSA"."GPO_CAUSA" = :ll_gpo_causa ;



//AND
//				"GI_CAUSA"."COD_CAUSA" <> (
//														  SELECT MIN("GI_CAUSA"."COD_CAUSA")
//															 FROM "GI_CAUSA"
//															WHERE "GI_CAUSA"."GPO_CAUSA" = :ll_gpo_causa );


		
		open cu_causas_rep;
		
		fetch cu_causas_rep INTO :ll_cod_causa, :ls_descripcion;
		
		do while sqlca.sqlcode = 0
			//AHU Quitar la causa gen$$HEX1$$e900$$ENDHEX$$rica del $$HEX1$$e100$$ENDHEX$$rbol de causas
			IF UPPER(ls_descripcion) <> "GENERICA" AND UPPER(ls_descripcion) <> "GEN$$HEX1$$c900$$ENDHEX$$RICA" THEN
				ll_handle = tv_1.insertitemfirst(handle,ls_descripcion,2)
				tv_1.getitem(ll_handle,le_elemento)
				le_elemento.data = ll_cod_causa
				tv_1.setitem(ll_handle,le_elemento)
			END IF
		fetch cu_causas_rep INTO :ll_cod_causa, :ls_descripcion;
		
		loop
		
		close cu_causas_rep;
	ELSE
		DECLARE cu_causas CURSOR FOR  
		SELECT "GI_CAUSA"."COD_CAUSA",
				 "GI_CAUSA"."DESCRIPCION"
		FROM "GI_CAUSA"
		WHERE "GI_CAUSA"."GPO_CAUSA" = :ll_gpo_causa AND
				"GI_CAUSA"."ACTIVO"= 1;

//AND
//				"GI_CAUSA"."COD_CAUSA" <> (
//														  SELECT MIN("GI_CAUSA"."COD_CAUSA")
//															 FROM "GI_CAUSA"
//															WHERE "GI_CAUSA"."GPO_CAUSA" = :ll_gpo_causa );


		
		open cu_causas;
		
		fetch cu_causas INTO :ll_cod_causa, :ls_descripcion;
		
		do while sqlca.sqlcode = 0
			//AHU Quitar la causa gen$$HEX1$$e900$$ENDHEX$$rica del $$HEX1$$e100$$ENDHEX$$rbol de causas
			IF UPPER(ls_descripcion) <> "GENERICA" AND UPPER(ls_descripcion) <> "GEN$$HEX1$$c900$$ENDHEX$$RICA" THEN
				ll_handle = tv_1.insertitemfirst(handle,ls_descripcion,2)
				tv_1.getitem(ll_handle,le_elemento)
				le_elemento.data = ll_cod_causa
				tv_1.setitem(ll_handle,le_elemento)
			END IF
		fetch cu_causas INTO :ll_cod_causa, :ls_descripcion;
		
		loop
		
		close cu_causas;
	END IF // FIN GNU
		
	elseif le_elemento.level = 2 then
		
		//Se ha seleccionado la causa de la incidencia
		gu_comunic2.is_comunic.longval4 = long(le_elemento.data)
		gu_comunic2.is_comunic.strval9 = trim(le_elemento.label)
		close(parent)
				
	end if		
end if



end event


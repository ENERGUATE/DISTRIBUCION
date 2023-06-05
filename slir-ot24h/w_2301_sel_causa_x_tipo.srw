HA$PBExportHeader$w_2301_sel_causa_x_tipo.srw
forward
global type w_2301_sel_causa_x_tipo from window
end type
type cb_1 from commandbutton within w_2301_sel_causa_x_tipo
end type
type tv_1 from treeview within w_2301_sel_causa_x_tipo
end type
end forward

global type w_2301_sel_causa_x_tipo from window
integer x = 1120
integer y = 388
integer width = 1856
integer height = 1628
boolean titlebar = true
string title = "OPENSGI - Selecci$$HEX1$$f300$$ENDHEX$$n de Causa"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 79741120
cb_1 cb_1
tv_1 tv_1
end type
global w_2301_sel_causa_x_tipo w_2301_sel_causa_x_tipo

type variables
Integer ii_tipo

end variables

forward prototypes
public subroutine wf_causas_tipo_0 ()
public subroutine wf_causas_tipo_evento (integer pi_tipo)
public subroutine wf_causas_tipo_maniobra (integer pi_tipo)
public subroutine wf_causas_tipo_cambio_disponibilidad (integer pi_tipo)
public subroutine wf_causas_tipo_distinto_de_0 (integer pi_tipo)
public subroutine wf_causas_tipo_maniobra_stn (integer pi_tipo)
public subroutine wf_causas_tipo_evento_stn (integer pi_tipo)
public subroutine wf_causas_tipo_cambio_disponibilidad_stn (integer pi_tipo)
public subroutine wf_causas_tipo_estado_operativo (integer pi_tipo)
public subroutine wf_causas_tipo_estado_operativo_stn (integer pi_tipo)
public subroutine wf_causas_tipo_estado_no_operativo_stn (integer pi_tipo)
public subroutine wf_causas_tipo_estado_no_operativo (integer pi_tipo)
public subroutine wf_causasindisponibilidades ()
public subroutine fw_causasnoindisponibilidades ()
end prototypes

public subroutine wf_causas_tipo_0 ();Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento

String ls_tipo
Integer li_tipo

DECLARE cur_subtipos_gen CURSOR FOR  
	SELECT "GI_SUBTIPOS"."TIPO",   
			 "GI_SUBTIPOS"."SUBTIPO",   
			 "GI_SUBTIPOS"."DESCRIPCION",   
			 Fgnu_Tip_Inc("GI_SUBTIPOS"."TIPO")
     FROM "GI_SUBTIPOS" 
 ORDER BY IND_CREG, TIPO;  
	
OPEN cur_subtipos_gen;

FETCH cur_subtipos_gen INTO :li_tipo, :li_subt, :ls_descrip, :ls_tipo; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_tipo + "-" + ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos_gen INTO :li_tipo, :li_subt, :ls_descrip, :ls_tipo; 	
LOOP
  
CLOSE cur_subtipos_gen ;



end subroutine

public subroutine wf_causas_tipo_evento (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_EVENTO = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_maniobra (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_MANIOBRA = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_cambio_disponibilidad (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_CAMBIO_DISPONIBILIDAD = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_distinto_de_0 (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
 ORDER BY IND_CREG;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_maniobra_stn (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_MANIOBRA_STN = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_evento_stn (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_EVENTO_STN = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_cambio_disponibilidad_stn (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_CAMBIO_DISP_STN = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_estado_operativo (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_ESTADO_OPERATIVO = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_estado_operativo_stn (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_ESTADO_OPERATIVO_STN = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_estado_no_operativo_stn (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_ESTADO_NO_OPERATIVO_STN = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causas_tipo_estado_no_operativo (integer pi_tipo);Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento


DECLARE cur_subtipos CURSOR FOR  
	SELECT subtipo, descripcion
	  FROM GI_SUBTIPOS
	 WHERE TIPO = :pi_tipo 
	   AND ACTIVO= 1
		AND IND_ESTADO_NO_OPERATIVO = 1;

OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;





end subroutine

public subroutine wf_causasindisponibilidades ();/***********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Genera el primer nivel del $$HEX1$$e100$$ENDHEX$$rbol de causas para indisponibilidades*/
/* Argumentos  : -																					  */
/* Devuelve    : -																					  */
/* 					Autor 				Fecha 						Acci$$HEX1$$f300$$ENDHEX$$n					  */
/*						AHM			  	 23/04/2010					  Creaci$$HEX1$$f300$$ENDHEX$$n					  */
/***********************************************************************************/

Long 		ll_handle
String 	ls_descrip, ls_tipo_str
Integer  li_subt
Treeviewitem le_elemento

String ls_tipo
Integer li_tipo

ls_tipo_str = gu_comunic2.is_comunic.strval9 
ii_tipo = Message.DoubleParm  

gu_comunic2.is_comunic.longval4 = 0
gu_comunic2.is_comunic.strval9 = ""

// GNU 21-12-2005. Mejora 1/342078
IF ii_tipo = 0 THEN
	wf_causas_tipo_0()

ELSE // FIN GNU
	CHOOSE CASE ls_tipo_str
			
		CASE 'EVENTO'
			wf_causas_tipo_evento(ii_tipo)
		
		CASE 'MANIOBRA'
			wf_causas_tipo_maniobra(ii_tipo)

		CASE 'CAMBIO DE DISPONIBILIDAD'
			wf_causas_tipo_cambio_disponibilidad(ii_tipo)

		CASE 'ESTADO OPERATIVO'
			wf_causas_tipo_estado_operativo(ii_tipo)

		CASE 'ESTADO NO OPERATIVO'
			wf_causas_tipo_estado_no_operativo(ii_tipo)

		CASE 'EVENTO STN'
			wf_causas_tipo_evento_stn(ii_tipo)
		
		CASE 'MANIOBRA STN'
			wf_causas_tipo_maniobra_stn(ii_tipo)

		CASE 'CAMBIO DE DISPONIBILIDAD STN'
			wf_causas_tipo_cambio_disponibilidad_stn(ii_tipo)

		CASE 'ESTADO OPERATIVO STN'
			wf_causas_tipo_estado_operativo_stn(ii_tipo)

		CASE 'ESTADO NO OPERATIVO STN'
			wf_causas_tipo_estado_no_operativo_stn(ii_tipo)

		CASE ELSE
			wf_causas_tipo_distinto_de_0(ii_tipo)
			
	END CHOOSE
END IF
		
	

end subroutine

public subroutine fw_causasnoindisponibilidades ();/***********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : Genera el primer nivel del $$HEX1$$e100$$ENDHEX$$rbol de causas cuando las				  */
/*					  indisponibilidades no est$$HEX1$$e100$$ENDHEX$$n activas										  */
/* Argumentos  : -																					  */
/* Devuelve    : -																					  */
/* 					Autor 				Fecha 						Acci$$HEX1$$f300$$ENDHEX$$n					  */
/*						AHM			  	 23/04/2010					  Creaci$$HEX1$$f300$$ENDHEX$$n					  */
/***********************************************************************************/
Long 		ll_handle
String 	ls_descrip
Integer  li_subt
Treeviewitem le_elemento

String ls_tipo
Integer li_tipo

gu_comunic2.is_comunic.longval4 = 0
gu_comunic2.is_comunic.strval9 = ""

ii_tipo = Message.DoubleParm  
// GNU 21-12-2005. Mejora 1/342078
IF ii_tipo = 0 THEN
	DECLARE cur_subtipos_gen CURSOR FOR  
	 SELECT "GI_SUBTIPOS"."TIPO",   
         "GI_SUBTIPOS"."SUBTIPO",   
         "GI_SUBTIPOS"."DESCRIPCION",   
         Fgnu_Tip_Inc("GI_SUBTIPOS"."TIPO")
    FROM "GI_SUBTIPOS"  
	ORDER BY TIPO;  
	
OPEN cur_subtipos_gen;

FETCH cur_subtipos_gen INTO :li_tipo, :li_subt, :ls_descrip, :ls_tipo; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_tipo + "-" + ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos_gen INTO :li_tipo, :li_subt, :ls_descrip, :ls_tipo; 	
LOOP
  
CLOSE cur_subtipos_gen ;

ELSE // FIN GNU
	
DECLARE cur_subtipos CURSOR FOR  
// GNU 28-11-2005. Mejora 1/342078
//	SELECT subtipo, descripcion
//	FROM GI_SUBTIPOS
//	WHERE TIPO = :ii_tipo;
	SELECT subtipo, descripcion
	FROM GI_SUBTIPOS
	WHERE TIPO = :ii_tipo AND
	ACTIVO= 1;
// FIN GNU
	
	
OPEN cur_subtipos;

FETCH cur_subtipos INTO :li_subt, :ls_descrip; 
DO WHILE Sqlca.Sqlcode = 0
	
	le_elemento.data = li_subt
	le_elemento.label = ls_descrip
	le_elemento.pictureindex = 1
	le_elemento.selectedpictureindex = 1
	
	tv_1.InsertItemLast(0, le_elemento)

	
	FETCH cur_subtipos INTO :li_subt, :ls_descrip; 	
LOOP
  
CLOSE cur_subtipos ;

END IF
end subroutine

event open;//AHM (23/04/2010) $$HEX1$$c100$$ENDHEX$$rbol de causas aparece vacio

IF fg_verifica_parametro("Indisponibilidades activas") THEN
	wf_causasIndisponibilidades()
ELSE
	fw_causasNoIndisponibilidades()
END IF



//Long 		ll_handle
//String 	ls_descrip, ls_tipo_str
//Integer  li_subt
//Treeviewitem le_elemento
//
//String ls_tipo
//Integer li_tipo
//
//ls_tipo_str = gu_comunic2.is_comunic.strval9 
//ii_tipo = Message.DoubleParm  
//
//gu_comunic2.is_comunic.longval4 = 0
//gu_comunic2.is_comunic.strval9 = ""
//
//// GNU 21-12-2005. Mejora 1/342078
//IF ii_tipo = 0 THEN
//	wf_causas_tipo_0()
//
//ELSE // FIN GNU
//	CHOOSE CASE ls_tipo_str
//			
//		CASE 'EVENTO'
//			wf_causas_tipo_evento(ii_tipo)
//		
//		CASE 'MANIOBRA'
//			wf_causas_tipo_maniobra(ii_tipo)
//
//		CASE 'CAMBIO DE DISPONIBILIDAD'
//			wf_causas_tipo_cambio_disponibilidad(ii_tipo)
//
//		CASE 'ESTADO OPERATIVO'
//			wf_causas_tipo_estado_operativo(ii_tipo)
//
//		CASE 'ESTADO NO OPERATIVO'
//			wf_causas_tipo_estado_no_operativo(ii_tipo)
//
//		CASE 'EVENTO STN'
//			wf_causas_tipo_evento_stn(ii_tipo)
//		
//		CASE 'MANIOBRA STN'
//			wf_causas_tipo_maniobra_stn(ii_tipo)
//
//		CASE 'CAMBIO DE DISPONIBILIDAD STN'
//			wf_causas_tipo_cambio_disponibilidad_stn(ii_tipo)
//
//		CASE 'ESTADO OPERATIVO STN'
//			wf_causas_tipo_estado_operativo_stn(ii_tipo)
//
//		CASE 'ESTADO NO OPERATIVO STN'
//			wf_causas_tipo_estado_no_operativo_stn(ii_tipo)
//
//		CASE ELSE
//			wf_causas_tipo_distinto_de_0(ii_tipo)
//			
//	END CHOOSE
//END IF
//		
//	
//
end event

on w_2301_sel_causa_x_tipo.create
this.cb_1=create cb_1
this.tv_1=create tv_1
this.Control[]={this.cb_1,&
this.tv_1}
end on

on w_2301_sel_causa_x_tipo.destroy
destroy(this.cb_1)
destroy(this.tv_1)
end on

event closequery;If gu_comunic2.is_comunic.longval4 = 0 Or gu_comunic2.is_comunic.strval9 = "" Then
	gu_comunic2.is_comunic.longval4 = 0
	gu_comunic2.is_comunic.strval9 = ""
End If
end event

type cb_1 from commandbutton within w_2301_sel_causa_x_tipo
integer x = 722
integer y = 1412
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
Close(parent)
end event

type tv_1 from treeview within w_2301_sel_causa_x_tipo
integer x = 14
integer y = 20
integer width = 1797
integer height = 1352
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean hasbuttons = false
boolean haslines = false
boolean linesatroot = true
boolean hideselection = false
string picturename[] = {"Group!","ArrangeTables!","DataManip!"}
long picturemaskcolor = 16777215
long statepicturemaskcolor = 553648127
end type

event doubleclicked;TreeviewItem le_elemento
Long	 ll_data, ll_nivel, ll_handle, ll_cod, ll_data_n1
String ls_desc
//AHM (05/04/2010) Causa gen$$HEX1$$e900$$ENDHEX$$rica
long		ll_causaGenerica

// GNU 12-1-2006. Mejora 1/342078
TreeviewItem padre_elemento
Long ll_padre
// FIN GNU

long ll_tipo
string ls_tipo

//AHM (05/04/2010) Causa gen$$HEX1$$e900$$ENDHEX$$rica
SELECT TO_NUMBER(valor)
INTO  :ll_causaGenerica
FROM   sgd_valor
WHERE  codif = 'C_GN';	

IF ii_tipo = 0 THEN
	tv_1.Getitem(handle, le_elemento)
	
ll_nivel  = le_elemento.Level
ll_data   = Long(le_elemento.data)
ll_handle = tv_1.FindItem(ChildTreeItem!,handle)
ls_tipo= left (le_elemento.label,2)

If ll_nivel = 1 and ll_handle = -1 Then 
	// GNU 12-1.2006. Mejora 1/342078
	SELECT TIPO
	INTO : ll_tipo
	FROM GI_SUBTIPOS
	WHERE SUBTIPO= :ll_data AND
	Fgnu_Tip_Inc(TIPO)= :ls_tipo;
	// FIN GNU
	//*****************************************
	//**  OSGI 2001.2  	20/11/2002			  **
	//**  Jair Padilla / Soluziona PANAMA    **
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  **
	//*****************************************
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  	DECLARE cur_sub_cau CURSOR FOR
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  	  SELECT "GI_SUBTIPO_CAUSA"."GPO_CAUSA",   
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  				"GI_FAMILIA_CAUSAS"."DESCRIPCION"  
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  		 FROM "GI_SUBTIPO_CAUSA", "GI_FAMILIA_CAUSAS"
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  		WHERE ( "GI_SUBTIPO_CAUSA"."GPO_CAUSA" = "GI_FAMILIA_CAUSAS"."GPO_CAUSA" ) AND 
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  				( "GI_SUBTIPO_CAUSA"."TIPO" = :ii_tipo) AND 
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  				( "GI_SUBTIPO_CAUSA"."SUBTIPO" = :ll_data )  ;

	DECLARE cur_sub_cau_gen CURSOR FOR
// GNU 28-11-2005. Mejora 1/342078
//   SELECT "GI_SUBTIPO_CAUSA"."GPO_CAUSA",   
//			 "GI_SUBTIPO_CAUSA"."DESCRIPCION"  
//	  FROM "GI_SUBTIPO_CAUSA"
//	 WHERE ( "GI_SUBTIPO_CAUSA"."TIPO" = :ii_tipo) AND 
//			 ( "GI_SUBTIPO_CAUSA"."SUBTIPO" = :ll_data ) ;

   SELECT "GI_SUBTIPO_CAUSA"."GPO_CAUSA",   
			 "GI_SUBTIPO_CAUSA"."DESCRIPCION"  
	  FROM "GI_SUBTIPO_CAUSA"
	 WHERE ( "GI_SUBTIPO_CAUSA"."TIPO" = :ll_tipo) AND 
			 ( "GI_SUBTIPO_CAUSA"."SUBTIPO" = :ll_data );
// FIN GNU
	//*****************************************
	//**  OSGI 2001.2  	20/11/2002			  **
	//**  Jair Padilla / Soluziona PANAMA    **
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  **
	//*****************************************

	OPEN cur_sub_cau_gen;

	FETCH cur_sub_cau_gen INTO :ll_cod, :ls_desc;
	
	DO WHILE SQLCA.SQLCODE = 0
		//AHU -> Quitar causa gen$$HEX1$$e900$$ENDHEX$$rica del $$HEX1$$e100$$ENDHEX$$rbol para que no puedan seleccionarla
		IF UPPER(ls_desc) <> "GENERICA" AND UPPER(ls_desc) <> "GEN$$HEX1$$c900$$ENDHEX$$RICA" THEN
			le_elemento.label = ls_desc
			le_elemento.data  = ll_cod
			le_elemento.pictureindex = 2
			le_elemento.selectedpictureindex = 2
			le_elemento.selected = false
			tv_1.InsertItemLast(handle, le_elemento)
		END IF
		FETCH cur_sub_cau_gen INTO :ll_cod, :ls_desc;
	LOOP
	
	CLOSE cur_sub_cau_gen;	
ElseIf ll_nivel = 2 And ll_handle = -1 Then
	ll_handle = tv_1.FindItem(ParentTreeItem!, handle)
	tv_1.Getitem(ll_handle, le_elemento)
	ll_data_n1 = le_elemento.data
	// GNU 12-1.2006. Mejora 1/342078
	ls_tipo= left (le_elemento.label,2)
	
	SELECT TIPO
	INTO : ll_tipo
	FROM GI_SUBTIPO_CAUSA
	WHERE SUBTIPO= :ll_data_n1 AND
	GPO_CAUSA= :ll_data AND
	TIPO IN(
	SELECT TIPO
	FROM GI_SUBTIPOS
	WHERE SUBTIPO= :ll_data_n1 AND
	Fgnu_Tip_Inc(TIPO)= :ls_tipo);
	// FIN GNU
// GNU  7-12-2005. Mejora 1/342078	
//	DECLARE cur_causas CURSOR FOR
//	  SELECT "GI_CAUSA"."COD_CAUSA",   
//			"GI_CAUSA"."DESCRIPCION"  
//	 FROM "GI_CAUSA"  
//	WHERE ( "GI_CAUSA"."TIPO" = :ii_tipo ) AND  
//			( "GI_CAUSA"."SUBTIPO" = :ll_data_n1  ) AND  
//			( "GI_CAUSA"."GPO_CAUSA" = :ll_data );
	DECLARE cur_causas_gen CURSOR FOR
	  SELECT "GI_CAUSA"."COD_CAUSA",   
			"GI_CAUSA"."DESCRIPCION"  
	 FROM "GI_CAUSA"  
	WHERE ( "GI_CAUSA"."TIPO" = :ll_tipo ) AND  
			( "GI_CAUSA"."SUBTIPO" = :ll_data_n1  ) AND  
			( "GI_CAUSA"."GPO_CAUSA" = :ll_data );
// FIN GNU
	OPEN cur_causas_gen;

	FETCH cur_causas_gen INTO :ll_cod, :ls_desc;

	DO WHILE SQLCA.SQLCODE = 0

		//AHM (05/04/2010) Causa gen$$HEX1$$e900$$ENDHEX$$rica
		IF ll_causaGenerica <> ll_cod THEN
			le_elemento.label = ls_desc
			le_elemento.data  = ll_cod
			le_elemento.pictureindex = 3
			le_elemento.selectedpictureindex = 3
			tv_1.InsertItemLast(handle, le_elemento)
		END IF
	
		FETCH cur_causas_gen INTO :ll_cod, :ls_desc;
		
	LOOP
	
	CLOSE cur_causas_gen;	
	
ElseIf ll_nivel = 3 Then
		gu_comunic2.is_comunic.longval4 = long(le_elemento.data)
		gu_comunic2.is_comunic.strval9 =  trim(le_elemento.label)
		Close(Parent)
End IF
//	tv_1.SetFirstVisible(handle)
ELSE
tv_1.Getitem(handle, le_elemento)
	
ll_nivel  = le_elemento.Level
ll_data   = Long(le_elemento.data)
ll_handle = tv_1.FindItem(ChildTreeItem!,handle)


If ll_nivel = 1 and ll_handle = -1 Then 
	//*****************************************
	//**  OSGI 2001.2  	20/11/2002			  **
	//**  Jair Padilla / Soluziona PANAMA    **
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  **
	//*****************************************
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  	DECLARE cur_sub_cau CURSOR FOR
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  	  SELECT "GI_SUBTIPO_CAUSA"."GPO_CAUSA",   
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  				"GI_FAMILIA_CAUSAS"."DESCRIPCION"  
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  		 FROM "GI_SUBTIPO_CAUSA", "GI_FAMILIA_CAUSAS"
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  		WHERE ( "GI_SUBTIPO_CAUSA"."GPO_CAUSA" = "GI_FAMILIA_CAUSAS"."GPO_CAUSA" ) AND 
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  				( "GI_SUBTIPO_CAUSA"."TIPO" = :ii_tipo) AND 
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  				( "GI_SUBTIPO_CAUSA"."SUBTIPO" = :ll_data )  ;

	DECLARE cur_sub_cau CURSOR FOR
// GNU 28-11-2005. Mejora 1/342078
//   SELECT "GI_SUBTIPO_CAUSA"."GPO_CAUSA",   
//			 "GI_SUBTIPO_CAUSA"."DESCRIPCION"  
//	  FROM "GI_SUBTIPO_CAUSA"
//	 WHERE ( "GI_SUBTIPO_CAUSA"."TIPO" = :ii_tipo) AND 
//			 ( "GI_SUBTIPO_CAUSA"."SUBTIPO" = :ll_data ) ;

   SELECT "GI_SUBTIPO_CAUSA"."GPO_CAUSA",   
			 "GI_SUBTIPO_CAUSA"."DESCRIPCION"  
	  FROM "GI_SUBTIPO_CAUSA"
	 WHERE ( "GI_SUBTIPO_CAUSA"."TIPO" = :ii_tipo) AND 
			 ( "GI_SUBTIPO_CAUSA"."SUBTIPO" = :ll_data )  AND
			 ("GI_SUBTIPO_CAUSA"."ACTIVO" = 1);
// FIN GNU
	//*****************************************
	//**  OSGI 2001.2  	20/11/2002			  **
	//**  Jair Padilla / Soluziona PANAMA    **
	//**  INDICATIVO DE INCIDENCIA OBLIGADA  **
	//*****************************************

	OPEN cur_sub_cau;

	FETCH cur_sub_cau INTO :ll_cod, :ls_desc;
	
	DO WHILE SQLCA.SQLCODE = 0
		//AHU -> Quitar causa gen$$HEX1$$e900$$ENDHEX$$rica del $$HEX1$$e100$$ENDHEX$$rbol para que no puedan seleccionarla
		IF UPPER(ls_desc) <> "GENERICA" AND UPPER(ls_desc) <> "GEN$$HEX1$$c900$$ENDHEX$$RICA" THEN
			le_elemento.label = ls_desc
			le_elemento.data  = ll_cod
			le_elemento.pictureindex = 2
			le_elemento.selectedpictureindex = 2
			le_elemento.selected = false
			tv_1.InsertItemLast(handle, le_elemento)
		END IF
		FETCH cur_sub_cau INTO :ll_cod, :ls_desc;
	LOOP
	
	CLOSE cur_sub_cau;	
ElseIf ll_nivel = 2 And ll_handle = -1 Then
	ll_handle = tv_1.FindItem(ParentTreeItem!, handle)
	tv_1.Getitem(ll_handle, le_elemento)
	ll_data_n1 = le_elemento.data

// GNU  7-12-2005. Mejora 1/342078	
//	DECLARE cur_causas CURSOR FOR
//	  SELECT "GI_CAUSA"."COD_CAUSA",   
//			"GI_CAUSA"."DESCRIPCION"  
//	 FROM "GI_CAUSA"  
//	WHERE ( "GI_CAUSA"."TIPO" = :ii_tipo ) AND  
//			( "GI_CAUSA"."SUBTIPO" = :ll_data_n1  ) AND  
//			( "GI_CAUSA"."GPO_CAUSA" = :ll_data );
	DECLARE cur_causas CURSOR FOR
	  SELECT "GI_CAUSA"."COD_CAUSA",   
			"GI_CAUSA"."DESCRIPCION"  
	 FROM "GI_CAUSA"  
	WHERE ( "GI_CAUSA"."TIPO" = :ii_tipo ) AND  
			( "GI_CAUSA"."SUBTIPO" = :ll_data_n1  ) AND  
			( "GI_CAUSA"."GPO_CAUSA" = :ll_data )  AND 
			("GI_CAUSA"."ACTIVO"= 1);
// FIN GNU
	OPEN cur_causas;

	FETCH cur_causas INTO :ll_cod, :ls_desc;
	
	DO WHILE SQLCA.SQLCODE = 0
		
		//AHM (05/04/2010) Causa gen$$HEX1$$e900$$ENDHEX$$rica
		IF ll_causaGenerica <> ll_cod THEN
			le_elemento.label = ls_desc
			le_elemento.data  = ll_cod
			le_elemento.pictureindex = 3
			le_elemento.selectedpictureindex = 3
			tv_1.InsertItemLast(handle, le_elemento)
		END IF
		
		FETCH cur_causas INTO :ll_cod, :ls_desc;
		
	LOOP
	
	CLOSE cur_causas;	
	
ElseIf ll_nivel = 3 Then
		gu_comunic2.is_comunic.longval4 = long(le_elemento.data)
		gu_comunic2.is_comunic.strval9 =  trim(le_elemento.label)
		//JME 21/05/09
		ll_handle = tv_1.FindItem(ParentTreeItem!, handle)
		tv_1.Getitem(ll_handle, le_elemento)
		gu_comunic2.is_comunic.longval5 = long(le_elemento.data)
		//Fin JME
		Close(Parent)
End IF
//	tv_1.SetFirstVisible(handle)
END IF
end event


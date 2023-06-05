HA$PBExportHeader$u_bri_2011_nu_ingreso_brigadas.sru
forward
global type u_bri_2011_nu_ingreso_brigadas from nonvisualobject
end type
end forward

global type u_bri_2011_nu_ingreso_brigadas from nonvisualobject
end type
global u_bri_2011_nu_ingreso_brigadas u_bri_2011_nu_ingreso_brigadas

forward prototypes
public function boolean fnu_validar (ref datawindow pd_dw, ref string ls_modstring)
public function boolean fnu_validar_movil (ref string ls_modstring, string ps_movil)
public function boolean fnu_validar_nombre (ref string ls_modstring, string ps_nombre)
public function long fnu_actualizar_ultima_brigada ()
public function boolean fnu_borrar_brigada (long pl_nro_brig)
public function integer fnu_crea_dddw (ref datawindow dw)
end prototypes

public function boolean fnu_validar (ref datawindow pd_dw, ref string ls_modstring);string      ls_texto, ls_columna,a
string ls_titulo
ls_texto = pd_dw.GetText()
ls_columna = pd_dw.GetColumnName()
boolean lb_ok

lb_ok = TRUE
CHOOSE CASE ls_columna
        CASE "nro_brigada"
                IF isnull(ls_texto) OR integer(ls_texto)=0 THEN
                        ls_modstring = ls_columna + ".ValidationMsg='Debe introducir un n$$HEX1$$fa00$$ENDHEX$$mero correcto de Brigada'"
                        lb_ok = FALSE
                END IF
        CASE "movil"
                IF isnull(ls_texto) OR ls_texto = " " THEN
                        ls_modstring = ls_columna + ".ValidationMsg='Debe introducir un n$$HEX1$$fa00$$ENDHEX$$mero correcto de M$$HEX1$$f300$$ENDHEX$$vil'"                      
                        lb_ok = FALSE
                END IF
END CHOOSE

RETURN lb_ok
end function

public function boolean fnu_validar_movil (ref string ls_modstring, string ps_movil);boolean lb_ok

lb_ok = TRUE

IF isnull(ps_movil) OR Len(LeftTrim(Righttrim(ps_movil)))=0 THEN
        gnv_msg.f_mensaje("AI94","","",OK!)
        //Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Debe introducir un n$$HEX1$$fa00$$ENDHEX$$mero correcto de m$$HEX1$$f300$$ENDHEX$$vil",exclamation!)
        lb_ok = FALSE
END IF
        
RETURN lb_ok
end function

public function boolean fnu_validar_nombre (ref string ls_modstring, string ps_nombre);boolean lb_ok

lb_ok = TRUE

IF isnull(ps_nombre) OR Len(LeftTrim(Righttrim(ps_nombre)))=0 THEN
        ls_modstring = "No puede ingresar una brigada sin nombre"
        lb_ok = FALSE
END IF
        
RETURN lb_ok
end function

public function long fnu_actualizar_ultima_brigada ();long ll_nro_brig

//Obtengo la ultima brigada

SELECT ultimo
        INTO :ll_nro_brig FROM gi_t_ultimo
        WHERE tabla LIKE 'BRIGADA' FOR UPDATE;

ll_nro_brig++

//Actualiza el ultimo valor de brigada

UPDATE gi_t_ultimo SET ultimo=:ll_nro_brig WHERE tabla LIKE 'BRIGADA';
gnu_u_transaction.uf_commit();
RETURN ll_nro_brig
end function

public function boolean fnu_borrar_brigada (long pl_nro_brig);long ll_cantidad_veces
long ll_nro_brigadista


SELECT count(*) 
INTO :ll_cantidad_veces
from gi_ot,gi_brigada_ot
where ult_brigada = :pl_nro_brig and est_ot <> :fgci_ot_resuelta and
gi_ot.nro_ot = gi_brigada_ot.nro_ot and
est_brigada <> :fgci_ot_resuelta and gi_brigada_ot.f_hasta is null;
// No se puede borrar una brigada si es la responsable de la OT

IF ll_cantidad_veces > 0 THEN
  messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La brigada est$$HEX2$$e1002000$$ENDHEX$$asignada como responsable en una OT que a$$HEX1$$fa00$$ENDHEX$$n est$$HEX2$$e1002000$$ENDHEX$$abierta.",information!,ok!) 
  RETURN FALSE
ELSE
		
	DECLARE lcur_nro_brigadistas CURSOR FOR  
	SELECT "GI_BRIGADA_BRIGADISTA"."NRO_BRIGADISTAS"  
	FROM "GI_BRIGADA_BRIGADISTA"  
	WHERE "GI_BRIGADA_BRIGADISTA"."NRO_BRIGADA" = :pl_nro_brig;

	OPEN lcur_nro_brigadistas;

	FETCH lcur_nro_brigadistas INTO :ll_nro_brigadista;

	DO WHILE sqlca.sqlcode = 0
		UPDATE "GI_BRIGADISTA"  
		SET "IND_DISPONIBLE" = 1  , "ENCARGADO" = 0
		WHERE "GI_BRIGADISTA"."NRO_BRIGADISTAS" = :ll_nro_brigadista;
		FETCH lcur_nro_brigadistas INTO :ll_nro_brigadista;
	LOOP

	CLOSE lcur_nro_brigadistas;

	DELETE FROM "GI_BRIGADA_BRIGADISTA"  
	WHERE "GI_BRIGADA_BRIGADISTA"."NRO_BRIGADA" = :pl_nro_brig;
	
	if sqlca.sqlcode = -1 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n"," Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al borrar la tabla gi_brigada_brigadista: " + sqlca.sqlerrtext,Exclamation!,ok!)
		Return false
	END IF
		
	delete from gi_brigada_ot where nro_brigada = :pl_nro_brig;
	
	if sqlca.sqlcode = -1 then
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n"," Ocurri$$HEX2$$f3002000$$ENDHEX$$un error al borrar la tabla gi_brigada_ot: " + sqlca.sqlerrtext,Exclamation!,ok!)
		Return false
	END IF

	RETURN TRUE
end if
end function

public function integer fnu_crea_dddw (ref datawindow dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crea_dddw
// 
// Objetivo: Crea las drop down datawindows internas del user object.
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada:  --
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      21/1/96         MLP                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
datawindowchild ddw_int_horario, ddw_tipo_brig

//dw.GetChild('turno', ddw_int_horario)
//ddw_int_horario.SetTransObject(sqlca)
//ddw_int_horario.Retrieve()

dw.GetChild('tip_brigada',ddw_tipo_brig)
ddw_tipo_brig.SetTransObject(sqlca)
ddw_tipo_brig.Retrieve()

return 1
end function

on u_bri_2011_nu_ingreso_brigadas.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_bri_2011_nu_ingreso_brigadas.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on


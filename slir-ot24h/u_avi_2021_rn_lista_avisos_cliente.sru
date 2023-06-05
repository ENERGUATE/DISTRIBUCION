HA$PBExportHeader$u_avi_2021_rn_lista_avisos_cliente.sru
forward
global type u_avi_2021_rn_lista_avisos_cliente from nonvisualobject
end type
end forward

global type u_avi_2021_rn_lista_avisos_cliente from nonvisualobject
end type
global u_avi_2021_rn_lista_avisos_cliente u_avi_2021_rn_lista_avisos_cliente

type variables
// constantes
//int fgci_perfil_oper_alta_media
//int fgci_perfil_oper_encargado_turno
//int fgci_perfil_oper_baja

end variables

forward prototypes
public function boolean frn_aut_liberar_aviso ()
public function integer frn_interrup_marcadas (decimal pdec_nro_incidencia, decimal pdec_nro_instal)
end prototypes

public function boolean frn_aut_liberar_aviso ();/////////////////////////////////////////////////////////////////////
//
// Funcion:  frn_aut_liberar_aviso
//
// Objetivo: Verifica si el usuario tiene perfil de operaciones.
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
//
//
///////////////////////////////////////////////////////

IF gu_perfiles.of_acceso_perfil(gi_perfil,'INC_LIBERAR_AV','ACC_MANTEN') = 1  THEN
		Return True
END IF
Return False
end function

public function integer frn_interrup_marcadas (decimal pdec_nro_incidencia, decimal pdec_nro_instal);int li_veces

SELECT COUNT(*) 
INTO :li_veces 
from "SGD_INTERRUPCION" A 
where A."NRO_INCIDENCIA" = :pdec_nro_incidencia and 
		A."NRO_INSTALACION" IN
		(select  B."NRO_INSTALACION" from "SGD_INSTALACION" B
		 start with B."NRO_INSTALACION" = :pdec_nro_instal and B."BDI_JOB" = 0
		 connect by prior B."NRO_INST_PADRE" = B."NRO_INSTALACION" and B."BDI_JOB" = 0);

if sqlca.sqlcode = 0 then 
	return li_veces
else
	return -1
end if

end function

on constructor;//fnu_def_constantes()

end on

on u_avi_2021_rn_lista_avisos_cliente.create
TriggerEvent( this, "constructor" )
end on

on u_avi_2021_rn_lista_avisos_cliente.destroy
TriggerEvent( this, "destructor" )
end on


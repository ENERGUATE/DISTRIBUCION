HA$PBExportHeader$u_bri_2019_nu_ingreso_tareas.sru
forward
global type u_bri_2019_nu_ingreso_tareas from nonvisualobject
end type
end forward

global type u_bri_2019_nu_ingreso_tareas from nonvisualobject
end type
global u_bri_2019_nu_ingreso_tareas u_bri_2019_nu_ingreso_tareas

type variables
datawindowchild dddw_estado_ot
datawindowchild dddw_tareas
end variables

forward prototypes
public function integer fnu_actualiza_nro_ot ()
public function integer fnu_crea_dddw (ref datawindow dw)
public function string frn_validar_tarea (ref datawindow pd_dw, string ps_string)
public function boolean fnu_v_fechas_tareas (ref datawindow pd_dw)
public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_ot)
end prototypes

public function integer fnu_actualiza_nro_ot ();long ll_nro_ot

//Obtengo la ultima ot 
select cod_ot.nextval into :ll_nro_ot from dual;

RETURN ll_nro_ot
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

dw.GetChild('pi_estado', dddw_estado_ot)
dddw_estado_ot.SetTransObject(sqlca)
dddw_estado_ot.Retrieve()

dw.GetChild('nro_tarea', dddw_tareas)
dddw_tareas.SetTransObject(sqlca)
dddw_tareas.Retrieve()

return 1
end function

public function string frn_validar_tarea (ref datawindow pd_dw, string ps_string);string  ls_valor, ls_modstring

ls_modstring = ""

        CHOOSE CASE ps_string
                CASE "prioridad"
                        ls_valor = pd_dw.GetText()
                        IF isnull(ls_valor) OR  ls_valor = "" THEN
                                ls_modstring = "Debe introducir una prioridad a la tarea"
                        END IF
                CASE "nro_tarea"
                        ls_valor = pd_dw.GetText()
                        IF isnull(ls_valor) OR  ls_valor = "" THEN
                                ls_modstring = "Debe introducir un nombre de tarea"
                        END IF
        END CHOOSE      

RETURN ls_modstring

end function

public function boolean fnu_v_fechas_tareas (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_v_fechas_tareas
// 
// Objetivo: Valida que las fechas de inicio de tareas
//                               no sean posteriores a las fechas de fin 
//      Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: datawindow
//              Salida:   True valida
//                                       False no valida                
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_contador,ll_tope
boolean lb_f_valida
datetime ldt_f_generada, ldt_f_resolucion


pd_dw.AcceptText()
lb_f_valida=TRUE
ll_tope=pd_dw.RowCount()


IF ll_tope>0 THEN
        FOR ll_contador=1 TO ll_tope
                ldt_f_generada=pd_dw.GetItemDateTime(ll_contador,"fecha_generada")
                ldt_f_resolucion=pd_dw.GetItemDateTime(ll_contador,"fecha_resolucion")
                IF ldt_f_generada>ldt_f_resolucion THEN
//                      NOT ISNULL(ldt_f_resolucion)) 
         gnv_msg.f_mensaje("AM42","","",OK!)  
                        //messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "La fecha de resoluci$$HEX1$$f300$$ENDHEX$$n de la tarea no puede ser menor a la fecha de generaci$$HEX1$$f300$$ENDHEX$$n de la misma")
                        lb_f_valida=FALSE
                END IF
        NEXT
END IF

Return  lb_f_valida

end function

public function integer fnu_obtener_datos (ref datawindow pd_dw, long pl_nro_ot);// Trae los datos de los brigadistas 
pd_dw.settransobject(sqlca)
pd_dw.retrieve(pl_nro_ot)
return 1

end function

on u_bri_2019_nu_ingreso_tareas.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2019_nu_ingreso_tareas.destroy
TriggerEvent( this, "destructor" )
end on


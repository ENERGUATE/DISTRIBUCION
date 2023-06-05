HA$PBExportHeader$u_ot_2001_nu_form_orden_de_trabajo.sru
forward
global type u_ot_2001_nu_form_orden_de_trabajo from u_ot_1002_nu_generico
end type
end forward

global type u_ot_2001_nu_form_orden_de_trabajo from u_ot_1002_nu_generico
end type
global u_ot_2001_nu_form_orden_de_trabajo u_ot_2001_nu_form_orden_de_trabajo

type variables
u_avi_1002_nu_generico iu_avi_1002_nu
u_ot_2001_rn_form_orden_de_trabajo iu_ot_2001_rn
end variables

forward prototypes
public function integer fnu_crea_dddw (ref datawindow pd_dw)
public function integer fnu_ultimo_ot ()
public function integer fnu_grabar_ot (string ps_accion, ref datawindow pd_dw)
public function integer fnu_anular_ot (long pl_nro_ot)
public function datetime fnu_devolver_fec_ini_ot (ref datawindow pd_dw)
public function long fnu_actualizar_ultima_ot ()
public function integer fnu_cargar_ot (ref datawindow pd_dw, decimal pd_instalacion, long pl_aviso, long pl_nro_ultima_ot, long pl_brigada_resp, integer pi_centro, integer pi_cmd, integer pi_mesa, long pl_nro_incidencia, boolean pb_alta)
public function integer fnu_mostrar_datos (ref datawindow pw_dw, long pl_nro_ot)
end prototypes

public function integer fnu_crea_dddw (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_crea_dddw
// 
// Objetivo: Crea la drop down data window de estado de la orden de trabajo
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: data window 
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      30/1/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

DataWindowChild ddw_Estado                                      

pd_dw.GetChild('est_ot',ddw_Estado)     //Creo la dropDown de Estado de ot
ddw_Estado.SetTransObject(SQLCA)
ddw_Estado.retrieve()

Return 1
end function

public function integer fnu_ultimo_ot ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_ultimo_ot
//
// Objetivo: Obtiene ultimo orden de trabajo
//      
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//              Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------          -----------   ---------
//
//
///////////////////////////////////////////////////////

long ll_nro_ot

//Obtengo la ultima ot 
select cod_ot.nextval into :ll_nro_ot from dual;
Return ll_nro_ot
end function

public function integer fnu_grabar_ot (string ps_accion, ref datawindow pd_dw);//////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_grabar_ot
// 
// Objetivo: Actualiza la tabla de ot  
//           
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//                      Entrada: estructura
//                      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      30/1/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
//////////////////////////////////////////////////////////////////////////////////////////////
string ls_usuario
int li_existe

if isnull(pd_dw.getitemdatetime(1,"h_hasta")) then
        pd_dw.setitem(1,"h_hasta",fgnu_fecha_actual())
end if
if isnull(pd_dw.getitemnumber(1,"nro_incidencia")) then
        pd_dw.setitem(1,"nro_incidencia",0)
end if
int a
a=pd_dw.UPDATE()
RETURN a


//IF ps_Accion = "Asignar a instalacion" THEN
//      Select usuario INTO :ls_usuario from ot Where nro_ot=:is_ot.gstr_nro_ot;
//      IF SQLCA.SQLCODE=100 THEN
//              INSERT INTO "OT"  
//         ( "NRO_OT",     
//           "USUARIO",     
//           "F_ACTUAL",     
//           "H_ACTUAL",     
//           "PROGRAMA",     
//           "EST_OT",     
//           "DESCRIPCION",     
//           "NRO_AVISO",     
//           "NRO_INSTALACION",     
//           "NRO_INCIDENCIA",     
//           "F_DESDE",     
//           "F_HASTA",     
//           "H_DESDE",     
//           "H_HASTA",     
//           "F_ALTA",     
//           "H_ALTA",     
//           "ULT_BRIGADA",      
//           "NRO_CENTRO",     
//           "NRO_CMD",     
//           "NRO_MESA" )    
//              VALUES (  :is_ot.gstr_nro_ot,     
//            :is_ot.gstr_usuario,     
//            :is_ot.gstr_f_actual,     
//            :is_ot.gstr_h_actual,     
//            :is_ot.gstr_programa,     
//            :is_ot.gstr_est_ot,     
//            :is_ot.gstr_descripcion,     
//            :is_ot.gstr_nro_aviso,     
//            :is_ot.gstr_nro_instalacion,     
//            :is_ot.gstr_nro_incidencia,     
//            :is_ot.gstr_f_desde,     
//            :is_ot.gstr_f_hasta,     
//            :is_ot.gstr_h_desde,     
//            :is_ot.gstr_h_hasta,     
//            :is_ot.gstr_f_alta,     
//            :is_ot.gstr_h_alta,   
//            :is_ot.gstr_ult_brigada,   
//            :is_ot.gstr_nro_centro,   
//            :is_ot.gstr_nro_cmd,   
//            :is_ot.gstr_nro_mesa )  ;
//      END IF
//END IF







end function

public function integer fnu_anular_ot (long pl_nro_ot);/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_anular_ot
// 
// Objetivo: Actualizar orden de trabajo
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: pl_nro_ot
//              Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------          -----------   ---------
//
//
///////////////////////////////////////////////////////
//
string ls_usuario

SELECT usuario into :ls_usuario FROM GI_ot WHERE nro_ot=:pl_nro_ot FOR UPDATE;
IF SQLCA.SQLCODE<>100 THEN
        UPDATE GI_ot SET est_ot=4 WHERE nro_ot=:pl_nro_ot;
        IF sqlca.sqlcode <> 0  THEN
                return 0
        END IF
        Return 1
END IF
Return 0

end function

public function datetime fnu_devolver_fec_ini_ot (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_devolver_fec_ini_ot
// 
// Objetivo: Retorna la fecha en que fue dada de alta la ot
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: pd_dw
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      6/3/96          SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pd_dw.AcceptText()
return pd_dw.GetItemDateTime(1,"f_desde")
end function

public function long fnu_actualizar_ultima_ot ();/////////////////////////////////////////////////////////////////////
//
// Funcion: fnu_actualizar_ultima_ot
//
// Objetivo: Obtiene la $$HEX1$$fa00$$ENDHEX$$ltima ot y se actualiza el valor
//
// Ambito:   P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//              Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------          -----------   ---------
//
//
///////////////////////////////////////////////////////


long ll_nro_ot

//Obtengo la ultima ot 
select cod_ot.nextval into :ll_nro_ot from dual;

Return ll_nro_ot
end function

public function integer fnu_cargar_ot (ref datawindow pd_dw, decimal pd_instalacion, long pl_aviso, long pl_nro_ultima_ot, long pl_brigada_resp, integer pi_centro, integer pi_cmd, integer pi_mesa, long pl_nro_incidencia, boolean pb_alta);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_ot
// 
// Objetivo:Carga en la estructura los datos de ot en la tabla ot
//           
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//                      Entrada: data window 
//                                              todos los datos de la tabla
//                      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      30/1/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_aviso
datetime ld_fecha
pd_dw.AcceptText()

//evalua los parametros pasados por defecto
        
        IF ISNULL(pl_brigada_resp) THEN
                pl_brigada_resp=fgci_sin_seleccionar
        END IF

        IF NOT ISNULL(pl_nro_incidencia) THEN
                if pl_nro_incidencia <> 0 and pl_nro_incidencia <> 99 then
                        pd_instalacion= 0
                        pl_aviso=0
                end if 
        END IF
        
        IF ISNULL(pd_instalacion) THEN
                pd_instalacion=0
        END IF
        
        IF ISNULL(pl_aviso) THEN
                pl_aviso=0
        END IF  
        
        IF ISNULL(pl_nro_incidencia) THEN
                pl_nro_incidencia=0
        END IF  

        pd_dw.SetItem(1,"nro_ot",pl_nro_ultima_ot)
        pd_dw.SetItem(1,"usuario",gs_usuario) 
        pd_dw.SetItem(1,"f_actual",fgnu_fecha_actual())
        pd_dw.SetItem(1,"h_actual",fgnu_fecha_actual())                                 
        pd_dw.SetItem(1,"programa","u_bri_2001_nu")
        
//                      //Controlo el estado de la ot
//      IF IsNull(pd_dw.GetItemNumber(1,"est_ot")) THEN
//              messageBox("Error Intentando Grabar un registro en estado OT","error")
//              pd_dw.SetItem(1,"f_hasta",fgnu_fecha_actual())
//              pd_dw.SetItem(1,"h_hasta",fgnu_fecha_actual())
//      END IF


        IF ISNULL(pd_dw.GetItemString(1,"descripcion")) THEN
                pd_dw.SetItem(1,"descripcion"," ")
        END IF
        if pb_alta then
                pd_dw.SetItem(1,"nro_instalacion",pd_instalacion)
        end if
        pd_dw.SetItem(1,"nro_incidencia",pl_nro_incidencia)
        pd_dw.SetItem(1,"f_alta",this.fnu_dia_alta_ot())
        pd_dw.SetItem(1,"h_alta",this.fnu_dia_alta_ot())
         
        pd_dw.SetItem(1,"ult_brigada",pl_brigada_resp) 
        pd_dw.SetItem(1,"nro_centro",pi_centro)
        pd_dw.SetItem(1,"nro_cmd",pi_cmd)
        pd_dw.SetItem(1,"nro_mesa",pi_mesa)

        IF pd_instalacion<>0 THEN
                //Obtencion del nro del pimer aviso sobre la instalacion
                // por ser incidencia a nivel de instalacion

                iu_avi_1002_nu = CREATE u_avi_1002_nu_generico
                ll_nro_aviso=iu_avi_1002_nu.fnu_primer_aviso(pd_instalacion)
                pd_dw.SetItem(1,"nro_aviso",ll_nro_aviso)       
                DESTROY iu_avi_1002_nu
        ELSE
                if pb_alta then
                        pd_dw.SetItem(1,"nro_aviso",pl_aviso)   
                end if
        END IF
        

Return 1
end function

public function integer fnu_mostrar_datos (ref datawindow pw_dw, long pl_nro_ot);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_mostrar_datos
// 
// Objetivo: Realiza la conecci$$HEX1$$f300$$ENDHEX$$n con la base de datos y el retrieve 
//                               para mostrar los datos relacionados con los par$$HEX1$$e100$$ENDHEX$$metros 
//                               pasados
//
// Ambito:      P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: d_inc_2001_pr_form_orden de trabajo y nro de instalacion 
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      30/1/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_filas
pw_dw.SetTransObject(SQLCA)

ll_filas=pw_dw.Retrieve(pl_nro_ot)

IF ll_filas=0 THEN
        iu_ot_2001_rn=CREATE u_ot_2001_rn_form_orden_de_trabajo

        pw_dw.InsertRow(0)
        iu_ot_2001_rn.frn_datos_por_defecto(pw_dw,pl_nro_ot)    
   
        
        DESTROY iu_ot_2001_rn
END IF

Return 1


//
//IF (pi_nro_ot=0) or isnull(pi_nro_ot) THEN
//      iu_ot_2001_rn.frn_datos_por_defecto(pw_dw,this.fnu_ultimo_ot())
//ELSE
//      pw_dw.Retrieve(pi_nro_ot)
//END IF
//


end function


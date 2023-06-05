HA$PBExportHeader$u_bri_2002_nu_lista_brigadas_ot.sru
forward
global type u_bri_2002_nu_lista_brigadas_ot from nonvisualobject
end type
end forward

global type u_bri_2002_nu_lista_brigadas_ot from nonvisualobject
end type
global u_bri_2002_nu_lista_brigadas_ot u_bri_2002_nu_lista_brigadas_ot

type variables

u_bri_2002_nu_lista_brigadas_ot iu_bri_2002_nu 
// MERC long click_row_brig_ot
long click_row
end variables

forward prototypes
public function integer fnu_obtener_brigadas_ot (ref datawindow pd_dw, long pl_nro_ot)
public function integer fnu_grabar_brigadas_ot (ref datawindow pd_dw)
public function boolean fnu_existen_brigadas_con_tareas (ref datawindow pd_dw)
public function integer fnu_asignar_responsable (ref datawindow pd_dw, long pl_click_row)
public function integer fnu_actualizar_datawindow (ref datawindow pd_dw, boolean pi_ot_anulada)
public function su_drag_brigada_ot fnu_devolver_brigada_ot (ref datawindow pd_dw, long click_row_brig_ot)
public function long fnu_devolver_brigada_resp (ref datawindow pd_dw)
public function long fnu_brigada_ya_asignada (long pl_nro_brigada, long pl_nro_ot_madificada)
public function integer fnu_agregar_brigada (ref datawindow pd_dw, su_drag_brigada_ot ps_estructura, string ps_tipo_equipo)
end prototypes

public function integer fnu_obtener_brigadas_ot (ref datawindow pd_dw, long pl_nro_ot);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_obtener_lista_brigadas_ot
// 
// Objetivo: Realiza el retrieve de los datos de la datawindow
//                               para mostrar las brigadas relacionadas con la ot
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//      Entrada: data window
//                              nro_de ot
//      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
long ll_brigadas
pd_dw.SetTransObject(SQLCA)
ll_brigadas=pd_dw.Retrieve(pl_nro_ot)

Return 1
end function

public function integer fnu_grabar_brigadas_ot (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_grabar_brigadas_ot
// 
// Objetivo: Realiza un update de la datawindow
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: data window                            
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    		-------   ----------------------------------------
//      29/2/96         SAB      Versi$$HEX1$$f300$$ENDHEX$$n Original
//		17/01/2001			LFE		Adaptaci$$HEX1$$f300$$ENDHEX$$n de brigadas y contratas en la misma OT	
////////////////////////////////////////////////////////////////////////////////////////////////

int li_contador
int li_id_responsable, li_est_brigada 
long ll_nro_ot, ll_nro_brigada
string ls_programa, ls_usuario, ls_tipo
Datetime  ldt_h_desde, ldt_h_hasta, ldt_f_desde, ldt_f_hasta, ldt_h_actual, ldt_f_actual

IF pd_dw.RowCount() = 0 THEN
	Return 1 
END IF

ll_nro_ot = pd_dw.GetItemNumber(1, 'nro_ot')


DELETE GI_BRIGADA_OT
WHERE NRO_OT = :ll_nro_ot;

DELETE GI_CONTRATA_OT
WHERE NRO_OT = :ll_nro_ot ;

// Como se pueden tener brigadas y contratas asignada en la OT, no se puede hacer un update
// de la datawindow, ya que no es capaz de actualizar dos tablas. En su lugar se insertan 
// los datos de las brigadas/contratas en gi_brigada_ot y gi_contrata_ot respectivamente
// teniendo en cuenta el tipo de equipo asignado
FOR li_contador=1 TO pd_dw.RowCount()
	// Se obtiene el tipo
	ls_tipo = pd_dw.GetItemString(li_contador, 'tipo')
	// Se obtiene el resto de los datos de la brigada/contrata
	ldt_h_desde = pd_dw.GetItemDateTime(li_contador, 'h_desde')
	ldt_f_desde = pd_dw.GetItemDateTime(li_contador, 'f_desde')
	ldt_f_hasta = pd_dw.GetItemDateTime(li_contador, 'f_hasta')
	ldt_h_hasta = pd_dw.GetItemDateTime(li_contador, 'h_hasta')
	li_id_responsable = pd_dw.GetItemNumber(li_contador, 'ind_responsable')
	ll_nro_ot = pd_dw.GetItemNumber(li_contador, 'nro_ot')
	ls_programa = pd_dw.GetItemString(li_contador, 'programa')
	ldt_h_actual = pd_dw.GetItemDateTime(li_contador, 'h_actual')
	ldt_f_actual = pd_dw.GetItemDateTime(li_contador, 'f_actual')
	ls_usuario = pd_dw.GetItemString(li_contador, 'usuario')
	ll_nro_brigada = pd_dw.GetItemNumber(li_contador, 'nro_brigada')
	li_est_brigada = pd_dw.GetItemNumber(li_contador, 'est_brigada')
	
	IF ls_tipo = 'Brig.' THEN
		
		// El equipo se trata de una brigada. Se borran sus datos de GI_BRIGADA_OT y se 
		// vuelven a insertar para su actualizaci$$HEX1$$f300$$ENDHEX$$n. No se realiza un UPDATE debido a que no
		// se sabe si la brigada es una brigada nueva en la OT, con lo que el UPDATE fallar$$HEX1$$ed00$$ENDHEX$$a
					
		// Se inserta la brigada en la ot
	  	INSERT INTO "GI_BRIGADA_OT"  
         ( "USUARIO",   
           "F_ACTUAL",   
           "H_ACTUAL",   
           "PROGRAMA",   
           "NRO_OT",   
           "NRO_BRIGADA",   
           "F_DESDE",   
           "H_DESDE",   
           "F_HASTA",   
           "H_HASTA",   
           "ID_REPONSABLE",   
           "EST_BRIGADA" )  
		VALUES ( :ls_usuario,   
				  :ldt_f_actual,   
				  :ldt_h_actual,   
				  :ls_programa,   
				  :ll_nro_ot,   
				  :ll_nro_brigada,   
				  :ldt_f_desde,   
				  :ldt_h_desde,   
				  :ldt_f_hasta,   
				  :ldt_h_hasta,   
				  :li_id_responsable,   
				  :li_est_brigada )  ;
				  
		IF SQLCA.SQLCode <> 0 THEN
			Return -1
		END IF
				  
		ELSE
			// El equipo se trata de una contrata. Se borran sus datos de GI_CONTRATA_OT y se 
			// vuelven a insertar para su actualizaci$$HEX1$$f300$$ENDHEX$$n. No se realiza un UPDATE debido a que no
			// se sabe si la contrata es una contrata nueva en la OT, con lo que el UPDATE fallar$$HEX1$$ed00$$ENDHEX$$a
					
			 INSERT INTO "GI_CONTRATA_OT"  
						( "USUARIO",   
						  "F_ACTUAL",   
						  "PROGRAMA",   
						  "NRO_OT",   
						  "NRO_CONTRATA",   
						  "F_DESDE",   
						  "F_HASTA",   
						  "EST_BRIGADA" )  
			 VALUES (  :ls_usuario,   
				  		  :ldt_f_actual,   
						  :ls_programa,   
						  :ll_nro_ot,   
						  :ll_nro_brigada,   
						  :ldt_f_desde,   
						  :ldt_f_hasta,   
						  :li_est_brigada )  ;

		IF SQLCA.SQLCode <> 0 THEN
			Return -1
		END IF
		
	END IF

NEXT


return 1

end function

public function boolean fnu_existen_brigadas_con_tareas (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_existen_brigadas_con_tareas
// 
// Objetivo: Retorna True si existe alguna abrigada con fecha de fin de tareas en null
//                               o False en caso contrario.
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: data window
//              Salida:   True o False
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      4/3/96          SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_fila

ll_fila=0

ll_fila=pd_dw.find("ISNULL(f_hasta)",0,pd_dw.RowCount())
IF ll_fila=0 THEN
        Return False
ELSE
        Return True
END IF
return true
end function

public function integer fnu_asignar_responsable (ref datawindow pd_dw, long pl_click_row);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_asignar_responsable
// 
// Objetivo: Marca en la datawindow la brigada seleccionada para ser responsable
//                               de las tareas y desmarca la antigua responsable
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: data window
//                                      fila en la que se dio el click
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_fila


ll_fila=pd_dw.Find("ind_responsable=1",0,pd_dw.RowCount())
IF (ll_fila=0)  THEN
        pd_dw.SetItem(pl_Click_row,"Ind_responsable",1)
ELSE
        IF ISNULL(pd_dw.GetItemDateTime(pl_click_row,"f_hasta")) THEN
                pd_dw.SetItem(ll_fila,"Ind_responsable",0)
                pd_dw.SetItem(pl_Click_row,"Ind_responsable",1)
        ELSE
                IF this.fnu_existen_brigadas_con_tareas(pd_dw) THEN
                        gnv_msg.f_mensaje("AI05","brigada","",OK!)
                ELSE
                        pd_dw.SetItem(ll_fila,"Ind_responsable",0)
                        pd_dw.SetItem(pl_Click_row,"Ind_responsable",1)
                END IF
        END IF
END IF

Return 1
end function

public function integer fnu_actualizar_datawindow (ref datawindow pd_dw, boolean pi_ot_anulada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_actualizar_datawindow
// 
// Objetivo: Carga la datawindow con los valores de la fecha hasta con la del 
//                               sistema y con el nro de ot, dependidndo de que este anulada la ot o no
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: data window
//                                      nro_de ot
//                                      estado de anulada
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long i
IF pi_ot_anulada THEN
        FOR i=1 TO pd_dw.RowCount()
                IF ISNULL(pd_dw.GetItemDateTime(i,"f_hasta")) THEN
                        pd_dw.setItem(i,"f_hasta",fgnu_fecha_actual())  
                        pd_dw.setItem(i,"h_hasta",fgnu_fecha_actual())  

                END IF
        NEXT
END IF

Return 1
end function

public function su_drag_brigada_ot fnu_devolver_brigada_ot (ref datawindow pd_dw, long click_row_brig_ot);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_brigada_ot
// 
// Objetivo: Carga a la estructura con los datos de la fila
//                               seleccionada en la datawindows
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//                      Entrada: pd_dw, click_row_brig_ot
//                      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

su_drag_brigada_ot ls_estructura
long xx

IF click_row_brig_ot    >0 THEN
        ls_estructura.click_row=click_row_brig_ot

//dsa ini	
//        ls_estructura.brigada=pd_dw.GetItemString(click_row_brig_ot,"brigada")
////      ls_estructura.nro_ot=pd_dw.GetItemNumber(click_row_brig_ot,"nro_ot")
//        ls_estructura.nro_brigada=pd_dw.GetItemNumber(click_row_brig_ot,"nro_brigada")
//        ls_estructura.movil=pd_dw.GetItemString(click_row_brig_ot,"movil")
//        ls_estructura.frec_radio=pd_dw.GetItemString(click_row_brig_ot,"frec_radio")
//
   ls_estructura.nro_brigada=pd_dw.GetItemNumber(click_row_brig_ot,"nro_brigada")
   ls_estructura.brigada=pd_dw.GetItemString(click_row_brig_ot,"brigada")
	if pd_dw.dataobject='d_bri_2002_pr_list_brigadas_ot'  then	
        ls_estructura.movil=pd_dw.GetItemString(click_row_brig_ot,"movil")
        ls_estructura.frec_radio=pd_dw.GetItemString(click_row_brig_ot,"frec_radio")
		  ls_estructura.tip_brigada=pd_dw.GetItemNumber(click_row_brig_ot,"tip_brigada")
	else
		  ls_estructura.estado = pd_dw.GetItemNumber(click_row_brig_ot,"gi_contratas_estado")// DSA 03/04/2000	
        ls_estructura.movil=pd_dw.GetItemString(click_row_brig_ot,"telefono")
        ls_estructura.pers_contacta=pd_dw.GetItemString(click_row_brig_ot,"pers_contacto")
        ls_estructura.cantidad_ot=pd_dw.GetItemNumber(click_row_brig_ot,"cantidad_ot")
        ls_estructura.cantidad_tp=pd_dw.GetItemNumber(click_row_brig_ot,"cantidad_tp")		  
   end if 
//dsa fin
ELSE
        ls_estructura.click_row=0
END IF
Return ls_estructura
end function

public function long fnu_devolver_brigada_resp (ref datawindow pd_dw);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_devolver_brigada_resp
// 
// Objetivo: Retorna el nro de la brigada responsable
//                              
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//                      Entrada: data window
//                      Salida:   nro de la brigada responsable o -1 en caso de que tendria
//                                               que tener brigada responsable y no la tubiera
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////
string ls_brigada
long  ll_brigada_resp
long ll_fila

IF pd_dw.RowCount()>0 THEN
        ll_fila = pd_dw.Find("ind_responsable=1",0,pd_dw.RowCount())
        IF ll_fila>0 THEN
                ll_brigada_resp= pd_dw.GetItemNumber(ll_fila,"nro_brigada")
                return ll_brigada_resp
        ELSE
                Return -1
        END IF
ELSE
        return 0
END IF



end function

public function long fnu_brigada_ya_asignada (long pl_nro_brigada, long pl_nro_ot_madificada);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_brigada_ya_asignada
// 
// Objetivo: Returna que la brigada ya fue asignada a otra ot
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//                      Entrada: nro_brigada, pl_nro_ot_madificada
//                      Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_nro_ot

ll_nro_ot=0
SELECT  nro_ot INTO :ll_nro_ot FROM gi_brigada_ot WHERE nro_brigada=:pl_nro_brigada AND nro_ot<>:pl_nro_ot_madificada AND f_hasta is null AND RowNum=1 ;

Return ll_nro_ot


end function

public function integer fnu_agregar_brigada (ref datawindow pd_dw, su_drag_brigada_ot ps_estructura, string ps_tipo_equipo);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_agregar_brigada
// 
// Objetivo: Inserta los datos en la datawindow pasados en la estructura
//      Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//              Entrada: data window
//                                      estructura
//              Salida:   --
//                                              
// Devuelve:    
//
//  Fecha         Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------    -------         ----------------------------------------
//      29/2/96         SAB                     Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

long ll_row
long ll_encontre
string ls_equipo

IF ps_tipo_equipo = 'BR' THEN
	ls_equipo = 'Brig.'
ELSE
	ls_equipo = 'Cont.'
END IF	

ll_encontre=pd_dw.Find(String("ISNULL(f_hasta) AND tipo = 'Brig.'"),0,pd_dw.Rowcount())
ll_row=pd_dw.InsertRow(0)

if pd_dw.dataobject='d_bri_2002_pr_list_brigadas_ot' AND ls_equipo = 'Brig.' then//dsa 
	IF pd_dw.RowCount()=1  THEN
        this.fnu_asignar_responsable(pd_dw,ll_row)
	ELSE
        IF ll_encontre>0 THEN
                pd_dw.SetItem(ll_row,"ind_responsable",0)
        ELSE
                this.fnu_asignar_responsable(pd_dw,ll_row)
        END IF
	END IF
END IF

//dsa ini
pd_dw.SetItem(ll_row,"usuario",ps_estructura.usuario)
pd_dw.SetItem(ll_row,"f_actual",ps_estructura.f_actual)
pd_dw.SetItem(ll_row,"programa",ps_estructura.programa)
pd_dw.SetItem(ll_row,"nro_ot",ps_estructura.nro_ot)
pd_dw.SetItem(ll_row,"f_desde",ps_estructura.f_desde)
pd_dw.SetItem(ll_row,"f_hasta",ps_estructura.f_hasta)
pd_dw.SetItem(ll_row,"brigada",ps_estructura.brigada)
pd_dw.SetItem(ll_row,"nro_brigada",ps_estructura.nro_brigada)
		
if pd_dw.dataobject='d_bri_2002_pr_list_brigadas_ot'  then	//dsa
		pd_dw.SetItem(ll_row,"ind_disponible",0)               
		pd_dw.SetItem(ll_row,"frec_radio",ps_estructura.frec_radio)
		pd_dw.SetItem(ll_row,"movil",ps_estructura.movil)		
		pd_dw.SetItem(ll_row,"tipo", ls_equipo)
		pd_dw.SetItem(ll_row,"tip_brigada", ps_estructura.tip_brigada)
else				
		pd_dw.SetItem(ll_row,"gi_contratas_estado",ps_estructura.estado)// DSA 03/04/2000	
		pd_dw.SetItem(ll_row,"pers_contacto",ps_estructura.pers_contacta)	
		pd_dw.SetItem(ll_row,"telefono",ps_estructura.movil)
		pd_dw.SetItem(ll_row,"cantidad_ot",ps_estructura.cantidad_ot)
		pd_dw.SetItem(ll_row,"cantidad_tp",ps_estructura.cantidad_tp)
end if			
Return 1
////Datos de la  brigada
//pd_dw.SetItem(ll_row,"brigada",ps_estructura.brigada)
//pd_dw.SetItem(ll_row,"movil",ps_estructura.movil)
//pd_dw.SetItem(ll_row,"nro_ot",ps_estructura.nro_ot)
//pd_dw.SetItem(ll_row,"nro_brigada",ps_estructura.nro_brigada)
//pd_dw.SetItem(ll_row,"ind_disponible",0)               //No Disponible
//
////Datos Brigadas_OT
////pd_dw.SetItem(ll_row,"f_desde",fgnu_fecha_actual())
////pd_dw.SetItem(ll_row,"h_desde",fgnu_fecha_actual())
//pd_dw.SetItem(ll_row,"gi_brigada_ot_f_ini_prev",fgnu_fecha_actual())
//pd_dw.SetItem(ll_row,"usuario",ps_estructura.usuario)
//pd_dw.SetItem(ll_row,"f_actual",ps_estructura.f_actual)
//pd_dw.SetItem(ll_row,"h_actual",ps_estructura.h_actual)
//pd_dw.SetItem(ll_row,"programa",ps_estructura.programa)
//pd_dw.SetItem(ll_row,"nro_ot",ps_estructura.nro_ot)
//pd_dw.SetItem(ll_row,"f_hasta",ps_estructura.f_hasta)
//pd_dw.SetItem(ll_row,"h_hasta",ps_estructura.h_hasta)
//pd_dw.SetItem(ll_row,"frec_radio",ps_estructura.frec_radio)
//
//dsa fin

end function

on u_bri_2002_nu_lista_brigadas_ot.create
TriggerEvent( this, "constructor" )
end on

on u_bri_2002_nu_lista_brigadas_ot.destroy
TriggerEvent( this, "destructor" )
end on


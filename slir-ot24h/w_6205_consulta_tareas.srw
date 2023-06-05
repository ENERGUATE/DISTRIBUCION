HA$PBExportHeader$w_6205_consulta_tareas.srw
$PBExportComments$Ya modificado
forward
global type w_6205_consulta_tareas from w_sgigenerica
end type
type d_filtro_tareas from datawindow within w_6205_consulta_tareas
end type
type cb_buscar from commandbutton within w_6205_consulta_tareas
end type
type dw_datos_brigada from datawindow within w_6205_consulta_tareas
end type
type dw_lista_tareas from u_bri_2017_pr_datos_orden_tarea within w_6205_consulta_tareas
end type
type gb_3 from groupbox within w_6205_consulta_tareas
end type
type gb_2 from groupbox within w_6205_consulta_tareas
end type
type gb_1 from groupbox within w_6205_consulta_tareas
end type
type dw_brigadas_inicial from datawindow within w_6205_consulta_tareas
end type
type dw_brig_gen from datawindow within w_6205_consulta_tareas
end type
end forward

global type w_6205_consulta_tareas from w_sgigenerica
boolean visible = false
integer x = 96
integer y = 540
integer width = 3456
integer height = 1360
string title = "OPEN SGI - Consulta de Tareas y OT"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 79741120
string icon = "brigadas.ico"
event ue_retrieve pbm_custom21
event ue_armar_sql pbm_custom74
event ue_resetear_datos pbm_custom72
event ue_buscar pbm_custom71
event ue_consultar pbm_custom73
event ue_incidencias pbm_custom65
event ue_nueva_tarea pbm_custom22
event ue_post_open ( )
d_filtro_tareas d_filtro_tareas
cb_buscar cb_buscar
dw_datos_brigada dw_datos_brigada
dw_lista_tareas dw_lista_tareas
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_brigadas_inicial dw_brigadas_inicial
dw_brig_gen dw_brig_gen
end type
global w_6205_consulta_tareas w_6205_consulta_tareas

type variables
u_generico_comunicaciones lu_comunic

u_bri_2016_nu_prop_tareas_ot  iu_bri_2016_nu
u_bri_2016_pr_prop_tareas_ot  iu_bri_2016_pr
u_bri_2017_pr_datos_orden_tarea  iu_bri_2017_pr
u_bri_2018_nu_datos_brigada  iu_bri_2018_nu

int ii_fila_seleccionada
String is_select_original
String is_where
string is_order_by
// Ambito del usuario
int il_centro_usu, il_cmd_usu, il_mesa_usu

mbtder_brigadas menu_tareas 
int il_estado 
int il_prioridad
int il_tareas
int  il_nro_prioridad
long il_nro_fila_final
string is_nom_instalacion
long il_nro_instalacion
long il_nro_incidencia, il_nro_aviso
long  il_nro_ot
int li_accion_pregunta
long il_nro_brigada
string is_nom_brigada
string is_tip_contrata = 'BR'   // DSA 18/02/2000			
long il_nro_tarea

datawindowchild ddw_estado_ot

dwItemStatus idwi_status
boolean ib_grabo
boolean ib_alta
//datawindowchild ddw_tareas
//datawindowchild ddw_estado
datetime idt_f_actual
string sqlselect, is_tip_brigada = 'BR'                      // DSA 18/02/2000			

end variables

forward prototypes
public function integer fw_buscar ()
end prototypes

event ue_retrieve;call super::ue_retrieve;///////////////////////////////////////////////////////
//										
// Funcion/Evento: ue_retrieve
// 
// Objetivo: Recupera los datos segun la SQL introducida en el Datawindow
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/06/98    FDO
//
///////////////////////////////////////////////////////


int li_contador,li_contador2
dw_lista_tareas.retrieve(il_nro_brigada)//brigada

////implementar funcion de relleno

li_contador2 = 1
if dw_lista_tareas.rowcount() > 0 then
	for li_contador=1 to dw_lista_tareas.rowcount()
		dw_brigadas_inicial.insertrow(0)
		dw_brigadas_inicial.object.nro_brigada[li_contador2] = dw_lista_tareas.object.gi_ot_nro_ot[li_contador]
		dw_brigadas_inicial.object.f_desde[li_contador2] = dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_contador]
		dw_brigadas_inicial.object.f_hasta[li_contador2] = dw_lista_tareas.object.GI_BRIGADA_OT_f_hasta[li_contador]
		li_contador2 ++
	next
end if
	

end event

event ue_armar_sql;///////////////////////////////////////////////////////
//										
// Funcion/Evento: ue_armar_sql
// 
// Objetivo: Arma la sentencia SQL para el retrieve de la datawindow.
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/06/98    FDO
//
///////////////////////////////////////////////////////


string retorno
string is_from,is_clausula_where, is_modificacion,is_signo 



il_estado =  d_filtro_tareas.GetItemNumber(1,"pi_estado")
il_tareas =d_filtro_tareas.GetItemNumber(1,"pi_tareas")


IF il_tareas <> 0 THEN 
		is_clausula_where= " AND GI_OT.IND_TRABAJO=" + STRING(il_tareas)
END IF

IF il_estado <> 0 THEN 
		is_clausula_where = is_clausula_where + " AND EST_BRIGADA = " + string(il_ESTADO)
ELSE		
		is_clausula_where = is_clausula_where + " AND EST_BRIGADA <= 2 "
END IF

string ls_select

ls_select = fg_remplaza (sqlselect + is_clausula_where, "~"", "~~~"")

is_modificacion="Datawindow.table.select=~" "+ls_select + " ~" "
retorno=dw_lista_tareas.modify(is_modificacion)

RETORNO = RETORNO

   
	
end event

event ue_resetear_datos;call super::ue_resetear_datos;dw_lista_tareas.reset()

end event

event ue_buscar;call super::ue_buscar;//idwi_status = dw_lista_tareas.GetItemStatus(dw_lista_tareas.getrow(), 0, Primary!)
//if idwi_status = datamodified! then
//	dw_lista_tareas.Update()
//	ib_grabo=true
//else
//	This.triggerevent("ue_armar_sql")
//	This.triggerevent("ue_retrieve")
//	IF dw_lista_tareas.RowCount() <=0 THEN	
//		gnv_msg.f_mensaje( "AB02","","",OK!)
//		yield()
//	END IF
//end if
//
end event

event ue_consultar;call super::ue_consultar;int  li_est_ot
long ll_n_nro_ot

if ii_fila_seleccionada > 0 then
	
	gu_comunic.is_comunic.accion_llamada = "Consulta"
		
	ll_n_nro_ot =dw_lista_tareas.GetItemNumber(ii_fila_seleccionada, "nro_ot")
	gu_comunic.is_comunic.longval2 = ll_n_nro_ot

	select NRO_OT INTO :ll_n_nro_ot FROM GI_BRIGADA_OT WHERE NRO_OT=:ll_n_nro_ot for UPDATE NOWAIT;
	IF SQLCA.SQLCODE<>0 THEN
			gnv_msg.f_mensaje( "EG19","","",OK!)
			RETURN
	END IF
	
	Select est_ot
	into :li_est_ot
	from gi_ot
	where nro_ot = :ll_n_nro_ot;
	
	if li_est_ot <> 1 then
		gnv_msg.f_mensaje( "AM29","","",OK!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No es posible cambiarle la Prioridad a una OT en ese estado")
	end if	
//	gu_comunic.fnu_abrir(w_6206_ingreso_tareas,"w_6206_ingreso_tareas",&
//			1,1,w_6205_consulta_tareas,"w_6205_consulta_tareas")

SetPointer(HourGlass!)
Open (w_6206_ingreso_tareas)
//
//	// Restauro gu_comunic y lu_comunic con el nro de la ot

end if




end event

event ue_incidencias;long ll_nro_incidencia, ll_nro_ot, ll_nro_tarea = 0

if ii_fila_seleccionada > 0 then
	
	gu_comunic.is_comunic.accion_llamada = "Consulta"
		
	ll_nro_ot =dw_lista_tareas.GetItemNumber(ii_fila_seleccionada, "nro_ot")
	gu_comunic.is_comunic.longval2 = ll_nro_ot
	//SELECT NRO_TAREA INTO :ll_nro_tarea FROM GI_BRIGADA_OT WHERE GI_BRIGADA_OT.NRO_OT = :ll_nro_ot  for UPDATE NOWAIT;
	
	IF ll_nro_tarea = 0 THEN 
		select NRO_INCIDENCIA INTO :ll_nro_incidencia FROM SGD_INCIDENCIA WHERE SGD_INCIDENCIA.OT=:ll_nro_ot for UPDATE NOWAIT;
		gu_comunic.is_comunic.programa_llamante="w_6205_consulta_tareas" 
		gu_comunic.is_comunic.longval3 =  ll_nro_incidencia
				IF gs_programa_principal = "w_operaciones" THEN
//					gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",1,1,w_6205_consulta_tareas,"w_6205_consulta_tareas")
					SetPointer(HourGlass!)
					gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
					//Open(w_2301_form_incidencia)
				ELSE
//					gu_comunic.fnu_abrir(w_2301_form_incidencia,"w_2301_form_incidencia",0,1,w_6205_consulta_tareas,"w_6205_consulta_tareas")
					SetPointer(HourGlass!)
					gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
//					Open(w_2301_form_incidencia)
				END IF
				
 	   ELSE
		gnv_msg.f_mensaje( "AM28","","",OK!)
		//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","S$$HEX1$$f300$$ENDHEX$$lo se podr$$HEX1$$e100$$ENDHEX$$n consultar las incidencias en las OT's")
	END IF
end if




end event

event ue_nueva_tarea;call super::ue_nueva_tarea;This.TriggerEvent("ue_arch_agregar")

end event

public function integer fw_buscar ();///////////////////////////////////////////////////////
//										
// Funcion/Evento: fw_buscar
// 
// Objetivo: Esta funci$$HEX1$$f300$$ENDHEX$$n es la base del funcionamiento de la ventana, 
//				 su cometido es doble, si se ha pulsado el boton buscar 
//				 llama al evento retrieve, pero si por el contrario se ha
//				 pulsado en el bot$$HEX1$$f300$$ENDHEX$$n salvar, se encarga de validar y salvar
//				 los cambios
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/06/98 		FDO
//	18/02/2000		DSA			Introducci$$HEX1$$f300$$ENDHEX$$n de las Contaratas. 
//										Los modificaciones de GI_BRIGADA_OT 
//										necesitan F_INI_PREV campo
/////////////////////////////////////////////////////////////////////////

//datetime ldt_fecha_ini
//datetime ldt_fecha_fin
datetime ldt_fecha_ini_real
datetime ldt_fecha_fin_real
datetime ldt_f_desde,ldt_f_hasta
boolean lb_valido=false
boolean lb_insert,lb_actualizado
datetime ldt_f_nula
int li_conta,li_fila_ant
int li_descripcion
string ls_descripcion
int retorno=0
long ll_nro_ot
datetime ldt_fecha1,ldt_fecha2

setnull(ldt_f_nula)

if cb_buscar.text="&Aceptar" then
	
	// Creo un bucle que recorrer$$HEX2$$e1002000$$ENDHEX$$el datawindow en busca de nuevas 
	//actualizaciones y altas 
	for li_conta= 1 to dw_lista_tareas.rowcount()
		
		lb_actualizado=false
		dw_lista_tareas.accepttext()

	// compruebo que el registro se haya actualizado o dado de alta

		ll_nro_ot = dw_lista_tareas.object.gi_ot_nro_ot[li_conta]
	
		li_fila_ant = dw_brigadas_inicial.Find("nro_brigada= "+string(ll_nro_ot),1,dw_brigadas_inicial.RowCount())
		
		if li_fila_ant > 0 then // si no se dio de alta
			if not isnull(dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_conta]) then

				ldt_fecha1 = dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_conta]
				ldt_fecha2 = dw_brigadas_inicial.object.f_desde[li_fila_ant]

				if isnull(ldt_fecha2) and not isnull(ldt_fecha1) then
					lb_actualizado= true 
				else
					if not isnull(dw_lista_tareas.object.GI_BRIGADA_OT_f_hasta[li_conta]) then
						lb_actualizado= true 
					end if
				end if
			end if
		else // si se dio de alta
			lb_actualizado= true
		end if
		
		if dw_lista_tareas.object.gi_ot_ind_trabajo[li_conta] = 2 and lb_actualizado= true then
			
			dw_lista_tareas.object.GI_OT_f_desde[li_conta]=dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_conta]
			dw_lista_tareas.object.GI_OT_f_hasta[li_conta]=dw_lista_tareas.object.GI_BRIGADA_OT_f_hasta[li_conta]
			dw_lista_tareas.object.GI_OT_h_desde[li_conta]=dw_lista_tareas.object.GI_BRIGADA_OT_h_desde[li_conta]
			dw_lista_tareas.object.GI_OT_h_hasta[li_conta]=dw_lista_tareas.object.GI_BRIGADA_OT_h_hasta[li_conta]
			
			dw_lista_tareas.object.descripcion_tarea[li_conta]
			il_nro_ot= dw_lista_tareas.object.gi_ot_nro_ot[li_conta]

			// Si se produjo el alta de una tarea //	
		
			if dw_lista_tareas.object.estado_ot[li_conta] = fgci_ot_pendiente then
			
				li_descripcion =dw_lista_tareas.object.descripcion_tarea[li_conta]
				
					  SELECT nvl("SGD_VALOR"."DESCRIPCION",'')  
					  into :ls_descripcion
   				 FROM "SGD_VALOR"  
			   WHERE ( "SGD_VALOR"."CODIF" = 'TARE' ) AND  
         		( "SGD_VALOR"."CODIGO" = :li_descripcion)   ;

				ldt_fecha_ini_real=dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_conta]

				if (ldt_fecha_ini_real > idt_f_actual)  then
						gnv_msg.f_mensaje( "AM35","","",OK!)
						//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La fecha de inicio de tareas no puede ser mayor que la fecha actual")
				elseif isnull(ldt_fecha_ini_real) then 
							gnv_msg.f_mensaje( "AO04","","",OK!)
				elseif isnull(ls_Descripcion) or ls_Descripcion =""  then 			
					gnv_msg.f_mensaje("EM57","","",OK!)
				else
						ib_alta=false
						lb_valido=true
						lb_insert=true
						dw_lista_tareas.object.estado_ot[li_conta] = fgci_ot_trabajando
						dw_lista_tareas.SetItem(li_conta,"sgd_valor_descripcion","Trabajando")
						dw_lista_tareas.object.gi_ot_descripcion[li_conta]= ls_descripcion
										
						//brigada en estado no disponible
						if is_tip_contrata = 'BR' then																				
							UPDATE "GI_BRIGADA"  
  	   					SET "IND_DISPONIBLE" = 0 
	  	 					WHERE "GI_BRIGADA"."NRO_BRIGADA" = :lu_comunic.is_comunic.longval1;
						end if		
				end if
								
				// dar el alta
				if lb_insert=true then
					if is_tip_contrata = 'BR' then
						INSERT INTO "GI_BRIGADA_OT"  
      								( "USUARIO",   
           							  "F_ACTUAL",   
          							  "H_ACTUAL",   
           							  "PROGRAMA",   
          							  "NRO_OT",   
           							  "NRO_BRIGADA",   
          							  "F_DESDE",   
           							  "H_DESDE",   
           							  "ID_REPONSABLE",   
           							  "EST_BRIGADA")  
 						VALUES ( :gs_usuario,   
           						:idt_f_actual,   
           						:idt_f_actual,   
           						'W_6205',   
           						:il_nro_ot,
									:lu_comunic.is_comunic.longval1,
           						:ldt_fecha_ini_real,   
           						:ldt_fecha_ini_real,   
          						1,   
									:fgci_ot_trabajando)  ;
					else
						//Ingresamos el OT primero
						datastore lds_ot
						long row
						
						lds_ot = Create datastore
						lds_ot.DataObject = dw_lista_tareas.DataObject 
						lds_ot.SetTransObject(SQLCA)
						row = dw_lista_tareas.Find ('gi_ot_nro_ot = ' + string(il_nro_ot),1,&
																dw_lista_tareas.RowCount())
						dw_lista_tareas.SetItemStatus(row, 0, Primary!, DataModified!)											
						dw_lista_tareas.SetItemStatus(row, 0, Primary!, NotModified!)											
						row = dw_lista_tareas.RowsCopy(row, row, Primary!, lds_ot, 1, Primary!)								
										
						if lds_ot.Update() = -1 then
							gnu_u_transaction.uf_rollback()
							This.triggerevent("ue_armar_sql")
							This.triggerevent("ue_retrieve")
							IF dw_lista_tareas.RowCount() <=0 THEN	
								gnv_msg.f_mensaje( "AB02","","",OK!)
							end if
							
							return retorno
						end if
						destroy(lds_ot)
									
						INSERT INTO "GI_CONTRATA_OT"  
      							 ( "USUARIO",   
           							"F_ACTUAL",   
           							"PROGRAMA",   
          							"NRO_OT",   
           							"NRO_CONTRATA",   
          							"F_DESDE",   
           							"EST_BRIGADA")  
 						VALUES ( :gs_usuario,   
           						:idt_f_actual,    
           						'W_6205',   
           						:il_nro_ot,
									:lu_comunic.is_comunic.longval1,
           						:ldt_fecha_ini_real,   
									:fgci_ot_trabajando)  ;
					end if	
					lb_insert=false
				end if
				
			else
				//si modifiqu$$HEX2$$e9002000$$ENDHEX$$e inici$$HEX2$$e9002000$$ENDHEX$$tareas
				ldt_f_desde=dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_conta]
				ldt_f_hasta=dw_lista_tareas.object.GI_BRIGADA_OT_F_HASTA[li_conta]
					if dw_lista_tareas.object.estado_ot[li_conta] = fgci_ot_trabajando and &
						not isnull(ldt_f_hasta) then

					// si modifique y finaliz$$HEX2$$e9002000$$ENDHEX$$tareas
						if ldt_f_hasta > fgnu_fecha_actual() then
							gnv_msg.f_mensaje( "AM38","","",OK!)
							//messagebox("Aviso","La Fecha de fin de Tarea no debe ser mayor que la fecha actual")
							dw_lista_tareas.object.GI_BRIGADA_OT_f_desde[li_conta]=ldt_f_nula
							cb_buscar.text="&Buscar"
						else
							dw_lista_tareas.object.estado_ot[li_conta] = fgci_ot_resuelta
							lb_valido=true
							dw_lista_tareas.SetItem(li_conta,"sgd_valor_descripcion","Finalizada")
							
					// actualizo los datos de gi_brigada_ot
					  		if is_tip_contrata = 'BR' then	// DSA 18/02/2000																		
							  UPDATE "GI_BRIGADA_OT"  
   						  SET "F_HASTA" = :ldt_f_hasta,   
  							      "H_HASTA" = :ldt_f_hasta,
									"EST_BRIGADA" = :fgci_ot_resuelta  
  							  WHERE ( "GI_BRIGADA_OT"."NRO_OT" = :il_nro_ot) AND  
       							  ( "GI_BRIGADA_OT"."NRO_BRIGADA" = :lu_comunic.is_comunic.longval1);//   AND
									  //( "F_INI_PREV" = :ldt_fecha_ini)	;// DSA 18/02/2000					
									  
							  UPDATE "GI_BRIGADA"  
  	   					  SET "IND_DISPONIBLE" = 1
	  	 					  WHERE "GI_BRIGADA"."NRO_BRIGADA" = :lu_comunic.is_comunic.longval1;
							else	  
							  UPDATE "GI_CONTRATA_OT"  
   						  SET "F_HASTA" = :ldt_f_hasta,   
									"EST_BRIGADA" = :fgci_ot_resuelta  
  							  WHERE ( "NRO_OT" = :il_nro_ot) AND  
       							  ( "NRO_CONTRATA" = :lu_comunic.is_comunic.longval1);//   AND
									  //( "F_INI_PREV" = :ldt_fecha_ini)	;
							end if
						end if
					
				end if
			end if
		end if
	next
	
	if lb_valido=true then
		if dw_lista_tareas.Update()= -1 then
			gnu_u_transaction.uf_rollback()//DBE 17/12/1999
			This.triggerevent("ue_armar_sql")
		   This.triggerevent("ue_retrieve")
			IF dw_lista_tareas.RowCount() <=0 THEN	
						gnv_msg.f_mensaje( "AB02","","",OK!)
			end if
			return retorno
		else

//			commit; //DBE 17/12/1999
			gnu_u_transaction.uf_commit()//DBE 17/12/1999
			gnv_msg.f_mensaje( "IA02","","",OK!)
			//messagebox("Informaci$$HEX1$$f300$$ENDHEX$$n","La tarea fue ingresada o actualizada correctamente")
			ib_alta=false
			ib_grabo=true
			cb_buscar.text="&Buscar"
			retorno =1
		end if	
	end if
else
	gnu_u_transaction.uf_rollback()//DBE 17/12/1999
	This.triggerevent("ue_armar_sql")
   This.triggerevent("ue_retrieve")
	IF dw_lista_tareas.RowCount() <=0 THEN	
		gnv_msg.f_mensaje( "AB02","","",OK!)
	END IF
END IF

return retorno
end function

on w_6205_consulta_tareas.create
int iCurrent
call super::create
this.d_filtro_tareas=create d_filtro_tareas
this.cb_buscar=create cb_buscar
this.dw_datos_brigada=create dw_datos_brigada
this.dw_lista_tareas=create dw_lista_tareas
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_brigadas_inicial=create dw_brigadas_inicial
this.dw_brig_gen=create dw_brig_gen
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_filtro_tareas
this.Control[iCurrent+2]=this.cb_buscar
this.Control[iCurrent+3]=this.dw_datos_brigada
this.Control[iCurrent+4]=this.dw_lista_tareas
this.Control[iCurrent+5]=this.gb_3
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.dw_brigadas_inicial
this.Control[iCurrent+9]=this.dw_brig_gen
end on

on w_6205_consulta_tareas.destroy
call super::destroy
destroy(this.d_filtro_tareas)
destroy(this.cb_buscar)
destroy(this.dw_datos_brigada)
destroy(this.dw_lista_tareas)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_brigadas_inicial)
destroy(this.dw_brig_gen)
end on

event ue_arch_agregar;call super::ue_arch_agregar;///////////////////////////////////////////////////////
//										
// Funcion/Evento: ue_arch_agregar
// 
// Objetivo: Introduce una nueva tarea en la datawindow
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/06/98    FDO
//
///////////////////////////////////////////////////////

long ll_nro_ot
long ll_fila_insertada
datetime ldt_fecha_nula
dateTime ldt_fecha_actual
int li_retorno
// DSA 27/03/2000			
if lu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA" then
	return
end if

SetNull(ldt_fecha_nula)
idt_f_actual = fgnu_fecha_actual()

//dw_lista_tareas.SelectRow(0,FALSE)
gu_comunic.is_comunic.accion_llamada = "alta"
	
	ll_fila_insertada = dw_lista_tareas.InsertRow(0)
	cb_buscar.TEXT="&Aceptar"
	ib_alta=true
	
	if is_tip_contrata = 'CO' then
		dw_lista_tareas.object.gi_ot_tip_brigada[ll_fila_insertada ] = 2
	else
		dw_lista_tareas.object.gi_ot_tip_brigada[ll_fila_insertada ] = 1
	end if
	
	dw_lista_tareas.ScrollToRow(ll_fila_insertada)
	  
	  
	  
	 //Obtengo la ultima ot 
	select cod_ot.nextval into :ll_nro_OT from dual; 
	  

	il_nro_OT = ll_nro_OT
	
	//OT es una Ot generica a la cual ase asignan las tareas
	dw_lista_tareas.Setitem(ll_fila_insertada,"gi_ot_nro_ot",ll_nro_OT) 
	dw_lista_tareas.Setitem(ll_fila_insertada,"nro_incidencia",0) 
	dw_lista_tareas.Setitem(ll_fila_insertada,"estado_ot",fgci_ot_pendiente)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_ult_brigada",lu_comunic.is_comunic.longval1)
	dw_lista_tareas.Setitem(ll_fila_insertada,"GI_BRIGADA_OT_f_hasta",ldt_fecha_nula)
	dw_lista_tareas.Setitem(ll_fila_insertada,"GI_BRIGADA_OT_h_hasta",ldt_fecha_nula)
	dw_lista_tareas.Setitem(ll_fila_insertada,"GI_BRIGADA_OT_f_desde",idt_f_actual)	
	dw_lista_tareas.Setitem(ll_fila_insertada,"GI_BRIGADA_OT_h_desde",idt_f_actual)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_usuario",gs_usuario)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_f_actual",idt_f_actual)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_h_actual",idt_f_actual)
	dw_lista_tareas.SetItem(ll_fila_insertada,"sgd_valor_descripcion","Pendiente")
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_programa","w_6205")
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_ind_trabajo",2)
//	dw_lista_tareas.SetItem(ll_fila_insertada,"descripcion_tarea",10)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_nro_mesa",il_mesa_usu)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_nro_centro",il_centro_usu)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_nro_cmd",il_cmd_usu)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_ult_brigada",lu_comunic.is_comunic.longval1)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_nro_instalacion",0)
	dw_lista_tareas.SetItem(ll_fila_insertada,"gi_ot_nro_aviso",0)
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	dw_lista_tareas.modify("GI_BRIGADA_OT_f_hasta.background.color=" + string(65536*192+256*192+192))
	dw_lista_tareas.modify("GI_BRIGADA_OT_f_hasta.background.color=" + gs_gris)
// End. Sgo.

   dw_lista_tareas.SetTabOrder("GI_BRIGADA_OT_f_hasta",0)

end event

event open;call super::open;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Open
// 
// Objetivo: Recibe par$$HEX1$$e100$$ENDHEX$$metros y establece la forma de apertura de 
//           la ventana
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/06/98    FDO
//	18/02/2000	DSA			Introducci$$HEX1$$f300$$ENDHEX$$n de las Contaratas. 
///////////////////////////////////////////////////////
string ls_programa_llamante, ls_filter
datawindowchild dwc_estado

int li_trabajo

// creo objetos de trabajo
lu_comunic = create u_generico_comunicaciones 

// recibo parametros de entrada
lu_comunic.is_comunic = gu_comunic.is_comunic

ls_programa_llamante = lu_comunic.is_comunic.programa_llamante

// Creo variable de trabajo de comunicaciones propia
iu_bri_2016_nu = CREATE u_bri_2016_nu_prop_tareas_ot
iu_bri_2016_pr = CREATE u_bri_2016_pr_prop_tareas_ot
iu_bri_2017_pr = CREATE u_bri_2017_pr_datos_orden_tarea
iu_bri_2018_nu = CREATE u_bri_2018_nu_datos_brigada

// Guardo $$HEX1$$e100$$ENDHEX$$mbito del usuario

il_centro_usu = lu_comunic.is_comunic.intval1
il_cmd_usu = lu_comunic.is_comunic.intval2
il_mesa_usu = lu_comunic.is_comunic.intval3
il_nro_brigada = lu_comunic.is_comunic.longval1
is_nom_brigada = lu_comunic.is_comunic.strval1
is_tip_contrata =  lu_comunic.is_comunic.strval2



if is_tip_contrata = 'CO' then
		
	
		gb_3.text = 'Datos de la Contrata'
		dw_datos_brigada.dataobject = 'd_con_2018_datos_contrata'	
		
		sqlselect  =' SELECT "GI_OT"."NRO_OT",   &
         "GI_OT"."USUARIO",   &
         "GI_OT"."IND_TRABAJO",&
         "GI_OT"."NRO_CMD",   &
         "GI_OT"."NRO_CENTRO", &
         "GI_OT"."NRO_MESA",   &
         "GI_OT"."ULT_BRIGADA",   &
         "GI_OT"."F_ALTA",   &
         "GI_OT"."H_ALTA",   &
         "GI_OT"."F_ACTUAL",  &
         "GI_OT"."H_ACTUAL",   &
         "GI_OT"."PROGRAMA",   &
         "GI_OT"."EST_OT",   &
         "GI_OT"."DESCRIPCION",   &
         "GI_OT"."NRO_AVISO",   &
         "GI_OT"."NRO_INSTALACION",   &
         "GI_OT"."NRO_INCIDENCIA",   &
         "GI_CONTRATA_OT"."F_DESDE",  &
         "GI_CONTRATA_OT"."F_HASTA",&
			SYSDATE	H_DESDE,   &
			SYSDATE	H_HASTA,&
         "GI_OT"."F_DESDE",&
         "GI_OT"."F_HASTA", &
         "GI_OT"."H_DESDE",  &
         "GI_OT"."H_HASTA",   &
         "GI_OT"."TIP_BRIGADA", &
			1	ID_REPONSABLE,&
         "SGD_VALOR"."DESCRIPCION",&
			1 DESCRIPCION_TAREA	&
    FROM "GI_OT",   &
         "GI_CONTRATA_OT",   &
         "SGD_VALOR"  &
   WHERE ( "GI_OT"."NRO_OT" = "GI_CONTRATA_OT"."NRO_OT" ) and  &
         ( "GI_CONTRATA_OT"."NRO_CONTRATA" = :pi_nro_brigada ) AND  &
         "SGD_VALOR"."CODIF" = ' + "'E_OT'" + '  AND  &
         "SGD_VALOR"."CODIGO" = "GI_CONTRATA_OT"."EST_BRIGADA" (+)    '
	this.title = lu_comunic.f_titulo_ventana ("w_6205_co", lu_comunic.is_comunic.accion_llamada)

else		
	is_tip_contrata = 'BR'
	dw_datos_brigada.dataobject = 'd_bri_2018_datos_brigada'
	sqlselect = dw_lista_tareas.GetSqlSelect()
	
	this.title = lu_comunic.f_titulo_ventana ("w_6205", lu_comunic.is_comunic.accion_llamada)
end if
// DSA FIN 18/02/2000			



dw_lista_tareas.SetRowFocusIndicator(Hand!)

// Inicializo objetos de trabajo

iu_bri_2016_nu.fnu_crea_dddw(d_filtro_tareas)
dw_datos_brigada.settransobject(sqlca)
dw_datos_brigada.retrieve(lu_comunic.is_comunic.longval1)
d_filtro_tareas.InsertRow(0)

d_filtro_tareas.getchild ('pi_estado',dwc_estado)
dwc_estado.setTransObject(sqlca)
dwc_estado.retrieve()

ls_filter = 'codigo = '+ string (fgci_ot_trabajando)
dwc_estado.setFilter(ls_filter)
dwc_estado.filter()	

d_filtro_tareas.setitem(1,"pi_tareas",0)

// El estado de las tareas/OT's siempre sera trabajando
d_filtro_tareas.Modify("pi_estado.visible = false")
d_filtro_tareas.Modify("estado_t.visible= true")
d_filtro_tareas.Modify("estado_t.text = ' Trabajando'")
d_filtro_tareas.Modify("estado_t.background.color=" + gs_gris)

ii_fila_seleccionada = 1

dw_lista_tareas.settransobject(sqlca)
This.triggerevent("ue_armar_sql")
This.triggerevent("ue_retrieve")


SetFocus(dw_lista_tareas)

IF dw_lista_tareas.RowCount() <=0 THEN	
	// Como la brigada no tiene tareas asignadas le preguntamos al usuario si desea asignarle una
	// DSA INI 22/03/2000
	IF lu_comunic.is_comunic.ACCION_LLAMADA = "Consulta" THEN
		gnv_msg.f_mensaje( "AM61","","",Ok!) 
		close(this)
		return
	ELSE
	// DSA FIN 22/03/2000
	//	IF gnv_msg.f_mensaje( "AM53","","",YesNo!) = 1 THEN 			// LFE
		  this.visible = true
		  IF is_tip_contrata = 'BR' THEN
			   d_filtro_tareas.setitem(1,"pi_tareas",2) //tareaS
			   d_filtro_tareas.Modify("pi_tareas.visible=false")
			   d_filtro_tareas.Modify("tarea_t.visible=true")
			   d_filtro_tareas.Modify("tarea_t.text = ' TAREA'" )
  			   d_filtro_tareas.Modify("pi_tareas.background.color=" + gs_gris)
			   d_filtro_tareas.Modify("pi_tareas.protected=1")
		  END IF
		  this.TriggerEvent("ue_nueva_tarea")						// LFE									
		//ELSE																
		//	close(this)
//
//	//		return
//			if isvalid(w_con_0001_mant_contratas)  AND &
//				ls_programa_llamante = 'w_con_0001' then
//				w_operaciones.setredraw(False)
//				w_con_0001_mant_contratas.setfocus()
//				w_operaciones.setredraw(true)
//			elseif isvalid(w_2270_lista_brigadas_centro) AND &
//					 ls_programa_llamante = 'w_2270' then
//					w_operaciones.setredraw(false)
//				w_2270_lista_brigadas_centro.setfocus()
//					w_operaciones.setredraw(true)
//			end if
//			return
//		END IF
	END IF
ELSE
	IF	is_tip_contrata = 'BR' THEN

		li_trabajo = dw_lista_tareas.GetItemNumber (1,'gi_ot_ind_trabajo')
		if li_trabajo = 1 then
			d_filtro_tareas.Modify("tarea_t.text = ' OT'")
		else
			d_filtro_tareas.Modify("tarea_t.text = ' TAREA'" )
		end if
			
		d_filtro_tareas.Modify("pi_tareas.visible=false")
		d_filtro_tareas.Modify("pi_tareas.background.color=" + gs_gris)
		d_filtro_tareas.Modify("tarea_t.visible=true")
		d_filtro_tareas.Modify("tarea_t.protected=1")
	
		d_filtro_tareas.enabled = false
	END IF

END IF
 this.visible = true
IF lu_comunic.is_comunic.ACCION_LLAMADA = "Consulta" OR &
	lu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA" THEN

	//d_filtro_tareas.VISIBLE=FALSE
	cb_buscar.VISIBLE=FALSE
	gb_2.VISIBLE=FALSE
	dw_lista_tareas.modify("GI_BRIGADA_OT_f_desde.protect=1")
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	dw_lista_tareas.modify("GI_BRIGADA_OT_f_desde.background.color="+string(65536*192+256*192+192))	
//	dw_lista_tareas.modify("GI_BRIGADA_OT_f_hasta.protect=1")
//	dw_lista_tareas.modify("GI_BRIGADA_OT_f_hasta.background.color="+string(65536*192+256*192+192))
//	dw_lista_tareas.modify("descripcion_tarea.protect=1")
//	dw_lista_tareas.modify("descripcion_tarea.background.color="+string(65536*192+256*192+192))	
	dw_lista_tareas.modify("GI_BRIGADA_OT_f_desde.background.color=" + gs_gris)	
	dw_lista_tareas.modify("GI_BRIGADA_OT_f_hasta.protect=1")
	dw_lista_tareas.modify("GI_BRIGADA_OT_f_hasta.background.color=" + gs_gris)
	dw_lista_tareas.modify("descripcion_tarea.protect=1")
	dw_lista_tareas.modify("descripcion_tarea.background.color=" + gs_gris)
// Fin. Sgo.	
END IF


end event

event close;call super::close;DESTROY iu_bri_2016_nu
DESTROY iu_bri_2016_pr
DESTROY iu_bri_2017_pr
DESTROY iu_bri_2018_nu
DESTROY lu_comunic
 
 

end event

event ue_arch_eliminar;call super::ue_arch_eliminar;///////////////////////////////////////////////////////
//										
// Funcion/Evento: ue_arch_eliminar
// 
// Objetivo: Elimina una tarea de la datawindow, teniendo
// 			 en cuenta que la brigada no la haya comenzado. 
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/06/98    FDO
//
///////////////////////////////////////////////////////


int li_confirmo, in_nro_ot, in_nro_tarea , li_calculo, li_fila_ant
long ll_nro_ot

// DSA 27/03/2000			
if lu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA" then
	return
end if

il_nro_ot =dw_lista_tareas.GetItemNumber(ii_fila_seleccionada, "gi_ot_nro_ot")
	
IF dw_lista_tareas.object.gi_ot_ind_trabajo[ii_fila_seleccionada] = 2 THEN
	if dw_lista_tareas.object.estado_ot[ii_fila_seleccionada] <= 1 then
		li_confirmo = gnv_msg.f_mensaje( "CM12","","",YesNo!)
		//li_confirmo = messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","$$HEX1$$bf00$$ENDHEX$$Seguro que quiere eliminar esta Tarea?",exclamation!,YesNo!)

		IF li_confirmo <> 1 THEN
			Return
		END IF

		li_fila_ant = dw_brigadas_inicial.Find("nro_brigada="+string(il_nro_brigada),1,dw_brigadas_inicial.RowCount())
		
		if dw_lista_tareas.GetItemNumber(ii_fila_seleccionada, "estado_ot")=1 then // si se dio de alta
			
			li_calculo = 1
		
		else
			
			li_calculo = 0
			
		end if
				
		dw_lista_tareas.DeleteRow(ii_fila_seleccionada)
		dw_lista_tareas.update()
		
		if is_tip_contrata = 'BR' then//DSA
//DSA 
//		  DELETE FROM "GI_BRIGADA_OT"  
//  			 WHERE ( "GI_BRIGADA_OT"."NRO_BRIGADA" = :lu_comunic.is_comunic.longval1 ) AND  
//       			 ( "GI_BRIGADA_OT"."NRO_OT" = :il_nro_ot )   ;
		  DELETE FROM "GI_BRIGADA_OT"  
  			 WHERE 	( "GI_BRIGADA_OT"."NRO_OT" = :il_nro_ot )   ;

		  UPDATE "GI_BRIGADA"  
  	   	SET   "IND_PREVISTO" = "IND_PREVISTO" - :li_calculo
	  	 	WHERE "GI_BRIGADA"."NRO_BRIGADA" = :lu_comunic.is_comunic.longval1;
		else				
			//se usa delete cascade constraint			
		end if
//		COMMIT; //DBE 17/12/1999
		gnu_u_transaction.uf_commit(); //DBE 17/12/1999
		ib_alta=false
		cb_buscar.text="&Buscar"
	else 
		gnv_msg.f_mensaje( "AM39","","",ok!)
		//messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","La Brigada se encuentra trabajando en la Tarea")
	end if
	
ELSE
	gnv_msg.f_mensaje( "AM40","","",ok!)
	//Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "No puede borrar una Orden de Trabajo")
END IF
ii_fila_seleccionada = 1
dw_lista_tareas.ScrolltoRow(ii_fila_seleccionada)






end event

event closequery;call super::closequery;
if cb_buscar.text = "&Aceptar" then
	if gnv_msg.f_mensaje( "CM13","","",OKCANCEL!)=1 then

			gnu_u_transaction.uf_commit()
			if is_tip_contrata <> "CO" then // BRIGADA
			  gnu_u_transaction.uf_unlock_brigada(il_nro_brigada)
			end if
		if fw_buscar() <> 1 then 
			return 1
		end if
	else
		gnu_u_transaction.uf_rollback()
		if is_tip_contrata <> "CO" then // BRIGADA
		  gnu_u_transaction.uf_unlock_brigada(il_nro_brigada)
	  	end if
	end if
else
	gnu_u_transaction.uf_rollback()
	if is_tip_contrata <> "CO" then // BRIGADA
	  gnu_u_transaction.uf_unlock_brigada(il_nro_brigada)
 	end if
end if

end event

event activate;call super::activate;///////////////////////////////////////////////////////
//										
// Funcion/Evento: Activate
// 
// Objetivo: 
//	
//
// Responsable: FDO 
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//    Entrada: --
//		Salida : --
//
// Devuelve:
//
// Fecha      Responsable   Actuaci$$HEX1$$f300$$ENDHEX$$n
// ------	   -----------   ---------
// 15/09/98    FDO
//
///////////////////////////////////////////////////////

IF gu_comunic.is_comunic.programa_retorno = "w_2302" &
   AND gu_comunic.is_comunic.accion_retorno = "aceptado" THEN
		fw_buscar()
END IF

end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_6205_consulta_tareas
end type

type d_filtro_tareas from datawindow within w_6205_consulta_tareas
integer x = 2386
integer y = 96
integer width = 942
integer height = 284
integer taborder = 30
boolean bringtotop = true
string dataobject = "d_bri_2016_pr_prop_tareas_ots"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;//parent.triggerEvent("ue_resetear_datos")
end event

event constructor;//datawindowchild ddw_estado_ot_t
//
//This.GetChild('pi_estado', ddw_estado_ot_t)
//ddw_estado_ot.ShareData(ddw_estado_ot_t)
//
//return 1
end event

type cb_buscar from commandbutton within w_6205_consulta_tareas
integer x = 1385
integer y = 1096
integer width = 663
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string pointer = "MANOOK.CUR"
string text = "&Buscar"
end type

event clicked;idwi_status = dw_lista_tareas.GetItemStatus(dw_lista_tareas.getrow(), 0, Primary!)
fw_buscar()
end event

type dw_datos_brigada from datawindow within w_6205_consulta_tareas
integer x = 50
integer y = 72
integer width = 1495
integer height = 316
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_con_2018_datos_contrata"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_lista_tareas from u_bri_2017_pr_datos_orden_tarea within w_6205_consulta_tareas
event ue_key_down pbm_dwnkey
integer x = 59
integer y = 512
integer width = 3255
integer height = 492
integer taborder = 10
string dataobject = "d_bri_2017_pr_datos_orden_tarea_2"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event ue_key_down;/////////////////////////////////////////////////////
//	Permite borrar o agregar incidencias desde el teclado
//	dependiendo de si el usuario presiono delete o insert
//
//
//////////////////////////////////////////////////////
long ll_row

IF keyflags = 0 THEN  // Controlo que no haya presionado
							// control ni shift

	ll_row = This.Getselectedrow(0)

	IF key = KeyDelete! THEN
		Parent.TriggerEvent("ue_arch_eliminar")
	ELSEIF key = KeyInsert! THEN
		Parent.TriggerEvent("ue_nueva_tarea")
// DSA ini 27/03/2000
//	ELSEIF key = KeyUpArrow! and ll_row > 1 THEN
//		this.selectrow(0,False)
//		this.selectrow(ll_row - 1,true)
//		this.scrolltorow(ll_row - 1)
//	ELSEIF key = KeyDownArrow! and ll_row < this.rowcount() THEN
//		this.selectrow(0,False)
//		this.selectrow(ll_row + 1,true)
//		this.scrolltorow(ll_row + 1)
// DSA fin 27/03/2000
	END IF

END IF

end event

event rbuttondown;call super::rbuttondown;//IF  lu_comunic.is_comunic.ACCION_LLAMADA <> "CONSULTA" THEN
//	menu_tareas = CREATE mbtder_brigadas
//	IF This.RowCount() = 0 THEN	
//		menu_tareas.m_eliminartarea.Enabled = False
//	END IF	
//	IF row > 0 or this.Rowcount() = 0 THEN
//		ii_fila_seleccionada = row
//		Menu_tareas.PopMenu(PointerX(),PointerY()+250)
//	END IF
//
//	Destroy(Menu_tareas)
//END IF
end event

event clicked;call super::clicked;// DSA 27/03/2000			
//IF row > 0 THEN
//	this.ScrollToRow(Row)
//	ii_fila_seleccionada = row
//	this.selectrow(0,False)
//	this.selectrow(ii_fila_seleccionada,true)
//END IF
//
end event

event editchanged;call super::editchanged;cb_buscar.text=("&Aceptar")
end event

event sqlpreview;call super::sqlpreview;//
long pp
pp=row
end event

event dberror;call super::dberror;SQLCA.SQLDbCode = sqldbcode
SQLCA.SQLErrText = sqlerrtext
end event

event rowfocuschanged;call super::rowfocuschanged;if  currentrow > 0 then 
		ScrollToRow(currentrow)
end if

end event

event ue_soltar_clicked;string ls_sint

if ypos<10 and ypos > 0  then 
	ls_sint=is_nomcab_borde + ".Border='6'"
	this.Modify(ls_sint)
end if
end event

type gb_3 from groupbox within w_6205_consulta_tareas
integer x = 23
integer y = 8
integer width = 1541
integer height = 404
integer taborder = 50
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Datos de la Brigada"
end type

type gb_2 from groupbox within w_6205_consulta_tareas
integer x = 2341
integer y = 8
integer width = 1010
integer height = 404
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
string text = "Criterio de Selecci$$HEX1$$f300$$ENDHEX$$n"
end type

type gb_1 from groupbox within w_6205_consulta_tareas
integer x = 27
integer y = 436
integer width = 3328
integer height = 596
integer taborder = 70
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Trabajos Pendientes"
end type

type dw_brigadas_inicial from datawindow within w_6205_consulta_tareas
boolean visible = false
integer x = 329
integer y = 96
integer width = 1106
integer height = 360
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_inc_2050_brigadas_anteriores"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_brig_gen from datawindow within w_6205_consulta_tareas
boolean visible = false
integer x = 1582
integer y = 96
integer width = 494
integer height = 360
integer taborder = 31
boolean bringtotop = true
string dataobject = "d_2001_bri_control_brig_trab"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type


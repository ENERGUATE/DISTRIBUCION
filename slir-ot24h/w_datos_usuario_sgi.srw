HA$PBExportHeader$w_datos_usuario_sgi.srw
forward
global type w_datos_usuario_sgi from w_sgigenerica
end type
type dw_datos_usuario from datawindow within w_datos_usuario_sgi
end type
type cb_aceptar from commandbutton within w_datos_usuario_sgi
end type
type cb_cancelar from commandbutton within w_datos_usuario_sgi
end type
type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_datos_usuario_sgi
end type
type dw_perfil from datawindow within w_datos_usuario_sgi
end type
type gb_2 from groupbox within w_datos_usuario_sgi
end type
type gb_1 from groupbox within w_datos_usuario_sgi
end type
type dw_1 from datawindow within w_datos_usuario_sgi
end type
type cb_1 from commandbutton within w_datos_usuario_sgi
end type
end forward

global type w_datos_usuario_sgi from w_sgigenerica
integer x = 46
integer y = 544
integer width = 3579
integer height = 1388
string title = "OPEN SGI - Gestion de Usuarios"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
string icon = "Open.ico"
dw_datos_usuario dw_datos_usuario
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
d_ambito d_ambito
dw_perfil dw_perfil
gb_2 gb_2
gb_1 gb_1
dw_1 dw_1
cb_1 cb_1
end type
global w_datos_usuario_sgi w_datos_usuario_sgi

type variables
boolean ib_cambio_clave= false
end variables

forward prototypes
public subroutine fw_habilitar_campos (datawindow pdw_data, boolean pb_habilitar)
public subroutine fw_editar_campos ()
end prototypes

public subroutine fw_habilitar_campos (datawindow pdw_data, boolean pb_habilitar);///////////////////////////////////////////////////////////////////////////
// Funcion: fw_habilitar_campos															
//																									
// Objetivo: Se encarga de habilitar y deshabilitar todos los campos de la dw.														
//																									
//	Entrada:	pdw_data	- Datawindow de la que deshabilitar/habilitar			
//																									
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:																	
//																									
//  Fecha         Resp.          Actuaci$$HEX1$$f300$$ENDHEX$$n											
// ---------     -------        ----------------------------------------	
// 27/01/1999    JVI            Versi$$HEX1$$f300$$ENDHEX$$n Inicial										
//	03/06/1999		ACO				Modificaci$$HEX1$$f300$$ENDHEX$$n																						
///////////////////////////////////////////////////////////////////////////

integer		li_modo, li_num_cols, li_contador
long			ll_color
string ls_respuesta

//													
//Seg$$HEX1$$fa00$$ENDHEX$$n el modo pasado como parametro	
//													
if pb_habilitar then
	li_modo = 0
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ll_color = rgb(255,255,255)
	ll_color = long(gs_blanco)
// Fin. Sgo.
else
	li_modo = 1
// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//	ll_color = rgb(192,192,192)
	ll_color = long(gs_gris)
// Fin. Sgo.
end if

	li_num_cols = integer(pdw_data.object.DataWindow.Column.Count)
	for li_contador = 1 to li_num_cols
		  	pdw_data.Modify("#" + string(li_contador) + ".protect = " + string(li_modo))
  			pdw_data.Modify("#" + string(li_contador) + ".background.color = " + string(ll_color))		
	NEXT


end subroutine

public subroutine fw_editar_campos ();int li_centro, li_cmd, li_mesa, li_perfil
string ls_centro, ls_cmd, ls_mesa, ls_perfil


li_centro = d_ambito.GetItemNumber(1,'nro_centro')
SELECT  NOM_CENTRO
INTO :ls_centro
FROM  SGD_CENTRO
WHERE ( NRO_CENTRO = :li_centro) AND 
	   ( TIP_CENTRO  = 1   );
         
li_cmd = d_ambito.GetItemNumber(1,'nro_cmd')			
SELECT NOM_CENTRO
INTO :ls_cmd
FROM SGD_CENTRO
WHERE ( NRO_CENTRO = :li_cmd) AND
      ( TIP_CENTRO = 2   ) ;
		 
li_mesa = d_ambito.GetItemNumber(1,'nro_mesa')		 
SELECT  NOM_CENTRO
INTO :ls_mesa
FROM SGD_CENTRO  
WHERE ( TIP_CENTRO = 3   ) AND    
      ( NRO_CENTRO = :li_mesa)  ;	
		
		
li_perfil = dw_perfil.GetItemNumber(1,'perfil')		
SELECT DESCRIPCION
INTO :ls_perfil
FROM GI_PERFILES
WHERE PERFIL = :li_perfil ;
		
//Inserto las descripciones obtenidas en los campos de tipo TEXT que he pegado en el dw

dw_1.modify("centro_t.text= '" + ls_centro + "'")
dw_1.modify("cmd_t.text = '" + ls_cmd + "'")
dw_1.modify("mesa_t.text = '" + ls_mesa + "'")
dw_1.modify("perfil_t.text = '" + ls_perfil + "'")
end subroutine

on w_datos_usuario_sgi.create
int iCurrent
call super::create
this.dw_datos_usuario=create dw_datos_usuario
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
this.d_ambito=create d_ambito
this.dw_perfil=create dw_perfil
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_1=create dw_1
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_datos_usuario
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_cancelar
this.Control[iCurrent+4]=this.d_ambito
this.Control[iCurrent+5]=this.dw_perfil
this.Control[iCurrent+6]=this.gb_2
this.Control[iCurrent+7]=this.gb_1
this.Control[iCurrent+8]=this.dw_1
this.Control[iCurrent+9]=this.cb_1
end on

on w_datos_usuario_sgi.destroy
call super::destroy
destroy(this.dw_datos_usuario)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
destroy(this.d_ambito)
destroy(this.dw_perfil)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_1)
destroy(this.cb_1)
end on

event open;call super::open;/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : open
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n : Carga los valores de la datawindow y habilita / deshabilita los botones dependiendo del perfil 	
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado  Alfonso Coto
//
//  Fecha : 17/12/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int li_perfil, li_fila, li_retorno, li_comprobacion
int li_nro_zona, li_nro_cmd,li_nro_sector
int li_contador
string ls_usuario, ls_modif, ls_descripcion
DataWindowChild ldwc_perfiles
datetime ld_fecha

select count(*) into :li_comprobacion from sgd_usuarios_generales using  sqlca;
if sqlca.sqlcode<>0 then
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n"," No se puede abrir la ventana mientras no exista sin$$HEX1$$f300$$ENDHEX$$nimo a SGD_USUARIOS_GENERALES",StopSign!)
	close(this)
	return
end if
d_ambito.fpr_crea_dddw()
d_ambito.insertrow(0)   
d_ambito.accepttext()
dw_perfil.dataobject='d_perfil'
dw_perfil.settransobject(sqlca)
dw_perfil.insertrow(0)
dw_perfil.ResetUpdate()
dw_perfil.GetChild('perfil',ldwc_perfiles)
ldwc_perfiles.SetTransObject(sqlca)
li_perfil=ldwc_perfiles.Retrieve()
if ldwc_perfiles.rowcount()=0 then
//	messagebox("Aviso","No existen perfiles definidos")
	gnv_msg.f_mensaje("EG30","","",OK!)	
	close(this)
	return
end if

ldwc_perfiles.scrolltorow(1)
ldwc_perfiles.selectrow(0,False)
ldwc_perfiles.selectrow(1,true)


li_perfil=gu_comunic.is_comunic.intval1
dw_perfil.setitem(1,"perfil",li_perfil)
dw_perfil.accepttext()

ls_modif=gu_comunic.is_comunic.strval1

// SI ES ALTA

dw_datos_usuario.SetTransObject(sqlca)
if ls_modif="ALTA" then
		ld_fecha=fgnu_fecha_actual()
		li_fila=dw_datos_usuario.InsertRow(0)
		dw_datos_usuario.Scrolltorow(li_fila)
		dw_datos_usuario.setitem(li_fila,"f_actual", ld_fecha)
		dw_datos_usuario.setitem(li_fila,"h_actual", ld_fecha)
		dw_datos_usuario.setitem(li_fila,"programa","MANTE_USUARIOS")
		dw_datos_usuario.setitem(li_fila,"f_expiracion",ld_fecha)
		dw_datos_usuario.setitem(li_fila,"informar",1)
		dw_datos_usuario.setitem(li_fila,"usuario_sgd",0)
		dw_datos_usuario.accepttext()
		d_ambito.fnu_insertar_datos(gi_nro_centro,gi_nro_cmd,gi_nro_puesto,0)
		//d_ambito.SetItem(1,"nro_centro",0) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
   	//d_ambito.SetItem(1,"nro_cmd",0) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
	   //d_ambito.SetItem(1,"nro_mesa",0) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
		d_ambito.accepttext()
		ib_cambio_clave=true
else
			ls_usuario=gu_comunic.is_comunic.strval2
						
			dw_datos_usuario.retrieve(ls_usuario)
			dw_datos_usuario.object.usuario.protect=1
			
			// VERIFICAMOS SI  ES USUARIO SGD PARA EVITAR EL CAMBIO DE CLAVE

			select count(*) into :li_contador
			from sgd_usuarios_generales where nombre_usuario = :ls_usuario and upper(permisos) like '%SGI%';

			if li_contador > 0 then 
				dw_datos_usuario.object.usuario_sgd.visible=1
				dw_datos_usuario.object.usuario_sgd[1] = 1
				dw_datos_usuario.object.nombre_usuario_sgd.visible=0
				dw_datos_usuario.object.nombre_usuario_sgd[1]= ls_usuario
				dw_datos_usuario.object.nombre_usuario_sgd.protect=1
				dw_datos_usuario.object.usuario.visible = 1
			else
				dw_datos_usuario.object.usuario_sgd.visible=0			
			end if
			
			dw_datos_usuario.object.usuario_sgd.protect=1

			dw_datos_usuario.object.usuario.background.color=long(gs_gris)
			li_fila=dw_datos_usuario.getrow()
			li_nro_zona=dw_datos_usuario.getitemnumber(li_fila,"nro_centro")
			li_nro_cmd=dw_datos_usuario.getitemnumber(li_fila,"nro_cmd")
			li_nro_sector=dw_datos_usuario.getitemnumber(li_fila,"nro_mesa")
			d_ambito.fnu_insertar_datos(li_nro_zona,li_nro_cmd,li_nro_sector,0)
//			dw_perfil.object.perfil.background.color=long(gs_gris)
//			dw_perfil.modify("perfil.visible=false")
//			dw_perfil.object.perfil.protect=1
			//li_perfil = dw_perfil.GetItemNumber(1,'perfil')

		   SELECT "GI_PERFILES"."DESCRIPCION"   
	      INTO :ls_descripcion
		   FROM "GI_PERFILES"  
    		WHERE  "GI_PERFILES"."PERFIL"  = :li_perfil;
			 
			dw_perfil.object.t_perfil.text = ls_descripcion
			//d_ambito.SetItem(1,"nro_centro",li_nro_zona) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
			//d_ambito.SetItem(1,"nro_cmd",li_nro_cmd) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
			//d_ambito.SetItem(1,"nro_mesa",li_nro_sector) // LFE - Comentado para $$HEX1$$e100$$ENDHEX$$mbito
			d_ambito.accepttext()

end if





//
//
//li_retorno = wf_cargar_vector(li_perfil)
//if li_retorno <>1 then  // ALGUN ERROR
//	if li_retorno=0 then // 
//  	    messagebox("Aviso","Perfil ya bloqueado por otro usuario")
// 	else
//		messagebox("Aviso","Error en la carga de perfiles")
//	end if	
//	close(this)
//	return
//end if
//
//


// No Hay registros
if dw_datos_usuario.rowcount()=0 then
//	messagebox("Aviso","No existe un registro con esos datos")
	gnv_msg.f_mensaje("IA19","","",OK!)	
	close(this)
	return
end if


if gu_perfiles.of_acceso_perfil(gi_perfil,"TBAS_BASICAS","ACC_MANTEN")= 0 then // CONSULTA
	cb_aceptar.enabled=false
	dw_datos_usuario.enabled=false
	dw_perfil.enabled=false
	d_ambito.enabled=false
	fw_habilitar_campos(dw_datos_usuario,false)
	dw_perfil.modify("perfil.visible=false")
	dw_perfil.object.perfil.protect=1
	
//	li_perfil = dw_perfil.GetItemNumber (1,'perfil')
   SELECT "GI_PERFILES"."DESCRIPCION"   
   INTO :ls_descripcion
   FROM "GI_PERFILES"  
 	WHERE  "GI_PERFILES"."PERFIL"  = :li_perfil;
			 
	dw_perfil.object.t_perfil.text = ls_descripcion
	dw_perfil.object.t_perfil.text = 'sdf'
	dw_perfil.modify("perfil.background.color="+gs_gris)	
	d_ambito.modify("nro_centro.protect=1")
   d_ambito.modify("nro_centro.background.color="+gs_gris)
   d_ambito.modify("nro_cmd.protect=1")
   d_ambito.modify("nro_cmd.background.color="+gs_gris)
   d_ambito.modify("nro_mesa.protect=1")
   d_ambito.modify("nro_mesa.background.color="+gs_gris)
end if


dw_datos_usuario.setfocus()











end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_datos_usuario_sgi
end type

type dw_datos_usuario from datawindow within w_datos_usuario_sgi
integer x = 73
integer y = 128
integer width = 2011
integer height = 972
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_datos_usuario"
boolean border = false
boolean livescroll = true
end type

event itemchanged;DataWindowChild ddw_usuario_sgd

if row>0 then
	if dwo.name="usuario" then 
		this.setitem(row,"clave",data)
		this.accepttext()
	end if
	if  dwo.name="clave" then // SE ESTA CAMBIANDO LA CLAVE
		ib_cambio_clave=true
	end if
	
if  dwo.name = 'usuario_sgd' then
	
if this.object.usuario_sgd[1] = 0 then 
		dw_datos_usuario.GetChild('nombre_usuario_sgd',ddw_usuario_sgd )
		
		// Set the transaction object for the child
		
		ddw_usuario_sgd.SetTransObject(SQLCa)
		
		
			if (ddw_usuario_sgd.Retrieve()>0) then 
				this.object.usuario_sgd[1] = 1
			else  
				messagebox("Aviso", "No hay m$$HEX1$$e100$$ENDHEX$$s usuarios SGD que dar de alta en el sistema",Information!)
				return 2
//				this.object.usuario_sgd[1] = 0
			end if
  end if	
  end if 	
	
	
end if
end event

event getfocus;//st_1.backcolor=long(0)
//st_1.textcolor=long(79741120)
//
end event

event losefocus;//st_1.backcolor=long(276856960)
//st_1.textcolor=long(79741120)
//
//
end event

event dberror;gnv_msg.f_mensaje("EG51","","",OK!)	
return 1
end event

event itemerror;if dwo.name="f_expiracion" then
	gnv_msg.f_mensaje("EG31","","",OK!)	
//	messagebox("Aviso","Fecha incorrecta")
	return 1
end if
end event

event clicked;



if dwo.name = 'p_semaforo_rojo' then
	if gnv_msg.f_mensaje("CG18","","",YesNo!)	=1  then 
		this.object.ind_bloqueado[1] = 2
	end if
		
elseif  dwo.name = 'p_semaforo_verde' then
	if gnv_msg.f_mensaje("CG19","","",YesNo!)	=1  then 
		this.object.ind_bloqueado[1] = 1
		this.object.f_bloqueado[1] = fgnu_fecha_Actual()
		this.object.nom_ordenador[1] = "Administrador"
	end if

	
end if

end event

type cb_aceptar from commandbutton within w_datos_usuario_sgi
integer x = 2368
integer y = 1060
integer width = 320
integer height = 108
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Aceptar"
boolean default = true
end type

event clicked;string ls_usuario, ls_correo, ls_descripcion, ls_nombre, ls_clave, ls_clave_cifrada
int li_perfil, li_caducidad
datetime ld_fecha_expiracion
int li_informar
int li_fila


int li_nro_zona, li_nro_cmd, li_nro_sector
string ls_mod
setpointer(hourglass!)
ls_mod=gu_comunic.is_comunic.strval1
li_fila=dw_datos_usuario.getrow()
if li_fila>0 then
		d_ambito.accepttext()
		li_nro_zona=d_ambito.getitemnumber(1,"nro_centro")
		li_nro_cmd=d_ambito.getitemnumber(1,"nro_cmd")
		li_nro_sector=d_ambito.getitemnumber(1,"nro_mesa")
//		if li_nro_zona=0 or li_nro_cmd=0 or li_nro_sector=0 then
//			if not(li_nro_zona=0 and li_nro_cmd=0 and li_nro_sector=0) then 
//				gnv_msg.f_mensaje("EA20","","",OK!)	
////			messagebox("Aviso","Ambito incorrecto")
//				return
//			end if
//		end if
		
		dw_datos_usuario.setitem(li_fila,"nro_centro",li_nro_zona)
		dw_datos_usuario.setitem(li_fila,"nro_cmd",li_nro_cmd)
		dw_datos_usuario.setitem(li_fila,"nro_mesa",li_nro_sector)
		
		if dw_datos_usuario.accepttext()=-1 then return
		
		ld_fecha_expiracion=dw_datos_usuario.getitemdatetime(li_fila,"f_expiracion")
		li_caducidad=dw_datos_usuario.getitemnumber(li_fila,"ind_caducidad")
		li_informar=dw_datos_usuario.getitemnumber(li_fila,"informar")
		
		//USUARIO VACIO?
		
		if dw_datos_usuario.getitemnumber(li_fila,"usuario_sgd") = 1 then 
				ls_usuario=dw_datos_usuario.getitemstring(li_fila,"nombre_usuario_sgd")
				dw_datos_usuario.setitem(li_fila,"usuario",ls_usuario)
		else	
				ls_usuario=dw_datos_usuario.getitemstring(li_fila,"usuario")
		end if
		if isnull(ls_usuario) or ls_usuario="" then 
				gnv_msg.f_mensaje("EG33","","",OK!)	
//				messagebox("Aviso","Indentificador de usuario incorrecto")
				return
		end if
		// CORREO INCORRECTO?
		if li_informar=0 then
			dw_datos_usuario.setitem(li_fila,"email","")
			dw_datos_usuario.accepttext()
		else
			ls_correo=dw_datos_usuario.getitemstring(li_fila,"email")
			if  isnull(ls_correo) or ls_correo="" or pos(ls_correo,"@",1)=0 then 
				gnv_msg.f_mensaje("EG34","","",OK!)	
//				messagebox("Aviso","Direcci$$HEX1$$f300$$ENDHEX$$n de correo incorrecta")
				return
			end if
		end if
		// CONTROL DE LA FECHA DE EXPIRACION
		if li_caducidad =0 then // NO TIENE FECHA DE CADUCIDAD
   		setnull(ld_fecha_expiracion)	
		else
			if isnull(ld_fecha_expiracion) then  // TIENE FECHA DE CADUCIDAD NULA
			  gnv_msg.f_mensaje("EG50","","",OK!)	
			  return
			  end if  
		end if 
		
		
		//DESCRIPCION VACIA?
		
		ls_descripcion=dw_datos_usuario.getitemstring(li_fila,"desc_usr")		
		if isnull(ls_descripcion) or ls_descripcion="" then 
				gnv_msg.f_mensaje("EG35","","",OK!)	
//				messagebox("Aviso","Descripcion no v$$HEX1$$e100$$ENDHEX$$lida")
				return
		end if
		
		// NOMBRE VACIO?
		
		ls_nombre=dw_datos_usuario.getitemstring(li_fila,"gi_usuario_sgi_nom_usuario")		
		if isnull(ls_nombre) or ls_nombre="" then 
				gnv_msg.f_mensaje("EG36","","",OK!)	
	//			messagebox("Aviso","Nombre de usuario no v$$HEX1$$e100$$ENDHEX$$lido")
				return
		end if
		
		//CLAVE VACIA COLOCAMOS EL IDENTIFICADOR DEL USUARIO
		
		ls_clave=dw_datos_usuario.getitemstring(li_fila,"clave")		
	
			if isnull(ls_clave) or ls_clave="" then // SI ES NULA COLOCAMOS EL IDENTIFICADOR DE USUARIO
		
				if dw_datos_usuario.getitemnumber(li_fila,"usuario_sgd") = 1 then 
						ls_clave=ls_usuario
						gu_perfiles.of_cifra_clave(ls_clave,ls_clave_cifrada)	
				else	
				
							if gnv_msg.f_mensaje("CG15","","",YesNo!)	=1  then 
							//			if messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","Clave vacia.$$HEX1$$bf00$$ENDHEX$$Desea asignar el identificador de usuario?",Information!,YesNo!)=1 then 		
										
												ls_clave=ls_usuario
												gu_perfiles.of_cifra_clave(ls_clave,ls_clave_cifrada)	
							else
								//				messagebox("Aviso","Introduzca una clave v$$HEX1$$e100$$ENDHEX$$lida")
												gnv_msg.f_mensaje("EG32","","",OK!)	
											return
							end if		
				end if
			elseif ib_cambio_clave  then // CLAVE CAMBIADA --> LA CIFRAMOS
							gu_perfiles.of_cifra_clave(ls_clave,ls_clave_cifrada)	
							//AHM (10/11/2009) Mejora 1/732525
							IF fg_verifica_parametro('CADUCIDAD DE LA CONTRASE$$HEX1$$d100$$ENDHEX$$A') THEN /*Comprueba si est$$HEX2$$e1002000$$ENDHEX$$activo la caducidad de la contrase$$HEX1$$f100$$ENDHEX$$a*/
								dw_datos_usuario.setitem(li_fila,"f_ultima_renovacion", fgnu_fecha_actual())		//Actualizamos la fecha de la $$HEX1$$fa00$$ENDHEX$$ltima renovaci$$HEX1$$f300$$ENDHEX$$n de la clave
							END IF
			elseif  not ib_cambio_clave then // NO SE HA CAMBIADO LA CLAVE ENTONCES YA ESTA CIFRADA
							ls_clave_cifrada=ls_clave
			end if
						
		
		
		dw_datos_usuario.setitem(li_fila,"clave",ls_clave_cifrada)
		
		dw_datos_usuario.accepttext()	
		
		dw_perfil.accepttext()
		li_perfil=dw_perfil.getitemnumber(1,"perfil")
		

		if dw_datos_usuario.Update()=1 then 
		
			
			
			
			if ls_mod="ALTA" then 
			  INSERT INTO "GI_USUARIO_PERFILES"  
					  ( "ID_USUARIO",   
						  "PERFIL",   
						  "USUARIO",   
						  "F_ACTUAL",   
						  "PROGRAMA",   
						  "F_EXPIRACION",   
						  "INFORMAR" )  
			  VALUES ( :ls_usuario,   
						  :li_perfil,   
						  'OPENSGI',   
						  sysdate,   
						  'MANTE_USUARIOS',   
						  :ld_fecha_expiracion,   
						  :li_informar ) USING sqlca ;
			else
			  UPDATE "GI_USUARIO_PERFILES"  
 			    SET "ID_USUARIO" = :ls_usuario,
			         "PERFIL" = :li_perfil,   
			         "USUARIO" = 'OPENSGI',   
			         "F_ACTUAL" = sysdate,   
         			"PROGRAMA" = 'MANTE_USUARIOS',   
			         "F_EXPIRACION" = :ld_fecha_expiracion,   
			         "INFORMAR" =:li_informar 
				WHERE ID_USUARIO =:ls_usuario USING sqlca;
			
			end if
						
				if sqlca.sqlcode=0 then
					gnu_u_transaction.uf_commit();
				else
					// messagebox("Aviso","No se pudo insertar el registro")
					gnv_msg.f_mensaje("EG37","","",OK!)	
					gnu_u_transaction.uf_rollback();
				end if	
						  
				
			else //ERROR
					gnv_msg.f_mensaje("EG38","","",OK!)	
//					messagebox("Aviso","No se pueden grabar los datos del usuario")
					gnu_u_transaction.uf_rollback();
			end if
				
			

		
		close(parent)
		
		
end if

end event

type cb_cancelar from commandbutton within w_datos_usuario_sgi
integer x = 2784
integer y = 1060
integer width = 320
integer height = 108
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Cancelar"
boolean cancel = true
end type

event clicked;close(parent)
end event

type d_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_datos_usuario_sgi
integer x = 2450
integer y = 544
integer width = 992
integer height = 408
integer taborder = 50
boolean bringtotop = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;call super::itemchanged;if backcolor<>0 then
	d_ambito.setfocus()
end if
end event

event getfocus;//st_3.backcolor=long(0)
//st_3.textcolor=long(79741120)
//
end event

event losefocus;//st_3.backcolor=long(276856960)
//st_3.textcolor=long(79741120)
//
//
end event

event clicked;//
end event

type dw_perfil from datawindow within w_datos_usuario_sgi
integer x = 2231
integer y = 176
integer width = 1253
integer height = 104
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_perfil"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event getfocus;//st_2.backcolor=long(0)
//st_2.textcolor=long(79741120)
//

end event

event losefocus;//st_2.backcolor=long(276856960)
//st_2.textcolor=long(79741120)


end event

type gb_2 from groupbox within w_datos_usuario_sgi
integer x = 41
integer y = 64
integer width = 2085
integer height = 1064
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Datos"
end type

type gb_1 from groupbox within w_datos_usuario_sgi
integer x = 2158
integer y = 64
integer width = 1390
integer height = 288
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = " Perfil"
end type

type dw_1 from datawindow within w_datos_usuario_sgi
boolean visible = false
integer x = 110
integer y = 192
integer width = 1755
integer height = 480
integer taborder = 60
boolean bringtotop = true
string dataobject = "d_usuario_impr"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_datos_usuario_sgi
integer x = 3200
integer y = 1060
integer width = 320
integer height = 108
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;s_impresion_preliminar lst_Impresion
DataWindowChild dwc_perfil, dwc_usuario, dwc_ambito
string ls_titulo
long ll_longitud

//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
ls_titulo = 'Informacion del Usuario'
ll_longitud = len (ls_titulo)*100
dw_1.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_1.modify("titulo_t.Text = '" + ls_titulo + "'")

dw_1.getchild ("d_perfil",dwc_perfil)
dw_perfil.sharedata(dwc_perfil)
lst_impresion.pa_todos[1]=dw_perfil
lst_impresion.pa_nombres[1]='d_perfil'

dw_1.getchild ("d_usuario",dwc_usuario)
dw_datos_usuario.sharedata(dwc_usuario)
lst_impresion.pa_todos[2]=dw_datos_usuario
lst_impresion.pa_nombres[2]='d_usuario'

dw_1.getchild ("d_ambito",dwc_ambito)
d_ambito.sharedata(dwc_ambito)
lst_impresion.pa_todos[3]=d_ambito
lst_impresion.pa_nombres[3]='d_ambito'

lst_impresion.total = 3
//IF d_lista_brigada.RowCount() = 0 THEN
//	gnv_msg.f_mensaje( "AB02","","",OK!)
//	return
//END IF
fw_editar_campos()

dw_1.SetTransObject(SQLCA)

//lst_impresion.pdw_datawindow = dw_1
//lst_impresion.pdw_lista = d_lista_brigada
lst_impresion.pdw_compuesto = dw_1
lst_impresion.compuesto = true
gf_impresion_preliminar (lst_impresion, True, 0)

	
	

end event


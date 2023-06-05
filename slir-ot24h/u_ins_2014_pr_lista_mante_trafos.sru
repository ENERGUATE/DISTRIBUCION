HA$PBExportHeader$u_ins_2014_pr_lista_mante_trafos.sru
forward
global type u_ins_2014_pr_lista_mante_trafos from u_gen_0000_lista
end type
end forward

global type u_ins_2014_pr_lista_mante_trafos from u_gen_0000_lista
integer width = 1792
integer height = 584
string dataobject = "d_ins_2014_pr_lista_mante_trafos"
end type
global u_ins_2014_pr_lista_mante_trafos u_ins_2014_pr_lista_mante_trafos

forward prototypes
public function integer fpr_habilitar_campos (boolean pb_habilito)
public function integer f_agregar_registro (decimal pdec_nro_inst)
public function integer f_borrar_registro (integer pi_fila)
end prototypes

public function integer fpr_habilitar_campos (boolean pb_habilito);// Modificado por Sgo. Unificaci$$HEX1$$f300$$ENDHEX$$n.
//IF pb_habilito THEN			
//	This.SetTabOrder("nro_transformador",10)
//	This.modify("nro_transformador.background.Color ="+string(65536*255+256*255+255))
//	This.SetTabOrder("fabricante",20)
//	This.modify("fabricante.background.Color ="+string(65536*255+256*255+255))
//	This.SetTabOrder("tipo",30)
//	This.modify("tipo.background.Color ="+string(65536*255+256*255+255))
//	This.SetTabOrder("potencia",40)
//	This.modify("potencia.background.Color ="+string(65536*255+256*255+255))
//ELSE
//	This.SetTabOrder("nro_transformador",0)
//	This.modify("nro_transformador.background.Color ="+string(65536*192+256*192+192))
//	This.SetTabOrder("fabricante",0)
//	This.modify("fabricante.background.Color ="+string(65536*192+256*192+192))
//	This.SetTabOrder("tipo",0)
//	This.modify("tipo.background.Color ="+string(65536*192+256*192+192))
//	This.SetTabOrder("potencia",0)
//	This.modify("potencia.background.Color ="+string(65536*192+256*192+192))
//END IF
//
//Return 1

IF pb_habilito THEN			
	This.SetTabOrder("nro_transformador",10)
	This.modify("nro_transformador.background.Color =" + gs_blanco)
	This.SetTabOrder("fabricante",20)
	This.modify("fabricante.background.Color =" + gs_blanco)
	This.SetTabOrder("tipo",30)
	This.modify("tipo.background.Color =" + gs_blanco)
	This.SetTabOrder("potencia",40)
	This.modify("potencia.background.Color =" + gs_blanco)
ELSE
	This.SetTabOrder("nro_transformador",0)
	This.modify("nro_transformador.background.Color =" + gs_gris)
	This.SetTabOrder("fabricante",0)
	This.modify("fabricante.background.Color =" + gs_gris)
	This.SetTabOrder("tipo",0)
	This.modify("tipo.background.Color =" + gs_gris)
	This.SetTabOrder("potencia",0)
	This.modify("potencia.background.Color =" + gs_gris)
END IF

Return 1
// Fin. Sgo.
end function

public function integer f_agregar_registro (decimal pdec_nro_inst);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_agregar_registro
//
// Objetivo:  Inserta una fila.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////


gi_fila_actual=This.InsertRow(0)

This.ScrollToRow(gi_fila_actual)

IF gi_fila_actual=-1 THEN
    gnv_msg.f_mensaje("EM16","","",OK!)
ELSE
	This.SetItem(gi_fila_actual,"usuario",gs_usuario)
	This.SetItem(gi_fila_actual,"f_actual",fgnu_fecha_actual())
	This.SetItem(gi_fila_actual,"programa","w_3108")
	This.SetItem(gi_fila_actual,"nro_poste",pdec_nro_inst)
   This.SetFocus()
	This.SetRow(gi_fila_actual)
	This.SetColumn("nro_transformador")
END IF

Return gi_fila_actual


end function

public function integer f_borrar_registro (integer pi_fila);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: f_borrar_registro
//
// Objetivo:  Elimina fila.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//			Salida: --
//  
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
/////////////////////////////////////////////////////////

int li_confirmo

IF pi_fila > 0 THEN

	li_confirmo = gnv_msg.f_mensaje("CM05","","",YesNo!)
	IF li_confirmo = 1  THEN
		This.DeleteRow(pi_fila)
		This.SetFocus()
	ELSE
		RETURN 1
	END IF
END IF

RETURN 1


end function

on itemerror;//no
end on

on u_ins_2014_pr_lista_mante_trafos.create
call super::create
end on

on u_ins_2014_pr_lista_mante_trafos.destroy
call super::destroy
end on


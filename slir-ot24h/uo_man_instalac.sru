HA$PBExportHeader$uo_man_instalac.sru
forward
global type uo_man_instalac from treeview
end type
end forward

global type uo_man_instalac from treeview
integer width = 800
integer height = 1448
integer taborder = 1
string dragicon = "Application!"
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean border = false
boolean disabledragdrop = false
boolean tooltips = false
string picturename[] = {"subest.bmp","sal_tra1.bmp","ct1.bmp","Transf2.bmp","salbaj.bmp","termina.bmp","cr.bmp","alumbrado.bmp","brigada1.bmp","sector.bmp","ramal.bmp"}
long picturemaskcolor = 553648127
long statepicturemaskcolor = 553648127
event ue_error ( )
end type
global uo_man_instalac uo_man_instalac

type variables
long ie_data
long il_marcado
long il_handle_seleccionado
long il_nivel_seleccionado

// Iconos de la TreeView
int ii_icono_subestacion_alta
int ii_icono_sal_MT
int ii_icono_subestacion
int ii_icono_transformador
int ii_icono_sal_BT
int ii_icono_SAL_AT
int ii_icono_ct
int ii_icono_acometida
int ii_centro_reflexion
int ii_subramal

// GNU 5/10/2006. Iconos de AT
int ii_icono_barra_AT
int ii_icono_parque_AT
int ii_icono_celda_AT
int ii_icono_interruptor_AT
int ii_icono_trafo_pot_AT
int ii_icono_trafo_AT
int ii_icono_banco_AT
int ii_int_cabecera_AT

int ii_icono_barra_mt
int ii_icono_celda_mt
int ii_icono_interruptor_mt
int ii_icono_int_cabecera_mt
int ii_icono_banco_mt
int ii_icono_parque_mt
int ii_icono_secci_AT
int ii_icono_secci_mt
// FIN GNU

//AHM (03/06/2009) Carga de los activos
int ii_icono_grupo_activos 
int ii_icono_activos

// GNU 10/10/2006. Iconos de AT con indisponibilidades
int ii_icono_barra_AT_ind
int ii_icono_celda_AT_ind
int ii_icono_interruptor_AT_ind
int ii_icono_trafo_pot_AT_ind
int ii_icono_trafo_AT_ind
int ii_icono_banco_AT_ind
int ii_int_cabecera_AT_ind
int ii_icono_parque_AT_ind

int ii_icono_barra_mt_ind
int ii_icono_celda_mt_ind
int ii_icono_interruptor_mt_ind
int ii_icono_int_cabecera_mt_ind
int ii_icono_trafo_mt_ind
int ii_icono_banco_mt_ind
int ii_icono_parque_mt_ind
int ii_icono_secci_at_ind
int ii_icono_secci_mt_ind
// FIN GNU

// GNU 10/10/2006. Iconos de AT con indisponibilidades en otra incidencia
int ii_icono_subestac_AT_ind_oi
int ii_icono_sal_AT_ind_oi
int ii_icono_barra_AT_ind_oi
int ii_icono_celda_AT_ind_oi
int ii_icono_interruptor_AT_ind_oi
int ii_icono_trafo_AT_ind_oi
int ii_icono_trafo_pot_AT_ind_oi
int ii_icono_banco_AT_ind_oi
int ii_int_cabecera_AT_ind_oi
int ii_icono_parque_AT_ind_oi

int ii_icono_barra_mt_ind_oi
int ii_icono_celda_mt_ind_oi
int ii_icono_interruptor_mt_ind_oi
int ii_icono_int_cabecera_mt_ind_oi
int ii_icono_banco_mt_ind_oi
int ii_icono_parque_mt_ind_oi
int ii_icono_secci_at_ind_oi
int ii_icono_secci_mt_ind_oi
// FIN GNU

// Instalaciones modificadas en un trabajo

int ii_icono_sal_MT_mod
int ii_icono_subestacion_mod
int ii_icono_transformador_mod
int ii_icono_sal_BT_mod
int ii_icono_ct_mod
int ii_icono_cr_mod

// Instalaciones interrumpidas

int ii_icono_subestacion_alta_int
int ii_icono_sal_MT_int
int ii_icono_subestacion_int
int ii_icono_transformador_int
int ii_icono_sal_BT_int
int ii_icono_SAL_AT_int 
int ii_icono_ct_int
int ii_icono_cr_int
int ii_icono_subramal_int

// Instalaciones repuestas 

int ii_icono_subestacion_alta_rep
int ii_icono_sal_MT_rep
int ii_icono_subestacion_rep
int ii_icono_transformador_rep
int ii_icono_sal_BT_rep
int ii_icono_SAL_AT_rep
int ii_icono_ct_rep
int ii_icono_cr_rep
int ii_icono_subramal_rep

// ICONOS DE AVISOS
int ii_aviso_alumbrado_publico 
int ii_aviso_con_alimentacion 
int ii_aviso_de_ayuda 
int ii_aviso_sin_alimentacion 
int ii_aviso_de_calidad 
int ii_aviso_de_calidad_sin_alim 
int  ii_aviso_de_calidad_con_alim



// ICONO CMD

int ii_cmd

// GNU 9-7-2007. Mejora1/440387
// $$HEX1$$c100$$ENDHEX$$rea de densidad en CTs
int ii_icono_ct_mad
int ii_icono_ct_ad
int ii_icono_ct_di
int ii_icono_ct_bd
int ii_icono_ct_mbd
// FIN GNU

//
int ii_instalaciones_modificadas = 100
int ii_instalaciones_interrumpidas = 200
int ii_instalaciones_repuestas = 300
int ii_cmd_padre = 500
int ii_instalaciones_AT = 400 // GNU 18-10-2006. Sumo a las instalaciones de AT un valor ya que coinciden algunos c$$HEX1$$f300$$ENDHEX$$digos con los de MT		
int ii_instalaciondes_indisponibles = 600 // GNU 10-10-2006. Mejora EPSA
int ii_instalaciones_indisponibles_oi = 700 // GNU 25-10-2006. Mejora EPSA
int ii_area_densidad= 1000 // GNU 9-7-2007. Mejora 1/440387

end variables

forward prototypes
public function integer f_icono_arbol (long pl_tipo_instalacion)
public function string f_devuelve_instalacion (integer pi_tipo)
end prototypes

event ue_error;Messagebox("Error", "Se ha producido un error a la hora de asignar iconos al $$HEX1$$e100$$ENDHEX$$rbol de instalaciones. Es posible que no se visualicen de manera correcta", StopSign!)

gb_mensaje_instalac_error = TRUE
end event

public function integer f_icono_arbol (long pl_tipo_instalacion);///////////////////////////////////////////////////
//
//	f_icono_arbol
//
//	Objetivo: Retorna el pictureindex correspondiente al tipo de instalacion
//				pasada como parametro, para que se represente correctamente en el arbol
//
//	Parametros:  pl_tipo_instalacion (long)
//
//	Retorna : li_icono (integer)
//
// Fecha			Responsable			Actuacion
// -------		-----------			-------------------
//	5/10/99			AFE				Creacion
// 18/10/2000    ACO 				A$$HEX1$$f100$$ENDHEX$$adir nuevos iconos
////////////////////////////////////////////////////

int li_icono

CHOOSE CASE pl_tipo_instalacion
		

	CASE fgci_tipo_subramal
		li_icono = ii_subramal
		
	CASE fgci_tipo_subestacion
		li_icono = ii_icono_subestacion
		
	case fgci_tipo_subestacion_at	
		li_icono = ii_icono_subestacion_alta
		
	case fgci_tipo_salida_at 
		li_icono= ii_icono_SAL_AT
		
	case fgci_tipo_salida_mt
		li_icono= ii_icono_SAL_MT
		
	case fgci_tipo_salida_de_baja
		li_icono= ii_icono_SAL_BT
		
	case fgci_tipo_transformador 
		li_icono =  ii_icono_transformador
		
	case fgci_tipo_ct
		li_icono = ii_icono_ct
		
	case fgci_tipo_acometida 
		li_icono = ii_icono_acometida
	
	case fgci_tipo_subramal 
		li_icono = ii_subramal
				
	case fgci_tipo_centro_reflexion 
		li_icono =ii_centro_reflexion
		
	CASE fgci_tipo_subestacion + ii_instalaciones_modificadas
		li_icono = ii_icono_subestacion_mod
		
	case fgci_tipo_salida_mt + ii_instalaciones_modificadas
		li_icono= ii_icono_SAL_MT_mod
		
	case fgci_tipo_salida_de_baja + ii_instalaciones_modificadas
		li_icono= ii_icono_SAL_BT_mod
		
	case fgci_tipo_transformador + ii_instalaciones_modificadas
		li_icono =  ii_icono_transformador_mod
		
	case fgci_tipo_ct + ii_instalaciones_modificadas
      li_icono = ii_icono_ct_mod
		
	// GNU 5-10-2006. Instalaciones de AT	
	// GNU 18-10-2006. Sumo a las instalaciones de AT un valor ya que coinciden algunos c$$HEX1$$f300$$ENDHEX$$digos con los de MT		

	case fgci_tipo_subestacion_at	+ ii_instalaciones_AT
		li_icono = ii_icono_subestacion_alta
	case fgci_tipo_salida_at + ii_instalaciones_AT
		li_icono= ii_icono_SAL_AT
	case fgci_tipo_barra_at + ii_instalaciones_AT
		li_icono= ii_icono_barra_at
	case fgci_tipo_celda_at + ii_instalaciones_AT
		li_icono= ii_icono_celda_at
	case fgci_tipo_trafo_pot + ii_instalaciones_AT
		li_icono= ii_icono_trafo_pot_at
	case fgci_tipo_interruptor_at + ii_instalaciones_AT
		li_icono= ii_icono_interruptor_at
	case fgci_tipo_trafo_at + ii_instalaciones_AT
		li_icono= ii_icono_trafo_at
	case fgci_tipo_banco_at + ii_instalaciones_AT
		li_icono= ii_icono_banco_at
	case fgci_tipo_int_cabecera_at + ii_instalaciones_AT
		li_icono= ii_int_cabecera_at
	case fgci_tipo_parque_at + ii_instalaciones_AT
		li_icono= ii_icono_parque_at
		
	case fgci_tipo_subestacion_mt + ii_instalaciones_AT
		li_icono = ii_icono_subestacion
	case fgci_tipo_sal_mt + ii_instalaciones_AT
		li_icono = ii_icono_SAL_MT
	case fgci_tipo_barra_mt + ii_instalaciones_AT
		li_icono =ii_icono_barra_mt
	case fgci_tipo_celda_mt + ii_instalaciones_AT
		li_icono =ii_icono_celda_mt
	case fgci_tipo_interruptor_mt + ii_instalaciones_AT
		li_icono =ii_icono_interruptor_mt
	case fgci_tipo_int_cabecera_mt + ii_instalaciones_AT
		li_icono =ii_icono_int_cabecera_mt
	case fgci_tipo_trafo_mt + ii_instalaciones_AT
		li_icono = ii_icono_transformador
	case fgci_tipo_banco_mt + ii_instalaciones_AT
		li_icono =ii_icono_banco_mt
	case fgci_tipo_parque_mt + ii_instalaciones_AT
		li_icono= ii_icono_parque_mt
	case fgci_tipo_seccionador_at + ii_instalaciones_AT
		li_icono= ii_icono_secci_at
	case fgci_tipo_seccionador_mt + ii_instalaciones_AT
		li_icono= ii_icono_secci_at
	// FIN GNU
	//AHM (03/06/2009) Carga de los activos
	case fgci_tipo_activos + ii_instalaciones_AT
		li_icono= ii_icono_activos
	case fgci_tipo_grupos_activos + ii_instalaciones_AT
		li_icono= ii_icono_grupo_activos
	
//  Instalaciones interrumpidas

	CASE fgci_tipo_subestacion + ii_instalaciones_interrumpidas
		li_icono = ii_icono_subestacion_int
		
	case fgci_tipo_subestacion_at	+ ii_instalaciones_interrumpidas
		li_icono = ii_icono_subestacion_alta_int
			
	case fgci_tipo_salida_at + ii_instalaciones_interrumpidas
		li_icono= ii_icono_SAL_AT_int
		
	case fgci_tipo_salida_mt + ii_instalaciones_interrumpidas
		li_icono= ii_icono_SAL_MT_int
		
	case fgci_tipo_salida_de_baja + ii_instalaciones_interrumpidas
		li_icono= ii_icono_SAL_BT_int
		
	case fgci_tipo_transformador + ii_instalaciones_interrumpidas
		li_icono =  ii_icono_transformador_int
		
	case fgci_tipo_ct + ii_instalaciones_interrumpidas
      li_icono = ii_icono_ct_int
		
	case fgci_tipo_centro_reflexion + ii_instalaciones_interrumpidas
      li_icono = ii_icono_cr_int
	
	case fgci_tipo_subramal + ii_instalaciones_interrumpidas
      li_icono = ii_icono_subramal_int		
		
	//  Instalaciones repuestas

	CASE fgci_tipo_subestacion + ii_instalaciones_repuestas
		li_icono = ii_icono_subestacion_rep
	
	case fgci_tipo_subestacion_at	+ ii_instalaciones_repuestas
		li_icono = ii_icono_subestacion_alta_rep
				
	case fgci_tipo_salida_at + ii_instalaciones_repuestas
		li_icono= ii_icono_SAL_AT_rep
		
	case fgci_tipo_salida_mt + ii_instalaciones_repuestas
		li_icono= ii_icono_SAL_MT_rep
		
	case fgci_tipo_salida_de_baja + ii_instalaciones_repuestas
		li_icono= ii_icono_SAL_BT_rep
		
	case fgci_tipo_transformador + ii_instalaciones_repuestas
		li_icono =  ii_icono_transformador_rep
		
	case fgci_tipo_ct + ii_instalaciones_repuestas
      li_icono = ii_icono_ct_rep

	case fgci_tipo_centro_reflexion + ii_instalaciones_repuestas
      li_icono = ii_icono_cr_rep

	case fgci_tipo_subramal + ii_instalaciones_repuestas
   	li_icono = ii_icono_subramal_rep
		
	// ICONOS DE AVISOS 
	
		case  fgcdec_aviso_alumbrado_publico 
			   li_icono =  ii_aviso_alumbrado_publico 
		case  fgcdec_aviso_con_alimentacion 
				li_icono =  ii_aviso_con_alimentacion
  		case fgcdec_aviso_de_ayuda 
				li_icono =  ii_aviso_de_ayuda
		case fgcdec_aviso_sin_alimentacion 
				li_icono =  ii_aviso_sin_alimentacion 
		case fgcdec_aviso_de_calidad 
				li_icono =  ii_aviso_de_calidad 
		case fgcdec_aviso_de_calidad_sin_alim 
				li_icono =  ii_aviso_de_calidad_sin_alim 
		case fgcdec_aviso_de_calidad_con_alim 
				li_icono =  ii_aviso_de_calidad_con_alim
		case fgci_tipo_subestacion	+ ii_cmd_padre
		li_icono = ii_cmd		
		
	// GNU 5-10-2006. Instalaciones de AT con indisponibilidades
	case fgci_tipo_subestacion_at	+ ii_instalaciondes_indisponibles
		li_icono = ii_icono_subestacion_alta_int			
	case fgci_tipo_salida_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_SAL_AT_int
	case fgci_tipo_barra_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_barra_at_ind
	case fgci_tipo_celda_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_celda_at_ind
	case fgci_tipo_trafo_pot + ii_instalaciondes_indisponibles
		li_icono= ii_icono_trafo_pot_at_ind
	case fgci_tipo_interruptor_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_interruptor_at_ind
	case fgci_tipo_trafo_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_trafo_at_ind
	case fgci_tipo_banco_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_banco_at_ind
	case fgci_tipo_int_cabecera_at + ii_instalaciondes_indisponibles
		li_icono= ii_int_cabecera_at_ind
	case fgci_tipo_parque_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_parque_at_ind
		
	case fgci_tipo_subestacion_mt + ii_instalaciondes_indisponibles
		li_icono = ii_icono_subestacion_int
	case fgci_tipo_sal_mt + ii_instalaciondes_indisponibles
		li_icono = ii_icono_SAL_MT_int
	case fgci_tipo_barra_mt + ii_instalaciondes_indisponibles
		li_icono =ii_icono_barra_mt_ind
	case fgci_tipo_celda_mt + ii_instalaciondes_indisponibles
		li_icono =ii_icono_celda_mt_ind
	case fgci_tipo_interruptor_mt + ii_instalaciondes_indisponibles
		li_icono =ii_icono_interruptor_mt_ind
	case fgci_tipo_int_cabecera_mt + ii_instalaciondes_indisponibles
		li_icono =ii_icono_int_cabecera_mt_ind
	case fgci_tipo_trafo_mt + ii_instalaciondes_indisponibles
		li_icono = ii_icono_transformador_int
	case fgci_tipo_banco_mt + ii_instalaciondes_indisponibles
		li_icono =ii_icono_banco_mt_ind
	case fgci_tipo_parque_mt + ii_instalaciondes_indisponibles
		li_icono= ii_icono_parque_mt_ind
	case fgci_tipo_seccionador_at + ii_instalaciondes_indisponibles
		li_icono= ii_icono_secci_at_ind
	case fgci_tipo_seccionador_mt + ii_instalaciondes_indisponibles
		li_icono= ii_icono_secci_mt_ind
	
	// FIN GNU
	
		// GNU 25-10-2006. Instalaciones de AT con indisponibilidades en otras incidencias
	case fgci_tipo_subestacion_at	+ ii_instalaciones_indisponibles_oi
		li_icono = ii_icono_subestac_AT_ind_oi			
	case fgci_tipo_salida_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_sal_AT_ind_oi
	case fgci_tipo_barra_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_barra_at_ind_oi
	case fgci_tipo_celda_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_celda_at_ind_oi
	case fgci_tipo_trafo_pot + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_trafo_pot_at_ind_oi
	case fgci_tipo_interruptor_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_interruptor_at_ind_oi
	case fgci_tipo_trafo_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_trafo_at_ind_oi
	case fgci_tipo_banco_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_banco_at_ind_oi
	case fgci_tipo_int_cabecera_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_int_cabecera_at_ind_oi
	case fgci_tipo_parque_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_parque_at_ind_oi
		
	case fgci_tipo_subestacion_mt + ii_instalaciones_indisponibles_oi
		li_icono = ii_icono_subestacion_rep
	case fgci_tipo_sal_mt + ii_instalaciones_indisponibles_oi
		li_icono = ii_icono_SAL_MT_rep
	case fgci_tipo_barra_mt + ii_instalaciones_indisponibles_oi
		li_icono =ii_icono_barra_mt_ind_oi
	case fgci_tipo_celda_mt + ii_instalaciones_indisponibles_oi
		li_icono =ii_icono_celda_mt_ind_oi
	case fgci_tipo_interruptor_mt + ii_instalaciones_indisponibles_oi
		li_icono =ii_icono_interruptor_mt_ind_oi
	case fgci_tipo_int_cabecera_mt + ii_instalaciones_indisponibles_oi
		li_icono =ii_icono_int_cabecera_mt_ind_oi
	case fgci_tipo_trafo_mt + ii_instalaciones_indisponibles_oi
		li_icono = ii_icono_transformador_rep
	case fgci_tipo_banco_mt + ii_instalaciones_indisponibles_oi
		li_icono =ii_icono_banco_mt_ind_oi
	case fgci_tipo_parque_mt + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_parque_mt_ind_oi
	case fgci_tipo_seccionador_at + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_secci_at_ind_oi
	case fgci_tipo_seccionador_mt + ii_instalaciones_indisponibles_oi
		li_icono= ii_icono_secci_mt_ind_oi		
	// FIN GNU
	
	// GNU 9-7-2007. Mejora1/440387
	// $$HEX1$$c100$$ENDHEX$$rea de densidad en CTs
	case fgci_tipo_ct + ii_area_densidad 
		li_icono = ii_icono_ct
	case fgci_tipo_ct + 100 + ii_area_densidad 
		li_icono = ii_icono_ct_mad
	case fgci_tipo_ct + 200 + ii_area_densidad 
		li_icono = ii_icono_ct_ad
	case fgci_tipo_ct + 300 + ii_area_densidad 
		li_icono = ii_icono_ct_di
	case fgci_tipo_ct + 400 + ii_area_densidad 
		li_icono = ii_icono_ct_bd
	case fgci_tipo_ct + 500 + ii_area_densidad 
		li_icono = ii_icono_ct_mbd
	// FIN GNU

	CASE ELSE
		li_icono = -1
		
END CHOOSE

Return li_icono
end function

public function string f_devuelve_instalacion (integer pi_tipo);string ls_literal_instalacion

ls_literal_instalacion = this.picturename[pi_tipo]

return ls_literal_instalacion
end function

event constructor;///////////////////////////////////////////////////
//
//	constructor
//
//	Objetivo: Carga la lista de iconos en el treeview y actualiza 
//				el array con los nombres de los iconos
//
//	Parametros:  ---
//
//	Retorna : 1
//
// Fecha			Responsable			Actuacion
// -------		-----------			-------------------
//	5/10/99			AFE				Creacion
//      02/05/2000		SK					Modificaci$$HEX1$$f300$$ENDHEX$$n RU005_56
// 17/10/2000       ACO 			Modificaci$$HEX1$$f300$$ENDHEX$$n alta tension
////////////////////////////////////////////////////

This.DeletePictures ( )

// INSTALACIONES NORMALES

ii_icono_subestacion				= This.AddPicture("recursos/subest.bmp")
ii_icono_subestacion_alta		= This.AddPicture("recursos/SUBESTaca.bmp")
ii_icono_SAL_AT					= This.AddPicture("recursos/salat.bmp")
ii_icono_sal_MT	= This.AddPicture("recursos/sal_tra1.bmp")
ii_icono_transformador 			= This.AddPicture("recursos/transfor.bmp")
ii_icono_ct			 = This.AddPicture("recursos/ct1.bmp")
ii_icono_sal_bt			= This.AddPicture("recursos/salbaj.bmp")
ii_icono_acometida =  This.AddPicture("recursos/cl.bmp")
ii_centro_reflexion =  This.AddPicture("recursos/centroref.bmp")
ii_subramal =  This.AddPicture("recursos/ramal.bmp")

// GNU 6-10-2006. INSTALACIONES AT
ii_icono_barra_AT=  This.AddPicture("recursos/barra_at.bmp")
ii_icono_celda_AT=  This.AddPicture("recursos/celda_at.bmp")
ii_icono_interruptor_AT=  This.AddPicture("recursos/manual_at.bmp")
ii_icono_trafo_pot_AT=  This.AddPicture("recursos/transfor_pot.bmp")
ii_icono_trafo_AT=  This.AddPicture("recursos/transfor_at.bmp")
ii_icono_banco_AT=  This.AddPicture("recursos/banco_at.bmp")
ii_int_cabecera_AT=  This.AddPicture("recursos/int_cabecera_at.bmp")
ii_icono_parque_AT= This.AddPicture("recursos/parque_at.bmp")

ii_icono_barra_mt=  This.AddPicture("recursos/barra.bmp")
ii_icono_celda_mt=  This.AddPicture("recursos/celda.bmp")
ii_icono_interruptor_mt=  This.AddPicture("recursos/manual.bmp")
ii_icono_banco_mt=  This.AddPicture("recursos/banco.bmp")
ii_icono_int_cabecera_mt=  This.AddPicture("recursos/int_cabecera.bmp")
ii_icono_parque_mt= This.AddPicture("recursos/parque.bmp")
ii_icono_secci_at= This.AddPicture("recursos/secci_at.bmp")
ii_icono_secci_mt= This.AddPicture("recursos/secci.bmp")
// FIN GNU
//AHM (03/06/2009) Carga de los activos
ii_icono_grupo_activos = This.AddPicture("recursos/grupo_activo.bmp")
ii_icono_activos = This.AddPicture("recursos/activos.bmp")


// GNU 6-10-2006. INSTALACIONES AT CON INDISPONIBILIDADES
// 
ii_icono_barra_AT_ind=  This.AddPicture("recursos/n_barra_at.bmp")
ii_icono_celda_AT_ind=  This.AddPicture("recursos/n_celda_at.bmp")
ii_icono_interruptor_AT_ind=  This.AddPicture("recursos/n_manual_at.bmp")
ii_icono_trafo_pot_AT_ind=  This.AddPicture("recursos/n_transfor_pot.bmp")
ii_icono_trafo_AT_ind=  This.AddPicture("recursos/n_transfor_at.bmp")
ii_icono_banco_AT_ind=  This.AddPicture("recursos/n_banco_at.bmp")
ii_int_cabecera_AT_ind=  This.AddPicture("recursos/n_int_cabecera_at.bmp")
ii_icono_parque_AT_ind= This.AddPicture("recursos/n_parque_at.bmp")

ii_icono_barra_mt_ind=  This.AddPicture("recursos/n_barra.bmp")
ii_icono_celda_mt_ind=  This.AddPicture("recursos/n_celda.bmp")
ii_icono_interruptor_mt_ind=  This.AddPicture("recursos/n_manual.bmp")
ii_icono_banco_mt_ind=  This.AddPicture("recursos/n_banco.bmp")
ii_icono_int_cabecera_mt_ind=  This.AddPicture("recursos/n_int_cabecera.bmp")
ii_icono_parque_mt_ind= This.AddPicture("recursos/n_parque.bmp")
ii_icono_secci_at_ind= This.AddPicture("recursos/n_secci_at.bmp")
ii_icono_secci_mt_ind= This.AddPicture("recursos/n_secci.bmp")
// FIN GNU

// GNU 25-10-2006. INSTALACIONES AT CON INDISPONIBILIDADES EN OTRA INCIDENCIA
// 
ii_icono_subestac_AT_ind_oi= This.AddPicture("recursos/o_subestaca.bmp")
ii_icono_sal_AT_ind_oi= This.AddPicture("recursos/o_salta.bmp")
ii_icono_barra_AT_ind_oi=  This.AddPicture("recursos/o_barra_at.bmp")
ii_icono_celda_AT_ind_oi=  This.AddPicture("recursos/o_celda_at.bmp")
ii_icono_interruptor_AT_ind_oi=  This.AddPicture("recursos/o_manual_at.bmp")
ii_icono_trafo_pot_AT_ind_oi=  This.AddPicture("recursos/o_transfor_pot.bmp")
ii_icono_trafo_AT_ind_oi=  This.AddPicture("recursos/o_transfor_at.bmp")
ii_icono_banco_AT_ind_oi=  This.AddPicture("recursos/o_banco_at.bmp")
ii_int_cabecera_AT_ind_oi=  This.AddPicture("recursos/o_int_cabecera_at.bmp")
ii_icono_parque_AT_ind_oi= This.AddPicture("recursos/o_parque_at.bmp")

ii_icono_barra_mt_ind_oi=  This.AddPicture("recursos/o_barra.bmp")
ii_icono_celda_mt_ind_oi=  This.AddPicture("recursos/o_celda.bmp")
ii_icono_interruptor_mt_ind_oi=  This.AddPicture("recursos/o_manual.bmp")
ii_icono_banco_mt_ind_oi=  This.AddPicture("recursos/o_banco.bmp")
ii_icono_int_cabecera_mt_ind_oi=  This.AddPicture("recursos/o_int_cabecera.bmp")
ii_icono_parque_mt_ind_oi= This.AddPicture("recursos/o_parque.bmp")
ii_icono_secci_at_ind_oi= This.AddPicture("recursos/o_secci_at.bmp")
ii_icono_secci_mt_ind_oi= This.AddPicture("recursos/o_secci.bmp")
// FIN GNU

// INSTALACIONES MODIFICADAS EN UN TRABAJO

ii_icono_subestacion_mod				= This.AddPicture("recursos/tsubest.bmp")
ii_icono_sal_MT_mod	= This.AddPicture("recursos/tsal_tra1.bmp")
ii_icono_transformador_mod 			= This.AddPicture("recursos/ttransfo.bmp")
ii_icono_ct_mod			 = This.AddPicture("recursos/tct1.bmp")
ii_icono_sal_bt_mod			= This.AddPicture("recursos/tsalbaj.bmp")
ii_icono_cr_mod			 =  This.AddPicture("recursos/ncentroref.bmp")

// INSTALACIONES INTERRUMPIDAS

ii_icono_subestacion_int				= This.AddPicture("recursos/nsubest.bmp")
ii_icono_subestacion_alta_int		= This.AddPicture("recursos/nSUBESTaca.bmp")
ii_icono_SAL_AT_int					= This.AddPicture("recursos/nsalta.bmp")
ii_icono_sal_MT_int	= This.AddPicture("recursos/nsal_tra1.bmp")
ii_icono_transformador_int 			= This.AddPicture("recursos/ntransfor.bmp")
ii_icono_ct_int			 = This.AddPicture("recursos/nct1.bmp")
ii_icono_sal_bt_int			= This.AddPicture("recursos/nsalbaj.bmp")
ii_icono_cr_int			= This.AddPicture("recursos/ncentroref.bmp")
ii_icono_subramal_int			= This.AddPicture("recursos/nramal.bmp")

// INSTALACIONES REPUESTAS

ii_icono_subestacion_rep				= This.AddPicture("recursos/rsubest.bmp")
ii_icono_subestacion_alta_rep		= This.AddPicture("recursos/rSUBESTaca.bmp")
ii_icono_SAL_AT_rep					= This.AddPicture("recursos/rsalta.bmp")
ii_icono_sal_MT_rep	= This.AddPicture("recursos/rsal_tra1.bmp")
ii_icono_transformador_rep 			= This.AddPicture("recursos/rtransfor.bmp")
ii_icono_ct_rep			 = This.AddPicture("recursos/rct1.bmp")
ii_icono_sal_bt_rep			= This.AddPicture("recursos/rsalbaj.bmp")
ii_icono_cr_rep		= This.AddPicture("recursos/rcentroref.bmp")
ii_icono_subramal_rep		= This.AddPicture("recursos/rramal.bmp")

// AVISOS
ii_aviso_alumbrado_publico = This.AddPicture("recursos/alumbrado.bmp")
ii_aviso_con_alimentacion = This.AddPicture("recursos/conalim.bmp")
ii_aviso_de_ayuda = This.AddPicture("recursos/acuerdo.bmp")
ii_aviso_sin_alimentacion = This.AddPicture("recursos/cor_pro1.bmp")
ii_aviso_de_calidad = This.AddPicture("recursos/activ_im.bmp")
ii_aviso_de_calidad_sin_alim = This.AddPicture("recursos/cor_pro1.bmp")
ii_aviso_de_calidad_con_alim = This.AddPicture("recursos/conalim.bmp")

// ICONO CMD 

ii_cmd = This.AddPicture("recursos/finca.bmp")

// GNU 9-7-2007. Mejora1/440387
// $$HEX1$$c100$$ENDHEX$$rea de densidad en CTs
ii_icono_ct_mad	 = This.AddPicture("recursos/ct1mad.bmp")
ii_icono_ct_ad		 = This.AddPicture("recursos/ct1ad.bmp")
ii_icono_ct_di		 = This.AddPicture("recursos/ct1di.bmp")
ii_icono_ct_bd		 = This.AddPicture("recursos/ct1bd.bmp")
ii_icono_ct_mbd	 = This.AddPicture("recursos/ct1mbd.bmp")
// FIN GNU

// INSTALACIONES NORMALES

IF ii_icono_subestacion > 0 THEN This.PictureName[ii_icono_subestacion				]= "recursos/subest.bmp"
IF ii_icono_subestacion_alta > 0 THEN This.PictureName[ii_icono_subestacion_alta		]= "recursos/SUBESTaca.bmp"   
IF ii_icono_SAL_AT > 0 THEN This.PictureName[ii_icono_SAL_AT					]=   "recursos/salat.bmp"   
IF ii_icono_sal_MT > 0 THEN This.PictureName[ii_icono_sal_MT	]=   "recursos/sal_tra1.bmp"   
IF ii_icono_transformador > 0 THEN This.PictureName[ii_icono_transformador 			]=   "recursos/transfor.bmp"   
IF ii_icono_ct > 0 THEN This.PictureName[ii_icono_ct			 ]=   "recursos/ct1.bmp"   
IF ii_icono_sal_bt > 0 THEN This.PictureName[ii_icono_sal_bt			]=   "recursos/salbaj.bmp"   
IF ii_centro_reflexion > 0 THEN This.PictureName[ii_centro_reflexion		]=   "recursos/centroref.bmp"   
IF ii_icono_acometida > 0 THEN This.PictureName[ii_icono_acometida] =  "recursos/cl.bmp"

// GNU 6-10-2006. INSTALACIONES AT
IF ii_icono_parque_AT > 0 THEN This.PictureName [ii_icono_parque_AT]="recursos/parque_at.bmp"
IF ii_icono_barra_AT > 0  THEN This.PictureName [ii_icono_barra_AT]="recursos/barra_at.bmp"
IF ii_icono_celda_AT > 0  THEN This.PictureName [ii_icono_celda_AT]="recursos/celda_at.bmp"
IF ii_icono_interruptor_AT > 0 THEN  This.PictureName [ii_icono_interruptor_AT]="recursos/manual.bmp"
IF ii_icono_trafo_pot_AT > 0 THEN  This.PictureName [ii_icono_trafo_pot_AT]="recursos/transfor_pot.bmp"
IF ii_icono_trafo_AT > 0 THEN  This.PictureName [ii_icono_trafo_AT]= "recursos/transfor_at.bmp"
IF ii_icono_banco_AT > 0 THEN  This.PictureName [ii_icono_banco_AT]= "recursos/banco_at.bmp"
IF ii_int_cabecera_AT > 0 THEN  This.PictureName [ii_int_cabecera_AT]= "recursos/int_cabecera_at.bmp"

IF ii_icono_barra_mt> 0 THEN This.PictureName [ii_icono_barra_mt]= "recursos/barra.bmp"
IF ii_icono_celda_mt> 0 THEN This.PictureName [ii_icono_celda_mt]= "recursos/celda.bmp"
IF ii_icono_interruptor_mt> 0 THEN This.PictureName [ii_icono_interruptor_mt]= "recursos/manual.bmp"
IF ii_icono_banco_mt> 0 THEN This.PictureName [ii_icono_banco_mt]= "recursos/banco.bmp"
IF ii_icono_int_cabecera_mt> 0 THEN This.PictureName [ii_icono_int_cabecera_mt]="recursos/int_cabecera.bmp"
IF ii_icono_parque_mt > 0 THEN This.PictureName [ii_icono_parque_mt]="recursos/parque.bmp"
IF ii_icono_secci_at > 0 THEN This.PictureName [ii_icono_secci_at]="recursos/secci_at.bmp"
IF ii_icono_secci_mt > 0 THEN This.PictureName [ii_icono_secci_mt]="recursos/secci.bmp"
// FIN GNU

// GNU 6-10-2006. INSTALACIONES AT CON INDISPONIBILIDADES
IF ii_icono_barra_AT_ind > 0  THEN This.PictureName [ii_icono_barra_AT_ind]="recursos/n_barra_at.bmp"
IF ii_icono_celda_AT_ind > 0  THEN This.PictureName [ii_icono_celda_AT_ind]="recursos/n_celda_at.bmp"
IF ii_icono_interruptor_AT_ind > 0 THEN  This.PictureName [ii_icono_interruptor_AT_ind]="recursos/n_manual.bmp"
IF ii_icono_trafo_pot_AT_ind > 0 THEN  This.PictureName [ii_icono_trafo_pot_AT_ind]="recursos/n_transfor_pot.bmp"
IF ii_icono_trafo_AT_ind > 0 THEN  This.PictureName [ii_icono_trafo_AT_ind]= "recursos/n_transfor_at.bmp"
IF ii_icono_banco_AT_ind > 0 THEN  This.PictureName [ii_icono_banco_AT_ind]= "recursos/n_banco_at.bmp"
IF ii_int_cabecera_AT_ind > 0 THEN  This.PictureName [ii_int_cabecera_AT_ind]= "recursos/n_int_cabecera_at.bmp"
IF ii_icono_parque_AT_ind > 0 THEN This.PictureName [ii_icono_parque_AT_ind]="recursos/n_parque_at.bmp"

IF ii_icono_barra_mt_ind> 0  THEN This.PictureName [ii_icono_barra_mt_ind]= "recursos/n_barra.bmp"
IF ii_icono_celda_mt_ind> 0  THEN This.PictureName [ii_icono_celda_mt_ind]= "recursos/n_celda.bmp"
IF ii_icono_interruptor_mt_ind> 0  THEN This.PictureName [ii_icono_interruptor_mt_ind]="recursos/n_manual.bmp"
IF ii_icono_banco_mt_ind> 0  THEN This.PictureName [ii_icono_banco_mt_ind]= "recursos/n_banco.bmp"
IF ii_icono_int_cabecera_mt_ind> 0  THEN This.PictureName [ii_icono_int_cabecera_mt_ind]= "recursos/n_int_cabecera.bmp"
IF ii_icono_parque_mt_ind > 0 THEN This.PictureName [ii_icono_parque_mt_ind]="recursos/n_parque.bmp"
IF ii_icono_secci_at_ind > 0 THEN This.PictureName [ii_icono_secci_at_ind]="recursos/n_secci_at.bmp"
IF ii_icono_secci_mt_ind > 0 THEN This.PictureName [ii_icono_secci_mt_ind]="recursos/n_secci.bmp"
// FIN GNU

// GNU 6-10-2006. INSTALACIONES AT CON INDISPONIBILIDADES
IF ii_icono_subestac_AT_ind_oi> 0 THEN This.PictureName[ii_icono_subestac_AT_ind_oi]="recursos/o_subestaca.bmp"
IF ii_icono_sal_AT_ind_oi>0 THEN  This.PictureName[ii_icono_sal_AT_ind_oi]="recursos/o_salta.bmp"
IF ii_icono_barra_AT_ind_oi > 0  THEN This.PictureName [ii_icono_barra_AT_ind_oi]="recursos/o_barra_at.bmp"
IF ii_icono_celda_AT_ind_oi > 0  THEN This.PictureName [ii_icono_celda_AT_ind_oi]="recursos/o_celda_at.bmp"
IF ii_icono_interruptor_AT_ind_oi > 0 THEN  This.PictureName [ii_icono_interruptor_AT_ind_oi]="recursos/o_manual.bmp"
IF ii_icono_trafo_pot_AT_ind_oi > 0 THEN  This.PictureName [ii_icono_trafo_pot_AT_ind_oi]="recursos/o_transfor_pot.bmp"
IF ii_icono_trafo_AT_ind_oi > 0 THEN  This.PictureName [ii_icono_trafo_AT_ind_oi]= "recursos/o_transfor_at.bmp"
IF ii_icono_banco_AT_ind_oi > 0 THEN  This.PictureName [ii_icono_banco_AT_ind_oi]= "recursos/o_banco_at.bmp"
IF ii_int_cabecera_AT_ind_oi > 0 THEN  This.PictureName [ii_int_cabecera_AT_ind_oi]= "recursos/o_int_cabecera_at.bmp"
IF ii_icono_parque_AT_ind_oi > 0 THEN This.PictureName [ii_icono_parque_AT_ind_oi]="recursos/o_parque_at.bmp"

IF ii_icono_barra_mt_ind_oi> 0 THEN This.PictureName[ii_icono_barra_mt_ind_oi]="recursos/o_barra.bmp"
IF ii_icono_celda_mt_ind_oi> 0 THEN This.PictureName[ii_icono_celda_mt_ind_oi]="recursos/o_celda.bmp"
IF ii_icono_interruptor_mt_ind_oi> 0 THEN This.PictureName[ii_icono_interruptor_mt_ind_oi]="recursos/o_manual.bmp"
IF ii_icono_banco_mt_ind_oi> 0 THEN This.PictureName[ii_icono_banco_mt_ind_oi]="recursos/o_banco.bmp"
IF ii_icono_int_cabecera_mt_ind_oi> 0 THEN This.PictureName[ii_icono_int_cabecera_mt_ind_oi]="recursos/o_int_cabecera.bmp"
IF ii_icono_parque_mt_ind_oi > 0 THEN This.PictureName [ii_icono_parque_mt_ind_oi]="recursos/o_parque.bmp"
IF ii_icono_secci_at_ind_oi > 0 THEN This.PictureName [ii_icono_secci_at_ind_oi]="recursos/o_secci_at.bmp"
IF ii_icono_secci_mt_ind_oi > 0 THEN This.PictureName [ii_icono_secci_mt_ind_oi]="recursos/o_secci.bmp"
// FIN GNU

// INSTALACIONES MODIFICADAS EN UN TRABAJO

IF ii_icono_subestacion_mod > 0 THEN This.PictureName[ii_icono_subestacion_mod				]=   "recursos/tsubest.bmp"   
IF ii_icono_sal_MT_mod > 0 THEN This.PictureName[ii_icono_sal_MT_mod	]=   "recursos/tsal_tra1.bmp"   
IF ii_icono_transformador_mod > 0 THEN This.PictureName[ii_icono_transformador_mod 			]=   "recursos/ttransfo.bmp"   
IF ii_icono_ct_mod > 0 THEN This.PictureName[ii_icono_ct_mod			 ]=   "recursos/tct1.bmp"   
IF ii_icono_sal_bt_mod > 0 THEN This.PictureName[ii_icono_sal_bt_mod			]=   "recursos/tsalbaj.bmp"   
IF ii_icono_cr_mod > 0 THEN This.PictureName[ii_icono_cr_mod			]=   "recursos/ncentroref.bmp"   

// INSTALACIONES INTERRUMPIDAS

IF ii_icono_subestacion_int > 0 THEN This.PictureName[ii_icono_subestacion_int				]=   "recursos/nsubest.bmp"   
IF ii_icono_subestacion_alta_int > 0 THEN This.PictureName[ii_icono_subestacion_alta_int		]=   "recursos/nSUBESTaca.bmp"   
IF ii_icono_SAL_AT_int > 0 THEN This.PictureName[ii_icono_SAL_AT_int					]=   "recursos/nsalta.bmp"   
IF ii_icono_sal_MT_int > 0 THEN This.PictureName[ii_icono_sal_MT_int	]=   "recursos/nsal_tra1.bmp"   
IF ii_icono_transformador_int > 0 THEN This.PictureName[ii_icono_transformador_int 			]=   "recursos/ntransfor.bmp"   
IF ii_icono_ct_int > 0 THEN This.PictureName[ii_icono_ct_int			 ]=   "recursos/nct1.bmp"   
IF ii_icono_sal_bt_int > 0 THEN This.PictureName[ii_icono_sal_bt_int			]=   "recursos/nsalbaj.bmp"   
IF ii_icono_cr_int > 0 THEN This.PictureName[ii_icono_cr_int			]=   "recursos/ncentroref.bmp"   

// INSTALACIONES REPUESTAS

IF ii_icono_subestacion_rep > 0 THEN This.PictureName[ii_icono_subestacion_rep				]=   "recursos/rsubest.bmp"   
IF ii_icono_subestacion_alta_rep > 0 THEN This.PictureName[ii_icono_subestacion_alta_rep		]=   "recursos/rSUBESTaca.bmp"   
IF ii_icono_SAL_AT_rep > 0 THEN This.PictureName[ii_icono_SAL_AT_rep					]=   "recursos/rsalta.bmp"   
IF ii_icono_sal_MT_rep > 0 THEN This.PictureName[ii_icono_sal_MT_rep	]=   "recursos/rsal_tra1.bmp"   
IF ii_icono_transformador_rep > 0 THEN This.PictureName[ii_icono_transformador_rep 			]=   "recursos/rtransfor.bmp"   
IF ii_icono_ct_rep > 0 THEN This.PictureName[ii_icono_ct_rep			 ]=   "recursos/rct1.bmp"   
IF ii_icono_sal_bt_rep > 0 THEN This.PictureName[ii_icono_sal_bt_rep			]=   "recursos/rsalbaj.bmp"   
IF ii_icono_cr_rep > 0 THEN This.PictureName[ii_icono_cr_rep			]=   "recursos/rcentroref.bmp"   

// AVISOS
IF ii_aviso_alumbrado_publico > 0 THEN This.PictureName[ii_aviso_alumbrado_publico ]=   "recursos/alumbrado.bmp"   
IF ii_aviso_con_alimentacion > 0 THEN This.PictureName[ii_aviso_con_alimentacion ]=   "recursos/conalim.bmp"   
IF ii_aviso_de_ayuda > 0 THEN This.PictureName[ii_aviso_de_ayuda ]=   "recursos/acuerdo.bmp"   
IF ii_aviso_sin_alimentacion > 0 THEN This.PictureName[ii_aviso_sin_alimentacion ]=   "recursos/cor_pro1.bmp"   
IF ii_aviso_de_calidad > 0 THEN This.PictureName[ii_aviso_de_calidad ]=   "recursos/activ_im.bmp"   
IF ii_aviso_de_calidad_sin_alim > 0 THEN This.PictureName[ii_aviso_de_calidad_sin_alim ]=   "recursos/cor_pro1.bmp"   
IF ii_aviso_de_calidad_con_alim > 0 THEN This.PictureName[ii_aviso_de_calidad_con_alim ]=   "recursos/conalim.bmp"   

IF ii_cmd > 0 THEN This.PictureName[ii_cmd]=   "recursos/finca.bmp" 

// GNU 9-7-2007. Mejora1/440387
// $$HEX1$$c100$$ENDHEX$$rea de densidad en CTs
IF ii_icono_ct_mad > 0 THEN This.PictureName[ii_icono_ct_mad	 ]=   "recursos/ct1mad.bmp"  
IF ii_icono_ct_ad > 0 THEN This.PictureName[ii_icono_ct_ad		 ]=   "recursos/ct1ad.bmp"   
IF ii_icono_ct_di > 0 THEN This.PictureName[ii_icono_ct_di		 ]=   "recursos/ct1di.bmp"   
IF ii_icono_ct_bd > 0 THEN This.PictureName[ii_icono_ct_bd		 ]=   "recursos/ct1bd.bmp"   
IF ii_icono_ct_mbd > 0 THEN This.PictureName[ii_icono_ct_mbd	 ]=   "recursos/ct1mbd.bmp"   
// FIN GNU

IF gb_mensaje_instalac_error = FALSE THEN
	IF ii_icono_subestacion_alta<0 OR ii_icono_sal_MT<0 OR ii_icono_subestacion<0 OR ii_icono_transformador<0 OR &
		ii_icono_sal_BT<0 OR ii_icono_SAL_AT<0 OR ii_icono_ct<0 OR ii_icono_acometida<0 OR ii_centro_reflexion<0 OR &
		ii_icono_sal_MT_mod<0 OR ii_icono_subestacion_mod<0 OR ii_icono_transformador_mod<0 OR ii_icono_sal_BT_mod<0 OR &
		ii_icono_ct_mod<0 OR ii_icono_cr_mod<0 OR ii_icono_subestacion_alta_int<0 OR ii_icono_sal_MT_int<0 OR &
		ii_icono_subestacion_int<0 OR ii_icono_transformador_int<0 OR ii_icono_sal_BT_int<0 OR ii_icono_SAL_AT_int<0 OR &
		ii_icono_ct_int<0 OR ii_icono_cr_int<0 OR ii_icono_subestacion_alta_rep<0 OR ii_icono_sal_MT_rep<0 OR &
		ii_icono_subestacion_rep<0 OR ii_icono_transformador_rep<0 OR ii_icono_sal_BT_rep<0 OR ii_icono_SAL_AT_rep<0 OR &
		ii_icono_ct_rep<0 OR ii_icono_cr_rep<0 OR ii_aviso_alumbrado_publico<0 OR ii_aviso_con_alimentacion<0 OR &
		ii_aviso_de_ayuda<0 OR ii_aviso_sin_alimentacion<0 OR ii_aviso_de_calidad<0 OR ii_aviso_de_calidad_sin_alim<0 OR &
		ii_aviso_de_calidad_con_alim<0 OR ii_cmd<0 THEN
		
		This.PostEvent("ue_error")
	END IF
END IF	
	

end event

on uo_man_instalac.create
end on

on uo_man_instalac.destroy
end on


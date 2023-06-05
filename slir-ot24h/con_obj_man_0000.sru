HA$PBExportHeader$con_obj_man_0000.sru
forward
global type con_obj_man_0000 from gen_obj_0000
end type
end forward

global type con_obj_man_0000 from gen_obj_0000
end type
global con_obj_man_0000 con_obj_man_0000

type variables
gen_int_stt_0001 int_stt
gen_int_dir_0002  int_dir


end variables

forward prototypes
public subroutine incidencia ()
public function string key (string tabla)
end prototypes

public subroutine incidencia ();long ll_nro_brigada 



ll_nro_brigada = d_source.getitemnumber(currentrow,"nro_contrata")

if ll_nro_brigada > 0 then
	
  SELECT "GI_OT"."NRO_INCIDENCIA"  
    INTO :gu_comunic.is_comunic.longval3
    FROM "GI_CONTRATA_OT" A,   
         "GI_OT"  
   WHERE ( A."NRO_OT" = "GI_OT"."NRO_OT" ) and  
         ( A."NRO_CONTRATA" = :ll_nro_brigada )	and 
			( A."F_HASTA" IS NULL);

	if sqlca.sqlcode <> 100 and &
		 not isnull(gu_comunic.is_comunic.longval3) and &
						gu_comunic.is_comunic.longval3 > 0  then
						
		gu_comunic.is_comunic.programa_llamante="w_1234_consulta_incidencia" 
		gu_comunic.is_comunic.Accion_llamada = "Consulta"
		
		gu_control_v_incidencias.of_abre_ventana(gu_comunic.is_comunic.longval3,-1,w_operaciones,0)
//		OpenSheet(w_2301_form_incidencia,w_operaciones,0,Layered!)		
	else		
		gnv_msg.f_mensaje( "AI143","","",OK!)	
	end if

end if
end subroutine

public function string key (string tabla);return tabla + '.nro_contrata = ' + string(GetItemNumber('nro_contrata'))
end function

on con_obj_man_0000.create
TriggerEvent( this, "constructor" )
end on

on con_obj_man_0000.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;call super::constructor; int_stt = Create	gen_int_stt_0001
 int_dir = Create	gen_int_dir_0002
 int_dir.init(this) 
 int_stt.init(this) 
end event

event default;call super::default;d_source.SetItem(currentrow,'nro_contrata',fg_obtener_ultimo('GI_CONTRATAS','u_con_0001'))
d_source.SetItem(currentrow,'estado',1)
d_source.SetItem(currentrow,'tipo',1)

end event

event acceptvalues;call super::acceptvalues;if not IsNull(d_source.object.coste[currentrow]) or &
	not IsNull(d_source.object.moneda[currentrow]) or &
	not IsNull(d_source.object.cod_tiempo[currentrow]) then
	
	if IsNull(d_source.object.coste[currentrow]) or &
		IsNull(d_source.object.moneda[currentrow]) or &
		IsNull(d_source.object.cod_tiempo[currentrow]) then	
			gnv_msg.f_mensaje( "EC01","","",OK!)	
			return -1		
	end if					
	
end if		

return 0

end event

event edit;call super::edit;openwithparm(w_con_0002_ing_contratas,this)
end event


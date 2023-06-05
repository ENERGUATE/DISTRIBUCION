HA$PBExportHeader$gen_int_dir_0002.sru
forward
global type gen_int_dir_0002 from gen_int_0001
end type
end forward

type s_dir from structure
	long		cod_prov
	long		cod_depto
	long		cod_munic
	long		cod_local
	string		nom_prov
	string		nom_depto
	string		nom_munic
	string		nom_local
	string		nom_calle
	string		duplicador
	string		cgv
	long		num_puerta
end type

global type gen_int_dir_0002 from gen_int_0001
end type
global gen_int_dir_0002 gen_int_dir_0002

forward prototypes
public function string key (string tabla)
public subroutine setdireccion (ref s_direccion_cliente direccion)
public subroutine getdireccion (ref s_direccion_cliente direccion)
public subroutine int_w_id0100out (ref s_direccion_cliente pstruct)
public function integer find (string nom_calle)
public subroutine int_w_id0100in (string nom_calle)
public function integer acceptvalues ()
public subroutine int_w_id0100in_g ()
public function integer view_global (ref s_dir s_dir)
end prototypes

public function string key (string tabla);return tabla + '.cod_calle = ' + string(io_obj.GetItemNumber('cod_calle'))
end function

public subroutine setdireccion (ref s_direccion_cliente direccion);string strnull

SetNull(strnull)

if len(direccion.gs_pisodpto ) > 0 then
	io_obj.SetItem('cgv',direccion.gs_pisodpto)
else
	io_obj.SetItem('cgv',strnull)
end if

if len(direccion.gs_duplic ) > 0 then
	io_obj.SetItem('duplicador',direccion.gs_duplic)  	
else
	io_obj.SetItem('duplicador',strnull)  
end if


io_obj.SetItem('num_puerta',direccion.gl_numero)
io_obj.SetItem('cod_calle',direccion.gl_codcalle)

end subroutine

public subroutine getdireccion (ref s_direccion_cliente direccion);direccion.gs_pisodpto  = io_obj.GetItemString('cgv')
direccion.gs_duplic    = io_obj.GetItemString('duplicador')
direccion.gl_numero    = io_obj.GetItemNumber('num_puerta')
direccion.gl_codcalle  = io_obj.GetItemNumber('cod_calle')

end subroutine

public subroutine int_w_id0100out (ref s_direccion_cliente pstruct);        io_obj.SetItem('cod_prov', pstruct.gl_codprov 	) 
        io_obj.SetItem('cod_depto',pstruct.gl_coddepto)
        io_obj.SetItem('cod_munic',pstruct.gl_codmun  )
        io_obj.SetItem('cod_local',pstruct.gl_codloc  )

        io_obj.SetItem('nom_prov', pstruct.gs_prov )   
        io_obj.SetItem('nom_depto',pstruct.gs_depto)
        io_obj.SetItem('nom_munic',pstruct.gs_munic)
        io_obj.SetItem('nom_local',pstruct.gs_local)
        io_obj.SetItem('nom_calle',pstruct.gs_calle)
		  
		  setdireccion(pstruct)



end subroutine

public function integer find (string nom_calle);	s_direccion_cliente			is_direccion

	int_w_id0100in(nom_calle)	
	open(w_id0100) 
	is_direccion = Message.PowerObjectParm
   IF is_direccion.gl_codcalle > 0 THEN
		int_w_id0100out(is_direccion)	
		return 0
	else
		return -1
	end if




end function

public subroutine int_w_id0100in (string nom_calle);if IsnULL(nom_calle) OR len(nom_calle) = 0 then
		parmstr6 = io_obj.GetItemString('nom_calle')
else
		parmstr6 = nom_calle
end if
int_w_id0100in_g()


end subroutine

public function integer acceptvalues ();long cod_calle

cod_calle = io_obj.GetItemNumber ('cod_calle')
if IsNull(cod_calle ) or cod_calle = 0 then	
		gnv_msg.f_mensaje( "EC02","","",OK!)	
		return -1		
end if		

return 0
end function

public subroutine int_w_id0100in_g ();
	gu_comunic.is_comunic.intval1 =  io_obj.GetItemNumber('cod_prov')
	gu_comunic.is_comunic.intval2 =  io_obj.GetItemNumber('cod_depto')
	gu_comunic.is_comunic.longval4 = io_obj.GetItemNumber('cod_munic')
	gu_comunic.is_comunic.longval5 = io_obj.GetItemNumber('cod_local')

	gu_comunic.is_comunic.strval1 =  io_obj.GetItemString('nom_prov' )
	gu_comunic.is_comunic.strval2 =  io_obj.GetItemString('nom_depto')
	gu_comunic.is_comunic.strval3 =  io_obj.GetItemString('nom_munic')
	gu_comunic.is_comunic.strval4 =  io_obj.GetItemString('nom_local')



end subroutine

public function integer view_global (ref s_dir s_dir);//parmstr6 = io_obj.GetItemString('nom_calle')
//parmstr7 = string(io_obj.GetItemNumber('num_puerta'))
//parmstr8 = io_obj.GetItemString('duplicador')
//parmstr9 = io_obj.GetItemString('cgv')
  	s_dir.nom_calle = 		 parmstr6
	s_dir.num_puerta=        long(parmstr7)
	s_dir.duplicador=        parmstr8
  	s_dir.cgv       =        parmstr9

	s_dir.cod_prov	=  gu_comunic.is_comunic.intval1 
	s_dir.cod_depto =  gu_comunic.is_comunic.intval2 
	s_dir.cod_munic =  gu_comunic.is_comunic.longval4
	s_dir.cod_local =  gu_comunic.is_comunic.longval5
	                                                 
	s_dir.nom_prov  =  gu_comunic.is_comunic.strval1 
	s_dir.nom_depto =  gu_comunic.is_comunic.strval2 
	s_dir.nom_munic =  gu_comunic.is_comunic.strval3 
	s_dir.nom_local =  gu_comunic.is_comunic.strval4 

	return 1
end function

on gen_int_dir_0002.create
TriggerEvent( this, "constructor" )
end on

on gen_int_dir_0002.destroy
TriggerEvent( this, "destructor" )
end on


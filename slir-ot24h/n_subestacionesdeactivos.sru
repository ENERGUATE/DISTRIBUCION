HA$PBExportHeader$n_subestacionesdeactivos.sru
forward
global type n_subestacionesdeactivos from nonvisualobject
end type
end forward

global type n_subestacionesdeactivos from nonvisualobject
end type
global n_subestacionesdeactivos n_subestacionesdeactivos

forward prototypes
public function long uf_get_subestacion_bahia (long pl_cod_activo)
public function long uf_get_subestacion_linea (long pl_cod_activo)
public function long uf_get_subestacion_trafo_pot (long pl_cod_activo)
public function long uf_get_subestacion_barra (long pl_cod_activo)
public function long uf_get_subestacion_eq_compensacion (long pl_cod_activo)
public function long uf_get_subestacion (long pl_cod_activo)
end prototypes

public function long uf_get_subestacion_bahia (long pl_cod_activo);long ll_cod_subestacion = 0


SELECT NVL (C.INSTALACION_ORIGEN, 0)
  INTO :ll_cod_subestacion
  FROM BDIV10_BDI_CELDA_AT C, 
       BDIV10_BAHIA_CORTE B
 WHERE C.CODIGO = B.CELDA_OPEN
   AND B.ACTIVO_OPEN = :pl_cod_activo; 
	
	

if isnull(ll_cod_subestacion) then 
	ll_cod_subestacion = 0 
end if


return ll_cod_subestacion
end function

public function long uf_get_subestacion_linea (long pl_cod_activo);
long ll_cod_subestacion = 0


SELECT INSTALACION_ORIGEN
  INTO :ll_cod_subestacion
  FROM BDIV10_SGD_SALAT
 WHERE ACTIVO= :pl_cod_activo; 
	

if isnull(ll_cod_subestacion) then 
	ll_cod_subestacion = 0 
end if


return ll_cod_subestacion
end function

public function long uf_get_subestacion_trafo_pot (long pl_cod_activo);
long ll_cod_subestacion = 0


if gi_pais = 7 then
	SELECT INSTALACION_ORIGEN
  INTO :ll_cod_subestacion
  FROM BDIV10_SGD_TRAFO_AM
 WHERE ACTIVO = :pl_cod_activo; 
	

	if isnull(ll_cod_subestacion) then 
		ll_cod_subestacion = 0 
	end if
end if

if gi_pais = 6 then
	
	SELECT INSTALACION_ORIGEN
	  INTO :ll_cod_subestacion
	  FROM BDIV10_SGD_TRAFO_POT
	 WHERE ACTIVO = :pl_cod_activo; 
		
	
	if isnull(ll_cod_subestacion) then 
		ll_cod_subestacion = 0 
	end if
end if

return ll_cod_subestacion
end function

public function long uf_get_subestacion_barra (long pl_cod_activo);
long ll_cod_subestacion = 0


SELECT INSTALACION_ORIGEN
  INTO :ll_cod_subestacion
  FROM BDIV10_BDI_BARRA_AT
 WHERE ACTIVO = :pl_cod_activo; 
	

if isnull(ll_cod_subestacion) then 
	ll_cod_subestacion = 0 
end if


return ll_cod_subestacion
end function

public function long uf_get_subestacion_eq_compensacion (long pl_cod_activo);
long ll_cod_subestacion = 0


IF GI_PAIS = 7 THEN 
	SELECT INSTALACION_ORIGEN
	  INTO :ll_cod_subestacion
	  FROM BDIV10_BDI_BANCO_AT
	 WHERE ACTIVO = :pl_cod_activo; 		

	if isnull(ll_cod_subestacion) then 
		ll_cod_subestacion = 0 
	end if
END IF

// Se anula. Para EPSA no hay equipos de compensaci$$HEX1$$f300$$ENDHEX$$n
//IF GI_PAIS = 6 THEN 
//SELECT INSTALACION_ORIGEN
//  INTO :ll_cod_subestacion
//  FROM BDIV10_BDI_BARRA_AT
// WHERE ACTIVO = :pl_cod_activo; 
//	
//
//if isnull(ll_cod_subestacion) then 
//	ll_cod_subestacion = 0 
//end if
//
//END IF

return ll_cod_subestacion
end function

public function long uf_get_subestacion (long pl_cod_activo);

long pl_cod_subestacion = 0

pl_cod_subestacion = uf_get_subestacion_bahia(pl_cod_activo)

if pl_cod_subestacion = 0 then 
	pl_cod_subestacion = uf_get_subestacion_linea(pl_cod_activo)
end if

if pl_cod_subestacion = 0 then 
	pl_cod_subestacion = uf_get_subestacion_trafo_pot(pl_cod_activo)
end if

if pl_cod_subestacion = 0 then 
	pl_cod_subestacion = uf_get_subestacion_barra(pl_cod_activo)
end if

//if pl_cod_subestacion = 0 then 
//	pl_cod_subestacion = uf_get_subestacion_eq_compensacion(pl_cod_activo)
//end if

return pl_cod_subestacion



end function

on n_subestacionesdeactivos.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_subestacionesdeactivos.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;


long ll_rows, ll_cont, ll_cod_activo, ll_cod_subestacion
long ll_status
datastore lds_activos

lds_activos = CREATE datastore
lds_activos.dataobject = 'd_subestaciones_de_activo'
lds_activos.SetTransObject(SQLCA)
lds_activos.Retrieve()

ll_rows = lds_activos.RowCount()

for ll_cont = 1 to ll_rows
	if isnull(lds_activos.object.cod_subestac_at[ll_cont]) then 
		ll_cod_activo = lds_activos.object.nro_instalacion[ll_cont]
		if ll_cod_activo = 55550113 then 
			ll_status = 1
		end if
		ll_cod_subestacion = uf_get_subestacion(ll_cod_activo)
		if ll_cod_subestacion <> 0 then 
			lds_activos.object.cod_subestac_at[ll_cont] = ll_cod_subestacion
			lds_activos.object.nro_inst_padre[ll_cont] = ll_cod_subestacion
			
			ll_status = lds_activos.Update()
			commit;
			
		end if
				
	end if 
end for
	
DESTROY lds_activos	
end event


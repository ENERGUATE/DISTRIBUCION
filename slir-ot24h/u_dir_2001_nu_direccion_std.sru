HA$PBExportHeader$u_dir_2001_nu_direccion_std.sru
forward
global type u_dir_2001_nu_direccion_std from datawindow
end type
end forward

global type u_dir_2001_nu_direccion_std from datawindow
end type
global u_dir_2001_nu_direccion_std u_dir_2001_nu_direccion_std

forward prototypes
public function integer fnu_obtener_datos ()
public function integer fnu_poner_datos_en_uo_calle (long pl_calle, integer pi_numero, string ps_duplic, string ps_cgv)
public function integer fnu_poner_datos_en_uo_manual ()
public function integer fnu_poner_datos_en_uo_nif (long pl_nif)
public function integer fnu_poner_datos_en_uo_nis (long pl_nis)
public function integer fnu_obtener_finca (ref datawindow pdw_direccion)
public function integer fnu_suministros_de_finca (long pl_nro_finca)
public function integer fnu_o_datos (ref datawindow pdw_dir, long pl_cod_calle)
public function integer fnu_datos_por_acom (ref datawindow pd_dw, long pl_nro_acom)
end prototypes

public function integer fnu_obtener_datos ();//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_obtener_datos
// 
// Objetivo: Conecci$$HEX1$$f300$$ENDHEX$$n a la base de datos y retrieve de la datawindow
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: --
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////
this.SetTransObject(sqlca)
this.Retrieve()
this.SetRowFocusIndicator(Hand!)
this.SetFocus()

return 1
end function

public function integer fnu_poner_datos_en_uo_calle (long pl_calle, integer pi_numero, string ps_duplic, string ps_cgv);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_poner_datos_en_uo_calle
// 
// Objetivo:	Carga los datos del userobject cuando recibe como par$$HEX1$$e100$$ENDHEX$$metro
//	el codigo de calle
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  cod_calle, numero, duplicador, cgv
//	Salida:   --
//						
// Devuelve:	codigo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	 14/7/95			SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int i_result

i_result =  this.Retrieve(pl_calle)

IF i_result = 1 THEN
	this.SetItem(1,"numero",pi_numero)
	this.SetItem(1,"duplic",ps_duplic)
	this.SetItem(1,"cgv",ps_cgv)
END IF

RETURN i_result
end function

public function integer fnu_poner_datos_en_uo_manual ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_poner_datos_en_uo_manual
// 
// Objetivo:	Carga los datos del userobject a partir de los datos que se
//	reciben en esta funcion (retorna 1)
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada: calle, numero, duplicador, cgv, localidad, municipio, depto
//	Salida:   --
//						
// Devuelve:	codigo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
//  -----     -----------  ---------
//
////////////////////////////////////////////////////////////////////////////////////////////////

RETURN 1
end function

public function integer fnu_poner_datos_en_uo_nif (long pl_nif);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_traer_datos_nif
// 
// Objetivo:	Carga los datos del userobject (la direccion) cuando recibe
// como par$$HEX1$$e100$$ENDHEX$$metro	el codigo de la finca
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  nif
//	Salida:   --
//						
// Devuelve:	codigo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	 14/7/95			SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

string 	s_duplic
long 		l_cod_calle
int  		i_numero

//Selecciona los datos de la finca
SELECT COD_CALLE, NUM_PUERTA, DUPLICADOR
	INTO :l_cod_calle, :i_numero, :s_duplic
	FROM FINCAS
	WHERE NIF = :pl_nif;

//llamar a error
// RETURN  -1

RETURN this.fnu_poner_datos_en_uo_calle(l_cod_calle, i_numero, s_duplic, "")


end function

public function integer fnu_poner_datos_en_uo_nis (long pl_nis);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	f_poner_datos_en_uo_nis
// 
// Objetivo:	Carga los datos del userobject (la direccion) cuando recibe
// como par$$HEX1$$e100$$ENDHEX$$metro	el codigo del suministro
//	
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:  nis
//	Salida:   --
//						
// Devuelve:	codigo de error
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	 14/7/95			SAS		Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////


string 	s_duplic, s_cgv
long 		l_cod_calle
int  		i_numero

//Selecciona los datos de la finca
SELECT COD_CALLE, NUM_PUERTA, DUPLICADOR, CGV_SUM
	INTO :l_cod_calle, :i_numero, :s_duplic, :s_cgv
	FROM SUMCON, FINCAS
	WHERE FINCAS.NIF = SUMCON.NIF AND
			SUMCON.NIS_RAD = :pl_nis;

//llamar a error
// RETURN  -1

RETURN this.fnu_poner_datos_en_uo_calle(l_cod_calle, i_numero, s_duplic, s_cgv)



end function

public function integer fnu_obtener_finca (ref datawindow pdw_direccion);
//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : frn_obtener_finca
// 
// Objetivo: Obtiene todas las fincas de la calle o las que cumplan 
//           con alg$$HEX1$$fa00$$ENDHEX$$n criterio de selecci$$HEX1$$f300$$ENDHEX$$n.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pdw_direccion
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

string ls_nom_calle
long ll_cod_calle, ll_nro_finca
int li_contador

SetPointer(HourGlass!)

ls_nom_calle = pdw_direccion.GetItemString(1,"calle")
ll_nro_finca = 0

SELECT Count(*) INTO :li_contador
  	FROM "CALLEJERO"  
  	WHERE "CALLEJERO"."NOM_CALLE" = :ls_nom_calle;

IF li_contador  > 0 THEN

	DECLARE c_obtener_cod_calles CURSOR FOR  
		SELECT "CALLEJERO"."COD_CALLE"
	  	FROM "CALLEJERO"  
	  	WHERE "CALLEJERO"."NOM_CALLE" = :ls_nom_calle
		USING sqlca;
	
	OPEN c_obtener_cod_calles;
	
	FETCH c_obtener_cod_calles INTO :ll_cod_calle;

	IF li_contador = 1 THEN
		//	Traigo las fincas que corresponden al cod_calle,numero y duplic pasados.		
		//	Si existen m$$HEX1$$e100$$ENDHEX$$s de una, las traigo en una lista y permito seleccionarla.
		// Si el n$$HEX1$$fa00$$ENDHEX$$mero y/o el duplic no se encuentran, traigo todas las fincas de la calle.
//		IF sqlca.SqlCode = 0 THEN
//			
//			MessageBox("Mensaje del Sistema","Existe por lo menos un dato devuelto")
//		END IF
//
	ELSE
		//	Rutina de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica tal cual.	
		OpenSheetWithParm(w_id0100,"Calle",w_1201_recepcion_aviso,2,Layered!)
	END IF

	CLOSE c_obtener_cod_calles ;

ELSE
	//	Rutina de identificaci$$HEX1$$f300$$ENDHEX$$n geogr$$HEX1$$e100$$ENDHEX$$fica tal cual.
	OpenSheetWithParm(w_id0100,"Calle",w_1201_recepcion_aviso,2,Layered!)
END IF

RETURN ll_nro_finca

end function

public function integer fnu_suministros_de_finca (long pl_nro_finca);//////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n : fnu_suministros_de_finca
// 
// Objetivo: Obtiene suministro de finca por procedimientos almacenados.
//
// Ambito: P$$HEX1$$fa00$$ENDHEX$$blico
// 
// Par$$HEX1$$e100$$ENDHEX$$metros:
//			Entrada: pl_nro_finca
//       Salida: --
//
// Devuelve:
//
// Fecha		Responsable		Actuaci$$HEX1$$f300$$ENDHEX$$n
// -----		-----------		---------
//
////////////////////////////////////////////////////////////

long ll_nis_rad

ll_nis_rad = 0

//Si existe un solo suministro en la finca
//	Procedimiento Almacenado "Datos_Suministro"
//Sino
//	Muestro lista de suministros para la finca a efectos de que se seleccione uno
//	Si se seleccion$$HEX2$$f3002000$$ENDHEX$$un suministro
//		Procedimiento Almacenado "Datos_Suministro
//	Finsi
//Finsi


RETURN ll_nis_rad

end function

public function integer fnu_o_datos (ref datawindow pdw_dir, long pl_cod_calle);////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: 	fnu_o_datos
// 
// Objetivo:	Realiza la conexi$$HEX1$$f300$$ENDHEX$$n de la D.W. a la B.D. y trae los datos
//					filtrados por el valor del par$$HEX1$$e100$$ENDHEX$$metro pasado. (pl_cod_calle)
//
// Ambito:	P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//	Entrada:		pdw_dir (datawindow con la inf. resumen de la direcci$$HEX1$$f300$$ENDHEX$$n)
//					pl_cod_calle (c$$HEX1$$f300$$ENDHEX$$digo de la calle por la cual quiero filtrar)
//
//	Salida:  -- 
//						
// Devuelve:	1 
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	15/03/96		HMA 			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

pdw_dir.SetTransObject(sqlca)
pdw_dir.Retrieve(pl_cod_calle)


RETURN 1
end function

public function integer fnu_datos_por_acom (ref datawindow pd_dw, long pl_nro_acom);int li_numero
string ls_dup

  SELECT "SGD_ACOMETIDA"."NUM_PUERTA",   
         "SGD_ACOMETIDA"."DUPLICADOR"  
    INTO :li_numero,   
         :ls_dup  
    FROM "SGD_ACOMETIDA"  
   WHERE BDI_JOB=0 AND "SGD_ACOMETIDA"."CODIGO" = :pl_nro_acom ;
int aux
aux = pd_dw.SetItem(1,"numero",string(li_numero))
aux = pd_dw.SetItem(1,"duplic",ls_dup)

Return 1
end function


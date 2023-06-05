HA$PBExportHeader$u_enlace.sru
$PBExportComments$Objeto de usuario que proporciona las funciones mas usuales de manejo de la BDI.
forward
global type u_enlace from nonvisualobject
end type
end forward

type strsivasociaeltossimbolo from structure
	long		clase
	long		elemento
	long		simbolo
end type

type strsivponerblinks from structure
	long		clase
	long		elemento
end type

type strsivtratarcapa from structure
	long		clase
	long		tipo
	long		actuacion
end type

type strsivzoomeltos from structure
	long		clase
	long		elemento
end type

type elementos from structure
	long		class_id
	long		class_mem
	boolean		grafico
	double		x
	double		y
end type

type strsiveltostrabajo from structure
	long		clase
	long		elemento
	long		est_graf
	long		est_alfa
end type

type strsivasociaeltoscapa from structure
	long		clase
end type

type strsivasociacapas from structure
	long		clase
	long		flags
end type

global type u_enlace from nonvisualobject
end type
global u_enlace u_enlace

type prototypes
FUNCTION int GSivMerElemento(long ses, long clase, long cm, REF double x, REF double y, REF double XX, REF double YY) LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivMerElemento@28"
FUNCTION int GSivBorrarGraficoCodigo(long ses, int vent, long codigo, int simbolo) LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivBorrarGraficoCodigo@16"
FUNCTION int GSivDibujaGrafico(long ses, int vent, long elto, int simbolo ,int escala, double x, double y, double angulo) LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivDibujaGrafico@44"
FUNCTION int   GSivAsociaEltosCapa (long ses, REF strsivasociaeltoscapa lista[],int num)  LIBRARY  "conversor.dll" ALIAS FOR  "GSivAsociaEltosCapaC;Ansi"
FUNCTION int   GSivAsociaCapas (long ses, REF strsivasociacapas lista[],int num)  LIBRARY  "conversor.dll" ALIAS FOR  "GSivAsociaCapasC;Ansi"
SUBROUTINE AcabaSesion()  LIBRARY "CltSiv6s.dll" ALIAS FOR "_AcabaSesion@0"
FUNCTION int  GSivIniciarSesion  (string ho)  LIBRARY  "CltSiv6s.dll"  ALIAS FOR  "_GSivIniciarSesion@4;Ansi"
FUNCTION int  GSivGeneraSesion  (string nombre, REF long  ses)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivGeneraSesion@8;Ansi"
FUNCTION int  GSivQuitarTrabajos (long ses, int ventana)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivQuitarTrabajos@8"
FUNCTION int  gsivsalirsiv( long ses)  LIBRARY  "CltSiv6s.dll"
FUNCTION int  GSivCrearVentana  ( long ses, REF int vent, int posx, int posy, int ax, int ay, int pantalla, int color, REF string nombre)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivCrearVentana@36;Ansi"
FUNCTION int  GSivActivarVentana  ( long ses,  int vent, int visualiza )  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivActivarVentana@12"
FUNCTION int  GSivLocalizaTabla  ( long ses,  long xmin, long ymin, long xmax, long ymax, REF string  base, REF string tabla, int tipo, string clase, string codigo, string geom, string simbolo, string texto)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivLocalizaTabla@52;Ansi"
FUNCTION int   GSivAsociaTextosTabla(long ses, REF string base, REF string tabla, string attr_clase, REF string attr_codigo, REF string attr_texto, long clase, long codigo, long trabajo)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivAsociaTextosTabla@36;Ansi"
FUNCTION int   GSivTratarCapa (long ses, REF strsivtratarcapa lista[],int num)  LIBRARY  "conversor.dll" ALIAS FOR  "GSivTratarCapaC;Ansi"
FUNCTION int   GSivTratarCapaTexto (long ses, int actuacion, int clase, REF string campo)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivTratarCapaTexto@16;Ansi"
FUNCTION int  GSivZoomCoordenadas(long ses, long xmin, long ymin, long xmax, long ymax)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivZoomCoordenadas@20"
FUNCTION int GSivAsociaEltosSimbolo(long ses, long  clase, long elemento, int simbolo, int hay_zoom)   LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivAsociaEltosSimbolo@20"
FUNCTION int GSivAsociaEltosSimbolos(long ses, REF StrSivAsociaEltosSimbolo lista_elementos_simbolo[], int hay_zoom, int num_elementos)  LIBRARY  "conversor.dll" ALIAS FOR  "GSivAsociaEltosSimbolosC;Ansi"
FUNCTION int GSivDestruirSesion(long ses)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivDestruirSesion@4"
FUNCTION int GSivDestruirVentana(long ses, int vent)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivDestruirVentana@8"
FUNCTION int GSivSimbDefecto(long ses, int vent, long clase) LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivSimbDefecto@12"
FUNCTION int GSivQuitarEltoBlink(long ses, int vent,long ci,long cm)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivQuitarEltoBlink@16"
FUNCTION int GSivQuitarBlink(long ses, int vent)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivQuitarBlink@8"
FUNCTION int GSivZoomEltos(long ses, REF StrSivZoomEltos lista_elementos[500], int num) LIBRARY  "conversor.dll" ALIAS FOR "GSivZoomEltosC;Ansi"
FUNCTION int GSivZoomElementoVentana(long ses,long clase, long elemento, double radio,int ventana) LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivZoomElementoVentana@24"
FUNCTION int GSivPonerBlink(long ses, int vent, long clase, long elemento)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivPonerBlink@16"
FUNCTION int GSivPonerBlinks(long ses, int vent, REF StrSivZoomEltos lista_elementos[500], int num)  LIBRARY  "conversor.dll" ALIAS FOR  "GSivPonerBlinksC;Ansi"
FUNCTION int GSivPick(long ses, string cadena) LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivPick@8;Ansi"
FUNCTION int GSivEdicion(long ses, int vent, string subcomando)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivEdicion@12;Ansi"
FUNCTION int GSivAltaTrabajo(long ses, string nombre, string descripcion, long xmin, long ymin, long xmax, long ymax, REF long codigo)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivAltaTrabajo@32;Ansi"
FUNCTION int GSivBajaTrabajo(long ses, long codigo) LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivBajaTrabajo@8"
FUNCTION int GSivModificarTrabajo(long ses, long codigo, int vent)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivModificarTrabajo@12"
FUNCTION int GSivTerminarTrabajo(long ses, long codigo) LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivTerminarTrabajo@8"
FUNCTION int GSivSalirTrabajo(long ses, long codigo, int vent)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivSalirTrabajo@12"
FUNCTION int GSivConsultarTrabajo(long ses, long codigo, int vent, int hay_zoom)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivConsultarTrabajo@16"
FUNCTION int GSivDameCoordenadas(long ses, REF double x, REF double y, REF double X, REF double Y)  LIBRARY  "CltSiv6s.dll"  ALIAS FOR  "_GSivDameCoordenadas@20"
FUNCTION int GSivZoom(long ses, int vent, string comando)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivZoom@12;Ansi"
FUNCTION int GSivSetParamV(long ses, int vent, REF string parametro, REF string valor)   LIBRARY  "CltSiv6s.dll"   ALIAS   FOR  "_GSivSetParamV@16;Ansi"
FUNCTION int GSivSetParamS(long ses, REF string parametro, REF string valor)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "GSivSetParamS@12;Ansi"
FUNCTION int GSivGetParamV(long ses, int vent, REF string parametro, REF string valor)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivGetParamV@16;Ansi"
FUNCTION int GSivPickByPoint(long ses, int vent, REF long clase, REF long elemento)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivPickByPoint@16"
FUNCTION int GSivPickByPointLocator(long ses, int ve, REF long  ci,REF long cm, REF double x, REF double  y)  LIBRARY  "CltSiv6s.dll"  ALIAS FOR "_GSivPickByPointLocator@24"
FUNCTION int GSivPickCiCm(long ses, int ven, long ci, long cm,REF double x,REF double y, REF double ang)   LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivPickCiCm@28"
FUNCTION int GSivPickLocator( long ses, int vent, REF double x, REF double y)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "GSivPickLocator@16"
FUNCTION int GSivBloqueaElto( long ses,long clase,long elemento,long trabajo,int estado, REF long blq_trabajo, REF char blq_usuario[100])  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivBloqueaElto@28;Ansi"
FUNCTION int GSivQuitaBloqueo( long ses,long clase,long elemento,long trabajo,int estado)  LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivQuitaBloqueo@20"
FUNCTION int GSivBorrarElemento(long ses, int vent, long clase, long  elemento) LIBRARY  "CltSiv6s.dll"   ALIAS   FOR "_GSivBorrarElemento@16"
FUNCTION int GSivInfoTrabajo(long ses,long trabajo, long clase, long  elemento,REF strsiveltostrabajo el[500], REF int num_eltos)   LIBRARY  "conversor.dll"   ALIAS   FOR "GSivInfoTrabajoC;Ansi"
FUNCTION int gethostname (ref string name, int namelen ) library "wsock32.dll" alias for "gethostname;Ansi"
FUNCTION string GetHost(string lpszhost, ref string lpszaddress ) library "pbws32.dll" alias for "GetHost;Ansi"
FUNCTION int   GSivAsociaTexto(long ses,long clase, long elemento,string campo,string texto)  LIBRARY  "CltSiv6s.dll" ALIAS FOR  "_GSivAsociaTexto@20;Ansi"
FUNCTION long  puerto(string maquina, string fichero ) library "puertoonisdll.dll" alias for "puerto;Ansi"
FUNCTION int  ejecuta(string maquina, string fichero ) library "puertoonisdll.dll" alias for "ejecuta;Ansi"
end prototypes

type variables
long sesion
int  ventana
long trabajo
string display
elementos instalaciones [2]
boolean ib_hay_bdi
string is_tipo_mod
long il_class_id
long il_centro, il_cmd, il_puesto
long handleventana
constant  int CSUB=1108
constant  int CSMT=10
constant int CCT=1115
constant int CCD=1118
constant int  CTB=1085
constant int  CTM=1084
constant int  CSBT=15
constant int CACO=1037
constant int CTRM=65
constant int  SIV_CAPA_ESC=0
constant int  SIV_CAPA_NORM=1
end variables

forward prototypes
public function integer of_abre_ventana ()
public function long of_busca_class_id (long pl_codigo)
public subroutine of_obten_tramos (long pl_codigo, ref strsivzoomeltos elementos[500], ref integer num_elementos)
public function long of_sgi-bdi (long codigo)
public function integer of_simbolo (long clase, boolean incidencias)
public function integer of_sal_trabajo ()
public function integer of_abandona ()
public function integer of_traslada ()
public function integer of_consulta_trabajo (long pl_trabajo)
public function integer of_modifica_trabajo (long pl_trabajo)
public function integer of_mueve ()
public function integer of_trata_capa ()
public function integer of_selecciona (ref long pl_codigo)
public function integer of_carga_simbologia ()
public function integer of_cierra_ventana ()
public function integer of_alta_trabajo (string ps_nombre, string ps_descripcion, ref long pl_trabajo)
public function long of_bdi-sgi (long pl_codigo)
public function integer of_digitaliza (long pl_class_id, string ps_tipo)
private subroutine of_lista_incidencias (ref strsivasociaeltossimbolo elementos[], ref integer pi_num_elementos)
public function integer of_quita_blink ()
public function integer of_borra (ref long pl_codigo)
public function integer of_bloquea_elto (long pl_class_id, long pl_class_mem, integer estado)
public function integer of_muestra_elemento (long pl_codigo, boolean pb_blink)
public function integer of_amalgama ()
public function integer of_bdicico (long pl_trabajo, boolean pb_explotacion)
public function integer of_baja_trabajo (long pl_trabajo)
public function integer of_borra_registro (long class_id, long class_mem, integer pl_trabajo)
public function integer of_cambia_estado (long class_id, long class_mem, long pl_trabajo, integer estado)
public function integer of_pon_en_explotacion (long pl_trabajo)
public function integer of_divide ()
public function integer of_duplica_registro (long class_id, long class_mem, long trabajo_sel, integer estado_sel, long codigo_ins, long trabajo_ins, integer estado_ins)
public function integer of_graba_borra ()
public function integer of_graba_amalgama ()
public function integer of_graba_digitaliza (long pl_class_id, ref long pl_codigo)
public function integer of_ult_codigo (integer pi_class_id, ref long pl_codigo)
public function integer of_graba_divide (boolean pb_por_ct)
public function integer of_graba_modificacion ()
public function integer of_establece_sesion ()
public function integer of_actualizar_puerto ()
public function integer of_cierra_sesion ()
public function integer of_selecciona_capa ()
public function integer of_estado_aviso (long ll_codigo)
public subroutine of_obten_tramos_bt (long pl_codigo, ref strsivzoomeltos elementos[500], ref integer num_elementos)
public function integer of_muestra_calle (long pl_codigo)
public function integer of_simbolo_aviso (long codigo, boolean lb_brigada, boolean lb_cli_imp)
public function integer of_simbolo_instalaciones_bri (long pl_class_id)
public subroutine of_lista_instalaciones_bri (ref strsivasociaeltossimbolo elementos[], ref integer pi_num_elementos)
public function integer of_carga_simbologia_instalaciones_bri (boolean pb_brigadas_trabajando)
public function integer of_mostrar_estados (boolean visualizar)
public function integer of_hay_acometidas (long pl_codigo)
public function integer of_hijos_no_borrados (long pl_int_padre)
public function integer of_permiso_borrar (long pl_codigo)
public function integer of_desbloquea_elto (long pl_class_id, long pl_codigo, integer pi_estado)
public function integer of_actualiza_texto (long pl_clase, long pl_codigo, string ps_campo, string ps_texto)
public function integer of_conecta_y_pte (long pl_trabajo, boolean pb_grafico)
public function integer of_establece_ses ()
public subroutine of_actualizar_servidores (long pl_trabajo)
end prototypes

public function integer of_abre_ventana ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_abre_ventana
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Pide al ONIS que genere una ventana gr$$HEX1$$e100$$ENDHEX$$fica en el display indicado									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string titulo
int retorno
ulong hax
string host
long  port
string maquinapuerto
string nombre
string dirtcp
int err


application app
app=getapplication()
hax=handle(app)
titulo="OPENSGI"
// Obtiene la maquina y el puerto que nos permita comunicarnos con el ONIS

port=long(Profilestring("opensgi.ini", "SIV_SERVER", "puerto", "0"))
host=ProfileString("opensgi.ini", "SIV_SERVER", "maquina", "sfsud001")

maquinapuerto=host+":"+string(port)
retorno=GSivIniciarSesion(maquinapuerto);




//IniciaSesion(hax,host,port);

//Obtiene la direccion IP del PC donde se va a generar la ventana
		

nombre=space(255)
gethostname(nombre,255)
gethost(nombre,dirtcp)
display=""
for err=1 to 3
	display=display+string(asc(Mid(dirtcp,err,1)))+"."
next
   display=display+string(asc(Mid(dirtcp,4,1)))+":0.0"



// Genera una sesion
retorno=GSivGeneraSesion(display,sesion);
if retorno<>1 then 
	   return(retorno)
end if
// Abre la ventana grafica

retorno=GSivCrearVentana(sesion,ventana,0,0,1,1,0,1,titulo);

return(retorno)
	

end function

public function long of_busca_class_id (long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_busca_cl_id
//
//  Argumentos : pl_codigo --> C$$HEX1$$f300$$ENDHEX$$digo de instalaci$$HEX1$$f300$$ENDHEX$$n.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Obtiene el class_id de la instalaci$$HEX1$$f300$$ENDHEX$$n solicitada (BDI).
//	
//
//  Valor de retorno : class_id
//				  				 
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

Setpointer(HourGlass!)


// Son codigos de BDI

CHOOSE CASE pl_codigo
	CASE 20000000 to 20999999
		// SUBESTACION
		return(CSUB)
		
   CASE 10000000 to 10999999
		// SALIDA DE MEDIA
		return(CSMT)
	CASE 40000000 to 40999999
		// CT	
		return(CCT)
	CASE 19000000 to 19999999
		//TRAMOS BAJA
		return(CTB)
	
	CASE 11000000 to 11999999
		//TRAMOS MEDIA
		return(CTM)
		
	CASE 15000000 to 15999999
		//SAL_BT
		return(CSBT)
	CASE 1000000 to 1999999
		//ACOMETIDAS
		return(CACO)
	CASE 65000000 to 65999999
		//TRAFOS_MB
  	return(CTRM)
	CASE ELSE
		return(0)
END CHOOSE
end function

public subroutine of_obten_tramos (long pl_codigo, ref strsivzoomeltos elementos[500], ref integer num_elementos);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_obten_tramos
//
//  Argumentos : 	pl_codigo --> codigo de la l$$HEX1$$ed00$$ENDHEX$$nea.
//						elementos[]--> Estructura a rellenar
//               	num_elementos--> N$$HEX1$$fa00$$ENDHEX$$mero de tramos.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Rellena la matriz  elementos con los tramos de la linea solicitada.									
//	
//
//  Valores de retorno :	elementos[]--> Estructura a rellenar
// 			              	num_elementos--> N$$HEX1$$fa00$$ENDHEX$$mero de tramos.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////





num_elementos=0
long codigo_tramo
pl_codigo=of_bdi-sgi(pl_codigo)
DECLARE tramos CURSOR FOR  
  SELECT CODIGO  
    FROM "SGD_TRAMO"  
   WHERE "INSTALACION_ORIGEN" = :pl_codigo   ;
 
 
 Open tramos;
 
 FETCH tramos INTO :codigo_tramo ;
 DO WHILE sqlca.sqlcode=0
	num_elementos=num_elementos+1
	elementos[num_elementos].elemento=codigo_tramo
	elementos[num_elementos].clase=CTM
	
	FETCH tramos INTO :codigo_tramo ;
LOOP
 close tramos;

end subroutine

public function long of_sgi-bdi (long codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_sgi-bdi
//
//  Argumentos : codigo --> c$$HEX1$$f300$$ENDHEX$$digo SGI de la instalaci$$HEX1$$f300$$ENDHEX$$n.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Obtiene el c$$HEX1$$f300$$ENDHEX$$digo BDI de una instalaci$$HEX1$$f300$$ENDHEX$$n a partir de su c$$HEX1$$f300$$ENDHEX$$digo
//					SGI.
//	
//
//  Valores de retorno : codigo --> c$$HEX1$$f300$$ENDHEX$$digo BDI de la instalaci$$HEX1$$f300$$ENDHEX$$n.									
//
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



//
//// Convierte el codigo de SGI a BDI
//if codigo >= 30000000 and codigo <= 30999999 then
//	codigo = codigo - 20000000
//elseif codigo >= 45000000 and codigo <= 45999999 then
//	codigo = codigo + 20000000
//elseif codigo >= 50000000 and codigo <= 50999999 then
//	codigo = codigo - 35000000
//end if
//
return codigo

	
end function

public function integer of_simbolo (long clase, boolean incidencias);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_simbolo
//
//  Argumentos : 	clase --> Class_id de la instalaci$$HEX1$$f300$$ENDHEX$$n.
//						incidencias --> Indica si el s$$HEX1$$ed00$$ENDHEX$$mbolo es de incidencias o de interrupciones.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Obtiene el simbolo que le corresponde a una instalaci$$HEX1$$f300$$ENDHEX$$n con incidencia o interrupci$$HEX1$$f300$$ENDHEX$$n.									
//	
//
//  Valores de retorno : valor num$$HEX1$$e900$$ENDHEX$$rico del s$$HEX1$$ed00$$ENDHEX$$mbolo.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




CHOOSE CASE clase
	CASE  CSUB // SUBESTACION
	 if incidencias then
		return(412)
	  else
		return(312)
	end if	
	CASE CCT, CTRM,CSBT // CT
		if incidencias then
		return(413)
	  else
		return(303)
	end if	
  CASE CCD // CD
		if incidencias then
		return(414)
	  else
		return(314)
	end if	
  CASE 1084 // TRAMO  MEDIA
		if incidencias then
		return(21)
	  else
		return(32)
	end if	
CASE ELSE 
	return 0
END CHOOSE


end function

public function integer of_sal_trabajo ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_sal_trabajo
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Sale del trabajo definido en el objeto.										
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



int resultado

resultado=GSivSalirTrabajo(sesion, this.trabajo, ventana)
this.trabajo=-1
return(resultado)
end function

public function integer of_abandona ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_abandona
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al ONIS que descarte la $$HEX1$$fa00$$ENDHEX$$ltima modificaci$$HEX1$$f300$$ENDHEX$$n efectuada.								
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno

// Quita el blink
retorno=GSivQuitarBlink (sesion,ventana)
if (retorno=1) then
// Abandona la ultima modificacion
	retorno=GSivEdicion(sesion,ventana,"abandonar")
end if
return(retorno)
end function

public function integer of_traslada ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_traslada 
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Permite seleccionar una instalaci$$HEX1$$f300$$ENDHEX$$n para trasladarla, perdiendo 
//					la conectividad.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




int retorno
string parametro, valor
parametro="Snap"
valor="2"
retorno=GSivSetParamV(sesion,ventana,parametro,valor) 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,"inicializar") 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,"trasladar") 
return(retorno)
end function

public function integer of_consulta_trabajo (long pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_consulta_trabajo
//
//  Argumentos : pl_trabajo--> codigo de trabajo
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Visualiza en explotaci$$HEX1$$f300$$ENDHEX$$n el trabajo	cuyo c$$HEX1$$f300$$ENDHEX$$digo se pasa como par$$HEX1$$e100$$ENDHEX$$metro								
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
// Quita los trabajos consultados de la capa de explotacion
GSivQuitarTrabajos(sesion,ventana)
// Consulta el trabajo seleccionado
retorno=GSivConsultarTrabajo(sesion,pl_trabajo,ventana,1)
return(retorno)
end function

public function integer of_modifica_trabajo (long pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_modifica_trabajo
//
//  Argumentos : pl_trabajo--> codigo del trabajo a modificar
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Pasa a la capa de desarrollo con el trabajo indicado.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




int retorno

 retorno=GSivModificarTrabajo(sesion, pl_trabajo,ventana)
 if retorno=1 then
	this.trabajo=pl_trabajo
else
	this.trabajo=-1
end if	
 return(retorno)
end function

public function integer of_mueve ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_mueve
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:  Permite seleccionar una instalaci$$HEX1$$f300$$ENDHEX$$n para desplazarla, manteniendo
//					la conectividad.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




int retorno
string parametro, valor
parametro="Snap"
valor="2"
retorno=GSivSetParamV(sesion,ventana,parametro,valor) 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,"inicializar") 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,"mover") 
return(retorno)
end function

public function integer of_trata_capa ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_trata_capa
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Obtiene la configuraci$$HEX1$$f300$$ENDHEX$$n de capas del fichero "opensgi.ini" y las 

//					carga en la ventana gr$$HEX1$$e100$$ENDHEX$$fica.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno,actuacion
CONSTANT long CAPA_TEXTO = 2 
CONSTANT long CAPA_GRAFICA = 1

strsivtratarcapa elementos []
strsivasociacapas ele []

string capa
int num=0
int num2=0
int contador=1
long posicion
string literal
string ls_class_id
string cargado
boolean estado
long clase
capa=ProfileString("opensgi.ini","CAPAS","capa"+string(contador),"")

if capa="" or ISnull(capa) then
		gnv_msg.f_mensaje("EX32","","",Ok!)		
	return(0)
else
DO WHILE Not Isnull(capa) and capa<>""
	posicion=pos(capa,"#")// PRIMER #
	cargado=mid(capa,1,posicion - 1)
	literal=mid(capa,posicion+1,len(capa))
	posicion=pos(literal,"#")//SEGUNDO #
	ls_class_id=mid(literal,posicion+1,len(literal))
	if cargado="1" then 
		actuacion=1
	else
		actuacion=2
   end if
	
		posicion=pos(ls_class_id,"#")
		clase=long(mid(ls_class_id,1,posicion -1))
		if posicion=0 or clase=0 then return(0) // NO HAY NINGUN CLASS_ID	
	
	DO WHILE posicion>0 
      num=num+1
      if actuacion=1 then
			num2=num2+1
			ele[num2].clase=clase
			ele[num2].flags=SIV_CAPA_NORM
		end if
		// TEXTO

		elementos[num].clase=clase
		elementos[num].actuacion=actuacion
		elementos[num].tipo=CAPA_TEXTO
		// GRAFICOS
      num=num+1
		elementos[num].clase=clase
		elementos[num].actuacion=actuacion
		elementos[num].tipo=CAPA_GRAFICA
      ls_class_id=mid(ls_class_id,posicion+1)
		posicion=pos(ls_class_id,"#")
		clase=long(mid(ls_class_id,1,posicion -1))
	LOOP








	contador=contador+1
	capa=ProfileString("opensgi.ini","CAPAS","capa"+string(contador),"")
LOOP

end if	
retorno=gsivasociacapas(sesion,ele[],num2)

retorno=gsivtratarcapa(sesion,elementos[],num)
return(retorno)


end function

public function integer of_selecciona (ref long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_selecciona
//
//  Argumentos : pl_codigo --> codigo de la instalaci$$HEX1$$f300$$ENDHEX$$n solicitada.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Permite seleccionar con el rat$$HEX1$$f300$$ENDHEX$$n una instalaci$$HEX1$$f300$$ENDHEX$$n y obtener su
// 				c$$HEX1$$f300$$ENDHEX$$digo.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
long clase


string parametro, valor
parametro="Snap"
valor="2"
retorno=GSivSetParamV(sesion,ventana,parametro,valor) 
parametro="Tolerancia"
valor="10"
retorno=GSivSetParamV(sesion,ventana,parametro,valor) 

retorno=GSivPickByPoint(sesion,ventana, clase, pl_codigo)
if retorno=1 then 
	retorno=GSivQuitarBlink(sesion, ventana)
end if
return(retorno)
end function

public function integer of_carga_simbologia ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_carga_simbologia
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Cambia los s$$HEX1$$ed00$$ENDHEX$$mbolos 	de las instalaciones afectadas por incidencias
//					e interrupciones.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno
int num_elementos=0
strsivasociaeltossimbolo e[]
// Obtiene las instalaciones afectadas por incidencias e interrupciones
of_lista_incidencias(e[],num_elementos)
// Cambia la simbologia de esas instalaciones
if (num_elementos>0) then 
	retorno=GSivSimbDefecto(sesion, ventana, 0) 
	retorno=GSivAsociaEltosSimbolos(sesion,e,0,num_elementos)
end if	
return(retorno)
end function

public function integer of_cierra_ventana ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_cierra_ventana
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Cierra la ventana definida por las variables instanciadas ventana y
//				 sesion.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno

retorno=GSivDestruirVentana(sesion,ventana)
retorno=GSivDestruirSesion(sesion)
AcabaSesion()
return(retorno)
end function

public function integer of_alta_trabajo (string ps_nombre, string ps_descripcion, ref long pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_alta_trabajo
//
//  Argumentos :  ps_nombre -> Nombre del trabajo
//					   ps_descripcion -> Descripci$$HEX1$$f300$$ENDHEX$$n del trabajo
//						pl_trabajo -> Codigo del trabajo (retorno)
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Da de alta un trabajo. 										
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//								 pl_trabajo --> codigo del trabajo dado de alta.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno
double x,y,xx,yy
pl_trabajo=-1
// Coordenadas del trabajo

retorno= GSivDameCoordenadas(sesion,x, y, xx,yy)
if  (x<0 or y<0 or  xx<0 or  yy<0) then // COORDENADAS ERRONEAS
 return(0)
end if

// Da de alta el trabajo

if retorno=1 then
  retorno=GSivAltaTrabajo(sesion, ps_nombre, ps_descripcion, x, y, xx,yy,pl_trabajo)
end if
return(retorno)
	
end function

public function long of_bdi-sgi (long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_bdi-sgi
//
//  Argumentos : pl_codigo --> C$$HEX1$$f300$$ENDHEX$$digo de la instalaci$$HEX1$$f300$$ENDHEX$$n (BDI)
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Obtiene el c$$HEX1$$f300$$ENDHEX$$digo de instalaci$$HEX1$$f300$$ENDHEX$$n de SGI a partir del correspodiente
//					c$$HEX1$$f300$$ENDHEX$$digo de BDI.
//	
//
//  Valor de retorno : c$$HEX1$$f300$$ENDHEX$$digo de SGI
//				  				  
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



// Convierte el codigo de instalacion de BDI a SGI
//
//if pl_codigo >= 10000000 and pl_codigo <= 10999999 then
//	pl_codigo = pl_codigo + 20000000
//elseif pl_codigo >= 65000000 and pl_codigo <= 65999999 then
//	pl_codigo = pl_codigo - 20000000
//elseif pl_codigo >= 15000000 and pl_codigo <= 15999999 then
//	pl_codigo = pl_codigo + 35000000
//end if

return pl_codigo

	
end function

public function integer of_digitaliza (long pl_class_id, string ps_tipo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_digitaliza
//
//  Argumentos : pl_class_id --> Class_id de la instalacion a digitalizar
//					  ps_tipo -->  Tipo de digitalizacion
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Digitaliza una instalaci$$HEX1$$f300$$ENDHEX$$n.								
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
string parametro, valor
parametro="Snap"
valor="2"
retorno=GSivSetParamV(sesion,ventana,parametro,valor) 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,"inicializar") 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,"codigo_ent "+string(pl_class_id)+" 0") 
if retorno<>1 then return(retorno)
retorno=GSivEdicion(sesion, ventana,ps_tipo) 
return(retorno)
end function

private subroutine of_lista_incidencias (ref strsivasociaeltossimbolo elementos[], ref integer pi_num_elementos);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_lista_incidencias
//
//  Argumentos / Retorno : elementos[] --> Matriz de estructuras a rellenar
//					  				pi_num_elementos --> N$$HEX1$$fa00$$ENDHEX$$mero de elementos del array						
//
//  Funci$$HEX1$$f300$$ENDHEX$$n: Rellena las estructuras necesarias para el cambio de simbologia.										
//	
//
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




long class_id, codigo, simbolo, codigo_bdi
 pi_num_elementos=0
 strsivzoomeltos tramos[500]
 int i,num_tramos=0

// CARGAMOS LAS INCIDENCIAS
 
 DECLARE incidencias CURSOR FOR  
  SELECT "NRO_INST_AFECTADA"  
    FROM "SGD_INCIDENCIA" 
	 WHERE EST_ACTUAL<5 AND EST_ACTUAL>0;
 DECLARE interrupciones CURSOR FOR  
  SELECT "SGD_INTERRUPCION"."NRO_INSTALACION"  
    FROM "SGD_INTERRUPCION" 
	 WHERE F_REPOSICION is NULL;

 open incidencias;
 FETCH incidencias INTO :codigo ;
 DO WHILE sqlca.sqlcode=0
	codigo_bdi=of_sgi-bdi(codigo)
	class_id=of_busca_class_id(codigo_bdi)
	if class_id<>CSMT and class_id<> CSBT and class_id>0 then
		
		if class_id = CTRM then
			
			SELECT "SGD_TRAFO_MB"."INSTALACION_ORIGEN"  
			  INTO :codigo_bdi
			  FROM "SGD_TRAFO_MB"  
			 WHERE "SGD_TRAFO_MB"."CODIGO" = :codigo_bdi   ;
			
			 class_id = of_busca_class_id(codigo_bdi)
			
		end if
		
		pi_num_elementos=pi_num_elementos+1
		elementos[pi_num_elementos].elemento=codigo_bdi
		elementos[pi_num_elementos].clase=class_id
   	elementos[pi_num_elementos].simbolo=of_simbolo(class_id,true)
	elseif class_id=CSMT then // LINEAS DE MEDIA
	   of_obten_tramos(codigo_bdi,tramos[],num_tramos)	
		class_id=CTM
		for i=1 to num_tramos
			pi_num_elementos=pi_num_elementos+1
			elementos[pi_num_elementos].elemento=tramos[i].elemento
   		elementos[pi_num_elementos].clase=tramos[i].clase
	   	elementos[pi_num_elementos].simbolo=of_simbolo(class_id,true)
		next 
		
	elseif class_id=CSBT then // LINEAS DE BAJA
	   of_obten_tramos_bt(codigo_bdi,tramos[],num_tramos)	
		class_id=CTB
		for i=1 to num_tramos
			pi_num_elementos=pi_num_elementos+1
			elementos[pi_num_elementos].elemento=tramos[i].elemento
   		elementos[pi_num_elementos].clase=tramos[i].clase
	   	elementos[pi_num_elementos].simbolo=of_simbolo(class_id,true)
		next 
	
	end if	
	FETCH   incidencias INTO :codigo;
LOOP
close incidencias; 


// CARGAMOS LAS INTERRUPCIONES 
 open interrupciones;
 FETCH interrupciones INTO :codigo ;
 DO WHILE sqlca.sqlcode=0
	codigo_bdi=of_sgi-bdi(codigo)
	class_id=of_busca_class_id(codigo_bdi)
	if class_id>0 and class_id <>CSMT then
		if class_id = CTRM then
			SELECT "SGD_TRAFO_MB"."INSTALACION_ORIGEN"  
			  INTO :codigo_bdi
			  FROM "SGD_TRAFO_MB"  
			 WHERE "SGD_TRAFO_MB"."CODIGO" = :codigo_bdi   ;
			 class_id = of_busca_class_id(codigo_bdi)
		end if
		pi_num_elementos=pi_num_elementos+1
		elementos[pi_num_elementos].elemento=codigo_bdi
		elementos[pi_num_elementos].clase=class_id
		elementos[pi_num_elementos].simbolo=of_simbolo(class_id,false)
	elseif class_id=CSMT then  // LINEAS MEDIA
	   of_obten_tramos(codigo_bdi,tramos[],num_tramos)	
		class_id=CTM
		for i=1 to num_tramos
			pi_num_elementos=pi_num_elementos+1
			elementos[pi_num_elementos].elemento=tramos[i].elemento
   		elementos[pi_num_elementos].clase=tramos[i].clase
	   	elementos[pi_num_elementos].simbolo=of_simbolo(class_id,false)
		next 
	elseif class_id=CSBT then  // LINEAS BAJA
	   of_obten_tramos_bt(codigo_bdi,tramos[],num_tramos)	
		class_id=CTB
		for i=1 to num_tramos
			pi_num_elementos=pi_num_elementos+1
			elementos[pi_num_elementos].elemento=tramos[i].elemento
   		elementos[pi_num_elementos].clase=tramos[i].clase
	   	elementos[pi_num_elementos].simbolo=of_simbolo(class_id,false)
		next 
	
	end if	
	FETCH   interrupciones INTO :codigo;
LOOP
close interrupciones; 

end subroutine

public function integer of_quita_blink ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_quita_blink
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Quita el parpardeo en la ventana gr$$HEX1$$e100$$ENDHEX$$fica									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
retorno=GSivQuitarBlink (sesion,ventana)
return(retorno)
end function

public function integer of_borra (ref long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_borra
//
//  Argumentos : pl_codigo --> Codigo de la instalacion seleccionada para borrar. 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Permite seleccionar una instalacion grafica para borrarla
//	
//
//  Valores de retorno :  0--> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//								  pl_codigo -->codigo de la instalacion.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno=1
long clase
string parametro, valor
if pl_codigo<>0 then // BORRADO ALFANUMERICO
	 clase=of_busca_class_id(pl_codigo)
	 instalaciones[1].class_id=clase
	 instalaciones[1].class_mem=pl_codigo
	 instalaciones[1].grafico=false	
	 
else	// BORRADO GRAFICO
	

	parametro="Snap"
	valor="2"
	retorno=GSivSetParamV(sesion,ventana,parametro,valor) 
	parametro="Tolerancia"
	valor="10"
	retorno=GSivSetParamV(sesion,ventana,parametro,valor) 
	retorno=GSivPickByPoint(sesion,ventana, clase, pl_codigo)
	if retorno=1 then
	 instalaciones[1].class_id=clase
	 instalaciones[1].class_mem=pl_codigo
	 instalaciones[1].grafico=true
//	 retorno=GSivPonerBlink(sesion, ventana, clase, pl_codigo) 
end if	
end if
return(retorno)
end function

public function integer of_bloquea_elto (long pl_class_id, long pl_class_mem, integer estado);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_bloquea_elto
//
//  Argumentos :  pl_class_id --> class_id de la instalacion
//						pl_class_mem --> codigo de la instalacion
//						estado -->   Estado del bloqueo
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Bloquea una instalacion con el estado solicitado.											
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 12/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


char blq_usuario[100]
long blq_trabajo
int retorno

retorno=GSivBloqueaElto(sesion,pl_class_id,pl_class_mem,this.trabajo,estado, blq_trabajo,blq_usuario)
return(retorno)
end function

public function integer of_muestra_elemento (long pl_codigo, boolean pb_blink);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_muestra_elemento
//
//  Argumentos : pl_codigo --> c$$HEX1$$f300$$ENDHEX$$digo del elemento a localizar.
//					  pb_blink  --> Indica si hay o no parpadeo.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Visualiza la instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada en la ventana gr$$HEX1$$e100$$ENDHEX$$fica		
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

double x,y, angulo
int retorno,li_num_elementos
long ll_codigo_bdi,ll_class_id
strsivzoomeltos elemento[500]

// El  codigo es de BDI
ll_codigo_bdi=pl_codigo
// BUSCAMOS EL CLASS_ID
ll_class_id=of_busca_class_id(ll_codigo_bdi)
if ll_class_id=CSMT then  // ES UNA LINEA ALTA

	of_obten_tramos(pl_codigo,elemento[],li_num_elementos)


elseif ll_class_id=CSBT then  // ES UNA LINEA BAJA

	of_obten_tramos_bt(pl_codigo,elemento[],li_num_elementos)

else
	if ll_class_id=CTRM then  // ES UN TRAFO

		  SELECT "SGD_TRAFO_MB"."INSTALACION_ORIGEN"  
		    INTO :ll_codigo_bdi
		    FROM "SGD_TRAFO_MB"  
			   WHERE "SGD_TRAFO_MB"."CODIGO" = :ll_codigo_bdi ;
				ll_class_id=CCT
			   elemento[1].clase=ll_class_id
   			elemento[1].elemento=ll_codigo_bdi
	else
	// NO ES LINEA  NI TRAFO
   	elemento[1].clase=ll_class_id	
	   elemento[1].elemento=ll_codigo_bdi
	end if
	// Por el momento es la $$HEX1$$fa00$$ENDHEX$$nica forma de ver si existe, en proximas versiones 
	// se hara con el GSivZoomEltos.
	retorno=GSivEdicion(sesion,ventana,"edita "+string(ll_class_id)+"  "+string(ll_codigo_bdi))
	li_num_elementos=retorno
	retorno=GSivEdicion(sesion,ventana,"abandonar")
end if

if li_num_elementos<1 then
	//messagebox("Aviso","Instalacion no localizada")
	return(0)
end if

GSivQuitarBlink (sesion,ventana)

if li_num_elementos > 1 then
	GSivZoomEltos(sesion,elemento,li_num_elementos)
else
	GSIvZoomElementoVentana(sesion,elemento[1].clase,elemento[1].elemento,100,ventana);
end if

if pb_blink then
	GSivPonerBlinks(sesion,ventana,ref elemento,li_num_elementos)
end if

return(1)
end function

public function integer of_amalgama ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_amalgama
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Une dos tramos en uno.										
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//								  
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 11/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno=0
strsivzoomeltos eltos[500]
long clase, codigo
string parametro, valor
parametro="Snap"
valor="3"
GSivSetParamV(sesion,ventana,parametro,valor) 
retorno=GSivPickByPoint(sesion,ventana, clase, codigo)
if retorno=1 and clase=CTM then // Se ha seleccionado bien el primer tramo
	eltos[1].clase=clase
	eltos[1].elemento=codigo
	instalaciones[1].class_id=clase
	instalaciones[1].class_mem=codigo
	instalaciones[1].grafico=false
	GSivEdicion(sesion,ventana,"edita "+string(clase)+" "+string(codigo))	
	retorno=GSivPickByPoint(sesion,ventana, clase, codigo)
	if retorno=1 and clase=CTM  then // Se ha seleccionado bien el segundo tramo
		instalaciones[2].class_id=clase
		eltos[2].clase=clase
		eltos[2].elemento=codigo
		instalaciones[2].class_mem=codigo
		instalaciones[2].grafico=false
		GSivEdicion(sesion,ventana,"edita "+string(clase)+" "+string(codigo))	
		retorno=GSivEdicion(sesion,ventana,"amalgamar")	
		if retorno=1 then
			 retorno=GSivPonerBlinks(sesion,ventana,ref eltos,2)
		end if
	elseif clase<>CTM then 
		 retorno=0
	end if	
elseif clase<>CTM then 
	 retorno=0

end if	

if retorno=0 then
	GSivEdicion(sesion,ventana,"abandonar")
	GSivQuitarBlink(sesion,ventana)
end if	
return(retorno)
end function

public function integer of_bdicico (long pl_trabajo, boolean pb_explotacion);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_bdicico	
//
//  Argumentos : long  pl_trabajo --> codigo del trabajo
//					  boolean pb_explotacion --> explotaci$$HEX1$$f300$$ENDHEX$$n o borrado
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Pone en explotaci$$HEX1$$f300$$ENDHEX$$n o borra alfanumericamente las instalaciones 
//				  asociadas al trabajo.
//	
//
//  Valores de retorno :  0--> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
// 							  -1 --> Una instalaci$$HEX1$$f300$$ENDHEX$$n carece de instalaci$$HEX1$$f300$$ENDHEX$$n padre.
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 09/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

strsiveltostrabajo ele[500]
int num_eltos
int retorno,indice
long clase=0
string ls_nombre,ls_matricula
int hay_padre
long elemento=0
if pb_explotacion then // Puesta en explotacion
		retorno=GSivInfoTrabajo(sesion,pl_trabajo,clase,elemento,ele,num_eltos)
	for indice=1 to num_eltos
			
		CHOOSE CASE ele[indice].est_alfa
			CASE 32 // ALTA DE INSTALACIONES
				// COMPROBAMOS QUE TENGA INSTALACION PADRE
		 SELECT count(*)  
    		INTO :hay_padre  
    		FROM "SGD_INSTALACION"  
   		WHERE "SGD_INSTALACION"."NRO_INSTALACION" = (  SELECT "NRO_INST_PADRE"  
                                                    FROM "SGD_INSTALACION"  
                                                   WHERE "SGD_INSTALACION"."NRO_INSTALACION" = :ele[indice].elemento)  ;
			if hay_padre=0 then  // No existe el padre
				gnu_u_transaction.uf_rollback()
				return(-1)
			end if
				
			CHOOSE CASE ele[indice].clase
					
				CASE CSUB // SUBESTACION
					update sgd_subestac set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
					if sqlca.sqlcode<>0 then
					 gnu_u_transaction.uf_rollback()
					 return(0)
					end if
//									
//				 SELECT "NOMBRE","MATRICULA"  
//			   	 INTO :ls_nombre,:ls_matricula  
//			    FROM "SGD_SUBESTAC"  
//			   WHERE "SGD_SUBESTAC"."CODIGO" =:ele[indice].elemento;
//				ls_nombre=trim(ls_nombre)
//				retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"nombre",ls_nombre)
//				retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"matricula",trim(ls_matricula))
				
			CASE CCT,CCD //CT
					update sgd_ct set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
					if sqlca.sqlcode<>0 then
						 gnu_u_transaction.uf_rollback()
						 return(0)
					end if
//													
//					 SELECT "NOMBRE","MATRICULA"  
//				   	 INTO :ls_nombre,:ls_matricula  
//				    FROM "SGD_CT"  
//			   	WHERE "SGD_CT"."CODIGO" =:ele[indice].elemento;
//					ls_nombre=trim(ls_nombre)
//					retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"nombre",ls_nombre)
//					retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"matricula",trim(ls_matricula))
//											
				CASE CTM // TRAMOS DE MEDIA

					update sgd_tramo set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
					if sqlca.sqlcode<>0 then
						 gnu_u_transaction.uf_rollback()
						 return(0)
					end if
					
				CASE CTB // TRAMOS DE BAJA
					update sgd_tramo_bt set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
					if sqlca.sqlcode<>0 then
						 gnu_u_transaction.uf_rollback()
						 return(0)
					end if
				CASE CTRM // TRAFOS
					update sgd_trafo_mb set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
					if sqlca.sqlcode<>0 then
					 gnu_u_transaction.uf_rollback()
					 return(0)
					end if
			
				CASE CSMT  // LINEAS
					update sgd_salmt set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
				if sqlca.sqlcode<>0 then
					 gnu_u_transaction.uf_rollback()
					 return(0)
			    end if
			
				CASE CSBT // SALIDAS DE BAJA TENSION
					update sgd_salbt set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
											and bdi_job=:pl_trabajo;
				if sqlca.sqlcode<>0 then
				 gnu_u_transaction.uf_rollback()
				 return(0)
			   end if
												
				END CHOOSE
			
			
							
				
			CASE 64 // MODIFICACIONES
				
				
				CHOOSE CASE ele[indice].clase
					
						CASE CSUB // SUBESTACION
							update sgd_subestac set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
										
							update sgd_subestac set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
							delete from sgd_subestac where codigo=:ele[indice].elemento 
																	and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
//							 SELECT "NOMBRE","MATRICULA"  
//						   	 INTO :ls_nombre,:ls_matricula  
//							FROM "SGD_SUBESTAC"  
//						   WHERE "SGD_SUBESTAC"."CODIGO" =:ele[indice].elemento;
//							ls_nombre=trim(ls_nombre)
//							retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"nombre",ls_nombre)
//							retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"matricula",trim(ls_matricula))
//										
						CASE CCT, CCD //CT Y CD
							update sgd_ct set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
			
							update sgd_ct set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
							delete from sgd_ct where codigo=:ele[indice].elemento 
														and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if

														
//							 SELECT "NOMBRE","MATRICULA"  
//						   	 INTO :ls_nombre,:ls_matricula  
//						    FROM "SGD_CT"  
//					   	WHERE "SGD_CT"."CODIGO" =:ele[indice].elemento;
//							ls_nombre=trim(ls_nombre)
//							retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"nombre",ls_nombre)
//							retorno=GSivAsociaTexto(sesion,ele[indice].clase,ele[indice].elemento,"matricula",trim(ls_matricula))
														
														
					
						CASE CTM // TRAMOS DE MEDIA
							update SGD_TRAMO set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
							update SGD_TRAMO set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
														
							delete from SGD_TRAMO where codigo=:ele[indice].elemento 
															and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if								
							
						CASE CTB // TRAMOS DE BAJA
							update SGD_TRAMO_BT set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
							update SGD_TRAMO_BT set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
														
							delete from SGD_TRAMO_BT where codigo=:ele[indice].elemento 
															and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if								
																	

																	
																	
																	
						CASE CTRM // TRAFOS
							update sgd_trafo_mb set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if											
			
							update sgd_trafo_mb set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
							delete from sgd_trafo_mb where codigo=:ele[indice].elemento 
														and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
										
						CASE CSMT  // LINEAS
							update sgd_salmt set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
			
							update sgd_salmt set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
			
							delete from sgd_salmt where codigo=:ele[indice].elemento 
														and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
										
						CASE CSBT // SALIDAS DE BAJA TENSION
							update sgd_salbt set bdi_job=-1 where codigo=:ele[indice].elemento 
														and bdi_job=0;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
														
							update sgd_salbt set bdi_job=0,statflg=0 where codigo=:ele[indice].elemento 
														and bdi_job=:pl_trabajo;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
			
							delete from sgd_salbt where codigo=:ele[indice].elemento 
														and bdi_job=-1;
							if sqlca.sqlcode=-1 then 
								gnu_u_transaction.uf_rollback()
								return(0)
							end if
			
						END CHOOSE
						
			CASE 128 // BAJA DE INSTALACIONES
				
			CHOOSE CASE ele[indice].clase
					
				CASE CSUB // SUBESTACION
					delete from  sgd_subestac  where codigo=:ele[indice].elemento;
					
				CASE CCT,CCD //CT
					delete from  sgd_ct where codigo=:ele[indice].elemento;
					
				CASE CTM // TRAMOS DE MEDIA
					 delete from  sgd_tramo where codigo=:ele[indice].elemento;
					
				CASE CTB // TRAMOS DE BAJA
					 delete from  sgd_tramo_bt where codigo=:ele[indice].elemento;	 
					 
				CASE CTRM // TRAFOS
					delete from sgd_trafo_mb where codigo=:ele[indice].elemento;
					
				CASE CSMT  // LINEAS
					
					delete from sgd_salmt where codigo=:ele[indice].elemento;
					
				CASE CSBT // SALIDAS DE BAJA TENSION
					delete from  sgd_salbt where codigo=:ele[indice].elemento;
					
				END CHOOSE
			
			if sqlca.sqlcode<>0 then
				 gnu_u_transaction.uf_rollback()
				 return(0)
			end if
			
								
						
						
				END CHOOSE						
								
		next
		
		
		retorno=1
	
								
	else	
		// Borra las instalaciones modificadas en el trabajo.
	delete from sgd_salbt where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if

	delete from sgd_trafo_mb where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if

	delete from sgd_ct where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if

	delete from sgd_tramo where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if

	delete from sgd_tramo_bt where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if
	
	delete from sgd_salmt where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if

	delete from sgd_subestac where bdi_job = :pl_trabajo;
	if sqlca.sqlcode=-1 then 
 		gnu_u_transaction.uf_rollback()
		return(0)
	end if
	retorno=1
	
end if
return(retorno)
end function

public function integer of_baja_trabajo (long pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_baja_trabajo
//
//  Argumentos : long  pl_trabajo --> codigo del trabajo
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Borra gr$$HEX1$$e100$$ENDHEX$$fica y alfanumericamente las instalaciones de un trabajo-
//	
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 09/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int retorno
// Borrado de los elementos alfanumericos del trabajo
retorno=of_bdicico(pl_trabajo,false)
if retorno=1 then 
// Borrado del trabajo y sus elementos graficos
	retorno=GSivBajaTrabajo(sesion,pl_trabajo)
	if retorno=1 then 
		//commit;
		gnu_u_transaction.uf_commit()
	else 
		//rollback;
		gnu_u_transaction.uf_rollback()
	end if
else 
	//rollback;
	gnu_u_transaction.uf_rollback()
end if
return(retorno)


 
 
end function

public function integer of_borra_registro (long class_id, long class_mem, integer pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_borra_registro
//
//  Argumentos : class_id --> class_id de la instalacion.
//					  class_mem --> class_mem de la instalacion.
//					  pl_trabajo --> codigo del trabajo.
//
//  Funci$$HEX1$$f300$$ENDHEX$$n: Borra instalaciones que se han dado de alta en el trabajo.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



int retorno=1
CONSTANT int ALTA_ALFA=32
CHOOSE CASE class_id
					
				CASE CSUB // SUBESTACION
				  DELETE FROM "SGD_SUBESTAC"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;

				CASE CCT,CCD //CT
				  DELETE FROM "SGD_CT"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;
				
				CASE CTM // TRAMOS DE MEDIA
				  DELETE FROM "SGD_TRAMO"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;
				
						
				CASE CTB // TRAMOS DE BAJA
				  DELETE FROM "SGD_TRAMO_BT"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;
				
				
				
				CASE CTRM // TRAFOS
				  DELETE FROM "SGD_TRAFO_MB"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;
				
				CASE CSMT  // LINEAS
				  DELETE FROM "SGD_SALMT"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;
				
				CASE CSBT // SALIDAS DE BAJA TENSION
				  DELETE FROM "SGD_SALBT"  
			   	WHERE ( "CODIGO" = :class_mem ) AND
         		("BDI_JOB" = :pl_trabajo )   ;
				
				END CHOOSE
			
			if sqlca.sqlcode<>0 then
				  return(0)
			end if
retorno=GSivQuitaBloqueo(sesion,class_id,class_mem,pl_trabajo,ALTA_ALFA)
return(retorno)
end function

public function integer of_cambia_estado (long class_id, long class_mem, long pl_trabajo, integer estado);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_cambia_estado
//
//  Argumentos : class_id --> class_id de la instalacion.
//					  class_mem --> class_mem de la instalacion.
//					  pl_trabajo --> codigo del trabajo.
//					  estado --> Estado que se va a poner
//
//  Funci$$HEX1$$f300$$ENDHEX$$n: Cambia el estado a aquellas instalaciones que han sido modificadas
//           previamente en el trabajo.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




char blq_usuario[100]
long blq_trabajo



int retorno=1

		CHOOSE CASE class_id
					
				CASE CSUB // SUBESTACION
				  UPDATE "SGD_SUBESTAC"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;



				CASE CCT,CCD //CT
					UPDATE "SGD_CT"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;

				
				CASE CTM // TRAMOS
					UPDATE "SGD_TRAMO"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;

				
				CASE CTB // TRAMOS DE BAJA
					UPDATE "SGD_TRAMO_BT"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;

								
				CASE CTRM // TRAFOS
					UPDATE "SGD_TRAFO_MB"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;

				  
				
				CASE CSMT  // LINEAS
					UPDATE "SGD_SALMT"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;

				  
				CASE CSBT // SALIDAS DE BAJA TENSION
					UPDATE "SGD_SALBT"  
    					 SET "STATFLG" = :estado  
				   WHERE ( "CODIGO" = :class_mem ) AND  
         		("BDI_JOB" = :pl_trabajo )   ;

				  
				
				END CHOOSE
			
			if sqlca.sqlcode<>0 then
				  return(0)
			end if
			
			retorno=GSivBloqueaElto(sesion,class_id,class_mem,pl_trabajo,estado, blq_trabajo,blq_usuario)
		return(retorno)
end function

public function integer of_pon_en_explotacion (long pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_pon_en_explotacion
//
//  Argumentos : long  pl_trabajo --> codigo del trabajo
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Pone en explotaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica y alfanumericamente las instalaciones 
//				  asociadas al trabajo.
//	
//
//  Valores de retorno :  0  --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 09/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int retorno
string ls_actualizar
// Puesta en explotaci$$HEX1$$f300$$ENDHEX$$n alfanum$$HEX1$$e900$$ENDHEX$$rica
retorno=of_bdicico(pl_trabajo,true)
if retorno=1 then 
// Puesta en explotacion gr$$HEX1$$e100$$ENDHEX$$fica
	retorno=GSivTerminarTrabajo(sesion, pl_trabajo) 
	if retorno=1 then 
		//commit;
		gnu_u_transaction.uf_commit()
	//Puesta en explotacion grafica en los otros ONIS	
	  ls_actualizar=ProfileString("opensgi.ini", "SIV_SERVER", "actualizar", "si")	
	  if ls_actualizar="si" then	of_actualizar_servidores(pl_trabajo)
	else
		//rollback;
		gnu_u_transaction.uf_rollback()
	end if
else
	//rollback;
	gnu_u_transaction.uf_rollback()
end if
return(retorno)


end function

public function integer of_divide ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_divide
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Divide un tramo por un ct o punto								
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 11/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno=0
string parametro, valor
parametro="Snap"
valor="3"
double x,y
long clase, codigo

GSivSetParamV(sesion,ventana,parametro,valor) 
retorno=GSivPickByPointLocator(sesion,ventana,clase,codigo, x,y)
if retorno=1 and clase=CTM then 
	instalaciones[1].class_id=clase
	instalaciones[1].class_id=codigo
	instalaciones[1].grafico=true
	instalaciones[1].x=x
	instalaciones[1].y=y
	if retorno=1 then
		retorno=GSivEdicion(sesion, ventana,"edita "+string(clase)+" "+string(codigo)) 
		if retorno=1 then 
			retorno=GSivEdicion(sesion, ventana,"dividir") 
		end if	
	end if
elseif clase<>CTM then 
	retorno=0
end if	
if retorno<>1 then 
	GSivEdicion(sesion,ventana,"abandonar")
	GSivQuitarBlink(sesion,ventana)
end if
return(retorno)




end function

public function integer of_duplica_registro (long class_id, long class_mem, long trabajo_sel, integer estado_sel, long codigo_ins, long trabajo_ins, integer estado_ins);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_duplica_registro
//
//  Argumentos :  class_id --> Class_id de la instalacion selec.
//						class_mem -->Codigo de la instalacion selec
//						trabajo_sel -->Codigo del trabajo selec.
//						estado_sel -->Estado de la instalacion selec.
//						codigo_ins -->Codigo de la instalacion a insertar
//                trabajo_ins --> Codigo del trabajo a insertar
//						estado_ins --> Estado de la instalacion a insertar 
//  Funci$$HEX1$$f300$$ENDHEX$$n: Inserta un registro de la instalacion  con bdi_job=trabajo_ins y 
//					statflag=estado_ins
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



int retorno=1
char blq_usuario[100]
long blq_trabajo



CHOOSE CASE class_id
					
				CASE CSUB // SUBESTACION
		  INSERT INTO "SGD_SUBESTAC"  
         ( "STATFLG",   
           "BDI_JOB",   
           "TEL_INTERIOR",   

           "TEL_EXTERIOR",   
           "TENSION",   
           "ACCESO",   
           "PARQUE_TEN",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "ESQUEMA",   
           "CANT_CLIENTES",   
           "CANT_CLIENTES_IMP",   
           "CLASS_ID",   
           "POTENCIA_INSTALADA",   
           "SUPERFICIE",   
           "CUADROMANDO",   
           "UPS",   
           "EQ_INTRUS",   
           "NO_EQ_INCEN",   
           "TEQ_INCEN",   
           "POTENCIA_CONTRATADA",   
           "PROPIEDAD",   
           "FECHASER",   
           "NOMBRE",   
           "MATRICULA",   
           "INSTALACION_ORIGEN",   
           "DESCRIPCION",   
           "NRO_CALLE",   
           "NRO_PUERTA",   
           "DUPLICADOR",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "CODIGO" )  
     SELECT :estado_ins,   
            :trabajo_ins,   
            "SGD_SUBESTAC"."TEL_INTERIOR",   
            "SGD_SUBESTAC"."TEL_EXTERIOR",   
            "SGD_SUBESTAC"."TENSION",   
            "SGD_SUBESTAC"."ACCESO",   
            "SGD_SUBESTAC"."PARQUE_TEN",   
            "SGD_SUBESTAC"."FECHA_CES",   
            "SGD_SUBESTAC"."CEDIDA_A",   
            "SGD_SUBESTAC"."ESQUEMA",   
            "SGD_SUBESTAC"."CANT_CLIENTES",   
            "SGD_SUBESTAC"."CANT_CLIENTES_IMP",   
            "SGD_SUBESTAC"."CLASS_ID",   
            "SGD_SUBESTAC"."POTENCIA_INSTALADA",   
            "SGD_SUBESTAC"."SUPERFICIE",   
            "SGD_SUBESTAC"."CUADROMANDO",   
            "SGD_SUBESTAC"."UPS",   
            "SGD_SUBESTAC"."EQ_INTRUS",   
            "SGD_SUBESTAC"."NO_EQ_INCEN",   
            "SGD_SUBESTAC"."TEQ_INCEN",   
            "SGD_SUBESTAC"."POTENCIA_CONTRATADA",   
            "SGD_SUBESTAC"."PROPIEDAD",   
            "SGD_SUBESTAC"."FECHASER",   
            "SGD_SUBESTAC"."NOMBRE",   
            "SGD_SUBESTAC"."MATRICULA",   
            "SGD_SUBESTAC"."INSTALACION_ORIGEN",   
            "SGD_SUBESTAC"."DESCRIPCION",   
            "SGD_SUBESTAC"."NRO_CALLE",   
            "SGD_SUBESTAC"."NRO_PUERTA",   
            "SGD_SUBESTAC"."DUPLICADOR",   
            "SGD_SUBESTAC"."NRO_CENTRO",   
            "SGD_SUBESTAC"."NRO_CMD",   
            "SGD_SUBESTAC"."NRO_MESA",   
            "SGD_SUBESTAC"."USUARIO",   
            "SGD_SUBESTAC"."F_ACTUAL",   
            "SGD_SUBESTAC"."PROGRAMA",   
            :codigo_ins
       FROM "SGD_SUBESTAC"  
      WHERE ( "SGD_SUBESTAC"."CODIGO" = :class_mem ) AND  
            ( "SGD_SUBESTAC"."BDI_JOB" = :trabajo_sel )   ;

             //INSERT INTO ...
				CASE CCT,CCD //CT
				  INSERT INTO "SGD_CT"  
         ( "STATFLG",   
           "BDI_JOB",   
           "ALIMENTACION",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "POT_CONT12",   
           "POT_CONT2",   
           "POT_CONT1",   
           "POT_12",   
           "POT_2",   
           "POT_1",   
           "ESQUEMA",   
           "POTENCIA_CONTRATADA",   
           "FABRICANTE",   
           "TELEMAN",   
           "PRINCIPAL",   
           "CLASS_ID",   
           "CANT_CLIENTES",   
           "INSTALACION_ORIGEN",   
           "TIPO_CENTRO",   
           "ALTO",   
           "SUPERFICIE",   
           "MAQUINA",   
           "MODCONS",   
           "ACCESO",   
           "TIP_EDIF",   
           "TEN_SER_M",   
           "POTENCIA_INSTALADA",   
           "FECHASER",   
           "CENTRO",   
           "PROPIEDAD",   
           "NOMBRE",   
           "MATRICULA",   
           "AMPLIA",   
           "CANT_CLIENTES_IMP",   
           "NRO_CALLE",   
           "NRO_PUERTA",   
           "DUPLICADOR",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
            "CODIGO" )  
     SELECT :estado_ins,   
            :trabajo_ins,   
            "SGD_CT"."ALIMENTACION",   
            "SGD_CT"."FECHA_CES",   
            "SGD_CT"."CEDIDA_A",   
            "SGD_CT"."POT_CONT12",   
            "SGD_CT"."POT_CONT2",   
            "SGD_CT"."POT_CONT1",   
            "SGD_CT"."POT_12",   
            "SGD_CT"."POT_2",   
            "SGD_CT"."POT_1",   
            "SGD_CT"."ESQUEMA",   
            "SGD_CT"."POTENCIA_CONTRATADA",   
            "SGD_CT"."FABRICANTE",   
            "SGD_CT"."TELEMAN",   
            "SGD_CT"."PRINCIPAL",   
            "SGD_CT"."CLASS_ID",   
            "SGD_CT"."CANT_CLIENTES",   
            "SGD_CT"."INSTALACION_ORIGEN",   
            "SGD_CT"."TIPO_CENTRO",   
            "SGD_CT"."ALTO",   
            "SGD_CT"."SUPERFICIE",   
            "SGD_CT"."MAQUINA",   
            "SGD_CT"."MODCONS",   
            "SGD_CT"."ACCESO",   
            "SGD_CT"."TIP_EDIF",   
            "SGD_CT"."TEN_SER_M",   
            "SGD_CT"."POTENCIA_INSTALADA",   
            "SGD_CT"."FECHASER",   
            "SGD_CT"."CENTRO",   
            "SGD_CT"."PROPIEDAD",   
            "SGD_CT"."NOMBRE",   
            "SGD_CT"."MATRICULA",   
            "SGD_CT"."AMPLIA",   
            "SGD_CT"."CANT_CLIENTES_IMP",   
            "SGD_CT"."NRO_CALLE",   
            "SGD_CT"."NRO_PUERTA",   
            "SGD_CT"."DUPLICADOR",   
            "SGD_CT"."NRO_CENTRO",   
            "SGD_CT"."NRO_CMD",   
            "SGD_CT"."NRO_MESA",   
            "SGD_CT"."USUARIO",   
            "SGD_CT"."F_ACTUAL",   
            "SGD_CT"."PROGRAMA",   
            :codigo_ins
       FROM "SGD_CT"  
      WHERE ( "SGD_CT"."BDI_JOB" = :trabajo_sel ) AND  
            ( "SGD_CT"."CODIGO" = :class_mem )   ;

			CASE CTB // TRAMOS DE BAJA
			  INSERT INTO "SGD_TRAMO_BT"  
         ( "CODIGO",   
           "CLASS_ID",   
           "BDI_JOB",   
           "STATFLG",   
           "MATRICULA",   
           "INSTALACION_ORIGEN",   
           "ESTA_EN",   
           "ESTA_EN1",   
           "CONDUCTOR",   
           "TENSION",   
           "LONGITUD",   
           "TIPO",
			  "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA")  
     SELECT :codigo_ins,
            "SGD_TRAMO_BT"."CLASS_ID",  
            :trabajo_ins,
				:estado_ins, 
            "SGD_TRAMO_BT"."MATRICULA",   
            "SGD_TRAMO_BT"."INSTALACION_ORIGEN",   
            "SGD_TRAMO_BT"."ESTA_EN",   
            "SGD_TRAMO_BT"."ESTA_EN1",   
            "SGD_TRAMO_BT"."CONDUCTOR",   
            "SGD_TRAMO_BT"."TENSION",   
            "SGD_TRAMO_BT"."LONGITUD",   
            "SGD_TRAMO_BT"."TIPO",
   		   "SGD_TRAMO_BT"."USUARIO",   
            "SGD_TRAMO_BT"."F_ACTUAL",   
            "SGD_TRAMO_BT"."PROGRAMA"
       FROM "SGD_TRAMO_BT"  
	    WHERE ( "SGD_TRAMO_BT"."BDI_JOB" = :trabajo_sel ) AND  
            ( "SGD_TRAMO_BT"."CODIGO" = :class_mem )   ;


				
			CASE CTM // TRAMOS DE MEDIA
			INSERT INTO "SGD_TRAMO"  
         ( "STATFLG",   
           "BDI_JOB",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "ESTRUCTURA",   
           "CLASS_ID",   
           "FECHASER",   
           "FABRICANTE",   
           "MATRICULA",   
           "MODCONS",   
           "INSTALACION_ORIGEN",   
           "IMPENDANCIA",   
           "X",   
           "R",   
           "TIP_CANAL",   
           "LONGITUD",   
           "TIPO_TRAMO",   
           "PROPIEDAD",   
           "CODIGO",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA" )  
     SELECT :estado_ins,   
            :trabajo_ins,
            "SGD_TRAMO"."FECHA_CES",   
            "SGD_TRAMO"."CEDIDA_A",   
            "SGD_TRAMO"."ESTRUCTURA",   
            "SGD_TRAMO"."CLASS_ID",   
            "SGD_TRAMO"."FECHASER",   
            "SGD_TRAMO"."FABRICANTE",   
            "SGD_TRAMO"."MATRICULA",   
            "SGD_TRAMO"."MODCONS",   
            "SGD_TRAMO"."INSTALACION_ORIGEN",   
            "SGD_TRAMO"."IMPENDANCIA",   
            "SGD_TRAMO"."X",   
            "SGD_TRAMO"."R",   
            "SGD_TRAMO"."TIP_CANAL",   
            "SGD_TRAMO"."LONGITUD",   
            "SGD_TRAMO"."TIPO_TRAMO",   
            "SGD_TRAMO"."PROPIEDAD",   
				:codigo_ins,
            "SGD_TRAMO"."NRO_CENTRO",   
            "SGD_TRAMO"."NRO_CMD",   
            "SGD_TRAMO"."NRO_MESA",   
            "SGD_TRAMO"."USUARIO",   
            "SGD_TRAMO"."F_ACTUAL",   
            "SGD_TRAMO"."PROGRAMA"  
       FROM "SGD_TRAMO"  
      WHERE ( "SGD_TRAMO"."BDI_JOB" = :trabajo_sel ) AND  
            ( "SGD_TRAMO"."CODIGO" = :class_mem )   ;

				
				CASE CTRM // TRAFOS
			INSERT INTO "SGD_TRAFO_MB"  
         ( "CODIGO",   
           "ESTA_EN",   
           "MODCONS",   
           "FABRICANTE",   
           "MODELO",   
           "NOSERIE",   
           "ANOFAB",   
           "POTENCIA_CONTRATADA",   
           "CANT_CLIENTES",   
           "CANT_CLIENTES_IMP",   
           "FECHASER",   
           "POTENCIA_NOMINAL",   
           "INSTALACION_ORIGEN",   
           "DESCRIPCION",   
           "CLASS_ID",   
           "MATRICULA",   
           "NOMBRE",   
           "DIELECTRICO",   
           "TERMOMETRO",   
           "SONDA_TERMICA",   
           "CONT_ENER",   
           "AMP_MAX",   
           "ESQUEMA",   
           "REL_CON_1",   
           "REL_CON_21",   
           "REL_CON_22",   
           "NAT_PUEN",   
           "TIP_CON_TEN",   
           "DEP_EXP",   
           "CON_ETIQ",   
           "MAT_CELDA",   
           "PROPIEDAD",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "BDI_JOB",   
           "STATFLG",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA" )  
     SELECT :codigo_ins,
            "SGD_TRAFO_MB"."ESTA_EN",   
            "SGD_TRAFO_MB"."MODCONS",   
            "SGD_TRAFO_MB"."FABRICANTE",   
            "SGD_TRAFO_MB"."MODELO",   
            "SGD_TRAFO_MB"."NOSERIE",   
            "SGD_TRAFO_MB"."ANOFAB",   
            "SGD_TRAFO_MB"."POTENCIA_CONTRATADA",   
            "SGD_TRAFO_MB"."CANT_CLIENTES",   
            "SGD_TRAFO_MB"."CANT_CLIENTES_IMP",   
            "SGD_TRAFO_MB"."FECHASER",   
            "SGD_TRAFO_MB"."POTENCIA_NOMINAL",   
            "SGD_TRAFO_MB"."INSTALACION_ORIGEN",   
            "SGD_TRAFO_MB"."DESCRIPCION",   
            "SGD_TRAFO_MB"."CLASS_ID",   
            "SGD_TRAFO_MB"."MATRICULA",   
            "SGD_TRAFO_MB"."NOMBRE",   
            "SGD_TRAFO_MB"."DIELECTRICO",   
            "SGD_TRAFO_MB"."TERMOMETRO",   
            "SGD_TRAFO_MB"."SONDA_TERMICA",   
            "SGD_TRAFO_MB"."CONT_ENER",   
            "SGD_TRAFO_MB"."AMP_MAX",   
            "SGD_TRAFO_MB"."ESQUEMA",   
            "SGD_TRAFO_MB"."REL_CON_1",   
            "SGD_TRAFO_MB"."REL_CON_21",   
            "SGD_TRAFO_MB"."REL_CON_22",   
            "SGD_TRAFO_MB"."NAT_PUEN",   
            "SGD_TRAFO_MB"."TIP_CON_TEN",   
            "SGD_TRAFO_MB"."DEP_EXP",   
            "SGD_TRAFO_MB"."CON_ETIQ",   
            "SGD_TRAFO_MB"."MAT_CELDA",   
            "SGD_TRAFO_MB"."PROPIEDAD",   
            "SGD_TRAFO_MB"."FECHA_CES",   
            "SGD_TRAFO_MB"."CEDIDA_A",   
            :trabajo_ins,
				:estado_ins,
            "SGD_TRAFO_MB"."NRO_CENTRO",   
            "SGD_TRAFO_MB"."NRO_CMD",   
            "SGD_TRAFO_MB"."NRO_MESA",   
            "SGD_TRAFO_MB"."USUARIO",   
            "SGD_TRAFO_MB"."F_ACTUAL",   
            "SGD_TRAFO_MB"."PROGRAMA"  
       FROM "SGD_TRAFO_MB"  
      WHERE ( "SGD_TRAFO_MB"."CODIGO" = :class_mem ) AND  
            ( "SGD_TRAFO_MB"."BDI_JOB" = :trabajo_sel )   ;

				  
				
				CASE CSMT  // LINEAS
		  INSERT INTO "SGD_SALMT"  
         ( "STATFLG",   
           "BDI_JOB",   
           "INS_FINAL",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "MATRICULA",   
           "POSICION",   
           "POTENCIA_CONTRATADA",   
           "LINEA_AUX",   
           "CANT_CLIENTES",   
           "CANT_CLIENTES_IMP",   
           "POTENCIA_INSTALADA",   
           "KM_SUBT",   
           "KM_AEREA",   
           "FECHASER",   
           "PROPIEDAD",   
           "TEN_SER",   
           "NOMBRE",   
           "DESCRIPCION",   
           "INSTALACION_ORIGEN",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "CODIGO",   
           "CLASS_ID",   
           "ESTA_EN" )  
     SELECT :estado_ins,
				:trabajo_ins,
            "SGD_SALMT"."INS_FINAL",   
            "SGD_SALMT"."FECHA_CES",   
            "SGD_SALMT"."CEDIDA_A",   
            "SGD_SALMT"."MATRICULA",   
            "SGD_SALMT"."POSICION",   
            "SGD_SALMT"."POTENCIA_CONTRATADA",   
            "SGD_SALMT"."LINEA_AUX",   
            "SGD_SALMT"."CANT_CLIENTES",   
            "SGD_SALMT"."CANT_CLIENTES_IMP",   
            "SGD_SALMT"."POTENCIA_INSTALADA",   
            "SGD_SALMT"."KM_SUBT",   
            "SGD_SALMT"."KM_AEREA",   
            "SGD_SALMT"."FECHASER",   
            "SGD_SALMT"."PROPIEDAD",   
            "SGD_SALMT"."TEN_SER",   
            "SGD_SALMT"."NOMBRE",   
            "SGD_SALMT"."DESCRIPCION",   
            "SGD_SALMT"."INSTALACION_ORIGEN",   
            "SGD_SALMT"."NRO_CENTRO",   
            "SGD_SALMT"."NRO_CMD",   
            "SGD_SALMT"."NRO_MESA",   
            "SGD_SALMT"."USUARIO",   
            "SGD_SALMT"."F_ACTUAL",   
            "SGD_SALMT"."PROGRAMA",   
				:codigo_ins,
            "SGD_SALMT"."CLASS_ID",   
            "SGD_SALMT"."ESTA_EN"  
       FROM "SGD_SALMT"  
      WHERE ( "SGD_SALMT"."BDI_JOB" = :trabajo_sel ) AND  
            ( "SGD_SALMT"."CODIGO" = :class_mem )   ;

				  
				CASE CSBT // SALIDAS DE BAJA TENSION
				  
				  INSERT INTO "SGD_SALBT"  
         ( "STATFLG",   
           "BDI_JOB",   
           "DESCRIPCION",   
           "MATRICULA",   
           "TENSION",   
           "CLASS_ID",   
           "TIP_SAL",   
           "ESTA_EN",   
           "INSTALACION_ORIGEN",   
           "TIPO_COND",   
           "CANT_CLIENTES",   
           "CANT_CLIENTES_IMP",   
           "POTENCIA_CONTRATADA",   
           "NOMBRE",   
           "PROPIEDAD",   
           "COD_TRAFO",   
           "CODIGO",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA" )  
     SELECT :estado_ins ,  
				:trabajo_ins,
            "SGD_SALBT"."DESCRIPCION",   
            "SGD_SALBT"."MATRICULA",   
            "SGD_SALBT"."TENSION",   
            "SGD_SALBT"."CLASS_ID",   
            "SGD_SALBT"."TIP_SAL",   
            "SGD_SALBT"."ESTA_EN",   
            "SGD_SALBT"."INSTALACION_ORIGEN",   
            "SGD_SALBT"."TIPO_COND",   
            "SGD_SALBT"."CANT_CLIENTES",   
            "SGD_SALBT"."CANT_CLIENTES_IMP",   
            "SGD_SALBT"."POTENCIA_CONTRATADA",   
            "SGD_SALBT"."NOMBRE",   
            "SGD_SALBT"."PROPIEDAD",   
            "SGD_SALBT"."COD_TRAFO",   
            :codigo_ins,
            "SGD_SALBT"."NRO_CENTRO",   
            "SGD_SALBT"."NRO_CMD",   
            "SGD_SALBT"."NRO_MESA",   
            "SGD_SALBT"."USUARIO",   
            "SGD_SALBT"."F_ACTUAL",   
            "SGD_SALBT"."PROGRAMA"  
       FROM "SGD_SALBT"  
      WHERE ( "SGD_SALBT"."BDI_JOB" = :trabajo_sel ) AND  
            ( "SGD_SALBT"."CODIGO" = :class_mem )   ;

				
				
				END CHOOSE
			
			if sqlca.sqlcode<>0 then
				  return(0)
			end if
retorno=GSivBloqueaElto(sesion,class_id,codigo_ins,trabajo_ins,estado_ins, blq_trabajo,blq_usuario)		
return(retorno)
end function

public function integer of_graba_borra ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_graba_borra
//
//  Argumentos : 			
//  Funci$$HEX1$$f300$$ENDHEX$$n: Graba el borrado de una instalacion.									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//								  2 --> Correcto y se ha borrado una instalacion con estado=32
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno=1, estado=0
long ll_class_id, ll_class_mem
boolean grafico

ll_class_id=instalaciones[1].class_id
ll_class_mem=instalaciones[1].class_mem
grafico=instalaciones[1].grafico
if grafico then
	retorno=GSivEdicion(sesion, ventana,"edita "+string(ll_class_id)+" "+string(ll_class_mem)) 
	if retorno=1 then 
		retorno=GSivEdicion(sesion, ventana,"borrar_ent") 
		retorno=GSivEdicion(sesion, ventana,"salvar") 
	else
		return(retorno)
end if
end if

  SELECT "STAT_FLG"  
    INTO :estado
    FROM "SGD_INSTALACION"  
   WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = :ll_class_mem ) AND  
         ( "SGD_INSTALACION"."BDI_JOB" = :this.trabajo )   ;

 if sqlca.sqlcode<0 then 
	return(0)
  end if
  
  CHOOSE CASE estado
	CASE  0 // EXPLOTACION
		retorno=of_duplica_registro(ll_class_id,ll_class_mem,0,0,ll_class_mem,this.trabajo,128)

	CASE  64 // MODIFICACIONES
		retorno=of_cambia_estado(ll_class_id,ll_class_mem,this.trabajo,128)
		
	CASE  32 // ALTAS
	   retorno=of_borra_registro(ll_class_id,ll_class_mem,this.trabajo)	
		if retorno=1 then retorno=2
		//HACE EL COMMIT DESPUES
 	END CHOOSE
	
if retorno=1 then
	//commit;
	gnu_u_transaction.uf_commit()
elseif retorno=0 then
	//rollback;
	gnu_u_transaction.uf_rollback()
end if
return(retorno)
end function

public function integer of_graba_amalgama ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : fg_graba_amalgama
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Graba el amalgamiento de dos tramos.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno

retorno=of_graba_borra()
if retorno=1 then 
  retorno=GSivEdicion(sesion,ventana,"salvar")
end if
return(retorno)
end function

public function integer of_graba_digitaliza (long pl_class_id, ref long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_graba_digitaliza
//
//  Argumentos : long pl_class_id --> Class_id de la instalacion
//					  long pl_codigo  ---> Codigo de la instalacion
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Inserta una instalacion en la base de datos y la bloquea.							
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//								  pl_codigo --> Codigo de la instalaci$$HEX1$$f300$$ENDHEX$$n.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

// MODIFICAR  BASE DATOS

int retorno

char  blq_usuario[100]
long blq_trabajo

CONSTANT int ALTA_ALFA=32
CONSTANT long CODIGO_FICTICIO=1
retorno=of_ult_codigo (pl_class_id,pl_codigo)
if retorno=0 then 
	return(0)
end if

CHOOSE CASE pl_class_id
		
	CASE CCT, CCD // CT
		  INSERT INTO "SGD_CT"  
         ( "STATFLG",   
           "BDI_JOB",   
           "ALIMENTACION",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "POT_CONT12",   
           "POT_CONT2",   
           "POT_CONT1",   
           "POT_12",   
           "POT_2",   
           "POT_1",   
           "ESQUEMA",   
           "POTENCIA_CONTRATADA",   
           "FABRICANTE",   
           "TELEMAN",   
           "PRINCIPAL",   
           "CLASS_ID",   
           "CANT_CLIENTES",   
           "INSTALACION_ORIGEN",   
           "TIPO_CENTRO",   
           "ALTO",   
           "SUPERFICIE",   
           "MAQUINA",   
           "MODCONS",   
           "ACCESO",   
           "TIP_EDIF",   
           "TEN_SER_M",   
           "POTENCIA_INSTALADA",   
           "FECHASER",   
           "CENTRO",   
           "PROPIEDAD",   
           "NOMBRE",   
           "MATRICULA",   
           "AMPLIA",   
           "CANT_CLIENTES_IMP",   
           "NRO_CALLE",   
           "NRO_PUERTA",   
           "DUPLICADOR",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "CODIGO" )  
  VALUES ( 32,   
           :this.trabajo,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   

           null,   
           null,   
           :pl_class_id,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           :il_CENTRO,   
           :il_CMD,   
           :il_puesto,    
           null,   
           null,   
           null,   
           :pl_codigo)  ;

	CASE CTB
		  INSERT INTO "SGD_TRAMO_BT"  
         ( "CODIGO",   
           "CLASS_ID",   
           "BDI_JOB",   
           "STATFLG",   
           "MATRICULA",   
           "INSTALACION_ORIGEN",   
           "ESTA_EN",   
           "ESTA_EN1",   
           "CONDUCTOR",   
           "TENSION",   
           "LONGITUD",   
           "TIPO",
			   "USUARIO",   
            "F_ACTUAL",   
            "PROGRAMA")  
  VALUES ( :pl_codigo,   
           :pl_class_id,   
           :this.trabajo,   
           32,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,
			  :gs_usuario,
			  sysdate,
			  'MANT_INST')  ;

		
		
		
	
	CASE CTM 
		   INSERT INTO "SGD_TRAMO"  
         ( "STATFLG",   
           "BDI_JOB",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "ESTRUCTURA",   
           "CLASS_ID",   
           "FECHASER",   
           "FABRICANTE",   
           "MATRICULA",   
           "MODCONS",   
           "INSTALACION_ORIGEN",   
           "IMPENDANCIA",   
           "X",   
           "R",   
           "TIP_CANAL",   
           "LONGITUD",   
           "TIPO_TRAMO",   
           "PROPIEDAD",   
           "CODIGO",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA" )  
  VALUES ( 32,   
           :trabajo,   
           null,   
           null,   
           null,   
           :pl_class_id,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           :pl_codigo,   
           :il_CENTRO,   
           :il_CMD,   
           :il_puesto,   
           null,   
           null,   
           null )  ;


		

	CASE CSUB // SUBESTACION

    INSERT INTO "SGD_SUBESTAC"  
         ( "STATFLG",   
           "BDI_JOB",   
           "TEL_INTERIOR",   
           "TEL_EXTERIOR",   
           "TENSION",   
           "ACCESO",   
           "PARQUE_TEN",   
           "FECHA_CES",   
           "CEDIDA_A",   
           "ESQUEMA",   
           "CANT_CLIENTES",   
           "CANT_CLIENTES_IMP",   
           "CLASS_ID",   
           "POTENCIA_INSTALADA",   
           "SUPERFICIE",   
           "CUADROMANDO",   
           "UPS",   
           "EQ_INTRUS",   
           "NO_EQ_INCEN",   
           "TEQ_INCEN",   
           "POTENCIA_CONTRATADA",   
           "PROPIEDAD",   
           "FECHASER",   
           "NOMBRE",   
           "MATRICULA",   
           "INSTALACION_ORIGEN",   
           "DESCRIPCION",   
           "NRO_CALLE",   
           "NRO_PUERTA",   
           "DUPLICADOR",   
           "NRO_CENTRO",   
           "NRO_CMD",   
           "NRO_MESA",   
           "USUARIO",   
           "F_ACTUAL",   
           "PROGRAMA",   
           "CODIGO" )  
  VALUES ( 32,   
           :trabajo,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           :pl_class_id,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           null,   
           :il_CENTRO,   
           :il_CMD,   
           :il_puesto,    
           null,   
           null,   
           null,   
           :pl_codigo )  ;


END CHOOSE

if sqlca.sqlcode<>0 then
	//rollback;
	gnu_u_transaction.uf_rollback()
   return(0)
end if


retorno=GSivEdicion(sesion, ventana,"codigo_ent "+string(pl_class_id)+" "+string(pl_codigo))
if retorno<>1 then 
	return(0)
end if

retorno=GSivEdicion(sesion, ventana,"salvar")
if retorno<>1 then 
	return(0)
end if


retorno=GSivBloqueaElto(sesion,pl_class_id,pl_codigo,this.trabajo,ALTA_ALFA, blq_trabajo,blq_usuario)
if retorno<>1 then 
	return(0)
end if

if retorno=1 then
	//commit;
	gnu_u_transaction.uf_commit()
end if
return(retorno)
end function

public function integer of_ult_codigo (integer pi_class_id, ref long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_ult_codigo
//
//  Argumentos : int pi_class_id --> Class_id de la instalacion.
//				     long pl_codigo -->  Codigo de la instalacion.
//
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Devuelve el primer codigo valido para dar de alta una instalacion									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//								 pl_codigo --> Codigo de la instalacion
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////
int retorno=1

string tabla
CHOOSE CASE pi_class_id
		
	CASE CSUB // SUBESTACION
     tabla='sgd_subestac'
	CASE CCT,CCD // CT
		tabla='sgd_ct'
	CASE CTM 
		 tabla='sgd_tramo'
	CASE CTB
		 tabla='sgd_tramo_bt'	 
	CASE CTRM // TRAFOS_MB
		  tabla='sgd_trafo_mb'
			
	CASE CSMT  // LINEAS
			tabla='sgd_salmt'
	CASE CSBT // SALIDAS DE BAJA TENSION
			tabla='sgd_salbt'
 
END CHOOSE

	 SELECT "CODIGO"  
    INTO :pl_codigo  
    FROM "SGD_CODIGOS"  
   WHERE UPPER("SGD_CODIGOS"."NOMBRE") = UPPER(:tabla) 
	FOR UPDATE;
	if sqlca.sqlcode<>0 then 
		//rollback;
		gnu_u_transaction.uf_rollback()
		return(0)
	end if

	// Incrementamos en 1 el valor del ultimo
	pl_codigo=pl_codigo+1
	UPDATE "SGD_CODIGOS"  
     SET "CODIGO" = :pl_codigo  
   WHERE UPPER("SGD_CODIGOS"."NOMBRE") = UPPER(:tabla);
	if sqlca.sqlcode<>0 then 
		//rollback;
		gnu_u_transaction.uf_rollback()
		return(0)
	end if
	//commit;
	gnu_u_transaction.uf_commit()
return(retorno)
end function

public function integer of_graba_divide (boolean pb_por_ct);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_graba_divide
//
//  Argumentos : boolean pb_por_ct --> Indica si se divide el tramo por ct o por punto.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Divide un tramo y digitaliza un ct o punto.									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
long codigo_n_tramo // Codigo del nuevo tramo
long codigo_n // Codigo del ct o punto
long class_id_n // Clase del ct o punto
long codigo_div // Codigo del tramo dividido
int estado=0
long trabajo_sel=0
codigo_div = instalaciones[1].class_mem

// OBTENEMOS EL CODIGO DEL NUEVO TRAMO

if of_ult_codigo(CTM,codigo_n_tramo)=0 then 
  return(0)
end if


  SELECT "STAT_FLG"  
    INTO :estado
    FROM "SGD_INSTALACION"  
   WHERE ( "SGD_INSTALACION"."NRO_INSTALACION" = :codigo_div ) AND  
         ( "SGD_INSTALACION"."BDI_JOB" = :this.trabajo );

 // Si hay error o el tramo a dividir se va a borrar
 if sqlca.sqlcode<0 or estado=128 then 
	return(0)
  end if
  if sqlca.sqlcode=100 then  // No esta en el trabajo
	  trabajo_sel=0
	else  
		trabajo_sel=this.trabajo
	end if

// INSERTAMOS EL NUEVO TRAMO

 retorno=of_duplica_registro(CTM,codigo_div,trabajo_sel,estado,codigo_n_tramo,this.trabajo,32)

  if retorno=0 then
	 //rollback;
	 gnu_u_transaction.uf_rollback()
	 return(0)
	end if

 // Graba graficamente el nuevo tramo
 
  retorno=GSivEdicion(sesion,ventana,"codigo_ent CTM"+string(codigo_n_tramo))
  if retorno=1 then
	 retorno=GSivEdicion(sesion,ventana,"salvar")
	end if 
  if retorno=0 then
   	return(0)
   end if
  if pb_por_ct then 
	 class_id_n=CCT // ct
  else
	 class_id_n=1025 // punto
	end if	 
	
// Digitaliza el ct o punto.

  retorno=GSivEdicion(sesion, ventana,"inicializar") 
  if retorno=1 then 
	  retorno=GSivEdicion(sesion, ventana,"codigo_ent "+string(class_id_n)+" 0") 
     retorno=GSivEdicion(sesion, ventana,"dig_nodo "+string(instalaciones[1].x)+" "+string(instalaciones[1].y)+" 0.000000") 
 else
    //rollback;
	 gnu_u_transaction.uf_rollback()
	 return(0)
 end if
 
// Obtenemos el codigo del nuevo ct o punto y lo graba graficamente

if  of_graba_digitaliza(class_id_n,codigo_n)=0 then 
	//rollback;
	gnu_u_transaction.uf_rollback()
  return(0)
else
	GSivPonerBlink(sesion,ventana,CTM,codigo_n_tramo)
   //commit;
	gnu_u_transaction.uf_commit()
end if  
 

return(retorno)
end function

public function integer of_graba_modificacion ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_graba_modificacion
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Guarda la modificaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica realizada en la ventana.									
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 10/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
retorno=GSivEdicion(sesion, ventana,"salvar")
return(retorno)


end function

public function integer of_establece_sesion ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_establece_sesion
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Crea la conexion con el servidor grafico actualizando el puerto
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 > 0 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 04/08/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string titulo
int retorno
ulong hax
string host
long  port
int err
string puertomaquina

application app
app=getapplication()
hax=handle(app)
titulo="OPENSGI"
// Obtiene la maquina y el puerto que nos permita comunicarnos con el ONIS
setpointer(HourGlass!)
port=long(Profilestring("opensgi.ini", "SIV_SERVER", "puerto", "0"))
host=ProfileString("opensgi.ini", "SIV_SERVER", "maquina", "sfsud001")

puertomaquina=host+":"+string(port)
retorno=GSivIniciarSesion(puertomaquina)
if retorno<>0 then
	// Genera una sesion sin display
	retorno=GSivGeneraSesion("NODISPLAY",sesion);
	if retorno = 0 then
		if of_actualizar_puerto() > 0 then
			AcabaSesion()
			port=long(Profilestring("opensgi.ini", "SIV_SERVER", "puerto", "0"))
			puertomaquina=host+":"+string(port)
			GsivIniciarSesion(puertomaquina)
			retorno=GSivGeneraSesion("NODISPLAY",sesion);
		end if
	end if
end if
return(retorno)
end function

public function integer of_actualizar_puerto ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualizar_puerto
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Actualiza el puerto de ONIS almacenado en el OPENSGI.ini
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 17/06/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

string ls_maquina
string ls_comando
string ls_puerto
long ll_puerto
long ll_retorno
string nula
setnull(nula)



ls_maquina = ProfileString("OPENSGI.INI", "SIV_SERVER","maquina", "None")
if ls_maquina = "None" then
	return 0
else
	ll_puerto=puerto(ls_maquina,"/export/env/sgd/opensgi/tmp/siv")
	ls_puerto = string(ll_puerto)
		if ll_puerto=-1 then 
	 			if gnv_msg.f_mensaje("CX01","","",YesNo!)=1 then 
	  				ll_retorno=ejecuta(ls_maquina,"/export/env/sgd/opensgi/software/script2/genera_GALICIA.ksh")
					 if ll_retorno=-1 then return(0)
					gnv_msg.f_mensaje("AX02","","",Ok!)
				end if
			halt close
		elseif ll_puerto = 0 then
					
					ll_retorno = gnv_msg.f_mensaje("AX01","","",YesNo!)
					if ll_retorno = 2 then
						halt close
					end if
			open(w_espera_grafica)
			this.of_actualizar_puerto()
			return 1
		end if

		SetProfileString("OPENSGI.INI", "SIV_SERVER", "puerto", ls_puerto)
	

	return 1
end if
end function

public function integer of_cierra_sesion ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_cierra_sesion
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Cierra la  sesion.
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno

retorno=GSivDestruirSesion(sesion)
AcabaSesion()
return(retorno)
end function

public function integer of_selecciona_capa ();open(w_seleccion_capas2)
if Message.DoubleParm=1 then
	return(1)
else 
	return(0)
end if
end function

public function integer of_estado_aviso (long ll_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_estado_aviso
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n: Compruebo el estado del aviso y dibuja los graficos pertinentes
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//								  1 --> Correcto.
//								  
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 11/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



double x, xx, y, yy
long ll_clase
int li_retorno, li_contador, li_zoom, li_basura, li_factor, li_num_eltos
boolean lb_peligro, lb_cli_imp, lb_brigada, lb_brigada_espera

strsivzoomeltos elemento[500]

ll_clase = of_busca_class_id(ll_codigo)

GsivBorrarGraficoCodigo(sesion, ventana, 1, 1)
GsivBorrarGraficoCodigo(sesion, ventana, 2, 2)
GsivBorrarGraficoCodigo(sesion, ventana, 3, 3)
GsivBorrarGraficoCodigo(sesion, ventana, 4, 4)

//Con el codigo de Instalacion recibido compruebo que tipo de avisos tiene la instalacion

// Avisos de Peligro
SELECT count(*)
  INTO :li_basura
  FROM "GI_AVISOS"  
 WHERE "GI_AVISOS"."NRO_INSTALACION" = :ll_codigo  AND "GI_AVISOS"."IND_PELIGRO" = 1 ;

if li_basura > 0 then
	lb_peligro = true
end if


// Clientes Importantes	
  SELECT "GI_AVISOS_RES"."CANT_CLI_IMP"  
    INTO :li_basura
    FROM "GI_AVISOS_RES"  
   WHERE "GI_AVISOS_RES"."NRO_INSTALACION" = :ll_codigo   ;

if li_basura > 0 then
	lb_cli_imp = true
end if


// Brigada Trabajando
SELECT count(*)
  INTO :li_basura  
  FROM "GI_OT"  
 WHERE "GI_OT"."NRO_INSTALACION" = :ll_codigo AND "GI_OT"."EST_OT" = 2 ;

if li_basura > 0 then
	lb_brigada = true
end if


// Brigada Pendiente de trabajar
SELECT count(*)
  INTO :li_basura  
  FROM "GI_OT"  
 WHERE "GI_OT"."NRO_INSTALACION" = :ll_codigo AND "GI_OT"."EST_OT" = 1 ;

if li_basura > 0 then
	lb_brigada_espera = true
end if

if ll_clase = CTRM then
	select instalacion_origen into :ll_codigo from sgd_trafo_mb where codigo = :ll_codigo;
elseif ll_clase = CSBT then
	of_obten_tramos_bt(ll_codigo, elemento, li_num_eltos)
	if li_num_eltos > 1 then
		ll_clase = elemento[1].clase
		ll_codigo = elemento[1].elemento
	end if
elseif ll_clase = CSMT then
	of_obten_tramos(ll_codigo, elemento, li_num_eltos)
	if li_num_eltos > 1 then
		ll_clase = elemento[1].clase
		ll_codigo = elemento[1].elemento
	end if
end if



li_retorno = GsivMerElemento(sesion,ll_clase,ll_codigo,x,y,xx,yy)

if li_retorno <> 1 then
	return 0
end if

//Si es un CT el factor de Zoom es 10
if ll_clase = CCT then
	li_factor = 300
	li_zoom = 10
//Si es una Subestacion el factor de zoom es 50
elseif ll_clase = CSUB then
	li_factor = 500
	li_zoom = 50
end if


// Peligro
if lb_peligro = true then
	GSivDibujaGrafico(sesion, ventana, 1, 1, li_factor, x - li_zoom,   y - li_zoom, 0)
end if
// Cliente Importante
if lb_cli_imp = true then
	GSivDibujaGrafico(sesion, ventana, 2, 2, li_factor, xx + li_zoom,  y - li_zoom, 0)
end if
// Brigada Trabajando
if lb_brigada = true then
	GSivDibujaGrafico(sesion, ventana, 3, 3, li_factor, xx + li_zoom, yy + li_zoom, 0)
end if
// Brigada Espera
if lb_brigada_espera = true then
	GSivDibujaGrafico(sesion, ventana, 4, 4, li_factor, xx - li_zoom, yy + li_zoom, 0)
end if


return 0
end function

public subroutine of_obten_tramos_bt (long pl_codigo, ref strsivzoomeltos elementos[500], ref integer num_elementos);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_obten_tramos_bt
//
//  Argumentos : 	pl_codigo --> codigo de la l$$HEX1$$ed00$$ENDHEX$$nea.
//						elementos[]--> Estructura a rellenar
//               	num_elementos--> N$$HEX1$$fa00$$ENDHEX$$mero de tramos.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Rellena la matriz  elementos con los tramos de baja de la linea solicitada.									
//	
//
//  Valores de retorno :	elementos[]--> Estructura a rellenar
// 			              	num_elementos--> N$$HEX1$$fa00$$ENDHEX$$mero de tramos.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 20/05/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////





num_elementos=0
long codigo_tramo
pl_codigo=of_bdi-sgi(pl_codigo)
DECLARE tramos CURSOR FOR  
    SELECT "SGD_TRAMO_BT"."CODIGO"  
    	FROM "SGD_TRAMO_BT"  
	  WHERE "SGD_TRAMO_BT"."ESTA_EN1" = :pl_codigo   ;
 
Open tramos;


FETCH tramos INTO :codigo_tramo ;

DO WHILE sqlca.sqlcode=0
	num_elementos=num_elementos+1
	elementos[num_elementos].elemento=codigo_tramo
	elementos[num_elementos].clase=CTB
	FETCH tramos INTO :codigo_tramo ;
LOOP

close tramos;

end subroutine

public function integer of_muestra_calle (long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_muestra_calle
//
//  Argumentos : pl_codigo --> c$$HEX1$$f300$$ENDHEX$$digo del elemento a localizar.
//					  pb_blink  --> Indica si hay o no parpadeo.
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Visualiza la calle seleccionada en la ventana gr$$HEX1$$e100$$ENDHEX$$fica		
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				 				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

double x,y, xx,yy
int retorno,li_num_elementos
long ll_class_id


// BUSCAMOS EL CLASS_ID
ll_class_id=1005

// Por el momento es la $$HEX1$$fa00$$ENDHEX$$nica forma de ver si existe, en proximas versiones 
// se hara con el GSivZoomEltos.

GSivQuitarBlink (sesion,ventana)
retorno = GsivMerElemento(sesion,ll_class_id,pl_codigo,x,y,xx,yy)

if retorno <> 1 then
	return 0
end if

retorno=GSIvZoomElementoVentana(sesion,ll_class_id,pl_codigo,100,ventana);

return(retorno)
end function

public function integer of_simbolo_aviso (long codigo, boolean lb_brigada, boolean lb_cli_imp);long ll_class_id
int li_nuevo_simbolo

ll_class_id = of_busca_class_id(codigo)

if lb_brigada = true and lb_cli_imp = true then
		
		// Mostrar icono con dos graficos
	CHOOSE CASE ll_class_id
		 CASE CSUB  //Subestacion
				li_nuevo_simbolo = 7
		 CASE CTM		//Salmt
				li_nuevo_simbolo = 275
		 CASE CCT		//CT
				li_nuevo_simbolo = 10
		 CASE CTB		//BT
				li_nuevo_simbolo = 274
	END CHOOSE
		
elseif lb_brigada = true and lb_cli_imp = false then
		
		// Solo Brigada Trabajando
	CHOOSE CASE ll_class_id
		 CASE CSUB  //Subestacion
				li_nuevo_simbolo = 6
		 CASE CTM		//Salmt
				li_nuevo_simbolo = 272
		 CASE CCT		//CT
				li_nuevo_simbolo = 9
		 CASE CTB		//BT
				li_nuevo_simbolo = 270
	END CHOOSE
		
elseif lb_brigada = false and lb_cli_imp = true then
		
		// Solo Cliente Importante
	CHOOSE CASE ll_class_id
		 CASE CSUB  //Subestacion
				li_nuevo_simbolo = 5
		 CASE CTM		//Salmt
				li_nuevo_simbolo = 273
		 CASE CCT		//CT
				li_nuevo_simbolo = 8
		 CASE CTB		//BT
				li_nuevo_simbolo = 271
	END CHOOSE

end if

return li_nuevo_simbolo
end function

public function integer of_simbolo_instalaciones_bri (long pl_class_id);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_simbolo_instalaciones_bri
//
//  Argumentos : 	pl_clase --> Class_id de la instalaci$$HEX1$$f300$$ENDHEX$$n.
//
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Obtiene el simbolo que le corresponde a una instalaci$$HEX1$$f300$$ENDHEX$$n con brigada.									
//	
//
//  Valores de retorno : valor num$$HEX1$$e900$$ENDHEX$$rico del s$$HEX1$$ed00$$ENDHEX$$mbolo.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 26/05/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




CHOOSE CASE pl_class_id
	CASE CSUB // SUBESTACION
           return(6)
	CASE CCT  // CT
		  return(9)
  CASE CTM // TRAMO
		  return(272)
   CASE CTB // TRAMO
		  return(270)
  CASE ELSE 
	return 0
END CHOOSE

end function

public subroutine of_lista_instalaciones_bri (ref strsivasociaeltossimbolo elementos[], ref integer pi_num_elementos);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_lista_instalaciones_bri
//
//  Argumentos / Retorno : elementos[] --> Matriz de estructuras a rellenar
//					  				pi_num_elementos --> N$$HEX1$$fa00$$ENDHEX$$mero de elementos del array						
//
//  Funci$$HEX1$$f300$$ENDHEX$$n: Rellena las estructuras necesarias para el cambio de simbologia en las instalaciones
// con brigada.										
//	
//
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 26/05/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




long class_id, codigo, simbolo, codigo_bdi
 pi_num_elementos=0
 strsivzoomeltos tramos[500]
 int i,num_tramos=0

// CARGAMOS LAS BRIGADAS
 
  DECLARE instalaciones_con_brigadas CURSOR FOR  
  SELECT "GI_OT"."NRO_INSTALACION"  
    FROM "GI_OT"  
   WHERE ( "GI_OT"."NRO_INSTALACION" Is not Null and  "GI_OT"."NRO_INSTALACION"<> 99999998) AND  
         ( "GI_OT"."EST_OT" = 2 )   ;

 open instalaciones_con_brigadas;
 FETCH instalaciones_con_brigadas INTO :codigo ;
 DO WHILE sqlca.sqlcode=0
	codigo_bdi=of_sgi-bdi(codigo)
	class_id=of_busca_class_id(codigo_bdi)
	if class_id<>CSMT and class_id<>CSBT and class_id>0 then
		
		if class_id = CTRM then
			
			SELECT "SGD_TRAFO_MB"."INSTALACION_ORIGEN"  
			  INTO :codigo_bdi
			  FROM "SGD_TRAFO_MB"  
			 WHERE "SGD_TRAFO_MB"."CODIGO" = :codigo_bdi   ;
			
			 class_id = of_busca_class_id(codigo_bdi)
			
		end if
		
		pi_num_elementos=pi_num_elementos+1
		elementos[pi_num_elementos].elemento=codigo_bdi
		elementos[pi_num_elementos].clase=class_id
   	elementos[pi_num_elementos].simbolo=of_simbolo_instalaciones_bri(class_id)
	elseif class_id=CSMT then // LINEAS MEDIA
	   of_obten_tramos(codigo_bdi,tramos[],num_tramos)	
		class_id=CTM
		for i=1 to num_tramos
			pi_num_elementos=pi_num_elementos+1
			elementos[pi_num_elementos].elemento=tramos[i].elemento
   		elementos[pi_num_elementos].clase=tramos[i].clase
	   	elementos[pi_num_elementos].simbolo=of_simbolo_instalaciones_bri(class_id)
		next 
	elseif class_id=CSBT then // LINEAS BAJA
	   of_obten_tramos_bt(codigo_bdi,tramos[],num_tramos)	
		class_id=CTB
		for i=1 to num_tramos
			pi_num_elementos=pi_num_elementos+1
			elementos[pi_num_elementos].elemento=tramos[i].elemento
   		elementos[pi_num_elementos].clase=tramos[i].clase
	   	elementos[pi_num_elementos].simbolo=of_simbolo_instalaciones_bri(class_id)
		next 
	end if	
 FETCH instalaciones_con_brigadas INTO :codigo ;
LOOP
close instalaciones_con_brigadas; 

end subroutine

public function integer of_carga_simbologia_instalaciones_bri (boolean pb_brigadas_trabajando);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_carga_simbologia_instalaciones_bri
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Cambia los s$$HEX1$$ed00$$ENDHEX$$mbolos 	de las instalaciones con brigadas
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 26/95/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////

int retorno
int num_elementos=0
strsivasociaeltossimbolo e[]
// Obtiene las instalaciones con brigadas trabajando
if pb_brigadas_trabajando then
	of_lista_instalaciones_bri(e[],num_elementos)
else
	retorno=GSivSimbDefecto(sesion, ventana, 0) 
end if
// Cambia la simbologia de esas instalaciones
if (num_elementos>0) then 
	retorno=GSivSimbDefecto(sesion, ventana, 0) 
	retorno=GSivAsociaEltosSimbolos(sesion,e,0,num_elementos)
end if	
return(retorno)
end function

public function integer of_mostrar_estados (boolean visualizar);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_mostrar_estados
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Cambia la simbologia de todas las instalaciones segun el estado
//	
//
//  Valor de retorno : 0 Fallo
//							  1 OK								
//				  				 
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 25/05/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


// Recorro todas las instalaciones de gi_avisos
// Y compruebo el estado de cada instalacion
long ll_cod_inst, ll_class_id
int li_nuevo_simbolo, li_basura, li_retorno, li_num_elementos = 0, li_num_tramos = 0, li_i

boolean lb_cli_imp, lb_brigada

strsivasociaeltossimbolo elementos[]
strsivzoomeltos tramos[500]

Setpointer(HourGlass!)

GsivBorrarGraficoCodigo(sesion, ventana, 1, 1)
GsivBorrarGraficoCodigo(sesion, ventana, 2, 2)
GsivBorrarGraficoCodigo(sesion, ventana, 3, 3)
GsivBorrarGraficoCodigo(sesion, ventana, 4, 4)

Setpointer(HourGlass!)

if not visualizar then
	return GSivSimbDefecto(sesion, ventana, 0) 	
end if

// Cambia la simbologia de esas instalaciones

 DECLARE cu_avisos CURSOR FOR  
  SELECT "GI_AVISOS_RES"."NRO_INSTALACION"  
    FROM "GI_AVISOS_RES"  
   WHERE "GI_AVISOS_RES"."NRO_INSTALACION" not in (:fgcdec_aviso_alumbrado_publico, 
																	:fgcdec_aviso_de_ayuda, 
																	:fgcdec_aviso_sin_alimentacion, 
																	:fgcdec_aviso_con_alimentacion)   ;


open cu_avisos;

fetch cu_avisos into :ll_cod_inst;
do while sqlca.sqlcode = 0

	// Clientes Importantes	
	SELECT "GI_AVISOS_RES"."CANT_CLI_IMP"  
	 INTO :li_basura
	 FROM "GI_AVISOS_RES"  
	WHERE "GI_AVISOS_RES"."NRO_INSTALACION" = :ll_cod_inst   ;

if li_basura > 0 then
	lb_cli_imp = true
end if

	// Brigada Trabajando
	SELECT count(*)
	  INTO :li_basura  
	  FROM "GI_OT"  
	 WHERE "GI_OT"."NRO_INSTALACION" = :ll_cod_inst AND "GI_OT"."EST_OT" = 2 ;
	
if li_basura > 0 then
	lb_brigada = true
end if
	
ll_class_id = of_busca_class_id(ll_cod_inst)
	
	// Si tiene un class_id CTRM obtengo el CT
	
if ll_class_id = CTRM then
	
	SELECT "SGD_TRAFO_MB"."INSTALACION_ORIGEN"  
	  INTO :ll_cod_inst  
	  FROM "SGD_TRAFO_MB"  
	 WHERE "SGD_TRAFO_MB"."CODIGO" = :ll_cod_inst   ;

	 ll_class_id = of_busca_class_id(ll_cod_inst)
		 
elseif ll_class_id = CSMT then

	of_obten_tramos(ll_cod_inst,tramos[],li_num_tramos)
		
elseif ll_class_id = CSBT then

	of_obten_tramos_bt(ll_cod_inst,tramos[],li_num_tramos)
		 
end if


// Solo si es distinto de CSMT y CSBT
if ll_class_id <> CSBT and ll_class_id <> CSMT then

	li_nuevo_simbolo = of_simbolo_aviso(ll_cod_inst,lb_brigada,lb_cli_imp)
		
	li_num_elementos=li_num_elementos+1
	elementos[li_num_elementos].elemento=ll_cod_inst
	elementos[li_num_elementos].clase=ll_class_id
  	elementos[li_num_elementos].simbolo=li_nuevo_simbolo

else

	for li_i = 1 to li_num_tramos
		li_num_elementos=li_num_elementos+1
		elementos[li_num_elementos].elemento = tramos[li_i].elemento
		elementos[li_num_elementos].clase =  tramos[li_i].clase
		elementos[li_num_elementos].simbolo = of_simbolo_aviso(tramos[li_i].elemento,lb_brigada,lb_cli_imp)
	next
		
end if
	
	fetch cu_avisos into :ll_cod_inst;	
	
loop

close cu_avisos;

if (li_num_elementos>0) then 
	li_retorno=GSivSimbDefecto(sesion, ventana, 0) 
	li_retorno=GSivAsociaEltosSimbolos(sesion,elementos,0,li_num_elementos)
end if	

return(li_retorno)

end function

public function integer of_hay_acometidas (long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_hay_acometida
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Devuelve el numero de acometidas de una salida de baja
//	
//
//  Valores de retorno : Numero de acometidas.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno=0

  SELECT count(*)  
    INTO :retorno
    FROM "SGD_ACOMETIDA"  
   WHERE "SGD_ACOMETIDA"."NRO_INSTALACION" = :pl_codigo   ;


return(retorno)


end function

public function integer of_hijos_no_borrados (long pl_int_padre);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_hijos_no_borrados
//
//  Argumentos : long pl_int_padre
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Comprueba si se borran las instalaciones hijas de una que se va a borrar 
//	
//
//  Valores de retorno : 0 ---> Si las instalaciones hijas van a ser borradas en el mismo trabajo
//								 1 ---> Si alguna de las instalaciones hijas  no van a ser borradas en el trabajo
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno, hijos_borrados


long ll_codigo

retorno=0

 DECLARE hijos CURSOR FOR  
  SELECT DISTINCT "NRO_INSTALACION"  
    FROM "SGD_INSTALACION"  
   WHERE "SGD_INSTALACION"."NRO_INST_PADRE" = :pl_int_padre  ;

  OPEN hijos;
  
  FETCH hijos into :ll_codigo;
  do while (sqlca.sqlcode=0) and (retorno=0)
	
  SELECT count(*)  
    INTO :hijos_borrados  
    FROM "SGD_INSTALACION"  
   WHERE "STAT_FLG" = 128 AND NRO_INSTALACION= :ll_codigo AND "BDI_JOB" =:trabajo;

  if hijos_borrados=0 then
	retorno=1
	end if
   FETCH hijos into :ll_codigo;
  loop
  
  CLOSE hijos;

return(retorno)



end function

public function integer of_permiso_borrar (long pl_codigo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_permiso_borrar
//
//  Argumentos : pl_codigo --> codigo de la instalacion a borrar
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Devuelve si una instalaci$$HEX1$$f300$$ENDHEX$$n se puede borrar o no.
//	
//
//  Valores de retorno : Numero de acometidas.
// 		   0 si se puede realizar el borrado
//          1 si no se puede por suministros importantes
//          2 si no se puede por interrupcion
//          3 si no se puede por tener instalaciones dependientes que no esten siendo borradas
//            en el mismo trabajo.
//				4 Si no se puede por tener acometidas
//
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 03/06/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




long ll_encontrados = 0



select count(*) into :ll_encontrados from sgd_interrupcion where nro_instalacion = :pl_codigo;

if ll_encontrados > 0 then
	gnv_msg.f_mensaje("EX09","","",Ok!)
//	messagebox("Error", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada tiene interrupciones pendientes",StopSign!)
	return 1
end if


if ll_encontrados > 0 then
	gnv_msg.f_mensaje("EX10","","",Ok!)
//	messagebox("Error", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada tiene suministros importantes pendientes",StopSign!)
	return 2
else
	ll_encontrados=of_hijos_no_borrados(pl_codigo)
end if

if ll_encontrados > 0 then
	gnv_msg.f_mensaje("EX11","","",Ok!)
//	messagebox("Error", "La instalaci$$HEX1$$f300$$ENDHEX$$n seleccionada tiene instalaciones dependientes de ella",StopSign!)
	return 3
else
	ll_encontrados=of_hay_acometidas(pl_codigo)
end if
if ll_encontrados > 0 then
	gnv_msg.f_mensaje("EX30","","",Ok!)
//	messagebox("Aviso", "La salida de baja seleccionada tiene acometidas dependientes de ella",StopSign!)
	return 4	
else
	return 0
end if
end function

public function integer of_desbloquea_elto (long pl_class_id, long pl_codigo, integer pi_estado);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_desbloquea_elto
//
//  Argumentos :  pl_class_id ----> Class_id de la instalaci$$HEX1$$f300$$ENDHEX$$n
//						pl_codigo 	---->	codigo de la instalacion
//						pi_estado   ----> Estado de la instalacion 
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Desbloquea la instalaci$$HEX1$$f300$$ENDHEX$$n 
//				
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 17/06/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////



int li_retorno
li_retorno=GSivQuitaBloqueo(sesion,pl_class_id,pl_codigo,trabajo,pi_estado)
return(li_retorno)
end function

public function integer of_actualiza_texto (long pl_clase, long pl_codigo, string ps_campo, string ps_texto);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualiza_texto
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Notifica al ONIS que actualice el texto de la instalacion grafica							
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 04/08/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int retorno
retorno=GSivAsociaTexto(sesion,pl_clase,pl_codigo,ps_campo,ps_texto)
return retorno
end function

public function integer of_conecta_y_pte (long pl_trabajo, boolean pb_grafico);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_conecta_y_pte
//
//  Argumentos pl_trabajo --> C$$HEX1$$f300$$ENDHEX$$digo del trabajo a poner en explotaci$$HEX1$$f300$$ENDHEX$$n
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Pide al ONIS que genere una sesion, ponga en explotaci$$HEX1$$f300$$ENDHEX$$n el trabajo cuyo codigo se pasa									
//					como parametro y termine la sesi$$HEX1$$f300$$ENDHEX$$n.
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 16/06/1998		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////




string titulo
int retorno
ulong hax
string host
long  port
string nombre
string dirtcp

int err
string maquinapuerto

// Obtiene la maquina y el puerto que nos permita comunicarnos con el ONIS

port=long(Profilestring("opensgi.ini", "SIV_SERVER", "puerto", "0"))
host=ProfileString("opensgi.ini", "SIV_SERVER", "maquina", "sfsud001")
maquinapuerto=host+":"+string(port)

// Solo cuando no haya grafica
if not pb_grafico then 
	retorno = GSivIniciarSesion(maquinapuerto)
	if retorno<>1 then
		return(retorno)
	end if
end if

// Genera una sesion
retorno=GSivGeneraSesion("NODISPLAY",sesion);
if retorno<>1 then
	return(retorno)
end if

// Ya que no tiene ventana ponemos -1
ventana=-1


// Pone en explotacion el trabajo.
retorno=of_pon_en_explotacion(pl_trabajo)

// Destruye la sesion y tira los sockets

GSivDestruirSesion(sesion)

if not pb_grafico then AcabaSesion()

return(retorno)
end function

public function integer of_establece_ses ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_establece_sesion
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Crea la conexion con el servidor grafico sin actualizar el puerto
//	
//
//  Valores de retorno : 0 --> No se ha realizado la operacion correctamente.
//				  				 > 0 --> Correcto.
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 04/08/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


string titulo
int retorno
ulong hax
string host
long  port
int err
string puertomaquina

application app
app=getapplication()
hax=handle(app)
titulo="OPENSGI"
// Obtiene la maquina y el puerto que nos permita comunicarnos con el ONIS
setpointer(HourGlass!)
port=long(Profilestring("opensgi.ini", "SIV_SERVER", "puerto", "0"))
host=ProfileString("opensgi.ini", "SIV_SERVER", "maquina", "sfsud001")

puertomaquina=host+":"+string(port)
retorno=GSivIniciarSesion(puertomaquina)
if retorno<>0 then
	// Genera una sesion sin display
	retorno=GSivGeneraSesion("NODISPLAY",sesion);
end if
return(retorno)
end function

public subroutine of_actualizar_servidores (long pl_trabajo);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : of_actualizar_servidores
//
//  Argumentos pl_trabajo --> C$$HEX1$$f300$$ENDHEX$$digo del trabajo a actualizar en todos los servidores onis
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Genera una sesion, ponga en explotaci$$HEX1$$f300$$ENDHEX$$n graficamente 
//             el trabajo cuyo codigo se pasa como parametro y termine la sesi$$HEX1$$f300$$ENDHEX$$n, por cada uno de 
//   				 los servidores ONIS disponibles y cuyo puerto este en la tabla sgd_servidor_sesion.
//
//  Valores de retorno :  Ninguno
//
//  Realizado por Hugo Serna & Alfonso Coto
//
//  Fecha : 26/10/1999		Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//

int li_retorno
string ls_host, ls_grafico
long  ll_port
long ll_sesion
string ls_descripcion
string maquinapuertootros,maquinapuerto

// Obtiene la maquina y el puerto que nos permita comunicarnos con el ONIS del OPENSGI

ll_port=long(Profilestring("opensgi.ini", "SIV_SERVER", "puerto", "0"))
ls_host=ProfileString("opensgi.ini", "SIV_SERVER", "maquina", "sfsud001")
maquinapuerto=ls_host+":"+string(ll_port)

// leemos el puerto de los otros servidores


 DECLARE cu_servidor CURSOR FOR  
  SELECT "SGD_SERVIDOR_SESION"."SIV_SERVER"  ,DESCRIPCION
    FROM "SGD_SERVIDOR_SESION"  ;

OPEN cu_servidor;
FETCH cu_servidor INTO :maquinapuertootros,:ls_descripcion;

AcabaSesion()
DO WHILE sqlca.sqlcode=0 
	if upper(maquinapuertootros)<>upper(maquinapuerto) then // NO ACTUALIZAMOS EL NUESTRO OTRA VEZ
			if isnull(ls_descripcion) then ls_descripcion="Servidor desconocido"
			maquinapuertootros=trim(maquinapuertootros)
				li_retorno=GSivIniciarSesion(maquinapuertootros)
				li_retorno=GSivGeneraSesion("NODISPLAY",ll_sesion); // Generamos una sesion sin display
				if li_retorno=1 then  // OK entonces actualizamos graficamente el trabajo
					li_retorno=GSivTerminarTrabajo(ll_sesion, pl_trabajo) 
					if li_retorno<>1 then // PUESTA EN EXPLOTACION INCORRECTA
					  gnv_msg.f_mensaje("AX09",ls_descripcion,"",Ok!)		
					end if
				GSivDestruirSesion(ll_sesion)	
				else // CONEXION INCORRECTA
					gnv_msg.f_mensaje("AX08",ls_descripcion,"",Ok!)		
				end if
				AcabaSesion()
				
	end if
	
	
FETCH cu_servidor INTO :maquinapuertootros,:ls_descripcion;
LOOP
li_retorno=GSivIniciarSesion(maquinapuerto)
ClOSE CU_SERVIDOR;






end subroutine

on u_enlace.create
TriggerEvent( this, "constructor" )
end on

on u_enlace.destroy
TriggerEvent( this, "destructor" )
end on

event constructor;ib_hay_bdi=true
handleventana=-1
trabajo=-1



end event


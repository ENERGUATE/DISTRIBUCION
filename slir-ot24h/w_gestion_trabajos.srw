HA$PBExportHeader$w_gestion_trabajos.srw
$PBExportComments$osoleto?
forward
global type w_gestion_trabajos from Window
end type
type cb_1 from commandbutton within w_gestion_trabajos
end type
type lista_2 from dropdownlistbox within w_gestion_trabajos
end type
type finalizar from commandbutton within w_gestion_trabajos
end type
type st_5 from statictext within w_gestion_trabajos
end type
type st_3 from statictext within w_gestion_trabajos
end type
type lista_1 from dropdownlistbox within w_gestion_trabajos
end type
type cbx_1 from checkbox within w_gestion_trabajos
end type
type sle_2 from singlelineedit within w_gestion_trabajos
end type
type alta from commandbutton within w_gestion_trabajos
end type
type borra from commandbutton within w_gestion_trabajos
end type
type explotacion from commandbutton within w_gestion_trabajos
end type
type modifica from commandbutton within w_gestion_trabajos
end type
type dw_2 from datawindow within w_gestion_trabajos
end type
type sle_1 from singlelineedit within w_gestion_trabajos
end type
type st_2 from statictext within w_gestion_trabajos
end type
type st_1 from statictext within w_gestion_trabajos
end type
type gb_1 from groupbox within w_gestion_trabajos
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_gestion_trabajos
end type
end forward

type systemtime from structure
        unsignedinteger         wyear
        unsignedinteger         wmonth
        unsignedinteger         wdayofweek
        unsignedinteger         wday
        unsignedinteger         whour
        unsignedinteger         wminute
        unsignedinteger         wsecond
        unsignedinteger         wmilliseconds
end type

global type w_gestion_trabajos from Window
int X=219
int Y=312
int Width=3237
int Height=1784
boolean TitleBar=true
string Title="Gesti$$HEX1$$f300$$ENDHEX$$n de Trabajos"
long BackColor=81324524
WindowType WindowType=response!
event error ( string codigo )
event menserror pbm_custom01
cb_1 cb_1
lista_2 lista_2
finalizar finalizar
st_5 st_5
st_3 st_3
lista_1 lista_1
cbx_1 cbx_1
sle_2 sle_2
alta alta
borra borra
explotacion explotacion
modifica modifica
dw_2 dw_2
sle_1 sle_1
st_2 st_2
st_1 st_1
gb_1 gb_1
dw_ambito dw_ambito
end type
global w_gestion_trabajos w_gestion_trabajos

type prototypes
Function long SendMessage  ( long hw, long  wMsg ,  int wParam ,long lParam)  Library "user32.dll" Alias for "SendMessageA"
Function long FindWindow  ( string lpClassName ,  string lpWindowName ) Library "user32.dll" Alias for"FindWindowA;Ansi"
PRIVATE FUNCTION int send ( int socket, ref blob buf, int len, int flags ) LIBRARY "wsock32.dll"
FUNCTION int WSAGetLastError (  ) LIBRARY "wsock32.dll"
Function long EnableWindow (long hw ,  Long ena)  Library "user32.dll"
Function long SetWindowPos (long hw, long hWndInsertAfter,long xx,long yy,long cx,long cy,long wFlags) Library "user32.dll"
Function long GetWindow   (long hw,long  wCmd )  Library "user32.dll"
Function long ShowWindow  (long hw, long  nCmdShow )  Library "user32.dll"
Function long MoveWindow  ( long  hw, long  xx , long yy,  long nWidth, long nHeight , long bRepain)  Library "user32.dll"
Function long SetWindowTextA  (long hw, String Titulo) Library "user32.dll" alias for "SetWindowTextA;Ansi"
FUNCTION long GetWindowLongA(ulong whand, int index) LIBRARY "user32.dll"
Function long SetParent (long WndChild , long  hWndNewParent ) Library  "user32.dll"
Function Long SetLocalTime  (SYSTEMTIME lpSystemTime) Library "kernel32.dll" alias for "SetLocalTime;Ansi"
end prototypes

type variables
long desc
boolean vencio
long il_centro, il_cmd, il_puesto
int gi_mod
boolean ib_mano = false
long il_lista2 = 1
//Fila marcada de los trabajos
long il_fila_marcada
long il_trabajo
end variables

forward prototypes
public function string f_quitar_blancos (string texto)
public subroutine bloquea_ventana ()
public subroutine fw_carga_datos ()
public function boolean fw_comprobar_estado ()
public subroutine obtener_cmd ()
public subroutine bloquea_botones (integer opcion)
public subroutine fw_baja_trabajo ()
public function integer fw_alta_trabajo (long ll_trabajo, string ps_nombre, string ps_descrip)
end prototypes

public function string f_quitar_blancos (string texto);// Quita los blancos internos del texto que se le pasa y los sustituye por -


int i
char letra
string retorno
retorno=""

for i=1 to len(trim(texto))
        letra=mid(trim(texto),i,1)
        if letra=" " then letra="_"
        retorno=retorno+letra
next    
return retorno
end function

public subroutine bloquea_ventana ();this.pointer = 'HourGlass!'
alta.pointer = 'HourGlass!'
borra.pointer = 'HourGlass!'
explotacion.pointer = 'HourGlass!'
finalizar.pointer = 'HourGlass!'
modifica.pointer = 'HourGlass!'
cb_1.pointer = 'HourGlass!'
dw_2.enabled = false
sle_1.enabled = false
sle_2.enabled = false
dw_ambito.enabled = false
end subroutine

public subroutine fw_carga_datos ();//dw_2.settrans(sqlca)
dw_2.retrieve(il_centro,il_cmd,il_puesto,il_lista2)

end subroutine

public function boolean fw_comprobar_estado ();// Retorno: True tiene estado finalizado
//          False no tiene estado finalizado

long ll_estado_trabajo
long ll_fila_seleccionada

ll_fila_seleccionada = dw_2.getselectedrow(0)
if ll_fila_seleccionada > 0 then 
ll_estado_trabajo = dw_2.getitemnumber(ll_fila_seleccionada,"estado_trabajo")
                
                if ll_estado_trabajo > 2 and ll_estado_trabajo <7 then
                        gnv_msg.f_mensaje("EX13","","",Ok!)
                //      messagebox("Error","Trabajo en estado finalizado")
                        return true
                else
                        return false
                end if
else
        return true
end if
end function

public subroutine obtener_cmd ();il_centro=dw_ambito.getitemnumber(1,'nro_centro')
il_cmd=dw_ambito.getitemnumber(1,'nro_cmd')
il_puesto=dw_ambito.getitemnumber(1,'nro_mesa')
end subroutine

public subroutine bloquea_botones (integer opcion);CHOOSE CASE opcion
// Fila seleccionada
        CASE 1
        alta.enabled = false
        borra.enabled = true
        modifica.enabled = true
        finalizar.enabled = true
//      Nuevo trabajo
        CASE 2
        alta.enabled = true
        borra.enabled = false
        modifica.enabled = false
        finalizar.enabled = false
        CASE 3
// Cambio de tipo de trabajo
        alta.enabled = false
        borra.enabled = false
        modifica.enabled = false
        finalizar.enabled = false
END CHOOSE

end subroutine

public subroutine fw_baja_trabajo (); // Borra la fila seleccionada
dw_2.deleterow(il_fila_marcada)

IF dw_2.Update() = 1  then 
        gnu_u_transaction.uf_commit();
ELSE
        gnu_u_transaction.uf_rollback();
END IF






end subroutine

public function integer fw_alta_trabajo (long ll_trabajo, string ps_nombre, string ps_descrip);// Realiza el alta del nuevo trabajo
datetime ld_hoy
long ll_fila
string ls_nombre, ls_descrip,ls_grafico
long  ll_codigo
string ls_cod_obra
string ls_cod_trabajo
long ll_nro_descargo = 0
long ll_posicion
long ll_tipo_trabajo
        
        ls_nombre = ps_nombre
        ls_descrip = ps_descrip
if il_lista2 = 1 or il_lista2 = 3 then
        
        //Obtiene el numero de descargo de la etiqueta
        ll_posicion = pos(ls_nombre,"-")
        ll_nro_descargo= long(trim( left (ls_nombre,ll_posicion - 2)))
//      ls_cod_trabajo = trim( mid (sle_1.text,ll_posicion + 2))

//messagebox(ls_cod_obra,ls_cod_trabajo)

//  SELECT "SGD_DESCARGOS_TRABAJOS"."NRO_DESCARGO"  
//    INTO :ll_nro_descargo  
//    FROM "SGD_DESCARGOS_TRABAJOS"  
//   WHERE ( "SGD_DESCARGOS_TRABAJOS"."COD_OBRA" = :ls_cod_obra ) AND  
//         ( "SGD_DESCARGOS_TRABAJOS"."COD_TRABAJO" = :ls_cod_trabajo )   ;
//
//messagebox("Num Descargo",string(ll_nro_descargo))

end if

ll_tipo_trabajo = il_lista2
ll_codigo = ll_trabajo



string ls_etiqueta
ls_etiqueta = lista_2.text
ll_tipo_trabajo = lista_2.finditem(ls_etiqueta,0)

ld_hoy = fgnu_fecha_actual()
ll_fila=dw_2.Insertrow(0)       
dw_2.setitem(ll_fila,"usuario",gs_usuario)
dw_2.setitem(ll_fila,"F_ACTUAL",ld_hoy)
dw_2.setitem(ll_fila,"PROGRAMA","gest_trabajos")
dw_2.setitem(ll_fila,"codigo",ll_codigo)
dw_2.setitem(ll_fila,"nombre",ls_nombre)
dw_2.setitem(ll_fila,"centro",il_centro)        
dw_2.setitem(ll_fila,"cmd",il_cmd)      
dw_2.setitem(ll_fila,"puesto",il_puesto)        
dw_2.setitem(ll_fila,"descripcion",ls_descrip)  
dw_2.setitem(ll_fila,"nro_descargo",ll_nro_descargo)
dw_2.setitem(ll_fila,"estado_trabajo",1)
dw_2.setitem(ll_fila,"tipo_trabajo",ll_tipo_trabajo)
dw_2.Accepttext()

//INSERT INTO "SGD_TRABAJOS_BDI"  
//              ( "USUARIO",   
//                "F_ACTUAL",   
//                "PROGRAMA",   
//                "CODIGO",   
//                "NOMBRE",   
//                "CENTRO",   
//                "CMD",   
//                "PUESTO",   
//                "DESCRIPCION",
//                "NRO_DESCARGO",
//                "ESTADO_TRABAJO",
//                "TIPO_TRABAJO", "OBSERVACIONES")  
//VALUES ( :gs_usuario,   
//                :ld_hoy,   
//                'gest_trabajos',
//                :ll_codigo,   
//                :ls_nombre,   
//                :il_centro,   
//                :il_cmd,   
//                :il_puesto,   
//                :ls_descrip,
//        :ll_nro_descargo,
//                 1,
//                      :ll_tipo_trabajo,null)  ;
//


IF dw_2.Update() = 1  then 
        gnu_u_transaction.uf_commit();
        dw_2.setrow(ll_fila)
        dw_2.selectrow(ll_fila,true)
        dw_2.ScrollToRow(ll_fila)
        il_trabajo = dw_2.getitemnumber(ll_fila,"codigo")
        return(1)
ELSE
        gnv_msg.f_mensaje("EX12",sqlca.sqlerrtext,"",Ok!)
        gnu_u_transaction.uf_rollback();
        return(0)
END IF



end function

on w_gestion_trabajos.create
this.cb_1=create cb_1
this.lista_2=create lista_2
this.finalizar=create finalizar
this.st_5=create st_5
this.st_3=create st_3
this.lista_1=create lista_1
this.cbx_1=create cbx_1
this.sle_2=create sle_2
this.alta=create alta
this.borra=create borra
this.explotacion=create explotacion
this.modifica=create modifica
this.dw_2=create dw_2
this.sle_1=create sle_1
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.dw_ambito=create dw_ambito
this.Control[]={this.cb_1,&
this.lista_2,&
this.finalizar,&
this.st_5,&
this.st_3,&
this.lista_1,&
this.cbx_1,&
this.sle_2,&
this.alta,&
this.borra,&
this.explotacion,&
this.modifica,&
this.dw_2,&
this.sle_1,&
this.st_2,&
this.st_1,&
this.gb_1,&
this.dw_ambito}
end on

on w_gestion_trabajos.destroy
destroy(this.cb_1)
destroy(this.lista_2)
destroy(this.finalizar)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.lista_1)
destroy(this.cbx_1)
destroy(this.sle_2)
destroy(this.alta)
destroy(this.borra)
destroy(this.explotacion)
destroy(this.modifica)
destroy(this.dw_2)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.dw_ambito)
end on

event open;// Inicializa distintos valores y levanta el servidor de comunicaciones 
//y el de X 
string ls_lista2,nula, nombre_ejecutable
string caminox
int resp
systemtime fecha
datetime ldt_fecha
long hservidorx
long li_centro, li_cmd,li_mesa
long ll_num_descargo
string ls_codigo1,ls_codigo2,ls_desc1,ls_desc2,ls_resultado

setnull(nula)
setpointer(HourGlass!)

 DECLARE cu_lista_2 CURSOR FOR  
  SELECT "SGD_VALOR"."DESCRIPCION"
    FROM "SGD_VALOR"  
   WHERE "SGD_VALOR"."CODIF" = 'T_TB';   

open cu_lista_2;
fetch cu_lista_2 into :ls_lista2;
do while sqlca.sqlcode = 0
        lista_2.additem (ls_lista2)
        fetch cu_lista_2 into :ls_lista2;
loop

close cu_lista_2;

lista_2.selectitem(1)

DataWindowChild dw_centro
integer retorno

il_trabajo=0
if gb_usuario_mant = true then

        dw_ambito.enabled = false

end if


// Muestro D.W. de $$HEX1$$e100$$ENDHEX$$mbito
dw_ambito.reset()
dw_ambito.show()
dw_ambito.f_insertar_fila()

//Conecto las DDDW del objeto "ambito"
// filtro todos sus campos y seteo a los mismos con todos

if isvalid(w_man_instalacion) then
        li_centro = w_man_instalacion.dw_ambito.getitemnumber(1,"nro_centro")
        li_cmd = w_man_instalacion.dw_ambito.getitemnumber(1,"nro_cmd")
        li_mesa = w_man_instalacion.dw_ambito.getitemnumber(1,"nro_mesa")
else
        li_centro=gi_nro_centro 
        li_cmd=gi_nro_cmd
        li_mesa=gi_nro_puesto
end if

dw_ambito.fpr_crea_dddw()
dw_ambito.fnu_filtro_centro()
dw_ambito.setitem(1,"nro_centro",li_centro)
dw_ambito.fpr_filtro_cmd()
dw_ambito.setitem(1,"nro_cmd",li_cmd)
dw_ambito.fpr_filtro_mesa()
dw_ambito.setitem(1,"nro_mesa",li_mesa)
dw_ambito.setcolumn("nro_centro")

dw_ambito.fpr_deshab_centro(dw_ambito)
dw_ambito.fnu_deshab_cmd(dw_ambito)
dw_ambito.fnu_deshab_puesto(dw_ambito)           

dw_2.settransobject(sqlca)
il_centro=li_centro
il_cmd=li_cmd
il_puesto=li_mesa
resp=dw_2.retrieve(il_centro,il_cmd,il_puesto,1)



 DECLARE descar CURSOR FOR  
 
 SELECT "SGD_DESCARGOS"."NRO_DESCARGO",  
                   NVL("SGD_DESCARGOS_TRABAJOS"."COD_OBRA",'SGI'),   
         NVL("SGD_DESCARGOS_TRABAJOS"."COD_TRABAJO", 'SGI'),  
         NVL("SGD_DESCARGOS_TRABAJOS"."DESCRIPCION_OBRA",'SGI'),   
         NVL("SGD_DESCARGOS_TRABAJOS"."DESCRIPCION_TRAB",'SGI')  
    FROM "SGD_DESCARGOS",   
         "SGD_DESCARGOS_TRABAJOS"  
   WHERE   ( "SGD_DESCARGOS"."ESTADO" = 9 )  and 
                                ( "SGD_DESCARGOS_TRABAJOS"."NRO_DESCARGO" (+) = "SGD_DESCARGOS"."NRO_DESCARGO" )
          AND "SGD_DESCARGOS"."NRO_DESCARGO" not in ( SELECT NRO_DESCARGO FROM 
          SGD_TRABAJOS_BDI WHERE NRO_DESCARGO IS NOT NULL);
        
        open descar;
        fetch descar into :ll_num_descargo,:ls_codigo1,:ls_codigo2, :ls_desc1,:ls_desc2;
        
        do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
                ls_resultado = string(ll_num_descargo)+ ' - ' +trim(ls_codigo1) + ' - ' + trim(ls_codigo2) + '  /  ' + trim(ls_desc1) + ' - ' + trim(ls_desc2)
                lista_1.additem(ls_resultado)
                fetch descar into :ll_num_descargo,:ls_codigo1,:ls_codigo2, :ls_desc1,:ls_desc2;
        loop
        close descar;

        lista_1.enabled = true


end event

event activate;//lista_2.triggerevent(SelectionChanged!)
end event

type cb_1 from commandbutton within w_gestion_trabajos
int X=2761
int Y=1460
int Width=361
int Height=92
int TabOrder=120
string Text="&Salir"
boolean Cancel=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;closewithreturn(parent,0)
end event

type lista_2 from dropdownlistbox within w_gestion_trabajos
int X=2135
int Y=532
int Width=978
int Height=352
int TabOrder=50
string Text="isnull"
boolean Sorted=false
boolean VScrollBar=true
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event selectionchanged;long ll_num_descargo
string ls_resultado, ls_codigo1, ls_desc1, ls_nom_instalacion, ls_codigo2, ls_desc2

bloquea_botones(3)

il_centro = dw_ambito.getitemnumber(1,'nro_centro')
il_cmd = dw_ambito.getitemnumber(1,'nro_cmd')
il_puesto = dw_ambito.getitemnumber(1,'nro_mesa')

string ls_etiqueta
long ll_fila
ls_etiqueta = lista_2.text
ll_fila = lista_2.finditem(ls_etiqueta,0)


il_lista2=ll_fila
lista_1.reset()
sle_2.text = ""
sle_1.text = ""

if index = 2 or index = 4 then
        //dw_2.dataobject = "dw_lista_trabajos_depuracion"
        sle_2.enabled = true
        sle_1.enabled = true
        cbx_1.checked = false
        lista_1.enabled = false
        sle_1.text = ""
        sle_2.text = ""
else
        //dw_2.dataobject = "dw_lista_trabajos_descargos"
        sle_1.enabled = false
        sle_2.enabled = false
        cbx_1.checked = true
        explotacion.enabled = false

 DECLARE descar CURSOR FOR  
 
 SELECT "SGD_DESCARGOS"."NRO_DESCARGO",  
                   NVL("SGD_DESCARGOS_TRABAJOS"."COD_OBRA",'SGI'),   
         NVL("SGD_DESCARGOS_TRABAJOS"."COD_TRABAJO", 'SGI'),  
         NVL("SGD_DESCARGOS_TRABAJOS"."DESCRIPCION_OBRA",'SGI'),   
         NVL("SGD_DESCARGOS_TRABAJOS"."DESCRIPCION_TRAB",'SGI')  
    FROM "SGD_DESCARGOS",   
         "SGD_DESCARGOS_TRABAJOS"  
   WHERE   ( "SGD_DESCARGOS"."ESTADO" = 9 )  and 
                                ( "SGD_DESCARGOS_TRABAJOS"."NRO_DESCARGO" (+) = "SGD_DESCARGOS"."NRO_DESCARGO" )
          AND "SGD_DESCARGOS"."NRO_DESCARGO" not in ( SELECT NRO_DESCARGO FROM 
          SGD_TRABAJOS_BDI WHERE NRO_DESCARGO IS NOT NULL);
        
        open descar;
        fetch descar into :ll_num_descargo,:ls_codigo1,:ls_codigo2, :ls_desc1,:ls_desc2;
        
        do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
                ls_resultado = string(ll_num_descargo)+ ' - ' +trim(ls_codigo1) + ' - ' + trim(ls_codigo2) + '  /  ' + trim(ls_desc1) + ' - ' + trim(ls_desc2)
                lista_1.additem(ls_resultado)
                fetch descar into :ll_num_descargo,:ls_codigo1,:ls_codigo2, :ls_desc1,:ls_desc2;
        loop
        close descar;

        lista_1.enabled = true
        
end if

fw_carga_datos()

end event

type finalizar from commandbutton within w_gestion_trabajos
int X=1134
int Y=1460
int Width=361
int Height=92
int TabOrder=90
boolean Enabled=false
string Text="&Finalizar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long ll_retorno
long ll_fila
long ll_error
long ll_num_descargo
string ls_codigo1,ls_codigo2, ls_desc1,ls_desc2,ls_resultado

boolean lb_error
setpointer(HourGlass!)
if fw_comprobar_estado() = true then
        return
end if

//Solicito confirmacion de Finalizar
setpointer(HourGlass!)
ll_retorno = gnv_msg.f_mensaje("IX11","","",YesNo!)
//ll_retorno = messagebox("Aviso","$$HEX2$$bf002000$$ENDHEX$$Desea finalizar el trabajo ?",Question!,YesNo!,2)

if ll_retorno = 1 then
                
        ll_error = dw_2.setitem(il_fila_marcada,"estado_trabajo",3)
        
        if ll_error < 0 then
                return
        end if
        
        ll_error = dw_2.accepttext()
        
        if ll_error < 0 then
                return
        end if
        
        ll_error = dw_2.update()
        
        if ll_error < 0 then
                return
        end if
        
//      if estado = 1 or 3 then
// Actualiza la tabla sgd_descargos pasando a estado finalizado

        string ls_etiqueta
        ls_etiqueta = lista_2.text
        ll_fila = lista_2.finditem(ls_etiqueta,0)
                
        if ll_fila = 1 or ll_fila = 3 then

                long ll_nro_descargo
                ll_nro_descargo = dw_2.object.nro_descargo[il_fila_marcada]
                //fg_mostrar_dw(dw_2)   
 
  UPDATE "SGD_DESCARGOS"  
     SET "ESTADO" = 10  
   WHERE "SGD_DESCARGOS"."NRO_DESCARGO" = :ll_nro_descargo   ;
        gnu_u_transaction.uf_commit();

lista_1.reset()
 DECLARE descar CURSOR FOR  
 
 SELECT "SGD_DESCARGOS_TRABAJOS"."NRO_DESCARGO",  
                   "SGD_DESCARGOS_TRABAJOS"."COD_OBRA",   
         "SGD_DESCARGOS_TRABAJOS"."COD_TRABAJO",   
         "SGD_DESCARGOS_TRABAJOS"."DESCRIPCION_OBRA",   
         "SGD_DESCARGOS_TRABAJOS"."DESCRIPCION_TRAB"  
    FROM "SGD_DESCARGOS",   
         "SGD_DESCARGOS_TRABAJOS"  
   WHERE   ( "SGD_DESCARGOS"."ESTADO" = 9 )  and 
                                ( "SGD_DESCARGOS_TRABAJOS"."NRO_DESCARGO" = "SGD_DESCARGOS"."NRO_DESCARGO" )  ;
        
        open descar;
        fetch descar into :ll_num_descargo,:ls_codigo1,:ls_codigo2, :ls_desc1,:ls_desc2;
        
        do while sqlca.sqlcode <>100 and sqlca.sqlcode <> -1
                ls_resultado = string(ll_num_descargo)+ ' - ' +trim(ls_codigo1) + ' - ' + trim(ls_codigo2) + '  /  ' + trim(ls_desc1) + ' - ' + trim(ls_desc2)
                lista_1.additem(ls_resultado)
                fetch descar into :ll_num_descargo,:ls_codigo1,:ls_codigo2, :ls_desc1,:ls_desc2;
        loop
        close descar;







                        
        end if
        setpointer(HourGlass!)
        fw_carga_datos()        
        setpointer(HourGlass!)
end if
end event

type st_5 from statictext within w_gestion_trabajos
int X=2117
int Y=452
int Width=978
int Height=76
boolean Enabled=false
string Text="Tipo de Trabajo"
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_3 from statictext within w_gestion_trabajos
int X=197
int Y=548
int Width=837
int Height=76
boolean Enabled=false
string Text="Descargos Def."
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type lista_1 from dropdownlistbox within w_gestion_trabajos
int X=105
int Y=408
int Width=1879
int Height=424
int TabOrder=30
boolean Enabled=false
boolean AutoHScroll=true
boolean VScrollBar=true
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event selectionchanged;long ll_posicion
//Comprueba que sea un trabajo de explotacion para seleccionar el nombre

alta.enabled = true
modifica.enabled = false
explotacion.enabled = false
borra.enabled = false
finalizar.enabled = false

if il_lista2 = 1 or il_lista2 = 3 then
        
        //Coloca como nombre el de la drop down list box
        ll_posicion = pos (lista_1.text,'/',1)
        sle_1.text = trim(left(trim(lista_1.text),ll_posicion - 1))
        sle_2.text = trim(mid(trim(lista_1.text),ll_posicion+1,200 ))
end if
end event

type cbx_1 from checkbox within w_gestion_trabajos
int X=105
int Y=548
int Width=297
int Height=76
boolean Enabled=false
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type sle_2 from singlelineedit within w_gestion_trabajos
event modified pbm_enmodified
int X=562
int Y=256
int Width=1390
int Height=84
int TabOrder=20
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
int Limit=160
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;// Cambios cuando obtiene el foco.
dw_2.selectrow(0,false)
bloquea_botones(2)
end event

type alta from commandbutton within w_gestion_trabajos
int X=91
int Y=1460
int Width=361
int Height=92
int TabOrder=70
boolean Enabled=false
string Text="&Alta"
boolean Default=true
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Recoge los datos del trabajo que se va a dar de alta 
long ll_trabajo_aux
setpointer(HourGlass!)
if  sle_1.text = "" then
        sle_1.setfocus()
        gnv_msg.f_mensaje("EX14","","",Ok!)
        //messagebox("Error","Debe introducir el nombre del trabajo",StopSign!)         
        return
elseif sle_2.text = "" then 
        sle_2.setfocus()
        gnv_msg.f_mensaje("EX15","","",Ok!)
//      messagebox("Error","Debe introducir la descripcion del trabajo",StopSign!)              
        
        return
end if
setpointer(HourGlass!)
obtener_cmd()
setpointer(HourGlass!)
if  Isnull(il_centro) or Isnull(il_cmd) or Isnull(il_puesto) then
        gnv_msg.f_mensaje("EM54","","",Ok!)
//   messagebox("Error","Debe rellenar el centro, cmd y el puesto",StopSign!)           
else 
        //bloquea_ventana()
        setpointer(HourGlass!)
        if isvalid(onis) then
                if onis.of_alta_trabajo(f_quitar_blancos(sle_1.text),f_quitar_blancos(sle_2.text),ll_trabajo_aux)>0 then 
                if fw_alta_trabajo(ll_trabajo_aux,sle_1.text,sle_2.text)=1 then
                alta.enabled = false
                sle_1.text = ""
                sle_2.text = ""
                alta.enabled = false
                if il_lista2 = 2 or il_lista2 = 4 then
                        explotacion.enabled = true
                end if
                borra.enabled = true
                modifica.enabled = true
                finalizar.enabled = false
                modifica.setfocus()
                END IF
        else
                   onis.of_baja_trabajo(ll_trabajo_aux)
                        gnv_msg.f_mensaje("EX23","","",Ok!)
                end if
                
        end if
        
end if
  
end event

type borra from commandbutton within w_gestion_trabajos
int X=2245
int Y=1460
int Width=361
int Height=92
int TabOrder=110
boolean Enabled=false
string Text="&Borrar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;// Envia al proceso remoto el  codigo del trabajo que se va a borrar
long ll_respuesta 
long ll_fila
int li_retorno
setpointer(HourGlass!)
ll_respuesta =  gnv_msg.f_mensaje("CG13","","",YesNo!)
setpointer(HourGlass!)
//ll_respuesta = messagebox("Borrar","$$HEX2$$bf002000$$ENDHEX$$Esta seguro ?", Question!,YesNo!,2)

if ll_respuesta = 1 then 
        setpointer(HourGlass!)
        li_retorno=onis.of_baja_trabajo(il_trabajo)
                if li_retorno=1 then 
                        fw_baja_trabajo()
                        explotacion.enabled= false
                        modifica.enabled=false
                        borra.enabled=false
                        alta.enabled= true
                        il_trabajo=0
                        
                else
                         gnv_msg.f_mensaje("EX27","","",Ok!)
                end if   

end if


end event

type explotacion from commandbutton within w_gestion_trabajos
int X=1705
int Y=1460
int Width=361
int Height=92
int TabOrder=100
boolean Enabled=false
string Text="&P. Explotaci$$HEX1$$f300$$ENDHEX$$n"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long ll_retorno
setpointer(HourGlass!)
//bloquea_ventana()
setpointer(HourGlass!)

ll_retorno=onis.of_pon_en_explotacion(il_trabajo)
if ll_retorno=1 then 
        dw_2.deleterow(il_fila_marcada)
        if dw_2.update()=1 then
                gnu_u_transaction.uf_commit(); 
        ELSE
                gnu_u_transaction.uf_rollback();
        END IF
elseif ll_retorno=0 then
                        gnv_msg.f_mensaje("EX25","","",Ok!)
else 
                        gnv_msg.f_mensaje("EX26","","",Ok!)
end if  
                
end event

type modifica from commandbutton within w_gestion_trabajos
int X=608
int Y=1460
int Width=361
int Height=92
int TabOrder=80
boolean Enabled=false
string Text="&Modificar"
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long ll_fila
long ll_retorno
setpointer(HourGlass!)
if fw_comprobar_estado() = true then
        bloquea_botones(3)
        return
end if
setpointer(HourGlass!)
//bloquea_ventana()
// Envia al proceso remoto el codigo del trabajo a modificar
// Centro, cmd y puesto.
setpointer(HourGlass!)
obtener_cmd()
setpointer(HourGlass!)
ll_fila = dw_2.getselectedrow(0)
if ll_fila<>0 then
        dw_2.selectrow(ll_fila,false)

//trabajo seleccionado de la lista
        if il_lista2 = 1 or il_lista2 = 2 then 
                ll_retorno=1 // GRAFICO
        else 
                ll_retorno=2 // ALFANUMERICO
        end if
        setpointer(HourGlass!)



if isvalid(onis) then
        if onis.of_modifica_trabajo(il_trabajo)=1 then // TODO OK
                setpointer(HourGlass!)
                dw_2.setitem(ll_fila,"estado_trabajo",2)
                dw_2.accepttext()
                dw_2.update()
                onis.il_centro=il_centro //CENTRO,CMD,PUESTO DEL TRABAJO
                onis.il_cmd=il_cmd
                onis.il_puesto=il_puesto
 else
                gnv_msg.f_mensaje("EX24","","",Ok!)
                 RETURN
        end if
else
        return
end if
//fw_carga_datos()



closewithreturn(parent,ll_retorno)

end if
end event

type dw_2 from datawindow within w_gestion_trabajos
int X=105
int Y=724
int Width=3013
int Height=592
int TabOrder=60
string DataObject="dw_lista_trabajos"
BorderStyle BorderStyle=StyleLowered!
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

event clicked;// Selecciona el codigo del trabajo seleccionado y habilita distintos botones.
long ll_marcada
long ll_estado
long i
sle_1.text=""
sle_2.text=""
lista_1.text=""
this.selectrow(0,false)

if row > 0 then 

dw_2.selectrow(row,true)
ll_marcada = dw_2.getselectedrow(0)
il_fila_marcada = ll_marcada

string ls_etiqueta
long ll_fila
ls_etiqueta = lista_2.text
ll_fila = lista_2.finditem(ls_etiqueta,0)

        if ll_marcada > 0 then
                bloquea_botones(1)
                if ll_fila = 1 or ll_fila = 3 then
                        finalizar.enabled = true
                else
                        finalizar.enabled = false
                end if
                if il_lista2 = 2 or il_lista2 = 4 then
                        explotacion.enabled = true
                else
                        explotacion.enabled = false
                end if
                                                
                //Obtengo el codigo
                il_trabajo = dw_2.getitemnumber(ll_marcada,"codigo")
                ll_estado = dw_2.getitemnumber(il_fila_marcada,"estado_trabajo")
                if ll_estado>2 and  ll_estado<7  then
                        bloquea_botones(3)
                end if
        else
                
                bloquea_botones(2)
                if il_lista2 = 2 or il_lista2 = 4 then
                        explotacion.enabled = false
                end if
        end if
        
end if
end event

event losefocus;long ll_marcada

ll_marcada = dw_2.getselectedrow(0)

if ll_marcada > 0 then
        alta.enabled=false
        modifica.enabled = true
        finalizar.enabled = true
        if il_lista2 = 2 or il_lista2 = 4 then
                explotacion.enabled = true
        end if
        borra.enabled = true
        
        //Obtengo el codigo
        il_trabajo = dw_2.getitemnumber(ll_marcada,"codigo")
        
else
        alta.enabled=true
        modifica.enabled = false
        finalizar.enabled = false
        if il_lista2 = 2 or il_lista2 = 4 then
                explotacion.enabled = false
        end if
        borra.enabled = false
end if
end event

event doubleclicked;// Provoca el evento clicked en el bot$$HEX1$$f300$$ENDHEX$$n de modificar
if row > 0 then
        modifica.triggerevent(Clicked!)
end if
end event

type sle_1 from singlelineedit within w_gestion_trabajos
int X=562
int Y=148
int Width=1390
int Height=84
int TabOrder=10
boolean Enabled=false
BorderStyle BorderStyle=StyleLowered!
int Limit=20
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;dw_2.selectrow(0,false)
bloquea_botones(2)
end event

type st_2 from statictext within w_gestion_trabajos
int X=128
int Y=264
int Width=439
int Height=76
boolean Enabled=false
string Text="Descripci$$HEX1$$f300$$ENDHEX$$n :"
boolean FocusRectangle=false
long BackColor=81373358
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_gestion_trabajos
int X=128
int Y=164
int Width=439
int Height=76
boolean Enabled=false
string Text="Nombre :"
boolean FocusRectangle=false
long BackColor=81373358
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_1 from groupbox within w_gestion_trabajos
int X=105
int Y=60
int Width=1879
int Height=328
BorderStyle BorderStyle=StyleLowered!
long BackColor=81373358
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_gestion_trabajos
int X=2126
int Y=64
int Width=1001
int TabOrder=40
boolean Border=false
BorderStyle BorderStyle=StyleBox!
end type

event itemchanged;call super::itemchanged;// Realiza el retrieve de la datawindow al cambiar el numero de mesa

string columna,ls_grafico 
long ll_tipo_trabajo
modifica.enabled=false
borra.enabled=false
finalizar.enabled = false
explotacion.enabled=false
dw_2.reset()
dw_ambito.accepttext()
columna= this.getcolumnname()

if columna="nro_mesa" then 
        alta.enabled=true
        obtener_cmd()
        if il_lista2 = 1 or il_lista2 = 2 then 
                ls_grafico="S"
                ll_tipo_trabajo=1
        else    
                ls_grafico="N"
                ll_tipo_trabajo=3
        end if  
        
        //
        dw_2.retrieve(il_centro,il_cmd,il_puesto,il_lista2)

end if
end event

event constructor;call super::constructor;// Heredado
end event

event post_itemchange;call super::post_itemchange;// heredado
end event


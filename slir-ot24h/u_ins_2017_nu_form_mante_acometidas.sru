HA$PBExportHeader$u_ins_2017_nu_form_mante_acometidas.sru
forward
global type u_ins_2017_nu_form_mante_acometidas from nonvisualobject
end type
end forward

global type u_ins_2017_nu_form_mante_acometidas from nonvisualobject
end type
global u_ins_2017_nu_form_mante_acometidas u_ins_2017_nu_form_mante_acometidas

forward prototypes
public function integer fnu_traer_datos (ref datawindow pd_dw, long pl_nro_acometida)
public function long fnu_ultima_acometida ()
end prototypes

public function integer fnu_traer_datos (ref datawindow pd_dw, long pl_nro_acometida);pd_dw.Retrieve(pl_nro_acometida)

RETURN 1
end function

public function long fnu_ultima_acometida ();

/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : fnu_ult_acometida
//
//  Argumentos :long pl_codigo -->  Codigo de la instalacion.
//
//
//  Funci$$HEX1$$f300$$ENDHEX$$n:    Devuelve el primer codigo valido para dar de alta una instalacion                                                                       
//      
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//                                                                1 --> Correcto.
//                                                               pl_codigo --> Codigo de la instalacion
//
//  Realizado por Graziella Vernazza & Alfonso Coto
//
//  Fecha : 23/08/1999          Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


string Tabla
long   pl_codigo

Tabla = "sgd_acom%"

  SELECT "CODIGO"  
   INTO :pl_codigo  
   FROM "SGD_CODIGOS"  
        WHERE UPPER("SGD_CODIGOS"."NOMBRE") like UPPER(:tabla) 
   FOR UPDATE;
   if sqlca.sqlcode<>0 then 
        return(0)
   end if

        // Incrementamos en 1 el valor del ultimo
        pl_codigo=pl_codigo+1
        UPDATE "SGD_CODIGOS"  
     SET "CODIGO" = :pl_codigo  
   WHERE UPPER("SGD_CODIGOS"."NOMBRE") like Upper(:tabla);
        if sqlca.sqlcode<>0 then 
                gnu_u_transaction.uf_rollback();
                return(0)
        end if
        gnu_u_transaction.uf_commit();

   return(pl_codigo)

end function

on u_ins_2017_nu_form_mante_acometidas.create
TriggerEvent( this, "constructor" )
end on

on u_ins_2017_nu_form_mante_acometidas.destroy
TriggerEvent( this, "destructor" )
end on


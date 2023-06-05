HA$PBExportHeader$u_man_2050_ocen_ser_ejec.sru
forward
global type u_man_2050_ocen_ser_ejec from u_man_0000_generico
end type
end forward

global type u_man_2050_ocen_ser_ejec from u_man_0000_generico
integer width = 2117
integer height = 784
string dataobject = "d_man_5020_ocen_ser_ejec"
boolean vscrollbar = true
end type
global u_man_2050_ocen_ser_ejec u_man_2050_ocen_ser_ejec

forward prototypes
public function string f_titulo ()
public function integer f_agregar_registro ()
public function string f_datawindow ()
public function integer f_posicion ()
public function integer f_tamanio_win ()
public function integer f_tamanio2 ()
public function boolean f_anulo ()
end prototypes

public function string f_titulo ();RETURN ("OPEN SGI - Mantenimiento del Servicio Ejecutor Ocen")
end function

public function integer f_agregar_registro ();//24/10/2008   yaf

int mesa
string ls_ejec_serv
string ls_codigo

SetPointer(HourGlass!)

ls_ejec_serv = This.GetItemString(This.GetRow(), "codigo")

SELECT CODIGO INTO :ls_codigo
FROM GI_OCEN_SERVICIO_EJECUTOR
WHERE codigo = :ls_ejec_serv AND rownum = 1;


mesa = gnv_msg.f_mensaje("CM05","","",YesNo!)
IF mesa = 1  THEN
        this.DeleteRow(0)
        //this.Update()
        this.SetFocus()
        this.SetRow(this.GetRow())
        this.SetColumn(1)
ELSE
  return 1
END IF

return 1
end function

public function string f_datawindow ();//24/10/2008 yaf

return("d_man_5020_ocen_ser_ejec")
end function

public function integer f_posicion ();//24/10/2008 yaf
w_generica_mant.Move(322,200)

return 1
end function

public function integer f_tamanio_win ();w_generica_mant.Resize(2210,1225)

return 1
end function

public function integer f_tamanio2 ();this.resize(1950,860)

return 1
end function

public function boolean f_anulo ();return true
end function

on u_man_2050_ocen_ser_ejec.create
call super::create
end on

on u_man_2050_ocen_ser_ejec.destroy
call super::destroy
end on


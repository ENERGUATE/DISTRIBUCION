HA$PBExportHeader$u_pr_funcion.sru
forward
global type u_pr_funcion from datawindow
end type
end forward

global type u_pr_funcion from datawindow
integer width = 955
integer height = 704
integer taborder = 1
string dataobject = "d_funcion"
boolean livescroll = true
end type
global u_pr_funcion u_pr_funcion

forward prototypes
public function integer fnu_insertar_datos ()
end prototypes

public function integer fnu_insertar_datos ();This.InsertRow(0)
/*This.SetItem(1,"funcion","MAX")
This.SetItem(1,"aplica_a","T")

This.InsertRow(0)
This.SetItem(2,"funcion","MIN")
This.SetItem(2,"aplica_a","T")

This.InsertRow(0)
This.SetItem(3,"funcion","SUM")
This.SetItem(3,"aplica_a","N")

This.InsertRow(0)
This.SetItem(4,"funcion","AVG")
This.SetItem(4,"aplica_a","N")*/


return 1
end function

on u_pr_funcion.create
end on

on u_pr_funcion.destroy
end on


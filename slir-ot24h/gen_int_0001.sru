HA$PBExportHeader$gen_int_0001.sru
forward
global type gen_int_0001 from nonvisualobject
end type
end forward

global type gen_int_0001 from nonvisualobject
end type
global gen_int_0001 gen_int_0001

type variables
gen_obj_0000 io_obj
end variables

forward prototypes
public subroutine init (gen_obj_0000 obj)
end prototypes

public subroutine init (gen_obj_0000 obj); io_obj = obj

end subroutine

on gen_int_0001.create
TriggerEvent( this, "constructor" )
end on

on gen_int_0001.destroy
TriggerEvent( this, "destructor" )
end on


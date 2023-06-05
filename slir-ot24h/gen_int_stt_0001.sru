HA$PBExportHeader$gen_int_stt_0001.sru
forward
global type gen_int_stt_0001 from gen_int_0001
end type
end forward

global type gen_int_stt_0001 from gen_int_0001
end type
global gen_int_stt_0001 gen_int_stt_0001

type variables
string state=''
end variables

forward prototypes
public subroutine setstate (string pstate)
public function string getstate ()
end prototypes

public subroutine setstate (string pstate);State = pstate
end subroutine

public function string getstate ();return state
end function

on gen_int_stt_0001.create
TriggerEvent( this, "constructor" )
end on

on gen_int_stt_0001.destroy
TriggerEvent( this, "destructor" )
end on


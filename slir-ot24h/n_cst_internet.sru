HA$PBExportHeader$n_cst_internet.sru
$PBExportComments$Objeto comunicaciones v$$HEX1$$ed00$$ENDHEX$$a internet.
forward
global type n_cst_internet from internetresult
end type
end forward

global type n_cst_internet from internetresult
end type
global n_cst_internet n_cst_internet

type variables
string is_data


end variables

forward prototypes
public function integer internetdata (blob data)
end prototypes

public function integer internetdata (blob data);is_data = string(data)

RETURN 1

end function

on n_cst_internet.create
call internetresult::create
TriggerEvent( this, "constructor" )
end on

on n_cst_internet.destroy
call internetresult::destroy
TriggerEvent( this, "destructor" )
end on


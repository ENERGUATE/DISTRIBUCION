HA$PBExportHeader$ds_5001_reportes.sru
forward
global type ds_5001_reportes from datastore
end type
end forward

global type ds_5001_reportes from datastore
end type
global ds_5001_reportes ds_5001_reportes

on ds_5001_reportes.create
call datastore::create
TriggerEvent( this, "constructor" )
end on

on ds_5001_reportes.destroy
call datastore::destroy
TriggerEvent( this, "destructor" )
end on


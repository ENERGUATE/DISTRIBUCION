HA$PBExportHeader$gen_obj_0000.sru
forward
global type gen_obj_0000 from nonvisualobject
end type
end forward

global type gen_obj_0000 from nonvisualobject
event init ( datawindow ds,  long row )
event default ( )
event type integer acceptvalues ( )
event edit ( )
event attr ( )
end type
global gen_obj_0000 gen_obj_0000

type variables
gen_int_ds_0000 int_ds
protected:
datawindow d_source;
long         CurrentRow=0;
end variables

forward prototypes
public function long getitemnumber (string column)
public function decimal getitemdecimal (string column)
public function string getitemstring (string column)
public function datetime getitemdatetime (string column)
public function date getitemdate (string column)
public function time getitemtime (string column)
public function long setitem (string column, any value)
public subroutine setrow (long row)
public subroutine datatransfer_in (datawindow ds, integer row)
public subroutine datatransfer_out (datawindow ds, integer row)
end prototypes

event init;//DataStore lds 
//DataWindow ldw 
//
//currentrow = row
//
//if typeof(ds) = DataWindow! then
//	ldw = ds
//	d_source.DataObject = ldw.DataObject
//	d_source.settransobject(SQLCA)
//	ldw.ShareData(d_source)
//else
//	lds = ds
//	d_source.DataObject = lds.DataObject
//	d_source.settransobject(SQLCA)
//	lds.ShareData(d_source)
//end if
if typeof(ds) = DataWindow! then
	d_source = ds
	currentrow = row
end if
end event

event acceptvalues;return 0

end event

event attr;d_source.SetItem(currentrow,'programa','u_gen_0000')
d_source.SetItem(currentrow,'usuario', gs_usuario  )
d_source.SetItem(currentrow,'f_actual',fgnu_fecha_actual ())
end event

public function long getitemnumber (string column);
	return d_source.getitemnumber (currentrow,column)
end function

public function decimal getitemdecimal (string column)
	return d_source.getitemdecimal (currentrow,column)
end function

public function string getitemstring (string column)
	return d_source.getitemstring (currentrow,column)
end function

public function datetime getitemdatetime (string column)
	return d_source.getitemdatetime (currentrow,column)
end function

public function date getitemdate (string column)
	return d_source.getitemdate (currentrow,column)
end function

public function time getitemtime (string column)
	return d_source.getitemtime (currentrow,column)
end function

public function long setitem (string column, any value)
	return d_source.setitem (currentrow,column,value)
end function

public subroutine setrow (long row);currentrow = row
end subroutine

public subroutine datatransfer_in (datawindow ds, integer row);int_ds.datatransfer( d_source,currentrow,ds,row)


end subroutine

public subroutine datatransfer_out (datawindow ds, integer row);int_ds.datatransfer( ds,row,d_source,currentrow)


end subroutine

on gen_obj_0000.create
TriggerEvent( this, "constructor" )
end on

on gen_obj_0000.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;Destroy(d_source)

end event

event constructor;int_ds = Create gen_int_ds_0000 
end event


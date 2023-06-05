HA$PBExportHeader$u_lista_orden.sru
forward
global type u_lista_orden from datawindow
end type
end forward

global type u_lista_orden from datawindow
int Width=1116
int Height=1033
int TabOrder=1
string DataObject="d_lista_orden"
BorderStyle BorderStyle=StyleRaised!
boolean LiveScroll=true
end type
global u_lista_orden u_lista_orden

forward prototypes
public function boolean fnu_ya_existe (string ps_item)
end prototypes

public function boolean fnu_ya_existe (string ps_item);int li_cont


FOR li_cont = 1 TO This.RowCount()
	IF ps_item = This.GetItemString(li_cont,"nombre") THEN
		return true
	END IF
	
NEXT


return false
end function


HA$PBExportHeader$gen_int_ds_0000.sru
forward
global type gen_int_ds_0000 from nonvisualobject
end type
end forward

global type gen_int_ds_0000 from nonvisualobject
end type
global gen_int_ds_0000 gen_int_ds_0000

forward prototypes
public subroutine datatransfer (datawindow dw_destination, long destrow, datawindow dw_source, long sourcerow)
end prototypes

public subroutine datatransfer (datawindow dw_destination, long destrow, datawindow dw_source, long sourcerow);Integer li_Col, li_Num_Col
String  ls_name, ls_columnnames, ls_type


li_Num_Col = INTEGER( dw_destination.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
		ls_name = upper (dw_destination.Describe( "#"+STRING(li_Col)+".Name"))
		ls_columnnames = 	 ls_columnnames + ls_name + ';'
END FOR

li_Num_Col = INTEGER( dw_source.Describe( "DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
		ls_name = upper (dw_source.Describe( "#"+STRING(li_Col)+".Name") )
		IF pos(ls_columnnames, ls_name) > 0 THEN
			ls_type =UPPER(MID(dw_source.Describe("#"+STRING(li_Col)+".ColType"),1,10))
			CHOOSE CASE ls_type
			CASE "DATETIME"
						dw_destination.SetItem( destrow, ls_name, &
								GetItemDateTime(dw_source, sourcerow, ls_name))					
			CASE "DATE"
						dw_destination.SetItem( destrow, ls_name, &
								dw_source.GetItemDate( sourcerow, ls_name))					
			CASE "TIME"
						dw_destination.SetItem( destrow, ls_name, &
								GetItemTime(dw_source, sourcerow, ls_name))					

			CASE "NUMBER"
						dw_destination.SetItem( destrow, ls_name, &
								GetItemNumber(dw_source, sourcerow, ls_name))					
			CASE ELSE
					IF pos( ls_type, 'DECIMAL') >0  THEN
							dw_destination.SetItem( destrow, ls_name, &
									GetItemDecimal(dw_source, sourcerow, ls_name))					

					ELSEIF pos( ls_type, 'CHAR') >0  THEN				
							dw_destination.SetItem( destrow, ls_name, &
									GetItemString(dw_source, sourcerow, ls_name))					
					ELSE
							gnv_msg.f_mensaje( "EC03","","",OK!)	
					END IF
			END CHOOSE
		END IF
END FOR



end subroutine

on gen_int_ds_0000.create
TriggerEvent( this, "constructor" )
end on

on gen_int_ds_0000.destroy
TriggerEvent( this, "destructor" )
end on


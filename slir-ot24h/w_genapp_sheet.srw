HA$PBExportHeader$w_genapp_sheet.srw
$PBExportComments$Generated MDI sheet window
forward
global type w_genapp_sheet from Window
end type
end forward

global type w_genapp_sheet from Window
int X=672
int Y=264
int Width=1582
int Height=1064
boolean TitleBar=true
string Title="Sheet"
string MenuName="m_genapp_sheet"
long BackColor=79741120
boolean ControlMenu=true
boolean MinBox=true
boolean MaxBox=true
boolean Resizable=true
end type
global w_genapp_sheet w_genapp_sheet

event open;// Open script for w_genapp_sheet

integer li_count

// Sheet opening - reflect sheet count in title
li_count = w_genapp_frame.of_GetSheetCount ()
this.title = "Sheet:" + String (li_count)

end event

on w_genapp_sheet.create
if this.MenuName = "m_genapp_sheet" then this.MenuID = create m_genapp_sheet
end on

on w_genapp_sheet.destroy
if IsValid(MenuID) then destroy(MenuID)
end on

event close;// Close script for w_genapp_sheet

// Disable printing if last sheet
if w_genapp_frame.of_GetSheetCount () = 1 then
	w_genapp_frame.of_EnablePrint (FALSE)
end if
end event


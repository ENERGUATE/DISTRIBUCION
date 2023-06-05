HA$PBExportHeader$w_genapp_frame.srw
$PBExportComments$Generated MDI frame window
forward
global type w_genapp_frame from window
end type
type mdi_1 from mdiclient within w_genapp_frame
end type
end forward

global type w_genapp_frame from window
integer x = 256
integer y = 132
integer width = 2409
integer height = 1572
boolean titlebar = true
string title = "Frame"
string menuname = "m_genapp_sheet"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 276856960
event type boolean ue_enableprint ( ref boolean ab_status )
event ue_reportes pbm_custom24
mdi_1 mdi_1
end type
global w_genapp_frame w_genapp_frame

forward prototypes
public subroutine of_enableprint (boolean ab_enable)
public subroutine of_closesheet ()
public function integer of_getsheetcount ()
public function integer of_newsheet ()
end prototypes

event ue_enableprint;// ue_EnablePrint(ab_status) script for w_genapp_frame
// Enables/disables File/Print menu item, according to value of ab_status

m_genapp_frame	lm_genapp_frame

// Enable or disable printing
lm_genapp_frame = menuid
lm_genapp_frame.m_file.m_print.enabled = ab_status
	
return ab_status

end event

event ue_reportes;SetPointer(HourGlass!)

if  isValid(w_reportes) or IsValid(w_reportes_new) then Return
OpenSheet (w_reportes, w_genapp_frame,3, layered!)

end event

public subroutine of_enableprint (boolean ab_enable);//////////////////////////////////////////////////////////////////
// 	Subroutine:
//		of_EnablePrint 
//
//		Access:  
//		Public
//
//		Returns:
//		[Nothing]
//
//		Arguments:
//		ab_enable	Flag to indicate action to be performed
//
// 	Description:
//		Enables or disables File/Print menu (via user-defined event)
//////////////////////////////////////////////////////////////////
if ab_enable then
	this.event ue_EnablePrint (ab_enable)
else
	this.post event ue_EnablePrint (ab_enable)
end if

end subroutine

public subroutine of_closesheet ();// Subroutine of_CloseSheet ( )
//////////////////////////////////////////////////////////////////
// 	Subroutine:
//		of_CloseSheet
//
//		Access:  
//		Public
//
//		Arguments:
//		None
//
//		Returns:
//		[Nothing]
//
// 	Description:
//		Closes the active sheet window
//////////////////////////////////////////////////////////////////

window	lw_sheet

lw_sheet = this.GetActiveSheet ()
if IsValid (lw_sheet) then
	Close (lw_sheet)
end if
end subroutine

public function integer of_getsheetcount ();//////////////////////////////////////////////////////////////////
// 	Function:
//		of_GetSheetCount 
//
//		Access:  
//		Public
//
//		Arguments:
//		None
//
//		Returns:
//		Integer
//
// 	Description:
//		Returns number of open sheet windows
//////////////////////////////////////////////////////////////////

integer	li_count=0
window	lw_sheet

// Return number of open sheets
lw_sheet = this.GetFirstSheet ()
if IsValid (lw_sheet) then
	do
		li_count += 1
		lw_sheet  = this.GetNextSheet (lw_sheet)
	loop while IsValid (lw_sheet)
end if

return li_count

end function

public function integer of_newsheet ();//////////////////////////////////////////////////////////////////
// 	Function:
//		of_NewSheet
//
//		Access:  
//		Public
//
//		Arguments:
//		None
//
//		Returns value returned to it by OpenSheet function:
//		SUCCESS = 1
//		ERROR = -1
//	
// 	Description:
//		Opens a new instance of w_genapp_sheet
//////////////////////////////////////////////////////////////////

w_genapp_sheet	lw_sheet

// Enable printing
of_EnablePrint (TRUE)

// Open a new instance of a sheet
return OpenSheet (lw_sheet, this, 0, layered!)

end function

event open;// Open script for w_genapp_frame

// Create the initial sheet
//of_NewSheet ()
this.toolbaralignment = alignatleft!


	openwithparm(w_msg,'Espere...')
	
	
	OpenSheet (w_back, this, menu, layered!)
	//OpenSheet (w_frontend, this, menu, layered!)
	
	yield()
	
	//Agregado 3ra etapa
	open(w_shared)
	///////////////////////
	
	
	OpenSheet (w_qmenu2, w_genapp_frame, menu, original!)
	
	//OpenSheet (w_dash0, w_genapp_frame, menu, original!)
	
	close(w_msg)
	
this.title= 'SLIR para '+g_nombre + ' | DBSGI : ' + tituloDBSGI + ' | DBOT : ' +  tituloDBOT

//Agregado 3ra etapa
if g_credenciales = 'OPR' then
       m_genapp_frame.m_informes.m_1.enabled=false
end if

if g_credenciales = 'CON' then
      m_genapp_frame.m_herramientas.m_0.enabled=false
	  m_genapp_frame.m_herramientas.m_resolverregistros.enabled=false
	  m_genapp_frame.m_herramientas.m_avisossgi.enabled=false
	  m_genapp_frame.m_herramientas.m_consultarllamadas.enabled=false
	  m_genapp_frame.m_herramientas.m_capturadellamadas.enabled=false
end if

if g_credenciales = 'OCM' then
	m_genapp_frame.m_herramientas.m_avisossgi.enabled = false
	m_genapp_frame.m_herramientas.m_capturadellamadas.enabled = false
	m_genapp_frame.m_herramientas.m_consultarllamadas.enabled = false
	m_genapp_frame.m_herramientas.m_resolverregistros.enabled = false
	m_genapp_frame.m_informes.m_estad$$HEX1$$ed00$$ENDHEX$$siticadeoperadores.enabled = false
	
end if


// Mostrando y ocultando desborde de llamadas
IF g_credenciales = 'SPV' THEN
	m_genapp_frame.m_herramientas.m_desbordedellamadas.enabled = TRUE
	m_genapp_frame.m_informes.m_reportededatos.enabled = TRUE //hespinoza
ELSE
	m_genapp_frame.m_herramientas.m_desbordedellamadas.enabled = FALSE
	m_genapp_frame.m_informes.m_reportededatos.enabled = FALSE //hespinoza
END IF
end event

on w_genapp_frame.create
if this.MenuName = "m_genapp_sheet" then this.MenuID = create m_genapp_sheet
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_genapp_frame.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event close;update usuario
			set  ensesion=0
			where usuario=:g_cod_usuario
			using sqlca2;
			
commit using sqlca2;
end event

type mdi_1 from mdiclient within w_genapp_frame
long BackColor=276856960
end type


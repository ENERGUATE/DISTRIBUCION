HA$PBExportHeader$u_man_0002_alcance_de_incid.sru
$PBExportComments$El Obeto basico para mantenimiento de la ventana w_man_0002_mantenimiento
forward
global type u_man_0002_alcance_de_incid from u_man_0002_generico
end type
type dw_1 from u_gen_0002_pr_generico within u_man_0002_alcance_de_incid
end type
type dw_2 from u_gen_0002_pr_generico within u_man_0002_alcance_de_incid
end type
type st_1 from statictext within u_man_0002_alcance_de_incid
end type
type st_2 from statictext within u_man_0002_alcance_de_incid
end type
end forward

global type u_man_0002_alcance_de_incid from u_man_0002_generico
int Width=2043
int Height=1164
boolean Border=false
BorderStyle BorderStyle=StyleBox!
long BackColor=79741120
dw_1 dw_1
dw_2 dw_2
st_1 st_1
st_2 st_2
end type
global u_man_0002_alcance_de_incid u_man_0002_alcance_de_incid

forward prototypes
public subroutine wf_rowfocuschanged (long currentrow)
public function long f_retrieve ()
public function string f_titulo ()
end prototypes

public subroutine wf_rowfocuschanged (long currentrow);long ll_codigo
string ls_filtro

if currentrow > 0  then
	dw_2.SetRedraw (FALSE)
	dw_2.ScrollToRow (currentrow) 
	dw_2.SetFilter ("")	
	dw_2.Filter	() 		
	ll_codigo = dw_1.GetItemNumber(currentrow, "codigo")
	CHOOSE CASE ll_codigo
		CASE fgci_incidencia_imprevista
				ls_filtro = "codigo ="+string(fgci_incidencia_de_suministro) + &
								" or codigo ="+string(fgci_incidencia_sin_interrupcion)  + &
								" or codigo ="+string(fgci_incidencia_con_interrupcion)
				IF gb_scada THEN								
					ls_filtro = ls_filtro + " or codigo ="+string(fgci_incidencia_reenganche)
				END IF
				dw_2.SetFilter(ls_filtro)
		CASE fgci_incidencia_programada		
							dw_2.SetFilter ("codigo ="+string(fgci_incidencia_sin_interrupcion)  + &
								" or codigo ="+string(fgci_incidencia_con_interrupcion))

		CASE fgci_incidencia_calidad 
					dw_2.SetFilter ("codigo ="+string(fgci_incidencia_de_suministro)  + &
							" or codigo ="+string(fgci_incidencia_de_instalacion))
		CASE fgci_incidencia_obligada
				dw_2.SetFilter ("codigo =" + string(fgci_incidencia_con_interrupcion))
		
		CASE fgci_incidencia_alum_pub
				dw_2.SetFilter ("codigo =" + string(fgci_incidencia_de_suministro))
											
	END CHOOSE
	dw_2.Filter	() 		
	dw_2.SetRedraw (TRUE)
end if


	
end subroutine

public function long f_retrieve ();dw_1.SetRedraw (FALSE)
dw_2.SetRedraw (FALSE)

if dw_1.retrieve("INC") > 0 then
	if not gb_scada then 
		dw_1.SetFilter("codigo <>"+string(fgci_incidencia_scada)+" and codigo <>"+string(fgci_todos))
		dw_1.Filter()
end if 

	wf_rowfocuschanged (1)
	dw_2.retrieve("IN_A")
end if

dw_1.SetRedraw (TRUE)
dw_2.SetRedraw (TRUE)

return 1
end function

public function string f_titulo ();return 'OPEN SGI - Consulta del Alcance de Incidencias'
end function

on u_man_0002_alcance_de_incid.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_2=create dw_2
this.st_1=create st_1
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_2
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
end on

on u_man_0002_alcance_de_incid.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_2)
destroy(this.st_1)
destroy(this.st_2)
end on

event constructor;call super::constructor;dw_1.fpr_InitAdvances(TRUE)
dw_2.fpr_InitAdvances(TRUE)
dw_1.Event ue_statechanged('CONSULTAR')
dw_2.Event ue_statechanged('CONSULTAR')
dw_1.setrowfocusIndicator(Hand!)
dw_1.SetFocus()
end event

type dw_1 from u_gen_0002_pr_generico within u_man_0002_alcance_de_incid
int X=64
int Y=76
int Width=1888
int Height=448
int TabOrder=10
boolean BringToTop=true
string DataObject="d_man_sgd_valor"
boolean VScrollBar=true
end type

event rowfocuschanged;call super::rowfocuschanged;wf_rowfocuschanged(currentrow)
end event

type dw_2 from u_gen_0002_pr_generico within u_man_0002_alcance_de_incid
int X=59
int Y=608
int Width=1888
int Height=476
int TabOrder=0
boolean BringToTop=true
string DataObject="d_man_sgd_valor"
boolean VScrollBar=true
end type

type st_1 from statictext within u_man_0002_alcance_de_incid
int X=55
int Y=8
int Width=681
int Height=68
boolean Enabled=false
boolean BringToTop=true
string Text="Tipo de Incidencia:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_2 from statictext within u_man_0002_alcance_de_incid
int X=55
int Y=540
int Width=302
int Height=68
boolean Enabled=false
boolean BringToTop=true
string Text="Alcance:"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


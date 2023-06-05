HA$PBExportHeader$u_bdg_2009_pr_criterio_seleccion.sru
forward
global type u_bdg_2009_pr_criterio_seleccion from u_bdg_1001_pr_generico
end type
end forward

global type u_bdg_2009_pr_criterio_seleccion from u_bdg_1001_pr_generico
int Width=2848
int Height=528
string DataObject="dw_bdg_2009_pr_criterio_seleccion"
end type
global u_bdg_2009_pr_criterio_seleccion u_bdg_2009_pr_criterio_seleccion

type variables
DataWindowChild ddw_brigada
DataWindowChild ddw_contrata
DataWindowChild ddw_todos
DataWindowChild ddw_tipo_inc
DataWindowChild ddw_tension_inc
DataWindowChild ddw_material_averiado
DataWindowChild ddw_int_horario
int ii
end variables

forward prototypes
public function integer fpr_crea_dddw ()
public subroutine fnu_cargar_ddw_trabajo ()
public function integer fpr_crea_dddw_brigada ()
public subroutine fnu_cargar_alcance (integer pi_tipo_incidencia)
public subroutine fnu_cargar_ddw ()
end prototypes

public function integer fpr_crea_dddw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crea_dddw
// 
// Objetivo: Crea (conecta) las Drop Down DataWindows internas 
//				 del user object.
//	
//
// Ambito:	
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	20/06/96		 HMA			Versi$$HEX1$$f300$$ENDHEX$$n Original
//
////////////////////////////////////////////////////////////////////////////////////////////////

int aux
aux=THIS.GetChild("pa_tipo_incidencia",ddw_tipo_inc)
ddw_tipo_inc.SetTransObject(SQLCA)
ddw_tipo_inc.Retrieve()

aux=THIS.GetChild("pa_int_horario",ddw_int_horario)
ddw_tipo_inc.SetTransObject(SQLCA)
ddw_tipo_inc.Retrieve()
RETURN 1


end function

public subroutine fnu_cargar_ddw_trabajo ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_ddw_trabajo
// 
// Objetivo: Carga el datawindowchild de tipo de trabajo
//	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	09/10/2000		 GSH			Version 2000.1
//
////////////////////////////////////////////////////////////////////////////////////////////////

datawindowchild ddw_tipo_brigada
This.GetChild('pi_tipo_trabajo', ddw_tipo_brigada)
ddw_tipo_brigada.SetTransObject(sqlca)
ddw_tipo_brigada.Retrieve()

end subroutine

public function integer fpr_crea_dddw_brigada ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fpr_crea_dddw_brigada
// 
// Objetivo: Crea (conecta) las Drop Down DataWindows internas 
//				 del user object.
//	
//
// Ambito:	
//
// Par$$HEX1$$e100$$ENDHEX$$metros: 
//	Entrada:  --
//	Salida:   --
//						
// Devuelve:	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	10/10/2000		 GSH			Versi$$HEX1$$f300$$ENDHEX$$n 2000.1
//
////////////////////////////////////////////////////////////////////////////////////////////////

int aux,li_trabajo,li_tipo

li_trabajo = this.GetItemNumber (1,'pi_tipo_trabajo')
li_tipo    = this.GetItemNumber (1,'pi_tipo')

this.Object.pa_brigada.DDDW.Name='dddw_brigadas_bdg'
aux=THIS.GetChild("pa_brigada",ddw_brigada)
ii=ddw_brigada.SetTransObject(SQLCA)
aux=ddw_brigada.Retrieve(li_trabajo,li_tipo)

ddw_brigada.InsertRow(1)
ddw_brigada.SetItem(1,"numero",0)
ddw_brigada.SetItem(1,"nombre","<Todos>")
RETURN 1


end function

public subroutine fnu_cargar_alcance (integer pi_tipo_incidencia);datawindowchild ddw_child_alcance
string ls_tipos, ls_filtro

this.GetChild("pi_alcance",ddw_child_alcance)
ddw_child_alcance.SetTransObject (SQLCA)

CHOOSE CASE pi_tipo_incidencia
CASE fgci_todos
	ls_tipos = "("+string(fgci_todos)+")"
CASE fgci_incidencia_imprevista
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_de_suministro)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"
CASE fgci_incidencia_programada
		ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"
CASE fgci_incidencia_calidad
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_de_suministro)+","+string(fgci_incidencia_de_instalacion)+")"
 CASE fgci_incidencia_scada
	ls_tipos = "("+string(fgci_todos)+","+string(fgci_incidencia_reenganche)+","+string(fgci_incidencia_sin_interrupcion)+","+string(fgci_incidencia_con_interrupcion)+")"		
END CHOOSE

ls_filtro = 'codigo in '+ ls_tipos

ddw_child_alcance.Retrieve('IN_A')
ddw_child_alcance.SetFilter(ls_filtro)
ddw_child_alcance.Filter()
//ddw_child_alcance.Sort()
end subroutine

public subroutine fnu_cargar_ddw ();////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n: fnu_cargar_ddw
// 
// Objetivo: Carga el datawindowchild de alcance
//	
//
//  Fecha	  Responsable	Actuaci$$HEX1$$f300$$ENDHEX$$n
// ---------	-------		----------------------------------------
//	09/10/2000		 GSH			Version 2000.1
//
////////////////////////////////////////////////////////////////////////////////////////////////


datawindowchild ddw_child_tipo_inc
datawindowchild ddw_child_int_horario
string ls_filtro

this.GetChild("pa_tipo_incidencia",ddw_child_tipo_inc)
ddw_child_tipo_inc.SetTransObject(SQLCA)
ddw_child_tipo_inc.retrieve()

IF fgci_con_scada = 0 THEN
	ls_filtro = "tip_incidencia <> " + string(fgci_incidencia_scada)
END IF

ddw_child_tipo_inc.SetFilter(ls_filtro)
ddw_child_tipo_inc.Filter()

This.GetChild('pa_int_horario',ddw_child_int_horario)
ddw_child_int_horario.SetTransObject(sqlca)
ddw_child_int_horario.Retrieve()



end subroutine

on clicked;// No corresponde que se ejecute el script del padre !!!
end on

event constructor;// No corresponde que se ejecute el script del padre !!!

//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
This.Modify("pa_zona_cmd.CheckBox.Text = '" + fg_cor_dw("Zona / Cmd", "CMD") + "'")
//***************************************
//**  OSGI 2001.1  	15/05/2001			**
//**  Jair Padilla / Soluziona PANAMA  **
//***************************************
end event


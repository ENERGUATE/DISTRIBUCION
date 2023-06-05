HA$PBExportHeader$w_7003_datos_descargo.srw
forward
global type w_7003_datos_descargo from w_sgigenerica
end type
type gb_marco from groupbox within w_7003_datos_descargo
end type
type cb_ok from commandbutton within w_7003_datos_descargo
end type
type st_1 from statictext within w_7003_datos_descargo
end type
type st_2 from statictext within w_7003_datos_descargo
end type
type st_3 from statictext within w_7003_datos_descargo
end type
type st_nom_inst from statictext within w_7003_datos_descargo
end type
type st_st_f_ini from statictext within w_7003_datos_descargo
end type
type st_st_f_fin from statictext within w_7003_datos_descargo
end type
type uo_barra from u_gen_barra within w_7003_datos_descargo
end type
type dw_interrupcion_descargo from datawindow within w_7003_datos_descargo
end type
type dw_sum_imp from datawindow within w_7003_datos_descargo
end type
type gb_clientes from groupbox within w_7003_datos_descargo
end type
end forward

global type w_7003_datos_descargo from w_sgigenerica
int X=407
int Y=300
int Width=2935
int Height=1140
WindowType WindowType=response!
boolean TitleBar=true
string Title="OPEN SGI - Datos asociados al Corte Programado"
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
string Icon="descargo.ico"
gb_marco gb_marco
cb_ok cb_ok
st_1 st_1
st_2 st_2
st_3 st_3
st_nom_inst st_nom_inst
st_st_f_ini st_st_f_ini
st_st_f_fin st_st_f_fin
uo_barra uo_barra
dw_interrupcion_descargo dw_interrupcion_descargo
dw_sum_imp dw_sum_imp
gb_clientes gb_clientes
end type
global w_7003_datos_descargo w_7003_datos_descargo

type variables
datawindowchild d_provincias, d_municipios, d_localidades, d_deptos
string is_nom_ins, is_f_ini, is_f_fin
end variables

forward prototypes
public function integer fpr_insertar_sum_imp (long pl_inst_afectada)
end prototypes

public function integer fpr_insertar_sum_imp (long pl_inst_afectada);////////////////////////////////////////////////
//FUNCION : FPR_INSERTAR_SUM_IMP
//
//OBJETIVO : Obtiene los clientes importantes de cada instalaci$$HEX1$$f300$$ENDHEX$$n
//				 pasada como parametro
//
// ENTRADA : pl_nro_instalacion
//
//
//
//
///////////////////////////////////////////////////
datetime ldt_f_desde, ldt_f_expiracion
string ls_observacion, ls_nom_cli, ls_ape1_cli, ls_ape2_cli, ls_contacto, ls_telefono, ls_nom_completo
long ll_instalacion_origen, ll_fila

DECLARE lcur_sum_imp2 CURSOR FOR 
	(select f_desde,f_Expiracion, observacion,nom_cli,ape1_cli,ape2_cli,contacto, gi_suministros_imp.telefono,
		sgd_acometida.instalacion_origen  
		FROM GI_SUMINISTROS_IMP,   
		 ACO_SUM,
         SGD_ACOMETIDA,   
         CLIENTES
	WHERE (GI_SUMINISTROS_IMP.COD_CLI = CLIENTES.COD_CLI) AND
		   (ACO_SUM.NIS_RAD = GI_SUMINISTROS_IMP.NIS_RAD)  AND
         (SGD_ACOMETIDA.CODIGO = ACO_SUM.NRO_ACOMETIDA)  AND
			(GI_SUMINISTROS_IMP.F_EXPIRACION >= TO_DATE(:is_f_ini, 'dd/mm/yyyy hh24:mi'))  AND
         (SGD_ACOMETIDA.INSTALACION_ORIGEN in 
							(	SELECT  "SGD_ACOMETIDA"."INSTALACION_ORIGEN"
								FROM "SGD_ACOMETIDA"
								WHERE "SGD_ACOMETIDA"."CODIGO" = :pl_inst_afectada and bdi_job =0
								 UNION
				 				SELECT SGD_INSTALACION.NRO_INSTALACION
								 FROM SGD_INSTALACION
								 START WITH SGD_INSTALACION.NRO_INSTALACION = :pl_inst_afectada and bdi_job=0 
                         CONNECT BY PRIOR SGD_INSTALACION.NRO_INSTALACION = SGD_INSTALACION.NRO_INST_PADRE and bdi_job = 0)
		  )) ;


OPEN lcur_sum_imp2;
FETCH lcur_sum_imp2 
INTO
	:ldt_f_desde,
	:ldt_f_expiracion,   
	:ls_observacion,   
	:ls_nom_cli,   
	:ls_ape1_cli,   
	:ls_ape2_cli,   
	:ls_contacto,   
	:ls_telefono,
	:ll_instalacion_origen;

IF SQLCA.SQLCODE <> 0 THEN 
	CLOSE lcur_sum_imp2;
	RETURN -1
END IF
DO WHILE SQLCA.SQLCODE = 0 
		//inserto los datos en la data window
		ll_fila = dw_sum_imp.InsertRow(0)
		dw_sum_imp.SetItem(ll_fila, 'contacto', ls_contacto)
		dw_sum_imp.SetItem(ll_fila, 'telefono', ls_telefono)
		dw_sum_imp.SetItem(ll_fila, 'f_desde', ldt_f_desde)
		dw_sum_imp.SetItem(ll_fila, 'f_expiracion', ldt_f_expiracion)
		dw_sum_imp.SetItem(ll_fila, 'observacion', ls_observacion)
		dw_sum_imp.SetItem(ll_fila, 'ape1_cli', ls_ape1_cli)
		dw_sum_imp.SetItem(ll_fila, 'ape2_cli', ls_ape2_cli)
		dw_sum_imp.SetItem(ll_fila, 'nom_cli', ls_nom_cli)

		FETCH lcur_sum_imp2 
		INTO
			:ldt_f_desde,
			:ldt_f_expiracion,   
			:ls_observacion,   
			:ls_nom_cli,   
			:ls_ape1_cli,   
			:ls_ape2_cli,   
			:ls_contacto,   
			:ls_telefono,
			:ll_instalacion_origen;
		
LOOP
CLOSE lcur_sum_imp2;


RETURN 1
end function

on w_7003_datos_descargo.create
int iCurrent
call super::create
this.gb_marco=create gb_marco
this.cb_ok=create cb_ok
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_nom_inst=create st_nom_inst
this.st_st_f_ini=create st_st_f_ini
this.st_st_f_fin=create st_st_f_fin
this.uo_barra=create uo_barra
this.dw_interrupcion_descargo=create dw_interrupcion_descargo
this.dw_sum_imp=create dw_sum_imp
this.gb_clientes=create gb_clientes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_marco
this.Control[iCurrent+2]=this.cb_ok
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_nom_inst
this.Control[iCurrent+7]=this.st_st_f_ini
this.Control[iCurrent+8]=this.st_st_f_fin
this.Control[iCurrent+9]=this.uo_barra
this.Control[iCurrent+10]=this.dw_interrupcion_descargo
this.Control[iCurrent+11]=this.dw_sum_imp
this.Control[iCurrent+12]=this.gb_clientes
end on

on w_7003_datos_descargo.destroy
call super::destroy
destroy(this.gb_marco)
destroy(this.cb_ok)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_nom_inst)
destroy(this.st_st_f_ini)
destroy(this.st_st_f_fin)
destroy(this.uo_barra)
destroy(this.dw_interrupcion_descargo)
destroy(this.dw_sum_imp)
destroy(this.gb_clientes)
end on

event open;call super::open;//////////////////////////////////////////////////////////////////////
//
//		VENTANA W_7003_datos_descargos
//
//	OBJETIVO:
// Muestra el menor y mayor nro. de puerta para las calles de las 
//	acometidas que alimentan las instalaciones que se interrumpiran
// para el descargo, y los clientes importantes afectados
//
//parametros 
//entrada: gu_comunic.is_comunic.longval1 = nro de descargo
//
//
////////////////////////////////////////////////////////////////////
long ll_instalacion_afectada,ll_instalacion_hija, ll_nro_descargo, ll_total_filas, ll_nro_fila, ll_nis_rad
long ll_fila
integer li_retorno_funcion, li_ind_suministro
datetime ld_f_ini_solicitado,  ldt_f_desde, ldt_f_expiracion
string ls_observacion, ls_nom_cli, ls_ape1_cli, ls_ape2_cli, ls_contacto, ls_telefono, ls_nom_completo


SetPointer(HourGlass!)


ll_nro_descargo = gu_comunic.is_comunic.longval1
st_st_f_ini.Text = string(gu_comunic.is_comunic.datval1, "dd/mm/yyyy hh:mm")
st_st_f_fin.Text = string(gu_comunic.is_comunic.datval2, "dd/mm/yyyy hh:mm")
st_nom_inst.Text = gu_comunic.is_comunic.strval2

is_f_ini = st_st_f_ini.Text
is_f_fin = st_st_f_fin.Text
is_nom_ins = st_nom_inst.Text

//corto las dw

dw_sum_imp.SetReDraw(False)

// Cargo todas las instalaciones interrumpidas
dw_interrupcion_descargo.SetTransObject(SQLCA)
dw_interrupcion_descargo.Retrieve(ll_nro_descargo)




ll_total_filas = dw_interrupcion_descargo.RowCount()

//uo_barra.reset()
uo_barra.f_resetea_barra()
gb_marco.visible = TRUE
uo_barra.visible = TRUE

Select cod_inst_origen, f_ini_solicitado //Si el corte programado es de suministro se guarda el nis_rad en instalacion
into :ll_nis_rad, :ld_f_ini_solicitado
from sgd_descargos
where nro_descargo = :ll_nro_descargo;

For ll_nro_fila = 1 to ll_total_filas
//	
	// Obtengo instalacion afectada
	ll_instalacion_afectada = dw_interrupcion_descargo.GetItemNumber(ll_nro_fila,"cod_instalacion")

	//---------------------------------------------------------//

	// Inserto clientes importantes----------------------------//
	fpr_insertar_sum_imp(ll_instalacion_afectada)
	//---------------------------------------------------------//

	// Proceso Registro
	uo_barra.f_amplia(ll_nro_fila/ll_total_filas*100)

Next

uo_barra.visible = FALSE
gb_marco.visible = FALSE

dw_sum_imp.SetReDraw(TRUE)

IF dw_sum_imp.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	close(this)	
END IF

SetPointer(Arrow!)
end event

type gb_marco from groupbox within w_7003_datos_descargo
int X=960
int Y=776
int Width=1166
int Height=204
boolean Visible=false
string Text="Generando consulta"
BorderStyle BorderStyle=StyleRaised!
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_ok from commandbutton within w_7003_datos_descargo
int X=1225
int Y=920
int Width=475
int Height=108
int TabOrder=10
boolean BringToTop=true
string Text="&Cerrar"
boolean Default=true
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close(w_7003_datos_descargo)
end event

type st_1 from statictext within w_7003_datos_descargo
int X=46
int Y=48
int Width=727
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada:"
Alignment Alignment=Right!
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

type st_2 from statictext within w_7003_datos_descargo
int X=521
int Y=160
int Width=251
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Inicio:"
Alignment Alignment=Right!
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

type st_3 from statictext within w_7003_datos_descargo
int X=1499
int Y=160
int Width=251
int Height=76
boolean Enabled=false
boolean BringToTop=true
string Text="Fin:"
Alignment Alignment=Right!
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

type st_nom_inst from statictext within w_7003_datos_descargo
int X=791
int Y=48
int Width=1609
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
string Text="Nombre Instalaci$$HEX1$$f300$$ENDHEX$$n Afectada"
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_st_f_ini from statictext within w_7003_datos_descargo
int X=791
int Y=160
int Width=622
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_st_f_fin from statictext within w_7003_datos_descargo
int X=1778
int Y=160
int Width=622
int Height=76
boolean Enabled=false
boolean BringToTop=true
boolean Border=true
BorderStyle BorderStyle=StyleLowered!
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=16777215
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type uo_barra from u_gen_barra within w_7003_datos_descargo
int X=987
int Y=836
boolean Visible=false
boolean BringToTop=true
long BackColor=79741120
end type

on uo_barra.destroy
call u_gen_barra::destroy
end on

type dw_interrupcion_descargo from datawindow within w_7003_datos_descargo
int X=402
int Y=936
int Width=494
int Height=360
int TabOrder=20
boolean Visible=false
boolean BringToTop=true
string DataObject="d_7003_interrupcion_descargo"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type dw_sum_imp from datawindow within w_7003_datos_descargo
int X=59
int Y=332
int Width=2802
int Height=484
string DataObject="d_lista_sum_imp_afect"
boolean Border=false
boolean HScrollBar=true
boolean VScrollBar=true
boolean LiveScroll=true
end type

type gb_clientes from groupbox within w_7003_datos_descargo
int X=37
int Y=264
int Width=2853
int Height=576
string Text="Clientes Importantes Afectados"
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=79741120
int TextSize=-10
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


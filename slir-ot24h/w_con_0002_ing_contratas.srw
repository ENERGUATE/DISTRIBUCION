HA$PBExportHeader$w_con_0002_ing_contratas.srw
forward
global type w_con_0002_ing_contratas from w_sgigenerica
end type
type tab_1 from tab within w_con_0002_ing_contratas
end type
type tabpage_contratas from userobject within tab_1
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within tabpage_contratas
end type
type dw_filtro from u_gen_0002_pr_generico within tabpage_contratas
end type
type gb_1 from groupbox within tabpage_contratas
end type
type dw_direccion from u_gen_0002_pr_generico within tabpage_contratas
end type
type dw_1 from u_gen_0002_pr_generico within tabpage_contratas
end type
type st_dir from statictext within tabpage_contratas
end type
type tabpage_contratas from userobject within tab_1
dw_ambito dw_ambito
dw_filtro dw_filtro
gb_1 gb_1
dw_direccion dw_direccion
dw_1 dw_1
st_dir st_dir
end type
type tabpage_calendario from userobject within tab_1
end type
type uo_cal from u_gener_calendario within tabpage_calendario
end type
type tabpage_calendario from userobject within tab_1
uo_cal uo_cal
end type
type tab_1 from tab within w_con_0002_ing_contratas
tabpage_contratas tabpage_contratas
tabpage_calendario tabpage_calendario
end type
type cb_aceptar from u_cb within w_con_0002_ing_contratas
end type
type cb_cancelar from u_cb within w_con_0002_ing_contratas
end type
end forward

global type w_con_0002_ing_contratas from w_sgigenerica
integer x = 9
integer y = 260
integer width = 3657
integer height = 2056
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
tab_1 tab_1
cb_aceptar cb_aceptar
cb_cancelar cb_cancelar
end type
global w_con_0002_ing_contratas w_con_0002_ing_contratas

type variables
u_generico_comunicaciones iu_comunic

long il_nro_contrata

con_obj_man_0000 iu_mant_contratas
con_obj_man_0000 iu_mant_contratas2//LOCAL
dir_obj_man_0000  io_dir


end variables

forward prototypes
public function integer fw_grabar_contrata ()
end prototypes

public function integer fw_grabar_contrata ();//Comprobar si hay algun campo sin datos
if tab_1.tabpage_contratas.dw_filtro.fpr_required(1,1) = -1 then RETURN FAILURE
if tab_1.tabpage_contratas.dw_1.fpr_required(1,1) = -1 then RETURN FAILURE
if tab_1.tabpage_contratas.dw_direccion.fpr_required(1,1) = -1 then RETURN FAILURE

if tab_1.tabpage_contratas.dw_ambito.object.nro_centro[1] = 0 or&
	tab_1.tabpage_contratas.dw_ambito.object.nro_cmd[1] = 0 or&
	tab_1.tabpage_contratas.dw_ambito.object.nro_mesa[1] = 0 then
		gnv_msg.f_mensaje( "EC05","","",OK!)	
		RETURN FAILURE
end if 

//Pasar los datos a datawindow dw_1
iu_mant_contratas2.datatransfer_in(tab_1.tabpage_contratas.dw_direccion,1)
iu_mant_contratas2.datatransfer_in(tab_1.tabpage_contratas.dw_ambito,1)
iu_mant_contratas2.datatransfer_in(tab_1.tabpage_contratas.dw_filtro,1)

//Comprobar si hay datos incorrectos segun la logica del objeto
if  iu_mant_contratas2.Event acceptvalues() = -1 then RETURN FAILURE
if  io_dir.int_dir.acceptvalues() = -1 then RETURN FAILURE

IF tab_1.tabpage_contratas.dw_1.Update(TRUE,TRUE) <> FAILURE THEN
	return SUCCESS
ELSE
	return FAILURE
END IF

end function

on w_con_0002_ing_contratas.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.cb_aceptar=create cb_aceptar
this.cb_cancelar=create cb_cancelar
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.cb_aceptar
this.Control[iCurrent+3]=this.cb_cancelar
end on

on w_con_0002_ing_contratas.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.cb_aceptar)
destroy(this.cb_cancelar)
end on

event open;call super::open;///////////////////////////////////////////////////////////////////////
//
//	Evento:	open
//
// permite actualizar una brigada determinada.
//
// gu_comunic.is_Comunic.intval1 = centro
//								 intval2 = cmd
//								 intval3 = puesto
//
//gu_comunic.is_comunic.accion_llamada = "Alta"
//													  "Modificacion"	
//													  "Consulta"
///////////////////////////////////////////////////////////////////////
datawindowchild ddw_int_horario
int li_cont
int li_hora
int li_cantidad

iu_mant_contratas2 	= Create con_obj_man_0000 
io_dir 					= Create dir_obj_man_0000
// creo objetos de trabajo
iu_comunic = create u_generico_comunicaciones // Creo variable de trabajo de comunicaciones propia

// recibo parametros de entrada
iu_comunic.is_comunic = gu_comunic.is_comunic

// Repetici$$HEX1$$f300$$ENDHEX$$n de Variables

parnum2 = iu_comunic.is_comunic.intval1					// Cod. Prov.
parnum3 = iu_comunic.is_comunic.intval2  				// Cod. Depto.
parnum4 = iu_comunic.is_comunic.longval4		// Cod. Munic.
parnum5 = iu_comunic.is_comunic.longval5

iu_mant_contratas = message.PowerObjectParm
w_con_0001_mant_contratas.io_flt.load(tab_1.tabpage_contratas.dw_filtro)
w_con_0001_mant_contratas.io_flt.load(tab_1.tabpage_contratas.dw_1)

tab_1.tabpage_contratas.dw_1.fpr_initadvances(TRUE)
tab_1.tabpage_contratas.dw_filtro.fpr_initadvances(TRUE)
tab_1.tabpage_contratas.dw_direccion.fpr_initadvances(TRUE)

tab_1.tabpage_contratas.dw_1.InsertRow(0)
tab_1.tabpage_contratas.dw_filtro.InsertRow(0)
tab_1.tabpage_contratas.dw_direccion.InsertRow(0)
// GNU 2-2-2006. Incidenias pruebas integrsadas Nicaragua
tab_1.tabpage_contratas.dw_filtro.Show()
// FIN GNU

iu_mant_contratas2.Event init(tab_1.tabpage_contratas.dw_1,1)
iu_mant_contratas2.Event attr()
io_dir.Event init(tab_1.tabpage_contratas.dw_direccion,1)

// Inicializo objetos de trabajo del calendario
tab_1.tabpage_calendario.uo_cal.dw_brig_con_calendario.SetTransObject(Sqlca)
tab_1.tabpage_calendario.uo_cal.dw_festivos.SetTransObject(Sqlca)

//Habilito el calendario
tab_1.tabpage_calendario.uo_cal.ole_calendar.enabled = TRUE

tab_1.tabpage_calendario.uo_cal.dw_b_turno.Insertrow(0)
tab_1.tabpage_calendario.uo_cal.dw_b_turno.GetChild('pi_turno', ddw_int_horario)
ddw_int_horario.SetTransObject(sqlca)
ddw_int_horario.Retrieve()
IF ddw_int_horario.RowCount() > 0 THEN
	tab_1.tabpage_calendario.uo_cal.dw_b_turno.Setitem(1,1,ddw_int_horario.GetItemString(1,1))
	tab_1.tabpage_calendario.uo_cal.dw_b_turno.accepttext()
END IF

tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.enabled = False
tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.enabled = False


CHOOSE CASE iu_mant_contratas.int_stt.GetState() 
	CASE 'E','C'		
		iu_mant_contratas.DataTransfer_out(tab_1.tabpage_contratas.dw_1,1);
		iu_mant_contratas.DataTransfer_out(tab_1.tabpage_contratas.dw_filtro,1);
		//iu_mant_contratas.DataTransfer_out(tab_1.tabpage_contratas.dw_ambito,1);		
		tab_1.tabpage_contratas.dw_ambito.fnu_insertar_datos(tab_1.tabpage_contratas.dw_1.GetItemNumber(1, 'nro_centro'), &
											 tab_1.tabpage_contratas.dw_1.GetItemNumber(1, 'nro_cmd'), &
											 tab_1.tabpage_contratas.dw_1.GetItemNumber(1, 'nro_mesa'), 0)
	
		tab_1.tabpage_contratas.dw_direccion.SetSqlSelect(tab_1.tabpage_contratas.dw_direccion.GetSqlSelect() + &
											' and ' + iu_mant_contratas.int_dir.key('callejero'))
		tab_1.tabpage_contratas.dw_direccion.Retrieve()
		iu_mant_contratas.DataTransfer_out(tab_1.tabpage_contratas.dw_direccion,1);		
		tab_1.tabpage_contratas.dw_1.SetItemStatus(1,0,Primary!,DataModified!)
		tab_1.tabpage_contratas.dw_1.SetItemStatus(1,0,Primary!,NotModified!)
		
		if iu_mant_contratas.int_stt.GetState() = 'E' then			
			This.Title = gu_comunic.f_titulo_ventana("w_con_0002","A")
			tab_1.tabpage_contratas.dw_direccion.Event ue_statechanged('ACTUALIZACION')
			cb_aceptar.enabled =	TRUE
			ib_disableclosequery = FALSE			
		else
			This.Title = gu_comunic.f_titulo_ventana("w_con_0002","C")
			tab_1.tabpage_contratas.dw_ambito.fnu_deshab_centro(tab_1.tabpage_contratas.dw_ambito)
			tab_1.tabpage_contratas.dw_ambito.fnu_deshab_cmd(tab_1.tabpage_contratas.dw_ambito)
			tab_1.tabpage_contratas.dw_ambito.fnu_deshab_puesto(tab_1.tabpage_contratas.dw_ambito)
			tab_1.tabpage_contratas.dw_direccion.Event ue_statechanged('CONSULTAR')
			tab_1.tabpage_contratas.dw_1.Event ue_statechanged('CONSULTAR')
			tab_1.tabpage_contratas.dw_filtro.Event ue_statechanged('CONSULTAR')			
			tab_1.tabpage_contratas.st_dir.Enabled = FALSE
			
			ib_disableclosequery = TRUE
			cb_aceptar.visible = false
			cb_cancelar.visible = false
			
			// se preparan los objetos del calendario para dejarlos en modo consulta
			tab_1.tabpage_calendario.uo_cal.enabled = True
			tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.enabled = false
			tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.visible = false
			tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.enabled = false
			tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.visible = false
			tab_1.tabpage_calendario.uo_cal.em_desde1.enabled = FALSE
			tab_1.tabpage_calendario.uo_cal.em_hasta1.enabled = FALSE
			tab_1.tabpage_calendario.uo_cal.em_desde2.enabled = FALSE
			tab_1.tabpage_calendario.uo_cal.em_hasta2.enabled = FALSE
			tab_1.tabpage_calendario.uo_cal.dw_b_turno.enabled = FALSE
			tab_1.tabpage_calendario.uo_cal.dw_b_turno.Object.pi_turno.background.color = gs_gris
			tab_1.tabpage_calendario.uo_cal.cbx_en_turno.enabled = FALSE
			tab_1.tabpage_calendario.uo_cal.cbx_festivos.enabled = FALSE
		end if
		
	CASE 'I'
		
		This.Title = gu_comunic.f_titulo_ventana("w_con_0002","I")
		tab_1.tabpage_contratas.dw_ambito.fnu_insertar_datos(gi_nro_centro, &
										 									  gi_nro_cmd, &
											 								  gi_nro_puesto, 0)
																				
		tab_1.tabpage_contratas.dw_ambito.fnu_filtro_mesa_sin_todos(tab_1.tabpage_contratas.dw_ambito, gi_nro_centro)
		tab_1.tabpage_contratas.dw_direccion.Event ue_statechanged('ACTUALIZACION')
		io_dir.Event Default()	
		iu_mant_contratas2.Event Default()
		ib_disableclosequery = FALSE	
		cb_aceptar.enabled =	TRUE
		//tab_1.tabpage_calendario.enabled = False	
END CHOOSE
tab_1.tabpage_calendario.uo_cal.il_nro_brig_con=tab_1.tabpage_contratas.dw_1.GetItemNumber(1,'nro_contrata')

tab_1.tabpage_calendario.uo_cal.TriggerEvent("ue_cambio_mes")
//CHOOSE CASE iu_comunic.is_comunic.accion_llamada
//	CASE "Alta"
//			
//		li_hora = Hour(Now( ))
//		cb_aceptar.enabled = false
//		iu_comunic.is_comunic.accion_retorno = "Refrescar"
//		// No se habilita el calendario por ser alta
//		tab_1.tabpage_calendario.uo_cal.enabled = False		
//		
//	CASE "Modificacion"
//			
//		tab_1.tabpage_calendario.uo_cal.enabled = True
//	
//CASE "Consulta"
//		cb_aceptar.enabled = false
//		cb_aceptar.visible = false
//		cb_cancelar.visible = false
//		tab_1.tabpage_calendario.uo_cal.enabled = True
//		tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.enabled = false
//		tab_1.tabpage_calendario.uo_cal.cb_grabar_calendario.visible = false
//		tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.enabled = false
//		tab_1.tabpage_calendario.uo_cal.cb_limpiar_calendario.visible = false
//		tab_1.tabpage_calendario.uo_cal.em_desde1.enabled = FALSE
//		tab_1.tabpage_calendario.uo_cal.em_hasta1.enabled = FALSE
//		tab_1.tabpage_calendario.uo_cal.em_desde2.enabled = FALSE
//		tab_1.tabpage_calendario.uo_cal.em_hasta2.enabled = FALSE
//		tab_1.tabpage_calendario.uo_cal.dw_b_turno.enabled = FALSE
//		tab_1.tabpage_calendario.uo_cal.dw_b_turno.Object.pi_turno.background.color = gs_gris
//		tab_1.tabpage_calendario.uo_cal.cbx_en_turno.enabled = FALSE
//		tab_1.tabpage_calendario.uo_cal.cbx_festivos.enabled = FALSE
//END CHOOSE


end event

event close;call super::close;//IF tab_1.tabpage_calendario.uo_cal.ib_hay_cambios THEN
//	//$$HEX1$$bf00$$ENDHEX$$Desea guardar los cambios efectuados?
//	IF gnv_msg.f_mensaje("CG01","","",YESNO!)=1 THEN
//		tab_1.tabpage_calendario.uo_cal.triggerevent("ue_grabar")
//	END IF
//	tab_1.tabpage_calendario.uo_cal.ib_hay_cambios = FALSE
//END IF
gnu_u_transaction.uf_rollback()
gu_comunic.is_comunic = iu_comunic.is_comunic

DESTROY iu_comunic

end event

event ue_arch_grabar;call super::ue_arch_grabar;////Comprobar si hay algun campo sin datos
//if tab_1.tabpage_contratas.dw_filtro.fpr_required(1,1) = -1 then RETURN FAILURE
//if tab_1.tabpage_contratas.dw_1.fpr_required(1,1) = -1 then RETURN FAILURE
//if tab_1.tabpage_contratas.dw_direccion.fpr_required(1,1) = -1 then RETURN FAILURE
//
//if tab_1.tabpage_contratas.dw_ambito.object.nro_centro[1] = 0 or&
//	tab_1.tabpage_contratas.dw_ambito.object.nro_cmd[1] = 0 or&
//	tab_1.tabpage_contratas.dw_ambito.object.nro_mesa[1] = 0 then
//		gnv_msg.f_mensaje( "EC05","","",OK!)	
//		RETURN FAILURE
//end if 
//
////Pasar los datos a datawindow dw_1
//iu_mant_contratas2.datatransfer_in(tab_1.tabpage_contratas.dw_direccion,1)
//iu_mant_contratas2.datatransfer_in(tab_1.tabpage_contratas.dw_ambito,1)
//iu_mant_contratas2.datatransfer_in(tab_1.tabpage_contratas.dw_filtro,1)
//
////Comprobar si hay datos incorrectos segun la logica del objeto
//if  iu_mant_contratas2.Event acceptvalues() = -1 then RETURN FAILURE
//if  io_dir.int_dir.acceptvalues() = -1 then RETURN FAILURE
//
//IF tab_1.tabpage_contratas.dw_1.Update(TRUE,TRUE) <> FAILURE THEN
IF fw_grabar_contrata() = SUCCESS THEN
	tab_1.tabpage_calendario.uo_cal.TriggerEvent("ue_grabar")
	gnu_u_transaction.uf_commit()
	//Pasar los datos al objeto de la ventana padre
	iu_mant_contratas.DataTransfer_in(tab_1.tabpage_contratas.dw_1,1);	
	iu_mant_contratas.int_stt.SetState('N')	
	RETURN SUCCESS
ELSE
	gnu_u_transaction.uf_rollback()
	RETURN FAILURE
END IF


end event

event closequery;//
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_con_0002_ing_contratas
end type

type tab_1 from tab within w_con_0002_ing_contratas
integer x = 41
integer y = 48
integer width = 3515
integer height = 1696
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long backcolor = 79741120
boolean boldselectedtext = true
integer selectedtab = 1
tabpage_contratas tabpage_contratas
tabpage_calendario tabpage_calendario
end type

on tab_1.create
this.tabpage_contratas=create tabpage_contratas
this.tabpage_calendario=create tabpage_calendario
this.Control[]={this.tabpage_contratas,&
this.tabpage_calendario}
end on

on tab_1.destroy
destroy(this.tabpage_contratas)
destroy(this.tabpage_calendario)
end on

event selectionchanging;// Si estamos dando de alta grabamos los datos de la nueva contrata antes de cambiar al
// tabpage del calendario. Se hace esto debido a que la tabla que almacena los horarios de 
// las contratas tiene como foreign key el nro de contrata, por lo que $$HEX1$$e900$$ENDHEX$$ste tiene que existir
// en la tabla gi_contratas para poder dar de alta d$$HEX1$$ed00$$ENDHEX$$as en el calendario.
IF iu_mant_contratas.int_stt.GetState() = 'I' AND newindex = 2 THEN
	IF fw_grabar_contrata() = FAILURE THEN
		return 1
	END IF
END IF
	
	
end event

type tabpage_contratas from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3479
integer height = 1568
long backcolor = 79741120
string text = "       Contratas"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Brigada4.bmp"
long picturemaskcolor = 553648127
dw_ambito dw_ambito
dw_filtro dw_filtro
gb_1 gb_1
dw_direccion dw_direccion
dw_1 dw_1
st_dir st_dir
end type

on tabpage_contratas.create
this.dw_ambito=create dw_ambito
this.dw_filtro=create dw_filtro
this.gb_1=create gb_1
this.dw_direccion=create dw_direccion
this.dw_1=create dw_1
this.st_dir=create st_dir
this.Control[]={this.dw_ambito,&
this.dw_filtro,&
this.gb_1,&
this.dw_direccion,&
this.dw_1,&
this.st_dir}
end on

on tabpage_contratas.destroy
destroy(this.dw_ambito)
destroy(this.dw_filtro)
destroy(this.gb_1)
destroy(this.dw_direccion)
destroy(this.dw_1)
destroy(this.st_dir)
end on

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within tabpage_contratas
integer x = 512
integer y = 68
integer taborder = 10
boolean bringtotop = true
boolean border = false
end type

event constructor;call super::constructor;this.fpr_crea_dddw()
this.insertrow(0)   


end event

type dw_filtro from u_gen_0002_pr_generico within tabpage_contratas
integer x = 1669
integer y = 152
integer width = 1134
integer height = 280
integer taborder = 11
boolean bringtotop = true
string dataobject = "d_con_0002_filtro_contratas"
boolean border = false
borderstyle borderstyle = stylebox!
end type

event ue_soltar_clicked;//
end event

event editchanged;call super::editchanged;
// En este evento se controla que el usuario no introduzca como primer caracter del
// Nis, el signo negativo.   (LFE)
string ls_coste

if dwo.name ="coste"   then 
ls_coste = this.GetText()
if mid(ls_coste,1,1) = "-" then
	this.SetText(mid(ls_coste,2))
end if
end if

end event

type gb_1 from groupbox within tabpage_contratas
integer x = 1655
integer y = 72
integer width = 1166
integer height = 376
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Seleci$$HEX1$$f300$$ENDHEX$$n"
end type

type dw_direccion from u_gen_0002_pr_generico within tabpage_contratas
event type integer ue_direccion ( string nom_calle )
event ue_enter pbm_dwnkey
integer x = 517
integer y = 492
integer width = 2304
integer height = 468
integer taborder = 11
string dataobject = "d_direccion2"
borderstyle borderstyle = styleraised!
end type

event ue_direccion;dw_direccion.AcceptText()
parmstr6 = ''
gu_comunic.is_comunic.strval10 = "Calle"
gu_comunic.is_comunic.programa_llamante = "w_man_instalacion"
io_dir.int_dir.Find('')	
SetFocus(this)
return 0
end event

event ue_enter;IF KeyDown(KeyEnter!) THEN dw_direccion.Event ue_direccion('')
end event

event getfocus;call super::getfocus;cb_aceptar.Default = FALSE
end event

event losefocus;call super::losefocus;cb_aceptar.Default = TRUE
end event

type dw_1 from u_gen_0002_pr_generico within tabpage_contratas
integer x = 517
integer y = 960
integer width = 2304
integer height = 448
integer taborder = 11
string dataobject = "d_con_0001_ing_contratas"
borderstyle borderstyle = styleraised!
end type

type st_dir from statictext within tabpage_contratas
integer x = 530
integer y = 832
integer width = 320
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean italic = true
boolean underline = true
string pointer = "MANOOK.CUR"
long textcolor = 128
long backcolor = 81324524
string text = "Direcci$$HEX1$$f300$$ENDHEX$$n:"
boolean focusrectangle = false
end type

event doubleclicked;//// Seteo el mouse con formato de reloj de arena
SetPointer(HourGlass!)


gu_comunic.is_comunic.strval10 = "Nif"
gu_comunic.is_comunic.intval1 = gi_cod_provincia
gu_comunic.is_comunic.intval2 = gi_cod_departamento
gu_comunic.is_comunic.longval4 = gl_cod_municipio
gu_comunic.is_comunic.longval5 = gl_cod_localidad
gu_comunic.is_comunic.strval1 = gs_provincia
gu_comunic.is_comunic.strval2 = gs_departamento
gu_comunic.is_comunic.strval3 = gs_municipio
gu_comunic.is_comunic.strval4 = gs_localidad

parnum4 = gl_cod_municipio
parnum5 = gl_cod_localidad
parnum2 = gi_cod_provincia
parnum3 = gi_cod_departamento

//gu_comunic.is_comunic.longval4 = parnum4
//gu_comunic.is_comunic.longval5 = parnum5
//gu_comunic.is_comunic.intval1	 =	parnum2 
//gu_comunic.is_comunic.intval2  = parnum3	
//
tab_1.tabpage_contratas.dw_direccion.Event ue_direccion('')
end event

type tabpage_calendario from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3479
integer height = 1568
long backcolor = 79741120
string text = "     Calendario"
long tabtextcolor = 33554432
long tabbackcolor = 79741120
string picturename = "Cursor!"
long picturemaskcolor = 553648127
uo_cal uo_cal
end type

on tabpage_calendario.create
this.uo_cal=create uo_cal
this.Control[]={this.uo_cal}
end on

on tabpage_calendario.destroy
destroy(this.uo_cal)
end on

type uo_cal from u_gener_calendario within tabpage_calendario
event destroy ( )
integer x = 82
integer y = 16
integer taborder = 10
boolean border = false
long backcolor = 79741120
end type

on uo_cal.destroy
call u_gener_calendario::destroy
end on

type cb_aceptar from u_cb within w_con_0002_ing_contratas
integer x = 901
integer y = 1800
integer width = 361
integer height = 96
integer taborder = 20
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "Aceptar"
boolean default = true
end type

event clicked;call super::clicked;ib_disableclosequery = TRUE

IF w_con_0002_ing_contratas.Event ue_arch_grabar(0,0) <> FAILURE THEN
	Close(w_con_0002_ing_contratas) 
	RETURN
END IF
ib_disableclosequery = FALSE

end event

type cb_cancelar from u_cb within w_con_0002_ing_contratas
integer x = 2075
integer y = 1800
integer width = 361
integer height = 96
integer taborder = 30
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "Cancelar"
boolean cancel = true
end type

event clicked;call super::clicked;ib_disableclosequery = TRUE
tab_1.tabpage_calendario.uo_cal.ib_hay_cambios = FALSE

gnu_u_transaction.uf_rollback()
Close (w_con_0002_ing_contratas)
end event


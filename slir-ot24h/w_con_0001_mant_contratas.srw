HA$PBExportHeader$w_con_0001_mant_contratas.srw
forward
global type w_con_0001_mant_contratas from w_sgigenerica
end type
type dw_1 from u_gen_0002_pr_generico within w_con_0001_mant_contratas
end type
type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_con_0001_mant_contratas
end type
type cb_historico from u_cb within w_con_0001_mant_contratas
end type
type cb_tareas from u_cb within w_con_0001_mant_contratas
end type
type cb_agregar from u_cb within w_con_0001_mant_contratas
end type
type cb_eliminar from u_cb within w_con_0001_mant_contratas
end type
type cb_incid from u_cb within w_con_0001_mant_contratas
end type
type cb_buscar from u_cb within w_con_0001_mant_contratas
end type
type gb_1 from groupbox within w_con_0001_mant_contratas
end type
type dw_filtro_contrata from u_con_0001_pr_filtro_contratas within w_con_0001_mant_contratas
end type
type dw_2 from datawindow within w_con_0001_mant_contratas
end type
type cb_1 from commandbutton within w_con_0001_mant_contratas
end type
end forward

global type w_con_0001_mant_contratas from w_sgigenerica
integer width = 3694
integer height = 1912
string title = "OPEN SGI - Gesti$$HEX1$$f300$$ENDHEX$$n de Contratas"
string icon = "contrata.ico"
event ue_armar_sql ( )
dw_1 dw_1
dw_ambito dw_ambito
cb_historico cb_historico
cb_tareas cb_tareas
cb_agregar cb_agregar
cb_eliminar cb_eliminar
cb_incid cb_incid
cb_buscar cb_buscar
gb_1 gb_1
dw_filtro_contrata dw_filtro_contrata
dw_2 dw_2
cb_1 cb_1
end type
global w_con_0001_mant_contratas w_con_0001_mant_contratas

type variables
con_obj_man_0000  iu_mant_contratas
u_gen_0000_nu_filtro io_flt
string sql_original


end variables

forward prototypes
public subroutine wf_rowfocuschanged (long currentrow)
end prototypes

event ue_armar_sql();string ls_filter, ls_filtro_cont, ls_filtro_turno, ls_where
int li_tipo, li_estado 
Datetime ldt_fecha_turno
DataWindowChild dw_datos
long ll_longitud
datetime ldt_desde, ldt_hasta
string ls_columna, ls_visible, ls_wid, ls_titulo

ls_where = ' ' 
li_tipo = dw_filtro_contrata.GetitemNumber(1,'pi_tipo')
li_estado = dw_filtro_contrata.GetitemNumber(1,'pi_estado')

// Se construye la where de la select a partir de la informaci$$HEX1$$f300$$ENDHEX$$n de los filtros

// Se pide la informaci$$HEX1$$f300$$ENDHEX$$n del filtro de $$HEX1$$e100$$ENDHEX$$mbito
ls_filter =  io_flt.GetAmbito(dw_ambito,'','')
IF ls_filter <> '' THEN
	ls_where = " AND " + ls_filter
END IF

// Se comprueba el tipo de contrata
IF li_tipo <> 0 THEN
	ls_filtro_cont = " tipo = " + string(li_tipo) + " "
ELSE 
	ls_filtro_cont = ' '
END IF
	
// Se comprueba el estado de la contrata

IF li_estado <> 0 THEN
	IF ls_filtro_cont <> ' ' THEN
		ls_filtro_cont = ls_filtro_cont + " AND "
	END IF
	ls_filtro_cont = ls_filtro_cont + " estado = " + string(li_estado) + " "
END IF

IF ls_where <> ' ' AND ls_filtro_cont <> ' ' THEN
	ls_where = ls_where + " AND " + ls_filtro_cont
ELSE
	IF ls_filtro_cont <> ' ' THEN
		ls_where = " AND " + ls_filtro_cont
	END IF
END IF
	
// se comprueba ahora si est$$HEX2$$e1002000$$ENDHEX$$seleccionado el checkbox 'En turno'. En caso de ser as$$HEX2$$ed002000$$ENDHEX$$habr$$HEX1$$e100$$ENDHEX$$
// que traer las contratas en turno
if (dw_filtro_contrata.getitemnumber(1,"pi_en_turno") = 1) THEN

	ldt_fecha_turno = dw_filtro_contrata.GetItemDateTime(1, 'pdt_fecha_turno')

	ls_filtro_turno = "gi_contratas.nro_contrata IN (SELECT DISTINCT gi_contratas_cal.nro_contrata " + &
							"FROM GI_CONTRATAS_CAL WHERE gi_contratas_cal.fecha_inicio <= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
							"AND gi_contratas_cal.fecha_fin >= TO_DATE('" + String(Date(ldt_fecha_turno)) + "', 'DD/MM/YYYY') " + &
							"AND TO_CHAR(gi_contratas_cal.hora_desde,'HH24:MI:SS') <= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI') " + &
							"AND TO_CHAR(gi_contratas_cal.hora_hasta,'HH24:MI:SS') >= TO_CHAR(TO_DATE('" + String(ldt_fecha_turno) + "', 'DD/MM/YYYY HH24:MI:SS'), 'HH24:MI')) "

	IF ls_where <> ' ' THEN
		ls_where = ls_where + " AND " + ls_filtro_turno
	ELSE
		ls_where = " AND " + ls_filtro_turno
	END IF
end if

dw_1.SetSqlSelect (sql_original + ls_where )


if dw_1.Retrieve() > 0 then 	
	wf_rowfocuschanged(1)
// DSA 28/03/2000	iu_mant_contratas.Event Init(dw_1,1)
else
	gnv_msg.f_mensaje("IT01","","",OK!) 
	wf_rowfocuschanged(0)
end if
IF dw_1.RowCount() <> 0 THEN
		dw_2.modify("data_1.DataObject ='" + dw_1.DataObject + "'")
		//Vuelco los datos en el datawindow del que hago la presentaci$$HEX1$$f300$$ENDHEX$$n preliminar
//		dw_2.GetChild ("data_1",dw_datos)
		
		//Inserto el titulo y calculo su tama$$HEX1$$f100$$ENDHEX$$o
		ls_titulo = 'Listado de Contratas'
		ll_longitud = len (ls_titulo)*100
		
		dw_2.modify("nulo_desde.visible = '0")
		dw_2.modify("f_desde.visible='0'")
		dw_2.modify("desde.Visible='0'")
		dw_2.modify("nulo_hasta.visible = '0'")
		dw_2.modify("f_hasta.visible='0'")
		dw_2.modify("hasta.Visible='0'")
		
		// si no son nulas las inserto
		dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
		dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")
		dw_2.modify("f_desde.text = '" + string(ldt_desde) + "'")
		dw_2.modify("f_hasta.text = '" + string(ldt_hasta) + "'")
		
		dw_1.ShareData(dw_datos)
		
	END IF
	
	cb_agregar.enabled = (gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1)
	cb_eliminar.enabled=false
	cb_incid.enabled =false
	cb_historico.enabled=false
	cb_tareas.enabled=false
	
end event

public subroutine wf_rowfocuschanged (long currentrow);//
//
//if  currentrow > 0 then 
//	iu_mant_contratas.SetRow(currentrow)
//	dw_1.SelectRow(0,FALSE)	
//	dw_1.SelectRow(currentrow,TRUE)	
//
//	if gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 and &
//		gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_CONSULTA') =1 THEN
//		cb_agregar.enabled=true	
//		cb_agregar.enabled=true
//		cb_eliminar.enabled=true
//		cb_historico.enabled=true
//	elseif gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 then
//		cb_agregar.Enabled = true
//		cb_historico.enabled=false
//		cb_incid.enabled =false
//	else
//		cb_agregar.enabled=false
//		cb_eliminar.enabled=false
//		
//	end if
//
////	if gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 THEN	
////		cb_eliminar.enabled = TRUE
////	end if
////	cb_historico.enabled = TRUE
////	if gu_perfiles.of_acceso_perfil(gi_perfil,'INC_GENERAL','ACC_CONSULTA') = 1 THEN	
////		cb_incid.enabled = TRUE
////	end if		
//	cb_tareas.enabled = TRUE
//
//else
//	cb_eliminar.enabled = FALSE
//	cb_historico.enabled = FALSE
//	cb_incid.enabled = FALSE
//	cb_tareas.enabled = FALSE
//end if
//
end subroutine

on w_con_0001_mant_contratas.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.dw_ambito=create dw_ambito
this.cb_historico=create cb_historico
this.cb_tareas=create cb_tareas
this.cb_agregar=create cb_agregar
this.cb_eliminar=create cb_eliminar
this.cb_incid=create cb_incid
this.cb_buscar=create cb_buscar
this.gb_1=create gb_1
this.dw_filtro_contrata=create dw_filtro_contrata
this.dw_2=create dw_2
this.cb_1=create cb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.dw_ambito
this.Control[iCurrent+3]=this.cb_historico
this.Control[iCurrent+4]=this.cb_tareas
this.Control[iCurrent+5]=this.cb_agregar
this.Control[iCurrent+6]=this.cb_eliminar
this.Control[iCurrent+7]=this.cb_incid
this.Control[iCurrent+8]=this.cb_buscar
this.Control[iCurrent+9]=this.gb_1
this.Control[iCurrent+10]=this.dw_filtro_contrata
this.Control[iCurrent+11]=this.dw_2
this.Control[iCurrent+12]=this.cb_1
end on

on w_con_0001_mant_contratas.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.dw_ambito)
destroy(this.cb_historico)
destroy(this.cb_tareas)
destroy(this.cb_agregar)
destroy(this.cb_eliminar)
destroy(this.cb_incid)
destroy(this.cb_buscar)
destroy(this.gb_1)
destroy(this.dw_filtro_contrata)
destroy(this.dw_2)
destroy(this.cb_1)
end on

event open;call super::open;iu_mant_contratas  =  Create con_obj_man_0000
io_flt	= Create	u_gen_0000_nu_filtro

This.Title = gu_comunic.f_titulo_ventana("w_con_0001","")

io_flt.load(dw_1)

iu_mant_contratas.Event Init(dw_1,1)// DSA 28/03/2000	
sql_original = dw_1.GetSqlSelect()

dw_filtro_contrata.fpr_crear_dw()
dw_filtro_contrata.fpr_deshabilitar_fechas()

dw_ambito.settransobject(sqlca) // Conexi$$HEX1$$f300$$ENDHEX$$n a la base
dw_ambito.fnu_cargo_drop()
dw_ambito.insertrow(0)
dw_ambito.fnu_insertar_datos(gi_nro_centro, gi_nro_cmd, gi_nro_puesto, 0)

dw_filtro_contrata.AcceptText()
TriggerEvent('ue_armar_sql')


end event

event ue_opcion2;call super::ue_opcion2;long row, currentrow

currentrow 	= dw_1.GetRow()
row 			= dw_1.insertrow(0)
iu_mant_contratas.SetRow(row)
iu_mant_contratas.int_stt.SetState('I')
iu_mant_contratas.Event edit()
if iu_mant_contratas.int_stt.GetState() <> 'N' then
	dw_1.DeleteRow(row)
	iu_mant_contratas.SetRow(currentrow )	
else
	dw_1.SetItemStatus(row,0,Primary!,NotModified!)
	dw_1.SetRow(row)
	dw_1.ScrollToRow(row)
end if

end event

event ue_opcion3;call super::ue_opcion3;long nro_contrata, cantidad_con = 1, retcode;

if gnv_msg.f_mensaje("CG02","","",YESNO!) <> 1  then
			return
end if

retcode = gnu_u_transaction.uf_lock(This, "GI_CONTRATAS", &
												iu_mant_contratas.key('GI_CONTRATAS')) 
												
if retcode <> 0 then
	if retcode = 100 then gnv_msg.f_mensaje("AG06","la Contrata","",OK!) 		
	return
end if

nro_contrata = dw_1.object.nro_contrata[dw_1.GetRow()]  

SELECT count(*) INTO :cantidad_con 
FROM 	gi_contrata_ot 
WHERE nro_contrata = :nro_contrata;

if cantidad_con > 0 then
	gnv_msg.f_mensaje("EC06","","",OK!) 
	gnu_u_transaction.uf_rollback(This)
	return
end if

DELETE FROM gi_contratas 
WHERE NRO_CONTRATA = :nro_contrata;

if sqlca.sqlcode <> 0 then
	gnu_u_transaction.uf_rollback(This)
else
	gnu_u_transaction.uf_commit(This)
end if

dw_1.retrieve()

if dw_1.rowcount()=0 then 
	cb_eliminar.enabled=false
	cb_incid.enabled =false
	cb_historico.enabled=false
	cb_tareas.enabled=false
end if
end event

event ue_arch_imprimir;call super::ue_arch_imprimir;IF dw_1.RowCount() = 0 THEN
	messagebox("Atencion","No se han recuperado datos")
	return
END IF

dw_2.SetTransObject(SQLCA)
s_impresion_preliminar lst_Impresion
lst_impresion.pdw_datawindow = dw_2
lst_impresion.pdw_lista = dw_1

gf_impresion_preliminar (lst_impresion, True, 0)
end event

type st_bloqueo from w_sgigenerica`st_bloqueo within w_con_0001_mant_contratas
end type

type dw_1 from u_gen_0002_pr_generico within w_con_0001_mant_contratas
integer x = 219
integer y = 480
integer width = 3109
integer height = 1152
integer taborder = 10
boolean bringtotop = true
string dataobject = "d_con_0001_pr_mant_contratas"
boolean vscrollbar = true
borderstyle borderstyle = styleraised!
end type

event doubleclicked;call super::doubleclicked;if row>0 then
	iu_mant_contratas.SetRow(row)
	
	
	iu_mant_contratas.int_stt.SetState('C')

	if gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
		if gnu_u_transaction.uf_lock(This, "GI_CONTRATAS", &
												iu_mant_contratas.key('GI_CONTRATAS')) = 0 then
			gu_comunic.is_comunic.accion_llamada = 'Modificacion'
			iu_mant_contratas.int_stt.SetState('E')
		else
			gu_comunic.is_comunic.accion_llamada = 'Consulta'
		end if			
	else
		gu_comunic.is_comunic.accion_llamada = 'Consulta'
	end if
	
	iu_mant_contratas.EVENT edit()
	gnu_u_transaction.uf_rollback(THIS)
	dw_1.SetItemStatus(row,0,Primary!,NotModified!)	
	
	dw_1.setredraw(false)
	Parent.TriggerEvent('ue_armar_sql')
	dw_1.setredraw(true)

end if
end event

event rowfocuschanged;call super::rowfocuschanged;wf_rowfocuschanged(currentrow)
end event

event ue_key_down;call super::ue_key_down;///////////////////////////////////////////////////////
////	Permite borrar o agregar incidencias desde el teclado
////	dependiendo de si el usuario presiono delete o insert
////
////
////////////////////////////////////////////////////////
//long ll_row 
//
//setpointer(Hourglass!)
//IF keyflags = 0 THEN  // Controlo que no haya presionado
//							// control ni shift
//
//	ll_row = This.Getselectedrow(0)
//	
//	IF key = KeyDelete! THEN
//		Parent.TriggerEvent("ue_opcion3")
//	ELSEIF key = KeyInsert! THEN
//		Parent.TriggerEvent("ue_opcion2")
//
//	end if
//end if
end event

event clicked;call super::clicked;IF row > 0 THEN
//	ii_fila_seleccionada = row
	this.ScrollToRow(ROW)
	this.selectrow(0,False)
	this.selectrow(ROW,true)
	
	if gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 and &
		gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_CONSULTA') =1 THEN//DSA 01/03/2000 
		cb_agregar.enabled=true	
		cb_eliminar.enabled=true
		cb_historico.enabled=true
		cb_incid.enabled =true	
		
	elseif gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 then
		cb_agregar.Enabled = true
		cb_eliminar.enabled=true
		cb_historico.enabled=false
		cb_incid.enabled =false
	else
		cb_agregar.enabled=false
		cb_eliminar.enabled=false
		cb_incid.enabled =true
		cb_historico.enabled=true
	end if
	cb_tareas.enabled=true

else
	
	//cb_agregar.enabled=false
	cb_eliminar.enabled=false
	cb_incid.enabled =false
	cb_historico.enabled=false
	cb_tareas.enabled=false
	
end if
end event

type dw_ambito from u_cen_2001_pr_form_centro_cmd_mesa within w_con_0001_mant_contratas
integer x = 251
integer y = 56
integer taborder = 20
boolean bringtotop = true
boolean border = false
end type

event constructor;call super::constructor;//this.fpr_crea_dddw()
//this.insertrow(0)   
//this.setitem(1,"nro_centro",gi_nro_centro)
//this.setitem(1,"nro_cmd",gi_nro_cmd)
//this.setitem(1,"nro_mesa",gi_nro_puesto)
//this.accepttext()
//
//
end event

type cb_historico from u_cb within w_con_0001_mant_contratas
integer x = 1134
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 70
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Hist$$HEX1$$f300$$ENDHEX$$rico"
end type

event clicked;call super::clicked;long row
row = dw_1.GetRow()
gu_comunic.is_comunic.longval1	=	dw_1.object.nro_contrata[row]
gu_comunic.is_comunic.strval1		=	dw_1.object.nombre[row]
gu_comunic.is_comunic.strval2		=	'CO'
if gnu_u_transaction.uf_lock(This, "GI_CONTRATAS",&
									iu_mant_contratas.key('GI_CONTRATAS')) <> 0 then
			return
		end if
open(w_6207_historico_brigada)
gnu_u_transaction.uf_commit(This)
end event

type cb_tareas from u_cb within w_con_0001_mant_contratas
integer x = 1582
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 80
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Tareas/OT"
end type

event clicked;call super::clicked;long row, ll_num
	
row = dw_1.GetRow()
gu_comunic.is_comunic.programa_llamante='w_con_0001'
gu_comunic.is_comunic.intval1 = gi_nro_centro
gu_comunic.is_comunic.intval2 = gi_nro_cmd
gu_comunic.is_comunic.intval3 = gi_nro_puesto
gu_comunic.is_comunic.longval1 = dw_1.object.nro_contrata[row]
gu_comunic.is_comunic.strval1 = dw_1.object.nombre[row]
gu_comunic.is_comunic.strval2 = 'CO'

if gu_perfiles.of_acceso_perfil(gi_perfil,'CON_MANT','ACC_MANTEN') =1 THEN	//DSA 01/03/2000 
	gu_comunic.is_comunic.ACCION_LLAMADA = "Modificacion"
else
	gu_comunic.is_comunic.ACCION_LLAMADA = "CONSULTA"
end if

IF gu_comunic.is_comunic.accion_llamada = "Modificacion" THEN

	SELECT COUNT(*)
	INTO :ll_num
	FROM GI_OT, GI_CONTRATA_OT
	WHERE GI_OT.NRO_OT = GI_CONTRATA_OT.NRO_OT
		AND GI_CONTRATA_OT.NRO_CONTRATA = :gu_comunic.is_comunic.longval1 
		AND GI_OT.EST_OT <= :fgci_ot_trabajando;
		
		
	IF ll_num = 0 THEN	
		IF Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Esta Contrata no tiene ninguna tarea asignada. $$HEX1$$bf00$$ENDHEX$$Desea asignarle una?", Exclamation!, YesNo!) = 2 THEN
//		IF gnv_msg.f_mensaje( "AM53","","",YesNo!) = 2 THEN
			return
		END IF
	END IF
	
END IF
	
	if gnu_u_transaction.uf_lock(This, "GI_CONTRATAS", &
									iu_mant_contratas.key('GI_CONTRATAS')) <> 0 then
		return
	end if
	open(w_6205_consulta_tareas)
	gnu_u_transaction.uf_commit(This)

end event

type cb_agregar from u_cb within w_con_0001_mant_contratas
integer x = 238
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 50
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Agregar"
end type

event clicked;call super::clicked;dw_1.setredraw(false)
Parent.TriggerEvent('ue_opcion2')
dw_filtro_contrata.AcceptText()
Parent.TriggerEvent('ue_armar_sql')
dw_1.setredraw(true)
end event

type cb_eliminar from u_cb within w_con_0001_mant_contratas
integer x = 686
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 60
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Eliminar"
end type

event clicked;call super::clicked;Parent.TriggerEvent('ue_opcion3')
end event

type cb_incid from u_cb within w_con_0001_mant_contratas
integer x = 2030
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 90
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Incidencias"
end type

event clicked;call super::clicked;iu_mant_contratas.Incidencia()
	
	
end event

type cb_buscar from u_cb within w_con_0001_mant_contratas
integer x = 2478
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 100
boolean bringtotop = true
fontcharset fontcharset = ansi!
string facename = "MS Sans Serif"
string text = "&Buscar"
end type

event clicked;call super::clicked;dw_filtro_contrata.AcceptText()
Parent.TriggerEvent('ue_armar_sql')
end event

type gb_1 from groupbox within w_con_0001_mant_contratas
integer x = 2176
integer y = 32
integer width = 1115
integer height = 400
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Seleccionar"
end type

type dw_filtro_contrata from u_con_0001_pr_filtro_contratas within w_con_0001_mant_contratas
integer x = 2235
integer y = 96
integer width = 1038
integer height = 324
integer taborder = 30
boolean bringtotop = true
boolean border = false
borderstyle borderstyle = stylebox!
end type

event itemchanged;call super::itemchanged;long ll_en_turno

// si el campo modificado es el de las brigadas en turno, entonces se conmuta el valor a mano
// para que el cambio tenga efecto antes de entrar en ue_resetear_datos, ya que de no ser a s$$HEX1$$ed00$$ENDHEX$$, el 
// cambio no tiene efecto hasta que no se sale de este script
IF this.GetColumnName()="pi_en_turno" THEN 
	ll_en_turno = getItemNumber(1, "pi_en_turno")
	IF ll_en_turno = 0 THEN
		SetItem(1, "pi_en_turno",1)
		This.fpr_habilitar_fechas()
	ELSE
		SetItem(1, "pi_en_turno",0)
		This.fpr_deshabilitar_fechas()
	END IF
END IF

end event

event losefocus;call super::losefocus;This.AcceptText()
end event

type dw_2 from datawindow within w_con_0001_mant_contratas
boolean visible = false
integer x = 256
integer y = 768
integer width = 494
integer height = 360
integer taborder = 40
boolean bringtotop = true
string dataobject = "d_impresion"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_1 from commandbutton within w_con_0001_mant_contratas
integer x = 2926
integer y = 1676
integer width = 384
integer height = 96
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "I&mprimir"
end type

event clicked;parent.triggerevent("ue_arch_imprimir")
end event


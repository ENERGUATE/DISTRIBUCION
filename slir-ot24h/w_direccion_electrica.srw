HA$PBExportHeader$w_direccion_electrica.srw
forward
global type w_direccion_electrica from window
end type
type cb_imprimir from commandbutton within w_direccion_electrica
end type
type dw_2 from datawindow within w_direccion_electrica
end type
type dw_1 from datawindow within w_direccion_electrica
end type
type cb_anular from commandbutton within w_direccion_electrica
end type
end forward

global type w_direccion_electrica from window
integer width = 2875
integer height = 764
boolean titlebar = true
string title = "Direcci$$HEX1$$f300$$ENDHEX$$n el$$HEX1$$e900$$ENDHEX$$ctrica de conexiones"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_imprimir cb_imprimir
dw_2 dw_2
dw_1 dw_1
cb_anular cb_anular
end type
global w_direccion_electrica w_direccion_electrica

on w_direccion_electrica.create
this.cb_imprimir=create cb_imprimir
this.dw_2=create dw_2
this.dw_1=create dw_1
this.cb_anular=create cb_anular
this.Control[]={this.cb_imprimir,&
this.dw_2,&
this.dw_1,&
this.cb_anular}
end on

on w_direccion_electrica.destroy
destroy(this.cb_imprimir)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.cb_anular)
end on

event open;// nis= gu_comunic.is_comunic.long_val2
long ll_tipo_instalacion, ll_nro_instalacion, ll_pos, ll_nro_inst_padre, ll_nif
string ls_nombre, ls_nro, ls_aux1, ls_res

// Si el pa$$HEX1$$ed00$$ENDHEX$$s es Moldavia se muestra otra datawindow
IF gi_pais=8 THEN
	dw_1.dataobject="d_direccion_electrica_mold"
	dw_1.settransobject(sqlca)
	dw_1.InsertRow(0)

	select nro_acometida, nif
	into :ll_nro_instalacion, :ll_nif
	from aco_sum
	where nis_rad= :gu_comunic.is_comunic.longval2;

	select instalacion_origen 
	into :ll_nro_instalacion
	from sgd_Acometida
	where codigo=:ll_nro_instalacion;

	// Hago un bucle que me llegue hasta la subestaci$$HEX1$$f300$$ENDHEX$$n y vaya obteniendo los datos
	DECLARE lista_instalaciones CURSOR FOR
		
	SELECT MATRICULA,
		 NRO_INSTALACION,
		 TIPO_INSTALACION
	FROM SGD_INSTALACION
	START WITH NRO_INSTALACION= :ll_nro_instalacion AND BDI_JOB=0
	CONNECT BY PRIOR  SGD_INSTALACION.NRO_INST_PADRE = SGD_INSTALACION.NRO_INSTALACION 
	AND SGD_INSTALACION.BDI_JOB = 0;	
	
		
	OPEN lista_instalaciones;

	FETCH lista_instalaciones INTO :ls_nombre, :ll_nro_inst_padre, :ll_tipo_instalacion;


	DO WHILE sqlca.sqlcode=0 AND ll_tipo_instalacion> fgci_tipo_subestacion

	
		CHOOSE CASE ll_tipo_instalacion
			CASE 7
				ll_pos= LastPos (ls_nombre,'-')
				ls_res=Right(ls_nombre,Len(ls_nombre)-ll_pos)
				dw_1.SetItem(1,'sal_ct',ls_res)
				dw_2.modify("sal_ct_mold.Text = '" + ls_res + "'")
				ls_aux1= Left(ls_nombre,ll_pos - 1)
				ll_pos= LastPos (ls_aux1,'PT')
				IF ll_pos> 0 then
					ls_res=Right(ls_aux1,Len(ls_aux1)-(ll_pos + 1))
					dw_1.SetItem(1,'ct',ls_res)
					dw_2.modify("ct_mold.Text = '" + ls_res + "'")
				ELSE
					dw_1.SetItem(1,'sal_ct','')
					dw_2.modify("sal_ct_mold.Text = ''")
					dw_1.SetItem(1,'ct','')
					dw_2.modify("ct_mold.Text = ''")
				END IF
			CASE 6
				ll_pos= LastPos (ls_nombre,'-')
				ls_res= Right(ls_nombre,Len(ls_nombre)-ll_pos)
				dw_1.SetItem(1,'sal_salmt', ls_res)
				dw_2.modify("sal_salmt_mold.Text = '" + ls_res + "'")
				ls_aux1= Left(ls_nombre,ll_pos - 1)
				ll_pos= LastPos (ls_aux1,'PD')
				IF ll_pos > 0 then
					ls_res= Right(ls_aux1,Len(ls_aux1)-(ll_pos + 1))
					dw_1.SetItem(1,'salmt', ls_res)
					dw_2.modify("salmt_mold.Text = '" + ls_res + "'")
				ELSE
					dw_1.SetItem(1,'sal_salmt', '')
					dw_2.modify("sal_salmt_mold.Text = ''")
					dw_1.SetItem(1,'salmt', '')
					dw_2.modify("salmt_mold.Text = ''")
				END IF
			CASE 4
				ll_pos= LastPos (ls_nombre,'-')
				ls_res= Right(ls_nombre,Len(ls_nombre)-ll_pos)
				dw_1.SetItem(1,'sal_subestacion', ls_res)
				dw_2.modify("sal_subestacion_mold.Text = '" + ls_res + "'")
				ls_aux1= Left(ls_nombre,ll_pos - 1)
				ll_pos= LastPos (ls_aux1,'PDC')
				IF ll_pos > 0 then
					ls_res= Right(ls_aux1,Len(ls_aux1)-(ll_pos +2))
					dw_1.SetItem(1,'subestacion', ls_res)
					dw_2.modify("subestacion_mold.Text = '" + ls_res + "'")
				ELSE
					ll_pos= LastPos(ls_nombre,'-')
					ls_res= Right(ls_nombre,Len(ls_nombre)-ll_pos)
					ls_aux1= Left(ls_nombre,ll_pos - 1)
					ll_pos= LastPos (ls_aux1,'PD')
					IF ll_pos > 0 THEN
						dw_1.SetItem(1,'sal_salmt', ls_res)
						dw_2.modify("sal_salmt_mold.Text = '" + ls_res + "'")
						ls_res= Right(ls_aux1,Len(ls_aux1)-(ll_pos + 1))
						dw_1.SetItem(1,'salmt', ls_res)
						dw_2.modify("salmt_mold.Text = '" + ls_res + "'")
					ELSE
						dw_1.SetItem(1,'sal_subestacion', '')
						dw_2.modify("sal_subestacion_mold.Text = ''")
						dw_1.SetItem(1,'subestacion', '')
						dw_2.modify("subestacion_mold.Text = ''")
					END IF
				END IF
		END CHOOSE
		ls_nombre=''
		FETCH lista_instalaciones INTO :ls_nombre, :ll_nro_inst_padre, :ll_tipo_instalacion;
	LOOP
	CLOSE lista_instalaciones;

	SELECT nom_instalacion
	INTO :ls_nombre
	FROM sgd_instalacion
	WHERE nro_instalacion= :ll_nro_inst_padre
		AND bdi_job=0;

	ll_pos= Pos (ls_nombre,' ')
	ls_res= Right(ls_nombre,Len(ls_nombre)-(ll_pos))
	dw_1.SetItem(1,'descripcion',ls_res)
	dw_2.modify("descripcion.Text = '" + ls_res + "'")
	
//	SELECT nif_apa
//	INTO :ll_nif
//	FROM puntomed_param
//	WHERE nis_rad= :gu_comunic.is_comunic.longval2;
	
	ls_nombre=''
	SELECT NUM_DIST
	INTO :ls_nombre
	FROM ea_fincas
	WHERE nif= :ll_nif;
	dw_1.SetItem(1,'armario', ls_nombre)
	dw_2.modify("armario.Text = '" + ls_nombre + "'")

ELSE		// En el resto de los pa$$HEX1$$ed00$$ENDHEX$$ses muestro el nombre de la instalaci$$HEX1$$f300$$ENDHEX$$n
	dw_1.settransobject(sqlca)
	dw_1.InsertRow(0)

	select nro_acometida
	into :ll_nro_instalacion
	from aco_sum
	where nis_rad= :gu_comunic.is_comunic.longval2;

	select instalacion_origen 
	into :ll_nro_instalacion
	from sgd_Acometida
	where codigo=:ll_nro_instalacion;
	
	DECLARE lista_instalaciones_2 CURSOR FOR
	
	SELECT NOM_INSTALACION,
		 NRO_INSTALACION,
		 TIPO_INSTALACION
	FROM SGD_INSTALACION
	START WITH NRO_INSTALACION= :ll_nro_instalacion AND BDI_JOB=0
	CONNECT BY PRIOR  SGD_INSTALACION.NRO_INST_PADRE = SGD_INSTALACION.NRO_INSTALACION 
	AND SGD_INSTALACION.BDI_JOB = 0;	
	
	OPEN lista_instalaciones_2;

	FETCH lista_instalaciones_2 INTO :ls_nombre, :ll_nro_inst_padre, :ll_tipo_instalacion;


	DO WHILE sqlca.sqlcode=0 AND ll_tipo_instalacion>= fgci_tipo_subestacion
		CHOOSE CASE ll_tipo_instalacion
			CASE fgci_tipo_ct
				dw_1.SetItem(1,'ct',ls_nombre)
				dw_2.modify("ct.Text = '" + ls_nombre + "'")
			CASE fgci_tipo_salida_de_baja
				dw_1.SetItem(1,'salbt',ls_nombre)
				dw_2.modify("salbt.Text = '" + ls_nombre + "'")
			CASE fgci_tipo_salida_mt
				dw_1.SetItem(1,'salmt',ls_nombre)
				dw_2.modify("salmt.Text = '" + ls_nombre + "'")
			CASE fgci_tipo_subestacion
				dw_1.SetItem(1,'subestacion',ls_nombre)
				dw_2.modify("subestacion.Text = '" + ls_nombre + "'")
		END CHOOSE
		ls_nombre=''
		FETCH lista_instalaciones_2 INTO :ls_nombre, :ll_nro_inst_padre, :ll_tipo_instalacion;
	LOOP
	
	CLOSE lista_instalaciones_2;
END IF
end event

type cb_imprimir from commandbutton within w_direccion_electrica
integer x = 878
integer y = 448
integer width = 457
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Imprimir"
end type

event clicked;datawindowchild dw_window
s_impresion_preliminar lst_Impresion
boolean lb_return
long ll_longitud
string ls_titulo

dw_2.getchild ("dw_1",dw_window)


//dw_1.sharedata(dw_window)

ls_titulo = 'Direcci$$HEX1$$f300$$ENDHEX$$n El$$HEX1$$e900$$ENDHEX$$ctrica Aviso: ' + string(gu_comunic.is_comunic.longval1)
ll_longitud = len (ls_titulo)*100
dw_2.modify("titulo_t.width = '" + string(ll_longitud) +  "'")
dw_2.modify("titulo_t.Text = '" + ls_titulo + "'")

lst_impresion.pdw_datawindow = dw_2
lst_impresion.pdw_lista = dw_1
lst_impresion.compuesto = false

if gi_pais=8 then
	
	dw_2.modify("subestacion_t.visible='0'")
	dw_2.modify("salmt_t.visible='0'")
	dw_2.modify("ct_t.visible='0'")
	dw_2.modify("salbt_t.visible='0'")
	dw_2.modify("subestacion.visible='0'")
	dw_2.modify("salmt.visible='0'")
	dw_2.modify("ct.visible='0'")
	dw_2.modify("salbt.visible='0'")
	
	dw_2.modify("armario_t.visible='1'")
	dw_2.modify("salmt_mold_t.visible='1'")
	dw_2.modify("descripcion_t.visible='1'")
	dw_2.modify("ct_mold_t.visible='1'")
	dw_2.modify("sal_ct_mold_t.visible='1'")
	dw_2.modify("sal_salmt_mold_t.visible='1'")
	dw_2.modify("sal_subestacion_mold_t.visible='1'")
	dw_2.modify("subestacion_mold_t.visible='1'")
	dw_2.modify("armario.visible='1'")
	dw_2.modify("salmt_mold.visible='1'")
	dw_2.modify("descripcion.visible='1'")
	dw_2.modify("ct_mold.visible='1'")
	dw_2.modify("sal_ct_mold.visible='1'")
	dw_2.modify("sal_salmt_mold.visible='1'")
	dw_2.modify("sal_subestacion_mold.visible='1'")
	dw_2.modify("subestacion_mold.visible='1'")
else

	dw_2.modify("subestacion_t.visible='1'")
	dw_2.modify("salmt_t.visible='1'")
	dw_2.modify("ct_t.visible='1'")
	dw_2.modify("salbt_t.visible='1'")
	dw_2.modify("subestacion.visible='1'")
	dw_2.modify("salmt.visible='1'")
	dw_2.modify("ct.visible='1'")
	dw_2.modify("salbt.visible='1'")
	
	dw_2.modify("armario_t.visible='0'")
	dw_2.modify("salmt_mold_t.visible='0'")
	dw_2.modify("descripcion_t.visible='0'")
	dw_2.modify("ct_mold_t.visible='0'")
	dw_2.modify("sal_ct_mold_t.visible='0'")
	dw_2.modify("sal_salmt_mold_t.visible='0'")
	dw_2.modify("sal_subestacion_mold_t.visible='0'")
	dw_2.modify("subestacion_mold_t.visible='0'")
	dw_2.modify("armario.visible='0'")
	dw_2.modify("salmt_mold.visible='0'")
	dw_2.modify("descripcion.visible='0'")
	dw_2.modify("ct_mold.visible='0'")
	dw_2.modify("sal_ct_mold.visible='0'")
	dw_2.modify("sal_salmt_mold.visible='0'")
	dw_2.modify("sal_subestacion_mold.visible='0'")
	dw_2.modify("subestacion_mold.visible='0'")
end if



lb_return=gf_impresion_preliminar (lst_impresion, True, 0)

end event

type dw_2 from datawindow within w_direccion_electrica
boolean visible = false
integer x = 37
integer y = 672
integer width = 2743
integer height = 672
integer taborder = 20
string title = "none"
string dataobject = "d_direccion_electrica_imp"
boolean border = false
boolean livescroll = true
end type

type dw_1 from datawindow within w_direccion_electrica
integer x = 37
integer width = 2633
integer height = 416
integer taborder = 10
string title = "none"
string dataobject = "d_direccion_electrica"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_anular from commandbutton within w_direccion_electrica
integer x = 1499
integer y = 448
integer width = 457
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
boolean enabled = false
string text = "&Anular"
end type


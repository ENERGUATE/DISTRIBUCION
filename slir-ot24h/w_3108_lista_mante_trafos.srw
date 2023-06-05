HA$PBExportHeader$w_3108_lista_mante_trafos.srw
forward
global type w_3108_lista_mante_trafos from w_sgigenerica
end type
type d_lista_trafos from u_ins_2014_pr_lista_mante_trafos within w_3108_lista_mante_trafos
end type
type cb_agregar from u_cb within w_3108_lista_mante_trafos
end type
type cb_eliminar from u_cb within w_3108_lista_mante_trafos
end type
type cb_grabar from u_cb within w_3108_lista_mante_trafos
end type
type st_lista from statictext within w_3108_lista_mante_trafos
end type
end forward

global type w_3108_lista_mante_trafos from w_sgigenerica
int X=837
int Y=688
int Width=1984
int Height=1028
WindowType WindowType=response!
long BackColor=81324524
boolean MinBox=false
boolean MaxBox=false
boolean Resizable=false
d_lista_trafos d_lista_trafos
cb_agregar cb_agregar
cb_eliminar cb_eliminar
cb_grabar cb_grabar
st_lista st_lista
end type
global w_3108_lista_mante_trafos w_3108_lista_mante_trafos

type variables
u_generico_comunicaciones       iu_resetear     
u_generico_comunicaciones       iu_gen_comunic
u_ins_2014_nu_lista_mante_trafos iu_ins_2014_nu
u_ins_2014_rn_lista_mante_trafos iu_ins_2014_rn

int ii_fila_seleccionada, ii_nro_trafo_ant

decimal{0} idec_nro_inst

string is_modstring, is_columna

boolean ib_valido
int ii_fila
string is_columna_ant
end variables

event closequery;call super::closequery;IF iu_gen_comunic.is_comunic.accion_llamada <> "Consulta" THEN

        IF gnv_msg.f_mensaje("CG01","","",YesNo!) = 1 THEN
                string ls_nro_trafo
                integer li_ya_existe
                ib_valido=true
                d_lista_trafos.AcceptText()
                yield()
                IF ib_valido=false THEN
                        ib_valido = True
                        Message.ReturnValue = 1
                        Return
                END IF
                is_modstring = iu_ins_2014_rn.frn_validar(d_lista_trafos,3,ii_fila_seleccionada)

                IF NOT ISNULL(is_modstring) THEN
                        //MESSAGEBOX("Atenci$$HEX1$$f300$$ENDHEX$$n",is_modstring)
                        gnv_msg.f_mensaje("AM45",is_modstring,"",OK!)
                        d_lista_trafos.SetFocus()
                        Message.ReturnValue = 1
                        Return
                END IF

                This.TriggerEvent("ue_arch_grabar")

        END IF

END IF
end event

event open;call super::open;/////////////////////////////////////////////////////////////////////////
//
// Evento:  open
//
// Objetivo: Abre la ventana con la lista de transformadores
//                               a mantener .
//
//                       Actuaci$$HEX1$$f300$$ENDHEX$$n       Fecha     Responsable
//                       ---------       -----     ----------- 
// Hist$$HEX1$$f300$$ENDHEX$$rico de cambios:
//                       Creaci$$HEX1$$f300$$ENDHEX$$n        02/09/96   HMA
//
/////////////////////////////////////////////////////////////////////////


long ll_calle
string ls_calle, ls_titulo, ls_rc
int li_tipo_inst

// carga el objeto de comunicaciones para tener acceso 
// a la estructura
//      iu_gen_comunic  --> para cargar la estructura local 


SetPointer(HourGlass!)


iu_resetear      = CREATE u_generico_comunicaciones
iu_gen_comunic  = CREATE u_generico_comunicaciones
iu_ins_2014_nu   = CREATE u_ins_2014_nu_lista_mante_trafos
iu_ins_2014_rn   = CREATE u_ins_2014_rn_lista_mante_trafos

iu_gen_comunic.is_comunic = gu_comunic.is_comunic

d_lista_trafos.SetTransObject(SQLCA)

idec_nro_inst = iu_gen_comunic.is_comunic.decval1
ib_valido = True

iu_ins_2014_nu.fnu_traer_datos(idec_nro_inst,d_lista_trafos)

d_lista_trafos.SetRowFocusIndicator(Hand!)

// Cambiar los atributos de la ventana
//this.fpr_cambiar_atributos()

This.Title = iu_gen_comunic.f_titulo_ventana("w_3108","Form.Mante.Trafos")

ls_titulo = iu_ins_2014_nu.fnu_nombre_instalac(idec_nro_inst)

//d_lista_trafos.Title = ' Poste: ' + ls_titulo
st_lista.Text = ls_titulo

ii_fila_seleccionada = 1

IF iu_gen_comunic.is_comunic.accion_llamada = "Consulta" THEN
        d_lista_trafos.fpr_habilitar_campos(False)
        cb_agregar.Enabled  = False
        cb_eliminar.Enabled = False
        cb_grabar.Enabled   = False
ELSEIF iu_gen_comunic.is_comunic.accion_llamada = "Actualizacion" THEN
        d_lista_trafos.fpr_habilitar_campos(True)
        IF d_lista_trafos.RowCount() = 0 THEN
                ii_fila_seleccionada = d_lista_trafos.f_agregar_registro(idec_nro_inst)
        END IF
END IF



end event

on ue_arch_grabar;call w_sgigenerica::ue_arch_grabar;long       ll_acceptext

ll_acceptext=d_lista_trafos.AcceptText()

IF ll_acceptext <> 1 THEN
        gnv_msg.f_mensaje("EM14","","",OK!) // Los datos Ingresados son Inconsistentes.
        Message.ReturnValue = 1
        RETURN
ELSE
        IF d_lista_trafos.Update() = 1 THEN
      gnu_u_transaction.uf_commit();
   ELSE
      gnu_u_transaction.uf_rollback();
        END IF
END IF

end on

on close;call w_sgigenerica::close;DESTROY iu_resetear  
DESTROY iu_gen_comunic
DESTROY iu_ins_2014_nu
DESTROY iu_ins_2014_rn
end on

on w_3108_lista_mante_trafos.create
int iCurrent
call super::create
this.d_lista_trafos=create d_lista_trafos
this.cb_agregar=create cb_agregar
this.cb_eliminar=create cb_eliminar
this.cb_grabar=create cb_grabar
this.st_lista=create st_lista
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.d_lista_trafos
this.Control[iCurrent+2]=this.cb_agregar
this.Control[iCurrent+3]=this.cb_eliminar
this.Control[iCurrent+4]=this.cb_grabar
this.Control[iCurrent+5]=this.st_lista
end on

on w_3108_lista_mante_trafos.destroy
call super::destroy
destroy(this.d_lista_trafos)
destroy(this.cb_agregar)
destroy(this.cb_eliminar)
destroy(this.cb_grabar)
destroy(this.st_lista)
end on

type d_lista_trafos from u_ins_2014_pr_lista_mante_trafos within w_3108_lista_mante_trafos
event ue_post_item_changed pbm_custom25
event ue_post_item2 pbm_custom26
int X=128
int Y=140
int Width=1705
int Height=596
int TabOrder=10
BorderStyle BorderStyle=StyleRaised!
boolean VScrollBar=true
end type

on ue_post_item_changed;call u_ins_2014_pr_lista_mante_trafos::ue_post_item_changed;this.setrow(ii_fila)
this.setcolumn(is_columna_ant)
d_lista_trafos.SetItem(ii_fila,"nro_transformador",ii_nro_trafo_ant)

end on

on ue_post_item2;call u_ins_2014_pr_lista_mante_trafos::ue_post_item2;this.setitem(ii_fila_seleccionada,"nro_transformador",fgnu_valido_numero_nulo(this.getitemnumber(ii_fila_seleccionada,"nro_transformador")))
this.accepttext()
end on

event itemerror;call super::itemerror;string ls_titulo, a
is_columna=this.getcolumnname()
integer li_columna

li_columna=integer(this.gettext())

IF is_columna = "potencia" THEN
        is_modString="Debe introducir una potencia v$$HEX1$$e100$$ENDHEX$$lida"
ELSEIF is_columna = "nro_transformador" THEN
        is_modstring = "Debe introducir un n$$HEX1$$fa00$$ENDHEX$$mero de transformador v$$HEX1$$e100$$ENDHEX$$lido"
END IF

if li_columna=0 then
        ls_titulo="Datawindow.message.title='Atenci$$HEX1$$f300$$ENDHEX$$n'"
        a=This.Modify(ls_titulo)
        is_modstring=is_columna+".ValidationMsg='"+is_modstring+"'"
        a=This.Modify(is_modstring)
end if
ib_valido=false
This.SetFocus()
end event

event clicked;call super::clicked;ii_fila_seleccionada = row


end event

event itemchanged;call super::itemchanged;int li_ya_existe, li_nro_trafo_ant, li_fila_previa
string ls_nro_trafo
string ls_columna
ls_columna=this.getcolumnname()
li_fila_previa = This.GetRow()
ib_valido=true  //prendo bandera de validacion en true

IF d_lista_trafos.GetColumnName() = "nro_transformador" THEN

        ls_nro_trafo = d_lista_trafos.GetText()
        ii_nro_trafo_ant = d_lista_trafos.GetItemNumber(li_fila_previa,"nro_transformador")
        li_ya_existe = d_lista_trafos.Find("nro_transformador = " +ls_nro_trafo,1,d_lista_trafos.RowCount())
        IF li_ya_existe <> 0 THEN
                gnv_msg.f_mensaje("EM28","","",OK!)
                d_lista_trafos.SetRow(2)
                d_lista_trafos.SetFocus()
                d_lista_trafos.SetItem(li_fila_previa,"nro_transformador",ii_nro_trafo_ant)
                is_columna_ant=ls_columna       
                ii_fila=li_fila_previa
                ib_valido = False
                this.postevent("ue_post_item_changed")          
        END IF
END IF


end event

type cb_agregar from u_cb within w_3108_lista_mante_trafos
int X=146
int Y=764
int Width=398
int TabOrder=20
string Text="&Agregar"
boolean Default=true
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;d_lista_trafos.AcceptText()
yield()
if not ib_valido then
        return
end if
is_modstring = iu_ins_2014_rn.frn_validar(d_lista_trafos,2,ii_fila_seleccionada)

IF NOT ISNULL(is_modstring) THEN
        //MESSAGEBOX("Atenci$$HEX1$$f300$$ENDHEX$$n",is_modstring)
        gnv_msg.f_mensaje("AM45",is_modstring,"",OK!)
        d_lista_trafos.SetFocus()
        RETURN
END IF

ii_fila_seleccionada = d_lista_trafos.f_agregar_registro(idec_nro_inst)

end event

type cb_eliminar from u_cb within w_3108_lista_mante_trafos
int X=768
int Y=764
int Width=398
int TabOrder=30
string Text="&Eliminar"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

on clicked;call u_cb::clicked;int li_fila

d_lista_trafos.f_borrar_registro(ii_fila_seleccionada)

li_fila = d_lista_trafos.RowCount()

IF li_fila = 0 THEN
        d_lista_trafos.f_agregar_registro(idec_nro_inst)
        ii_fila_seleccionada = 1
        d_lista_trafos.SetRow(1)
ELSEIF li_fila < ii_fila_seleccionada THEN
        ii_fila_seleccionada = li_fila
        d_lista_trafos.SetRow(li_fila)
ELSE
        ii_fila_seleccionada = ii_fila_seleccionada
        d_lista_trafos.SetRow(ii_fila_seleccionada)
END IF


end on

type cb_grabar from u_cb within w_3108_lista_mante_trafos
int X=1394
int Y=764
int Width=398
int TabOrder=40
string Text="&Grabar"
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
end type

event clicked;call super::clicked;string ls_nro_trafo
integer li_ya_existe
ib_valido=true
d_lista_trafos.AcceptText()
yield()
IF ib_valido=false THEN
        ib_valido = True
        RETURN
END IF
is_modstring = iu_ins_2014_rn.frn_validar(d_lista_trafos,3,ii_fila_seleccionada)

IF NOT ISNULL(is_modstring) THEN
        //MESSAGEBOX("Atenci$$HEX1$$f300$$ENDHEX$$n",is_modstring)
   gnv_msg.f_mensaje("AM45",is_modstring,"",OK!)
        d_lista_trafos.SetFocus()
        RETURN
END IF

Parent.TriggerEvent("ue_arch_grabar")
end event

type st_lista from statictext within w_3108_lista_mante_trafos
int X=128
int Y=60
int Width=1705
int Height=68
boolean Enabled=false
boolean Border=true
BorderStyle BorderStyle=StyleRaised!
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=16777215
long BackColor=8421376
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


HA$PBExportHeader$u_sit_2003_pr_lista_situacion_climatolog.sru
forward
global type u_sit_2003_pr_lista_situacion_climatolog from u_sit_0000_generico_situacion_clima
end type
end forward

global type u_sit_2003_pr_lista_situacion_climatolog from u_sit_0000_generico_situacion_clima
string DataObject="d_2003_lista_situacion_clima"
event u_mover_borde pbm_dwnmousemove
event u_soltar_clicked pbm_dwnlbuttonup
end type
global u_sit_2003_pr_lista_situacion_climatolog u_sit_2003_pr_lista_situacion_climatolog

type variables
string is_nomcab
int ii_orden
string is_nomcab_borde
end variables

event u_mover_borde;call super::u_mover_borde;string ls_cab
if dwo.name= "datawindow" then return 0
if isvalid(dwo) or not isnull(dwo) then
	ls_cab=string(dwo.band)
	if ls_cab = "header" then
		dwo.pointer="mano.cur"
	end if
end if
end event

event u_soltar_clicked;call super::u_soltar_clicked;string ls_sint
ls_sint=is_nomcab_borde + ".Border='6'"
this.Modify(ls_sint)
end event

event clicked;call super::clicked;string ls_nomcab
string ls_nomcol
string ls_tipo= " A"
string ls_sint
string ls_cab
if dwo.name= "datawindow" then return 0
if isvalid(dwo) or not isnull(dwo) then
	ls_cab=string(dwo.band)
	if ls_cab = "header" then	
		ls_nomcab=dwo.name
		ls_sint=ls_nomcab + ".Border='5'"
		this.Modify(ls_sint)
		is_nomcab_borde = ls_nomcab
		ls_nomcol=left(ls_nomcab,Pos(ls_nomcab,"_t",1) - 1)
		if is_nomcab = ls_nomcab and ii_orden=1 then
			ii_orden=2
			ls_tipo= " D"
			this.SetSort(ls_nomcol + ls_tipo)
		elseif is_nomcab = ls_nomcab and ii_orden=2 then
			ii_orden=1
			ls_tipo= " A"
			this.SetSort(ls_nomcol + ls_tipo)
		elseif is_nomcab <> ls_nomcab then
			ii_orden=1
			ls_tipo = " A"
			this.SetSort(ls_nomcol + ls_tipo)
	//		messagebox("1","nomcab=" + ls_nomcab + "nomcol=" + ls_nomcol + "tipo" + ls_tipo )
			is_nomcab=ls_nomcab
		end if
		this.sort()
	end if
end if
end event


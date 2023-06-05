HA$PBExportHeader$u_gen_0000_nu_filtro.sru
forward
global type u_gen_0000_nu_filtro from nonvisualobject
end type
end forward

global type u_gen_0000_nu_filtro from nonvisualobject
end type
global u_gen_0000_nu_filtro u_gen_0000_nu_filtro

type variables
DataStore idw_codifs
DataStore idw_codifs_tmp
end variables

forward prototypes
public function string getambito (ref datawindow dw_ambito, string table, string begining)
public function string getfilter (ref datawindow p_dw, string table, string begining)
public subroutine loadchild (ref datawindowchild pdw_child, string ps_radical, string ps_filter)
public subroutine load (ref datastore dw)
public subroutine load (ref datawindow dw)
public subroutine comprobar_radical (ref string radical_dst, string radical_src)
end prototypes

public function string getambito (ref datawindow dw_ambito, string table, string begining);long 		nro_centro, nro_cmd, nro_mesa
string 	ls_filter='',ls_and='';
	
dw_ambito.AcceptText()

nro_centro 	= dw_ambito.getitemnumber(1,"nro_centro")
nro_cmd		= dw_ambito.getitemnumber(1,"nro_cmd")
nro_mesa		= dw_ambito.getitemnumber(1,"nro_mesa") 

if table <> '' then table = table + '.'

if nro_centro <> 0 then	
	ls_filter = table + 'nro_centro   = ' + string (nro_centro) 
	ls_and    = ' and '
end if

if nro_cmd <> 0 then 
	ls_filter = ls_filter + ls_and + table + 'nro_cmd = ' + string (nro_cmd) 
	ls_and    = ' and '
end if

if nro_mesa <> 0 then 
	ls_filter = ls_filter + ls_and + table + 'nro_mesa = ' + string (nro_mesa) 
end if

if ls_filter <> '' then
	if begining <> '' then
		return begining + ' and '+ ls_filter
	else
		return ls_filter
	end if
else
	return begining
end if

end function

public function string getfilter (ref datawindow p_dw, string table, string begining);long 		ll_Num_Col, filter_value = 0; 
string	ls_name, ls_and = '',ls_filter ='';

p_dw.AcceptText()

if table <> '' then table = table + '.'

ll_Num_Col = INTEGER( p_dw.Describe("DataWindow.Column.Count") )

FOR ll_Num_Col = ll_Num_Col TO 1 STEP - 1
		ls_name = upper ( p_dw.Describe("#"+STRING(ll_Num_Col)+".Name"))

		filter_value = p_dw.GetItemNumber(1,ls_name)
		
		if filter_value <> 0 then
			ls_filter = ls_filter + ls_and + table + ls_name &
											+ ' = ' +	string(filter_value)					
			ls_and = ' and '
		end if
NEXT

if ls_filter <> '' then
	if begining <> '' then
		return begining + ' and '+ ls_filter
	else
		return ls_filter
	end if
else
	return begining
end if



end function

public subroutine loadchild (ref datawindowchild pdw_child, string ps_radical, string ps_filter);long   ll_row, ll_rowsfiltered = 0, ll_RowsCount, ll_RowsCountTmp
string ls_expression
long   ll_ret
string ls_radical

comprobar_radical (ls_radical, ps_radical)

IF len (ps_filter) > 1 THEN 
		ls_expression = "codif='"+ls_radical+"' AND (" + ps_filter + ")"
ELSE
		ls_expression = "codif='"+ls_radical+"'"
END IF

idw_codifs_tmp.Reset ()
pdw_child.Reset ()
ll_RowsCount = idw_codifs.RowCount ();
ll_row = idw_codifs.Find (ls_expression, 1, ll_RowsCount )

DO WHILE ll_row > 0
ll_rowsfiltered++;	
idw_codifs.RowsCopy (ll_row, ll_row, Primary!, idw_codifs_tmp, 1, Primary!)
IF ll_row = ll_RowsCount THEN EXIT;
ll_row = idw_codifs.Find (ls_expression, ll_row + 1, ll_RowsCount )
LOOP

IF ll_rowsfiltered =0 THEN
	idw_codifs_tmp.Reset ()
	ll_RowsCountTmp = idw_codifs_tmp.Retrieve (ls_radical)
	idw_codifs_tmp.RowsCopy (1, ll_RowsCountTmp, Primary!, idw_codifs, 1, Primary!)
	idw_codifs.Sort ()
	idw_codifs_tmp.SetFilter (ps_filter)
	idw_codifs_tmp.Filter ()
END IF

idw_codifs_tmp.Sort ()
ll_ret = idw_codifs_tmp.RowsCopy (1,idw_codifs_tmp.RowCount(), Primary!, pdw_child, 1, Primary!)
ll_ret = 0; 

end subroutine

public subroutine load (ref datastore dw);long 		ll_Num_Col; 
string	ls_name,ls_radical,ls_tag,ls_filter
long     radical_pos, filter_pos


ll_Num_Col = INTEGER( dw.Describe("DataWindow.Column.Count") )

FOR ll_Num_Col = ll_Num_Col TO 1 STEP - 1
		if upper ( dw.Describe("#"+STRING(ll_Num_Col)+".dddw.Name")) <> '?'	then
				ls_tag=dw.Describe("#"+STRING(ll_Num_Col)+".tag")
				if ls_tag = '?' then exit;
				radical_pos =	pos(ls_tag,'RD=')
				if radical_pos = 0 then exit;				
				filter_pos  =  pos(ls_tag,'FL=')
				if filter_pos = 0 then exit;				
				
				ls_name = dw.Describe("#"+STRING(ll_Num_Col)+".name")
				datawindowchild ldwch
				dw.GetChild(ls_name,ldwch)
				loadchild(ldwch,mid(ls_tag,radical_pos + 3 , pos(ls_tag,';',radical_pos) - (radical_pos + 3)),&
												mid(ls_tag,filter_pos + 3, pos(ls_tag,';',filter_pos) - (filter_pos + 3) ))
		end if
NEXT

end subroutine

public subroutine load (ref datawindow dw);long 		ll_Num_Col; 
string	ls_name,ls_radical,ls_tag,ls_filter
long     radical_pos, filter_pos


ll_Num_Col = INTEGER( dw.Describe("DataWindow.Column.Count") )

FOR ll_Num_Col = ll_Num_Col TO 1 STEP - 1
		if upper ( dw.Describe("#"+STRING(ll_Num_Col)+".dddw.Name")) <> '?'	then
				ls_tag=dw.Describe("#"+STRING(ll_Num_Col)+".tag")
				if ls_tag = '?' then exit;
				radical_pos =	pos(ls_tag,'RD=')
				if radical_pos = 0 then exit;				
				filter_pos  =  pos(ls_tag,'FL=')
				if filter_pos = 0 then exit;				
				
				ls_name = dw.Describe("#"+STRING(ll_Num_Col)+".name")
				datawindowchild ldwch
				dw.GetChild(ls_name,ldwch)
				loadchild(ldwch,mid(ls_tag,radical_pos + 3 , pos(ls_tag,';',radical_pos) - (radical_pos + 3)),&
												mid(ls_tag,filter_pos + 3, pos(ls_tag,';',filter_pos) - (filter_pos + 3) ))
		end if
NEXT


end subroutine

public subroutine comprobar_radical (ref string radical_dst, string radical_src);/////////////////////////////////////////////////////////////////////////
//	Para cambiar radical por todo la aplicaci$$HEX1$$f300$$ENDHEX$$n								
//									
//	28/03/2000	DSA			
/////////////////////////////////////////////////////////////////////////

if radical_src = 'CO_T' then
	radical_dst = 'T_BR'
else
	radical_dst = radical_src
end if
end subroutine

on u_gen_0000_nu_filtro.create
TriggerEvent( this, "constructor" )
end on

on u_gen_0000_nu_filtro.destroy
TriggerEvent( this, "destructor" )
end on

event destructor;Destroy idw_codifs
Destroy idw_codifs_tmp
end event

event constructor;idw_codifs = Create Datastore
idw_codifs.DataObject = 'ddw_codif'
idw_codifs.SetTransObject (SQLCA)
idw_codifs.SetSort ("codif A");


idw_codifs_tmp = Create Datastore
idw_codifs_tmp.DataObject = 'ddw_codif'
idw_codifs_tmp.SetTransObject (SQLCA)
idw_codifs_tmp.SetSort ("descripcion A");
end event


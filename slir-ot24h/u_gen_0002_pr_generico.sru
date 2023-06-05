HA$PBExportHeader$u_gen_0002_pr_generico.sru
$PBExportComments$Base class for objects with datawindows (DSA)
forward
global type u_gen_0002_pr_generico from u_gen_0000_lista
end type
end forward

global type u_gen_0002_pr_generico from u_gen_0000_lista
integer width = 489
integer height = 356
event ue_statechanged ( string ps_state )
end type
global u_gen_0002_pr_generico u_gen_0002_pr_generico

type variables
// DSA Agua modificaciones 27/05/99
string is_objectestado = ''
string is_tabordlabel = 'TABORD'
string is_paramsepar = ';'
boolean ib_state_support = FALSE


end variables

forward prototypes
public subroutine fpr_save_tab_order ()
public function integer fpr_update ()
public subroutine fpr_add_to_tag (string ps_colname, string ps_value)
public subroutine fpr_habilitar_campos (string ps_columnname, boolean pb_enable)
public subroutine fpr_initadvances (boolean pb_statesupport)
public function integer fpr_required (integer checktype, long sourcerow)
end prototypes

event ue_statechanged;string ls_winestado, ls_tag, ls_Parameter, ls_TabSequence
Integer li_Col, li_Num_Col, li_EstadoPos, li_NonePos, li_EndOfParam, li_BegOfParam
String  ls_columnname
String  ls_BGColor, ls_Visible

ls_winestado =UPPER(ps_state)

IF ls_winestado = is_objectestado THEN
	RETURN 
ELSE
	is_objectestado =  ls_winestado
END IF

CHOOSE CASE ls_winestado
	CASE 'ACTUALIZACION'
			ls_winestado = 'ESTA'
	CASE 'CONSULTAR'
			ls_winestado = 'ESTC'
	CASE 'NUEVE'
			ls_winestado = 'ESTN'
   CASE	ELSE
			RETURN 
END CHOOSE



li_Num_Col = INTEGER( this.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
		ls_columnname = "#"+STRING(li_Col)
		
		ls_TabSequence = this.Describe (ls_columnname + ".TabSequence")
		IF ls_TabSequence = '?' THEN CONTINUE;
		
		ls_tag = this.Describe(ls_columnname + ".Tag")
		li_NonePos = pos( ls_tag, 'NONE;'); //Set to 'NONE' to avoid overriding of your logic in expressions
		IF li_NonePos > 0 THEN  CONTINUE;
		li_estadopos = pos( ls_tag, ls_winestado);
		IF li_estadopos > 0 THEN
				li_BegOfParam = li_estadopos + len(ls_winestado) + 1
				li_EndOfParam = pos ( ls_tag, is_paramsepar, li_BegOfParam)

				ls_parameter =upper( mid ( ls_tag, li_BegOfParam, li_EndOfParam - li_BegOfParam ) );
				CHOOSE CASE ls_parameter
				CASE 'E' //Editable
					fpr_habilitar_campos(ls_columnname ,TRUE)
				CASE 'D'	//Only display
					fpr_habilitar_campos(ls_columnname ,FALSE)
				CASE 'I'	//Invisible
					this.Modify (ls_columnname + ".Visible=0")					
				CASE	ELSE
					RETURN
			  END CHOOSE
		ELSE
				CHOOSE CASE ls_winestado
				CASE 'ESTA' //Actualizacion
					fpr_habilitar_campos(ls_columnname ,TRUE)
				CASE 'ESTC' //Consultar
					fpr_habilitar_campos(ls_columnname ,FALSE)
				CASE	ELSE
					RETURN 
				END CHOOSE
		END IF 
END FOR	
			
end event

public subroutine fpr_save_tab_order ();integer li_Num_Col,li_Col
string  ls_TabSequence,ls_tag
string  ls_ColName

li_Num_Col = INTEGER( this.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
		ls_ColName = "#"+STRING(li_Col)
		ls_TabSequence = this.Describe (ls_ColName + ".TabSequence")
		IF ls_TabSequence = '?' THEN CONTINUE;
		this.fpr_add_to_tag ( ls_ColName, is_tabordlabel + '=' + ls_TabSequence )
END FOR	
end subroutine

public function integer fpr_update ();// DSA Agua modificaciones 27/05/99
return this.Update()
end function

public subroutine fpr_add_to_tag (string ps_colname, string ps_value);		string ls_tag
		
		ls_tag = this.Describe(ps_ColName + ".Tag")
		IF ls_tag = '?' THEN 
				ls_tag = ''			
		ELSE
				ls_tag = ls_tag + ';'			
		END IF	
		ls_tag = ls_tag + ps_Value + ';'
		this.Modify (ps_ColName + ".Tag='"+ls_tag+"'")

end subroutine

public subroutine fpr_habilitar_campos (string ps_columnname, boolean pb_enable);integer  li_tabordlabelpos,li_EndPos, li_StartPos
string	ls_parameter, ls_tag
// Modificado por Sgo.
//string 	ls_disabledcolor ='12632256'
string 	ls_disabledcolor = gs_gris
// Fin. Sgo.
string 	ls_enabledcolor ='16777215'

IF not pb_enable THEN
			this.Modify (ps_columnname + ".background.color=" + ls_disabledcolor)
			this.Modify (ps_columnname + ".TabSequence='0'")
ELSE
			ls_tag = this.Describe (ps_columnname + ".Tag")
	 		li_tabordlabelpos = pos( ls_tag, is_tabordlabel);
			li_EndPos = pos( ls_tag,  is_paramsepar, li_tabordlabelpos);
			li_StartPos = li_tabordlabelpos + len(is_tabordlabel) + 1;
			ls_parameter	= mid( ls_tag,li_StartPos, li_EndPos - li_StartPos)	
			ls_tag=this.Modify (ps_columnname + ".TabSequence='" + ls_parameter +"'")
			this.Modify (ps_columnname + ".background.color=" + ls_enabledcolor)
END IF
end subroutine

public subroutine fpr_initadvances (boolean pb_statesupport);ib_state_support = pb_statesupport;
fpr_save_tab_order()

end subroutine

public function integer fpr_required (integer checktype, long sourcerow);Integer li_Col, li_Num_Col, retvalor=0
String  ls_name, ls_type, ls_required


this.AcceptText()

li_Num_Col = INTEGER( this.Describe("DataWindow.Column.Count") )
FOR li_Col = 1 TO li_Num_Col
			ls_name 		= upper (this.Describe("#"+STRING(li_Col)+".Name") )
			ls_type 		= upper(MID(this.Describe("#"+STRING(li_Col)+".ColType"),1,10))

			if checktype = 1  then
				ls_required = 'NO'
				if upper(this.Describe("#"+STRING(li_Col)+".Edit.Required")) = 'YES'	then 
					ls_required = 'YES'	
				elseif upper(this.Describe("#"+STRING(li_Col)+".dddw.Required")) = 'YES'	then 
					ls_required = 'YES'	
				elseif upper(this.Describe("#"+STRING(li_Col)+".editmask.Required")) = 'YES'	then 
					ls_required = 'YES'	
				elseif upper(this.Describe("#"+STRING(li_Col)+".ddlb.Required")) = 'YES'	then 
					ls_required = 'YES'
				end if
			end if
			
			CHOOSE CASE ls_type
			CASE "DATETIME"
								datetime itemdatetime;
								itemdatetime = this.GetItemDateTime(SourceRow, ls_name)
								if checktype = 1 and ls_required = 'YES' and isnull(itemdatetime)  then	
									retvalor = -1;	
									exit;			
								end if
			CASE "NUMBER"
								long itemlong								
								itemlong = this.GetItemNumber(SourceRow, ls_name)
								if checktype = 1 and ls_required = 'YES' and &
														(isnull(itemlong ) or itemlong = 0)  then
									retvalor = -1;	
									exit;			
								end if

			CASE ELSE
				
					IF pos( ls_type, 'DECIMAL') >0  THEN		
							decimal itemdecimal
							itemdecimal = this.GetItemDecimal(SourceRow, ls_name)					
							if checktype = 1 and ls_required = 'YES' and &
														(isnull(	itemdecimal ) or itemdecimal = 0.0)  then	
									retvalor = -1;	
									exit;			
							end if
								
					ELSE		
							string  itemstring
							itemstring = this.GetItemString(SourceRow, ls_name)					
							if checktype = 1 and ls_required = 'YES' and &
										(isnull(itemstring) or len(itemstring)=0)  then	// DSA 28/03/2000	
								retvalor = -1;	
								exit;			
							end if
									
					END IF
	END CHOOSE

END FOR

if checktype = 1 and retvalor = -1	then		
	gnv_msg.f_mensaje( "EC04",this.Describe(ls_name + '_t' + ".Text"),"",OK!)	// DSA 28/03/2000	
	this.SetFocus()
	this.SetColumn(ls_name)
end if

return retvalor;



end function

event constructor;call super::constructor;SetTransObject(SQLCA)
end event

event itemerror;call super::itemerror;return 2
end event

on u_gen_0002_pr_generico.create
call super::create
end on

on u_gen_0002_pr_generico.destroy
call super::destroy
end on


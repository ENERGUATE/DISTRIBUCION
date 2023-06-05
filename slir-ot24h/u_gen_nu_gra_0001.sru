HA$PBExportHeader$u_gen_nu_gra_0001.sru
forward
global type u_gen_nu_gra_0001 from nonvisualobject
end type
end forward

global type u_gen_nu_gra_0001 from nonvisualobject
end type
global u_gen_nu_gra_0001 u_gen_nu_gra_0001

forward prototypes
public function integer fnu_gra_titulo (ref graph pg_gr, string ps_titulo)
public function integer fnu_titulo_x (ref graph pg_gr, string ps_titulo)
public function integer fnu_gra_titulo_y (ref graph pg_gr, string ps_titulo)
public function integer fnu_gra_cargo_datos (ref graph pg_gr, ref datawindow pd_dw, integer y1, boolean p_series, integer pveci_columnas[], integer pveci_filas[])
end prototypes

public function integer fnu_gra_titulo (ref graph pg_gr, string ps_titulo);// seteo el titulo de la grafica
pg_gr.Title=ps_titulo

return 1
end function

public function integer fnu_titulo_x (ref graph pg_gr, string ps_titulo);pg_gr.category.label=ps_titulo
return 1
end function

public function integer fnu_gra_titulo_y (ref graph pg_gr, string ps_titulo);pg_gr.values.label=ps_titulo
return 1
end function

public function integer fnu_gra_cargo_datos (ref graph pg_gr, ref datawindow pd_dw, integer y1, boolean p_series, integer pveci_columnas[], integer pveci_filas[]);////parametros :
//pg_gr   // grafica en la cual se va a graficar
//pd_dw   //data windows por la cual se quieren obtener los datos
//y1   // en caso que no sea una grafica de series, indica la fila que se quiere graficar
//p_series   // TRUE,FALSE si es una grafica de series   cuando se grafican x e y por ejemplo avisos,incidencia de los centros
//pveci_columnas[]   //vector indicando las columnas que se quieren graficar
//pveci_filas[]  //vector indicando las filas 
//
pg_gr.Reset(All!)
int abs_x, abs_y, x1, x2

int dif, i_col_cab, snum, snum2, y2, i_columna, i_fila
long tipo
string sCantidad, ls_tipo_dato, s_nombre_Col, s_abs_x

IF p_series=FALSE THEN  // SI NO ES GRAFICA DE SERIES, TIENE  UNA COLUMNA
	sNum=pg_gr.AddSeries(" ")		
	abs_y=1
	abs_x=1
	i_columna=pveci_columnas[abs_x]	
	do while i_columna>0 
			s_abs_x="#"+String(i_columna)+".Name"
			s_nombre_col = pd_dw.describe(s_abs_x)
			s_nombre_col=s_nombre_col+"_t.Text"
			s_nombre_col=pd_dw.describe(s_nombre_col)
			pg_gr.AddData(sNum,pd_dw.getitemnumber(abs_y,i_columna),s_nombre_col)					
			abs_x=abs_x+1
			i_columna=pveci_columnas[abs_x]
	loop
ELSE  // SI P_SERIES =TRUE // TIENE MAS DE UNA COLUMNA
	
	y1=1
	y2=pd_dw.rowcount()
	i_col_cab=pveci_columnas[1]
	abs_x=2
	i_columna =  UpperBound(pveci_columnas)
	i_columna=pveci_columnas[abs_x]	
	do while i_columna>0 and abs_x <= UpperBound(pveci_columnas)
		s_abs_x="#"+String(i_columna)+".Name"
		s_nombre_col = pd_dw.describe(s_abs_x)
		s_nombre_col=s_nombre_col+"_t.Text"
		s_nombre_col=pd_dw.describe(s_nombre_col)
		sNum=pg_gr.AddSeries(s_nombre_col)	
		abs_y=1
		i_fila=pveci_filas[abs_y]
		do while i_fila>0	and y2 >= i_fila and abs_y <= y2
			ls_tipo_dato=pd_dw.describe("#"+string(i_col_cab)+".coltype")
			CHOOSE CASE ls_tipo_dato
				CASE "datetime"
					pg_gr.AddData(sNum, pd_dw.getitemnumber(i_fila,i_columna),String(Month(Date(pd_dw.getitemdatetime(i_fila,i_col_cab))))+"-"+String(Year(Date(pd_dw.getitemdatetime(i_fila,i_col_cab)))))
				CASE "decimal"
						pg_gr.AddData(sNum, pd_dw.getitemnumber(i_fila,i_columna),String(pd_dw.getitemdecimal(i_fila,i_col_cab)))									
				CASE "date"
					pg_gr.AddData(sNum, pd_dw.getitemnumber(i_fila,i_columna),String(pd_dw.getitemdate(i_fila,i_col_cab)))									
				CASE "time"
					pg_gr.AddData(sNum, pd_dw.getitemnumber(i_fila,i_columna),String(pd_dw.getitemtime(i_fila,i_col_cab)))														
				CASE "number"
					pg_gr.AddData(sNum, pd_dw.getitemnumber(i_fila,i_columna),String(pd_dw.getitemnumber(i_fila,i_col_cab)))						
				CASE ELSE
					pg_gr.AddData(sNum, pd_dw.getitemnumber(i_fila,i_columna),pd_dw.getitemstring(i_fila,i_col_cab))	
			END CHOOSE
			abs_y=abs_y+1
			//GSE 02/02/2001
			IF abs_y <= UpperBound(pveci_filas) then	i_fila=pveci_filas[abs_y]
			
		loop
		abs_x=abs_x+1
		//GSE 02/02/2001
		IF abs_x <= UpperBound(pveci_columnas) then	i_columna=pveci_columnas[abs_x]
		
	loop
END IF
return 1
end function

on u_gen_nu_gra_0001.create
TriggerEvent( this, "constructor" )
end on

on u_gen_nu_gra_0001.destroy
TriggerEvent( this, "destructor" )
end on


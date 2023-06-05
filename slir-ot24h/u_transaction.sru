HA$PBExportHeader$u_transaction.sru
$PBExportComments$Objeto de usuario que bloquea y libera los registros, para controlar el acceso concurrente a la B.D.
forward
global type u_transaction from nonvisualobject
end type
type s_element from structure within u_transaction
end type
end forward

type s_element from structure
	powerobject		powerobject
	string		table
	string		primarykey
	long		status
	boolean		free
	datetime		f_actual
	boolean		bloq_con_sqlcpropio
end type

global type u_transaction from nonvisualobject
end type
global u_transaction u_transaction

type variables
transaction sqlcpropio

private:
s_element s_elements[100];
string is_rowid[]
int ii_indice, li_max

//AHM (09/12/2009) Problemas con el bloqueo de las disponibilidades
public datastore ids_activos
end variables

forward prototypes
public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey)
public function long uf_look_up (readonly powerobject ppowerobject)
public subroutine uf_init ()
public subroutine uf_message (integer codigo)
public function integer uf_rollback ()
public function integer uf_commit ()
public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey, boolean mensaje)
public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey, datetime f_actual)
public subroutine uf_borra_rowid ()
public function integer uf_inserta_rowid (string ps_rowid)
public function integer uf_lock (boolean pb_bloq_con_sqlcb, readonly powerobject ppowerobject, string ptable, string primarykey)
protected function integer uf_execute (ref s_element pelement, boolean pb_bloq_con_sqlcb)
public function integer uf_commit (readonly powerobject ppowerobject, boolean pb_bloq_con_sqlcb)
public function integer uf_commit (readonly powerobject ppowerobject)
public function integer uf_commit (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, boolean pb_bloq_con_sqlcb)
public function integer uf_commit (readonly powerobject ppowerobject, string ps_table, string ps_primarykey)
public function integer uf_inicializar_transaccion ()
public function integer uf_rollback (readonly powerobject ppowerobject, boolean pb_bloq_con_sqlcb)
public function integer uf_rollback (readonly powerobject ppowerobject)
public function integer uf_rollback (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, boolean pb_bloq_con_sqlcb)
public function integer uf_rollback (readonly powerobject ppowerobject, string ps_table, string ps_primarykey)
public function integer uf_lock_brigada (long pl_nro_brigada)
public function integer uf_unlock_brigada (long pl_nro_brigada)
public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey, integer pi_tipo_bloqueo, long pl_clave_bloqueo)
public function integer uf_commit (readonly powerobject ppowerobject, integer pi_tipo_bloqueo, long pl_clave_bloqueo)
public function integer uf_rollback (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, integer pi_tipo_bloqueo, long pl_clave_bloqueo)
public function integer uf_commit (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, integer pi_tipo_bloqueo, long pl_clave_bloqueo)
public function integer uf_rollback (readonly powerobject ppowerobject, integer pi_tipo_bloqueo, long pl_clave_bloqueo)
public function integer uf_unlock_brigadas_usuario ()
public function integer uf_bloquea_avisos (datetime pf_actual, integer ptipo_bloqueo, long pnro_aviso)
public function integer uf_desbloquea_avisos (long pnro_aviso, integer paccion)
public function integer uf_graba_desbloqueo_av (long pnro_aviso)
public function integer uf_desbloquea_av_usuario ()
public function integer uf_cargaincidenciasrowid ()
public function integer uf_lock_disponibilidad (long pl_nroincidencia)
public function integer uf_desbloqueo_disponibilidades (datastore pds_datos)
end prototypes

public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Original. Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////

string sqltext;
long   exstatus;
s_element pelement;


pelement.powerobject	= 	ppowerobject
pelement.table 		=	ptable
pelement.primarykey 	=	primarykey
pelement.status 		=  0
setnull(pelement.f_Actual)
pelement.bloq_con_sqlcpropio = FALSE

exstatus = uf_execute (pelement, FALSE);

if exstatus <> 0 then 
	CHOOSE CASE exstatus 
	CASE -54
		if (ppowerobject = w_1234_consulta_incidencias or ppowerobject = w_1105_avisos_con_alim) and upper(ptable) = "SGD_INCIDENCIA" then
			if messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este registro. $$HEX1$$bf00$$ENDHEX$$Desea abrir en modo consulta?',information!,YesNo!) = 1 then
				exstatus = -54
			else
				exstatus = -2
			end if
			
		else
			messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este registro.')
			exstatus = -54
		end if
	CASE -55
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Este registro ya est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado en otra ventana del sistema');
		exstatus=-54
	CASE 100
//		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos. Actualice la ventana');
	CASE ELSE
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Error desconocido. No se han podido actualizar los datos ');
	END CHOOSE
	return exstatus;
end if 

long li=1;
IF ii_indice <> 0 THEN li = ii_indice
DO WHILE li < li_max
	if s_elements[li].free then
		s_elements[li].free = FALSE
		s_elements[li] = pelement
		ii_indice = li + 1
		exit;
	end if	
	li++;
LOOP

return 0;

end function

public function long uf_look_up (readonly powerobject ppowerobject);long     li=1;


DO WHILE li < li_max
	if not s_elements[li].free then
		if  s_elements[li].powerobject = ppowerobject	 then
			if s_elements[li].status <> 0 then
					CHOOSE CASE s_elements[li].status
					CASE -54
						messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario empez$$HEX2$$f3002000$$ENDHEX$$a cambiar los datos. No se puede seguir haciendo cambios');
					CASE 100
						messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos. Se necesita actualizarlos');
					CASE ELSE
						messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Error base de datos. No se puede seguir haciendo cambios');
					END CHOOSE
					return s_elements[li].status;
			end if;		
		end if;	
	end if;	
	li++;
LOOP

return 0;


end function

public subroutine uf_init ();long li=1;

ii_indice = 0

li_max = UpperBound(s_elements) + 1

DO WHILE li < li_max
	s_elements[li].free = TRUE;
	li++;
LOOP





end subroutine

public subroutine uf_message (integer codigo);if codigo <> 0 then
	CHOOSE CASE codigo
	CASE -54
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este registro');
	CASE 100
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos. Actualice la ventana');
	CASE ELSE
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No se han podido actualizar los datos de esta ventana');
	END CHOOSE
end if

	
end subroutine

public function integer uf_rollback ();return uf_rollback(this)
end function

public function integer uf_commit ();return uf_commit(this);
end function

public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey, boolean mensaje);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Original. Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////

string sqltext;
long   exstatus;
s_element pelement;


pelement.powerobject	= 	ppowerobject
pelement.table 		=	ptable
pelement.primarykey 	=	primarykey
pelement.status 		=  0
setnull(pelement.f_Actual)
pelement.bloq_con_sqlcpropio = FALSE

exstatus = uf_execute (pelement, FALSE);

if exstatus <> 0 then 
	CHOOSE CASE exstatus 
	CASE -55
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Este registro ya est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado en otra ventana del sistema');
		exstatus=-54
	CASE -54
//		messagebox('Atenc$$HEX1$$ed00$$ENDHEX$$on','Otro usuario esta cambiando los datos de este ventana');
		
	CASE 100
//		messagebox('Atenc$$HEX1$$ed00$$ENDHEX$$on','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos. Se necesita actualizarlos');
	CASE ELSE
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Error desconocido. No se han podido actualizar los datos ');
	END CHOOSE
	return exstatus;
end if 

long li=1;
IF ii_indice <> 0 THEN li = ii_indice

DO WHILE li < li_max
	if s_elements[li].free then
		s_elements[li].free = FALSE
		s_elements[li] = pelement
		ii_indice = li + 1
		exit;
	end if	
	li++;
LOOP

return 0;

end function

public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey, datetime f_actual);/////////////////////////////////////////////////////////////////////////
//	05/11/99			FDO		Original. Para multiusuario acceso.
/////////////////////////////////////////////////////////////////////////

string sqltext;
long   exstatus;
s_element pelement;


pelement.powerobject	= 	ppowerobject
pelement.table 		=	ptable
pelement.primarykey 	=	primarykey
pelement.f_Actual 	=	f_actual
pelement.status 		=  0
pelement.bloq_con_sqlcpropio = FALSE


exstatus = uf_execute (pelement, FALSE);

if exstatus <> 0 then 
	
	CHOOSE CASE exstatus 
			
		CASE -54
			messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este registro.');
		CASE -55
			messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Este registro ya est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado en otra ventana del sistema');
			exstatus=-54
		CASE 100
	//		messagebox('Atenc$$HEX1$$ed00$$ENDHEX$$on','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos. Se necesita actualizarlos');
		CASE -2
			messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario actualiz$$HEX2$$f3002000$$ENDHEX$$los datos mientras Ud. realizaba otra tarea. La ventana se refrescar$$HEX2$$e1002000$$ENDHEX$$autom$$HEX1$$e100$$ENDHEX$$ticamente.');
		CASE ELSE
//			messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','No se puede seguir actualizando los datos ');
			
	END CHOOSE
	
	return exstatus;

end if 

long li=1;
IF ii_indice <> 0 THEN li = ii_indice
DO WHILE li < li_max
	if s_elements[li].free then
		s_elements[li].free = FALSE
		s_elements[li] = pelement
		ii_indice = li + 1
		exit;
	end if	
	li++;
LOOP

return 0;

end function

public subroutine uf_borra_rowid ();int indice

for indice= 1 to upperbound(is_rowid)
	setnull(is_rowid[indice])	
next
end subroutine

public function integer uf_inserta_rowid (string ps_rowid);/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : uf_inserta_rowid 
//
//  Argumentos : ps_rowid --> rowid a insertar / buscar
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Inserta el nuevo rowid o si ya existe devuelve 0 
//	
//
//  Valores de retorno :  1 --> Inserta
//								  0 --> Ya existe
//
//  Realizado por Alfonso Coto
//
//  Fecha : 05/07/2000	Uni$$HEX1$$f300$$ENDHEX$$n Fenosa - International Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


int li_indice

for li_indice= 1 to upperbound(is_rowid)
	if not isnull(is_rowid[li_indice]) and  (is_rowid[li_indice]=ps_rowid) then 
		// ENCONTRADO ROWID LUEGO YA ESTABA BLOQUEADO
		return 0
	end if
next



// NO SE HA ENCONTRADO LO INSERTAMOS
for li_indice= 1 to upperbound(is_rowid)
	if isnull(is_rowid[li_indice]) then // ESTA EL HUECO VACIO
		exit
	end if
next


is_rowid[li_indice]= ps_rowid
return 1
end function

public function integer uf_lock (boolean pb_bloq_con_sqlcb, readonly powerobject ppowerobject, string ptable, string primarykey);/////////////////////////////////////////////////////////////////////////
//	05/11/99			LFE		Original. 
//	
// Funci$$HEX1$$f300$$ENDHEX$$n empleada para bloquear registros sobre un objeto transacci$$HEX1$$f300$$ENDHEX$$n
// diferente al empleado en los bloqueos gen$$HEX1$$e900$$ENDHEX$$ricos.
//
/////////////////////////////////////////////////////////////////////////

string sqltext;
long   exstatus;
s_element pelement;


pelement.powerobject	= 	ppowerobject
pelement.table 		=	ptable
pelement.primarykey 	=	primarykey
pelement.status 		=  0
setnull(pelement.f_Actual)
pelement.bloq_con_sqlcpropio = pb_bloq_con_sqlcb

exstatus = uf_execute (pelement, pb_bloq_con_sqlcb);

if exstatus <> 0 then 
	CHOOSE CASE exstatus 
	CASE -54
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este registro');
	CASE -55
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Este registro ya est$$HEX2$$e1002000$$ENDHEX$$siendo actualizado en otra ventana del sistema');
		exstatus=-54
	CASE 100
//		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Otro usuario borr$$HEX2$$f3002000$$ENDHEX$$los datos. Actualice la ventana');
	CASE ELSE
		messagebox('Atenci$$HEX1$$f300$$ENDHEX$$n','Error desconocido. No se han podido actualizar los datos ');
	END CHOOSE
	return exstatus;
end if 

long li=1;

IF ii_indice <> 0 THEN li = ii_indice
DO WHILE li < li_max
	if s_elements[li].free then
		s_elements[li].free = FALSE
		s_elements[li] = pelement
		ii_indice = li + 1
		exit;
	end if	
	li++;
LOOP

return 0;

end function

protected function integer uf_execute (ref s_element pelement, boolean pb_bloq_con_sqlcb);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Original. Para multiusuario acceso.Oracle specific. 
//									Necesita cambias para otros DBMS	
//	30/12/99			FDO		Modificacion. Para multiusuario acceso.Cuando se ha modificado 
//									el registro por el que se consulta.	
/////////////////////////////////////////////////////////////////////////

long 		longvalue;
string ls_rowid
string 	sqlstring;
datetime	ldt_f_actual
DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;


//AHM (23/05/2008)
uf_cargaIncidenciasRowid()			//Carga de los identificadores de fila

// SI ES UNA PANTALLA DONDE HAY QUE TENER EN CUENTA SI EL REGISTRO HA CAMBIADO (PELEMENT.
// F_ACTUAL NO SERA NULO), ES NECESARIO TENER EN CUENTA LA F_ACTUAL, SI POR EL CONTRARIO
// NO ES ASI, RECUPERAMOS EL REGISTRO GENERICO 0

if not isvalid(sqlcpropio) then
	uf_inicializar_transaccion()
end if

IF NOT ISNULL(pelement.f_Actual) THEN

	sqlstring = "SELECT 0,rowidtochar(rowid),f_actual FROM "  + pelement.table + "  WHERE " + &
										pelement.primarykey + ' FOR UPDATE NOWAIT ';
ELSE
	
	sqlstring = "SELECT 0, rowidtochar(rowid) FROM "  + pelement.table + "  WHERE " + &
										pelement.primarykey + ' FOR UPDATE NOWAIT ';	
END IF

IF pb_bloq_con_sqlcb = TRUE THEN
	PREPARE SQLSA FROM :sqlstring USING sqlcpropio;
ELSE
	PREPARE SQLSA FROM :sqlstring;
END IF
OPEN DYNAMIC my_cursor ;

IF pb_bloq_con_sqlcb = TRUE THEN
	if sqlcpropio.sqlcode <> 0 then 
		if sqlcpropio.sqlcode = -1 and sqlcpropio.sqldbcode=54 then 
			return -54;
		end if	
		return  -1;
	end if	
ELSE
	if sqlca.sqlcode <> 0 then 
		if sqlca.sqlcode = -1 and sqlca.sqldbcode=54 then 
			return -54;
		end if	
		return  -1;
	end if	
END IF

IF NOT ISNULL(pelement.f_Actual) THEN

	FETCH my_cursor INTO :longvalue,:ls_rowid,:ldt_f_actual;
	
ELSE
	
	FETCH my_cursor INTO :longvalue, :ls_rowid;
	
END IF

IF pb_bloq_con_sqlcb = TRUE THEN
	if sqlcpropio.sqlcode = 100 then 
		close my_cursor;
		return 100;
	END IF
ELSE
	if sqlca.sqlcode = 100 then 
		close my_cursor;
		return 100;
	end if	
END IF

if not ISNULL(pelement.f_Actual) and pelement.f_Actual <> ldt_f_actual then
	close my_cursor;
	return -2;
	// el registro cambio entre el select y el update
end if
close my_cursor;
if uf_inserta_rowid(ls_rowid)=0 then return -55 // REGISTRO BLOQUEADO EN LA MISMA TRANSACCION
	
return 0;
end function

public function integer uf_commit (readonly powerobject ppowerobject, boolean pb_bloq_con_sqlcb);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Original.Para multiusuario acceso.									
//									Para liberar las filas cerradas de la ventana actual
//									cada UF_LOCK debe	que tener UF_COMMIT .
//									Para cerrar otra vez las filas liberadas 
//									cada COMMIT debe ser sustituido por este funci$$HEX1$$f300$$ENDHEX$$n 
/////////////////////////////////////////////////////////////////////////
IF pb_bloq_con_sqlcb = TRUE THEN
	if not isvalid(sqlcpropio) then
		uf_inicializar_transaccion()
	end if
	commit USING sqlcpropio;
ELSE
	commit;
END IF
uf_borra_rowid()
long li=1;

DO WHILE li < li_max
	if  not s_elements[li].free then
			if  s_elements[li].powerobject = ppowerobject  then
				s_elements[li].free = TRUE;
				IF ii_indice = 0 OR li < ii_indice THEN ii_indice = li
			else
				s_elements[li].status = uf_execute (s_elements[li], s_elements[li].bloq_con_sqlcpropio);
			end if;				
	end if;
	li++;
LOOP




return 1;
end function

public function integer uf_commit (readonly powerobject ppowerobject);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Original.Para multiusuario acceso.									
//									Para liberar las filas cerradas de la ventana actual
//									cada UF_LOCK debe	que tener UF_COMMIT .
//									Para cerrar otra vez las filas liberadas 
//									cada COMMIT debe ser sustituido por este funci$$HEX1$$f300$$ENDHEX$$n 
/////////////////////////////////////////////////////////////////////////
return uf_commit(ppowerobject, FALSE)
end function

public function integer uf_commit (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, boolean pb_bloq_con_sqlcb);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////
IF pb_bloq_con_sqlcb = TRUE THEN
	if not isvalid(sqlcpropio) then
		uf_inicializar_transaccion()
	end if
	commit USING sqlcpropio;
ELSE
	commit;
END IF
uf_borra_rowid();
long li=1;

DO WHILE li < li_max
	if not s_elements[li].free then
		if    s_elements[li].powerobject=ppowerobject &  
		    and  s_elements[li].table=ps_table &
			 and s_elements[li].primarykey=ps_primarykey then
			s_elements[li].free = TRUE;
			IF ii_indice = 0 OR li < ii_indice THEN ii_indice = li
		else
			s_elements[li].status = uf_execute (s_elements[li], s_elements[li].bloq_con_sqlcpropio);
		end if;
	end if;	
	li++;
LOOP
return 1;
end function

public function integer uf_commit (readonly powerobject ppowerobject, string ps_table, string ps_primarykey);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////

return uf_commit(ppowerobject, ps_table, ps_primarykey, FALSE)
end function

public function integer uf_inicializar_transaccion ();// Funci$$HEX1$$f300$$ENDHEX$$n que inicializa el objeto transacci$$HEX1$$f300$$ENDHEX$$n sqlcpropio. Este objeto de transacci$$HEX1$$f300$$ENDHEX$$n
// se emplea cuando no se quiere ejecutar un commit o un rollback sobre sqlca en el
// momento de desbloquear un registro

sqlcpropio = CREATE transaction

sqlcpropio.DBMS       = sqlca.DBMS
sqlcpropio.logid      = sqlca.logid
sqlcpropio.logpass    = sqlca.logpass
sqlcpropio.database   = sqlca.database
sqlcpropio.servername = sqlca.servername
sqlcpropio.dbparm     = sqlca.dbparm
CONNECT USING sqlcpropio;

return 1
end function

public function integer uf_rollback (readonly powerobject ppowerobject, boolean pb_bloq_con_sqlcb);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////
IF pb_bloq_con_sqlcb = TRUE THEN
	if not isvalid(sqlcpropio) then
		uf_inicializar_transaccion()
	end if
	rollback using sqlcpropio;
ELSE
	rollback;
END IF
uf_borra_rowid();
long li=1;

DO WHILE li < li_max
	if not s_elements[li].free then
		if  s_elements[li].powerobject = ppowerobject then
			s_elements[li].free = TRUE;
			IF ii_indice = 0 OR li < ii_indice THEN ii_indice = li
		else
			s_elements[li].status = uf_execute (s_elements[li], s_elements[li].bloq_con_sqlcpropio);
		end if;
	end if;	
	li++;
LOOP




return 1;
end function

public function integer uf_rollback (readonly powerobject ppowerobject);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////
return uf_rollback(ppowerobject, FALSE)
end function

public function integer uf_rollback (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, boolean pb_bloq_con_sqlcb);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////
IF pb_bloq_con_sqlcb = TRUE THEN
	if not isvalid(sqlcpropio) then
		uf_inicializar_transaccion()
	end if
	rollback using sqlcpropio;
ELSE
	rollback;
END IF

uf_borra_rowid();
long li=1;

DO WHILE li < li_max
	if not s_elements[li].free then
		if    s_elements[li].powerobject=ppowerobject &  
		    and  s_elements[li].table=ps_table &
			 and s_elements[li].primarykey=ps_primarykey then
			s_elements[li].free = TRUE;
			IF ii_indice = 0 OR li < ii_indice THEN ii_indice = li
		else
			s_elements[li].status = uf_execute (s_elements[li], s_elements[li].bloq_con_sqlcpropio);
		end if;
	end if;	
	li++;
LOOP




return 1;
end function

public function integer uf_rollback (readonly powerobject ppowerobject, string ps_table, string ps_primarykey);/////////////////////////////////////////////////////////////////////////
//	05/11/99			DSA		Para multiusuario acceso
/////////////////////////////////////////////////////////////////////////
return uf_rollback(ppowerobject, ps_table, ps_primarykey, FALSE)
end function

public function integer uf_lock_brigada (long pl_nro_brigada);String ls_usuario_bloqueo, ls_programa, ls_mensaje

if not isvalid(sqlcpropio) then
	uf_inicializar_transaccion()
end if

UPDATE GI_BRIGADA
SET IND_BLOQUEO = 1,
	 USUARIO_BLOQUEO = :gs_usuario,
	 PROGRAMA_BLOQUEO = 'SGI'
WHERE NRO_BRIGADA = :pl_nro_brigada 
USING SQLCPropio;

IF SQLCPropio.SQLCODE <> 0 THEN
	SELECT NVL(USUARIO_BLOQUEO, 'Desconocido'), NVL(PROGRAMA_BLOQUEO, 'Desconocido')
	INTO :ls_usuario_bloqueo, :ls_programa
	FROM GI_BRIGADA 
	WHERE
	NRO_BRIGADA = :pl_nro_brigada;
	
	IF SQLCA.SQLCode = 0 AND ls_usuario_bloqueo <> 'Desconocido' AND ls_programa <> 'Desconocido' THEN
		IF ls_usuario_bloqueo = gs_usuario THEN
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Esta brigada ya est$$HEX2$$e1002000$$ENDHEX$$siendo utilizada por el usuario en alguna ventana del sistema") 
		ELSE			
			ls_mensaje = "Esta brigada est$$HEX2$$e1002000$$ENDHEX$$siendo utilizada por el usuario " + ls_usuario_bloqueo
			IF ls_programa = 'SGI' THEN
				ls_mensaje = ls_mensaje + " desde el Open SGI"
			ELSE
				ls_mensaje = ls_mensaje + " desde Operaci$$HEX1$$f300$$ENDHEX$$n"
			END IF
			Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje)
		END IF
	ELSE
		Messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n", "Esta brigada est$$HEX2$$e1002000$$ENDHEX$$siendo utilizada por otro usuario")
	END IF
	
	This.uf_rollback(This, true)
	return -1
ELSE
	This.uf_commit(This, true)
	return SQLCPropio.SQLCode
END IF
	
end function

public function integer uf_unlock_brigada (long pl_nro_brigada);if not isvalid(sqlcpropio) then
	uf_inicializar_transaccion()
end if

UPDATE GI_BRIGADA
SET IND_BLOQUEO = 0,
	 USUARIO_BLOQUEO = NULL,
	 PROGRAMA_BLOQUEO = NULL
WHERE NRO_BRIGADA = :pl_nro_brigada
		AND PROGRAMA_BLOQUEO = 'SGI'
USING SQLCPropio;

IF SQLCPropio.SQLCODE <> 0 THEN
	This.uf_rollback(This, true)
	return -1
ELSE
	This.uf_commit(This, true)
	return SQLCPropio.SQLCode
END IF
	
end function

public function integer uf_lock (readonly powerobject ppowerobject, string ptable, string primarykey, integer pi_tipo_bloqueo, long pl_clave_bloqueo);/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: uf_lock (1.5)
//
// Objetivo: Realiza la distinci$$HEX1$$f300$$ENDHEX$$n cuando se manda un bloqueo entre bloqueos
//			   SGI (BD) y bloqueos con Operaci$$HEX1$$f300$$ENDHEX$$n (S.Operacion) 
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:   	ppowerobject
//						ptable
//						primarykey
//						pi_tipo_bloqueo
//						pl_clave_bloqueo
//
//        Salida:		Integer
//
// Devuelve: 1 si funciona
// 			   -1 si falla
//			   -2 si no se desea consultar la incidencia
//
// Fecha            	Responsable        Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         		-----------             	---------
// 11/05/2001	   	LFE - FDO			Creaci$$HEX1$$f300$$ENDHEX$$n 
//		
/////////////////////////////////////////////////////////// 

long ll_tip_incidencia, ll_alcance, ll_nro_instalacion,ll_cant_maniobras,ll_cant_int
int li_tension, li_tipo_instalacion, li_salida,li_est_inc,li_estado_red
string ls_mensaje_error
int li_longitud, li_posicion
string ls_usuario
								
if pi_tipo_bloqueo = fgci_bloqueo_incidencia THEN
	
	Select nvl(estado_red,0) into :li_estado_red from sgd_incidencia  where nro_incidencia=:pl_clave_bloqueo;

end if

IF NOT gb_operaciones OR li_estado_red=-10 THEN
	
	li_salida = uf_lock(ppowerobject,ptable,primarykey)
	
ELSE
	
	CHOOSE CASE pi_tipo_bloqueo
		
	CASE  fgci_bloqueo_incidencia
			// Determinar si la incidencia es del SGI o de OOP
	
			SELECT SGD_INCIDENCIA.TIP_INCIDENCIA, 
					 SGD_INCIDENCIA.ALCANCE, 
					 SGD_INCIDENCIA.TIP_TENSION,
					 NVL(SGD_INSTALACION.TIPO_INSTALACION,0),
					 SGD_INCIDENCIA.EST_ACTUAL
			INTO	:ll_tip_incidencia,
				  :ll_alcance,
				  :li_tension,
				  :li_tipo_instalacion,
				  :li_est_inc
			FROM SGD_INCIDENCIA, SGD_INSTALACION
			WHERE SGD_INCIDENCIA.NRO_INST_AFECTADA = SGD_INSTALACION.NRO_INSTALACION (+) AND
					SGD_INSTALACION.BDI_JOB (+) = 0 AND
					SGD_INCIDENCIA.NRO_INCIDENCIA = :pl_clave_bloqueo;
					
			IF SQLCA.SQLCode <> 0 THEN
				li_salida = -1
			ELSE
					
				IF ll_tip_incidencia <> fgci_incidencia_calidad and ll_alcance <> fgci_incidencia_de_suministro THEN
					// Incidencia imprevista, programada o de scada y no son de suministro
					
					IF li_tension <= gi_tension_nivel_min THEN 
						// El nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la incidencia tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
	
						IF (gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct) OR &
							(gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion = fgci_tipo_subestacion) THEN
						
							// LO METO AQUI
							IF gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct THEN
		
								IF li_est_inc > fgci_incidencia_pendiente OR ll_tip_incidencia <> fgci_incidencia_programada THEN
									// Como la instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT se comprueba si existen maniobras.
									// En caso de que existan la incidencia es de operaci$$HEX1$$f300$$ENDHEX$$n
									SELECT COUNT(*)
									INTO :ll_cant_maniobras
									FROM SGD_MANIOBRA
									WHERE NRO_INCIDENCIA = :pl_clave_bloqueo;
								
									IF SQLCA.SQLCode = 0 AND ll_cant_maniobras > 0 THEN
										IF gu_rf_servidor_operacion.of_bloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
											li_salida = -1
										END IF
									ELSE
										li_salida = uf_lock(ppowerobject,ptable,primarykey)
									END IF
									
								ELSE
									// Incidencia programada en estado pendiente cuya instalaci$$HEX1$$f300$$ENDHEX$$n afectada es un CT. 
									// Hay que comprobar si se han definido interrupciones  y el nivel de tensi$$HEX1$$f300$$ENDHEX$$n de 
									// $$HEX1$$e900$$ENDHEX$$stas.
									IF  ll_alcance = fgci_incidencia_sin_interrupcion THEN
										IF gu_rf_servidor_operacion.of_bloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
											li_salida = -1
										END IF
									ELSE
										SELECT COUNT(SGD_INTERRUPCION_DESCARGO.COD_INSTALACION) 
										INTO :ll_cant_int
										FROM SGD_INTERRUPCION_DESCARGO, SGD_DESCARGOS, SGD_INSTALACION
										WHERE SGD_DESCARGOS.NRO_INCIDENCIA = :pl_clave_bloqueo	AND
												SGD_DESCARGOS.NRO_DESCARGO = SGD_INTERRUPCION_DESCARGO.NRO_DESCARGO AND
												SGD_INTERRUPCION_DESCARGO.COD_INSTALACION = SGD_INSTALACION.NRO_INSTALACION AND
												SGD_INSTALACION.BDI_JOB = 0 AND
												SGD_INSTALACION.TENSION <= :gi_tension_nivel_min;
										
										IF SQLCA.SQLCode = 0 THEN
											li_salida = uf_lock(ppowerobject,ptable,primarykey)
										ELSE
											IF gu_rf_servidor_operacion.of_bloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
												li_salida = -1
											END IF
										END IF
										
									END IF
									
								END IF
								
							else
							
								li_salida = uf_lock(ppowerobject,ptable,primarykey)			
							END IF
						ELSE
							
							// Bloquear con la llamada al servidor de operaciones
							
							IF gu_rf_servidor_operacion.of_bloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
								IF ppowerobject = w_1234_consulta_incidencias or ppowerobject = w_1105_avisos_con_alim THEN
									IF pos(ls_mensaje_error,"BATCH",1) <> 0 then
										MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
										li_salida = -2
									ElseIF MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n",ls_mensaje_error + '. $$HEX1$$bf00$$ENDHEX$$Desea Consultar la Incidencia?',information!,yesno!) = 1 then
										li_salida = -1
									ELSE
										li_salida = -2
									END IF
								ELSE 								
									li_salida = -1
									MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
								END IF
							ELSE
								li_salida = 1
							END IF
							
						END IF
					ELSE
						// El nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la incidencia no tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
						// por lo que la ha dado de alta el SGI
						li_salida = uf_lock(ppowerobject,ptable,primarykey)						
					END IF
				ELSE
					li_salida = uf_lock(ppowerobject,ptable,primarykey)
				END IF
			END IF
				
		CASE fgci_bloqueo_ot
			
			// Si se trata de una OT sobre un aviso se bloquea con ORACLE. 
			// En cualquier otro caso se bloquea con el servidor de operaciones
			
			SELECT NVL(GI_OT.NRO_INSTALACION,0),
						SGD_INSTALACION.TIPO_INSTALACION,
						SGD_INSTALACION.TENSION
			INTO 	:ll_nro_instalacion,
				    	:li_tipo_instalacion,
				 	:li_tension
			FROM GI_OT,SGD_INSTALACION
			WHERE GI_OT.NRO_OT = :pl_clave_bloqueo and 
					GI_OT.NRO_INSTALACION = SGD_INSTALACION.NRO_INSTALACION(+) and 
					SGD_INSTALACION.BDI_JOB(+) = 0;
			
			IF SQLCA.SQLCode <> 0 THEN
				li_salida = -1
			ELSE
				IF ll_nro_instalacion = 0 THEN
					li_salida = uf_lock(ppowerobject,ptable,primarykey)
				ELSE
					// Se bloquea con el servidor de operaciones
					IF li_tension <= gi_tension_nivel_min THEN 
						// El nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la incidencia tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
						IF (gi_tension_nivel_min = fgci_media_tension AND li_tipo_instalacion = fgci_tipo_ct) OR &
							(gi_tension_nivel_min = fgci_alta_tension AND li_tipo_instalacion = fgci_tipo_subestacion) THEN
							// La OT la gestiona el SGI
							li_salida = uf_lock(ppowerobject,ptable,primarykey)						
						ELSE
							// Bloquear con la llamada al servidor de operaciones
							IF gu_rf_servidor_operacion.of_bloquea("GI_OT", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
								li_salida = -1
								MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
							ELSE
								li_salida = 1
							END IF
							
						END IF
					ELSE
						// El nivel de tensi$$HEX1$$f300$$ENDHEX$$n de la OT no tiene representaci$$HEX1$$f300$$ENDHEX$$n gr$$HEX1$$e100$$ENDHEX$$fica
						// por lo que la ha dado de alta el SGI
						li_salida = uf_lock(ppowerobject,ptable,primarykey)						
					END IF
				END IF
			END IF
					
		CASE fgci_bloqueo_descargo
			// El descargo siempre se bloquea a trav$$HEX1$$e900$$ENDHEX$$s del servidor de operaciones
			IF gu_rf_servidor_operacion.of_bloquea("SGD_DESCARGOS", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
				li_salida = -1
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
			ELSE
				li_salida = 1
			END IF
			
		//JME 03/05/09
		CASE fgci_bloqueo_disponibilidad
			IF gu_rf_servidor_operacion.of_bloquea("SGD_DISPONIBILIDAD", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
				li_salida = -1
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
			ELSE
				li_salida = 1
			END IF
		//Fin JME
			
			
	END CHOOSE
END IF

IF li_salida = 1 THEN
	return 0
ELSE
	return li_salida
END IF
end function

public function integer uf_commit (readonly powerobject ppowerobject, integer pi_tipo_bloqueo, long pl_clave_bloqueo);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: uf_commit (1.6)
//
// Objetivo:  Prueba a desbloquear con el servidor de operacion y si este no lo tiene registrado, 
//				desbloquea en base de datos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:   	ppowerobject
//						pi_tipo_bloqueo
//						pl_clave_bloqueo
//
//        Salida:		Integer
//
// Devuelve: 1 si funciona
// 			   -1 si falla
//
// Fecha            	Responsable        Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         		-----------             	---------
// 11/05/2001	   	LFE - FDO			Creaci$$HEX1$$f300$$ENDHEX$$n 
//		
/////////////////////////////////////////////////////////// 

long ll_tip_incidencia, ll_alcance, ll_nro_instalacion
int li_tension, li_tipo_instalacion, li_salida = 1
string ls_mensaje_error

li_salida = uf_commit(ppowerobject, FALSE)

If gb_operaciones = True then 
	CHOOSE CASE pi_tipo_bloqueo
		CASE  fgci_bloqueo_incidencia
			// Determinar si la incidencia es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_commit(ppowerobject, FALSE)
			END IF
				
		CASE  fgci_bloqueo_ot
			
			// Determinar si la ot es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("GI_OT", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_commit(ppowerobject, FALSE)
			END IF
			
		CASE  fgci_bloqueo_descargo
			// El descargo siempre se desbloquea a trav$$HEX1$$e900$$ENDHEX$$s del servidor de operaciones
			IF gu_rf_servidor_operacion.of_desbloquea("SGD_DESCARGOS", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
				li_salida = -1
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
			ELSE
				li_salida = 1
			END IF
	END CHOOSE

//ELSE // sgi
	
END IF

return li_salida

end function

public function integer uf_rollback (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, integer pi_tipo_bloqueo, long pl_clave_bloqueo);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: uf_rollback (1.6)
//
// Objetivo:  Prueba a desbloquear con el servidor de operacion y si este no lo tiene registrado, 
//				desbloquea en base de datos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:   	ppowerobject
//						ps_table
//						ps_primarykey
//						pi_tipo_bloqueo
//						pl_clave_bloqueo
//						
// 			
//        Salida:		Integer
//
// Devuelve: 1 si funciona
// 			   -1 si falla
//
// Fecha            	Responsable        Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         		-----------             	---------
// 11/05/2001	   	LFE - FDO			Creaci$$HEX1$$f300$$ENDHEX$$n 
//		
/////////////////////////////////////////////////////////// 

long ll_tip_incidencia, ll_alcance, ll_nro_instalacion
int li_tension, li_tipo_instalacion, li_salida = 1
string ls_mensaje_error

If gb_operaciones = True then 
	CHOOSE CASE pi_tipo_bloqueo
		CASE fgci_bloqueo_incidencia
			// Determinar si la incidencia es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_rollback(ppowerobject, ps_table, ps_primarykey, FALSE)
			ELSE
				uf_rollback(This, FALSE)
			END IF
				
		CASE fgci_bloqueo_ot
			
			// Determinar si la ot es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("GI_OT", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_rollback(ppowerobject, ps_table, ps_primarykey, FALSE)
			ELSE
				uf_rollback(This, FALSE)
			END IF
			
		CASE fgci_bloqueo_descargo
			// El descargo siempre se desbloquea a trav$$HEX1$$e900$$ENDHEX$$s del servidor de operaciones
			IF gu_rf_servidor_operacion.of_desbloquea("SGD_DESCARGOS", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
				li_salida = -1
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
			ELSE
				li_salida = 1
			END IF
			
			uf_rollback(This, FALSE)
	END CHOOSE

ELSE // sgi
	li_salida = uf_rollback(ppowerobject, ps_table, ps_primarykey, FALSE)
END IF

return li_salida

end function

public function integer uf_commit (readonly powerobject ppowerobject, string ps_table, string ps_primarykey, integer pi_tipo_bloqueo, long pl_clave_bloqueo);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: uf_commit (1.6)
//
// Objetivo:  Prueba a desbloquear con el servidor de operacion y si este no lo tiene registrado, 
//				desbloquea en base de datos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:   	ppowerobject
//						ps_table
//						ps_primarykey
//						pi_tipo_bloqueo
//						pl_clave_bloqueo
//						
// 			
//        Salida:		Integer
//
// Devuelve: 1 si funciona
// 			   -1 si falla
//
// Fecha            	Responsable        Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         	----------      	---------
// 11/05/2001	   	LFE - FDO			Creaci$$HEX1$$f300$$ENDHEX$$n 
//		
/////////////////////////////////////////////////////////// 

long ll_tip_incidencia, ll_alcance, ll_nro_instalacion
int li_tension, li_tipo_instalacion, li_salida = 1
string ls_mensaje_error

If gb_operaciones = True then 
	CHOOSE CASE pi_tipo_bloqueo
		CASE fgci_bloqueo_incidencia
			// Determinar si la incidencia es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_commit(ppowerobject, ps_table, ps_primarykey, FALSE)
			ELSE
				uf_commit(This, False)
			END IF
				
		CASE fgci_bloqueo_ot
			
			// Determinar si la ot es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("GI_OT", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_commit(ppowerobject, ps_table, ps_primarykey, FALSE)
			ELSE
				uf_commit(This, False)
			END IF
			
		CASE fgci_bloqueo_descargo
			// El descargo siempre se desbloquea a trav$$HEX1$$e900$$ENDHEX$$s del servidor de operaciones
			IF gu_rf_servidor_operacion.of_desbloquea("SGD_DESCARGOS", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
				li_salida = -1
				uf_rollback(This, False)
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
			ELSE
				uf_commit(This, False)
				li_salida = 1
			END IF
	END CHOOSE
	
ELSE // sgi
	li_salida = uf_commit(ppowerobject, ps_table, ps_primarykey, FALSE)
END IF

return li_salida

end function

public function integer uf_rollback (readonly powerobject ppowerobject, integer pi_tipo_bloqueo, long pl_clave_bloqueo);///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: uf_rollback (1.6)
//
// Objetivo:  Prueba a desbloquear con el servidor de operacion y si este no lo tiene registrado, 
//				desbloquea en base de datos
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada:   	ppowerobject
//						pi_tipo_bloqueo
//						pl_clave_bloqueo
//
//        Salida:		Integer
//
// Devuelve: 1 si funciona
// 			   -1 si falla
//
// Fecha            	Responsable        Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         		-----------             	---------
// 11/05/2001	   	LFE - FDO			Creaci$$HEX1$$f300$$ENDHEX$$n 
//		
/////////////////////////////////////////////////////////// 

long ll_tip_incidencia, ll_alcance, ll_nro_instalacion
int li_tension, li_tipo_instalacion, li_salida = 1
string ls_mensaje_error

li_salida = uf_rollback(ppowerobject, FALSE)

If gb_operaciones = True then 
	CHOOSE CASE pi_tipo_bloqueo
		CASE fgci_bloqueo_incidencia
			// Determinar si la incidencia es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("SGD_INCIDENCIA", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_rollback(ppowerobject, FALSE)
			END IF
				
		CASE fgci_bloqueo_ot
			
			// Determinar si la ot es del SGI o de OOP
			// Desbloquear con la llamada al servidor de operaciones
			 li_salida = gu_rf_servidor_operacion.of_desbloquea("GI_OT", pl_clave_bloqueo, ls_mensaje_error) 
			IF li_salida = 0 then
				li_salida = uf_rollback(ppowerobject, FALSE)
			END IF
			
		CASE fgci_bloqueo_descargo
			// El descargo siempre se desbloquea a trav$$HEX1$$e900$$ENDHEX$$s del servidor de operaciones
			IF gu_rf_servidor_operacion.of_desbloquea("SGD_DESCARGOS", pl_clave_bloqueo, ls_mensaje_error) = 0 THEN
				li_salida = -1
				MessageBox("Atenci$$HEX1$$f300$$ENDHEX$$n", ls_mensaje_error)
			ELSE
				li_salida = 1
			END IF
	END CHOOSE

//ELSE // sgi
	
END IF

return li_salida

end function

public function integer uf_unlock_brigadas_usuario ();/////////////////////////////////////////////////////////////////////////////////
//
//  Nombre : uf_unlock_brigadas_usuario
//
//  Argumentos : 
//													
//  Funci$$HEX1$$f300$$ENDHEX$$n:	Desbloquea las brigadas que se han quedado bloqueadas por el usuario en una ejecucion anterior
//	
//
//  Valores de retorno :  0 --> No se ha realizado la operacion correctamente.
//				  				  1 --> Correcto.
//
//  Realizado por Alfonso Coto
//
//  Fecha : 24/05/2001	Soluziona  Software Factory
//
/////////////////////////////////////////////////////////////////////////////////


UPDATE GI_BRIGADA
SET IND_BLOQUEO = 0,
	 USUARIO_BLOQUEO = NULL,
	 PROGRAMA_BLOQUEO = NULL
WHERE USUARIO_BLOQUEO = :gs_usuario AND
		IND_BLOQUEO = 1 AND
		PROGRAMA_BLOQUEO = 'SGI';
		
IF SQLCA.SQLCODE <> 0 THEN
	This.uf_rollback(This, true)
	return -1
ELSE
	This.uf_commit(This, true)
	return SQLCA.SQLCode
END IF
	
end function

public function integer uf_bloquea_avisos (datetime pf_actual, integer ptipo_bloqueo, long pnro_aviso);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_bloquear_Aviso
//
// Objetivo: Bloquea los avisos, permitiendo el ciertos casos que el triguer pase por encima de los bloqueos.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 	pf_actual, se le env$$HEX1$$ed00$$ENDHEX$$a la fecha actual para comprobar que otro usuario no haya modificado.
//					 	ptipo_bloqueo, con el tipo de bloqueo se controla cuando debe continuar ejecutandose el 
//						trigger y cuando no.
//						pnro_aviso, El nro de aviso que se pretende comprobar/bloquear.
//        Salida:		Retorna,  - 54 	si otro usuario esta bloqueando el registro.
//									 - 2 	si otro usuario cambi$$HEX2$$f3002000$$ENDHEX$$alg$$HEX1$$fa00$$ENDHEX$$n dato del registro.
//									 0 		si bloqueo correctamente.
//									 - 1	no fiuncion$$HEX2$$f3002000$$ENDHEX$$correctamente.
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 04/06/2001	    FDO
//		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

int li_ind_bloqueo
datetime ld_f_actual
string ls_descripcion,ls_usuario

// comprueba que el registro no lo tenga bloqueado nadie

Select ind_bloqueo, usuario_bloqueo into :li_ind_bloqueo,:ls_usuario
from gi_Avisos
where nro_aviso = :pnro_aviso for update nowait ;
			
	IF li_ind_bloqueo > 0 then
		
		   IF gi_traduccion = 1 THEN
				SELECT "SGD_VALOR"."DESCR_TRAD"  
					INTO :ls_descripcion  
				FROM "SGD_VALOR"  
				WHERE ( "SGD_VALOR"."CODIF" = 'B_AV' ) AND  
						( "SGD_VALOR"."CODIGO" = :li_ind_bloqueo )   ;
			ELSE
				SELECT "SGD_VALOR"."DESCRIPCION"  
					INTO :ls_descripcion  
				FROM "SGD_VALOR"  
				WHERE ( "SGD_VALOR"."CODIF" = 'B_AV' ) AND  
						( "SGD_VALOR"."CODIGO" = :li_ind_bloqueo )   ;
			END IF
		
		uf_rollback()
		
		// GNU 8-7-2007. Incidencia Elvis. Lo comento para que se muestre el mensaje y luego lo abra en modo consulta
		// GNU 14-3-2007. Incidencia 0/493456
//		IF gu_comunic.is_comunic.programa_llamante <> "w_1105_avi" and +&
//			gu_comunic.is_comunic.programa_llamante <> "w_1233_consulta_aviso" then
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El usuario " + ls_usuario + " est$$HEX2$$e1002000$$ENDHEX$$cambiando los datos de este aviso mediante " + ls_descripcion )
//		END IF
		return -54
	
	ELSEIF sqlca.sqlcode = -1 then
		
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El sistema de bloqueos produjo un error mediante su ejecuci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext )
		return -1
		
	ELSE
		
		
		  UPDATE "GI_AVISOS_INSTALACION"  
			  SET "IND_BLOQUEO" = :ptipo_bloqueo,
			  		"USUARIO_BLOQUEO" = :gs_usuario
			WHERE "GI_AVISOS_INSTALACION"."F_ACTUAL" = :pf_actual  and
						"GI_AVISOS_INSTALACION"."NRO_AVISO" = :pnro_aviso;

		  IF sqlca.sqlcode = -1 then
		
			this.uf_rollback()
			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El sistema de bloqueos produjo un error mediante su ejecuci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext )
			
		  	return -1
		  
		  END IF
			
		// Comprueba la fecha del registro para ver si alguien lo actualiz$$HEX2$$f3002000$$ENDHEX$$lo hace directamente con el update

		  UPDATE "GI_AVISOS"  
			  SET "IND_BLOQUEO" = :ptipo_bloqueo,
			  		"USUARIO_BLOQUEO" = :gs_usuario
			WHERE "GI_AVISOS"."F_ACTUAL" = :pf_actual  and
						"GI_AVISOS"."NRO_AVISO" = :pnro_aviso;

			IF sqlca.sqlnrows = 0 then
				
				this.uf_rollback()
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El aviso ha sido actualizado por otro usuario.")
				return - 2
			
			ELSEIF sqlca.sqlcode = -1 then
		
				this.uf_rollback()
				messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El sistema de bloqueos produjo un error mediante su ejecuci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext )
				return -1
				
			ELSE
				
				this.uf_commit()
				
			END IF
			
	END IF

RETURN 0	

end function

public function integer uf_desbloquea_avisos (long pnro_aviso, integer paccion);//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_desbloquea_Avisos
//
// Objetivo:	Desbloquea los avisos, comprobando si el trigger dej$$HEX2$$f3002000$$ENDHEX$$sin actualizar bloqueos. Si ocurri$$HEX2$$f3002000$$ENDHEX$$as$$HEX2$$ed002000$$ENDHEX$$se actualizar$$HEX1$$e100$$ENDHEX$$n 
//                si el usuario decide hacer rollback.
//         
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Entrada: 	pnro_aviso, El nro de aviso que se pretende desbloquear
//						accion, 1 si hace commit
//								, 2 si hace rollback
//        Salida:		Retorna,   0 	si desbloqueo correctamente.
//									 - 1	no funcion$$HEX2$$f3002000$$ENDHEX$$correctamente.
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 04/06/2001	    FDO
//		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

int li_retorno
long ll_nro_incidencia,ll_nro_instalacion
datetime ld_fecha_resol,ldt_f_actual

ldt_f_actual= fgnu_fecha_actual()

IF paccion= 1 then
	
	// simplemente va a hacer un commit y va a desbloquear el aviso.
	
	li_retorno = uf_graba_desbloqueo_av(pnro_aviso) 
	uf_commit()
	
	return li_retorno
	
else
	
//Compruebo si para el aviso especificado hay que recuperar los datos

  SELECT "GI_AVISOS"."NRO_INC_TRIGGER",   
			  "GI_AVISOS"."F_RESOL_TRIGGER",
			  "GI_AVISOS"."INSTALACION_CON_INT"
	 INTO :ll_nro_incidencia,   
			:ld_fecha_resol,
			:ll_nro_instalacion
	 FROM "GI_AVISOS"  
	WHERE "GI_AVISOS"."NRO_AVISO" = :pnro_aviso   ;

	IF sqlca.sqlcode = -1 then
	
		messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El sistema de bloqueos produjo un error mediante su ejecuci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext )
		this.uf_rollback()
		
	Elseif sqlca.sqlcode = 100 or (isnull(ll_nro_incidencia) or ll_nro_incidencia = 0) and isnull(ld_fecha_resol) then
		
		// simplemente va a hacer un rollback y va a desbloquear el aviso.
		uf_rollback()
		li_retorno = uf_graba_desbloqueo_av(pnro_aviso) 
		uf_commit()
		
		return li_retorno
	
	Else
		
		IF not isnull(ll_nro_incidencia) and isnull(ld_fecha_resol) then
			
			uf_rollback()
			
			// Pueden producirse dos cosas 1$$HEX2$$aa002000$$ENDHEX$$el aviso se ha asociado a una incidencia
			
			 UPDATE "GI_AVISOS" 
				 SET "EST_AVISO" = :fgci_aviso_asociado, 
				  "NRO_INCIDENCIA" = :ll_nro_incidencia, 
				  "IND_INC_ASOC" = 1, 
				  "F_ACTUAL" = :ldt_f_actual,
				  "NRO_INC_TRIGGER" = 0,   
			  	  "GI_AVISOS"."F_RESOL_TRIGGER" = null,
			  	  "GI_AVISOS"."INSTALACION_CON_INT" = 0,
				  "GI_AVISOS"."USUARIO" = :gs_usuario,
				  "GI_AVISOS"."PROGRAMA" = 'AS_SIS_BL' 
				 WHERE GI_AVISOS.NRO_AVISO = :pnro_aviso ;
				 
			 UPDATE "GI_AVISOS_INSTALACION" 
				 SET "EST_AVISO" = :fgci_aviso_asociado, 
				  "F_ACTUAL" = :ldt_f_actual,
				  "GI_AVISOS_INSTALACION"."USUARIO" = :gs_usuario,
				  "GI_AVISOS_INSTALACION"."PROGRAMA" = 'AS_SIS_BL' 
				 WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :pnro_aviso ;
				 
			UPDATE "GI_AVISOS_INSTALACION" 
				 SET  "INSTALACION_CON_INT" = 1
				 WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :pnro_aviso and
				  "GI_AVISOS_INSTALACION"."NRO_INSTALACION" =  :ll_nro_instalacion;
				
			li_retorno = uf_graba_desbloqueo_av(pnro_aviso) 
			
			uf_commit()
		
			return li_retorno		 
			
		ELSEIF not isnull(ll_nro_incidencia) and not isnull(ld_fecha_resol) then
			
			uf_rollback()
			
			//2$$HEX2$$aa002000$$ENDHEX$$el aviso se ha resuelto por una incidencia
			
			UPDATE "GI_AVISOS" 
			 SET "EST_AVISO" = :fgci_aviso_resuelto, 
			 "NRO_INCIDENCIA" = :ll_nro_incidencia, 
			 "FECHA_RES" =  :ld_fecha_resol, 
			 "HORA_RES" = :ld_fecha_resol , 
			 "F_ACTUAL" = :ldt_f_actual,
			 "NRO_INC_TRIGGER" = 0,   
			 "GI_AVISOS"."F_RESOL_TRIGGER" = null,
			 "GI_AVISOS"."INSTALACION_CON_INT" = 0,
			 "GI_AVISOS"."USUARIO" = :gs_usuario,
			 "GI_AVISOS"."PROGRAMA" = 'RES_SIS_BL' 
			 WHERE GI_AVISOS.NRO_AVISO = :pnro_aviso ;
			 
			 DELETE "GI_AVISOS_INSTALACION" 
				 WHERE GI_AVISOS_INSTALACION.NRO_AVISO = :pnro_aviso ;
			
			li_retorno = uf_graba_desbloqueo_av(pnro_aviso) 
			
			uf_commit()
		
			return li_retorno		 
			
		ELSE

			messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El trigger no grab$$HEX2$$f3002000$$ENDHEX$$los datos requeridos." )
			
			// El trigger no ha grabado correctamente los datos
		
			uf_rollback()
			li_retorno = uf_graba_desbloqueo_av(pnro_aviso) 
			uf_commit()
	
			return li_retorno
	
			
		END IF
		
	END IF			
	
END IF
			
return 1
end function

public function integer uf_graba_desbloqueo_av (long pnro_aviso);UPDATE "GI_AVISOS"  
	SET "IND_BLOQUEO" = 0, 
		   "USUARIO_BLOQUEO" = '',				  
			"NRO_INC_TRIGGER" = 0,   
			"F_RESOL_TRIGGER" = null,
			"INSTALACION_CON_INT" = 0
	WHERE 	"GI_AVISOS"."NRO_AVISO" = :pnro_aviso;

UPDATE "GI_AVISOS_INSTALACION"  
	SET "IND_BLOQUEO" = 0, 
		   "USUARIO_BLOQUEO" = ''
	WHERE 	"GI_AVISOS_INSTALACION"."NRO_AVISO" = :pnro_aviso;

IF sqlca.sqlcode = -1 then
	
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El sistema de bloqueos produjo un error mediante su ejecuci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext )
	this.uf_rollback()				
	return -1
end if

return 0
end function

public function integer uf_desbloquea_av_usuario ();//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Funci$$HEX1$$f300$$ENDHEX$$n/Evento: of_desbloquea_Avisos_usuario
//
// Objetivo:	Desbloquea los avisos, pendientes al cerrar el sistema
// Ambito:  P$$HEX1$$fa00$$ENDHEX$$blico
//
// Par$$HEX1$$e100$$ENDHEX$$metros:
//
//        Salida:		Retorna,   0 	si desbloqueo correctamente.
//									 - 1	no funcion$$HEX2$$f3002000$$ENDHEX$$correctamente.
//
// Devuelve: 
//
// Fecha            Responsable             Actuaci$$HEX1$$f300$$ENDHEX$$n
// --------         -----------             ---------
// 04/06/2001	    FDO
//		
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// 

UPDATE "GI_AVISOS_INSTALACION"  
	SET "IND_BLOQUEO" = 0, 
		   "USUARIO_BLOQUEO" = ''
	WHERE 	 "USUARIO_BLOQUEO" = :gs_usuario;

UPDATE "GI_AVISOS"  
	SET "IND_BLOQUEO" = 0, 
		   "USUARIO_BLOQUEO" = ''
	WHERE 	 "USUARIO_BLOQUEO" = :gs_usuario;


IF sqlca.sqlcode = -1 then
	
	messagebox("Atenci$$HEX1$$f300$$ENDHEX$$n","El sistema de bloqueos produjo un error mediante su ejecuci$$HEX1$$f300$$ENDHEX$$n: " + sqlca.sqlerrtext )
	this.uf_rollback()				
	return -1

ELSE
	
	this.uf_commit()			

END IF

return 0


end function

public function integer uf_cargaincidenciasrowid ();/*
Descripci$$HEX1$$f300$$ENDHEX$$n : Carga los identificadores de fila de las incidencias bloqueadas
Devuelve	: 1
						Autor										Fecha
						
Creaci$$HEX1$$f300$$ENDHEX$$n	:		Ana Mar$$HEX1$$ed00$$ENDHEX$$a Huertas Miguel$$HEX2$$e100f100$$ENDHEX$$ez		22/05/2008
*/

int		li_posicion				//Posici$$HEX1$$f300$$ENDHEX$$n siguiente a rellenar en el array que contiene los identificadores de fila
long		ll_cantidad				//N$$HEX1$$fa00$$ENDHEX$$mero de incidencias 
long		ll_nroIncidencia		//N$$HEX1$$fa00$$ENDHEX$$mero de incidencia
string	ls_idFila				//Identificador de la fila de la incidencia en la tabla SGD_INCIDENCIA


li_posicion = 1;

//Cursor que almacena los n$$HEX1$$fa00$$ENDHEX$$mero de incidencias que est$$HEX1$$e100$$ENDHEX$$n bloqueadas
DECLARE lc_incidencias_bloqueadas CURSOR FOR 
	(SELECT nro_incidencia
	 FROM 	 gi_ip_sgi
	 WHERE  nro_incidencia > 0)
USING SQLCA ;


uf_borra_rowid()						//Inicializa la variable rowid

OPEN lc_incidencias_bloqueadas;
FETCH lc_incidencias_bloqueadas INTO :ll_nroIncidencia;

DO WHILE sqlca.sqlcode=0 
	
	SELECT count(*)
	INTO   :ll_cantidad
	FROM SGD_INCIDENCIA
	WHERE NRO_INCIDENCIA = :ll_nroIncidencia;
	
	IF ll_cantidad > 0 THEN			//Hay un registro en la tabla con ese nro_incidencia
	
		//Obtenci$$HEX1$$f300$$ENDHEX$$n del id de la fila de la incidencia en la tabla SGD_INCIDENCIA
		SELECT rowidtochar(rowid)
		INTO :ls_idFila
		FROM SGD_INCIDENCIA  
		WHERE NRO_INCIDENCIA = :ll_nroIncidencia;
		
	END IF

	is_rowid[li_posicion] = ls_idFila	//Asignacion del id de la fila
	li_posicion++
	
	FETCH lc_incidencias_bloqueadas INTO :ll_nroIncidencia;

LOOP

ClOSE lc_incidencias_bloqueadas;



RETURN 1
end function

public function integer uf_lock_disponibilidad (long pl_nroincidencia);/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : bloquea las disponibilidades										     */
/*	Argumentos  :	pl_nroIncidencia -> n$$HEX1$$fa00$$ENDHEX$$mero de incidencia.							  */
/* Devuelve    :  1 correcto																	  */
/*					  -1 incorrecto																  */
/*					Autor					Fecha							Accion					  */
/*				  	 AHM             09/12/2009				  Creaci$$HEX1$$f300$$ENDHEX$$n					  */
/********************************************************************************/

long	ll_cont					// Contador del bucle que recorre las disponibilidades a bloquear
long	ll_rows					// N$$HEX1$$fa00$$ENDHEX$$mero de disponibilidades a bloquear
long	ll_activo				// C$$HEX1$$f300$$ENDHEX$$digo del activo a bloquear
long	ll_status				// Resultado del bloqueo de las disponibilidades
long	ll_return				// Valor que devuelve la funci$$HEX1$$f300$$ENDHEX$$n
string ls_mensaje				// Mensaje de error que devuelve el bloqueo

ll_return = 0

//Recuperaci$$HEX1$$f300$$ENDHEX$$n de los activos a bloquear
ids_activos.dataobject = "d_bloquear_activos_de_incidencia"
ids_activos.SetTransObject(SQLCA)
ids_activos.Retrieve(pl_nroIncidencia)

ll_rows = ids_activos.RowCount()

ll_status = 1 
ll_cont = 1

do while ( (ll_cont <= ll_rows) and (ll_return = 0 ) )
	ll_activo = ids_activos.object.nro_instalacion[ll_cont]

	ll_status = gu_rf_servidor_operacion.of_bloquea("SGD_DISPONIBILIDAD", ll_activo, ls_mensaje)
	if ll_status = 0 then 
		messagebox("", ls_mensaje, Exclamation!, ok!)	
		ll_return = -1
	end if
		
	ll_cont++

LOOP

return ll_return
end function

public function integer uf_desbloqueo_disponibilidades (datastore pds_datos);/********************************************************************************/
/* Descripci$$HEX1$$f300$$ENDHEX$$n : bloquea las disponibilidades										     */
/*	Argumentos  :	pds_datos -> n$$HEX1$$fa00$$ENDHEX$$mero de incidencia.									  */
/* Devuelve    :  1 correcto																	  */
/*					  -1 incorrecto																  */
/*					Autor					Fecha							Accion					  */
/*				  	 AHM             09/12/2009				  Creaci$$HEX1$$f300$$ENDHEX$$n					  */
/********************************************************************************/


long		ll_cont				// Variable de control del bucle
long		ll_rows				// N$$HEX1$$fa00$$ENDHEX$$mero de l$$HEX1$$ed00$$ENDHEX$$neas de disponibilidades
long		ll_activo			// N$$HEX1$$fa00$$ENDHEX$$mero de la instalaci$$HEX1$$f300$$ENDHEX$$n
long		ll_status			// Resultado del bloqueo
long		ll_return			// Valor que devuelve la funci$$HEX1$$f300$$ENDHEX$$n
string	ls_mensaje			// Mensaje de error del bloqueo

ll_rows = pds_datos.RowCount()

ll_status = 1 
ll_cont = 1

DO WHILE ( (ll_cont <= ll_rows) and (ll_return = 0 ) )
	ll_activo = pds_datos.object.nro_instalacion[ll_cont]

	ll_status = gu_rf_servidor_operacion.of_desbloquea("SGD_DISPONIBILIDAD", ll_activo, ls_mensaje)
	IF ll_status = 0 AND ls_mensaje <> 'Error. Disponibilidad no bloqueada' then 
		messagebox("", ls_mensaje, Exclamation!, ok!)
		ll_return = -1
	END IF
		
	
	ll_cont++

LOOP

RETURN ll_return
end function

on u_transaction.create
call super::create
TriggerEvent( this, "constructor" )
end on

on u_transaction.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//setnull(sqlcpropio)
this.uf_init();

//AHM (09/12/2009) Problemas con el bloqueo de disponibilidades
ids_activos = CREATE datastore

end event

event destructor;IF gb_usuario_correcto and isValid(sqlcpropio) THEN
	UPDATE "GI_USUARIO_SGI"  
	SET "F_ACTUAL" = sysdate,   
		 "ULTIMO_ORDENADOR" = NULL,   
		 "PUERTO" = NULL  
	WHERE "GI_USUARIO_SGI"."USUARIO" = :gs_usuario USING SQLCPROPIO;
	
	COMMIT USING SQLCPROPIO;
END IF

IF isValid(sqlcpropio) THEN
	rollback using sqlcpropio;
	disconnect using sqlcpropio;
	destroy sqlcpropio;
END IF

//AHM (09/12/2009) Problemas con el bloqueo de disponibilidades
IF isValid(ids_activos) THEN
	DESTROY(ids_activos)
END IF
end event


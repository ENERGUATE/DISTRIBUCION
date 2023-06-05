HA$PBExportHeader$u_man_0002_generico.sru
$PBExportComments$El Obeto basico para mantenimiento de la ventana w_man_0002_mantenimiento
forward
global type u_man_0002_generico from UserObject
end type
end forward

global type u_man_0002_generico from UserObject
int Width=1897
int Height=1272
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
end type
global u_man_0002_generico u_man_0002_generico

forward prototypes
public function long f_altura ()
public function long f_anchura ()
public function string f_titulo ()
public function long f_retrieve ()
end prototypes

public function long f_altura ();return this.height
end function

public function long f_anchura ();return this.width
end function

public function string f_titulo ();return ''
end function

public function long f_retrieve ();return 0
end function

on u_man_0002_generico.create
end on

on u_man_0002_generico.destroy
end on


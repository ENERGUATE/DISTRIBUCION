HA$PBExportHeader$u_gen_espere_arbol.sru
forward
global type u_gen_espere_arbol from UserObject
end type
type p_8 from picture within u_gen_espere_arbol
end type
type p_7 from picture within u_gen_espere_arbol
end type
type p_6 from picture within u_gen_espere_arbol
end type
type p_5 from picture within u_gen_espere_arbol
end type
type p_4 from picture within u_gen_espere_arbol
end type
type p_3 from picture within u_gen_espere_arbol
end type
type p_2 from picture within u_gen_espere_arbol
end type
type st_2 from statictext within u_gen_espere_arbol
end type
type st_1 from statictext within u_gen_espere_arbol
end type
type p_1 from picture within u_gen_espere_arbol
end type
type r_1 from rectangle within u_gen_espere_arbol
end type
end forward

global type u_gen_espere_arbol from UserObject
int Width=1659
int Height=440
boolean Border=true
long BackColor=67108864
long PictureMaskColor=536870912
long TabTextColor=33554432
long TabBackColor=67108864
p_8 p_8
p_7 p_7
p_6 p_6
p_5 p_5
p_4 p_4
p_3 p_3
p_2 p_2
st_2 st_2
st_1 st_1
p_1 p_1
r_1 r_1
end type
global u_gen_espere_arbol u_gen_espere_arbol

type variables
integer i_vez= 1
end variables

forward prototypes
public function integer fnu_cambia_bitmap ()
public subroutine fnu_resetea_objeto ()
end prototypes

public function integer fnu_cambia_bitmap ();st_2.text=st_2.text + "."

SETREDRAW(FALSE)

choose case i_vez
	case 1
		p_8.visible=false
		p_1.visible=true
	case 2
		p_1.visible=false
		p_2.visible=true
	case 3
		p_2.visible=false
		p_3.visible=true
	case 4
		p_3.visible=false
		p_4.visible=true
	case 5
		p_4.visible=false
		p_5.visible=true
	case 6
		p_5.visible=false
		p_6.visible=true
	case 7
		p_6.visible=false
		p_7.visible=true
	case 8
		p_7.visible=false
		p_8.visible=true
		st_2.text="Espere unos instantes"
		i_vez=0
end choose

SETREDRAW(TRUE)

YIELD()

i_vez ++

return 1

end function

public subroutine fnu_resetea_objeto ();p_1.visible=false
p_2.visible=false
p_3.visible=false
p_4.visible=false
p_5.visible=false
p_6.visible=false
p_7.visible=false
p_8.visible=false

st_2.text="Espere unos instantes"

end subroutine

on u_gen_espere_arbol.create
this.p_8=create p_8
this.p_7=create p_7
this.p_6=create p_6
this.p_5=create p_5
this.p_4=create p_4
this.p_3=create p_3
this.p_2=create p_2
this.st_2=create st_2
this.st_1=create st_1
this.p_1=create p_1
this.r_1=create r_1
this.Control[]={this.p_8,&
this.p_7,&
this.p_6,&
this.p_5,&
this.p_4,&
this.p_3,&
this.p_2,&
this.st_2,&
this.st_1,&
this.p_1,&
this.r_1}
end on

on u_gen_espere_arbol.destroy
destroy(this.p_8)
destroy(this.p_7)
destroy(this.p_6)
destroy(this.p_5)
destroy(this.p_4)
destroy(this.p_3)
destroy(this.p_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.p_1)
destroy(this.r_1)
end on

type p_8 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=571
int Height=316
boolean Visible=false
string PictureName="tree_8.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type p_7 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=576
int Height=312
boolean Visible=false
string PictureName="tree_7.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type p_6 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=581
int Height=256
boolean Visible=false
string PictureName="tree_6.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type p_5 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=576
int Height=188
boolean Visible=false
string PictureName="tree_5.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type p_4 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=576
int Height=188
boolean Visible=false
string PictureName="tree_4.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type p_3 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=590
int Height=124
boolean Visible=false
string PictureName="tree_3.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type p_2 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=453
int Height=60
boolean Visible=false
string PictureName="tree_2.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type st_2 from statictext within u_gen_espere_arbol
int X=777
int Y=252
int Width=873
int Height=68
boolean Enabled=false
string Text="Espere unos instantes..."
boolean FocusRectangle=false
long TextColor=8388608
long BackColor=67108864
int TextSize=-8
int Weight=700
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within u_gen_espere_arbol
int X=718
int Y=112
int Width=933
int Height=72
boolean Enabled=false
string Text="Desplegando ramas en el $$HEX1$$e100$$ENDHEX$$rbol de avisos."
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-8
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type p_1 from picture within u_gen_espere_arbol
int X=91
int Y=52
int Width=453
int Height=60
boolean Visible=false
string PictureName="tree_1.bmp"
boolean FocusRectangle=false
boolean OriginalSize=true
end type

type r_1 from rectangle within u_gen_espere_arbol
int X=59
int Y=20
int Width=635
int Height=392
boolean Enabled=false
int LineThickness=8
long LineColor=33554432
long FillColor=16777215
end type


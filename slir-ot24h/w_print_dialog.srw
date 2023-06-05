HA$PBExportHeader$w_print_dialog.srw
forward
global type w_print_dialog from Window
end type
type bmp_print from picture within w_print_dialog
end type
type em_nro_copias from editmask within w_print_dialog
end type
type cb_cancel from commandbutton within w_print_dialog
end type
type cb_print from commandbutton within w_print_dialog
end type
type p_2 from picture within w_print_dialog
end type
type p_1 from picture within w_print_dialog
end type
type st_1 from statictext within w_print_dialog
end type
type rb_vertical from radiobutton within w_print_dialog
end type
type rb_apaisado from radiobutton within w_print_dialog
end type
type gb_1 from groupbox within w_print_dialog
end type
end forward

global type w_print_dialog from Window
int X=1120
int Y=864
int Width=1408
int Height=688
boolean TitleBar=true
string Title="SGI - Print Dialog Box"
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=response!
event ue_imprimir pbm_custom60
bmp_print bmp_print
em_nro_copias em_nro_copias
cb_cancel cb_cancel
cb_print cb_print
p_2 p_2
p_1 p_1
st_1 st_1
rb_vertical rb_vertical
rb_apaisado rb_apaisado
gb_1 gb_1
end type
global w_print_dialog w_print_dialog

type variables
s_print  istr_imprimir
end variables

event ue_imprimir;Int 		li_cant_copias,i
Long 		Job,W
String 	ls_data


// Imprime el bitmap de la empresa.
//****  CAMBIO SGI 2000   *********


// Define the font for Job.
//****  CAMBIO SGI 2000   *********	IF rb_apaisado.Checked THEN
//****  CAMBIO SGI 2000   *********		PrintDefineFont(Job, 2, "Courier 10Cps",  &
//****  CAMBIO SGI 2000   *********		-20, 700, Default!, Modern!, FALSE,TRUE )
//****  CAMBIO SGI 2000   *********	ELSE
//****  CAMBIO SGI 2000   *********		PrintDefineFont(Job, 2, "Courier 10Cps",  &
//****  CAMBIO SGI 2000   *********		-16, 700, Default!, Modern!, FALSE,TRUE)
//****  CAMBIO SGI 2000   *********	END IF
	
// Set the font for Job.

//****  CAMBIO SGI 2000   ********PrintSetFont(Job, 2)

// Print the company name in the specified font.

//JHC CAMBIO SGI 2000 12/09/2000
// ||
//\\//
// \/
//IF istr_imprimir.parm1 THEN

//****  CAMBIO SGI 2000   *********	PrintBitmap(Job, "uf.bmp", 1,100, 750,750)
//****  CAMBIO SGI 2000   *********	PrintText(Job,istr_imprimir.titulo+" "+ string(Today()), 1000, 400)

	istr_imprimir.dwprint.Modify("DataWindow.Print.Copies = "+em_nro_copias.text)

	IF (rb_apaisado.Checked = true ) THEN
		istr_imprimir.dwprint.Modify("DataWindow.Print.Orientation=1")
		//JHC CAMBIO SGI 2000 12/09/2000
		// ||
		//\\//
		// \/
		istr_imprimir.dwprint.Modify("titulo.X='1200'")
		istr_imprimir.dwprint.Modify("subtitulo.X='1200'")
		// /\
		////\\
		// ||
		//JHC CAMBIO SGI 2000 12/09/2000
	ELSE
		istr_imprimir.dwprint.Modify("DataWindow.Print.Orientation=2")
		//JHC CAMBIO SGI 2000 12/09/2000
		// ||
		//\\//
		// \/
		istr_imprimir.dwprint.Modify("titulo.X='600'")
		istr_imprimir.dwprint.Modify("subtitulo.X='600'")
		// /\
		////\\
		// ||
		//JHC CAMBIO SGI 2000 12/09/2000
	END IF

//****  CAMBIO SGI 2000   *********istr_imprimir.dwprint.Modify("DataWindow.Print.Margin.Top=500")	
//****  CAMBIO SGI 2000   *********	PrintDataWindow( Job ,istr_imprimir.dwprint)
//istr_imprimir.dwprint.Print(Job,30,PrintY(Job)+500,7500,5000)	
	//****  CAMBIO SGI 2000   *********
	istr_imprimir.dwprint.Print()
	//****  CAMBIO SGI 2000   *********

//ELSE

//	Job = PrintOpen( )
//
//	FOR i=1 TO integer(em_nro_copias.text)
//		PrintBitmap(Job, "uf.bmp", 1,100, 750,750)
//   	PrintText(Job,istr_imprimir.titulo+" "+ string(Today()), 1000, 400)
//		istr_imprimir.grafprint.Print(Job,30,PrintY(Job)+500,7500,5000)
//		PrintPage(Job)	
//		PrintClose(Job)
//	NEXT

//END IF
// /\
////\\
// ||
//JHC CAMBIO SGI 2000 12/09/2000



bmp_print.visible = false
SetPointer(Arrow!)
Close (this)

end event

on w_print_dialog.create
this.bmp_print=create bmp_print
this.em_nro_copias=create em_nro_copias
this.cb_cancel=create cb_cancel
this.cb_print=create cb_print
this.p_2=create p_2
this.p_1=create p_1
this.st_1=create st_1
this.rb_vertical=create rb_vertical
this.rb_apaisado=create rb_apaisado
this.gb_1=create gb_1
this.Control[]={this.bmp_print,&
this.em_nro_copias,&
this.cb_cancel,&
this.cb_print,&
this.p_2,&
this.p_1,&
this.st_1,&
this.rb_vertical,&
this.rb_apaisado,&
this.gb_1}
end on

on w_print_dialog.destroy
destroy(this.bmp_print)
destroy(this.em_nro_copias)
destroy(this.cb_cancel)
destroy(this.cb_print)
destroy(this.p_2)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.rb_vertical)
destroy(this.rb_apaisado)
destroy(this.gb_1)
end on

event open;bmp_print.visible=False
em_nro_copias.Text="1"
rb_vertical.Checked=true

IF IsValid(message.PowerObjectParm) THEN
	//Llam$$HEX2$$f3002000$$ENDHEX$$con par$$HEX1$$e100$$ENDHEX$$metros
	istr_imprimir = message.PowerObjectParm
ELSE
	close(THIS)
END IF

IF Not istr_imprimir.parm1 THEN
	rb_apaisado.Enabled=False
	rb_vertical.Enabled=False
END IF



end event

type bmp_print from picture within w_print_dialog
int X=1010
int Y=4
int Width=215
int Height=176
string PictureName="print.bmp"
boolean FocusRectangle=false
end type

type em_nro_copias from editmask within w_print_dialog
int X=434
int Y=64
int Width=247
int Height=84
int TabOrder=10
Alignment Alignment=Right!
BorderStyle BorderStyle=StyleLowered!
string Mask="#"
boolean Spin=true
string DisplayData="H"
double Increment=1
string MinMax="1~~100"
long BackColor=33554431
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_cancel from commandbutton within w_print_dialog
int X=841
int Y=444
int Width=329
int Height=108
int TabOrder=30
string Text="&Cancelar"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Close (Parent)
end event

type cb_print from commandbutton within w_print_dialog
int X=178
int Y=444
int Width=306
int Height=108
int TabOrder=40
string Text="&Imprimir"
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;SetPointer(HourGlass!)
bmp_print.visible=TRUE
Parent.triggerEvent("ue_imprimir")






 
end event

type p_2 from picture within w_print_dialog
int X=731
int Y=248
int Width=137
int Height=128
string PictureName="script2.bmp"
boolean FocusRectangle=false
end type

type p_1 from picture within w_print_dialog
int X=137
int Y=248
int Width=146
int Height=120
string PictureName="script1.bmp"
boolean FocusRectangle=false
end type

type st_1 from statictext within w_print_dialog
int X=59
int Y=80
int Width=325
int Height=76
boolean Enabled=false
string Text="No. Copias"
Alignment Alignment=Right!
boolean FocusRectangle=false
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_vertical from radiobutton within w_print_dialog
int X=311
int Y=284
int Width=366
int Height=76
string Text="Vertical"
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Return 2
end event

type rb_apaisado from radiobutton within w_print_dialog
int X=887
int Y=248
int Width=370
int Height=140
string Text="Apaisada"
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;Return 1
end event

type gb_1 from groupbox within w_print_dialog
int X=41
int Y=180
int Width=1307
int Height=240
int TabOrder=20
string Text="Orientaci$$HEX1$$f300$$ENDHEX$$n"
long BackColor=79741120
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


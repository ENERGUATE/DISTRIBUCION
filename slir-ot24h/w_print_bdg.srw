HA$PBExportHeader$w_print_bdg.srw
forward
global type w_print_bdg from Window
end type
type st_1 from statictext within w_print_bdg
end type
type print_bmp from picture within w_print_bdg
end type
type cb_setup from commandbutton within w_print_bdg
end type
type cb_imprimir from commandbutton within w_print_bdg
end type
type gb_1 from groupbox within w_print_bdg
end type
type gb_2 from groupbox within w_print_bdg
end type
end forward

global type w_print_bdg from Window
int X=1134
int Y=840
int Width=1175
int Height=756
boolean TitleBar=true
long BackColor=79741120
boolean ControlMenu=true
WindowType WindowType=popup!
event ue_imprimir pbm_custom60
st_1 st_1
print_bmp print_bmp
cb_setup cb_setup
cb_imprimir cb_imprimir
gb_1 gb_1
gb_2 gb_2
end type
global w_print_bdg w_print_bdg

type variables
s_print  istr_imprimir
end variables

event ue_imprimir;long job

job = PrintOpen()
this.visible = false
w_bdg.setRedraw(false)
PrintDefineFont(Job, 2, "Courier 20Cps",-16, 700, Default!, Modern!, FALSE,TRUE)
PrintSetFont(Job, 2)

IF istr_imprimir.parm1 THEN
	PrintBitmap(Job, "uf.bmp", 1,100, 750,750)
	PrintText(Job,str_print.titulo+" "+ string(Today()), 1000, 400)
	istr_imprimir.dwprint.Modify("DataWindow.Print.Margin.Top=500")	
	w_bdg.setRedraw(true)
  	printDataWindow(job,str_print.dwprint)

ELSE
	PrintBitmap(Job, "uf.bmp", 1,100, 750,750)
	PrintText(Job,istr_imprimir.titulo+" "+ string(Today()), 1000, 400)
	w_bdg.setRedraw(true)	
	istr_imprimir.grafprint.Print(Job,30,PrintY(Job)+500,	7500,5000)
	
END IF

printClose(job)


Close(this)
end event

on w_print_bdg.create
this.st_1=create st_1
this.print_bmp=create print_bmp
this.cb_setup=create cb_setup
this.cb_imprimir=create cb_imprimir
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_1,&
this.print_bmp,&
this.cb_setup,&
this.cb_imprimir,&
this.gb_1,&
this.gb_2}
end on

on w_print_bdg.destroy
destroy(this.st_1)
destroy(this.print_bmp)
destroy(this.cb_setup)
destroy(this.cb_imprimir)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;IF IsValid(message.PowerObjectParm) THEN
	//Llam$$HEX2$$f3002000$$ENDHEX$$con par$$HEX1$$e100$$ENDHEX$$metros
	istr_imprimir = message.PowerObjectParm
ELSE
	close(THIS)
END IF

end event

type st_1 from statictext within w_print_bdg
int X=41
int Y=60
int Width=1047
int Height=76
boolean Enabled=false
string Text="Preparando trabajo para impresi$$HEX1$$f300$$ENDHEX$$n"
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type print_bmp from picture within w_print_bdg
int X=439
int Y=156
int Width=215
int Height=184
string PictureName="print.bmp"
boolean FocusRectangle=false
end type

type cb_setup from commandbutton within w_print_bdg
int X=686
int Y=428
int Width=306
int Height=108
int TabOrder=30
string Text="&Setup"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;SetPointer(HourGlass!)
PrintSetup()

end event

type cb_imprimir from commandbutton within w_print_bdg
int X=142
int Y=428
int Width=306
int Height=108
int TabOrder=10
string Text="&Imprimir"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;SetPointer(HourGlass!)
Parent.triggerEvent("ue_imprimir")
end event

type gb_1 from groupbox within w_print_bdg
int X=91
int Y=352
int Width=942
int Height=228
int TabOrder=20
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_2 from groupbox within w_print_bdg
int X=18
int Y=4
int Width=1102
int Height=612
int TabOrder=10
BorderStyle BorderStyle=StyleLowered!
long TextColor=33554432
long BackColor=67108864
int TextSize=-10
int Weight=700
string FaceName="Arial"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type


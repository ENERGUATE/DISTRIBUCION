HA$PBExportHeader$ue_1211_tab_consultas_suministro.sru
forward
global type ue_1211_tab_consultas_suministro from tab
end type
type suministro from userobject within ue_1211_tab_consultas_suministro
end type
type incidencias from userobject within ue_1211_tab_consultas_suministro
end type
type avisos from userobject within ue_1211_tab_consultas_suministro
end type
type interrupciones from userobject within ue_1211_tab_consultas_suministro
end type
type suministro from userobject within ue_1211_tab_consultas_suministro
end type
type incidencias from userobject within ue_1211_tab_consultas_suministro
end type
type avisos from userobject within ue_1211_tab_consultas_suministro
end type
type interrupciones from userobject within ue_1211_tab_consultas_suministro
end type
end forward

global type ue_1211_tab_consultas_suministro from tab
int Width=1673
int Height=872
int TabOrder=1
boolean RaggedRight=true
int SelectedTab=1
long BackColor=81324524
int TextSize=-10
int Weight=400
string FaceName="MS Sans Serif"
FontCharSet FontCharSet=Ansi!
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
suministro suministro
incidencias incidencias
avisos avisos
interrupciones interrupciones
end type
global ue_1211_tab_consultas_suministro ue_1211_tab_consultas_suministro

on ue_1211_tab_consultas_suministro.create
this.suministro=create suministro
this.incidencias=create incidencias
this.avisos=create avisos
this.interrupciones=create interrupciones
this.Control[]={this.suministro,&
this.incidencias,&
this.avisos,&
this.interrupciones}
end on

on ue_1211_tab_consultas_suministro.destroy
destroy(this.suministro)
destroy(this.incidencias)
destroy(this.avisos)
destroy(this.interrupciones)
end on

type suministro from userobject within ue_1211_tab_consultas_suministro
int X=18
int Y=112
int Width=1637
int Height=744
long BackColor=81324524
string Text="Suministro"
long TabBackColor=81324524
long TabTextColor=33554432
long PictureMaskColor=553648127
string PictureName="Picture!"
end type

type incidencias from userobject within ue_1211_tab_consultas_suministro
int X=18
int Y=112
int Width=1637
int Height=744
long BackColor=81324524
string Text="incidencias"
long TabBackColor=81324524
long TabTextColor=33554432
long PictureMaskColor=553648127
string PictureName="watcom!"
end type

type avisos from userobject within ue_1211_tab_consultas_suministro
int X=18
int Y=112
int Width=1637
int Height=744
long BackColor=81324524
string Text="avisos"
long TabBackColor=81324524
long TabTextColor=33554432
long PictureMaskColor=553648127
string PictureName="Custom020!"
end type

type interrupciones from userobject within ue_1211_tab_consultas_suministro
int X=18
int Y=112
int Width=1637
int Height=744
long BackColor=81324524
string Text="interrupciones"
long TabBackColor=81324524
long TabTextColor=33554432
long PictureMaskColor=553648127
string PictureName="incorpor.bmp"
end type


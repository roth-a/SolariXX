{-----------------------------------------------------------------------------
 Unit Name: Unit1
 Author:    Alexander Roth
 Date:      21-Jul-2006
 Lizenshinweise:
     Dieses Programm wurde geschrieben von Alexander Roth

    Dieses Programm ist freie Software. Sie können es unter den Bedingungen
    der GNU General Public License, wie von der Free Software Foundation
    veröffentlicht, weitergeben und/oder modifizieren, gemäß Version 2 der Lizenz.
 Description: Unit1 und damit die Unit um die Oberflächlichen Dinge zu regeln
-----------------------------------------------------------------------------}
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,math, ComCtrls, ExtCtrls, RSChartPanel, RSCharts,
  Grids, Menus,dateutils,StrUtils, JvExStdCtrls, JvButton, JvCtrls,
  JvListBox, JvExControls, JvComponent, JvEditorCommon, JvEditor,
  JvRichEdit, JvHLEditor, JvUnicodeEditor, JvMemo, ActnList, Mask,
  JvExMask, JvSpin, BMSpinEdit, JvExExtCtrls, JvExComCtrls, JvProgressBar;


type

  {-----------------------------------------------------------------------------
   Class:   TForm1
   Description:
  -----------------------------------------------------------------------------}
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    LHoehenwinkel: TLabel;
    Label10: TLabel;
    LHimmelsrichtung: TLabel;
    Label12: TLabel;
    LMaxBeta: TLabel;
    Label13: TLabel;
    LSunRise: TLabel;
    Label15: TLabel;
    LSunSet: TLabel;
    BAktuelleZeit: TButton;
    BBerechnen: TButton;
    Label14: TLabel;
    RSLineChart: TRSLineChart;
    RSChartPanel1: TRSChartPanel;
    BAzimut: TButton;
    BElevation: TButton;
    BElevationAzimut: TButton;
    RSSonnenaufgang: TRSLineChart;
    RSSonnenuntergang: TRSLineChart;
    RS0Line: TRSLineChart;
    JvImgBtn1: TJvImgBtn;
    GroupBoxFormel: TGroupBox;
    RadioMeine: TRadioButton;
    RadioWiki: TRadioButton;
    PopupMenu1: TPopupMenu;
    PopupSpeichereDatei: TMenuItem;
    SaveDialogDayCSV: TSaveDialog;
    MainMenu1: TMainMenu;
    Datei1: TMenuItem;
    SpeichereWertedesTages1: TMenuItem;
    SpeichereIniDatei1: TMenuItem;
    LeseIniDatei1: TMenuItem;
    SaveDialogINI: TSaveDialog;
    OpenDialogINI: TOpenDialog;
    TabSheet2: TTabSheet;
    ButtonSetting: TButton;
    Einstellungen1: TMenuItem;
    Info1: TMenuItem;
    about: TMenuItem;
    Version1: TMenuItem;
    Lizenzdetails1: TMenuItem;
    Hilfe1: TMenuItem;
    Update1: TMenuItem;
    BRelElevation: TButton;
    Label1: TLabel;
    Label2: TLabel;
    BEnergy: TButton;
    Label16: TLabel;
    LDayEnergy: TLabel;
    LDayEnergy2: TLabel;
    LYearEnergy: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    BYearEnergy: TButton;
    Panel: TPanel;
    BDayCalctoFile: TButton;
    BPanelShow: TButton;
    ListBoxDiagramm: TListBox;
    BYearCalctoFile: TButton;
    SaveDialogYearCSV: TSaveDialog;
    SpeichereWerteeinesJahres1: TMenuItem;
    BYearMaxElevation: TButton;
    Label3: TLabel;
    Label17: TLabel;
    LYearMaxElevation: TLabel;
    Label21: TLabel;
    LYearMinElevation: TLabel;
    Label22: TLabel;
    RichHelp3: TRichEdit;
    RichHelp1: TRichEdit;
    RichHelp2: TRichEdit;
    ActionList1: TActionList;
    AcHilfe: TAction;
    AcUpdate: TAction;
    AcInfo: TAction;
    AcVersion: TAction;
    AcLizenzdetails: TAction;
    AcLog: TAction;
    JvEDay: TJvSpinEdit;
    JvEMonth: TJvSpinEdit;
    JvEYear: TJvSpinEdit;
    JvEHour: TJvSpinEdit;
    JvEMinute: TJvSpinEdit;
    JvEsec: TJvSpinEdit;
    ListLog: TListBox;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    GroupBox1: TGroupBox;
    SpinEVon: TBMSpinEdit;
    Label20: TLabel;
    SpinEBis: TBMSpinEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    BOptimiere: TButton;
    Label30: TLabel;
    AcStop: TAction;
    JvProgressBarOpti: TJvProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure BDayCalctoFileClick(Sender: TObject);
    procedure BAktuelleZeitClick(Sender: TObject);
    procedure BBerechnenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BAzimutClick(Sender: TObject);
    procedure BElevationClick(Sender: TObject);
    procedure BElevationAzimutClick(Sender: TObject);
    procedure BPanelShowClick(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure RSChartPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeichereIniDatei1Click(Sender: TObject);
    procedure SaveDialogINICanClose(Sender: TObject;
      var CanClose: Boolean);
    procedure OpenDialogINICanClose(Sender: TObject;
      var CanClose: Boolean);
    procedure LeseIniDatei1Click(Sender: TObject);
    procedure ButtonSettingClick(Sender: TObject);
    procedure Einstellungen1Click(Sender: TObject);
    procedure aboutClick(Sender: TObject);
    procedure Version1Click(Sender: TObject);
    procedure Lizenzdetails1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Hilfe1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
    procedure BRelElevationClick(Sender: TObject);
    procedure BEnergyClick(Sender: TObject);
    procedure BYearEnergyClick(Sender: TObject);
    procedure BYearPanelShowClick(Sender: TObject);
    procedure BYearCalctoFileClick(Sender: TObject);
    procedure SaveDialogDayCSVCanClose(Sender: TObject;
      var CanClose: Boolean);
    procedure SaveDialogYearCSVCanClose(Sender: TObject;
      var CanClose: Boolean);
    procedure BYearMaxElevationClick(Sender: TObject);
    procedure ListLogChange(Sender: TObject);
    procedure RSChartPanel1Zoom(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupSpeichereDateiClick(Sender: TObject);
    procedure RSChartPanel1Unzoom(Sender: TObject);
    procedure RSChartPanel1Change(Sender: TObject);
    procedure AcLogExecute(Sender: TObject);
    procedure BOptimiereClick(Sender: TObject);
    procedure TabSheet4ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure AcStopExecute(Sender: TObject);
  private
    FLog:boolean;
    procedure writeFLog(value:boolean);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    property Log:boolean read FLog write writeFLog;     // Log listbox lasse ich mitlaufen
  end;


  {-----------------------------------------------------------------------------
   Class:   TUserSpecification
   Description:
  -----------------------------------------------------------------------------}
  TTimeSpecification=record
    BG,LG,
    Azi,Ele,
    time:real;
    day,month:byte;
    year:integer;
  end;


  {-----------------------------------------------------------------------------
   Class:   None
   Description:
  -----------------------------------------------------------------------------}
  TChartSettings=procedure(chart:TRSLineChart; BottomAxisIsTime:boolean=true) of object;



  {-----------------------------------------------------------------------------
   Class:   TDiagrammBerech
   Description:
  -----------------------------------------------------------------------------}
  TMinMaxReal=record
    Minimum,Maximum:real;
  end;

  {-----------------------------------------------------------------------------
   Class:   TDiagrammBerech
   Description:
  -----------------------------------------------------------------------------}
  TMinMaxInt=record
    Minimum,Maximum:integer;
  end;

  {-----------------------------------------------------------------------------
   Class:   TDiagrammBerech
   Description:
  -----------------------------------------------------------------------------}
  TSavingChartCol=record
    leftAxis:record
      Increment,Minimum,Maximum:real;
    end;
    BottomAxis:record
      Increment,Minimum,Maximum:real;
    end;
  end;


  {-----------------------------------------------------------------------------
   Class:   TUserSpecification
   Description:
  -----------------------------------------------------------------------------}
  TUserSpecification=class
  private
    { Private-Deklarationen }
    FTS:TTimeSpecification;
    FFormelMeine,FFormelWiki,FFixedPanel:boolean;
    FPercentClouds,    FZenitEnergy:real;  //in W/m^2
    FOptDay:TMinMaxInt;

    procedure writeFTS(value:TTimeSpecification);
    procedure writeFFormelMeine(value:boolean);
    procedure writeFFormelWiki(value:boolean);
  public
    { Public-Deklarationen }

    procedure CorrectAllEdits;
    procedure writeUptodateTimeDate;
    procedure getSpecification;

    function UTCtoSel(time:real):real;
    function SeltoUTC(time:real):real;

    function  TSDateTime:TDatetime;
    function  TSDate:TDate;
    function  TSTime:Ttime ;

    property  TS:TTimeSpecification read FTS write writeFTS;
    property  FormelMeine:boolean read FFormelMeine write writeFFormelMeine;
    property  FormelWiki:boolean read FFormelWiki write writeFFormelWiki;
    property  FixedPanel:boolean read FFixedPanel;
    property  ZenitEnergy:real read FZenitEnergy;
    property  PercentClouds:real read FPercentClouds;
    property  OptDay:TMinMaxInt read FOptDay;
  end;




  {-----------------------------------------------------------------------------
   Class:   TDiagrammBerech
   Description:
  -----------------------------------------------------------------------------}
  TDiagrammBerech=class
  public
    procedure AzTime;
    procedure HTime;
    procedure HAz;
    procedure RelHTime;
    procedure DayEnergy;
    function YearEnergy(ausgabe:Tlabel=nil):extended;
    procedure YearSunElevation(AusgabeMin,AusgabeMax:Tlabel);

    procedure saveRSSonnenaufgang;
    procedure saveRSSonnenuntergang;

    procedure SettingsChartYear(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
    procedure SettingsYear(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
    procedure SettingsChartDay(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
    procedure SettingsDay(chart:TRSLineChart; BottomAxisIsTime:boolean=true);

    procedure EndDrawChart(Infos:TSavingChartCol);
  end;



procedure FillRichEdits;
function MinMaxReal(Minimum,Maximum:real):TMinMaxReal;
function MinMax(Minimum,Maximum:real):TMinMaxReal;    overload;
function MinMax(Minimum,Maximum:integer):TMinMaxInt;  overload;
function SavingChartCol(LAIncrement,LAMinimum,LAMaximum,BAIncrement,BAMinimum,BAMaximum:real):TSavingChartCol;



const
  anzPunkte=100;
var
  Form1: TForm1;
  DiagrammBerech:TDiagrammBerech;
  US:TUserSpecification;

  PanelVisible:boolean;

  version:string;


  Stop:boolean;

  Backup:TSavingChartCol;


implementation
uses utxt,uanderes,rschartconsts,unit2, Unit3,umathe,usolar;
{$R *.dfm}



{-----------------------------------------------------------------------------
  Description:
  Procedure:    MinMaxReal
  Arguments:    Minimum,Maximum:real
  Result:       TMinMaxReal
  Detailed description:
-----------------------------------------------------------------------------}
function MinMaxReal(Minimum,Maximum:real):TMinMaxReal;
begin
  result:=MinMax(Minimum,Maximum);
end;

{-----------------------------------------------------------------------------
  Description:
  Procedure:    MinMax
  Arguments:    Minimum,Maximum:real
  Result:       TMinMaxReal
  Detailed description:
-----------------------------------------------------------------------------}
function MinMax(Minimum,Maximum:real):TMinMaxReal;
begin
  result.Minimum:=Minimum;
  result.Maximum:=Maximum;
end;

{-----------------------------------------------------------------------------
  Description:
  Procedure:    MinMax
  Arguments:    Minimum,Maximum:integer
  Result:       TMinMaxInt
  Detailed description:
-----------------------------------------------------------------------------}
function MinMax(Minimum,Maximum:integer):TMinMaxInt;
begin
  result.Minimum:=Minimum;
  result.Maximum:=Maximum;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SavingChartCol
  Arguments:    LAIncrement,LAMinimum,LAMaximum,BAIncrement,BAMinimum,BAMaximum:real
  Result:       TSavingChartCol
  Detailed description:
-----------------------------------------------------------------------------}
function SavingChartCol(LAIncrement,LAMinimum,LAMaximum,BAIncrement,BAMinimum,BAMaximum:real):TSavingChartCol;
begin
  result.leftAxis.Increment:=LAIncrement;
  result.leftAxis.Minimum:=LAMinimum;
  result.leftAxis.Maximum:=LAMaximum;
  result.BottomAxis.Increment:=BAIncrement;
  result.BottomAxis.Minimum:=BAMinimum;
  result.BottomAxis.Maximum:=BAMaximum;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    FillRichEdits
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure FillRichEdits;
var AResourceStream:TResourceStream;
begin
  try
  // Help1
    AResourceStream := TResourceStream.Create(hInstance,'Help1',PChar('RT_RCDATA'));
    form1.RichHelp1.Lines.LoadFromStream(AResourceStream);

  // Help2
    AResourceStream := TResourceStream.Create(hInstance,'Help2',PChar('RT_RCDATA'));
    form1.RichHelp2.Lines.LoadFromStream(AResourceStream);

  // Help3
    AResourceStream := TResourceStream.Create(hInstance,'Help3',PChar('RT_RCDATA'));
    form1.RichHelp3.Lines.LoadFromStream(AResourceStream);

  // Info
    AResourceStream := TResourceStream.Create(hInstance,'Info',PChar('RT_RCDATA'));
    form2.RichInfo.Lines.LoadFromStream(AResourceStream);
  finally
    AResourceStream.Free;
  end;
end;





{Alles von  TUserSpecification  TUserSpecification  TUserSpecification  TUserSpecification  TUserSpecification  TUserSpecification  TUserSpecification  TUserSpecification}



{-----------------------------------------------------------------------------
  Description:
  Procedure:    writeFTS
  Arguments:    value:TTimeSpecification
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TUserSpecification.writeFTS(value:TTimeSpecification);
var hh,mm,ss:byte;
begin
  FTs:=value;
  form1.JvEDay.Text:=inttostr(value.day);
  form1.JvEmonth.Text:=inttostr(value.month);
  form1.JvEyear.Text:=inttostr(value.year);

  uanderes.timetohhmmss(value.time,hh,mm,ss);
  // hier wandelt er falls man in einer krummen Zeitzone (+3.5) lebt das noch in Minuten um
  if mm+ (self.UTCtoSel(hh)-trunc(self.UTCtoSel(hh)))*60>60 then
    begin
    mm:=round( mm+ (self.UTCtoSel(hh)-trunc(self.UTCtoSel(hh)))*60   -60 );
    hh:=hh+1;
    end
  else
    mm:=round( mm+ (self.UTCtoSel(hh)-trunc(self.UTCtoSel(hh)))*60 );


  form1.JvEhour.Text:=inttostr(trunc(self.UTCtoSel(hh)));
  form1.JvEminute.Text:=inttostr(mm);
  form1.JvEsec.Text:=inttostr(ss);

  FormSetting.EBG.Text:=floattostr(value.BG);

  if value.BG<0 then
    FormSetting.ComboBG.ItemIndex:=1
  else
    FormSetting.ComboBG.ItemIndex:=0;

  FormSetting.ELG.Text:=floattostr(value.LG);

  if value.LG<0 then
    FormSetting.ComboLG.ItemIndex:=1
  else
    FormSetting.ComboLG.ItemIndex:=0;
end;



{-----------------------------------------------------------------------------
  Procedure:    writeFFormelMeine
  Arguments:    value:boolean
-----------------------------------------------------------------------------}
procedure TUserSpecification.writeFFormelMeine(value:boolean);
begin
  FFormelMeine:=value;
  form1.RadioMeine.Checked:=value;
end;

{-----------------------------------------------------------------------------
  Procedure:    writeFFormelWiki
  Arguments:    value:boolean
-----------------------------------------------------------------------------}
procedure TUserSpecification.writeFFormelWiki(value:boolean);
begin
  FFormelWiki:=value;
  form1.RadioWiki.Checked:=value;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    getSpecification
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TUserSpecification.getSpecification;
var I:integer;
begin
  FTS.day:=strtoint(form1.JvEday.Text);
  FTS.month:=strtoint(form1.JvEmonth.Text);
  FTS.year:=strtoint(form1.JvEyear.Text);

  //wichtig das minute nach hour bestimmt wird, da bei schiefen zeitzinen da runkorrigiert werden muss
  FTS.time:=hhmmsstoTime(self.SeltoUTC(strtoint(form1.JvEhour.Text)),strtoint(form1.JvEminute.Text),strtoint(form1.JvEsec.Text));

  FTS.BG:=strtofloat(FormSetting.EBG.Text);
  if  FormSetting.ComboBG.ItemIndex=1 then FTS.BG:=-FTS.BG;

  FTS.LG:=strtofloat(FormSetting.ELG.Text);
  if  FormSetting.ComboLG.ItemIndex=1 then FTS.LG:=-FTS.LG;

  FTS.Azi:=strtofloat(formsetting.EPanelAzi.Text);
  FTS.Ele:= strtofloat(formsetting.EPanelEle.Text);

  FFormelMeine:=form1.RadioMeine.Checked;
  FFormelWiki:=form1.RadioWiki.Checked;

  //macht ALLE TRSLINeCharts grün oder rot
  if  FFormelMeine then
    begin
    for i:=0 to form1.ComponentCount -1 do
      if (form1.Components[i] is TRSLineChart)
        and (TRSLineChart(form1.Components[i]).Name<>'RS0Line')
        and (TRSLineChart(form1.Components[i]).Name<>'RSSonnenaufgang')
        and (TRSLineChart(form1.Components[i]).Name<>'RSSonnenuntergang')  then
          TRSLineChart(form1.Components[i]).Color:=clred
    end
  else
    begin
    for i:=0 to form1.ComponentCount -1 do
      if (form1.Components[i] is TRSLineChart)
        and (TRSLineChart(form1.Components[i]).Name<>'RS0Line')
        and (TRSLineChart(form1.Components[i]).Name<>'RSSonnenaufgang')
        and (TRSLineChart(form1.Components[i]).Name<>'RSSonnenuntergang')  then
          TRSLineChart(form1.Components[i]).Color:=cllime;
    end;


  // für solarkollektoren   für solarkollektoren

    //höhe
  if formsetting.RadioSea.Checked then
    self.FZenitEnergy:=800       //Watt
  else if formsetting.RadioMountain.Checked then
    self.FZenitEnergy:=1000;     //Watt

  FFixedPanel:=FormSetting.RadioFixedPanel.Checked;
    //wolken
  self.FPercentClouds:=strtofloat(FormSetting.EPercentClouds.Text);

  FOptDay:=MinMax(strtoint(form1.SpinEVon.Text),strtoint(form1.SpinEBis.Text));
end;



{-----------------------------------------------------------------------------
  Description:  Schreibt Aktuelles Datum und Aktuelle Zeit
  Procedure:    writeUptodateTimeDate
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TUserSpecification.writeUptodateTimeDate;
var msec:word;
    hh,mm,ss,month,year,day:word;
begin
  decodetime(gettime,hh,mm,ss,msec);
  decodedate(date,year,month,day);

  FTS.day:=day;
  FTS.year:=year;
  FTS.month:=month;
  FTS.time:= hhmmsstotime(hh,mm,ss);

  form1.JvEDay.Text:=inttostr(day);
  form1.JvEMonth.Text:=inttostr(month);
  form1.JvEYear.Text:=inttostr(year);
  form1.JvEHour.Text:=inttostr(hh);
  form1.JvEMinute.Text:=inttostr(mm);
  form1.JvEsec.Text:=inttostr(ss);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    CorrectAllEdits
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TUserSpecification.CorrectAllEdits;
var w:word;
    r:real;
begin
{  uanderes.korrigiere(form1.JvEHour,['0'..'9']);
  uanderes.korrigiere(form1.JvEminute,['0'..'9']);
  uanderes.korrigiere(form1.JvEsec,['0'..'9']);}
{  uanderes.korrigiere(form1.JvEday,['0'..'9']);
  uanderes.korrigiere(form1.JvEmonth,['0'..'9']);
  uanderes.korrigiere(form1.JvEyear,['0'..'9']);}

  r:=strtofloat(FormSetting.EBG.text);
  uanderes.korrigiere(r,-90,90);
  FormSetting.EBG.text:=floattostr(r);

  r:=strtofloat(FormSetting.ELG.text);
  uanderes.korrigiere(r,0,180);
  FormSetting.ELG.text:=floattostr(r);

{  w:=strtoint(form1.JvEHour.text);
//  w:= w mod 24;
  uanderes.korrigiere(w,0,23);
  form1.EHour.text:=inttostr(w);}

{  w:=strtoint(form1.Eminute.text);
  uanderes.korrigiere(w,0,59);
  form1.Eminute.text:=inttostr(w);}

{  w:=strtoint(form1.JvEmonth.text);  //hicht nötig da jvspin edit
  uanderes.korrigiere(w,1,12);
  form1.Emonth.text:=inttostr(w);}

{  w:=strtoint(form1.Eyear.text);
  uanderes.korrigiere(w,0,65000);
  form1.Eyear.text:=inttostr(w);}

  w:=strtoint(form1.JvEday.text);
  uanderes.korrigiere(w,1,uanderes.monatslaenge(strtoint(form1.JvEmonth.text), strtoint(form1.JvEyear.text)));
  form1.JvEday.text:=inttostr(w);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    TSDateTime
  Arguments:    None
  Result:       TDatetime
  Detailed description:
-----------------------------------------------------------------------------}
function  TUserSpecification.TSDateTime:TDatetime    ;
var hh,mm,ss:byte;
begin
  uanderes.timetohhmmss(ts.time,hh,mm,ss);
  result:=encodedatetime(self.TS.year,ts.month,ts.day,hh,mm,ss,0);
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    TSDate
  Arguments:    None
  Result:       TDate
  Detailed description:
-----------------------------------------------------------------------------}
function  TUserSpecification.TSDate:TDate    ;
begin
  result:=encodedate(self.TS.year,ts.month,ts.day);
end;

{-----------------------------------------------------------------------------
  Description:
  Procedure:    TSTime
  Arguments:    None
  Result:       Ttime
  Detailed description:
-----------------------------------------------------------------------------}
function  TUserSpecification.TSTime:Ttime    ;
var hh,mm,ss:byte;
begin
  uanderes.timetohhmmss(ts.time,hh,mm,ss);
  result:=encodetime(hh,mm,ss,0);
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    UTCtoSel
  Arguments:    time:real
  Result:       real
  Detailed description:
                  0      UTC
                  1      UTC + 1  (MEZ)
                  2      UTC + 2  (MESZ)
                  3      UTC + 3
                  4      UTC + 3:30
                  5      UTC + 4
                  6      UTC + 5
                  7      UTC + 5:30
                  8      UTC + 5:45
                  9      UTC + 6
                 10      UTC + 6:30
                 11      UTC + 7
                 12      UTC + 8
                 13      UTC + 8:45
                 14      UTC + 9
                 15      UTC + 9:30
                 16      UTC + 10
                 17      UTC + 10:30
                 18      UTC + 11
                 19      UTC + 11:30
                 20      UTC + 12
                 21      UTC + 12:45
                 22      UTC + 13
                 23      UTC + 14
                 24      UTC - 1
                 25      UTC - 2
                 26      UTC - 3
                 27      UTC - 3:30
                 28      UTC - 4
                 29      UTC - 5
                 30      UTC - 6
                 31      UTC - 7
                 32      UTC - 8
                 33      UTC - 9
                 34      UTC - 9:30
                 35      UTC - 10
                 36      UTC - 11
                 37      UTC - 12
                 38      UTC - 13
                 39      UTC - 14
-----------------------------------------------------------------------------}
function TUserSpecification.UTCtoSel(time:real):real;
begin
  result:=time;
  case FormSetting.ComboTime.ItemIndex of
    1:result:=result+1;
    2:result:=result+2;
    3:result:=result+3;
    4:result:=result+3.5;
    5:result:=result+4;
    6:result:=result+5;
    7:result:=result+5.5;
    8:result:=result+5.75;
    9:result:=result+6;
   10:result:=result+6.5;
   11:result:=result+7;
   12:result:=result+8;
   13:result:=result+8.75;
   14:result:=result+9;
   15:result:=result+9.5;
   16:result:=result+10;
   17:result:=result+10.5;
   18:result:=result+11;
   19:result:=result+11.5;
   20:result:=result+12;
   21:result:=result+12.75;
   22:result:=result+13;
   23:result:=result+14;
   24:result:=result-1;
   25:result:=result-2;
   26:result:=result-3;
   27:result:=result-3.5;
   28:result:=result-4;
   29:result:=result-5;
   30:result:=result-6;
   31:result:=result-7;
   32:result:=result-8;
   33:result:=result-9;
   34:result:=result-9.5;
   35:result:=result-10;
   36:result:=result-11;
   37:result:=result-12;
   38:result:=result-13;
   39:result:=result-14;
  end;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SeltoUTC
  Arguments:    time:real
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TUserSpecification.SeltoUTC(time:real):real;
begin
  result:=time;
  case FormSetting.ComboTime.ItemIndex of
    1:result:=result-1;
    2:result:=result-2;
    3:result:=result-3;
    4:result:=result-3.5;
    5:result:=result-4;
    6:result:=result-5;
    7:result:=result-5.5;
    8:result:=result-5.75;
    9:result:=result-6;
   10:result:=result-6.5;
   11:result:=result-7;
   12:result:=result-8;
   13:result:=result-8.75;
   14:result:=result-9;
   15:result:=result-9.5;
   16:result:=result-10;
   17:result:=result-10.5;
   18:result:=result-11;
   19:result:=result-11.5;
   20:result:=result-12;
   21:result:=result-12.75;
   22:result:=result-13;
   23:result:=result-14;
   24:result:=result+1;
   25:result:=result+2;
   26:result:=result+3;
   27:result:=result+3.5;
   28:result:=result+4;
   29:result:=result+5;
   30:result:=result+6;
   31:result:=result+7;
   32:result:=result+8;
   33:result:=result+9;
   34:result:=result+9.5;
   35:result:=result+10;
   36:result:=result+11;
   37:result:=result+12;
   38:result:=result+13;
   39:result:=result+14;
  end;
end;






{Alles von Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1  Tform1 }

{-----------------------------------------------------------------------------
  Description:  Hier wird aus den Ressourcen eingelesen und in die Arrays geschrieben
  Procedure:    FormCreate
  Arguments:    Sender: TObject
  Result:       None
  Detailed description: Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create  Create
-----------------------------------------------------------------------------}
procedure TForm1.FormCreate(Sender: TObject);
var stelle:byte;
begin
  stop:=false;

  version:=getfileversion(Application.ExeName);
  //hier wird jetzt die punkte weggemacht bis auf den 1. damit es auch schön aussieht
  stelle:=pos('.',version)+1;
  repeat
    stelle:=posex('.',version,stelle);
    delete(version,stelle,1);
  until  posex('.',version,stelle)=0;
  for stelle:=0 to 3 do
    if AnsiLastChar(version)='0' then delete(version,length(version),1);

  randomize;
  Caption:='SolariXX           Version '+version;

  Sonne:=TSonne.Create;
  Solarkollektoren:=TSolarkollektoren.Create;
  Diagrammberech:=Tdiagrammberech.Create;
  US:=TUserSpecification.Create;

  RSLineChart.Values.Clear;
  RSSonnenaufgang.Values.Clear;
  RSSonnenuntergang.Values.Clear;
  with  RSLineChart do
    begin
    values.Clear;
    Parent.Header.Text:='Diagramm';
    Parent.LeftAxis.Title.Text:='y-Achse';
    parent.LeftAxis.LabelIncrement:=20;
    parent.LeftAxis.Maximum:=180;
    parent.LeftAxis.Minimum:=-180;
    Parent.BottomAxis.Title.Text:='x-Achse';
    parent.BottomAxis.LabelIncrement:=1;
    parent.BottomAxis.Minimum:=0;
    parent.BottomAxis.Maximum:=24;
    parent.BottomAxis.Grid.DrawOptions := [goDrawMajorGrid, goDrawTickMarks];
    end;

  PanelVisible:=false;
//  Panel1.Top:=self.Height+20-100-100;
//  Panel1.Height:=25;
  PageControl1.ActivePageIndex:=0;
  PageControl2.ActivePageIndex:=0;

  sonne.GetResourceData;

  //alle diagrammdaten löschen
  self.RSLineChart.Values.Clear;
  self.RSSonnenaufgang.Values.Clear;
  self.RSSonnenuntergang.Values.Clear;
  self.RSLineChart.Values.Clear;


  FLog:=form1.ListLog.Visible;
  form1.ListLog.Width:=  257;
  form1.RichHelp1.Width:=  250;
  form1.RichHelp2.Width:=  250;
  form1.RichHelp3.Width:=  250;

  with self.RSLineChart.Parent do
    diagrammberech.EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    FormDestroy
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.FormDestroy(Sender: TObject);
begin
  Sonne.Free;
  Solarkollektoren.Free;
  Diagrammberech.Free;
  US.Free;
end;

{-----------------------------------------------------------------------------
  Description:
  Procedure:    writeFLog
  Arguments:    value:boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.writeFLog(value:boolean);
begin
  FLog:=value;
  self.ListLog.Clear;
  self.ListLog.Visible:=Flog;
  self.ListLog.BringToFront;
end;




procedure TForm1.ListLogChange(Sender: TObject);
begin
  self.ListLog.ItemIndex:=self.ListLog.Count-1
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    PopupMenu1Popup
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  case self.PageControl1.ActivePageIndex of
    0: self.PopupMenu1.Items[0].Caption:='Werte des Tages in Datei speichern';
    1: self.PopupMenu1.Items[0].Caption:='Werte des Jahres in Datei speichern';
  end;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    PopupSpeichereDateiClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.PopupSpeichereDateiClick(Sender: TObject);
begin
  case self.PageControl1.ActivePageIndex of
    0: self.BDayCalctoFile.Click;
    1: self.BYearCalctoFile.Click;
  end;
end;


{-----------------------------------------------------------------------------
  Description:  Ausgabe in eine Datei
  Procedure:    Button1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BDayCalctoFileClick(Sender: TObject);
begin
  stop:=false;
  self.SaveDialogDayCSV.InitialDir:=ExtractFilePath(Application.ExeName);
  self.SaveDialogDayCSV.FileName:=dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten.csv'  ;

  self.SaveDialogDayCSV.Execute;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    BYearCalctoFileClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BYearCalctoFileClick(Sender: TObject);
begin
  stop:=false;
  self.SaveDialogYearCSV.InitialDir:=ExtractFilePath(Application.ExeName);
  self.SaveDialogYearCSV.FileName:=dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten.csv'  ;

  self.SaveDialogYearCSV.Execute;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SaveDialogDayCSVCanClose
  Arguments:    Sender: TObject; var CanClose: Boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.SaveDialogDayCSVCanClose(Sender: TObject;  var CanClose: Boolean);
var r,abstand:extended;
    s:string;
    tempTS:TTimespecification;
begin
  s:='100';
  if not  uanderes.ADialog(s,'Genauigkeit eingeben','Geben Sie bitte den Zeitabstand der Werte in Bruchteilen einer Stunde an')   then exit;
  abstand:=1/strtoint(s);

  US.CorrectAllEdits;
  US.getSpecification;

  //Einzelwerte
  s:='Aktuelles Datum '+datetostr(date)+';Uhrzeit der speicherung '+timetostr(gettime)+#13;
  s:=s+'Längengrad= '+floattostr(US.FTS.LG)+';Breitengrad= '+floattostr(US.FTS.BG)  +#13;
  s:=s+#13;
  s:=s+'Ausgegeben werden die Daten in UTC'+#13;
  s:=s+'Ein paar Einzelwerte'+#13;
  s:=s+'Maximalhöhe der Sonne in °;Minimalhöhe der Sonne in °;Sonnenscheindauer in h;Relative Maximalhöhe der Sonne in ° zu den Solarkollektoren;Relative Minimalhöhe der Sonne in ° zu den Solarkollektoren;Relaltiver Sonnenscheindauer in h zu den Solarkollektoren;'
      +'Tagesleistung der Solaranlage in kWh pro m^2'+#13;
  s:=s+floattostr(umathe.ExtremFofXOfDay(sonne.getEle,us.TS,true))+';'+floattostr(umathe.ExtremFofXOfDay(sonne.getEle,us.TS,false))+';'+floattostr(sonne.Sonnenstunden(us.TS))+';'
      +floattostr(umathe.ExtremFofXOfDay(solarkollektoren.RelElevationNightCorrection,us.TS,true))+';'+floattostr(umathe.ExtremFofXOfDay(solarkollektoren.RelElevationNightCorrection,us.TS,false,10))+';'+floattostr(  solarkollektoren.Sonnenstunden(us.TS)   )+';'
      +floattostr(solarkollektoren.CalcDayEnergy(us.TS)/3600000)+';'+#13;
  //Überschriften
  s:=s+'Uhrzeit;Stundenteil;Azimut;Höhenwinkel;Relaltiver Sonnenstand in ° zu den Solarkollektoren;Leistung in W pro m^2'+#13;

  r:=0;
  repeat
    with us.TS do
      tempTS:=TimeSpecification(BG,LG,Azi,Ele,r,day,month,year)  ;

    s:=s
        +uanderes.timetohhmm(r)+';'
        +floattostr(r)+';'
        +floattostr(sonne.getAzi(tempTS))+';'
        +floattostr(sonne.getEle(tempTS)) +';'
        +floattostr(solarkollektoren.RelElevationNightCorrection(tempTS))+';'
        +floattostr(solarkollektoren.CalcEnergy(tempTS))
        +#13;

    r:=r+abstand;
  until r>=24;

  intxtschreiben(s,self.SaveDialogDayCSV.FileName,'.csv',true);
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SaveDialogYearCSVCanClose
  Arguments:    Sender: TObject; var CanClose: Boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.SaveDialogYearCSVCanClose(Sender: TObject; var CanClose: Boolean);
var s:string;
    i,j,genauigkeit:integer;
    tempTS:TTimespecification;
begin
  if not uanderes.ADialog(genauigkeit,'Genauigkeit der Berechnung','Gib bitte die Genauigkeit an, in Bruchteilen einer Stunde (größer = genauer)',10,1,3600) then exit;

  US.CorrectAllEdits;
  US.getSpecification;

  s:='Aktuelles Datum '+datetostr(date)+';Aktuelle Uhrzeit '+timetostr(gettime)+#13;
  s:=s+'Datum;Julianisches Datum;Tagesenergie in kWh/m^2;Sonnenhöchststand in °;Sonnenniedrigststand in °;Sonnenscheindauer in h;Relaltiver Sonnenhöchststand in ° zu den Solarkollektoren;'
      +'Relaltiver Sonnenniedrigststand in ° zu den Solarkollektoren;Relaltiver Sonnenscheindauer in h zu den Solarkollektoren'+#13;


  for i:=1 to 12 do
    begin
    if stop then break;
    for j:=1 to uanderes.monatslaenge(i,us.ts.year) do
      begin
      if stop then break;

      with us.TS do
        tempTS:=TimeSpecification(BG,LG,Azi,Ele,time,j,i,year)  ;

      s:=s
          +datetostr(encodedate(us.TS.year,i,j))+';'
          +floattostr(uanderes.gregtojul(j,i,us.TS.year))+';'
          +floattostr(solarkollektoren.CalcDayEnergy(tempTS,genauigkeit)/3600000)+';'
          +floattostr(umathe.ExtremFofXOfDay(sonne.getEle,tempTS,true,100))+';'
          +floattostr(umathe.ExtremFofXOfDay(sonne.getEle,tempTS,false,100))+';'
          +floattostr(  sonne.Sonnenstunden(tempTS,5)    )+';'
          +floattostr(umathe.ExtremFofXOfDay(solarkollektoren.RelElevationNightCorrection,tempTS,true,100))+';'
          +floattostr(umathe.ExtremFofXOfDay(solarkollektoren.RelElevationNightCorrection,tempTS,false,100))+';'
          +floattostr(  solarkollektoren.Sonnenstunden(tempTS,5)    )
          +#13;

      form1.Label11.Caption:='Bitte Warten...  '+inttostr(j)+'.'+inttostr(i)+'.'+inttostr(us.TS.year);
      form1.Label19.Caption:= form1.Label11.Caption;
      application.ProcessMessages;
      end;
    end;

  intxtschreiben(s,self.SaveDialogYearCSV.FileName,'.csv',true);

  form1.Label11.Caption:='Ausgabe';
  form1.Label19.Caption:= form1.Label11.Caption;
end;





{-----------------------------------------------------------------------------
  Description:  Aktuelles Datum und Aktuelle Zeit
  Procedure:    Button2Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BAktuelleZeitClick(Sender: TObject);
begin
  US.writeUptodateTimeDate;
end;





{-----------------------------------------------------------------------------
  Description:  Berechnen
  Procedure:    Button3Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BBerechnenClick(Sender: TObject);
var s:string;
    e1,e2:extended;
    TS:TTimeSpecification;
begin
  stop:=false;
  US.CorrectAllEdits;
  US.getSpecification;

  self.LHimmelsrichtung.Caption:= Format('%f°', [sonne.getAzi(US.TS)]);
  self.LHoehenwinkel.Caption:= Format('%f°', [sonne.getEle(US.TS)]);
  ts:=US.TS;
  ts.time:=umathe.ExtremXOfDay(sonne.getEle,us.TS,true);
  self.LMaxBeta.Caption:= Format('%f°', [sonne.getEle(ts)]);

  if  umathe.IsNullstelleOfDay(sonne.getEle,US.TS) then
    begin
    s:=uanderes.timetohhmmss(US.UTCtoSel(umathe.NullstelleOfDay(sonne.getEle,US.TS,yes)));
    self.LSunRise.Caption:= s;

    s:=uanderes.timetohhmmss(US.UTCtoSel(umathe.NullstelleOfDay(sonne.getEle,US.TS,no)));
    self.LSunSet.Caption:= s;
    end
  else
    if sonne.getEle(us.ts)>0 then
      begin
      self.LSunRise.Caption:= 'Die Sonne ist immer da!!!';
      self.LSunSet.Caption:= 'Die Sonne ist immer da!!!';
      end
    else
      begin
      self.LSunRise.Caption:= 'Die Sonne ist nie da!!!';
      self.LSunSet.Caption:= 'Die Sonne ist nie da!!!';
      end;

  e1:=solarkollektoren.CalcDayEnergy(us.ts);
  self.LDayEnergy.Caption:=Format('%f', [e1/1000000])+' MJ/m^2';
  self.LDayEnergy2.Caption:=Format('%f', [e1/1000000/3.6])+' kWh/m^2';

  ts:=us.TS;
  ts.time:=us.SeltoUTC(US.TS.time );
  sonne.getwikiTauDekli(e1,e2,ts);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    FormClose
  Arguments:    Sender: TObject; var Action: TCloseAction
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  stop:=true;

  schreibeini(ExtractFilePath(Application.ExeName)+'Einstellungen.ini');
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    FormShow
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.FormShow(Sender: TObject);
begin
  US.writeUptodateTimeDate;
  FillRichEdits;

  leseini(ExtractFilePath(Application.ExeName)+'Einstellungen.ini');     //das mache ich hier weil hier diese Form als aller letztes createt wird und er so in alle anderen Zelle schon reinschreiben kann
end;




{-----------------------------------------------------------------------------
  Description:  Azimut in Diagramm ausgeben
  Procedure:    Button1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BAzimutClick(Sender: TObject);
begin
  stop:=false;
  DiagrammBerech.AzTime;
//  self.BBerechnen.Click;
end;




{-----------------------------------------------------------------------------
  Description:  Sonnenhöhe in Diagramm ausgeben
  Procedure:    SonnenhoeheClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BElevationClick(Sender: TObject);
begin
  stop:=false;
  DiagrammBerech.HTime;
//  self.BBerechnen.Click;
end;



{-----------------------------------------------------------------------------
  Description:  Sonnenhöhe über Azimut  im Diagramm ausgeben
  Procedure:    Button1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BElevationAzimutClick(Sender: TObject);
begin
  stop:=false;
  DiagrammBerech.HAz;
//  self.BBerechnen.Click;
end;






{-----------------------------------------------------------------------------
  Description:
  Procedure:    BDayPanelShowClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BPanelShowClick(Sender: TObject);
const unterschied=20;
      maxheight=-80;
begin
  with self.Panel do
    begin
    BringToFront;
    if  not PanelVisible then
      begin
      PanelVisible:=true;
      self.ListBoxDiagramm.Height:=self.TabSheet1.Height-35+maxheight;
      repeat
        Top:=Top-unterschied;
        Height:=Height+unterschied;
        self.Refresh;
        sleep(10);
      until Height>= self.TabSheet1.Height+maxheight
      end
    else
      begin
      PanelVisible:=false;
      repeat
        Top:=Top+unterschied;
        Height:=Height-unterschied;
        self.Refresh;
        sleep(10);
      until Height<=25 ;
      end;
    end;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    BYearPanelShowClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BYearPanelShowClick(Sender: TObject);
const unterschied=20;
      maxheight=-90;
begin
  with self.Panel do
    begin
    BringToFront;
    if  not PanelVisible then
      begin
      PanelVisible:=true;
      ListBoxDiagramm.Height:=self.TabSheet1.Height-70+maxheight;
      repeat
        Top:=Top-unterschied;
        Height:=Height+unterschied;
        Refresh;
        sleep(10);
      until Height>= self.TabSheet1.Height+maxheight
      end
    else
      begin
      PanelVisible:=false;
      repeat
        Top:=Top+unterschied;
        Height:=Height-unterschied;
        self.Refresh;
        sleep(10);
      until Height<=25 ;
      end;
    end;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    JvImgBtn1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.JvImgBtn1Click(Sender: TObject);
begin
  form2.show;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    RSChartPanel1MouseDown
  Arguments:    Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.RSChartPanel1MouseDown(Sender: TObject;  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbRight then self.PopupMenu1.Popup(x+self.Left+self.RSChartPanel1.Left+3
                                                ,y+self.Top+self.RSChartPanel1.Top+40);

  if (ssMiddle in shift)then
    self.RSChartPanel1.Unzoom();
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    SpeichereIniDatei1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.SpeichereIniDatei1Click(Sender: TObject);
begin
  self.SaveDialogInI.InitialDir:=ExtractFilePath(Application.ExeName);
  self.SaveDialogInI.FileName:='Meine Einstellungen '+dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten.ini'  ;

  self.SaveDialogInI.Execute;
end;


procedure TForm1.TabSheet4ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;

{-----------------------------------------------------------------------------
  Description:
  Procedure:    SaveDialogINICanClose
  Arguments:    Sender: TObject; var CanClose: Boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.SaveDialogINICanClose(Sender: TObject; var CanClose: Boolean);
begin
  schreibeini(self.SaveDialogINI.FileName+'.ini');
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    LeseIniDatei1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.LeseIniDatei1Click(Sender: TObject);
begin
  self.OpenDialogINI.InitialDir:=ExtractFilePath(Application.ExeName);
//  self.OpenDialogINI.FileName:='Meine Einstellungen '+dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten.ini'  ;

  self.OpenDialogINI.Execute;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    OpenDialogINICanClose
  Arguments:    Sender: TObject; var CanClose: Boolean
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.OpenDialogINICanClose(Sender: TObject;  var CanClose: Boolean);
begin
  leseini(self.OpenDialogINI.FileName);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    BOptimiereClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BOptimiereClick(Sender: TObject);
var temp:TTimeSpecification;
    precision,azimut:integer;
begin
  stop:=false;
  us.getSpecification;

  if not uanderes.ADialog(precision,'Genauigkeit der Berechnung','Gib bitte an, wie oft am Tag gemessen werden soll (größer = genauer)',12,1,100) then exit;
  if precision <5 then
    showmessage('Diese berechnung kann extrem ungenau sein (und bringt daher auch nix), da von einem Tag nur sehr wenige Punkte berechnet werden.');


  if not uanderes.ADialog(azimut,'Azimut einstellen','Gebe bitte an in welcher Himmelsrichtung die Sonne am höchsten steht'+#13+
                                    'Falls du festgelegt bist im Azimut, gebe bitte diesen an!'+#13+
                                    '     (0° = Süden, -90°=Osten, 90°=Westen 180°=Norden)',round(us.TS.Azi),-180,180) then exit;


  temp:=ExtremYearXOfInclination(solarkollektoren.CalcYearEnergy,us.TS,us.OptDay,azimut,MinMaxReal(0,90),true,precision/10,self.Label30,self.JvProgressBarOpti);
end;




procedure TForm1.ButtonSettingClick(Sender: TObject);
begin
  FormSetting.Show;
end;



procedure TForm1.Einstellungen1Click(Sender: TObject);
begin
  FormSetting.Show;

end;

procedure TForm1.aboutClick(Sender: TObject);
begin
  form2.show;
end;

procedure TForm1.Version1Click(Sender: TObject);
begin
  showmessage('SolariXX    Version '+version);
end;

procedure TForm1.Lizenzdetails1Click(Sender: TObject);
begin
  form2.Show;
  form2.TabSheetControl.ActivePage:=form2.Lizenzbedingungen;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    FormKeyDown
  Arguments:    Sender: TObject; var Key: Word; Shift: TShiftState
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
//  showmessage(inttostr(ord(key)));
end;



procedure TForm1.Hilfe1Click(Sender: TObject);
begin
  self.RichHelp1.Visible:=not self.RichHelp1.Visible;
  self.RichHelp2.Visible:=not self.RichHelp2.Visible;
  self.RichHelp3.Visible:=not self.RichHelp3.Visible;
end;

procedure TForm1.Update1Click(Sender: TObject);
begin
  form2.Show;
  form2.TabSheetControl.ActivePage:=form2.TabUpdate;
  form2.BCheckUpdate.Click;
end;



{-----------------------------------------------------------------------------
  Description:  Einfalswinkel auf die Solarzellen
  Procedure:    Button3Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BRelElevationClick(Sender: TObject);
begin
  stop:=false;
  diagrammberech.RelHTime;
end;

{-----------------------------------------------------------------------------
  Description:  Energie in W/m^2
  Procedure:    BEnergyClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BEnergyClick(Sender: TObject);
begin
  stop:=false;
  diagrammberech.DayEnergy;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    BYearEnergyClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BYearEnergyClick(Sender: TObject);
begin
  stop:=false;
  us.getSpecification;
  self.BYearEnergy.Enabled:=false;
  self.RSChartPanel1.SetFocus;

  diagrammberech.YearEnergy(self.LYearEnergy);

  self.BYearEnergy.Enabled:=true;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    Button1Click
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.BYearMaxElevationClick(Sender: TObject);
begin
  stop:=false;
  self.BYearMaxElevation.Enabled:=false;
  self.RSChartPanel1.SetFocus;

  diagrammberech.YearSunElevation(self.LYearMinElevation,self.LYearMaxElevation);

  self.BYearMaxElevation.Enabled:=true;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    RSChartPanel1Zoom
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.RSChartPanel1Zoom(Sender: TObject);
begin
  with self.RSChartPanel1.BottomAxis do
    begin
    MinStepIncrement:=(ZoomMaximum-ZoomMinimum) / 10;
    LabelIncrement:=(ZoomMaximum-ZoomMinimum) / 10;
    end;

  with self.RSChartPanel1.LeftAxis do
    begin
    MinStepIncrement:=(ZoomMaximum-ZoomMinimum) / 10;
    LabelIncrement:=(ZoomMaximum-ZoomMinimum) / 10;
    end;
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    RSChartPanel1Unzoom
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm1.RSChartPanel1Unzoom(Sender: TObject);
begin
  with form1.RSChartPanel1 do
    begin
    with leftAxis do
      begin
      LabelIncrement:=  Backup.leftAxis.Increment;
      Minimum:=  Backup.leftAxis.Minimum;
      Maximum:=  Backup.leftAxis.Maximum;
      end;
    with BottomAxis do
      begin
      LabelIncrement:=  Backup.BottomAxis.Increment;
      Minimum:=  Backup.BottomAxis.Minimum;
      Maximum:=  Backup.BottomAxis.Maximum;
      end;
    end;
end;









//  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech  TDiagrammBerech


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SettingsChartYear
  Arguments:    chart:TRSLineChart; BottomAxisIsTime:boolean=true
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.SettingsChartYear(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
begin
  with chart do
    begin
    parent:=form1.RSChartPanel1;
    visible:=true;

    Values.IsDateTime:=true;
    Values.DateTimeAxes:=[xyX] ;
    values.IsDateTime:=true;
    Parent.BottomAxis.DateTimeFormat:='d.m.';
    Parent.BottomAxis.LabelStyle:=alsValue;

    Parent.BottomAxis.Title.Text:='Datum';
    parent.BottomAxis.LabelIncrement:=10;
    parent.BottomAxis.Minimum:=EncodeDate(us.TS.year,1,1);
    parent.BottomAxis.Maximum:=EncodeDate(us.TS.year,12,31);
    parent.BottomAxis.Grid.DrawOptions := [goDrawMajorGrid, goDrawTickMarks];
    end;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SettingsYear
  Arguments:    chart:TRSLineChart; BottomAxisIsTime:boolean=true
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.SettingsYear(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
begin
  if form1.Log then form1.ListLog.Items.Add('---------------------');

  US.CorrectAllEdits;
  US.getSpecification;

  form1.RSChartPanel1.Unzoom();

  form1.ListBoxDiagramm.Clear;

  form1.RSSonnenaufgang.Parent:=nil;
  form1.RSSonnenuntergang.Parent:=nil;

  form1.RSChartPanel1.Charts.Clear;


  with form1.RS0Line do
    begin
    Parent:=form1.RSChartPanel1;
    Values.IsDateTime:=true;
    Visible:=true;
    end;

  chart.values.Clear;

  SettingsChartYear(chart);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    SettingsChartDay
  Arguments:    chart:TRSLineChart; BottomAxisIsTime:boolean=true
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.SettingsChartDay(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
begin
  with chart do
    begin
    parent:=form1.RSChartPanel1;
    visible:=true;

    Parent.BottomAxis.LabelStyle:=alsValue;
    if BottomAxisIsTime then
      begin
      parent.BottomAxis.Minimum:=0;
      parent.BottomAxis.Maximum:=24;
      parent.BottomAxis.Grid.DrawOptions := [goDrawMajorGrid, goDrawTickMarks];
      Parent.BottomAxis.Title.Text:='Tageszeit';
      parent.BottomAxis.LabelIncrement:=1;
      end
    else
      begin
      Parent.BottomAxis.Title.Text:='Azimut in °';
      parent.BottomAxis.LabelIncrement:=20;
      parent.BottomAxis.Minimum:=-180;
      parent.BottomAxis.Maximum:=180;
      parent.BottomAxis.Grid.DrawOptions := [goDrawMajorGrid, goDrawMinorGrid, goDrawTickMarks];
      parent.BottomAxis.Grid.MinorTickCount := 1;
      end;
    end;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    SettingsDay
  Arguments:    (chart:TRSLineChart; BottomAxisIsTime:boolean=true)
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.SettingsDay(chart:TRSLineChart; BottomAxisIsTime:boolean=true);
begin
  if form1.Log then form1.ListLog.Items.Add('---------------------');

  US.CorrectAllEdits;
  US.getSpecification;

  form1.RSChartPanel1.Unzoom();

  form1.ListBoxDiagramm.Clear;
  if umathe.IsNullstelleOfDay(sonne.getEle,US.TS) then
    begin
    diagrammberech.saveRSSonnenaufgang;
    diagrammberech.saveRSSonnenuntergang;
    end;

  form1.RSChartPanel1.Charts.Clear;
  form1.RSSonnenaufgang.Parent:=form1.RSChartPanel1;
  form1.RSSonnenuntergang.Parent:=form1.RSChartPanel1;
  form1.RSSonnenaufgang.Visible:=true;
  form1.RSSonnenuntergang.Visible:=true;
  form1.RSLineChart.Parent:=nil;

  with form1.RS0Line do
    begin
    Parent:=form1.RSChartPanel1;
    Values.IsDateTime:=false;
    Visible:=true;
    end;

  chart.values.Clear;

  SettingsChartDay(chart,BottomAxisIsTime);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    EndDrawChart
  Arguments:    Infos:TSavingChartCol
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.EndDrawChart(Infos:TSavingChartCol);
begin
  Backup.leftAxis.Increment:=Infos.leftAxis.Increment;
  Backup.leftAxis.Minimum:=Infos.leftAxis.Minimum;
  Backup.leftAxis.Maximum:=Infos.leftAxis.Maximum;

  Backup.BottomAxis.Increment:=Infos.BottomAxis.Increment;
  Backup.BottomAxis.Minimum:=Infos.BottomAxis.Minimum;
  Backup.BottomAxis.Maximum:=Infos.BottomAxis.Maximum;
end;




{-----------------------------------------------------------------------------
  Description:  Der Azimut über der Zeit
  Procedure:    AzTime
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.AzTime;
var r,abstand:real;
begin
  abstand:=1/anzPunkte;
  r:=0;

  SettingsDay(form1.RSLineChart);
  with  form1.RSLineChart do
    begin
    BeginUpdate;
    try
      with parent do
        begin
        Header.Text:='Azimut';
        LeftAxis.Title.Text:='Winkel zu Süden';
        LeftAxis.LabelIncrement:=20;
        LeftAxis.Maximum:=180;
        LeftAxis.Minimum:=-180;
        end;

      repeat
        with us.TS do
          values.add(r,
                     sonne.getAzi(usolar.TimeSpecification(BG,LG,Azi,Ele,US.SeltoUTC(r),day,month,year)),
                     uanderes.timetohhmm(r));

        r:=r+abstand;
      until r>=24;
    finally
      EndUpdate;
    end;
    end;

  form1.ListBoxDiagramm.Items.Assign(form1.RSLineChart.Values);
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;



{-----------------------------------------------------------------------------
  Description:  Der Höhenwinkel über der Tageszeit
  Procedure:    HTime
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.HTime;
var r,abstand:real;

  TS:TTimeSpecification;

begin
  abstand:=1/anzPunkte;
  r:=0;

  SettingsDay(form1.RSLineChart);
  with  form1.RSLineChart do
    begin
    BeginUpdate;
    try
      Parent.Header.Text:='Sonnenhöhe';
      Parent.LeftAxis.Title.Text:='Höhe in °';
      parent.LeftAxis.LabelIncrement:=5;

      ts:=us.TS;
      ts.time:=umathe.ExtremXOfDay(sonne.getEle,US.TS,true);
      parent.LeftAxis.Maximum:=uanderes.Aroundto(sonne.getEle(ts),5,true);  //hier berechnet er den höchsten punkt und rundet dann auf
      ts.time:=umathe.ExtremXOfDay(sonne.getEle,US.TS,false);
      parent.LeftAxis.Minimum:=uanderes.Aroundto(sonne.getEle(ts),5,false); //hier berechnet er den niedrigsten punkt und rundet dann ab
      repeat
        with us.TS do
          values.add(r,
                     sonne.getEle(TimeSpecification(BG,LG,Azi,Ele,US.SeltoUTC(r),day,month,year)),
                     uanderes.timetohhmm(r));
        r:=r+abstand;
      until r>=24;
    finally
      EndUpdate;
    end;
    end;

  form1.ListBoxDiagramm.Items.Assign(form1.RSLineChart.Values);
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;


{-----------------------------------------------------------------------------
  Description:  Sonnenhöhe über Azimut  im Diagramm ausgeben
  Procedure:    HAz
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.HAz;
var abstand:real;
    TS:TTimeSpecification;
begin
  abstand:=1/anzPunkte;

  SettingsDay(form1.RSLineChart,false);

  if umathe.IsNullstelleOfDay(sonne.getEle,US.TS) then
    begin
    form1.RSSonnenaufgang.Values.Clear;
    TS:=US.ts;
    ts.time:=umathe.NullstelleOfDay(sonne.getEle,US.TS,yes);
    form1.RSSonnenaufgang.Values.Add(sonne.getAzi(ts),-1000);
    form1.RSSonnenaufgang.Values.Add(sonne.getAzi(ts),1000);

    form1.RSSonnenuntergang.Values.Clear;
    ts.time:=umathe.NullstelleOfDay(sonne.getEle,US.TS,no);
    form1.RSSonnenuntergang.Values.Add(sonne.getAzi(ts),-1000);
    form1.RSSonnenuntergang.Values.Add(sonne.getAzi(ts),1000);
    end;

  with  form1.RSLineChart do
    begin
    BeginUpdate;
    try
      parent:=form1.RSChartPanel1;
      values.Clear;
      visible:=true;

      Parent.Header.Text:='Sonnenhöhe über Azimut';
      Parent.LeftAxis.Title.Text:='Höhe in °';
      parent.LeftAxis.LabelIncrement:=5;
      Parent.BottomAxis.LabelStyle:=alsValue;

      TS:=US.ts;
      ts.time:=umathe.ExtremXOfDay(sonne.getEle,US.TS,true);
      parent.LeftAxis.Maximum:=uanderes.Aroundto(sonne.getEle(ts),5,true);  //hier berechnet er den höchsten punkt und rundet dann auf
      ts.time:=umathe.ExtremXOfDay(sonne.getEle,US.TS,false);
      parent.LeftAxis.Minimum:=uanderes.Aroundto(sonne.getEle(ts),5,false); //hier berechnet er den niedrigsten punkt und rundet dann ab

      TS:=US.ts;
      ts.time:=US.SeltoUTC(0);
      repeat
        values.add(sonne.getAzi(ts),
                  sonne.getEle(ts),
                  uanderes.timetohhmm(ts.time));
        ts.time:=ts.time+abstand;
      until ts.time>=US.SeltoUTC(24);
    finally
      EndUpdate;
    end;
    end;

  form1.ListBoxDiagramm.Items.Assign(form1.RSLineChart.Values);
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    RelHTime
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.RelHTime;
var r,abstand:real;

  TS:TTimeSpecification;
begin
  abstand:=1/anzPunkte;
  r:=0;

  SettingsDay(form1.RSLineChart);
  with  form1.RSLineChart do
    begin
    BeginUpdate;
    try
      Parent.Header.Text:='Relative Sonnenhöhe auf dem Solarpanel';
      Parent.LeftAxis.Title.Text:='Höhe in °';
      parent.LeftAxis.LabelIncrement:=5;

      ts:=us.TS;
      if us.FixedPanel then
        begin
        ts.time:=umathe.ExtremXOfDay(solarkollektoren.RelElevation,US.TS,true);
        parent.LeftAxis.Maximum:=uanderes.Aroundto(solarkollektoren.RelElevation(ts),5,true);  //hier berechnet er den höchsten punkt und rundet dann auf
//        parent.LeftAxis.Maximum:=100;  //hier berechnet er den höchsten punkt und rundet dann auf
        ts.time:=umathe.ExtremXOfDay(solarkollektoren.RelElevation,US.TS,false);
        parent.LeftAxis.Minimum:=uanderes.Aroundto(solarkollektoren.RelElevation(ts),5,false); //hier berechnet er den niedrigsten punkt und rundet dann ab
        end
      else
        begin
        parent.LeftAxis.Maximum:=100;
        parent.LeftAxis.Minimum:=0;
        end;

      if us.FixedPanel then
        repeat
          with us.TS do
            values.add(r,
                       solarkollektoren.RelElevation(TimeSpecification(BG,LG,Azi,Ele,US.SeltoUTC(r),day,month,year)),
                       uanderes.timetohhmm(r));
          r:=r+abstand;
        until r>=24
      else
        begin
        values.add(0, 90, uanderes.timetohhmm(0));
        values.add(24,90, uanderes.timetohhmm(24));
        end;
    finally
      EndUpdate;
    end;
    end;

  form1.ListBoxDiagramm.Items.Assign(form1.RSLineChart.Values);
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    saveRSSonnenaufgang
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.saveRSSonnenaufgang;
var x:real;
begin
  form1.RSSonnenaufgang.Values.Clear;
  x:=US.UTCtoSel(umathe.NullstelleOfDay(sonne.getEle,US.TS,yes));
  form1.RSSonnenaufgang.Values.Add(x,-1000);
  form1.RSSonnenaufgang.Values.Add(x,1000);
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    saveRSSonnenuntergang
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.saveRSSonnenuntergang;
var x:real;
begin
  form1.RSSonnenuntergang.Values.Clear;
  x:=US.UTCtoSel(umathe.NullstelleOfDay(sonne.getEle,US.TS,no));
  form1.RSSonnenuntergang.Values.Add(x,-1000);
  form1.RSSonnenuntergang.Values.Add(x,1000);
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    DayEnergy
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.DayEnergy;
var r,abstand:real;

  TS:TTimeSpecification;
begin
  abstand:=1/anzPunkte;
  r:=0;

  SettingsDay(form1.RSLineChart);
  with  form1.RSLineChart do
    begin
    BeginUpdate;
    try
      Parent.Header.Text:='Leistungsdiagramm';
      Parent.LeftAxis.Title.Text:='Leistung in W/m^2';
      parent.LeftAxis.LabelIncrement:=10;
      Parent.BottomAxis.LabelStyle:=alsValue;

      ts:=us.TS;
      ts.time:=umathe.ExtremXOfDay(solarkollektoren.CalcEnergy,US.TS,true);
      parent.LeftAxis.Maximum:=uanderes.Aroundto(solarkollektoren.CalcEnergy(ts),10,true);  //hier berechnet er den höchsten punkt und rundet dann auf
{      ts.time:=umathe.ExtremX(solarkollektoren.CalcEnergy,US.TS,false);
      parent.LeftAxis.Minimum:=uanderes.Aroundto(solarkollektoren.CalcEnergy(ts),10,false); //hier berechnet er den niedrigsten punkt und rundet dann ab}
      parent.LeftAxis.Minimum:=0;

      repeat
        with us.TS do
          values.add(r,
                     solarkollektoren.CalcEnergy(TimeSpecification(BG,LG,Azi,Ele,US.SeltoUTC(r),day,month,year)),
                     uanderes.timetohhmm(r));
        r:=r+abstand;
      until r>=24;
    finally
      EndUpdate;
    end;
    end;

  form1.ListBoxDiagramm.Items.Assign(form1.RSLineChart.Values);
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    YearEnergy
  Arguments:    ausgabe:Tlabel=nil
  Result:       extended
  Detailed description:
-----------------------------------------------------------------------------}
function TDiagrammBerech.YearEnergy(ausgabe:Tlabel=nil):extended;
var  i,j,lauf,genauigkeit:integer;
  TS:TTimeSpecification;
    energy:real;
begin
  result:=0;
  if not uanderes.ADialog(genauigkeit,'Genauigkeit der Berechnung','Gib bitte die Genauigkeit an, in Bruchteilen einer Stunde (größer = genauer)',10,1,3600) then exit;

  SettingsYear(form1.RSLineChart);
  with  form1.RSLineChart do
    begin
    try
      Parent.Header.Text:='Energie der Solarzellen über den Tagen des Jahres';
      Parent.LeftAxis.Title.Text:='Energie in kWh/m^2';
      parent.LeftAxis.LabelIncrement:=20;

      ts:=us.TS;

      ts:=umathe.ExtremXOfYear(solarkollektoren.CalcDayEnergy,US.TS,true,1/4);
      parent.LeftAxis.Maximum:=uanderes.Aroundto(solarkollektoren.CalcDayEnergy(ts)/3600000,1,true);  //hier berechnet er den höchsten punkt und rundet dann auf
      parent.LeftAxis.Minimum:=0;
      parent.LeftAxis.LabelIncrement:=0.2;
      parent.LeftAxis.Grid.DrawOptions := [goDrawMajorGrid, goDrawTickMarks];

      result:=0;
      lauf:=0;
      for i:=1 to 12 do
        begin
        if stop then break;
        BeginUpdate;
        for j:=1 to uanderes.monatslaenge(i,us.ts.year) do
          begin
          if stop then break;
          with us.TS do
            energy:=solarkollektoren.CalcDayEnergy(TimeSpecification(BG,LG,Azi,Ele,time,j,i,year),genauigkeit)/3600000;
          result:=result  + energy  ;
          if assigned(ausgabe) then
            ausgabe.Caption:='Bitte Warten...   Tag '+inttostr(j)+'  Monat '+inttostr(i);

          values.Add;
          Values[lauf].XAsDateTime:= EncodeDate(us.TS.year,i,j);
          Values[lauf].Value:= energy;
          Values[lauf].Caption:= inttostr(j)+'.'+montostr(i);
          application.ProcessMessages;
          inc(lauf);
          end;
        EndUpdate;
        end;
    finally
    end;

    form1.ListBoxDiagramm.Items.Assign(Values);
    if assigned(ausgabe) then
      ausgabe.Caption:=inttostr(round(result))+' kWh';
    end;
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    YearSunElevation
  Arguments:    AusgabeMin,AusgabeMax:Tlabel
  Result:       none
  Detailed description:
-----------------------------------------------------------------------------}
procedure TDiagrammBerech.YearSunElevation(AusgabeMin,AusgabeMax:Tlabel);
var  i,j,lauf,genauigkeit:integer;
  TS:TTimeSpecification;
    temp,maxbeta,minbeta:real;
begin
  if not uanderes.ADialog(genauigkeit,'Genauigkeit der Berechnung','Gib bitte die Genauigkeit an, in Bruchteilen einer Stunde (größer = genauer)',100,1,3600) then exit;

  with us.TS do
    maxbeta:=sonne.DayMaxEle(us.TS);
  minbeta:=maxbeta;

  SettingsYear(form1.RSLineChart);
  with  form1.RSLineChart do
    begin
    try
      Parent.Header.Text:='Tageshöchststand der Sonne über den Tagen des Jahres';
      Parent.LeftAxis.Title.Text:='Höchststand des Tages in °';
      parent.LeftAxis.LabelIncrement:=20;

      ts:=us.TS;
      ts:=umathe.ExtremXOfYear(sonne.DayMaxEle,TS,true);
      parent.LeftAxis.Maximum:=uanderes.Aroundto(sonne.DayMaxEle(ts),2,true);  //hier berechnet er den höchsten punkt und rundet dann auf
      ts:=umathe.ExtremXOfYear(sonne.DayMaxEle,TS,false);
      parent.LeftAxis.Minimum:=uanderes.Aroundto(sonne.DayMaxEle(ts),2,false);

      parent.LeftAxis.LabelIncrement:=2;
      parent.LeftAxis.Grid.DrawOptions := [goDrawMajorGrid, goDrawTickMarks];

      maxbeta:=0;
      lauf:=0;
      for i:=1 to 12 do
        begin
        if stop then break;
        BeginUpdate;
        for j:=1 to uanderes.monatslaenge(i,us.ts.year) do
          begin
          if stop then break;
          with us.TS do
            temp:=sonne.DayMaxEle(TimeSpecification(BG,LG,Azi,Ele,time,j,i,year),genauigkeit);
          if temp>maxbeta then
            maxbeta:=temp
          else if temp<maxbeta then
            minbeta:=temp;

          if assigned(AusgabeMax) then
            AusgabeMax.Caption:= 'Bitte warten...';
          if assigned(AusgabeMin) then
            AusgabeMin.Caption:= 'Bitte warten...';

          values.Add;
//          Values[lauf].XAsDateTime:= EncodeDateTime(us.TS.year,i,j,12,30,0,0);
          Values[lauf].XAsDateTime:= EncodeDate(us.TS.year,i,j);
          Values[lauf].Value:= temp;
          Values[lauf].Caption:= inttostr(j)+'.'+montostr(i);
          application.ProcessMessages;
          inc(lauf);
          end;
        EndUpdate;
        end;
    finally
    end;

    form1.ListBoxDiagramm.Items.Assign(Values);
    end;

  if assigned(AusgabeMax) then
    AusgabeMax.Caption:= Format('%f°', [maxbeta]);
  if assigned(AusgabeMin) then
    AusgabeMin.Caption:= Format('%f°', [minbeta]);
  with form1.RSLineChart.Parent do
    EndDrawChart(SavingChartCol(LeftAxis.LabelIncrement,LeftAxis.Minimum,LeftAxis.Maximum,BottomAxis.LabelIncrement,BottomAxis.Minimum,BottomAxis.Maximum));
end;







procedure TForm1.RSChartPanel1Change(Sender: TObject);
begin
  //stellt die länge der x Linie ein damit  er nicht so viel zu berechnen hat
    // es wird immer die maximal sichtbare x länge genommen
  self.RS0Line.Values.Items[0].X:=self.RSChartPanel1.BottomAxis.ZoomMinimum;
  self.RS0Line.Values.Items[1].X:=self.RSChartPanel1.BottomAxis.ZoomMaximum;

  //stellt die Höhe der Sonnenaufgangs linien ein, damit er nicht so viel zu berechnen hat
  if (self.RSSonnenaufgang.Values.Count >=2)and(self.RSSonnenuntergang.Values.Count >=2) then    
    begin
    self.RSSonnenaufgang.Values.Items[0].Y:=self.RSChartPanel1.LeftAxis.ZoomMinimum;
    self.RSSonnenaufgang.Values.Items[1].Y:=self.RSChartPanel1.LeftAxis.ZoomMaximum;

    self.RSSonnenuntergang.Values.Items[0].Y:=self.RSChartPanel1.LeftAxis.ZoomMinimum;
    self.RSSonnenuntergang.Values.Items[1].Y:=self.RSChartPanel1.LeftAxis.ZoomMaximum;

  //falls gefordert kann er es hier auch ausgeben
{    if form1.Log then form1.ListLog.Items.Add('RSSonnenaufgang Minimum= '+Format('%f', [self.RSSonnenaufgang.Values.Items[0].Y]));
    if form1.Log then form1.ListLog.Items.Add('RSSonnenaufgang Maximum= '+Format('%f', [self.RSSonnenaufgang.Values.Items[1].Y]));}
    end;

  //falls gefordert kann er es hier auch ausgeben
{  if form1.Log then form1.ListLog.Items.Add('0Line Minimum= '+Format('%f', [self.RS0Line.Values.Items[0].X]));
  if form1.Log then form1.ListLog.Items.Add('0Line Maximum= '+Format('%f', [self.RS0Line.Values.Items[1].X]));}
end;






procedure TForm1.AcLogExecute(Sender: TObject);
begin
  Log:=not Log;
end;

procedure TForm1.AcStopExecute(Sender: TObject);
begin
  stop:=true;                                 //escape
end;

end.






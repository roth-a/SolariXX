{-----------------------------------------------------------------------------
 Unit Name: Unit2
 Author:    Alexander Roth
 Date:      26-Feb-2006
 Lizenshinweise:
     Dieses Programm wurde geschrieben von Alexander Roth

    Dieses Programm ist freie Software. Sie können es unter den Bedingungen
    der GNU General Public License, wie von der Free Software Foundation
    veröffentlicht, weitergeben und/oder modifizieren, gemäß Version 2 der Lizenz.
 Description:  Unit zur 2. Form mit den Infos zum Programm
-----------------------------------------------------------------------------}
unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls,shellapi, StdCtrls, ExtCtrls,WinInet, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TForm2 = class(TForm)
    TabSheetControl: TPageControl;
    Information: TTabSheet;
    Links: TTabSheet;
    Homepage: TLabel;
    Label1: TLabel;
    EmailKontakt: TLabel;
    Lizenzbedingungen: TTabSheet;
    Memo2: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    Memo3: TMemo;
    TabUpdate: TTabSheet;
    BCheckUpdate: TButton;
    LInternetState: TLabel;
    LHomepage: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RichInfo: TRichEdit;
    procedure HomepageClick(Sender: TObject);
    procedure Memo3DblClick(Sender: TObject);
    procedure EmailKontaktClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure BCheckUpdateClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    IdHTTP1: TIdHTTP;
  end;

var
  Form2: TForm2;

implementation
uses unit1,uanderes;

{$R *.dfm}


procedure TForm2.HomepageClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', ('http://www.roth.us.ms'), nil, nil, SW_ShowNormal);
end;

procedure TForm2.Memo3DblClick(Sender: TObject);
begin
  close;
end;

procedure TForm2.EmailKontaktClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', ('mailto:roth-a@gmx.de'), nil, nil, SW_SHOWNA);
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  form1.FormKeyDown(sender,key,shift);
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  self.Caption:=form1.Caption+'                 Infos zum Programm';
  self.TabSheetControl.ActivePage:=Information;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  IdHTTP1 := TIdHTTP.Create(Self);
  with IdHTTP1 do
  begin
    Name := 'IdHTTP1';
    AllowCookies := True;
    ProxyParams.BasicAuthentication := False;
    ProxyParams.ProxyPort := 0;
    Request.ContentLength := -1;
    Request.Accept := 'text/html, */*';
    Request.BasicAuthentication := False;
    Request.UserAgent := 'Mozilla/3.0 (compatible; Indy Library)';
    HTTPOptions := [hoForceEncodeParams];
  end;
end;

procedure TForm2.Label3Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, 'open', ('http://www.delphipraxis.net'), nil, nil, SW_ShowNormal);
end;



{-----------------------------------------------------------------------------
  Description:  Update Check
  Procedure:    BCheckUpdateClick
  Arguments:    Sender: TObject
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TForm2.BCheckUpdateClick(Sender: TObject);
var s:string;
begin
  If  InternetGetConnectedState(nil, 0) then
    try
      s:= IdHTTP1.Get('http://alexander.freewebspace4all.de/MeineProgramme/VersionSolariXX.txt');
      korrigiere(s,['.','0'..'9']);
      If (s <> version) then
        begin
        self.LInternetState.Caption:='Es ist eine neue Version '+s+' verfügbar. Bitte downloade sie doch';
        self.LHomepage.Visible:=true;
        end
      else
        begin
        self.LInternetState.Caption:='Du hast bereits die neuste Version';
        self.LHomepage.Visible:=false;
        end;
    except
      self.LInternetState.Caption:='Ich habe wohl etwas an meiner Homepage geändert. Bitte besuche sie doch und lade das neuste Programm runter';
      self.LHomepage.Visible:=true;
    end
  else
    self.LInternetState.Caption:='Verbinde dich bitte mit dem Internet, damit diese Update Prüfung gemacht werden kann.';

end;

end.

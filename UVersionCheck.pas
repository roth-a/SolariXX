{-----------------------------------------------------------------------------
 Unit Name: UVersionCheck
 Author:    Verschiedene Autoren aus dem Delphi-Praxis Forum
 Description:
  Diese Unit Kapselt die Klasse TGetRemoteVersionThread die es ermöglicht ein Programm
  zu updaten.
  Vielen Dank an die  Autoren aus dem Delphi-Praxis Forum  (besonders danke ich Matze)
-----------------------------------------------------------------------------}

unit UVersionCheck;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WinInet;

type
type
  TGetRemoteVersionThread = class(TThread)
  private
    procedure UpdateCaption;
  protected
    procedure Execute; override;
  public
    CurrentVersionStr, RemoteVersion: string; //FileVersion, RemoteVersion
  end;

implementation


// =============================================================================
// FUNCTION: GetVersion
// DESCRIPTION:
//   Reads the current version of the application
// RESULT: Version (String)
// =============================================================================
function GetVersion: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfo := nil;
  try
    VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
    try
      GetMem(VerInfo, VerInfoSize);
      GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
      VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
      with VerValue^ do
      begin
        Result := Format('%d.%d.%d.%d',
          [dwFileVersionMS shr 16,
          dwFileVersionMS and $FFFF,
          dwFileVersionLS shr 16,
          dwFileVersionLS and $FFFF]);
      end;
    finally
      FreeMem(VerInfo, VerInfoSize);
    end;
  except
    Result:= #$31#$2E#$30; // 1.0
  end;
end;

// =============================================================================
// FUNCTION: LoadURL
// DESCRIPTION:
//   Reads the current version of the application
// PARAMETER:
//   +URL: Url of the file including the version
// RESULT: Version (String)
// =============================================================================
function LoadURL(URL: String): String;
var
  IOpen, IURL: HINTERNET;
  Read: Cardinal;
  Msg: array[0..4096] of Char;
begin
  Result := '';
  IOpen := InternetOpen('GetIP', INTERNET_OPEN_TYPE_PRECONFIG, '', '',
                        INTERNET_FLAG_NEED_FILE);
  if IOpen <> nil then
  try
    IURL := InternetOpenUrl(IOpen, PAnsiChar(URL), nil, 0,
                            INTERNET_FLAG_NO_UI or INTERNET_FLAG_PRAGMA_NOCACHE
                            or INTERNET_FLAG_RELOAD, 0);
    if IURL <> nil then
    try
      repeat
        FillChar(Msg, SizeOf(Msg), 0);
        if InternetReadFile(IURL, @Msg[0], Pred(SizeOf(Msg)), Read) then
          Result := Result + Msg else
            Break;
      until Read = 0;
    finally
      InternetCloseHandle(IURL);
    end;
  finally
    InternetCloseHandle(IOpen);
  end;
end;

// =============================================================================
// PROCEDURE: UpdateCaption
// DESCRIPTION:
//   Updates the Label captios of the formaular
// =============================================================================
procedure TGetRemoteVersionThread.UpdateCaption;
begin
  with Form1 do
  begin
    // Could not get data
    if RemoteVersion = '' then
    begin
      LblVersionStatus.Caption := 'An error occured.' + #13#10 + 'Note: ' +
                                  'You must be connected to the internet';
    end else
    if RemoteVersion = CurrentVersionStr then
      LblVersionStatus.Caption := 'You have the newest version installed' else
        LblVersionStatus.Caption := 'A newer version is available.';

    LblCurrentVer.Caption := CurrentVersionStr;
    LblOnlineVer.Caption := RemoteVersion;
  end;
end;

// =============================================================================
// PROCEDURE: Execute
// DESCRIPTION:
//   Starts the thread whichs checks the version
// =============================================================================
procedure TGetRemoteVersionThread.Execute;
const
  BaseURL = 'http://www.pri-dev.net/temp/dp/';
  VersionFile = 'version.txt';
begin
  try
    if InternetGetConnectedState(nil, 0) then
    begin
      // get remote version
      RemoteVersion := LoadURL(BaseURL + VersionFile);

      // get current version
      CurrentVersionStr := GetVersion;

      Synchronize(UpdateCaption);
    end;
  except
  end;
end;

// =============================================================================
// PROCEDURE: BtnCheckVerClick
// DESCRIPTION:
//   Call the Thread etc
// =============================================================================
{procedure TForm1.BtnCheckVerClick(Sender: TObject);
var
  Thread: TGetRemoteVersionThread;
begin
  Thread := TGetRemoteVersionThread.Create(True);
  Thread.FreeOnTerminate := True;
  Thread.Resume;
end;}

end.
 
{-----------------------------------------------------------------------------
 Unit Name: Utxt
 Author:    Alexander Roth
 Date:      21-Jul-2006
 Lizenshinweise:
     Dieses Programm wurde geschrieben von Alexander Roth

    Dieses Programm ist freie Software. Sie können es unter den Bedingungen
    der GNU General Public License, wie von der Free Software Foundation
    veröffentlicht, weitergeben und/oder modifizieren, gemäß Version 2 der Lizenz.
 Description:  Unit um in eine Txt Datei zu schreiben
              Beispielsweise um daten zu speichern
-----------------------------------------------------------------------------}
unit Utxt;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,IniFiles, Shellapi, Gauges, ExtCtrls, StdCtrls, ComCtrls, Menus,dateutils,  JvSpin, Mask, JvExMask,bmspinedit;


  procedure DelDubbleExtension(var path:string; const extension:string);
  procedure intxtschreiben(text:string;  pfad:string='';  const endung:string='.txt'; vorherloschen:boolean=true);
  procedure schreibeini(pfad:string);
  procedure leseini(pfad:string);


implementation
uses unit1,unit3,unit2;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    DelDubbleExtension
  Arguments:    var path:string; const extension:string
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure DelDubbleExtension(var path:string; const extension:string);
var    index:integer;
begin
  index:=pos(  extension  , path  );
  while index>0  do
    begin
    delete(path,index,4);
    index:=pos(  extension  , path  );
    end;
  path:=path+extension;
end;




{-----------------------------------------------------------------------------
  Description:  Schreibt in eine TXT rein
  Procedure:    intxtschreiben
  Arguments:    text:string; pfad:string=''; vorherloschen:boolean=true
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure intxtschreiben(text:string;  pfad:string='';  const endung:string='.txt'; vorherloschen:boolean=true);
var txt:textfile;
    index:integer;
begin
  if  pfad='' then
    pfad:=ExtractFilePath(Application.ExeName)+dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten'+endung
  else
    DelDubbleExtension(pfad,endung);

  try
    assignfile(txt,pfad);
    if (fileexists(pfad))and(not vorherloschen) then append(txt) else rewrite(txt);
    writeln(txt,text);
    closefile(txt);
  except
    showmessage('Es konnte keine Datei erstellt werden!'+chr(13)+
          'Falls Sie das Programm von CD Starten kopieren Sie bitte die *.exe auf ihre Festplatte und starten Sie erneut!');
  end;
end;




{-----------------------------------------------------------------------------
  Description:  Schreibt in eine INI
  Procedure:    schreibeini
  Arguments:    pfad:string
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure schreibeini(pfad:string);
const endung='.ini';
var ini:TInifile;
     i:integer;


    procedure writeValues(comp:Tcomponent);
    var     i:integer;
    begin
      with comp do
        for i:=0 to ComponentCount -1 do
          begin
          if Components[i] is TEdit then
            ini.WriteString(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,Tedit(Components[i]).Text);
          if Components[i] is TBMSpinEdit then
            ini.WriteFloat(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TBMSpinEdit(Components[i]).Value);
          if Components[i] is TJVSpinEdit then
            ini.WriteFloat(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TJVSpinEdit(Components[i]).Value);
          if Components[i] is TRadioButton then
            ini.WriteBool(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TRadioButton(Components[i]).Checked);
          if Components[i] is TComboBox then
            ini.WriteInteger(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TComboBox(Components[i]).ItemIndex);
          end;
    end;
begin
  try
    if  pfad='' then
      pfad:=ExtractFilePath(Application.ExeName)+dateToStr(now)+'  '+inttostr(hourof(now))+' Uhr und '+inttostr(minuteof(now))+' Minuten'+endung
    else //macht doppelte endungen weg
      DelDubbleExtension(pfad,endung);

  //hier schreibt er alle Einstellungen in die Ini Datei,
  // egal ob die Datei vorher schon Existiert hat, es wird einfach überschrieben
  //hier in der ersten zeile wird die Ini datei mit create kreiert
    ini:=tinifile.Create(pfad);

    //hier läuft er alle Komponenten von Form1 durch und speichert die Werte
    writeValues(form1);
    writeValues(FormSetting);
{    with form1 do
      for i:=0 to ComponentCount -1 do
        if Components[i] is TGroupbox then
          writeValues(Components[i]);}

  except
    showmessage('Es konnte keine Datei erstellt werden!'+chr(13)+
          'Falls Sie das Programm von CD Starten kopieren Sie bitte die *.exe auf ihre Festplatte und starten Sie erneut!');
  end;
  ini.Free;
end;





{-----------------------------------------------------------------------------
  Description:  Liest aus einer INI
  Procedure:    leseini
  Arguments:    pfad:string
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure leseini(pfad:string);
var ini:TInifile;
     i:integer;


    procedure readValues(comp:Tcomponent);
    var     i:integer;
    begin
      with comp do
        for i:=0 to ComponentCount -1 do
          begin
          if Components[i] is TEdit then
            Tedit(Components[i]).Text:=ini.readString(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,Tedit(Components[i]).Text);
          if Components[i] is TBMSpinEdit then
            TBMSpinEdit(Components[i]).Value:=ini.ReadFloat(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TBMSpinEdit(Components[i]).Value);
          if Components[i] is TJVSpinEdit then
            TJVSpinEdit(Components[i]).Value:=ini.ReadFloat(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TJVSpinEdit(Components[i]).Value);
          if Components[i] is TRadioButton then
            TRadioButton(Components[i]).Checked:=ini.readBool(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TRadioButton(Components[i]).Checked);
          if Components[i] is TComboBox then
            TComboBox(Components[i]).ItemIndex:=ini.readInteger(comp.Owner.Name+' '+comp.Name+' '+Components[i].ClassName,Components[i].Name,TComboBox(Components[i]).ItemIndex);
          end;
    end;
begin
  ini:=tinifile.Create(pfad);
  try
    try
      if fileexists(pfad) then
        begin
        //hier läuft er alle Komponenten durch und liest die Werte
        readValues(form1);
        readValues(FormSetting);
{        with form1 do
          for i:=0 to ComponentCount -1 do
            if Components[i] is TGroupbox then
              readValues(Components[i]);}
        end;
    except
      showmessage('Es konnte keine Datei erstellt werden!'+chr(13)+
            'Falls Sie das Programm von CD Starten kopieren Sie bitte die *.exe auf ihre Festplatte und starten Sie erneut!');
    end;
  finally
    ini.Free;
  end;
end;




end.

{-----------------------------------------------------------------------------
 Unit Name: Not available
 Author:    Alexander Roth
 Date:      21-Jul-2006
 Lizenshinweise:
     Dieses Programm wurde geschrieben von Alexander Roth

    Dieses Programm ist freie Software. Sie können es unter den Bedingungen
    der GNU General Public License, wie von der Free Software Foundation
    veröffentlicht, weitergeben und/oder modifizieren, gemäß Version 2 der Lizenz.
 Description:  Projektdatei
-----------------------------------------------------------------------------}
program SolariXX;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  USolar in 'USolar.pas',
  Utxt in 'Utxt.pas',
  Uanderes in 'Uanderes.pas',
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {FormSetting},
  UMathe in 'UMathe.pas';

{$R *.res}
{$R xyz.res}


begin
  Application.Initialize;
  Application.Title := 'SolariXX';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TFormSetting, FormSetting);
  Application.Run;
end.

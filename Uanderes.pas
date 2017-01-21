{-----------------------------------------------------------------------------
 Unit Name: Uanderes
 Author:    Alexander Roth
 Date:      21-Jul-2006
 Lizenshinweise:
     Dieses Programm wurde geschrieben von Alexander Roth

    Dieses Programm ist freie Software. Sie können es unter den Bedingungen
    der GNU General Public License, wie von der Free Software Foundation
    veröffentlicht, weitergeben und/oder modifizieren, gemäß Version 2 der Lizenz.
 Description:  Sammlung vieler kleiner diverser nützlicher Funktionen und Prozeduren
-----------------------------------------------------------------------------}
unit Uanderes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls,math,StdCtrls,JclFileUtils;



type
      Tsetofchar=set of char;

      TThreePos=(Yes,No,Irr);  //irr = irrelevant


    function RandomBool:boolean;
    function bootostr(b:boolean):string;
    function boolsign(a:boolean):shortint;
    function boolUngleich(a,b:boolean):boolean;
    function boolGleich(a,b:boolean):boolean;

    procedure korrigiere(var s:String; const zeichen:Tsetofchar=['0'..'9','-',',']; DelDoublePoint:boolean=true); overload;
    procedure korrigiere(var edit:Tedit; const zeichen:Tsetofchar=['0'..'9','-',',']); overload;
    procedure korrigiere(var r:real; const min,max:real);         overload;
    procedure korrigiere(var w:word; const min,max:word);         overload;
    procedure korrigiere(var w:integer; const min,max:integer);         overload;
    procedure korrigiere(var w:byte; const min,max:byte);         overload;
    function  ADialog(var return:integer; const cap,text:string; start,min,max:integer):boolean;    overload;
    function  ADialog(var return:string; const cap,text:string; zeichen:Tsetofchar=['0' .. '9',#22,#3,#8]):boolean;        overload;

    function Asign(wert:real):shortint; overload;
    function Asign(wert:integer):shortint; overload;
    function RandomSign:shortint;

    function Aroundto(zahl:real; Vielfaches:word; Aufrunden:boolean):integer;

    procedure timetohhmmss(const r:real; var hh,mm,ss:byte); overload;
    function timetohhmmss(r:real):string;                    overload;
    procedure timetohhmm(r:real; var hh,mm:byte);    overload;
    function timetohhmm(r:real):string;                      overload;
    function hhmmsstotime(hh,mm,ss:real; msec:word):real;    overload;
    function hhmmsstotime(hh,mm,ss:real):real; overload;
    function hhmmsstotime(hh,mm:real):real;   overload;

    function schaltjahr(year:longint):boolean;
    function monatslaenge(mon:byte; year:integer):integer;
    function gregtojul(day,mon:byte; year:word):extended;overload;
    function gregtojul(time:real; day,mon,year:word):extended;overload;
    function gregtojul(hour,min,sec,day,mon,year:word):extended;overload;
    procedure jultogreg(var day,mon,year:integer; const juldatum:real);
    function montostr(zahl:byte):string;

    function modulo(zahl,red:extended; Positive:boolean=false):extended;
    function radtoBog(Rad:extended):extended;
    function BogtoRad(Bog:extended):extended;

    function GetFileVersion(FileName: string): string;

    procedure DivideString(s:string; const Separator, DivideList:TStrings);

implementation
uses unit1;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    RandomBool
  Arguments:    None
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function RandomBool:boolean;
begin
  result:=random(2)=0  ;
end;


{-----------------------------------------------------------------------------
  Procedure:    bootostr
  Arguments:    b:boolean
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function bootostr(b:boolean):string;
begin
  //   if b then result:='Wahr' else result:='Falsch';
  //   if b then result:='True' else result:='False';
  if b then result:='Ja' else result:='Nein';
end;


{-----------------------------------------------------------------------------
  Description:  Gibt den Werte eines Boolean als 1 oder -1 aus
  Procedure:    boolsign
  Arguments:    a:boolean
  Result:       shortint
  Detailed description:
-----------------------------------------------------------------------------}
function boolsign(a:boolean):shortint;
begin
  if a then
    result:=1
  else
    result:=-1;
end;



{-----------------------------------------------------------------------------
  Description:  Vergleicht boolean  a<>b then true
  Procedure:    boolUngleich
  Arguments:    a,b:boolean
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function boolUngleich(a,b:boolean):boolean;
begin
  result:=true;                                              // Überprüfung durch überprüfung des Gegenteils
  if (a and b) or  (not(a) and not(b))  then result:=false;
end;

{-----------------------------------------------------------------------------
  Description:   a=b then true
  Procedure:    boolGleich
  Arguments:    a,b:boolean
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function boolGleich(a,b:boolean):boolean;
begin
  result:=false;                                            
  if (a and b) or  (not(a) and not(b))  then result:=true;
end;







{-----------------------------------------------------------------------------
  Description:  Löscht Zeichen die da nicht reinpassen
  Procedure:    korrigiere
  Arguments:    var s:String; const zeichen:Tsetofchar   ; DelDoublePoint:boolean=true
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure korrigiere(var s:String; const zeichen:Tsetofchar=['0'..'9','-',',']; DelDoublePoint:boolean=true);
var c : word;
    schonkomma:boolean;
begin
  schonkomma:=false;
  c:=1;
  while c<= length(s) do
    begin
    if not(s[c] in zeichen)  then
      delete(s,c,1)
    else
      begin
      if DelDoublePoint and (s[c]=',') then
        if not schonkomma then
          begin
          schonkomma:=true;
          inc(c);
          end
        else
          delete(s,c,1)         //doppelte Komma löschen
      else
        inc(c);
      end;
    end;
end;
{-----------------------------------------------------------------------------
  Description:  Direkt edite Korrigieren
  Arguments:    var edit:Tedit; const zeichen:Tsetofchar=['0'..'9','-',',']
-----------------------------------------------------------------------------}
procedure korrigiere(var edit:Tedit; const zeichen:Tsetofchar=['0'..'9','-',',']);
var s:string;
begin
  s:=edit.Text ;
  korrigiere(s,zeichen);
  edit.Text:=s ;
end;
{-----------------------------------------------------------------------------
  Description:  Korrigiere real Zahl
  Arguments:    var r:real; const max,min:real
-----------------------------------------------------------------------------}
procedure korrigiere(var r:real; const min,max:real);
begin
  if max<=min then exit;

  if r<min then r:=min;
  if r>max then r:=max;
end;
{-----------------------------------------------------------------------------
  Description:  Korrigiere Word Zahl
  Arguments:    var r:word; const max,min:word
-----------------------------------------------------------------------------}
procedure korrigiere(var w:word; const min,max:word);
begin
  if max<=min then exit;

  if w<min then w:=min;
  if w>max then w:=max;
end;
{-----------------------------------------------------------------------------
  Description:  Korrigiere integer Zahl
  Arguments:    var r:integer; const max,min:integer
-----------------------------------------------------------------------------}
procedure korrigiere(var w:integer; const min,max:integer);
begin
  if max<=min then exit;

  if w<min then w:=min;
  if w>max then w:=max;
end;
{-----------------------------------------------------------------------------
  Description:  Korrigiere byte Zahl
  Arguments:    var r:byte; const max,min:byte
-----------------------------------------------------------------------------}
procedure korrigiere(var w:byte; const min,max:byte);
begin
  if max<=min then exit;

  if w<min then w:=min;
  if w>max then w:=max;
end;





{-----------------------------------------------------------------------------
  Description:  Eingabedialog
  Procedure:    ADialog
  Arguments:    var return:integer; const cap,text:string; start,min,max:integer
  Result:       boolean
  Detailed description:
                Gibt true zurück wenn OK
                wenn Canel dann false

                überprüft ob das eine Integer Zahl und korrigier wenn nötig
-----------------------------------------------------------------------------}
function  ADialog(var return:integer; const cap,text:string; start,min,max:integer):boolean;
var temps:string;
begin
  result:=false;
  temps:=inttostr(start);
  if dialogs.InputQuery(cap,text,temps) then
    if temps<>'' then
      begin
      korrigiere(temps,['0' .. '9','-']);
      if temps='' then
        return:=0
      else
        return:= strtoint(temps);
      if return>max then return:=max;
      if return<min then return:=min;
      result:=true;
      end;
end;
{-----------------------------------------------------------------------------
  Description:  Gibt String zurück und prüft auf Zeichen
  Arguments:    var return:string; const cap,text:string; zeichen:Tsetofchar
-----------------------------------------------------------------------------}
function  ADialog(var return:string; const cap,text:string; zeichen:Tsetofchar=['0' .. '9',#22,#3,#8]):boolean;
begin
  result:=false;
  if dialogs.InputQuery(cap,text,return) then
    begin
    if return='' then exit;
    result:=true;
    korrigiere(return,zeichen);
    end;
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    Asign
  Arguments:    wert:real
  Result:       shortint
  Detailed description:
-----------------------------------------------------------------------------}
function Asign(wert:real):shortint;
begin
  if wert<0 then
    result:=-1
  else
    result:=1;
end;
{-----------------------------------------------------------------------------
  Description:
  Arguments:    wert:integer
-----------------------------------------------------------------------------}
function Asign(wert:integer):shortint;
begin
  if wert<0 then
    result:=-1
  else
    result:=1;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    RandomSign
  Arguments:    None
  Result:       shortint
  Detailed description:
-----------------------------------------------------------------------------}
function RandomSign:shortint;
begin
  if random(2)=0  then
    result:=1
  else
    result:=-1;
end;




{-----------------------------------------------------------------------------
  Description:  Rundet auf eine Bestimmte Vorkomma Zahl
  Procedure:    Aroundto
  Arguments:    zahl:real; Vielfaches:word; Aufrunden:boolean
  Result:       cardinal
  Detailed description:
-----------------------------------------------------------------------------}
function Aroundto(zahl:real; Vielfaches:word; Aufrunden:boolean):integer;
begin
  if  Aufrunden then
    result:=(trunc(zahl/Vielfaches)  + 1) * Vielfaches
  else
    result:= (trunc(zahl/Vielfaches)  - 1) * Vielfaches;

{  showmessage('zahl= '+floattostr(zahl)+#13+'Vielfaches= '+inttostr(Vielfaches)+#13+'Aufrunden= '+booltostr(Aufrunden,true)+#13
              +'result= '+inttostr(result));}
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    timetohhmmss
  Arguments:    const r:real; var hh,mm,ss:byte
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure timetohhmmss(const r:real; var hh,mm,ss:byte);
begin
  timetohhmm(r,hh,mm);
  ss:=round(   ((r-hh)*60 - mm)*60    );
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    rtimetostime
  Arguments:    r:real
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function timetohhmmss(r:real):string;
var hh,mm,ss:byte;
begin
  result:=timetohhmm(r)+':';
  timetohhmmss(r,hh,mm,ss);

  if ss<10 then
    result:=result+'0';
  result:=result+inttostr(ss);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    timetohhmm
  Arguments:    const r:real; var hh,mm:byte
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure timetohhmm(r:real; var hh,mm:byte);
begin
  r:=modulo(r,24,true);
  hh:=trunc(r);
  mm:=trunc(  (r-trunc(r))*60);
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    rtimetohhmm
  Arguments:    r:real
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function timetohhmm(r:real):string;
var hh,mm:byte;
begin
  timetohhmm(r,hh,mm);
  result:=inttostr(hh)+':';
  if mm<10 then
    result:=result+'0';
  result:=result+inttostr(mm);
end;



{-----------------------------------------------------------------------------
  Procedure:    hhmmsstotime
  Arguments:    hh,mm,ss:byte; msec:word
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function hhmmsstotime(hh,mm,ss:real; msec:word):real;
begin
  result:=hh + mm/60 + ss/3600 + msec/3600/1000;
end;
{-----------------------------------------------------------------------------
  Arguments:    hh,mm,ss:byte
-----------------------------------------------------------------------------}
function hhmmsstotime(hh,mm,ss:real):real;
begin
  result:=hhmmsstotime(hh,mm,ss,0);
end;
{-----------------------------------------------------------------------------
  Arguments:    hh,mm,ss:byte
-----------------------------------------------------------------------------}
function hhmmsstotime(hh,mm:real):real;
begin
  result:=hhmmsstotime(hh,mm,0,0);
end;



{-----------------------------------------------------------------------------
  Description:  Prüft ob es ein Schaltjahr ist
  Procedure:    schaltjahr
  Arguments:    year:longint
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function schaltjahr(year:longint):boolean;
begin
  schaltjahr:= (year mod 4=0)and( (year mod 400=0)or(year mod 100 <>0));
end;



{-----------------------------------------------------------------------------
  Description:  schauen wie viele Tage der monat hat
  Procedure:    monatslaenge
  Arguments:    mon:byte; year:integer
  Result:       integer
  Detailed description:
-----------------------------------------------------------------------------}
function monatslaenge(mon:byte; year:integer):integer;
begin
  case mon of
    2: if schaltjahr(year) then monatslaenge:=29  else monatslaenge:=28;
    4,6,9,11 : monatslaenge:=30;
  else
    monatslaenge:=31;
  end;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    jultogreg
  Arguments:    var day,mon,year:INTEGER; const juldatum:real
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure jultogreg(var day,mon,year:integer; const juldatum:real);
const jd0=1721426;
var n400,r400,n100,r100,n4,r4,n1,lt,jd:integer;
    i:integer;
begin
  jd:=trunc(juldatum);

  N400 :=(JD - JD0) div 146097;
  R400 := (JD - JD0)mod 146097;
  N100 := R400 div 36524 ;
  R100 := R400 mod 36524;
  if (N100=4) then
  begin
    N100:=3;
    R100:=36524;
  end;
  N4 := R100 div 1461 ;
  R4 := R100 mod 1461 ;
  N1 := R4 div 365 ;
  LT := R4 mod 365 ;
  if (N1=4) then
  begin
    N1:=3;
    LT:=365;
  end;
  year := 400*N400 + 100*N100 + 4*N4 + N1  +1;
  day:=LT+1;

  mon:=1;  {das muss sein da sonst mon manchmal alt}
  for i:= 1 to 12 do
  begin
    if day<=monatslaenge(i,year) then break;
    day:=day-monatslaenge(i,year);
    mon:=i+1;
  end;
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    gregtojul
  Arguments:    day,mon,year:longint
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function gregtojul(time:real; day,mon,year:word):extended;
var y,a,b:real;
begin
  y:=year+(mon-2.85)/12;
  a:=trunc(367*y)  -1.75 *trunc(y)+day;
  b:=trunc(a) -0.75 *trunc(y/100);

  result:= trunc(b) +  1721115;

  result:=result+time/24-0.5;  //umrechnung von stunden auf juljaische tagesbruchteile ; tagesbeginn um 12:00 Uhr
end;
{-----------------------------------------------------------------------------
  Arguments:    hour,min,sec,day,mon,year:word
  Result:       real
-----------------------------------------------------------------------------}
function gregtojul(hour,min,sec,day,mon,year:word):extended;
begin
  result:=gregtojul(hour+min/60+sec/3600,day,mon,year);
end;
{-----------------------------------------------------------------------------
  Arguments:    day,mon:byte; year:word
  Result:       extended
-----------------------------------------------------------------------------}
function gregtojul(day,mon:byte; year:word):extended;overload;
begin
  result:=gregtojul(12,day,mon,year);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    montostr
  Arguments:    zahl:byte
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function montostr(zahl:byte):string;
begin
  case zahl of
    1:result:='Januar';
    2:result:='Februar';
    3:result:='März';
    4:result:='April';
    5:result:='Mai';
    6:result:='Juni';
    7:result:='Juli';
    8:result:='August';
    9:result:='September';
    10:result:='Oktober';
    11:result:='November';
    12:result:='Dezember';
  end;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    modulo
  Arguments:    zahl,red:extended; Positive:boolean
  Result:       extended
  Detailed description:
-----------------------------------------------------------------------------}
function modulo(zahl,red:extended; Positive:boolean=false):extended;
begin
  if abs(zahl)>=red then
    result:=sign(zahl)*(abs(zahl)-trunc(abs(zahl)/red)*red)
  else
    result:=zahl;

  if Positive and (result<0) then result:=result+red;
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    radtoBog
  Arguments:    Rad:extended
  Result:       extended
  Detailed description:
-----------------------------------------------------------------------------}
function radtoBog(Rad:extended):extended;
begin
  result:=Rad*pi/180;;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    BogtoRad
  Arguments:    Bog:extended
  Result:       extended
  Detailed description:
-----------------------------------------------------------------------------}
function BogtoRad(Bog:extended):extended;
begin
  result:=Bog/pi*180;;
end;





{-----------------------------------------------------------------------------
  Description:
  Procedure:    GetFileVersion
  Arguments:    FileName: string
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function GetFileVersion(FileName: string): string;
var fi: TJclFileVersionInfo;
begin
  fi:=TJclFileVersionInfo.Create(FileName);
  try
    result:=fi.FileVersion;
  finally
    fi.free;
  end;
end;




{-----------------------------------------------------------------------------
  Description:  Zerteilt einen String; Zerteilung erfolgt anhand von
                Teilstrings, die nicht mit ausgegeben werden
  Author:       Alexander Roth
  Procedure:    DivideString
  Arguments:    s:string; const Separator, DivideList:TStrings
-----------------------------------------------------------------------------}
procedure DivideString(s:string; const Separator, DivideList:TStrings);

    function FindNext:TPoint; // sucht den als ersten vorkommenden Seperator
    var i:integer;
        tempstelle:integer;
        schongefunden:boolean; // führe ich ein, damit er auf jeden Fall
                               // die 1. Fundstelle aufschreibt
    begin
      schongefunden:=false;
      result.y:=0;
      result.x:=0;
      for i:=0 to Separator.Count-1 do
        begin
        tempstelle:=pos(Separator.Strings[i], s);
        //schreibt die als nächstes kommende Trennzeichenstelle auf
        if     (tempstelle > 0)
           and ((tempstelle < result.y) or not schongefunden) then
           // es darf niemals sein dass er eine stelle
           // aufschreibt die nicht da ist
          begin
          schongefunden:=true;
          result.y:=tempstelle;
          result.x:=i;
          end;
        end;
    end;


var tempS:string;
    find:TPoint;  // y = Fundstelle, x = Index des Separators;
                  // hier habe ich keinen eigenen Typ gewählt,
                  // der übersichtlicher wäre, um die Implementierung des
                  // Codes einfacher zu gestalten
begin
  if assigned(Separator) and assigned(DivideList) then
    begin
    if (s <> '') and (Separator.Count > 0) then // falls man irgendwelche
                                                // schrottige Angaben gemacht hat
                                                // wird man hier rausgeworfen
      begin
      find:=FindNext;
      if find.y = 0 then  // er hat überhaupt kein trennzeichen gefunden

        DivideList.Append(s); // dann gibt er einfach den kompletten String zurück

      while (find.y > 0) and (length(s) > 0) do
        begin
        tempS:=copy(s, 1, find.Y-1);

        if length(tempS) > 0 then
          DivideList.Append(tempS);
        delete(s, 1, find.y-1 + length(Separator[find.x]));

        find:=FindNext;
        end;
      if length(s) > 0 then   // das ist dafür das auch die letzte resttext übernommen wird
        DivideList.Append(s);
      end;
    end;
end;
{procedure DemoDivideString;
const s = ',;,hallo|;guda,ggt;ds|gh,d;,;;;,f;,g,';
var StrList, NewList:TStringlist;
    i:integer;
begin
  StrList:=TStringlist.Create;
  NewList:=TStringlist.Create;
  try
    StrList.Append(',');
    StrList.Append(';');
    StrList.Append('|');

    DivideString(s, StrList, NewList);
    for i :=0 to NewList.Count-1 do
      ShowMessage(
        NewList.Strings[i]+#13+
        inttostr(length(NewList.Strings[i]))
      );
  finally
    NewList.free;
    StrList.free;
  end;
end;}

end.

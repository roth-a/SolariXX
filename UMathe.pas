{-----------------------------------------------------------------------------
 Unit Name: UMathe
 This file belong to SolariXX
 Author:    Alexander
 Date:      27-Dez-2006
 Lizenshinweise:  Infos-->Lizensbedingungen
 Description:
-----------------------------------------------------------------------------}
unit UMathe;

interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Math,utxt,usolar,uanderes,stdctrls, unit1,JvProgressBar;


  //bei diesen ist X=Hour
  function IsNullstelleOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; Precision{größer ist genauer}:real=1000):boolean;

  function NullstelleOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; rise:TThreePos=Irr; Count{größer ist genauer}:byte=10):real;
  function ExtremXOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1000):real;
  function ExtremFofXOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1000):real;

  //bei diesen ist X=day
  function IsNullstelleOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; Precision{größer ist genauer}:real=1):boolean;    //Precision bedeutet hier letztendlich wie viele Messpunkte an einem Tag in einer Stunde genommen werden

  function ExtremXOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1):TTimeSpecification;  overload;   //Precision bedeutet hier letztendlich wie viele Messpunkte an einem Tag in einer Stunde genommen werden
  function ExtremXOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; MinDay,MaxDay:smallint; IsMax:boolean; Precision{größer ist genauer}:real=1):TTimeSpecification;  overload;   //Precision bedeutet hier letztendlich wie viele Messpunkte an einem Tag in einer Stunde genommen werden
  function ExtremFofXOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1):real;     //Precision bedeutet hier letztendlich wie viele Messpunkte an einem Tag in einer Stunde genommen werden

  function ExtremYearXOfInclination(Funktion:TSum2Funktion; TS:TTimeSpecification; Day:TMinMaxInt; Azi:real; Ele:TMinMaxReal; IsMax:boolean; Precision{größer ist genauer}:real=1;  ausgabe:TLabel=nil; bar:TJvProgressBar=nil;  rekursionstiefe:byte=1):TTimeSpecification;


implementation



{-----------------------------------------------------------------------------
  Description:  Findet das Extremum des Tages
  Procedure:    ExtremXOfDay
  Arguments:    Funktion:TSolFunktion; TS:TTimeSpecification; IsMax:boolean
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function ExtremXOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1000):real;
const maxX=24;
var tempy,
    oldy:real;
    i:integer;
begin
  if Precision=0 then raise Exception.Create('0 is not aloud as Precision');
//  if Precision=0 then Precision:=1;
  ts.time:=random(maxX);     //der Wert muss innerhalb der Funktion liegen, ich könnte auch 0 angeben
  oldy:=Funktion(ts);
  result:=ts.time;  //das muss sein damit falls er zufällig den höchsten (innerhalb der precision) oder niedrigsten wert erwischt, trotzdem etwas richtiges rauskommt

  ts.time:=0;
  i:=0;
  repeat
    inc(i);
    if stop then break;
    tempy:=Funktion(ts);
    if  boolGleich(IsMax,tempy>oldy) then
      begin
      oldy:=tempy;
      result:=ts.time;
      end;

    ts.time:=ts.time+1/Precision;
  until   ts.time>=maxX;

//  showmessage('IsMax= '+booltostr(ismax,true)+#13+ floattostr(result));
  if form1.Log then form1.ListLog.Items.Add('ExtremXOfDay= '+Format('%f', [result]));
//  if form1.Log then form1.ListLog.Items.Add('ExtremXOfDay DateTime= '+datetostr(encodedate(ts.year,ts.month,ts.day))+'  '+floattostr(time));
end;



{-----------------------------------------------------------------------------
  Description:  Gibt den Funktionswert zu dem Extremum aus
  Procedure:    ExtremFofXOfDay
  Arguments:    Funktion:TSolFunktion; TS:TTimeSpecification; IsMax:boolean; Precision :real=1000
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function ExtremFofXOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1000):real;
begin
  with ts do
    result:=funktion(TimeSpecification(BG,LG,Azi,Ele,ExtremXOfDay(funktion,ts,IsMax,Precision),day,month,year));
end;


{-----------------------------------------------------------------------------
  Description:  Schaut ob eine Nullste im Tag da ist
  Procedure:    IsNullstelleOfDay
  Arguments:    Funktion:TSolFunktion; TS:TDaySpecification
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function IsNullstelleOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; Precision{größer ist genauer}:real=1000):boolean;
var     maxIstGroesser0, minIstKleiner0:boolean;
begin
  //feststellen ob überhaupt nullstelle
  ts.time:=ExtremXOfDay(Funktion,TS,true,Precision);
  maxIstGroesser0:= Funktion(ts)>=0;
  ts.time:=ExtremXOfDay(Funktion,TS,false,Precision);
  minIstKleiner0:=Funktion(ts)<0;

  result:=( maxIstGroesser0   and minIstKleiner0 );
end;




{-----------------------------------------------------------------------------
  Description:  Nullstelle eines Tages
  Procedure:    NullstelleOfDay
  Arguments:    Funktion:TSolFunktion; TS:TDaySpecification; rise:TThreePos=Irr
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function NullstelleOfDay(Funktion:TSolFunktion; TS:TTimeSpecification; rise:TThreePos=Irr; Count:byte=10):real;
const h=0.1;  //verstehe auch nicht wieso das mit einem so großen h klappt, bei einem kleineren h wird es nicht besser
var   x0:extended;
    i,lauf:integer;
    abfrage:boolean;

      function f(x:real):real;
      begin
        ts.time:=x;
        result:=Funktion(TS);
      end;
begin
  if not IsNullstelleOfDay(Funktion,TS)then exit;

  lauf:=0;
  repeat
    x0:=random(24);  //24 bracuht nicht aufzutreten, da 0 vorkommt  //hier das macht er damit er beim nächsten durchlauf (falls es ihn gibt) einen neuen zufälligen Startwert hat
    inc(lauf);
    if stop or (lauf>100) then break;    //damit es nie eine endlosschleife wird habe ich diese Sicherung eingebaut
    for i:=0 to Count-1 do
      begin
      x0:=x0-   f(x0)*h  /  (  f(x0+h/2) - f(x0-h/2) );
      x0:=modulo(x0,24,true);
      end;

    result:=x0;

    case rise of
      yes:abfrage:=(f(result+h/2) - f(result-h/2))/h >0;
      no:abfrage:=(f(result+h/2) - f(result-h/2))/h <0;
      IRR:abfrage:=true;
    end;
  until abfrage  ;

  if form1.Log then form1.ListLog.Items.Add('NullstelleOfDay= '+Format('%f', [result]));
end;






{-----------------------------------------------------------------------------
  Description:  Findet das Extremum des Jahres
  Procedure:    ExtremXOfYear
  Arguments:    Funktion:TSolFunktion; TS:TDaySpecification; IsMax:boolean
  Result:       TTimeSpecification
  Detailed description:
-----------------------------------------------------------------------------}
function ExtremXOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1):TTimeSpecification;
begin
  result:=ExtremXOfYear(Funktion,TS,0,365,IsMax,Precision);
end;
{-----------------------------------------------------------------------------
  Description:
  Arguments:    Funktion:TSumFunktion; TS:TTimeSpecification; MinDay,MaxDay:smallint; IsMax:boolean; Precision :real=1
  Result:       TTimeSpecification
-----------------------------------------------------------------------------}
function ExtremXOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; MinDay,MaxDay:smallint; IsMax:boolean; Precision{größer ist genauer}:real=1):TTimeSpecification;     //Precision bedeutet hier letztendlich wie viele Messpunkte an einem Tag in einer Stunde genommen werden
var tempy,oldy:real;
    i,j:byte;
    zaehle:smallint;
begin
  zaehle:=0;
  oldy:=Funktion(ts,Precision);
  result:=ts;

  for i:=1 to 12 do
    for j:=1 to uanderes.monatslaenge(i,ts.year) do
      begin
      inc(zaehle);
      if (zaehle<MinDay)or(zaehle>MaxDay) then
        continue;
      if stop then break;
      with TS do
        tempy:=Funktion(TimeSpecification(BG,LG,Azi,Ele,time,j,i,year),Precision);

      if  boolGleich(IsMax,tempy>oldy) then
        begin
        oldy:=tempy;
        result.day:=j;
        result.month:=i;
        end;
      end;

//  showmessage('IsMax= '+booltostr(ismax,true)+#13+ floattostr(oldy));
  if form1.Log then form1.ListLog.Items.Add('ExtremXOfYear= '+Format('%d.%d.%d', [result.day, result.month, result.year]));
end;

{-----------------------------------------------------------------------------
  Description:  Gibt den Funktionswert zu dem Extremum aus
  Procedure:    ExtremFofXOfYear
  Arguments:    Funktion:TSumFunktion; TS:TTimeSpecification; IsMax:boolean; Precision :real=1
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function ExtremFofXOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; IsMax:boolean; Precision{größer ist genauer}:real=1):real;     //Precision bedeutet hier letztendlich wie viele Messpunkte an einem Tag in einer Stunde genommen werden
begin
  result:=funktion(ExtremXOfYear(funktion,ts,IsMax,Precision),precision);
end;



{-----------------------------------------------------------------------------
  Description:  Schaut ob eine Nullste im Jahr da ist
  Procedure:    IsNullstelleOfYear
  Arguments:    Funktion:TSolFunktion; TS:TDaySpecification
  Result:       boolean
  Detailed description:
-----------------------------------------------------------------------------}
function IsNullstelleOfYear(Funktion:TSumFunktion; TS:TTimeSpecification; Precision{größer ist genauer}:real=1):boolean;
var     maxIstGroesser0, minIstKleiner0:boolean;
begin
  //feststellen ob überhaupt nullstelle
  ts:=ExtremXOfYear(Funktion,TS,true);
  maxIstGroesser0:= Funktion(ts,Precision)>=0;
  ts:=ExtremXOfYear(Funktion,TS,false);
  minIstKleiner0:=Funktion(ts,Precision)<0;

  result:=( maxIstGroesser0   and minIstKleiner0 );
end;





{==============================================================================
  Procedure:    ExtremYearXOfInclination	
  Belongs to:   None
  Result:       TTimeSpecification
  Parameters:   
                  Funktion : TSum2Funktion  =   
                  TS : TTimeSpecification  =   
                  Day : TMinMaxInt  =   
                  Azi : real  =   
                  Ele : TMinMaxReal  =   
                  IsMax : boolean  =   
                  Precision : real  = 1  
                  ausgabe : TLabel  = nil  
                  bar : TJvProgressBar  = nil  
                  rekursionstiefe : byte  = 1  
                    
  Description:  
==============================================================================}
function ExtremYearXOfInclination(Funktion:TSum2Funktion; TS:TTimeSpecification;  Day:TMinMaxInt; Azi:real; Ele:TMinMaxReal; IsMax:boolean; Precision{größer ist genauer}:real=1; ausgabe:TLabel=nil;  bar:TJvProgressBar=nil; rekursionstiefe:byte=1):TTimeSpecification;
var tempy,oldy:real;
    tempEle,plus:real;
begin
  if assigned(ausgabe) then
    if rekursionstiefe>0 then
      ausgabe.caption:='Berechnung beginnt'
    else
      ausgabe.caption:='Berechnung wird nochmals genauer durchgeführt';

  result:=ts;
  korrigiere(day.Minimum,0,365);
  korrigiere(day.Maximum,0,365);
  korrigiere(azi,-180,180);
  korrigiere(ele.Minimum,0,90);
  korrigiere(ele.Maximum,0,90);

  plus:=round(1/precision*3);

  oldy:=Funktion(TimeSpecification(ts.BG,ts.LG,Azi,tempEle,ts.time,ts.day,ts.month,ts.year),Day,Precision);


  tempEle:=ele.Minimum;
  while tempEle <ele.Maximum do
    begin
    //ausgabe
    if assigned(ausgabe) then
      ausgabe.caption:='Berechnung ist bei:'+#13+'    Azimut= '+floattostr(Azi)+#13+'    Elevation= '+floattostr(tempEle);
    if assigned(bar) then
      bar.Position:=round(  (tempEle-Ele.Minimum)/(Ele.Maximum-Ele.Minimum)*100  );
    application.ProcessMessages;

    if stop then break;
    tempy:=Funktion(TimeSpecification(ts.BG,ts.LG,azi,tempEle,ts.time,ts.day,ts.month,ts.year),Day,Precision);

    if  boolGleich(IsMax,tempy>oldy) then
      begin
      oldy:=tempy;
      result.Azi:=Azi;
      result.Ele:=tempEle;
      end;
    tempEle:=tempEle+plus;  //erhöhen
    end;


//  showmessage('IsMax= '+booltostr(ismax,true)+#13+ floattostr(oldy));
  if form1.Log then form1.ListLog.Items.Add('ExtremYearXOfInclination= '+Format('%d; %d', [result.Azi, result.Ele]));


  if rekursionstiefe>0 then
    result:=ExtremYearXOfInclination(Funktion,TS,Day,Azi,MinMax(result.Ele-plus*1.5,result.Ele+plus*1.5),IsMax,Precision*4,ausgabe,bar,rekursionstiefe-1);

  if assigned(ausgabe) then
    ausgabe.caption:='Berechnung ist fertig'+#13+'    Best Azimut= '+floattostr(result.Azi)+#13+'    Best Elevation= '+floattostr(result.Ele);
   bar.Position:=round(  (tempEle-Ele.Minimum)/(Ele.Maximum-Ele.Minimum)*100  );
    if assigned(bar) then
      bar.Position:=100;
end;



end.

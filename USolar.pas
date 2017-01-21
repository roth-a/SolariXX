{-----------------------------------------------------------------------------
 Unit Name: USolar
 Author:    Alexander Roth
 Date:      21-Jul-2006
 Lizenshinweise:
     Dieses Programm wurde geschrieben von Alexander Roth

    Dieses Programm ist freie Software. Sie können es unter den Bedingungen
    der GNU General Public License, wie von der Free Software Foundation
    veröffentlicht, weitergeben und/oder modifizieren, gemäß Version 2 der Lizenz.
 Description:  Hauptunit für Berechnungen 
-----------------------------------------------------------------------------}
unit USolar;


interface

uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Math,utxt,StdCtrls,unit1;


{alpha ( =Azimut)  ist immer auf Boden Ebene gemmesen und zwar vom der Süd Achse.
Sonne Süden
\    |
 \   |
  \--|    Draufsicht
   \a|
    \|

beta(=Elevation) ist immer die Höhe der Sonne vom Boden aus gemessen:
Sonne
\
 \
  \
   \      Seitenansicht
   |\
   |b\   Beta ist Einfallswinkel = Höhenwinkel
___|__\
Boden




Poldifferenz
------------



Zeitgleichung
-------------
Als Zeitgleichung wird die Differenz zwischen der mittleren Sonnenzeit (MOZ, mittlere Ortszeit) und der von einer Sonnenuhr angezeigten Zeit (WOZ, wahre Ortszeit, Sonnentag) bezeichnet (jeweils auf den Längengrad bezogen). Sie wird
   1. durch die Exzentrizität der Erdumlaufbahn mit einer Periodendauer Te von ca. einem Jahr und
   2. durch die Schiefe der Ekliptik aufgrund der Neigung der Erdachse mit einer Periodendauer Ts von ca. einem halben Jahr
verursacht.
}


//BG=Breitengrad
//LG=Längengrad

type

  TSolFunktion=function(TS:TTimeSpecification):real of object;
  TSumFunktion=function(TS:TTimeSpecification; Precision{größer ist genauer}:real):real of object;
  TSum2Funktion=function (TS:TTimeSpecification; Day:TMinMaxInt; Precision:real=60{größer ist genauer}):real  of object;

  TSonne = class
    private
    public
      procedure GetResourceData;      // Polardifferenz und Zeitgleichung in Array einlesen

      procedure getwikiTauDekli(var Tau:extended; var Deklination:extended; const TS:TTimeSpecification);
      function getwikiAzi(TS:TTimeSpecification):real;
      function getwikiEle(TS:TTimeSpecification):real;

      function getMeinT(TS:TTimeSpecification):real;
      function getMeinTKorrektur(TS:TTimeSpecification):real;
      function getMeinAzi(TS:TTimeSpecification):real;
      function getMeinEle(TS:TTimeSpecification):real;

      function getAzi(TS:TTimeSpecification):real;
      function getEle(TS:TTimeSpecification):real;

      function DayMaxEle(TS:TTimeSpecification; Precision{größer ist genauer}:real=1):real; // gibt immer den höchsten Sonnenstand des Tages aus

      function Sonnenstunden(TS:TTimeSpecification; Count:byte=10):real;
    end;


  TSolarkollektoren=class
    private
    public
      function RelElevation(TS:TTimeSpecification):real;
      function RelElevationNightCorrection(TS:TTimeSpecification):real;
//      function CalcPercent(TS:TTimeSpecification):real;        // prozent wird immer von 90° Einfallswinkel die ganze Zeit gerechnet
      function CalcEnergy(TS:TTimeSpecification):real;
      function CalcDayEnergy(TS:TTimeSpecification; Precision:real=60{größer ist genauer}):real;
      function CalcYearEnergy(TS:TTimeSpecification; Day:TMinMaxInt; Precision:real=60{größer ist genauer}):real;   overload;//limited; also im bereich von MinDay,MaxDay:smallint;
      function CalcYearEnergy(TS:TTimeSpecification; Precision:real=60{größer ist genauer}):real;   overload;

      function Sonnenstunden(TS:TTimeSpecification; Count:byte=10):real;

{      function SumPercentYear(TS:TTimeSpecification):real;     // prozent wird immer von 90° Einfallswinkel die ganze Zeit gerechnet
      function SumEnergyYear(TS:TTimeSpecification):real;}
    end;



  function TimeSpecification(BG,LG,Azi,Ele,time:real; day,month:byte; year:integer):TTimeSpecification;
  function TStoStr(TS:TTimeSpecification):string;


var
  Arpoldifferenz,                                                                     //in °
  ArZeitgleichung:array[1..40, 1..12 ] of real;            //day,month                //in  minuten  --> müssen immer umgerechnet werden

  Sonne:TSonne;
  Solarkollektoren:TSolarkollektoren;

implementation
uses uanderes,umathe,unit3;





{-----------------------------------------------------------------------------
  Description:  Wandelt TS in String um
  Procedure:    TStoStr
  Arguments:    TS:TTimeSpecification
  Result:       string
  Detailed description:
-----------------------------------------------------------------------------}
function TStoStr(TS:TTimeSpecification):string;
begin
  result:='Breitengrad = '+floattostr(ts.BG)+#13+
          'Längengrad = '+floattostr(ts.LG)+#13+
          'Uhrzeit (UTC) = '+floattostr(ts.time)+#13+
          'Datum = '+format('%d.%d.%d',[ts.day,ts.month,ts.year]);
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    TimeSpecification
  Arguments:    BG,LG,Azi,Ele,time:real; day,month:byte; year:integer
  Result:       TTimeSpecification
  Detailed description:
-----------------------------------------------------------------------------}
function TimeSpecification(BG,LG,Azi,Ele,time:real; day,month:byte; year:integer):TTimeSpecification;
begin
  result.BG:=BG;
  result.LG:=LG;
  result.Azi:=Azi;
  result.Ele:=Ele;
  result.time:=time;
  result.day:=day;
  result.month:=month;
  result.year:=year;
end;



{//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne    
TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  
TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne  TSonne 
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////}


{-----------------------------------------------------------------------------
  Description:
  Procedure:    getAzi
  Arguments:    BG,LG:real; time:real; day,month:byte; year:integer
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getAzi(TS:TTimeSpecification):real;
begin
  if us.FormelMeine then
    result:=self.getMeinAzi(ts)
  else
    result:=self.getwikiAzi(ts);
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    getEle
  Arguments:    BG,LG:real; time:real; day,month:byte; year:integer
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getEle(TS:TTimeSpecification):real;
begin
  if us.FormelMeine then
    result:=self.getMeinEle(ts)
  else
    result:=self.getwikiEle(TS);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    getT
  Arguments:    BG,LG:real; time:real; day,month:byte
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getMeinT(TS:TTimeSpecification):real;
begin
  result:=(ts.time*15+ArZeitgleichung[ts.day,ts.month]/4+ts.LG-195)   +  15;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    getTKorrektur
  Arguments:    BG,LG:real; time:real; day,month:byte
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getMeinTKorrektur(TS:TTimeSpecification):real;
begin
  result:=self.getMeinT(TS);

  if abs(result)>180 then
    result:=360-abs(result);
end;



{-----------------------------------------------------------------------------
  Description:  Azimut
  Procedure:    getAzi
  Arguments:    BG,LG:real; time:real; day,month:byte
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getMeinAzi(TS:TTimeSpecification):real;
var TStrich:real;
    BG:real;
begin
  BG:=radtobog(ts.BG);
  TStrich:=getMeinTKorrektur(TS);

  result:=SIN(radtobog(TStrich))/(COS(BG)/TAN(radtobog(Arpoldifferenz[ts.day,ts.month]))-SIN(BG)*COS(radtobog(TStrich)));
  result:=bogtorad(ARCTAN(result));

  //Korrektur
  if  (TStrich<0)and(result<0)then
    result:=result+180
  else
    if (TStrich>0)and(result>0)   then
      result:=result-180;

  //result     Süd = 0°  OST ist +   West ist -  bei Nord kann es zu sprungstellen kommen

  result:=-result;
  //result     Süd = 0°  OST ist -   West ist +  bei Nord kann es zu sprungstellen kommen
end;



{-----------------------------------------------------------------------------
  Description:  Höhenwinkel
  Procedure:    getEle
  Arguments:    BG,LG:real; time:real; day,month:byte
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getMeinEle(TS:TTimeSpecification):real;
var TStrich:real;
    BG:real;
begin
  BG:=ts.BG*pi/180;
  TStrich:=getMeinT(ts);

  result:=ARCSIN(SIN(BG)*COS(Arpoldifferenz[ts.day,ts.month]*pi/180)+COS(BG)*SIN(Arpoldifferenz[ts.day,ts.month]*pi/180)*COS(TStrich*PI/180))/PI*180;
end;







{-----------------------------------------------------------------------------
  Description:
  Procedure:    getwikiTauDekli
  Arguments:    var Tau:extended; var Deklination:extended; const time:real; day,month:byte
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TSonne.getwikiTauDekli(var Tau:extended; var Deklination:extended; const TS:TTimeSpecification);
var JulDat,
    T,
    n,
    L,
    g,
    lambda,
    epsilon,
    alpha,
    t0,
    thetaG,
    theta:extended;
begin
  Juldat:=gregtojul(ts.time,ts.day,ts.month,ts.year);
  T:=ts.time;
  n:=juldat-2451545;
  L:=modulo(280.46+0.9856474*n,360);
  g:=modulo(357.528+0.9856003*n,360);
  lambda:=L+1.915*SIN(radtoBog(g))+0.02*SIN(radtoBog(2*g))       ;
  epsilon:=23.439-0.0000004*n;
  alpha:=BogtoRad(ARCTAN(COS(radtoBog(epsilon))*SIN(radtoBog(lambda))/COS(radtoBog(lambda))))+180;

  Deklination:=BogtoRad(ARCSIN(SIN(radtoBog(epsilon))*SIN(radtoBog(lambda))))     ;

  t0:=(trunc(Juldat)+0.5-2451545)/36525;
  thetaG:=modulo(6.697376+2400.05134*t0+1.002738*T,24)*15;
  theta:=thetaG+ ts.LG;

  Tau:=theta-alpha;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    getwikiAzi
  Arguments:    BG,LG:real; time:real; day,month:byte
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getwikiAzi(TS:TTimeSpecification):real;
var tau,Deklination:extended;
begin
  self.getwikiTauDekli(tau,Deklination,ts);
  result:=BogtoRad(ARCTAN(SIN(radtoBog(tau))/(COS(radtoBog(tau))*SIN(radtoBog(ts.BG))-TAN(radtoBog(Deklination))*COS(radtoBog(ts.BG))))) ;
  if (COS(radtoBog(tau))*SIN(radtoBog(ts.BG))-TAN(radtoBog(Deklination))*COS(radtoBog(ts.BG)))<0 then
    result:=result+180;

  if result>180 then result:=result-360;
end;


{-----------------------------------------------------------------------------
  Description:
  Procedure:    getwikiEle
  Arguments:    BG,LG:real; time:real; day,month:byte
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.getwikiEle(TS:TTimeSpecification):real;
var tau,Deklination:extended;
begin
  self.getwikiTauDekli(tau,Deklination,TS);
  result:=BogtoRad(ARCSIN(COS(radtoBog(Deklination))*COS(radtoBog(tau))*COS(radtoBog(ts.BG))+SIN(radtoBog(Deklination))*SIN(radtoBog(ts.BG))));
end;




{-----------------------------------------------------------------------------
  Description:
  Procedure:    GetRessourceData
  Arguments:    None
  Result:       None
  Detailed description:
-----------------------------------------------------------------------------}
procedure TSonne.GetResourceData;
var AResourceStream:TResourceStream;
    sstream:TStringStream;

    Poldifferenz,
    Zeitgleichung,
    s:string;

    StringsPol,StringsZeit,Separator:TStringList;

    i,
    tag,monat:integer;
begin
  try
  // Polarkoordinaten
    AResourceStream := TResourceStream.Create(hInstance,'Poldifferenz',PChar('RT_RCDATA'));
    sstream:= TStringStream.Create(s);
    AResourceStream.SaveToStream(sstream);
    Poldifferenz:= sstream.DataString;

  //Zeitgleichung
    AResourceStream := TResourceStream.Create(hInstance,'Zeitgleichung',PChar('RT_RCDATA'));
    sstream:= TStringStream.Create(s);
    AResourceStream.SaveToStream(sstream);
    Zeitgleichung:= sstream.DataString;
  finally
    //Free
    AResourceStream.Free;
    sstream.Free;
  end;


  StringsPol:=TStringList.Create;
  StringsZeit:=TStringList.Create;
  Separator:=TStringList.Create;
  try
    Separator.Clear;
    Separator.Append('.');
    Separator.Append(';');
    Separator.Append(#13);
    Separator.Append(#10);

    DivideString(Zeitgleichung, Separator, StringsZeit);
    DivideString(Poldifferenz, Separator, StringsPol);

  //Umwandeln in Array
    i:=0;
    while i<=StringsZeit.Count-3 do         //nicht 365 denn 2000 ist ein schaltjahr und es gibt den 28.2.00
      begin
      //Zeitgleichung
      ArZeitgleichung[strtoint(StringsZeit.Strings[i]),strtoint(StringsZeit.Strings[i+1])]:= strtofloat(StringsZeit.Strings[i+2]);

      //poldifferenz
      Arpoldifferenz[strtoint(StringsPol.Strings[i]),strtoint(StringsPol.Strings[i+1])]:= strtofloat(StringsPol.Strings[i+2]);

      inc(i,3);
      end;
  finally
    StringsPol.Free;
    StringsZeit.Free;
    Separator.Free;
  end;
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    DayMaxEle
  Arguments:    TS:TTimeSpecification; Precision :real
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.DayMaxEle(TS:TTimeSpecification; Precision{größer ist genauer}:real=1):real; // gibt immer den höchsten Sonnenstand des Tages aus
begin
  with ts do
    result:=self.getEle(TimeSpecification(BG,LG,Azi,Ele, umathe.ExtremXOfDay(self.getEle,ts,true,Precision),day,month,year));

  if form1.Log then form1.ListLog.Items.Add('DayMaxEle= '+Format('%f', [result]));
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    Sonnenstunden
  Arguments:    TS:TTimeSpecification; Count:byte=10
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSonne.Sonnenstunden(TS:TTimeSpecification; Count:byte=10):real;
begin
  result:=umathe.NullstelleOfDay(sonne.getEle,ts,no,Count)-umathe.NullstelleOfDay(sonne.getEle,ts,yes,Count);
end;



{//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren
TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren
TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren  TSolarkollektoren
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////}

{-----------------------------------------------------------------------------
  Description:  Berechnet den Einfallswinkel=Höhenwinkel der Sonnenstrahlen auf das Panel (egal woher)
  Procedure:    RelElevation
  Arguments:    TS:TTimeSpecification
  Result:       real
  Detailed description:
      http://de.wikipedia.org/wiki/Sph%C3%A4rische_Trigonometrie#Formeln_f.C3.BCr_das_rechtwinklige_Kugeldreieck
      Hier steht wie man die Berechnungen durchführen muss um an dem rechtwinkligen Dreieck die Seiten (Katheten = Längen- bzw. Breitengrade) berechnen zu können
-----------------------------------------------------------------------------}
function TSolarkollektoren.RelElevation(TS:TTimeSpecification):real;
var laenge,breite:real;
    dlaenge,dbreite:real;
begin
  if not us.FixedPanel then  //falls ein mitdrehendes panel ist ist die elevation immer 90°
    begin
    result:=90;
    exit;
    end;


  //Relativer Höhenwinkel
//  result:=cos(radtoBog(sonne.getAzi(ts)-us.PanelAzi))* us.PanelEle  +  sonne.getEle(ts);

  if  us.TS.Ele<>0 then
    begin
    dlaenge:=bogtorad(arcsin( sin(radtobog(ts.Ele))*sin(radtobog(ts.Azi)) ));       // da sin(dlänge)=sin(höhe)*sin(Azimut)
    dbreite:=bogtorad(arccos( cos(radtobog(ts.Ele))/cos(radtobog(dlaenge)) ));              // da cos(c)=cos(a)*cos(b)  => cos(höhe)=cos(dbreite)*cos(dlänge)
//    dbreite:=bogtorad(arctan( tan(radtobog(us.PanelEle))*cos(radtobog(us.PanelAzi)) ));
    end
  else
    begin
    dlaenge:=0;
    dbreite:=0;
    end;

  if abs(ts.Azi)>90 then    //wenn ich das nicht abfange in welche himmelsrichtung dann ist dbreite immer positiv
    dbreite:=-dbreite;

  //zuweisen
  laenge:=ts.LG - dlaenge;
  laenge:=uanderes.modulo(laenge,180);  //sollte er immer machen
  if ts.BG>=0 then
    breite:=ts.BG - dbreite  //nordhalbkugel
  else
    breite:=ts.BG + dbreite; //südhalbkugel


  //sondrfälle bearbeiten
  if  abs(breite)>90 then     //dann wechselt er über die pole auf die gegenüberliegenden Längengrad
    begin
    breite:=uanderes.modulo(breite,90);
    laenge:=laenge+180;
    end;
  laenge:=uanderes.modulo(laenge,180);  //sollte er immer machen





  with TS do
    result:=sonne.getEle(TimeSpecification(breite ,laenge,Azi,Ele,time,day,month,year));

  if isnan(result) then result:=0;

  //hier das kommt damit er nur werte zwischen -90 und 90 liefert
  if abs(result)>90 then result:=sign(result)*(180-abs(result));

{  showmessage(
              'ts.LG = '+floattostr(ts.LG)+#13
              +'ts.BG = '+floattostr(ts.BG)+#13
              +'dlaenge = '+floattostr(dlaenge)+#13
              +'dbreite = '+floattostr(dbreite)+#13
              +'laenge = '+floattostr(laenge)+#13
              +'breite = '+floattostr(breite)+#13
              );}
              
//  if form1.Log then form1.ListLog.Items.Add('RelElevation= '+Format('%f; %g', [result, ts.time]));
end;



{-----------------------------------------------------------------------------
  Description:  Berechnet den Einfallswinkel der Sonnenstrahlen auf das Panel (egal woher)
  Procedure:    RelElevationNightCorrection
  Arguments:    TS:TTimeSpecification
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSolarkollektoren.RelElevationNightCorrection(TS:TTimeSpecification):real;
begin
  //Relativer Höhenwinkel
  result:=RelElevation(ts);

  if sonne.getEle(ts)<=0 then  result:=0;
end;




{-----------------------------------------------------------------------------
  Description:  Gibt eine Näherung der Einfalls-Energie pro m^2 und pro 1 s zurück Ausgabe in Watt; es wird angenommen, das gutes Wetter herrscht
  Procedure:    CalcEnergy
  Arguments:    TS:TTimeSpecification
  Result:       real
  Detailed description:
    Nachfolgenedes habe ich aus der Rechnung rausgenommen:

    Nach http://de.wikipedia.org/wiki/Sonneneinstrahlung#Minderung_durch_schr.C3.A4gen_Lichteinfall
    wird der Anteil der Atmosphäre mit dem sinus des Höhenwinkels berechnet

    Hiernach    http://de.wikipedia.org/wiki/Air_Mass
      wird die Luftmasse mit AM=1/sin(Höhenwinkel)        berechnet     was auch logisch ist
    Zitate aus   http://de.wikipedia.org/wiki/Sonnenstrahlung
      "60 bis 65° hoch und strahlt bei idealen Bedingungen mit einer Bestrahlungsstärke von etwa 1000 Watt/m²herab, gemessen in der Horizontalen"
      "13 bis 18° und selbst zu Mittag nur etwa 200 Watt/m²"
-----------------------------------------------------------------------------}
function TSolarkollektoren.CalcEnergy(TS:TTimeSpecification):real;
begin
  us.getSpecification;

  result:=us.ZenitEnergy;
{  //energieverlust durch langen Lichtweg durch die Atmosphäre   (mit Sinus des Höhenwinkels)
  result:=result*sin(radtobog(sonne.getbeta(ts)));}

  //ergierverlust durch Einfallswinkel
  if  us.FixedPanel then
    if (RelElevation(ts)<=0)or(sonne.getEle(ts)<0) then     //or(RelElevation(ts)>=180) das brauche ich nicht da relevation immer werte -90<x<90 liefert
      result:=0
    else
      result:=result*sin(radtobog(RelElevation(ts)));

  //wolken
  result:=result*(100-us.PercentClouds)/100;


  //keine Negative Energie zulassen
  if result<0 then result:=0;      //in Watt
end;



{-----------------------------------------------------------------------------
  Description:  Gibt die Energieeinstrahulng pro m^2 des Tages in Watt zurück
  Procedure:    CalcDayEnergy
  Arguments:    TS:TTimeSpecification
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSolarkollektoren.CalcDayEnergy(TS:TTimeSpecification; Precision{größer ist genauer}:real=60):real;
var r:real;
begin
  if Precision=0 then raise Exception.Create('0 is not aloud as Precision');
//  if Precision=0 then Precision:=1;

  result:=0;
  r:=0;
  repeat
    with TS do
      result:=result  +  CalcEnergy(TimeSpecification(BG,LG,Azi,Ele,r,day,month,year)) *  1/Precision*3600;   //*abstand*24*3600 rechne ich damit die 1s auf den Bruchteil des Tages umgerechnet wird, die hier immer addiert werden
    r:=r+ 1/Precision;
  until r>=24;
end;




{-----------------------------------------------------------------------------
  Description:  Gibt die Energieeinstrahulng pro m^2 des Jahres (eigeschränkt) in Watt zurück
  Procedure:    CalcLimitedYearEnergy
  Arguments:    TS:TTimeSpecification; Day:TMinMaxInt; Precision:real=60
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSolarkollektoren.CalcYearEnergy(TS:TTimeSpecification; Day:TMinMaxInt; Precision:real=60{größer ist genauer}):real;
var i,j,
    zaehle:integer;
begin
  result:=0;
  zaehle:=0;
  for i:=1 to 12 do
    for j:=1 to uanderes.monatslaenge(i,ts.year) do
      begin
      inc(zaehle);
      if (zaehle<day.Minimum)or(zaehle>day.Maximum) then
        continue;
      if stop then exit;
      application.ProcessMessages;
      with TS do
        result:=result  +  CalcDayEnergy(TimeSpecification(BG,LG,Azi,Ele,time,j,i,year), Precision) ;
      end;

  if form1.Log then form1.ListLog.Items.Add('CalcYearEnergy= '+Format('%f', [result]));
end;

{-----------------------------------------------------------------------------
  Description:  Gibt die Energieeinstrahulng pro m^2 des Jahres in Watt zurück
  Arguments:    TS:TTimeSpecification; Precision :real=60
-----------------------------------------------------------------------------}
function TSolarkollektoren.CalcYearEnergy(TS:TTimeSpecification; Precision{größer ist genauer}:real=60):real;
begin
  self.CalcYearEnergy(ts,MinMax(0,365),Precision);
end;



{-----------------------------------------------------------------------------
  Description:
  Procedure:    Sonnenstunden
  Arguments:    TS:TTimeSpecification; Count:byte=10
  Result:       real
  Detailed description:
-----------------------------------------------------------------------------}
function TSolarkollektoren.Sonnenstunden(TS:TTimeSpecification; Count:byte=10):real;
begin
  result:=min(
          umathe.NullstelleOfDay(solarkollektoren.RelElevation,ts,no,Count)-umathe.NullstelleOfDay(solarkollektoren.RelElevation,ts,yes,Count),
          sonne.Sonnenstunden(ts,count)
          );
end;




end.








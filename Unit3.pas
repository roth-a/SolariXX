unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,  JvSpin, Mask, JvExMask, BMSpinEdit;

type
  TFormSetting = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    ComboBG: TComboBox;
    ComboLG: TComboBox;
    ComboTime: TComboBox;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RadioVariablePanle: TRadioButton;
    RadioFixedPanel: TRadioButton;
    GroupBox1: TGroupBox;
    RadioSea: TRadioButton;
    RadioMountain: TRadioButton;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    EBG: TBMSpinEdit;
    ELG: TBMSpinEdit;
    EPercentClouds: TBMSpinEdit;
    EPanelAzi: TBMSpinEdit;
    EPanelEle: TBMSpinEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  FormSetting: TFormSetting;

implementation
uses utxt,unit1;

{$R *.dfm}

procedure TFormSetting.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  form1.OnKeyDown(sender,key,shift);
end;

end.

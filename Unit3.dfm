object FormSetting: TFormSetting
  Left = 425
  Top = 213
  BorderStyle = bsDialog
  Caption = 'Einstellungen'
  ClientHeight = 639
  ClientWidth = 271
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 63
    Width = 70
    Height = 16
    Caption = 'Breitengrad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 31
    Top = 91
    Width = 73
    Height = 16
    Caption = 'L'#228'ngengrad'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 32
    Top = 144
    Width = 51
    Height = 16
    Caption = 'Zeitzone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 59
    Height = 16
    Caption = 'Standort'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 120
    Width = 60
    Height = 16
    Caption = 'Zeitzone'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 40
    Top = 496
    Width = 201
    Height = 32
    Hint = 
      'Wohin ist es geneigt (Von welcher Himmelsrichtung soll es Licht ' +
      'bekommen)'
    Caption = 'Himmelausrichtung  (von S'#252'nden;        OST ist -   West ist +)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object Label6: TLabel
    Left = 8
    Top = 416
    Width = 115
    Height = 16
    Caption = 'Solarkollektoren'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 202
    Top = 536
    Width = 4
    Height = 16
    Caption = #176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label8: TLabel
    Left = 34
    Top = 568
    Width = 214
    Height = 48
    Caption = 
      'Anstellwinkel der Solkarkollektoren   zur oben genannten Himmelr' +
      'ichtung (0'#176' ist Ebene)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label9: TLabel
    Left = 202
    Top = 608
    Width = 4
    Height = 16
    Caption = #176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label10: TLabel
    Left = 8
    Top = 8
    Width = 207
    Height = 16
    Caption = 'Eigenschaften des Wohnortes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 24
    Top = 264
    Width = 240
    Height = 32
    Hint = 
      'Wohin ist es geneigt (Von welcher Himmelsrichtung soll es Licht ' +
      'bekommen)'
    Caption = 'Wie viel Prozent des hellen Tages ist mit Wolken verhangen?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    WordWrap = True
  end
  object Label12: TLabel
    Left = 226
    Top = 291
    Width = 12
    Height = 16
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label13: TLabel
    Left = 24
    Top = 329
    Width = 240
    Height = 64
    Caption = 
      'Es wird eine immer gleichm'#228#223'ige Wolkenverteilung angenommen und ' +
      'die Leistung der Anlage ist auch deshlab nur eine grobe Sch'#228'tzun' +
      'g'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object ComboBG: TComboBox
    Left = 189
    Top = 60
    Width = 49
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 0
    Text = 'NB'
    OnKeyDown = FormKeyDown
    Items.Strings = (
      'NB'
      'SB')
  end
  object ComboLG: TComboBox
    Left = 189
    Top = 91
    Width = 49
    Height = 21
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = 'Ost'
    OnKeyDown = FormKeyDown
    Items.Strings = (
      'Ost'
      'West')
  end
  object ComboTime: TComboBox
    Left = 112
    Top = 144
    Width = 113
    Height = 21
    ItemHeight = 13
    ItemIndex = 1
    TabOrder = 2
    Text = 'UTC + 1  (MEZ)'
    OnKeyDown = FormKeyDown
    Items.Strings = (
      'UTC'
      'UTC + 1  (MEZ)'
      'UTC + 2  (MESZ)'
      'UTC + 3'
      'UTC + 3:30'
      'UTC + 4'
      'UTC + 5'
      'UTC + 5:30'
      'UTC + 5:45'
      'UTC + 6'
      'UTC + 6:30'
      'UTC + 7'
      'UTC + 8'
      'UTC + 8:45'
      'UTC + 9'
      'UTC + 9:30'
      'UTC + 10'
      'UTC + 10:30'
      'UTC + 11'
      'UTC + 11:30'
      'UTC + 12'
      'UTC + 12:45'
      'UTC + 13'
      'UTC + 14'
      'UTC - 1'
      'UTC - 2'
      'UTC - 3'
      'UTC - 3:30'
      'UTC - 4'
      'UTC - 5'
      'UTC - 6'
      'UTC - 7'
      'UTC - 8'
      'UTC - 9'
      'UTC - 9:30'
      'UTC - 10'
      'UTC - 11'
      'UTC - 12'
      'UTC - 13'
      'UTC - 14')
  end
  object RadioVariablePanle: TRadioButton
    Left = 16
    Top = 440
    Width = 113
    Height = 17
    Caption = 'Selbstausrichtend'
    TabOrder = 3
    OnKeyDown = FormKeyDown
  end
  object RadioFixedPanel: TRadioButton
    Left = 16
    Top = 464
    Width = 113
    Height = 17
    Caption = 'Feste Richtung'
    Checked = True
    TabOrder = 4
    TabStop = True
    OnKeyDown = FormKeyDown
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 184
    Width = 225
    Height = 65
    Caption = 'H'#246'he des Wohnorts'
    TabOrder = 5
    object RadioSea: TRadioButton
      Left = 16
      Top = 16
      Width = 161
      Height = 17
      Caption = 'H'#246'he des Meeresniveaus'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnKeyDown = FormKeyDown
    end
    object RadioMountain: TRadioButton
      Left = 16
      Top = 40
      Width = 161
      Height = 17
      Caption = '3-4 km hoh Berg'
      TabOrder = 1
      OnKeyDown = FormKeyDown
    end
  end
  object EBG: TBMSpinEdit
    Left = 112
    Top = 56
    Width = 73
    Height = 28
    Cursor = crArrow
    EditorEnabled = False
    TabOrder = 6
    Increment = 1.000000000000000000
    MaxValue = 90.000000000000000000
    Value = 49.800000000000000000
  end
  object ELG: TBMSpinEdit
    Left = 112
    Top = 88
    Width = 73
    Height = 28
    Cursor = crArrow
    EditorEnabled = False
    TabOrder = 7
    Increment = 1.000000000000000000
    MaxValue = 180.000000000000000000
    Value = 6.720000000000000000
  end
  object EPercentClouds: TBMSpinEdit
    Left = 152
    Top = 288
    Width = 73
    Height = 28
    Cursor = crArrow
    EditorEnabled = False
    TabOrder = 8
    Increment = 1.000000000000000000
    MaxValue = 100.000000000000000000
    Value = 50.000000000000000000
  end
  object EPanelAzi: TBMSpinEdit
    Left = 128
    Top = 536
    Width = 73
    Height = 28
    Cursor = crArrow
    EditorEnabled = False
    TabOrder = 9
    Increment = 1.000000000000000000
    MaxValue = 180.000000000000000000
    MinValue = -180.000000000000000000
    Value = 6.720000000000000000
  end
  object EPanelEle: TBMSpinEdit
    Left = 128
    Top = 608
    Width = 73
    Height = 28
    Cursor = crArrow
    EditorEnabled = False
    TabOrder = 10
    Increment = 1.000000000000000000
    MaxValue = 90.000000000000000000
    Value = 10.000000000000000000
  end
end

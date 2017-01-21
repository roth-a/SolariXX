object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SolariXX'
  ClientHeight = 751
  ClientWidth = 965
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  DesignSize = (
    965
    751)
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl2: TPageControl
    Left = 0
    Top = 0
    Width = 966
    Height = 751
    ActivePage = TabSheet3
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    ExplicitHeight = 731
    object TabSheet3: TTabSheet
      Caption = 'Berechnung'
      ExplicitHeight = 703
      DesignSize = (
        958
        723)
      object PageControl1: TPageControl
        Left = 0
        Top = 0
        Width = 959
        Height = 742
        ActivePage = TabSheet1
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
        ExplicitHeight = 722
        object TabSheet1: TTabSheet
          Caption = 'Einzelner Tag'
          ExplicitHeight = 694
          DesignSize = (
            951
            714)
          object Label4: TLabel
            Left = 8
            Top = 208
            Width = 39
            Height = 16
            Caption = 'Datum'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label5: TLabel
            Left = 8
            Top = 232
            Width = 41
            Height = 16
            Caption = 'Uhrzeit'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label6: TLabel
            Left = 106
            Top = 235
            Width = 3
            Height = 16
            Caption = ':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label7: TLabel
            Left = 146
            Top = 211
            Width = 3
            Height = 16
            Caption = '.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label8: TLabel
            Left = 103
            Top = 212
            Width = 3
            Height = 16
            Caption = '.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label9: TLabel
            Left = 8
            Top = 376
            Width = 76
            Height = 16
            Caption = 'Sonnenh'#246'he'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label11: TLabel
            Left = 64
            Top = 352
            Width = 63
            Height = 16
            Caption = 'Ausgabe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LHoehenwinkel: TLabel
            Left = 120
            Top = 376
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label10: TLabel
            Left = 8
            Top = 400
            Width = 99
            Height = 16
            Hint = 'gegen'#252'ber S'#252'd'#13#10'gegen'#252'ber Nord rechnen sie 180'#176' - Wert'
            Caption = 'Himmelsrichtung'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
          end
          object LHimmelsrichtung: TLabel
            Left = 120
            Top = 400
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label12: TLabel
            Left = 8
            Top = 424
            Width = 75
            Height = 16
            Caption = 'H'#246'chststand'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LMaxBeta: TLabel
            Left = 120
            Top = 424
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label13: TLabel
            Left = 8
            Top = 448
            Width = 95
            Height = 16
            Caption = 'Sonnenaufgang'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LSunRise: TLabel
            Left = 120
            Top = 448
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label15: TLabel
            Left = 8
            Top = 472
            Width = 106
            Height = 16
            Caption = 'Sonnenuntergang'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LSunSet: TLabel
            Left = 120
            Top = 472
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label14: TLabel
            Left = 154
            Top = 235
            Width = 3
            Height = 16
            Caption = ':'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label1: TLabel
            Left = 264
            Top = 16
            Width = 131
            Height = 16
            Caption = 'Sonnendiagramme'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 264
            Top = 96
            Width = 164
            Height = 16
            Caption = 'Solarzzellendiagramme'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 8
            Top = 504
            Width = 116
            Height = 16
            Caption = 'Energie des Tages'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LDayEnergy: TLabel
            Left = 131
            Top = 504
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LDayEnergy2: TLabel
            Left = 126
            Top = 528
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BAktuelleZeit: TButton
            Left = 24
            Top = 264
            Width = 203
            Height = 25
            Caption = 'Aktuelle Systemzeit und aktuelles Datum'
            TabOrder = 0
            OnClick = BAktuelleZeitClick
            OnKeyDown = FormKeyDown
          end
          object BBerechnen: TButton
            Left = 80
            Top = 312
            Width = 89
            Height = 25
            Caption = 'Berechne'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BBerechnenClick
            OnKeyDown = FormKeyDown
          end
          object BAzimut: TButton
            Left = 448
            Top = 36
            Width = 145
            Height = 45
            Caption = 'Azimut '#252'ber Tageszeit ausgeben'
            TabOrder = 3
            WordWrap = True
            OnClick = BAzimutClick
            OnKeyDown = FormKeyDown
          end
          object BElevation: TButton
            Left = 280
            Top = 36
            Width = 145
            Height = 45
            Caption = 'Sonnenh'#246'he '#252'ber Tageszeit ausgeben'
            TabOrder = 2
            WordWrap = True
            OnClick = BElevationClick
            OnKeyDown = FormKeyDown
          end
          object BElevationAzimut: TButton
            Left = 608
            Top = 36
            Width = 145
            Height = 45
            Caption = 'Sonnenh'#246'he '#252'ber Azimut ausgeben'
            TabOrder = 4
            WordWrap = True
            OnClick = BElevationAzimutClick
            OnKeyDown = FormKeyDown
          end
          object BRelElevation: TButton
            Left = 280
            Top = 116
            Width = 145
            Height = 45
            Caption = 'Einfalswinkel auf die Solarzellen'
            TabOrder = 5
            WordWrap = True
            OnClick = BRelElevationClick
            OnKeyDown = FormKeyDown
          end
          object BEnergy: TButton
            Left = 456
            Top = 116
            Width = 129
            Height = 45
            Caption = 'Leistung '#252'ber Tageszeit pro m^2'
            TabOrder = 6
            WordWrap = True
            OnClick = BEnergyClick
            OnKeyDown = FormKeyDown
          end
          object BDayCalctoFile: TButton
            Left = 19
            Top = 643
            Width = 233
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Gebe ganzen Tag in Datei aus'
            TabOrder = 7
            OnClick = BDayCalctoFileClick
            ExplicitTop = 623
          end
          object RichHelp3: TRichEdit
            Left = 8
            Top = 352
            Width = 17
            Height = 169
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 8
            Visible = False
            OnKeyDown = FormKeyDown
          end
          object RichHelp1: TRichEdit
            Left = 8
            Top = 64
            Width = 17
            Height = 137
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 9
            Visible = False
            OnKeyDown = FormKeyDown
          end
          object JvEDay: TJvSpinEdit
            Left = 64
            Top = 208
            Width = 38
            Height = 21
            MaxValue = 31.000000000000000000
            MinValue = 1.000000000000000000
            Value = 1.000000000000000000
            TabOrder = 10
          end
          object JvEMonth: TJvSpinEdit
            Left = 108
            Top = 208
            Width = 38
            Height = 21
            MaxValue = 12.000000000000000000
            MinValue = 1.000000000000000000
            Value = 1.000000000000000000
            TabOrder = 11
          end
          object JvEYear: TJvSpinEdit
            Left = 152
            Top = 208
            Width = 50
            Height = 21
            Value = 1.000000000000000000
            TabOrder = 12
          end
          object JvEHour: TJvSpinEdit
            Left = 64
            Top = 232
            Width = 38
            Height = 21
            MaxValue = 23.000000000000000000
            Value = 1.000000000000000000
            TabOrder = 13
          end
          object JvEMinute: TJvSpinEdit
            Left = 112
            Top = 232
            Width = 38
            Height = 21
            MaxValue = 59.000000000000000000
            Value = 1.000000000000000000
            TabOrder = 14
          end
          object JvEsec: TJvSpinEdit
            Left = 160
            Top = 232
            Width = 38
            Height = 21
            MaxValue = 59.000000000000000000
            Value = 1.000000000000000000
            TabOrder = 15
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Jahresberechnung'
          ImageIndex = 1
          ExplicitHeight = 694
          DesignSize = (
            951
            714)
          object LYearEnergy: TLabel
            Left = 40
            Top = 384
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label18: TLabel
            Left = 8
            Top = 360
            Width = 138
            Height = 16
            Caption = 'Jahresleistung pro m^2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label19: TLabel
            Left = 48
            Top = 336
            Width = 63
            Height = 16
            Caption = 'Ausgabe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 264
            Top = 16
            Width = 131
            Height = 16
            Caption = 'Sonnendiagramme'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label17: TLabel
            Left = 264
            Top = 96
            Width = 133
            Height = 16
            Caption = 'Energiediagramme'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LYearMaxElevation: TLabel
            Left = 187
            Top = 424
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label21: TLabel
            Left = 8
            Top = 424
            Width = 157
            Height = 16
            Caption = 'Jahressonnenh'#246'chststand'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LYearMinElevation: TLabel
            Left = 187
            Top = 448
            Width = 3
            Height = 16
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Label22: TLabel
            Left = 8
            Top = 448
            Width = 169
            Height = 16
            Caption = 'Jahressonnenniedrigststand'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object BYearEnergy: TButton
            Left = 280
            Top = 116
            Width = 145
            Height = 45
            Caption = 'Energie des Jahres'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            WordWrap = True
            OnClick = BYearEnergyClick
            OnKeyDown = FormKeyDown
          end
          object BYearCalctoFile: TButton
            Left = 19
            Top = 643
            Width = 233
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Gebe ganzes Jahr in Datei aus'
            TabOrder = 1
            OnClick = BYearCalctoFileClick
            ExplicitTop = 623
          end
          object BYearMaxElevation: TButton
            Left = 280
            Top = 36
            Width = 145
            Height = 45
            Caption = 'Sonnenh'#246'chstst'#228'nde '#252'ber dem Jahr'
            TabOrder = 2
            WordWrap = True
            OnClick = BYearMaxElevationClick
            OnKeyDown = FormKeyDown
          end
          object RichHelp2: TRichEdit
            Left = 8
            Top = 64
            Width = 17
            Height = 241
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 3
            Visible = False
            OnKeyDown = FormKeyDown
          end
        end
      end
      object ButtonSetting: TButton
        Left = 72
        Top = 40
        Width = 113
        Height = 41
        Caption = 'Einstellungen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = ButtonSettingClick
        OnKeyDown = FormKeyDown
      end
      object RSChartPanel1: TRSChartPanel
        Left = 268
        Top = 191
        Width = 687
        Height = 532
        Anchors = [akLeft, akTop, akRight, akBottom]
        ShowHint = False
        TabOrder = 2
        ParentShowHint = False
        ScalingFlags = []
        OnMouseDown = RSChartPanel1MouseDown
        UseDockManager = True
        OnKeyDown = FormKeyDown
        ChartShadow.Brush.Color = clBlack
        ChartShadow.Size = 2
        ChartShadow.Visible = True
        Background.Brush.Color = clBtnFace
        Background.ImageMode = imCenter
        Background.Visible = True
        Foreground.Brush.Color = clBtnFace
        Foreground.ImageMode = imCenter
        Foreground.Visible = False
        BottomAxis.Format = '#,##0.####'
        BottomAxis.DateTimeFormat = 'd.m.yyyy'
        BottomAxis.Grid.MinorTickCount = 1
        BottomAxis.Grid.GridPen.Style = psDot
        BottomAxis.Grid.MinorGridPen.Color = clInactiveBorder
        BottomAxis.Grid.TicksPen.Color = clGray
        BottomAxis.Grid.Visible = True
        BottomAxis.Labels.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Labels.Font.Color = clWindowText
        BottomAxis.Labels.Font.Height = -11
        BottomAxis.Labels.Font.Name = 'MS Sans Serif'
        BottomAxis.Labels.Font.Style = []
        BottomAxis.Labels.Visible = True
        BottomAxis.LabelIncrement = 1.000000000000000000
        BottomAxis.LabelStyle = alsValue
        BottomAxis.LogarithmicType = ltCompressRight
        BottomAxis.Maximum = 10.000000000000000000
        BottomAxis.ZoomMaximum = 10.000000000000000000
        BottomAxis.MinStepIncrement = 1.000000000000000000
        BottomAxis.Options = [axShowLabels, axShowGrid, axShowTitle]
        BottomAxis.Title.Font.Charset = DEFAULT_CHARSET
        BottomAxis.Title.Font.Color = clWindowText
        BottomAxis.Title.Font.Height = -11
        BottomAxis.Title.Font.Name = 'MS Sans Serif'
        BottomAxis.Title.Font.Style = []
        BottomAxis.Title.Visible = True
        BottomAxis.Title.Text = 'caBottom'
        BottomAxis.TitleMargin = 0
        BottomAxis.Brush.Style = bsClear
        BottomAxis.Visible = True
        TopAxis.Format = '#,##0.###'
        TopAxis.Grid.GridPen.Style = psDot
        TopAxis.Grid.MinorGridPen.Color = clInactiveBorder
        TopAxis.Grid.TicksPen.Color = clGray
        TopAxis.Grid.Visible = True
        TopAxis.Labels.Font.Charset = DEFAULT_CHARSET
        TopAxis.Labels.Font.Color = clWindowText
        TopAxis.Labels.Font.Height = -11
        TopAxis.Labels.Font.Name = 'MS Sans Serif'
        TopAxis.Labels.Font.Style = []
        TopAxis.Labels.Visible = True
        TopAxis.LogarithmicType = ltCompressRight
        TopAxis.Options = [axAutomaticMinimum, axAutomaticMaximum, axShowLabels, axShowGrid, axShowTitle]
        TopAxis.Title.Font.Charset = DEFAULT_CHARSET
        TopAxis.Title.Font.Color = clWindowText
        TopAxis.Title.Font.Height = -11
        TopAxis.Title.Font.Name = 'MS Sans Serif'
        TopAxis.Title.Font.Style = []
        TopAxis.Title.Visible = True
        TopAxis.Title.Text = 'caTop'
        TopAxis.Brush.Style = bsClear
        TopAxis.Visible = False
        LeftAxis.Format = '#,##0.####'
        LeftAxis.Grid.MinorTickCount = 2
        LeftAxis.Grid.GridPen.Style = psDot
        LeftAxis.Grid.MinorGridPen.Color = clInactiveBorder
        LeftAxis.Grid.TicksPen.Color = clGray
        LeftAxis.Grid.MinorTickLength = 1
        LeftAxis.Grid.Visible = True
        LeftAxis.Labels.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Labels.Font.Color = clWindowText
        LeftAxis.Labels.Font.Height = -11
        LeftAxis.Labels.Font.Name = 'MS Sans Serif'
        LeftAxis.Labels.Font.Style = []
        LeftAxis.Labels.Visible = True
        LeftAxis.LabelIncrement = 10.000000000000000000
        LeftAxis.LabelStyle = alsValue
        LeftAxis.LogarithmicType = ltCompressRight
        LeftAxis.Maximum = 10.000000000000000000
        LeftAxis.Minimum = -10.000000000000000000
        LeftAxis.ZoomMaximum = 10.000000000000000000
        LeftAxis.ZoomMinimum = -10.000000000000000000
        LeftAxis.Options = [axShowLabels, axShowGrid, axShowTitle]
        LeftAxis.Title.Font.Charset = DEFAULT_CHARSET
        LeftAxis.Title.Font.Color = clWindowText
        LeftAxis.Title.Font.Height = -11
        LeftAxis.Title.Font.Name = 'Arial'
        LeftAxis.Title.Font.Orientation = 900
        LeftAxis.Title.Font.Style = []
        LeftAxis.Title.Angle = 90
        LeftAxis.Title.Visible = True
        LeftAxis.Title.Text = 'caLeft'
        LeftAxis.Brush.Style = bsClear
        LeftAxis.Visible = True
        RightAxis.Format = '#,##0.###'
        RightAxis.Grid.GridPen.Style = psDot
        RightAxis.Grid.MinorGridPen.Color = clInactiveBorder
        RightAxis.Grid.TicksPen.Color = clGray
        RightAxis.Grid.Visible = True
        RightAxis.Labels.Font.Charset = DEFAULT_CHARSET
        RightAxis.Labels.Font.Color = clWindowText
        RightAxis.Labels.Font.Height = -11
        RightAxis.Labels.Font.Name = 'MS Sans Serif'
        RightAxis.Labels.Font.Style = []
        RightAxis.Labels.Visible = True
        RightAxis.LogarithmicType = ltCompressRight
        RightAxis.Options = [axAutomaticMinimum, axAutomaticMaximum, axShowLabels, axShowGrid, axShowTitle]
        RightAxis.Title.Font.Charset = DEFAULT_CHARSET
        RightAxis.Title.Font.Color = clWindowText
        RightAxis.Title.Font.Height = -11
        RightAxis.Title.Font.Name = 'Arial'
        RightAxis.Title.Font.Orientation = 2700
        RightAxis.Title.Font.Style = []
        RightAxis.Title.Angle = 270
        RightAxis.Title.Visible = True
        RightAxis.Title.Text = 'caRight'
        RightAxis.Brush.Style = bsClear
        RightAxis.Visible = False
        Gradient.Visible = True
        Footer.Text = 'Footer'
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clRed
        Footer.Font.Height = -11
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = []
        Footer.Font.Deltas = [daColor]
        Footer.Height = 24
        Footer.Width = 0
        Footer.Brush.Style = bsClear
        Footer.ImageOptions = [ioStretch]
        Footer.Visible = False
        Header.Text = 'Chart'
        Header.Font.Charset = DEFAULT_CHARSET
        Header.Font.Color = clBlue
        Header.Font.Height = -11
        Header.Font.Name = 'MS Sans Serif'
        Header.Font.Style = []
        Header.Font.Deltas = [daColor]
        Header.Height = 24
        Header.Width = 0
        Header.Brush.Style = bsClear
        Header.ImageOptions = [ioStretch]
        Header.Visible = True
        Legend.Alignment = taLeftJustify
        Legend.Font.Charset = DEFAULT_CHARSET
        Legend.Font.Color = clWindowText
        Legend.Font.Height = -11
        Legend.Font.Name = 'MS Sans Serif'
        Legend.Font.Style = []
        Legend.Visible = False
        Legend.Shadow.Brush.Color = clBlack
        Legend.Shadow.Visible = True
        OnChange = RSChartPanel1Change
        OnZoom = RSChartPanel1Zoom
        OnUnzoom = RSChartPanel1Unzoom
        UserZoom = [ssCtrl, ssLeft]
        UserPan = [ssShift, ssLeft]
        UserSelect = [ssAlt, ssLeft]
        ExplicitHeight = 512
      end
      object Panel: TPanel
        Left = 11
        Top = 698
        Width = 249
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Panel'
        TabOrder = 3
        ExplicitTop = 678
        object BPanelShow: TButton
          Left = 0
          Top = 0
          Width = 249
          Height = 25
          Caption = 'Erweiterte Daten'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = BPanelShowClick
          OnKeyDown = FormKeyDown
        end
        object ListBoxDiagramm: TListBox
          Left = 8
          Top = 32
          Width = 233
          Height = 561
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object GroupBoxFormel: TGroupBox
        Left = 48
        Top = 562
        Width = 177
        Height = 76
        Anchors = [akLeft, akBottom]
        Caption = 'Berechnungen mit'
        TabOrder = 4
        ExplicitTop = 542
        object RadioMeine: TRadioButton
          Left = 24
          Top = 24
          Width = 113
          Height = 17
          Caption = 'eigener Formel'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnKeyDown = FormKeyDown
        end
        object RadioWiki: TRadioButton
          Left = 24
          Top = 48
          Width = 137
          Height = 17
          Caption = 'Formel von Wikipedia'
          TabOrder = 1
          OnKeyDown = FormKeyDown
        end
      end
      object ListLog: TListBox
        Left = 8
        Top = 73
        Width = 9
        Height = 650
        Anchors = [akLeft, akTop, akBottom]
        ItemHeight = 13
        TabOrder = 5
        Visible = False
        ExplicitHeight = 630
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Optimierung'
      ImageIndex = 1
      OnContextPopup = TabSheet4ContextPopup
      ExplicitHeight = 703
      object Label30: TLabel
        Left = 48
        Top = 289
        Width = 9
        Height = 16
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GroupBox1: TGroupBox
        Left = 24
        Top = 24
        Width = 225
        Height = 153
        Caption = 'Gro'#223'e Zeitr'#228'ume eingrenzen (Tage)'
        TabOrder = 0
        object Label20: TLabel
          Left = 26
          Top = 49
          Width = 22
          Height = 16
          Caption = 'von'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 26
          Top = 89
          Width = 18
          Height = 16
          Caption = 'bis'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label24: TLabel
          Left = 18
          Top = 122
          Width = 94
          Height = 16
          Caption = 'ber'#252'cksichtigen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label25: TLabel
          Left = 18
          Top = 26
          Width = 52
          Height = 16
          Caption = 'Zeitraum'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object SpinEVon: TBMSpinEdit
          Left = 54
          Top = 48
          Width = 121
          Height = 28
          Cursor = crArrow
          EditorEnabled = False
          TabOrder = 0
          Increment = 5.000000000000000000
          MaxValue = 365.000000000000000000
          Precision = 0
        end
        object SpinEBis: TBMSpinEdit
          Left = 54
          Top = 88
          Width = 121
          Height = 28
          Cursor = crArrow
          EditorEnabled = False
          TabOrder = 1
          Increment = 5.000000000000000000
          MaxValue = 365.000000000000000000
          Value = 365.000000000000000000
          Precision = 0
        end
      end
      object BOptimiere: TButton
        Left = 48
        Top = 216
        Width = 195
        Height = 41
        Caption = 'Optimiere'
        TabOrder = 1
        OnClick = BOptimiereClick
      end
      object JvProgressBarOpti: TJvProgressBar
        Left = 48
        Top = 263
        Width = 195
        Height = 20
        Step = 5
        TabOrder = 2
      end
    end
  end
  object JvImgBtn1: TJvImgBtn
    Left = 883
    Top = 0
    Width = 75
    Height = 75
    Anchors = [akTop, akRight]
    Caption = 'Info'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = JvImgBtn1Click
    OnKeyDown = FormKeyDown
    Color = clLime
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -32
    HotTrackFont.Name = 'MS Sans Serif'
    HotTrackFont.Style = []
  end
  object RSLineChart: TRSLineChart
    Brush.Color = clBtnFace
    Pen.Color = clRed
    Pen.Width = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Color = clRed
    Options = []
    Parent = RSChartPanel1
    Left = 812
    Top = 232
  end
  object RSSonnenaufgang: TRSLineChart
    Brush.Color = clBtnFace
    Pen.Color = clGreen
    Pen.Width = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Color = clGreen
    Options = [coShowInLegend]
    Parent = RSChartPanel1
    Values.Sorted = True
    Values.DateTimeAxes = []
    Values = <
      item
        Color = clTeal
        Value = -100.000000000000000000
        Visible = True
        X = 8.000000000000000000
        Y = -100.000000000000000000
      end
      item
        Color = clLime
        Value = 100.000000000000000000
        Visible = True
        X = 8.000000000000000000
        Y = 100.000000000000000000
      end>
    Preview = False
    Left = 776
    Top = 280
  end
  object RSSonnenuntergang: TRSLineChart
    Brush.Color = clBtnFace
    Pen.Color = clGreen
    Pen.Width = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Color = clGreen
    Options = [coShowInLegend]
    Parent = RSChartPanel1
    Values.Sorted = True
    Values.DateTimeAxes = []
    Values = <
      item
        Color = clAqua
        Value = -100.000000000000000000
        Visible = True
        X = 20.000000000000000000
        Y = -100.000000000000000000
      end
      item
        Color = clFuchsia
        Value = 100.000000000000000000
        Visible = True
        X = 20.000000000000000000
        Y = 100.000000000000000000
      end>
    Preview = False
    Left = 816
    Top = 280
  end
  object RS0Line: TRSLineChart
    Brush.Color = clBtnFace
    Pen.Width = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Color = clBlack
    Options = [coShowInLegend]
    Parent = RSChartPanel1
    Values.Sorted = True
    Values.DateTimeAxes = []
    Values = <
      item
        Color = clAqua
        Visible = True
        X = -1000000.000000000000000000
      end
      item
        Color = clRed
        Visible = True
        X = 1000000.000000000000000000
      end>
    Preview = False
    Left = 856
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 700
    Top = 224
    object PopupSpeichereDatei: TMenuItem
      Caption = 'Ver'#228'nderlich'
      OnClick = PopupSpeichereDateiClick
    end
  end
  object SaveDialogDayCSV: TSaveDialog
    Filter = 'csv|*.csv|Alle Dateien|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    OnCanClose = SaveDialogDayCSVCanClose
    Left = 652
    Top = 264
  end
  object MainMenu1: TMainMenu
    Left = 664
    Top = 224
    object Datei1: TMenuItem
      Caption = 'Datei'
      object SpeichereWertedesTages1: TMenuItem
        Caption = 'Speichere Werte eines Tages'
        OnClick = BDayCalctoFileClick
      end
      object SpeichereWerteeinesJahres1: TMenuItem
        Caption = 'Speichere Werte eines Jahres'
        OnClick = BYearCalctoFileClick
      end
      object SpeichereIniDatei1: TMenuItem
        Caption = 'Speichere ini Datei'
        OnClick = SpeichereIniDatei1Click
      end
      object LeseIniDatei1: TMenuItem
        Caption = 'Lese ini Datei'
        OnClick = LeseIniDatei1Click
      end
    end
    object Einstellungen1: TMenuItem
      Caption = 'Einstellungen'
      OnClick = Einstellungen1Click
    end
    object Info1: TMenuItem
      Caption = 'Info'
      object about: TMenuItem
        Caption = #220'ber das Programm  (a)'
        OnClick = aboutClick
      end
      object Version1: TMenuItem
        Caption = 'Version  (v)'
        OnClick = Version1Click
      end
      object Lizenzdetails1: TMenuItem
        Caption = 'Lizenzdetails  (L)'
        OnClick = Lizenzdetails1Click
      end
      object Hilfe1: TMenuItem
        Caption = 'Hilfe  (F1)'
        OnClick = Hilfe1Click
      end
      object Update1: TMenuItem
        Caption = 'Update  (u)'
        OnClick = Update1Click
      end
    end
  end
  object SaveDialogINI: TSaveDialog
    Filter = 'ini|*.ini|Alle Dateien|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Speichern der Einstellungen'
    OnCanClose = SaveDialogINICanClose
    Left = 652
    Top = 304
  end
  object OpenDialogINI: TOpenDialog
    Filter = 'ini|*.ini|Alle Dateien|*.*'
    Title = #214'ffnen der Einstellungen'
    OnCanClose = OpenDialogINICanClose
    Left = 684
    Top = 304
  end
  object SaveDialogYearCSV: TSaveDialog
    Filter = 'csv|*.csv|Alle Dateien|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    OnCanClose = SaveDialogYearCSVCanClose
    Left = 684
    Top = 264
  end
  object ActionList1: TActionList
    Left = 860
    object AcHilfe: TAction
      Caption = 'AcHilfe'
      ShortCut = 112
      OnExecute = Hilfe1Click
    end
    object AcUpdate: TAction
      Caption = 'AcUpdate'
      SecondaryShortCuts.Strings = (
        'u')
      OnExecute = Update1Click
    end
    object AcInfo: TAction
      Caption = 'AcInfo'
      SecondaryShortCuts.Strings = (
        'a')
      OnExecute = aboutClick
    end
    object AcVersion: TAction
      Caption = 'AcVersion'
      SecondaryShortCuts.Strings = (
        'v')
      OnExecute = Version1Click
    end
    object AcLizenzdetails: TAction
      Caption = 'AcLizenzdetails'
      SecondaryShortCuts.Strings = (
        'l')
      OnExecute = Lizenzdetails1Click
    end
    object AcLog: TAction
      Caption = 'AcLog'
      SecondaryShortCuts.Strings = (
        'STRG+'#223)
      OnExecute = AcLogExecute
    end
    object AcStop: TAction
      Caption = 'AcStop'
      SecondaryShortCuts.Strings = (
        'ESC')
      OnExecute = AcStopExecute
    end
  end
end

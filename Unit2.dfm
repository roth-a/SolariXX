object Form2: TForm2
  Left = 308
  Top = 191
  AutoSize = True
  Caption = 'Form2'
  ClientHeight = 505
  ClientWidth = 705
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object TabSheetControl: TPageControl
    Left = 0
    Top = 0
    Width = 705
    Height = 505
    ActivePage = TabUpdate
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object Information: TTabSheet
      Caption = 'Information'
      object RichInfo: TRichEdit
        Left = 8
        Top = 8
        Width = 681
        Height = 465
        BorderStyle = bsNone
        Color = clBtnFace
        Lines.Strings = (
          'Dies ist ein Open-Scoure-Programm  (GNU General Public License).'
          'Unver'#228'nderte Ver'#246'ffentlichungen sind erw'#252'nscht.'
          ''
          'Dieses Programm wurde von Alexander Roth entwickelt.'
          'Robin Breit hat mich oft tatkr'#228'ftig unterst'#252'tzt.'
          ''
          
            'Dieses Programm ist noch in der Entwicklungsphase, sp'#228'ter wird d' +
            'as Programm f'#252'r '
          'Solarkollektoren die beste '
          'Ausrichtung berechnen k'#246'nnen.'
          ''
          
            'Im Gegensatz zu meiner Formel, die immer richtig sein m'#252'sste (ab' +
            'solute Sicherheit gibt es '
          'nirgends), macht die '
          
            'Formel von Wikipedia am 21.6. und am 22.12. kr'#228'ftig Fehler (Ich ' +
            'will allerdings auch nicht '
          'ausschlie'#223'en, dass '
          
            'der Fehler bei meiner Umsetzung liegt). Sonst stimmt sie mit mei' +
            'ner aber sehr gut '#252'berein.'
          ''
          'Diese Komponenten/Units benutze ich in meinem Programm:'
          '- Jedi Komponenten'
          '- Indy Komponenten'
          '- RiverSoftAVG Charting Component Suite'
          'Einen riesigen Dank den Autoren'
          ''
          ''
          'Kontakt: roth-a@gmx.de'
          'Homepage: www.roth.22o.de')
        ReadOnly = True
        TabOrder = 0
      end
    end
    object Links: TTabSheet
      Caption = 'Links'
      ImageIndex = 1
      object Homepage: TLabel
        Left = 144
        Top = 152
        Width = 374
        Height = 36
        Cursor = crHandPoint
        Caption = 'Meine Homepage besuchen'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = HomepageClick
      end
      object Label1: TLabel
        Left = 248
        Top = 56
        Width = 162
        Height = 76
        Caption = 'Links'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -67
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        WordWrap = True
      end
      object EmailKontakt: TLabel
        Left = 160
        Top = 216
        Width = 350
        Height = 36
        Cursor = crHandPoint
        Caption = 'Email an Alexander Roth'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = EmailKontaktClick
      end
      object Label2: TLabel
        Left = 216
        Top = 336
        Width = 225
        Height = 45
        Caption = 'andere Links'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -40
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 224
        Top = 392
        Width = 227
        Height = 36
        Cursor = crHandPoint
        Caption = 'Delphipraxis.net'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = Label3Click
      end
    end
    object Lizenzbedingungen: TTabSheet
      Caption = 'Lizenzbedingungen'
      ImageIndex = 3
      object Memo2: TMemo
        Left = 0
        Top = 32
        Width = 697
        Height = 217
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Dies ist ein Open-Scoure-Programm.'
          ''
          'Ver'#246'ffentlichungen und unver'#228'nderte Vervielf'#228'ltigungen '
          'sind ausdr'#252'cklich erw'#252'nscht.'
          ''
          'F'#252'r Sch'#228'den wird nicht gehaftet.'
          'Genaue Lizenzdetails finden Sie in dem unten aufgef'#252'hrten Feld.'
          ''
          'Viel Spass mit dem Programm.')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object Memo3: TMemo
        Left = 112
        Top = 272
        Width = 513
        Height = 153
        BorderStyle = bsNone
        Color = clBtnFace
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          'Lizenzdetails:'
          ''
          ''
          'Dieses Programm wurde geschrieben von Alexander Roth'
          ''
          
            'Dieses Programm ist freie Software. Sie k'#246'nnen es unter den Bedi' +
            'ngungen der GNU '
          
            'General Public License, wie von der Free Software Foundation ver' +
            #246'ffentlicht, '
          'weitergeben und/oder modifizieren, gem'#228#223' Version 2 der Lizenz.')
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object TabUpdate: TTabSheet
      Caption = 'Updates'
      ImageIndex = 2
      object LInternetState: TLabel
        Left = 24
        Top = 112
        Width = 649
        Height = 41
        AutoSize = False
        Caption = 'Bitte checke ob ein Update vorhanden ist'
        WordWrap = True
      end
      object LHomepage: TLabel
        Left = 24
        Top = 200
        Width = 221
        Height = 36
        Cursor = crHandPoint
        Caption = 'www.roth.us.ms'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -32
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        Visible = False
        OnClick = HomepageClick
      end
      object Label4: TLabel
        Left = 16
        Top = 376
        Width = 649
        Height = 65
        AutoSize = False
        Caption = 
          'Du hast einen Fehler entdeckt?  Es w'#228're sehr freundlich, wenn du' +
          ' mir eine kurze E-Mail schreiben w'#252'rdest in der mir das Problem ' +
          'beschreibst. Ich versuche dann diesen Fehler so schnell wie m'#246'gl' +
          'ich zu beheben.'
        WordWrap = True
      end
      object Label5: TLabel
        Left = 248
        Top = 408
        Width = 103
        Height = 19
        Cursor = crHandPoint
        Caption = 'roth-a@gmx.de'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = True
        Layout = tlCenter
        OnClick = EmailKontaktClick
      end
      object BCheckUpdate: TButton
        Left = 16
        Top = 48
        Width = 273
        Height = 33
        Caption = 'Pr'#252'fen ob Update vorhanden'
        TabOrder = 0
        OnClick = BCheckUpdateClick
      end
    end
  end
end

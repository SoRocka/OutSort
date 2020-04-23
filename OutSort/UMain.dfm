object Form1: TForm1
  Left = 192
  Top = 107
  Width = 675
  Height = 498
  Caption = #1052#1085#1086#1075#1086#1087#1091#1090#1077#1074#1086#1077' '#1086#1076#1085#1086#1092#1072#1079#1085#1086#1077' '#1089#1073#1072#1083#1072#1085#1089#1080#1088#1086#1074#1072#1085#1085#1086#1077' '#1077#1089#1090#1077#1089#1090#1074#1077#1085#1085#1086#1077' '#1089#1083#1080#1103#1085#1080#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object PageCtrl: TPageControl
    Left = 0
    Top = 0
    Width = 659
    Height = 459
    ActivePage = SheetCheck
    Align = alClient
    TabOrder = 0
    object SheetGrid: TTabSheet
      Caption = #1058#1072#1073#1083#1080#1094#1072' '#1088#1077#1079#1091#1083#1100#1090#1072#1090#1086#1074
      object GridMain: TStringGrid
        Left = 0
        Top = 0
        Width = 651
        Height = 430
        Align = alClient
        ColCount = 3
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
        TabOrder = 0
      end
      object btnStart: TButton
        Left = 464
        Top = 16
        Width = 171
        Height = 57
        Caption = #1053#1072#1095#1072't'#1100
        TabOrder = 1
        OnClick = btnStartClick
      end
    end
    object SheetCheck: TTabSheet
      Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1088#1072#1073#1086#1090#1086#1089#1087#1086#1089#1086#1073#1085#1086#1089#1090#1080' '#1072#1083#1075#1086#1088#1080#1090#1084#1072
      ImageIndex = 1
      object Label1: TLabel
        Left = 190
        Top = 26
        Width = 125
        Height = 14
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1101#1083#1077#1084#1077#1085#1090#1086#1074':'
      end
      object MemoFile: TMemo
        Left = 3
        Top = 3
        Width = 170
        Height = 471
        Enabled = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object SpinKolEl: TSpinEdit
        Left = 325
        Top = 23
        Width = 98
        Height = 23
        MaxValue = 50000
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object ButRnd: TButton
        Left = 190
        Top = 69
        Width = 156
        Height = 27
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1083#1091#1095#1072#1081#1085#1099#1081' '#1092#1072#1081#1083
        TabOrder = 2
        OnClick = ButRndClick
      end
      object ButReverse: TButton
        Left = 190
        Top = 102
        Width = 156
        Height = 27
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1073#1088#1072#1090#1085#1099#1081' '#1092#1072#1081#1083
        TabOrder = 3
        OnClick = ButReverseClick
      end
      object ButSort: TButton
        Left = 190
        Top = 190
        Width = 104
        Height = 26
        Caption = #1054#1090#1089#1086#1088#1090#1080#1088#1086#1074#1072#1090#1100
        Enabled = False
        TabOrder = 4
        OnClick = ButSortClick
      end
      object ButCheck: TButton
        Left = 190
        Top = 233
        Width = 104
        Height = 27
        Caption = #1055#1088#1086#1074#1077#1088#1080#1090#1100
        Enabled = False
        TabOrder = 5
        OnClick = ButCheckClick
      end
    end
  end
end

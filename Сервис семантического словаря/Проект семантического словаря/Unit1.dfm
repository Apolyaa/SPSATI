object Form1: TForm1
  Left = 714
  Top = 34
  Width = 724
  Height = 792
  Caption = #1056#1077#1076#1072#1082#1090#1086#1088' '#1089#1077#1084#1072#1085#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1083#1086#1074#1072#1088#1103
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label6: TLabel
    Left = 16
    Top = 672
    Width = 157
    Height = 13
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1080#1089#1093#1086#1076#1085#1086#1075#1086' '#1089#1083#1086#1074#1072#1088#1103
  end
  object Label7: TLabel
    Left = 16
    Top = 720
    Width = 188
    Height = 13
    Caption = #1048#1084#1103' '#1092#1072#1081#1083#1072' '#1089#1077#1084#1072#1085#1090#1080#1095#1077#1089#1082#1086#1075#1086' '#1089#1083#1086#1074#1072#1088#1103
  end
  object Button3: TButton
    Left = 400
    Top = 256
    Width = 33
    Height = 25
    Caption = '----->'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 400
    Top = 352
    Width = 33
    Height = 25
    Caption = '<-----'
    TabOrder = 1
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 400
    Top = 504
    Width = 33
    Height = 25
    Caption = '----->'
    TabOrder = 2
    OnClick = Button5Click
  end
  object Panel1: TPanel
    Left = 440
    Top = 8
    Width = 265
    Height = 649
    Caption = 'Panel1'
    Color = clSkyBlue
    TabOrder = 3
    object Label1: TLabel
      Left = 12
      Top = 64
      Width = 109
      Height = 13
      Caption = #1057#1087#1080#1089#1086#1082' '#1089#1083#1086#1074' '#1089#1083#1086#1074#1072#1088#1103
    end
    object Label2: TLabel
      Left = 172
      Top = 64
      Width = 33
      Height = 13
      Caption = #1042#1089#1077#1075#1086':'
    end
    object Label11: TLabel
      Left = 26
      Top = 0
      Width = 216
      Height = 29
      Caption = #1048#1089#1093#1086#1076#1085#1099#1081' '#1089#1083#1086#1074#1072#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Button1: TButton
      Left = 96
      Top = 32
      Width = 65
      Height = 25
      Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '
      TabOrder = 0
      OnClick = Button1Click
    end
    object ListBox1: TListBox
      Left = 8
      Top = 80
      Width = 249
      Height = 553
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 20
      ParentFont = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 8
    Width = 385
    Height = 649
    Caption = 'Panel2'
    Color = clSkyBlue
    TabOrder = 4
    object Label3: TLabel
      Left = 104
      Top = 64
      Width = 109
      Height = 13
      Caption = #1054#1076#1085#1086#1082#1086#1088#1077#1085#1085#1099#1077' '#1089#1083#1086#1074#1072
    end
    object Label4: TLabel
      Left = 104
      Top = 304
      Width = 112
      Height = 13
      Caption = #1057#1083#1086#1074#1072' '#1086#1076#1085#1086#1075#1086' '#1089#1084#1099#1089#1083#1072
    end
    object Label5: TLabel
      Left = 104
      Top = 592
      Width = 75
      Height = 13
      Caption = #1057#1090#1088#1086#1082#1072' '#1087#1086#1080#1089#1082#1072
    end
    object Label8: TLabel
      Left = 232
      Top = 64
      Width = 32
      Height = 13
      Caption = #8470#1079#1072#1087':'
    end
    object Label9: TLabel
      Left = 304
      Top = 64
      Width = 33
      Height = 13
      Caption = #1042#1089#1077#1075#1086':'
    end
    object Label10: TLabel
      Left = 56
      Top = 0
      Width = 286
      Height = 29
      Caption = #1057#1077#1084#1072#1085#1090#1080#1095#1077#1089#1082#1080#1081' '#1089#1083#1086#1074#1072#1088#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object ListBox2: TListBox
      Left = 104
      Top = 80
      Width = 265
      Height = 217
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 20
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
    end
    object Button6: TButton
      Left = 104
      Top = 32
      Width = 81
      Height = 25
      Caption = #1054#1090#1082#1088#1099#1090#1100' '
      TabOrder = 1
      OnClick = Button6Click
    end
    object ListBox3: TListBox
      Left = 104
      Top = 320
      Width = 265
      Height = 225
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemHeight = 20
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 104
      Top = 608
      Width = 265
      Height = 21
      TabOrder = 3
    end
    object Button7: TButton
      Left = 16
      Top = 608
      Width = 75
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 4
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 296
      Top = 32
      Width = 75
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100
      TabOrder = 5
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 0
      Top = 296
      Width = 97
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 56
      Top = 256
      Width = 41
      Height = 25
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = Button10Click
    end
    object Button11: TButton
      Left = 8
      Top = 256
      Width = 41
      Height = 25
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = Button11Click
    end
    object Button12: TButton
      Left = 8
      Top = 336
      Width = 41
      Height = 25
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = Button12Click
    end
    object Button13: TButton
      Left = 56
      Top = 336
      Width = 41
      Height = 25
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = Button13Click
    end
    object Button14: TButton
      Left = 8
      Top = 80
      Width = 91
      Height = 17
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1086#1082#1085#1086' '
      TabOrder = 11
      OnClick = Button14Click
    end
    object Button15: TButton
      Left = 8
      Top = 528
      Width = 89
      Height = 17
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1086#1082#1085#1086' '
      TabOrder = 12
      OnClick = Button15Click
    end
    object Button16: TButton
      Left = 184
      Top = 552
      Width = 105
      Height = 25
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 13
      OnClick = Button16Click
    end
  end
  object Edit2: TEdit
    Left = 16
    Top = 688
    Width = 689
    Height = 21
    Color = cl3DLight
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 16
    Top = 736
    Width = 689
    Height = 21
    Color = clGradientActiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Button2: TButton
    Left = 400
    Top = 104
    Width = 33
    Height = 25
    Caption = '<------'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    Left = 640
    Top = 656
  end
  object OpenDialog2: TOpenDialog
    Left = 672
    Top = 656
  end
  object PopupMenu1: TPopupMenu
    Left = 568
    Top = 656
    object N111111: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N111111Click
    end
    object N2221: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N2221Click
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 600
    Top = 656
  end
  object PopupMenu2: TPopupMenu
    Left = 536
    Top = 656
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = N2Click
    end
  end
end

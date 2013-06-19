object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 431
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 493
    Height = 338
    Lines.Strings = (
      '')
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 390
    Width = 73
    Height = 25
    Caption = #1057#1078#1072#1090#1100' LZW'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 345
    Top = 390
    Width = 75
    Height = 25
    Caption = #1057#1078#1072#1090#1100' RLE'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Memo2: TMemo
    Left = 8
    Top = 344
    Width = 493
    Height = 17
    TabOrder = 3
  end
  object Button3: TButton
    Left = 87
    Top = 390
    Width = 75
    Height = 25
    Caption = #1054#1090#1078#1072#1090#1100' LZW'
    TabOrder = 4
  end
  object Button4: TButton
    Left = 426
    Top = 390
    Width = 75
    Height = 25
    Caption = #1054#1090#1078#1072#1090#1100' RLE'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 208
    Top = 390
    Width = 75
    Height = 25
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 6
    OnClick = Button5Click
  end
end

object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #1050#1086#1084#1087#1088#1077#1089#1089#1086#1088
  ClientHeight = 431
  ClientWidth = 509
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 493
    Height = 354
    Lines.Strings = (
      #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1086#1075#1086' '#1083#1091#1095#1096#1077' '#1087#1086#1076#1086#1081#1076#1077#1090' '#1072#1083#1075#1086#1088#1080#1090#1084' '#1051#1077#1084#1087#1077#1083#1103'-'#1047#1080#1074#1072'-'#1042#1077#1083#1095#1072':'
      
        'Sed ut perspiciatis, unde omnis iste natus error sit voluptatem ' +
        'accusantium doloremque '
      
        'laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore' +
        ' veritatis et quasi architecto '
      
        'beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, ' +
        'quia voluptas sit, aspernatur '
      
        'aut odit aut fugit, sed quia consequuntur magni dolores eos, qui' +
        ' ratione voluptatem sequi '
      
        'nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolo' +
        'r sit, amet, consectetur, '
      
        'adipisci velit, sed quia non numquam eius modi tempora incidunt,' +
        ' ut labore et dolore magnam '
      
        'aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostr' +
        'um exercitationem ullam '
      
        'corporis suscipit laboriosam, nisi ut aliquid ex ea commodi cons' +
        'equatur? Quis autem vel eum iure '
      
        'reprehenderit, qui in ea voluptate velit esse, quam nihil molest' +
        'iae consequatur, vel illum, qui '
      
        'dolorem eum fugiat, quo voluptas nulla pariatur? At vero eos et ' +
        'accusamus et iusto odio '
      
        'dignissimos ducimus, qui blanditiis praesentium voluptatum delen' +
        'iti atque corrupti, quos dolores '
      
        'et quas molestias excepturi sint, obcaecati cupiditate non provi' +
        'dent, similique sunt in culpa, qui '
      
        'officia deserunt mollitia animi, id est laborum et dolorum fuga.' +
        ' Et harum quidem rerum facilis est '
      
        'et expedita distinctio. Nam libero tempore, cum soluta nobis est' +
        ' eligendi optio, cumque nihil '
      
        'impedit, quo minus id, quod maxime placeat, facere possimus, omn' +
        'is voluptas assumenda est, '
      
        'omnis dolor repellendus. Temporibus autem quibusdam et aut offic' +
        'iis debitis aut rerum '
      
        'necessitatibus saepe eveniet, ut et voluptates repudiandae sint ' +
        'et molestiae non recusandae. '
      
        'Itaque earum rerum hic tenetur a sapiente delectus, ut aut reici' +
        'endis voluptatibus maiores alias '
      'consequatur aut perferendis doloribus asperiores repellat.'
      ''
      #1053#1072#1073#1086#1088' '#1087#1086#1074#1090#1086#1088#1103#1102#1097#1080#1093#1089#1103' '#1073#1091#1082#1074' '#1076#1083#1103' '#1082#1086#1090#1086#1088#1099#1093' '#1087#1086#1076#1086#1081#1076#1077#1090' RLE:'
      
        'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq' +
        'qqqqqqqqqqqq'
      'wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww'
      'eeeeeeeeeeeeeeeeeeeee'
      'rrrrrrrrrrrrrrrrrr'
      'rrrrrrrrrrr'
      'tttttttttttttttt'
      
        'yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy' +
        'yyyyyy')
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = False
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 8
    Top = 368
    Width = 493
    Height = 55
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    Filter = 'lzw|*.lzw|text|*.txt|'#1074#1089#1077' '#1092#1072#1081#1083#1099'|*.*'
    Left = 400
    Top = 24
  end
  object SaveDialog1: TSaveDialog
    Left = 400
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 8
    object file1: TMenuItem
      Caption = 'Lzw'
      object rletotext1: TMenuItem
        Caption = #1057#1078#1072#1090#1080#1077
        OnClick = rletotext1Click
      end
      object Lzwdecompress1: TMenuItem
        Caption = #1056#1072#1089#1087#1072#1082#1086#1074#1082#1072
        OnClick = Lzwdecompress1Click
      end
      object texttorle1: TMenuItem
        Caption = #1042' '#1058#1077#1082#1089#1090
        OnClick = texttorle1Click
      end
      object exit1: TMenuItem
        Caption = #1047#1072#1082#1088#1099#1090#1100
        OnClick = exit1Click
      end
    end
    object rle1: TMenuItem
      Caption = 'Rle'
      object rletotext2: TMenuItem
        Caption = #1042' '#1058#1077#1082#1089#1090
        OnClick = rletotext2Click
      end
      object rletofile1: TMenuItem
        Caption = #1042' '#1060#1072#1081#1083
        OnClick = rletofile1Click
      end
    end
    object ext1: TMenuItem
      Caption = #1058#1077#1082#1089#1090
      object N1: TMenuItem
        Caption = #1042' '#1060#1072#1081#1083
        object open1: TMenuItem
          Caption = 'Lzw'
          OnClick = open1Click
        end
        object Rle2: TMenuItem
          Caption = 'Rle'
          OnClick = Rle2Click
        end
      end
      object openfile1: TMenuItem
        Caption = #1042' Rle '
        OnClick = openfile1Click
      end
    end
    object clear1: TMenuItem
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100
      OnClick = clear1Click
    end
  end
end

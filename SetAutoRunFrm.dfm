object frmSetAutoRun: TfrmSetAutoRun
  Left = 0
  Top = 0
  Caption = #35774#32622#31243#24207#33258#21551#21160
  ClientHeight = 224
  ClientWidth = 528
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtFilePath: TEdit
    Left = 64
    Top = 40
    Width = 329
    Height = 21
    TabOrder = 0
    Text = 'edtFilePath'
  end
  object btnSelFile: TButton
    Left = 407
    Top = 38
    Width = 75
    Height = 25
    Caption = #27983#35272
    TabOrder = 1
    OnClick = btnSelFileClick
  end
  object btnSetAutoRun: TButton
    Left = 64
    Top = 80
    Width = 97
    Height = 25
    Caption = #35774#32622#33258#21551#21160
    TabOrder = 2
    OnClick = btnSetAutoRunClick
  end
  object btnTestAutoRun: TButton
    Left = 312
    Top = 80
    Width = 97
    Height = 25
    Caption = #27979#35797#33258#21551#21160
    TabOrder = 3
    OnClick = btnTestAutoRunClick
  end
  object mmoLog: TMemo
    Left = 0
    Top = 135
    Width = 528
    Height = 89
    Align = alBottom
    Lines.Strings = (
      'mmoLog')
    TabOrder = 4
    ExplicitLeft = 160
    ExplicitTop = 160
    ExplicitWidth = 185
  end
  object btnCancelAutoRun: TButton
    Left = 192
    Top = 80
    Width = 89
    Height = 25
    Caption = #21462#28040#33258#21551#21160
    TabOrder = 5
    OnClick = btnCancelAutoRunClick
  end
  object flpndlg1: TFileOpenDialog
    DefaultExtension = '*.exe'
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPathMustExist, fdoFileMustExist]
    Left = 464
    Top = 56
  end
end

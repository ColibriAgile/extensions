object formMensagemErro: TformMensagemErro
  Left = 0
  Top = 0
  ActiveControl = memoErro
  BorderStyle = bsDialog
  Caption = 'Mensagem de erro'
  ClientHeight = 271
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Ubuntu Light'
  Font.Style = []
  Padding.Left = 5
  Padding.Right = 5
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object lblTit: TLabel
    Left = 5
    Top = 0
    Width = 434
    Height = 25
    Align = alTop
    AutoSize = False
    Caption = 'Digite a mensagem de erro'
    Layout = tlCenter
    ExplicitWidth = 502
  end
  object memoErro: TMemo
    Left = 5
    Top = 25
    Width = 434
    Height = 201
    Align = alClient
    BorderStyle = bsNone
    Lines.Strings = (
      'Mensagem de erro de teste')
    TabOrder = 0
    ExplicitWidth = 502
    ExplicitHeight = 235
  end
  object pnlBotoes: TRzPanel
    Left = 5
    Top = 226
    Width = 434
    Height = 45
    Align = alBottom
    BorderOuter = fsNone
    Padding.Top = 5
    Padding.Bottom = 5
    TabOrder = 1
    ExplicitLeft = 0
    ExplicitTop = 260
    ExplicitWidth = 745
    object Button1: TButton
      AlignWithMargins = True
      Left = 0
      Top = 5
      Width = 90
      Height = 35
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Voltar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 0
    end
    object Button2: TButton
      AlignWithMargins = True
      Left = 209
      Top = 5
      Width = 90
      Height = 35
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Retornar erro'
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
      ExplicitLeft = 428
    end
    object Button3: TButton
      AlignWithMargins = True
      Left = 304
      Top = 5
      Width = 130
      Height = 35
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = 'Interromper notifica'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
      ExplicitLeft = 542
    end
  end
end

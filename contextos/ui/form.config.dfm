object formConfig: TformConfig
  Left = 0
  Top = 0
  Caption = 'Monitor de eventos e contextos'
  ClientHeight = 545
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Ubuntu Light'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object lblTitulo: TLabel
    Left = 5
    Top = 5
    Width = 484
    Height = 30
    Align = alTop
    AutoSize = False
    Caption = 'Selecione os eventos que deseja monitorar e clique em '#39'Aplicar'#39
    Layout = tlCenter
    ExplicitWidth = 552
  end
  object chkMostrarNotificacao: TCheckBox
    AlignWithMargins = True
    Left = 5
    Top = 475
    Width = 484
    Height = 20
    Margins.Left = 0
    Margins.Top = 10
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alBottom
    Caption = 'Mostrar notifica'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Ubuntu Light'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    ExplicitTop = 440
    ExplicitWidth = 552
  end
  object treeEventos: TJvCheckTreeView
    Left = 5
    Top = 35
    Width = 484
    Height = 430
    Align = alClient
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Ubuntu Light'
    Font.Style = []
    Indent = 19
    ParentFont = False
    TabOrder = 0
    Items.NodeData = {
      0302000000320000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010A73006400660067007300640066006700730064002E00000000
      00000000000000FFFFFFFFFFFFFFFF0000000000000000020000000108730064
      006600670073006400660067002E0000000000000000000000FFFFFFFFFFFFFF
      FF0000000000000000000000000108730064006600670073006400660067002E
      0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000000000001
      0873006400660067007300640066006700}
    LineColor = clScrollBar
    ItemHeight = 22
    Checkboxes = True
    CheckBoxOptions.Style = cbsJVCL
    CheckBoxOptions.CascadeLevels = -1
    ExplicitLeft = 8
    ExplicitTop = 38
    ExplicitWidth = 552
    ExplicitHeight = 395
  end
  object pnlBotoes: TPanel
    Left = 5
    Top = 495
    Width = 484
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Padding.Top = 10
    Padding.Bottom = 5
    TabOrder = 2
    ExplicitTop = 460
    ExplicitWidth = 552
    object btnFechar: TButton
      AlignWithMargins = True
      Left = 394
      Top = 10
      Width = 90
      Height = 35
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = '&Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 3
      ExplicitLeft = 462
    end
    object btnAplicar: TButton
      AlignWithMargins = True
      Left = 299
      Top = 10
      Width = 90
      Height = 35
      Margins.Left = 5
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alRight
      Caption = '&Aplicar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = btnAplicarClick
      ExplicitLeft = 367
    end
    object btnMarcarTodos: TButton
      AlignWithMargins = True
      Left = 0
      Top = 10
      Width = 90
      Height = 35
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Marcar todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnMarcarTodosClick
    end
    object btnDesmarcarTodos: TButton
      AlignWithMargins = True
      Left = 95
      Top = 10
      Width = 90
      Height = 35
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 5
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'Desmarcar todos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Ubuntu Condensed'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnDesmarcarTodosClick
    end
  end
end

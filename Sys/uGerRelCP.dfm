object frmGerRelCP: TfrmGerRelCP
  Left = 431
  Top = 202
  Width = 324
  Height = 279
  BorderIcons = []
  Caption = 'Relat'#243'rio de Contas a Pagar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object rdgrpStatus: TRadioGroup
    Left = 0
    Top = 150
    Width = 308
    Height = 50
    Align = alTop
    Caption = 'Status Duplicata'
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Todas'
      'Quitadas'
      'Pendentes')
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 308
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object BitBtn2: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 0
      Kind = bkClose
    end
    object btbtnGrupo: TBitBtn
      Left = 56
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Default = True
      TabOrder = 1
      OnClick = btbtnGrupoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object rdgrpData: TRadioGroup
    Left = 0
    Top = 60
    Width = 308
    Height = 50
    Align = alTop
    BiDiMode = bdLeftToRight
    Caption = 'Per'#237'odo'
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemIndex = 1
    Items.Strings = (
      'Data de Emiss'#227'o'
      'Data de Vencimento')
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 110
    Width = 308
    Height = 40
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 9
      Top = 10
      Width = 21
      Height = 13
      Caption = 'De:'
    end
    object Label2: TLabel
      Left = 160
      Top = 11
      Width = 8
      Height = 13
      Caption = 'a'
    end
    object dttmpcIni: TDateTimePicker
      Left = 33
      Top = 10
      Width = 112
      Height = 21
      Date = 39934.729982395800000000
      Time = 39934.729982395800000000
      TabOrder = 0
    end
    object dttmpcFim: TDateTimePicker
      Left = 187
      Top = 10
      Width = 109
      Height = 21
      Date = 39964.729982395800000000
      Time = 39964.729982395800000000
      TabOrder = 1
    end
  end
  object grpbxVendedor: TGroupBox
    Left = 0
    Top = 0
    Width = 308
    Height = 60
    Align = alTop
    Caption = 'Fornecedor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object cmbbxFornecedor: TComboBox
      Left = 10
      Top = 22
      Width = 287
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        '')
    end
  end
  object ibqryFornec: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    Left = 128
    Top = 48
    object ibqryFornecNOMEFORN: TIBStringField
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
  end
end

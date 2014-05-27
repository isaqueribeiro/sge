object frmPesq: TfrmPesq
  Left = 395
  Top = 212
  Width = 433
  Height = 272
  BorderStyle = bsSizeToolWin
  Caption = 'Pesquisa'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 417
    Height = 177
    Color = clSilver
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = BitBtn1Click
    Columns = <
      item
        Expanded = False
        FieldName = 'NOMEFORN'
        Title.Caption = 'RAZ'#195'O SOCIAL'
        Width = 283
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 184
    Width = 209
    Height = 47
    Caption = 'Pesquisa:'
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 165
      Top = 16
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
        300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
        330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
        333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
        339977FF777777773377000BFB03333333337773FF733333333F333000333333
        3300333777333333337733333333333333003333333333333377333333333333
        333333333333333333FF33333333333330003333333333333777333333333333
        3000333333333333377733333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object edt: TMaskEdit
      Left = 8
      Top = 16
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 240
    Top = 197
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 330
    Top = 197
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object IBQuery1: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select  CODFORN, CNPJ, NOMEFORN from TBFORNECEDOR'
      'order by NOMEFORN')
    Left = 352
    Top = 96
    object IBQuery1CNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBFORNECEDOR.CNPJ'
      EditMask = '00.000.000/0000-00;0;_'
      Size = 18
    end
    object IBQuery1NOMEFORN: TIBStringField
      FieldName = 'NOMEFORN'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
    object IBQuery1CODFORN: TIntegerField
      FieldName = 'CODFORN'
      Origin = 'TBFORNECEDOR.CODFORN'
      Required = True
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 280
    Top = 96
  end
end

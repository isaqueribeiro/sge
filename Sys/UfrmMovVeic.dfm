object frmMovVeic: TfrmMovVeic
  Left = 179
  Top = 161
  Width = 1121
  Height = 413
  AutoSize = True
  Caption = 'Ve'#237'culo - Movimenta'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1105
    Height = 57
    Align = alTop
    TabOrder = 0
    object grpBxFiltro: TGroupBox
      Left = 1
      Top = 1
      Width = 504
      Height = 55
      Align = alLeft
      Caption = 'Pesquisar    '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        504
        55)
      object btnFiltrar: TSpeedButton
        Left = 459
        Top = 16
        Width = 29
        Height = 27
        Hint = 'Clique aqui para executar a pesquisa ...'
        Anchors = [akTop, akRight, akBottom]
        Flat = True
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF314B62
          AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
          106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
          00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
          9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
          E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
          FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
          B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
          FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
          DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
          B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
          BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
          D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
          6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnFiltrarClick
      end
      object edtFiltrar: TEdit
        Left = 152
        Top = 21
        Width = 297
        Height = 21
        Hint = 'Digite aqui a palavra-chave da pesquisa'
        Anchors = [akLeft, akTop, akRight]
        CharCase = ecUpperCase
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyDown = edtFiltrarKeyDown
      end
      object CmbBxFiltrarTipo: TComboBox
        Left = 8
        Top = 21
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'por Placa'
        Items.Strings = (
          'por Placa'
          'por Fornecedor'
          'por Cliente')
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 89
    Width = 1105
    Height = 125
    Align = alTop
    Color = clBtnFace
    DataSource = dtsCompVeic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VEICULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Ve'#237'culo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 223
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Placa'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Ano'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORVEIC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Cor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Entrada'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FORNECEDOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Fornecedor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 255
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COMPRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Compra'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 32
        Visible = True
      end>
  end
  object Panel3: TPanel
    Left = 0
    Top = 57
    Width = 1105
    Height = 32
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'COMPRA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 214
    Width = 1105
    Height = 29
    Align = alTop
    Alignment = taLeftJustify
    Caption = 'VENDA:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 243
    Width = 1105
    Height = 132
    Align = alTop
    Color = clBtnFace
    DataSource = dtsiVendVeic
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'VEICULO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Ve'#237'culo'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PLACA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Placa'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 75
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ANO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Ano'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORVEIC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Caption = 'Cor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 99
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SAIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Sa'#237'da'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 71
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 98
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLIENTE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Cliente'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 253
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Venda'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NFE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'NF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'Status'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 43
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Title.Caption = 'C'#243'd.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 32
        Visible = True
      end>
  end
  object ibqryCompVeic: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT p.descri as veiculo, p.referencia as placa, P.ano_fabrica' +
        'cao_veiculo || '#39'/'#39' || P.ano_modelo_veiculo as ANO, rc.descricao ' +
        'as corveic, ci.dtent as entrada, ci.precounit as valor, f.nomefo' +
        'rn as fornecedor, c.codcontrol as Compra, c.nf, c.status, p.codi' +
        'go'
      'FROM tbproduto P'
      '    inner join tbcomprasitens ci on (p.cod=ci.codprod)'
      
        '    inner join tbcompras c on (ci.ano=c.ano and ci.codcontrol=c.' +
        'codcontrol and ci.codemp = c.codemp)'
      '    inner join tbfornecedor f on (c.codforn=f.codforn)'
      '    inner join renavam_cor rc on (p.cor_veiculo=rc.codigo)'
      'WHERE (P.referencia like :placa) and (f.nomeforn like :fornec)')
    Left = 720
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'fornec'
        ParamType = ptUnknown
      end>
    object ibqryCompVeicVEICULO: TIBStringField
      FieldName = 'VEICULO'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object ibqryCompVeicPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TBPRODUTO.REFERENCIA'
      Size = 15
    end
    object ibqryCompVeicANO: TIBStringField
      Alignment = taCenter
      FieldName = 'ANO'
      Size = 13
    end
    object ibqryCompVeicCORVEIC: TIBStringField
      Alignment = taCenter
      FieldName = 'CORVEIC'
      Origin = 'RENAVAM_COR.DESCRICAO'
      Size = 50
    end
    object ibqryCompVeicENTRADA: TDateField
      FieldName = 'ENTRADA'
      Origin = 'TBCOMPRASITENS.DTENT'
    end
    object ibqryCompVeicVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'TBCOMPRASITENS.PRECOUNIT'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibqryCompVeicFORNECEDOR: TIBStringField
      FieldName = 'FORNECEDOR'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
    object ibqryCompVeicCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      Origin = 'TBCOMPRAS.CODCONTROL'
      Required = True
    end
    object ibqryCompVeicNF: TIntegerField
      FieldName = 'NF'
      Origin = 'TBCOMPRAS.NF'
      Required = True
    end
    object ibqryCompVeicSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'TBCOMPRAS.STATUS'
      Required = True
    end
    object ibqryCompVeicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBPRODUTO.CODIGO'
    end
  end
  object dtsCompVeic: TDataSource
    DataSet = ibqryCompVeic
    Left = 752
    Top = 8
  end
  object ibqryVendVeic: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'SELECT p.descri as veiculo, p.referencia as placa, P.ano_fabrica' +
        'cao_veiculo || '#39'/'#39' || P.ano_modelo_veiculo as ANO, rc.descricao ' +
        'as corveic, vi.dtvenda as Saida, vi.pfinal as valor, c.nome as c' +
        'liente, v.codcontrol as Venda, v.nfe, v.status, p.codigo'
      'FROM tbproduto P'
      '    inner join tvendasitens vi on (p.cod=vi.codprod)'
      
        '    inner join tbvendas v on (vi.ano=v.ano and vi.codcontrol=v.c' +
        'odcontrol and vi.codemp = v.codemp)'
      '    inner join tbcliente c on (v.codcli=c.cnpj)'
      '    inner join renavam_cor rc on (p.cor_veiculo=rc.codigo)'
      'WHERE (P.referencia like :placa) and (c.nome like :cli)')
    Left = 624
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'placa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cli'
        ParamType = ptUnknown
      end>
    object ibqryVendVeicVEICULO: TIBStringField
      FieldName = 'VEICULO'
      Origin = 'TBPRODUTO.DESCRI'
      Size = 50
    end
    object ibqryVendVeicPLACA: TIBStringField
      FieldName = 'PLACA'
      Origin = 'TBPRODUTO.REFERENCIA'
      Size = 15
    end
    object ibqryVendVeicANO: TIBStringField
      Alignment = taCenter
      FieldName = 'ANO'
      Size = 13
    end
    object ibqryVendVeicCORVEIC: TIBStringField
      Alignment = taCenter
      FieldName = 'CORVEIC'
      Origin = 'RENAVAM_COR.DESCRICAO'
      Size = 50
    end
    object ibqryVendVeicSAIDA: TDateTimeField
      FieldName = 'SAIDA'
      Origin = 'TVENDASITENS.DTVENDA'
    end
    object ibqryVendVeicVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = 'TVENDASITENS.PFINAL'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibqryVendVeicCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object ibqryVendVeicVENDA: TIntegerField
      FieldName = 'VENDA'
      Origin = 'TBVENDAS.CODCONTROL'
      Required = True
    end
    object ibqryVendVeicNFE: TLargeintField
      FieldName = 'NFE'
      Origin = 'TBVENDAS.NFE'
    end
    object ibqryVendVeicSTATUS: TSmallintField
      FieldName = 'STATUS'
      Origin = 'TBVENDAS.STATUS'
      Required = True
    end
    object ibqryVendVeicCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Origin = 'TBPRODUTO.CODIGO'
    end
  end
  object dtsiVendVeic: TDataSource
    DataSet = ibqryVendVeic
    Left = 656
    Top = 8
  end
end

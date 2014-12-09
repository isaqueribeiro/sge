inherited frmGeProdutoKardex: TfrmGeProdutoKardex
  Left = 394
  Top = 217
  Width = 1099
  Height = 648
  Caption = 'Pesquisa Kardex (Hist'#243'rico de Produtos/Servi'#231'os)'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 1083
    inherited GrpBxPesquisar: TGroupBox
      Width = 855
      DesignSize = (
        855
        73)
      inherited BrnPesquisar: TSpeedButton
        Left = 818
      end
      inherited lblPesquisar: TLabel
        Left = 576
        Width = 110
        Caption = '&Descri'#231#227'o hist'#243'rico:'
      end
      object lblData: TLabel [2]
        Left = 352
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Per'#237'o&do:'
        FocusControl = e1Data
      end
      object lblProduto: TLabel [3]
        Left = 16
        Top = 24
        Width = 96
        Height = 13
        Caption = '&Produto/Servi'#231'o:'
        FocusControl = edProduto
      end
      inherited edPesquisar: TEdit
        Left = 576
        Width = 235
        TabOrder = 3
      end
      object e1Data: TDateEdit
        Left = 352
        Top = 40
        Width = 104
        Height = 21
        NumGlyphs = 2
        TabOrder = 1
        Text = '24/06/2013'
      end
      object e2Data: TDateEdit
        Left = 464
        Top = 40
        Width = 105
        Height = 21
        NumGlyphs = 2
        TabOrder = 2
        Text = '24/06/2013'
      end
      object edProduto: TComboEdit
        Left = 16
        Top = 40
        Width = 329
        Height = 21
        ButtonHint = 'Pesquisar Produto/Servi'#231'o (Ctrl+P)'#13#10#13#10'Limpar Campo (Ctrl+L)'
        CharCase = ecUpperCase
        ClickKey = 16464
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          18000000000000060000000000000000000000000000000000001DE6B51DE6B5
          1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B5B1AD
          AC203040ACA5A21DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C37F7F7F7F7F7FACA5A2C3C3C31DE6B5B0A090
          6048306048306048306048306048306048306048306048306048305048403050
          604078C0304860B1ACA6C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3B1ACA61DE6B5B0A090
          FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A0909088803050703080
          D04098E050B0F0506870C3C3C37F7F7FFFFFFFC3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C39088807F7F7FC3C3C3C3C3C3C3C3C37F7F7F1DE6B5B0A090
          FFFFFFFFFFFFFFF8FFF0F0F0D0D8D090989070686060686050586040709040A0
          E060C8FF7090A0C5BEB5C3C3C37F7F7FFFFFFFFFFFFFFFF8FFF0F0F0D0D8D07F
          7F7F7F7F7F7F7F7F505860C3C3C3C3C3C3C3C3C37090A0C5BEB51DE6B5B0A090
          FFFFFFFFFFFFFFFFFFE0E0E0909090B0A8A0D0C0B0D0B0A08078705058506090
          B07098B0AEAEAA1DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFE0E0E07F7F7F7F
          7F7FD0C0B0D0B0A0807870505850C3C3C37098B0AEAEAAC3C3C31DE6B5B0A090
          FFFFFFFFFFFFFFFFFFB0B0B0C0B8B0FFF0E0FFE8E0F0D8C0F0D0B08078709D8F
          8CAEAFAA1DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          F0E0FFE8E0F0D8C0F0D0B08078709D8F8CAEAFAAC3C3C3C3C3C31DE6B5C0A890
          FFFFFFFFFFFFFFFFFFA09890F0E8E0FFF8F0FFF0F0FFE8E0F0D8D0D0B0A06367
          5E1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          F8F0FFF0F0FFE8E0F0D8D0D0B0A063675EC3C3C3C3C3C3C3C3C31DE6B5C0A8A0
          FFFFFFFFFFFFFFFFFFA0A090F0E8E0FFFFFFFFF8F0FFF0F0FFE8E0E0C0B0716E
          6C1DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFF8F0FFF0F0FFE8E0E0C0B0716E6CC3C3C3C3C3C3C3C3C31DE6B5C0B0A0
          FFFFFFFFFFFFFFFFFFC0C8C0C0C0C0FFFFFFFFFFFFFFF8F0FFF0E0B0A090A69C
          951DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFF7F7F7F7F7F7FFF
          FFFFFFFFFFFFF8F0FFF0E0B0A090A69C95C3C3C3C3C3C3C3C3C31DE6B5D0B0A0
          FFFFFFFFFFFFFFFFFFF0F8FFC0B8B0C0C0C0F0E8E0F0E8E0B0B0A07070601DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFF0F8FF7F7F7F7F
          7F7FF0E8E0F0E8E0B0B0A0707060C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8A0
          FFFFFFFFFFFFFFFFFFFFFFFFF0F8FFC0C8C0A0A0909090809090906050401DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFF0F8FF7F
          7F7FA0A0907F7F7F909090605040C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0B8B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048301DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F604830604830604830C3C3C3C3C3C3C3C3C3C3C3C31DE6B5D0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C06048301DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7FC3C3C3604830C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0C6B71DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF7F7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B5E0C0B0
          E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C7B91DE6B51DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C37F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
          7F7F7F7F7F7F7F7FC3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C31DE6B51DE6B5
          1DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6B51DE6
          B51DE6B51DE6B51DE6B5C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3
          C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3C3}
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnButtonClick = edProdutoButtonClick
        OnKeyPress = edProdutoKeyPress
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 1083
    Height = 529
    inherited dbgDados: TDBGrid
      Width = 1075
      Height = 521
      Columns = <
        item
          Expanded = False
          FieldName = 'DTHIST'
          Title.Caption = 'Data / Hora'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESP'
          Title.Caption = 'Respons'#225'vel'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HISTORICO'
          Title.Caption = 'Tipo Movimento'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEATUAL'
          Title.Caption = 'Estoque'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDENOVA'
          Title.Caption = 'Qtde.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QTDEFINAL'
          Title.Caption = 'Saldo'
          Width = 60
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'UND.'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MOTIVO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC'
          Title.Caption = 'Documento'
          Width = 100
          Visible = True
        end>
    end
  end
  inherited QryPesquisa: TIBQuery
    SQL.Strings = (
      'Select'
      '    ph.codempresa'
      '  , ph.codprod'
      '  , ph.doc'
      '  , ph.historico'
      '  , ph.dthist'
      '  , ph.qtdeatual'
      '  , ph.qtdenova'
      '  , ph.qtdefinal'
      
        '  , substring(coalesce(nullif(trim(u.unp_sigla), '#39#39'), u.unp_desc' +
        'ricao) from 1 for 3) as unidade'
      '  , ph.resp'
      '  , ph.motivo'
      'from TBPRODHIST ph'
      '  inner join TBPRODUTO p on (p.cod = ph.codprod)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = p.codunidade)')
    Left = 40
    Top = 153
    object QryPesquisaCODEMPRESA: TIBStringField
      FieldName = 'CODEMPRESA'
      Origin = '"TBPRODHIST"."CODEMPRESA"'
      Size = 18
    end
    object QryPesquisaCODPROD: TIBStringField
      FieldName = 'CODPROD'
      Origin = '"TBPRODHIST"."CODPROD"'
      Required = True
      Size = 10
    end
    object QryPesquisaDOC: TIBStringField
      FieldName = 'DOC'
      Origin = '"TBPRODHIST"."DOC"'
    end
    object QryPesquisaHISTORICO: TIBStringField
      FieldName = 'HISTORICO'
      Origin = '"TBPRODHIST"."HISTORICO"'
      Size = 40
    end
    object QryPesquisaDTHIST: TDateTimeField
      FieldName = 'DTHIST'
      Origin = '"TBPRODHIST"."DTHIST"'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object QryPesquisaQTDEATUAL: TIBBCDField
      FieldName = 'QTDEATUAL'
      Origin = '"TBPRODHIST"."QTDEATUAL"'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object QryPesquisaQTDENOVA: TIBBCDField
      FieldName = 'QTDENOVA'
      Origin = '"TBPRODHIST"."QTDENOVA"'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object QryPesquisaQTDEFINAL: TIBBCDField
      FieldName = 'QTDEFINAL'
      Origin = '"TBPRODHIST"."QTDEFINAL"'
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object QryPesquisaUNIDADE: TIBStringField
      FieldName = 'UNIDADE'
      ProviderFlags = []
      Size = 50
    end
    object QryPesquisaRESP: TIBStringField
      FieldName = 'RESP'
      Origin = '"TBPRODHIST"."RESP"'
      Size = 60
    end
    object QryPesquisaMOTIVO: TIBStringField
      FieldName = 'MOTIVO'
      Origin = '"TBPRODHIST"."MOTIVO"'
      Size = 250
    end
  end
  inherited DtsPesquisa: TDataSource
    Left = 72
    Top = 153
  end
end

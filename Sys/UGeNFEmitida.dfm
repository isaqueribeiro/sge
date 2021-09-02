inherited frmGeNFEmitida: TfrmGeNFEmitida
  Left = 399
  Top = 207
  ActiveControl = dbgDados
  Caption = 'Notas Fiscais Emitidas'
  ClientHeight = 471
  OldCreateOrder = True
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 467
    ExplicitTop = 468
  end
  inherited Bevel3: TBevel
    Top = 428
    ExplicitTop = 429
  end
  inherited pgcGuias: TPageControl
    Height = 428
    ActivePage = tbsTabela
    ExplicitHeight = 428
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 399
      inherited Bevel4: TBevel
        Top = 333
        ExplicitTop = 334
      end
      inherited dbgDados: TDBGrid
        Height = 333
        Columns = <
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO'
            Title.Caption = 'NF-e '
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAO'
            Title.Caption = 'Emiss'#227'o '
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO_RAZAO'
            Title.Caption = 'Destinat'#225'rio '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO_CNPJ'
            Title.Caption = 'CPF / CNPJ '
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_VALOR_TOTAL'
            Title.Caption = 'Valor NF (R$) '
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 337
        ExplicitTop = 337
        object lblNotaCancelada: TLabel [0]
          Left = 2
          Top = 4
          Width = 109
          Height = 13
          Caption = '* Notas Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 152
          Width = 571
          ExplicitLeft = 152
          ExplicitWidth = 571
          DesignSize = (
            571
            54)
          inherited lbltFiltrar: TLabel
            Left = 286
            Width = 73
            Caption = 'Destinat'#225'rio:'
            ExplicitLeft = 286
            ExplicitWidth = 73
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 27
            Width = 49
            Height = 13
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 368
            Width = 154
            TabOrder = 2
            ExplicitLeft = 368
            ExplicitWidth = 154
          end
          inherited btnFiltrar: TcxButton
            Left = 526
            TabOrder = 3
            ExplicitLeft = 526
          end
          object e1Data: TJvDateEdit
            Left = 72
            Top = 23
            Width = 100
            Height = 21
            Date = 40909.000000000000000000
            Glyph.Data = {
              76050000424D760500000000000036000000280000001C0000000C0000000100
              2000000000004005000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF008080800080808000808080008080800080808000808080008080
              800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
              0000800000008000000000000000800000000000000000000000800000008080
              8000FF00FF008080800080808000808080008080800080808000808080008080
              80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
              0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
              80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
              C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
              0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
              FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
              8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
              000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF008080800080808000808080008080800080808000808080008080
              80008080800080808000808080008080800080808000FF00FF00}
            ImageKind = ikCustom
            NumGlyphs = 2
            PopupColor = clBtnFace
            ShowNullDate = False
            TabOrder = 0
          end
          object e2Data: TJvDateEdit
            Left = 176
            Top = 23
            Width = 103
            Height = 21
            Date = 40909.000000000000000000
            Glyph.Data = {
              76050000424D760500000000000036000000280000001C0000000C0000000100
              2000000000004005000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF008080800080808000808080008080800080808000808080008080
              800080808000808080008080800080808000FF00FF00FF00FF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FF00FF00FF00FF000000000000000000800000000000
              0000800000008000000000000000800000000000000000000000800000008080
              8000FF00FF008080800080808000808080008080800080808000808080008080
              80008080800080808000808080008080800080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF00FFFFFF00FFFFFF00FFFFFF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF0000000000000000000000
              0000FFFFFF00000000000000000000000000C0C0C000FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00808080008080800080808000FF00FF008080
              80008080800080808000FF00FF00FFFFFF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C0C0C000FFFFFF00C0C0
              C00000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFF
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0080808000FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
              0000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FFFFFF00FF00FF00808080008080800080808000FF00FF00FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF000000000000000000FFFF
              FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF008080800080808000FFFFFF00FF00FF008080
              8000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF0000000000000000000000
              000000000000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FF00
              FF0080808000FF00FF00FF00FF0080808000808080008080800080808000FF00
              FF0080808000FFFFFF00FF00FF00FF00FF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00800000008080
              8000FF00FF0080808000FFFFFF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0080808000FFFFFF00FF00FF00FF00
              FF00FFFFFF00C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
              C000C0C0C000FFFFFF008000000080808000FF00FF0080808000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0080808000FFFFFF00FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF008080800080808000808080008080800080808000808080008080
              80008080800080808000808080008080800080808000FF00FF00}
            ImageKind = ikCustom
            NumGlyphs = 2
            PopupColor = clBtnFace
            ShowNullDate = False
            TabOrder = 1
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 727
      ExplicitHeight = 399
      inherited Bevel8: TBevel
        Top = 73
        ExplicitTop = 89
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 73
        ExplicitHeight = 73
        inherited lblCodigo: TLabel
          Width = 47
          Caption = 'N'#250'mero:'
          ExplicitWidth = 47
        end
        inherited dbCodigo: TDBEdit
          Width = 121
          DataField = 'NFE_DESTINATARIO'
          ReadOnly = False
          ExplicitWidth = 121
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 432
    ExplicitTop = 432
    inherited btbtnIncluir: TcxButton
      Visible = False
    end
    inherited btbtnAlterar: TcxButton
      Visible = False
    end
    inherited btbtnExcluir: TcxButton
      Visible = False
    end
    inherited btbtnCancelar: TcxButton
      Visible = False
    end
    inherited btbtnSalvar: TcxButton
      Visible = False
    end
    inherited btbtnSelecionar: TcxButton
      Visible = True
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = ()
    Left = 320
    Top = 208
  end
  inherited DtSrcTabela: TDataSource
    DataSet = fdQryTabela
    Left = 320
    Top = 272
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      '')
    ModifySQL.Strings = ()
    InsertSQL.Strings = ()
    DeleteSQL.Strings = ()
    Left = 352
    Top = 208
  end
  inherited ImgList: TImageList
    Left = 288
    Top = 208
  end
  inherited fdQryTabela: TFDQuery
    SQL.Strings = (
      'Select'
      
        '    coalesce(lpad(nf.numero, 7, '#39'0'#39') || '#39'-'#39' || nf.serie, '#39#39') as ' +
        'nfe_destinatario'
      '  , coalesce(cl.codigo, fn.codforn) as nfe_destinatario_codigo'
      '  , coalesce(cl.nome, fn.nomeforn)  as nfe_destinatario_razao'
      '  , coalesce(cl.cnpj, fn.cnpj) as nfe_destinatario_cnpj'
      '  , coalesce(cl.inscest, fn.inscest) as nfe_destinatario_inscest'
      '  , coalesce(cl.uf, fn.uf) as nfe_destinatario_uf'
      
        '  , coalesce(vn.nfe_valor_total_nota, cp.totalnf) as nfe_valor_t' +
        'otal'
      '  , nf.empresa'
      '  , nf.serie'
      '  , nf.numero'
      '  , nf.modelo'
      '  , nf.dataemissao'
      '  , nf.horaemissao'
      '  , nf.versao'
      '  , nf.recibo'
      '  , nf.protocolo'
      '  , nf.chave'
      '  , nf.anovenda'
      '  , nf.numvenda'
      '  , nf.anocompra'
      '  , nf.numcompra'
      '  , nf.xml_filename'
      '  , nf.xml_file'
      '  , nf.cancelada'
      'from TBNFE_ENVIADA nf'
      ''
      
        '  left join TBVENDAS vn on (vn.ano = nf.anovenda and vn.codcontr' +
        'ol = nf.numvenda)'
      '  left join TBCLIENTE cl on (cl.codigo = vn.codcliente)'
      ''
      
        '  left join TBCOMPRAS cp on (cp.ano = nf.anocompra and cp.codcon' +
        'trol = nf.numcompra)'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)')
    Left = 320
    Top = 240
    object fdQryTabelaNFE_DESTINATARIO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_DESTINATARIO'
      Origin = 'NFE_DESTINATARIO'
      ProviderFlags = []
      ReadOnly = True
      Size = 12
    end
    object fdQryTabelaNFE_DESTINATARIO_CODIGO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_DESTINATARIO_CODIGO'
      Origin = 'NFE_DESTINATARIO_CODIGO'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdQryTabelaNFE_DESTINATARIO_RAZAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_DESTINATARIO_RAZAO'
      Origin = 'NFE_DESTINATARIO_RAZAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object fdQryTabelaNFE_DESTINATARIO_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_DESTINATARIO_CNPJ'
      Origin = 'NFE_DESTINATARIO_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      OnGetText = fdQryTabelaNFE_DESTINATARIO_CNPJGetText
      Size = 18
    end
    object fdQryTabelaNFE_DESTINATARIO_INSCEST: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_DESTINATARIO_INSCEST'
      Origin = 'NFE_DESTINATARIO_INSCEST'
      ProviderFlags = []
      ReadOnly = True
    end
    object fdQryTabelaNFE_DESTINATARIO_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_DESTINATARIO_UF'
      Origin = 'NFE_DESTINATARIO_UF'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object fdQryTabelaNFE_VALOR_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'NFE_VALOR_TOTAL'
      Origin = 'NFE_VALOR_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object fdQryTabelaEMPRESA: TStringField
      FieldName = 'EMPRESA'
      Origin = 'EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object fdQryTabelaSERIE: TStringField
      FieldName = 'SERIE'
      Origin = 'SERIE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object fdQryTabelaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = 'MODELO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object fdQryTabelaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = 'DATAEMISSAO'
    end
    object fdQryTabelaHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = 'HORAEMISSAO'
    end
    object fdQryTabelaVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = 'VERSAO'
    end
    object fdQryTabelaRECIBO: TStringField
      FieldName = 'RECIBO'
      Origin = 'RECIBO'
      Size = 250
    end
    object fdQryTabelaPROTOCOLO: TStringField
      FieldName = 'PROTOCOLO'
      Origin = 'PROTOCOLO'
      Size = 250
    end
    object fdQryTabelaCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'CHAVE'
      Size = 250
    end
    object fdQryTabelaANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = 'ANOVENDA'
    end
    object fdQryTabelaNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = 'NUMVENDA'
    end
    object fdQryTabelaANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = 'ANOCOMPRA'
    end
    object fdQryTabelaNUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = 'NUMCOMPRA'
    end
    object fdQryTabelaXML_FILENAME: TStringField
      FieldName = 'XML_FILENAME'
      Origin = 'XML_FILENAME'
      Size = 250
    end
    object fdQryTabelaXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = 'XML_FILE'
      BlobType = ftMemo
    end
    object fdQryTabelaCANCELADA: TSmallintField
      FieldName = 'CANCELADA'
      Origin = 'CANCELADA'
      Required = True
    end
  end
  inherited fdUpdTabela: TFDUpdateSQL
    FetchRowSQL.Strings = (
      'Select'
      
        '    coalesce(lpad(nf.numero, 7, '#39'0'#39') || '#39'-'#39' || nf.serie, '#39#39') as ' +
        'nfe_destinatario'
      '  , coalesce(cl.codigo, fn.codforn) as nfe_destinatario_codigo'
      '  , coalesce(cl.nome, fn.nomeforn)  as nfe_destinatario_razao'
      '  , coalesce(cl.cnpj, fn.cnpj) as nfe_destinatario_cnpj'
      '  , coalesce(cl.inscest, fn.inscest) as nfe_destinatario_inscest'
      '  , coalesce(cl.uf, fn.uf) as nfe_destinatario_uf'
      
        '  , coalesce(vn.nfe_valor_total_nota, cp.totalnf) as nfe_valor_t' +
        'otal'
      '  , nf.empresa'
      '  , nf.serie'
      '  , nf.numero'
      '  , nf.modelo'
      '  , nf.dataemissao'
      '  , nf.horaemissao'
      '  , nf.versao'
      '  , nf.recibo'
      '  , nf.protocolo'
      '  , nf.chave'
      '  , nf.anovenda'
      '  , nf.numvenda'
      '  , nf.anocompra'
      '  , nf.numcompra'
      '  , nf.xml_filename'
      '  , nf.xml_file'
      '  , nf.cancelada'
      'from TBNFE_ENVIADA nf'
      ''
      
        '  left join TBVENDAS vn on (vn.ano = nf.anovenda and vn.codcontr' +
        'ol = nf.numvenda)'
      '  left join TBCLIENTE cl on (cl.codigo = vn.codcliente)'
      ''
      
        '  left join TBCOMPRAS cp on (cp.ano = nf.anocompra and cp.codcon' +
        'trol = nf.numcompra)'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)'
      
        'WHERE nf.EMPRESA = :EMPRESA AND nf.SERIE = :SERIE AND nf.NUMERO ' +
        '= :NUMERO AND '
      '  nf.MODELO = :MODELO')
    Left = 352
    Top = 240
  end
end

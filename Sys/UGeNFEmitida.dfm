inherited frmGeNFEmitida: TfrmGeNFEmitida
  Left = 700
  Top = 273
  Height = 510
  ActiveControl = dbCodigo
  Caption = 'Notas Fiscais Emitidas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 468
  end
  inherited Bevel3: TBevel
    Top = 429
  end
  inherited tlbBotoes: TToolBar
    Top = 433
    inherited btbtnIncluir: TBitBtn
      Visible = False
    end
    inherited btbtnAlterar: TBitBtn
      Visible = False
    end
    inherited btbtnExcluir: TBitBtn
      Visible = False
    end
    inherited btbtnCancelar: TBitBtn
      Visible = False
    end
    inherited btbtnSalvar: TBitBtn
      Visible = False
    end
    inherited btbtnSelecionar: TBitBtn
      Visible = True
    end
  end
  inherited pgcGuias: TPageControl
    Height = 429
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 334
      end
      inherited dbgDados: TDBGrid
        Height = 334
        Columns = <
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO'
            Title.Caption = 'NF-e'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAO'
            Title.Caption = 'Emiss'#227'o'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO_RAZAO'
            Title.Caption = 'Destinat'#225'rio'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO_CNPJ'
            Title.Caption = 'CPF / CNPJ'
            Width = 130
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_VALOR_TOTAL'
            Title.Caption = 'Valor NF (R$)'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 338
        inherited grpBxFiltro: TGroupBox
          Left = 152
          Width = 571
          inherited lbltFiltrar: TLabel
            Left = 286
            Width = 73
            Caption = 'Destinat'#225'rio:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 526
          end
          object lblData: TLabel [2]
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
          end
          object e1Data: TDateEdit
            Left = 72
            Top = 23
            Width = 101
            Height = 21
            GlyphKind = gkCustom
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
            NumGlyphs = 2
            TabOrder = 0
            Text = '01/01/2012'
          end
          object e2Data: TDateEdit
            Left = 176
            Top = 23
            Width = 104
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2012'
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 89
      end
      inherited GrpBxDadosNominais: TGroupBox
        Height = 89
        inherited lblCodigo: TLabel
          Width = 47
          Caption = 'N'#250'mero:'
        end
        inherited dbCodigo: TDBEdit
          Width = 121
          DataField = 'NFE_DESTINATARIO'
          ReadOnly = False
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    SelectSQL.Strings = (
      'Select'
      
        '    coalesce(lpad(nf.numero, 7, '#39'0'#39') || '#39'-'#39' || nf.serie, '#39#39') as ' +
        'nfe_destinatario'
      '  , coalesce(cl.nome, fn.nomeforn)  as nfe_destinatario_razao'
      '  , coalesce(cl.cnpj, fn.cnpj) as nfe_destinatario_cnpj'
      
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
    Top = 208
    object IbDtstTabelaNFE_DESTINATARIO: TIBStringField
      FieldName = 'NFE_DESTINATARIO'
      ProviderFlags = []
      Size = 12
    end
    object IbDtstTabelaNFE_DESTINATARIO_RAZAO: TIBStringField
      FieldName = 'NFE_DESTINATARIO_RAZAO'
      ProviderFlags = []
      Size = 100
    end
    object IbDtstTabelaNFE_DESTINATARIO_CNPJ: TIBStringField
      FieldName = 'NFE_DESTINATARIO_CNPJ'
      ProviderFlags = []
      OnGetText = IbDtstTabelaNFE_DESTINATARIO_CNPJGetText
      Size = 18
    end
    object IbDtstTabelaNFE_VALOR_TOTAL: TIBBCDField
      FieldName = 'NFE_VALOR_TOTAL'
      ProviderFlags = []
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBNFE_ENVIADA"."EMPRESA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 18
    end
    object IbDtstTabelaSERIE: TIBStringField
      FieldName = 'SERIE'
      Origin = '"TBNFE_ENVIADA"."SERIE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IbDtstTabelaNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = '"TBNFE_ENVIADA"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IbDtstTabelaMODELO: TSmallintField
      FieldName = 'MODELO'
      Origin = '"TBNFE_ENVIADA"."MODELO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IbDtstTabelaDATAEMISSAO: TDateField
      FieldName = 'DATAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."DATAEMISSAO"'
    end
    object IbDtstTabelaHORAEMISSAO: TTimeField
      FieldName = 'HORAEMISSAO'
      Origin = '"TBNFE_ENVIADA"."HORAEMISSAO"'
    end
    object IbDtstTabelaVERSAO: TSmallintField
      FieldName = 'VERSAO'
      Origin = '"TBNFE_ENVIADA"."VERSAO"'
    end
    object IbDtstTabelaRECIBO: TIBStringField
      FieldName = 'RECIBO'
      Origin = '"TBNFE_ENVIADA"."RECIBO"'
      Size = 250
    end
    object IbDtstTabelaPROTOCOLO: TIBStringField
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_ENVIADA"."PROTOCOLO"'
      Size = 250
    end
    object IbDtstTabelaCHAVE: TIBStringField
      FieldName = 'CHAVE'
      Origin = '"TBNFE_ENVIADA"."CHAVE"'
      Size = 250
    end
    object IbDtstTabelaANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
      Origin = '"TBNFE_ENVIADA"."ANOVENDA"'
    end
    object IbDtstTabelaNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
      Origin = '"TBNFE_ENVIADA"."NUMVENDA"'
    end
    object IbDtstTabelaANOCOMPRA: TSmallintField
      FieldName = 'ANOCOMPRA'
      Origin = '"TBNFE_ENVIADA"."ANOCOMPRA"'
    end
    object IbDtstTabelaNUMCOMPRA: TIntegerField
      FieldName = 'NUMCOMPRA'
      Origin = '"TBNFE_ENVIADA"."NUMCOMPRA"'
    end
    object IbDtstTabelaXML_FILENAME: TIBStringField
      FieldName = 'XML_FILENAME'
      Origin = '"TBNFE_ENVIADA"."XML_FILENAME"'
      Size = 250
    end
    object IbDtstTabelaXML_FILE: TMemoField
      FieldName = 'XML_FILE'
      Origin = '"TBNFE_ENVIADA"."XML_FILE"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 384
    Top = 208
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
end

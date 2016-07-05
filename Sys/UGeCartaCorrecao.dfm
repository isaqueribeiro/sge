inherited frmGeCartaCorrecao: TfrmGeCartaCorrecao
  Left = 445
  Top = 243
  Caption = 'Carta de Corre'#231#227'o Eletr'#244'nica (CC-e)'
  ClientHeight = 503
  ClientWidth = 863
  OldCreateOrder = True
  ExplicitWidth = 879
  ExplicitHeight = 542
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 499
    Width = 863
    ExplicitTop = 500
    ExplicitWidth = 863
  end
  inherited Bevel3: TBevel
    Top = 460
    Width = 863
    ExplicitTop = 461
    ExplicitWidth = 863
  end
  inherited pgcGuias: TPageControl
    Width = 863
    Height = 460
    OnChange = pgcGuiasChange
    ExplicitWidth = 863
    ExplicitHeight = 460
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 855
      ExplicitHeight = 431
      inherited Bevel4: TBevel
        Top = 365
        Width = 855
        ExplicitTop = 366
        ExplicitWidth = 855
      end
      inherited dbgDados: TDBGrid
        Width = 855
        Height = 365
        Columns = <
          item
            Expanded = False
            FieldName = 'CCE_NUMERO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CCE_DATA'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NotaFiscalEletronica'
            Title.Caption = 'NF-e / Destinat'#225'rio'
            Width = 500
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROTOCOLO'
            Width = 180
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 369
        Width = 855
        ExplicitTop = 369
        ExplicitWidth = 855
        object lblCartaPendente: TLabel [0]
          Left = 2
          Top = 4
          Width = 169
          Height = 13
          Caption = '* Carta de Corre'#231#227'o pendente'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 529
          Width = 322
          ExplicitLeft = 529
          ExplicitWidth = 322
          DesignSize = (
            322
            54)
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 57
            Caption = 'Protocolo:'
            ExplicitLeft = 14
            ExplicitWidth = 57
          end
          inherited edtFiltrar: TEdit
            Left = 80
            Width = 193
            ExplicitLeft = 80
            ExplicitWidth = 193
          end
          inherited btnFiltrar: TcxButton
            Left = 277
            ExplicitLeft = 277
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 855
      ExplicitHeight = 431
      inherited Bevel8: TBevel
        Top = 265
        Width = 855
        ExplicitTop = 265
        ExplicitWidth = 855
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 855
        Height = 265
        ExplicitWidth = 855
        ExplicitHeight = 265
        DesignSize = (
          855
          265)
        object lblNFe: TLabel [1]
          Left = 16
          Top = 104
          Width = 140
          Height = 13
          Caption = 'Nota Fiscal Eletr'#244'nica (NF-e):'
          FocusControl = dbNFe
        end
        object lblEmpresa: TLabel [2]
          Left = 16
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblDataHora: TLabel [3]
          Left = 168
          Top = 24
          Width = 63
          Height = 13
          Caption = 'Data/Hora:'
          FocusControl = dbDataHora
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumero: TLabel [4]
          Left = 88
          Top = 24
          Width = 29
          Height = 13
          Caption = 'CC-e:'
          FocusControl = dbNumero
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCorrecao: TLabel [5]
          Left = 16
          Top = 148
          Width = 112
          Height = 13
          Caption = 'Descri'#231#227'o da Corre'#231#227'o:'
          FocusControl = dbCorrecao
        end
        object lblProtocolo: TLabel [6]
          Left = 320
          Top = 24
          Width = 57
          Height = 13
          Caption = 'Protocolo:'
          FocusControl = dbProtocolo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'CCE_NUMERO'
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 16
          Top = 80
          Width = 513
          Height = 21
          DataField = 'CCE_EMPRESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CNPJ'
          ListField = 'RZSOC'
          ListSource = dtsEmpresa
          ParentFont = False
          TabOrder = 5
        end
        object dbDataHora: TDBEdit
          Left = 168
          Top = 40
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DataHora'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbNumero: TDBEdit
          Left = 88
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbCorrecao: TDBMemo
          Left = 16
          Top = 164
          Width = 825
          Height = 85
          Anchors = [akLeft, akTop, akRight]
          DataField = 'CCE_TEXTO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 1000
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 7
        end
        object dbProtocolo: TDBEdit
          Left = 320
          Top = 40
          Width = 209
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'PROTOCOLO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbEnviada: TDBCheckBox
          Left = 536
          Top = 40
          Width = 97
          Height = 17
          TabStop = False
          Caption = 'CC-e Enviada'
          DataField = 'CCE_ENVIADA'
          DataSource = DtSrcTabela
          ReadOnly = True
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbNFe: TJvDBComboEdit
          Left = 16
          Top = 120
          Width = 825
          Height = 21
          ButtonHint = 'Pesquisar NF-e (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NotaFiscalEletronica'
          DataSource = DtSrcTabela
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
          Anchors = [akLeft, akTop, akRight]
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 6
          OnButtonClick = dbNFeButtonClick
        end
      end
      object mmCondicaoUso: TMemo
        Left = 0
        Top = 269
        Width = 855
        Height = 162
        TabStop = False
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          
            'A Carta de Correcao e disciplinada pelo paragrafo 1o-A do art. 7' +
            'o do Convenio S/N, de 15 de dezembro de 1970 e pode ser '
          
            'utilizada para regularizacao de erro ocorrido na emissao de docu' +
            'mento fiscal, desde que o erro nao esteja relacionado com: I - a' +
            's '
          
            'variaveis que determinam o valor do imposto tais como: base de c' +
            'alculo, aliquota, diferenca de preco, quantidade, valor da '
          
            'operacao ou da prestacao; II - a correcao de dados cadastrais qu' +
            'e implique mudanca do remetente ou do destinatario; III - a data' +
            ' '
          'de emissao ou de saida.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 464
    Width = 863
    ExplicitTop = 464
    ExplicitWidth = 863
    inherited bvlTool3: TBevel
      Left = 780
      ExplicitLeft = 780
    end
    inherited bvlTool4: TBevel
      Left = 859
      ExplicitLeft = 859
    end
    object Bevel5: TBevel [5]
      Left = 846
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnFechar: TcxButton
      Left = 784
      TabOrder = 8
      ExplicitLeft = 784
    end
    inherited btbtnSelecionar: TcxButton
      Left = 660
      TabOrder = 7
      ExplicitLeft = 660
    end
    object BtnEnviarCCe: TcxButton
      Tag = 6
      Left = 540
      Top = 0
      Width = 120
      Height = 35
      Hint = 
        'Antes de enviar a Carta de Corre'#231#227'o Eletr'#244'nica, favor verifique ' +
        'se o Certificado'#13#10'Digital atual corresponde a Empresa Emitente d' +
        'a carta.'
      Align = alRight
      Caption = 'Enviar CC-e'
      OptionsImage.ImageIndex = 37
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = BtnEnviarCCeClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterScroll = IbDtstTabelaAfterScroll
    BeforeDelete = IbDtstTabelaBeforeDelete
    BeforeEdit = IbDtstTabelaBeforeEdit
    OnCalcFields = IbDtstTabelaCalcFields
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.cce_numero'
      '  , c.cce_empresa'
      '  , c.cce_data'
      '  , c.cce_hora'
      '  , c.cce_enviada'
      '  , c.cce_texto'
      '  , c.nfe_serie'
      '  , c.nfe_numero'
      '  , c.nfe_modelo'
      '  , c.numero'
      '  , c.protocolo'
      '  , c.xml'
      
        '  , coalesce(lpad(c.nfe_numero, 7, '#39'0'#39') || '#39'-'#39' || c.nfe_serie, '#39 +
        #39') as nfe_destinatario'
      '  , coalesce(cl.nome, fn.nomeforn)  as nfe_destinatario_razao'
      '  , coalesce(cl.cnpj, fn.cnpj) as nfe_destinatario_cnpj'
      'from TBNFE_CARTA_CORRECAO c'
      
        '  left join TBNFE_ENVIADA nf on (nf.empresa = c.cce_empresa and ' +
        'nf.serie = c.nfe_serie and nf.numero = c.nfe_numero and nf.model' +
        'o = c.nfe_modelo)'
      ''
      
        '  left join TBVENDAS vn on (vn.ano = nf.anovenda and vn.codcontr' +
        'ol = nf.numvenda)'
      '  left join TBCLIENTE cl on (cl.codigo = vn.codcliente)'
      ''
      
        '  left join TBCOMPRAS cp on (cp.ano = nf.anocompra and cp.codcon' +
        'trol = nf.numcompra)'
      '  left join TBFORNECEDOR fn on (fn.codforn = cp.codforn)'
      ''
      '')
    GeneratorField.Field = 'CCE_NUMERO'
    GeneratorField.Generator = 'GEN_CARTA_CORRECAO'
    GeneratorField.ApplyEvent = gamOnNewRecord
    Left = 600
    object IbDtstTabelaCCE_NUMERO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CCE_NUMERO'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '00000'
    end
    object IbDtstTabelaCCE_EMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'CCE_EMPRESA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object IbDtstTabelaCCE_DATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'CCE_DATA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_DATA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaCCE_HORA: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'CCE_HORA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_HORA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object IbDtstTabelaCCE_ENVIADA: TSmallintField
      DisplayLabel = 'Enviada?'
      FieldName = 'CCE_ENVIADA'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_ENVIADA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaCCE_TEXTO: TMemoField
      DisplayLabel = 'Texto de corre'#231#227'o'
      FieldName = 'CCE_TEXTO'
      Origin = '"TBNFE_CARTA_CORRECAO"."CCE_TEXTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaNFE_SERIE: TIBStringField
      DisplayLabel = 'NF-e: S'#233'rie'
      FieldName = 'NFE_SERIE'
      Origin = '"TBNFE_CARTA_CORRECAO"."NFE_SERIE"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 3
    end
    object IbDtstTabelaNFE_NUMERO: TIntegerField
      DisplayLabel = 'NF-e: N'#250'mero'
      FieldName = 'NFE_NUMERO'
      Origin = '"TBNFE_CARTA_CORRECAO"."NFE_NUMERO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaNFE_MODELO: TSmallintField
      DisplayLabel = 'NF-e: Modelo'
      FieldName = 'NFE_MODELO'
      Origin = '"TBNFE_CARTA_CORRECAO"."NFE_MODELO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero CC-e'
      FieldName = 'NUMERO'
      Origin = '"TBNFE_CARTA_CORRECAO"."NUMERO"'
      ProviderFlags = []
    end
    object IbDtstTabelaPROTOCOLO: TIBStringField
      DisplayLabel = 'Protocolo CC-e'
      FieldName = 'PROTOCOLO'
      Origin = '"TBNFE_CARTA_CORRECAO"."PROTOCOLO"'
      ProviderFlags = []
      Size = 250
    end
    object IbDtstTabelaXML: TMemoField
      DisplayLabel = 'XML CC-e'
      FieldName = 'XML'
      Origin = '"TBNFE_CARTA_CORRECAO"."XML"'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaNFE_DESTINATARIO: TIBStringField
      FieldName = 'NFE_DESTINATARIO'
      ProviderFlags = []
      Size = 11
    end
    object IbDtstTabelaNFE_DESTINATARIO_RAZAO: TIBStringField
      FieldName = 'NFE_DESTINATARIO_RAZAO'
      ProviderFlags = []
      Size = 114
    end
    object IbDtstTabelaNFE_DESTINATARIO_CNPJ: TIBStringField
      FieldName = 'NFE_DESTINATARIO_CNPJ'
      ProviderFlags = []
      Size = 18
    end
    object IbDtstTabelaDataHora: TDateTimeField
      FieldKind = fkCalculated
      FieldName = 'DataHora'
      ProviderFlags = []
      DisplayFormat = 'dd/mm/yyyy hh:mm'
      Calculated = True
    end
    object IbDtstTabelaNotaFiscalEletronica: TStringField
      FieldKind = fkCalculated
      FieldName = 'NotaFiscalEletronica'
      ProviderFlags = []
      Size = 250
      Calculated = True
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 664
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  CCE_NUMERO,'
      '  CCE_EMPRESA,'
      '  CCE_DATA,'
      '  CCE_HORA,'
      '  CCE_ENVIADA,'
      '  CCE_TEXTO,'
      '  NFE_SERIE,'
      '  NFE_NUMERO,'
      '  NFE_MODELO,'
      '  NUMERO,'
      '  PROTOCOLO,'
      '  XML'
      'from TBNFE_CARTA_CORRECAO '
      'where'
      '  CCE_NUMERO = :CCE_NUMERO')
    ModifySQL.Strings = (
      'update TBNFE_CARTA_CORRECAO'
      'set'
      '  CCE_DATA = :CCE_DATA,'
      '  CCE_EMPRESA = :CCE_EMPRESA,'
      '  CCE_ENVIADA = :CCE_ENVIADA,'
      '  CCE_HORA = :CCE_HORA,'
      '  CCE_NUMERO = :CCE_NUMERO,'
      '  CCE_TEXTO = :CCE_TEXTO,'
      '  NFE_MODELO = :NFE_MODELO,'
      '  NFE_NUMERO = :NFE_NUMERO,'
      '  NFE_SERIE = :NFE_SERIE,'
      '  NUMERO = :NUMERO,'
      '  PROTOCOLO = :PROTOCOLO,'
      '  XML = :XML'
      'where'
      '  CCE_NUMERO = :OLD_CCE_NUMERO')
    InsertSQL.Strings = (
      'insert into TBNFE_CARTA_CORRECAO'
      
        '  (CCE_DATA, CCE_EMPRESA, CCE_ENVIADA, CCE_HORA, CCE_NUMERO, CCE' +
        '_TEXTO, '
      '   NFE_MODELO, NFE_NUMERO, NFE_SERIE, NUMERO, PROTOCOLO, XML)'
      'values'
      
        '  (:CCE_DATA, :CCE_EMPRESA, :CCE_ENVIADA, :CCE_HORA, :CCE_NUMERO' +
        ', :CCE_TEXTO, '
      
        '   :NFE_MODELO, :NFE_NUMERO, :NFE_SERIE, :NUMERO, :PROTOCOLO, :X' +
        'ML)')
    DeleteSQL.Strings = (
      'delete from TBNFE_CARTA_CORRECAO'
      'where'
      '  CCE_NUMERO = :OLD_CCE_NUMERO')
    Left = 632
  end
  inherited ImgList: TImageList
    Left = 568
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    UniDirectional = False
    Left = 632
    Top = 64
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 664
    Top = 64
  end
end

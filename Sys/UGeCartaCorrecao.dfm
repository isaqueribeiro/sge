inherited frmGeCartaCorrecao: TfrmGeCartaCorrecao
  Left = 525
  Top = 363
  Width = 879
  Height = 542
  ActiveControl = dbCodigo
  Caption = 'Carta de Corre'#231#227'o Eletr'#244'nica (CC-e)'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 500
    Width = 863
  end
  inherited Bevel3: TBevel
    Top = 461
    Width = 863
  end
  inherited tlbBotoes: TToolBar
    Top = 465
    Width = 863
    object BtnEnviarCCe: TBitBtn [12]
      Tag = 6
      Left = 602
      Top = 2
      Width = 120
      Height = 31
      Hint = 
        'Antes de enviar a Carta de Corre'#231#227'o Eletr'#244'nica, favor verifique ' +
        'se o Certificado'#13#10'Digital atual corresponde a Empresa Emitente d' +
        'a carta.'
      Caption = 'Enviar CC-e'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = BtnEnviarCCeClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A090604830
        604830604830604830604830604830604830604830604830604830604830FFFF
        FFFFFFFFFFFFFFFFFFFF8F9EAD33435733435733435733435733435733435733
        4357334357334357334357334357FFFFFFFFFFFFFFFFFFFFFFFFC0A890FFF8F0
        FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A890604830FFFF
        FFFFFFFFFFFFFFFFFFFF95A3B2F4F6F7E8ECEFE1E6EAD6DDE3C5CED6BBC5CFAE
        BAC6A9B5C19DABB999A7B5334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
        C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B090604830FFFF
        FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA9AA8B692A1B0E1E6EA8E9DAC8998A889
        98A88998A88998A89DABB9334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
        FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0604830FFFF
        FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFAF9FAFAF4F6F7E8ECEFE1E6EAD6DDE3C5
        CED6BBC5CFAEBAC6A9B5C1334357FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
        B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A0604830FFFF
        FFFFFFFFFFFFFFFFFFFF9AA8B6F9FAFA98A6B492A1B0F4F6F78E9DAC8998A889
        98A88998A88998A8AEBAC6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0604830FFFF
        FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7E8ECEFE1
        E6EAD6DDE3C5CED6BBC5CF334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C0604830FFFF
        FFFFFFFFFFFFFFFFFFFFA0ADBAF9FAFAF9FAFAF9FAFAF9FAFAF9FAFAF4F6F7B9
        C4CE4F6175D6DDE3C5CED6334357FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFF
        E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A0604830FFFF
        FFFFFFFFA0B39A408050A0ADBAFFFFFFE4E9ED66778ADAE0E5F9FAFABFC9D250
        627698A6B428374A92A1B0334357FFFFFFFFFFFF9BA9B7586A7ED0B0A0FFFFFF
        90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
        3070747D40784050A860A1AEBBFFFFFF99A7B5C1CBD4506276ADB9C5506276B3
        BEC9506276ADB9C51A27382331441A27386576894E607477889AD0B8A0FFFFFF
        E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
        B020507050886050B060A6B3C0FFFFFFE4E9ED99A7B5D2D9E0506276C1CBD450
        6276C3CCD54F6175A2AFBC8C9BAB77889A4354686475887D8D9ED0B8A0D0B8A0
        D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
        E020A0D060987050B870A6B3C0A6B3C0A6B3C0A0ADBA99A7B5D2D9E0506276D2
        D9E04B5C70C3CCD5BCC6D0B4BFCAA0ADBA909FAE7485978696A6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF90A8B080E0F040587080E0F070D8F060D0F050C8F040C0
        F030B8F070A88060C080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2D9E04B
        5C70D2D9E0CBD3DBC3CCD5BCC6D0B4BFCAADB9C58595A592A1B0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF90A8B080E0F080E0F080E0F070D8F060D0F060B0
        D0808890B0C0A090D0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99A7B5D2
        D9E0D2D9E0D2D9E0CBD3DBC3CCD5A3B0BD78899BA7B4C0AEBAC6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B090A0B090A0A08098A08090A08088
        90B9B9BDA0B8A0B0C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF99
        A7B593A2B18F9EAD8797A78292A378899BAEBAC6A1AEBBA7B4C0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object Bevel5: TBevel [13]
      Left = 722
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 726
    end
    inherited bvlTool4: TBevel
      Left = 846
    end
  end
  inherited pgcGuias: TPageControl
    Width = 863
    Height = 461
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 366
        Width = 855
      end
      inherited dbgDados: TDBGrid
        Width = 855
        Height = 366
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
        Top = 370
        Width = 855
        object lblCartaPendente: TLabel [0]
          Left = 2
          Top = 4
          Width = 191
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
          DesignSize = (
            322
            54)
          inherited lbltFiltrar: TLabel
            Left = 14
            Width = 57
            Caption = 'Protocolo:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 277
          end
          inherited edtFiltrar: TEdit
            Left = 80
            Width = 193
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 265
        Width = 855
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 855
        Height = 265
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
        object dbNFe: TRxDBComboEdit
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
      end
      object mmCondicaoUso: TMemo
        Left = 0
        Top = 269
        Width = 855
        Height = 163
        TabStop = False
        Align = alClient
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Lines.Strings = (
          ''
          'CONDI'#199#213'ES DE USO:'
          '------------------------------------'
          ''
          
            'A Carta de Corre'#231#227'o pode ser utilizada para regulariza'#231#227'o de err' +
            'o ocorrido na emiss'#227'o de documento fiscal, desde que o erro '
          'n'#227'o esteja relacionado com:'
          ''
          
            'I '#8211' as vari'#225'veis que determinam o valor do imposto tais como: ba' +
            'se de c'#225'lculo, al'#237'quota, diferen'#231'a de pre'#231'o, quantidade, valor '
          'da opera'#231#227'o ou da presta'#231#227'o;'
          
            'II '#8211' a corre'#231#227'o de dados cadastrais que implique mudan'#231'a do reme' +
            'tente ou do destinat'#225'rio;'
          'III '#8211' a data de emiss'#227'o ou de sa'#237'da.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
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
    TableName = 'TBEMPRESA'
    Left = 632
    Top = 64
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 664
    Top = 64
  end
end

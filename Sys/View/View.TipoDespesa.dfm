inherited ViewTipoDespesa: TViewTipoDespesa
  Left = 390
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Tipos de Despesas'
  ClientHeight = 459
  ClientWidth = 741
  OldCreateOrder = True
  ExplicitWidth = 757
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 455
    Width = 741
    ExplicitTop = 405
    ExplicitWidth = 741
  end
  inherited Bevel3: TBevel
    Top = 416
    Width = 741
    ExplicitTop = 366
    ExplicitWidth = 741
  end
  inherited pgcGuias: TPageControl
    Width = 741
    Height = 416
    ActivePage = tbsCadastro
    ExplicitWidth = 741
    ExplicitHeight = 416
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 733
      ExplicitHeight = 387
      inherited Bevel4: TBevel
        Top = 321
        Width = 733
        ExplicitTop = 271
        ExplicitWidth = 733
      end
      inherited dbgDados: TDBGrid
        Width = 733
        Height = 321
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPODESP'
            Title.Caption = 'Descri'#231#227'o '
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_RESUMIDA'
            Title.Caption = 'Plano de Contas'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_PARTICULAR_DESC'
            Title.Alignment = taCenter
            Title.Caption = 'Particular'
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 325
        Width = 733
        ExplicitTop = 325
        ExplicitWidth = 733
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 186
          Height = 13
          Caption = '* Tipos de Despesas desativados'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 346
          ExplicitLeft = 383
          ExplicitWidth = 346
          inherited lbltFiltrar: TLabel
            Width = 78
            Caption = 'Tipo Despesa:'
            ExplicitWidth = 78
          end
          inherited edtFiltrar: TEdit
            Left = 101
            Width = 198
            ExplicitLeft = 101
            ExplicitWidth = 198
          end
          inherited btnFiltrar: TcxButton
            Left = 305
            ExplicitLeft = 305
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitWidth = 733
      ExplicitHeight = 387
      inherited Bevel8: TBevel
        Top = 166
        Width = 733
        ExplicitLeft = 3
        ExplicitTop = 284
        ExplicitWidth = 733
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 733
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      object Bevel6: TBevel [2]
        Left = 0
        Top = 249
        Width = 733
        Height = 4
        Align = alTop
        Shape = bsSpacer
        ExplicitLeft = -3
        ExplicitTop = 294
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 733
        Height = 81
        ExplicitWidth = 733
        ExplicitHeight = 81
        object lblDescricao: TLabel [1]
          Left = 88
          Top = 24
          Width = 50
          Height = 13
          Caption = 'Descri'#231#227'o:'
          FocusControl = dbDescricao
        end
        inherited dbCodigo: TDBEdit
          DataField = 'COD'
        end
        object dbDescricao: TDBEdit
          Left = 87
          Top = 43
          Width = 625
          Height = 21
          CharCase = ecUpperCase
          DataField = 'TIPODESP'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GrpBxDadosClassificacao: TGroupBox
        Left = 0
        Top = 85
        Width = 733
        Height = 81
        Align = alTop
        Caption = 'Classifica'#231#227'o Cont'#225'bil'
        TabOrder = 1
        object lblPlanoContas: TLabel
          Left = 223
          Top = 25
          Width = 155
          Height = 13
          Caption = 'Plano de Contas de lan'#231'amento:'
          Enabled = False
          FocusControl = dbPlanoContas
        end
        object lblClassificacao: TLabel
          Left = 16
          Top = 25
          Width = 122
          Height = 13
          Caption = 'Classifica'#231#227'o / Categoria:'
          FocusControl = dbClassificacao
        end
        object dbPlanoContas: TJvDBComboEdit
          Left = 223
          Top = 41
          Width = 484
          Height = 21
          ButtonHint = 'Pesquisar Plano de Contas (Ctrl+P)'#13#10'Limpar Campo (Ctrl+L)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'DESCRICAO_RESUMIDA'
          DataSource = DtSrcTabela
          Enabled = False
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
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
        end
        object dbClassificacao: TDBLookupComboBox
          Left = 16
          Top = 41
          Width = 201
          Height = 21
          DataField = 'CLASSIFICACAO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TPE_CODIGO'
          ListField = 'TPE_DESCRICAO'
          ListSource = DtsClassificacao
          ParentFont = False
          TabOrder = 0
        end
      end
      object GrpBxParametros: TGroupBox
        Left = 0
        Top = 170
        Width = 733
        Height = 79
        Align = alTop
        Caption = 'Par'#226'metros'
        TabOrder = 2
        object dbTipoParticular: TDBCheckBox
          Left = 16
          Top = 26
          Width = 97
          Height = 17
          Caption = 'Tipo Particular'
          DataField = 'TIPO_PARTICULAR'
          DataSource = DtSrcTabela
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbAtivo: TDBCheckBox
          Left = 16
          Top = 49
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object GrpBxPlanoConta: TGroupBox
        Left = 0
        Top = 253
        Width = 733
        Height = 134
        Align = alClient
        Caption = 'Planos de Contas'
        TabOrder = 3
        object PnlPlanoContaBtn: TPanel
          AlignWithMargins = True
          Left = 5
          Top = 18
          Width = 33
          Height = 70
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          ExplicitHeight = 111
          object Bevel7: TBevel
            Left = 0
            Top = 33
            Width = 33
            Height = 4
            Align = alTop
            Shape = bsSpacer
            ExplicitTop = 366
            ExplicitWidth = 741
          end
          object BtnPlanoAdicionar: TcxButton
            Tag = 1
            Left = 0
            Top = 0
            Width = 33
            Height = 33
            Hint = 'Incluir Plano de Contas'#13#10'(Ctrl + Ins)'
            Align = alTop
            Enabled = False
            OptionsImage.ImageIndex = 6
            OptionsImage.Images = DMRecursos.ImgBotoes16x16
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = BtnPlanoAdicionarClick
          end
          object BtnPlanoExcluir: TcxButton
            Tag = 1
            Left = 0
            Top = 37
            Width = 33
            Height = 33
            Hint = 'Excluir Plano de Contas'#13#10'(Ctrl + Delete)'
            Align = alTop
            Enabled = False
            OptionsImage.ImageIndex = 4
            OptionsImage.Images = DMRecursos.ImgBotoes16x16
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BtnPlanoExcluirClick
          end
        end
        object dbgPlanoContas: TDBGrid
          AlignWithMargins = True
          Left = 44
          Top = 18
          Width = 684
          Height = 70
          Hint = 
            'Dica:'#13#10#13#10'Pressione a tecla "Espa'#231'o" para marcar o desmarcar o Pl' +
            'ano de Contas'#13#10'selecionado. E atente para o fato de que o plano ' +
            'de contas marcado est'#225#13#10'relacionado a empresa em quest'#227'o.'
          Align = alClient
          BorderStyle = bsNone
          DataSource = dtsPlanoConta
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = dbgDadosDrawColumnCell
          OnDblClick = dbgPlanoContasDblClick
          OnKeyDown = dbgPlanoContasKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'SELECIONAR'
              Title.Alignment = taCenter
              Title.Caption = 'S'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANO_CONTA'
              Title.Caption = 'Plano de Contas'
              Width = 370
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA_RAZAO'
              Title.Caption = 'Empresa'
              Width = 250
              Visible = True
            end>
        end
        object pnlDicas: TPanel
          AlignWithMargins = True
          Left = 5
          Top = 94
          Width = 723
          Height = 35
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object lblDicasTitulo: TLabel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 33
            Height = 13
            Align = alLeft
            Caption = 'Dica : '
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
          end
          object lblDicasTexto: TLabel
            AlignWithMargins = True
            Left = 42
            Top = 3
            Width = 649
            Height = 26
            Align = alClient
            Caption = 
              'Pressione a tecla "Espa'#231'o" para marcar ou desmarcar o Plano de C' +
              'ontas selecionado. E atente para o fato de que o plano de contas' +
              ' marcado est'#225' relacionado a empresa em quest'#227'o.'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = True
            WordWrap = True
          end
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 420
    Width = 741
    ExplicitTop = 420
    ExplicitWidth = 741
    inherited bvlTool3: TBevel
      Left = 658
      ExplicitLeft = 658
    end
    inherited bvlTool4: TBevel
      Left = 737
      ExplicitLeft = 737
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 662
      ExplicitLeft = 662
    end
    inherited btbtnSelecionar: TcxButton
      Left = 538
      ExplicitLeft = 538
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 544
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 440
    Top = 0
  end
  object DtsClassificacao: TDataSource
    Left = 544
    Top = 48
  end
  object dtsPlanoConta: TDataSource
    AutoEdit = False
    Left = 544
    Top = 96
  end
  object imgGrid: TImageList
    DrawingStyle = dsTransparent
    Left = 563
    Top = 336
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000F1F1F1FFDFDFDFFFDBDBDBFFDADA
      DAFFDCDCDCFFDEDEDEFFDDDDDDFFDFDFDFFFE0E0E0FFDEDEDEFFDFDFDFFFDEDE
      DEFFF2F2F2FFFFFFFFFFFDFDFDFFFFFFFFFFF1F1F1FFDCDCDCFFE2E2E2FFDFDF
      DFFFDEDEDEFFE1E1E1FFDEDEDEFFE2E2E2FFDDDDDDFFE0E0E0FFDFDFDFFFE0E0
      E0FFF2F2F2FFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000121212FF000000FF030303FF0000
      00FF020202FF020202FF000000FF010101FF000000FF020202FF010101FF0101
      01FF282828FFFAFAFAFFFFFFFFFFFFFFFFFF121212FF000000FF000000FF0404
      04FF000000FF000000FF000000FF000000FF010101FF010101FF000000FF0000
      00FF2D2D2DFFFFFFFFFFFEFEFEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000010101FF363636FF888888FF8888
      88FF868686FF858585FF868686FF8A8A8AFF898989FF7E7E7EFF828282FF2828
      28FF121212FFFFFFFFFFFEFEFEFFFFFFFFFF020202FF383838FF888888FF8484
      84FF858585FF878787FF888888FF868686FF858585FF858585FF858585FF2A2A
      2AFF1C1C1CFFFBFBFBFFFDFDFDFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6C6C6CFFFCFCFCFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFF5252
      52FF121212FFFFFFFFFFFFFFFFFFFEFEFEFF000000FF686868FFFFFFFFFFFEFE
      FEFFFFFFFFFFFCFCFCFFFFFFFFFFFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFF4D4D
      4DFF181818FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF676767FFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFEFEFEFFFCFCFCFF5050
      50FF151515FFFFFFFFFFFDFDFDFFFFFFFFFF020202FF676767FFFDFDFDFFFFFF
      FFFFFFFFFFFFFFFFFFFFE9E9E9FFF5F5F5FFFFFFFFFFFFFFFFFFFEFEFEFF5050
      50FF181818FFFAFAFAFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000020202FF686868FFFFFFFFFFFFFF
      FFFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFF4F4F
      4FFF131313FFFEFEFEFFFFFFFFFFFFFFFFFF000000FF6A6A6AFFFFFFFFFFFEFE
      FEFFFCFCFCFFBCBCBCFF0B0B0BFF141414FFD0D0D0FFFCFCFCFFFCFCFCFF4D4D
      4DFF1E1E1EFFFFFFFFFFFDFDFDFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF686868FFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFEFEFEFFFEFEFEFFFFFFFFFF5555
      55FF151515FFFFFFFFFFFEFEFEFFFEFEFEFF000000FF6B6B6BFFFBFBFBFFFFFF
      FFFFBCBCBCFF0A0A0AFF000000FF000000FF141414FFD1D1D1FFFFFFFFFF6363
      63FF151515FFFFFFFFFFFBFBFBFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF686868FFFFFFFFFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFCFCFCFF4D4D
      4DFF1B1B1BFFFCFCFCFFFFFFFFFFFFFFFFFF000000FF686868FFFFFFFFFFBDBD
      BDFF080808FF000000FF090909FF040404FF010101FF131313FFCFCFCFFFF3F3
      F3FF595959FFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6A6A6AFFFEFEFEFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFFFFFFFDFDFDFF5151
      51FF1B1B1BFFFFFFFFFFFEFEFEFFFEFEFEFF000000FF696969FFFDFDFDFF3333
      33FF000000FF0A0A0AFFBBBBBBFFA2A2A2FF010101FF030303FF141414FFD2D2
      D2FFFAFAFAFFFDFDFDFFFFFFFFFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF656565FFFFFFFFFFFEFE
      FEFFFDFDFDFFFFFFFFFFFDFDFDFFFCFCFCFFFFFFFFFFFFFFFFFFFEFEFEFF4C4C
      4CFF1E1E1EFFFDFDFDFFFDFDFDFFFFFFFFFF000000FF6A6A6AFFFFFFFFFF9595
      95FF2E2E2EFFBCBCBCFFFDFDFDFFFFFFFFFFA4A4A4FF030303FF000000FF0F0F
      0FFFD0D0D0FFFFFFFFFFFDFDFDFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF6C6C6CFFFDFDFDFFFEFE
      FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFF4D4D
      4DFF1D1D1DFFFEFEFEFFFFFFFFFFFCFCFCFF000000FF666666FFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFBFBFBFFA4A4A4FF070707FF0000
      00FF141414FFD3D3D3FFFCFCFCFFFEFEFEFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF666666FFFEFEFEFFFFFF
      FFFFFBFBFBFFFFFFFFFFFEFEFEFFFDFDFDFFFFFFFFFFFBFBFBFFFFFFFFFF4C4C
      4CFF1D1D1DFFFEFEFEFFFFFFFFFFFFFFFFFF000000FF6B6B6BFFFFFFFFFFFBFB
      FBFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFFFFFFFF9D9D9DFF0404
      04FF010101FF141414FFCECECEFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF121212FF2C2C2CFF2A2A
      2AFF303030FF303030FF313131FF303030FF2F2F2FFF353535FF353535FF1010
      10FF222222FFFFFFFFFFFEFEFEFFFFFFFFFF000000FF131313FF2B2B2BFF3333
      33FF333333FF2D2D2DFF333333FF2E2E2EFF313131FF7D7D7DFFFFFFFFFFA2A2
      A2FF080808FF020202FF121212FFD0D0D0FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005E5E5EFF3C3C3CFF363636FF3838
      38FF373737FF373737FF343434FF383838FF353535FF353535FF333333FF2F2F
      2FFF6F6F6FFFFDFDFDFFFFFFFFFFFEFEFEFF5A5A5AFF383838FF3A3A3AFF3A3A
      3AFF333333FF393939FF383838FF383838FF373737FF373737FFA9A9A9FFFFFF
      FFFF9A9A9AFF040404FF000000FF1D1D1DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FDFDFDFFFEFEFEFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFCFCFCFFFFFFFFFFFFFFFFFFF9F9F9FFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFFFFFFFFFDFDFDFFFFFFFFFFFEFEFEFFFFFFFFFFFFFF
      FFFFFFFFFFFFA2A2A2FF080808FF383838FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFAFAFAFFFFFFFFFFFFFF
      FFFFFEFEFEFFFFFFFFFFFEFEFEFFFEFEFEFFFFFFFFFFFCFCFCFFFFFFFFFFFFFF
      FFFFFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFFFDFDFDFFFFFFFFFFFFFFFFFFFDFD
      FDFFFFFFFFFFFFFFFFFFFDFDFDFFFEFEFEFFFFFFFFFFFFFFFFFFFEFEFEFFFEFE
      FEFFFFFFFFFFFDFDFDFFEEEEEEFFFAFAFAFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end

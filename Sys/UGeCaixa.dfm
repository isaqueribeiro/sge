inherited frmGeCaixa: TfrmGeCaixa
  Left = 557
  Top = 195
  Width = 966
  Height = 542
  ActiveControl = dbCodigo
  Caption = 'Gerenciar Caixas'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 500
    Width = 950
  end
  inherited Bevel3: TBevel
    Top = 461
    Width = 950
  end
  inherited tlbBotoes: TToolBar
    Top = 465
    Width = 950
    inherited btbtnLista: TBitBtn
      PopupMenu = ppImprimir
      Visible = True
    end
    inherited bvlToolExpandir: TBevel
      Width = 12
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 553
    end
    inherited bvlTool4: TBevel
      Left = 673
    end
    object btbtnEncerrar: TBitBtn
      Tag = 11
      Left = 677
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Encerrar Caixa'
      Caption = 'Encerrar Caixa'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btbtnEncerrarClick
      Glyph.Data = {
        36060000424D3606000000000000360000002800000020000000100000000100
        18000000000000060000C40E0000C40E0000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF008595A58595A58595A58595A58595A58595A58595A585
        95A58595A58595A58595A58595A58595A58595A58595A58595A500FF0064615F
        47464526242436343339373646464600FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF008595A54E607435455918243524334627364936465A85
        95A58595A58595A58595A58595A58595A58595A58595A58595A5797978636161
        E7CCBEF9CAB0D4AE993C3A393A383800FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0067788B4F6175C0CAD3BDC7D19EACBA2A394C29384B85
        95A58595A58595A58595A58595A58595A58595A58595A58595A57F7C79D1CBC7
        FFF3ECFEE4D5FCD0B9C4A4912F2F2E59775C506853475A4940514238473A303D
        3129342A222C231C251D6A7B8EC0CAD3EFF2F4DCE2E7C5CED692A1B0202E4059
        6B7F4C5E72415266394A5E31415528374A212F411B28391521319F9C9AFBF9F7
        FFFAF7262423262220F7C7AC23212160A3625593554A8149457A484173413C6C
        3C3765383761391C251D8C9BABF6F8F9F7F9FA172334152131B9C4CE15213176
        879968798C57697D5365794C5E7247586C4152663F5064152131989797F3F3F1
        FFFDFB3D3B3AFFF5EFC5B9AD59555368AA6B65A86961A2645A965E558C584D82
        4F49784B39633B222C238797A7EFF2F4FBFCFC2B3A4DF1F4F6AAB6C24354687F
        8FA07D8D9E77889A6D7E916576895A6C805365794152661B2839746E6B929191
        F1F0F0F2EEEBDDD6D25B5E5A7FAE8270B37471B7766EB27267A86A619E645992
        5B4E84513D6C3D29342A5B6D818191A2EDF0F2E9EDF0CDD5DC4B5C708C9BAB89
        98A88C9BAB8797A77E8E9F7485976A7B8E5C6E8247586C212F4100FF0075706D
        9797978B8A8A7F7E7D709A7595CF9B7CBF8178BB7B74BA7A6FB47569AD6F62A1
        65578E58427342303D318595A55D6F838797A77A8A9C6C7D907A8A9CACB8C496
        A4B391A0AF8F9EAD8A99A98292A376879966778A4C5E7228374A00FF0000FF00
        00FF00595D5900FF0075AB7C9BD2A085C78A7EC3857BBF8176BD7C73B7776AAE
        6E5E9A60467C4638473A8595A58595A58595A54A5B6F8595A58696A6B0BCC7A0
        ADBA9AA8B696A4B392A1B08D9CAC8393A470819353657931415500FF0000FF00
        00FF00787978787878699E73A3D5A98ECA9485C88C80C5867DC08276BC7D70B5
        7465A5684D854C4051428595A58595A58595A567788B67788B7B8B9CB7C2CCA6
        B3C0A1AEBB9CAAB897A5B492A1B08A99A97B8B9C5B6D81394A5E00FF0000FF00
        00FF001C201C00FF0071A77CABDAB06194655F94625F9863629E6867A36C6AA7
        6E6BAA704F8E52475A498595A58595A58595A5131E2E8595A58393A4BEC8D16F
        80926E7F917081937687997B8B9C7F8FA08191A263748741526600FF0000FF00
        00FF0078797880808079AF85B3DDB85B8A5E7FB68488BE8E94C79AA1CFA5A6D5
        AB67A56D5795574E62508595A58595A58595A567788B6F80928D9CACC4CDD666
        778A91A0AF9BA9B7A6B3C0B2BDC8B8C3CD7D8D9E6A7B8E495A6E00FF0000FF00
        00FF0020252000FF007FB68DB9E1BF59865C73A87779AE7D85B9888FC49399CA
        9F65A1685A9B595469568595A58595A58595A51622328595A595A3B2CAD2DA63
        74878393A48A99A996A4B3A2AFBCABB7C378899B6E7F914E607400FF0000FF00
        00FF0071727180808085BC93BFE3C55E896157855A58865B5B8D5E5E93616198
        64639F675EA461586E5A8595A58595A58595A56071846F80929BA9B7CDD5DC67
        788B61728562738668798C6D7E9171829476879976879953657900FF0000FF00
        00FF0020252000FF0089C198C1E5C6C0E4C6BBE2C0B7DFBCAEDAB3A1D3A68FC7
        947FBD847DB980586E5A8595A58595A58595A51622328595A5A1AEBBCFD7DECE
        D6DDCBD3DBC6CFD7BFC9D2B4BFCAA4B1BE96A4B392A1B053657900FF0000FF00
        00FF0010151080808089C19888BF9686BD9283BA8E81B78A7EB4857BB08078AD
        7B76AA7773A77371A56F8595A58595A58595A50A121E6F8092A1AEBB9EACBA9B
        A9B798A6B495A3B2909FAE8C9BAB8998A88494A58191A27E8E9F}
      NumGlyphs = 2
    end
    object Bevel6: TBevel
      Left = 797
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
    end
    object btbtnCancelarCaixa: TBitBtn
      Tag = 12
      Left = 801
      Top = 2
      Width = 120
      Height = 31
      Hint = 'Cancelar Caixa'
      Caption = 'Cancelar Caixa'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      Visible = False
      OnClick = btbtnCancelarCaixaClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000C40E0000C40E00000001000000010000000000000910
        1B0010101000604830002E3E52003343570036475B0050585000755E4A007760
        4C004051650043546800495A6E004B5C70004C5E72004D5F7300516377007070
        700080605000806850008070600000FF00008980770095827300998377003038
        90000010B0005B6D81005C6E82005F708400637487006475880068798C006D7E
        91006E7F91006070B0000018C0000D2ADE000020F0000028F0000028FF001038
        FF002040FF002B50FC003050FF004050D0006078D0004050E0004058F0004060
        FF004068FF005070FF005078FF006078E0006078FF006F809200708193007182
        9400738496007B8B9C005090B0005098B0007F8FA00050A0B00060A8B0007088
        D00070B0C0007090E0006080FF006385FC007088FF0060A8E00060C0D00070C8
        E00070D0E000868181008088800090909000A0989000B0A090008090A1008292
        A3008494A5008595A5008696A6008797A7008B9AAA008C9BAB008E9DAC0091A0
        AF0092A1B00093A2B10095A3B20096A4B3009AA8B6009BA9B700A0A0A000B0A0
        A000ACA1BA00A0ADBA00A1AEBB00A2AFBC00A3B0BD00A4B1BE00A5B2BF00C0A8
        9000C0A8A000C8AEA400D0B0A000D0B8B000D0C0B000D6C7BA00E0C0B00080B0
        C00090B8C000B1ACC200A6B3C000A7B4C000A9B5C100AAB6C200ACB8C400ADB9
        C500B2BDC800B3BEC900A1A0D200B2B3D600819AF700829BF8008098FF009098
        F00090A0F000A9B5F000C3BFDA00B7C2CC00B9C4CE00BBC5CF00BCC6D000BDC7
        D100BFC9D200BCC2EC00B0C8FF0090E0F000C4C2C300D0C8C000C4CDD600CBD3
        DB00CCD4DB00CDD5DC00CFD7DE00D0D8D000CECCE600D8D2E200D0D8E000D2D9
        E000D4DBE100D5DCE200D3D4ED00C0C8F000C0D0FF00D0D8FF00DAE0E500DCE2
        E700D0E0FF00E0E0E000E1E6EA00E2E7EB00F0E8E000EDF0F200F0F0F000F1F4
        F600F4F6F700FFF8F000F0F0FF00F7F9FA00F0F8FF00F9FAFA00FFF8FF00FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000151515151515
        110700151515151515155353535353531D0B00535353535353531515154F0818
        60B13C02160803031515535353580C3859B15101210C050553531515156BB1A6
        60724A3D024E4F03151553535363B1A459768A54015458055353157C2562B1B1
        A33F47483D024D09151553650D5FB1B1A05766795401500D53531528262DB1B1
        B12F1A8D483D024B151553100C1EB1B1B120049A795401385353152B2928AEB1
        812435408D483D028E1553221C10ADB16706525B9A795401855315972C2A829D
        2730AB98428D494C19735394371F77910F39AA99639A873A0A74151596312C2A
        2CB0B1AB98716D4123195353923B371F37AFB1AA99657856380A1515157D3231
        9FB1B1B0A89523432E235353537A503BA1B1B1AFA792385D3E3815158B363644
        33ACB1B1ABA86123231553539058585B55A9B1B1AAA75A383853158334349EB1
        4636A2B1B14F4F171515538757579BB15E58A5B1B158582253537E343484B1B1
        B18C80B14F131203151568575789B1B1B19375B158100E0553537F459C6FB1B1
        B1B1B1B1698F13151515745D9A86B1B1B1B1B1B15C88105353531515156EB1B1
        B1B1B1B16A14151515155353537AB1B1B1B1B1B15E1B53535353151515707070
        70706E6D6C15151515155353537B7B7B7B7B7A78645353535353151515151515
        1515151515151515151553535353535353535353535353535353}
      NumGlyphs = 2
    end
    object Bevel7: TBevel
      Left = 921
      Top = 2
      Width = 4
      Height = 31
      Shape = bsSpacer
      Visible = False
    end
  end
  inherited pgcGuias: TPageControl
    Width = 950
    Height = 461
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 366
        Width = 942
      end
      inherited dbgDados: TDBGrid
        Width = 942
        Height = 366
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Width = 80
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'DATA_ABERTURA'
            Title.Alignment = taCenter
            Title.Caption = 'Data'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SITUACAO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'USUARIO'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL_CREDITO'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_TOTAL_DEBITO'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 370
        Width = 942
        object lblCaixaAberto: TLabel [0]
          Left = 2
          Top = 4
          Width = 95
          Height = 13
          Caption = '* Caixas Abertos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCaixaCancelado: TLabel [1]
          Left = 2
          Top = 24
          Width = 114
          Height = 13
          Caption = '* Caixas Cancelados'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel [2]
          Left = 2
          Top = 44
          Width = 16
          Height = 13
          Caption = '* ?'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 384
          Width = 554
          inherited lbltFiltrar: TLabel
            Left = 286
            Width = 73
            Caption = 'Operador(a):'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 509
          end
          object lblData: TLabel [2]
            Left = 14
            Top = 25
            Width = 46
            Height = 13
            Caption = 'Per'#237'odo:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 368
            Width = 137
            TabOrder = 2
          end
          object e1Data: TDateTimePicker
            Left = 64
            Top = 21
            Width = 105
            Height = 21
            Date = 40913.000000000000000000
            Time = 40913.000000000000000000
            TabOrder = 0
          end
          object e2Data: TDateTimePicker
            Left = 176
            Top = 21
            Width = 105
            Height = 21
            Date = 40913.000000000000000000
            Time = 40913.000000000000000000
            TabOrder = 1
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 193
        Width = 942
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 81
        Width = 942
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 942
        Height = 81
        inherited lblCodigo: TLabel
          Width = 47
          Caption = 'N'#250'mero:'
        end
        object lblOperador: TLabel [1]
          Left = 208
          Top = 24
          Width = 64
          Height = 13
          Caption = 'Operador(a):'
          FocusControl = dbOperador
        end
        object lblContaCorrente: TLabel [2]
          Left = 496
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Conta Corrente:'
          FocusControl = dbContaCorrente
        end
        object lblDataAbertura: TLabel [3]
          Left = 96
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Data:'
          FocusControl = dbDataAbertura
        end
        object lblSituacao: TLabel [4]
          Left = 800
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Situa'#231#227'o:'
          FocusControl = dbSituacao
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 73
          Color = clMoneyGreen
          DataField = 'NUMERO'
        end
        object dbOperador: TDBLookupComboBox
          Left = 208
          Top = 40
          Width = 281
          Height = 21
          DataField = 'USUARIO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'NOME'
          ListField = 'NOMECOMPLETO'
          ListSource = dtsOperador
          ParentFont = False
          TabOrder = 2
        end
        object dbContaCorrente: TDBLookupComboBox
          Left = 496
          Top = 40
          Width = 297
          Height = 21
          DataField = 'CONTA_CORRENTE'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsContaCorrente
          ParentFont = False
          TabOrder = 3
        end
        object dbDataAbertura: TDBDateEdit
          Left = 96
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DATA_ABERTURA'
          DataSource = DtSrcTabela
          DialogTitle = 'Selecionar Data de Abertura'
          NumGlyphs = 2
          TabOrder = 1
          StartOfWeek = Sun
        end
        object dbSituacao: TDBEdit
          Left = 800
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'SITUACAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
      end
      object GrpBxDadosEncerramento: TGroupBox
        Left = 0
        Top = 85
        Width = 942
        Height = 108
        Align = alTop
        Caption = 'Dados de Encerramento'
        TabOrder = 1
        DesignSize = (
          942
          108)
        object lblDataFech: TLabel
          Left = 16
          Top = 16
          Width = 89
          Height = 13
          Caption = 'Data Fechamento:'
          FocusControl = dbDataFech
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEntrada: TLabel
          Left = 128
          Top = 16
          Width = 120
          Height = 13
          Caption = 'Valor Total Entrada (R$):'
          FocusControl = dbEntrada
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblSaida: TLabel
          Left = 280
          Top = 16
          Width = 108
          Height = 13
          Caption = 'Valor Total Sa'#237'da (R$):'
          FocusControl = dbSaida
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDataCancel: TLabel
          Left = 16
          Top = 56
          Width = 86
          Height = 13
          Caption = 'D. Cancelamento:'
          FocusControl = dbDataCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblUsuarioCancel: TLabel
          Left = 128
          Top = 56
          Width = 126
          Height = 13
          Caption = 'Usu'#225'rio de Cancelamento:'
          FocusControl = dbUsuarioCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMotivoCancel: TLabel
          Left = 432
          Top = 56
          Width = 122
          Height = 13
          Caption = 'Motivo do Cancelamento:'
          FocusControl = dbMotivoCancel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 509
          Top = 9
          Width = 428
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Caption = 
            'Obs.: 1 - Apenas caixas que possuem movimenta'#231#227'o podem ser encer' +
            'rados.'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object dbDataFech: TDBDateEdit
          Left = 16
          Top = 32
          Width = 105
          Height = 21
          TabStop = False
          DataField = 'DATA_FECH'
          DataSource = DtSrcTabela
          ReadOnly = True
          Color = clMoneyGreen
          DialogTitle = 'Selecionar Data de Abertura'
          NumGlyphs = 2
          TabOrder = 0
          StartOfWeek = Sun
        end
        object dbEntrada: TDBEdit
          Left = 128
          Top = 32
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_TOTAL_CREDITO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbSaida: TDBEdit
          Left = 280
          Top = 32
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VALOR_TOTAL_DEBITO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbDataCancel: TDBDateEdit
          Left = 16
          Top = 72
          Width = 105
          Height = 21
          TabStop = False
          DataField = 'DATA_CANCEL'
          DataSource = DtSrcTabela
          ReadOnly = True
          Color = clMoneyGreen
          DialogTitle = 'Selecionar Data de Abertura'
          NumGlyphs = 2
          TabOrder = 3
          StartOfWeek = Sun
        end
        object dbUsuarioCancel: TDBEdit
          Left = 128
          Top = 72
          Width = 297
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'USUARIO_CANCEL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbMotivoCancel: TDBEdit
          Left = 432
          Top = 72
          Width = 489
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'MOTIVO_CANCEL'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
      end
      object pgcMaisDados: TPageControl
        Left = 0
        Top = 197
        Width = 942
        Height = 235
        ActivePage = tbsConsolidado
        Align = alClient
        TabOrder = 2
        TabStop = False
        object tbsConsolidado: TTabSheet
          Caption = 'Consolidado'
          object dbgConsolidado: TDBGrid
            Left = 0
            Top = 0
            Width = 934
            Height = 207
            TabStop = False
            Align = alClient
            DataSource = DtSrcConsolidado
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'SEQ'
                Title.Alignment = taCenter
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Descri'#231#227'o / Forma de Pagamento'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_CREDITO'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_DEBITO'
                Width = 120
                Visible = True
              end>
          end
        end
        object tbsMovimento: TTabSheet
          Caption = 'Movimento'
          ImageIndex = 1
          object dbgMovimento: TDBGrid
            Left = 0
            Top = 0
            Width = 934
            Height = 207
            TabStop = False
            Align = alClient
            DataSource = dtsMovimento
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'ControleMov'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATAHORA'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HISTORICO'
                Width = 390
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Title.Alignment = taCenter
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'VALOR'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ControleVenda'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ControleCompra'
                Width = 90
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')')
    GeneratorField.Field = 'NUMERO'
    GeneratorField.Generator = 'GEN_CAIXA_2012'
    object IbDtstTabelaANO: TSmallintField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'TBCAIXA.ANO'
      Required = True
    end
    object IbDtstTabelaNUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA.NUMERO'
    end
    object IbDtstTabelaDATA_ABERTURA: TDateField
      DisplayLabel = 'Data Abertura'
      FieldName = 'DATA_ABERTURA'
      Origin = 'TBCAIXA.DATA_ABERTURA'
      Required = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaDATA_FECH: TDateField
      DisplayLabel = 'Data Fech.'
      FieldName = 'DATA_FECH'
      Origin = 'TBCAIXA.DATA_FECH'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaDATA_CANCEL: TDateField
      DisplayLabel = 'Data Cancel.'
      FieldName = 'DATA_CANCEL'
      Origin = 'TBCAIXA.DATA_CANCEL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      DisplayLabel = 'Operador'
      FieldName = 'USUARIO'
      Origin = 'TBCAIXA.USUARIO'
      Required = True
      Size = 12
    end
    object IbDtstTabelaUSUARIO_CANCEL: TIBStringField
      DisplayLabel = 'Usu'#225'rio Cancel.'
      FieldName = 'USUARIO_CANCEL'
      Origin = 'TBCAIXA.USUARIO_CANCEL'
      Size = 12
    end
    object IbDtstTabelaSITUACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'TBCAIXA.SITUACAO'
      Required = True
      OnGetText = IbDtstTabelaSITUACAOGetText
    end
    object IbDtstTabelaCONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA_CORRENTE'
      Origin = 'TBCAIXA.CONTA_CORRENTE'
      Required = True
    end
    object IbDtstTabelaVALOR_TOTAL_CREDITO: TIBBCDField
      DisplayLabel = 'Entrada (R$)'
      FieldName = 'VALOR_TOTAL_CREDITO'
      Origin = 'TBCAIXA.VALOR_TOTAL_CREDITO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_TOTAL_DEBITO: TIBBCDField
      DisplayLabel = 'Sa'#237'da (R$)'
      FieldName = 'VALOR_TOTAL_DEBITO'
      Origin = 'TBCAIXA.VALOR_TOTAL_DEBITO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaMOTIVO_CANCEL: TIBStringField
      DisplayLabel = 'Motivo do cancelamento'
      FieldName = 'MOTIVO_CANCEL'
      Origin = 'TBCAIXA.MOTIVO_CANCEL'
      ProviderFlags = [pfInUpdate]
      Size = 250
    end
    object IbDtstTabelaDESCRICAO: TIBStringField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'DESCRICAO'
      Origin = 'TBCONTA_CORRENTE.DESCRICAO'
      ProviderFlags = []
      Size = 50
    end
    object IbDtstTabelaTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ProviderFlags = []
      FixedChar = True
      Size = 12
    end
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  NUMERO,'
      '  DATA_ABERTURA,'
      '  DATA_FECH,'
      '  DATA_CANCEL,'
      '  USUARIO,'
      '  USUARIO_CANCEL,'
      '  SITUACAO,'
      '  CONTA_CORRENTE,'
      '  VALOR_TOTAL_CREDITO,'
      '  VALOR_TOTAL_DEBITO,'
      '  MOTIVO_CANCEL'
      'from TBCAIXA '
      'where'
      '  ANO = :ANO and'
      '  NUMERO = :NUMERO')
    ModifySQL.Strings = (
      'update TBCAIXA'
      'set'
      '  ANO = :ANO,'
      '  NUMERO = :NUMERO,'
      '  DATA_ABERTURA = :DATA_ABERTURA,'
      '  DATA_FECH = :DATA_FECH,'
      '  DATA_CANCEL = :DATA_CANCEL,'
      '  USUARIO = :USUARIO,'
      '  USUARIO_CANCEL = :USUARIO_CANCEL,'
      '  SITUACAO = :SITUACAO,'
      '  CONTA_CORRENTE = :CONTA_CORRENTE,'
      '  VALOR_TOTAL_CREDITO = :VALOR_TOTAL_CREDITO,'
      '  VALOR_TOTAL_DEBITO = :VALOR_TOTAL_DEBITO,'
      '  MOTIVO_CANCEL = :MOTIVO_CANCEL'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TBCAIXA'
      
        '  (ANO, NUMERO, DATA_ABERTURA, DATA_FECH, DATA_CANCEL, USUARIO, ' +
        'USUARIO_CANCEL, '
      
        '   SITUACAO, CONTA_CORRENTE, VALOR_TOTAL_CREDITO, VALOR_TOTAL_DE' +
        'BITO, MOTIVO_CANCEL)'
      'values'
      
        '  (:ANO, :NUMERO, :DATA_ABERTURA, :DATA_FECH, :DATA_CANCEL, :USU' +
        'ARIO, :USUARIO_CANCEL, '
      
        '   :SITUACAO, :CONTA_CORRENTE, :VALOR_TOTAL_CREDITO, :VALOR_TOTA' +
        'L_DEBITO, '
      '   :MOTIVO_CANCEL)')
    DeleteSQL.Strings = (
      'delete from TBCAIXA'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO')
  end
  object tblOperador: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBUSERS'
    Left = 720
    Top = 8
  end
  object dtsOperador: TDataSource
    DataSet = tblOperador
    Left = 752
    Top = 8
  end
  object tblContaCorrente: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBCONTA_CORRENTE'
    Left = 720
    Top = 40
  end
  object dtsContaCorrente: TDataSource
    DataSet = tblContaCorrente
    Left = 752
    Top = 40
  end
  object cdsCosolidado: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    cs.Ano'
      '  , cs.Numero'
      '  , cs.Seq'
      '  , cs.Forma_pagto'
      '  , cs.Descricao'
      '  , cs.Total_credito'
      '  , cs.Total_debito'
      'from TBCAIXA_CONSOLIDACAO cs')
    ModifySQL.Strings = (
      '')
    UpdateObject = IbUpdConsolidado
    Left = 624
    Top = 40
    object cdsCosolidadoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCAIXA_CONSOLIDACAO.ANO'
      Required = True
    end
    object cdsCosolidadoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA_CONSOLIDACAO.NUMERO'
      Required = True
    end
    object cdsCosolidadoSEQ: TSmallintField
      Alignment = taCenter
      DisplayLabel = '#'
      FieldName = 'SEQ'
      Origin = 'TBCAIXA_CONSOLIDACAO.SEQ'
      Required = True
      DisplayFormat = '00'
    end
    object cdsCosolidadoFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCAIXA_CONSOLIDACAO.FORMA_PAGTO'
    end
    object cdsCosolidadoDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'TBCAIXA_CONSOLIDACAO.DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsCosolidadoTOTAL_CREDITO: TIBBCDField
      DisplayLabel = 'Total Entrada (R$)'
      FieldName = 'TOTAL_CREDITO'
      Origin = 'TBCAIXA_CONSOLIDACAO.TOTAL_CREDITO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsCosolidadoTOTAL_DEBITO: TIBBCDField
      DisplayLabel = 'Total Sa'#237'da (R$)'
      FieldName = 'TOTAL_DEBITO'
      Origin = 'TBCAIXA_CONSOLIDACAO.TOTAL_DEBITO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object IbUpdConsolidado: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  NUMERO,'
      '  SEQ,'
      '  FORMA_PAGTO,'
      '  DESCRICAO,'
      '  TOTAL_CREDITO,'
      '  TOTAL_DEBITO'
      'from TBCAIXA_CONSOLIDACAO '
      'where'
      '  ANO = :ANO and'
      '  NUMERO = :NUMERO and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TBCAIXA_CONSOLIDACAO'
      'set'
      '  ANO = :ANO,'
      '  NUMERO = :NUMERO,'
      '  SEQ = :SEQ,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  TOTAL_CREDITO = :TOTAL_CREDITO,'
      '  TOTAL_DEBITO = :TOTAL_DEBITO'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TBCAIXA_CONSOLIDACAO'
      
        '  (ANO, NUMERO, SEQ, FORMA_PAGTO, DESCRICAO, TOTAL_CREDITO, TOTA' +
        'L_DEBITO)'
      'values'
      
        '  (:ANO, :NUMERO, :SEQ, :FORMA_PAGTO, :DESCRICAO, :TOTAL_CREDITO' +
        ', :TOTAL_DEBITO)')
    DeleteSQL.Strings = (
      'delete from TBCAIXA_CONSOLIDACAO'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO and'
      '  SEQ = :OLD_SEQ')
    Left = 656
    Top = 40
  end
  object DtSrcConsolidado: TDataSource
    AutoEdit = False
    DataSet = cdsCosolidado
    Left = 688
    Top = 40
  end
  object dtsMovimento: TDataSource
    AutoEdit = False
    DataSet = qryMovimento
    Left = 688
    Top = 72
  end
  object qryMovimento: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnCalcFields = qryMovimentoCalcFields
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    cm.Ano'
      '  , cm.Numero'
      '  , cm.Forma_pagto'
      '  , fp.Descri as Forma_pagto_desc'
      '  , cm.Datahora'
      '  , cm.Tipo'
      '  , cm.Historico'
      '  , cm.Valor'
      '  , cm.Situacao'
      '  , cm.Venda_ano'
      '  , cm.Venda_num'
      '  , cm.Cliente'
      '  , cm.Compra_ano'
      '  , cm.Compra_num'
      '  , cm.Fornecedor'
      'from TBCAIXA_MOVIMENTO cm'
      '  left join TBFORMPAGTO fp on (fp.Cod = cm.Forma_pagto)')
    ModifySQL.Strings = (
      '')
    Left = 624
    Top = 72
    object qryMovimentoANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCAIXA_MOVIMENTO.ANO'
      Required = True
    end
    object qryMovimentoNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA_MOVIMENTO.NUMERO'
      Required = True
    end
    object qryMovimentoFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCAIXA_MOVIMENTO.FORMA_PAGTO'
    end
    object qryMovimentoFORMA_PAGTO_DESC: TIBStringField
      DisplayLabel = 'Forma Pagto.'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object qryMovimentoDATAHORA: TDateTimeField
      DisplayLabel = 'Data/Hora'
      FieldName = 'DATAHORA'
      Origin = 'TBCAIXA_MOVIMENTO.DATAHORA'
      DisplayFormat = 'dd/mm/yy hh:mm'
    end
    object qryMovimentoTIPO: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TBCAIXA_MOVIMENTO.TIPO'
      Size = 1
    end
    object qryMovimentoHISTORICO: TIBStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Origin = 'TBCAIXA_MOVIMENTO.HISTORICO'
      Size = 250
    end
    object qryMovimentoVALOR: TIBBCDField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR'
      Origin = 'TBCAIXA_MOVIMENTO.VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryMovimentoSITUACAO: TSmallintField
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'TBCAIXA_MOVIMENTO.SITUACAO'
    end
    object qryMovimentoVENDA_ANO: TSmallintField
      FieldName = 'VENDA_ANO'
      Origin = 'TBCAIXA_MOVIMENTO.VENDA_ANO'
    end
    object qryMovimentoVENDA_NUM: TIntegerField
      FieldName = 'VENDA_NUM'
      Origin = 'TBCAIXA_MOVIMENTO.VENDA_NUM'
    end
    object qryMovimentoCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = 'TBCAIXA_MOVIMENTO.CLIENTE'
      Size = 18
    end
    object qryMovimentoCOMPRA_ANO: TSmallintField
      FieldName = 'COMPRA_ANO'
      Origin = 'TBCAIXA_MOVIMENTO.COMPRA_ANO'
    end
    object qryMovimentoCOMPRA_NUM: TIntegerField
      FieldName = 'COMPRA_NUM'
      Origin = 'TBCAIXA_MOVIMENTO.COMPRA_NUM'
    end
    object qryMovimentoFORNECEDOR: TIntegerField
      FieldName = 'FORNECEDOR'
      Origin = 'TBCAIXA_MOVIMENTO.FORNECEDOR'
    end
    object qryMovimentoControleMov: TStringField
      DisplayLabel = 'No. Movimento'
      FieldKind = fkCalculated
      FieldName = 'ControleMov'
      Calculated = True
    end
    object qryMovimentoControleVenda: TStringField
      DisplayLabel = 'No. Venda'
      FieldKind = fkCalculated
      FieldName = 'ControleVenda'
      Calculated = True
    end
    object qryMovimentoControleCompra: TStringField
      DisplayLabel = 'No. Compra'
      FieldKind = fkCalculated
      FieldName = 'ControleCompra'
      Calculated = True
    end
  end
  object ppImprimir: TPopupMenu
    Left = 384
    Top = 432
    object nmImprimirCaixaEncerrado: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0064615F47464526242436343339373646464600
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00797978636161
        E7CCBEF9CAB0D4AE993C3A393A383800FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF007F7C79D1CBC7FFF3ECFEE4D5FCD0B9C4A4912F2F2E59
        775C506853475A4940514238473A303D3129342A222C231C251D9F9C9AFBF9F7
        FFFAF7262423262220F7C7AC23212160A3625593554A8149457A484173413C6C
        3C3765383761391C251D989797F3F3F1FFFDFB3D3B3AFFF5EFC5B9AD59555368
        AA6B65A86961A2645A965E558C584D824F49784B39633B222C23746E6B929191
        F1F0F0F2EEEBDDD6D25B5E5A7FAE8270B37471B7766EB27267A86A619E645992
        5B4E84513D6C3D29342A00FF0075706D9797978B8A8A7F7E7D709A7595CF9B7C
        BF8178BB7B74BA7A6FB47569AD6F62A165578E58427342303D3100FF0000FF00
        00FF00595D5900FF0075AB7C9BD2A085C78A7EC3857BBF8176BD7C73B7776AAE
        6E5E9A60467C4638473A00FF0000FF0000FF00787978787878699E73A3D5A98E
        CA9485C88C80C5867DC08276BC7D70B57465A5684D854C40514200FF0000FF00
        00FF001C201C00FF0071A77CABDAB06194655F94625F9863629E6867A36C6AA7
        6E6BAA704F8E52475A4900FF0000FF0000FF0078797880808079AF85B3DDB85B
        8A5E7FB68488BE8E94C79AA1CFA5A6D5AB67A56D5795574E625000FF0000FF00
        00FF0020252000FF007FB68DB9E1BF59865C73A87779AE7D85B9888FC49399CA
        9F65A1685A9B5954695600FF0000FF0000FF0071727180808085BC93BFE3C55E
        896157855A58865B5B8D5E5E9361619864639F675EA461586E5A00FF0000FF00
        00FF0020252000FF0089C198C1E5C6C0E4C6BBE2C0B7DFBCAEDAB3A1D3A68FC7
        947FBD847DB980586E5A00FF0000FF0000FF0010151080808089C19888BF9686
        BD9283BA8E81B78A7EB4857BB08078AD7B76AA7773A77371A56F}
      Caption = 'Encerramento de Caixa'
      Visible = False
    end
    object N1: TMenuItem
      Caption = '-'
      Visible = False
    end
    object nmImprimirCaixaSintetico: TMenuItem
      Bitmap.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E0000}
      Caption = 'Caixa Sint'#233'tico'
      OnClick = nmImprimirCaixaSinteticoClick
    end
    object nmImprimirCaixaAnalitico: TMenuItem
      Bitmap.Data = {
        16050000424D160500000000000036040000280000000E0000000E0000000100
        080000000000E000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E00003E3E3E3E3E3E
        3E3E3E3E3E3E3E3E00003E3E3E3E3E3E3E3E3E3E3E3E3E3E0000}
      Caption = 'Caixa Anal'#237'tico'
      OnClick = nmImprimirCaixaAnaliticoClick
    end
  end
  object IBStrPrcCaixaConsolidar: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_CAIXA_CONSOLIDAR'
    Left = 720
    Top = 72
  end
  object qryCaixaSintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , u.Nomecompleto'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , Case'
      '      when c.Situacao = 0 then '#39'Aberto'#39
      '      when c.Situacao = 1 then '#39'Fechado'#39
      '      when c.Situacao = 2 then '#39'Cancelado'#39
      '      else '#39'* Indefinido'#39
      '    end as Situacao_Desc'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao as Conta_corrente_Desc'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cf.Seq'
      '  , cf.Forma_pagto'
      '  , cf.Descricao as Consolidacao_Desc'
      '  , cf.Total_credito'
      '  , cf.Total_debito'
      '  , ('
      '    Select'
      '      Count(cm.Caixa_ano)'
      '    from TBCAIXA_MOVIMENTO cm'
      '    where cm.Caixa_ano = c.Ano'
      '      and cm.Caixa_num = c.Numero'
      '      and cm.Forma_pagto = cf.Forma_pagto'
      '      and cm.Situacao    = 1'
      '      and cm.Tipo        = '#39'C'#39
      '    ) as Qtde_Credito'
      '  , ('
      '    Select'
      '      Count(cm.Caixa_ano)'
      '    from TBCAIXA_MOVIMENTO cm'
      '    where cm.Caixa_ano = c.Ano'
      '      and cm.Caixa_num = c.Numero'
      '      and cm.Forma_pagto = cf.Forma_pagto'
      '      and cm.Situacao    = 1'
      '      and cm.Tipo        = '#39'D'#39
      '    ) as Qtde_Debito'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBCAIXA_CONSOLIDACAO cf on (cf.Ano = c.Ano and cf.Nu' +
        'mero = c.Numero)'
      '  left join TBUSERS u on (u.Nome = c.Usuario)')
    Left = 816
    Top = 8
  end
  object frdCaixaSintetico: TfrxDBDataset
    UserName = 'frdCaixaSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'NUMERO=NUMERO'
      'DATA_ABERTURA=DATA_ABERTURA'
      'DATA_FECH=DATA_FECH'
      'DATA_CANCEL=DATA_CANCEL'
      'USUARIO=USUARIO'
      'NOMECOMPLETO=NOMECOMPLETO'
      'USUARIO_CANCEL=USUARIO_CANCEL'
      'SITUACAO=SITUACAO'
      'SITUACAO_DESC=SITUACAO_DESC'
      'CONTA_CORRENTE=CONTA_CORRENTE'
      'VALOR_TOTAL_CREDITO=VALOR_TOTAL_CREDITO'
      'VALOR_TOTAL_DEBITO=VALOR_TOTAL_DEBITO'
      'MOTIVO_CANCEL=MOTIVO_CANCEL'
      'CONTA_CORRENTE_DESC=CONTA_CORRENTE_DESC'
      'TIPO=TIPO'
      'SEQ=SEQ'
      'FORMA_PAGTO=FORMA_PAGTO'
      'CONSOLIDACAO_DESC=CONSOLIDACAO_DESC'
      'TOTAL_CREDITO=TOTAL_CREDITO'
      'TOTAL_DEBITO=TOTAL_DEBITO'
      'QTDE_CREDITO=QTDE_CREDITO'
      'QTDE_DEBITO=QTDE_DEBITO')
    DataSet = qryCaixaSintetico
    BCDToCurrency = False
    Left = 848
    Top = 8
  end
  object frrCaixaSintetico: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 40928.416853240700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 784
    Top = 8
    Datasets = <
      item
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
      end
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdEmpresaRZSOC: TfrxMemoView
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Top = 18.897650000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdCaixaSintetico."ANO"]/[FormatFloat('#39'0000000'#39',<frdCaixaSintet' +
              'ico."NUMERO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C a i x a :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCaixaSintetico."SITUACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 37.795300000000000000
          Width = 559.370440000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'EXTRATO CAIXA - SINT'#195#8240'TICO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
        RowCount = 0
        object frdItensSEQ: TfrxMemoView
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#].')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 26.456710000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."CONSOLIDACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 468.661720000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,###,##0'#39',(<frdCaixaSintetico."QTDE_CREDITO">+<' +
              'frdCaixaSintetico."QTDE_DEBITO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_CREDITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_DEBITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 714.331170000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 377.953000000000000000
        Top = 313.700990000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 302.362400000000000000
          Height = 90.708720000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ''
            ' T O T A L    G E R A L :')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 113.385900000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCaixaSintetico."DATA_FECH">>0,<frdCaixaSintetico."DATA' +
              '_FECH">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Data de Encerramento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 226.771800000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 37.795300000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCaixaSintetico."NOMECOMPLETO"]'
            'Operador(a)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 400.630180000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."NMFANT"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 423.307360000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' (+) Total Cr'#195#169'dito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 423.307360000000000000
          Top = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' (-) Total D'#195#169'bito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 423.307360000000000000
          Top = 75.590600000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            ' (=) Saldo:')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdCaixaSintetico."TOTAL_CREDITO">,bn' +
              'dMasterData,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 559.370440000000000000
          Top = 52.913420000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdCaixaSintetico."TOTAL_DEBITO">,bnd' +
              'MasterData,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 559.370440000000000000
          Top = 75.590600000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39', SUM(<frdCaixaSintetico."TOTAL_CREDITO">-<f' +
              'rdCaixaSintetico."TOTAL_DEBITO">,bndMasterData,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 139.842610000000000000
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Data de Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 139.842610000000000000
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCaixaSintetico."DATA_CANCEL">>0,<frdCaixaSintetico."DA' +
              'TA_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 279.685220000000000000
          Top = 117.165430000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Usu'#195#161'rio do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 279.685220000000000000
          Top = 128.504020000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCaixaSintetico."USUARIO_CANCEL"><>'#39#39',<frdCaixaSintetic' +
              'o."USUARIO_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 139.842610000000000000
          Top = 147.401670000000000000
          Width = 336.378170000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Motivo do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 139.842610000000000000
          Top = 158.740260000000000000
          Width = 578.268090000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."MOTIVO_CANCEL"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndGrpHeaderCaixa: TfrxGroupHeader
        Height = 45.354360000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Condition = 'frdCaixaSintetico."NUMERO"'
        object frdVendaNOME: TfrxMemoView
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdCaixaSintetico."DATA_ABERTURA"' +
              '>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Data Abertura:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 109.606370000000000000
          Width = 306.141930000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Operador(a):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 109.606370000000000000
          Top = 11.338590000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 415.748300000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Conta Corrente:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."CONTA_CORRENTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Top = 30.236240000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Tipo:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 642.520100000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."TIPO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 26.456710000000000000
          Top = 30.236240000000000000
          Width = 442.204834250000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' D e s c r i '#195#167' '#195#163' o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 468.661720000000000000
          Top = 30.236240000000000000
          Width = 60.472443390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Q t d e . ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 45.354360000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo17: TfrxMemoView
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'C r '#195#169' d i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 623.622450000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'D '#195#169' b i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frrCaixaAnalitico: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 40928.416853240700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 784
    Top = 40
    Datasets = <
      item
        DataSet = frdCaixaAnalitico
        DataSetName = 'frdCaixaAnalitico'
      end
      item
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
      end
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Lucida Console'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object bndReportTitle: TfrxReportTitle
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object frdEmpresaRZSOC: TfrxMemoView
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Top = 18.897650000000000000
          Width = 559.370440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdVendaCODCONTROL: TfrxMemoView
          Left = 559.370440000000000000
          Top = 18.897650000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[frdCaixaSintetico."ANO"]/[FormatFloat('#39'0000000'#39',<frdCaixaSintet' +
              'ico."NUMERO">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 559.370440000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            'N '#195#186' m e r o   C a i x a :')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 559.370440000000000000
          Top = 37.795300000000000000
          Width = 158.740260000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCaixaSintetico."SITUACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 37.795300000000000000
          Width = 559.370440000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              '[frdEmpresa."TLG_SIGLA"] [frdEmpresa."LOG_NOME"], [frdEmpresa."N' +
              'UMERO_END"], [frdEmpresa."BAI_NOME"] - [frdEmpresa."CID_NOME"]/[' +
              'frdEmpresa."EST_SIGLA"] CEP.: [FormatMaskText('#39'##.###-###;0;'#39',<f' +
              'rdEmpresa."CEP">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line1: TfrxLineView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo50: TfrxMemoView
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'EXTRATO CAIXA - ANAL'#195#141'TICO')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line4: TfrxLineView
          Top = 83.149660000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 234.330860000000000000
        Width = 718.110700000000000000
        DataSet = frdCaixaSintetico
        DataSetName = 'frdCaixaSintetico'
        RowCount = 0
        object frdItensSEQ: TfrxMemoView
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[Line#].')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 26.456710000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."CONSOLIDACAO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 468.661720000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39'###,###,##0'#39',(<frdCaixaSintetico."QTDE_CREDITO">+<' +
              'frdCaixaSintetico."QTDE_DEBITO">))] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 529.134200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_CREDITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 623.622450000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaSintetico."TOTAL_DEBITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 797.480830000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            'P '#195#161' g i n a :  [Page#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        Height = 377.953000000000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 415.748300000000000000
          Top = 7.559060000000000000
          Width = 302.362400000000000000
          Height = 90.708720000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ''
            ' T O T A L    G E R A L :')
          ParentFont = False
        end
        object Line3: TfrxLineView
          Top = 113.385900000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCaixaSintetico."DATA_FECH">>0,<frdCaixaSintetico."DATA' +
              '_FECH">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Data de Encerramento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo40: TfrxMemoView
          Top = 226.771800000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 211.653680000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 37.795300000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdCaixaSintetico."NOMECOMPLETO"]'
            'Operador(a)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 400.630180000000000000
          Top = 347.716760000000000000
          Width = 260.787570000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haCenter
          Memo.UTF8 = (
            '[frdEmpresa."NMFANT"]'
            '[FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 423.307360000000000000
          Top = 34.015770000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' (+) Total Cr'#195#169'dito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Left = 423.307360000000000000
          Top = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' (-) Total D'#195#169'bito:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Left = 423.307360000000000000
          Top = 75.590600000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Memo.UTF8 = (
            ' (=) Saldo:')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Left = 559.370440000000000000
          Top = 34.015770000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39', SUM(IIF(<frdCaixaAnalitico."SITUACAOMOV">=' +
              '0,0,<frdCaixaAnalitico."VALOR_CREDITO">),bndMasterDataMov,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 559.370440000000000000
          Top = 52.913420000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39', SUM(IIF(<frdCaixaAnalitico."SITUACAOMOV">=' +
              '0,0,<frdCaixaAnalitico."VALOR_DEBITO">),bndMasterDataMov,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 559.370440000000000000
          Top = 75.590600000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39', SUM(IIF(<frdCaixaAnalitico."SITUACAOMOV">=' +
              '0,0,<frdCaixaAnalitico."VALOR_CREDITO">)-IIF(<frdCaixaAnalitico.' +
              '"SITUACAOMOV">=0,0,<frdCaixaAnalitico."VALOR_DEBITO">),bndMaster' +
              'DataMov,2))]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo19: TfrxMemoView
          Left = 139.842610000000000000
          Top = 117.165430000000000000
          Width = 139.842610000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Data de Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 139.842610000000000000
          Top = 128.504020000000000000
          Width = 139.842610000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCaixaSintetico."DATA_CANCEL">>0,<frdCaixaSintetico."DA' +
              'TA_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 279.685220000000000000
          Top = 117.165430000000000000
          Width = 196.535560000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Usu'#195#161'rio do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 279.685220000000000000
          Top = 128.504020000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [IIF(<frdCaixaSintetico."USUARIO_CANCEL"><>'#39#39',<frdCaixaSintetic' +
              'o."USUARIO_CANCEL">,'#39#39')]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 139.842610000000000000
          Top = 147.401670000000000000
          Width = 336.378170000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Motivo do Cancelamento:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Left = 139.842610000000000000
          Top = 158.740260000000000000
          Width = 578.268090000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."MOTIVO_CANCEL"]')
          ParentFont = False
          WordWrap = False
        end
      end
      object bndGrpHeaderCaixa: TfrxGroupHeader
        Height = 45.354360000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Condition = 'frdCaixaSintetico."NUMERO"'
        object frdVendaNOME: TfrxMemoView
          Top = 11.338590000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              ' [FormatDateTime('#39'dd/mm/yyyy'#39',<frdCaixaSintetico."DATA_ABERTURA"' +
              '>)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Width = 109.606370000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Data Abertura:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 109.606370000000000000
          Width = 306.141930000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Operador(a):')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 109.606370000000000000
          Top = 11.338590000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."USUARIO"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 415.748300000000000000
          Width = 226.771800000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Conta Corrente:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Left = 415.748300000000000000
          Top = 11.338590000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."CONTA_CORRENTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Top = 30.236240000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 11.338590000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' Tipo:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 642.520100000000000000
          Top = 11.338590000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' [frdCaixaSintetico."TIPO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 26.456710000000000000
          Top = 30.236240000000000000
          Width = 442.204834250000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            ' D e s c r i '#195#167' '#195#163' o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 468.661720000000000000
          Top = 30.236240000000000000
          Width = 60.472443390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'Q t d e . ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 45.354360000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo17: TfrxMemoView
          Left = 529.134200000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'C r '#195#169' d i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 623.622450000000000000
          Top = 30.236240000000000000
          Width = 94.488213390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8 = (
            'D '#195#169' b i t o s ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeaderMov: TfrxHeader
        Height = 18.897650000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo33: TfrxMemoView
          Top = 3.779530000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Lan'#195#167'amento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Data')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Left = 128.504020000000000000
          Top = 3.779530000000000000
          Width = 321.260050000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            ' Hist'#195#179'rico')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 449.764070000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8 = (
            'Tipo')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo39: TfrxMemoView
          Left = 574.488560000000000000
          Top = 3.779530000000000000
          Width = 71.811033390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'Cr'#195#169'dito ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Left = 646.299630000000000000
          Top = 3.779530000000000000
          Width = 71.811033390000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haRight
          Memo.UTF8 = (
            'D'#195#169'bito ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo48: TfrxMemoView
          Left = 480.000310000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            ' Forma Pagto.')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterDataMov: TfrxMasterData
        Height = 18.897650000000000000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frdCaixaAnalitico
        DataSetName = 'frdCaixaAnalitico'
        RowCount = 0
        object Memo29: TfrxMemoView
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            '[frdCaixaAnalitico."MOVIMENTO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 128.504020000000000000
          Width = 321.260050000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            ' [frdCaixaAnalitico."HISTORICO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 75.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            
              '[IIF(<frdCaixaAnalitico."DATAHORA">=0,'#39#39',FormatDateTime('#39'dd/mm/y' +
              'y'#39',<frdCaixaAnalitico."DATAHORA">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 449.764070000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            '[frdCaixaAnalitico."TIPOMOV"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo46: TfrxMemoView
          Left = 574.488560000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaAnalitico."VALOR_CREDITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 646.299630000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdCaixaAnalitico."VALOR_DEBITO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo49: TfrxMemoView
          Left = 480.000310000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdCaixaAnalitico."SITUACAOMOV">=0'
          Memo.UTF8 = (
            ' [frdCaixaAnalitico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryCaixaAnalitico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    c.Ano'
      '  , c.Numero'
      '  , c.Data_abertura'
      '  , c.Data_fech'
      '  , c.Data_cancel'
      '  , c.Usuario'
      '  , u.Nomecompleto'
      '  , c.Usuario_cancel'
      '  , c.Situacao'
      '  , Case'
      '      when c.Situacao = 0 then '#39'Aberto'#39
      '      when c.Situacao = 1 then '#39'Fechado'#39
      '      when c.Situacao = 2 then '#39'Cancelado'#39
      '      else '#39'* Indefinido'#39
      '    end as Situacao_Desc'
      '  , c.Conta_corrente'
      '  , c.Valor_total_credito'
      '  , c.Valor_total_debito'
      '  , c.Motivo_cancel'
      '  , cc.Descricao as Conta_corrente_Desc'
      '  , Case'
      '      when cc.Tipo = 1 then '#39'Caixa'#39
      '      when cc.Tipo = 2 then '#39'Banco'#39
      '      else '#39'* Indefinido'#39
      '    end as Tipo'
      '  , cm.Ano as AnoMov'
      '  , cm.Numero as NumMov'
      '  , cm.Ano || right('#39'0000000'#39' || cm.Numero, 7) as Movimento'
      '  , cm.Forma_pagto'
      '  , f.Descri as Forma_pagto_Desc'
      '  , cm.Datahora'
      '  , cm.Historico'
      '  , cm.Situacao as SituacaoMov'
      '  , cm.Tipo as TipoMov'
      '  , cm.Valor'
      
        '  , Case when upper(cm.Tipo) = '#39'C'#39' then cm.Valor else 0 end as V' +
        'alor_Credito'
      
        '  , Case when upper(cm.Tipo) = '#39'D'#39' then cm.Valor else 0 end as V' +
        'alor_Debito'
      'from TBCAIXA c'
      
        '  left join TBCONTA_CORRENTE cc on (cc.Codigo = c.Conta_corrente' +
        ')'
      
        '  left join TBCAIXA_MOVIMENTO cm on (cm.Caixa_ano = c.Ano and cm' +
        '.Caixa_num = c.Numero)'
      '  left join TBFORMPAGTO f on (f.Cod = cm.Forma_pagto)'
      '  left join TBUSERS u on (u.Nome = c.Usuario)')
    Left = 816
    Top = 40
  end
  object frdCaixaAnalitico: TfrxDBDataset
    UserName = 'frdCaixaAnalitico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANO=ANO'
      'NUMERO=NUMERO'
      'DATA_ABERTURA=DATA_ABERTURA'
      'DATA_FECH=DATA_FECH'
      'DATA_CANCEL=DATA_CANCEL'
      'USUARIO=USUARIO'
      'NOMECOMPLETO=NOMECOMPLETO'
      'USUARIO_CANCEL=USUARIO_CANCEL'
      'SITUACAO=SITUACAO'
      'SITUACAO_DESC=SITUACAO_DESC'
      'CONTA_CORRENTE=CONTA_CORRENTE'
      'VALOR_TOTAL_CREDITO=VALOR_TOTAL_CREDITO'
      'VALOR_TOTAL_DEBITO=VALOR_TOTAL_DEBITO'
      'MOTIVO_CANCEL=MOTIVO_CANCEL'
      'CONTA_CORRENTE_DESC=CONTA_CORRENTE_DESC'
      'TIPO=TIPO'
      'ANOMOV=ANOMOV'
      'NUMMOV=NUMMOV'
      'MOVIMENTO=MOVIMENTO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'DATAHORA=DATAHORA'
      'HISTORICO=HISTORICO'
      'SITUACAOMOV=SITUACAOMOV'
      'TIPOMOV=TIPOMOV'
      'VALOR=VALOR'
      'VALOR_CREDITO=VALOR_CREDITO'
      'VALOR_DEBITO=VALOR_DEBITO')
    DataSet = qryCaixaAnalitico
    BCDToCurrency = False
    Left = 848
    Top = 40
  end
end

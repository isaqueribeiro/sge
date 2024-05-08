inherited ViewQueryCaixaConferencia: TViewQueryCaixaConferencia
  Caption = 'Confer'#234'ncia de Contas Correntes e/ou Caixas'
  ClientHeight = 669
  ClientWidth = 1126
  ExplicitWidth = 1142
  ExplicitHeight = 708
  TextHeight = 13
  inherited pnlPesquisa: TPanel
    Width = 1120
    ExplicitWidth = 1120
    inherited BvlTipoPesquisa: TBevel
      Left = 230
      ExplicitLeft = 230
    end
    inherited GrpBxTipoPesquisa: TGroupBox
      Width = 226
      ExplicitWidth = 226
      inherited lblTipoPesquisa: TLabel
        Width = 202
        Enabled = True
      end
      inherited edTipoPesquisa: TComboBox
        Width = 202
        Enabled = True
        ItemIndex = 1
        Text = 'Lan'#231'amentos Sem Confer'#234'ncia'
        Items.Strings = (
          'Todos os Lan'#231'amentos'
          'Lan'#231'amentos Sem Confer'#234'ncia')
        ExplicitWidth = 202
      end
    end
    inherited GrpBxPesquisar: TGroupBox
      Left = 234
      Width = 882
      ExplicitLeft = 234
      ExplicitWidth = 892
      inherited lblPesquisar: TLabel
        Left = 352
        Width = 95
        Margins.Left = 350
        Caption = '&N'#250'mero do Caixa'
        ExplicitLeft = 352
        ExplicitWidth = 95
      end
      object lblData: TLabel [1]
        Left = 12
        Top = 24
        Width = 77
        Height = 13
        Caption = '&Data do Mov.:'
        FocusControl = e1Data
      end
      object lblContaCorrente: TLabel [2]
        Left = 118
        Top = 24
        Width = 89
        Height = 13
        Caption = '&Conta Corrente:'
        FocusControl = edContaCorrente
      end
      inherited edPesquisar: TEdit
        Left = 352
        Width = 494
        Margins.Left = 350
        TabOrder = 2
        ExplicitLeft = 352
        ExplicitWidth = 504
      end
      inherited BtnPesquisar: TcxButton
        Left = 849
        TabOrder = 3
        ExplicitLeft = 859
      end
      object e1Data: TJvDateEdit
        Left = 12
        Top = 40
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
      object edContaCorrente: TComboBox
        Left = 118
        Top = 40
        Width = 228
        Height = 21
        Style = csDropDownList
        TabOrder = 1
      end
    end
  end
  inherited PnlTabela: TPanel
    Width = 1126
    Height = 585
    ExplicitWidth = 1126
    ExplicitHeight = 585
    inherited dbgDados: TDBGrid
      Width = 1112
      Height = 371
      OnDblClick = dbgDadosDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'selecionar'
          Title.Alignment = taCenter
          Title.Caption = 'Confere'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'lancamento'
          Title.Caption = 'Lan'#231'amento'
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data'
          Title.Caption = 'Data'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Title.Caption = 'Cliente / Fornecedor'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cnpj'
          Title.Caption = 'CPF / CNPJ'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'historico'
          Title.Caption = 'Hist'#243'rico'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'tipo'
          Title.Alignment = taCenter
          Title.Caption = 'Tipo'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor_Credito'
          Title.Caption = 'Cr'#233'dito (R$)'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Valor_Debito'
          Title.Caption = 'D'#233'bito (R$)'
          Width = 85
          Visible = True
        end>
    end
    inherited pnlBotoes: TPanel
      Top = 541
      Width = 1118
      ExplicitTop = 541
      ExplicitWidth = 1118
      inherited btnSelecionar: TcxButton
        Left = 892
        Visible = False
        ExplicitLeft = 892
      end
      inherited btnFechar: TcxButton
        Left = 1005
        ExplicitLeft = 1005
      end
      object BtnConferir: TcxButton
        AlignWithMargins = True
        Left = 779
        Top = 0
        Width = 110
        Height = 35
        Hint = 'Confirmar Confer'#234'ncia'
        Margins.Left = 0
        Margins.Top = 0
        Margins.Bottom = 5
        Align = alRight
        Caption = 'Confirmar'
        Enabled = False
        OptionsImage.Glyph.SourceDPI = 96
        OptionsImage.Glyph.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE90000000467414D410000B18F0BFC61050000
          00097048597300000EC300000EC301C76FA864000002BA49444154384F85534B
          48545118FEEE6BDE3AA6A6A2D3A469819956E4C64522648438594A54ABA43030
          DA97549B68E3A6952DDC858B1626844948ABA00764106E4C0A06B39A1C4DC771
          BA8EF3F0DE7B4EFFB933F9D8D477EE7FEE39FFFDFEC7F9FF73B11B5D124DCA7F
          4426D98230C8A16FCC7DB6D2335453ECDA2F4930854A95B7B90AAD2DCEE4F958
          5A9F5ACDDC8C0EF52C0BFDB603DCF10F8E843EF5771F0BA8AA080484C361F87C
          3EA45269E8BA0EBFDF8F8F73E9ECB5731F1A80FE39C1D9910E17DE2C89C2CB24
          E2AD280A19A76099A6BD5664A18725B87FB19DC1D5A7AE50C0FB2458E4AC2363
          D3620C1A65629816644A5F536430C6959FBF33ABEF6399CB4B8F7A5684D99683
          B681892A83613265B10AC661D6163AEC88F4D8B01809E74A74C3587729D2F9D7
          835DB342AFDA5F0916C7692237792992C139AEB7D75164094E2D578F54968E41
          FBFBE39FCB3719EF2295ED60674B426212A7A308D0C8D03029AC280CA524D60E
          D295B81490FF50EBC08426F8B68393B72782F46A156B462EBC4474395430622A
          9411A7A1A9320E064BD01C2C44129B271CC148AFE0DB0E0CC64FA52DBE376572
          E806875B95E0F368F6113C4ED5BE031E972A3A804099075AF582532D8D0F778C
          3D68B34B74E6EE8B67153EAD5BB4CF8E4606957B9C583732F0AA4E50236C301A
          DFBC5FA0BB6354148F9EC8B2A354C41B05A1C6B2A62B9D8DB974F32DFEAE2FE3
          E1F4389AAA8EA0A7AE85EAC0303CF3127A3486FAE2000E7B1AD0D73925BA9094
          BD6E552EF4B9729679B83735649989D1F03B4ADF815F1B09BC89CEA2BE24807B
          2D17F0762A422C4B5CF6526B259191E617E2882C26F06371CD1635ED40FFA10E
          1439BC783CF30A935FA751ED2B476F4D3B926B2696E229EAAFD3B26BD072EBF9
          C5024D394E1BFB27DA85A27895B42F720996B2CEE70F8C22EDD1E9944AD26073
          12E72379D6BF41D56E26A9CD6F7700F803DEA1036896D72C2B0000000049454E
          44AE426082}
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BtnConferirClick
      end
    end
    object PnlControleQuitacao: TPanel
      AlignWithMargins = True
      Left = 7
      Top = 408
      Width = 1112
      Height = 130
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object GrpBxDados: TGroupBox
        Left = 0
        Top = 0
        Width = 772
        Height = 130
        Align = alClient
        Caption = 'Dados registro selecionado '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = -3
        object lblHistorico: TLabel
          Left = 111
          Top = 26
          Width = 45
          Height = 13
          Caption = 'Hist'#243'rico:'
          FocusControl = dbHistorico
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFormaPagamento: TLabel
          Left = 434
          Top = 73
          Width = 106
          Height = 13
          Caption = 'Forma de Pagamento:'
          FocusControl = dbFormaPagamento
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblResponsavel: TLabel
          Left = 434
          Top = 26
          Width = 65
          Height = 13
          Caption = 'Respons'#225'vel:'
          FocusControl = dbResponsavel
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblLancamento: TLabel
          Left = 12
          Top = 26
          Width = 62
          Height = 13
          Caption = 'Lan'#231'amento:'
          FocusControl = dbLancamento
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCaixa: TLabel
          Left = 12
          Top = 73
          Width = 31
          Height = 13
          Caption = 'Caixa:'
          FocusControl = dbCaixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblContaAPagar: TLabel
          Left = 623
          Top = 26
          Width = 74
          Height = 13
          Caption = 'Conta A Pagar:'
          FocusControl = dbContaAPagar
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblContaAReceber: TLabel
          Left = 623
          Top = 73
          Width = 86
          Height = 13
          Caption = 'Conta A Receber:'
          FocusControl = dbContaAReceber
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbHistorico: TDBMemo
          Left = 111
          Top = 43
          Width = 317
          Height = 68
          Color = clMoneyGreen
          DataField = 'historico'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object dbFormaPagamento: TDBEdit
          Left = 434
          Top = 90
          Width = 183
          Height = 21
          Color = clMoneyGreen
          DataField = 'forma_pagto_desc'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbResponsavel: TDBEdit
          Left = 434
          Top = 43
          Width = 183
          Height = 21
          Color = clMoneyGreen
          DataField = 'usuario_responsavel'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object dbLancamento: TDBEdit
          Left = 12
          Top = 43
          Width = 93
          Height = 21
          Color = clMoneyGreen
          DataField = 'lancamento'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbCaixa: TDBEdit
          Left = 12
          Top = 90
          Width = 93
          Height = 21
          Color = clMoneyGreen
          DataField = 'caixa'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object dbContaAPagar: TDBEdit
          Left = 623
          Top = 43
          Width = 93
          Height = 21
          Color = clMoneyGreen
          DataField = 'duplicata'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbContaAReceber: TDBEdit
          Left = 623
          Top = 90
          Width = 93
          Height = 21
          Color = clMoneyGreen
          DataField = 'titulo'
          DataSource = dtsPesquisa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
      object GrpBxTotais: TGroupBox
        AlignWithMargins = True
        Left = 776
        Top = 0
        Width = 336
        Height = 130
        Margins.Left = 4
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alRight
        Caption = 'Totaliza'#231#227'o e Confer'#234'ncia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 779
        object lblValorTotalCredito: TLabel
          Left = 19
          Top = 26
          Width = 76
          Height = 13
          Caption = 'Total Cr'#233'dito:'
          FocusControl = edValorTotalCredito
          Layout = tlBottom
        end
        object lblValorTotalDebito: TLabel
          Left = 121
          Top = 26
          Width = 78
          Height = 13
          Caption = 'Total D'#233'bitos:'
          FocusControl = edValorTotalDebito
          Layout = tlBottom
        end
        object lblValorTotalSaldo: TLabel
          Left = 223
          Top = 26
          Width = 66
          Height = 13
          Caption = 'Total Saldo:'
          FocusControl = edValorTotalSaldo
          Layout = tlBottom
        end
        object lblConfereCredito: TLabel
          Left = 19
          Top = 73
          Width = 72
          Height = 13
          Caption = '(+) Cr'#233'ditos:'
          FocusControl = edConfereCredito
          Font.Charset = ANSI_CHARSET
          Font.Color = 16384
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlBottom
        end
        object lblConfereDebito: TLabel
          Left = 121
          Top = 73
          Width = 64
          Height = 13
          Caption = '(-) D'#233'bitos:'
          FocusControl = edConfereDebito
          Font.Charset = ANSI_CHARSET
          Font.Color = 16384
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlBottom
        end
        object lblConfereSaldo: TLabel
          Left = 223
          Top = 73
          Width = 56
          Height = 13
          Caption = '(=) Saldo:'
          FocusControl = edConfereSaldo
          Font.Charset = ANSI_CHARSET
          Font.Color = 16384
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlBottom
        end
        object edValorTotalCredito: TEdit
          Left = 19
          Top = 43
          Width = 98
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clMoneyGreen
          ReadOnly = True
          TabOrder = 0
          Text = '0,00'
          OnKeyPress = edPesquisarKeyPress
        end
        object edValorTotalDebito: TEdit
          Left = 121
          Top = 43
          Width = 98
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clMoneyGreen
          ReadOnly = True
          TabOrder = 1
          Text = '0,00'
          OnKeyPress = edPesquisarKeyPress
        end
        object edValorTotalSaldo: TEdit
          Left = 223
          Top = 43
          Width = 98
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clMoneyGreen
          ReadOnly = True
          TabOrder = 2
          Text = '0,00'
          OnKeyPress = edPesquisarKeyPress
        end
        object edConfereCredito: TEdit
          Left = 19
          Top = 90
          Width = 98
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = 16384
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          Text = '0,00'
          OnKeyPress = edPesquisarKeyPress
        end
        object edConfereDebito: TEdit
          Left = 121
          Top = 90
          Width = 98
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = 16384
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          Text = '0,00'
          OnKeyPress = edPesquisarKeyPress
        end
        object edConfereSaldo: TEdit
          Left = 223
          Top = 90
          Width = 98
          Height = 21
          Alignment = taRightJustify
          CharCase = ecUpperCase
          Color = clMoneyGreen
          Font.Charset = ANSI_CHARSET
          Font.Color = 16384
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
          Text = '0,00'
          OnKeyPress = edPesquisarKeyPress
        end
      end
    end
    object pnlDicas: TPanel
      AlignWithMargins = True
      Left = 7
      Top = 381
      Width = 1112
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
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
        Width = 378
        Height = 13
        Align = alClient
        Caption = 
          'Pressione a tecla "Espa'#231'o" para marcar e/ou desmarcar o registro' +
          '.'
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
  inherited imgGrid: TImageList
    Top = 344
  end
  object dtsContaCorrente: TDataSource
    Left = 72
    Top = 296
  end
  object DspPesquisa: TDataSetProvider
    Left = 72
    Top = 152
  end
  object CdsPesquisa: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DspPesquisa'
    Left = 72
    Top = 200
  end
end

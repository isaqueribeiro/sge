object frmGeRemessaBoleto: TfrmGeRemessaBoleto
  Left = 394
  Top = 214
  BorderIcons = [biSystemMenu]
  Caption = 'Remessa Boletos'
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 437
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 438
  end
  object Bevel5: TBevel
    Left = 0
    Top = 398
    Width = 912
    Height = 4
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 399
  end
  object pnlFiltro: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 4
      Top = 4
      Width = 904
      Height = 73
      Align = alClient
      Caption = 'Dados para gerar arquivo de remessa de boletos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      DesignSize = (
        904
        73)
      object lblBanco: TLabel
        Left = 8
        Top = 24
        Width = 197
        Height = 13
        Caption = 'Selecionar a entidade financeira (Banco):'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblInicio: TLabel
        Left = 272
        Top = 24
        Width = 57
        Height = 13
        Caption = 'Data Inicial:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblFinal: TLabel
        Left = 384
        Top = 24
        Width = 52
        Height = 13
        Caption = 'Data Final:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblArquivoRemessa: TLabel
        Left = 496
        Top = 24
        Width = 143
        Height = 13
        Caption = 'Nome do arquivo de remessa:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edBanco: TComboBox
        Left = 8
        Top = 40
        Width = 257
        Height = 21
        Style = csDropDownList
        ItemIndex = 0
        TabOrder = 0
        Text = '001 - Banco do Brasil'
        OnChange = edBancoChange
        Items.Strings = (
          '001 - Banco do Brasil'
          '341 - Ita'#250)
      end
      object edArquivoRemessa: TEdit
        Left = 496
        Top = 40
        Width = 393
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edInicio: TJvDateEdit
        Left = 272
        Top = 40
        Width = 105
        Height = 21
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
        OnChange = edInicioChange
      end
      object edFinal: TJvDateEdit
        Left = 384
        Top = 40
        Width = 105
        Height = 21
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
        TabOrder = 2
        OnChange = edInicioChange
      end
    end
  end
  object pnlTitulos: TPanel
    Left = 0
    Top = 81
    Width = 912
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 4
    TabOrder = 1
    object Shape1: TShape
      Left = 4
      Top = 4
      Width = 904
      Height = 20
      Align = alTop
      Brush.Color = clMoneyGreen
      Pen.Color = 9355662
    end
    object Bevel2: TBevel
      Left = 4
      Top = 24
      Width = 904
      Height = 4
      Align = alTop
      Shape = bsSpacer
    end
    object Label5: TLabel
      Left = 8
      Top = 8
      Width = 280
      Height = 13
      Caption = 'Rela'#231#227'o de boletos gerados no per'#237'odo informado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object dbgTitulos: TDBGrid
      Left = 4
      Top = 28
      Width = 904
      Height = 285
      TabStop = False
      Align = alClient
      DataSource = DtsTitulos
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
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = dbgTitulosDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'NumeroDocumento'
          Title.Caption = 'Documento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parc.'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Alignment = taCenter
          Title.Caption = 'Emiss'#227'o'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Alignment = taCenter
          Title.Caption = 'Vencimento'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORREC'
          Title.Caption = 'Valor Documento'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTJUROS'
          Title.Alignment = taCenter
          Title.Caption = '% Juros'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTMULTA'
          Title.Alignment = taCenter
          Title.Caption = '% Multa'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PERCENTDESCONTO'
          Title.Alignment = taCenter
          Title.Caption = '% Desc.'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODBANCO'
          Title.Caption = 'Banco'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOSSONUMERO'
          Title.Caption = 'Nosso N'#250'mero'
          Width = 120
          Visible = True
        end>
    end
  end
  object tlbBotoes: TPanel
    Left = 0
    Top = 402
    Width = 912
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 2
    object Bevel3: TBevel
      Left = 0
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel4: TBevel
      Left = 79
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel6: TBevel
      Left = 201
      Top = 0
      Width = 4
      Height = 35
      Align = alLeft
      Shape = bsSpacer
    end
    object Bevel7: TBevel
      Left = 908
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
    end
    object btnFechar: TcxButton
      Left = 4
      Top = 0
      Width = 75
      Height = 35
      Align = alLeft
      Caption = '&Fechar'
      OptionsImage.ImageIndex = 15
      OptionsImage.Images = DMRecursos.ImgBotoes16x16
      TabOrder = 0
      TabStop = False
      OnClick = btnFecharClick
    end
    object btnGerarRemessa: TcxButton
      Left = 83
      Top = 0
      Width = 118
      Height = 35
      Align = alLeft
      Caption = '&Gerar Remessa'
      Enabled = False
      OptionsImage.ImageIndex = 55
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      TabOrder = 1
      OnClick = btnGerarRemessaClick
    end
    object chkEnviarCancelados: TCheckBox
      Left = 205
      Top = 2
      Width = 260
      Height = 31
      Caption = 'Enviar na remessa os boletos cancelados.'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object btnHistorico: TcxButton
      Left = 833
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Consultar hist'#243'rico de Remessas de Boletos'
      Align = alRight
      Caption = '&Hist'#243'rico'
      Enabled = False
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        424D360800000000000036000000280000002000000010000000010020000000
        000000000000C40E0000C40E0000000000000000000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF00008595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF00FF000064615FFF4746
        45FF262424FF363433FF393736FF464646FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF00008595A5FF4E6074FF3545
        59FF182435FF243346FF273649FF36465AFF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF797978FF636161FFE7CC
        BEFFF9CAB0FFD4AE99FF3C3A39FF3A3838FF00FF000000FF000000FF000000FF
        000000FF000000FF000000FF000000FF000000FF000067788BFF4F6175FFC0CA
        D3FFBDC7D1FF9EACBAFF2A394CFF29384BFF8595A5FF8595A5FF8595A5FF8595
        A5FF8595A5FF8595A5FF8595A5FF8595A5FF8595A5FF7F7C79FFD1CBC7FFFFF3
        ECFFFEE4D5FFFCD0B9FFC4A491FF2F2F2EFF59775CFF506853FF475A49FF4051
        42FF38473AFF303D31FF29342AFF222C23FF1C251DFF6A7B8EFFC0CAD3FFEFF2
        F4FFDCE2E7FFC5CED6FF92A1B0FF202E40FF596B7FFF4C5E72FF415266FF394A
        5EFF314155FF28374AFF212F41FF1B2839FF152131FF9F9C9AFFFBF9F7FFFFFA
        F7FF262423FF262220FFF7C7ACFF232121FF60A362FF559355FF4A8149FF457A
        48FF417341FF3C6C3CFF376538FF376139FF1C251DFF8C9BABFFF6F8F9FFF7F9
        FAFF172334FF152131FFB9C4CEFF152131FF768799FF68798CFF57697DFF5365
        79FF4C5E72FF47586CFF415266FF3F5064FF152131FF989797FFF3F3F1FFFFFD
        FBFF3D3B3AFFFFF5EFFFC5B9ADFF595553FF68AA6BFF65A869FF61A264FF5A96
        5EFF558C58FF4D824FFF49784BFF39633BFF222C23FF8797A7FFEFF2F4FFFBFC
        FCFF2B3A4DFFF1F4F6FFAAB6C2FF435468FF7F8FA0FF7D8D9EFF77889AFF6D7E
        91FF657689FF5A6C80FF536579FF415266FF1B2839FF746E6BFF929191FFF1F0
        F0FFF2EEEBFFDDD6D2FF5B5E5AFF7FAE82FF70B374FF71B776FF6EB272FF67A8
        6AFF619E64FF59925BFF4E8451FF3D6C3DFF29342AFF5B6D81FF8191A2FFEDF0
        F2FFE9EDF0FFCDD5DCFF4B5C70FF8C9BABFF8998A8FF8C9BABFF8797A7FF7E8E
        9FFF748597FF6A7B8EFF5C6E82FF47586CFF212F41FF00FF000075706DFF9797
        97FF8B8A8AFF7F7E7DFF709A75FF95CF9BFF7CBF81FF78BB7BFF74BA7AFF6FB4
        75FF69AD6FFF62A165FF578E58FF427342FF303D31FF8595A5FF5D6F83FF8797
        A7FF7A8A9CFF6C7D90FF7A8A9CFFACB8C4FF96A4B3FF91A0AFFF8F9EADFF8A99
        A9FF8292A3FF768799FF66778AFF4C5E72FF28374AFF00FF000000FF000000FF
        0000595D59FF00FF000075AB7CFF9BD2A0FF85C78AFF7EC385FF7BBF81FF76BD
        7CFF73B777FF6AAE6EFF5E9A60FF467C46FF38473AFF8595A5FF8595A5FF8595
        A5FF4A5B6FFF8595A5FF8696A6FFB0BCC7FFA0ADBAFF9AA8B6FF96A4B3FF92A1
        B0FF8D9CACFF8393A4FF708193FF536579FF314155FF00FF000000FF000000FF
        0000787978FF787878FF699E73FFA3D5A9FF8ECA94FF85C88CFF80C586FF7DC0
        82FF76BC7DFF70B574FF65A568FF4D854CFF405142FF8595A5FF8595A5FF8595
        A5FF67788BFF67788BFF7B8B9CFFB7C2CCFFA6B3C0FFA1AEBBFF9CAAB8FF97A5
        B4FF92A1B0FF8A99A9FF7B8B9CFF5B6D81FF394A5EFF00FF000000FF000000FF
        00001C201CFF00FF000071A77CFFABDAB0FF619465FF5F9462FF5F9863FF629E
        68FF67A36CFF6AA76EFF6BAA70FF4F8E52FF475A49FF8595A5FF8595A5FF8595
        A5FF131E2EFF8595A5FF8393A4FFBEC8D1FF6F8092FF6E7F91FF708193FF7687
        99FF7B8B9CFF7F8FA0FF8191A2FF637487FF415266FF00FF000000FF000000FF
        0000787978FF808080FF79AF85FFB3DDB8FF5B8A5EFF7FB684FF88BE8EFF94C7
        9AFFA1CFA5FFA6D5ABFF67A56DFF579557FF4E6250FF8595A5FF8595A5FF8595
        A5FF67788BFF6F8092FF8D9CACFFC4CDD6FF66778AFF91A0AFFF9BA9B7FFA6B3
        C0FFB2BDC8FFB8C3CDFF7D8D9EFF6A7B8EFF495A6EFF00FF000000FF000000FF
        0000202520FF00FF00007FB68DFFB9E1BFFF59865CFF73A877FF79AE7DFF85B9
        88FF8FC493FF99CA9FFF65A168FF5A9B59FF546956FF8595A5FF8595A5FF8595
        A5FF162232FF8595A5FF95A3B2FFCAD2DAFF637487FF8393A4FF8A99A9FF96A4
        B3FFA2AFBCFFABB7C3FF78899BFF6E7F91FF4E6074FF00FF000000FF000000FF
        0000717271FF808080FF85BC93FFBFE3C5FF5E8961FF57855AFF58865BFF5B8D
        5EFF5E9361FF619864FF639F67FF5EA461FF586E5AFF8595A5FF8595A5FF8595
        A5FF607184FF6F8092FF9BA9B7FFCDD5DCFF67788BFF617285FF627386FF6879
        8CFF6D7E91FF718294FF768799FF768799FF536579FF00FF000000FF000000FF
        0000202520FF00FF000089C198FFC1E5C6FFC0E4C6FFBBE2C0FFB7DFBCFFAEDA
        B3FFA1D3A6FF8FC794FF7FBD84FF7DB980FF586E5AFF8595A5FF8595A5FF8595
        A5FF162232FF8595A5FFA1AEBBFFCFD7DEFFCED6DDFFCBD3DBFFC6CFD7FFBFC9
        D2FFB4BFCAFFA4B1BEFF96A4B3FF92A1B0FF536579FF00FF000000FF000000FF
        0000101510FF808080FF89C198FF88BF96FF86BD92FF83BA8EFF81B78AFF7EB4
        85FF7BB080FF78AD7BFF76AA77FF73A773FF71A56FFF8595A5FF8595A5FF8595
        A5FF0A121EFF6F8092FFA1AEBBFF9EACBAFF9BA9B7FF98A6B4FF95A3B2FF909F
        AEFF8C9BABFF8998A8FF8494A5FF8191A2FF7E8E9FFF}
      OptionsImage.NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      TabStop = False
    end
  end
  object DspTitulos: TDataSetProvider
    DataSet = IbQryTitulos
    UpdateMode = upWhereChanged
    Left = 104
    Top = 264
  end
  object CdsTitulos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptInput
        Size = 18
      end
      item
        DataType = ftInteger
        Name = 'BANCO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAINICIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAFINAL'
        ParamType = ptInput
      end>
    ProviderName = 'DspTitulos'
    OnCalcFields = CdsTitulosCalcFields
    Left = 136
    Top = 264
    object CdsTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Required = True
    end
    object CdsTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Required = True
      DisplayFormat = '###00000'
    end
    object CdsTitulosPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object CdsTitulosPARCELA_MAXIMA: TSmallintField
      FieldName = 'PARCELA_MAXIMA'
      ReadOnly = True
    end
    object CdsTitulosCODBANCO: TIntegerField
      FieldName = 'CODBANCO'
    end
    object CdsTitulosNOSSONUMERO: TStringField
      FieldName = 'NOSSONUMERO'
    end
    object CdsTitulosCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsTitulosTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsTitulosDTEMISS: TDateField
      Alignment = taCenter
      FieldName = 'DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosDTVENC: TDateField
      Alignment = taCenter
      FieldName = 'DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosVALORREC: TBCDField
      FieldName = 'VALORREC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosPERCENTJUROS: TCurrencyField
      FieldName = 'PERCENTJUROS'
      DisplayFormat = ',0.00#'
    end
    object CdsTitulosPERCENTMULTA: TCurrencyField
      FieldName = 'PERCENTMULTA'
      DisplayFormat = ',0.00#'
    end
    object CdsTitulosPERCENTDESCONTO: TCurrencyField
      FieldName = 'PERCENTDESCONTO'
      DisplayFormat = ',0.00#'
    end
    object CdsTitulosVALORRECTOT: TBCDField
      FieldName = 'VALORRECTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosVALORSALDO: TBCDField
      FieldName = 'VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object CdsTitulosDATAPROCESSOBOLETO: TDateField
      Alignment = taCenter
      FieldName = 'DATAPROCESSOBOLETO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object CdsTitulosANOVENDA: TSmallintField
      FieldName = 'ANOVENDA'
    end
    object CdsTitulosNUMVENDA: TIntegerField
      FieldName = 'NUMVENDA'
    end
    object CdsTitulosSITUACAO: TSmallintField
      FieldName = 'SITUACAO'
    end
    object CdsTitulosSERIE: TStringField
      FieldName = 'SERIE'
      ReadOnly = True
      Size = 4
    end
    object CdsTitulosNFE: TLargeintField
      FieldName = 'NFE'
      ReadOnly = True
    end
    object CdsTitulosINSCEST: TStringField
      FieldName = 'INSCEST'
      ReadOnly = True
    end
    object CdsTitulosNOME: TStringField
      FieldName = 'NOME'
      ReadOnly = True
      Size = 100
    end
    object CdsTitulosFONE: TStringField
      FieldName = 'FONE'
      ReadOnly = True
      Size = 11
    end
    object CdsTitulosENDER: TStringField
      FieldName = 'ENDER'
      ReadOnly = True
      Size = 262
    end
    object CdsTitulosENDER_DESC: TStringField
      FieldName = 'ENDER_DESC'
      ReadOnly = True
      Size = 250
    end
    object CdsTitulosENDER_NUM: TStringField
      FieldName = 'ENDER_NUM'
      ReadOnly = True
      Size = 10
    end
    object CdsTitulosBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ReadOnly = True
      Size = 100
    end
    object CdsTitulosCIDADE: TStringField
      FieldName = 'CIDADE'
      ReadOnly = True
      Size = 30
    end
    object CdsTitulosUF: TStringField
      FieldName = 'UF'
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object CdsTitulosCEP: TStringField
      FieldName = 'CEP'
      ReadOnly = True
      Size = 8
    end
    object CdsTitulosEMAIL: TStringField
      FieldName = 'EMAIL'
      ReadOnly = True
      Size = 60
    end
    object CdsTitulosNumeroDocumento: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'NumeroDocumento'
    end
  end
  object DtsTitulos: TDataSource
    DataSet = CdsTitulos
    Left = 168
    Top = 264
  end
  object frrRemessa: TfrxReport
    Version = '6.3.7'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40617.958282361100000000
    ReportOptions.LastChange = 40617.990347060190000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrRemessaGetValue
    Left = 168
    Top = 297
    Datasets = <
      item
        DataSet = frdRemessa
        DataSetName = 'Remessa'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Banco'
        Value = #39'000 - Entidade Financeira'#39
      end
      item
        Name = 'Arquivo'
        Value = #39'Remessa.rem'#39
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object bndReportTitle: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 90.708720000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Top = 18.897650000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Rela'#231#227'o de T'#237'tulos do Arquivos de Remessa')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 37.795300000000000000
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Banco: [Banco]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 60.472480000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Arquivo: [Arquivo]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        DataSet = frdRemessa
        DataSetName = 'Remessa'
        RowCount = 0
        object RemessaCNPJ: TfrxMemoView
          AllowVectorExport = True
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataField = 'CNPJ'
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Remessa."CNPJ"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Remessa."Sacado"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Remessa."Documento"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Remessa."Data Vencimento"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[FormatFloat('#39'###,###,##0.00'#39',<Remessa."Valor Documento">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            '[Remessa."Nosso Numero"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 7.559060000000000000
        Top = 362.834880000000000000
        Width = 718.110700000000000000
      end
      object bndHeader: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            'CNPJ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          Memo.UTF8W = (
            ' Sacado')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 389.291590000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 627.401980000000000000
          Top = 3.779530000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Documento')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 480.000310000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = clBtnFace
          HAlign = haCenter
          Memo.UTF8W = (
            'Nosso N'#250'mero')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndReportSummary: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 3.779530000000000000
          Width = 154.960730000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Remessa."Valor Documento">,bndMasterData,2)]')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 563.149970000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[COUNT(bndMasterData,2)] lan'#231'amento(s) presente(s) no arquivo')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataSet = frdRemessa
          DataSetName = 'Remessa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Tahoma'
          Highlight.Font.Style = []
          Highlight.Condition = '<Remessa."Situacao">=0'
          Highlight.FillType = ftBrush
          Highlight.Frame.Typ = []
          Memo.UTF8W = (
            ' * Boleto(s) cancelado(s).')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frdRemessa: TfrxDBDataset
    UserName = 'Remessa'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ANOLANC=Ano'
      'NUMLANC=Lancamento'
      'PARCELA=Parcela'
      'PARCELA_MAXIMA=Parcelas'
      'CODBANCO=Banco'
      'NOSSONUMERO=Nosso Numero'
      'CNPJ=CNPJ'
      'TIPPAG=TipoPagto'
      'DTEMISS=Data Emissao'
      'DTVENC=Data Vencimento'
      'VALORREC=Valor Documento'
      'PERCENTJUROS=% Juros'
      'PERCENTMULTA=% Multa'
      'PERCENTDESCONTO=% Desconto'
      'VALORRECTOT=VALORRECTOT'
      'VALORSALDO=Valor Saldo'
      'DATAPROCESSOBOLETO=Data Geracao Boleto'
      'INSCEST=INSCEST'
      'NOME=Sacado'
      'FONE=Fone'
      'ANOVENDA=AnoVenda'
      'NUMVENDA=NumVenda'
      'SERIE=Serie'
      'NFE=NFe'
      'SITUACAO=Situacao'
      'NumeroDocumento=Documento'
      'ENDER=Endereco'
      'ENDER_DESC=ENDER_DESC'
      'ENDER_NUM=ENDER_NUM'
      'BAIRRO=Bairro'
      'CIDADE=Cidade'
      'UF=UF'
      'CEP=CEP'
      'EMAIL=E-mail')
    DataSet = CdsTitulos
    BCDToCurrency = False
    Left = 136
    Top = 297
  end
  object ACBrBoleto: TACBrBoleto
    Banco.TamanhoMaximoNossoNum = 10
    Banco.TipoCobranca = cobNenhum
    Banco.LayoutVersaoArquivo = 0
    Banco.LayoutVersaoLote = 0
    Banco.CasasDecimaisMoraJuros = 2
    Cedente.TipoInscricao = pJuridica
    Cedente.IdentDistribuicao = tbBancoDistribui
    NumeroArquivo = 0
    ACBrBoletoFC = ACBrBoletoFCFR
    Left = 344
    Top = 245
  end
  object ACBrBoletoFCFR: TACBrBoletoFCFR
    LayOut = lPadraoEntrega
    ModoThread = False
    IncorporarBackgroundPdf = False
    IncorporarFontesPdf = False
    Left = 376
    Top = 245
  end
  object fdUpdBancos: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBBANCO_BOLETO'
      '(BCO_CODIGO, BCO_COD, EMPRESA, BCO_CARTEIRA, '
      '  BCO_NOME, BCO_AGENCIA, BCO_CC, BCO_CODIGO_CEDENTE, '
      '  BCO_CHAVE, BCO_GERAR_BOLETO, BCO_NOSSO_NUM_INICIO, '
      '  BCO_NOSSO_NUM_FINAL, BCO_NOSSO_NUM_PROXIMO, BCO_CONFG_1, '
      '  BCO_CONFG_2, BCO_SEQUENCIAL_REM, BCO_DIRETORIO_REMESSA, '
      
        '  BCO_DIRETORIO_RETORNO, BCO_PERCENTUAL_JUROS, BCO_PERCENTUAL_MO' +
        'RA, '
      '  BCO_DIA_PROTESTO, BCO_MSG_INSTRUCAO, BCO_LAYOUT_REMESSA, '
      '  BCO_LAYOUT_RETORNO)'
      
        'VALUES (:NEW_BCO_CODIGO, :NEW_BCO_COD, :NEW_EMPRESA, :NEW_BCO_CA' +
        'RTEIRA, '
      
        '  :NEW_BCO_NOME, :NEW_BCO_AGENCIA, :NEW_BCO_CC, :NEW_BCO_CODIGO_' +
        'CEDENTE, '
      
        '  :NEW_BCO_CHAVE, :NEW_BCO_GERAR_BOLETO, :NEW_BCO_NOSSO_NUM_INIC' +
        'IO, '
      
        '  :NEW_BCO_NOSSO_NUM_FINAL, :NEW_BCO_NOSSO_NUM_PROXIMO, :NEW_BCO' +
        '_CONFG_1, '
      
        '  :NEW_BCO_CONFG_2, :NEW_BCO_SEQUENCIAL_REM, :NEW_BCO_DIRETORIO_' +
        'REMESSA, '
      
        '  :NEW_BCO_DIRETORIO_RETORNO, :NEW_BCO_PERCENTUAL_JUROS, :NEW_BC' +
        'O_PERCENTUAL_MORA, '
      
        '  :NEW_BCO_DIA_PROTESTO, :NEW_BCO_MSG_INSTRUCAO, :NEW_BCO_LAYOUT' +
        '_REMESSA, '
      '  :NEW_BCO_LAYOUT_RETORNO)')
    ModifySQL.Strings = (
      'UPDATE TBBANCO_BOLETO'
      
        'SET BCO_CODIGO = :NEW_BCO_CODIGO, BCO_COD = :NEW_BCO_COD, EMPRES' +
        'A = :NEW_EMPRESA, '
      '  BCO_CARTEIRA = :NEW_BCO_CARTEIRA, BCO_NOME = :NEW_BCO_NOME, '
      
        '  BCO_AGENCIA = :NEW_BCO_AGENCIA, BCO_CC = :NEW_BCO_CC, BCO_CODI' +
        'GO_CEDENTE = :NEW_BCO_CODIGO_CEDENTE, '
      
        '  BCO_CHAVE = :NEW_BCO_CHAVE, BCO_GERAR_BOLETO = :NEW_BCO_GERAR_' +
        'BOLETO, '
      
        '  BCO_NOSSO_NUM_INICIO = :NEW_BCO_NOSSO_NUM_INICIO, BCO_NOSSO_NU' +
        'M_FINAL = :NEW_BCO_NOSSO_NUM_FINAL, '
      
        '  BCO_NOSSO_NUM_PROXIMO = :NEW_BCO_NOSSO_NUM_PROXIMO, BCO_CONFG_' +
        '1 = :NEW_BCO_CONFG_1, '
      
        '  BCO_CONFG_2 = :NEW_BCO_CONFG_2, BCO_SEQUENCIAL_REM = :NEW_BCO_' +
        'SEQUENCIAL_REM, '
      
        '  BCO_DIRETORIO_REMESSA = :NEW_BCO_DIRETORIO_REMESSA, BCO_DIRETO' +
        'RIO_RETORNO = :NEW_BCO_DIRETORIO_RETORNO, '
      
        '  BCO_PERCENTUAL_JUROS = :NEW_BCO_PERCENTUAL_JUROS, BCO_PERCENTU' +
        'AL_MORA = :NEW_BCO_PERCENTUAL_MORA, '
      
        '  BCO_DIA_PROTESTO = :NEW_BCO_DIA_PROTESTO, BCO_MSG_INSTRUCAO = ' +
        ':NEW_BCO_MSG_INSTRUCAO, '
      
        '  BCO_LAYOUT_REMESSA = :NEW_BCO_LAYOUT_REMESSA, BCO_LAYOUT_RETOR' +
        'NO = :NEW_BCO_LAYOUT_RETORNO'
      'WHERE BCO_CODIGO = :OLD_BCO_CODIGO')
    DeleteSQL.Strings = (
      'DELETE FROM TBBANCO_BOLETO'
      'WHERE BCO_CODIGO = :OLD_BCO_CODIGO')
    FetchRowSQL.Strings = (
      
        'SELECT BCO_CODIGO, BCO_COD, EMPRESA, BCO_CARTEIRA, BCO_NOME, BCO' +
        '_AGENCIA, '
      '  BCO_CC, BCO_CODIGO_CEDENTE, BCO_CHAVE, BCO_GERAR_BOLETO, '
      
        '  BCO_NOSSO_NUM_INICIO, BCO_NOSSO_NUM_FINAL, BCO_NOSSO_NUM_PROXI' +
        'MO, '
      
        '  BCO_CONFG_1, BCO_CONFG_2, BCO_SEQUENCIAL_REM, BCO_DIRETORIO_RE' +
        'MESSA, '
      
        '  BCO_DIRETORIO_RETORNO, BCO_PERCENTUAL_JUROS, BCO_PERCENTUAL_MO' +
        'RA, '
      '  BCO_DIA_PROTESTO, BCO_MSG_INSTRUCAO, BCO_LAYOUT_REMESSA, '
      '  BCO_LAYOUT_RETORNO'
      'FROM TBBANCO_BOLETO'
      'WHERE BCO_CODIGO = :BCO_CODIGO')
    Left = 88
    Top = 168
  end
  object fdQryBancos: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = fdUpdBancos
    SQL.Strings = (
      'Select'
      '    b.bco_codigo'
      '  , lpad(b.bco_cod, 3, '#39'0'#39') || '#39' - '#39' ||'
      '    b.bco_nome ||'
      
        '    coalesce('#39' - AG. '#39'  || nullif(trim(b.bco_agencia), '#39#39'), '#39#39') ' +
        '||'
      
        '    coalesce('#39' - C/C. '#39' || nullif(trim(b.bco_cc), '#39#39'), '#39#39')  as b' +
        'co_nome_agencia_conta'
      '  , b.bco_cod'
      '  , b.bco_carteira'
      '  , b.bco_nome'
      '  , b.bco_agencia'
      '  , b.bco_cc'
      '  , b.bco_codigo_cedente'
      '  , b.bco_chave'
      '  , b.bco_gerar_boleto'
      '  , b.bco_nosso_num_inicio'
      '  , b.bco_nosso_num_final'
      '  , b.bco_nosso_num_proximo'
      '  , b.BCO_CONFG_1'
      '  , b.BCO_CONFG_2'
      '  , b.bco_sequencial_rem'
      '  , b.bco_diretorio_remessa'
      '  , b.bco_diretorio_retorno'
      '  , b.bco_percentual_juros'
      '  , b.bco_percentual_mora'
      '  , b.bco_dia_protesto'
      '  , b.bco_msg_instrucao'
      '  , b.bco_layout_remessa'
      '  , b.bco_layout_retorno'
      '  , b.empresa'
      '  , e.rzsoc'
      '  , e.nmfant'
      '  , e.ie'
      '  , e.im'
      '  , e.ender'
      '  , e.complemento'
      '  , e.numero_end'
      '  , e.bairro'
      '  , e.cep'
      '  , e.cidade'
      '  , e.uf'
      '  , e.email'
      'from TBBANCO_BOLETO b'
      '  inner join TBEMPRESA e on (b.empresa = e.cnpj)'
      ''
      'where b.bco_gerar_boleto = 1'
      '  and b.empresa = :empresa'
      ''
      'order by'
      '    1')
    Left = 56
    Top = 168
    ParamData = <
      item
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object IbQryTitulos: TFDQuery
    CachedUpdates = True
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    UpdateObject = UpdTitulos
    SQL.Strings = (
      'Select'
      '    r.anolanc'
      '  , r.numlanc'
      '  , r.parcela'
      '  , coalesce(('
      '     Select'
      '       max(x.parcela)'
      '     from TBCONTREC x'
      '     where x.anovenda = r.anovenda'
      '       and x.numvenda = r.numvenda'
      '    ), r.parcela) as parcela_maxima'
      '  , r.codbanco'
      '  , r.nossonumero'
      '  , r.cnpj'
      '  , r.tippag'
      '  , r.dtemiss'
      '  , r.dtvenc'
      '  , r.valorrec'
      '  , r.percentjuros'
      '  , r.percentmulta'
      '  , r.percentdesconto'
      '  , r.valorrectot'
      '  , r.valorsaldo'
      '  , r.dataprocessoboleto'
      '  , r.anovenda'
      '  , r.numvenda'
      '  , r.situacao'
      '  , v.serie'
      '  , v.nfe'
      '  , c.inscest'
      '  , c.nome'
      '  , c.fone'
      '  , c.ender || '#39', '#39' || c.Numero_end as ender'
      '  , c.ender as ender_desc'
      '  , c.numero_end as ender_num'
      '  , c.bairro'
      '  , c.cidade'
      '  , c.uf'
      '  , c.cep'
      '  , c.email'
      'from TBCONTREC r'
      '  inner join TBCLIENTE c on ( r.cliente = c.codigo )'
      
        '  left join TBVENDAS v on (v.ano = r.anovenda and v.codcontrol =' +
        ' r.numvenda)'
      'where (r.empresa = :empresa)'
      '  and (r.baixado = 0)'
      '  and (r.enviado = 0)'
      '  and (r.codbanco = :banco)'
      '  and (r.dataprocessoboleto between :dataInicial and :dataFinal)'
      'order by'
      '    r.nossonumero'
      '  , r.numlanc'
      '  , r.parcela')
    Left = 40
    Top = 264
    ParamData = <
      item
        Position = 1
        Name = 'EMPRESA'
        DataType = ftString
        ParamType = ptInput
        Size = 18
      end
      item
        Position = 2
        Name = 'BANCO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'DATAINICIAL'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'DATAFINAL'
        DataType = ftDate
        ParamType = ptInput
      end>
  end
  object UpdTitulos: TFDUpdateSQL
    Connection = DMBusiness.fdConexao
    InsertSQL.Strings = (
      'INSERT INTO TBCONTREC'
      '(ANOLANC, NUMLANC, CNPJ, TIPPAG, DTEMISS, '
      '  DTVENC, VALORREC, VALORRECTOT, VALORSALDO, '
      '  PARCELA, CODBANCO, NOSSONUMERO, PERCENTJUROS, '
      '  PERCENTMULTA, PERCENTDESCONTO, DATAPROCESSOBOLETO, '
      '  ANOVENDA, NUMVENDA, SITUACAO)'
      
        'VALUES (:NEW_ANOLANC, :NEW_NUMLANC, :NEW_CNPJ, :NEW_TIPPAG, :NEW' +
        '_DTEMISS, '
      
        '  :NEW_DTVENC, :NEW_VALORREC, :NEW_VALORRECTOT, :NEW_VALORSALDO,' +
        ' '
      
        '  :NEW_PARCELA, :NEW_CODBANCO, :NEW_NOSSONUMERO, :NEW_PERCENTJUR' +
        'OS, '
      
        '  :NEW_PERCENTMULTA, :NEW_PERCENTDESCONTO, :NEW_DATAPROCESSOBOLE' +
        'TO, '
      '  :NEW_ANOVENDA, :NEW_NUMVENDA, :NEW_SITUACAO)')
    ModifySQL.Strings = (
      'UPDATE TBCONTREC'
      
        'SET ANOLANC = :NEW_ANOLANC, NUMLANC = :NEW_NUMLANC, CNPJ = :NEW_' +
        'CNPJ, '
      
        '  TIPPAG = :NEW_TIPPAG, DTEMISS = :NEW_DTEMISS, DTVENC = :NEW_DT' +
        'VENC, '
      '  VALORREC = :NEW_VALORREC, VALORRECTOT = :NEW_VALORRECTOT, '
      
        '  VALORSALDO = :NEW_VALORSALDO, PARCELA = :NEW_PARCELA, CODBANCO' +
        ' = :NEW_CODBANCO, '
      
        '  NOSSONUMERO = :NEW_NOSSONUMERO, PERCENTJUROS = :NEW_PERCENTJUR' +
        'OS, '
      
        '  PERCENTMULTA = :NEW_PERCENTMULTA, PERCENTDESCONTO = :NEW_PERCE' +
        'NTDESCONTO, '
      
        '  DATAPROCESSOBOLETO = :NEW_DATAPROCESSOBOLETO, ANOVENDA = :NEW_' +
        'ANOVENDA, '
      '  NUMVENDA = :NEW_NUMVENDA, SITUACAO = :NEW_SITUACAO'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    DeleteSQL.Strings = (
      'DELETE FROM TBCONTREC'
      'WHERE ANOLANC = :OLD_ANOLANC AND NUMLANC = :OLD_NUMLANC')
    FetchRowSQL.Strings = (
      
        'SELECT ANOLANC, NUMLANC, EMPRESA, CLIENTE, CNPJ, FORMA_PAGTO, TI' +
        'PPAG, '
      '  HISTORIC, NUMREC, DTEMISS, DTVENC, DTREC, DOCBAIX, VALORREC, '
      '  VALORMULTA, VALORRECTOT, VALORSALDO, NUMCONTRATO, PARCELA, '
      
        '  STATUS, CODBANCO, BANCO_FEBRABAN, NOSSONUMERO, ESPECIE_BOLETO,' +
        ' '
      
        '  REMESSA, PERCENTJUROS, PERCENTMULTA, PERCENTDESCONTO, DATAPROC' +
        'ESSOBOLETO, '
      '  BAIXADO, ENVIADO, ANOVENDA, NUMVENDA, ANOOS, NUMOS, CODTPREC, '
      '  SITUACAO, LOTE, COMPETENCIA_APURACAO'
      'FROM TBCONTREC'
      'WHERE ANOLANC = :ANOLANC AND NUMLANC = :NUMLANC')
    Left = 72
    Top = 264
  end
end

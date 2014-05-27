object frmGrContReceb: TfrmGrContReceb
  Left = 222
  Top = 152
  Width = 958
  Height = 378
  Caption = 'Contas a Receber'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 942
    Height = 307
    Align = alClient
    TabOrder = 0
    object dbgrdContRec: TDBGrid
      Left = 1
      Top = 1
      Width = 940
      Height = 247
      Align = alClient
      DataSource = dtsrcContRec
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgrdContRecKeyDown
      OnTitleClick = dbgrdContRecTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMLANC'
          Title.Alignment = taCenter
          Title.Caption = 'Lanc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 45
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'NUMCONTRATO'
          Title.Alignment = taCenter
          Title.Caption = 'Contrato'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PARCELA'
          Title.Alignment = taCenter
          Title.Caption = 'Parcela'
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
          FieldName = 'LkCliente'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 321
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORRECTOT'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Rec.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORREC'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Parc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTPAG'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Rec.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Venc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Emiss'#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end>
    end
    object pnlBotaoGrid: TPanel
      Left = 1
      Top = 248
      Width = 940
      Height = 58
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 688
        Top = 0
        Width = 252
        Height = 58
        Align = alRight
        Caption = 'Pesquisar ...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label13: TLabel
          Left = 6
          Top = 20
          Width = 44
          Height = 13
          Caption = 'Cliente:'
        end
        object SpeedButton1: TSpeedButton
          Left = 207
          Top = 16
          Width = 29
          Height = 27
          Hint = 'Clique aqui para executar a pesquisa ...'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
            300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
            330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
            333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
            339977FF777777773377000BFB03333333337773FF733333333F333000333333
            3300333777333333337733333333333333003333333333333377333333333333
            333333333333333333FF33333333333330003333333333333777333333333333
            3000333333333333377733333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = SpeedButton1Click
        end
        object edt: TEdit
          Left = 55
          Top = 21
          Width = 148
          Height = 21
          Hint = 'Digite aqui a palavra-chave da pesquisa'
          CharCase = ecUpperCase
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 940
      Height = 247
      Align = alClient
      DataSource = dtsrcContRec
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgrdContRecKeyDown
      OnTitleClick = dbgrdContRecTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NUMLANC'
          Title.Alignment = taCenter
          Title.Caption = 'Lanc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 45
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'DOCNF'
          Title.Alignment = taCenter
          Title.Caption = 'Venda'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 66
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'PARC'
          Title.Alignment = taCenter
          Title.Caption = 'Parcela'
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
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Cliente'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 321
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORRECTOT'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Rec.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORREC'
          Title.Alignment = taCenter
          Title.Caption = 'Valor Parc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTREC'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Rec.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTVENC'
          Title.Alignment = taCenter
          Title.Caption = 'Dt. Venc.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DTEMISS'
          Title.Alignment = taCenter
          Title.Caption = 'Dt.Emiss'#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 74
          Visible = True
        end>
    end
  end
  object tlbrGridFornec: TToolBar
    Left = 0
    Top = 307
    Width = 942
    Height = 35
    Align = alBottom
    ButtonHeight = 31
    Caption = #39
    TabOrder = 1
    object btbtnIncluir: TBitBtn
      Left = 0
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Incluir'
      TabOrder = 0
      OnClick = btbtnIncluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
        0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
        00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
        00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
        F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
        F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
        FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
        0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
        00337777FFFF77FF7733EEEE0000000003337777777777777333}
      NumGlyphs = 2
    end
    object btbtnAlterar: TBitBtn
      Left = 75
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btbtnAlterarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
        000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
        00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
        F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
        0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
        FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
        FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
        0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
        00333377737FFFFF773333303300000003333337337777777333}
      NumGlyphs = 2
    end
    object btbtnExcluir: TBitBtn
      Left = 150
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btbtnExcluirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object ToolButton1: TToolButton
      Left = 225
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Left = 233
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Baixa'
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        04000000000080000000120B0000120B00001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF00C0C0C00000FFFF00FF000000C0C0C000FFFF0000FFFFFF00DAD0D0D0D0DA
        DADAADADADADA00DADADDADADADAD000DADAADADADADA0B70DADDADADADAD0B8
        0ADA00000000AD0B70AD0FFFFFF0DA0B80DA0F7FF8F0ADA0B70D0FFF00000000
        B00A0F7F0FF0FFF001100FFF0FF0F7F0000A44444444FFF0ADAD44444444F7F0
        DADAADAD0FFFFFF0ADADDADA44444444DADAADAD44444444ADAD}
    end
    object ToolButton2: TToolButton
      Left = 308
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 316
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object btbtnFechar: TBitBtn
      Left = 324
      Top = 2
      Width = 75
      Height = 31
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btbtnFecharClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033BBBBBBBBBB
        BB33337777777777777F33BB00BBBBBBBB33337F77333333F37F33BB0BBBBBB0
        BB33337F73F33337FF7F33BBB0BBBB000B33337F37FF3377737F33BBB00BB00B
        BB33337F377F3773337F33BBBB0B00BBBB33337F337F7733337F33BBBB000BBB
        BB33337F33777F33337F33EEEE000EEEEE33337F3F777FFF337F33EE0E80000E
        EE33337F73F77773337F33EEE0800EEEEE33337F37377F33337F33EEEE000EEE
        EE33337F33777F33337F33EEEEE00EEEEE33337F33377FF3337F33EEEEEE00EE
        EE33337F333377F3337F33EEEEEE00EEEE33337F33337733337F33EEEEEEEEEE
        EE33337FFFFFFFFFFF7F33EEEEEEEEEEEE333377777777777773}
      NumGlyphs = 2
    end
    object ToolButton4: TToolButton
      Left = 399
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 407
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 415
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object spdbtnSoma: TSpeedButton
      Left = 423
      Top = 2
      Width = 34
      Height = 31
      Hint = 'Total Cadastrados'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = spdbtnSomaClick
    end
  end
  object ibdtstContRec: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBCONTREC'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    InsertSQL.Strings = (
      'insert into TBCONTREC'
      
        '  (NUMLANC, CNPJ, TIPPAG, HISTORIC, NUMREC, DOCNF, PARC, DTEMISS' +
        ', DTVENC, '
      '   DTREC, DOCBAIX, VALORREC, VALORMULTA, VALORRECTOT)'
      'values'
      
        '  (:NUMLANC, :CNPJ, :TIPPAG, :HISTORIC, :NUMREC, :DOCNF, :PARC, ' +
        ':DTEMISS, '
      
        '   :DTVENC, :DTREC, :DOCBAIX, :VALORREC, :VALORMULTA, :VALORRECT' +
        'OT)')
    RefreshSQL.Strings = (
      'Select '
      '  NUMLANC,'
      '  CNPJ,'
      '  TIPPAG,'
      '  HISTORIC,'
      '  NUMREC,'
      '  DOCNF,'
      '  PARC,'
      '  DTEMISS,'
      '  DTVENC,'
      '  DTREC,'
      '  DOCBAIX,'
      '  VALORREC,'
      '  VALORMULTA,'
      '  VALORRECTOT'
      'from TBCONTREC '
      'where'
      '  NUMLANC = :NUMLANC')
    SelectSQL.Strings = (
      'select * from TBCONTREC R, TBCLIENTE C'
      'where R.CNPJ=C.CNPJ'
      'order by NUMLANC')
    ModifySQL.Strings = (
      'update TBCONTREC'
      'set'
      '  NUMLANC = :NUMLANC,'
      '  CNPJ = :CNPJ,'
      '  TIPPAG = :TIPPAG,'
      '  HISTORIC = :HISTORIC,'
      '  NUMREC = :NUMREC,'
      '  DOCNF = :DOCNF,'
      '  PARC = :PARC,'
      '  DTEMISS = :DTEMISS,'
      '  DTVENC = :DTVENC,'
      '  DTREC = :DTREC,'
      '  DOCBAIX = :DOCBAIX,'
      '  VALORREC = :VALORREC,'
      '  VALORMULTA = :VALORMULTA,'
      '  VALORRECTOT = :VALORRECTOT'
      'where'
      '  NUMLANC = :OLD_NUMLANC')
    GeneratorField.Field = 'NUMLANC'
    GeneratorField.Generator = 'GEN_TBCONTREC_ID'
    GeneratorField.ApplyEvent = gamOnPost
    Left = 72
    Top = 80
    object ibdtstContRecNUMLANC: TLargeintField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object ibdtstContRecCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCONTREC.CNPJ'
      Size = 18
    end
    object ibdtstContRecTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTREC.TIPPAG'
      Size = 35
    end
    object ibdtstContRecHISTORIC: TMemoField
      FieldName = 'HISTORIC'
      Origin = 'TBCONTREC.HISTORIC'
      BlobType = ftMemo
      Size = 8
    end
    object ibdtstContRecNUMREC: TIBStringField
      FieldName = 'NUMREC'
      Origin = 'TBCONTREC.NUMREC'
      Size = 15
    end
    object ibdtstContRecDTEMISS: TDateField
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      EditMask = '!99/99/0000;1;_'
    end
    object ibdtstContRecDTVENC: TDateField
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      EditMask = '!99/99/0000;1;_'
    end
    object ibdtstContRecDTREC: TDateField
      FieldName = 'DTREC'
      Origin = 'TBCONTREC.DTREC'
      EditMask = '!99/99/0000;1;_'
    end
    object ibdtstContRecDOCBAIX: TIBStringField
      FieldName = 'DOCBAIX'
      Origin = 'TBCONTREC.DOCBAIX'
      Size = 15
    end
    object ibdtstContRecVALORREC: TIBBCDField
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstContRecVALORMULTA: TIBBCDField
      FieldName = 'VALORMULTA'
      Origin = 'TBCONTREC.VALORMULTA'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstContRecVALORRECTOT: TIBBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibdtstContRecDOCNF: TIBStringField
      FieldName = 'DOCNF'
      Origin = 'TBCONTREC.DOCNF'
      Size = 8
    end
    object ibdtstContRecPARC: TSmallintField
      FieldName = 'PARC'
      Origin = 'TBCONTREC.PARC'
    end
    object ibdtstContRecLookCliente: TStringField
      FieldKind = fkLookup
      FieldName = 'LookCliente'
      LookupDataSet = ibdtstCli
      LookupKeyFields = 'CNPJ'
      LookupResultField = 'NOME'
      KeyFields = 'CNPJ'
      Lookup = True
    end
    object ibdtstContRecNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
  end
  object dtsrcContRec: TDataSource
    DataSet = ibdtstContRec
    Left = 168
    Top = 80
  end
  object setbco: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select*  from TBBANCO')
    Left = 96
    Top = 160
    object setbcoCOD: TSmallintField
      FieldName = 'COD'
      Origin = 'TBBANCO.COD'
      Required = True
    end
    object setbcoNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBBANCO.NOME'
    end
    object setbcoAGENCIA: TSmallintField
      FieldName = 'AGENCIA'
      Origin = 'TBBANCO.AGENCIA'
    end
    object setbcoCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = 'TBBANCO.CONTA'
      Size = 12
    end
    object setbcoSITUACAO: TIBStringField
      FieldName = 'SITUACAO'
      Origin = 'TBBANCO.SITUACAO'
      Size = 8
    end
    object setbcoENDER: TIBStringField
      FieldName = 'ENDER'
      Origin = 'TBBANCO.ENDER'
      Size = 80
    end
    object setbcoFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TBBANCO.FONE'
      Size = 11
    end
    object setbcoDTCAD: TDateField
      FieldName = 'DTCAD'
      Origin = 'TBBANCO.DTCAD'
    end
  end
  object dsbco: TDataSource
    DataSet = setbco
    Left = 160
    Top = 160
  end
  object ibqryTotCR: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) from TBCONTREC')
    Left = 304
    Top = 144
    object ibqryTotCRCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
  object ibdtstCli: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select CNPJ, NOME from TBCLIENTE'
      'ORDER BY NOME')
    Left = 40
    Top = 144
  end
end

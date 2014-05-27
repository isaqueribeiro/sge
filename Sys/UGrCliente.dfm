object frmGrCliente: TfrmGrCliente
  Left = 340
  Top = 184
  Width = 682
  Height = 496
  Caption = 'Clientes'
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
    Width = 666
    Height = 425
    Align = alClient
    TabOrder = 0
    object dbgrdClientes: TDBGrid
      Left = 1
      Top = 1
      Width = 664
      Height = 372
      Align = alClient
      DataSource = dtsrcCliente
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyDown = dbgrdClientesKeyDown
      OnTitleClick = dbgrdClientesTitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'CNPJ'
          Title.Alignment = taCenter
          Title.Caption = 'CNPJ / CPF'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INSCEST'
          Title.Alignment = taCenter
          Title.Caption = 'IE'
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
          FieldName = 'FONE'
          Title.Alignment = taCenter
          Title.Caption = 'Fone'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CEP'
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 59
          Visible = True
        end>
    end
    object pnlBotaoGrid: TPanel
      Left = 1
      Top = 373
      Width = 664
      Height = 51
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object GroupBox1: TGroupBox
        Left = 421
        Top = 0
        Width = 243
        Height = 51
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
          Left = 11
          Top = 20
          Width = 37
          Height = 13
          Caption = 'Nome:'
        end
        object SpeedButton1: TSpeedButton
          Left = 204
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
          Left = 52
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
  end
  object tlbrGridFornec: TToolBar
    Left = 0
    Top = 425
    Width = 666
    Height = 35
    Align = alBottom
    ButtonHeight = 31
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
    object btbtnFechar: TBitBtn
      Left = 233
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
    object ToolButton4: TToolButton
      Left = 324
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object spdbtnSoma: TSpeedButton
      Left = 332
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
  object ibdtstCliente: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    ForcedRefresh = True
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from TBCLIENTE'
      'where'
      '  CNPJ = :OLD_CNPJ')
    InsertSQL.Strings = (
      'insert into TBCLIENTE'
      
        '  (CNPJ, NOME, INSCEST, FONE, ENDER, CEP, BAIRRO, CIDADE, UF, SI' +
        'TE, EMAIL)'
      'values'
      
        '  (:CNPJ, :NOME, :INSCEST, :FONE, :ENDER, :CEP, :BAIRRO, :CIDADE' +
        ', :UF, '
      '   :SITE, :EMAIL)')
    RefreshSQL.Strings = (
      'Select '
      '  CNPJ,'
      '  NOME,'
      '  INSCEST,'
      '  FONE,'
      '  ENDER,'
      '  CEP,'
      '  BAIRRO,'
      '  CIDADE,'
      '  UF,'
      '  SITE,'
      '  EMAIL'
      'from TBCLIENTE '
      'where'
      '  CNPJ = :CNPJ')
    SelectSQL.Strings = (
      'select * from TBCLIENTE'
      'order by NOME')
    ModifySQL.Strings = (
      'update TBCLIENTE'
      'set'
      '  CNPJ = :CNPJ,'
      '  NOME = :NOME,'
      '  INSCEST = :INSCEST,'
      '  FONE = :FONE,'
      '  ENDER = :ENDER,'
      '  CEP = :CEP,'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  UF = :UF,'
      '  SITE = :SITE,'
      '  EMAIL = :EMAIL'
      'where'
      '  CNPJ = :OLD_CNPJ')
    Filtered = True
    GeneratorField.Field = 'CODFORN'
    GeneratorField.ApplyEvent = gamOnPost
    Active = True
    Left = 160
    Top = 176
    object ibdtstClienteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCLIENTE.CNPJ'
      Required = True
      EditMask = '00.000.000/0000-00;0;_'
      Size = 18
    end
    object ibdtstClienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object ibdtstClienteINSCEST: TIBStringField
      FieldName = 'INSCEST'
      Origin = 'TBCLIENTE.INSCEST'
    end
    object ibdtstClienteFONE: TIBStringField
      FieldName = 'FONE'
      Origin = 'TBCLIENTE.FONE'
      Size = 11
    end
    object ibdtstClienteENDER: TIBStringField
      FieldName = 'ENDER'
      Origin = 'TBCLIENTE.ENDER'
      Size = 80
    end
    object ibdtstClienteCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'TBCLIENTE.CEP'
      Size = 8
    end
    object ibdtstClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'TBCLIENTE.BAIRRO'
      Size = 25
    end
    object ibdtstClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'TBCLIENTE.CIDADE'
      Size = 30
    end
    object ibdtstClienteUF: TIBStringField
      FieldName = 'UF'
      Origin = 'TBCLIENTE.UF'
      FixedChar = True
      Size = 2
    end
    object ibdtstClienteSITE: TIBStringField
      FieldName = 'SITE'
      Origin = 'TBCLIENTE.SITE'
      Size = 40
    end
    object ibdtstClienteEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = 'TBCLIENTE.EMAIL'
      Size = 60
    end
  end
  object dtsrcCliente: TDataSource
    DataSet = ibdtstCliente
    Left = 248
    Top = 168
  end
  object ibqryTotCli: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select count(*) from TBCLIENTE')
    Left = 480
    Top = 152
    object ibqryTotCliCOUNT: TIntegerField
      FieldName = 'COUNT'
      Required = True
    end
  end
end

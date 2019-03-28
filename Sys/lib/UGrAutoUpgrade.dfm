object frmGeAutoUpgrade: TfrmGeAutoUpgrade
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  BorderWidth = 4
  Caption = 'Auto Upgrade'
  ClientHeight = 202
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 83
    Width = 290
    Height = 13
    Caption = 'A atualiza'#231#227'o de vers'#227'o deste sistema ser'#225' feita a partir de:'
  end
  object lblProgresso: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 167
    Width = 418
    Height = 13
    Align = alBottom
    Caption = 'Andamento do processo:'
    ExplicitWidth = 120
  end
  object Label4: TLabel
    Left = 63
    Top = 39
    Width = 262
    Height = 13
    Caption = 'Mantenha seu sistema atualizado com apenas 1 clique!'
  end
  object Label6: TLabel
    Left = 8
    Top = 123
    Width = 220
    Height = 13
    Caption = 'Informa'#231#245'es da atualiza'#231#227'o armazenadas em:'
  end
  object lblURLApp: TLabel
    Left = 8
    Top = 97
    Width = 324
    Height = 13
    Cursor = crHandPoint
    Caption = 'http://www.homeautomacao.com/suporte/itransito/DigitoSeven.exe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = AbrirUrlClick
  end
  object lblURLInfo: TLabel
    Left = 8
    Top = 137
    Width = 314
    Height = 13
    Cursor = crHandPoint
    Caption = 'http://www.homeautomacao.com/suporte/itransito/digitoseven.inf'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    OnClick = AbrirUrlClick
  end
  object imgUpgrade: TImage
    Left = 8
    Top = 8
    Width = 49
    Height = 44
    Center = True
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000020
      000000200806000000737A7AF40000000467414D410000B18F0BFC6105000000
      097048597300000EC400000EC401952B0E1B0000059C494441545847BD577F48
      556718966D85C936EAE296A4344C0C463123D986B031FA63ACFDA8FE5931519A
      53548A42C3582E67D856FFB41FA12D51E7D8160369B141587497E2DDBDA85C33
      C9BCD356BB7396CD5A76CDEB32B5F47E7B9EEF9EEFDC738EE796C4E885E7DEF3
      3DEFFBBDEF73BF5FE7BB31428807222625EB714761CB9AA7734E1C5C9477CA0B
      8CE059E09B18C5F3197C5722E6F59894CC797639A2C196548849589B98F8A1AF
      1C8947B5623A1CF9A7A7171156BEB0650C7D3E45DFA57639ADB027E3D2172049
      56FC16D75F86E441608ACFA925EE9B599FB574667FE93ABBBCC4334CCE917FEA
      9E1623E3D1F74AE22E5F2E723D6957436136B1202D617151E7E7481262A28579
      CEE0F29DADE7AB5A6EF832F6B449AEA91F914284F8E1191482D39151D11EAAF1
      04FE5CB9ABAD0FA323478C7CC28EB387903311A1B36A11E6068AA3431D3B138B
      B7BAFCFB8FF97E836FE6363E5EDAD32E1C05CD78922605D0C8A597B7899169D9
      0C559EB87025A9C833A0F220E7F7D144441EE2D2E310F885D629945AD27ABE67
      68EA267CD26A1BBB4452915B6C38ECD79888808DB5FD62C93697A8FAB9436344
      E8E27068725559C7EFCCA589F80A359E82CF5E00E67CB35AD9CB76787C0341F1
      2F78BD485E9587D321EABCE31A13F17DD739C14529720EBA3426ECBB3621A657
      9579FF604EE6C69A28043D5B00566C1216CD650662D8073B062602E0697A9175
      557D525CBF5E3FE21B9C14D2F776659FC6447CBE6BF7EE62E4FEA61F35AEA156
      3268B3006E3506E0578C17D7B75F02C7043A7C9747422F57748A25DBDDE29EC5
      47E0238439C71AE9145DFE1BB3FCFB8EF504989B3550EB00B888001C328F61EF
      8ED0B9ACD8CDE233803226103FB97BB1F55AC586431725A999F4297BAFAE5F24
      177B444353379B261F2C94B6BBFD8AFC91852DE338ACE6830B0B00F11A1DD259
      D0241617778884922E1DCF6C6B138BF29DD24F58FD0439E5672CFB58FDCCAD62
      50F32D5D008803BAE3110900AA8D027E2599B4DD7D33B2BE74934399557B5176
      3CD2698A300DF3D1739332665375DF0F68E6030556A494B47ECD18EC882EB475
      015771A68BA53947FE0161355924E71BBF4CDE754372CA4C027C23E19D905D77
      89C564722B566C69C8612DC48D2A8E02EE700FAFDE76740884D56491CC9AF008
      F4A288C14C02FC6361019BAA2F48012B4E960923C8ADD9753C87B510C7BEBA80
      2055A56D6DB80E828E59C8D4A6A07BD8DE4FF4DD12F2C4DB78B82FBA80D2E31F
      380A4E730A7868EB02FCECB872B7571D3E46637291FB6D780ABCE631923E65E7
      303D8C79BF3E3C0576029EDFD290AB4D017FAC2EE0243B2E2D728D0EE344B398
      2C925D171E817A2F5F49BAD1970D3C4B6081F25282E98A3E05A93BDB721903D4
      B04D50C0471AF930DBF04D9508BE58E00C62A30A80BF8031988227543F1E442F
      3031F11002D6AA445A81D839088855F184FC80887E264F2D710586CC87819C82
      C67301F870D657E8AF5B1A7D52802A60849D00AB9FDFB281170495F1753B595C
      D77E871ECDA48081E109F1EABE2E1EA1626C4AF23493006B11C5DDCFC76749E0
      15E9C0ABB29B2212B7BB8327BB034C6EC2BBD5E185D871DDC4BF01988AB16DE5
      A2F16CEBAA300AEFA0C0048BA4EDF6DEEA18185745A415D5E33A862DB4DFA99F
      46F49946C09878AE9C2E00D7A579B88C9651006F2FB8C9049D3D7224A4FDE8BE
      20927125CBD8DFAB31D105CC15ECAB0B908D05690B7177D3DF8ECF157B6E971E
      393BA3A6FD954FF8566B1641EDF209E8BBC0AEC0FDA0FA990448022230121F43
      C01D2924DF39B5BADC3BBEB7F1AA5855EA91C21A7AA402353A7A5FBB427630F6
      D11F4C645CFA7CAC89F558983E351AF8E371373EDF29CFFB941DEED0BA8A5333
      EB2B707BC6B3B1AF5D41238CB184A9610576473C841461FBC94BA5093CD3C3E7
      BA84B19F5D61C218A3308B880688781185F602BF00BCDF71C710834033B0CF18
      3F97E2842DF97FE141C5095BF2D141C4FC0700DB124B7511F9C2000000004945
      4E44AE426082}
    Transparent = True
  end
  object btnVerificarUpgrade: TButton
    Left = 63
    Top = 8
    Width = 201
    Height = 25
    Caption = 'Verificar atualiza'#231#245'es do Sistema . . .'
    TabOrder = 0
    OnClick = btnVerificarUpgradeClick
  end
  object prgBrAtualizacao: TProgressBar
    AlignWithMargins = True
    Left = 3
    Top = 186
    Width = 418
    Height = 13
    Align = alBottom
    TabOrder = 1
  end
  object AutoUpgraderPro: TauAutoUpgrader
    InfoFile.Files.Strings = (
      'http://www.agilsoftwares.com.br/upgrade/SGE.exe'
      'http://www.agilsoftwares.com.br/upgrade/lib/SiUSBXp._dll'
      'http://www.agilsoftwares.com.br/upgrade/lib/mp2032._dll'
      'http://www.agilsoftwares.com.br/upgrade/lib/LciLR3USB.cat'
      'http://www.agilsoftwares.com.br/upgrade/lib/LciLR3USB.inf'
      'http://www.agilsoftwares.com.br/upgrade/lib/MP2032.chm')
    InfoFile.UpgradeMsg = 
      'Novos recursos dispon'#237'veis nesta vers'#227'o:'#13#10'- Novo relat'#243'rio de co' +
      'miss'#245'es por baixa de t'#237'tulos'#13#10'- Novos relat'#243'rios de Vendas (Fatu' +
      'ramento)'#13#10'- Financeiro / Controle de Cheques;'#13#10'- NF-e / Emiss'#227'o ' +
      'de CC-e (Carta de Corre'#231#227'o Eletr'#244'nica);'#13#10'- Atualiza'#231#227'o Autom'#225'tic' +
      'a;'#13#10'- Outros ajustes na otimiza'#231#227'o de processos.'
    InfoFileURL = 'http://www.homeautomacao.com/suporte/itransito/digitoseven.inf'
    VersionControl = byNumber
    VersionDate = '03/27/2019'
    VersionDateAutoSet = True
    VersionNumber = '1.0.15.0'
    ShowMessages = [mAskUpgrade, mConnLost, mHostUnreachable, mLostFile, mNoInfoFile, mNoUpdateAvailable, mPasswordRequest]
    Wizard.Language = wlPortugueseBrazilian
    OnProgress = AutoUpgraderProProgress
    OnFileDone = AutoUpgraderProFileDone
    OnAborted = AutoUpgraderProAborted
    OnNoUpdateAvailable = AutoUpgraderProNoUpdateAvailable
    Left = 392
  end
  object auHTTP: TauHTTP
    Agent = 'acHTTP component (AppControls.com)'
    Left = 392
    Top = 32
  end
end

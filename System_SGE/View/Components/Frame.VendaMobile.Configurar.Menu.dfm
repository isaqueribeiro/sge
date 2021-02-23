object FrameVendaMobileConfigurarMenu: TFrameVendaMobileConfigurarMenu
  Left = 0
  Top = 0
  Width = 200
  Height = 576
  Color = clBtnFace
  Padding.Left = 2
  ParentBackground = False
  ParentColor = False
  TabOrder = 0
  object PanelContent: TPanel
    Left = 2
    Top = 0
    Width = 198
    Height = 576
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object pnlChaveAcesso: TPanel
      Left = 0
      Top = 0
      Width = 198
      Height = 42
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 0
      OnClick = ChaveAcessoClick
      OnMouseEnter = ChaveAcessoEnter
      OnMouseLeave = ChaveAcessoLeave
      object shpChaveAcesso: TShape
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 6
        Height = 32
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Brush.Color = 1848330
        Pen.Style = psClear
        OnMouseEnter = ChaveAcessoEnter
        OnMouseLeave = ChaveAcessoLeave
        ExplicitLeft = 15
        ExplicitTop = 3
        ExplicitHeight = 43
      end
      object imgChaveAcesso: TImage
        AlignWithMargins = True
        Left = 14
        Top = 9
        Width = 24
        Height = 24
        Margins.Left = 0
        Margins.Top = 9
        Margins.Right = 0
        Margins.Bottom = 9
        Align = alLeft
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B00
          00037749444154484BA5565948945114FEEE3FFF38669BCD38146D969695CB53
          203A5AD4430B215994522051591111F556BD443DF4540F1111F554D066102D0F
          513D449BA3D00616B4112D6686E24C5646CE38CBEDBBF78E4C968E5A1FDC7BCE
          7FCEB9DF3DF7DC654660B8F0B9174358BB215006C86FB45C03AC93F077349880
          BE18CE0402E59E4A4851472D8DDF6D9C209D663724A210F234E0DC037F5B8709
          37B0127270947957B23F4F7207DB168CCACC81AB278F13AEE744414EB41132FA
          08A5E30BCD0083A1ADA03C6B2DB33CC5680B426C467D07B3A5A517E513BC40E4
          10E9D6D11A847054C0DFFE40B91C3A606008F8BCAB284FEB54E2B2160D81B3D4
          92E44B67B890961686A7F52A7E64B818B7886E1FF25CE7F02E144E5DA285DE1C
          5892994BC1568BC6E0395A93E4A59ED9E8EA7CCCF60CED99F97004F632892BF4
          1420641D5121A927E88955B31FCD7610F5C1F3944972058758C69215B2712FEC
          4ADCE3665BCEADF47C62ABC67CF79C4136D99AA285904DECFB922BC4C56D9ADF
          526B464CDED436758AA43CC64123780036A79E40401193C35AA0E59F68EC6842
          744411BA9DF92CDFE3849579C5594A19660235A94F913A1D32F28225B059CC62
          DC0FBC497852C38CFBC80C7B52AF201E1BC355C4A88DE5B28B8D7110EC53FB1A
          E54D17E91C7B6DE015CCCF2C42DCBE4E6D32AB7F1C766087DEC454A8E2B1FFEC
          394CF2ED4C2808CB2EEE7F05A5E30A11735CA236499387B2770E4A3E174EB466
          1DD0E4400B845D81FAF6F77F5F349F371796B8C5C069FC3A43F26D78F224629C
          84CF331A5332AA3135FD2B5A42EAB133998714397627325FC19BFC50B9FA96E8
          CFB2A8CC7F275728CF5AC3BE8EFEEF1C7D95F23E65256D15D403406C211A3A9F
          EB5822B902437E995A36034FF44BAE307DE407DE56DAC55C1297B22DA77516C7
          BC62F6ABD1F8E5A90934302BD0659177A94D623B83EEEC4D248FA2C43D112EA7
          53C7C46361D407F844934AA164B21BF6CF1A1EFA9934BD443ACFFEAD4E53B2DF
          20062C4B9987974BDC6004DF7C8D2E38ED22DC696B4E7C0F091662F605CAE469
          E92D8BB0BC09F2D7FCB848FF5984235FB46F18E0AF5496E4E01692E76AF279DE
          25AC6509975D407715630EC11FD865C2870F730FD46DEDCD3C1EAF63BF3F41AE
          2ADEA5E53FA2BF8BE6D2BD101BF88AD6C08E1CD5DFFF08532295A794DDC62232
          B4F407523F8443844562F57783BF5824EE2587BC61E4FF02F8053D0635E19C24
          AFD50000000049454E44AE426082}
        OnClick = ChaveAcessoClick
        OnMouseEnter = ChaveAcessoEnter
        OnMouseLeave = ChaveAcessoLeave
      end
      object lblChaveAcesso: TLabel
        Left = 45
        Top = 11
        Width = 100
        Height = 17
        Margins.Left = 0
        Margins.Top = 12
        Margins.Bottom = 12
        Caption = 'Chave de acesso'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = ChaveAcessoClick
        OnMouseEnter = ChaveAcessoEnter
        OnMouseLeave = ChaveAcessoLeave
      end
    end
    object pnlServidorWeb: TPanel
      Left = 0
      Top = 42
      Width = 198
      Height = 42
      Align = alTop
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      OnClick = ServidorWebClick
      OnMouseEnter = ServidorWebEnter
      OnMouseLeave = ServidorWebLeave
      object shpServidorWeb: TShape
        AlignWithMargins = True
        Left = 3
        Top = 5
        Width = 6
        Height = 32
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alLeft
        Brush.Color = 1848330
        Pen.Style = psClear
        OnMouseEnter = ServidorWebEnter
        OnMouseLeave = ServidorWebLeave
        ExplicitLeft = 15
        ExplicitTop = 3
        ExplicitHeight = 43
      end
      object imgServidorWeb: TImage
        AlignWithMargins = True
        Left = 14
        Top = 9
        Width = 24
        Height = 24
        Margins.Left = 0
        Margins.Top = 9
        Margins.Right = 0
        Margins.Bottom = 9
        Align = alLeft
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          000000180806000000E0773DF8000000017352474200AECE1CE9000000046741
          4D410000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B00
          0002AB49444154484BBD94CF4F534110C7BFFB5EF95510032D342252A35C040F
          92288158CA45221A2FC49078D2C40B1E8C07623C69381BFF052F7830F157BC78
          10899A46D004831763D1444DF821286D0918A015DBB77EB7FBA0B605A415FD24
          F3766676B3F366767605D6A3B3BE088BF36701D90589660894D33B43FD19C77E
          0C47021CA55AFA27B203B47AAA61C41F4288565AD9F312717A6F20EAEDC3E8E8
          4FDBBB21A63D6A5A6A2B61AE0C72F323B4D6CF4EC0E0D707C7BC89C9A8CA6853
          D203EC2DB8C6CDBB6D6B3304D7F950E7AC416D4903BCA5214C2C47ECB934527F
          D95E558684F5912E8FEDD93A52C618F01286C23795A59D1A9D81DFDD848454A5
          F126ED5C11C2C16F27F6383F6072F99D766A4CF82B0F20219E72519DEDCB1713
          4236A16EC71876972D626A6949390D48E3220B55955CF2D7887A486B00667C0C
          6DAE0BE8832170D4F5897FBFCF5EB17D4824F8E96200F71C33A8B0BD4C4B8C50
          62DACE116939B917EF8F28D4B60C08F8DCAFA91EA6B1C2F1381C91215437A85E
          CF9DD9A085B8EB042BF2805601F79C6500D71546BCCE94EEA3267C06D3EEC73C
          ACFCBAC9126FF132DCCDAA0C309363F40C0A345796A340DCA13101A7A317D144
          887A895A9F0753D855BD1F33B3B7A99F62EB9F343032F71D1585A761182AAD55
          C6293DFCA5F329C1ADE48C425D2C5857A94DA7E9AB48F185D2835791E7BAD68F
          6696F122F424A96B1699E27B8EC1359172524DD8B0438CCFDC299AA16B6A42BD
          180EF55393E90F5A87A7745B4A742FA81A26497A8096DA1238626FA8156B47CE
          7CE533EEDFCA33BE6DA467D0EE2D4662E92EB522EDC89930CCC6730804E2B69D
          11E01F9CC146377684E77F08D23C981279D99E237281ADD941854FF3EF7A361B
          04902E765F1B44DCBF26108DF6A4A290AF700B6FFFCE0C3D8BFF5CA2956F3F60
          495E9A3C91721C0DC1B50306805F87FDF2C786C77F340000000049454E44AE42
          6082}
        OnClick = ServidorWebClick
        OnMouseEnter = ServidorWebEnter
        OnMouseLeave = ServidorWebLeave
      end
      object lblServidorWeb: TLabel
        Left = 45
        Top = 11
        Width = 83
        Height = 17
        Margins.Left = 0
        Margins.Top = 12
        Margins.Bottom = 12
        Caption = 'Servidor Web'
        Font.Charset = ANSI_CHARSET
        Font.Color = 1848330
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        StyleElements = []
        OnClick = ServidorWebClick
        OnMouseEnter = ServidorWebEnter
        OnMouseLeave = ServidorWebLeave
      end
    end
  end
end

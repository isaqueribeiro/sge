object ViewPrincipal: TViewPrincipal
  Left = 475
  Top = 203
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerar Licen'#231'a - Vers'#227'o 2.0'
  ClientHeight = 774
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    895
    774)
  PixelsPerInch = 96
  TextHeight = 17
  object lblEmpresa: TLabel
    Left = 76
    Top = 52
    Width = 77
    Height = 17
    Alignment = taRightJustify
    Caption = 'Raz'#227'o Social:'
    FocusControl = edEmpresa
    Transparent = True
  end
  object lblCGC: TLabel
    Left = 421
    Top = 82
    Width = 70
    Height = 17
    Alignment = taRightJustify
    Caption = 'CGC / CNPJ:'
    FocusControl = edCGC
    Transparent = True
  end
  object lblEndereco: TLabel
    Left = 95
    Top = 116
    Width = 58
    Height = 17
    Alignment = taRightJustify
    Caption = 'Endere'#231'o:'
    FocusControl = edEndereco
    Transparent = True
  end
  object lblBairro: TLabel
    Left = 115
    Top = 148
    Width = 38
    Height = 17
    Alignment = taRightJustify
    Caption = 'Bairro:'
    FocusControl = edBairro
    Transparent = True
  end
  object lblCidade: TLabel
    Left = 421
    Top = 148
    Width = 44
    Height = 17
    Alignment = taRightJustify
    Caption = 'Cidade:'
    FocusControl = edCidade
    Transparent = True
  end
  object lblUF: TLabel
    Left = 655
    Top = 148
    Width = 18
    Height = 17
    Alignment = taRightJustify
    Caption = 'UF:'
    FocusControl = edUF
    Transparent = True
  end
  object lblCEP: TLabel
    Left = 128
    Top = 180
    Width = 25
    Height = 17
    Alignment = taRightJustify
    Caption = 'CEP:'
    FocusControl = edCEP
    Transparent = True
  end
  object lblCompetencia: TLabel
    Left = 26
    Top = 212
    Width = 127
    Height = 17
    Alignment = taRightJustify
    Caption = 'Compet'#234'ncia Limite:'
    FocusControl = edCompetencia
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 288
    Top = 212
    Width = 284
    Height = 17
    Caption = 'Formato YYYYMM (Ano, M'#234's) - Exemplo: 201401'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object lblDataBloqueio: TLabel
    Left = 61
    Top = 244
    Width = 92
    Height = 17
    Alignment = taRightJustify
    Caption = 'Data Bloqueio:'
    FocusControl = edDataBloqueio
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 86
    Top = 296
    Width = 68
    Height = 17
    Alignment = taRightJustify
    Caption = 'Sistema(s):'
    FocusControl = edDataBloqueio
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object ImgLogoEmpresa: TImage
    Left = 26
    Top = 618
    Width = 128
    Height = 98
    Anchors = [akLeft, akBottom]
    AutoSize = True
    Picture.Data = {
      0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000080
      00000062080600000098B2DB420000000467414D410000B18F0BFC6105000000
      097048597300002E2200002E2201AAE2DD920000001A74455874536F66747761
      7265005061696E742E4E45542076332E352E313030F472A100001C9449444154
      785EED5D0778144796865DD67BEB3B9B6832261B9450264820104828678D4639
      A20822094410411220C0249B9C6D03B631C136C1064CB0510E64914DB6095E7B
      F77CEBF579D79FEDBAFA7BBA869E51499AD0230D3EDEF7FDDF4C87EAAE7EFFAB
      AAF7AAAAAB5B988BB866077BF48B1D3EA3310C191F102C2631A9ACBDB1E2E58C
      EA78B7D8F290CCE8B2A03794A5FE1F2B4A7CAB15253EF7C24BBCBF8F28F523A1
      C5634948B127092FF1A1F0FE911E7B4CF7D72A4BFD8E4596066C8E2D0BCE4DA9
      8CF49F7331A79B78D9E7529FF48F1BB1FA65FF81A431F48B75DD2B269155965D
      5DD02EA9224241895E4F49BC4C89FD25E8F4182217224A7C1F51A3D81B5F1E96
      35FBC2947EE26D9F0B932EE10E3B79846B434E0328A89DD93EB142911159EA7F
      9296E69F79C49902C1A73D0835B22B5165810539E7322DC5ECFCFF9598A2EC3F
      BD1262FB358F706DF48A1ABA5B4C6690D4FCADB225ADDADDA9F2F750D2FFCD23
      A8290163A0B54E1535C4E4B53796FF45CCA67949F69ABC56C3C607B691138EE9
      DE6D948599BD078DF3F0E9A27038C2239B075A536C16B3A597BC7FEF9D3FA656
      45C7D2F6F9028F0873405889F75FE3CA43F2175ECE6B2F66DB3C24202FC99547
      4673E0D5C8C10BC46CE92455DF95B74CAB8A89A46DF0759ED219C24BBC484279
      3049AF5292EC9A3832E54C22C9399B4C9144269F4920E3AB63C8B84A0589290B
      101C3FDE35E40275287F882B0FCD2FAC9DFD92F818CD2BE66400D4598C16B3D5
      A84CA8491E4CABD70A6D05A3DA4DAC0821D328C145B553C8BAEBF3C8B62F17E9
      8CAD5F2E246F5C9B4DF22F4E108C25924604DAF79003D4109ED02822E5E8A343
      7F101FA979C45C0CA04D80C56F0179893DC46CD52B4BAF16BC4CC3B775B4A4FE
      2A55684A65389977713C597F239F4BAC3158757516997E2E854499C01868F450
      96559368213E5ED38BB918006DFFCBC52CD52B99D509EE88D599F2C268AC8EEA
      7CF5B53C2E717203B5C3E2CB5385E6424AA2B1A0C6FC137514A717FFF554D3D7
      06E662007D635D43C42CD591638F0FB78A2F0F5FC04A7D286DA7D1866F304169
      D7152BAECE20A9321B020D593F9B717E6227F1B19B46CCC100BA84DB7F5671E5
      6C4B314B1A32FBC294F634AC3BCE9494591D45D65E9F5B87905DB797938FEE6E
      2447EFEF20A7BEDA4D8ABFDE474ABEFE90FEEE279F7FF50139F66007F9F8DE26
      F2EEED9575D21A03D408D1D4799412690CA86FF030AB3A61A8F8F8A697E63680
      F6C136770667FA71AD7ED299D401B4CAFF128A5196FA084E9D54F9FBEEAE13C8
      BDF0F838B9F64D89CEB8F8E424394D0DE4C3BB1BC8F62F8B34AE690836DF5C20
      D4487040B5093504A1C5637F4AA98C8A12D5605A694E03E8106C53EB90EEDD53
      CC8A86A457C70D092BF6FA160A49AB8A5057F76F7DB9987C72FF2D72FEF1675C
      72F5C5C5272784DAE1ED5B4BEB10AB2F5EBF329D1AAA2F97547D418DE9571A25
      4C17D5613A690E03681B68F573E770FB15F18B277163E1F13549EE6125DEFF84
      2272CF8DA3CE974AC107EF6D25171F9FE012692C6A9F9C229FDE7FDBE81A61FD
      8DF924A922944BAA21A011CFFC1D77B78A9A3181349501B409B4FCB57398FD85
      1E4AE782E193425E156F5F47B2CFA48C0A2DF6FA31A4D883145CCA16948AF6BD
      F2E1412E7172A3E6D1A7E4BDDBABEA10AB0FB6D02601BE0A8F504310478DE0BB
      7F7F2B6A4866892DCAEED027C645690A0C4818A9B44C720FA06DBC53D2EB531B
      EDF9A2F1B0236DFFBE476F1C6BEFF7DF5D2F944E1E59A6C295275F9003F7B6D4
      21561F20644447128F504330AE322A5754D3EF5372CE65F646EF184A3E23FFF0
      BD6DE4EA37C55C929A02C71EECAC43AC3E40D335A126964BA8BE804F905A15AD
      734FE933258BAFCC7F5951E25B8B07CDBFA8AAF6E1E8F148696A1C7FF06E1D62
      F5016A82B42A2597547D416BC77FD15AB2E942C4A6909ABF55B48C2E0BDA8707
      44772B9476E0DE662E19CD8523D439D426561F6CBA5948DBF1202EA9FA02FD04
      B32F4CEE2CAAEFD997E44AE5243C187AD5505A76DF7993B6C1A7B9443417D00C
      C117E191AB2B565F9B436858CB25555F4495059EF8F0C1EEE61D44924326D424
      0F42B51651E223844F6FDD5A4CCEC914DFCB8D4BD411DD71EB752EB9BAA2E0D2
      442EA18620A922429E3E82F0FCB49E1D43ED9634076CF2865E1DB4C899B82F1B
      4BC2572B48D1A17CAEF2CD05E85AE611AB0F32AA22B984EA0B149CC967D3AC44
      1A0D97E6EE0A962276E938AEE2CD09E87EE611AB2B303F41AEA60043C9A57FFD
      C2B8A6E0B901E887EA479F7089D507B3CEA7730935049854225269983C3700FD
      B1F7CE5A2EB1BA02834791328D19A0EFA4E8F23CC3A7973D3700FD21872F30E7
      4226975043105F1E5620D2A9BF3C3700FD71E59BD3E4ED5B4BB8C4EA0AD4028A
      126F2EA1FA82FA14FF33F7E2B47622A5FAC97303300C985CC223561F600E018F
      5043406B817C9152FDE4B90118064C44E191AA0FDEBC96C725D310505FE0DBB5
      3756E8FFF2C97303300C358F8E7049D51709E5215C420D41524544B248ABEEF2
      DC000C03868CE5984E36F37C1A974C431059EA5F29D2AABB84CC1BE7D43ED8E6
      AE29D181A2739C0DE914674DBAC5DB92BE4983D5B04A765363E286A95C659B2B
      76DE5AC625551FACBC3A8B4BA621C09CC49C7399CDF78E417D32BE26C9816512
      AF62B1877FE7D652AE629F15BC7FE70D0D320D0106C0E48A068098B260C34342
      5309CD5411CB200644D8C3EFBCBD9CABD867057BEEACD120D35060D2AB944463
      A02CF5BB2CAADD7C24A2D4EF12CB20DEBB630F8E2A94A7D867057BEEACD620D2
      50601E84944463806620F77C761F51F5CD2B07CB8FB79AF2F9C49E3453BF2173
      98EEB5E5E642F5833FF34DC06DE39B0040CE616220AE3C345DA4A0692561C9E4
      17FBC6BAC6765538EEE9146677AF4388CD2FAD032C48DB100BD239DE9A58CE74
      2613F7A593CDD717880F5F24F4AAF194FB2C60870C4E20B0FC4A2E97484341A3
      01A316DAD05B6824F142AFA8A133DA075B7FCB0BEFB4D133CE9164ED1E273CBC
      B94E00690C976918A84DA4A1C0AB6E3C220D85A2C4F72B911AD38B6592BB7DC7
      50DB6B3CA21BC3C8B9DEE4D4DDBD5C059B3BF0FE008F4C43B0F9662197484301
      3F60E1E5BC2E2245A6151AE33FE691AB2B46E60492F35F9DE42AD99C81175079
      641A028482208D47A6A148AD8AF6112932ADB40FB6F98E47AC3E089A1F43AE72
      946CCEC09BC83C320D85DC4BD3C495874C152932ADC8610040D19E455C459B23
      D0FEBF65E470B0147881446E03882A0B5C2F52D4B0A4AEC87DB17B84535E371D
      3038CBBFCEBA7772194077A523A9B9F76C3884587B8047A4A1C0BB843C128D01
      8D043E11296A582C124785F008D146BB20AB1F83E624B71193A9452E0300F2DE
      99C355B8B941AE1E40064C89E791680C14253E67448A1A96EE4AE7753C32B441
      63FBFD62120D91D300ECD3C770156E4EA87C78884BA231C022543C128D417889
      CF3D91A286A553985D0D8F0C6DF48971992426D190C60C60D8661732FA831142
      6710EFB814AD298AAF1FE22ADE5C2077E90716D54EE192680C680DF0BD4851FD
      527EE56CCB4EA1763FF0C8D0865DEAD840319986346600FEC7470B19EA3DD18E
      7B5C1B5B3E5BC755BC3900CBCAF0083416B3659C26CEA028F1FD59A4A87ED95F
      F2E94BE8AAE511A10D87746F7F319986346A00275406D07FBA03F7B8360ADF2F
      E42ABFB98195493076C123D05860A5526D028D4544892F1129AA5FF2B62D6DCB
      238187DED1C392C4641AA2AB01F49EA45B0D90BC294508B378243417F072A8B1
      EF0234042C51AB4DA0B15096FA356E009F5F28FF4B9B404B2E11DAA0CE2237AE
      B448747FB97FDC88D63C841FF7DBCF32D429D69A7B5D6D446F8C1256EF6ACE85
      21B471F8FE362E7172C01411001056ECF5834851FD72EFC9572DA80FF00F1E11
      DAA025FDEB39DB5F7F414CAA93284BFD3723339E1F8DE45E9387E4B7553386B0
      20943918C1D1073BEA902627F22F6573093416D409FC46A4A161E91C667F9E47
      040F7D635DB3C5643A496469C0126466609E23F77A3C4C3B98A5560E168A68AE
      E162181F560D9392650A64C8B898941458415DA4A161E916E1B49D47040F6D03
      ADFE699B3AD65E4CDAA8C49405E78C78C795B40EE05F8F87956734D7FD45D885
      851D7924990AB54F3E97BDAF9F07AC1C125A3C964BA0B1A006705AA4A161E91F
      373C9647447D681764F52D6DDFDDC5E4F5CAD99B975A38CF739FDB3654B72803
      E8973C98AB282CCC50FAF0232E5972A3F2D121B2EBF60A6E3EE4C6FC8BE3B9E4
      C981C852FF77452A1A96A88559EDDA0659FDC423A43ED0D0F1575A73BC6F9FE6
      E5B67CCFC656E2A504A191C58BD629637CBB2A1C0EB7F6D79D7C20EC4D055751
      0C2895A69A408215430F51BF83775F53011FB1E0912707A2CB02178A94342E94
      CC5D3C427401750EFFB75398DD754AF805EA50DE6A1764FD33EFBCC680686459
      D52CAEA2A4C0CB187010CF3C3AC225525FC0A0B0221996A0E5DDCF54C0B2B23C
      E2E4425C7968AC486FE36293E26189953C79C43415C62EF4E72AAA216041A913
      0FDE23671F1DE5925B1F403A26749832B66F0C727F73401BD9675274F6D504A1
      B5C07A1E314D812E4A5BF2C6B9BA4BC0EB03F4D261F9964FEE6F17D6F6C3CB9B
      5F7CB547F8C5364A3956FA3276A12739B0F4F2342E697221ACD8EB5FBBEFEDD0
      2B646FE13A31F8E50EC136B7780499128810A67C94C15594B9C27DBE0F719DE5
      4986CDF020333E99C03DA73E60FA57BC4C6B06D60765A97FA35F5FE1CA800437
      5BEAE5EB343824171C960E256B381F803057ACA8C92303D38611AF4501C43ACB
      95ACBEA0DF47A9F22E6470499313D4015C2C52AABFD0B0703475E4F48A0A0C85
      CD026721C3F8E0135B125E1BABCECE2101CB4288CB4C4F32EFC4D30F46E41D9B
      44BC8B028552E8B33890CC3BF9F4189C49C59A0801AF57CE241BAE14A8B7718D
      E987C60BFF23D747AAD36CBDB99064EF4D23A3F37DE9BD3C48E0F25052549AAB
      3ECEB0B078BA981F0FE251E8275C4B7A7CCB8D0564C29E5412B15629DC63FC07
      A9EA63B987C79381B94EE4B5190E754803DC760E27B64B06934145CEC47ED960
      615FE0E7A389DDD2C1A4CF643BE137E0D4687A6C88B06D4DF5C7C65AA448AF8A
      F514E9344C06268C74A346F0771E6972A075E040E2B8728846A6B172965491C0
      DA4BF349AF782775BA8CF7544BC906AF0CD3B81E8051CDB82D31C2F1D94727AA
      F7A38A7EF3FC5CF576E2F6388140FC7F25CC46387FD3B5423234778CFA1C86B6
      419602992C3F29EF24D268A56E680B43DC7A5375CEA879DE1AC7D05460FFA4FD
      E9421EB1AF35BD86F4D90107AA0F69BA0E1196C27EABFCA7CF0F748ED31C53B1
      98E3A8711DDAFEFFE3ED3B9BFE43A4D270B14DF5EC4BC33A9D268BE8838E3156
      64E4BBC335320DE0B53184464CD92A8527A8D3758BB223533FCE144A14DBD721
      D49A5865BA9276C1AA012DF813205F5F03085AF1D4A0BA46DA9181E9C3D464E1
      1EE89D9C7F72AA9A7C1806EE8BF42C5DEACE24B2FE72BE3A1DCEC1B5C614F80A
      F7C0F9ECDCAE4936759EBF4BE2D36BB5A7E47749B016F6778C5111DE2ECC92B4
      09565DBB4D9005691FAE7AE64EF4B8F43A91A5017B440A8D97B415B9AD7A450D
      9D4A637DA36B03CC08B259C8AFB218B064EC9AEB73D406809141969E9544DBEC
      11C276E78841EA7E83C22F72D44680974DF431802D3716924E8A41C2B605251E
      CD05AE894129EC03A1B19B6388E7027F611B4630F7F864E11C1846B7287B55DA
      0C172192C17F00253FE74016595C964BE65DCC12D646C0FE76A11624F08BBACF
      DE31DA4A380EE2876F7725EEBB4708FB5F8952ED1F30CB81BC9A652BFCEF913E
      880C9CAD1A5F61350543726564B8489F7CA22CCC6C430D2187D6089771537DD0
      31D4F676CFA8210521477D0F4B335A1F30368E215228188A66D7719AEA2EEC43
      A9C2F6883C2F619BC166FC7061BF2525421F03808FC18E29D729D5D7C3FB8B78
      7D2DF7F004C18FB09BE8269C332075A8C67DC714F809FB5153480D8061F892D1
      C24B1F2090ED1BBAD1A5CE73330360E849C9C67EB50150C2B10FFF05031007D8
      A406105EE2FDDFEB6FAE34BEFA6F48DCA7460CE813E392DE55E1B8B14BB8C309
      6A14977A289D1F0094ECDA2E0A8793DD229C36F78E1E96356252A88D98AC4566
      75FC5896D1C680A5D5D947A2EC273D1D4A5E5E3D9BF44F51B5951837602F99AE
      ABCD17FA12B0DF39C75DC300E0A435640028F1AC6A47EDC18885B3C8D228D745
      0A251AFF3B86DB90D517559E3F6A0F8B7417613FDE77941A000C6648FE48E2B2
      5545B6E7C74F9FA3D70415B9523003C04BB40369BBEEB042E523E96300316541
      6B45759B9F1CF87A6F4B65A9DF0D96D9C6105B1648425685693881F0CAE159B3
      6D3407F0B65175B37DF01B169C9EA6DE46C836E7B3C9EAB6D97E929B508AF1FF
      D5580781C8C1D346ABCF87138785AB710CDBF02BE0F9A33660E7C008910FC729
      A3D4FB60546BA861B0ED41346F9679CEC4E9CDA1C4FD7DFA7FFED3E7E89136A8
      CEF3B20933820150B2AD0A9C84FDBA1A005EC19F7A36C35A54B7794A6285224B
      FAD08D01D1021E12009108D55062A50E951428FD2895388F910CC07974985C77
      520A4883012C2E9BA1AE41B4E1B734483807D71C3E7B2CF71CDC0B110BCE931A
      23D0678A1D19B241731F2BDD5268CF9960C4EA6A00516581C744359BAFACBFB9
      EA45CC54913E784340B5088FD762D210A1FA87820178DB88D3E180A1FA46F5AB
      581B218473EC1C74D8782EF0138C057D0670186104F0CE518DFB2C0ED2387F69
      C54CA1F4336712354F026D2E403C3B07317ED48628E118EE0B7FC47749909A7C
      BCE59B744221B4F7DDC70D22DD526C84923CFC2D57C1836FAFB024B68B9D4910
      C70984738CB8BE3BAD1D90AEE7785533D12BDB4ED846FF0048C77F5C1F7D02D2
      F326D4248F16D56C1AA9BE7EBEE5DED387FFD36D72685BDAFE1B0CE5D1E002BF
      63EE84075E84C03CE6EC9A58B2E9A6CA439702255E7B5F4368E87C38842CB42B
      F83C877B0E83F675565E9D29345BDAF967E079FE7221BA2CB058A4493E1993A3
      EC469DBDF1DD148EBB3B87D95FA50EDE8FAC1D351560D9BC0764C0B7FCF11285
      54F17202DDBA686AA4D14063C09ABFD3CEA608FD18BC3C9B1A883032AAE35D44
      DA8C17BBD4B103A977BFAF6DA055930F0F3766000CA99511C2EB543C428C85AE
      350A0675F0614B18252F8F4D055AFAEBEFF8691764F55FE25F9D84C6EB1994F8
      7FF1C8690AE86A00002C1F5FE75C41AB5E1E41A60216B902F10D55F74D85B062
      AF7FE69CCBACF72BAC3080D343B20274320274F4E83B854B6EE8630052245684
      92F91727908D37EAFA0872010B3B4F3B9722DBC7A1E5008DAA7244FAF802A576
      0EB73F1D5B94DDA01158278F19DE26C0F2176D429A1A3C03F039E24EAC0B9D48
      BF1C7B75F72820C4D6F39C48DFA9F6428C3D7A8F9BB0C802165DC4C718DEB836
      5BE83EC6D83D46ED1009A07B172380DA403F7FC2B638E13F4246C4FCF89FBC2B
      8E24EF8F216E2B466B846EB8170661706F8C68228FD83FF6E39182B7CE80012F
      8F0F47AAD3C1FB77DDEE2A78F0388EF0901D1B459FE7B5990EC24861E0A9FABB
      CB1930E6BFF3EED63F8A14F28529B65398DD296A08DC2EC2E3674B5AD0365FF6
      411F43A06D007E9FB96BBC513464BD4A61368B9C35D201E8B0715CF594247C8D
      4C7A1C615BFB50554CAD8DB0CD34A48C517531DBCF7125FDB3559D363D320611
      8BB9AA781B211CAE3BEADD11A4350D4D595AA06BB28D402EFAF0A5FB01E48BE5
      9B5D8B017DFBD8EFB663B8469F4743E32500DEFA997236BDBF4861FD22BD59FB
      609B235E3362EA18817D9AD730E979CD096D03705EFDB4330704B86E7521C336
      A9BA5E01C4D61859C3F0AAB08F2A7BD47B2388EF5177F53EC4CA3022972D2E02
      51D269EAE863C036EE231D74416C8DFF3C0340A9C736086369008F7D6E1A0680
      411DF64A7C07A5A530AE8FFB611B4681FBE28D695C93DD0F405E034ED66F00F0
      7D52AB62749BF0C92ECA4043BA2393D7CDD730821E4AE765DAE73517B40DC0EE
      F5C1EA63201EFB400AB6313C3AF680AA7AC5FA03AC54F69F6E2F18014B37E29D
      E154F99A4A64C4B0EE56405703E84A0D0ADBBDB26D85928BFF002673480D0055
      3AFAF4F11F84FB1E73571F43E70EF2E529360F3052E13C6AB498F0C1F2C4437C
      7998EEFDFDEC8652BC1232E840DF58973F89A7B4A04D4319EFBCE680B6014889
      640328182BC7364AA2F4DCEEA92AC3803247EE7A4A4C9F497675AA54A30C80D6
      22D8C6AFB486D2360056530078331AEB24B06D06369903BE0CDB3778ED50759E
      B411591A7082B6FB6AEE1A15EAD87163F98EA1B6FBD257CE68F9E34FFF8B1542
      FEC63BA73960356BC8BFB51F1AFDDEECB8F7E151A433AD5AF11FBFAC64836066
      18204F6A00009A04E935E53000A0DFB4A724D7670028FDC8B7D400BA8DB3111C
      3EE61B781D1AA5F601D015CCF2244544A95F6D61EDACB622B5BA090DED22DA04
      5AD689EBDB065A9271CBA7FFB9F2EAB93FD35051E3587DA0697EEEAA70DCD63B
      7A587ABF58D708ABA4D1B2C3333772445459E0BBECA1E1C8499D4078D49854C2
      B65FCDB455F5895385B27D4E6F0CD5300090C8562961E019001B8E05C1CC185E
      89B452130E03C3796C1BD7900EE0681B80349FCE6B860AED3ADB8651A3F4631A
      D898BD6E42240143C131CC0C627962A0E4DF9D50936CD8CA9FFDE3467850F234
      5E016706B070D76A9D1788A0BEC24CF1925C719FAAE8EA921DDCA32184CD4F6D
      B44FE293871FBF9050117E000F2EF58CA118F4A7834C69299402A365A815A406
      80765A5BA13C03D05EC08211C2805A01E7B17B6352A6C67D383E009BBF873448
      8B6160761C4014E0BAF5691A001342599E004589CF5DEAF1F712D563980C4C1C
      E5D42EC8FA1B761366001B0EEED4D9001C337CB84BC430E9146AF790974E0ADB
      54CF71E2E90DCAB65BEB5BC59605EF420904115094D7C1516AA5203C44BB896A
      19D7EDA0B4124A1CF39EE1147649B4160022583A06D4183866BFFC69D8E8B1DF
      4D188BC7F5701CFD0CDDC6A908038198D081F350B5232D9A06F44BB0FBE03F0C
      826D8FA151C19075C3D4DB70F8D0140CA0553FAE877D680660384234428D1213
      40A50E6B7889CFF5D917A618473E9301F16EFD692878170FC40CE0CC8D4BADE8
      BEDFB0AF31F48C1CD2E0A748E43400C807F777B44C2857ACD2F6E0B5D198D7AC
      2FB43B6110BE49B74D013CA3F668A1B2D4BF2AEFE2D48EA23AE411E74CBFAE34
      0AB8C40C00FBA813A8D362CFD497F88536036F5212C738A4790FA0D7EA270575
      2CD5354C7DB04919335B3B9D146373A33B0B19954872A5322BA4D8F367A9727E
      EF882D0FD95B7465DE8BA20AE49541E33CDA5067AE981940977087933CB29A03
      D4B9DC2B64524B32ABE347D2EAF0314F59BF275043FF25A95239F3E493A32DC5
      47378D64AF99F362E18E55C277E769A450C823A339509F01406875D899460847
      798AFB3D803A7BF733AAE347888FDB74E294E96BC723A339D0900140AABE2B6F
      99521999155A3CF61F3C253E8B40D72E35ECADF99766B4161FB3E9A573B87D05
      8F90A6466306C064DAB9F1AF4697057D04E5F194FAAC20A2C4F75A4675DC18F1
      B19A4F2C93DC47B70EB0D0291A3025743500C86FE437F8069ED45BBEC053AE39
      23ACD8EBBBC40AC5D4ADB7D6E9F70EBF29853A866B79A43425F43100269F3E3A
      F087F8F23085A2C4B796A76C73427889F7DF13CAC30B965E29A8B3EC7EB34BCA
      B2692FB40FB63EC823A6A960880130A9FCB6F40FE955B10191A5012769D3F01B
      8F80E602ADEA6F51239D5C7465EE4B6276CD53F0F9B76E118E3AAF1B28378C31
      00A94C3E9BF65A4C59F062AAF8073C429A02D451FD813A77BBD2AA623D4C1ED6
      C929D18B26B4782DDE2DB863A8ED751E49A6845C06C0E4EAF7B52DB3CFA40CA3
      0EE36265A9DF051A67FFCA234B2ED066E86B5A036D4FAE54862CBC9CF717311B
      CFA62CDAB5FA8F56C9A37DA96FF0168D12EEB7690227516E03D0164ACA2BE32A
      A34268C984411C8D28F57D488D42EFE602D1073EC840AF51418D6B6342457872
      CEB9ACD7BEF8E6C4B353D2F59529EB0BDA0C9B1068EB90EEEDDE2372F098EE4A
      67D96197E6A57E9BB8A964FBED0D2FD126C33AB52AC61B6BEBC595874CA4A4CE
      8C2D0FC98F290BCA8F2F0F9D47B7A7D0ED64DA8E076454C73BADB8B6A8E3E39F
      1EFD7EC97E2ECFE5B93CF3D2A2C5FF0139B337BB9CB978130000000049454E44
      AE426082}
  end
  object lblUUID: TLabel
    Left = 120
    Top = 21
    Width = 33
    Height = 17
    Alignment = taRightJustify
    Caption = 'UUID:'
    FocusControl = edUUID
    Transparent = True
  end
  object lblEmail: TLabel
    Left = 306
    Top = 180
    Width = 39
    Height = 17
    Alignment = taRightJustify
    Caption = 'E-mail:'
    FocusControl = edEmail
    Transparent = True
  end
  object lblNumero: TLabel
    Left = 598
    Top = 115
    Width = 51
    Height = 17
    Alignment = taRightJustify
    Caption = 'N'#250'mero:'
    FocusControl = edNumero
    Transparent = True
  end
  object lblFantasia: TLabel
    Left = 102
    Top = 83
    Width = 50
    Height = 17
    Alignment = taRightJustify
    Caption = 'Fantasia:'
    FocusControl = edFantasia
    Transparent = True
  end
  object lblSenhaAuthCliente: TLabel
    Left = 160
    Top = 270
    Width = 253
    Height = 17
    Caption = 'Senha de autentica'#231#227'o no Firebase Google:'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object edEmpresa: TEdit
    Left = 160
    Top = 48
    Width = 569
    Height = 25
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edCGC: TEdit
    Left = 497
    Top = 79
    Width = 232
    Height = 25
    TabOrder = 3
  end
  object edEndereco: TEdit
    Left = 160
    Top = 112
    Width = 432
    Height = 25
    TabOrder = 4
  end
  object edBairro: TEdit
    Left = 160
    Top = 144
    Width = 249
    Height = 25
    TabOrder = 6
  end
  object edCidade: TEdit
    Left = 472
    Top = 144
    Width = 169
    Height = 25
    TabOrder = 7
  end
  object edUF: TEdit
    Left = 680
    Top = 144
    Width = 49
    Height = 25
    TabOrder = 8
  end
  object edCEP: TEdit
    Left = 160
    Top = 176
    Width = 121
    Height = 25
    TabOrder = 9
  end
  object edCompetencia: TEdit
    Left = 160
    Top = 208
    Width = 121
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnChange = edCompetenciaChange
  end
  object edDataBloqueio: TEdit
    Left = 160
    Top = 240
    Width = 121
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
  end
  object chkSGE: TCheckBox
    Left = 160
    Top = 296
    Width = 321
    Height = 17
    Caption = 'SGE - Sistema de Gest'#227'o Comercial / Empresarial'
    TabOrder = 14
  end
  object chkSGI: TCheckBox
    Left = 160
    Top = 319
    Width = 321
    Height = 17
    Caption = 'SGI - Sistema de Gest'#227'o Industrial'
    TabOrder = 15
  end
  object chkSGF: TCheckBox
    Left = 160
    Top = 342
    Width = 321
    Height = 17
    Caption = 'SGF - Sistema de Gest'#227'o para Folha de Pagamento'
    TabOrder = 16
  end
  object chkSGO: TCheckBox
    Left = 160
    Top = 365
    Width = 321
    Height = 17
    Caption = 'SGO - Sistema para Gest'#227'o de OPME'
    TabOrder = 17
  end
  object edUUID: TEdit
    Left = 160
    Top = 17
    Width = 569
    Height = 25
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 0
  end
  object edEmail: TEdit
    Left = 352
    Top = 176
    Width = 377
    Height = 25
    CharCase = ecLowerCase
    TabOrder = 10
  end
  object dbgClientes: TDBGrid
    Left = 160
    Top = 387
    Width = 727
    Height = 331
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = dtsClientes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ReadOnly = True
    TabOrder = 18
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDblClick = dbgClientesDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'doc'
        Title.Caption = 'Doc'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'cgc'
        Title.Caption = 'CNPJ'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'razao'
        Title.Caption = 'Raz'#227'o'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fantasia'
        Title.Caption = 'Fantasia'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Title.Caption = 'E-mail'
        Width = 245
        Visible = True
      end>
  end
  object edTokenUserID: TEdit
    Left = 287
    Top = 240
    Width = 442
    Height = 25
    Anchors = [akLeft, akTop, akRight]
    ReadOnly = True
    TabOrder = 13
    Visible = False
  end
  object edNumero: TEdit
    Left = 655
    Top = 113
    Width = 74
    Height = 25
    TabOrder = 5
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 722
    Width = 895
    Height = 52
    Align = alBottom
    BevelOuter = bvNone
    Padding.Bottom = 5
    TabOrder = 19
    object BtnCarregarLicenca: TButton
      AlignWithMargins = True
      Left = 289
      Top = 3
      Width = 120
      Height = 41
      Align = alLeft
      Caption = 'Carregar Licen'#231'a'
      TabOrder = 2
      OnClick = BtnCarregarLicencaClick
    end
    object BtnGerarLicenca: TButton
      AlignWithMargins = True
      Left = 415
      Top = 3
      Width = 120
      Height = 41
      Align = alLeft
      Caption = 'Gerar Licen'#231'a'
      TabOrder = 3
      OnClick = BtnGerarLicencaClick
    end
    object PnlEspaco: TPanel
      Left = 0
      Top = 0
      Width = 160
      Height = 47
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
    end
    object BtnNovaLicenca: TButton
      AlignWithMargins = True
      Left = 163
      Top = 3
      Width = 120
      Height = 41
      Align = alLeft
      Caption = 'Nova Licen'#231'a'
      TabOrder = 1
      OnClick = BtnNovaLicencaClick
    end
  end
  object edFantasia: TEdit
    Left = 159
    Top = 79
    Width = 250
    Height = 25
    TabOrder = 2
  end
  object XPManifest: TXPManifest
    Left = 8
    Top = 8
  end
  object opdLicenca: TOpenDialog
    Filter = 'Arquivo Licen'#231'a (*.lnc)|*.lnc'
    Title = 'Carregar arquivo Licen'#231'a'
    Left = 640
    Top = 240
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'name'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'doc'
        DataType = ftString
        Size = 32
      end
      item
        Name = 'uuid'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'cgc'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'razao'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'fantasia'
        DataType = ftString
        Size = 150
      end
      item
        Name = 'email'
        DataType = ftString
        Size = 150
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 640
    Top = 288
  end
  object dtsClientes: TDataSource
    AutoEdit = False
    DataSet = cdsClientes
    Left = 640
    Top = 336
  end
end

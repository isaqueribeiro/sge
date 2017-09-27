inherited frmGeOS: TfrmGeOS
  Left = 388
  Top = 209
  ActiveControl = dbEmpresa
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Controle de OS (Ordens de Servi'#231'os)'
  ClientHeight = 689
  ClientWidth = 1145
  OldCreateOrder = True
  ExplicitWidth = 1161
  ExplicitHeight = 728
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 685
    Width = 1145
    ExplicitTop = 686
    ExplicitWidth = 1145
  end
  inherited Bevel3: TBevel
    Top = 646
    Width = 1145
    ExplicitTop = 647
    ExplicitWidth = 1145
  end
  inherited pgcGuias: TPageControl
    Width = 1145
    Height = 646
    OnChange = pgcGuiasChange
    ExplicitWidth = 1145
    ExplicitHeight = 646
    inherited tbsTabela: TTabSheet
      ExplicitWidth = 1137
      ExplicitHeight = 617
      inherited Bevel4: TBevel
        Top = 551
        Width = 1137
        ExplicitTop = 552
        ExplicitWidth = 1137
      end
      inherited dbgDados: TDBGrid
        Width = 1137
        Height = 551
        Hint = 
          'Dicas:'#13#10'1 - Clique na coluna "L" para visualizar o painel de Leg' +
          'endas'#13#10'2 - Tecle "Enter" ou d'#234' "dois cliques" com o registro sel' +
          'ecionado para visualizar os detalhes'
        ParentShowHint = False
        ShowHint = True
        OnTitleClick = dbgDadosTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Legenda'
            Title.Alignment = taCenter
            Title.Caption = 'L'
            Width = 20
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTROLE'
            Title.Caption = 'No. OS'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_EMISSAO'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Title.Caption = 'Status'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Cliente'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_FATURA'
            Title.Caption = 'Data Fatura'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_OS'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Total OS (R$)'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_APROVADO_SERVICO'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Total Aprov. (R$)'
            Width = 110
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 555
        Width = 1137
        ExplicitTop = 555
        ExplicitWidth = 1137
        object lblOSAberta: TLabel [0]
          Left = 2
          Top = 4
          Width = 73
          Height = 13
          Caption = '* OS Abertas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblOSCancelada: TLabel [1]
          Left = 2
          Top = 22
          Width = 92
          Height = 13
          Caption = '* SO Canceladas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblOSAtrasada: TLabel [2]
          Left = 2
          Top = 40
          Width = 87
          Height = 13
          Caption = '* SO em Atraso'
          Color = clYellow
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        inherited grpBxFiltro: TGroupBox
          Left = 518
          Width = 615
          ExplicitLeft = 518
          ExplicitWidth = 615
          DesignSize = (
            615
            54)
          inherited lbltFiltrar: TLabel
            Left = 294
            Width = 69
            Caption = 'OS / Cliente:'
            ExplicitLeft = 294
            ExplicitWidth = 69
          end
          object lblData: TLabel [1]
            Left = 14
            Top = 25
            Width = 49
            Height = 13
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
          end
          inherited edtFiltrar: TEdit
            Left = 368
            Width = 198
            TabOrder = 2
            ExplicitLeft = 368
            ExplicitWidth = 198
          end
          inherited btnFiltrar: TcxButton
            Left = 570
            TabOrder = 3
            ExplicitLeft = 570
          end
          object e1Data: TDateEdit
            Left = 72
            Top = 21
            Width = 101
            Height = 21
            GlyphKind = gkCustom
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
            NumGlyphs = 2
            TabOrder = 0
            Text = '01/01/2012'
          end
          object e2Data: TDateEdit
            Left = 184
            Top = 21
            Width = 104
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2012'
          end
        end
        object RdgStatusOS: TRadioGroup
          Left = 141
          Top = 4
          Width = 377
          Height = 54
          Hint = 
            'Status:'#13#10#13#10'0 - Editando'#13#10'1 - Aberta'#13#10'2 - Avalia'#231#227'o   (Em avalia'#231 +
            #227'o pelo t'#233'cnico)'#13#10'3 - Parecer     (Parecer lancado pelo t'#233'cnico)' +
            #13#10'4 - Aprovada    (Aprova'#231#227'o dada pelo cliente)'#13#10'5 - Atendimento' +
            ' (Em atendimento pelo t'#233'cnico)'#13#10'6 - Finalizada  (Finalizado o se' +
            'rvico pelo t'#233'cnico)'#13#10'7 - Faturada'#13#10'8 - NFS'#13#10'9 - Cancelada'
          Align = alRight
          Caption = '&Status OS'
          Columns = 4
          ItemIndex = 0
          Items.Strings = (
            '(Todas)'
            'Editando'
            'Aberta'
            'Avalia'#231#227'o'
            'Parecer'
            'Aprovada'
            'Atendimento'
            'Finalizada'
            'Faturada'
            'NFS'
            'Cancelada')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object pnlLegendas: TPanel
        Left = 794
        Top = 256
        Width = 321
        Height = 289
        Anchors = [akRight, akBottom]
        BorderWidth = 4
        Color = clBtnShadow
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Visible = False
        object Label3: TLabel
          Left = 5
          Top = 5
          Width = 311
          Height = 13
          Align = alTop
          Caption = 'Legendas (L) :'
          Transparent = True
          ExplicitWidth = 79
        end
        object bvlLegendas: TBevel
          Left = 5
          Top = 18
          Width = 311
          Height = 4
          Align = alTop
          Shape = bsBottomLine
        end
        object shpOSEmEdicao: TShape
          Left = 16
          Top = 40
          Width = 16
          Height = 16
        end
        object lblStatusOSEdicao: TLabel
          Left = 37
          Top = 42
          Width = 57
          Height = 13
          Caption = 'Em edi'#231#227'o'
          Transparent = True
        end
        object shpOSAberta: TShape
          Left = 16
          Top = 64
          Width = 16
          Height = 16
          Brush.Color = 16727100
        end
        object lblStatusOSAberta: TLabel
          Left = 37
          Top = 66
          Width = 45
          Height = 13
          Caption = 'Abertas'
          Transparent = True
        end
        object shpOSAvaliacao: TShape
          Left = 16
          Top = 88
          Width = 16
          Height = 16
          Brush.Color = clOlive
        end
        object lblStatusOSAvaliacao: TLabel
          Left = 37
          Top = 90
          Width = 241
          Height = 13
          Caption = 'Avalia'#231#227'o (Em avalia'#231#227'o pelo respons'#225'vel)'
          Transparent = True
        end
        object shpOSParecer: TShape
          Left = 16
          Top = 112
          Width = 16
          Height = 16
          Brush.Color = clLime
        end
        object lblStatusOSParecer: TLabel
          Left = 37
          Top = 114
          Width = 219
          Height = 13
          Caption = 'Parecer (Parecer lan'#231'ado pelo t'#233'cnico)'
          Transparent = True
        end
        object shpOSAprovada: TShape
          Left = 16
          Top = 136
          Width = 16
          Height = 16
          Brush.Color = clPurple
        end
        object lblStatusOSAprovada: TLabel
          Left = 37
          Top = 138
          Width = 228
          Height = 13
          Caption = 'Aprovada (Aprova'#231#227'o dada pelo cliente)'
          Transparent = True
        end
        object shpOSAtendimento: TShape
          Left = 16
          Top = 160
          Width = 16
          Height = 16
          Brush.Color = 8421631
        end
        object lblStatusOSAtendimento: TLabel
          Left = 37
          Top = 162
          Width = 251
          Height = 13
          Caption = 'Atendimento (Em atendimento pelo t'#233'cnico)'
          Transparent = True
        end
        object shpOSFinalizada: TShape
          Left = 16
          Top = 184
          Width = 16
          Height = 16
          Brush.Color = 8454143
        end
        object lblStatusOSFinalizada: TLabel
          Left = 37
          Top = 186
          Width = 253
          Height = 13
          Caption = 'Finalizada  (Finalizado o servi'#231'o pelo t'#233'cnico)'
          Transparent = True
        end
        object shpOSFaturada: TShape
          Left = 16
          Top = 208
          Width = 16
          Height = 16
          Brush.Color = clTeal
        end
        object lblStatusOSFaturada: TLabel
          Left = 37
          Top = 210
          Width = 51
          Height = 13
          Caption = 'Faturada'
          Transparent = True
        end
        object shpOSNFSeEmitida: TShape
          Left = 16
          Top = 232
          Width = 16
          Height = 16
          Brush.Color = clMoneyGreen
        end
        object lblStatusOSNFS: TLabel
          Left = 37
          Top = 234
          Width = 82
          Height = 13
          Caption = 'NFS-e emitada'
          Transparent = True
        end
        object shpOSCancelada: TShape
          Left = 16
          Top = 256
          Width = 16
          Height = 16
          Brush.Color = clRed
        end
        object lblStatusOSCancelada: TLabel
          Left = 37
          Top = 258
          Width = 58
          Height = 13
          Caption = 'Cancelada'
          Transparent = True
        end
        object btnFecharLegenda: TSpeedButton
          Left = 299
          Top = 1
          Width = 20
          Height = 20
          Cursor = crHandPoint
          Hint = 'Fechar painel de Legendas'
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            180000000000000600000000000000000000000000000000000000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF00D5C5C4958DAF565B932C32752C2B66494878837386C9ABA100FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C7C7C79898986B6B6B45
            45453D3D3D5656567A7A7AABABAB00FF0000FF0000FF0000FF0000FF0000FF00
            00FF00AFAABF4853A51038A01030B00030C00030C00028B01020802B275C9783
            8700FF0000FF0000FF0000FF0000FF0000FF00B1B1B16A6A6A53535353535356
            56565656564D4D4D3B3B3B37373786868600FF0000FF0000FF0000FF0000FF00
            B5AEC73C51B21038C00030D00030D00030D00030D00030D00030D00028A00E1B
            6496808300FF0000FF0000FF0000FF00B6B6B66C6C6C5D5D5D5B5B5B5B5B5B5B
            5B5B5B5B5B5B5B5B5B5B5B4848482F2F2F83838300FF0000FF0000FF00D9CCD3
            4862B41040D00038E00038E00038E00038E00038D00030D00030D00030D00028
            A02B265BC5A09200FF0000FF00D0D0D078787866666665656565656565656565
            65656060605B5B5B5B5B5B5B5B5B484848363636A0A0A000FF0000FF009EA3CB
            2050C00038F00040F0FFFFFFFFFFFF4070F04068F0FFFFFFFFFFFF0030D00030
            D01020807F697A00FF0000FF00AFAFAF6D6D6D6A6A6A6E6E6EFFFFFFFFFFFF92
            92928D8D8DFFFFFFFFFFFF5B5B5B5B5B5B3B3B3B70707000FF0000FF006E81C5
            2048E00040FF1048FF7098FFFFFFFFFFFFFFFFFFFFFFFFFF6080F00038D00030
            D00028B047427100FF0000FF00949494727272737373797979B3B3B3FFFFFFFF
            FFFFFFFFFFFFFFFF9F9F9F6060605B5B5B4D4D4D50505000FF0000FF004B68C1
            5070FF5078FF3060FF3060FFB0C8FFFFFFFFFFFFFFA0B8FF0038F00038E00030
            D00030C02C296400FF0000FF008080809898989D9D9D8B8B8B8B8B8BD6D6D6FF
            FFFFFFFFFFCBCBCB6A6A6A6565655B5B5B5656563B3B3B00FF0000FF004B68C1
            5078FF5080FF5078FF4070FFB0C8FFFFFFFFFFFFFFA0B8FF0040FF0038E00038
            D00030C02C317300FF0000FF008080809D9D9DA1A1A19D9D9D969696D6D6D6FF
            FFFFFFFFFFCBCBCB73737365656560606056565644444400FF0000FF006E87D1
            5078F06090FF7090FF90B0FFFFFFFFFFFFFFFFFFFFFFFFFF7098FF0038F00038
            E01030B053548900FF0000FF009B9B9B989898ADADADAEAEAEC5C5C5FFFFFFFF
            FFFFFFFFFFFFFFFFB3B3B36A6A6A65656553535364646400FF0000FF009EA7D3
            4068E07098FF80A0FFFFFFFFFFFFFF80A0FF8098FFFFFFFFFFFFFF0040F00038
            E02038A08F7D9A00FF0000FF00B4B4B4888888B3B3B3BABABAFFFFFFFFFFFFBA
            BABAB5B5B5FFFFFFFFFFFF6E6E6E65656555555588888800FF0000FF00DCCFD6
            5677D06080F080A8FF90B0FF80A0FF6080FF4070FF3060FF1048FF0040F01040
            C04750A1CBABA100FF0000FF00D3D3D38E8E8E9F9F9FBEBEBEC5C5C5BABABAA3
            A3A39696968B8B8B7979796E6E6E616161676767ABABAB00FF0000FF0000FF00
            BBB7D35A76D06080F080A0FF80A8FF8098FF6088FF3060FF1048FF1048D03B4F
            B0A898A700FF0000FF0000FF0000FF00C0C0C08E8E8E9F9F9FBABABABEBEBEB5
            B5B5A8A8A88B8B8B7979796B6B6B6A6A6A9E9E9E00FF0000FF0000FF0000FF00
            00FF00BBB6D16477D05070E05078F05080FF5078FF3060E03050D0475FB0AF9E
            B100FF0000FF0000FF0000FF0000FF0000FF00BFBFBF9090908E8E8E989898A1
            A1A19D9D9D828282737373757575A6A6A600FF0000FF0000FF0000FF0000FF00
            00FF0000FF00DBCCD09DA5CF6E86CF4B67C04B67C06D7EC09B9BBFD2BBB900FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF00CFCFCFB1B1B19A9A9A7F
            7F7F7F7F7F909090A6A6A6BDBDBD00FF0000FF0000FF0000FF0000FF0000FF00
            00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
            0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
            FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnFecharLegendaClick
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1137
      ExplicitHeight = 617
      inherited Bevel8: TBevel
        Top = 465
        Width = 1137
        ExplicitTop = 465
        ExplicitWidth = 1137
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 121
        Width = 1137
        Height = 4
        Align = alTop
        Shape = bsSpacer
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1137
        Caption = 'Dados da OS'
        ExplicitWidth = 1137
        inherited lblCodigo: TLabel
          Width = 38
          Caption = 'No. OS:'
          ExplicitWidth = 38
        end
        object lblDataHora: TLabel [1]
          Left = 120
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
        object lblEmpresa: TLabel [2]
          Left = 248
          Top = 24
          Width = 45
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblCliente: TLabel [3]
          Left = 680
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblSerieNFSe: TLabel [4]
          Left = 16
          Top = 64
          Width = 32
          Height = 13
          Caption = 'S'#233'rie:'
          FocusControl = dbSerieNFSe
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblNumeroNFSe: TLabel [5]
          Left = 56
          Top = 64
          Width = 70
          Height = 13
          Caption = 'N'#250'mero NFS:'
          FocusControl = dbNumeroNFSe
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDataEmissaoNFSe: TLabel [6]
          Left = 160
          Top = 64
          Width = 72
          Height = 13
          Caption = 'Emiss'#227'o NFS:'
          FocusControl = dbDataEmissaoNFSe
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCnae: TLabel [7]
          Left = 488
          Top = 64
          Width = 73
          Height = 13
          Caption = 'CNAE Principal:'
          FocusControl = dbCnae
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTecnicoPrincipal: TLabel [8]
          Left = 680
          Top = 64
          Width = 104
          Height = 13
          Caption = 'Respons'#225'vel T'#233'cnico:'
          FocusControl = dbTecnicoPrincipal
        end
        object lblUsuario: TLabel [9]
          Left = 872
          Top = 64
          Width = 101
          Height = 13
          Caption = 'Usu'#225'rio / Atendente:'
          FocusControl = dbUsuario
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblNCM: TLabel [10]
          Left = 581
          Top = 64
          Width = 68
          Height = 13
          Caption = 'NCM Principal:'
          FocusControl = dbNCM
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblDataEmissao: TLabel [11]
          Left = 248
          Top = 64
          Width = 27
          Height = 13
          Caption = 'Data:'
          FocusControl = dbDataEmissao
        end
        object Label1: TLabel [12]
          Left = 368
          Top = 64
          Width = 45
          Height = 13
          Caption = 'Previs'#227'o:'
          FocusControl = dbDataPrevisao
        end
        object lblStatus: TLabel [13]
          Left = 984
          Top = 64
          Width = 40
          Height = 13
          Caption = 'Status:'
          FocusControl = dbStatus
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        inherited dbCodigo: TDBEdit
          Width = 97
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CONTROLE'
          ReadOnly = False
          ExplicitWidth = 97
        end
        object dbDataHora: TDBEdit
          Left = 120
          Top = 40
          Width = 121
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DATA_CADASTRO'
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
        object dbEmpresa: TDBLookupComboBox
          Left = 248
          Top = 40
          Width = 425
          Height = 21
          DataField = 'EMPRESA'
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
          TabOrder = 2
        end
        object dbSerieNFSe: TDBEdit
          Left = 16
          Top = 80
          Width = 33
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFS_SERIE'
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
        object dbNumeroNFSe: TDBEdit
          Left = 56
          Top = 80
          Width = 97
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFS_NUMERO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object dbDataEmissaoNFSe: TDBEdit
          Left = 160
          Top = 80
          Width = 81
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'NFS_DATAEMISSAO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
        object dbTecnicoPrincipal: TDBLookupComboBox
          Left = 680
          Top = 80
          Width = 185
          Height = 21
          DataField = 'VENDEDOR'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'NOME'
          ListSource = dtsVendedorTecnico
          ParentFont = False
          TabOrder = 11
        end
        object dbUsuario: TDBEdit
          Left = 872
          Top = 80
          Width = 105
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 12
        end
        object dbDataEmissao: TJvDBDateEdit
          Left = 248
          Top = 80
          Width = 113
          Height = 21
          DataField = 'DATA_EMISSAO'
          DataSource = DtSrcTabela
          ClickKey = 0
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          ShowNullDate = False
          TabOrder = 7
        end
        object dbDataPrevisao: TJvDBDateEdit
          Left = 368
          Top = 80
          Width = 113
          Height = 21
          DataField = 'DATA_PREVISAO_CONCLUSAO'
          DataSource = DtSrcTabela
          ClickKey = 0
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          ShowNullDate = False
          TabOrder = 8
        end
        object dbStatus: TDBEdit
          Left = 984
          Top = 80
          Width = 137
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'STATUS'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object dbCnae: TJvDBComboEdit
          Left = 487
          Top = 80
          Width = 88
          Height = 21
          ButtonHint = 'Pesquisar CNAE (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'NFS_CNAE'
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
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 9
          OnButtonClick = dbCnaeButtonClick
          OnExit = ControlEditExit
        end
        object dbNCM: TJvDBComboEdit
          Left = 581
          Top = 80
          Width = 93
          Height = 21
          ButtonHint = 'Pesquisar NCM (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clWhite
          DataField = 'NFS_NCM'
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
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 10
          OnButtonClick = dbNCMButtonClick
          OnExit = ControlEditExit
        end
        object dbCliente: TJvDBComboEdit
          Left = 679
          Top = 40
          Width = 442
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME'
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
          NumGlyphs = 2
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 3
          OnButtonClick = dbClienteButtonClick
        end
      end
      object pgcServicoDetalhe: TPageControl
        Left = 0
        Top = 125
        Width = 1137
        Height = 340
        ActivePage = TbsServicoARealizar
        Align = alTop
        TabOrder = 1
        object TbsEquipamento: TTabSheet
          Caption = '&Equipamento(s)'
          ImageIndex = 1
          object Bevel11: TBevel
            Left = 0
            Top = 169
            Width = 1129
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object GrpBxDadosEquipamento: TGroupBox
            Left = 0
            Top = 0
            Width = 1129
            Height = 169
            Align = alTop
            Caption = 'Dados'
            TabOrder = 0
            DesignSize = (
              1129
              169)
            object lblEquipamentoMarca: TLabel
              Left = 800
              Top = 24
              Width = 33
              Height = 13
              Caption = 'Marca:'
              FocusControl = dbEquipamentoMarca
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Bevel10: TBevel
              Left = 2
              Top = 15
              Width = 4
              Height = 152
              Align = alLeft
              Shape = bsSpacer
            end
            object lblEquipamentoModelo: TLabel
              Left = 960
              Top = 24
              Width = 38
              Height = 13
              Caption = 'Modelo:'
              FocusControl = dbEquipamentoModelo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblEquimanetoDescricao: TLabel
              Left = 88
              Top = 24
              Width = 66
              Height = 13
              Caption = 'Equipamento:'
              FocusControl = dbEquimanetoDescricao
            end
            object lblEquipamentoTipo: TLabel
              Left = 640
              Top = 24
              Width = 24
              Height = 13
              Caption = 'Tipo:'
              FocusControl = dbEquipamentoTipo
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblEquipamentoReferencia: TLabel
              Left = 88
              Top = 64
              Width = 56
              Height = 13
              Caption = 'Refer'#234'ncia:'
              FocusControl = dbEquipamentoReferencia
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblEquipamentoSerial: TLabel
              Left = 248
              Top = 64
              Width = 70
              Height = 13
              Caption = 'Serial Number:'
              FocusControl = dbEquipamentoSerial
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblEquipamentoObservacao: TLabel
              Left = 408
              Top = 64
              Width = 67
              Height = 13
              Caption = 'Observa'#231#245'es:'
              FocusControl = dbEquipamentoObservacao
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbEquipamentoMarca: TDBEdit
              Left = 800
              Top = 40
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'MARCA'
              DataSource = dtsOSEquipamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object pnlBotoesEquipamento: TPanel
              Left = 6
              Top = 15
              Width = 70
              Height = 152
              Align = alLeft
              AutoSize = True
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object BtnEquipamentoInserir: TBitBtn
                Left = 0
                Top = 1
                Width = 70
                Height = 25
                Hint = 'Inserir Equipamento'
                Caption = 'Inserir'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000000000000000000000000000000000000000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  B0A0906048306048306048306048306048306048306048306048306048306048
                  300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                  43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                  9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                  E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                  F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                  F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                  F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                  300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                  300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                  D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                  C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                  E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                  FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                  E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                  FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                  BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BtnEquipamentoInserirClick
              end
              object BtnEquipamentoEditar: TBitBtn
                Left = 0
                Top = 25
                Width = 70
                Height = 25
                Hint = 'Editar Equipamento'
                Caption = 'Editar'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  180000000000000600000000000000000000000000000000000000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
                  60483060483060483060483060483060483060483060483060483070504000FF
                  0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
                  43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
                  E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
                  0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
                  C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
                  E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
                  0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
                  AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
                  0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
                  5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
                  0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
                  FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
                  0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
                  B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
                  B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
                  9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
                  10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
                  D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
                  F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
                  B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
                  8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
                  FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
                  E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
                  A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
                  F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
                  B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
                  8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
                  B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
                  CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BtnEquipamentoEditarClick
              end
              object BtnEquipamentoExcluir: TBitBtn
                Left = 0
                Top = 49
                Width = 70
                Height = 25
                Hint = 'Excluir Equipamento'
                Caption = 'Excluir'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
                  70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
                  B0A0906048306048306048307058406050601038C02050D01038C01030B01030
                  A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
                  56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
                  B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
                  C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
                  6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
                  B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
                  FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
                  8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                  B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
                  FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
                  8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                  B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
                  D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
                  8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
                  C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
                  D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
                  DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
                  C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
                  C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
                  C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
                  50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
                  30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
                  30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                  30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
                  D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
                  A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
                  E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                  BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                  FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                  FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                  00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = BtnEquipamentoExcluirClick
              end
              object BtnEquipamentoSalvar: TBitBtn
                Left = 0
                Top = 73
                Width = 70
                Height = 25
                Hint = 'Salvar Equipamento'
                Caption = 'Salvar'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000000000000000000000000000000000000000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  C06860B05850A05050A05050A050509048509048409048408040408038408038
                  407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
                  51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
                  F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
                  30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
                  B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
                  FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
                  40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
                  7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
                  FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
                  40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
                  3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
                  FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
                  50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
                  58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
                  FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
                  50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
                  89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
                  FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
                  60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
                  56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
                  FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
                  10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
                  F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
                  FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
                  20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
                  F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
                  FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
                  30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
                  FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
                  FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
                  30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
                  FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
                  40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
                  FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
                  50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
                  F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
                  80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
                  A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = BtnEquipamentoSalvarClick
              end
              object BtnEquipamentoDevolver: TBitBtn
                Left = 0
                Top = 127
                Width = 70
                Height = 25
                Hint = 'Devolver Equipamento selecionado'
                Caption = 'Devol. '
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  180000000000000600000000000000000000000000000000000000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A06048306048306048
                  3060483060483060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF00A8A8A843434343434343434343434343434343434300FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0FFF0F0F0D8D0E0D0
                  C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300FF0000FF00
                  00FF00A6A3CC1048E01048E01048E000FF0000FF00C0B0A0FFF8F0707070F0E8
                  E0707070E0C8B060483000FF0000FF0000FF00AFAFAF70707070707070707000
                  FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300FF0000FF00
                  00FF004070F09E9FD300FF0000FF0000FF0000FF00D0B0A0FFFFFFFFF8F0FFF0
                  F0F0E8E0E0D0C060483000FF0000FF0000FF00919191AEAEAE00FF0000FF0000
                  FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300FF0000FF00
                  00FF001048F000FF0000FF0000FF0000FF0000FF00D0B8A0FFFFFF808880FFF8
                  F0707070F0D8D060483000FF0000FF0000FF0074747400FF0000FF0000FF0000
                  FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300FF0000FF00
                  6080F03058F01048E000FF0000FF0000FF0000FF00D0B0A0FFFFFFFFFFFFFFFF
                  FFFFF8F0FFF0F060483000FF0000FF009E9E9E81818170707000FF0000FF0000
                  FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300FF0000FF00
                  D0CEE080A0FFD0CADC00FF0000FF0000FF0000FF00C0B0A0C0B0A0C0B0A0C0B0
                  A0C0B0A0C0A8A0C0A8A000FF0000FF00D3D3D3B9B9B9D0D0D000FF0000FF0000
                  FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A8A0604830
                  60483060483060483060483060483000FF0000FF0000FF0000FF00D5D1E31048
                  E0D1CFE100FF0000FF00A8A8A843434343434343434343434343434343434300
                  FF0000FF0000FF0000FF00D6D6D6707070D4D4D400FF0000FF00C0A8A0FFF0F0
                  F0D8D0E0D0C0E0C8B0E0C0B060483000FF0000FF0000FF0000FF0080A0FF3060
                  F01048E000FF0000FF00A8A8A8F1F1F1D8D8D8CCCCCCC3C3C3BEBEBE43434300
                  FF0000FF0000FF0000FF00B9B9B986868670707000FF0000FF00C0B0A0FFF8F0
                  707070F0E8E0707070E0C8B060483000FF0000FF0000FF0000FF0000FF004070
                  F000FF0000FF0000FF00ACACACF6F6F6707070E6E6E6707070C3C3C343434300
                  FF0000FF0000FF0000FF0000FF0091919100FF0000FF0000FF00D0B0A0FFFFFF
                  FFF8F0FFF0F0F0E8E0E0D0C060483000FF0000FF0000FF0000FF00AEB7EA1048
                  F000FF0000FF0000FF00AEAEAEFFFFFFF6F6F6F1F1F1E6E6E6CCCCCC43434300
                  FF0000FF0000FF0000FF00C5C5C574747400FF0000FF0000FF00D0B8A0FFFFFF
                  808880FFF8F0707070F0D8D060483000FF0000FF006088F07090F07090F0A8B6
                  EB00FF0000FF0000FF00B3B3B3FFFFFF848484F6F6F6707070D8D8D843434300
                  FF0000FF00A3A3A3A9A9A9A9A9A9C4C4C400FF0000FF0000FF00D0B0A0FFFFFF
                  FFFFFFFFFFFFFFF8F0FFF0F060483000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF00AEAEAEFFFFFFFFFFFFFFFFFFF6F6F6F1F1F143434300
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0B0A0C0B0A0
                  C0B0A0C0B0A0C0B0A0C0A8A0C0A8A000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF00ACACACACACACACACACACACACACACACA8A8A8A8A8A800
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = BtnEquipamentoDevolverClick
              end
            end
            object dbEquipamentoModelo: TDBEdit
              Left = 960
              Top = 40
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'MODELO'
              DataSource = dtsOSEquipamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object dbEquipamentoTipo: TDBEdit
              Left = 640
              Top = 40
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'TIPO'
              DataSource = dtsOSEquipamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object dbEquipamentoReferencia: TDBEdit
              Left = 88
              Top = 80
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'REFERENCIA'
              DataSource = dtsOSEquipamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object dbEquipamentoSerial: TDBEdit
              Left = 248
              Top = 80
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'SERIAL'
              DataSource = dtsOSEquipamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
            object dbEquipamentoObservacao: TDBMemo
              Left = 408
              Top = 80
              Width = 705
              Height = 73
              Anchors = [akLeft, akTop, akBottom]
              Color = clWhite
              DataField = 'OBSERVACAO'
              DataSource = dtsOSEquipamentos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 7
              OnExit = ControlEditExit
            end
            object dbEquimanetoDescricao: TJvDBComboEdit
              Left = 88
              Top = 40
              Width = 545
              Height = 21
              ButtonHint = 'Pesquisar Equipamento (Ctrl+P)'
              CharCase = ecUpperCase
              ClickKey = 16464
              Color = clMoneyGreen
              DataField = 'DESCRICAO'
              DataSource = dtsOSEquipamentos
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
              OnButtonClick = dbEquimanetoDescricaoButtonClick
            end
          end
          object dbgEquipamentos: TDBGrid
            Left = 0
            Top = 173
            Width = 712
            Height = 139
            TabStop = False
            Align = alClient
            DataSource = dtsOSEquipamentos
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'EQUIPAMENTO'
                Title.Alignment = taCenter
                Title.Caption = '#'
                Width = 23
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Width = 350
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'USUARIO'
                Title.Caption = 'Usu'#225'rio'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEVOLVIDO'
                Title.Alignment = taCenter
                Title.Caption = 'Devolvido'
                Visible = True
              end>
          end
          object pnlEquipamentoEntrega: TPanel
            Left = 712
            Top = 173
            Width = 417
            Height = 139
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            Visible = False
            object GrpBxEquipamentoEntrega: TGroupBox
              Left = 0
              Top = 0
              Width = 417
              Height = 139
              Align = alClient
              Caption = 'Dados da Devolu'#231#227'o (Entrega ao Cliente)'
              TabOrder = 0
              DesignSize = (
                417
                139)
              object lblEquipamentoDataEntrega: TLabel
                Left = 16
                Top = 16
                Width = 27
                Height = 13
                Caption = 'Data:'
                FocusControl = dbEquipamentoDataEntrega
              end
              object lblEquipamentoHoraEntrega: TLabel
                Left = 136
                Top = 16
                Width = 27
                Height = 13
                Caption = 'Hora:'
                FocusControl = dbEquipamentoHoraEntrega
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object lblEquipamentoTecnicoEntrega: TLabel
                Left = 209
                Top = 16
                Width = 40
                Height = 13
                Caption = 'T'#233'cnico:'
                FocusControl = dbEquipamentoTecnicoEntrega
              end
              object lblEquipamentoEstadoEntrega: TLabel
                Left = 16
                Top = 56
                Width = 131
                Height = 13
                Caption = 'Breve descri'#231#227'o do Estado:'
                FocusControl = dbEquipamentoEstadoEntrega
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object dbEquipamentoDataEntrega: TJvDBDateEdit
                Left = 16
                Top = 32
                Width = 113
                Height = 21
                DataField = 'DATA_ENTREGA'
                DataSource = dtsOSEquipamentos
                ClickKey = 0
                Color = clWhite
                DialogTitle = 'Selecione a data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                NumGlyphs = 2
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                ShowNullDate = False
                TabOrder = 0
              end
              object dbEquipamentoHoraEntrega: TDBEdit
                Left = 136
                Top = 32
                Width = 65
                Height = 21
                Color = clWhite
                DataField = 'HORA_ENTREGA'
                DataSource = dtsOSEquipamentos
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object dbEquipamentoTecnicoEntrega: TDBLookupComboBox
                Left = 208
                Top = 32
                Width = 193
                Height = 21
                DataField = 'TECNICO'
                DataSource = dtsOSEquipamentos
                DropDownRows = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                KeyField = 'COD'
                ListField = 'NOME'
                ListSource = dtsVendedorTecnico
                ParentFont = False
                TabOrder = 2
              end
              object dbEquipamentoEstadoEntrega: TDBMemo
                Left = 16
                Top = 72
                Width = 385
                Height = 52
                Anchors = [akLeft, akTop, akRight, akBottom]
                Color = clWhite
                DataField = 'ESTADO_ENTREGA'
                DataSource = dtsOSEquipamentos
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 3
                OnExit = ControlEditExit
              end
            end
          end
        end
        object TbsServicoARealizar: TTabSheet
          Caption = '&Servi'#231'o(s) a realizar'
          object Bevel6: TBevel
            Left = 0
            Top = 112
            Width = 1129
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object pnlRelatoSolicitacao: TPanel
            Left = 0
            Top = 0
            Width = 1129
            Height = 112
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object lblRelatoSolicitacao: TLabel
              Left = 0
              Top = 0
              Width = 1129
              Height = 13
              Align = alTop
              Caption = 'Relato / Solicita'#231#227'o:'
              ExplicitWidth = 113
            end
            object Bevel15: TBevel
              Left = 0
              Top = 13
              Width = 1129
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbRelatoSolicitacao: TDBMemo
              Left = 0
              Top = 17
              Width = 1129
              Height = 95
              Align = alClient
              DataField = 'RELATO_SOLICITACAO'
              DataSource = DtSrcTabela
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object pgcServicoProduto: TPageControl
            Left = 0
            Top = 116
            Width = 1129
            Height = 196
            ActivePage = TbsProduto
            Align = alClient
            Images = imgOS
            TabOrder = 1
            object TbsServico: TTabSheet
              Caption = 'Servi'#231'o(s)'
              ImageIndex = 2
              object Bevel13: TBevel
                Left = 601
                Top = 0
                Width = 4
                Height = 167
                Align = alLeft
                Shape = bsSpacer
              end
              object GrpBxDadosServico: TGroupBox
                Left = 0
                Top = 0
                Width = 601
                Height = 167
                Align = alLeft
                Caption = 'Dados'
                TabOrder = 0
                object lblServico: TLabel
                  Left = 88
                  Top = 24
                  Width = 39
                  Height = 13
                  Caption = 'Servi'#231'o:'
                end
                object lblServicoQuantidade: TLabel
                  Left = 168
                  Top = 64
                  Width = 38
                  Height = 13
                  Caption = 'Quant.:'
                  FocusControl = dbServicoQuantidade
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblServicoValorUnit: TLabel
                  Left = 304
                  Top = 64
                  Width = 92
                  Height = 13
                  Caption = 'Valor Unit'#225'rio (R$):'
                  FocusControl = dbServicoValorUnit
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblServicoDesconto: TLabel
                  Left = 88
                  Top = 104
                  Width = 45
                  Height = 13
                  Caption = '% Desc.:'
                  FocusControl = dbServicoDesconto
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblServicoTotalLiquido: TLabel
                  Left = 424
                  Top = 104
                  Width = 88
                  Height = 13
                  Caption = 'Total L'#237'quido (R$):'
                  FocusControl = dbServicoTotalLiquido
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblServicoAliquota: TLabel
                  Left = 88
                  Top = 64
                  Width = 57
                  Height = 13
                  Caption = '% Al'#237'quota:'
                  FocusControl = dbServicoAliquota
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Bevel12: TBevel
                  Left = 2
                  Top = 15
                  Width = 4
                  Height = 150
                  Align = alLeft
                  Shape = bsSpacer
                end
                object lblServicoTotalDesconto: TLabel
                  Left = 168
                  Top = 104
                  Width = 82
                  Height = 13
                  Caption = 'Total Desc. (R$):'
                  FocusControl = dbServicoTotalDesconto
                end
                object lblServicoValorFinal: TLabel
                  Left = 304
                  Top = 104
                  Width = 77
                  Height = 13
                  Caption = 'Valor Final (R$):'
                  FocusControl = dbServicoValorFinal
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblServicoUnidade: TLabel
                  Left = 240
                  Top = 64
                  Width = 27
                  Height = 13
                  Caption = 'Und.:'
                  FocusControl = dbServicoUnidade
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object dbServicoNome: TDBEdit
                  Left = 184
                  Top = 40
                  Width = 401
                  Height = 21
                  TabStop = False
                  Color = clMoneyGreen
                  DataField = 'DESCRI_APRESENTACAO'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbServicoQuantidade: TDBEdit
                  Left = 168
                  Top = 80
                  Width = 65
                  Height = 21
                  Color = clWhite
                  DataField = 'QTDE'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = ControlEditExit
                end
                object dbServicoValorUnit: TDBEdit
                  Left = 304
                  Top = 80
                  Width = 113
                  Height = 21
                  Color = clMoneyGreen
                  DataField = 'PUNIT'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                  OnExit = ControlEditExit
                end
                object dbServicoDesconto: TDBEdit
                  Left = 88
                  Top = 120
                  Width = 74
                  Height = 21
                  Color = clWhite
                  DataField = 'DESCONTO'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                  OnExit = ControlEditExit
                end
                object dbServicoTotalLiquido: TDBEdit
                  Left = 424
                  Top = 120
                  Width = 113
                  Height = 21
                  Color = clMoneyGreen
                  DataField = 'TOTAL_LIQUIDO'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 10
                  OnExit = ControlEditExit
                end
                object dbServicoAliquota: TDBEdit
                  Left = 88
                  Top = 80
                  Width = 73
                  Height = 21
                  TabStop = False
                  Color = clMoneyGreen
                  DataField = 'ALIQUOTA'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object pnlBotoesServico: TPanel
                  Left = 6
                  Top = 15
                  Width = 70
                  Height = 150
                  Align = alLeft
                  AutoSize = True
                  BevelOuter = bvNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object BtnServicoInserir: TBitBtn
                    Tag = 6
                    Left = 0
                    Top = 1
                    Width = 70
                    Height = 25
                    Hint = 'Inserir Servi'#231'o'
                    Caption = 'Inserir'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      18000000000000060000000000000000000000000000000000000000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      B0A0906048306048306048306048306048306048306048306048306048306048
                      300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                      43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                      9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                      E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                      F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                      F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                      F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                      300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                      300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                      D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                      C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                      E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                      FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                      E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                      FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                      BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    OnClick = BtnServicoInserirClick
                  end
                  object BtnServicoEditar: TBitBtn
                    Tag = 6
                    Left = 0
                    Top = 25
                    Width = 70
                    Height = 25
                    Hint = 'Editar Servi'#231'o'
                    Caption = 'Editar'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      180000000000000600000000000000000000000000000000000000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
                      60483060483060483060483060483060483060483060483060483070504000FF
                      0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
                      43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
                      E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
                      0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
                      C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
                      E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
                      0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
                      AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
                      5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
                      FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
                      B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
                      B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
                      9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
                      10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
                      D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
                      F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
                      B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
                      8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
                      FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
                      E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
                      A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
                      F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
                      B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
                      8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
                      B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
                      CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = BtnServicoEditarClick
                  end
                  object BtnServicoExcluir: TBitBtn
                    Tag = 6
                    Left = 0
                    Top = 49
                    Width = 70
                    Height = 25
                    Hint = 'Excluir Servi'#231'o'
                    Caption = 'Excluir'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
                      70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
                      B0A0906048306048306048307058406050601038C02050D01038C01030B01030
                      A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
                      56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
                      B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
                      C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
                      6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
                      FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
                      8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
                      FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
                      8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
                      D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
                      8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
                      C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
                      D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
                      DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
                      C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
                      C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
                      C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
                      50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
                      A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
                      E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                      BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnClick = BtnServicoExcluirClick
                  end
                  object BtnServicoSalvar: TBitBtn
                    Left = 0
                    Top = 73
                    Width = 70
                    Height = 25
                    Hint = 'Salvar Servi'#231'o'
                    Caption = 'Salvar'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      18000000000000060000000000000000000000000000000000000000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      C06860B05850A05050A05050A050509048509048409048408040408038408038
                      407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
                      51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
                      F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
                      30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
                      B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
                      FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
                      40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
                      7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
                      FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
                      40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
                      3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
                      FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
                      50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
                      58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
                      FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
                      50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
                      89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
                      FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
                      60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
                      56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
                      FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
                      10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
                      F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
                      FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
                      20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
                      F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
                      FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
                      30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
                      FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
                      FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
                      30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
                      FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
                      40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
                      FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
                      50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
                      F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
                      80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
                      A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    OnClick = BtnServicoSalvarClick
                  end
                  object BtnServicoAprovar: TBitBtn
                    Left = 0
                    Top = 125
                    Width = 70
                    Height = 25
                    Hint = 'Aprovado pelo cliente'
                    Caption = 'Aprova'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      180000000000000600000000000000000000000000000000000000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
                      60483060483060483060483060483060483060483060483060483060483000FF
                      0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
                      434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
                      FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
                      0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
                      B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
                      9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
                      CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
                      9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                      FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
                      0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
                      E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                      FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
                      0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
                      C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
                      E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
                      0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
                      6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
                      90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
                      3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
                      C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
                      E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
                      B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
                      6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
                      D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
                      E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
                      DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
                      00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
                      F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
                      5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
                      00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
                      D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
                      DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
                      90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
                      A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                    OnClick = BtnServicoAprovarClick
                  end
                end
                object dbServicoAprovado: TDBCheckBox
                  Left = 88
                  Top = 144
                  Width = 121
                  Height = 17
                  Caption = 'Servi'#231'o Aprovado'
                  DataField = 'APROVADO'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 11
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object dbServicoValorFinal: TDBEdit
                  Left = 304
                  Top = 120
                  Width = 113
                  Height = 21
                  Color = clMoneyGreen
                  DataField = 'PFINAL'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 9
                  OnExit = ControlEditExit
                end
                object dbServicoUnidade: TDBEdit
                  Left = 240
                  Top = 80
                  Width = 57
                  Height = 21
                  TabStop = False
                  Color = clMoneyGreen
                  DataField = 'UNP_SIGLA'
                  DataSource = dtsOSServicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
                object dbServico: TJvDBComboEdit
                  Left = 88
                  Top = 40
                  Width = 90
                  Height = 21
                  ButtonHint = 'Pesquisar Servi'#231'o (Ctrl+P)'
                  CharCase = ecUpperCase
                  ClickKey = 16464
                  Color = clWhite
                  DataField = 'SERVICO'
                  DataSource = dtsOSServicos
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
                  OnButtonClick = dbServicoButtonClick
                  OnExit = ControlEditExit
                end
                object dbServicoTotalDesconto: TJvDBComboEdit
                  Left = 168
                  Top = 120
                  Width = 129
                  Height = 21
                  ButtonHint = 'Lan'#231'ar Valor Total do Desconto (Ctrl+D)'
                  CharCase = ecUpperCase
                  ClickKey = 16452
                  Color = clMoneyGreen
                  DataField = 'TOTAL_DESCONTO'
                  DataSource = dtsOSServicos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    180000000000000600000000000000000000000000000000000000FF0000FF00
                    00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                    0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                    FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
                    60483060483060483060483060483060483060483060483060483060483000FF
                    0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
                    434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
                    FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
                    0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
                    B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                    C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
                    0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
                    9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                    FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
                    0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
                    CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                    B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
                    0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
                    9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                    FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
                    0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
                    E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                    FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
                    0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
                    C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
                    E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
                    0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
                    6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
                    90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
                    3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
                    C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
                    E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
                    B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
                    6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
                    D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
                    E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
                    DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
                    00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
                    F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
                    5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
                    00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
                    D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
                    DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
                    00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
                    90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
                    A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
                    00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                    0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                    FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
                  NumGlyphs = 2
                  ParentFont = False
                  ParentShowHint = False
                  ReadOnly = True
                  ShowHint = True
                  TabOrder = 8
                  OnButtonClick = dbServicoTotalDescontoButtonClick
                  OnExit = ControlEditExit
                end
              end
              object dbgServicos: TDBGrid
                Left = 605
                Top = 0
                Width = 516
                Height = 167
                TabStop = False
                Align = alClient
                DataSource = dtsOSServicos
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
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
                    Title.Caption = '#'
                    Width = 23
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'APROVADO'
                    Title.Alignment = taCenter
                    Title.Caption = 'A'
                    Width = 23
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SERVICO'
                    Title.Caption = 'C'#243'digo'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRI_APRESENTACAO'
                    Title.Caption = 'Servi'#231'o'
                    Width = 330
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QTDE'
                    Title.Caption = 'Quant.'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNP_SIGLA'
                    Title.Caption = 'Und.'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PFINAL'
                    Title.Caption = 'Pre'#231'o Final (R$)'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_BRUTO'
                    Title.Caption = 'Total Bruto (R$)'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_DESCONTO'
                    Title.Caption = 'Descontos (R$)'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_LIQUIDO'
                    Title.Caption = 'Total L'#237'q. (R$)'
                    Width = 100
                    Visible = True
                  end>
              end
            end
            object TbsProduto: TTabSheet
              Caption = 'Insumo(s) / Produto(s)'
              ImageIndex = 3
              object Bevel16: TBevel
                Left = 601
                Top = 0
                Width = 4
                Height = 167
                Align = alLeft
                Shape = bsSpacer
              end
              object GrpBxDadosProduto: TGroupBox
                Left = 0
                Top = 0
                Width = 601
                Height = 167
                Align = alLeft
                Caption = 'Dados'
                TabOrder = 0
                object lblProduto: TLabel
                  Left = 88
                  Top = 24
                  Width = 42
                  Height = 13
                  Caption = 'Produto:'
                end
                object lblProdutoQuantidade: TLabel
                  Left = 168
                  Top = 64
                  Width = 38
                  Height = 13
                  Caption = 'Quant.:'
                  FocusControl = dbProdutoQuantidade
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblProdutoValorUnit: TLabel
                  Left = 304
                  Top = 64
                  Width = 92
                  Height = 13
                  Caption = 'Valor Unit'#225'rio (R$):'
                  FocusControl = dbProdutoValorUnit
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblProdutoDesconto: TLabel
                  Left = 88
                  Top = 104
                  Width = 45
                  Height = 13
                  Caption = '% Desc.:'
                  FocusControl = dbProdutoDesconto
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblProdutoTotalLiquido: TLabel
                  Left = 424
                  Top = 104
                  Width = 88
                  Height = 13
                  Caption = 'Total L'#237'quido (R$):'
                  FocusControl = dbProdutoTotalLiquido
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblProdutoAliquota: TLabel
                  Left = 88
                  Top = 64
                  Width = 57
                  Height = 13
                  Caption = '% Al'#237'quota:'
                  FocusControl = dbProdutoAliquota
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Bevel14: TBevel
                  Left = 2
                  Top = 15
                  Width = 4
                  Height = 150
                  Align = alLeft
                  Shape = bsSpacer
                end
                object lblProdutoTotalDesconto: TLabel
                  Left = 168
                  Top = 104
                  Width = 82
                  Height = 13
                  Caption = 'Total Desc. (R$):'
                  FocusControl = dbProdutoTotalDesconto
                end
                object lblProdutoValorFinal: TLabel
                  Left = 304
                  Top = 104
                  Width = 77
                  Height = 13
                  Caption = 'Valor Final (R$):'
                  FocusControl = dbProdutoValorFinal
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblProdutoUnidade: TLabel
                  Left = 240
                  Top = 64
                  Width = 27
                  Height = 13
                  Caption = 'Und.:'
                  FocusControl = dbProdutoUnidade
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object dbProdutoNome: TDBEdit
                  Left = 184
                  Top = 40
                  Width = 401
                  Height = 21
                  TabStop = False
                  Color = clMoneyGreen
                  DataField = 'DESCRI_APRESENTACAO'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 2
                end
                object dbProdutoQuantidade: TDBEdit
                  Left = 168
                  Top = 80
                  Width = 65
                  Height = 21
                  Color = clWhite
                  DataField = 'QTDE'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = ControlEditExit
                end
                object dbProdutoValorUnit: TDBEdit
                  Left = 304
                  Top = 80
                  Width = 113
                  Height = 21
                  Color = clMoneyGreen
                  DataField = 'PUNIT'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 6
                  OnExit = ControlEditExit
                end
                object dbProdutoDesconto: TDBEdit
                  Left = 88
                  Top = 120
                  Width = 74
                  Height = 21
                  Color = clWhite
                  DataField = 'DESCONTO'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 7
                  OnExit = ControlEditExit
                end
                object dbProdutoTotalLiquido: TDBEdit
                  Left = 424
                  Top = 120
                  Width = 113
                  Height = 21
                  Color = clMoneyGreen
                  DataField = 'TOTAL_LIQUIDO'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 10
                  OnExit = ControlEditExit
                end
                object dbProdutoAliquota: TDBEdit
                  Left = 88
                  Top = 80
                  Width = 73
                  Height = 21
                  TabStop = False
                  Color = clMoneyGreen
                  DataField = 'ALIQUOTA'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 3
                end
                object pnlBotoesProduto: TPanel
                  Left = 6
                  Top = 15
                  Width = 70
                  Height = 150
                  Align = alLeft
                  AutoSize = True
                  BevelOuter = bvNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object BtnProdutoInserir: TBitBtn
                    Tag = 7
                    Left = 0
                    Top = 1
                    Width = 70
                    Height = 25
                    Hint = 'Inserir Produto'
                    Caption = 'Inserir'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      18000000000000060000000000000000000000000000000000000000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      B0A0906048306048306048306048306048306048306048306048306048306048
                      300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                      43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                      9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                      E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                      F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                      F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                      F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                      300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                      300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                      D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                      C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                      E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                      FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                      E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                      FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                      BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    OnClick = BtnProdutoInserirClick
                  end
                  object BtnProdutoEditar: TBitBtn
                    Tag = 7
                    Left = 0
                    Top = 25
                    Width = 70
                    Height = 25
                    Hint = 'Editar Produto'
                    Caption = 'Editar'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      180000000000000600000000000000000000000000000000000000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
                      60483060483060483060483060483060483060483060483060483070504000FF
                      0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
                      43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
                      E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
                      0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
                      C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
                      E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
                      0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
                      AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
                      5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
                      FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
                      B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
                      B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
                      9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
                      10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
                      D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
                      F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
                      B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
                      8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
                      FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
                      E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
                      A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
                      F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
                      B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
                      8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
                      B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
                      CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = BtnProdutoEditarClick
                  end
                  object BtnProdutoExcluir: TBitBtn
                    Tag = 7
                    Left = 0
                    Top = 49
                    Width = 70
                    Height = 25
                    Hint = 'Excluir Produto'
                    Caption = 'Excluir'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
                      70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
                      B0A0906048306048306048307058406050601038C02050D01038C01030B01030
                      A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
                      56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
                      B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
                      C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
                      6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
                      FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
                      8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
                      FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
                      8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
                      D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
                      8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
                      C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
                      D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
                      DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
                      C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
                      C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
                      C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
                      50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
                      A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
                      E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                      BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnClick = BtnProdutoExcluirClick
                  end
                  object BtnProdutoSalvar: TBitBtn
                    Left = 0
                    Top = 73
                    Width = 70
                    Height = 25
                    Hint = 'Salvar Produto'
                    Caption = 'Salvar'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      18000000000000060000000000000000000000000000000000000000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      C06860B05850A05050A05050A050509048509048409048408040408038408038
                      407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
                      51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
                      F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
                      30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
                      B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
                      FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
                      40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
                      7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
                      FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
                      40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
                      3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
                      FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
                      50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
                      58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
                      FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
                      50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
                      89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
                      FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
                      60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
                      56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
                      FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
                      10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
                      F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
                      FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
                      20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
                      F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
                      FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
                      30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
                      FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
                      FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
                      30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
                      FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
                      40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
                      FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
                      50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
                      F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
                      80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
                      A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    OnClick = BtnProdutoSalvarClick
                  end
                  object BtnProdutoAprovar: TBitBtn
                    Left = 0
                    Top = 125
                    Width = 70
                    Height = 25
                    Hint = 'Aprovado pelo cliente'
                    Caption = 'Aprova'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      180000000000000600000000000000000000000000000000000000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
                      60483060483060483060483060483060483060483060483060483060483000FF
                      0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
                      434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
                      FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
                      0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
                      B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
                      9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
                      CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
                      9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                      FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
                      0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
                      E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                      FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
                      0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
                      C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
                      E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
                      0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
                      6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
                      90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
                      3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
                      C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
                      E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
                      B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
                      6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
                      D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
                      E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
                      DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
                      00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
                      F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
                      5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
                      00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
                      D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
                      DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
                      90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
                      A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                    OnClick = BtnProdutoAprovarClick
                  end
                end
                object dbProdutoAprovado: TDBCheckBox
                  Left = 88
                  Top = 144
                  Width = 241
                  Height = 17
                  Caption = 'Produto Aprovado (Incluir valor na OS)'
                  DataField = 'APROVADO'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 11
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object dbProdutoValorFinal: TDBEdit
                  Left = 304
                  Top = 120
                  Width = 113
                  Height = 21
                  Color = clMoneyGreen
                  DataField = 'PFINAL'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 9
                  OnExit = ControlEditExit
                end
                object dbProdutoUnidade: TDBEdit
                  Left = 240
                  Top = 80
                  Width = 57
                  Height = 21
                  TabStop = False
                  Color = clMoneyGreen
                  DataField = 'UNP_SIGLA'
                  DataSource = dtsOSProdutos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 5
                end
                object dbProduto: TJvDBComboEdit
                  Left = 88
                  Top = 40
                  Width = 90
                  Height = 21
                  ButtonHint = 'Pesquisar Produto (Ctrl+P)'
                  CharCase = ecUpperCase
                  ClickKey = 16464
                  Color = clWhite
                  DataField = 'PRODUTO'
                  DataSource = dtsOSProdutos
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
                  OnButtonClick = dbProdutoButtonClick
                  OnExit = ControlEditExit
                end
                object dbProdutoTotalDesconto: TJvDBComboEdit
                  Left = 168
                  Top = 120
                  Width = 129
                  Height = 21
                  ButtonHint = 'Lan'#231'ar Valor Total do Desconto (Ctrl+D)'
                  CharCase = ecUpperCase
                  ClickKey = 16452
                  Color = clMoneyGreen
                  DataField = 'TOTAL_DESCONTO'
                  DataSource = dtsOSProdutos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Glyph.Data = {
                    36060000424D3606000000000000360000002800000020000000100000000100
                    180000000000000600000000000000000000000000000000000000FF0000FF00
                    00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                    0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                    FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
                    60483060483060483060483060483060483060483060483060483060483000FF
                    0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
                    434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
                    FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
                    0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
                    B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                    C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
                    0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
                    9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                    FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
                    0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
                    CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                    B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
                    0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
                    9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                    FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
                    0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
                    E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                    FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
                    0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
                    C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
                    E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
                    0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
                    6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
                    90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
                    3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
                    C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
                    E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
                    B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
                    6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
                    D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
                    E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
                    DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
                    00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
                    F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
                    5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
                    00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
                    D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
                    DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
                    00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
                    90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
                    A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
                    00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                    0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                    FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
                  NumGlyphs = 2
                  ParentFont = False
                  ParentShowHint = False
                  ReadOnly = True
                  ShowHint = True
                  TabOrder = 8
                  OnButtonClick = dbProdutoTotalDescontoButtonClick
                  OnExit = ControlEditExit
                end
              end
              object dbgProdutos: TDBGrid
                Left = 605
                Top = 0
                Width = 516
                Height = 167
                TabStop = False
                Align = alClient
                DataSource = dtsOSProdutos
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
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
                    Title.Caption = '#'
                    Width = 23
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'APROVADO'
                    Title.Alignment = taCenter
                    Title.Caption = 'A'
                    Width = 23
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PRODUTO'
                    Title.Caption = 'C'#243'digo'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRI_APRESENTACAO'
                    Title.Caption = 'Produto'
                    Width = 330
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'QTDE'
                    Title.Caption = 'Quant.'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'UNP_SIGLA'
                    Title.Caption = 'Und.'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PFINAL'
                    Title.Caption = 'Pre'#231'o Final (R$)'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_BRUTO'
                    Title.Caption = 'Total Bruto (R$)'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_DESCONTO'
                    Title.Caption = 'Descontos (R$)'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TOTAL_LIQUIDO'
                    Title.Caption = 'Total L'#237'q. (R$)'
                    Width = 100
                    Visible = True
                  end>
              end
            end
            object TbsTecnico: TTabSheet
              Caption = 'T'#233'cnico(s)'
              ImageIndex = 4
              object Bevel18: TBevel
                Left = 489
                Top = 0
                Width = 4
                Height = 167
                Align = alLeft
                Shape = bsSpacer
              end
              object GrpBxDadosTecnico: TGroupBox
                Left = 0
                Top = 0
                Width = 489
                Height = 167
                Align = alLeft
                Caption = 'Dados p/ Comiss'#227'o'
                TabOrder = 0
                object lblTecnico: TLabel
                  Left = 88
                  Top = 24
                  Width = 40
                  Height = 13
                  Caption = 'T'#233'cnico:'
                  FocusControl = dbTecnico
                end
                object lblTecnicoTipoComissao: TLabel
                  Left = 88
                  Top = 64
                  Width = 97
                  Height = 13
                  Caption = 'Tipo de lan'#231'amento:'
                  FocusControl = dbTecnicoTipoComissao
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object Bevel17: TBevel
                  Left = 2
                  Top = 15
                  Width = 4
                  Height = 150
                  Align = alLeft
                  Shape = bsSpacer
                end
                object lblTecnicoPercentualComissao: TLabel
                  Left = 264
                  Top = 64
                  Width = 63
                  Height = 13
                  Caption = '% Comiss'#227'o:'
                  FocusControl = dbTecnicoPercentualComissao
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object lblTecnicoValorComissao: TLabel
                  Left = 352
                  Top = 64
                  Width = 100
                  Height = 13
                  Caption = 'Valor Comiss'#227'o (R$):'
                  FocusControl = dbTecnicoValorComissao
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                end
                object pnlBotoesTecnico: TPanel
                  Left = 6
                  Top = 15
                  Width = 70
                  Height = 150
                  Align = alLeft
                  AutoSize = True
                  BevelOuter = bvNone
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                  object BtnTecnicoInserir: TBitBtn
                    Tag = 8
                    Left = 0
                    Top = 1
                    Width = 70
                    Height = 25
                    Hint = 'Inserir T'#233'cnico'
                    Caption = 'Inserir'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      18000000000000060000000000000000000000000000000000000000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      B0A0906048306048306048306048306048306048306048306048306048306048
                      300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                      43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                      9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                      E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                      F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                      300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                      F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                      F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                      300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                      300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                      D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                      300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                      D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                      C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                      E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                      FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                      E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                      FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                      BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    OnClick = BtnTecnicoInserirClick
                  end
                  object BtnTecnicoEditar: TBitBtn
                    Tag = 8
                    Left = 0
                    Top = 25
                    Width = 70
                    Height = 25
                    Hint = 'Editar T'#233'cnico'
                    Caption = 'Editar'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      180000000000000600000000000000000000000000000000000000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
                      60483060483060483060483060483060483060483060483060483070504000FF
                      0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
                      43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
                      E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
                      0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
                      C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
                      E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
                      0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
                      AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
                      5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
                      FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
                      0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
                      B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                      E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
                      B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
                      9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
                      10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
                      D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
                      F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
                      B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
                      8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
                      FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
                      E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
                      A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
                      F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
                      B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
                      8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
                      B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
                      CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    OnClick = BtnTecnicoEditarClick
                  end
                  object BtnTecnicoExcluir: TBitBtn
                    Tag = 8
                    Left = 0
                    Top = 49
                    Width = 70
                    Height = 25
                    Hint = 'Excluir T'#233'cnico'
                    Caption = 'Excluir'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      1800000000000006000000000000000000000000000000000000FF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCFC1C52030902030902030802028
                      70C6A797FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFC3C3C34B4B4B4B4B4B4646463C3C3CA5A5A5FF00FFFF00FFFF00FFFF00FF
                      B0A0906048306048306048307058406050601038C02050D01038C01030B01030
                      A0102070C5A392FF00FFFF00FFFF00FF9C9C9C43434343434343434353535356
                      56565C5C5C7171715C5C5C5353534E4E4E363636A1A1A1FF00FFFF00FFFF00FF
                      B0A090FFFFFFD0C8C0D0C8C0D0C8C01040E04068E03058E00038E00038D01030
                      C01030A0202870FF00FFFF00FFFF00FF9C9C9CFFFFFFC6C6C6C6C6C6C6C6C66B
                      6B6B8888887C7C7C6464646060605858584E4E4E3C3C3CFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFF8FFFFF0F03068F0F0F8FFFFF8FFFFF8FFFFF8FFFFF8
                      FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFAFAFAF1F1F18B
                      8B8BF9F9F9FAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFFFFFFFF8F03068F0FFF8FFFFF8FFFFF8FFFFF8FFFFF8
                      FFFFF8FF203090FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F68B
                      8B8BFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAFA4B4B4BFF00FFFF00FFFF00FF
                      B0A090FFFFFFFFFFFFFFFFFFFFFFFF3060FF80A0F06080F04060E02058E00038
                      D01038C02038A0FF00FFFF00FFFF00FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFF8A
                      8A8AB4B4B49E9E9E8383837B7B7B6060605C5C5C545454FF00FFFF00FFFF00FF
                      C0A890FFFFFFFFFFFFFFFFFFFFFFFFD0D8F03068F090A8F06080F05078E02048
                      D02038B0C8ACAAFF00FFFF00FFFF00FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFDE
                      DEDE8B8B8BBBBBBB9E9E9E9393936C6C6C595959AEAEAEFF00FFFF00FFFF00FF
                      C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD0D8F03060F03060F03060E02048
                      C0C9B0AFFF00FFFF00FFFF00FFFF00FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFDEDEDE868686868686818181686868B2B2B2FF00FFFF00FFFF00FFFF00FF
                      C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0F0F0D0C8C08068
                      50FF00FFFF00FFFF00FFFF00FFFF00FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFAFAFAF0F0F0F0F0F0C6C6C6636363FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0D0C8C06048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F0C6C6C6434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0C0A8A06048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFA8A8A8A8A8A8434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                      30FF00FFFF00FFFF00FFFF00FFFF00FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFF9C9C9C434343434343434343FF00FFFF00FFFF00FFFF00FFFF00FF
                      D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DFBD
                      A7FF00FFFF00FFFF00FFFF00FFFF00FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA3A3A3C6C6C6434343B9B9B9FF00FFFF00FFFF00FFFF00FFFF00FF
                      E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830E0BEAAFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFA8A8A8434343BBBBBBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0C0ADFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                      BCBCB8B8B8AEAEAEBDBDBDFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
                      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
                      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
                      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    OnClick = BtnTecnicoExcluirClick
                  end
                  object BtnTecnicoSalvar: TBitBtn
                    Left = 0
                    Top = 73
                    Width = 70
                    Height = 25
                    Hint = 'Salvar T'#233'cnico'
                    Caption = 'Salvar'
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      18000000000000060000000000000000000000000000000000000000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      C06860B05850A05050A05050A050509048509048409048408040408038408038
                      407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
                      51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
                      F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
                      30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
                      B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
                      FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
                      40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
                      7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
                      FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
                      40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
                      3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
                      FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
                      50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
                      58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
                      FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
                      50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
                      89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
                      FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
                      60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
                      56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
                      FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
                      10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
                      F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
                      FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
                      20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
                      F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
                      FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
                      30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
                      FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
                      FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
                      30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
                      FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
                      40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
                      FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
                      50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
                      FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
                      F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
                      80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
                      A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    OnClick = BtnTecnicoSalvarClick
                  end
                  object BtnTecnicoAtualizarComissao: TBitBtn
                    Tag = 8
                    Left = 0
                    Top = 125
                    Width = 70
                    Height = 25
                    Hint = 'Atualizar Valores de Comiss'#227'o'
                    Caption = 'Comis. '
                    Enabled = False
                    Glyph.Data = {
                      36060000424D3606000000000000360000002800000020000000100000000100
                      180000000000000600000000000000000000000000000000000000FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00C0A090604830
                      60483060483060483060483060483060483060483060483060483060483000FF
                      0000FF0000FF0000FF009E9E9E43434343434343434343434343434343434343
                      434343434343434343434343434300FF0000FF0000FF0000FF00C0A890FFF8F0
                      FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A89060483000FF
                      0000FF0000FF0000FF00A3A3A3F6F6F6ECECECE6E6E6DCDCDCCECECEC4C4C4B9
                      B9B9B4B4B4ABABABA6A6A643434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      C0A8A0B0A0A0F0E8E0B0A090B09890B09890B09890B09890E0B09060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAA8A8A8A1A1A1E6E6E69C9C9C98989898
                      9898989898989898ABABAB43434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAFAFAFAF6F6F6ECECECE6E6E6DCDCDCCE
                      CECEC4C4C4B9B9B9B4B4B443434300FF0000FF0000FF0000FF00C0A8A0FFFFF0
                      B0A8A0B0A0A0FFF8F0B0A090B09890B09890B09890B09890E0C0A060483000FF
                      0000FF0000FF0000FF00A8A8A8FAFAFAA6A6A6A1A1A1F6F6F69C9C9C98989898
                      9898989898989898B9B9B943434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                      FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B060483000FF
                      0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6ECECECE6
                      E6E6DCDCDCCECECEC4C4C443434300FF0000FF0000FF0000FF00C0B0A0FFFFF0
                      FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0C8C0406070F0E0D0F0D0C060483000FF
                      0000FF0000FF0000FF00ACACACFAFAFAFAFAFAFAFAFAFAFAFAFAFAFAF6F6F6C4
                      C4C4616161DCDCDCCECECE43434300FF0000FF0000FF0000FF00C0B0A0FFFFFF
                      E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A060483000FF
                      0000FF00A0B39A408050ACACACFFFFFFE9E9E9787878E0E0E0FAFAFAC9C9C963
                      6363A8A8A8383838A1A1A143434300FF0000FF00A9A9A96B6B6BD0B0A0FFFFFF
                      90A8B080D0E0506070B0B8C050607060C0E050607030B8F01028301030401028
                      3070747D40784050A860AEAEAEFFFFFFA8A8A8CCCCCC636363B9B9B9636363C0
                      C0C0636363BBBBBB282828313131282828767676616161898989D0B8A0FFFFFF
                      E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
                      B020507050886050B060B3B3B3FFFFFFE9E9E9A8A8A8DBDBDB636363CCCCCC63
                      6363CECECE616161B1B1B19C9C9C8989895454547676768E8E8ED0B8A0D0B8A0
                      D0B8A0C0B0A090A8B080E0F050607080E0F040587060D0F050C8F040C0F020B0
                      E020A0D060987050B870B3B3B3B3B3B3B3B3B3ACACACA8A8A8DBDBDB636363DB
                      DBDB5C5C5CCECECEC8C8C8C1C1C1B0B0B0A1A1A186868698989800FF0000FF00
                      00FF0000FF0000FF0090A8B080E0F040587080E0F070D8F060D0F050C8F040C0
                      F030B8F070A88060C08000FF0000FF0000FF0000FF0000FF00A8A8A8DBDBDB5C
                      5C5CDBDBDBD4D4D4CECECEC8C8C8C1C1C1BBBBBB969696A3A3A300FF0000FF00
                      00FF0000FF0000FF0000FF0090A8B080E0F080E0F080E0F070D8F060D0F060B0
                      D0808890B0C0A090D0A000FF0000FF0000FF0000FF0000FF0000FF00A8A8A8DB
                      DBDBDBDBDBDBDBDBD4D4D4CECECEB1B1B1898989B4B4B4BBBBBB00FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0090A8B090A0B090A0A08098A08090A08088
                      90B9B9BDA0B8A0B0C0A000FF0000FF0000FF0000FF0000FF0000FF0000FF00A8
                      A8A8A3A3A39E9E9E989898939393898989BABABAAEAEAEB4B4B400FF0000FF00
                      00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                      0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                      FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
                    NumGlyphs = 2
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 4
                    OnClick = BtnTecnicoAtualizarComissaoClick
                  end
                end
                object dbTecnico: TDBLookupComboBox
                  Left = 88
                  Top = 40
                  Width = 385
                  Height = 21
                  Color = clWhite
                  DataField = 'TECNICO'
                  DataSource = dtsOSTecnicos
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  KeyField = 'COD'
                  ListField = 'NOME'
                  ListSource = dtsVendedorTecnico
                  ParentFont = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnExit = ControlEditExit
                end
                object dbTecnicoTipoComissao: TDBLookupComboBox
                  Left = 88
                  Top = 80
                  Width = 169
                  Height = 21
                  Color = clWhite
                  DataField = 'COMISSAO_TIPO_LANC'
                  DataSource = dtsOSTecnicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  KeyField = 'CODIGO'
                  ListField = 'DESCRICAO'
                  ListSource = dtsTipoComissao
                  ParentFont = False
                  TabOrder = 2
                  OnExit = ControlEditExit
                end
                object dbTecnicoPercentualComissao: TDBEdit
                  Left = 264
                  Top = 80
                  Width = 81
                  Height = 21
                  Color = clWhite
                  DataField = 'COMISSAO_PERCENTUAL'
                  DataSource = dtsOSTecnicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                  OnExit = ControlEditExit
                end
                object dbTecnicoValorComissao: TDBEdit
                  Left = 352
                  Top = 80
                  Width = 121
                  Height = 21
                  Color = clWhite
                  DataField = 'COMISSAO_VALOR'
                  DataSource = dtsOSTecnicos
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'Tahoma'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                  OnExit = ControlEditExit
                end
              end
              object dbgTecnicos: TDBGrid
                Left = 493
                Top = 0
                Width = 628
                Height = 167
                TabStop = False
                Align = alClient
                DataSource = dtsOSTecnicos
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
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
                    Title.Caption = '#'
                    Width = 23
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TECNICO'
                    Title.Caption = 'C'#243'digo'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOME'
                    Title.Caption = 'T'#233'cnico'
                    Width = 310
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMISSAO_PERCENTUAL'
                    Title.Caption = '% Comiss'#227'o'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'COMISSAO_VALOR'
                    Title.Caption = 'Valor Comiss'#227'o (R$)'
                    Width = 120
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'USUARIO'
                    Title.Caption = 'Usu'#225'rio'
                    Width = 150
                    Visible = True
                  end>
              end
            end
          end
        end
        object TbsEvento: TTabSheet
          Caption = '&Hist'#243'rico (Eventos)'
          ImageIndex = 2
          object Bevel24: TBevel
            Left = 0
            Top = 169
            Width = 1129
            Height = 4
            Align = alTop
            Shape = bsSpacer
          end
          object GrpBxDadosEvento: TGroupBox
            Left = 0
            Top = 0
            Width = 1129
            Height = 169
            Align = alTop
            Caption = 'Dados'
            TabOrder = 0
            object lblEventoUsuario: TLabel
              Left = 248
              Top = 24
              Width = 40
              Height = 13
              Caption = 'Usu'#225'rio:'
              FocusControl = dbEventoUsuario
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object Bevel23: TBevel
              Left = 2
              Top = 15
              Width = 4
              Height = 152
              Align = alLeft
              Shape = bsSpacer
            end
            object lblEventoCadastro: TLabel
              Left = 88
              Top = 24
              Width = 48
              Height = 13
              Caption = 'Cadastro:'
              FocusControl = dbEventoCadastro
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblEventoHistorico: TLabel
              Left = 88
              Top = 64
              Width = 45
              Height = 13
              Caption = 'Hist'#243'rico:'
              FocusControl = dbEventoHistorico
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object lblEventoData: TLabel
              Left = 408
              Top = 24
              Width = 27
              Height = 13
              Caption = 'Data:'
              FocusControl = dbEventoData
            end
            object lblEventoTecnico: TLabel
              Left = 528
              Top = 24
              Width = 40
              Height = 13
              Caption = 'T'#233'cnico:'
              FocusControl = dbEventoTecnico
            end
            object lblEventoDescricao: TLabel
              Left = 720
              Top = 24
              Width = 50
              Height = 13
              Caption = 'Descri'#231#227'o:'
              FocusControl = dbEventoDescricao
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object dbEventoUsuario: TDBEdit
              Left = 248
              Top = 40
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'USUARIO'
              DataSource = dtsOSEventos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object pnlBotoesEvento: TPanel
              Left = 6
              Top = 15
              Width = 70
              Height = 152
              Align = alLeft
              AutoSize = True
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object BtnEventoInserir: TBitBtn
                Tag = 9
                Left = 0
                Top = 1
                Width = 70
                Height = 25
                Hint = 'Inserir Evento'
                Caption = 'Inserir'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000000000000000000000000000000000000000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  B0A0906048306048306048306048306048306048306048306048306048306048
                  300000FF0000FF0000FF0000FF0000FF9C9C9C43434343434343434343434343
                  43434343434343434343434343434343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFB0A090B0A090B0A090B0A090B0A090B0A090B0A090B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFF9C9C9C9C9C9C9C9C9C9C
                  9C9C9C9C9C9C9C9C9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFF8FFF0F0F0F0E8E0F0E0D0E0D0D0E0C8C0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFAFAFAF0F0F0E6
                  E6E6DCDCDCD1D1D1C8C8C89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E0E0F0D8D0E0D0C0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFF6F6F6F0
                  F0F0E1E1E1D8D8D8CCCCCC9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  B0A090FFFFFFFFFFFFFFFFFFFFFFFFFFF0F0F0E8E0F0E0E0E0D8D0B0A0906048
                  300000FF0000FF0000FF0000FF0000FF9C9C9CFFFFFFFFFFFFFFFFFFFFFFFFF1
                  F1F1E6E6E6E1E1E1D6D6D69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0A890FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFA3A3A3FFFFFFFFFFFFFFFFFFFFFFFFF6
                  F6F6F0F0F0E6E6E6D8D8D89C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0A8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0E8E0F0E0E0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFA8A8A8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFF6F6F6E6E6E6E1E1E19C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  C0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FFF0F0F0F0E8E0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFACACACFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFAFAFAF0F0F0E6E6E69C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0B0A0906048
                  300000FF0000FF0000FF0000FF0000FFAEAEAEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F09C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B8A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A090B0A0906048
                  300000FF0000FF0000FF0000FF0000FFB3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFF9C9C9C9C9C9C4343430000FF0000FF0000FF0000FF0000FF
                  D0B8B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0A0906048306048306048
                  300000FF0000FF0000FF0000FF0000FFB8B8B8FFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFF9C9C9C4343434343434343430000FF0000FF0000FF0000FF0000FF
                  D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C0604830DACA
                  C10000FF0000FF0000FF0000FF0000FFBCBCBCFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA3A3A3C6C6C6434343C8C8C80000FF0000FF0000FF0000FF0000FF
                  E0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0604830DBCAC20000
                  FF0000FF0000FF0000FF0000FF0000FFBEBEBEFFFFFFFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFA8A8A8434343C9C9C90000FF0000FF0000FF0000FF0000FF0000FF
                  E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0DCCAC20000FF0000
                  FF0000FF0000FF0000FF0000FF0000FFBEBEBEBEBEBEBEBEBEBEBEBEBEBEBEBC
                  BCBCB8B8B8AEAEAEC9C9C90000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = BtnEventoInserirClick
              end
              object BtnEventoEditar: TBitBtn
                Tag = 9
                Left = 0
                Top = 25
                Width = 70
                Height = 25
                Hint = 'Editar Evento'
                Caption = 'Editar'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  180000000000000600000000000000000000000000000000000000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00B0A090604830
                  60483060483060483060483060483060483060483060483060483070504000FF
                  0000FF0000FF0000FF009C9C9C43434343434343434343434343434343434343
                  43434343434343434343434E4E4E00FF0000FF0000FF0000FF00C0A8A0FFFFFF
                  E0E8E0E0E0E0E0E0D0E0D8D0E0D0C0E0C8C0E0C8B0E0C0B0C0A8A070504000FF
                  0000FF0000FF0000FF00A8A8A8FFFFFFE4E4E4E0E0E0DBDBDBD6D6D6CCCCCCC8
                  C8C8C3C3C3BEBEBEA8A8A84E4E4E00FF0000FF0000FF0000FF00C0B0A0FFFFFF
                  E0C8C0D0C0B0D0C0B0FFF0E0D0B0A0D0B0A0D0B0A0F0D8D0C0A8A070504000FF
                  0000FF0000FF0000FF00ACACACFFFFFFC8C8C8BCBCBCBCBCBCECECECAEAEAEAE
                  AEAEAEAEAED8D8D8A8A8A84E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  FFFFFFFFFFFFFFF8F0FFF8F0707070505850000000D0C0B0D0B0A070504000FF
                  0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFF6F6F6F6F6F670707054
                  5454000000BCBCBCAEAEAE4E4E4E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  E0C8C0E0C8C0E0C8C0FFF8F0A0A0A0FFFFFF5090B0101010C0B0B080605000FF
                  0000FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8F6F6F6A0A0A0FF
                  FFFF939393101010B1B1B15E5E5E00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFA0A0A090B8C070D0E05098B010101080706000FF
                  0000FF0000FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0A0A0B6
                  B6B6CBCBCB9898981010106C6C6C00FF0000FF0000FF0000FF00D0B8A0FFFFFF
                  E0C8C0E0C8C0E0C8C0FFFFFFC0B8B050A0B090E0F060C0D05098B0101010C8C0
                  B400FF0000FF0000FF00B3B3B3FFFFFFC8C8C8C8C8C8C8C8C8FFFFFFB6B6B69C
                  9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF0000FF00D0B8A0FFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0D0D0D050A0B090E0F060C0D05098B01010
                  10C8C1B400FF0000FF00B3B3B3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F6F6D0
                  D0D09C9C9CDCDCDCBBBBBB989898101010BDBDBD00FF0000FF00F0B090F0A890
                  F0A890F0A080F09870E09060E08860E09060D0A89060A8B090E0F060C0D05098
                  B0101010D5C8B900FF00ACACACA8A8A8A8A8A89E9E9E94949489898984848489
                  8989A4A4A4A3A3A3DCDCDCBBBBBB989898101010C4C4C400FF00F0B090FFC0A0
                  FFC0A0FFB8A0FFB890FFB090FFA880FFA880F0A880D0B0A070B0C090E0F070C8
                  E0808880303890BCAEB6ACACACBCBCBCBCBCBCB7B7B7B3B3B3AEAEAEA4A4A4A4
                  A4A4A3A3A3AEAEAEAEAEAEDCDCDCC6C6C6848484515151B1B1B1F0B090F0A890
                  F0A890F0A890F0A080F0A070E09870E09060E08850E09060D0988080B0C0D0B8
                  B07088D06070B0303890ACACACA8A8A8A8A8A8A8A8A89E9E9E99999993939389
                  8989808080898989969696B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00DDD4CA6070
                  B07090E06078D06070B000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF00D1D1D1818181A4A4A490909081818100FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00D0C6
                  CE6070B06070B0DFD2D100FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF00C9C9C9818181818181D3D3D3}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = BtnEventoEditarClick
              end
              object BtnEventoCancelar: TBitBtn
                Left = 0
                Top = 49
                Width = 70
                Height = 25
                Hint = 'Cancelar Edi'#231#227'o'
                Caption = 'Canc.  '
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  180000000000000600000000000000000000000000000000000000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF00707070505850000000D0C0AE00FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0070707054
                  5454000000BCBCBC00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF00B0A0907C644DAD957FA0A0A0FFFFFF5090B0101010988A767B61496048
                  3060483000FF0000FF0000FF0000FF0000FF009C9C9C5F5F5F909090A0A0A0FF
                  FFFF9393931010108585855C5C5C43434343434300FF0000FF0000FF0000FF00
                  00FF00D6BAA8FFFFFFF0E8E0A0A0A090B8C070D0E05098B0101010A09890B0A0
                  9060483000FF0000FF0000FF0000FF0000FF00B7B7B7FFFFFFE6E6E6A0A0A0B6
                  B6B6CBCBCB9898981010109696969C9C9C43434300FF0000FF0000FF00B7B3DA
                  0E2BDFB8ABBDFFFFFFFFFFFFE0E0E050A0B060A8E060C0D05098B01010109090
                  907A5F4600FF0000FF0000FF00BFBFBF5E5E5EB1B1B1FFFFFFFFFFFFE0E0E09C
                  9C9CB1B1B1BBBBBB9898981010109090905A5A5A00FF0000FF0000FF000028FF
                  0020F04050D0FFFFFFFFFFFFFFFFFF4050E00010B090E0F060C0D05098B01010
                  108B7D7200FF0000FF0000FF006464645B5B5B747474FFFFFFFFFFFFFFFFFF79
                  79793E3E3EDCDCDCBBBBBB9898981010107B7B7B00FF0000FF0000FF002D51FC
                  1038FF0028FFF0F8FFFFFFFF9098F00018C06078E060A8B090E0F060C0D05098
                  B0101010CBAF9800FF0000FF008080806F6F6F646464F9F9F9FFFFFFB1B1B148
                  4848949494A3A3A3DCDCDCBBBBBB989898101010AAAAAA00FF0000FF00E7D7DB
                  3050FF2040FF90A0F0C0C8F00028F04058F0FFF8F0D0D8E070B0C090E0F070C8
                  E0808880303890B1959500FF00D9D9D9818181767676B6B6B6D3D3D360606083
                  8383F6F6F6D9D9D9AEAEAEDCDCDCC6C6C684848451515197979700FF0000FF00
                  DCD0DC4060FF3050FF2040FF3050FFFFF8FFFFFFFFFFF8F0D0D8E080B0C0D0B8
                  B07088D06070B030389000FF0000FF00D4D4D48C8C8C818181767676818181FA
                  FAFAFFFFFFF6F6F6D9D9D9B0B0B0B8B8B89B9B9B81818151515100FF0000FF00
                  00FF00B8B5D14068FF4060FFD0D8FFFFFFFFFFFFFFFFF8FFF0F0F0D0D8D06070
                  B07090E06078D06070B000FF0000FF0000FF00BDBDBD9191918C8C8CE2E2E2FF
                  FFFFFFFFFFFAFAFAF0F0F0D4D4D4818181A4A4A490909081818100FF0000FF00
                  C6C4E26078FF6078FF6080FF5070FFF0F0FFFFFFFFFFFFFFFFF8F0F0F0F0B0A0
                  A06070B06070B0D1B2A500FF0000FF00CDCDCD9E9E9E9E9E9EA2A2A2979797F4
                  F4F4FFFFFFFFFFFFF6F6F6F0F0F0A1A1A1818181818181B1B1B100FF00B1B6E9
                  5078FF5078FFC0D0FFFFFFFF7088FF6078FFD0E0FFFFFFFFFFFFFFB0A090B0A0
                  9096785E00FF0000FF0000FF00C4C4C49C9C9C9C9C9CDCDCDCFFFFFFA9A9A99E
                  9E9EE7E7E7FFFFFFFFFFFF9C9C9C9C9C9C73737300FF0000FF00859BF35078FF
                  5078FFC8BED1FFFFFFFFFFFFFFFFFFB0C8FF8098FFFFFFFFB0A0908068508060
                  5060483000FF0000FF00B3B3B39C9C9C9C9C9CC4C4C4FFFFFFFFFFFFFFFFFFD6
                  D6D6B4B4B4FFFFFF9C9C9C6363635E5E5E43434300FF0000FF00859BF36585FA
                  DCD2DCD8C7B6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A890D0C8C08068
                  50DEBAA500FF0000FF00B3B3B3A4A4A4D6D6D6C3C3C3FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFA3A3A3C6C6C6636363B7B7B700FF0000FF0000FF0000FF00
                  00FF00D0C0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0A8A0807060DFBD
                  A700FF0000FF0000FF0000FF0000FF0000FF00BCBCBCFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFA8A8A86C6C6CB9B9B900FF0000FF0000FF0000FF0000FF00
                  00FF00E0C0B0E0C0B0E0C0B0E0C0B0E0C0B0D0C0B0D0B8B0D0B0A0E0BEAA00FF
                  0000FF0000FF0000FF0000FF0000FF0000FF00BEBEBEBEBEBEBEBEBEBEBEBEBE
                  BEBEBCBCBCB8B8B8AEAEAEBBBBBB00FF0000FF0000FF0000FF00}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = BtnEventoCancelarClick
              end
              object BtnEventoSalvar: TBitBtn
                Left = 0
                Top = 73
                Width = 70
                Height = 25
                Hint = 'Salvar Evento'
                Caption = 'Salvar'
                Enabled = False
                Glyph.Data = {
                  36060000424D3606000000000000360000002800000020000000100000000100
                  18000000000000060000000000000000000000000000000000000000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
                  C06860B05850A05050A05050A050509048509048409048408040408038408038
                  407038407038300000FF0000FF0000FF6E6E6E5E5E5E58585858585858585851
                  51514C4C4C4C4C4C4646464141414141414040403B3B3B0000FF0000FFD06870
                  F09090E08080B04820403020C0B8B0C0B8B0D0C0C0D0C8C0505050A04030A040
                  30A038307038400000FF0000FF7474749999998989894646462C2C2CB6B6B6B6
                  B6B6C1C1C1C6C6C65050504444444444444040404040400000FF0000FFD07070
                  FF98A0F08880E08080705850404030907870F0E0E0F0E8E0908070A04030A040
                  40A040308038400000FF0000FF797979A4A4A49090908989895858583B3B3B78
                  7878E1E1E1E6E6E67C7C7C4444444949494444444141410000FF0000FFD07870
                  FFA0A0F09090F08880705850000000404030F0D8D0F0E0D0807860B04840B048
                  40A040408040400000FF0000FF7E7E7EA9A9A99999999090905858580000003B
                  3B3BD8D8D8DCDCDC7171715050505050504949494646460000FF0000FFD07880
                  FFA8B0FFA0A0F09090705850705850705850705850706050806860C05850B050
                  50B048408040400000FF0000FF838383B3B3B3A9A9A999999958585858585858
                  58585858585C5C5C6868686060605959595050504646460000FF0000FFE08080
                  FFB0B0FFB0B0FFA0A0F09090F08880E08080E07880D07070D06870C06060C058
                  50B050509048400000FF0000FF898989B7B7B7B7B7B7A9A9A999999990909089
                  89898484847979797474746969696060605959594C4C4C0000FF0000FFE08890
                  FFB8C0FFB8B0D06060C06050C05850C05040B05030B04830A04020A03810C060
                  60C058509048400000FF0000FF939393C1C1C1BCBCBC6B6B6B64646460606056
                  56565050504B4B4B4040403636366969696060604C4C4C0000FF0000FFE09090
                  FFC0C0D06860FFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0E0C8C0A038
                  10C060609048500000FF0000FF989898C6C6C6707070FFFFFFFFFFFFF6F6F6F0
                  F0F0E6E6E6D8D8D8CCCCCCC8C8C83636366969695151510000FF0000FFE098A0
                  FFC0C0D07070FFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0E0D0C0A040
                  20D06860A050500000FF0000FFA1A1A1C6C6C6797979FFFFFFFFFFFFFFFFFFF6
                  F6F6F0F0F0E6E6E6D8D8D8CCCCCC4040407070705858580000FF0000FFF0A0A0
                  FFC0C0E07870FFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0F0D8D0B048
                  30D07070A050500000FF0000FFA8A8A8C6C6C6808080FFFFFFFFFFFFFFFFFFFF
                  FFFFF6F6F6F0F0F0E6E6E6D8D8D84B4B4B7979795858580000FF0000FFF0A8A0
                  FFC0C0E08080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0F0E8E0B050
                  30E07880A050500000FF0000FFACACACC6C6C6898989FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFF6F6F6F0F0F0E6E6E65050508484845858580000FF0000FFF0B0B0
                  FFC0C0F08890FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0F0F0F0C050
                  40603030B058500000FF0000FFB6B6B6C6C6C6949494FFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFF6F6F6F0F0F05656563434345E5E5E0000FF0000FFF0B0B0
                  FFC0C0FF9090FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F0C058
                  50B05860B058600000FF0000FFB6B6B6C6C6C69B9B9BFFFFFFFFFFFFFFFFFFFF
                  FFFFFFFFFFFFFFFFFFFFFFF6F6F66060606363636363630000FF0000FFF0B8B0
                  F0B8B0F0B0B0F0B0B0F0A8B0F0A0A0E098A0E09090E09090E08890E08080D078
                  80D07870D070700000FF0000FFBBBBBBBBBBBBB6B6B6B6B6B6B1B1B1A8A8A8A1
                  A1A19898989898989393938989898383837E7E7E7979790000FF0000FF0000FF
                  0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
                  FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
                  00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = BtnEventoSalvarClick
              end
            end
            object dbEventoCadastro: TDBEdit
              Left = 88
              Top = 40
              Width = 153
              Height = 21
              TabStop = False
              Color = clMoneyGreen
              DataField = 'DATA_CADASTRO'
              DataSource = dtsOSEventos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object dbEventoHistorico: TDBMemo
              Left = 88
              Top = 80
              Width = 897
              Height = 73
              Color = clWhite
              DataField = 'EVENTO'
              DataSource = dtsOSEventos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 6
            end
            object dbEventoData: TJvDBDateEdit
              Left = 408
              Top = 40
              Width = 113
              Height = 21
              DataField = 'DATA_EVENTO'
              DataSource = dtsOSEventos
              ClickKey = 0
              Color = clWhite
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              ShowNullDate = False
              TabOrder = 3
            end
            object dbEventoTecnico: TDBLookupComboBox
              Left = 528
              Top = 40
              Width = 185
              Height = 21
              DataField = 'TECNICO'
              DataSource = dtsOSEventos
              DropDownRows = 10
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              KeyField = 'COD'
              ListField = 'NOME'
              ListSource = dtsVendedorTecnico
              ParentFont = False
              TabOrder = 4
            end
            object dbEventoDescricao: TDBEdit
              Left = 720
              Top = 40
              Width = 393
              Height = 21
              Color = clWhite
              DataField = 'DESCRICAO'
              DataSource = dtsOSEventos
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              OnExit = ControlEditExit
            end
            object dbEventoImprimir: TDBCheckBox
              Left = 992
              Top = 80
              Width = 121
              Height = 17
              Caption = 'Imprimir Evento'
              DataField = 'IMPRIMIR'
              DataSource = dtsOSEventos
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object dbgEventos: TDBGrid
            Left = 0
            Top = 173
            Width = 1129
            Height = 139
            TabStop = False
            Align = alClient
            DataSource = dtsOSEventos
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clBlack
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = [fsBold]
            OnDrawColumnCell = dbgDadosDrawColumnCell
            OnKeyDown = dbgEventosKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'SEQUENCIAL'
                Title.Alignment = taCenter
                Title.Caption = '#'
                Width = 23
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DATA_EVENTO'
                Title.Caption = 'Data'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TECNICO_NOME'
                Title.Caption = 'T'#233'cnico'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCRICAO'
                Title.Caption = 'Descri'#231#227'o'
                Width = 450
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'IMPRIMIR'
                Title.Alignment = taCenter
                Title.Caption = 'Imprimir'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'USUARIO'
                Title.Caption = 'Usu'#225'rio'
                Width = 150
                Visible = True
              end>
          end
        end
      end
      object pgcServicoFinalizar: TPageControl
        Left = 0
        Top = 469
        Width = 1137
        Height = 148
        ActivePage = TbsRecebimento
        Align = alClient
        TabOrder = 2
        object TbsRecebimento: TTabSheet
          Caption = 'Recebimento'
          object pnlObservacao: TPanel
            Left = 0
            Top = 0
            Width = 488
            Height = 120
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object lblObservacao: TLabel
              Left = 0
              Top = 0
              Width = 488
              Height = 13
              Align = alTop
              Caption = '&Observa'#231#245'es:'
              ExplicitWidth = 67
            end
            object Bevel7: TBevel
              Left = 484
              Top = 17
              Width = 4
              Height = 103
              Align = alRight
              Shape = bsSpacer
              ExplicitHeight = 104
            end
            object Bevel9: TBevel
              Left = 0
              Top = 13
              Width = 488
              Height = 4
              Align = alTop
              Shape = bsSpacer
            end
            object dbObservacao: TDBMemo
              Left = 0
              Top = 17
              Width = 484
              Height = 103
              Align = alClient
              DataField = 'OBSERVACOES'
              DataSource = DtSrcTabela
              ScrollBars = ssBoth
              TabOrder = 0
            end
          end
          object pnlFormaPagto: TPanel
            Left = 488
            Top = 0
            Width = 641
            Height = 120
            Align = alRight
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            object lblFormaPagto: TLabel
              Left = 0
              Top = 1
              Width = 124
              Height = 13
              Caption = 'Forma de Pagamento:'
              FocusControl = dbgFormaPagto
            end
            object lblCondicaoPagto: TLabel
              Left = 187
              Top = 1
              Width = 139
              Height = 13
              Caption = 'Condi'#231#227'o de Pagamento:'
            end
            object Label2: TLabel
              Left = 470
              Top = 1
              Width = 60
              Height = 13
              Caption = 'Valor (R$):'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object dbgFormaPagto: TDBGrid
              Left = 0
              Top = 16
              Width = 641
              Height = 59
              Hint = 
                'Para inserir nova Forma/Condi'#231#227'o de Pagamento CTRL + INSERT'#13#10#13#10'P' +
                'ara editar Forma/Condi'#231#227'o de Pagamento selecionada CTRL + ENTER'#13 +
                #10#13#10'Para a exclus'#227'o das Formas/Condi'#231#245'es de Pagamentos CTRL + DEL' +
                'ETE'#13#10#13#10'Observa'#231#227'o:'#13#10'======================='#13#10'Todas as formas/con' +
                'di'#231#245'es de pagamentos ser'#227'o exclu'#237'das, zerando o processo'#13#10'de enc' +
                'erramento da ordem de servi'#231'o com uma forma/condi'#231#227'o de pagament' +
                'o definida como'#13#10'padr'#227'o.'
              Align = alBottom
              Anchors = [akLeft, akTop, akRight, akBottom]
              DataSource = dtsOSFormaPagto
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ShowHint = True
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clBlue
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = [fsBold]
              OnDrawColumnCell = dbgDadosDrawColumnCell
              OnEnter = dbgFormaPagtoEnter
              OnKeyDown = dbgFormaPagtoKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FormaPagtoDescricao'
                  Width = 170
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CondicaoPagtoDescricao'
                  Width = 285
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VALOR_FPAGTO'
                  Title.Caption = 'A Pagar (R$)'
                  Width = 80
                  Visible = True
                end>
            end
            object pnlValoresTotais: TPanel
              Left = 0
              Top = 75
              Width = 641
              Height = 45
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object lblValorTotalServico: TLabel
                Left = 3
                Top = 0
                Width = 73
                Height = 13
                Caption = 'Servi'#231'o (R$):'
                FocusControl = dbValorTotalServico
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorTotalProduto: TLabel
                Left = 96
                Top = 0
                Width = 76
                Height = 13
                Caption = 'Produto (R$):'
                FocusControl = dbValorTotalProduto
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorTotalBruto: TLabel
                Left = 198
                Top = 0
                Width = 62
                Height = 13
                Caption = 'Bruto (R$):'
                FocusControl = dbValorTotalBruto
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorTotalDescontos: TLabel
                Left = 290
                Top = 0
                Width = 90
                Height = 13
                Caption = 'Descontos (R$):'
                FocusControl = dbValorTotalDescontos
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblValorTotalLiquido: TLabel
                Left = 389
                Top = 0
                Width = 71
                Height = 13
                Caption = 'L'#237'quido (R$):'
                FocusControl = dbValorTotalLiquido
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object btnValorTotalAtualizar: TSpeedButton
                Left = 581
                Top = 16
                Width = 21
                Height = 21
                Cursor = crHandPoint
                Hint = 'Recalcular totais'
                Flat = True
                ParentShowHint = False
                ShowHint = True
              end
              object lblValorTotalLiquidoOS: TLabel
                Left = 485
                Top = 0
                Width = 89
                Height = 13
                Caption = 'L'#237'quido OS (R$):'
                FocusControl = dbValorTotalLiquidoOS
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object dbValorTotalServico: TDBEdit
                Left = 3
                Top = 16
                Width = 94
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'TOTAL_SERVICO'
                DataSource = DtSrcTabela
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlack
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object dbValorTotalProduto: TDBEdit
                Left = 99
                Top = 16
                Width = 94
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'TOTAL_PRODUTO'
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
              object dbValorTotalBruto: TDBEdit
                Left = 195
                Top = 16
                Width = 94
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'TOTAL_BRUTO'
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
              object dbValorTotalDescontos: TDBEdit
                Left = 291
                Top = 16
                Width = 94
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'TOTAL_DESCONTOS'
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
              object dbValorTotalLiquido: TDBEdit
                Left = 387
                Top = 16
                Width = 94
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'TOTAL_LIQUIDO'
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
              object dbValorTotalLiquidoOS: TDBEdit
                Left = 483
                Top = 16
                Width = 94
                Height = 21
                TabStop = False
                Color = clMoneyGreen
                DataField = 'TOTAL_OS'
                DataSource = DtSrcTabela
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
            end
          end
        end
        object TbsTitulo: TTabSheet
          Caption = 'T'#237'tulo(s) Gerado(s)'
          ImageIndex = 1
          object Bevel19: TBevel
            Left = 0
            Top = 0
            Width = 4
            Height = 120
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 121
          end
          object Bevel20: TBevel
            Left = 74
            Top = 0
            Width = 4
            Height = 120
            Align = alLeft
            Shape = bsSpacer
            ExplicitHeight = 121
          end
          object pnlBotoesTitulo: TPanel
            Left = 4
            Top = 0
            Width = 70
            Height = 120
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            object btnRegerarTitulo: TBitBtn
              Left = 0
              Top = 1
              Width = 70
              Height = 25
              Hint = 'Regerar T'#237'tulo(s)'
              Caption = 'T'#237'tulo(s)'
              Enabled = False
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = btnRegerarTituloClick
            end
            object btnGerarBoleto: TBitBtn
              Left = 0
              Top = 25
              Width = 70
              Height = 25
              Hint = 'Gerar Boleto(s)'
              Caption = 'Boleto(s)'
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              TabStop = False
              OnClick = btnGerarBoletoClick
            end
            object btnTituloEditar: TBitBtn
              Left = 0
              Top = 49
              Width = 70
              Height = 25
              Hint = 'Editar T'#237'tulo'
              Caption = 'Editar'
              Enabled = False
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 2
              TabStop = False
              Visible = False
            end
            object btnTituloExcluir: TBitBtn
              Left = 0
              Top = 73
              Width = 70
              Height = 25
              Hint = 'Excluir T'#237'tulo'
              Caption = 'Excluir'
              Enabled = False
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
              Visible = False
            end
            object btnTituloQuitar: TBitBtn
              Left = 0
              Top = 97
              Width = 70
              Height = 25
              Hint = 'Baixar T'#237'tulo'
              Caption = 'Baixar'
              Enabled = False
              Font.Charset = ANSI_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              NumGlyphs = 2
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Visible = False
            end
          end
          object dbgTitulos: TDBGrid
            Tag = 21
            Left = 78
            Top = 0
            Width = 1051
            Height = 120
            Hint = 
              'Para a exclus'#227'o de baixas basta pressionar CTRL + DELETE'#13#10#13#10'Obse' +
              'rva'#231#227'o:'#13#10'======================='#13#10'Apenas usu'#225'rios nas fun'#231#245'es Di' +
              'retoria, Gerente Financeiro, Gerente ADM'#13#10'e/ou Masterdados podem' +
              ' excluir registros de pagamentos.'
            TabStop = False
            Align = alClient
            DataSource = dtsTitulos
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
            OnKeyDown = dbgTitulosKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Lancamento'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PARCELA'
                Title.Alignment = taCenter
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTEMISS'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTVENC'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VALORREC'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STATUS'
                Title.Caption = 'Status'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODBANCO'
                Title.Alignment = taCenter
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOSSONUMERO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BAIXADO_'
                Title.Alignment = taCenter
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTREC'
                Title.Alignment = taCenter
                Width = 80
                Visible = True
              end>
          end
        end
        object TbsLocalRealizacao: TTabSheet
          Caption = 'Local de Entrega/Realiza'#231#227'o'
          ImageIndex = 2
          object dbDadosEntrega: TDBMemo
            Left = 0
            Top = 0
            Width = 1129
            Height = 120
            Align = alClient
            Color = clWhite
            DataField = 'DADOS_ENTREGA'
            DataSource = DtSrcTabela
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            PopupMenu = ppCorrigirDadosGerais
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TbsNFSe: TTabSheet
          Caption = 'Dados de Gera'#231#227'o/Envio da NFS-e'
          ImageIndex = 3
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 650
    Width = 1145
    ExplicitTop = 650
    ExplicitWidth = 1145
    inherited bvlTool3: TBevel
      Left = 948
      ExplicitLeft = 1017
      ExplicitTop = -6
    end
    inherited bvlTool4: TBevel
      Left = 1062
      ExplicitLeft = 1066
      ExplicitTop = 2
    end
    object Bevel21: TBevel [5]
      Left = 644
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 704
      ExplicitTop = 2
      ExplicitHeight = 31
    end
    object Bevel22: TBevel [6]
      Left = 1141
      Top = 0
      Width = 4
      Height = 35
      Align = alRight
      Shape = bsSpacer
      ExplicitLeft = 1076
      ExplicitTop = 2
    end
    inherited btbtnSalvar: TcxButton
      Caption = '&Gravar'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited btbtnLista: TcxButton
      Visible = True
    end
    inherited btbtnFechar: TcxButton
      Left = 1066
      TabOrder = 11
      ExplicitLeft = 1066
    end
    inherited btbtnSelecionar: TcxButton
      Left = 952
      Width = 110
      TabOrder = 10
      ExplicitLeft = 952
      ExplicitWidth = 110
    end
    object btnConsultarServico: TcxButton
      Left = 569
      Top = 0
      Width = 75
      Height = 35
      Hint = 'Consulta Servi'#231'os'
      Align = alRight
      Caption = 'Servi'#231'os'
      OptionsImage.ImageIndex = 80
      OptionsImage.Images = DMRecursos.ImgPrincipal16x16
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      TabStop = False
      OnClick = btnConsultarServicoClick
    end
    object btbtnControleOS: TcxButton
      Tag = 11
      Left = 648
      Top = 0
      Width = 100
      Height = 35
      Align = alRight
      Caption = 'Controle &OS'
      Enabled = False
      OptionsImage.ImageIndex = 20
      OptionsImage.Images = ImgList
      ParentShowHint = False
      PopupMenu = ppControleOS
      ShowHint = True
      TabOrder = 7
      OnClick = btbtnControleOSClick
    end
    object btbtnGerarNFSe: TcxButton
      Tag = 11
      Left = 748
      Top = 0
      Width = 100
      Height = 35
      Align = alRight
      Caption = '&Gerar NFS-e'
      Enabled = False
      OptionsImage.ImageIndex = 18
      OptionsImage.Images = ImgList
      ParentShowHint = False
      PopupMenu = ppControleOS
      ShowHint = True
      TabOrder = 8
      OnClick = btbtnControleOSClick
    end
    object btbtnCancelarOS: TcxButton
      Tag = 11
      Left = 848
      Top = 0
      Width = 100
      Height = 35
      Hint = 'Cancelar OS Selecionada'
      Align = alRight
      Caption = 'Cancelar OS'
      Enabled = False
      OptionsImage.ImageIndex = 4
      OptionsImage.Images = ImgList
      ParentShowHint = False
      PopupMenu = ppControleOS
      ShowHint = True
      TabOrder = 9
      OnClick = btbtnCancelarOSClick
    end
  end
  inherited IbDtstTabela: TIBDataSet
    AfterCancel = IbDtstTabelaAfterCancel
    AfterScroll = IbDtstTabelaAfterScroll
    OnCalcFields = IbDtstTabelaCalcFields
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    os.*'
      '  , cl.nome'
      '  , cl.nomefant'
      '  , cl.cnpj'
      '  , cl.pessoa_fisica'
      '  , cl.bloqueado'
      '  , cl.bloqueado_motivo'
      'from TBOS os'
      '  left join TBCLIENTE cl on (cl.codigo = os.cliente)')
    Left = 736
    object IbDtstTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object IbDtstTabelaCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000'
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = '"TBOS"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 18
    end
    object IbDtstTabelaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = '"TBOS"."CLIENTE"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = '"TBOS"."DATA_CADASTRO"'
      DisplayFormat = 'dd/mm/yyyy hh:mm'
    end
    object IbDtstTabelaDATA_EMISSAO: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA_EMISSAO'
      Origin = '"TBOS"."DATA_EMISSAO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object IbDtstTabelaDATA_PREVISAO_CONCLUSAO: TDateField
      FieldName = 'DATA_PREVISAO_CONCLUSAO'
      Origin = '"TBOS"."DATA_PREVISAO_CONCLUSAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBOS"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object IbDtstTabelaVENDEDOR: TIntegerField
      DisplayLabel = 'Respons'#225'vel T'#233'cnico'
      FieldName = 'VENDEDOR'
      Origin = '"TBOS"."VENDEDOR"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaSTATUS: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'STATUS'
      Origin = '"TBOS"."STATUS"'
      ProviderFlags = [pfInUpdate]
      OnGetText = IbDtstTabelaSTATUSGetText
    end
    object IbDtstTabelaOBSERVACOES: TMemoField
      FieldName = 'OBSERVACOES'
      Origin = '"TBOS"."OBSERVACOES"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaRELATO_SOLICITACAO: TMemoField
      DisplayLabel = 'Relato / Solicita'#231#227'o'
      FieldName = 'RELATO_SOLICITACAO'
      Origin = '"TBOS"."RELATO_SOLICITACAO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaDADOS_ENTREGA: TMemoField
      FieldName = 'DADOS_ENTREGA'
      Origin = '"TBOS"."DADOS_ENTREGA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaCOMPETENCIA: TIntegerField
      FieldName = 'COMPETENCIA'
      Origin = '"TBOS"."COMPETENCIA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaTOTAL_CUSTO: TIBBCDField
      FieldName = 'TOTAL_CUSTO'
      Origin = '"TBOS"."TOTAL_CUSTO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_SERVICO: TIBBCDField
      FieldName = 'TOTAL_SERVICO'
      Origin = '"TBOS"."TOTAL_SERVICO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_PRODUTO: TIBBCDField
      FieldName = 'TOTAL_PRODUTO'
      Origin = '"TBOS"."TOTAL_PRODUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_DESCONTOS_SERVICOS: TIBBCDField
      FieldName = 'TOTAL_DESCONTOS_SERVICOS'
      Origin = '"TBOS"."TOTAL_DESCONTOS_SERVICOS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaTOTAL_DESCONTOS_PRODUTOS: TIBBCDField
      FieldName = 'TOTAL_DESCONTOS_PRODUTOS'
      Origin = '"TBOS"."TOTAL_DESCONTOS_PRODUTOS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaTOTAL_DESCONTOS: TIBBCDField
      FieldName = 'TOTAL_DESCONTOS'
      Origin = '"TBOS"."TOTAL_DESCONTOS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object IbDtstTabelaTOTAL_OS: TIBBCDField
      FieldName = 'TOTAL_OS'
      Origin = '"TBOS"."TOTAL_OS"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TBOS"."TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TBOS"."TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_APROVADO_SERVICO: TIBBCDField
      FieldName = 'TOTAL_APROVADO_SERVICO'
      Origin = '"TBOS"."TOTAL_APROVADO_SERVICO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaTOTAL_APROVADO_PRODUTO: TIBBCDField
      FieldName = 'TOTAL_APROVADO_PRODUTO'
      Origin = '"TBOS"."TOTAL_APROVADO_PRODUTO"'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaDATA_APROVACAO: TDateField
      FieldName = 'DATA_APROVACAO'
      Origin = '"TBOS"."DATA_APROVACAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaDATA_FINALIZACAO: TDateField
      FieldName = 'DATA_FINALIZACAO'
      Origin = '"TBOS"."DATA_FINALIZACAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaDATA_FATURA: TDateField
      FieldName = 'DATA_FATURA'
      Origin = '"TBOS"."DATA_FATURA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFS_LOTE: TIBStringField
      FieldName = 'NFS_LOTE'
      Origin = '"TBOS"."NFS_LOTE"'
      ProviderFlags = []
      Size = 15
    end
    object IbDtstTabelaNFS_SERIE: TIBStringField
      FieldName = 'NFS_SERIE'
      Origin = '"TBOS"."NFS_SERIE"'
      ProviderFlags = [pfInUpdate]
      Size = 4
    end
    object IbDtstTabelaNFS_NUMERO: TIntegerField
      FieldName = 'NFS_NUMERO'
      Origin = '"TBOS"."NFS_NUMERO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFS_DATAEMISSAO: TDateField
      FieldName = 'NFS_DATAEMISSAO'
      Origin = '"TBOS"."NFS_DATAEMISSAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFS_HORAEMISSAO: TTimeField
      FieldName = 'NFS_HORAEMISSAO'
      Origin = '"TBOS"."NFS_HORAEMISSAO"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNFS_CNAE: TIBStringField
      DisplayLabel = 'CNAE'
      FieldName = 'NFS_CNAE'
      Origin = '"TBOS"."NFS_CNAE"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 10
    end
    object IbDtstTabelaNFS_NCM: TIBStringField
      DisplayLabel = 'NCM'
      FieldName = 'NFS_NCM'
      Origin = '"TBOS"."NFS_NCM"'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 10
    end
    object IbDtstTabelaNFS_DESCRICAO_SERVICO: TMemoField
      FieldName = 'NFS_DESCRICAO_SERVICO'
      Origin = '"TBOS"."NFS_DESCRICAO_SERVICO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaNFS_ENVIADA: TSmallintField
      FieldName = 'NFS_ENVIADA'
      Origin = '"TBOS"."NFS_ENVIADA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TBCLIENTE"."NOME"'
      ProviderFlags = []
      Size = 100
    end
    object IbDtstTabelaNOMEFANT: TIBStringField
      FieldName = 'NOMEFANT'
      Origin = '"TBCLIENTE"."NOMEFANT"'
      ProviderFlags = []
      Size = 100
    end
    object IbDtstTabelaCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"TBCLIENTE"."CNPJ"'
      ProviderFlags = []
      Size = 18
    end
    object IbDtstTabelaPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
      Origin = '"TBCLIENTE"."PESSOA_FISICA"'
      ProviderFlags = []
    end
    object IbDtstTabelaBLOQUEADO: TSmallintField
      FieldName = 'BLOQUEADO'
      Origin = '"TBCLIENTE"."BLOQUEADO"'
      ProviderFlags = []
    end
    object IbDtstTabelaBLOQUEADO_MOTIVO: TMemoField
      FieldName = 'BLOQUEADO_MOTIVO'
      Origin = '"TBCLIENTE"."BLOQUEADO_MOTIVO"'
      ProviderFlags = []
      BlobType = ftMemo
      Size = 8
    end
    object IbDtstTabelaLegenda: TSmallintField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'Legenda'
      ProviderFlags = []
      Calculated = True
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 800
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  EMPRESA,'
      '  CLIENTE,'
      '  DATA_CADASTRO,'
      '  DATA_EMISSAO,'
      '  DATA_PREVISAO_CONCLUSAO,'
      '  USUARIO,'
      '  VENDEDOR,'
      '  STATUS,'
      '  OBSERVACOES,'
      '  RELATO_SOLICITACAO,'
      '  DADOS_ENTREGA,'
      '  TOTAL_CUSTO,'
      '  TOTAL_SERVICO,'
      '  TOTAL_PRODUTO,'
      '  TOTAL_DESCONTOS_SERVICOS,'
      '  TOTAL_DESCONTOS_PRODUTOS,'
      '  TOTAL_DESCONTOS,'
      '  TOTAL_OS,'
      '  TOTAL_BRUTO,'
      '  TOTAL_LIQUIDO,'
      '  TOTAL_APROVADO_SERVICO,'
      '  TOTAL_APROVADO_PRODUTO,'
      '  DATA_APROVACAO,'
      '  DATA_FINALIZACAO,'
      '  DATA_FATURA,'
      '  COMPETENCIA,'
      '  NFS_LOTE,'
      '  NFS_SERIE,'
      '  NFS_NUMERO,'
      '  NFS_DATAEMISSAO,'
      '  NFS_HORAEMISSAO,'
      '  NFS_CNAE,'
      '  NFS_NCM,'
      '  NFS_DESCRICAO_SERVICO,'
      '  NFS_ENVIADA,'
      '  CAIXA_ANO,'
      '  CAIXA_NUM,'
      '  CANCEL_DATAHORA,'
      '  CANCEL_USUARIO,'
      '  CANCEL_MOTIVO'
      'from TBOS '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE')
    ModifySQL.Strings = (
      'update TBOS'
      'set'
      '  ANO = :ANO,'
      '  CLIENTE = :CLIENTE,'
      '  COMPETENCIA = :COMPETENCIA,'
      '  CONTROLE = :CONTROLE,'
      '  DADOS_ENTREGA = :DADOS_ENTREGA,'
      '  DATA_APROVACAO = :DATA_APROVACAO,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_EMISSAO = :DATA_EMISSAO,'
      '  DATA_FATURA = :DATA_FATURA,'
      '  DATA_FINALIZACAO = :DATA_FINALIZACAO,'
      '  DATA_PREVISAO_CONCLUSAO = :DATA_PREVISAO_CONCLUSAO,'
      '  EMPRESA = :EMPRESA,'
      '  NFS_CNAE = :NFS_CNAE,'
      '  NFS_DATAEMISSAO = :NFS_DATAEMISSAO,'
      '  NFS_DESCRICAO_SERVICO = :NFS_DESCRICAO_SERVICO,'
      '  NFS_ENVIADA = :NFS_ENVIADA,'
      '  NFS_HORAEMISSAO = :NFS_HORAEMISSAO,'
      '  NFS_LOTE = :NFS_LOTE,'
      '  NFS_NCM = :NFS_NCM,'
      '  NFS_NUMERO = :NFS_NUMERO,'
      '  NFS_SERIE = :NFS_SERIE,'
      '  OBSERVACOES = :OBSERVACOES,'
      '  RELATO_SOLICITACAO = :RELATO_SOLICITACAO,'
      '  STATUS = :STATUS,'
      '  TOTAL_APROVADO_PRODUTO = :TOTAL_APROVADO_PRODUTO,'
      '  TOTAL_APROVADO_SERVICO = :TOTAL_APROVADO_SERVICO,'
      '  TOTAL_BRUTO = :TOTAL_BRUTO,'
      '  TOTAL_CUSTO = :TOTAL_CUSTO,'
      '  TOTAL_DESCONTOS = :TOTAL_DESCONTOS,'
      '  TOTAL_DESCONTOS_PRODUTOS = :TOTAL_DESCONTOS_PRODUTOS,'
      '  TOTAL_DESCONTOS_SERVICOS = :TOTAL_DESCONTOS_SERVICOS,'
      '  TOTAL_LIQUIDO = :TOTAL_LIQUIDO,'
      '  TOTAL_OS = :TOTAL_OS,'
      '  TOTAL_PRODUTO = :TOTAL_PRODUTO,'
      '  TOTAL_SERVICO = :TOTAL_SERVICO,'
      '  USUARIO = :USUARIO,'
      '  VENDEDOR = :VENDEDOR'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    InsertSQL.Strings = (
      'insert into TBOS'
      
        '  (ANO, CLIENTE, COMPETENCIA, CONTROLE, DADOS_ENTREGA, DATA_APRO' +
        'VACAO, '
      
        '   DATA_CADASTRO, DATA_EMISSAO, DATA_FATURA, DATA_FINALIZACAO, D' +
        'ATA_PREVISAO_CONCLUSAO, '
      
        '   EMPRESA, NFS_CNAE, NFS_DATAEMISSAO, NFS_DESCRICAO_SERVICO, NF' +
        'S_ENVIADA, '
      
        '   NFS_HORAEMISSAO, NFS_LOTE, NFS_NCM, NFS_NUMERO, NFS_SERIE, OB' +
        'SERVACOES, '
      
        '   RELATO_SOLICITACAO, STATUS, TOTAL_APROVADO_PRODUTO, TOTAL_APR' +
        'OVADO_SERVICO, '
      
        '   TOTAL_BRUTO, TOTAL_CUSTO, TOTAL_DESCONTOS, TOTAL_DESCONTOS_PR' +
        'ODUTOS, '
      
        '   TOTAL_DESCONTOS_SERVICOS, TOTAL_LIQUIDO, TOTAL_OS, TOTAL_PROD' +
        'UTO, TOTAL_SERVICO, '
      '   USUARIO, VENDEDOR)'
      'values'
      
        '  (:ANO, :CLIENTE, :COMPETENCIA, :CONTROLE, :DADOS_ENTREGA, :DAT' +
        'A_APROVACAO, '
      
        '   :DATA_CADASTRO, :DATA_EMISSAO, :DATA_FATURA, :DATA_FINALIZACA' +
        'O, :DATA_PREVISAO_CONCLUSAO, '
      
        '   :EMPRESA, :NFS_CNAE, :NFS_DATAEMISSAO, :NFS_DESCRICAO_SERVICO' +
        ', :NFS_ENVIADA, '
      
        '   :NFS_HORAEMISSAO, :NFS_LOTE, :NFS_NCM, :NFS_NUMERO, :NFS_SERI' +
        'E, :OBSERVACOES, '
      
        '   :RELATO_SOLICITACAO, :STATUS, :TOTAL_APROVADO_PRODUTO, :TOTAL' +
        '_APROVADO_SERVICO, '
      
        '   :TOTAL_BRUTO, :TOTAL_CUSTO, :TOTAL_DESCONTOS, :TOTAL_DESCONTO' +
        'S_PRODUTOS, '
      
        '   :TOTAL_DESCONTOS_SERVICOS, :TOTAL_LIQUIDO, :TOTAL_OS, :TOTAL_' +
        'PRODUTO, '
      '   :TOTAL_SERVICO, :USUARIO, :VENDEDOR)')
    DeleteSQL.Strings = (
      'delete from TBOS'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE')
    Left = 768
  end
  inherited ImgList: TImageList
    Left = 704
    Bitmap = {
      494C01012B002C00600010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000B0000000010020000000000000B0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D6D9D8008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800080808000A6A6A9000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F5F5F500F9F9F900F8F8F800F5F5F500F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000080808000808080000000000000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00D5D4D400DCDBDB00E1E1E000E7E7E600EBEBEA00ECECEB00ECEB
      EB00EAE9E900F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CCCBCA00DBDADA00E9E2DF00BA998C00BD9D9000F6F3F200EDEDEC00ECEB
      EB00EAE9E900F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000008080800080808000808080008080800000000000000000000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400C6C4C200E9E9E900EDEDED00F0F0F000F4F4F400F6F6F600F6F6F600F6F6
      F600E6E6E600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CAC8C600F0ECEA00BB998B00975F4A0098614C00D1B9B000F9F9F900F6F6
      F600E6E6E600F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      00008080800080808000FFFFFF00FFFFFF008080800080808000D0C0C0000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400C2BFBC00E5E4E300E9E9E900EDEDED00F2F2F200F4F4F400F5F5F500F4F4
      F400E2E2E100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400D1CFCD00E9E1DE00955D4800965F490097604B00A4736100FAF9F800F4F4
      F400E2E2E100F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000080808000FFFFFF00FFFFFF0000000000FFFFFF0080808000808080000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400BFBBB800E1DFDD00E5E5E400EAEAEA00EFEFEF00F2F2F200F2F2F200F2F2
      F200DEDDDC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400E1E0DE00AA7F6E00945C4700E2D4CF00A778670097604B00D5BFB700F6F6
      F600DEDDDC00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000000000000FFFFFF00000000000000000000000000FFFFFF00808080008080
      80000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400BCB7B200DCD8D500DFDCDA00E3E1E000E8E8E800ECECEC00EDEDED00EDED
      ED00D6D5D400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400CDC9C500DDCFC900C8AEA300EEEEED00D5C1BA00965E4900A5766400F8F8
      F800D6D5D500F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000000000000000000000000000000000000FFFFFF008080
      80008080800000000000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D7D1CD00D9D4D000DBD7D400DFDDDB00E3E2E100E6E6E500E8E8
      E800CDCDCC00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00DDD9D500E5E2DF00DCD8D500F4F3F200A1715E00945C4700D6C3
      BC00DCDCDB00F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF008080800080808000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00DAD5D200DEDBD800E1DFDD00E4E3
      E200C8C7C600F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D6D1CD00E6E2E000CFB8AF00925A4500A577
      6500E8E7E700F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000008080800080808000808080008080800080808000808080008080
      8000FFFFFF0080808000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D5CFCB00D8D3D000DCD8D500DFDD
      DB00C5C3C100F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00D5CFCB00D5CFCB00D5CFCB00D6D0CC00F1EEED009D6A5700925A
      4400D0BFB900F6F6F6008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000008080800000000000000000000000000000000000808080008080
      80000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00BAB4AF00BDB9
      B400C1BEBB00F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400B9B3AE00B9B3AE00B9B3AE00B9B3AE00B9B3AE00D0CCC900C0A79D00AB86
      7700E4DFDC00F5F5F5008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000808080000000
      0000000000000000000080808000808080008080800000000000808080000000
      00000000000000000000808080000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4
      F400F4F4F400F4F4F4008F8F8E000000000000000000000000008F8F8E00F4F4
      F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F4F4F400F8F8F800F9F9
      F900F6F6F600F4F4F4008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E5E1008080
      8000808080008080800080808000000000000000000000000000808080008080
      80008080800080808000D6DAD6000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E000000000000000000000000008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F8E008F8F
      8E008F8F8E008F8F8E008F8F8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DCE3E100808080008080800080808000D8DDD9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006666
      6600666666006666660066666600666666006666660066666600666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00DFFBFD00666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00DBDBDB00808080000000
      0000000000000000000000000000000000000000000000000000D6D9D8006851
      3A00605040006048300070504000706050007050400060483000604830006048
      30006048300060483000A6A6A900000000000000000062626200808080000000
      0000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000000000000000000006666
      6600DFFBFD0083838300838383008383830083838300DFFBFD00666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000DBDBDB0083838300838383008383830083838300DBDBDB00808080000000
      0000000000000000000000000000000000000000000000000000C0A8A000F0F0
      F000E0D8D000E0D0C000E0C8C0009090B000D0C0B000E0B8A000D0B0A000D0B0
      A000D0A89000D0A0900060483000000000000000000062626200808080000000
      0000000000008080800000000000000000008080800000000000808080000000
      0000808080008080800062626200000000000000000000000000000000006666
      66000000F7000000F7000000F7000000F7000000F7000000F700666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000C0A8A000FFF0
      F000F0F0F000F0E8E0003050C0001038B0007078C000E0D0D000F0D0C000E0D0
      C000E0C8B000D0A8900060483000000000000000000062626200808080000000
      0000000000000000000000000000808080000000000080808000000000008080
      8000000000008080800062626200000000000000000000000000000000006666
      66000000F700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000F700666666000000
      0000666666006666660066666600666666000000000000000000000000008080
      800080808000FFFFFF00FFFFFF00FFFFFF00FFFFFF0080808000808080000000
      0000808080008080800080808000808080000000000000000000C0A8A000FFF0
      F000D0D0E0003050C0003058F0002048E0001038B000A098C000F0D0C000F0D0
      C000E0C8B000D0A8900060483000000000000000000062626200808080000000
      0000000000000000000000000000000000008080800000000000808080000000
      0000808080008080800062626200000000000000000000000000000000006666
      66000000F7000000F7000000F7000000F7000000F7000000F700666666000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080008080800080808000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000C0B0A000FFF8
      F0002040C0003058F0006080FF005078F0004060F0002040B000D0C0C000F0D8
      D000E0C8C000D0B0A00060483000000000000000000062626200000000008080
      8000808080008080800080808000808080000000000000000000000000008080
      8000000000008080800062626200000000000000000000000000000000006666
      6600DFFBFD008383830083838300DFFBFD00DFFBFD00DFFBFD00666666000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000DBDBDB008383830083838300DBDBDB00DBDBDB00DBDBDB00808080000000
      0000000000008080800080808000000000000000000000000000C0B0A000FFF8
      F00080A0FF008098FF008090F000D0D0E0008098F0004060E0004058B000F0D8
      D000F0D8D000D0B8A00060504000000000000000000062626200000000008080
      8000808080000000000000000000808080008080800080808000000000000000
      0000000000000000000062626200000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD006666660066666600666666000000
      00004D4D4D004D4D4D004D4D4D004D4D4D000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB008080800080808000808080000000
      0000808080008080800080808000808080000000000000000000D0B0A000FFF8
      FF00E0E8FF00C0C8F000F0F0F000F0F0E000E0D8E0008090F0003058E0005068
      B000F0E0D000E0C8B00070584000000000000000000062626200000000008080
      8000000000000000000000000000000000008080800080808000808080008080
      8000808080000000000062626200000000000000000000000000000000006666
      6600DFFBFD00DFFBFD00DFFBFD00DFFBFD006666660066666600000000000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000DBDBDB00DBDBDB00DBDBDB00DBDBDB008080800080808000000000000000
      0000000000008080800080808000000000000000000000000000D0B8A000FFFF
      FF00FFF8FF00FFF8F000FFF8F000FFF0F000F0F0E000F0E0E0007088F0002050
      D0009090C000E0D0C00080706000000000000000000062626200000000008080
      8000000000000000000000000000000000008080800080808000808080008080
      8000808080008080800062626200000000000000000000000000000000006666
      6600666666006666660066666600666666006666660000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000000000000000000008080
      8000808080008080800080808000808080008080800000000000000000000000
      0000000000008080800080808000000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFF8FF00FFF8F000FFF8F000F0F0F000F0E0E000F0E8E0008090
      F0002048D000A098C000A0908000000000000000000062626200000000008080
      8000808080000000000000000000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000083000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF0080A0B000608890006088900060789000607880007080900090A0
      B00090A0F0003050D000B0989000000000000000000062626200000000008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800062626200000000000000000083000000830000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF0080A8B00090D8E00090E8F00080D8F00060C8E0005098B0007080
      9000F0E8E000E0D8D000A0989000000000000000000062626200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000062626200000000000000000083000000830000008300
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000D1C2B300FFFF
      FF00FFFFFF00F0F8FF0080A8B000A0A8A0009586770080C8D00050708000F0F0
      F000F0E0E000F0E0E000807060000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000083000000830000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2E5E100D1C2
      B300D0C0B000D0C0B00070A8B000A0E8F000A0E8F00090D0E00040687000C0A8
      A000C0A8A000C0A89000D6DAD600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004D4D4D004D4D4D00000000000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000000000000000000000000000000000000000
      00000000000000000000DCE3E10080B0C00080A0B0007090A000D8DDD9000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D2D2D002D2D2D002D2D
      2D002D2D2D002D2D2D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080685000203040002030400020304000203040002030
      4000203040002030400020304000203040000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D00DDDDDD00DDDDDD00CEC3
      B200BCA87B00BCA87B002D2D2D00000000000000000000000000000000000000
      0000000000000000000000000000000000002D2D2D00DDDDDD00DDDDDD008080
      80008080800080808000808080000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000060809000506070004050
      6000304050002030400090706000F0E0D000B0A09000B0A09000B0A09000B0A0
      9000B0A09000B0A09000B0A0900020304000000000007F5B00007F5B00000000
      00000000000000000000000000002D2D2D00E9DDB700FFFDF300FFFFFF00FBF0
      D700E1CE9B00B0995A00756923002D2D2D000000000080808000808080000000
      0000000000000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C0014BB180014BB180014BB180014BB180014BB180014BB180014BB180014BB
      180014BB180014BB180062626200000000007080900020B8F0000090D0000090
      D0000090D0000090D00090786000F0E8E000F0D8D000E0D0C000E0C8C000D0C0
      B000D0B8B000D0B8B000B0A09000203040007F5B0000EFAD0000EFAD00007F5B
      00000000000000000000000000002D2D2D00E9DDB400F9F4E800FFFFFF00F0E4
      CC00D5C19300A5905400756923002D2D2D008080800080808000808080008080
      8000000000000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C0014BB180020D7240020D7240019C21D0020D7240019C21D0020D7
      240019C21D0014BB180062626200000000007088900070C8F00010B8F00010B0
      F00000A8E0000098D000A0807000F0F0F000C0B0A000C0B0A000C0A8A000B0A0
      9000D0C0B000B0A09000B0A09000203040007F5B0000FFFF0000EFAD0000EFAD
      00007F5B000000000000000000002D2D2D00E8DAB200F7F1E200FFFFFF00F1E5
      D000D7C393009F8B4F00726622002D2D2D008080800000000000808080008080
      8000808080000000000000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C00BB350C00BB350C0014BB180020D7240019C21D0020D7240019C2
      1D0020D7240014BB180062626200000000008088900070D0F00030C0F00010B8
      F00000A8F00000A0E000A0888000FFF8FF00F0F0F000F0E8E000F0D8D000E0D0
      C00070585000605040005048400040404000000000007F5B0000FFFF0000EFAD
      0000EFAD00007F5B0000000000002D2D2D00E6DAB100F9F4E600FFFFFF00F0E5
      CE00D6C49300A68F5400726521002D2D2D000000000080808000000000008080
      8000808080008080800000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200C36F5500BB35
      0C00BB350C00BB350C00BB350C00BB350C0014BB180020D7240019C21D0020D7
      240019C21D0014BB180062626200000000008090A00080D8F00040C8F00030C0
      F00010B8F00000A0E000B0908000FFFFFF00C0B0A000C0B0A000C0A8A000F0E0
      D00080605000D0C8C000605040000000000000000000000000007F5B0000FFFF
      0000F6CF6D007F5B0000000000002D2D2D00F5EACA00FCF8EE00FFFFFF00EEE2
      CC00D5C19300A88F5600796C25002D2D2D000000000000000000808080000000
      0000000000008080800000000000808080000000000000000000000000008080
      8000808080008080800080808000808080000000000062626200F1CF7C00EEAA
      0400EEAA0400EEAA0400EEAA0400EEAA0400BF8A0800BF8A080020D7240019C2
      1D0020D7240014BB180062626200000000008098A00090E0F00060D8F00050C8
      F00030C0F00010B0F000B0989000FFFFFF00FFFFFF00FFF8FF00F0F0F000F0E8
      E000806850008060500000000000000000000000000000000000000000007F5B
      00007F5B0000F6CF6D00D9A77D007F5B00007F5B00007F5B00007F5B00002D2D
      2D002D2D2D002D2D2D00796C25002D2D2D000000000000000000000000008080
      80008080800000000000808080007F5B00008080800080808000808080008080
      8000808080008080800080808000808080000000000062626200F1CF7C00EEAA
      0400EEAA0400A9FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400BF8A0800BF8A
      0800BF8A080020D7240062626200000000008098A000A0E8F00080E0F00070D8
      F00050D0F00010B0F000B0A09000B0989000B0908000A0888000A08070009078
      6000907060000000000000000000000000000000000000000000000000000000
      000000000000D9A77D007F5B0000679A9A00ABAB6E00A8D7CE00ECE79D007F5B
      0000BDA16600574507002D2D2D002D2D2D000000000000000000000000000000
      0000000000008080800080808000679A9A000000000000000000000000008080
      8000000000008080800080808000808080000000000062626200F1CF7C00EEAA
      0400A9FFFF0000FFFF0000FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400BF8A0800626262000000000090A0A000B0F0FF00A0E8FF0090E0
      F00070D0F00010A0D00010A0D00010A0D0001098D0000090D0000090D0000090
      D000303840000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000AAFFFF00AAFFFF0078ABAB00C0F0EC00CCFFFC00FFFF
      BF007F5B0000B1975D002D2D2D00000000000000000000000000000000000000
      00000000000080808000000000000000000078ABAB0000000000000000000000
      0000000000000000000080808000000000000000000062626200F1CF7C00EEAA
      0400A9FFFF0000FFFF0000FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A0B000B0F0FF00A0F0FF006080
      9000607080005070800050687000506870005060700040587000207090000090
      D000404860000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000FFFF9900AAFEFE00AAFFFF0078ABAB0078ABAB0078AB
      AB007F5B00002D2D2D0000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000078ABAB0078ABAB0078AB
      AB00808080008080800000000000000000000000000062626200F1CF7C00EEAA
      0400EEAA0400A9FFFF00A9FFFF00EEAA0400EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A8B000B0F0FF00B0F0FF006088
      900090C8D00090E8F00080D8E00060C8E0005098B000405860002080A0000090
      D000505870000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFFFF00FFFF
      99007F5B00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000062626200F1CF7C00EEAA
      0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA0400EEAA
      0400EEAA0400EEAA0400626262000000000090A8B000B0F0F000B0F0FF00A0F0
      F0007098A000A0F0F0006D7F850080C8D000507080003060800060C0F00020B8
      F000506070000000000000000000000000000000000000000000000000000000
      0000000000007F5B0000FFFF9900AAFFFF00AAFFFF00AAFFFF00AAFFFF00AAFF
      FF007F5B00000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000000000000000000000000000000000000000
      0000808080000000000000000000000000000000000062626200F1CF7C00F1CF
      7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF7C00F1CF
      7C00F1CF7C00F1CF7C0062626200000000000000000090A8B00090A8B00090A8
      B0006090A000A0E8F000A0E8F00090D8E0004068700070889000808890007088
      9000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F5B0000FFFF9900AAFFFF00FFFF9900AAFFFF007F5B
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000000000000000000000000000007F5B
      00000000000000000000000000000000000000000000A8A8A800626262006262
      6200626262006262620062626200626262006262620062626200626262006262
      62006262620062626200A8A8A800000000000000000000000000000000000000
      00000000000080B0C00080B0C00080A0B0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F5B00007F5B00007F5B00007F5B00000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008080800080808000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000099939D0020304000938B9300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000096969600333333008E8E8E00000000000000000000000000000000000000
      000000000000B0A0900060483000604830006048300060483000604830006048
      3000604830006048300060483000705040000000000000000000000000000000
      0000000000009C9C9C0043434300434343004343430043434300434343004343
      43004343430043434300434343004E4E4E0000000000B0A09000604830006048
      3000604830006048300060483000604830006048300060483000604830005048
      4000305060004078C000304860009C989D00000000009C9C9C00434343004343
      4300434343004343430043434300434343004343430043434300434343004646
      460051515100888888004C4C4C00999999000000000000000000000000000000
      000000000000C0A8A000FFF0F000E0E0E000E0E0D00090584000F0F0E000E0C8
      C000E0C8B000E0C0B000E0B8A000705040000000000000000000000000000000
      000000000000A8A8A800F1F1F100E0E0E000DBDBDB0056565600EBEBEB00C8C8
      C800C3C3C300BEBEBE00B4B4B4004E4E4E0000000000B0A09000FFFFFF00B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000908880003050
      70003080D0004098E00050B0F00050687000000000009C9C9C00FFFFFF009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C00868686005656
      560090909000A4A4A400B9B9B900686868007088900060809000607880006088
      90006090A000C0B0A000FFFFFF00FFF8F000E0D8D000A0604000FFF0F000FFE8
      E000FFE8D000F0E0D000D0B8A000705040008888880081818100787878008686
      860090909000ACACAC00FFFFFF00F6F6F600D6D6D6005C5C5C00F1F1F100E7E7
      E700E3E3E300DCDCDC00B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFF8FF00F0F0F000D0D8D000909890007068600060686000505860004070
      900040A0E00060C8FF007090A000B7B3B500000000009C9C9C00FFFFFF00FFFF
      FF00FAFAFA00F0F0F000D4D4D400949494006666660064646400595959007474
      7400A9A9A900CECECE0091919100B4B4B4007088900090A0B00070B0D0000090
      D00030B0E000D0B8A000FFFFFF00B0887000E0E0E000A0705000FFF8F000C090
      8000C0887000B0786000D0B8A0007050400088888800A3A3A300B3B3B3009494
      9400B1B1B100B3B3B300FFFFFF0084848400E0E0E0006B6B6B00F6F6F6009090
      90008686860076767600B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000B0A8A000D0C0B000D0B0A000807870005058
      50006090B0007098B000A6AAAE0000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00E0E0E00090909000A6A6A600BCBCBC00AEAEAE00767676005454
      5400949494009B9B9B00AAAAAA00000000008088900080C0D00090A8B00080E0
      FF0050B8E000D0B8A000FFFFFF00FFFFFF00E0E0E000A0786000FFF8F000FFF0
      F000FFF0E000FFE8E000D0B8A0007050400089898900BEBEBE00A8A8A800DFDF
      DF00B9B9B900B3B3B300FFFFFF00FFFFFF00E0E0E00074747400F6F6F600F1F1
      F100ECECEC00E7E7E700B3B3B3004E4E4E0000000000B0A09000FFFFFF00FFFF
      FF00FFFFFF00B0B0B000C0B8B000FFF0E000FFE8E000F0D8C000F0D0B0008078
      7000988D9200A8ADB1000000000000000000000000009C9C9C00FFFFFF00FFFF
      FF00FFFFFF00B0B0B000B6B6B600ECECEC00E7E7E700D3D3D300C9C9C9007676
      76008F8F8F00ADADAD0000000000000000008090A00080D0F00090A8B00090C0
      D00060C0E000D0B8A000FFFFFF00B0989000E0E0E000B0806000FFF8FF00C0A0
      9000C0988000C0887000D0B8B0007050400093939300D1D1D100A8A8A800C0C0
      C000C0C0C000B3B3B300FFFFFF0098989800E0E0E0007B7B7B00FAFAFA009E9E
      9E009494940086868600B8B8B8004E4E4E0000000000C0A89000FFFFFF00FFFF
      FF00FFFFFF00A0989000F0E8E000FFF8F000FFF0F000FFE8E000F0D8D000D0B0
      A0006267600000000000000000000000000000000000A3A3A300FFFFFF00FFFF
      FF00FFFFFF0096969600E6E6E600F6F6F600F1F1F100E7E7E700D8D8D800AEAE
      AE00646464000000000000000000000000008090A00080D8F00080C8E00090A8
      B00060C0E000D0B8A000FFFFFF00FFFFFF00FFFFFF00B0806000FFFFFF00FFF8
      FF00FFF8F000FFF8F000FFF0F0007050400093939300D6D6D600C8C8C800A8A8
      A800C0C0C000B3B3B300FFFFFF00FFFFFF00FFFFFF007B7B7B00FFFFFF00FAFA
      FA00F6F6F600F6F6F600F1F1F1004E4E4E0000000000C0A8A000FFFFFF00FFFF
      FF00FFFFFF00A0A09000F0E8E000FFFFFF00FFF8F000FFF0F000FFE8E000E0C0
      B000716F6F0000000000000000000000000000000000A8A8A800FFFFFF00FFFF
      FF00FFFFFF009B9B9B00E6E6E600FFFFFF00F6F6F600F1F1F100E7E7E700BEBE
      BE006F6F6F000000000000000000000000008098A00090E0F00090E0FF0090A8
      B00090C0D000E0A08000F0A89000F0A08000F0987000E0906000E0885000E078
      4000E0784000E0704000E0704000D060300098989800DCDCDC00E1E1E100A8A8
      A800C0C0C0009C9C9C00A8A8A8009E9E9E009494940089898900808080007171
      7100717171006C6C6C006C6C6C005C5C5C0000000000C0B0A000FFFFFF00FFFF
      FF00FFFFFF00C0C8C000C0C0C000FFFFFF00FFFFFF00FFF8F000FFF0E000B0A0
      9000A5A0A00000000000000000000000000000000000ACACAC00FFFFFF00FFFF
      FF00FFFFFF00C4C4C400C0C0C000FFFFFF00FFFFFF00F6F6F600ECECEC009C9C
      9C00A0A0A0000000000000000000000000008098A00090E0F000A0E8FF0080C8
      E00080C0D000D0987000FFC0A000FFB8A000FFB89000FFB09000FFA88000FFA8
      8000F0A07000F0987000F0987000D070400098989800DCDCDC00E7E7E700C8C8
      C800BEBEBE0091919100BCBCBC00B7B7B700B3B3B300AEAEAE00A4A4A400A4A4
      A4009999990094949400949494006B6B6B0000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00F0F8FF00C0B8B000C0C0C000F0E8E000F0E8E000B0B0A0007070
      60000000000000000000000000000000000000000000AEAEAE00FFFFFF00FFFF
      FF00FFFFFF00F9F9F900B6B6B600C0C0C000E6E6E600E6E6E600ABABAB006B6B
      6B000000000000000000000000000000000090A0A000A0E8F000A0E8FF00A0E8
      FF0090C8D000C0907000D0907000D0907000E0987000D0907000E0987000E090
      6000E0885000E0805000E0784000E07040009E9E9E00E3E3E300E7E7E700E7E7
      E700C4C4C4008B8B8B008C8C8C008C8C8C00939393008C8C8C00939393008989
      8900808080007B7B7B00717171006C6C6C0000000000D0B8A000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F0F8FF00C0C8C000A0A0900090908000909090006050
      40000000000000000000000000000000000000000000B3B3B300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F9F9F900C4C4C4009B9B9B008B8B8B00909090004C4C
      4C000000000000000000000000000000000090A0B000A0E8F000A0F0FF00A0E8
      FF00A0E8FF0080D0F00070C8F00070C8F00070C8F00070C8F00070C8F00070C8
      F00090B0C000000000000000000000000000A3A3A300E3E3E300ECECEC00E7E7
      E700E7E7E700D1D1D100CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00B1B1B10000000000000000000000000000000000D0B8B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A0900060483000604830006048
      30000000000000000000000000000000000000000000B8B8B800FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C0043434300434343004343
      43000000000000000000000000000000000090A0B000A0F0F000B0F0F000A0F0
      FF00A0E8FF00A0E8FF0070D8FF0090A0A0008098A0008098A0008090A0008090
      900070889000000000000000000000000000A3A3A300E8E8E800E9E9E900ECEC
      EC00E7E7E700E7E7E700D9D9D9009E9E9E009898980098989800939393008E8E
      8E008888880000000000000000000000000000000000D0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C000604830000000
      00000000000000000000000000000000000000000000BCBCBC00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C600434343000000
      00000000000000000000000000000000000090A8B000A0D0E000B0F0F000B0F0
      F000A0F0FF00A0E8FF0090A0B000B1C3C7000000000000000000000000000000
      000000000000906850009068500090685000A8A8A800D0D0D000E9E9E900E9E9
      E900ECECEC00E7E7E700A3A3A300C2C2C2000000000000000000000000000000
      00000000000064646400646464006464640000000000E0C0B000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000000000000000
      00000000000000000000000000000000000000000000BEBEBE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300000000000000
      000000000000000000000000000000000000C8CDD00090A8B00090A8B00090A8
      B00090A8B00090A8B000B4BFC400000000000000000000000000000000000000
      000000000000CDBEBC009068500090685000CDCDCD00A8A8A800A8A8A800A8A8
      A800A8A8A800A8A8A800BFBFBF00000000000000000000000000000000000000
      000000000000BEBEBE00646464006464640000000000E0C0B000E0C0B000E0C0
      B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A00000000000000000000000
      00000000000000000000000000000000000000000000BEBEBE00BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000090786000C3B2A9000000
      0000DED8D800A0908000CDC3BC00907860000000000000000000000000000000
      0000000000000000000000000000000000000000000073737300B1B1B1000000
      0000D8D8D8008C8C8C00C1C1C100737373000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D2CDC700A0908000A088
      8000B0988000C1B7AF0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBCBCB008C8C8C008888
      880093939300B5B5B50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000807060008070600080706000807060000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070007070700070707000707070000000000000000000000000005080
      5000407040003050300020382000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006868
      680058585800404040002C2C2C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005090
      500060A860005088500030503000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007070
      7000848484006C6C6C0040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000070A8800060A070006098
      600070B070005098500040704000305030002038200000000000000000000000
      000000000000000000000000000000000000000000008C8C8C00808080007C7C
      7C00909090007474740058585800404040002C2C2C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080B09000A0D8A00070C0
      800070B8700060A0600050905000408840003050300000000000000000000000
      0000807060008070600080706000807060000000000098989800BCBCBC009898
      9800949494008080800070707000646464004040400000000000000000000000
      000070707000707070007070700070707000000000006078D0001038B0001038
      B0001030B0001028A0001028A000002090000020900000000000000000000000
      0000807060008070600080706000807060000000000098989800606060006060
      6000606060005858580058585800484848004848480000000000000000000000
      0000707070007070700070707000707070000000000090B8A000B0D8B000A0D8
      A00090D0A00070B8700060A86000509850004070400000000000000000000000
      00000000000000000000000000000000000000000000A4A4A400C4C4C400BCBC
      BC00B0B0B0009494940084848400747474005858580000000000000000000000
      000000000000000000000000000000000000000000006080D0009098FF005060
      FF005060FF003048F0003048E0002040D0001028A00000000000000000000000
      0000000000000000000000000000000000000000000098989800C7C7C700A7A7
      A700A7A7A7009090900088888800787878005858580000000000000000000000
      0000000000000000000000000000000000000000000090C0A00090B8A00080B0
      9000A0D8A00070C0800060986000509050005080500000000000000000000000
      00008070600080706000807060008070600000000000A8A8A800A4A4A4009898
      9800BCBCBC00989898007C7C7C00707070006868680000000000000000000000
      000070707000707070007070700070707000000000007088E000A0A8FF009090
      FF007080FF005068FF003058F0002048F0001038B00000000000000000000000
      00008070600080706000807060008070600000000000A8A8A800CFCFCF00C7C7
      C700B7B7B700A7A7A70090909000888888006060600000000000000000000000
      00007070700070707000707070007070700000000000000000000000000090B8
      A000B0D8B000A0D8A00060A07000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A400C4C4C400BCBCBC0080808000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007088E0007088E0006080
      D0006078D0005070C0005060C0004058B0004058B00000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800A8A8A8009898
      9800989898008888880088888800787878007878780000000000000000000000
      00000000000000000000000000000000000000000000000000000000000090C0
      A00090B8A00080B0900070A88000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A8A8
      A800A4A4A400989898008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C0A0900060483000604830006048
      3000604830006048300060483000604830006048300060483000604830006048
      3000000000000000000000000000000000009E9E9E0043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004343
      430000000000000000000000000000000000FFFFFF0085B6D8000F6DAE001672
      B1001A74B1001A74B0001876B3001777B300137AB6000D7CBA000A7CBA00077A
      B8000279BA00006EAF007FAFCE00FFFFFF00FFFFFF00BBBBBB00777777007B7B
      7B007D7D7D007D7D7D007E7E7E007F7F7F008181810083838300838383008181
      81008080800076767600B3B3B300FFFFFF00C0A89000FFF8F000FFF0E000F0E8
      E000F0E0D000F0D0C000F0C8B000E0C0A000E0B8A000E0B09000E0A890006048
      300000000000000000000000000000000000A3A3A300F6F6F600ECECEC00E6E6
      E600DCDCDC00CECECE00C4C4C400B9B9B900B4B4B400ABABAB00A6A6A6004343
      430000000000000000000000000000000000FFFFFF001180CB00D4E8F600FFFF
      FF00FFFFFF0085BFE50048A2DA00389FD800249DD7001CA1DA0015A2DA000DA1
      D900059BD900018ED000006CAE00FFFFFF00FFFFFF008B8B8B00EAEAEA00FFFF
      FF00FFFFFF00C4C4C400A9A9A900A5A5A500A2A2A200A4A4A400A4A4A400A3A3
      A3009E9E9E009393930075757500FFFFFF00C0A8A000FFFFF000C0A8A000B0A0
      A000F0E8E000B0A09000B0989000B0989000B0989000B0989000E0B090006048
      300000000000000000000000000000000000A8A8A800FAFAFA00A8A8A800A1A1
      A100E6E6E6009C9C9C0098989800989898009898980098989800ABABAB004343
      430000000000000000000000000000000000FFFFFF00198AD500FFFFFF006BB3
      E40091C8EB00FFFFFF00FFFFFF00DFF1FA004CB5E40024ADE2001CB0E30013B0
      E3000AACE200049BD9000276B800FFFFFF00FFFFFF0095959500FFFFFF00BABA
      BA00CDCDCD00FFFFFF00FFFFFF00F1F1F100B8B8B800AFAFAF00B0B0B000AFAF
      AF00ACACAC009E9E9E007E7E7E00FFFFFF00C0A8A000FFFFF000FFFFF000FFF8
      F000FFF0E000F0E8E000F0E0D000F0D0C000F0C8B000E0C0A000E0B8A0006048
      300000000000000000000000000000000000A8A8A800FAFAFA00FAFAFA00F6F6
      F600ECECEC00E6E6E600DCDCDC00CECECE00C4C4C400B9B9B900B4B4B4004343
      430000000000000000000000000000000000FFFFFF00228ED700FFFFFF00A3D0
      EE0048A2DE008EC6EB00B8DDF300FFFFFF00C5E7F7002BB1E40021B3E40018B4
      E5000EB0E30008A0DA00057BBA00FFFFFF00FFFFFF0099999900FFFFFF00D4D4
      D400ABABAB00CBCBCB00DFDFDF00FFFFFF00E8E8E800B2B2B200B3B3B300B3B3
      B300AFAFAF00A2A2A20082828200FFFFFF00C0A8A000FFFFF000B0A8A000B0A0
      A000FFF8F000B0A09000B0989000B0989000B0989000B0989000E0C0A0006048
      300000000000000000000000000000000000A8A8A800FAFAFA00A6A6A600A1A1
      A100F6F6F6009C9C9C0098989800989898009898980098989800B9B9B9004343
      430000000000000000000000000000000000FFFFFF002C94D90074B8E600FFFF
      FF00B4D9F1004CA5DF0046A5DF00FFFFFF00CEEAF80064C5EA0052C2EA001BB1
      E40014ADE2000FA1DA000B7DBB00FFFFFF00FFFFFF009E9E9E00BFBFBF00FFFF
      FF00DCDCDC00ADADAD00ACACAC00FFFFFF00EBEBEB00C6C6C600C2C2C200B1B1
      B100ADADAD00A3A3A30084848400FFFFFF00C0B0A000FFFFF000FFFFF000FFFF
      F000FFFFF000FFF8F000FFF0E000F0E8E000F0E0D000F0D0C000F0C8B0006048
      300000000000000000000000000000000000ACACAC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00F6F6F600ECECEC00E6E6E600DCDCDC00CECECE00C4C4C4004343
      430000000000000000000000000000000000FFFFFF003598DA004BA3DE0083BF
      E900FFFFFF00B0D7F10049A5DF008BC9EB00F8FCFE00FFFFFF00FFFFFF00CAEC
      F80043BAE70018A0D900127FBB00FFFFFF00FFFFFF00A1A1A100ABABAB00C5C5
      C500FFFFFF00DADADA00ADADAD00CDCDCD00FCFCFC00FFFFFF00FFFFFF00ECEC
      EC00BBBBBB00A3A3A30086868600FFFFFF00C0B0A000FFFFF000FFFFF000FFFF
      F000FFFFF000FFFFF000FFF8F000C0C8C00040607000F0E0D000F0D0C0006048
      300000000000000000000000000000000000ACACAC00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA00F6F6F600C4C4C40061616100DCDCDC00CECECE004343
      430000000000000000000000000000000000FFFFFF003F9DDC0053A7E00056A9
      E00086C1E900FFFFFF00AAD4F00041A3DE005BB4E50041AEE20055B9E600FFFF
      FF00E3F3FB0039A8DD00187EB900FFFFFF00FFFFFF00A6A6A600AFAFAF00B1B1
      B100C7C7C700FFFFFF00D8D8D800AAAAAA00B9B9B900B2B2B200BCBCBC00FFFF
      FF00F3F3F300ACACAC0085858500FFFFFF00C0B0A000FFFFFF00E0E8F0006078
      8000E0E0E000FFFFF000C0C8D0005060700030A8D00020384000B0A0A0006048
      30000000000000000000A0B39A0040805000ACACAC00FFFFFF00E9E9E9007878
      7800E0E0E000FAFAFA00C9C9C90063636300A8A8A80038383800A1A1A1004343
      43000000000000000000A9A9A9006B6B6B00FFFFFF0045A0DE005AAAE1005CAA
      E10057A8E10094C8EB00FFFFFF005EAFE200369FDD002C9EDD00249DDD002EA3
      DE00FFFFFF008CC9E9001D7DB800FFFFFF00FFFFFF00A9A9A900B2B2B200B2B2
      B200B1B1B100CDCDCD00FFFFFF00B6B6B600A7A7A700A5A5A500A4A4A400A9A9
      A900FFFFFF00CCCCCC0085858500FFFFFF00D0B0A000FFFFFF0090A8B00080D0
      E00050607000B0B8C0005060700060C0E0005060700030B8F000102830001030
      40001028300070747D004078400050A86000AEAEAE00FFFFFF00A8A8A800CCCC
      CC0063636300B9B9B90063636300C0C0C00063636300BBBBBB00282828003131
      310028282800767676006161610089898900FFFFFF004FA5DF0063AFE30061AD
      E20059A9E1007AB9E700FFFFFF004EA4DF00369ADB0046A5E00062B3E4002496
      DA00A1D2EF00BFDFF200217CB700FFFFFF00FFFFFF00ADADAD00B7B7B700B5B5
      B500B1B1B100C0C0C000FFFFFF00ADADAD00A3A3A300ADADAD00B9B9B9009F9F
      9F00D5D5D500E1E1E10084848400FFFFFF00D0B8A000FFFFFF00E0E8F00090A8
      B00080E0F0005060700080D0E0005060700060D0F0004060700030B0E0002098
      D0002088B000205070005088600050B06000B3B3B300FFFFFF00E9E9E900A8A8
      A800DBDBDB0063636300CCCCCC0063636300CECECE0061616100B1B1B1009C9C
      9C008989890054545400767676008E8E8E00FFFFFF0053A7E0006CB4E50068B2
      E4005EABE10080BDE800FFFFFF005AAAE1003A9ADB009ECEEE00F8FCFE003B9E
      DC00B2D9F200B7DAF000237CB700FFFFFF00FFFFFF00AFAFAF00BBBBBB00B9B9
      B900B3B3B300C3C3C300FFFFFF00B2B2B200A3A3A300D2D2D200FCFCFC00A6A6
      A600DCDCDC00DDDDDD0084848400FFFFFF00D0B8A000D0B8A000D0B8A000C0B0
      A00090A8B00080E0F0005060700080E0F0004058700060D0F00050C8F00040C0
      F00020B0E00020A0D0006098700050B87000B3B3B300B3B3B300B3B3B300ACAC
      AC00A8A8A800DBDBDB0063636300DBDBDB005C5C5C00CECECE00C8C8C800C1C1
      C100B0B0B000A1A1A1008686860098989800FFFFFF005EACE2007ABCE70070B6
      E50063AEE30066AFE300E4F1FA00C1DFF300459EDD003E9BDC0051A6DF0067B2
      E400FDFEFF0075B7E300237BB600FFFFFF00FFFFFF00B4B4B400C2C2C200BDBD
      BD00B6B6B600B7B7B700F2F2F200E2E2E200A8A8A800A5A5A500AEAEAE00B9B9
      B900FEFEFE00BDBDBD0083838300FFFFFF000000000000000000000000000000
      00000000000090A8B00080E0F0004058700080E0F00070D8F00060D0F00050C8
      F00040C0F00030B8F00070A8800060C080000000000000000000000000000000
      000000000000A8A8A800DBDBDB005C5C5C00DBDBDB00D4D4D400CECECE00C8C8
      C800C1C1C100BBBBBB0096969600A3A3A300FFFFFF006BB4E5008DC5EA0080BF
      E8006FB6E50067B1E30091C6EB00F9FCFE00DDEDF90096C9EC00AED5F000FFFF
      FF00B1D7F1003596D5001E78B500FFFFFF00FFFFFF00BBBBBB00CACACA00C5C5
      C500BDBDBD00B8B8B800CBCBCB00FCFCFC00EFEFEF00CECECE00D9D9D900FFFF
      FF00DBDBDB009F9F9F0081818100FFFFFF000000000000000000000000000000
      0000000000000000000090A8B00080E0F00080E0F00080E0F00070D8F00060D0
      F00060B0D00080889000B0C0A00090D0A0000000000000000000000000000000
      00000000000000000000A8A8A800DBDBDB00DBDBDB00DBDBDB00D4D4D400CECE
      CE00B1B1B10089898900B4B4B400BBBBBB00FFFFFF0077BAE7009DCDEE008CC5
      EA0079BBE70070B6E5006AB2E40087C1E900C3E0F400EBF5FB00D4E9F70093C8
      EC0045A0DE002F92D3001975B300FFFFFF00FFFFFF00C0C0C000D2D2D200CACA
      CA00C1C1C100BDBDBD00B9B9B900C7C7C700E3E3E300F5F5F500EBEBEB00CDCD
      CD00A9A9A9009B9B9B007E7E7E00FFFFFF000000000000000000000000000000
      000000000000000000000000000090A8B00090A0B00090A0A0008098A0008090
      A00080889000B9B9BD00A0B8A000B0C0A0000000000000000000000000000000
      0000000000000000000000000000A8A8A800A3A3A3009E9E9E00989898009393
      930089898900BABABA00AEAEAE00B4B4B400FFFFFF00B2D7F10076B9E60067B1
      E4005BAAE10054A7E0004FA5DF004AA2DE004BA3DE0046A1DE003F9DDC003B9B
      DC003196D900238ACF008ABADA00FFFFFF00FFFFFF00DBDBDB00BFBFBF00B8B8
      B800B2B2B200AFAFAF00ADADAD00ABABAB00ABABAB00AAAAAA00A6A6A600A4A4
      A400A0A0A00094949400BEBEBE00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000604830006048
      3000604830006048300060483000604830000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800434343004343
      43004343430043434300434343004343430000000000C7C6C200806850008060
      5000806050007060500070584000705840007050400070504000604830006048
      300060483000A19A9100000000000000000000000000C4C4C400636363005E5E
      5E005E5E5E005C5C5C0053535300535353004E4E4E004E4E4E00434343004343
      4300434343009898980000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0A8A000FFF0F000F0D8
      D000E0D0C000E0C8B000E0C0B000604830000000000000000000000000000000
      00000000000000000000000000000000000000000000A8A8A800F1F1F100D8D8
      D800CCCCCC00C3C3C300BEBEBE0043434300C1C4C300A38D8500E0D0C000B0A0
      9000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      9000B0A0900060483000C8CBC90000000000C3C3C3008C8C8C00CCCCCC009C9C
      9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C009C9C9C0043434300CACACA0000000000000000000000000000000000A6A3
      CC001048E0001048E0001048E0000000000000000000C0B0A000FFF8F0007070
      7000F0E8E00070707000E0C8B00060483000000000000000000000000000AFAF
      AF007070700070707000707070000000000000000000ACACAC00F6F6F6007070
      7000E6E6E60070707000C3C3C30043434300BCB7B000B29C9400FFE8E000FFF8
      F000FFF0E000FFE8E000F0D8D000F0D0B000F0C0A00000A0000000A0000000A0
      000070584000604830008577670000000000B5B5B5009B9B9B00E7E7E700F6F6
      F600ECECEC00E7E7E700D8D8D800C9C9C900BBBBBB0060606000606060006060
      6000535353004343430073737300000000000000000000000000000000004070
      F0009E9FD30000000000000000000000000000000000D0B0A000FFFFFF00FFF8
      F000FFF0F000F0E8E000E0D0C000604830000000000000000000000000009191
      9100AEAEAE0000000000000000000000000000000000AEAEAE00FFFFFF00F6F6
      F600F1F1F100E6E6E600CCCCCC0043434300B2948500E0D8D000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF0F000F0E0E000F0D8C00000FF100000FFB00000A0
      00008068500070504000604830000000000092929200D6D6D600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F1F1F100E1E1E100D3D3D3009D9D9D00CDCDCD006060
      6000636363004E4E4E0043434300000000000000000000000000000000001048
      F0000000000000000000000000000000000000000000D0B8A000FFFFFF008088
      8000FFF8F00070707000F0D8D000604830000000000000000000000000007474
      74000000000000000000000000000000000000000000B3B3B300FFFFFF008484
      8400F6F6F60070707000D8D8D80043434300B0908000F0E8E000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E00000FF100000FF100000A0
      0000907060007060500060483000000000008E8E8E00E6E6E600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E6009D9D9D009D9D9D006060
      60006E6E6E005C5C5C00434343000000000000000000000000006080F0003058
      F0001048E00000000000000000000000000000000000D0B0A000FFFFFF00FFFF
      FF00FFFFFF00FFF8F000FFF0F0006048300000000000000000009E9E9E008181
      81007070700000000000000000000000000000000000AEAEAE00FFFFFF00FFFF
      FF00FFFFFF00F6F6F600F1F1F10043434300B0988000D0C0B000D0B8B000C0B0
      A000B0A09000B0988000A0888000908070009070600080686000806050007058
      50009080700080686000705840000000000093939300BCBCBC00B8B8B800ACAC
      AC009C9C9C0093939300888888007C7C7C006E6E6E00686868005E5E5E005858
      58007C7C7C006868680053535300000000000000000000000000D0CEE00080A0
      FF00D0CADC0000000000000000000000000000000000C0B0A000C0B0A000C0B0
      A000C0B0A000C0B0A000C0A8A000C0A8A0000000000000000000D3D3D300B9B9
      B900D0D0D00000000000000000000000000000000000ACACAC00ACACAC00ACAC
      AC00ACACAC00ACACAC00A8A8A800A8A8A800C0A09000FFF8F000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000FFF0F000F0F0F000F0E8
      E000A08880009078600080605000000000009E9E9E00F6F6F600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F1F1F100F0F0F000E6E6
      E60088888800737373005E5E5E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEC9C300B6A18C00D0B0A000C0A8
      A000D0B0A000C0A09000B0908000A08070009070600080605000706050008070
      6000B0A09000A08870008060500000000000C7C7C7009C9C9C00AEAEAE00A8A8
      A800AEAEAE009E9E9E008E8E8E007E7E7E006E6E6E005E5E5E005C5C5C006C6C
      6C009C9C9C00838383005E5E5E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CBC7C200C0B0A000E0C8
      C000FFFFFF00FFF8FF00FFF8FF00FFF0F000F0F0E000F0E0E000C0A8A0008060
      5000A0908000C0B0A000806050000000000000000000C5C5C500ACACAC00C8C8
      C800FFFFFF00FAFAFA00FAFAFA00F1F1F100EBEBEB00E1E1E100A8A8A8005E5E
      5E008C8C8C00ACACAC005E5E5E0000000000C0A8A00060483000604830006048
      300060483000604830006048300000000000000000000000000000000000D5D1
      E3001048E000D1CFE1000000000000000000A8A8A80043434300434343004343
      430043434300434343004343430000000000000000000000000000000000D6D6
      D60070707000D4D4D40000000000000000000000000000000000DEDFDD00C0B0
      A000FFFFFF00F0E8E000D0C8C000D0C8C000D0B8B000D0C0B000E0D0D0008068
      600080605000B0989000B0A09000000000000000000000000000DEDEDE00ACAC
      AC00FFFFFF00E6E6E600C6C6C600C6C6C600B8B8B800BCBCBC00D1D1D1006868
      68005E5E5E00989898009C9C9C0000000000C0A8A000FFF0F000F0D8D000E0D0
      C000E0C8B000E0C0B000604830000000000000000000000000000000000080A0
      FF003060F0001048E0000000000000000000A8A8A800F1F1F100D8D8D800CCCC
      CC00C3C3C300BEBEBE004343430000000000000000000000000000000000B9B9
      B90086868600707070000000000000000000000000000000000000000000D8CB
      BC00F0E8E000FFFFFF00FFFFFF00FFFFFF00FFF8FF00FFF0F000F0E0D000D0B8
      B00080605000BAADA8000000000000000000000000000000000000000000C7C7
      C700E6E6E600FFFFFF00FFFFFF00FFFFFF00FAFAFA00F1F1F100DCDCDC00B8B8
      B8005E5E5E00ACACAC000000000000000000C0B0A000FFF8F00070707000F0E8
      E00070707000E0C8B00060483000000000000000000000000000000000000000
      00004070F000000000000000000000000000ACACAC00F6F6F60070707000E6E6
      E60070707000C3C3C30043434300000000000000000000000000000000000000
      000091919100000000000000000000000000000000000000000000000000E5E5
      E600D0B8B000FFFFFF00F0F0F000D0C8C000D0C8C000D0B8B000C0B0B000E0D8
      D00080706000866859000000000000000000000000000000000000000000E5E5
      E500B8B8B800FFFFFF00F0F0F000C6C6C600C6C6C600B8B8B800B1B1B100D6D6
      D6006C6C6C00666666000000000000000000D0B0A000FFFFFF00FFF8F000FFF0
      F000F0E8E000E0D0C0006048300000000000000000000000000000000000AEB7
      EA001048F000000000000000000000000000AEAEAE00FFFFFF00F6F6F600F1F1
      F100E6E6E600CCCCCC004343430000000000000000000000000000000000C5C5
      C500747474000000000000000000000000000000000000000000000000000000
      0000DED5D300E0D1D100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0E8
      E000D0B8B00080605000DCDBDB00000000000000000000000000000000000000
      0000D5D5D500D2D2D200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00E6E6
      E600B8B8B8005E5E5E00DBDBDB0000000000D0B8A000FFFFFF0080888000FFF8
      F00070707000F0D8D0006048300000000000000000006088F0007090F0007090
      F000A8B6EB00000000000000000000000000B3B3B300FFFFFF0084848400F6F6
      F60070707000D8D8D800434343000000000000000000A3A3A300A9A9A900A9A9
      A900C4C4C4000000000000000000000000000000000000000000000000000000
      000000000000DFD6D300D0C0B000D0C0B000D0C0B000D0C0B000D0C0B000D0C0
      B000D0C0B000D0C0B00000000000000000000000000000000000000000000000
      000000000000D6D6D600BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBCBC00BCBC
      BC00BCBCBC00BCBCBC000000000000000000D0B0A000FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF0F00060483000000000000000000000000000000000000000
      000000000000000000000000000000000000AEAEAE00FFFFFF00FFFFFF00FFFF
      FF00F6F6F600F1F1F10043434300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0B0A000C0B0A000C0B0A000C0B0
      A000C0B0A000C0A8A000C0A8A000000000000000000000000000000000000000
      000000000000000000000000000000000000ACACAC00ACACAC00ACACAC00ACAC
      AC00ACACAC00A8A8A800A8A8A800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000009A8F8C00203040005F686900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008F8F8F003333330067676700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008C8C8800405060002098C000303840005F6D72000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008A8A8A005353530098989800393939006D6D6D000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E1C0A700D1AC
      9300D5B8A1007F8285005060700020A0D00030B8F00060A0B000506870008068
      5000705840006048300060483000000000000000000000000000BBBBBB00A8A8
      A800B4B4B4008282820063636300A1A1A100BBBBBB009E9E9E00686868006363
      6300535353004343430043434300000000000000000000000000000000000000
      000000000000CDA18700E5BC9E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009D9D9D00B7B7B700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000706860006050
      400060504000606860004088A00040C0F00060B0D00070889000A0989000C0B0
      A000B0A09000B0A0900060483000000000000000000000000000666666004C4C
      4C004C4C4C006464640088888800C1C1C100B1B1B1008888880096969600ACAC
      AC009C9C9C009C9C9C0043434300000000000000000000000000000000000000
      0000AA74570090482000B4765700F0CEB3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000707070004343430072727200C9C9C9000000000000000000000000000000
      00000000000000000000000000000000000000000000776E6500C0A08000F0E0
      A000F0D8A000B0A89000607070006098B000708890009098A000D0F0E000B0E8
      D000B0E8C000B0A090006048300000000000000000006C6C6C0099999900CECE
      CE00C9C9C900A1A1A1006E6E6E00999999008888880099999900E8E8E800DBDB
      DB00D6D6D6009C9C9C004343430000000000000000000000000000000000A558
      3900D0785000D0704000B0603000CB9173000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005656
      5600747474006B6B6B00595959008D8D8D000000000000000000000000000000
      00000000000000000000000000000000000096837200B0988000FFFFC000FFF8
      C000FFF0C000FFF0D000B0A890007070700090A0A000F0F8F000E0F8F000C0F0
      D000C0E8D000C0A8900060483000000000007F7F7F0093939300ECECEC00E7E7
      E700E3E3E300E7E7E700A1A1A100707070009E9E9E00F4F4F400F3F3F300E1E1
      E100DCDCDC00A3A3A30043434300000000000000000000000000A0503000D078
      5000F0906000E19C7500D0886000B96F4200D3A4860000000000000000000000
      00000000000000000000000000000000000000000000000000004E4E4E007474
      74008B8B8B009797970083838300686868009F9F9F0000000000000000000000
      00000000000000000000000000000000000096857500E0D0B000FFFFE000FFFF
      E000FFFFD000FFF0C000F0D8B00060504000E0D8C000E0C8B000D0B0A000D0A8
      9000C0E8D000C0A89000604830000000000081818100C8C8C800F5F5F500F5F5
      F500F0F0F000E3E3E300CECECE004C4C4C00D1D1D100C3C3C300AEAEAE00A4A4
      A400DCDCDC00A3A3A300434343000000000000000000A5603900E0805000F090
      6000F3AF8E0000000000F2AA8600D0886000B4673900EBC9AF00000000000000
      000000000000000000000000000000000000000000005B5B5B007B7B7B008B8B
      8B00ABABAB0000000000A6A6A6008383830060606000C4C4C400000000000000
      000000000000000000000000000000000000BCA99700E0D0B000FFFFF000FFFF
      F000FFFFE000FFF8C000F0D8A00070585000FFFFFF00FFFFFF00FFFFFF00E0F8
      F000D0F0E000C0A8A0006048300000000000A5A5A500C8C8C800FAFAFA00FAFA
      FA00F5F5F500E7E7E700C9C9C90058585800FFFFFF00FFFFFF00FFFFFF00F3F3
      F300E8E8E800A8A8A800434343000000000000000000F1B69800F0A89000F2AC
      8200000000000000000000000000E6AA8600D0886000AA684100F2C7B4000000
      00000000000000000000000000000000000000000000B2B2B200A8A8A800A6A6
      A600000000000000000000000000A5A5A5008383830062626200C5C5C5000000
      000000000000000000000000000000000000D5C0AD00C0A8A000FFFFFF00FFFF
      FF00FFFFE000FFFFD000C0B0800090807000F0E0D000E0C8B000D0B0A000D0A8
      9000E0F8F000C0A8A0006048300000000000BCBCBC00A8A8A800FFFFFF00FFFF
      FF00F5F5F500F0F0F000A3A3A3007C7C7C00DCDCDC00C3C3C300AEAEAE00A4A4
      A400F3F3F300A8A8A800434343000000000000000000FDE0CD00F7CEB6000000
      000000000000000000000000000000000000E19C7500D0785000B47D5600F2CC
      B3000000000000000000000000000000000000000000DDDDDD00CACACA000000
      000000000000000000000000000000000000979797007474740076767600C8C8
      C8000000000000000000000000000000000000000000B4ABA200C0B0B000F0E8
      D000F0E8C000C0B0900080786000D0D0D000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F0F8F000C0B0A000604830000000000000000000A9A9A900B1B1B100E1E1
      E100DCDCDC00A8A8A80071717100D0D0D000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F4F4F400ACACAC0043434300000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E19C7400C0704000C38C
      7400F1CAB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000096969600696969008A8A
      8A00C6C6C6000000000000000000000000000000000000000000C0B0A000B0A0
      9000A0908000B0A0A000B0A8A000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C0B0A00060483000000000000000000000000000ACACAC009C9C
      9C008C8C8C00A1A1A100A6A6A600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00ACACAC0043434300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E29F7900C070
      4000D29B8200EBC3A80000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009A9A9A006969
      690099999900BEBEBE0000000000000000000000000000000000F0A89000F0A8
      9000F0A89000F0A88000F0A08000E0987000E0906000E0885000E0805000E070
      4000E0704000E0704000D0603000000000000000000000000000A8A8A800A8A8
      A800A8A8A800A3A3A3009E9E9E009393930089898900808080007B7B7B006C6C
      6C006C6C6C006C6C6C005C5C5C00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1AF
      9100C0705000E4B99B0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000ACAC
      AC006E6E6E00B4B4B40000000000000000000000000000000000F0A89000FFC0
      A000FFC0A000FFC0A000FFB89000FFB89000FFB09000FFA88000FFA88000F0A0
      7000F0987000F0986000D0683000000000000000000000000000A8A8A800BCBC
      BC00BCBCBC00BCBCBC00B3B3B300B3B3B300AEAEAE00A4A4A400A4A4A4009999
      9900949494009090900061616100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1C1A700D291720000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BEBEBE008E8E8E0000000000000000000000000000000000F0A89000F0A8
      9000F0A89000F0A89000F0A88000F0A08000F0987000E0987000E0906000E080
      5000E0784000E0784000E0704000000000000000000000000000A8A8A800A8A8
      A800A8A8A800A8A8A800A3A3A3009E9E9E009494940093939300898989007B7B
      7B0071717100717171006C6C6C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D5C5C400958DAF00565B93002C3275002C2B66004948780083738600C9AB
      A100000000000000000000000000000000000000000000000000000000000000
      0000C7C7C700989898006B6B6B00454545003D3D3D00565656007A7A7A00ABAB
      AB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000AFAA
      BF004853A5001038A0001030B0000030C0000030C0000028B000102080002B27
      5C0097838700000000000000000000000000000000000000000000000000B1B1
      B1006A6A6A00535353005353530056565600565656004D4D4D003B3B3B003737
      3700868686000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B5AEC7003C51
      B2001038C0000030D0000030D0000030D0000030D0000030D0000030D0000028
      A0000E1B64009680830000000000000000000000000000000000B6B6B6006C6C
      6C005D5D5D005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B005B5B5B004848
      48002F2F2F00838383000000000000000000B0A0900060483000604830006048
      3000604830006048300060483000604830006048300060483000604830007050
      4000000000000000000000000000000000009C9C9C0043434300434343004343
      4300434343004343430043434300434343004343430043434300434343004E4E
      4E000000000000000000000000000000000000000000D9CCD3004862B4001040
      D0000038E0000038E0000038E0000038E0000038D0000030D0000030D0000030
      D0000028A0002B265B00C5A092000000000000000000D0D0D000787878006666
      660065656500656565006565650065656500606060005B5B5B005B5B5B005B5B
      5B004848480036363600A0A0A00000000000C0A8A000FFFFFF00E0E8E000E0E0
      E000E0E0D000E0D8D000E0D0C000E0C8C000E0C8B000E0C0B000C0A8A0007050
      400000000000000000000000000000000000A8A8A800FFFFFF00E4E4E400E0E0
      E000DBDBDB00D6D6D600CCCCCC00C8C8C800C3C3C300BEBEBE00A8A8A8004E4E
      4E0000000000000000000000000000000000000000009EA3CB002050C0000038
      F0000040F000FFFFFF00FFFFFF004070F0004068F000FFFFFF00FFFFFF000030
      D0000030D000102080007F697A000000000000000000AFAFAF006D6D6D006A6A
      6A006E6E6E00FFFFFF00FFFFFF00929292008D8D8D00FFFFFF00FFFFFF005B5B
      5B005B5B5B003B3B3B007070700000000000C0B0A000FFFFFF00E0C8C000D0C0
      B000D0C0B000FFF0E000D0B0A000D0B0A000D0B0A000F0D8D000C0A8A0007050
      400000000000000000000000000000000000ACACAC00FFFFFF00C8C8C800BCBC
      BC00BCBCBC00ECECEC00AEAEAE00AEAEAE00AEAEAE00D8D8D800A8A8A8004E4E
      4E0000000000000000000000000000000000000000006E81C5002048E0000040
      FF001048FF007098FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006080F0000038
      D0000030D0000028B00047427100000000000000000094949400727272007373
      730079797900B3B3B300FFFFFF00FFFFFF00FFFFFF00FFFFFF009F9F9F006060
      60005B5B5B004D4D4D005050500000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFF8F000FFF8F000707070005058500000000000D0C0B000D0B0A0007050
      400000000000000000000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00F6F6F600F6F6F600707070005454540000000000BCBCBC00AEAEAE004E4E
      4E0000000000000000000000000000000000000000004B68C1005070FF005078
      FF003060FF003060FF00B0C8FF00FFFFFF00FFFFFF00A0B8FF000038F0000038
      E0000030D0000030C0002C296400000000000000000080808000989898009D9D
      9D008B8B8B008B8B8B00D6D6D600FFFFFF00FFFFFF00CBCBCB006A6A6A006565
      65005B5B5B00565656003B3B3B0000000000D0B8A000FFFFFF00E0C8C000E0C8
      C000E0C8C000FFF8F000A0A0A000FFFFFF005090B00010101000C0B0B0008060
      500000000000000000000000000000000000B3B3B300FFFFFF00C8C8C800C8C8
      C800C8C8C800F6F6F600A0A0A000FFFFFF009393930010101000B1B1B1005E5E
      5E0000000000000000000000000000000000000000004B68C1005078FF005080
      FF005078FF004070FF00B0C8FF00FFFFFF00FFFFFF00A0B8FF000040FF000038
      E0000038D0000030C0002C3173000000000000000000808080009D9D9D00A1A1
      A1009D9D9D0096969600D6D6D600FFFFFF00FFFFFF00CBCBCB00737373006565
      650060606000565656004444440000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A00090B8C00070D0E0005098B000101010008070
      600000000000000000000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00A0A0A000B6B6B600CBCBCB0098989800101010006C6C
      6C0000000000000000000000000000000000000000006E87D1005078F0006090
      FF007090FF0090B0FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007098FF000038
      F0000038E0001030B0005354890000000000000000009B9B9B0098989800ADAD
      AD00AEAEAE00C5C5C500FFFFFF00FFFFFF00FFFFFF00FFFFFF00B3B3B3006A6A
      6A0065656500535353006464640000000000D0B8A000FFFFFF00E0C8C000E0C8
      C000E0C8C000FFFFFF00C0B8B00050A0B00090E0F00060C0D0005098B0001010
      1000C8C0B400000000000000000000000000B3B3B300FFFFFF00C8C8C800C8C8
      C800C8C8C800FFFFFF00B6B6B6009C9C9C00DCDCDC00BBBBBB00989898001010
      1000BDBDBD00000000000000000000000000000000009EA7D3004068E0007098
      FF0080A0FF00FFFFFF00FFFFFF0080A0FF008098FF00FFFFFF00FFFFFF000040
      F0000038E0002038A0008F7D9A000000000000000000B4B4B40088888800B3B3
      B300BABABA00FFFFFF00FFFFFF00BABABA00B5B5B500FFFFFF00FFFFFF006E6E
      6E0065656500555555008888880000000000D0B8A000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF8F000D0D0D00050A0B00090E0F00060C0D0005098
      B00010101000C8C1B4000000000000000000B3B3B300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600D0D0D0009C9C9C00DCDCDC00BBBBBB009898
      980010101000BDBDBD00000000000000000000000000DCCFD6005677D0006080
      F00080A8FF0090B0FF0080A0FF006080FF004070FF003060FF001048FF000040
      F0001040C0004750A100CBABA1000000000000000000D3D3D3008E8E8E009F9F
      9F00BEBEBE00C5C5C500BABABA00A3A3A300969696008B8B8B00797979006E6E
      6E006161610067676700ABABAB0000000000F0B09000F0A89000F0A89000F0A0
      8000F0987000E0906000E0886000E0906000D0A8900060A8B00090E0F00060C0
      D0005098B00010101000D5C8B90000000000ACACAC00A8A8A800A8A8A8009E9E
      9E0094949400898989008484840089898900A4A4A400A3A3A300DCDCDC00BBBB
      BB009898980010101000C4C4C400000000000000000000000000BBB7D3005A76
      D0006080F00080A0FF0080A8FF008098FF006088FF003060FF001048FF001048
      D0003B4FB000A898A70000000000000000000000000000000000C0C0C0008E8E
      8E009F9F9F00BABABA00BEBEBE00B5B5B500A8A8A8008B8B8B00797979006B6B
      6B006A6A6A009E9E9E000000000000000000F0B09000FFC0A000FFC0A000FFB8
      A000FFB89000FFB09000FFA88000FFA88000F0A88000D0B0A00070B0C00090E0
      F00070C8E0008088800030389000BCAEB600ACACAC00BCBCBC00BCBCBC00B7B7
      B700B3B3B300AEAEAE00A4A4A400A4A4A400A3A3A300AEAEAE00AEAEAE00DCDC
      DC00C6C6C6008484840051515100B1B1B100000000000000000000000000BBB6
      D1006477D0005070E0005078F0005080FF005078FF003060E0003050D000475F
      B000AF9EB100000000000000000000000000000000000000000000000000BFBF
      BF00909090008E8E8E0098989800A1A1A1009D9D9D0082828200737373007575
      7500A6A6A600000000000000000000000000F0B09000F0A89000F0A89000F0A8
      9000F0A08000F0A07000E0987000E0906000E0885000E0906000D098800080B0
      C000D0B8B0007088D0006070B00030389000ACACAC00A8A8A800A8A8A800A8A8
      A8009E9E9E00999999009393930089898900808080008989890096969600B0B0
      B000B8B8B8009B9B9B0081818100515151000000000000000000000000000000
      0000DBCCD0009DA5CF006E86CF004B67C0004B67C0006D7EC0009B9BBF00D2BB
      B900000000000000000000000000000000000000000000000000000000000000
      0000CFCFCF00B1B1B1009A9A9A007F7F7F007F7F7F0090909000A6A6A600BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000DDD4
      CA006070B0007090E0006078D0006070B0000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000D1D1
      D10081818100A4A4A40090909000818181000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D0C6CE006070B0006070B000DFD2D1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C9C9C9008181810081818100D3D3D3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CFC1C50020309000203090002030
      800020287000C6A7970000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3C3C3004B4B4B004B4B4B004646
      46003C3C3C00A5A5A50000000000000000000000000000000000000000000000
      00000000000000000000707070005058500000000000D0C0AE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000707070005454540000000000BCBCBC00000000000000
      0000000000000000000000000000000000000000000000000000B0A090006048
      3000604830006048300070584000605060001038C0002050D0001038C0001030
      B0001030A00010207000C5A392000000000000000000000000009C9C9C004343
      4300434343004343430053535300565656005C5C5C00717171005C5C5C005353
      53004E4E4E0036363600A1A1A10000000000000000000000000000000000B0A0
      90007C644D00AD957F00A0A0A000FFFFFF005090B00010101000988A76007B61
      4900604830006048300000000000000000000000000000000000000000009C9C
      9C005F5F5F0090909000A0A0A000FFFFFF009393930010101000858585005C5C
      5C00434343004343430000000000000000000000000000000000B0A09000FFFF
      FF00D0C8C000D0C8C000D0C8C0001040E0004068E0003058E0000038E0000038
      D0001030C0001030A000202870000000000000000000000000009C9C9C00FFFF
      FF00C6C6C600C6C6C600C6C6C6006B6B6B00888888007C7C7C00646464006060
      6000585858004E4E4E003C3C3C0000000000000000000000000000000000D6BA
      A800FFFFFF00F0E8E000A0A0A00090B8C00070D0E0005098B00010101000A098
      9000B0A09000604830000000000000000000000000000000000000000000B7B7
      B700FFFFFF00E6E6E600A0A0A000B6B6B600CBCBCB0098989800101010009696
      96009C9C9C004343430000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFF8FF00FFF0F0003068F000F0F8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00203090000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FAFAFA00F1F1F1008B8B8B00F9F9F900FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA004B4B4B000000000000000000B7B3DA000E2BDF00B8AB
      BD00FFFFFF00FFFFFF00E0E0E00050A0B00060A8E00060C0D0005098B0001010
      1000909090007A5F4600000000000000000000000000BFBFBF005E5E5E00B1B1
      B100FFFFFF00FFFFFF00E0E0E0009C9C9C00B1B1B100BBBBBB00989898001010
      1000909090005A5A5A0000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFF8F0003068F000FFF8FF00FFF8FF00FFF8FF00FFF8
      FF00FFF8FF00FFF8FF00203090000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00F6F6F6008B8B8B00FAFAFA00FAFAFA00FAFAFA00FAFA
      FA00FAFAFA00FAFAFA004B4B4B0000000000000000000028FF000020F0004050
      D000FFFFFF00FFFFFF00FFFFFF004050E0000010B00090E0F00060C0D0005098
      B000101010008B7D7200000000000000000000000000646464005B5B5B007474
      7400FFFFFF00FFFFFF00FFFFFF00797979003E3E3E00DCDCDC00BBBBBB009898
      9800101010007B7B7B0000000000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF003060FF0080A0F0006080F0004060E0002058
      E0000038D0001038C0002038A0000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008A8A8A00B4B4B4009E9E9E00838383007B7B
      7B00606060005C5C5C005454540000000000000000002D51FC001038FF000028
      FF00F0F8FF00FFFFFF009098F0000018C0006078E00060A8B00090E0F00060C0
      D0005098B00010101000CBAF98000000000000000000808080006F6F6F006464
      6400F9F9F900FFFFFF00B1B1B1004848480094949400A3A3A300DCDCDC00BBBB
      BB009898980010101000AAAAAA00000000000000000000000000C0A89000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00D0D8F0003068F00090A8F0006080F0005078
      E0002048D0002038B000C8ACAA00000000000000000000000000A3A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00DEDEDE008B8B8B00BBBBBB009E9E9E009393
      93006C6C6C0059595900AEAEAE000000000000000000E7D7DB003050FF002040
      FF0090A0F000C0C8F0000028F0004058F000FFF8F000D0D8E00070B0C00090E0
      F00070C8E0008088800030389000B195950000000000D9D9D900818181007676
      7600B6B6B600D3D3D3006060600083838300F6F6F600D9D9D900AEAEAE00DCDC
      DC00C6C6C6008484840051515100979797000000000000000000C0A8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D8F0003060F0003060F0003060
      E0002048C000C9B0AF0000000000000000000000000000000000A8A8A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DEDEDE0086868600868686008181
      810068686800B2B2B20000000000000000000000000000000000DCD0DC004060
      FF003050FF002040FF003050FF00FFF8FF00FFFFFF00FFF8F000D0D8E00080B0
      C000D0B8B0007088D0006070B000303890000000000000000000D4D4D4008C8C
      8C00818181007676760081818100FAFAFA00FFFFFF00F6F6F600D9D9D900B0B0
      B000B8B8B8009B9B9B0081818100515151000000000000000000C0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0F0F000F0F0F000D0C8
      C000806850000000000000000000000000000000000000000000ACACAC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F0F0F000F0F0F000C6C6
      C60063636300000000000000000000000000000000000000000000000000B8B5
      D1004068FF004060FF00D0D8FF00FFFFFF00FFFFFF00FFF8FF00F0F0F000D0D8
      D0006070B0007090E0006078D0006070B000000000000000000000000000BDBD
      BD00919191008C8C8C00E2E2E200FFFFFF00FFFFFF00FAFAFA00F0F0F000D4D4
      D40081818100A4A4A40090909000818181000000000000000000D0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000D0C8
      C000604830000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000C6C6
      C600434343000000000000000000000000000000000000000000C6C4E2006078
      FF006078FF006080FF005070FF00F0F0FF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000B0A0A0006070B0006070B000D1B2A5000000000000000000CDCDCD009E9E
      9E009E9E9E00A2A2A20097979700F4F4F400FFFFFF00FFFFFF00F6F6F600F0F0
      F000A1A1A1008181810081818100B1B1B1000000000000000000D0B8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A000C0A8
      A000604830000000000000000000000000000000000000000000B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A800A8A8
      A8004343430000000000000000000000000000000000B1B6E9005078FF005078
      FF00C0D0FF00FFFFFF007088FF006078FF00D0E0FF00FFFFFF00FFFFFF00B0A0
      9000B0A0900096785E00000000000000000000000000C4C4C4009C9C9C009C9C
      9C00DCDCDC00FFFFFF00A9A9A9009E9E9E00E7E7E700FFFFFF00FFFFFF009C9C
      9C009C9C9C007373730000000000000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000604830006048
      3000604830000000000000000000000000000000000000000000B8B8B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00434343004343
      430043434300000000000000000000000000859BF3005078FF005078FF00C8BE
      D100FFFFFF00FFFFFF00FFFFFF00B0C8FF008098FF00FFFFFF00B0A090008068
      500080605000604830000000000000000000B3B3B3009C9C9C009C9C9C00C4C4
      C400FFFFFF00FFFFFF00FFFFFF00D6D6D600B4B4B400FFFFFF009C9C9C006363
      63005E5E5E004343430000000000000000000000000000000000D0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C0006048
      3000DFBDA7000000000000000000000000000000000000000000BCBCBC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C6004343
      4300B9B9B900000000000000000000000000859BF3006585FA00DCD2DC00D8C7
      B600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8
      C00080685000DEBAA5000000000000000000B3B3B300A4A4A400D6D6D600C3C3
      C300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6
      C60063636300B7B7B70000000000000000000000000000000000E0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000E0BE
      AA00000000000000000000000000000000000000000000000000BEBEBE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300BBBB
      BB0000000000000000000000000000000000000000000000000000000000D0C0
      B000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A0008070
      6000DFBDA700000000000000000000000000000000000000000000000000BCBC
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A8006C6C
      6C00B9B9B9000000000000000000000000000000000000000000E0C0B000E0C0
      B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000E0C0AD000000
      0000000000000000000000000000000000000000000000000000BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00BDBDBD000000
      000000000000000000000000000000000000000000000000000000000000E0C0
      B000E0C0B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000E0BE
      AA0000000000000000000000000000000000000000000000000000000000BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B0A090006048
      3000604830006048300060483000604830006048300060483000604830006048
      30006048300000000000000000000000000000000000000000009C9C9C004343
      4300434343004343430043434300434343004343430043434300434343004343
      4300434343000000000000000000000000000000000000000000C0686000B058
      5000A0505000A0505000A0505000904850009048400090484000804040008038
      40008038400070384000703830000000000000000000000000006E6E6E005E5E
      5E00585858005858580058585800515151004C4C4C004C4C4C00464646004141
      410041414100404040003B3B3B00000000000000000000000000B0A09000FFFF
      FF00B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A09000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C
      9C004343430000000000000000000000000000000000D0687000F0909000E080
      8000B048200040302000C0B8B000C0B8B000D0C0C000D0C8C00050505000A040
      3000A0403000A038300070384000000000000000000074747400999999008989
      8900464646002C2C2C00B6B6B600B6B6B600C1C1C100C6C6C600505050004444
      4400444444004040400040404000000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFF8FF00F0F0F000F0E8E000F0E0D000E0D0D000E0C8C000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FAFAFA00F0F0F000E6E6E600DCDCDC00D1D1D100C8C8C8009C9C
      9C004343430000000000000000000000000000000000D0707000FF98A000F088
      8000E0808000705850004040300090787000F0E0E000F0E8E00090807000A040
      3000A0404000A040300080384000000000000000000079797900A4A4A4009090
      900089898900585858003B3B3B0078787800E1E1E100E6E6E6007C7C7C004444
      4400494949004444440041414100000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E0E000F0D8D000E0D0C000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00F6F6F600F0F0F000E1E1E100D8D8D800CCCCCC009C9C
      9C004343430000000000000000000000000000000000D0787000FFA0A000F090
      9000F0888000705850000000000040403000F0D8D000F0E0D00080786000B048
      4000B0484000A04040008040400000000000000000007E7E7E00A9A9A9009999
      99009090900058585800000000003B3B3B00D8D8D800DCDCDC00717171005050
      5000505050004949490046464600000000000000000000000000B0A09000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF0F000F0E8E000F0E0E000E0D8D000B0A0
      90006048300000000000000000000000000000000000000000009C9C9C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F1F1F100E6E6E600E1E1E100D6D6D6009C9C
      9C004343430000000000000000000000000000000000D0788000FFA8B000FFA0
      A000F0909000705850007058500070585000705850007060500080686000C058
      5000B0505000B048400080404000000000000000000083838300B3B3B300A9A9
      A90099999900585858005858580058585800585858005C5C5C00686868006060
      6000595959005050500046464600000000000000000000000000C0A89000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000B0A0
      9000604830000000000000000000000000000000000000000000A3A3A300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D8009C9C
      9C004343430000000000000000000000000000000000E0808000FFB0B000FFB0
      B000FFA0A000F0909000F0888000E0808000E0788000D0707000D0687000C060
      6000C0585000B050500090484000000000000000000089898900B7B7B700B7B7
      B700A9A9A9009999990090909000898989008484840079797900747474006969
      690060606000595959004C4C4C00000000000000000000000000C0A8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0E8E000F0E0E000B0A0
      9000604830000000000000000000000000000000000000000000A8A8A800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600E6E6E600E1E1E1009C9C
      9C004343430000000000000000000000000000000000E0889000FFB8C000FFB8
      B000D0606000C0605000C0585000C0504000B0503000B0483000A0402000A038
      1000C0606000C058500090484000000000000000000093939300C1C1C100BCBC
      BC006B6B6B00646464006060600056565600505050004B4B4B00404040003636
      360069696900606060004C4C4C00000000000000000000000000C0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8FF00F0F0F000F0E8E000B0A0
      9000604830000000000000000000000000000000000000000000ACACAC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00F0F0F000E6E6E6009C9C
      9C004343430000000000000000000000000000000000E0909000FFC0C000D068
      6000FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0C000E0C8
      C000A0381000C060600090485000000000000000000098989800C6C6C6007070
      7000FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D800CCCCCC00C8C8
      C800363636006969690051515100000000000000000000000000D0B0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000B0A0
      9000604830000000000000000000000000000000000000000000AEAEAE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F0009C9C
      9C004343430000000000000000000000000000000000E098A000FFC0C000D070
      7000FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8D000E0D0
      C000A0402000D0686000A05050000000000000000000A1A1A100C6C6C6007979
      7900FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8D800CCCC
      CC00404040007070700058585800000000000000000000000000D0B8A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000B0A0
      9000604830000000000000000000000000000000000000000000B3B3B300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C009C9C
      9C004343430000000000000000000000000000000000F0A0A000FFC0C000E078
      7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8E000F0D8
      D000B0483000D0707000A05050000000000000000000A8A8A800C6C6C6008080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6E600D8D8
      D8004B4B4B007979790058585800000000000000000000000000D0B8B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0A09000604830006048
      3000604830000000000000000000000000000000000000000000B8B8B800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009C9C9C00434343004343
      43004343430000000000000000000000000000000000F0A8A000FFC0C000E080
      8000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0F000F0E8
      E000B0503000E0788000A05050000000000000000000ACACAC00C6C6C6008989
      8900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0F000E6E6
      E600505050008484840058585800000000000000000000000000D0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A89000D0C8C0006048
      3000DACAC1000000000000000000000000000000000000000000BCBCBC00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A3A300C6C6C6004343
      4300C8C8C80000000000000000000000000000000000F0B0B000FFC0C000F088
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8F000F0F0
      F000C050400060303000B05850000000000000000000B6B6B600C6C6C6009494
      9400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6F600F0F0
      F00056565600343434005E5E5E00000000000000000000000000E0C0B000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0A8A00060483000DBCA
      C200000000000000000000000000000000000000000000000000BEBEBE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A8A80043434300C9C9
      C9000000000000000000000000000000000000000000F0B0B000FFC0C000FF90
      9000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF8
      F000C0585000B0586000B05860000000000000000000B6B6B600C6C6C6009B9B
      9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6F6
      F600606060006363630063636300000000000000000000000000E0C0B000E0C0
      B000E0C0B000E0C0B000E0C0B000D0C0B000D0B8B000D0B0A000DCCAC2000000
      0000000000000000000000000000000000000000000000000000BEBEBE00BEBE
      BE00BEBEBE00BEBEBE00BEBEBE00BCBCBC00B8B8B800AEAEAE00C9C9C9000000
      00000000000000000000000000000000000000000000F0B8B000F0B8B000F0B0
      B000F0B0B000F0A8B000F0A0A000E098A000E0909000E0909000E0889000E080
      8000D0788000D0787000D07070000000000000000000BBBBBB00BBBBBB00B6B6
      B600B6B6B600B1B1B100A8A8A800A1A1A1009898980098989800939393008989
      8900838383007E7E7E0079797900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000B00000000100010000000000800500000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFFFFFF0000C001C001C0010000
      DFFDC001C0010000DCFDC001C0010000D87DC001C0010000D01DC001C0010000
      D11DC001C0010000DB8DC001C0010000DFC5C001C0010000DFE1C001C0010000
      D801C001C0010000DBCDC001C0010000DC5DC001C0010000C1C1C001C0010000
      FC1FFFFFFFFF0000FFFFFFFFFFFF0000FFFFE01FE01FFFFF8001E01FE01FC001
      9001E01FE01FC0019B51E01FE01FC0019EA9E010E010C0019F51E01FE01FC001
      A0E9E019E019C001A63DE010E010C001AF05E039E039C001AF01E079E079C001
      A601BFF9BFF9C001A0019FFF9FFFC001BFFD8FF98FF9C00180019FFF9FFFC001
      FFFFBFF9BFF9FC1FFFFFFFFFFFFFFFFFFFFFFF83FF83FFFFFC00FF01FF018001
      80009E009EE0800100000E000EE080010000060046E0800100008200A2E08001
      0001C200DAE080010003E000E40080010007F800F8E880010007F801FB7D8001
      0007F803FB8380010007F807FBF780010007F807FBF78001800FFC0FFDEF8001
      F8FFFE1FFE1FFFFFFFFFFFFFFFFFFFFFFFF1FFF1F800F80080008000F800F800
      8000800000000000800080000000000080018001000000008003800300000000
      800780070000000080078007000000008007800700000000800F800F00000000
      800F800F00070007800F800F00070007801F801F00F800F8803F803F01F801F8
      807F807FFF90FF90FFFFFFFFFF83FF83FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFC0FFC0FFC0FFC0FFFFFFFFFFFFFFFFFFF0FFF0FFF0FFF0FFFFFFFFFFFFFFFF
      FFF0FFF0FFF0FFF0E1FFE1FFFFFFFFFFE1C0E1C0FFC0FFC0807F807FFFFFFFFF
      8070807080708070807F807F807F807F8070807080708070E1FFE1FF807F807F
      E1C0E1C0FFC0FFC0FFFFFFFFFFFFFFFFFFFFFFFF80018001000F000F00000000
      000F000F00000000000F000F00000000000F000F00000000000F000F00000000
      000F000F00000000000F000F00000000000C000C000000000000000000000000
      00000000000000000000000000000000F800F80000000000FC00FC0000000000
      FE00FE0000000000FFFFFFFF80018001FFFFFFFFFF80FF8080038003FF80FF80
      00010001E180E18000010001E780E78000010001EF80EF8000010001C780C780
      00010001C780C78000010001FFFFFFFF00010001FFFFFFFF8001800101E301E3
      C001C00101E301E3E003E00301F701F7E003E00301E701E7F001F00101870187
      F803F80301FF01FFFFFFFFFF01FF01FFFFFFFFFFFFFFFFFFFE3FFE3FFFFFFFFF
      FC1FFC1FFFFFFFFFC001C001F9FFF9FFC001C001F0FFF0FF80018001E0FFE0FF
      00010001C07FC07F00010001843F843F000100018E1F8E1F000100019F0F9F0F
      80018001FF87FF87C001C001FFC3FFC3C001C001FFE3FFE3C001C001FFF3FFF3
      C001C001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FF00FFFFFFFFF
      E007E007FFFFFFFFC003C003000F000F80018001000F000F80018001000F000F
      80018001000F000F80018001000F000F80018001000F000F8001800100070007
      80018001000300038001800100010001C003C00300000000E007E00700000000
      F00FF00FFFE0FFE0FFFFFFFFFFF0FFF0FFFFFFFFFF03FF03FC3FFC3FC001C001
      E003E003C001C001E003E003C001C00180038003C001C00180038003C001C001
      80018001C001C00180008000C003C003C000C000C007C007E000E000C007C007
      C000C000C007C00780038003C007C00700030003C007C00700030003C00FC00F
      E007E007C01FC01FE00FE00FFFFFFFFFFFFFFFFFFFFFFFFFC007C007C001C001
      C007C00780018001C007C00780018001C007C00780018001C007C00780018001
      C007C00780018001C007C00780018001C007C00780018001C007C00780018001
      C007C00780018001C007C00780018001C007C00780018001C00FC00F80018001
      C01FC01F80018001FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'TBEMPRESA'
    UniDirectional = False
    Left = 1040
    Top = 416
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 1072
    Top = 416
  end
  object tblVendedorTecnico: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    Filter = '(TIPO > 0)'
    TableName = 'TBVENDEDOR'
    UniDirectional = False
    Left = 1040
    Top = 448
  end
  object dtsVendedorTecnico: TDataSource
    DataSet = tblVendedorTecnico
    Left = 1072
    Top = 448
  end
  object cdsOSEquipamentos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    AfterScroll = cdsOSEquipamentosAfterScroll
    OnNewRecord = cdsOSEquipamentosNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    ep.ano'
      '  , ep.controle'
      '  , ep.equipamento'
      '  , ep.usuario'
      '  , ep.tecnico'
      '  , ep.data_entrega'
      '  , ep.hora_entrega'
      '  , ep.estado_entrega'
      '  , ep.observacao'
      '  , ep.devolvido'
      '  , e.descricao'
      '  , e.marca'
      '  , e.modelo'
      '  , e.referencia'
      '  , e.serial'
      '  , t.descricao as tipo'
      'from TBOS_EQUIPAMENTO ep'
      
        '  left join TBCLIENTE_EQUIPAMENTO e on (e.codigo = ep.equipament' +
        'o)'
      '  left join SYS_TIPO_EQUIPAMENTO t on (t.codigo = e.tipo)')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updOSEquipamentos
    Left = 736
    Top = 40
    object cdsOSEquipamentosANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS_EQUIPAMENTO"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSEquipamentosCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS_EQUIPAMENTO"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSEquipamentosEQUIPAMENTO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Equipamento'
      FieldName = 'EQUIPAMENTO'
      Origin = '"TBOS_EQUIPAMENTO"."EQUIPAMENTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnGetText = cdsOSEquipamentosEQUIPAMENTOGetText
    end
    object cdsOSEquipamentosUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBOS_EQUIPAMENTO"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsOSEquipamentosTECNICO: TIntegerField
      DisplayLabel = 'Respons'#225'vel Dev.'
      FieldName = 'TECNICO'
      Origin = '"TBOS_EQUIPAMENTO"."TECNICO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSEquipamentosOBSERVACAO: TMemoField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAO'
      Origin = '"TBOS_EQUIPAMENTO"."OBSERVACAO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSEquipamentosDEVOLVIDO: TSmallintField
      Alignment = taCenter
      FieldName = 'DEVOLVIDO'
      Origin = '"TBOS_EQUIPAMENTO"."DEVOLVIDO"'
      ProviderFlags = [pfInUpdate]
      OnGetText = cdsOSEquipamentosDEVOLVIDOGetText
    end
    object cdsOSEquipamentosDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
      Origin = '"TBOS_EQUIPAMENTO"."DATA_ENTREGA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'dd/mm/yyyy'
    end
    object cdsOSEquipamentosHORA_ENTREGA: TTimeField
      FieldName = 'HORA_ENTREGA'
      Origin = '"TBOS_EQUIPAMENTO"."HORA_ENTREGA"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = 'hh:mm'
    end
    object cdsOSEquipamentosESTADO_ENTREGA: TMemoField
      FieldName = 'ESTADO_ENTREGA'
      Origin = '"TBOS_EQUIPAMENTO"."ESTADO_ENTREGA"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSEquipamentosDESCRICAO: TIBStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."DESCRICAO"'
      ProviderFlags = []
      Size = 100
    end
    object cdsOSEquipamentosMARCA: TIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."MARCA"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSEquipamentosMODELO: TIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."MODELO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSEquipamentosREFERENCIA: TIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'REFERENCIA'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."REFERENCIA"'
      ProviderFlags = []
    end
    object cdsOSEquipamentosSERIAL: TIBStringField
      DisplayLabel = 'Serial'
      FieldName = 'SERIAL'
      Origin = '"TBCLIENTE_EQUIPAMENTO"."SERIAL"'
      ProviderFlags = []
    end
    object cdsOSEquipamentosTIPO: TIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = '"SYS_TIPO_EQUIPAMENTO"."DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
  end
  object updOSEquipamentos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  EQUIPAMENTO,'
      '  USUARIO,'
      '  OBSERVACAO,'
      '  DEVOLVIDO,'
      '  TECNICO,'
      '  DATA_ENTREGA,'
      '  HORA_ENTREGA,'
      '  ESTADO_ENTREGA'
      'from TBOS_EQUIPAMENTO '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  EQUIPAMENTO = :EQUIPAMENTO')
    ModifySQL.Strings = (
      'update TBOS_EQUIPAMENTO'
      'set'
      '  ANO = :ANO,'
      '  CONTROLE = :CONTROLE,'
      '  DATA_ENTREGA = :DATA_ENTREGA,'
      '  DEVOLVIDO = :DEVOLVIDO,'
      '  EQUIPAMENTO = :EQUIPAMENTO,'
      '  ESTADO_ENTREGA = :ESTADO_ENTREGA,'
      '  HORA_ENTREGA = :HORA_ENTREGA,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  TECNICO = :TECNICO,'
      '  USUARIO = :USUARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  EQUIPAMENTO = :OLD_EQUIPAMENTO')
    InsertSQL.Strings = (
      'insert into TBOS_EQUIPAMENTO'
      
        '  (ANO, CONTROLE, DATA_ENTREGA, DEVOLVIDO, EQUIPAMENTO, ESTADO_E' +
        'NTREGA, '
      '   HORA_ENTREGA, OBSERVACAO, TECNICO, USUARIO)'
      'values'
      
        '  (:ANO, :CONTROLE, :DATA_ENTREGA, :DEVOLVIDO, :EQUIPAMENTO, :ES' +
        'TADO_ENTREGA, '
      '   :HORA_ENTREGA, :OBSERVACAO, :TECNICO, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBOS_EQUIPAMENTO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  EQUIPAMENTO = :OLD_EQUIPAMENTO')
    Left = 768
    Top = 40
  end
  object dtsOSEquipamentos: TDataSource
    AutoEdit = False
    DataSet = cdsOSEquipamentos
    OnStateChange = dtsOSEquipamentosStateChange
    Left = 800
    Top = 40
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COD'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'DESCRI'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ACRESCIMO'
        DataType = ftFloat
      end
      item
        Name = 'CONTA_CORRENTE'
        DataType = ftInteger
      end
      item
        Name = 'DEBITAR_LIMITE_CLIENTE'
        DataType = ftSmallint
      end
      item
        Name = 'FORMAPAGTO_NFCE'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FORMAPAGTO_PDV'
        DataType = ftSmallint
      end
      item
        Name = 'FORMAPAGTO_PDV_CUPOM_EXTRA'
        DataType = ftSmallint
      end>
    IndexDefs = <
      item
        Name = 'PK_TBFORMPAGTO'
        Fields = 'COD'
        Options = [ixUnique]
      end
      item
        Name = 'FK_TBFORMPAGTO_CCORRENTE'
        Fields = 'CONTA_CORRENTE'
      end>
    StoreDefs = True
    TableName = 'TBFORMPAGTO'
    UniDirectional = False
    Left = 1040
    Top = 480
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 1072
    Top = 480
  end
  object tblCondicaoPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VW_CONDICAOPAGTO'
    TableTypes = [ttView]
    UniDirectional = False
    Left = 1040
    Top = 512
  end
  object dtsCondicaoPagto: TDataSource
    DataSet = tblCondicaoPagto
    Left = 1072
    Top = 512
  end
  object cdsOSFormaPagto: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsOSFormaPagtoNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    fp.ano'
      '  , fp.controle'
      '  , fp.formapagto'
      '  , fp.condicaopagto'
      '  , fp.pagto_prazo'
      '  , fp.valor_fpagto'
      '  , fp.valor_recebido'
      '  , fp.prazo_01'
      '  , fp.prazo_02'
      '  , fp.prazo_03'
      '  , fp.prazo_04'
      '  , fp.prazo_05'
      '  , fp.prazo_06'
      '  , fp.prazo_07'
      '  , fp.prazo_08'
      '  , fp.prazo_09'
      '  , fp.prazo_10'
      '  , fp.prazo_11'
      '  , fp.prazo_12'
      'from TBOS_FORMAPAGTO fp')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updOSFormaPagto
    Left = 736
    Top = 72
    object cdsOSFormaPagtoANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS_FORMAPAGTO"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSFormaPagtoCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS_FORMAPAGTO"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSFormaPagtoFORMAPAGTO: TSmallintField
      FieldName = 'FORMAPAGTO'
      Origin = '"TBOS_FORMAPAGTO"."FORMAPAGTO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSFormaPagtoCONDICAOPAGTO: TSmallintField
      FieldName = 'CONDICAOPAGTO'
      Origin = '"TBOS_FORMAPAGTO"."CONDICAOPAGTO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPAGTO_PRAZO: TSmallintField
      FieldName = 'PAGTO_PRAZO'
      Origin = '"TBOS_FORMAPAGTO"."PAGTO_PRAZO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoVALOR_FPAGTO: TIBBCDField
      FieldName = 'VALOR_FPAGTO'
      Origin = '"TBOS_FORMAPAGTO"."VALOR_FPAGTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSFormaPagtoVALOR_RECEBIDO: TIBBCDField
      FieldName = 'VALOR_RECEBIDO'
      Origin = '"TBOS_FORMAPAGTO"."VALOR_RECEBIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSFormaPagtoPRAZO_01: TSmallintField
      FieldName = 'PRAZO_01'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_01"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_02: TSmallintField
      FieldName = 'PRAZO_02'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_02"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_03: TSmallintField
      FieldName = 'PRAZO_03'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_03"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_04: TSmallintField
      FieldName = 'PRAZO_04'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_04"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_05: TSmallintField
      FieldName = 'PRAZO_05'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_05"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_06: TSmallintField
      FieldName = 'PRAZO_06'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_06"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_07: TSmallintField
      FieldName = 'PRAZO_07'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_07"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_08: TSmallintField
      FieldName = 'PRAZO_08'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_08"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_09: TSmallintField
      FieldName = 'PRAZO_09'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_09"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_10: TSmallintField
      FieldName = 'PRAZO_10'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_10"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_11: TSmallintField
      FieldName = 'PRAZO_11'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_11"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoPRAZO_12: TSmallintField
      FieldName = 'PRAZO_12'
      Origin = '"TBOS_FORMAPAGTO"."PRAZO_12"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSFormaPagtoFormaPagtoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'FormaPagtoDescricao'
      LookupDataSet = tblFormaPagto
      LookupKeyFields = 'COD'
      LookupResultField = 'DESCRI'
      KeyFields = 'FORMAPAGTO'
      Size = 100
      Lookup = True
    end
    object cdsOSFormaPagtoCondicaoPagtoDescricao: TStringField
      FieldKind = fkLookup
      FieldName = 'CondicaoPagtoDescricao'
      LookupDataSet = tblCondicaoPagto
      LookupKeyFields = 'COND_COD'
      LookupResultField = 'COND_DESCRICAO_FULL'
      KeyFields = 'CONDICAOPAGTO'
      Size = 250
      Lookup = True
    end
  end
  object updOSFormaPagto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  FORMAPAGTO,'
      '  CONDICAOPAGTO,'
      '  PAGTO_PRAZO,'
      '  VALOR_FPAGTO,'
      '  VALOR_RECEBIDO,'
      '  PRAZO_01,'
      '  PRAZO_02,'
      '  PRAZO_03,'
      '  PRAZO_04,'
      '  PRAZO_05,'
      '  PRAZO_06,'
      '  PRAZO_07,'
      '  PRAZO_08,'
      '  PRAZO_09,'
      '  PRAZO_10,'
      '  PRAZO_11,'
      '  PRAZO_12'
      'from TBOS_FORMAPAGTO '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  FORMAPAGTO = :FORMAPAGTO')
    ModifySQL.Strings = (
      'update TBOS_FORMAPAGTO'
      'set'
      '  ANO = :ANO,'
      '  CONDICAOPAGTO = :CONDICAOPAGTO,'
      '  CONTROLE = :CONTROLE,'
      '  FORMAPAGTO = :FORMAPAGTO,'
      '  PAGTO_PRAZO = :PAGTO_PRAZO,'
      '  PRAZO_01 = :PRAZO_01,'
      '  PRAZO_02 = :PRAZO_02,'
      '  PRAZO_03 = :PRAZO_03,'
      '  PRAZO_04 = :PRAZO_04,'
      '  PRAZO_05 = :PRAZO_05,'
      '  PRAZO_06 = :PRAZO_06,'
      '  PRAZO_07 = :PRAZO_07,'
      '  PRAZO_08 = :PRAZO_08,'
      '  PRAZO_09 = :PRAZO_09,'
      '  PRAZO_10 = :PRAZO_10,'
      '  PRAZO_11 = :PRAZO_11,'
      '  PRAZO_12 = :PRAZO_12,'
      '  VALOR_FPAGTO = :VALOR_FPAGTO,'
      '  VALOR_RECEBIDO = :VALOR_RECEBIDO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  FORMAPAGTO = :OLD_FORMAPAGTO')
    InsertSQL.Strings = (
      'insert into TBOS_FORMAPAGTO'
      
        '  (ANO, CONDICAOPAGTO, CONTROLE, FORMAPAGTO, PAGTO_PRAZO, PRAZO_' +
        '01, PRAZO_02, '
      
        '   PRAZO_03, PRAZO_04, PRAZO_05, PRAZO_06, PRAZO_07, PRAZO_08, P' +
        'RAZO_09, '
      '   PRAZO_10, PRAZO_11, PRAZO_12, VALOR_FPAGTO, VALOR_RECEBIDO)'
      'values'
      
        '  (:ANO, :CONDICAOPAGTO, :CONTROLE, :FORMAPAGTO, :PAGTO_PRAZO, :' +
        'PRAZO_01, '
      
        '   :PRAZO_02, :PRAZO_03, :PRAZO_04, :PRAZO_05, :PRAZO_06, :PRAZO' +
        '_07, :PRAZO_08, '
      
        '   :PRAZO_09, :PRAZO_10, :PRAZO_11, :PRAZO_12, :VALOR_FPAGTO, :V' +
        'ALOR_RECEBIDO)')
    DeleteSQL.Strings = (
      'delete from TBOS_FORMAPAGTO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  FORMAPAGTO = :OLD_FORMAPAGTO')
    Left = 768
    Top = 72
  end
  object dtsOSFormaPagto: TDataSource
    AutoEdit = False
    DataSet = cdsOSFormaPagto
    Left = 800
    Top = 72
  end
  object cdsOSServicos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsOSServicosNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    s.ano'
      '  , s.controle'
      '  , s.seq'
      '  , s.empresa'
      '  , s.cliente'
      '  , s.servico'
      '  , s.qtde'
      '  , s.unidade'
      '  , s.custo'
      '  , s.punit'
      '  , s.punit_promocao'
      '  , s.desconto'
      '  , s.desconto_valor'
      '  , s.pfinal'
      '  , s.total_custo'
      '  , s.total_bruto'
      '  , s.total_desconto'
      '  , s.total_liquido'
      '  , s.aprovado'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , p.aliquota'
      'from TBOS_SERVICO s'
      '  left join TBPRODUTO p on (p.cod = s.servico)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = s.unidade)')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updOSServicos
    Left = 736
    Top = 104
    object cdsOSServicosANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS_SERVICO"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSServicosCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS_SERVICO"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSServicosSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TBOS_SERVICO"."SEQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      OnGetText = cdsOSEquipamentosEQUIPAMENTOGetText
    end
    object cdsOSServicosEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBOS_SERVICO"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsOSServicosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = '"TBOS_SERVICO"."CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSServicosSERVICO: TIBStringField
      FieldName = 'SERVICO'
      Origin = '"TBOS_SERVICO"."SERVICO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsOSServicosQTDE: TIBBCDField
      FieldName = 'QTDE'
      Origin = '"TBOS_SERVICO"."QTDE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsOSServicosUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = '"TBOS_SERVICO"."UNIDADE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSServicosCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"TBOS_SERVICO"."CUSTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosPUNIT: TIBBCDField
      FieldName = 'PUNIT'
      Origin = '"TBOS_SERVICO"."PUNIT"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosPUNIT_PROMOCAO: TIBBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = '"TBOS_SERVICO"."PUNIT_PROMOCAO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"TBOS_SERVICO"."DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
    object cdsOSServicosDESCONTO_VALOR: TIBBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = '"TBOS_SERVICO"."DESCONTO_VALOR"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 4
    end
    object cdsOSServicosPFINAL: TIBBCDField
      FieldName = 'PFINAL'
      Origin = '"TBOS_SERVICO"."PFINAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosTOTAL_CUSTO: TIBBCDField
      FieldName = 'TOTAL_CUSTO'
      Origin = '"TBOS_SERVICO"."TOTAL_CUSTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TBOS_SERVICO"."TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"TBOS_SERVICO"."TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TBOS_SERVICO"."TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSServicosAPROVADO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'APROVADO'
      Origin = '"TBOS_SERVICO"."APROVADO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSServicosDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = '"TBPRODUTO"."DESCRI"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSServicosAPRESENTACAO: TIBStringField
      FieldName = 'APRESENTACAO'
      Origin = '"TBPRODUTO"."APRESENTACAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSServicosDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object cdsOSServicosUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSServicosUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object cdsOSServicosALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = '"TBPRODUTO"."ALIQUOTA"'
      ProviderFlags = []
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
  end
  object updOSServicos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  SEQ,'
      '  EMPRESA,'
      '  CLIENTE,'
      '  SERVICO,'
      '  QTDE,'
      '  UNIDADE,'
      '  CUSTO,'
      '  PUNIT,'
      '  PUNIT_PROMOCAO,'
      '  DESCONTO,'
      '  DESCONTO_VALOR,'
      '  PFINAL,'
      '  TOTAL_CUSTO,'
      '  TOTAL_BRUTO,'
      '  TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO,'
      '  APROVADO'
      'from TBOS_SERVICO '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TBOS_SERVICO'
      'set'
      '  ANO = :ANO,'
      '  APROVADO = :APROVADO,'
      '  CLIENTE = :CLIENTE,'
      '  CONTROLE = :CONTROLE,'
      '  CUSTO = :CUSTO,'
      '  DESCONTO = :DESCONTO,'
      '  DESCONTO_VALOR = :DESCONTO_VALOR,'
      '  EMPRESA = :EMPRESA,'
      '  PFINAL = :PFINAL,'
      '  PUNIT = :PUNIT,'
      '  PUNIT_PROMOCAO = :PUNIT_PROMOCAO,'
      '  QTDE = :QTDE,'
      '  SEQ = :SEQ,'
      '  SERVICO = :SERVICO,'
      '  TOTAL_BRUTO = :TOTAL_BRUTO,'
      '  TOTAL_CUSTO = :TOTAL_CUSTO,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO = :TOTAL_LIQUIDO,'
      '  UNIDADE = :UNIDADE'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TBOS_SERVICO'
      
        '  (ANO, APROVADO, CLIENTE, CONTROLE, CUSTO, DESCONTO, DESCONTO_V' +
        'ALOR, EMPRESA, '
      
        '   PFINAL, PUNIT, PUNIT_PROMOCAO, QTDE, SEQ, SERVICO, TOTAL_BRUT' +
        'O, TOTAL_CUSTO, '
      '   TOTAL_DESCONTO, TOTAL_LIQUIDO, UNIDADE)'
      'values'
      
        '  (:ANO, :APROVADO, :CLIENTE, :CONTROLE, :CUSTO, :DESCONTO, :DES' +
        'CONTO_VALOR, '
      
        '   :EMPRESA, :PFINAL, :PUNIT, :PUNIT_PROMOCAO, :QTDE, :SEQ, :SER' +
        'VICO, :TOTAL_BRUTO, '
      '   :TOTAL_CUSTO, :TOTAL_DESCONTO, :TOTAL_LIQUIDO, :UNIDADE)')
    DeleteSQL.Strings = (
      'delete from TBOS_SERVICO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  SEQ = :OLD_SEQ')
    Left = 768
    Top = 104
  end
  object dtsOSServicos: TDataSource
    AutoEdit = False
    DataSet = cdsOSServicos
    OnStateChange = dtsOSServicosStateChange
    Left = 800
    Top = 104
  end
  object cdsOSProdutos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsOSProdutosNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    sp.ano'
      '  , sp.controle'
      '  , sp.seq'
      '  , sp.empresa'
      '  , sp.cliente'
      '  , sp.produto'
      '  , sp.qtde'
      '  , sp.unidade'
      '  , sp.custo'
      '  , sp.punit'
      '  , sp.punit_promocao'
      '  , sp.desconto'
      '  , sp.desconto_valor'
      '  , sp.pfinal'
      '  , sp.total_custo'
      '  , sp.total_bruto'
      '  , sp.total_desconto'
      '  , sp.total_liquido'
      '  , sp.aprovado'
      '  , p.descri'
      '  , p.apresentacao'
      '  , p.descri_apresentacao'
      '  , u.unp_descricao'
      '  , u.unp_sigla'
      '  , p.aliquota'
      'from TBOS_PRODUTO sp'
      '  left join TBPRODUTO p on (p.cod = sp.produto)'
      '  left join TBUNIDADEPROD u on (u.unp_cod = sp.unidade)')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updOSProdutos
    Left = 736
    Top = 136
    object cdsOSProdutosANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS_PRODUTO"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSProdutosCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS_PRODUTO"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSProdutosSEQ: TSmallintField
      FieldName = 'SEQ'
      Origin = '"TBOS_PRODUTO"."SEQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSProdutosEMPRESA: TIBStringField
      FieldName = 'EMPRESA'
      Origin = '"TBOS_PRODUTO"."EMPRESA"'
      ProviderFlags = [pfInUpdate]
      Size = 18
    end
    object cdsOSProdutosCLIENTE: TIntegerField
      FieldName = 'CLIENTE'
      Origin = '"TBOS_PRODUTO"."CLIENTE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSProdutosPRODUTO: TIBStringField
      FieldName = 'PRODUTO'
      Origin = '"TBOS_PRODUTO"."PRODUTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 10
    end
    object cdsOSProdutosQTDE: TIBBCDField
      FieldName = 'QTDE'
      Origin = '"TBOS_PRODUTO"."QTDE"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.###'
      Precision = 18
      Size = 3
    end
    object cdsOSProdutosUNIDADE: TSmallintField
      FieldName = 'UNIDADE'
      Origin = '"TBOS_PRODUTO"."UNIDADE"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSProdutosCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"TBOS_PRODUTO"."CUSTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosPUNIT: TIBBCDField
      FieldName = 'PUNIT'
      Origin = '"TBOS_PRODUTO"."PUNIT"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosPUNIT_PROMOCAO: TIBBCDField
      FieldName = 'PUNIT_PROMOCAO'
      Origin = '"TBOS_PRODUTO"."PUNIT_PROMOCAO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosDESCONTO: TIBBCDField
      FieldName = 'DESCONTO'
      Origin = '"TBOS_PRODUTO"."DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 3
    end
    object cdsOSProdutosDESCONTO_VALOR: TIBBCDField
      FieldName = 'DESCONTO_VALOR'
      Origin = '"TBOS_PRODUTO"."DESCONTO_VALOR"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00#'
      Precision = 18
      Size = 4
    end
    object cdsOSProdutosPFINAL: TIBBCDField
      FieldName = 'PFINAL'
      Origin = '"TBOS_PRODUTO"."PFINAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosTOTAL_CUSTO: TIBBCDField
      FieldName = 'TOTAL_CUSTO'
      Origin = '"TBOS_PRODUTO"."TOTAL_CUSTO"'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosTOTAL_BRUTO: TIBBCDField
      FieldName = 'TOTAL_BRUTO'
      Origin = '"TBOS_PRODUTO"."TOTAL_BRUTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosTOTAL_DESCONTO: TIBBCDField
      FieldName = 'TOTAL_DESCONTO'
      Origin = '"TBOS_PRODUTO"."TOTAL_DESCONTO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosTOTAL_LIQUIDO: TIBBCDField
      FieldName = 'TOTAL_LIQUIDO'
      Origin = '"TBOS_PRODUTO"."TOTAL_LIQUIDO"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSProdutosAPROVADO: TSmallintField
      FieldName = 'APROVADO'
      Origin = '"TBOS_PRODUTO"."APROVADO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSProdutosDESCRI: TIBStringField
      FieldName = 'DESCRI'
      Origin = '"TBPRODUTO"."DESCRI"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSProdutosAPRESENTACAO: TIBStringField
      FieldName = 'APRESENTACAO'
      Origin = '"TBPRODUTO"."APRESENTACAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSProdutosDESCRI_APRESENTACAO: TIBStringField
      FieldName = 'DESCRI_APRESENTACAO'
      Origin = '"TBPRODUTO"."DESCRI_APRESENTACAO"'
      ProviderFlags = []
      Size = 100
    end
    object cdsOSProdutosUNP_DESCRICAO: TIBStringField
      FieldName = 'UNP_DESCRICAO'
      Origin = '"TBUNIDADEPROD"."UNP_DESCRICAO"'
      ProviderFlags = []
      Size = 50
    end
    object cdsOSProdutosUNP_SIGLA: TIBStringField
      FieldName = 'UNP_SIGLA'
      Origin = '"TBUNIDADEPROD"."UNP_SIGLA"'
      ProviderFlags = []
      Size = 5
    end
    object cdsOSProdutosALIQUOTA: TIBBCDField
      FieldName = 'ALIQUOTA'
      Origin = '"TBPRODUTO"."ALIQUOTA"'
      ProviderFlags = []
      DisplayFormat = ',0.##'
      Precision = 18
      Size = 2
    end
  end
  object updOSProdutos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  SEQ,'
      '  EMPRESA,'
      '  CLIENTE,'
      '  PRODUTO,'
      '  QTDE,'
      '  UNIDADE,'
      '  CUSTO,'
      '  PUNIT,'
      '  PUNIT_PROMOCAO,'
      '  DESCONTO,'
      '  DESCONTO_VALOR,'
      '  PFINAL,'
      '  TOTAL_CUSTO,'
      '  TOTAL_BRUTO,'
      '  TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO,'
      '  APROVADO'
      'from TBOS_PRODUTO '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  SEQ = :SEQ')
    ModifySQL.Strings = (
      'update TBOS_PRODUTO'
      'set'
      '  ANO = :ANO,'
      '  APROVADO = :APROVADO,'
      '  CLIENTE = :CLIENTE,'
      '  CONTROLE = :CONTROLE,'
      '  CUSTO = :CUSTO,'
      '  DESCONTO = :DESCONTO,'
      '  DESCONTO_VALOR = :DESCONTO_VALOR,'
      '  EMPRESA = :EMPRESA,'
      '  PFINAL = :PFINAL,'
      '  PRODUTO = :PRODUTO,'
      '  PUNIT = :PUNIT,'
      '  PUNIT_PROMOCAO = :PUNIT_PROMOCAO,'
      '  QTDE = :QTDE,'
      '  SEQ = :SEQ,'
      '  TOTAL_BRUTO = :TOTAL_BRUTO,'
      '  TOTAL_CUSTO = :TOTAL_CUSTO,'
      '  TOTAL_DESCONTO = :TOTAL_DESCONTO,'
      '  TOTAL_LIQUIDO = :TOTAL_LIQUIDO,'
      '  UNIDADE = :UNIDADE'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  SEQ = :OLD_SEQ')
    InsertSQL.Strings = (
      'insert into TBOS_PRODUTO'
      
        '  (ANO, APROVADO, CLIENTE, CONTROLE, CUSTO, DESCONTO, DESCONTO_V' +
        'ALOR, EMPRESA, '
      
        '   PFINAL, PRODUTO, PUNIT, PUNIT_PROMOCAO, QTDE, SEQ, TOTAL_BRUT' +
        'O, TOTAL_CUSTO, '
      '   TOTAL_DESCONTO, TOTAL_LIQUIDO, UNIDADE)'
      'values'
      
        '  (:ANO, :APROVADO, :CLIENTE, :CONTROLE, :CUSTO, :DESCONTO, :DES' +
        'CONTO_VALOR, '
      
        '   :EMPRESA, :PFINAL, :PRODUTO, :PUNIT, :PUNIT_PROMOCAO, :QTDE, ' +
        ':SEQ, :TOTAL_BRUTO, '
      '   :TOTAL_CUSTO, :TOTAL_DESCONTO, :TOTAL_LIQUIDO, :UNIDADE)')
    DeleteSQL.Strings = (
      'delete from TBOS_PRODUTO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  SEQ = :OLD_SEQ')
    Left = 768
    Top = 136
  end
  object dtsOSProdutos: TDataSource
    AutoEdit = False
    DataSet = cdsOSProdutos
    OnStateChange = dtsOSProdutosStateChange
    Left = 800
    Top = 136
  end
  object cdsOSTecnicos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsOSTecnicosNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '   tc.ano'
      '  , tc.controle'
      '  , tc.tecnico'
      '  , tc.usuario'
      '  , tc.data_cadastro'
      '  , tc.comissao_tipo_lanc'
      '  , tc.comissao_percentual'
      '  , tc.comissao_valor'
      '  , v.nome'
      'from TBOS_TECNICO tc'
      '  left join TBVENDEDOR v on (v.cod = tc.tecnico)')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updOSTecnicos
    Left = 736
    Top = 168
    object cdsOSTecnicosANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS_TECNICO"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSTecnicosCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS_TECNICO"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSTecnicosTECNICO: TIntegerField
      FieldName = 'TECNICO'
      Origin = '"TBOS_TECNICO"."TECNICO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSTecnicosUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBOS_TECNICO"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsOSTecnicosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"TBOS_TECNICO"."DATA_CADASTRO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOSTecnicosCOMISSAO_TIPO_LANC: TSmallintField
      FieldName = 'COMISSAO_TIPO_LANC'
      Origin = '"TBOS_TECNICO"."COMISSAO_TIPO_LANC"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSTecnicosCOMISSAO_PERCENTUAL: TIBBCDField
      FieldName = 'COMISSAO_PERCENTUAL'
      Origin = '"TBOS_TECNICO"."COMISSAO_PERCENTUAL"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 3
    end
    object cdsOSTecnicosCOMISSAO_VALOR: TIBBCDField
      FieldName = 'COMISSAO_VALOR'
      Origin = '"TBOS_TECNICO"."COMISSAO_VALOR"'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object cdsOSTecnicosNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"TBVENDEDOR"."NOME"'
      ProviderFlags = []
      Size = 60
    end
  end
  object updOSTecnicos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  TECNICO,'
      '  USUARIO,'
      '  DATA_CADASTRO,'
      '  COMISSAO_TIPO_LANC,'
      '  COMISSAO_PERCENTUAL,'
      '  COMISSAO_VALOR'
      'from TBOS_TECNICO '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  TECNICO = :TECNICO')
    ModifySQL.Strings = (
      'update TBOS_TECNICO'
      'set'
      '  ANO = :ANO,'
      '  COMISSAO_PERCENTUAL = :COMISSAO_PERCENTUAL,'
      '  COMISSAO_TIPO_LANC = :COMISSAO_TIPO_LANC,'
      '  COMISSAO_VALOR = :COMISSAO_VALOR,'
      '  CONTROLE = :CONTROLE,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  TECNICO = :TECNICO,'
      '  USUARIO = :USUARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  TECNICO = :OLD_TECNICO')
    InsertSQL.Strings = (
      'insert into TBOS_TECNICO'
      
        '  (ANO, COMISSAO_PERCENTUAL, COMISSAO_TIPO_LANC, COMISSAO_VALOR,' +
        ' CONTROLE, '
      '   DATA_CADASTRO, TECNICO, USUARIO)'
      'values'
      
        '  (:ANO, :COMISSAO_PERCENTUAL, :COMISSAO_TIPO_LANC, :COMISSAO_VA' +
        'LOR, :CONTROLE, '
      '   :DATA_CADASTRO, :TECNICO, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBOS_TECNICO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  TECNICO = :OLD_TECNICO')
    Left = 768
    Top = 168
  end
  object dtsOSTecnicos: TDataSource
    AutoEdit = False
    DataSet = cdsOSTecnicos
    OnStateChange = dtsOSTecnicosStateChange
    OnDataChange = dtsOSTecnicosDataChange
    Left = 800
    Top = 168
  end
  object qryTipoComissao: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'Select 0 as CODIGO , '#39'Por Percentual'#39' as DESCRICAO from RDB$DATA' +
        'BASE union'
      
        'Select 1 as CODIGO , '#39'Por Valor (R$)'#39' as DESCRICAO from RDB$DATA' +
        'BASE')
    Left = 1040
    Top = 544
  end
  object dtsTipoComissao: TDataSource
    DataSet = qryTipoComissao
    Left = 1072
    Top = 544
  end
  object qryTitulos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnCalcFields = qryTitulosCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    r.Anolanc'
      '  , r.numlanc'
      '  , r.parcela'
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
      '  , r.Baixado'
      '  , Case when r.Baixado = 1 then '#39'X'#39' else '#39'.'#39' end as Baixado_'
      '  , r.Dtrec'
      '  , r.forma_pagto'
      '  , r.status'
      'from TBCONTREC r')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    Left = 736
    Top = 200
    object qryTitulosANOLANC: TSmallintField
      FieldName = 'ANOLANC'
      Origin = 'TBCONTREC.ANOLANC'
      Required = True
    end
    object qryTitulosNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
      Origin = 'TBCONTREC.NUMLANC'
      Required = True
    end
    object qryTitulosPARCELA: TSmallintField
      Alignment = taCenter
      DisplayLabel = 'Parc.'
      FieldName = 'PARCELA'
      Origin = 'TBCONTREC.PARCELA'
      DisplayFormat = '00'
    end
    object qryTitulosCODBANCO: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Banco'
      FieldName = 'CODBANCO'
      Origin = 'TBCONTREC.CODBANCO'
      DisplayFormat = '0000'
    end
    object qryTitulosNOSSONUMERO: TIBStringField
      DisplayLabel = 'Nosso N'#250'mero'
      FieldName = 'NOSSONUMERO'
      Origin = 'TBCONTREC.NOSSONUMERO'
    end
    object qryTitulosCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'TBCONTREC.CNPJ'
      Size = 18
    end
    object qryTitulosTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = 'TBCONTREC.TIPPAG'
      Size = 35
    end
    object qryTitulosDTEMISS: TDateField
      Alignment = taCenter
      DisplayLabel = 'Emiss'#227'o'
      FieldName = 'DTEMISS'
      Origin = 'TBCONTREC.DTEMISS'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosDTVENC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Vencimento'
      FieldName = 'DTVENC'
      Origin = 'TBCONTREC.DTVENC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosVALORREC: TIBBCDField
      DisplayLabel = 'Valor Doc. (R$)'
      FieldName = 'VALORREC'
      Origin = 'TBCONTREC.VALORREC'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosPERCENTJUROS: TIBBCDField
      DisplayLabel = '% Juros'
      FieldName = 'PERCENTJUROS'
      Origin = 'TBCONTREC.PERCENTJUROS'
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object qryTitulosPERCENTMULTA: TIBBCDField
      DisplayLabel = '% Multa'
      FieldName = 'PERCENTMULTA'
      Origin = 'TBCONTREC.PERCENTMULTA'
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object qryTitulosPERCENTDESCONTO: TIBBCDField
      DisplayLabel = '% Desc.'
      FieldName = 'PERCENTDESCONTO'
      Origin = 'TBCONTREC.PERCENTDESCONTO'
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object qryTitulosVALORRECTOT: TIBBCDField
      FieldName = 'VALORRECTOT'
      Origin = 'TBCONTREC.VALORRECTOT'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosVALORSALDO: TIBBCDField
      FieldName = 'VALORSALDO'
      Origin = 'TBCONTREC.VALORSALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryTitulosDATAPROCESSOBOLETO: TDateField
      FieldName = 'DATAPROCESSOBOLETO'
      Origin = 'TBCONTREC.DATAPROCESSOBOLETO'
    end
    object qryTitulosBAIXADO: TSmallintField
      FieldName = 'BAIXADO'
      Origin = 'TBCONTREC.BAIXADO'
      Required = True
    end
    object qryTitulosBAIXADO_: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Baixado'
      FieldName = 'BAIXADO_'
      Required = True
      FixedChar = True
      Size = 1
    end
    object qryTitulosDTREC: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data Baixa'
      FieldName = 'DTREC'
      Origin = 'TBCONTREC.DTREC'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryTitulosFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
      Origin = '"TBCONTREC"."FORMA_PAGTO"'
      ProviderFlags = []
    end
    object qryTitulosLancamento: TStringField
      Alignment = taCenter
      FieldKind = fkCalculated
      FieldName = 'Lancamento'
      Size = 10
      Calculated = True
    end
    object qryTitulosSTATUS: TIBStringField
      FieldName = 'STATUS'
      Origin = 'TBCONTREC.STATUS'
      Size = 12
    end
  end
  object IbStrPrcGerarTitulos: TIBStoredProc
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    StoredProcName = 'SET_GERAR_TITULOS_OS'
    Left = 768
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'EMPRESA'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'CLIENTE_COD'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'CLIENTE_CNPJ'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'PARCELAS'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_TOTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'PARCELA'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'EMISSAO'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'VENCIMENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftBCD
        Name = 'VALOR_DOCUMENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'FORMA_PAGTO'
        ParamType = ptOutput
      end
      item
        DataType = ftDate
        Name = 'DATA_FINALIZ_OS'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'ANO_LANC'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'NUM_LANC'
        ParamType = ptOutput
      end
      item
        DataType = ftSmallint
        Name = 'ANO_OS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'NUM_OS'
        ParamType = ptInput
      end>
  end
  object dtsTitulos: TDataSource
    AutoEdit = False
    DataSet = qryTitulos
    Left = 800
    Top = 200
  end
  object ppControleOS: TPopupMenu
    Left = 196
    Top = 577
    object mnFinalizarEdicao: TMenuItem
      Tag = 11
      Caption = '&1. Finalizar Edi'#231#227'o'
      Hint = 'Finalizar edi'#231#227'o da  OS (Coloc'#225'-la em status "Aberta")'
      OnClick = mnFinalizarEdicaoClick
    end
    object mnIniciarAvaliacao: TMenuItem
      Tag = 12
      Caption = '&2. Iniciar Avalia'#231#227'o'
      Hint = 
        'Iniciar processo da Avalia'#231#227'o da  OS (Coloc'#225'-la em status "Avali' +
        'a'#231#227'o")'
      OnClick = mnIniciarAvaliacaoClick
    end
    object mnLancarParecer: TMenuItem
      Tag = 13
      Caption = '&3. Lan'#231'ar Parecer/Diagn'#243'stico'
      Hint = 
        'Lan'#231'ar o parecer/diagn'#243'stico t'#233'cnico (Coloc'#225'-la em status "Parec' +
        'er")'
      OnClick = mnLancarParecerClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnAprovarOS: TMenuItem
      Tag = 14
      Caption = '&4. Aprovar'
      OnClick = mnAprovarOSClick
    end
    object mnLancarAtendimento: TMenuItem
      Tag = 15
      Caption = '&5. Iniciar/Lan'#231'ar Atendimento'
      OnClick = mnLancarAtendimentoClick
    end
    object mnFinalizarOS: TMenuItem
      Tag = 16
      Caption = '&6. Finalizar OS'
      OnClick = mnFinalizarOSClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnFaturarOS: TMenuItem
      Tag = 17
      Caption = '&7. Faturar OS'
      OnClick = mnFaturarOSClick
    end
  end
  object cdsOSEventos: TIBDataSet
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnNewRecord = cdsOSEventosNewRecord
    BufferChunks = 1000
    CachedUpdates = True
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'Select'
      '    ev.ano'
      '  , ev.controle'
      '  , ev.sequencial'
      '  , ev.data_cadastro'
      '  , ev.data_evento'
      '  , ev.usuario'
      '  , ev.tecnico'
      '  , ev.descricao'
      '  , ev.evento'
      '  , ev.imprimir'
      '  , t.nome as tecnico_nome'
      'from TBOS_EVENTO ev'
      '  left join TBVENDEDOR t on (t.cod = ev.tecnico)')
    ModifySQL.Strings = (
      '')
    ParamCheck = True
    UniDirectional = False
    UpdateObject = updOSEventos
    Left = 736
    Top = 232
    object cdsOSEventosANO: TSmallintField
      FieldName = 'ANO'
      Origin = '"TBOS_EVENTO"."ANO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSEventosCONTROLE: TIntegerField
      FieldName = 'CONTROLE'
      Origin = '"TBOS_EVENTO"."CONTROLE"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsOSEventosSEQUENCIAL: TSmallintField
      FieldName = 'SEQUENCIAL'
      Origin = '"TBOS_EVENTO"."SEQUENCIAL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object cdsOSEventosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = '"TBOS_EVENTO"."DATA_CADASTRO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOSEventosDATA_EVENTO: TDateField
      FieldName = 'DATA_EVENTO'
      Origin = '"TBOS_EVENTO"."DATA_EVENTO"'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsOSEventosUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = '"TBOS_EVENTO"."USUARIO"'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object cdsOSEventosTECNICO: TIntegerField
      FieldName = 'TECNICO'
      Origin = '"TBOS_EVENTO"."TECNICO"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSEventosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"TBOS_EVENTO"."DESCRICAO"'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsOSEventosEVENTO: TMemoField
      FieldName = 'EVENTO'
      Origin = '"TBOS_EVENTO"."EVENTO"'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 8
    end
    object cdsOSEventosIMPRIMIR: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'IMPRIMIR'
      Origin = '"TBOS_EVENTO"."IMPRIMIR"'
      ProviderFlags = [pfInUpdate]
    end
    object cdsOSEventosTECNICO_NOME: TIBStringField
      FieldName = 'TECNICO_NOME'
      Origin = '"TBVENDEDOR"."NOME"'
      ProviderFlags = []
      Size = 60
    end
  end
  object updOSEventos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  CONTROLE,'
      '  SEQUENCIAL,'
      '  DATA_CADASTRO,'
      '  DATA_EVENTO,'
      '  USUARIO,'
      '  TECNICO,'
      '  DESCRICAO,'
      '  EVENTO,'
      '  IMPRIMIR'
      'from TBOS_EVENTO '
      'where'
      '  ANO = :ANO and'
      '  CONTROLE = :CONTROLE and'
      '  SEQUENCIAL = :SEQUENCIAL')
    ModifySQL.Strings = (
      'update TBOS_EVENTO'
      'set'
      '  ANO = :ANO,'
      '  CONTROLE = :CONTROLE,'
      '  DATA_CADASTRO = :DATA_CADASTRO,'
      '  DATA_EVENTO = :DATA_EVENTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  EVENTO = :EVENTO,'
      '  IMPRIMIR = :IMPRIMIR,'
      '  SEQUENCIAL = :SEQUENCIAL,'
      '  TECNICO = :TECNICO,'
      '  USUARIO = :USUARIO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    InsertSQL.Strings = (
      'insert into TBOS_EVENTO'
      
        '  (ANO, CONTROLE, DATA_CADASTRO, DATA_EVENTO, DESCRICAO, EVENTO,' +
        ' IMPRIMIR, '
      '   SEQUENCIAL, TECNICO, USUARIO)'
      'values'
      
        '  (:ANO, :CONTROLE, :DATA_CADASTRO, :DATA_EVENTO, :DESCRICAO, :E' +
        'VENTO, '
      '   :IMPRIMIR, :SEQUENCIAL, :TECNICO, :USUARIO)')
    DeleteSQL.Strings = (
      'delete from TBOS_EVENTO'
      'where'
      '  ANO = :OLD_ANO and'
      '  CONTROLE = :OLD_CONTROLE and'
      '  SEQUENCIAL = :OLD_SEQUENCIAL')
    Left = 768
    Top = 232
  end
  object dtsOSEventos: TDataSource
    AutoEdit = False
    DataSet = cdsOSEventos
    OnStateChange = dtsOSEventosStateChange
    Left = 800
    Top = 232
  end
  object ppImprimir: TPopupMenu
    Left = 160
    Top = 576
    object nmImprimirOS: TMenuItem
      Caption = 'Ordem de &Servi'#231'os'
      Enabled = False
    end
    object nmImprimirOrcamento: TMenuItem
      Caption = '&Or'#231'amento'
      Enabled = False
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object nmGerarImprimirBoletos: TMenuItem
      Tag = 20
      Caption = 'Gerar / Imprimir &Boletos'
      Enabled = False
    end
  end
  object ppCorrigirDadosGerais: TPopupMenu
    Left = 124
    Top = 577
    object mnpCorrigirEnderecoEntrega: TMenuItem
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
      Caption = 'Corrigir Local de Entrega/Realiza'#231#227'o'
      OnClick = mnpCorrigirEnderecoEntregaClick
    end
  end
  object dtsTotalTitulosAbertos: TDataSource
    DataSet = fdQryTotalTitulosAbertos
    Left = 912
    Top = 56
  end
  object fdQryServicoProduto: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    p.*'
      '  , case when coalesce(p.Reserva, 0) > 0'
      '      then coalesce(p.Qtde, 0) - coalesce(p.Reserva, 0)'
      '      else coalesce(p.Qtde, 0)'
      '    end as Disponivel'
      '  , g.Descri as Descricao_Grupo'
      '  , coalesce(s.Scp_descricao, p.Secao) as Descricao_Secao'
      '  , coalesce(u.Unp_descricao, p.Unidade) as Descricao_Unidade'
      '  , u.Unp_sigla'
      '  , c.Cfop_descricao'
      '  , c.Cfop_especificacao'
      'from TBPRODUTO p'
      '  left join TBGRUPOPROD g on (g.Cod = p.Codgrupo)'
      '  left join TBSECAOPROD s on (s.Scp_cod = p.Codsecao)'
      '  left join TBUNIDADEPROD u on (u.Unp_cod = p.Codunidade)'
      '  left join TBCFOP c on (c.Cfop_cod = p.Codcfop)'
      'where p.codigo        = :Codigo'
      '  and p.aliquota_tipo = :Tipo')
    Left = 884
    Top = 11
    ParamData = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TIPO'
        DataType = ftSmallint
        ParamType = ptInput
      end>
  end
  object fdQryTotalTitulosAbertos: TFDQuery
    Connection = DMBusiness.fdConexao
    Transaction = DMBusiness.fdTransacao
    UpdateTransaction = DMBusiness.fdTransacao
    SQL.Strings = (
      'Select'
      '    g.Valor_limite'
      '  , g.Valor_compras_abertas'
      '  , g.Valor_limite_disponivel'
      'from GET_LIMITE_DISPONIVEL_CLIENTE(:CLIENTE) g')
    Left = 880
    Top = 56
    ParamData = <
      item
        Name = 'CLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object fdQryTotalTitulosAbertosVALOR_LIMITE: TBCDField
      FieldName = 'VALOR_LIMITE'
      Origin = 'VALOR_LIMITE'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTotalTitulosAbertosVALOR_COMPRAS_ABERTAS: TBCDField
      FieldName = 'VALOR_COMPRAS_ABERTAS'
      Origin = 'VALOR_COMPRAS_ABERTAS'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object fdQryTotalTitulosAbertosVALOR_LIMITE_DISPONIVEL: TBCDField
      FieldName = 'VALOR_LIMITE_DISPONIVEL'
      Origin = 'VALOR_LIMITE_DISPONIVEL'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object imgOS: TcxImageList
    FormatVersion = 1
    DesignInfo = 524800
    ImageInfo = <
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0
          C00000E0C00000E0C00000E0C00000E0C00000E0C00000E0C000}
        MaskColor = 57536
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          200000000000000400000000000000000000000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF0000000000000000919191FEFFFF
          FFFFD2D2D2FFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF0000000000000000919191FEFFFF
          FFFFD2D2D2FFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF0000000000000000919191FEFFFF
          FFFFD2D2D2FFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF0000000000000000919191FEFFFF
          FFFFD2D2D2FFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFFCF9F7FFFCF9F7FFFCF9F7FFFCF9F7FFFCF9
          F7FFFCF9F7FFFCF9F7FFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFFCF9F7FFF4EBE1FFF4EBE1FFF4EBE1FFF4EB
          E1FFF4EBE1FFFCF9F7FFB2773DFFB2773DFF0000000000000000919191FEFFFF
          FFFFD2D2D2FFB2773DFFB2773DFFFCF9F7FFF4EBE1FFF4EBE1FFF4EBE1FFF4EB
          E1FFF4EBE1FFFCF9F7FFB2773DFFB2773DFF0000000000000000919191FEFFFF
          FFFFD2D2D2FFB2773DFFB2773DFFFCF9F7FFFCF9F7FFFCF9F7FFFCF9F7FFFCF9
          F7FFFCF9F7FFFCF9F7FFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF000000000000000000000000B277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB2773DFFB277
          3DFFB2773DFFB2773DFFB2773DFFB2773DFF0000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000005294
          BDCE66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7
          EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF5395BFD0000000000000000064B4
          E6FB66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF66B7
          EAFF66B7EAFF66B7EAFF66B7EAFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFF324BCCFF324BCCFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFF324BCCFF324BCCFF324BCCFF324BCCFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFF324BCCFF324BCCFF324BCCFF324BCCFF324BCCFF324B
          CCFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFF324BCCFF324BCCFFFFFFFFFFFFFFFFFF324BCCFF324B
          CCFF324BCCFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFCFCFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5052
          CEFF324BCCFF324BCCFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF324BCCFF324BCCFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFAFAFDFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF66B7EAFF65B6E8FD000000000000000064B4
          E6FB66B7EAFFFFFFFFFF939393FF787878FF787878FF787878FF787878FF7878
          78FF787878FF8F8F8FFFFFFFFFFF66B7EAFF65B6E8FD00000000000000005294
          BDCE66B7EAFF63B1E2F7456A819C414D55906C6D6DE7787878FF787878FF6D6E
          6EEA3E474D89405F739062B0E0F566B7EAFF5395BECF00000000000000000000
          0000020406060204050602040506020303043E414286787878FF787878FF4142
          448C020203040204050602040506020406060000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000003268839951AB
          D7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFFA6D6E9E9080D0F100000000051ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF326680940000000051ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF10212A3151ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF4087AAC651ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FFFFFFFFFFFFFFFFFFFFFFFFFF51ABD7FF51AB
          D7FF51ABD7FF51ABD7FFFFFFFFFF51ABD7FF51ABD7FF51ABD7FFFBFBFBFBFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFB2E7FFFF51ABD7FF51ABD7FF93BBCACA6ABB
          E2FF53AEDBFF53AEDBFF6ABBE2FFC1F0FFFFFFFFFFFFFFFFFFFFD7FFFFFF51AB
          D7FF51ABD7FF51ABD7FF51ABD7FFE2FFFFFF51ABD7FF51ABD7FF02020303264D
          5F6E4EA3CDEF53AEDBFF53AEDBFF53AEDBFF56B0DBFFBCEEFFFFFFFFFFFF90D3
          F4FF51ABD7FF51ABD7FF51ABD7FF51ABD7FFDCFFFFFF51ABD7FF000000000000
          000007101417346D89A051A9D5F851A9D5F851A9D5F851A9D5F877C0E5F8FAFA
          FAFAA1DBFAFC51ABD7FF51ABD7FF51ABD7FF51ABD7FFD5FAFAFA000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
      end
      item
        Image.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          20000000000000040000000000000000000000000000000000004E2D0E74A86A
          2DF3AD6C2EFFD3AF89FFCAD0D5FFCAD0D5FFD3AF89FFAD6C2EFFA86A2DF34E2D
          0E74000000000000000000000000000000000000000000000000B1773DFFB277
          3EFFB07338FFD3AF89FFCAD0D5FFCAD0D5FFD3AF89FFB07338FFB2773EFFB177
          3DFF000000000000000000000000000000000000000000000000B2773DFFB378
          3EFFAE7134FFE3CAAFFFB6BBC0FFB6BBC0FFE3CAAFFFAE7134FFB3783EFFB277
          3DFF000000000000000000000000000000000000000000000000AC6C2DFFB378
          3EFFAD6E30FFF2E4D6FFAAAFB2FFAAAFB2FFF2E4D6FFAD6E30FFB3783EFFAC6C
          2DFF00000000000000000000000000000000000000000000000006030109AC6D
          2EFFAA6A2AFFF8ECDEFF9398A0FF9398A0FFF8ECDEFFAA6A2AFFAC6D2EFF0603
          0109696C6F85CAD0D5FFD3AF89FFAD6C2EFFA86A2DF34E2D0E74000000000000
          0000371F0757CDBFB2DF3634333736343337CDBFB2DF371F07570A06030E715E
          4A89C9CFD4FECAD0D5FFD3AF89FFB07338FFB2773EFFB1773DFF000000000000
          000000000000482F1669A76321FFA76321FF482F16690604020896612DDCE3CA
          AFFFB6BBC0FFB6BBC0FFE3CAAFFFAE7134FFB3783EFFB2773DFF000000000000
          0000482A0C6EB1763AFFB3783DFFB3783DFFB1763AFF482A0C6E50331676F2E4
          D6FFAAAFB2FFAAAFB2FFF2E4D6FFAD6E30FFB3783EFFAC6C2DFF000000000000
          0000AA6C2DFAB3783EFFB3783EFFB3783EFFB3783EFFAA6C2DFA23160934F8EC
          DEFF9398A0FF9398A0FFF8ECDEFFAA6A2AFFAC6D2EFF06030109000000000000
          0000A4672BF1B2773EFFB3783EFFB3783EFFB2773EFFA4672BF10D070214CDBF
          B2DF3634333736343337CDBFB2DF371F07570000000000000000000000000000
          00002817073CB2773EFFB2773EFFB2773EFFB2773EFF2817073C00000000482F
          1669A76321FFA76321FF482F1669000000000000000000000000000000000000
          0000000000002717073B9F6429EB9F6429EB2717073B0000000045280C6AB176
          3AFFB3783DFFB3783DFFB1763AFF482A0C6E0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000AA6C2DFAB378
          3EFFB3783EFFB3783EFFB3783EFFAA6C2DFA0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000A4672BF1B277
          3EFFB3783EFFB3783EFFB2773EFFA4672BF10000000000000000000000000000
          00000000000000000000000000000000000000000000000000002817073CB277
          3EFFB2773EFFB2773EFFB2773EFF2817073C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000002717
          073B9F6429EB9F6429EB2717073B000000000000000000000000}
      end>
  end
end

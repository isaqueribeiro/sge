inherited frmGeFluxoCaixa: TfrmGeFluxoCaixa
  Top = 144
  Width = 1148
  Height = 690
  ActiveControl = dbCodigo
  Caption = 'Tesouraria'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 648
    Width = 1132
  end
  inherited Bevel3: TBevel
    Top = 609
    Width = 1132
  end
  inherited tlbBotoes: TToolBar
    Top = 613
    Width = 1132
    inherited btbtnLista: TBitBtn
      Visible = True
    end
  end
  inherited pgcGuias: TPageControl
    Width = 1132
    Height = 609
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Top = 364
        Width = 1124
      end
      object Bevel5: TBevel [1]
        Left = 0
        Top = 514
        Width = 1124
        Height = 4
        Align = alBottom
        Shape = bsSpacer
      end
      inherited dbgDados: TDBGrid
        Width = 1124
        Height = 364
        Columns = <
          item
            Expanded = False
            FieldName = 'NUMERO'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA'
            Title.Alignment = taCenter
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HISTORICO'
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'FORMA_PAGTO_DESC'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_CREDITO'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR_DEBITO'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DUPLICATA'
            Width = 90
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 518
        Width = 1124
        TabOrder = 2
        inherited grpBxFiltro: TGroupBox
          Left = 4
          Width = 1116
          Align = alClient
          inherited lbltFiltrar: TLabel
            Left = 662
            Width = 53
            Caption = 'Hist'#243'rico:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 1071
          end
          object lblData: TLabel [2]
            Left = 14
            Top = 25
            Width = 46
            Height = 13
            Caption = '&Per'#237'odo:'
            FocusControl = e1Data
          end
          object lblContaCorrentePesq: TLabel [3]
            Left = 288
            Top = 25
            Width = 26
            Height = 13
            Caption = '&C/C.:'
            FocusControl = edtFiltrar
          end
          inherited edtFiltrar: TEdit
            Left = 720
            Width = 347
            TabOrder = 3
          end
          object edContaCorrentePesq: TRxLookupEdit
            Left = 320
            Top = 21
            Width = 337
            Height = 21
            FieldsDelimiter = #0
            LookupDisplay = 'DESCRICAO_FULL'
            LookupField = 'CODIGO'
            LookupSource = dtsContaCorrente
            TabOrder = 2
            OnChange = edContaCorrentePesqChange
          end
          object e1Data: TDateEdit
            Left = 72
            Top = 21
            Width = 100
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
            Left = 176
            Top = 21
            Width = 104
            Height = 21
            NumGlyphs = 2
            TabOrder = 1
            Text = '01/01/2012'
          end
        end
      end
      object pnlConsolidacao: TPanel
        Left = 0
        Top = 368
        Width = 1124
        Height = 146
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object lblMovCaixaCancelado: TLabel
          Left = 0
          Top = 8
          Width = 184
          Height = 13
          Caption = '* Movimento de caixa cancelado'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnlSaldosDias: TPanel
          Left = 359
          Top = 0
          Width = 217
          Height = 146
          Align = alRight
          BorderStyle = bsSingle
          TabOrder = 0
          object dbLContaCorrente: TDBText
            Left = 1
            Top = 23
            Width = 211
            Height = 29
            Align = alTop
            Alignment = taCenter
            Color = 12320767
            DataField = 'DESCRICAO_FULL'
            DataSource = dtsContaCorrente
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            WordWrap = True
          end
          object Bevel6: TBevel
            Left = 1
            Top = 52
            Width = 211
            Height = 2
            Align = alTop
            Shape = bsTopLine
          end
          object Bevel16: TBevel
            Left = 1
            Top = 21
            Width = 211
            Height = 2
            Align = alTop
            Shape = bsTopLine
          end
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 211
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Caption = 'CONTA CORRENTE'
            Color = clMoneyGreen
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object Panel2: TPanel
            Left = 1
            Top = 54
            Width = 211
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Caption = 'SALDO NOS DIAS:'
            Color = clMoneyGreen
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object Panel3: TPanel
            Left = 1
            Top = 74
            Width = 211
            Height = 84
            Align = alTop
            BevelOuter = bvNone
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object Bevel17: TBevel
              Left = 97
              Top = 0
              Width = 1
              Height = 84
              Align = alLeft
              Shape = bsLeftLine
            end
            object Panel4: TPanel
              Left = 0
              Top = 0
              Width = 97
              Height = 84
              Align = alLeft
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object dbLDataFinal: TDBText
                Left = 0
                Top = 44
                Width = 97
                Height = 19
                Align = alTop
                Alignment = taCenter
                Color = 12320767
                DataField = 'SALDO_FINAL_DATA'
                DataSource = dtsSaldosDias
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object BvDataFinal: TBevel
                Left = 0
                Top = 63
                Width = 97
                Height = 4
                Align = alTop
                Shape = bsTopLine
              end
              object dbLDataInicial: TDBText
                Left = 0
                Top = 23
                Width = 97
                Height = 19
                Align = alTop
                Alignment = taCenter
                DataField = 'SALDO_INICIAL_DATA'
                DataSource = dtsSaldosDias
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Bevel9: TBevel
                Left = 0
                Top = 42
                Width = 97
                Height = 2
                Align = alTop
                Shape = bsTopLine
              end
              object dbLDataAnterior: TDBText
                Left = 0
                Top = 2
                Width = 97
                Height = 19
                Align = alTop
                Alignment = taCenter
                Color = 12320767
                DataField = 'SALDO_ANTERIOR_DATA'
                DataSource = dtsSaldosDias
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Bevel10: TBevel
                Left = 0
                Top = 21
                Width = 97
                Height = 2
                Align = alTop
                Shape = bsTopLine
              end
              object Bevel14: TBevel
                Left = 0
                Top = 0
                Width = 97
                Height = 2
                Align = alTop
                Shape = bsTopLine
              end
            end
            object Panel5: TPanel
              Left = 98
              Top = 0
              Width = 113
              Height = 84
              Align = alClient
              BevelOuter = bvNone
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              object dbLSaldoFinal: TDBText
                Left = 0
                Top = 44
                Width = 113
                Height = 19
                Align = alTop
                Alignment = taRightJustify
                Color = 12320767
                DataField = 'SALDO_FINAL_VALOR'
                DataSource = dtsSaldosDias
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object BvSaldoFinal: TBevel
                Left = 0
                Top = 63
                Width = 113
                Height = 4
                Align = alTop
                Shape = bsTopLine
              end
              object dbLSaldoInicial: TDBText
                Left = 0
                Top = 23
                Width = 113
                Height = 19
                Align = alTop
                Alignment = taRightJustify
                DataField = 'SALDO_INICIAL_VALOR'
                DataSource = dtsSaldosDias
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Bevel12: TBevel
                Left = 0
                Top = 42
                Width = 113
                Height = 2
                Align = alTop
                Shape = bsTopLine
              end
              object dbLSaldoAnterior: TDBText
                Left = 0
                Top = 2
                Width = 113
                Height = 19
                Align = alTop
                Alignment = taRightJustify
                Color = 12320767
                DataField = 'SALDO_ANTERIOR_VALOR'
                DataSource = dtsSaldosDias
                Font.Charset = ANSI_CHARSET
                Font.Color = clBlue
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object Bevel13: TBevel
                Left = 0
                Top = 21
                Width = 113
                Height = 2
                Align = alTop
                Shape = bsTopLine
              end
              object Bevel15: TBevel
                Left = 0
                Top = 0
                Width = 113
                Height = 2
                Align = alTop
                Shape = bsTopLine
              end
            end
          end
        end
        object Panel6: TPanel
          Left = 576
          Top = 0
          Width = 548
          Height = 146
          Align = alRight
          BorderStyle = bsSingle
          TabOrder = 1
          object DBText1: TDBText
            Left = 1
            Top = 23
            Width = 542
            Height = 18
            Align = alTop
            Alignment = taCenter
            Color = 12320767
            DataField = 'DESCRICAO_FULL'
            DataSource = dtsContaCorrente
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
            Visible = False
            WordWrap = True
          end
          object Bevel19: TBevel
            Left = 1
            Top = 41
            Width = 542
            Height = 2
            Align = alTop
            Shape = bsTopLine
            Visible = False
          end
          object Bevel20: TBevel
            Left = 1
            Top = 21
            Width = 542
            Height = 2
            Align = alTop
            Shape = bsTopLine
            Visible = False
          end
          object Panel7: TPanel
            Left = 1
            Top = 1
            Width = 542
            Height = 20
            Align = alTop
            BevelOuter = bvNone
            Caption = 'CONTA CORRENTE'
            Color = clMoneyGreen
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Visible = False
          end
          object dbgConsolidadoFormaPagto: TDBGrid
            Left = 1
            Top = 43
            Width = 542
            Height = 98
            TabStop = False
            Align = alClient
            BorderStyle = bsNone
            Color = clBtnFace
            Ctl3D = False
            DataSource = dtsConsolidadoFormaPagto
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentCtl3D = False
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
                FieldName = 'DATA'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FORMA_PAGTO_DESC'
                Width = 170
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SaldoDisplay'
                Title.Caption = 'Saldo'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENTRADA'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SAIDA'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                Width = 100
                Visible = True
              end>
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 73
        Width = 1124
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 1124
        Height = 73
        object lblDataMov: TLabel [1]
          Left = 96
          Top = 24
          Width = 27
          Height = 13
          Caption = 'Data:'
          FocusControl = dbDataMov
        end
        object lblTipo: TLabel [2]
          Left = 208
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Tipo Movimento:'
          FocusControl = dbTipo
        end
        object lblContaCorrente: TLabel [3]
          Left = 512
          Top = 24
          Width = 79
          Height = 13
          Caption = 'Conta Corrente:'
          FocusControl = dbContaCorrente
        end
        object lblSituacao: TLabel [4]
          Left = 920
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
        object lblCaixa: TLabel [5]
          Left = 816
          Top = 24
          Width = 81
          Height = 13
          Caption = 'N'#250'mero Caixa:'
          FocusControl = d1Caixa
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblFormaPagto: TLabel [6]
          Left = 336
          Top = 24
          Width = 106
          Height = 13
          Caption = 'Forma de Pagamento:'
          FocusControl = dbFormaPagto
        end
        object lblUsuario: TLabel [7]
          Left = 1008
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Usu'#225'rio:'
          FocusControl = dbUsuario
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
        object dbDataMov: TDBDateEdit
          Left = 96
          Top = 40
          Width = 105
          Height = 21
          DataField = 'DATAHORA'
          DataSource = DtSrcTabela
          DialogTitle = 'Selecionar Data de Abertura'
          NumGlyphs = 2
          TabOrder = 1
          StartOfWeek = Sun
        end
        object dbTipo: TDBLookupComboBox
          Left = 208
          Top = 40
          Width = 121
          Height = 21
          DataField = 'TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'TIPO'
          ListField = 'TIPO_DESC'
          ListSource = dtsTipoMovimento
          ParentFont = False
          TabOrder = 2
        end
        object dbContaCorrente: TDBLookupComboBox
          Left = 512
          Top = 40
          Width = 297
          Height = 21
          Color = clMoneyGreen
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
          ReadOnly = True
          TabOrder = 4
        end
        object dbSituacao: TDBEdit
          Left = 920
          Top = 40
          Width = 81
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
          TabOrder = 7
        end
        object d1Caixa: TDBEdit
          Left = 816
          Top = 40
          Width = 41
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CAIXA_ANO'
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
        object d2Caixa: TDBEdit
          Left = 856
          Top = 40
          Width = 57
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'CAIXA_NUM'
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
        object dbFormaPagto: TDBLookupComboBox
          Left = 336
          Top = 40
          Width = 169
          Height = 21
          Hint = 
            'Dica:'#13#10#13#10'Ao selecionar uma Forma de Pagamento que possua Caixa A' +
            'berto para o'#13#10'usu'#225'rio da opera'#231#227'o, a Conta Corrente deste caixa ' +
            'ser'#225' carregada de forma'#13#10'autom'#225'tica.'
          DataField = 'FORMA_PAGTO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'DESCRI'
          ListSource = dtsFormaPagto
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnExit = ControlEditExit
        end
        object dbUsuario: TDBEdit
          Left = 1008
          Top = 40
          Width = 105
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'USUARIO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 8
        end
      end
      object GrpBxCreditoDebito: TGroupBox
        Left = 0
        Top = 77
        Width = 1124
        Height = 236
        Align = alTop
        Caption = 'Cr'#233'dito / D'#233'bito'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          1124
          236)
        object lblHistorico: TLabel
          Left = 304
          Top = 144
          Width = 53
          Height = 13
          Caption = 'Hist'#243'rico:'
          FocusControl = dbHistorico
        end
        object lblValorMov: TLabel
          Left = 664
          Top = 184
          Width = 60
          Height = 13
          Caption = 'Valor (R$):'
          FocusControl = dbValorMov
        end
        object lblCliente: TLabel
          Left = 16
          Top = 64
          Width = 42
          Height = 13
          Caption = 'Cliente:'
          FocusControl = dbCliente
        end
        object lblFornecedor: TLabel
          Left = 16
          Top = 104
          Width = 67
          Height = 13
          Caption = 'Fornecedor:'
          FocusControl = dbFornecedor
        end
        object lblVenda: TLabel
          Left = 512
          Top = 64
          Width = 58
          Height = 13
          Caption = 'No. Venda:'
          FocusControl = dbVenda
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblTitulo: TLabel
          Left = 664
          Top = 64
          Width = 55
          Height = 13
          Caption = 'No. T'#237'tulo:'
          FocusControl = dbTitulo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCompra: TLabel
          Left = 512
          Top = 104
          Width = 67
          Height = 13
          Caption = 'No. Compra:'
          FocusControl = dbCompra
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblDuplicata: TLabel
          Left = 664
          Top = 104
          Width = 76
          Height = 13
          Caption = 'No. Duplicata:'
          FocusControl = dbDuplicata
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblEmpresa: TLabel
          Left = 16
          Top = 24
          Width = 52
          Height = 13
          Caption = 'Empresa:'
          FocusControl = dbEmpresa
        end
        object lblTipoDespesa: TLabel
          Left = 16
          Top = 144
          Width = 95
          Height = 13
          Caption = 'Tipo de Despesa:'
          FocusControl = dbTipoDespesa
        end
        object dbHistorico: TDBEdit
          Left = 304
          Top = 160
          Width = 505
          Height = 21
          CharCase = ecUpperCase
          DataField = 'HISTORICO'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object dbValorMov: TDBEdit
          Left = 664
          Top = 200
          Width = 145
          Height = 21
          CharCase = ecUpperCase
          DataField = 'VALOR'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
        end
        object dbCliente: TRxDBComboEdit
          Left = 16
          Top = 80
          Width = 489
          Height = 21
          ButtonHint = 'Pesquisar Cliente (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME_CLENTE'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
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
          OnButtonClick = dbClienteButtonClick
        end
        object dbFornecedor: TRxDBComboEdit
          Left = 16
          Top = 120
          Width = 489
          Height = 21
          ButtonHint = 'Pesquisar Fornecedor (Ctrl+P)'
          CharCase = ecUpperCase
          ClickKey = 16464
          Color = clMoneyGreen
          DataField = 'NOME_FORNECEDOR'
          DataSource = DtSrcTabela
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
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
          TabOrder = 4
          OnButtonClick = dbFornecedorButtonClick
        end
        object dbVenda: TDBEdit
          Left = 512
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'VENDA'
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
        object dbTitulo: TDBEdit
          Left = 664
          Top = 80
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'TITULO'
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
        object dbCompra: TDBEdit
          Left = 512
          Top = 120
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'COMPRA'
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
        object dbDuplicata: TDBEdit
          Left = 664
          Top = 120
          Width = 145
          Height = 21
          TabStop = False
          Color = clMoneyGreen
          DataField = 'DUPLICATA'
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
        object GrbBxObs: TGroupBox
          Left = 826
          Top = 7
          Width = 290
          Height = 219
          Anchors = [akLeft, akTop, akRight, akBottom]
          Caption = 'Observa'#231#245'es:'
          TabOrder = 10
          TabStop = True
          object Bevel7: TBevel
            Left = 2
            Top = 213
            Width = 286
            Height = 4
            Align = alBottom
            Shape = bsSpacer
          end
          object Bevel11: TBevel
            Left = 2
            Top = 15
            Width = 4
            Height = 198
            Align = alLeft
            Shape = bsSpacer
          end
          object Bevel18: TBevel
            Left = 284
            Top = 15
            Width = 4
            Height = 198
            Align = alRight
            Shape = bsSpacer
          end
          object memObservacoes: TMemo
            Left = 6
            Top = 15
            Width = 278
            Height = 198
            TabStop = False
            Align = alClient
            Alignment = taCenter
            BorderStyle = bsNone
            Color = clBtnFace
            Ctl3D = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Lines.Strings = (
              'memObservacoes')
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object dbEmpresa: TDBLookupComboBox
          Left = 16
          Top = 40
          Width = 793
          Height = 21
          Color = clMoneyGreen
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
          ReadOnly = True
          TabOrder = 0
        end
        object dbTipoDespesa: TDBLookupComboBox
          Left = 16
          Top = 160
          Width = 281
          Height = 21
          DataField = 'TIPO_DESPESA'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'COD'
          ListField = 'TIPODESP'
          ListSource = dtsTpDespesa
          ParentFont = False
          TabOrder = 7
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    m.Ano'
      '  , m.Numero'
      '  , m.Caixa_ano'
      '  , m.Caixa_num'
      '  , m.Conta_corrente'
      '  , m.Forma_pagto'
      '  , m.Datahora'
      '  , m.Tipo'
      '  , m.Tipo_despesa'
      '  , m.Historico'
      '  , m.Valor'
      '  , m.Situacao'
      '  , m.Venda_ano'
      '  , m.Venda_num'
      '  , m.Cliente'
      '  , m.Cliente_cod'
      '  , m.Compra_ano'
      '  , m.Compra_num'
      '  , m.Empresa'
      '  , m.Fornecedor'
      '  , m.Usuario'
      '  , fp.Descri as Forma_pagto_Desc'
      '  , c.Nome as nome_clente'
      '  , f.Nomeforn as nome_fornecedor'
      
        '  , Case when upper(m.Tipo) = '#39'C'#39' then m.Valor else 0 end as Val' +
        'or_Credito'
      
        '  , Case when upper(m.Tipo) = '#39'D'#39' then m.Valor else 0 end as Val' +
        'or_Debito'
      '  , cast(m.Datahora as Date) as Data'
      '  , cast(m.Datahora as Time) as Hora'
      
        '  , m.Venda_ano    || '#39'/'#39' || right('#39'00000'#39' || m.Venda_num,    7)' +
        ' as Venda'
      
        '  , m.Areceber_ano || '#39'/'#39' || right('#39'00000'#39' || m.Areceber_num, 7)' +
        ' as Titulo'
      
        '  , m.Compra_ano   || '#39'/'#39' || right('#39'00000'#39' || m.Compra_num,   7)' +
        ' as Compra'
      
        '  , m.Apagar_ano   || '#39'/'#39' || right('#39'00000'#39' || m.Apagar_num,   7)' +
        ' as Duplicata'
      '  , cm.Situacao as situacao_CAIXA'
      '  , cm.Data_fech'
      '  , cm.Data_cancel'
      'from TBCAIXA_MOVIMENTO m'
      '  left join TBCLIENTE c on (c.Codigo = m.Cliente_cod)'
      '  left join TBFORNECEDOR f on (f.Codforn = m.Fornecedor)'
      '  left join TBFORMPAGTO fp on (fp.Cod = m.Forma_pagto)'
      
        '  left join TBCAIXA cm on (cm.Ano = m.Caixa_ano and cm.Numero = ' +
        'm.Caixa_num)')
    ModifySQL.Strings = ()
    Left = 864
    object IbDtstTabelaANO: TSmallintField
      FieldName = 'ANO'
      Origin = 'TBCAIXA_MOVIMENTO.ANO'
    end
    object IbDtstTabelaNUMERO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'NUMERO'
      Origin = 'TBCAIXA_MOVIMENTO.NUMERO'
    end
    object IbDtstTabelaCAIXA_ANO: TSmallintField
      Alignment = taCenter
      FieldName = 'CAIXA_ANO'
      Origin = 'TBCAIXA_MOVIMENTO.CAIXA_ANO'
    end
    object IbDtstTabelaCAIXA_NUM: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Caixa'
      FieldName = 'CAIXA_NUM'
      Origin = 'TBCAIXA_MOVIMENTO.CAIXA_NUM'
      DisplayFormat = '00000'
    end
    object IbDtstTabelaCONTA_CORRENTE: TIntegerField
      DisplayLabel = 'Conta Corrente'
      FieldName = 'CONTA_CORRENTE'
      Origin = 'TBCAIXA_MOVIMENTO.CONTA_CORRENTE'
      Required = True
    end
    object IbDtstTabelaFORMA_PAGTO: TSmallintField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO'
      Origin = 'TBCAIXA_MOVIMENTO.FORMA_PAGTO'
      Required = True
    end
    object IbDtstTabelaDATAHORA: TDateTimeField
      DisplayLabel = 'Data'
      FieldName = 'DATAHORA'
      Origin = 'TBCAIXA_MOVIMENTO.DATAHORA'
      Required = True
    end
    object IbDtstTabelaTIPO: TIBStringField
      Alignment = taCenter
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Origin = 'TBCAIXA_MOVIMENTO.TIPO'
      Required = True
      Size = 1
    end
    object IbDtstTabelaTIPO_DESPESA: TSmallintField
      DisplayLabel = 'Tipo Despesa'
      FieldName = 'TIPO_DESPESA'
      Origin = '"TBCAIXA_MOVIMENTO"."TIPO_DESPESA"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaEMPRESA: TIBStringField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
      Origin = 'TBCAIXA_MOVIMENTO.EMPRESA'
      Required = True
      Size = 18
    end
    object IbDtstTabelaCLIENTE: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      Origin = 'TBCAIXA_MOVIMENTO.CLIENTE'
      Size = 18
    end
    object IbDtstTabelaCLIENTE_COD: TIntegerField
      FieldName = 'CLIENTE_COD'
      Origin = '"TBCAIXA_MOVIMENTO"."CLIENTE_COD"'
      ProviderFlags = [pfInUpdate]
    end
    object IbDtstTabelaFORNECEDOR: TIntegerField
      DisplayLabel = 'Fornecedor'
      FieldName = 'FORNECEDOR'
      Origin = 'TBCAIXA_MOVIMENTO.FORNECEDOR'
    end
    object IbDtstTabelaHISTORICO: TIBStringField
      DisplayLabel = 'Hist'#243'rico'
      FieldName = 'HISTORICO'
      Origin = 'TBCAIXA_MOVIMENTO.HISTORICO'
      Required = True
      Size = 250
    end
    object IbDtstTabelaVALOR: TIBBCDField
      DisplayLabel = 'Valor (R$)'
      FieldName = 'VALOR'
      Origin = 'TBCAIXA_MOVIMENTO.VALOR'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaSITUACAO: TSmallintField
      Alignment = taLeftJustify
      DisplayLabel = 'Situa'#231#227'o'
      FieldName = 'SITUACAO'
      Origin = 'TBCAIXA_MOVIMENTO.SITUACAO'
      OnGetText = IbDtstTabelaSITUACAOGetText
    end
    object IbDtstTabelaVENDA_ANO: TSmallintField
      FieldName = 'VENDA_ANO'
      Origin = 'TBCAIXA_MOVIMENTO.VENDA_ANO'
    end
    object IbDtstTabelaVENDA_NUM: TIntegerField
      FieldName = 'VENDA_NUM'
      Origin = 'TBCAIXA_MOVIMENTO.VENDA_NUM'
    end
    object IbDtstTabelaCOMPRA_ANO: TSmallintField
      FieldName = 'COMPRA_ANO'
      Origin = 'TBCAIXA_MOVIMENTO.COMPRA_ANO'
    end
    object IbDtstTabelaCOMPRA_NUM: TIntegerField
      FieldName = 'COMPRA_NUM'
      Origin = 'TBCAIXA_MOVIMENTO.COMPRA_NUM'
    end
    object IbDtstTabelaUSUARIO: TIBStringField
      FieldName = 'USUARIO'
      Origin = 'TBCAIXA_MOVIMENTO.USUARIO'
      Required = True
      Size = 12
    end
    object IbDtstTabelaFORMA_PAGTO_DESC: TIBStringField
      DisplayLabel = 'Forma de Pagamento'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'TBFORMPAGTO.DESCRI'
      Size = 30
    end
    object IbDtstTabelaNOME_CLENTE: TIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'NOME_CLENTE'
      Origin = 'TBCLIENTE.NOME'
      Size = 60
    end
    object IbDtstTabelaNOME_FORNECEDOR: TIBStringField
      DisplayLabel = 'Fornecedor'
      FieldName = 'NOME_FORNECEDOR'
      Origin = 'TBFORNECEDOR.NOMEFORN'
      Size = 60
    end
    object IbDtstTabelaVALOR_CREDITO: TIBBCDField
      DisplayLabel = 'Cr'#233'dito (R$)'
      FieldName = 'VALOR_CREDITO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaVALOR_DEBITO: TIBBCDField
      DisplayLabel = 'D'#233'bito (R$)'
      FieldName = 'VALOR_DEBITO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object IbDtstTabelaDATA: TDateField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object IbDtstTabelaHORA: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'HORA'
      DisplayFormat = 'hh:mm'
    end
    object IbDtstTabelaVENDA: TIBStringField
      DisplayLabel = 'Venda'
      FieldName = 'VENDA'
      Size = 23
    end
    object IbDtstTabelaTITULO: TIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 23
    end
    object IbDtstTabelaCOMPRA: TIBStringField
      DisplayLabel = 'Compra'
      FieldName = 'COMPRA'
      Size = 23
    end
    object IbDtstTabelaDUPLICATA: TIBStringField
      DisplayLabel = 'Duplicata'
      FieldName = 'DUPLICATA'
      Size = 23
    end
    object IbDtstTabelaSITUACAO_CAIXA: TSmallintField
      FieldName = 'SITUACAO_CAIXA'
      Origin = 'TBCAIXA.SITUACAO'
    end
    object IbDtstTabelaDATA_FECH: TDateField
      FieldName = 'DATA_FECH'
      Origin = 'TBCAIXA.DATA_FECH'
    end
    object IbDtstTabelaDATA_CANCEL: TDateField
      FieldName = 'DATA_CANCEL'
      Origin = 'TBCAIXA.DATA_CANCEL'
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 928
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ANO,'
      '  NUMERO,'
      '  CAIXA_ANO,'
      '  CAIXA_NUM,'
      '  CONTA_CORRENTE,'
      '  FORMA_PAGTO,'
      '  DATAHORA,'
      '  TIPO,'
      '  TIPO_DESPESA,'
      '  HISTORICO,'
      '  VALOR,'
      '  SITUACAO,'
      '  VENDA_ANO,'
      '  VENDA_NUM,'
      '  CLIENTE_COD,'
      '  CLIENTE,'
      '  COMPRA_ANO,'
      '  COMPRA_NUM,'
      '  EMPRESA,'
      '  FORNECEDOR,'
      '  USUARIO,'
      '  APAGAR_ANO,'
      '  APAGAR_NUM,'
      '  ARECEBER_ANO,'
      '  ARECEBER_NUM'
      'from TBCAIXA_MOVIMENTO '
      'where'
      '  ANO = :ANO and'
      '  NUMERO = :NUMERO')
    ModifySQL.Strings = (
      'update TBCAIXA_MOVIMENTO'
      'set'
      '  ANO = :ANO,'
      '  CAIXA_ANO = :CAIXA_ANO,'
      '  CAIXA_NUM = :CAIXA_NUM,'
      '  CLIENTE = :CLIENTE,'
      '  CLIENTE_COD = :CLIENTE_COD,'
      '  COMPRA_ANO = :COMPRA_ANO,'
      '  COMPRA_NUM = :COMPRA_NUM,'
      '  CONTA_CORRENTE = :CONTA_CORRENTE,'
      '  DATAHORA = :DATAHORA,'
      '  EMPRESA = :EMPRESA,'
      '  FORMA_PAGTO = :FORMA_PAGTO,'
      '  FORNECEDOR = :FORNECEDOR,'
      '  HISTORICO = :HISTORICO,'
      '  NUMERO = :NUMERO,'
      '  SITUACAO = :SITUACAO,'
      '  TIPO = :TIPO,'
      '  TIPO_DESPESA = :TIPO_DESPESA,'
      '  USUARIO = :USUARIO,'
      '  VALOR = :VALOR,'
      '  VENDA_ANO = :VENDA_ANO,'
      '  VENDA_NUM = :VENDA_NUM'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO')
    InsertSQL.Strings = (
      'insert into TBCAIXA_MOVIMENTO'
      
        '  (ANO, CAIXA_ANO, CAIXA_NUM, CLIENTE, CLIENTE_COD, COMPRA_ANO, ' +
        'COMPRA_NUM, '
      
        '   CONTA_CORRENTE, DATAHORA, EMPRESA, FORMA_PAGTO, FORNECEDOR, H' +
        'ISTORICO, '
      
        '   NUMERO, SITUACAO, TIPO, TIPO_DESPESA, USUARIO, VALOR, VENDA_A' +
        'NO, VENDA_NUM)'
      'values'
      
        '  (:ANO, :CAIXA_ANO, :CAIXA_NUM, :CLIENTE, :CLIENTE_COD, :COMPRA' +
        '_ANO, :COMPRA_NUM, '
      
        '   :CONTA_CORRENTE, :DATAHORA, :EMPRESA, :FORMA_PAGTO, :FORNECED' +
        'OR, :HISTORICO, '
      
        '   :NUMERO, :SITUACAO, :TIPO, :TIPO_DESPESA, :USUARIO, :VALOR, :' +
        'VENDA_ANO, '
      '   :VENDA_NUM)')
    DeleteSQL.Strings = (
      'delete from TBCAIXA_MOVIMENTO'
      'where'
      '  ANO = :OLD_ANO and'
      '  NUMERO = :OLD_NUMERO')
    Left = 896
  end
  inherited ImgList: TImageList
    Left = 832
  end
  object tblContaCorrente: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'CODIGO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIPO'
        DataType = ftSmallint
      end
      item
        Name = 'TIPO_DESC'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'DESCRICAO_FULL'
        Attributes = [faReadonly]
        DataType = ftString
        Size = 67
      end>
    StoreDefs = True
    TableName = 'VW_CONTA_CORRENTE'
    TableTypes = [ttView]
    Left = 1064
    Top = 312
  end
  object dtsContaCorrente: TDataSource
    DataSet = tblContaCorrente
    Left = 1096
    Top = 312
  end
  object tblFormaPagto: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBFORMPAGTO'
    Left = 1064
    Top = 280
  end
  object dtsFormaPagto: TDataSource
    DataSet = tblFormaPagto
    Left = 1096
    Top = 280
  end
  object qrySaldosDias: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    s.Saldo_anterior_data'
      '  , s.Saldo_anterior_valor'
      '  , s.Saldo_inicial_data'
      '  , s.Saldo_inicial_valor'
      '  , s.Saldo_final_data'
      '  , s.Saldo_final_valor'
      
        'from GET_CONTA_CORRENTE_SALDO(:Conta, :DataInicial, :DataFinal) ' +
        's')
    Left = 1000
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Conta'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'DataInicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'DataFinal'
        ParamType = ptInput
        Value = 0d
      end>
    object qrySaldosDiasSALDO_ANTERIOR_DATA: TDateField
      Alignment = taCenter
      FieldName = 'SALDO_ANTERIOR_DATA'
      Origin = 'GET_CONTA_CORRENTE_SALDO.SALDO_ANTERIOR_DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrySaldosDiasSALDO_ANTERIOR_VALOR: TIBBCDField
      FieldName = 'SALDO_ANTERIOR_VALOR'
      Origin = 'GET_CONTA_CORRENTE_SALDO.SALDO_ANTERIOR_VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qrySaldosDiasSALDO_INICIAL_DATA: TDateField
      Alignment = taCenter
      FieldName = 'SALDO_INICIAL_DATA'
      Origin = 'GET_CONTA_CORRENTE_SALDO.SALDO_INICIAL_DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrySaldosDiasSALDO_INICIAL_VALOR: TIBBCDField
      FieldName = 'SALDO_INICIAL_VALOR'
      Origin = 'GET_CONTA_CORRENTE_SALDO.SALDO_INICIAL_VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qrySaldosDiasSALDO_FINAL_DATA: TDateField
      Alignment = taCenter
      FieldName = 'SALDO_FINAL_DATA'
      Origin = 'GET_CONTA_CORRENTE_SALDO.SALDO_FINAL_DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qrySaldosDiasSALDO_FINAL_VALOR: TIBBCDField
      FieldName = 'SALDO_FINAL_VALOR'
      Origin = 'GET_CONTA_CORRENTE_SALDO.SALDO_FINAL_VALOR'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
  end
  object dtsSaldosDias: TDataSource
    DataSet = qrySaldosDias
    Left = 1032
    Top = 281
  end
  object tblTipoMovimento: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    FieldDefs = <
      item
        Name = 'TIPO'
        Attributes = [faReadonly, faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'TIPO_DESC'
        Attributes = [faReadonly, faFixed]
        DataType = ftString
        Size = 7
      end>
    ReadOnly = True
    StoreDefs = True
    TableName = 'VW_TIPO_MOVIMENTO_CAIXA'
    TableTypes = [ttView]
    Left = 1064
    Top = 344
  end
  object dtsTipoMovimento: TDataSource
    DataSet = tblTipoMovimento
    Left = 1096
    Top = 344
  end
  object qryConsolidadoFormaPagto: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    OnCalcFields = qryConsolidadoFormaPagtoCalcFields
    SQL.Strings = (
      'Select'
      '    f.Data'
      '  , f.Forma_pagto'
      '  , f.Forma_pagto_desc'
      '  , Case when f.Forma_pagto = 0 then f.Saldo else 0 end as Saldo'
      '  , sum(f.Entrada) as Entrada'
      '  , sum(f.Saida) as Saida'
      
        'from GET_FLUXO_CAIXA(:Conta_Corrente, :Data_Inicial, :Data_Final' +
        ') f'
      'group by 1, 2, 3, 4')
    Left = 1000
    Top = 313
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta_Corrente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Final'
        ParamType = ptUnknown
      end>
    object qryConsolidadoFormaPagtoDATA: TDateField
      Alignment = taCenter
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Origin = 'GET_FLUXO_CAIXA.DATA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryConsolidadoFormaPagtoFORMA_PAGTO: TIntegerField
      FieldName = 'FORMA_PAGTO'
      Origin = 'GET_FLUXO_CAIXA.FORMA_PAGTO'
    end
    object qryConsolidadoFormaPagtoFORMA_PAGTO_DESC: TIBStringField
      DisplayLabel = 'Descricao'
      FieldName = 'FORMA_PAGTO_DESC'
      Origin = 'GET_FLUXO_CAIXA.FORMA_PAGTO_DESC'
      Size = 50
    end
    object qryConsolidadoFormaPagtoSALDO: TIBBCDField
      DisplayLabel = 'Saldo'
      FieldName = 'SALDO'
      DisplayFormat = ',0.00'
      Precision = 18
      Size = 2
    end
    object qryConsolidadoFormaPagtoENTRADA: TIBBCDField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADA'
      DisplayFormat = '"+ ",0.00'
      Precision = 18
      Size = 2
    end
    object qryConsolidadoFormaPagtoSAIDA: TIBBCDField
      DisplayLabel = 'Sa'#237'das'
      FieldName = 'SAIDA'
      DisplayFormat = '"- ",0.00'
      Precision = 18
      Size = 2
    end
    object qryConsolidadoFormaPagtoSaldoDisplay: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'SaldoDisplay'
      Calculated = True
    end
  end
  object dtsConsolidadoFormaPagto: TDataSource
    DataSet = qryConsolidadoFormaPagto
    Left = 1032
    Top = 313
  end
  object qryFluxoSintetico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    f.Data'
      '  , f.Conta_corrente'
      '  , f.Conta_corrente_desc'
      '  , f.Forma_pagto'
      '  , f.Forma_pagto_desc'
      '  , Case when f.Forma_pagto = 0 then f.Saldo else 0 end as Saldo'
      '  , sum(f.Entrada) as Entrada'
      '  , sum(f.Saida) as Saida'
      
        'from GET_FLUXO_CAIXA(:Conta_Corrente, :Data_Inicial, :Data_Final' +
        ') f'
      'group by 1, 2, 3, 4, 5, 6')
    Left = 1064
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Conta_Corrente'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'Data_Inicial'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDateTime
        Name = 'Data_Final'
        ParamType = ptInput
        Value = 0d
      end>
  end
  object frdFluxoSintetico: TfrxDBDataset
    UserName = 'frdFluxoSintetico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'CONTA_CORRENTE=CONTA_CORRENTE'
      'CONTA_CORRENTE_DESC=CONTA_CORRENTE_DESC'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'SALDO=SALDO'
      'ENTRADA=ENTRADA'
      'SAIDA=SAIDA')
    DataSet = qryFluxoSintetico
    BCDToCurrency = False
    Left = 1096
    Top = 408
  end
  object frdFluxoAnalitico: TfrxDBDataset
    UserName = 'frdFluxoAnalitico'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATA=DATA'
      'CONTA_CORRENTE=CONTA_CORRENTE'
      'CONTA_CORRENTE_DESC=CONTA_CORRENTE_DESC'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'HISTORICO=HISTORICO'
      'TIPO=TIPO'
      'ENTRADA=ENTRADA'
      'SAIDA=SAIDA'
      'SALDO=SALDO'
      'CAIXA_ANO=CAIXA_ANO'
      'CAIXA_NUM=CAIXA_NUM'
      'CAIXA=CAIXA')
    DataSet = qryFluxoAnalitico
    BCDToCurrency = False
    Left = 1096
    Top = 440
  end
  object qryFluxoAnalitico: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    f.Data'
      '  , f.Conta_corrente'
      '  , f.Conta_corrente_desc'
      '  , f.Forma_pagto'
      '  , f.Forma_pagto_desc'
      '  , f.Historico'
      '  , f.Tipo'
      '  , f.Entrada'
      '  , f.Saida'
      '  , f.Saldo'
      '  , f.Caixa_ano'
      '  , f.Caixa_num'
      
        '  , f.Caixa_ano || '#39'/'#39' || right('#39'00000'#39' || f.Caixa_num, 5) as Ca' +
        'ixa'
      
        'from GET_FLUXO_CAIXA(:Conta_Corrente, :Data_Inicial, :Data_Final' +
        ') f')
    Left = 1064
    Top = 440
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta_Corrente'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Inicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'Data_Final'
        ParamType = ptUnknown
      end>
  end
  object frrFluxoAnalitico: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40928.407150601900000000
    ReportOptions.LastChange = 41039.011192847200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    OnGetValue = frrFluxoAnaliticoGetValue
    Left = 1032
    Top = 440
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = frdFluxoAnalitico
        DataSetName = 'frdFluxoAnalitico'
      end
      item
        DataSet = frdFluxoSaldos
        DataSetName = 'frdFluxoSaldos'
      end
      item
        DataSet = frdFluxoSintetico
        DataSetName = 'frdFluxoSintetico'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Periodo_Desc'
        Value = #39'P e r '#237' o d o'#39
      end
      item
        Name = 'Periodo'
        Value = #39'01/04/2012 '#224' 29/04/2012'#39
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
          Width = 491.338900000000000000
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
          Width = 491.338900000000000000
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
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Periodo]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo3: TfrxMemoView
          Left = 491.338900000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[Periodo_Desc]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 491.338900000000000000
          Top = 37.795300000000000000
          Width = 226.771800000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Top = 37.795300000000000000
          Width = 491.338900000000000000
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
        object Memo50: TfrxMemoView
          Top = 56.692950000000000000
          Width = 718.110700000000000000
          Height = 26.456710000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'EXTRATO DE CONTA CORRENTE')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterData: TfrxMasterData
        Height = 18.897650000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        DataSet = frdFluxoSintetico
        DataSetName = 'frdFluxoSintetico'
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
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line].')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdItensDESCRI: TfrxMemoView
          Left = 94.488250000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdFluxoSintetico."FORMA_PAGTO_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 566.929500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<frdFluxoSintetico."FORMA_PAGTO">>0,'#39'+ '#39'+FormatFloat('#39',0.00' +
              #39',<frdFluxoSintetico."ENTRADA">),'#39#39')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<frdFluxoSintetico."FORMA_PAGTO">>0,'#39'- '#39'+FormatFloat('#39',0.00' +
              #39',<frdFluxoSintetico."SAIDA">),'#39#39')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo2: TfrxMemoView
          Left = 26.456710000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[IIF(<frdFluxoSintetico."DATA">=0,'#39#39',FormatDateTime('#39'dd/mm/yyyy'#39 +
              ',<frdFluxoSintetico."DATA">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 491.338900000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = []
          Highlight.Condition = '<frdFluxoSintetico."SALDO"><0'
          Memo.UTF8 = (
            
              '[IIF(<frdFluxoSintetico."FORMA_PAGTO">=0,IIF(<frdFluxoSintetico.' +
              '"SALDO">>=0,'#39#39','#39'- '#39')+FormatFloat('#39',0.00'#39',<frdFluxoSintetico."SAL' +
              'DO">),'#39#39')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndPageFooter: TfrxPageFooter
        Height = 22.677180000000000000
        Top = 778.583180000000000000
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
        Height = 287.244280000000000000
        Top = 468.661720000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Left = 491.338900000000000000
          Top = 3.779530000000000000
          Width = 226.771800000000000000
          Height = 109.606370000000000000
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
        object Memo40: TfrxMemoView
          Top = 136.063080000000000000
          Width = 718.110700000000000000
          Height = 45.354360000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Top = 120.944960000000000000
          Width = 718.110700000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Observa'#195#167#195#163'o:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 491.338900000000000000
          Top = 253.228510000000000000
          Width = 222.992270000000000000
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
          Left = 495.118430000000000000
          Top = 49.133890000000000000
          Width = 117.165430000000000000
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
          Left = 495.118430000000000000
          Top = 68.031540000000000000
          Width = 117.165430000000000000
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
          Left = 495.118430000000000000
          Top = 90.708720000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' (=) Saldo:')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo1: TfrxSysMemoView
          Left = 612.283860000000000000
          Top = 49.133890000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdFluxoAnalitico."ENTRADA">,bndMaster' +
              'DataMov,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 612.283860000000000000
          Top = 68.031540000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8 = (
            
              '[FormatFloat('#39',0.00'#39',SUM(<frdFluxoAnalitico."SAIDA">,bndMasterDa' +
              'taMov,2))] ')
          ParentFont = False
          VAlign = vaCenter
          WordWrap = False
        end
        object Memo36: TfrxMemoView
          Left = 495.118430000000000000
          Top = 30.236240000000000000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            ' (.) Saldo Anterior:')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Left = 612.283860000000000000
          Top = 30.236240000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdFluxoAnalitico."SALDO"><0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdFluxoSaldos."SALDO_ANTERIOR_VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 612.283860000000000000
          Top = 90.708720000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdFluxoAnalitico."SALDO"><0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdFluxoSaldos."SALDO_FINAL_VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndGrpHeaderCaixa: TfrxGroupHeader
        Height = 56.692950000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        Condition = 'frdFluxoSintetico."CONTA_CORRENTE"'
        ReprintOnNewPage = True
        StartNewPage = True
        object Memo12: TfrxMemoView
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Conta Corrente:')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Top = 18.897650000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdFluxoSintetico."CONTA_CORRENTE_DESC"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Top = 37.795300000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Left = 94.488250000000000000
          Top = 37.795300000000000000
          Width = 396.850474250000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' D e s c r i '#195#167' '#195#163' o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Left = 566.929500000000000000
          Top = 37.795300000000000000
          Width = 75.590563390000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'C r '#195#169' d i t o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 642.520100000000000000
          Top = 37.795300000000000000
          Width = 75.590563390000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'D '#195#169' b i t o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 26.456710000000000000
          Top = 37.795300000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'D a t a')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo4: TfrxMemoView
          Left = 491.338900000000000000
          Top = 37.795300000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'S a l d o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndHeaderMov: TfrxHeader
        Height = 37.795300000000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        ReprintOnNewPage = True
        object Memo19: TfrxMemoView
          Top = 18.897650000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '#')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Left = 94.488250000000000000
          Top = 18.897650000000000000
          Width = 396.850474250000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' H i s t '#195#179' r i c o')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Left = 491.338900000000000000
          Top = 18.897650000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'C r '#195#169' d i t o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Left = 566.929500000000000000
          Top = 18.897650000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'D '#195#169' b i t o  ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Left = 26.456710000000000000
          Top = 18.897650000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            'D a t a')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Left = 642.520100000000000000
          Top = 18.897650000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 14211288
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'S a l d o ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndMasterDataMov: TfrxMasterData
        Height = 18.897650000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        DataSet = frdFluxoAnalitico
        DataSetName = 'frdFluxoAnalitico'
        RowCount = 0
        object Memo28: TfrxMemoView
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[Line].')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Left = 26.456710000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8 = (
            '[FormatDateTime('#39'dd/mm/yyyy'#39',<frdFluxoAnalitico."DATA">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Left = 94.488250000000000000
          Width = 396.850650000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [frdFluxoAnalitico."HISTORICO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Left = 491.338900000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<frdFluxoAnalitico."TIPO">='#39'C'#39',FormatFloat('#39',0.00'#39',<frdFlux' +
              'oAnalitico."ENTRADA">),'#39#39')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 566.929500000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              '[IIF(<frdFluxoAnalitico."TIPO">='#39'D'#39',FormatFloat('#39',0.00'#39',<frdFlux' +
              'oAnalitico."SAIDA">),'#39#39')] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdFluxoAnalitico."SALDO"><0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdFluxoAnalitico."SALDO">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object bndGrpFooterCaixaSaldo: TfrxGroupFooter
        Height = 18.897650000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo34: TfrxMemoView
          Left = 642.520100000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clRed
          Highlight.Font.Height = -9
          Highlight.Font.Name = 'Lucida Console'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<frdFluxoSaldos."SALDO_FINAL_VALOR"><0'
          Memo.UTF8 = (
            '[FormatFloat('#39',0.00'#39',<frdFluxoSaldos."SALDO_FINAL_VALOR">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Left = 491.338900000000000000
          Width = 151.181163390000000000
          Height = 18.897650000000000000
          ShowHint = False
          Color = 15000804
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            
              'Saldo dia [FormatDateTime('#39'dd/mm/yyyy'#39',<frdFluxoSaldos."SALDO_FI' +
              'NAL_DATA">)] ')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
    end
  end
  object qryFluxoSaldos: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    s.Saldo_anterior_data'
      '  , s.Saldo_anterior_valor'
      '  , s.Saldo_inicial_data'
      '  , s.Saldo_inicial_valor'
      '  , s.Saldo_final_data'
      '  , s.Saldo_final_valor'
      
        'from GET_CONTA_CORRENTE_SALDO(:Conta, :DataInicial, :DataFinal) ' +
        's')
    Left = 1064
    Top = 376
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Conta'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataInicial'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DataFinal'
        ParamType = ptUnknown
      end>
  end
  object frdFluxoSaldos: TfrxDBDataset
    UserName = 'frdFluxoSaldos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'SALDO_ANTERIOR_DATA=SALDO_ANTERIOR_DATA'
      'SALDO_ANTERIOR_VALOR=SALDO_ANTERIOR_VALOR'
      'SALDO_INICIAL_DATA=SALDO_INICIAL_DATA'
      'SALDO_INICIAL_VALOR=SALDO_INICIAL_VALOR'
      'SALDO_FINAL_DATA=SALDO_FINAL_DATA'
      'SALDO_FINAL_VALOR=SALDO_FINAL_VALOR')
    DataSet = qryFluxoSaldos
    BCDToCurrency = False
    Left = 1096
    Top = 376
  end
  object tblEmpresa: TIBTable
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    TableName = 'TBEMPRESA'
    Left = 824
    Top = 280
  end
  object dtsEmpresa: TDataSource
    DataSet = tblEmpresa
    Left = 856
    Top = 280
  end
  object qryTpDespesa: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'select * from TBTPDESPESA'
      'order by tipodesp')
    Left = 824
    Top = 312
  end
  object dtsTpDespesa: TDataSource
    DataSet = qryTpDespesa
    Left = 856
    Top = 312
  end
  object ppImprimir: TPopupMenu
    Left = 224
    Top = 448
    object nmImprimirExtrato: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        180000000000000300000000000000000000000000000000000000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0080685020
        304020304020304020304020304020304020304020304020304000FF00608090
        506070405060304050203040907060F0E0D0B0A090B0A090B0A090B0A090B0A0
        90B0A090B0A09020304070809020B8F00090D00090D00090D00090D0907860F0
        E8E0F0D8D0E0D0C0E0C8C0D0C0B0D0B8B0D0B8B0B0A09020304070889070C8F0
        10B8F010B0F000A8E00098D0A08070F0F0F0C0B0A0C0B0A0C0A8A0B0A090D0C0
        B0B0A090B0A09020304080889070D0F030C0F010B8F000A8F000A0E0A08880FF
        F8FFF0F0F0F0E8E0F0D8D0E0D0C07058506050405048404040408090A080D8F0
        40C8F030C0F010B8F000A0E0B09080FFFFFFC0B0A0C0B0A0C0A8A0F0E0D08060
        50D0C8C060504000FF008098A090E0F060D8F050C8F030C0F010B0F0B09890FF
        FFFFFFFFFFFFF8FFF0F0F0F0E8E080685080605000FF0000FF008098A0A0E8F0
        80E0F070D8F050D0F010B0F0B0A090B09890B09080A08880A080709078609070
        6000FF0000FF0000FF0090A0A0B0F0FFA0E8FF90E0F070D0F010A0D010A0D010
        A0D01098D00090D00090D00090D030384000FF0000FF0000FF0090A0B0B0F0FF
        A0F0FF6080906070805070805068705068705060704058702070900090D04048
        6000FF0000FF0000FF0090A8B0B0F0FFB0F0FF60889090C8D090E8F080D8E060
        C8E05098B04058602080A00090D050587000FF0000FF0000FF0090A8B0B0F0F0
        B0F0FFA0F0F07098A0A0F0F06D7F8580C8D050708030608060C0F020B8F05060
        7000FF0000FF0000FF0000FF0090A8B090A8B090A8B06090A0A0E8F0A0E8F090
        D8E040687070889080889070889000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0080B0C080B0C080A0B000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00}
      Caption = '&Extrato'
      OnClick = nmImprimirExtratoClick
    end
    object nmImprimirRecibo: TMenuItem
      Tag = 15
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFC0A09060483060483060483060483060483060483060
        4830604830604830604830604830FFFFFFFFFFFFFFFFFFFFFFFFC0A890FFF8F0
        FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0E0B090E0A890604830FFFF
        FFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0C0A8A0B0A0A0F0E8E0B0A090B09890B0
        9890B09890B09890E0B090604830FFFFFFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0
        FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0E0C0A0E0B8A0604830FFFF
        FFFFFFFFFFFFFFFFFFFFC0A8A0FFFFF0B0A8A0B0A0A0FFF8F0B0A090B09890B0
        9890B09890B09890E0C0A0604830FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0
        FFFFF0FFFFF0FFFFF0FFF8F0FFF0E0F0E8E0F0E0D0F0D0C0F0C8B0604830FFFF
        FFFFFFFFFFFFFFFFFFFFC0B0A0FFFFF0FFFFF0FFFFF0FFFFF0FFFFF0FFF8F0C0
        C8C0406070F0E0D0F0D0C0604830FFFFFFFFFFFFFFFFFFFFFFFFC0B0A0FFFFFF
        E0E8F0607880E0E0E0FFFFF0C0C8D050607030A8D0203840B0A0A0604830FFFF
        FFFFFFFFA0B39A408050D0B0A0FFFFFF90A8B080D0E0506070B0B8C050607060
        C0E050607030B8F010283010304010283070747D40784050A860D0B8A0FFFFFF
        E0E8F090A8B080E0F050607080D0E050607060D0F040607030B0E02098D02088
        B020507050886050B060D0B8A0D0B8A0D0B8A0C0B0A090A8B080E0F050607080
        E0F040587060D0F050C8F040C0F020B0E020A0D060987050B870FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF90A8B080E0F040587080E0F070D8F060D0F050C8F040C0
        F030B8F070A88060C080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B080
        E0F080E0F080E0F070D8F060D0F060B0D0808890B0C0A090D0A0FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF90A8B090A0B090A0A08098A08090A08088
        90B9B9BDA0B8A0B0C0A0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = '&Recibo'
      OnClick = nmImprimirReciboClick
    end
  end
  object FrRecibo: TfrxReport
    Version = '4.9.72'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PreviewOptions.ZoomMode = zmPageWidth
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41557.397184305600000000
    ReportOptions.Name = 'Visualizar Recibo (Contas A Pagar)'
    ReportOptions.LastChange = 41787.989329155090000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = FrReciboGetValue
    Left = 256
    Top = 448
    Datasets = <
      item
        DataSet = DMNFe.frdEmpresa
        DataSetName = 'frdEmpresa'
      end
      item
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
      end>
    Variables = <
      item
        Name = ' Local'
        Value = Null
      end
      item
        Name = 'Titulo'
        Value = #39'RECIBO'#39
      end
      item
        Name = 'Sistema'
        Value = #39'Sistema'#39
      end
      item
        Name = 'Usuario'
        Value = #39'Usu'#225'rio'#39
      end
      item
        Name = 'Cidade'
        Value = 
          'Copy(Trim(Uppercase(<frdEmpresa."CID_NOME">)), 1, 1) + Copy(Trim' +
          '(Lowercase(<frdEmpresa."CID_NOME">)), 2, 50)'
      end
      item
        Name = 'UF'
        Value = 'Trim(Uppercase(<frdEmpresa."EST_SIGLA">))'
      end>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 210.000000000000000000
      PaperHeight = 148.000000000000000000
      PaperSize = 11
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object BndPageHeader: TfrxPageHeader
        Height = 94.488250000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 109.606370000000000000
          Height = 79.370130000000000000
          ShowHint = False
          DataField = 'LOGO'
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object frdEmpresaRZSOC: TfrxMemoView
          Left = 113.385900000000000000
          Top = 7.559060000000000000
          Width = 457.323130000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Lucida Console'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frdEmpresa."RZSOC"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object frdEmpresaNMFANT: TfrxMemoView
          Left = 113.385900000000000000
          Top = 26.456710000000000000
          Width = 457.323130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            
              'CNPJ.: [FormatMaskText('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ' +
              '">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object frdFone: TfrxMemoView
          Left = 113.385900000000000000
          Top = 41.574830000000000000
          Width = 457.323130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            'FONE: [FormatMaskText('#39'(##)####.####;0;'#39',<frdEmpresa."FONE">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 113.385900000000000000
          Top = 56.692950000000000000
          Width = 457.323130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
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
          Top = 94.488250000000000000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo44: TfrxMemoView
          Left = 113.385900000000000000
          Top = 71.811070000000000000
          Width = 457.323130000000000000
          Height = 15.118120000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Memo.UTF8 = (
            '[frdEmpresa."HOME_PAGE"] / [frdEmpresa."EMAIL"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo1: TfrxMemoView
          Left = 570.709030000000000000
          Top = 7.559060000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'Documento Baixa ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 570.709030000000000000
          Top = 26.456710000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdCliente
          DataSetName = 'frdCliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            '[FrdRecibo."NUMERO_RECIBO"]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndPageFooter: TfrxPageFooter
        Height = 30.236240000000000000
        Top = 525.354670000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' [Sistema]')
          ParentFont = False
          WordWrap = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Top = 15.118120000000000000
          Width = 582.047620000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Lucida Console'
          Font.Style = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            ' Impresso em [Date] '#195#160's [Time] por [Usuario]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 582.047620000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8 = (
            'P'#195#161'gina [Page#] / [TotalPages#]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
      end
      object BndMasterData: TfrxMasterData
        Height = 162.519790000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        Child = FrRecibo.BndChildAssinatura
        DataSet = FrdRecibo
        DataSetName = 'FrdRecibo'
        RowCount = 0
        Stretched = True
        object Rich1: TfrxRichView
          Top = 102.047310000000000000
          Width = 718.110700000000000000
          Height = 60.472480000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C66636861
            7273657430205461686F6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D
            7366746564697420352E34312E32312E323531303B7D5C766965776B696E6434
            5C7563315C706172645C6669313030305C6C693134305C72693138305C736231
            32305C73613132305C736C3336305C736C6D756C74315C716A5C66305C667332
            30205265636562656D6F73205B494946283C46726452656369626F2E22544950
            4F223E3D2744272C276461272C27646527295D205C62205B494946283C467264
            52656369626F2E225449504F223E3D2744272C3C667264456D70726573612E22
            525A534F43223E2C3C46726452656369626F2E224E4F4D45464F524E223E295D
            5C623020206120696D706F72745C2765326E636961206465205C62205B467264
            52656369626F2E2256414C4F525F42414958415F455854454E534F225D5C6230
            20207265666572656E7465205C276530205C62205B46726452656369626F2E22
            484953544F5249434F225D202D20284D6F76696D656E746F204361697861205B
            46726452656369626F2E22414E4F225D2F5B466F726D6174466C6F6174282730
            30303030272C3C46726452656369626F2E224E554D45524F223E295D202D205B
            494946283C46726452656369626F2E225449504F223E3D2744272C2027445C27
            65396269746F272C202743725C2765396469746F27295D295C6230202E5C7061
            720D0A7D0D0A00}
        end
        object Rich2: TfrxRichView
          Width = 718.110700000000000000
          Height = 102.047310000000000000
          ShowHint = False
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C66636861
            7273657430205461686F6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D
            7366746564697420352E34312E32312E323531303B7D5C766965776B696E6434
            5C7563315C706172645C6669313030305C6C693134305C72693138305C736231
            32305C73613132305C736C3336305C736C6D756C74315C71635C625C66305C66
            733332205B546974756C6F5D5C7061720D0A5C706172645C6669313030305C6C
            693134305C72693138305C73623132305C73613132305C736C3336305C736C6D
            756C74315C71725C62305C667332342056616C6F723A205C756C5C6220522420
            5B466F726D6174466C6F617428272C302E3030272C3C46726452656369626F2E
            2256414C4F525F4241495841223E295D5C756C6E6F6E655C62305C7061720D0A
            7D0D0A00}
        end
      end
      object BndChildAssinatura: TfrxChild
        Height = 105.826840000000000000
        Top = 359.055350000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Left = 79.370130000000000000
          Top = 86.929190000000000000
          Width = 377.953000000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [IIF(<FrdRecibo."TIPO">='#39'D'#39',IIF(<FrdRecibo."PESSOA_FISICA">=1,'#39 +
              'CPF'#39','#39'CNPJ'#39') + '#39': '#39' + IIF(<FrdRecibo."PESSOA_FISICA">=1,FormatMa' +
              'skText('#39'###.###.###-##;0;'#39',<FrdRecibo."CNPJ">),FormatMaskText('#39'#' +
              '#.###.###/####-##;0;'#39',<FrdRecibo."CNPJ">)),'#39'CNPJ: '#39' + FormatMask' +
              'Text('#39'##.###.###/####-##;0;'#39',<frdEmpresa."CNPJ">))]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Memo5: TfrxMemoView
          Left = 79.370130000000000000
          Top = 64.252010000000000000
          Width = 377.953000000000000000
          Height = 22.677180000000000000
          ShowHint = False
          DataSet = DMNFe.frdEmpresa
          DataSetName = 'frdEmpresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop]
          Frame.Width = 0.100000000000000000
          Memo.UTF8 = (
            
              ' [IIF(<FrdRecibo."TIPO">='#39'D'#39',<FrdRecibo."NOMEFORN">,<frdEmpresa.' +
              '"RZSOC">)]')
          ParentFont = False
          WordWrap = False
          VAlign = vaCenter
        end
        object Rich3: TfrxRichView
          Width = 718.110700000000000000
          Height = 30.236240000000000000
          ShowHint = False
          StretchMode = smMaxHeight
          GapX = 2.000000000000000000
          GapY = 1.000000000000000000
          RichEdit = {
            7B5C727466315C616E73695C616E7369637067313235325C64656666305C6465
            666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C66636861
            7273657430205461686F6D613B7D7D0D0A7B5C2A5C67656E657261746F72204D
            7366746564697420352E34312E32312E323531303B7D5C766965776B696E6434
            5C7563315C706172645C6669313030305C6C693134305C72693138305C736231
            32305C73613132305C736C3336305C736C6D756C74315C716A5C66305C667332
            30205B4369646164655D2F5B55465D2C205B466F726D61744461746554696D65
            2827646420222064652022206D6D6D6D202220646520222079797979272C203C
            46726452656369626F2E22444154415F504147544F223E295D2E5C7061720D0A
            7D0D0A00}
        end
      end
    end
  end
  object FrdRecibo: TfrxDBDataset
    UserName = 'FrdRecibo'
    CloseDataSource = True
    FieldAliases.Strings = (
      'ANO=ANO'
      'NUMERO=NUMERO'
      'TIPO=TIPO'
      'NUMERO_RECIBO=NUMERO_RECIBO'
      'ANOLANC=ANOLANC'
      'NUMLANC=NUMLANC'
      'PARCELA=PARCELA'
      'NOMEEMP=NOMEEMP'
      'CODFORN=CODFORN'
      'NOMEFORN=NOMEFORN'
      'PESSOA_FISICA=PESSOA_FISICA'
      'CNPJ=CNPJ'
      'NOTFISC=NOTFISC'
      'TIPPAG=TIPPAG'
      'DTEMISS=DTEMISS'
      'DTVENC=DTVENC'
      'DTPAG=DTPAG'
      'VALORPAG=VALORPAG'
      'BANCO=BANCO'
      'BCO_NOME=BCO_NOME'
      'NUMCHQ=NUMCHQ'
      'PAGO_=PAGO_'
      'DOCBAIX=DOCBAIX'
      'QUITADO=QUITADO'
      'CODTPDESP=CODTPDESP'
      'SEQ=SEQ'
      'DATA_PAGTO=DATA_PAGTO'
      'FORMA_PAGTO=FORMA_PAGTO'
      'FORMA_PAGTO_DESC=FORMA_PAGTO_DESC'
      'HISTORICO=HISTORICO'
      'VALOR_BAIXA=VALOR_BAIXA'
      'VALOR_BAIXA_EXTENSO=VALOR_BAIXA_EXTENSO')
    DataSet = CdsRecibo
    BCDToCurrency = True
    Left = 284
    Top = 449
  end
  object ACBrExtenso: TACBrExtenso
    StrMoeda = 'Real'
    StrMoedas = 'Reais'
    StrCentavo = 'Centavo'
    StrCentavos = 'Centavos'
    Left = 316
    Top = 449
  end
  object QryRecibo: TIBQuery
    Database = DMBusiness.ibdtbsBusiness
    Transaction = DMBusiness.ibtrnsctnBusiness
    SQL.Strings = (
      'Select'
      '    cxm.ano'
      '  , cxm.numero'
      '  , cxm.tipo'
      '  , coalesce(p.Anolanc, r.Anolanc, cxm.ano) || '#39'/'#39' ||'
      
        '    right('#39'00000'#39' || coalesce(p.Numlanc, r.Numlanc, cxm.numero),' +
        ' 5) ||'
      
        '    '#39'.'#39' || cxm.tipo || right('#39'00000'#39' || cxm.numero, 5) as numero' +
        '_recibo'
      '  , coalesce(p.Anolanc, r.Anolanc) as Anolanc'
      '  , coalesce(p.Numlanc, r.Numlanc) as Numlanc'
      '  , coalesce(p.Parcela, r.Parcela) as Parcela'
      '  , coalesce(p.nomeemp, e.rzsoc) as Nomeemp'
      
        '  , coalesce(p.codforn, r.cliente, cxm.fornecedor, cxm.cliente_c' +
        'od) as Codforn'
      '  , coalesce(f.Nomeforn, c.nome) as Nomeforn'
      '  , coalesce(f.pessoa_fisica, c.pessoa_fisica) as pessoa_fisica'
      '  , coalesce(f.Cnpj, c.cnpj) as cnpj'
      '  , coalesce(p.notfisc, r.numcontrato) as Notfisc'
      '  , coalesce(p.tippag, r.tippag, fp.descri) as Tippag'
      
        '  , coalesce(p.Dtemiss, r.dtemiss, cast(cxm.datahora as date)) a' +
        's Dtemiss'
      
        '  , coalesce(p.Dtvenc, r.dtvenc, cast(cxm.datahora as date)) as ' +
        'Dtvenc'
      
        '  , coalesce(p.Dtpag, r.dtrec, cast(cxm.datahora as date)) as Dt' +
        'pag'
      '  , cxm.valor as Valorpag'
      '  , coalesce(p.Banco, r.codbanco) as Banco'
      '  , b.Bco_nome'
      '  , p.Numchq'
      
        '  , Case when coalesce(p.Quitado, r.baixado, 1) = 1 then '#39'X'#39' els' +
        'e '#39'.'#39' end as Pago_'
      '  , coalesce(p.Docbaix, r.docbaix) as Docbaix'
      '  , coalesce(p.Quitado, r.baixado, 1) as Quitado'
      '  , coalesce(p.Codtpdesp, cxm.tipo_despesa) as Codtpdesp'
      ''
      '  , 0 as seq'
      '  , cast(cxm.datahora as date) data_pagto'
      '  , cxm.forma_pagto'
      '  , fp.descri as forma_pagto_desc'
      '  , cxm.historico'
      '  , cxm.valor as valor_baixa'
      'from TBCAIXA_MOVIMENTO cxm'
      '  left join TBEMPRESA e on (e.cnpj = cxm.empresa)'
      '  left join TBFORMPAGTO fp on (fp.cod = cxm.forma_pagto)'
      
        '  left join TBCONTPAG p on (p.anolanc = cxm.apagar_ano and p.num' +
        'lanc = cxm.apagar_num)'
      
        '  left join TBCONTREC r on (r.anolanc = cxm.areceber_ano and r.n' +
        'umlanc = cxm.areceber_num)'
      ''
      
        '  left join TBFORNECEDOR f on (f.Codforn = coalesce(cxm.forneced' +
        'or, p.codforn))'
      
        '  left join TBCLIENTE c on (c.codigo = coalesce(cxm.cliente_cod,' +
        ' r.cliente))'
      ''
      '  left join TBBANCO_BOLETO b on (b.Bco_cod = p.Banco)'
      ''
      'where cxm.ano    = :ano'
      '  and cxm.numero = :numero')
    Left = 252
    Top = 497
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 0
      end>
  end
  object DspRecibo: TDataSetProvider
    DataSet = QryRecibo
    Left = 284
    Top = 497
  end
  object CdsRecibo: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ano'
        ParamType = ptInput
        Value = 0
      end
      item
        DataType = ftInteger
        Name = 'numero'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'DspRecibo'
    OnCalcFields = CdsReciboCalcFields
    Left = 316
    Top = 497
    object CdsReciboANO: TSmallintField
      FieldName = 'ANO'
    end
    object CdsReciboNUMERO: TIntegerField
      FieldName = 'NUMERO'
      Required = True
    end
    object CdsReciboTIPO: TStringField
      FieldName = 'TIPO'
      Size = 1
    end
    object CdsReciboNUMERO_RECIBO: TStringField
      FieldName = 'NUMERO_RECIBO'
      Size = 41
    end
    object CdsReciboANOLANC: TSmallintField
      FieldName = 'ANOLANC'
    end
    object CdsReciboNUMLANC: TIntegerField
      FieldName = 'NUMLANC'
    end
    object CdsReciboPARCELA: TSmallintField
      FieldName = 'PARCELA'
    end
    object CdsReciboNOMEEMP: TStringField
      FieldName = 'NOMEEMP'
      Size = 60
    end
    object CdsReciboCODFORN: TIntegerField
      FieldName = 'CODFORN'
    end
    object CdsReciboNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 100
    end
    object CdsReciboPESSOA_FISICA: TSmallintField
      FieldName = 'PESSOA_FISICA'
    end
    object CdsReciboCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object CdsReciboNOTFISC: TStringField
      FieldName = 'NOTFISC'
      Size = 15
    end
    object CdsReciboTIPPAG: TStringField
      FieldName = 'TIPPAG'
      Size = 35
    end
    object CdsReciboDTEMISS: TDateField
      FieldName = 'DTEMISS'
    end
    object CdsReciboDTVENC: TDateField
      FieldName = 'DTVENC'
    end
    object CdsReciboDTPAG: TDateField
      FieldName = 'DTPAG'
    end
    object CdsReciboVALORPAG: TBCDField
      FieldName = 'VALORPAG'
      Precision = 18
      Size = 2
    end
    object CdsReciboBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object CdsReciboBCO_NOME: TStringField
      FieldName = 'BCO_NOME'
      Size = 50
    end
    object CdsReciboNUMCHQ: TStringField
      FieldName = 'NUMCHQ'
      Size = 10
    end
    object CdsReciboPAGO_: TStringField
      FieldName = 'PAGO_'
      FixedChar = True
      Size = 1
    end
    object CdsReciboDOCBAIX: TStringField
      FieldName = 'DOCBAIX'
      Size = 15
    end
    object CdsReciboQUITADO: TIntegerField
      FieldName = 'QUITADO'
    end
    object CdsReciboCODTPDESP: TSmallintField
      FieldName = 'CODTPDESP'
    end
    object CdsReciboSEQ: TIntegerField
      FieldName = 'SEQ'
    end
    object CdsReciboDATA_PAGTO: TDateField
      FieldName = 'DATA_PAGTO'
    end
    object CdsReciboFORMA_PAGTO: TSmallintField
      FieldName = 'FORMA_PAGTO'
    end
    object CdsReciboFORMA_PAGTO_DESC: TStringField
      FieldName = 'FORMA_PAGTO_DESC'
      Size = 30
    end
    object CdsReciboHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 250
    end
    object CdsReciboVALOR_BAIXA: TBCDField
      FieldName = 'VALOR_BAIXA'
      Precision = 18
      Size = 2
    end
    object CdsReciboVALOR_BAIXA_EXTENSO: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR_BAIXA_EXTENSO'
      Size = 250
    end
  end
end

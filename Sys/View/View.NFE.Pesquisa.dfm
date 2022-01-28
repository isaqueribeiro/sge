inherited ViewNFEPesquisa: TViewNFEPesquisa
  Left = 399
  Top = 207
  Caption = 'Notas Fiscais Emitidas'
  ClientHeight = 471
  ClientWidth = 823
  OldCreateOrder = True
  ExplicitWidth = 839
  ExplicitHeight = 510
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Top = 467
    Width = 823
    ExplicitTop = 468
    ExplicitWidth = 823
  end
  inherited Bevel3: TBevel
    Top = 428
    Width = 823
    ExplicitTop = 429
    ExplicitWidth = 823
  end
  inherited pgcGuias: TPageControl
    Width = 823
    Height = 428
    ExplicitWidth = 823
    ExplicitHeight = 428
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 815
      ExplicitHeight = 399
      inherited Bevel4: TBevel
        Top = 325
        Width = 815
        ExplicitTop = 334
        ExplicitWidth = 815
      end
      inherited dbgDados: TDBGrid
        Width = 815
        Height = 325
        Columns = <
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO'
            Title.Caption = 'NF-e '
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATAEMISSAO'
            Title.Caption = 'Emiss'#227'o '
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO_RAZAO'
            Title.Caption = 'Destinat'#225'rio '
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_DESTINATARIO_CNPJ'
            Title.Caption = 'CPF / CNPJ '
            Width = 140
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NFE_VALOR_TOTAL'
            Title.Caption = 'Valor NF (R$) '
            Width = 110
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Top = 329
        Width = 815
        ExplicitTop = 329
        ExplicitWidth = 815
        inherited grpBxFiltro: TGroupBox
          Left = 240
          Width = 571
          ExplicitLeft = 240
          ExplicitWidth = 571
          ExplicitHeight = 62
          inherited lbltFiltrar: TLabel
            AlignWithMargins = True
            Left = 294
            Top = 24
            Width = 73
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Align = alRight
            Caption = 'Destinat'#225'rio:'
            Layout = tlCenter
            ExplicitLeft = 294
            ExplicitTop = 24
            ExplicitWidth = 73
          end
          object lblData: TLabel [1]
            AlignWithMargins = True
            Left = 24
            Top = 24
            Width = 49
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Align = alRight
            Caption = 'Emiss'#227'o:'
            FocusControl = e1Data
            Layout = tlCenter
            ExplicitHeight = 13
          end
          inherited edtFiltrar: TEdit
            Left = 373
            Width = 154
            TabOrder = 2
            ExplicitLeft = 373
            ExplicitTop = 24
            ExplicitWidth = 154
          end
          inherited btnFiltrar: TcxButton
            Left = 533
            TabOrder = 3
            ExplicitLeft = 533
          end
          object e1Data: TJvDateEdit
            AlignWithMargins = True
            Left = 79
            Top = 24
            Width = 100
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Date = 40909.000000000000000000
            Align = alRight
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
            ExplicitHeight = 21
          end
          object e2Data: TJvDateEdit
            AlignWithMargins = True
            Left = 185
            Top = 24
            Width = 103
            Height = 23
            Margins.Top = 9
            Margins.Bottom = 13
            Date = 40909.000000000000000000
            Align = alRight
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
            ExplicitHeight = 21
          end
        end
        object pnlStatus: TPanel
          AlignWithMargins = True
          Left = 7
          Top = 6
          Width = 143
          Height = 58
          Margins.Top = 2
          Margins.Bottom = 2
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object pnlSatusColor: TPanel
            Left = 0
            Top = 0
            Width = 24
            Height = 58
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object shpOperacaoCancelada: TShape
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 18
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              Brush.Color = 7303023
              Pen.Style = psClear
              ExplicitTop = 24
              ExplicitWidth = 19
            end
          end
          object pnlStatusText: TPanel
            Left = 24
            Top = 0
            Width = 119
            Height = 58
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object lblOperacaoCancelada: TLabel
              AlignWithMargins = True
              Left = 3
              Top = 1
              Width = 113
              Height = 18
              Margins.Top = 1
              Margins.Bottom = 1
              Align = alTop
              AutoSize = False
              Caption = '* Notas Canceladas'
              Font.Charset = ANSI_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
              StyleElements = []
              ExplicitTop = 24
              ExplicitWidth = 251
            end
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 815
      ExplicitHeight = 399
      inherited Bevel8: TBevel
        Top = 73
        Width = 815
        ExplicitTop = 89
        ExplicitWidth = 815
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 815
        Height = 73
        ExplicitWidth = 815
        ExplicitHeight = 73
        inherited lblCodigo: TLabel
          Width = 47
          Caption = 'N'#250'mero:'
          ExplicitWidth = 47
        end
        inherited dbCodigo: TDBEdit
          Width = 121
          DataField = 'NFE_DESTINATARIO'
          ReadOnly = False
          ExplicitWidth = 121
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Top = 432
    Width = 823
    ExplicitTop = 432
    ExplicitWidth = 823
    inherited bvlTool3: TBevel
      Left = 740
      ExplicitLeft = 740
    end
    inherited bvlTool4: TBevel
      Left = 819
      ExplicitLeft = 819
    end
    inherited btbtnIncluir: TcxButton
      Visible = False
    end
    inherited btbtnAlterar: TcxButton
      Visible = False
    end
    inherited btbtnExcluir: TcxButton
      Visible = False
    end
    inherited btbtnCancelar: TcxButton
      Visible = False
    end
    inherited btbtnSalvar: TcxButton
      Visible = False
    end
    inherited btbtnFechar: TcxButton
      Left = 744
      ExplicitLeft = 744
    end
    inherited btbtnSelecionar: TcxButton
      Left = 620
      Visible = True
      ExplicitLeft = 620
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 320
    Top = 272
  end
  inherited ImgList: TImageList
    Left = 288
    Top = 208
  end
end

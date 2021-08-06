inherited ViewVendedor: TViewVendedor
  Left = 396
  Top = 231
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Vendedores'
  ClientWidth = 730
  OldCreateOrder = True
  ExplicitWidth = 746
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 730
    ExplicitWidth = 730
  end
  inherited Bevel3: TBevel
    Width = 730
    ExplicitWidth = 730
  end
  inherited pgcGuias: TPageControl
    Width = 730
    ActivePage = tbsCadastro
    OnChange = pgcGuiasChange
    ExplicitWidth = 730
    inherited tbsTabela: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 722
      ExplicitHeight = 329
      inherited Bevel4: TBevel
        Width = 722
        ExplicitWidth = 722
      end
      inherited dbgDados: TDBGrid
        Width = 722
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Title.Caption = 'C'#243'digo '
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Title.Caption = 'Nome '
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Title.Caption = 'CPF '
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO_TIPO_FLAG'
            Title.Alignment = taCenter
            Title.Caption = 'TC '
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO'
            Title.Caption = 'Comiss'#227'o (%) '
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO_VL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Comiss'#227'o (R$) '
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ATIVO'
            Title.Alignment = taCenter
            Title.Caption = 'A '
            Visible = False
          end>
      end
      inherited pnlFiltros: TPanel
        Width = 722
        ExplicitWidth = 722
        object lblRegistroDesativado: TLabel [0]
          Left = 2
          Top = 44
          Width = 215
          Height = 13
          Caption = '* Registro de vendedor(a) desativado'
          Font.Charset = ANSI_CHARSET
          Font.Color = 7303023
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        inherited grpBxFiltro: TGroupBox
          Left = 383
          Width = 335
          ExplicitLeft = 383
          ExplicitWidth = 335
          inherited lbltFiltrar: TLabel
            Width = 57
            Caption = 'Vendedor:'
            ExplicitWidth = 57
          end
          inherited edtFiltrar: TEdit
            Left = 80
            Width = 208
            ExplicitLeft = 80
            ExplicitWidth = 208
          end
          inherited btnFiltrar: TcxButton
            Left = 294
            ExplicitLeft = 294
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 722
      ExplicitHeight = 329
      inherited Bevel8: TBevel
        Top = 137
        Width = 722
        ExplicitTop = 100
        ExplicitWidth = 722
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 722
        Height = 137
        ExplicitWidth = 722
        ExplicitHeight = 137
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
          FocusControl = dbNome
        end
        object lblCPF: TLabel [2]
          Left = 16
          Top = 64
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = dbCPF
        end
        object lblComissao: TLabel [3]
          Left = 407
          Top = 64
          Width = 71
          Height = 13
          Caption = 'Comiss'#227'o (%):'
          FocusControl = dbComissao
        end
        object lblComissaoValor: TLabel [4]
          Left = 495
          Top = 64
          Width = 73
          Height = 13
          Caption = 'Comiss'#227'o (R$):'
          FocusControl = dbComissaoValor
        end
        object lblTipoComissao: TLabel [5]
          Left = 150
          Top = 65
          Width = 68
          Height = 13
          Caption = 'Tipo Comiss'#227'o'
          FocusControl = dbTipoComissao
        end
        object lblEmail: TLabel [6]
          Left = 407
          Top = 24
          Width = 32
          Height = 13
          Caption = 'E-mail:'
          FocusControl = dbEmail
        end
        inherited dbCodigo: TDBEdit
          Color = clMoneyGreen
          DataField = 'COD'
        end
        object dbNome: TDBEdit
          Left = 88
          Top = 40
          Width = 313
          Height = 21
          DataField = 'NOME'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object dbCPF: TDBEdit
          Left = 16
          Top = 80
          Width = 128
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CPF'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object dbComissao: TDBEdit
          Left = 407
          Top = 80
          Width = 81
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMISSAO'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object dbComissaoValor: TDBEdit
          Left = 495
          Top = 80
          Width = 97
          Height = 21
          CharCase = ecUpperCase
          DataField = 'COMISSAO_VL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object chkbxAtivo: TDBCheckBox
          Left = 16
          Top = 107
          Width = 113
          Height = 17
          Caption = 'Vendedor Ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbTipoComissao: TDBLookupComboBox
          Left = 150
          Top = 80
          Width = 251
          Height = 21
          DataField = 'COMISSAO_TIPO'
          DataSource = DtSrcTabela
          DropDownRows = 10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyField = 'CODIGO'
          ListField = 'DESCRICAO'
          ListSource = dtsTipoComissao
          ParentFont = False
          TabOrder = 4
        end
        object dbEmail: TDBEdit
          Left = 407
          Top = 40
          Width = 290
          Height = 21
          CharCase = ecLowerCase
          DataField = 'EMAIL'
          DataSource = DtSrcTabela
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited tlbBotoes: TPanel
    Width = 730
    ExplicitWidth = 730
    inherited bvlTool3: TBevel
      Left = 647
      ExplicitLeft = 647
    end
    inherited bvlTool4: TBevel
      Left = 726
      ExplicitLeft = 726
    end
    inherited btbtnFechar: TcxButton
      Left = 651
      ExplicitLeft = 651
    end
    inherited btbtnSelecionar: TcxButton
      Left = 527
      ExplicitLeft = 527
    end
  end
  inherited DtSrcTabela: TDataSource
    OnDataChange = DtSrcTabelaDataChange
    Left = 632
    Top = 0
  end
  inherited ImgList: TImageList
    Left = 600
    Top = 0
  end
  object dtsTipoComissao: TDataSource
    Left = 664
  end
end

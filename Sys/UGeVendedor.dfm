inherited frmGeVendedor: TfrmGeVendedor
  Left = 268
  Top = 180
  Width = 746
  ActiveControl = dbCodigo
  Caption = 'Cadastro de Vendedores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Bevel1: TBevel
    Width = 730
  end
  inherited Bevel3: TBevel
    Width = 730
  end
  inherited tlbBotoes: TToolBar
    Width = 730
    inherited bvlToolExpandir: TBevel
      Width = 36
    end
    inherited btbtnSelecionar: TBitBtn
      Left = 577
    end
    inherited bvlTool4: TBevel
      Left = 697
    end
  end
  inherited pgcGuias: TPageControl
    Width = 730
    ActivePage = tbsCadastro
    inherited tbsTabela: TTabSheet
      inherited Bevel4: TBevel
        Width = 722
      end
      inherited dbgDados: TDBGrid
        Width = 722
        Columns = <
          item
            Expanded = False
            FieldName = 'COD'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO'
            Title.Caption = 'Comiss'#227'o (%)'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMISSAO_VL'
            Title.Alignment = taRightJustify
            Title.Caption = 'Comiss'#227'o (R$)'
            Width = 110
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Width = 722
        inherited grpBxFiltro: TGroupBox
          Left = 428
          Width = 290
          DesignSize = (
            290
            54)
          inherited lbltFiltrar: TLabel
            Width = 57
            Caption = 'Vendedor:'
          end
          inherited btnFiltrar: TSpeedButton
            Left = 245
          end
          inherited edtFiltrar: TEdit
            Left = 72
            Width = 169
          end
        end
      end
    end
    inherited tbsCadastro: TTabSheet
      inherited Bevel8: TBevel
        Top = 100
        Width = 722
      end
      inherited GrpBxDadosNominais: TGroupBox
        Width = 722
        Height = 100
        object lblNome: TLabel [1]
          Left = 88
          Top = 24
          Width = 31
          Height = 13
          Caption = 'Nome:'
        end
        object lblCPF: TLabel [2]
          Left = 408
          Top = 24
          Width = 23
          Height = 13
          Caption = 'CPF:'
          FocusControl = dbCPF
        end
        object lblComissao: TLabel [3]
          Left = 520
          Top = 24
          Width = 71
          Height = 13
          Caption = 'Comiss'#227'o (%):'
          FocusControl = dbComissao
        end
        object lblComissaoValor: TLabel [4]
          Left = 608
          Top = 24
          Width = 73
          Height = 13
          Caption = 'Comiss'#227'o (R$):'
          FocusControl = dbComissaoValor
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
          CharCase = ecUpperCase
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
          Left = 408
          Top = 40
          Width = 105
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
          TabOrder = 2
        end
        object dbComissao: TDBEdit
          Left = 520
          Top = 40
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
          TabOrder = 3
        end
        object dbComissaoValor: TDBEdit
          Left = 608
          Top = 40
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
          TabOrder = 4
        end
        object chkbxAtivo: TDBCheckBox
          Left = 16
          Top = 72
          Width = 113
          Height = 17
          Caption = 'Vendedor Ativo'
          DataField = 'ATIVO'
          DataSource = DtSrcTabela
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited IbDtstTabela: TIBDataSet
    BeforePost = IbDtstTabelaBeforePost
    OnNewRecord = IbDtstTabelaNewRecord
    SelectSQL.Strings = (
      'Select'
      '    v.Cod'
      '  , v.Nome'
      '  , v.Cpf'
      '  , v.Ativo'
      '  , v.comissao'
      '  , v.Comissao_vl'
      'from TBVENDEDOR v'
      'where v.ativo=1')
    GeneratorField.Field = 'COD'
    GeneratorField.Generator = 'GEN_GRUPOPRODUTO_COD'
    Left = 96
    Top = 312
    object IbDtstTabelaCOD: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'COD'
      Origin = 'TBVENDEDOR.COD'
      Required = True
    end
    object IbDtstTabelaNOME: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'TBVENDEDOR.NOME'
      Required = True
      Size = 60
    end
    object IbDtstTabelaCPF: TIBStringField
      FieldName = 'CPF'
      Origin = 'TBVENDEDOR.CPF'
      Required = True
      EditMask = '000.000.000-00;0; '
      Size = 12
    end
    object IbDtstTabelaCOMISSAO: TIBBCDField
      FieldName = 'COMISSAO'
      Origin = 'TBVENDEDOR.COMISSAO'
      DisplayFormat = '#0.00'
      Precision = 9
      Size = 2
    end
    object IbDtstTabelaCOMISSAO_VL: TIBBCDField
      DisplayLabel = 'Valor Comiss'#227'o'
      FieldName = 'COMISSAO_VL'
      Origin = 'TBVENDEDOR.COMISSAO_VL'
      Required = True
      DisplayFormat = ',0.00'
      Precision = 9
      Size = 2
    end
    object IbDtstTabelaATIVO: TSmallintField
      Alignment = taLeftJustify
      FieldName = 'ATIVO'
      Origin = 'TBVENDEDOR.ATIVO'
      Required = True
    end
  end
  inherited DtSrcTabela: TDataSource
    Left = 160
    Top = 312
  end
  inherited IbUpdTabela: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  COD,'
      '  NOME,'
      '  CPF,'
      '  ATIVO,'
      '  COMISSAO,'
      '  COMISSAO_VL'
      'from TBVENDEDOR '
      'where'
      '  COD = :COD')
    ModifySQL.Strings = (
      'update TBVENDEDOR'
      'set'
      '  COD = :COD,'
      '  NOME = :NOME,'
      '  CPF = :CPF,'
      '  ATIVO = :ATIVO,'
      '  COMISSAO = :COMISSAO,'
      '  COMISSAO_VL = :COMISSAO_VL'
      'where'
      '  COD = :OLD_COD')
    InsertSQL.Strings = (
      'insert into TBVENDEDOR'
      '  (COD, NOME, CPF, ATIVO, COMISSAO, COMISSAO_VL)'
      'values'
      '  (:COD, :NOME, :CPF, :ATIVO, :COMISSAO, :COMISSAO_VL)')
    DeleteSQL.Strings = (
      'delete from TBVENDEDOR'
      'where'
      '  COD = :OLD_COD')
    Left = 128
    Top = 312
  end
  inherited ImgList: TImageList
    Left = 64
    Top = 312
  end
end

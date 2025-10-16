unit View.CotacaoCompra.Fornecedor;

interface

uses
  System.SysUtils,
  System.StrUtils,
  System.ImageList,
  System.Classes,
  System.Variants,
  Winapi.Windows,

  Vcl.Forms,
  Vcl.Menus,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ComCtrls,
  Vcl.Graphics,
  Vcl.Buttons,
  Vcl.Dialogs,
  Vcl.ExtDlgs,
  Vcl.Clipbrd,

  Data.DB,

  JvDBControls,
  JvExMask,
  JvToolEdit,

  frxClass,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxButtons,
  dxSkinsCore,

  UConstantesDGE,
  UGrPadrao,
  SGE.Controller.Interfaces,
  Interacao.Tabela,
  Controller.Tabela,

  ExcelXP,

  dxSkinOffice2019Black, dxSkinOffice2019Colorful, dxSkinOffice2019DarkGray, dxSkinOffice2019White,
  dxSkinsDefaultPainters, dxSkinBasic, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinTheBezier, dxSkinWXI;

type
  TCotacaoFornecedorOpercao = (cfoInserir, cfoCarregarPlanilha, cfoEditar, cfoVisualizar);
  TViewCotacaoCompraFornecedor = class(TfrmGrPadrao)
    GrpBxControle: TGroupBox;
    lblCodigo: TLabel;
    lblDescricaoResumo: TLabel;
    lblEmissao: TLabel;
    dbCodigo: TDBEdit;
    dbDescricaoResumo: TDBEdit;
    dbEmissao: TDBEdit;
    lblValidade: TLabel;
    dbValidade: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dtsFornecedor: TDataSource;
    dtsFormaPagto: TDataSource;
    dtsCondicaoPagto: TDataSource;
    PgcResposta: TPageControl;
    TbsFornecedor: TTabSheet;
    lblFornecedor: TLabel;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    dbCondicaoPagto: TDBLookupComboBox;
    lblObservacoes: TLabel;
    dbObservacoes: TDBMemo;
    TbsFornecedorItem: TTabSheet;
    dtsItem: TDataSource;
    dbgProdutos: TDBGrid;
    lblDataResposta: TLabel;
    BtnCarregarXLS: TcxButton;
    btnSalvar: TcxButton;
    btFechar: TcxButton;
    dbDataResposta: TJvDBDateEdit;
    dbFornecedor: TJvDBComboEdit;
    procedure btFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure dtsFornecedorStateChange(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgProdutosEnter(Sender: TObject);
    procedure dbgProdutosExit(Sender: TObject);
    procedure dbgProdutosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    FEmpresa : String;
    FAno       ,
    FCotacao   ,
    FFornecedor: Integer;
    FDescricao ,
    FArquivoXLS: String;
    FEmissao  ,
    FValidade : TDateTime;

    FControllerCotacaoFornecedor : IControllerCotacaoCompraFornecedor;
    FControllerCotacaoFornecedorItens : IControllerCotacaoCompraFornecedorItens;
    FControllerFormaPagto ,
    FControllerCondicaoPagtoView : IControllerCustom;
    FControllerFornecedor : IControllerFornecedor;

    procedure CarregarDadosFornecedor;

    function Fornecedor : IControllerFornecedor;
    function Itens : IControllerCotacaoCompraFornecedorItens;
  public
    { Public declarations }
    procedure CarregarArquivoXLS;

    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBCOTACAO_COMPRA
  - TBCOTACAO_COMPRAITEM
  - TBPRODUTO
  - TBUNIDADEPROD
  - TBCOTACAO_COMPRAFORN
  - TBCOTACAO_COMPRAFORN_ITEM
  - TBFORNECEDOR
  - TBFORMPAGTO

  Views:
  - VW_CONDICAOPAGTO
  - VW_TIPO_COTACAO

  Procedures:
  - SET_COTACAO_COMPRAFORN_ITEM
*)

  function CotacaoFornecedor(const AOwer : TComponent; const TipoOperacao : TCotacaoFornecedorOpercao;
    Empresa : String; aAno : Smallint; aNumero, aFornecedor : Integer;
    const Descricao, ArquivoXLS : String; const Emissao, Validade : TDateTime) : Boolean;

  function ElaborarFormulaTravarCelulasXLS(const AOwer : TComponent; cEmpresa : String; aAno : Smallint; aNumero, aFornecedor : Integer;
    const SenhaXLS, ArquivoXLS : String) : Boolean;

  function TravarCelulasXLS(const Ranges : TStringList; const SenhaXLS, ArquivoXLS : String;
    const ListaSuspensaEndereco, ListaSuspensaValores : TStringList) : Boolean;

  function DestravarCelulasXLS(const SenhaXLS, ArquivoXLS : String) : Boolean;

implementation

uses
    DateUtils
  , UFuncoes
  , UDMRecursos
  , UDMNFe
  , Service.Message
  , SGE.Controller.Factory
  , SGE.Controller
  , SGE.Controller.Helper
  , View.Fornecedor;

{$R *.dfm}

const
  COLUNA_A = 1;
  COLUNA_B = 2;
  COLUNA_C = 3;
  COLUNA_D = 4;
  COLUNA_E = 5;
  COLUNA_F = 6;
  COLUNA_G = 7;
  COLUNA_H = 8;
  COLUNA_I = 9;
  COLUNA_J = 10;
  COLUNA_K = 11;
  COLUNA_L = 12;
  COLUNA_M = 13;
  COLUNA_N = 14;
  COLUNA_O = 15;
  COLUNA_P = 16;
  COLUNA_Q = 17;
  COLUNA_R = 18;
  COLUNA_S = 19;
  COLUNA_T = 20;
  COLUNA_U = 21;
  COLUNA_V = 22;
  COLUNA_W = 23;
  COLUNA_X = 24;
  COLUNA_Y = 25;
  COLUNA_Z = 26;

  COLUNA_AA = COLUNA_Z + COLUNA_A;
  COLUNA_AB = COLUNA_Z + COLUNA_B;
  COLUNA_AC = COLUNA_Z + COLUNA_C;
  COLUNA_AD = COLUNA_Z + COLUNA_D;
  COLUNA_AE = COLUNA_Z + COLUNA_E;
  COLUNA_AF = COLUNA_Z + COLUNA_F;
  COLUNA_AG = COLUNA_Z + COLUNA_G;
  COLUNA_AH = COLUNA_Z + COLUNA_H;
  COLUNA_AI = COLUNA_Z + COLUNA_I;
  COLUNA_AJ = COLUNA_Z + COLUNA_J;
  COLUNA_AK = COLUNA_Z + COLUNA_K;
  COLUNA_AL = COLUNA_Z + COLUNA_L;
  COLUNA_AM = COLUNA_Z + COLUNA_M;
  COLUNA_AN = COLUNA_Z + COLUNA_N;
  COLUNA_AO = COLUNA_Z + COLUNA_O;
  COLUNA_AP = COLUNA_Z + COLUNA_P;
  COLUNA_AQ = COLUNA_Z + COLUNA_Q;
  COLUNA_AR = COLUNA_Z + COLUNA_R;
  COLUNA_AS = COLUNA_Z + COLUNA_S;
  COLUNA_AT = COLUNA_Z + COLUNA_T;
  COLUNA_AU = COLUNA_Z + COLUNA_U;
  COLUNA_AV = COLUNA_Z + COLUNA_V;
  COLUNA_AW = COLUNA_Z + COLUNA_W;
  COLUNA_AX = COLUNA_Z + COLUNA_X;
  COLUNA_AY = COLUNA_Z + COLUNA_Y;
  COLUNA_AZ = COLUNA_Z + COLUNA_Z;

  COLUNA_BA = COLUNA_AZ + COLUNA_A;
  COLUNA_BB = COLUNA_AZ + COLUNA_B;
  COLUNA_BC = COLUNA_AZ + COLUNA_C;
  COLUNA_BD = COLUNA_AZ + COLUNA_D;
  COLUNA_BE = COLUNA_AZ + COLUNA_E;
  COLUNA_BF = COLUNA_AZ + COLUNA_F;
  COLUNA_BG = COLUNA_AZ + COLUNA_G;
  COLUNA_BH = COLUNA_AZ + COLUNA_H;
  COLUNA_BI = COLUNA_AZ + COLUNA_I;
  COLUNA_BJ = COLUNA_AZ + COLUNA_J;
  COLUNA_BK = COLUNA_AZ + COLUNA_K;
  COLUNA_BL = COLUNA_AZ + COLUNA_L;
  COLUNA_BM = COLUNA_AZ + COLUNA_M;
  COLUNA_BN = COLUNA_AZ + COLUNA_N;
  COLUNA_BO = COLUNA_AZ + COLUNA_O;
  COLUNA_BP = COLUNA_AZ + COLUNA_P;
  COLUNA_BQ = COLUNA_AZ + COLUNA_Q;
  COLUNA_BR = COLUNA_AZ + COLUNA_R;
  COLUNA_BS = COLUNA_AZ + COLUNA_S;
  COLUNA_BT = COLUNA_AZ + COLUNA_T;
  COLUNA_BU = COLUNA_AZ + COLUNA_U;
  COLUNA_BV = COLUNA_AZ + COLUNA_V;
  COLUNA_BW = COLUNA_AZ + COLUNA_W;
  COLUNA_BX = COLUNA_AZ + COLUNA_X;
  COLUNA_BY = COLUNA_AZ + COLUNA_Y;
  COLUNA_BZ = COLUNA_AZ + COLUNA_Z;

  REFERENCIA : Array[COLUNA_A..COLUNA_BZ] of String = (
     'A',  'B',  'C',  'D',  'E',  'F',  'G',  'H',  'I',  'J',  'K',  'L',  'M',  'N',  'O',  'P',  'Q',  'R',  'S',  'T',  'U',  'V',  'W',  'X',  'Y',  'Z',
    'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'AG', 'AH', 'AI', 'AJ', 'AK', 'AL', 'AM', 'AN', 'AO', 'AP', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ',
    'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BK', 'BL', 'BM', 'BN', 'BO', 'BP', 'BQ', 'BR', 'BS', 'BT', 'BU', 'BV', 'BW', 'BX', 'BY', 'BZ');

  PAGE_1     = 'Page 1';
  PAGE_2     = 'Page 2';
  PAGE_3     = 'Page 3';

  PLAN_1     = 'Plan1';
  PLAN_2     = 'Plan2';
  PLAN_3     = 'Plan3';

  PLANILHA_1 = 'Planilha1';
  PLANILHA_2 = 'Planilha2';
  PLANILHA_3 = 'Planilha3';

  APOSTROFE      = '''';
  NOME_VENDEDOR  = 'Att.:';
  ENDERECO_FORNE = 'Endereço:';
  TOTAL_GERAL    = 'T O T A L    G E R A L';
  TOTAL_BRUTO    = 'Total Bruto';
  TOTAL_DESCONTO = 'Desconto';
  TOTAL_LIQUIDO  = 'Total Líquido';
  FORMA_PAGTO    = 'Forma de Pagamento:';
  CONDICAO_PAGTO = 'Condição de Pagamento:';
  OBSERVACOES    = 'Observações Gerais:';

  COLUNA_NRO_COTAC = COLUNA_P;
  COLUNA_NOME_VEND = COLUNA_A;
  COLUNA_END_FORNE = COLUNA_A;
  COLUNA_CNPJ_FORN = COLUNA_I;
  COLUNA_DATA_PROP = COLUNA_T;
  COLUNA_PRODUTO   = COLUNA_C;
  COLUNA_QTDE      = COLUNA_L;
  COLUNA_VALOR     = COLUNA_Q;
  COLUNA_TOTAL     = COLUNA_U;
  COLUNA_TOTAL_GT  = COLUNA_J;
  COLUNA_TOTAL_GV  = COLUNA_T;
  COLUNA_TOTAL_BR  = COLUNA_H;
  COLUNA_TOTAL_DS  = COLUNA_M;
  COLUNA_TOTAL_LQ  = COLUNA_S;
  COLUNA_FORMA_PAGTO    = COLUNA_A;
  COLUNA_CONDICAO_PAGTO = COLUNA_G;
  COLUNA_OBSERVACOES    = COLUNA_A;

function CotacaoFornecedor(const AOwer : TComponent; const TipoOperacao : TCotacaoFornecedorOpercao;
  Empresa : String; aAno : Smallint; aNumero, aFornecedor : Integer;
  const Descricao, ArquivoXLS : String; const Emissao, Validade : TDateTime) : Boolean;
var
  AForm : TViewCotacaoCompraFornecedor;
begin
  AForm := TViewCotacaoCompraFornecedor.Create(AOwer);
  try
    with AForm, dtsFornecedor.DataSet do
    begin
      FEmpresa    := Empresa;
      FAno        := aAno;
      FCotacao    := aNumero;
      FFornecedor := aFornecedor;
      FDescricao  := Descricao;
      FArquivoXLS := ArquivoXLS;
      FEmissao    := Emissao;
      FValidade   := Validade;

      CarregarDadosFornecedor;

      Case TipoOperacao of
        cfoInserir:
          begin
            dtsFornecedor.DataSet.Append;

            FieldByName('ANO').AsInteger    := FAno;
            FieldByName('CODIGO').AsInteger := FCotacao;
            FieldByName('EMPRESA').AsString := FEmpresa;
            FieldByName('FORNECEDOR').AsInteger := FFornecedor;
            FieldByName('NUMERO').AsString := FormatFloat('##0000000', FieldByName('CODIGO').Value) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);

            FieldByName('NOMEFORN').AsString     := Fornecedor.DAO.DataSet.FieldByName('NOMEFORN').AsString;
            FieldByName('NOME_CONTATO').AsString := Fornecedor.DAO.DataSet.FieldByName('CONTATO').AsString;
            FieldByName('EMAIL_ENVIO').AsString  := Fornecedor.DAO.DataSet.FieldByName('EMAIL').AsString;
          end;

        cfoCarregarPlanilha:
          begin
            // Limpar itens
            FControllerCotacaoFornecedor.ExcluirItens(
                FieldByName('ano').AsInteger
              , FieldByName('codigo').AsInteger
              , FieldByName('empresa').AsString
              , FieldByName('fornecedor').AsInteger
            );

            // Gerar itens
            FControllerCotacaoFornecedor.CotacaoFornecedorItem(
                FieldByName('ano').AsInteger
              , FieldByName('codigo').AsInteger
              , FieldByName('empresa').AsString
              , FieldByName('fornecedor').AsInteger
            );

            FControllerCotacaoFornecedorItens
              .DAO
                .Close
                .Open;

            CarregarArquivoXLS;

            dtsFornecedor.DataSet.Edit;

            BtnCarregarXLS.Visible := False;
          end;

        cfoEditar :
          begin
            dtsFornecedor.DataSet.Edit;

            if (not dtsItem.DataSet.IsEmpty) then
              dtsItem.DataSet.Edit;
          end;

        cfoVisualizar : dtsFornecedor.AutoEdit := False;
      end;

      Result := (ShowModal = mrOk);

      if Result then
        if (TipoOperacao = cfoCarregarPlanilha) then
          RenameFile(FArquivoXLS, ChangeFileExt(FArquivoXLS, '.processado.xls'));
    end;
  finally
    AForm.Free;
  end;
end;

function ElaborarFormulaTravarCelulasXLS(const AOwer : TComponent; cEmpresa : String; aAno : Smallint; aNumero, aFornecedor : Integer;
  const SenhaXLS, ArquivoXLS : String) : Boolean;
var
  AForm : TViewCotacaoCompraFornecedor;
var
  bRetorno : Boolean;

  XLApp   : TExcelApplication;
  XLBook  : TExcelWorkbook;
  XLSheet : TExcelWorksheet;

  I,
  iLinha      ,
  iLinha_Nome_Vendedor ,
  iLinha_End_Fornecedor,
  iLinha_Total_Geral   ,
  iLinha_Total_Bruto   ,
  iLinha_Total_Desconto,
  iLinha_Total_Liquido ,
  iLinha_Forma_Pagto   ,
  iLinha_Condicao_Pagto,
  iLinha_Observacoes   ,
  iColuna,
  LCID   : Integer;

  sListaFormaPagto   ,
  sListaCondicaoPagto,
  
  sSoma  ,
  sValor : String;
  RangesLocked : TStringList;
  ListaEndereco   ,
  ListaReferencia : TStringList;
begin
  KillTask('EXCEL.EXE');

  bRetorno := False;

  AForm := TViewCotacaoCompraFornecedor.Create(AOwer);

  RangesLocked    := TStringList.Create;
  ListaEndereco   := TStringList.Create;
  ListaReferencia := TStringList.Create;
  Screen.Cursor   := crHourGlass;

  with AForm do
  begin

    sSoma := EmptyStr;

    XLApp   := TExcelApplication.Create(nil);
    XLBook  := TExcelWorkbook.Create(nil);
    XLSheet := TExcelWorksheet.Create(nil);

    // Conectar-se a aplicação EXCEL

    LCID := GetUserDefaultLCID;
    XLApp.Connect;

    XLApp.Visible[LCID]       := False; //True;
    XLApp.DisplayAlerts[LCID] := False; //True;

    try
      if not FileExists(ArquivoXLS) then
        Exit;

      // Abrir arquivo

      XLBook.ConnectTo( XLApp.Workbooks.Open(
        ArquivoXLS,
        EmptyParam, // UpdateLinks : OleVariant
        EmptyParam, // ReadOnly    : OleVariant
        EmptyParam, // Format      : OleVariant
        EmptyParam, // Password    : OleVariant
        EmptyParam, // WriteResPassword          : OleVariant
        EmptyParam, // IgnoreReadOnlyRecommended : OleVariant
        EmptyParam, // Orign       : OleVariant
        EmptyParam, // Delimiter   : OleVariant
        EmptyParam, // Editable    : OleVariant
        EmptyParam, // Notify      : OleVariant
        EmptyParam, // Converter   : OleVariant
        EmptyParam, // AddToMru    : OleVariant
        EmptyParam, // Local       : OleVariant
        EmptyParam, // CorruptLoad : OleVariant
        LCID) );

      try
        // Ativar a PLANILHA1
        XLSheet.ConnectTo( XLBook.Worksheets.Item[PLANILHA_1] as _Worksheet);
        XLSheet.Activate;
      except
        try
          // Ativar a PLAN1
          XLSheet.ConnectTo( XLBook.Worksheets.Item[PLAN_1] as _Worksheet);
          XLSheet.Activate;
        except
          // Ativar Page 1
          XLSheet.ConnectTo( XLBook.Worksheets.Item[PAGE_1] as _Worksheet);
          XLSheet.Activate;
        end;
      end;

      // Ativar Padrão Branco na Planilha
      (*
      MyXLWorksheet.Cells.Select;
      MyXLWorksheet.Cells.Interior.ColorIndex        := 2;
      MyXLWorksheet.Cells.Interior.Pattern           := xlSolid;
      MyXLWorksheet.Cells.Interior.PatternColorIndex := xlAutomatic;
      *)
      // Buscar endereços de referência limite na planilha

      XLSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
      iLinha  := XLApp.ActiveCell.Row;
      iColuna := XLApp.ActiveCell.Column;

      // Remover proteção do campo DATA
      RangesLocked.Add(REFERENCIA[COLUNA_T] + '19');

      iLinha_Total_Geral    := 0;
      iLinha_Total_Bruto    := 0;
      iLinha_Total_Desconto := 0;
      iLinha_Total_Liquido  := 0;

      // Ajustar valores da tabela aplicando formatação correta dos valores

      for I := 1 to iLinha do
      begin

        // Recuperar referências de campos liberados e/ou de controles

        if ( Pos(TOTAL_GERAL, XLSheet.Cells.Item[I, COLUNA_TOTAL_GT]) > 0 ) then
          iLinha_Total_Geral := I;

        if ( Pos(NOME_VENDEDOR, XLSheet.Cells.Item[I, COLUNA_NOME_VEND]) > 0 ) then
          iLinha_Nome_Vendedor := I + 1;

        if ( Pos(ENDERECO_FORNE, XLSheet.Cells.Item[I, COLUNA_END_FORNE]) > 0 ) then
          iLinha_End_Fornecedor := I + 1;

        if ( Pos(TOTAL_BRUTO, XLSheet.Cells.Item[I, COLUNA_TOTAL_BR]) > 0 ) then
          iLinha_Total_Bruto := I + 1;

        if ( Pos(TOTAL_DESCONTO, XLSheet.Cells.Item[I, COLUNA_TOTAL_DS]) > 0 ) then
          iLinha_Total_Desconto := I + 1;

        if ( Pos(TOTAL_LIQUIDO, XLSheet.Cells.Item[I, COLUNA_TOTAL_LQ]) > 0 ) then
          iLinha_Total_Liquido := I + 1;

        if ( Pos(FORMA_PAGTO, XLSheet.Cells.Item[I, COLUNA_FORMA_PAGTO]) > 0 ) then
          iLinha_Forma_Pagto := I + 1;

        if ( Pos(CONDICAO_PAGTO, XLSheet.Cells.Item[I, COLUNA_CONDICAO_PAGTO]) > 0 ) then
          iLinha_Condicao_Pagto := I + 1;

        if ( Pos(OBSERVACOES, XLSheet.Cells.Item[I, COLUNA_OBSERVACOES]) > 0 ) then
          iLinha_Observacoes := I + 1;

        // Recuperar valor/conteúdo da célula

        sValor := StringReplace(Trim(XLSheet.Cells.Item[I, COLUNA_QTDE]), APOSTROFE, '', [rfReplaceAll]);

        if sValor = EmptyStr then
          Continue;

        if StrToCurrDef(sValor, 0) > 0 then
        begin
          XLSheet.Cells.Item[I, COLUNA_QTDE]  := sValor;
          XLSheet.Cells.Item[I, COLUNA_VALOR] := EmptyStr;
          XLSheet.Cells.Item[I, COLUNA_TOTAL].Formula := '=' + REFERENCIA[COLUNA_QTDE] + IntToStr(I) + '*' + REFERENCIA[COLUNA_VALOR] + IntToStr(I);

          // Formatar célula

          XLSheet.Cells.Item[I, COLUNA_VALOR].NumberFormat := '#.##0,00_);(#.##0,00)';
          XLSheet.Cells.Item[I, COLUNA_TOTAL].NumberFormat := '#.##0,00_);(#.##0,00)';

          // Remover Proteção
          RangesLocked.Add(REFERENCIA[COLUNA_VALOR] + IntToStr(I));

          sSoma := sSoma + REFERENCIA[COLUNA_TOTAL] + IntToStr(I) + '+';
        end;

      end;

      // Gerar fórmulas totalizadoras

      if ( iLinha_Total_Geral > 0 ) then
      begin
        XLSheet.Cells.Item[iLinha_Total_Geral, COLUNA_TOTAL_GV].Select;
        XLSheet.Cells.Item[iLinha_Total_Geral, COLUNA_TOTAL_GV].NumberFormat := '#.##0,00_);(#.##0,00)';
        XLSheet.Cells.Item[iLinha_Total_Geral, COLUNA_TOTAL_GV].Formula      := '=' + Copy(sSoma, 1, Length(sSoma) - 1);
      end;

      if ( iLinha_Total_Bruto > 0 ) then
      begin
        XLSheet.Cells.Item[iLinha_Total_Bruto, COLUNA_TOTAL_BR].Select;
        XLSheet.Cells.Item[iLinha_Total_Bruto, COLUNA_TOTAL_BR].NumberFormat := '#.##0,00_);(#.##0,00)';
        XLSheet.Cells.Item[iLinha_Total_Bruto, COLUNA_TOTAL_BR].Formula      := '=' + REFERENCIA[COLUNA_TOTAL_GV] + IntToStr(iLinha_Total_Geral);
      end;

      if ( iLinha_Total_Desconto > 0 ) then
      begin
        XLSheet.Cells.Item[iLinha_Total_Desconto, COLUNA_TOTAL_DS].Select;
        XLSheet.Cells.Item[iLinha_Total_Desconto, COLUNA_TOTAL_DS].NumberFormat := '#.##0,00_);(#.##0,00)';
        XLSheet.Cells.Item[iLinha_Total_Desconto, COLUNA_TOTAL_DS] := EmptyStr;

        // Remover proteção do campo DESCONTO
        RangesLocked.Add(REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto));
      end;

      if ( iLinha_Total_Liquido > 0 ) then
      begin
        XLSheet.Cells.Item[iLinha_Total_Liquido, COLUNA_TOTAL_LQ].Select;
        XLSheet.Cells.Item[iLinha_Total_Liquido, COLUNA_TOTAL_LQ].NumberFormat := '#.##0,00_);(#.##0,00)';
        XLSheet.Cells.Item[iLinha_Total_Liquido, COLUNA_TOTAL_LQ].Formula      := '=' + REFERENCIA[COLUNA_TOTAL_BR] + IntToStr(iLinha_Total_Bruto) + '-' + REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto);
      end;

      // Remover proteção do campo VENDEDOR (ATT.)
      if ( iLinha_Nome_Vendedor > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_NOME_VEND] + IntToStr(iLinha_Nome_Vendedor));

      // Remover proteção do campo ENDERECO DO FORNECEDOR
      if ( iLinha_End_Fornecedor > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_END_FORNE] + IntToStr(iLinha_End_Fornecedor));

      // Remover proteção do campo FORMA DE PAGAMENTO
      if ( iLinha_Forma_Pagto > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_FORMA_PAGTO] + IntToStr(iLinha_Forma_Pagto));

      // Remover proteção do campo CONDIÇÃO DE PAGAMENTO
      if ( iLinha_Condicao_Pagto > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_CONDICAO_PAGTO] + IntToStr(iLinha_Condicao_Pagto));

      // Remover proteção do campo OBSERVAÇÔES GERAIS
      if ( iLinha_Observacoes > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_OBSERVACOES] + IntToStr(iLinha_Observacoes));

      // Montar Lista de Formas de Pagamento na Planilha 2

      //XLSheet.Disconnect;
      //XLSheet.ConnectTo( XLBook.Worksheets.Item[PLANILHA_2] as _Worksheet);
      //XLSheet.Activate;

      I := 1;
      sListaFormaPagto := EmptyStr;
      dtsFormaPagto.DataSet.First;
      while not dtsFormaPagto.DataSet.Eof do
      begin
        //XLSheet.Cells.Item[I, 1].Value := Trim(dtsFormaPagto.DataSet.FieldByName('DESCRI').AsString);
        sListaFormaPagto := sListaFormaPagto + Trim(dtsFormaPagto.DataSet.FieldByName('DESCRI').AsString) + ';';
        dtsFormaPagto.DataSet.Next;
        Inc(I);
      end;

      if (iLinha_Forma_Pagto > 0) and (Trim(sListaFormaPagto) <> EmptyStr) then
      begin
        ListaEndereco.Add(REFERENCIA[COLUNA_FORMA_PAGTO] + IntToStr(iLinha_Forma_Pagto));
        ListaReferencia.Add(Copy(sListaFormaPagto, 1, Length(sListaFormaPagto) - 1));
      end;

      // Montar Lista de Formas de Pagamento na Planilha 3

      //XLSheet.Disconnect;
      //XLSheet.ConnectTo( XLBook.Worksheets.Item[PLANILHA_3] as _Worksheet);
      //XLSheet.Activate;

      I := 1;
      sListaCondicaoPagto := EmptyStr;
      dtsCondicaoPagto.DataSet.First;
      while not dtsCondicaoPagto.DataSet.Eof do
      begin
        //XLSheet.Cells.Item[I, 1].Value := Trim(dtsCondicaoPagto.DataSet.FieldByName('COND_DESCRICAO').AsString);
        sListaCondicaoPagto := sListaCondicaoPagto + Trim(dtsCondicaoPagto.DataSet.FieldByName('COND_DESCRICAO').AsString) + ';';
        dtsCondicaoPagto.DataSet.Next;
        Inc(I);
      end;

      if (iLinha_Condicao_Pagto > 0) and (Trim(sListaCondicaoPagto) <> EmptyStr) then
      begin
        ListaEndereco.Add(REFERENCIA[COLUNA_CONDICAO_PAGTO] + IntToStr(iLinha_Condicao_Pagto));
        ListaReferencia.Add(Copy(sListaCondicaoPagto, 1, Length(sListaCondicaoPagto) - 1));
      end;

      // Ativar célula A11 da PLAN1 e salvar

      XLSheet.Cells.Item[11, COLUNA_A].Select;

      XLBook.Save;

      bRetorno := True;
    finally
      XLApp.DisplayAlerts[LCID] := True;

      XLSheet.Disconnect;
      XLBook.Disconnect;
      XLApp.Quit;
      XLApp.Disconnect;

      Free;

      Screen.Cursor := crDefault;
    end;

    if bRetorno then
      if FileExists(ArquivoXLS) then
        TravarCelulasXLS(RangesLocked, SenhaXLS, ArquivoXLS, ListaEndereco, ListaReferencia);

    RangesLocked.Free;
    ListaEndereco.Free;
    ListaReferencia.Free;

    Result := bRetorno;
  end;
end;

function TravarCelulasXLS(const Ranges : TStringList; const SenhaXLS, ArquivoXLS : String;
  const ListaSuspensaEndereco, ListaSuspensaValores : TStringList) : Boolean;

  procedure SepararReferencia(sReferencia : String; var iLinha, iColuna : Integer);
  var
    I : Integer;
    sLinha : String;
  begin
    // Separando a linha
    sLinha := EmptyStr;
    for I := 1 to Length(sReferencia) do
      if StrToIntDef(sReferencia[I], -1) > -1 then
        sLinha := sLinha + sReferencia[I];

    iLinha := StrToInt(sLinha);

    // Identificando a coluna
    sReferencia := StringReplace(sReferencia, sLinha, '', [rfReplaceAll]);
    for I := Low(REFERENCIA) to High(REFERENCIA) do
      if AnsiUpperCase(sReferencia) = REFERENCIA[I] then
      begin
        iColuna := I;
        Break;
      end;
  end;

var
  bRetorno : Boolean;
  Excel   : TExcelApplication;
  XLBook  : TExcelWorkbook;
  XLSheet : TExcelWorksheet;
  LCID ,
  I    ,
  iLin ,
  iCol : Integer;
begin
  bRetorno := False;

  Excel   := TExcelApplication.Create(nil);
  XLBook  := TExcelWorkbook.Create(nil);
  XLSheet := TExcelWorksheet.Create(nil);

  LCID := GetUserDefaultLCID;
  Excel.Connect;

  Excel.Visible[LCID]       := False; //True;
  Excel.DisplayAlerts[LCID] := False; //True;

  Screen.Cursor := crHourGlass;

  try

    try

      XLBook.ConnectTo( Excel.Workbooks.Open(
        ArquivoXLS,
        EmptyParam, // UpdateLinks : OleVariant
        EmptyParam, // ReadOnly    : OleVariant
        EmptyParam, // Format      : OleVariant
        EmptyParam, // Password    : OleVariant
        EmptyParam, // WriteResPassword          : OleVariant
        EmptyParam, // IgnoreReadOnlyRecommended : OleVariant
        EmptyParam, // Orign       : OleVariant
        EmptyParam, // Delimiter   : OleVariant
        EmptyParam, // Editable    : OleVariant
        EmptyParam, // Notify      : OleVariant
        EmptyParam, // Converter   : OleVariant
        EmptyParam, // AddToMru    : OleVariant
        EmptyParam, // Local       : OleVariant
        EmptyParam, // CorruptLoad : OleVariant
        LCID) );

      XLSheet.ConnectTo( XLBook.ActiveSheet as _Worksheet);
      XLSheet.Activate;

      XLSheet.Cells.Select;                // Seleciona a planilha
      XLSheet.Cells.Locked        := True; // Ativar a proteção de conteúdo
      XLSheet.Cells.FormulaHidden := True; // Ativar a proteção de fórmula

      // Remover proteção de Conteúdo e Fórmula

      if Assigned(Ranges) then
        for I := 0 to Ranges.Count - 1 do
        begin
          SepararReferencia(Ranges[I], iLin, iCol);
          XLSheet.Cells.Item[iLin, iCol].Select; // Seleciona a Célula

          (Excel.Selection[LCID] as ExcelRange).Locked := False;
          (Excel.Selection[LCID] as ExcelRange).FormulaHidden := False;
        end;

      // Montar lista suspensa

      if Assigned(ListaSuspensaEndereco) then
        for I := 0 to ListaSuspensaEndereco.Count - 1 do
        begin
          SepararReferencia(ListaSuspensaEndereco[I], iLin, iCol);
          XLSheet.Cells.Item[iLin, iCol].Select; // Seleciona a Célula

          (Excel.Selection[LCID] as ExcelRange).Validation.Delete;
          (Excel.Selection[LCID] as ExcelRange).Validation.Add(
              xlValidateList
            , xlValidAlertStop
            , xlBetween
            , ListaSuspensaValores[I] // Fórmula para montar a lista suspensa
            , EmptyParam
          );

          (Excel.Selection[LCID] as ExcelRange).Validation.IgnoreBlank    := True;
          (Excel.Selection[LCID] as ExcelRange).Validation.InCellDropdown := True;
          (Excel.Selection[LCID] as ExcelRange).Validation.ShowError      := False;

          (******* Script VB

          Range("C1").Select
          With Selection.Validation
              .Delete
              .Add Type:=xlValidateList, AlertStyle := xlValidAlertWarning, Operator := xlBetween, Formula1:="=Plan3!$A$1:$A$17"
              .IgnoreBlank = True
              .InCellDropdown = True
              .InputTitle = ""
              .ErrorTitle = "Título"
              .InputMessage = ""
              .ErrorMessage = "Teste"
              .ShowInput = True
              .ShowError = True
          End With
          *)
        end;

      XLSheet.Cells.Item[1, 1].Select;

      XLSheet.Protect(SenhaXLS, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True);
      XLBook.Save;

      bRetorno := True;

    except
      On E : Exception do
        raise Exception.Create('Travar/proteger o arquivo: ' + E.Message);
    end;

  finally
    Excel.DisplayAlerts[LCID] := True;

    XLSheet.Disconnect;
    XLBook.Disconnect;

    Excel.Quit;
    Excel.Disconnect;

    Screen.Cursor := crDefault;

    Result := bRetorno;
  end;
end;

function DestravarCelulasXLS(const SenhaXLS, ArquivoXLS : String) : Boolean;
var
  bRetorno : Boolean;
  Excel   : TExcelApplication;
  XLBook  : TExcelWorkbook;
  XLSheet : TExcelWorksheet;
  LCID ,
  I     : Integer;
begin
  bRetorno := False;

  Excel   := TExcelApplication.Create(nil);
  XLBook  := TExcelWorkbook.Create(nil);
  XLSheet := TExcelWorksheet.Create(nil);

  LCID := GetUserDefaultLCID;
  Excel.Connect;

  Excel.Visible[LCID]       := False; //True;
  Excel.DisplayAlerts[LCID] := False; //True;

  Screen.Cursor := crHourGlass;

  try

    try

      XLBook.ConnectTo( Excel.Workbooks.Open(
        ArquivoXLS,
        EmptyParam, // UpdateLinks : OleVariant
        EmptyParam, // ReadOnly    : OleVariant
        EmptyParam, // Format      : OleVariant
        EmptyParam, // Password    : OleVariant
        EmptyParam, // WriteResPassword          : OleVariant
        EmptyParam, // IgnoreReadOnlyRecommended : OleVariant
        EmptyParam, // Orign       : OleVariant
        EmptyParam, // Delimiter   : OleVariant
        EmptyParam, // Editable    : OleVariant
        EmptyParam, // Notify      : OleVariant
        EmptyParam, // Converter   : OleVariant
        EmptyParam, // AddToMru    : OleVariant
        EmptyParam, // Local       : OleVariant
        EmptyParam, // CorruptLoad : OleVariant
        LCID) );

      XLSheet.ConnectTo( XLBook.ActiveSheet as _Worksheet);
      XLSheet.Activate;

      XLSheet.UnProtect(SenhaXLS);

      XLSheet.Cells.Select;                 // Seleciona a planilha
      XLSheet.Cells.Locked        := False; // Desativar a proteção de conteúdo
      XLSheet.Cells.FormulaHidden := False; // Desativar a proteção de fórmula


      XLSheet.Cells.Item[1, 1].Select;
      XLBook.Save;

      bRetorno := True;

    except
      On E : Exception do
        raise Exception.Create('Destravar/desproteger o arquivo: ' + E.Message);
    end;

  finally
    Excel.DisplayAlerts[LCID] := True;

    XLSheet.Disconnect;
    XLBook.Disconnect;

    Excel.Quit;
    Excel.Disconnect;

    Screen.Cursor := crDefault;

    Result := bRetorno;
  end;
end;

procedure TViewCotacaoCompraFornecedor.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TViewCotacaoCompraFornecedor.btnSalvarClick(
  Sender: TObject);
var
  aContinue : Boolean;
begin
  if dtsFornecedor.DataSet.IsEmpty then
    Exit;

  aContinue := TServiceMessage.ShowConfirm('Confirma os dados inseridos referente ao fornecedor na cotação?');

  if aContinue then
  begin
    with dtsFornecedor.DataSet do
      if (State in [dsEdit, dsInsert]) then
      begin
        if not GetEmailValido(Trim(dbEmail.Text), False) then
        begin
          TServiceMessage.ShowWarning('E-mail', 'O e-mail informado é inválido!');
          Abort;
        end;

        Post;
        FControllerCotacaoFornecedor.DAO.ApplyUpdates;
        FControllerCotacaoFornecedor.DAO.CommitUpdates;

        if (FieldByName('VALOR_TOTAL_BRUTO').AsCurrency > 0) then
        begin
          if (not dtsItem.DataSet.IsEmpty) then
          begin
            if (dtsItem.DataSet.State = dsEdit) then
              dtsItem.DataSet.Post;

            FControllerCotacaoFornecedorItens.DAO.ApplyUpdates;
            FControllerCotacaoFornecedorItens.DAO.CommitUpdates;
          end;
        end;

        FControllerCotacaoFornecedor.DAO.CommitTransaction;
        FControllerCotacaoFornecedorItens.DAO.CommitTransaction;

        ModalResult := mrOk;
      end;
  end;
end;

procedure TViewCotacaoCompraFornecedor.RegistrarRotinaSistema;
begin
  ;
end;

procedure TViewCotacaoCompraFornecedor.dtsFornecedorStateChange(
  Sender: TObject);
begin
  dbFornecedor.Button.Enabled := (dtsFornecedor.DataSet.State = dsInsert);
end;

procedure TViewCotacaoCompraFornecedor.dbFornecedorButtonClick(
  Sender: TObject);
var
  aCodigo : Integer;
  aNome   : String;
begin
  if (dtsFornecedor.DataSet.State = dsInsert) then
    if SelecionarFornecedor(Self, aCodigo, aNome) then
    begin
      FFornecedor := aCodigo;
      Fornecedor.Get(FFornecedor);

      with dtsFornecedor.DataSet do
      begin
        FieldByName('ANO').AsInteger    := FAno;
        FieldByName('CODIGO').AsInteger := FCotacao;
        FieldByName('EMPRESA').AsString := FEmpresa;
        FieldByName('FORNECEDOR').AsInteger := FFornecedor;
        FieldByName('ATIVO').AsInteger      := 1;
        FieldByName('USUARIO').AsString     := Fornecedor.DAO.Usuario.Login;
        FieldByName('DATA_RESPOSTA').AsDateTime      := Date;
        FieldByName('PRAZO_ENTREGA_DATA').AsDateTime := IncDay(FieldByName('DATA_RESPOSTA').AsDateTime, PRAZO_VALIDADE_COTACAO_COMPRA);
        FieldByName('VENCEDOR').AsInteger      := 0;

        FieldByName('VALOR_TOTAL_BRUTO').AsCurrency    := 0.0;
        FieldByName('VALOR_TOTAL_DESCONTO').AsCurrency := 0.0;
        FieldByName('VALOR_TOTAL_LIQUIDO').AsCurrency  := 0.0;

        FieldByName('NOMEFORN').AsString     := aNome;
        FieldByName('NOME_CONTATO').AsString := Fornecedor.DAO.DataSet.FieldByName('CONTATO').AsString;
        FieldByName('EMAIL_ENVIO').AsString  := Fornecedor.DAO.DataSet.FieldByName('EMAIL').AsString;

        FieldByName('NUMERO').AsString           := FormatFloat('##0000000', FieldByName('CODIGO').Value) + '/' + Copy(FieldByName('ANO').AsString, 3, 2);
        FieldByName('DESCRICAO_RESUMO').AsString := FDescricao;
        FieldByName('EMISSAO_DATA').AsDateTime   := FEmissao;
        FieldByName('VALIDADE').AsDateTime       := FValidade;
        FieldByName('OBSERVACAO').Clear;
      end;
    end;
end;

procedure TViewCotacaoCompraFornecedor.FormCreate(Sender: TObject);
begin
  FControllerCotacaoFornecedor := TControllerFactory.New.CotacaoCompraFornecedor;
  FControllerCotacaoFornecedorItens := TControllerFactory.New.CotacaoCompraFornecedorItens;
  FControllerFormaPagto        := TControllerFactory.New.FormaPagto;
  FControllerCondicaoPagtoView := TControllerFactory.New.CondicaoPagtoView;

  dtsFornecedor.DataSet := FControllerCotacaoFornecedor.DAO.DataSet;
  dtsItem.DataSet := FControllerCotacaoFornecedorItens.DAO.DataSet;

  inherited;
  FDescricao  := EmptyStr;
  FArquivoXLS := EmptyStr;

  TController(FControllerFormaPagto)
    .LookupComboBox(dbFormaPagto, dtsFormaPagto, 'FORMA_PAGTO', 'codigo', 'codigo_descricao');

  TController(FControllerCondicaoPagtoView)
    .LookupComboBox(dbCondicaoPagto, dtsCondicaoPagto, 'CONDICAO_PAGTO', 'cond_cod', 'cond_descricao');
end;

procedure TViewCotacaoCompraFornecedor.FormShow(Sender: TObject);
begin
  inherited;
  PgcResposta.ActivePage := TbsFornecedor;
end;

function TViewCotacaoCompraFornecedor.Fornecedor: IControllerFornecedor;
begin
  if not Assigned(FControllerFornecedor) then
    FControllerFornecedor := TControllerFactory.New.Fornecedor;

  Result := FControllerFornecedor;
end;

function TViewCotacaoCompraFornecedor.Itens: IControllerCotacaoCompraFornecedorItens;
begin
  if (not Assigned(FControllerCotacaoFornecedorItens)) then
  begin
    FControllerCotacaoFornecedorItens := TControllerFactory.New.CotacaoCompraFornecedorItens;
    FControllerCotacaoFornecedorItens.CarregarFornecedorItens(FAno, FCotacao, FEmpresa, FFornecedor);
  end;

  Result := FControllerCotacaoFornecedorItens;
end;

procedure TViewCotacaoCompraFornecedor.dbgProdutosEnter(Sender: TObject);
begin
  if (dtsFornecedor.DataSet.State in [dsEdit, dsInsert]) then
    if (not dtsItem.DataSet.IsEmpty) then
    begin
      Self.OnKeyDown := nil;
      dtsItem.DataSet.Edit;
    end;
end;

procedure TViewCotacaoCompraFornecedor.dbgProdutosExit(Sender: TObject);
begin
  Self.OnKeyDown := FormKeyDown;
end;

procedure TViewCotacaoCompraFornecedor.CarregarDadosFornecedor;
begin
  Fornecedor.Get(FFornecedor);
  FControllerCotacaoFornecedor.CarregarFornecedor(FAno, FCotacao, FEmpresa, FFornecedor);
  FControllerCotacaoFornecedorItens.CarregarFornecedorItens(FAno, FCotacao, FEmpresa, FFornecedor);
end;

procedure TViewCotacaoCompraFornecedor.CarregarArquivoXLS;
var
  bRetorno : Boolean;

  XLApp   : TExcelApplication;
  XLBook  : TExcelWorkbook;
  XLSheet : TExcelWorksheet;

  I,

  iLinha_Nome_Vendedor ,
//  iLinha_End_Fornecedor,
//  iLinha_Total_Geral   ,
  iLinha_Total_Bruto   ,
  iLinha_Total_Desconto,
  iLinha_Total_Liquido ,
  iLinha_Forma_Pagto   ,
  iLinha_Condicao_Pagto,
  iLinha_Observacoes   ,

  iLinha ,
  iColuna,
  LCID   : Integer;

  sProduto ,
  sValor   ,
  sCNPJ    ,
  sInforme : String;
const
  LINHA_NRO_COTACAO = 2;
  LINHA_VENDEDOR    = 17;
  LINHA_CNJP_FORNEC = 19;
  LINHA_DATA_PROPOS = LINHA_CNJP_FORNEC;
begin
  KillTask('EXCEL.EXE');

  sCNPJ := StringReplace(Trim(dtsFornecedor.DataSet.FieldByName('CNPJ').AsString), APOSTROFE, '', [rfReplaceAll]);
  sCNPJ := StringReplace(StringReplace(StringReplace(sCNPJ, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]);

  try
    if not FileExists(FArquivoXLS) then
      Exit
    else
      DestravarCelulasXLS(sCNPJ, FArquivoXLS);
  except
  end;

  Screen.Cursor   := crHourGlass;

  // Conectar-se a aplicação EXCEL

  XLApp   := TExcelApplication.Create(nil);
  XLBook  := TExcelWorkbook.Create(nil);
  XLSheet := TExcelWorksheet.Create(nil);

  LCID := GetUserDefaultLCID;

  Sleep(500);

  XLApp.Connect;

  XLApp.Visible[LCID]       := False; //True;
  XLApp.DisplayAlerts[LCID] := False; //True;

  try

    // Abrir arquivo

    XLBook.ConnectTo( XLApp.Workbooks.Open(
      FArquivoXLS,
      EmptyParam, // UpdateLinks : OleVariant
      EmptyParam, // ReadOnly    : OleVariant
      EmptyParam, // Format      : OleVariant
      EmptyParam, // Password    : OleVariant
      EmptyParam, // WriteResPassword          : OleVariant
      EmptyParam, // IgnoreReadOnlyRecommended : OleVariant
      EmptyParam, // Orign       : OleVariant
      EmptyParam, // Delimiter   : OleVariant
      EmptyParam, // Editable    : OleVariant
      EmptyParam, // Notify      : OleVariant
      EmptyParam, // Converter   : OleVariant
      EmptyParam, // AddToMru    : OleVariant
      EmptyParam, // Local       : OleVariant
      EmptyParam, // CorruptLoad : OleVariant
      LCID) );


    try
      // Ativar a PLANILHA1
      XLSheet.ConnectTo( XLBook.Worksheets.Item[PLANILHA_1] as _Worksheet);
      XLSheet.Activate;
    except
      try
        // Ativar a PLAN1
        XLSheet.ConnectTo( XLBook.Worksheets.Item[PLAN_1] as _Worksheet);
        XLSheet.Activate;
      except
        // Ativar Page 1
        XLSheet.ConnectTo( XLBook.Worksheets.Item[PAGE_1] as _Worksheet);
        XLSheet.Activate;
      end;
    end;

    // Buscar endereços de referência limite na planilha

    XLSheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    iLinha  := XLApp.ActiveCell.Row;
    iColuna := XLApp.ActiveCell.Column;

    // Validar Arquivo

    sInforme := StringReplace(Trim(XLSheet.Cells.Item[LINHA_NRO_COTACAO, COLUNA_NRO_COTAC]), APOSTROFE, '', [rfReplaceAll]);

    if (sInforme <> Trim(dtsFornecedor.DataSet.FieldByName('NUMERO').AsString)) then
    begin
      TServiceMessage.ShowWarning('Arquivo selecionado não pertence a esta cotação!');
      Exit;
    end;

    sInforme := StringReplace(Trim(XLSheet.Cells.Item[LINHA_CNJP_FORNEC, COLUNA_CNPJ_FORN]), APOSTROFE, '', [rfReplaceAll]);
    sInforme := StringReplace(StringReplace(StringReplace(sInforme, '.', '', [rfReplaceAll]), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll]);

    if (sInforme <> Trim(dtsFornecedor.DataSet.FieldByName('CNPJ').AsString)) then
    begin
      TServiceMessage.ShowWarning('Arquivo selecionado não pertence a teste fornecedor!');
      Exit;
    end;

    // Recuperar valor unitário dos produtos

    for I := 1 to iLinha do
    begin

        // Recuperar referências de campos liberados e/ou de controles

//        if ( Pos(TOTAL_GERAL, MyXLWorksheet.Cells[I, COLUNA_TOTAL_GT]) > 0 ) then
//          iLinha_Total_Geral := I;

        if ( Pos(NOME_VENDEDOR, XLSheet.Cells.Item[I, COLUNA_NOME_VEND]) > 0 ) then
          iLinha_Nome_Vendedor := I + 1;

//        if ( Pos(ENDERECO_FORNE, XLSheet.Cells.Item[I, COLUNA_END_FORNE]) > 0 ) then
//          iLinha_End_Fornecedor := I + 1;

        if ( Pos(TOTAL_BRUTO, XLSheet.Cells.Item[I, COLUNA_TOTAL_BR]) > 0 ) then
          iLinha_Total_Bruto := I + 1;

        if ( Pos(TOTAL_DESCONTO, XLSheet.Cells.Item[I, COLUNA_TOTAL_DS]) > 0 ) then
          iLinha_Total_Desconto := I + 1;

        if ( Pos(TOTAL_LIQUIDO, XLSheet.Cells.Item[I, COLUNA_TOTAL_LQ]) > 0 ) then
          iLinha_Total_Liquido := I + 1;

        if ( Pos(FORMA_PAGTO, XLSheet.Cells.Item[I, COLUNA_FORMA_PAGTO]) > 0 ) then
          iLinha_Forma_Pagto := I + 1;

        if ( Pos(CONDICAO_PAGTO, XLSheet.Cells.Item[I, COLUNA_CONDICAO_PAGTO]) > 0 ) then
          iLinha_Condicao_Pagto := I + 1;

        if ( Pos(OBSERVACOES, XLSheet.Cells.Item[I, COLUNA_OBSERVACOES]) > 0 ) then
          iLinha_Observacoes := I + 1;

      // Recuperar valor/conteúdo da célula

      sProduto := StringReplace(Trim(XLSheet.Cells.Item[I, COLUNA_PRODUTO]), APOSTROFE, '', [rfReplaceAll]);
      sValor   := StringReplace(Trim(XLSheet.Cells.Item[I, COLUNA_VALOR]),   APOSTROFE, '', [rfReplaceAll]);

      if sValor = EmptyStr then
        Continue;

      if StrToCurrDef(sValor, 0) > 0 then
      begin
        if dtsItem.DataSet.Locate('PRODUTO', sProduto, []) then
        begin
          dtsItem.DataSet.Edit;
          dtsItem.DataSet.FieldByName('VALOR_UNITARIO').AsCurrency := StrToCurr(sValor);
          dtsItem.DataSet.Post;

          FControllerCotacaoFornecedorItens.DAO.ApplyUpdates;
          FControllerCotacaoFornecedorItens.DAO.CommitUpdates;
        end;
      end;

    end;

    FControllerCotacaoFornecedorItens.DAO.CommitTransaction;
    dtsItem.DataSet.First;

    // Recuperar demais valores

    dtsFornecedor.DataSet.Edit;

    if ( iLinha_Total_Bruto > 0 ) then
    begin
      sValor := StringReplace(Trim(XLSheet.Cells.Item[iLinha_Total_Bruto, COLUNA_TOTAL_BR]), APOSTROFE, '', [rfReplaceAll]);
      dtsFornecedor.DataSet.FieldByName('VALOR_TOTAL_BRUTO').AsCurrency := StrToCurrDef(sValor, 0.0);
    end;

    if ( iLinha_Total_Desconto > 0 ) then
    begin
      sValor := StringReplace(Trim(XLSheet.Cells.Item[iLinha_Total_Desconto, COLUNA_TOTAL_DS]), APOSTROFE, '', [rfReplaceAll]);
      dtsFornecedor.DataSet.FieldByName('VALOR_TOTAL_DESCONTO').AsCurrency := StrToCurrDef(sValor, 0.0);
    end;

    if ( iLinha_Total_Liquido > 0 ) then
    begin
      sValor := StringReplace(Trim(XLSheet.Cells.Item[iLinha_Total_Liquido, COLUNA_TOTAL_LQ]), APOSTROFE, '', [rfReplaceAll]);
      dtsFornecedor.DataSet.FieldByName('VALOR_TOTAL_LIQUIDO').AsCurrency := StrToCurrDef(sValor, 0.0);
    end;

    if ( iLinha_Forma_Pagto > 0 ) then
    begin
      sValor := StringReplace(Trim(XLSheet.Cells.Item[iLinha_Forma_Pagto, COLUNA_FORMA_PAGTO]), APOSTROFE, '', [rfReplaceAll]);
      if dtsFormaPagto.DataSet.Locate('DESCRI', sValor, []) then
        dtsFornecedor.DataSet.FieldByName('FORMA_PAGTO').AsInteger := dtsFormaPagto.DataSet.FieldByName('COD').AsInteger
      else
        dtsFornecedor.DataSet.FieldByName('FORMA_PAGTO').Clear;
    end;

    if ( iLinha_Condicao_Pagto > 0 ) then
    begin
      sValor := StringReplace(Trim(XLSheet.Cells.Item[iLinha_Condicao_Pagto, COLUNA_CONDICAO_PAGTO]), APOSTROFE, '', [rfReplaceAll]);
      if dtsCondicaoPagto.DataSet.Locate('COND_DESCRICAO', sValor, []) then
        dtsFornecedor.DataSet.FieldByName('CONDICAO_PAGTO').AsInteger := dtsCondicaoPagto.DataSet.FieldByName('COND_COD').AsInteger
      else
        dtsFornecedor.DataSet.FieldByName('CONDICAO_PAGTO').Clear;
    end;

    if ( iLinha_Observacoes > 0 ) then
    begin
      sValor := StringReplace(Trim(XLSheet.Cells.Item[iLinha_Observacoes, COLUNA_OBSERVACOES]), APOSTROFE, '', [rfReplaceAll]);
      dtsFornecedor.DataSet.FieldByName('OBSERVACAO').AsString := sValor;
    end;

    // ... Observações

    sInforme := StringReplace(Trim(XLSheet.Cells.Item[LINHA_VENDEDOR, COLUNA_NOME_VEND]), APOSTROFE, '', [rfReplaceAll]);
    if (Trim(sInforme) <> EmptyStr) then
      dtsFornecedor.DataSet.FieldByName('NOME_CONTATO').AsString := sInforme;

    // ... Data Proposta

    sInforme := StringReplace(Trim(XLSheet.Cells.Item[LINHA_DATA_PROPOS, COLUNA_DATA_PROP]), APOSTROFE, '', [rfReplaceAll]);
    if (Trim(sInforme) <> EmptyStr) then
      dtsFornecedor.DataSet.FieldByName('DATA_RESPOSTA').AsDateTime := StrToDateDef(sInforme, Date);

    if (dtsFornecedor.DataSet.State = dsEdit) then
      dtsFornecedor.DataSet.Post;

    // Ativar célula A11 da PLAN1 e salvar

    XLSheet.Cells.Item[11, COLUNA_A].Select;
    XLSheet.Disconnect;

    bRetorno := True;
  finally
    XLApp.DisplayAlerts[LCID] := True;

    XLBook.Disconnect;
    XLApp.Quit;
    XLApp.Disconnect;

    XLApp.Free;
    XLBook.Free;

    Screen.Cursor := crDefault;
  end;

  if bRetorno then
    if FileExists(FArquivoXLS) then
      bRetorno := TravarCelulasXLS(nil, sCNPJ, FArquivoXLS, nil, nil);
end;

procedure TViewCotacaoCompraFornecedor.dbgProdutosDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color := clBlack;

  if odd(TDbGrid(Sender).DataSource.DataSet.RecNo) then
    TDBGrid(Sender).Canvas.Brush.Color:= clMenuBar
  else
    TDBGrid(Sender).Canvas.Brush.Color:= clCream;

  if gdSelected in State then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color :=  clMoneyGreen;
      FillRect(Rect);
      Font.Style  := [fsbold]
    end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

end.

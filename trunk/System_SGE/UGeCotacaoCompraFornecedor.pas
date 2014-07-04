unit UGeCotacaoCompraFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UGrPadrao, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBUpdateSQL, rxToolEdit, RXDBCtrl, IBTable, OleServer,
  ExcelXP, ComObj;

type
  TCotacaoFornecedorOpercao = (cfoInserir, cfoEditar, cfoVisualizar);
  TfrmGeCotacaoCompraFornecedor = class(TfrmGrPadrao)
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
    GrpBxImposto: TGroupBox;
    Bevel2: TBevel;
    btnSalvar: TBitBtn;
    btFechar: TBitBtn;
    lblFornecedor: TLabel;
    dbFornecedor: TRxDBComboEdit;
    qryFornecedor: TIBDataSet;
    qryFornecedorANO: TSmallintField;
    qryFornecedorCODIGO: TIntegerField;
    qryFornecedorEMPRESA: TIBStringField;
    qryFornecedorFORNECEDOR: TIntegerField;
    qryFornecedorNOME_CONTATO: TIBStringField;
    qryFornecedorEMAIL_ENVIO: TIBStringField;
    qryFornecedorFORMA_PAGTO: TSmallintField;
    qryFornecedorCONDICAO_PAGTO: TSmallintField;
    qryFornecedorPRAZO_ENTREGA_DATA: TDateField;
    qryFornecedorPRAZO_ENTREDA_DIA: TSmallintField;
    qryFornecedorOBSERVACAO: TMemoField;
    qryFornecedorATIVO: TSmallintField;
    qryFornecedorUSUARIO: TIBStringField;
    qryFornecedorNOMEFORN: TIBStringField;
    qryFornecedorCNPJ: TIBStringField;
    qryFornecedorEMAIL: TIBStringField;
    qryFornecedorFORMA_PAGTO_DESC: TIBStringField;
    qryFornecedorCONDICAP_PAGTO_DESC: TIBStringField;
    updFornecedor: TIBUpdateSQL;
    dtsFornecedor: TDataSource;
    qryFornecedorDESCRICAO_RESUMO: TIBStringField;
    qryFornecedorEMISSAO_DATA: TDateField;
    qryFornecedorVALIDADE: TDateField;
    qryFornecedorNUMERO: TIBStringField;
    lblNomeContato: TLabel;
    dbNomeContato: TDBEdit;
    lblEmail: TLabel;
    dbEmail: TDBEdit;
    tblFormaPagto: TIBTable;
    dtsFormaPagto: TDataSource;
    tblCondicaoPagto: TIBTable;
    dtsCondicaoPagto: TDataSource;
    lblFormaPagto: TLabel;
    dbFormaPagto: TDBLookupComboBox;
    dbCondicaoPagto: TDBLookupComboBox;
    lblCondicaoPagto: TLabel;
    lblDataEntrega: TLabel;
    dbDataEntrega: TDBDateEdit;
    lblObservacoes: TLabel;
    dbObservacoes: TDBMemo;
    qryFornecedorDATA_RESPOSTA: TDateField;
    qryFornecedorVALOR_TOTAL_BRUTO: TIBBCDField;
    qryFornecedorVALOR_TOTAL_DESCONTO: TIBBCDField;
    qryFornecedorVALOR_TOTAL_LIQUIDO: TIBBCDField;
    qryFornecedorVENCEDOR: TSmallintField;
    XLApp: TExcelApplication;
    XLBook: TExcelWorkbook;
    procedure btFecharClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure qryFornecedorNewRecord(DataSet: TDataSet);
    procedure dtsFornecedorStateChange(Sender: TObject);
    procedure dbFornecedorButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryFornecedorBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FEmpresa : String;
    FAno       ,
    FCotacao   ,
    FFornecedor: Integer;
    FDescricao : String;
    FEmissao  ,
    FValidade : TDateTime;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

  function CotacaoFornecedor(const AOwer : TComponent; const TipoOperacao : TCotacaoFornecedorOpercao;
    Empresa : String; Ano : Smallint; Numero, Fornecedor : Integer;
    const Descricao : String; const Emissao, Validade : TDateTime) : Boolean;

  function ElaborarFormulaTravarCelulasXLS(const AOwer : TComponent; cEmpresa : String; Ano : Smallint; Numero, Fornecedor : Integer;
    const SenhaXLS, ArquivoXLS : String) : Boolean;

  function TravarCelulasXLS(const Ranges : TStringList; const SenhaXLS, ArquivoXLS : String;
    const ListaSuspensaEndereco, ListaSuspensaValores : TStringList) : Boolean;

implementation

uses
  UDMBusiness, UDMNFe, UFuncoes, UGeFornecedor, DateUtils;

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

  PLANILHA_1     = 'Plan1';
  PLANILHA_2     = 'Plan2';
  PLANILHA_3     = 'Plan3';

  NOME_VENDEDOR  = 'Att.:';
  ENDERECO_FORNE = 'Endere�o:';
  TOTAL_GERAL    = 'T O T A L    G E R A L';
  TOTAL_BRUTO    = 'Total Bruto';
  TOTAL_DESCONTO = 'Desconto';
  TOTAL_LIQUIDO  = 'Total L�quido';
  FORMA_PAGTO    = 'Forma de Pagamento:';
  CONDICAO_PAGTO = 'Condi��o de Pagamento:';
  OBSERVACOES    = 'Observa��es Gerais:';

  COLUNA_NOME_VEND = COLUNA_A;
  COLUNA_END_FORNE = COLUNA_A;
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
  Empresa : String; Ano : Smallint; Numero, Fornecedor : Integer;
  const Descricao : String; const Emissao, Validade : TDateTime) : Boolean;
var
  frm : TfrmGeCotacaoCompraFornecedor;
begin
  frm := TfrmGeCotacaoCompraFornecedor.Create(AOwer);
  try
    with frm, qryFornecedor do
    begin
      FEmpresa    := Empresa;
      FAno        := Ano;
      FCotacao    := Numero;
      FFornecedor := Fornecedor;
      FDescricao  := Descricao;
      FEmissao    := Emissao;
      FValidade   := Validade;

      qryFornecedor.Close;
      ParamByName('ano').AsShort   := Ano;
      ParamByName('cod').AsInteger := Numero;
      ParamByName('for').AsInteger := Fornecedor;
      qryFornecedor.Open;

      Case TipoOperacao of
        cfoInserir: Append;
        cfoEditar : Edit;
        cfoVisualizar : dtsFornecedor.AutoEdit := False;
      end;

      Result := (ShowModal = mrOk);
    end;
  finally
    frm.Free;
  end;
end;

function ElaborarFormulaTravarCelulasXLS(const AOwer : TComponent; cEmpresa : String; Ano : Smallint; Numero, Fornecedor : Integer;
  const SenhaXLS, ArquivoXLS : String) : Boolean;
var
  frm : TfrmGeCotacaoCompraFornecedor;
var
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

  MyXLWorkbook  ,
  MyXLWorksheet : OleVariant;

  sListaFormaPagto   ,
  sListaCondicaoPagto,
  
  sSoma  ,
  sValor : String;
  RangesLocked : TStringList;
  ListaEndereco   ,
  ListaReferencia : TStringList;
begin
  frm := TfrmGeCotacaoCompraFornecedor.Create(AOwer);

  RangesLocked    := TStringList.Create;
  ListaEndereco   := TStringList.Create;
  ListaReferencia := TStringList.Create;
  Screen.Cursor   := crHourGlass;

  with frm do
  begin

    sSoma := EmptyStr;

    // Conectar-se a aplica��o EXCEL

    LCID := GetUserDefaultLCID;
    XLApp.Connect;

    XLApp.Visible[LCID]       := False; //True;
    XLApp.DisplayAlerts[LCID] := False; //True;

    try
      // Abrir arquivo

      MyXLWorkbook := XLApp.Workbooks._Open(
        ArquivoXLS,
        EmptyParam, // UpdateLinks : OleVariant
        EmptyParam, // ReadOnly    : OleVariant
        EmptyParam, // Format      : OleVariant
        EmptyParam, // Password    : OleVariant
        EmptyParam, // WriteResPassword          : OleVariant
        EmptyParam, // IgnoreReadOnlyRecommended : OleVariant
        EmptyParam, // Orign     : OleVariant
        EmptyParam, // Delimiter : OleVariant
        EmptyParam, // Editable  : OleVariant
        EmptyParam, // Notify    : OleVariant
        EmptyParam, // Converter : OleVariant
        EmptyParam, // AddToMru  : OleVariant
        LCID);


      // Ativar a PLAN1

      MyXLWorksheet := MyXLWorkbook.Worksheets.Item[PLANILHA_1];
      MyXLWorksheet.Activate;

      // Ativar Padr�o Branco na Planilha
      (*
      MyXLWorksheet.Cells.Select;
      MyXLWorksheet.Cells.Interior.ColorIndex        := 2;
      MyXLWorksheet.Cells.Interior.Pattern           := xlSolid;
      MyXLWorksheet.Cells.Interior.PatternColorIndex := xlAutomatic;
      *)
      // Buscar endere�os de refer�ncia limite na planilha

      MyXLWorksheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
      iLinha  := XLApp.ActiveCell.Row;
      iColuna := XLApp.ActiveCell.Column;

      // Remover prote��o do campo DATA
      RangesLocked.Add(REFERENCIA[COLUNA_T] + '19');

      iLinha_Total_Geral    := 0;
      iLinha_Total_Bruto    := 0;
      iLinha_Total_Desconto := 0;
      iLinha_Total_Liquido  := 0;

      // Ajustar valores da tabela aplicando formata��o correta dos valores

      for I := 1 to iLinha do
      begin

        // Recuperar refer�ncias de campos liberados e/ou de controles
        
        if ( Pos(TOTAL_GERAL, MyXLWorksheet.Cells[I, COLUNA_TOTAL_GT]) > 0 ) then
          iLinha_Total_Geral := I;

        if ( Pos(NOME_VENDEDOR, MyXLWorksheet.Cells[I, COLUNA_NOME_VEND]) > 0 ) then
          iLinha_Nome_Vendedor := I + 1;

        if ( Pos(ENDERECO_FORNE, MyXLWorksheet.Cells[I, COLUNA_END_FORNE]) > 0 ) then
          iLinha_End_Fornecedor := I + 1;

        if ( Pos(TOTAL_BRUTO, MyXLWorksheet.Cells[I, COLUNA_TOTAL_BR]) > 0 ) then
          iLinha_Total_Bruto := I + 1;

        if ( Pos(TOTAL_DESCONTO, MyXLWorksheet.Cells[I, COLUNA_TOTAL_DS]) > 0 ) then
          iLinha_Total_Desconto := I + 1;

        if ( Pos(TOTAL_LIQUIDO, MyXLWorksheet.Cells[I, COLUNA_TOTAL_LQ]) > 0 ) then
          iLinha_Total_Liquido := I + 1;

        if ( Pos(FORMA_PAGTO, MyXLWorksheet.Cells[I, COLUNA_FORMA_PAGTO]) > 0 ) then
          iLinha_Forma_Pagto := I + 1;

        if ( Pos(CONDICAO_PAGTO, MyXLWorksheet.Cells[I, COLUNA_CONDICAO_PAGTO]) > 0 ) then
          iLinha_Condicao_Pagto := I + 1;

        if ( Pos(OBSERVACOES, MyXLWorksheet.Cells[I, COLUNA_OBSERVACOES]) > 0 ) then
          iLinha_Observacoes := I + 1;

        // Recuperar valor/conte�do da c�lula

        sValor := StringReplace(Trim(MyXLWorksheet.Cells[I, COLUNA_QTDE]), '''', '', [rfReplaceAll]);

        if sValor = EmptyStr then
          Continue;

        if StrToCurrDef(sValor, 0) > 0 then
        begin
          MyXLWorksheet.Cells[I, COLUNA_QTDE]  := sValor;
          MyXLWorksheet.Cells[I, COLUNA_VALOR] := EmptyStr;
          MyXLWorksheet.Cells[I, COLUNA_TOTAL].Formula := '=' + REFERENCIA[COLUNA_QTDE] + IntToStr(I) + '*' + REFERENCIA[COLUNA_VALOR] + IntToStr(I);

          // Formatar c�lula

          MyXLWorksheet.Cells[I, COLUNA_VALOR].NumberFormat := '#.##0,00_);(#.##0,00)';
          MyXLWorksheet.Cells[I, COLUNA_TOTAL].NumberFormat := '#.##0,00_);(#.##0,00)';

          // Remover Prote��o
          RangesLocked.Add(REFERENCIA[COLUNA_VALOR] + IntToStr(I));

          sSoma := sSoma + REFERENCIA[COLUNA_TOTAL] + IntToStr(I) + '+';
        end;

      end;

      // Gerar f�rmulas totalizadoras

      if ( iLinha_Total_Geral > 0 ) then
      begin
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_GV] + IntToStr(iLinha_Total_Geral)].Select;
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_GV] + IntToStr(iLinha_Total_Geral)].NumberFormat := '#.##0,00_);(#.##0,00)';
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_GV] + IntToStr(iLinha_Total_Geral)].Formula      :=
          '=' + Copy(sSoma, 1, Length(sSoma) - 1);
      end;

      if ( iLinha_Total_Bruto > 0 ) then
      begin
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_BR] + IntToStr(iLinha_Total_Bruto)].Select;
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_BR] + IntToStr(iLinha_Total_Bruto)].NumberFormat := '#.##0,00_);(#.##0,00)';
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_BR] + IntToStr(iLinha_Total_Bruto)].Formula      :=
          '=' + REFERENCIA[COLUNA_TOTAL_GV] + IntToStr(iLinha_Total_Geral);
      end;

      if ( iLinha_Total_Desconto > 0 ) then
      begin
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto)].Select;
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto)].NumberFormat := '#.##0,00_);(#.##0,00)';
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto)] := EmptyStr;

        // Remover prote��o do campo DESCONTO
        RangesLocked.Add(REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto));
      end;

      if ( iLinha_Total_Liquido > 0 ) then
      begin
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_LQ] + IntToStr(iLinha_Total_Liquido)].Select;
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_LQ] + IntToStr(iLinha_Total_Liquido)].NumberFormat := '#.##0,00_);(#.##0,00)';
        MyXLWorksheet.Range[REFERENCIA[COLUNA_TOTAL_LQ] + IntToStr(iLinha_Total_Liquido)].Formula      :=
          '=' + REFERENCIA[COLUNA_TOTAL_BR] + IntToStr(iLinha_Total_Bruto) + '-' + REFERENCIA[COLUNA_TOTAL_DS] + IntToStr(iLinha_Total_Desconto);
      end;

      // Remover prote��o do campo VENDEDOR (ATT.)
      if ( iLinha_Nome_Vendedor > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_NOME_VEND] + IntToStr(iLinha_Nome_Vendedor));

      // Remover prote��o do campo ENDERECO DO FORNECEDOR
      if ( iLinha_End_Fornecedor > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_END_FORNE] + IntToStr(iLinha_End_Fornecedor));

      // Remover prote��o do campo FORMA DE PAGAMENTO
      if ( iLinha_Forma_Pagto > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_FORMA_PAGTO] + IntToStr(iLinha_Forma_Pagto));

      // Remover prote��o do campo CONDI��O DE PAGAMENTO
      if ( iLinha_Condicao_Pagto > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_CONDICAO_PAGTO] + IntToStr(iLinha_Condicao_Pagto));

      // Remover prote��o do campo OBSERVA��ES GERAIS
      if ( iLinha_Observacoes > 0 ) then
        RangesLocked.Add(REFERENCIA[COLUNA_OBSERVACOES] + IntToStr(iLinha_Observacoes));

      // Montar Lista de Formas de Pagamento na Planilha 2

      I := 1;
      sListaFormaPagto := EmptyStr;
      tblFormaPagto.First;
      while not tblFormaPagto.Eof do
      begin
        MyXLWorkbook.Worksheets.Item[PLANILHA_2].Range['A' + IntToStr(I)].Value := Trim(tblFormaPagto.FieldByName('DESCRI').AsString);
        sListaFormaPagto := sListaFormaPagto + Trim(tblFormaPagto.FieldByName('DESCRI').AsString) + ';';
        tblFormaPagto.Next;
        Inc(I);
      end;

      if (iLinha_Forma_Pagto > 0) and (Trim(sListaFormaPagto) <> EmptyStr) then
      begin
        ListaEndereco.Add(REFERENCIA[COLUNA_FORMA_PAGTO] + IntToStr(iLinha_Forma_Pagto));
        ListaReferencia.Add(Copy(sListaFormaPagto, 1, Length(sListaFormaPagto) - 1));
      end;

      // Montar Lista de Formas de Pagamento na Planilha 2

      I := 1;
      sListaCondicaoPagto := EmptyStr;
      tblCondicaoPagto.First;
      while not tblCondicaoPagto.Eof do
      begin
        MyXLWorkbook.Worksheets.Item[PLANILHA_3].Range['A' + IntToStr(I)].Value := Trim(tblCondicaoPagto.FieldByName('COND_DESCRICAO').AsString);
        sListaCondicaoPagto := sListaCondicaoPagto + Trim(tblCondicaoPagto.FieldByName('COND_DESCRICAO').AsString) + ';';
        tblCondicaoPagto.Next;
        Inc(I);
      end;

      if (iLinha_Condicao_Pagto > 0) and (Trim(sListaCondicaoPagto) <> EmptyStr) then
      begin
        ListaEndereco.Add(REFERENCIA[COLUNA_CONDICAO_PAGTO] + IntToStr(iLinha_Condicao_Pagto));
        ListaReferencia.Add(Copy(sListaCondicaoPagto, 1, Length(sListaCondicaoPagto) - 1));
      end;

      // Ativar c�lula A11 da PLAN1 e salvar

      MyXLWorkbook.Worksheets.Item[PLANILHA_1].Range[REFERENCIA[COLUNA_A] + '11'].Select;
      MyXLWorkbook.Worksheets.Item[PLANILHA_2].Visible := False;
      MyXLWorkbook.Worksheets.Item[PLANILHA_3].Visible := False;
      MyXLWorkbook.Save;
    finally
      XLApp.DisplayAlerts[LCID] := True;

      XLBook.Disconnect;
      XLApp.Quit;
      XLApp.Disconnect;

      Free;

      if FileExists(ArquivoXLS) then
        TravarCelulasXLS(RangesLocked, SenhaXLS, ArquivoXLS, ListaEndereco, ListaReferencia);

      RangesLocked.Free;
      ListaEndereco.Free;
      ListaReferencia.Free;
      
      Screen.Cursor := crDefault;
    end;

  end;
end;

function TravarCelulasXLS(const Ranges : TStringList; const SenhaXLS, ArquivoXLS : String;
  const ListaSuspensaEndereco, ListaSuspensaValores : TStringList) : Boolean;
var
  Excel : OleVariant;
  I     ,
  LCID  : Integer;
begin
  Excel := CreateOleObject('Excel.Application');

  Excel.Visible       := False;
  Excel.DisplayAlerts := False;

  LCID := GetUserDefaultLCID;

  Screen.Cursor := crHourGlass;

  try

    Excel.Workbooks.Open(
      ArquivoXLS,
      EmptyParam, // UpdateLinks : OleVariant
      EmptyParam, // ReadOnly    : OleVariant
      EmptyParam, // Format      : OleVariant
      EmptyParam, // Password    : OleVariant
      EmptyParam, // WriteResPassword          : OleVariant
      EmptyParam, // IgnoreReadOnlyRecommended : OleVariant
      EmptyParam, // Orign     : OleVariant
      EmptyParam, // Delimiter : OleVariant
      EmptyParam, // Editable  : OleVariant
      EmptyParam, // Notify    : OleVariant
      EmptyParam, // Converter : OleVariant
      EmptyParam, // AddToMru  : OleVariant
      EmptyParam  // LCID
    );

    Excel.Cells.Select;                // Seleciona a planilha
    Excel.Cells.Locked        := True; // Ativar a prote��o de conte�do
    Excel.Cells.FormulaHidden := True; // Ativar a prote��o de f�rmula

    // Remover prote��o

    for I := 0 to Ranges.Count - 1 do
    begin
      Excel.Range[ Ranges[I] ].Select;        // Seleciona a C�lula
      Excel.Selection.Locked        := False; // Remover Prote��o de Conte�do
      Excel.Selection.FormulaHidden := False; // Remover Prote��o de F�rmula
    end;

    // Montar lista suspensa

    for I := 0 to ListaSuspensaEndereco.Count - 1 do
    begin
      Excel.Range[ ListaSuspensaEndereco[I] ].Select; // Seleciona a C�lula
      Excel.Selection.Validation.Delete;
      Excel.Selection.Validation.Add(
          xlValidateList
        , xlValidAlertStop
        , xlBetween
        , ListaSuspensaValores[I] // F�rmula para montar a lista suspensa
      );
      Excel.Selection.Validation.IgnoreBlank    := True;
      Excel.Selection.Validation.InCellDropdown := True;
      Excel.Selection.Validation.ShowError      := False;

      (******* Script VB

      Range("C1").Select
      With Selection.Validation
          .Delete
          .Add Type:=xlValidateList, AlertStyle := xlValidAlertWarning, Operator := xlBetween, Formula1:="=Plan3!$A$1:$A$17"
          .IgnoreBlank = True
          .InCellDropdown = True
          .InputTitle = ""
          .ErrorTitle = "T�tulo"
          .InputMessage = ""
          .ErrorMessage = "Teste"
          .ShowInput = True
          .ShowError = True
      End With
      *)
    end;

    Excel.Range['A1'].Select;

    Excel.ActiveSheet.Protect(SenhaXLS, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True);
    Excel.ActiveWorkBook.SaveAs(ArquivoXLS);

  finally
    Excel.DisplayAlerts := True;
    Excel.ActiveWorkBook.Close;
    
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmGeCotacaoCompraFornecedor.btFecharClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmGeCotacaoCompraFornecedor.btnSalvarClick(
  Sender: TObject);
var
  Cont : Boolean;
begin
  if ( qryFornecedor.IsEmpty ) then
    Exit;

  Cont := ShowConfirm('Confirma os dados inseridos referente ao fornecedor na cota��o?');

  if ( Cont ) then
    with qryFornecedor do
      if ( State in [dsEdit, dsInsert] ) then
      begin
        if not GetEmailValido(Trim(dbEmail.Text), False) then
        begin
          ShowWarning('E-mail', 'O e-mail informado � inv�lido!');
          Abort;
        end;

        Post;
        ApplyUpdates;
        CommitTransaction;

        ModalResult := mrOk;
      end;
end;

procedure TfrmGeCotacaoCompraFornecedor.RegistrarRotinaSistema;
begin
  ;
end;

procedure TfrmGeCotacaoCompraFornecedor.qryFornecedorNewRecord(
  DataSet: TDataSet);
begin
  qryFornecedorANO.Value     := FAno;
  qryFornecedorCODIGO.Value  := FCotacao;
  qryFornecedorEMPRESA.Value := FEmpresa;
  qryFornecedorFORNECEDOR.Value    := FFornecedor;
  qryFornecedorATIVO.Value         := 1;
  qryFornecedorUSUARIO.Value       := gUsuarioLogado.Login;
  qryFornecedorDATA_RESPOSTA.Value      := Date;
  qryFornecedorPRAZO_ENTREGA_DATA.Value := Date + GetPrazoValidadeCotacaoCompra(FEmpresa);
  qryFornecedorVENCEDOR.Value      := 0;

  qryFornecedorVALOR_TOTAL_BRUTO.Value    := 0.0;
  qryFornecedorVALOR_TOTAL_DESCONTO.Value := 0.0;
  qryFornecedorVALOR_TOTAL_LIQUIDO.Value  := 0.0;

  qryFornecedorNOMEFORN.Value     := GetFornecedorRazao(FFornecedor);
  qryFornecedorNOME_CONTATO.Value := GetFornecedorContato(FFornecedor);
  qryFornecedorEMAIL_ENVIO.Value  := GetFornecedorEmail(FFornecedor);

  qryFornecedorNUMERO.Value           := FormatFloat('##0000000', qryFornecedorCODIGO.Value) + '/' + Copy(qryFornecedorANO.AsString, 3, 2);
  qryFornecedorDESCRICAO_RESUMO.Value := FDescricao;
  qryFornecedorEMISSAO_DATA.Value     := FEmissao;
  qryFornecedorVALIDADE.Value         := FValidade;
end;

procedure TfrmGeCotacaoCompraFornecedor.dtsFornecedorStateChange(
  Sender: TObject);
begin
  dbFornecedor.Button.Enabled := (qryFornecedor.State = dsInsert);
end;

procedure TfrmGeCotacaoCompraFornecedor.dbFornecedorButtonClick(
  Sender: TObject);
var
  iCodigo : Integer;
  sNome   : String;
begin
  if ( qryFornecedor.State = dsInsert ) then
    if SelecionarFornecedor(Self, iCodigo, sNome) then
    begin
      FFornecedor := iCodigo;

      qryFornecedorFORNECEDOR.Value   := FFornecedor;
      qryFornecedorNOMEFORN.Value     := sNome;
      qryFornecedorNOME_CONTATO.Value := GetFornecedorContato(FFornecedor);
      qryFornecedorEMAIL_ENVIO.Value  := GetFornecedorEmail(FFornecedor);
    end;
end;

procedure TfrmGeCotacaoCompraFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  tblFormaPagto.Open;
  tblCondicaoPagto.Open;
end;

procedure TfrmGeCotacaoCompraFornecedor.qryFornecedorBeforePost(
  DataSet: TDataSet);
begin
  qryFornecedorEMAIL.Value             := Trim(qryFornecedorEMAIL.Value);
  qryFornecedorPRAZO_ENTREDA_DIA.Value := DaysBetween(qryFornecedorPRAZO_ENTREGA_DATA.Value, qryFornecedorDATA_RESPOSTA.Value);
  qryFornecedorUSUARIO.Value           := gUsuarioLogado.Login;
end;

end.

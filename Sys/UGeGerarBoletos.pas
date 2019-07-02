unit UGeGerarBoletos;

interface

uses
  UGrPadrao,

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, ImgList, Grids,
  DBGrids, DB, IBCustomDataSet, IBQuery, Mask, DBCtrls, DBClient, Provider, ComObj,
  ACBrBoletoFCFR, ACBrBase, ACBrUtil, cxGraphics, cxLookAndFeels, ACBrBoleto,
  cxLookAndFeelPainters, Menus, cxButtons, System.ImageList,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,

  dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Green, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  TipoORigemTitulo = (toBoletoOutros, toBoletoVenda, toBoletoOS);
  TfrmGeGerarBoleto = class(TfrmGrPadrao)
    pnlGuias: TPanel;
    pgcGuias: TPageControl;
    tbsClientes: TTabSheet;
    tbsTitulos: TTabSheet;
    Bevel1: TBevel;
    ImgList: TImageList;
    Bevel2: TBevel;
    dbgDados: TDBGrid;
    DtsClientes: TDataSource;
    Bevel3: TBevel;
    pnlFiltros: TPanel;
    grpBxFiltro: TGroupBox;
    Label1: TLabel;
    edtFiltrar: TEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    dbNome: TDBEdit;
    Label3: TLabel;
    dbCPF: TDBEdit;
    dbEndereco: TDBEdit;
    Label4: TLabel;
    dbBairro: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    dbFone: TDBEdit;
    Label7: TLabel;
    dbEmail: TDBEdit;
    Label8: TLabel;
    dbCidade: TDBEdit;
    Label9: TLabel;
    dbUF: TDBEdit;
    Label10: TLabel;
    dbCEP: TDBEdit;
    Bevel4: TBevel;
    Shape1: TShape;
    Label11: TLabel;
    Bevel6: TBevel;
    dbgTitulos: TDBGrid;
    Bevel8: TBevel;
    DtsTitulos: TDataSource;
    pnlBoleto: TPanel;
    Bevel9: TBevel;
    DspTitulos: TDataSetProvider;
    CdsTitulos: TClientDataSet;
    lbltDemonstrativo: TLabel;
    lbltMsgInstrucoes: TLabel;
    lblbBanco: TLabel;
    cmbBanco: TComboBox;
    edtMsgInstrucoes: TEdit;
    edtDemonstrativo: TEdit;
    ACBrBoleto: TACBrBoleto;
    ACBrBoletoFCFR: TACBrBoletoFCFR;
    tlbBotoes: TPanel;
    Bevel5: TBevel;
    btnFechar: TcxButton;
    Bevel7: TBevel;
    btnGerarBoleto: TcxButton;
    fdQryClientes: TFDQuery;
    fdQryClientesCNPJ: TStringField;
    fdQryClientesCODIGO: TIntegerField;
    fdQryClientesINSCEST: TStringField;
    fdQryClientesNOME: TStringField;
    fdQryClientesFONE: TStringField;
    fdQryClientesENDER: TStringField;
    fdQryClientesENDER_DESC: TStringField;
    fdQryClientesENDER_NUM: TStringField;
    fdQryClientesBAIRRO: TStringField;
    fdQryClientesCIDADE: TStringField;
    fdQryClientesUF: TStringField;
    fdQryClientesCEP: TStringField;
    fdQryClientesEMAIL: TStringField;
    fdQryBancos: TFDQuery;
    fdUpdBancos: TFDUpdateSQL;
    IbQryTitulos: TFDQuery;
    UpdTitulos: TFDUpdateSQL;
    CdsTitulosANOLANC: TSmallintField;
    CdsTitulosNUMLANC: TIntegerField;
    CdsTitulosPARCELA: TSmallintField;
    CdsTitulosPARCELA_MAXIMA: TSmallintField;
    CdsTitulosCODBANCO: TIntegerField;
    CdsTitulosNOSSONUMERO: TStringField;
    CdsTitulosCNPJ: TStringField;
    CdsTitulosTIPPAG: TStringField;
    CdsTitulosDTEMISS: TDateField;
    CdsTitulosDTVENC: TDateField;
    CdsTitulosVALORREC: TBCDField;
    CdsTitulosPERCENTJUROS: TCurrencyField;
    CdsTitulosPERCENTMULTA: TCurrencyField;
    CdsTitulosPERCENTDESCONTO: TCurrencyField;
    CdsTitulosVALORRECTOT: TBCDField;
    CdsTitulosVALORSALDO: TBCDField;
    CdsTitulosDATAPROCESSOBOLETO: TDateField;
    CdsTitulosANOVENDA: TSmallintField;
    CdsTitulosNUMVENDA: TIntegerField;
    CdsTitulosANOOS: TSmallintField;
    CdsTitulosNUMOS: TIntegerField;
    CdsTitulosESPECIE_BOLETO: TStringField;
    CdsTitulosSERIE: TStringField;
    CdsTitulosNFE: TLargeintField;
    CdsTitulosGERAR: TStringField;
    btnFiltrar: TcxButton;
    procedure edtFiltrarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgDadosKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure pgcGuiasChange(Sender: TObject);
    procedure dbgTitulosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnGerarBoletoClick(Sender: TObject);
    procedure cmbBancoChange(Sender: TObject);
    procedure DspTitulosGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dbgDadosDblClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbgTitulosDblClick(Sender: TObject);
    procedure CdsTitulosGERARGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure fdQryClientesCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
    IBancoConta  : Array of Integer;
    FFecharAoGerar : Boolean;
    procedure CarregarBancos;
    procedure GravarBoletosGeradosACBr(const iProximoNossoNumero : Integer);
    procedure UpdateTitulo( iAno : Smallint; iLancamento : Int64; iBanco : Integer;
      sNossoNumero, sEspecieDOC : String; Data : TDateTime;
      const cJuros : Currency = 0.0; const cMulta : Currency = 0.0);

    function GetAgenciaNumero : String;
    function GetAgenciaDigito : String;
    function GetContaNumero : String;
    function GetContaDigito : String;

    function CarregarTitulos(pEmpresa : String; iCodigoCliente: Integer; iBanco : Integer) : Boolean;
    function DefinirCedenteACBr(iBanco : Integer; sCarteira : String) : Boolean;
    function InserirBoletoACBr(var iProximoNossoNumero : Integer; const NovosBoletos : Boolean = TRUE) : Boolean;
  public
    { Public declarations }
    procedure RegistrarRotinaSistema; override;
  end;

(*
  Tabelas:
  - TBEMPRESA
  - TBBANCO_BOLETO
  - TBCLIENTE
  - TBCONTREC
  - TBVENDAS
  - TBOS

  Views:
  - VW_EMPRESA

  Procedures:

*)

var
  frmGeGerarBoleto : TfrmGeGerarBoleto;

  procedure GerarBoleto(const AOwer : TComponent); overload;
  procedure GerarBoleto(const AOwer : TComponent; const NomeCliente : String; const iCodigoCliente : Integer; aAno, aControle : Integer;
    const TipoOrigem : TipoORigemTitulo); overload;

  function ReImprimirBoleto(const AOwer : TComponent; sNomeCliente : String; iCodigoCliente, aAno, aControle, iBanco : Integer;
    const TipoOrigem : TipoORigemTitulo;
    var sFileNamePDF : String; const SomenteGerarPDF : Boolean = FALSE) : Boolean;

implementation

uses UDMBusiness, StrUtils, TypInfo, DateUtils, UConstantesDGE, UFuncoes,
  UDMRecursos;

{$R *.dfm}

procedure GerarBoleto(const AOwer : TComponent);
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);
    f.ShowModal;
  finally
    f.Free;
  end;
end;

procedure GerarBoleto(const AOwer : TComponent; const NomeCliente : String; const iCodigoCliente : Integer; aAno, aControle : Integer;
  const TipoOrigem : TipoORigemTitulo); overload;
var
  f : TfrmGeGerarBoleto;
begin
  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.fdQryClientes.Close;
    f.fdQryClientes.ParamByName('nome').AsString := NomeCliente;
    f.fdQryClientes.Open;

    if ( f.fdQryClientes.Locate('codigo', iCodigoCliente, []) ) then
    begin
      f.dbgDadosDblClick( f.dbgDados );
      f.FFecharAoGerar := True;

      f.CarregarTitulos(gUsuarioLogado.Empresa, iCodigoCliente, 0);

      if ( TipoOrigem = toBoletoVenda ) then
        f.CdsTitulos.Filter   := 'ANOVENDA = ' + IntToStr(aAno) + ' and NUMVENDA = ' + IntToStr(aControle)
      else
      if ( TipoOrigem = toBoletoOS ) then
        f.CdsTitulos.Filter   := 'ANOOS = ' + IntToStr(aAno) + ' and NUMOS = ' + IntToStr(aControle);

      f.CdsTitulos.Filtered := True;
      f.ShowModal;
    end
    else
      ShowWarning('Títulos não identificados!');

  finally
    f.Free;
  end;
end;

function ReImprimirBoleto(const AOwer : TComponent; sNomeCliente : String; iCodigoCliente, aAno, aControle, iBanco : Integer;
  const TipoOrigem : TipoORigemTitulo;
  var sFileNamePDF : String; const SomenteGerarPDF : Boolean = FALSE) : Boolean;
var
  f : TfrmGeGerarBoleto;
  INossoNum ,
  ICarteira : Integer;
  sOrigem   ,
  sBanco    ,
  sCarteira : String;
  bReturn   : Boolean;
begin
  Case TipoOrigem of
    toBoletoVenda : sOrigem := 'VND';
    toBoletoOS    : sOrigem := 'OS';
    else
      sOrigem := 'OUT';
  end;

  bReturn      := False;
  sFileNamePDF := GetDirectoryTempApp + sOrigem + FormatFloat('0000"."', aAno) + FormatFloat('##000000".pdf"', aControle);

  try
    f := TfrmGeGerarBoleto.Create(AOwer);

    f.fdQryClientes.Close;
    f.fdQryClientes.ParamByName('nome').AsString := sNomeCliente;
    f.fdQryClientes.Open;

    if ( f.fdQryClientes.Locate('codigo', iCodigoCliente, []) ) then
      with f do
      begin
        CarregarBancos;
        if ( fdQryBancos.Locate('BCO_COD', iBanco, []) ) then
        begin
          cmbBancoChange( cmbBanco );
          CarregarTitulos(gUsuarioLogado.Empresa, iCodigoCliente, iBanco);

          if ( TipoOrigem = toBoletoVenda ) then
            CdsTitulos.Filter   := 'ANOVENDA = ' + IntToStr(aAno) + ' and NUMVENDA = ' + IntToStr(aControle)
          else
          if ( TipoOrigem = toBoletoOS ) then
            CdsTitulos.Filter   := 'ANOOS = ' + IntToStr(aAno) + ' and NUMOS = ' + IntToStr(aControle);

          CdsTitulos.Filtered := True;

          if CdsTitulos.IsEmpty then
          begin
            Application.MessageBox(PChar('Não existem títulos com boletos gerados para o banco ' + fdQryBancos.FieldByName('BCO_NOME').AsString + '.'), 'Alerta', MB_ICONWARNING);
            Exit;
          end;

          ICarteira := StrToIntDef( fdQryBancos.FieldByName('BCO_CARTEIRA').AsString, 0 );
          INossoNum := 0;
          sBanco    := Copy(cmbBanco.Text, 1, 3);
          sCarteira := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

          if DefinirCedenteACBr( IBanco, sCarteira ) then
          begin

            if ( InserirBoletoACBr(INossoNum, False) ) then
            begin
              if SomenteGerarPDF then
              begin
                ACBrBoleto.ACBrBoletoFC.NomeArquivo := sFileNamePDF;
                ACBrBoleto.ACBrBoletoFC.GerarPDF;
              end
              else
                ACBrBoleto.Imprimir;
            end;

          end;

          bReturn := True;
        end;
      end;
  finally
    f.Free;

    Result := bReturn;
  end;
end;

procedure TfrmGeGerarBoleto.edtFiltrarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = 13 ) then
    btnFiltrar.Click;
end;

procedure TfrmGeGerarBoleto.fdQryClientesCNPJGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if StrIsCPF(Sender.AsString) then
    Text := StrFormatarCpf(Sender.AsString)
  else
  if StrIsCNPJ(Sender.AsString) then
    Text := StrFormatarCnpj(Sender.AsString);
end;

procedure TfrmGeGerarBoleto.dbgDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
 TDbGrid(Sender).Canvas.font.Color := clBlack;

 if gdSelected in State then
 with (Sender as TDBGrid).Canvas do
 begin
   Brush.Color :=  clMoneyGreen;
   FillRect(Rect);
   Font.Style  := [fsbold]
 end;

 TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmGeGerarBoleto.btnFiltrarClick(Sender: TObject);
begin
  if ( Trim(edtFiltrar.Text) = EmptyStr ) then
    Application.MessageBox('Digite uma palavra-chave', 'Alerta!', MB_ICONWARNING)
  else
  with fdQryClientes do
  begin
    Close;
    ParamByName('nome').AsString := StringReplace( Trim(edtFiltrar.Text), ' ', '%', [rfReplaceAll] );
    Open;
    if ( not IsEmpty ) then
      dbgDados.SetFocus
    else
      edtFiltrar.SelectAll;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosKeyPress(Sender: TObject; var Key: Char);
begin
  if ( Key = #13 ) then
  begin
    Key := #0;
    pgcGuias.SelectNextPage(False);
  end
  else
  if ( Key in [' ', 'a'..'z', 'A'..'Z'] ) then
  begin
    edtFiltrar.Text := Trim(Key);
    edtFiltrar.SetFocus;
    edtFiltrar.SelStart := Length(edtFiltrar.Text);
  end;
end;

procedure TfrmGeGerarBoleto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Case Key of
    VK_ESCAPE : if ( pgcGuias.ActivePageIndex <> 0 ) then
                begin
                  pgcGuias.ActivePageIndex := 0;
                  dbgDados.SetFocus;

                  pgcGuiasChange(Sender);
                end
                else
                if ( pgcGuias.ActivePageIndex = 0 ) then
                  btnFechar.Click;

  end;
  inherited;
end;

procedure TfrmGeGerarBoleto.FormCreate(Sender: TObject);
begin
  inherited;
  pgcGuias.ActivePageIndex := 0;
  FFecharAoGerar := False;
end;

procedure TfrmGeGerarBoleto.FormShow(Sender: TObject);
begin
  Self.Caption := Self.Caption + ' - (' + GetNomeFantasiaEmpresa(gUsuarioLogado.Empresa) + ')';

  lbltMsgInstrucoes.Enabled := False;
  edtMsgInstrucoes.Enabled  := False;
  lbltDemonstrativo.Enabled := False;
  edtDemonstrativo.Enabled  := False;

  CarregarBancos;
  if ( pgcGuias.ActivePageIndex = 0 ) then
    edtFiltrar.SetFocus
  else
  if ( pgcGuias.ActivePageIndex = 1 ) then
    dbgTitulos.SetFocus;

  cmbBancoChange(cmbBanco);
end;

procedure TfrmGeGerarBoleto.btnFecharClick(Sender: TObject);
begin
  Close;
end;

function TfrmGeGerarBoleto.CarregarTitulos(pEmpresa : String; iCodigoCliente: Integer; iBanco : Integer) : Boolean;
begin
  with CdsTitulos, Params do
  begin
    Filtered := False;

    Close;
    ParamByName('cliente').AsInteger := iCodigoCliente;
    ParamByName('empresa').AsString  := pEmpresa;
    ParamByName('banco').AsInteger   := iBanco;
    Open;

    Result := not IsEmpty;
  end;
end;

procedure TfrmGeGerarBoleto.CdsTitulosGERARGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if AnsiUpperCase(Trim(Sender.AsString)) = 'X' then
    Text := 'X'
  else
    Text := '.';
end;

procedure TfrmGeGerarBoleto.pgcGuiasChange(Sender: TObject);
begin
  try
    CarregarTitulos(gUsuarioLogado.Empresa, fdQryClientesCODIGO.AsInteger, 0);

    if CdsTitulos.Active then
      btnGerarBoleto.Enabled := ( pgcGuias.ActivePage = tbsTitulos ) and ( CdsTitulos.RecordCount > 0 )
    else
      btnGerarBoleto.Enabled := False;
  except
  end;
end;

procedure TfrmGeGerarBoleto.dbgTitulosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_SPACE ) then
    dbgTitulosDblClick(Sender);
end;

procedure TfrmGeGerarBoleto.btnGerarBoletoClick(Sender: TObject);
var
  IBanco      ,
  INossoNumero,
  ICarteira   : Integer;
  sBanco    ,
  sCarteira : String;
begin
  if ( cmbBanco.ItemIndex < 0 ) then
  begin
    Application.MessageBox(PChar('Favor selecionar a entidade financeira para geração dos boletos.'), 'Alerta', MB_ICONWARNING);
    Exit;
  end;

  cmbBancoChange(cmbBanco);

  if (fdQryBancos.FieldByName('BCO_GERAR_BOLETO').AsInteger = 0) then
  begin
    ShowInformation('Informe', 'Banco selecionado não está configurado para geração de Boletos!' + #13 + 'Favor entrar em contato com suporte.');
    Exit;
  end;

  if (not ShowConfirmation('Gerar Boleto', 'Confirma a geração de boletos?')) then
    Exit;

  IBanco    := StrToIntDef( Copy(cmbBanco.Text, 1, 3), 0 );
  ICarteira := StrToIntDef( fdQryBancos.FieldByName('BCO_CARTEIRA').AsString, 0 );

  sBanco    := Copy(cmbBanco.Text, 1, 3);
  sCarteira := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

  if DefinirCedenteACBr( IBanco, sCarteira ) then
  begin

    CdsTitulos.Filter   := 'GERAR = ' + QuotedStr('X');
    CdsTitulos.Filtered := True;

    if ( CdsTitulos.IsEmpty ) then
    begin
      CdsTitulos.Filtered := False;
      Application.MessageBox(PChar('Não existem títulos selecionados para geração de boletos.'), 'Alerta', MB_ICONWARNING);
      dbgTitulos.SetFocus;
    end
    else
    begin

      INossoNumero := 1;
      if ( InserirBoletoACBr(INossoNumero) ) then
      begin
        ACBrBoleto.Imprimir;
        GravarBoletosGeradosACBr(INossoNumero);
      end;

      if FFecharAoGerar then
        ModalResult := mrOk;
    end;

    CdsTitulos.Filtered := False;

    CdsTitulos.Close;
    CdsTitulos.Open;

  end;
end;

procedure TfrmGeGerarBoleto.CarregarBancos;
var
  I : Integer;
begin
  cmbBanco.Items.Clear;

  with fdQryBancos, cmbBanco do
  begin
    Close;
    ParamByName('empresa').AsString := gUsuarioLogado.Empresa;
    Open;

    if ( not IsEmpty ) then
    begin
      Clear;
      SetLength(IBancoConta, RecordCount + 1);
    end
    else
    begin
      SetLength(IBancoConta, cmbBanco.Items.Count);
      for I := 0 to cmbBanco.Items.Count - 1 do
        IBancoConta[I] := 0;
    end;

    I := 0;
    while not Eof do
    begin
      Items.Add( FieldByName('BCO_NOME_AGENCIA_CONTA').AsString );
      IBancoConta[I] := FieldByName('bco_codigo').AsInteger;

      Inc(I);
      Next;
    end;

    First;

    cmbBanco.Tag       := fdQryBancos.FieldByName('BCO_COD').AsInteger;
    cmbBanco.ItemIndex := 0;
  end;
end;

procedure TfrmGeGerarBoleto.cmbBancoChange(Sender: TObject);
begin
  if ( not fdQryBancos.Active ) then
    fdQryBancos.Open;

  if (cmbBanco.ItemIndex > -1) then
    if ( fdQryBancos.Locate('bco_codigo', IBancoConta[cmbBanco.ItemIndex], []) ) then
    begin
      cmbBanco.Tag := fdQryBancos.FieldByName('BCO_COD').AsInteger;
      edtMsgInstrucoes.Text := '<br>' + Trim(fdQryBancos.FieldByName('BCO_MSG_INSTRUCAO').AsString);
    end;
end;

procedure TfrmGeGerarBoleto.GravarBoletosGeradosACBr(const iProximoNossoNumero : Integer);
var
  pDOC ,
  pDIG : String;
  I    : Integer;
  N : String;
  Titulo : TACBrTitulo;
  cJuros ,
  cMulta : Currency;
begin
  for I := 0 to ACBrBoleto.ListadeBoletos.Count - 1 do
    with ACBrBoleto, ListadeBoletos do
    begin
      Titulo := ListadeBoletos.Objects[I];

      if Pos('-', Titulo.NumeroDocumento) > 0 then
      begin
        CdsTitulos.IndexFieldNames := 'NFE;PARCELA';

        pDOC := Copy(Titulo.NumeroDocumento, 1, Pos('-', Titulo.NumeroDocumento) - 1);
        pDIG := Copy(Titulo.NumeroDocumento, Pos('-', Titulo.NumeroDocumento) + 1, 2);
      end
      else
      begin
        CdsTitulos.IndexFieldNames := 'ANOLANC;NUMLANC';

        pDOC := IntToStr( 2000 + StrToInt( Copy(Titulo.NumeroDocumento, 1, 2)) );
        pDIG := Copy(Titulo.NumeroDocumento, 3, 8);
      end;

      if CdsTitulos.FindKey( [pDOC, pDIG] ) then
        if ( CdsTitulosNOSSONUMERO.AsString <> Titulo.NossoNumero ) then
        begin
          cJuros := fdQryBancos.FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency;
          cMulta := fdQryBancos.FieldByName('BCO_PERCENTUAL_MORA').AsCurrency;

          CdsTitulos.Edit;
          CdsTitulosCODBANCO.Value    := fdQryBancos.FieldByName('BCO_COD').Value;
          CdsTitulosNOSSONUMERO.Value := Titulo.NossoNumero;
          CdsTitulosESPECIE_BOLETO.Value     := Titulo.EspecieDoc;
          CdsTitulosDATAPROCESSOBOLETO.Value := GetDateTimeDB;
          CdsTitulosPERCENTJUROS.AsCurrency  := cJuros;
          CdsTitulosPERCENTMULTA.AsCurrency  := cMulta;
          CdsTitulos.Post;

          CommitTransaction;

          UpdateTitulo(CdsTitulosANOLANC.Value
            , CdsTitulosNUMLANC.Value
            , CdsTitulosCODBANCO.Value
            , CdsTitulosNOSSONUMERO.Value
            , CdsTitulosESPECIE_BOLETO.Value
            , GetDateTimeDB
            , cJuros
            , cMulta);
        end;
    end;

  cmbBancoChange(cmbBanco);

  if ( StrToIntDef(Trim(fdQryBancos.FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString), 0) < iProximoNossoNumero ) then
  begin
    fdQryBancos.Edit;
    fdQryBancos.FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString := RightStr( FormatFloat('0000000', iProximoNossoNumero), 6 );
    fdQryBancos.Post;
    fdQryBancos.ApplyUpdates(0);

    CommitTransaction;
  end;
end;

procedure TfrmGeGerarBoleto.DspTitulosGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  TableName := 'TBCONTREC';
end;

procedure TfrmGeGerarBoleto.UpdateTitulo(iAno : Smallint; iLancamento: Int64; iBanco: Integer;
  sNossoNumero, sEspecieDOC: String; Data: TDateTime; const cJuros : Currency = 0.0; const cMulta : Currency = 0.0);
var
  sSQL : TStringList;
begin
  try
    sSQL := TStringList.Create;

    sSQL.BeginUpdate;
    sSQL.Clear;
    sSQL.Add( ' Update TBCONTREC Set ' );
    sSQL.Add( '     nossonumero    = ' + QuotedStr(sNossoNumero) );
    sSQL.Add( '   , especie_boleto = ' + QuotedStr(sEspecieDOC) );
    sSQL.Add( '   , codbanco       = ' + IntToStr(iBanco) );
    sSQL.Add( '   , dataprocessoboleto = ' + QuotedStr(FormatDateTime('yyyy-mm-dd', Data)) );
    sSQL.Add( '   , percentjuros       = ' + StringReplace(FormatFloat('########0.###', cJuros), ',', '.', [rfReplaceAll]) );
    sSQL.Add( '   , percentmulta       = ' + StringReplace(FormatFloat('########0.###', cMulta), ',', '.', [rfReplaceAll]) );
    sSQL.Add( ' where anolanc = '   + IntToStr(iAno) );
    sSQL.Add( '   and numlanc = '   + IntToStr(iLancamento) );
    sSQL.EndUpdate;

    ExecuteScriptSQL(sSQL.Text);
  finally
    sSQL.Free;
  end;
end;

procedure TfrmGeGerarBoleto.dbgDadosDblClick(Sender: TObject);
begin
  pgcGuias.SelectNextPage(False);
end;

procedure TfrmGeGerarBoleto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
//  CanClose := ( Application.MessageBox('Deseja abandonar processo de geração de boletos?','Fechar', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES );
end;

procedure TfrmGeGerarBoleto.dbgTitulosDblClick(Sender: TObject);
begin
  if ( not CdsTitulos.IsEmpty ) then
  begin
    CdsTitulos.Edit;
    if ( AnsiUpperCase(Trim(CdsTitulosGERAR.AsString)) = 'X' ) then
      CdsTitulosGERAR.AsString := '.'
    else
      CdsTitulosGERAR.AsString := 'X';
    CdsTitulos.Post;
  end;
end;

function TfrmGeGerarBoleto.DefinirCedenteACBr(iBanco : Integer; sCarteira : String): Boolean;
var
  sAppLogo  ,
  sAppBoleto,
  sAppPath  : String;
begin
  // Esta função deverá ser replicada em: TfrmGeRemessaBoleto.DefinirCedenteACBr()
  
  try
    sAppPath   := ExtractFilePath(ParamStr(0));
    sAppBoleto := sAppPath + LAYOUT_BOLETO_ENTREGA;
    sAppLogo   := sAppPath + BOLETO_IMAGENS + 'Colorido\' + FormatFloat('000".bmp"', iBanco);

    if not FileExists(sAppBoleto) then
      raise Exception.Create(Format('Arquivo de layout %s não encontrado!', [QuotedStr(sAppBoleto)]));

    if not FileExists(sAppLogo) then
      sAppLogo := sAppPath + BOLETO_IMAGENS + 'PretoBranco\' + FormatFloat('000".bmp"', iBanco);

    if not FileExists(sAppLogo) then
      sAppLogo := EmptyStr;

    // Parâmetros obrigatórios da conta corrente do Cedente

    with ACBrBoleto, Banco do
    begin
      Case iBanco of 
        CODIGO_BANCO_BRASIL:
          begin
            TipoCobranca          := cobBancoDoBrasil;
            TamanhoMaximoNossoNum := 17;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_AMAZONIA:
          begin
            TipoCobranca          := TACBrTipoCobranca.cobBancoDaAmazonia;
            TamanhoMaximoNossoNum := 15;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_BRADESCO:
          begin
            TipoCobranca          := TACBrTipoCobranca.cobBradesco;
            TamanhoMaximoNossoNum := 11;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_CAIXA:
          begin
            TipoCobranca          := TACBrTipoCobranca.cobCaixaEconomica;
            TamanhoMaximoNossoNum := 15;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_HSBC:
          begin
            TipoCobranca          := TACBrTipoCobranca.cobHSBC;
            TamanhoMaximoNossoNum := 16;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_ITAU:
          begin
            TipoCobranca          := TACBrTipoCobranca.cobItau;
            TamanhoMaximoNossoNum := 8;
            Cedente.Modalidade    := EmptyStr;
          end;

        CODIGO_BANCO_SANTANDER:
          begin
            TipoCobranca          := TACBrTipoCobranca.cobSantander;
            TamanhoMaximoNossoNum := 12;
            Cedente.Modalidade    := '101';
          end;

        else
          raise Exception.Create('Sistema não adapitado para gerar boletos para o banco ' + fdQryBancos.FieldByName('BCO_NOME').AsString);
      end;

      Case fdQryBancos.FieldByName('BCO_LAYOUT_REMESSA').AsInteger of
        240: LayoutRemessa := c240;
        400: LayoutRemessa := c400;
      end;

      ACBrBoletoFCFR.DirLogo        := ExtractFilePath(sAppLogo);
      ACBrBoletoFCFR.FastReportFile := sAppBoleto;
      ACBrBoletoFCFR.SoftwareHouse  := GetCompanyName;

      // Dados Conta
      Cedente.Agencia       := GetAgenciaNumero;
      Cedente.AgenciaDigito := GetAgenciaDigito;
      Cedente.Conta         := GetContaNumero;
      Cedente.ContaDigito   := GetContaDigito;
      Cedente.Convenio      := fdQryBancos.FieldByName('BCO_CHAVE').AsString;

      // Dados Cedente
      if StrIsCPF(fdQryBancos.FieldByName('EMPRESA').AsString) then
        Cedente.TipoInscricao := pFisica
      else
      if StrIsCNPJ(fdQryBancos.FieldByName('EMPRESA').AsString) then
        Cedente.TipoInscricao := pJuridica;

      Cedente.CNPJCPF     := fdQryBancos.FieldByName('EMPRESA').AsString;
      Cedente.Nome        := fdQryBancos.FieldByName('RZSOC').AsString;
      Cedente.Logradouro  := fdQryBancos.FieldByName('ENDER').AsString;
      Cedente.NumeroRes   := fdQryBancos.FieldByName('NUMERO_END').AsString;
      Cedente.Complemento := fdQryBancos.FieldByName('COMPLEMENTO').AsString;
      Cedente.Bairro := fdQryBancos.FieldByName('BAIRRO').AsString;
      Cedente.CEP    := fdQryBancos.FieldByName('CEP').AsString;
      Cedente.Cidade := fdQryBancos.FieldByName('CIDADE').AsString;
      Cedente.UF     := fdQryBancos.FieldByName('UF').AsString;

      // Dados Convênio
      Cedente.CodigoCedente     := Trim(fdQryBancos.FieldByName('BCO_CODIGO_CEDENTE').AsString);
      Cedente.Convenio          := fdQryBancos.FieldByName('BCO_CHAVE').AsString;
      Cedente.CodigoTransmissao := EmptyStr;
    end;

    Result := True;
  except
    On E : Exception do
    begin
      //Application.MessageBox(PChar('Erro ao tentar iniciar processo de geração de boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      ShowErrorNotify(Self, E);
      Result := False;
    end;
  end;
end;

function TfrmGeGerarBoleto.GetAgenciaNumero: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_AGENCIA').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeGerarBoleto.GetAgenciaDigito: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_AGENCIA').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, Pos('-', S) + 1, Length(S))
  else
    S := EmptyStr;

  Result := S;
end;

function TfrmGeGerarBoleto.GetContaDigito: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_CC').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, Pos('-', S) + 1, Length(S))
  else
    S := EmptyStr;

  Result := S;
end;

function TfrmGeGerarBoleto.GetContaNumero: String;
var
  S : String;
begin
  S := Trim(fdQryBancos.FieldByName('BCO_CC').AsString);

  if Pos('-', S) > 0 then
    S := Copy(S, 1, Pos('-', S) - 1);

  Result := S;
end;

function TfrmGeGerarBoleto.InserirBoletoACBr(var iProximoNossoNumero : Integer; const NovosBoletos : Boolean = TRUE) : Boolean;
var
  sDocumento ,
  sMensagem  : String;
  Boleto : TACBrTitulo;
const
  MSG_REF_NFE = 'Referente a NF-e %s, parcela %s/%s';
  MSG_REF_DOC = 'Referente ao título %s, parcela %s/%s';
begin
  // Esta função deverá ser replicada em: TfrmGeRemessaBoleto.InserirBoletoACBr()

  try

    ACBrBoleto.ListadeBoletos.Clear;

    iProximoNossoNumero := StrToIntDef( Trim(fdQryBancos.FieldByName('BCO_NOSSO_NUM_PROXIMO').AsString), 1 );
    CdsTitulos.First;

    while not CdsTitulos.Eof do
    begin

      Boleto := ACBrBoleto.CriarTituloNaLista;

      if ( CdsTitulosNFE.AsLargeInt > 0 ) then
      begin
        sMensagem  := Format(MSG_REF_NFE, [FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt), FormatFloat('00', CdsTitulosPARCELA.AsInteger), FormatFloat('00', CdsTitulosPARCELA_MAXIMA.AsInteger)]);
        sDocumento := FormatFloat('###0000000', CdsTitulosNFE.AsLargeInt) + '-' + FormatFloat('00', CdsTitulosPARCELA.AsInteger);
      end
      else
      begin
        sMensagem  := Format(MSG_REF_DOC, [Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger), FormatFloat('00', CdsTitulosPARCELA.AsInteger), FormatFloat('00', CdsTitulosPARCELA_MAXIMA.AsInteger)]);
        sDocumento := Copy(CdsTitulosANOLANC.AsString, 3, 2) + FormatFloat('00000000', CdsTitulosNUMLANC.AsInteger) + FormatFloat('000', CdsTitulosPARCELA.AsInteger);
      end;

      with Boleto do
      begin
        // Dados do Sacado
        if StrIsCPF(dbCPF.Field.AsString) then
          Sacado.Pessoa   := pFisica
        else
        if StrIsCNPJ(dbCPF.Field.AsString) then
          Sacado.Pessoa   := pJuridica
        else
          Sacado.Pessoa   := pOutras;

        Sacado.CNPJCPF    := dbCPF.Field.AsString;
        Sacado.NomeSacado := dbNome.Field.AsString;
        Sacado.Logradouro := fdQryClientesENDER_DESC.AsString;
        Sacado.Numero     := fdQryClientesENDER_NUM.AsString;
        Sacado.Bairro     := dbBairro.Field.AsString;
        Sacado.Cidade     := dbCidade.Field.AsString;
        Sacado.UF         := dbUF.Field.AsString;
        Sacado.CEP        := StrOnlyNumbers(dbCEP.Field.AsString);
        Sacado.Email      := AnsiLowerCase(Trim(fdQryClientesEMAIL.AsString));
        Sacado.Fone       := StrOnlyNumbers(Trim(fdQryClientesFONE.AsString));

        // Dados do Documento
        LocalPagamento := 'Pagar preferêncialmente nas agências do(a) ' + ACBrBoleto.Banco.Nome;

        if not CdsTitulosDTVENC.IsNull then
          Vencimento   := CdsTitulosDTVENC.AsDateTime
        else
          Vencimento   := GetProximoDiaUtil(Date);

(*
        O campo Aceite indica se o Sacado (quem recebe o boleto) aceitou o boleto, ou seja, se ele assinou o documento
        de cobrança que originou o boleto. O padrão é usar "Não" no aceite, pois nesse caso não é necessário a
        autorização do Sacado para protestar o título.
        Se escolher "Sim", o Cedente (quem emite o boleto) precisará de algum documento onde o Sacado reconhece a dívida
        para poder protestar o título.
*)
        Aceite            := atNao;
        DataDocumento     := CdsTitulosDTEMISS.AsDateTime;
        NumeroDocumento   := sDocumento;
        Parcela           := CdsTitulosPARCELA.AsInteger;
        EspecieDoc        := 'DM'; // Duplicata Mercantil
        EspecieMod        := 'R$';

        if ( CdsTitulosANOVENDA.AsInteger > 0 ) then
          EspecieDoc := 'DM'  // Duplicata Mercantil
        else
        if CdsTitulosANOOS.AsInteger > 0 then
          EspecieDoc := 'DS'  // Duplicata de Serviço
        else
          EspecieDoc := 'OU'; // Outros

        if NovosBoletos then
          DataProcessamento := Now
        else
          DataProcessamento := CdsTitulosDATAPROCESSOBOLETO.AsDateTime;

        Carteira          := fdQryBancos.FieldByName('BCO_CARTEIRA').AsString;

        if NovosBoletos then
          NossoNumero     := IntToStr(iProximoNossoNumero)
        else
          NossoNumero     := IntToStr( StrToInt(CdsTitulosNOSSONUMERO.AsString) );

        // Dados de Cobrança
        ValorDocumento    := CdsTitulosVALORREC.AsCurrency;
        ValorAbatimento   := 0.0;
        ValorMoraJuros    := (CdsTitulosVALORREC.AsCurrency * fdQryBancos.FieldByName('BCO_PERCENTUAL_MORA').AsCurrency / 100) / 30;
        ValorDesconto     := CdsTitulosVALORREC.AsCurrency * CdsTitulosPERCENTDESCONTO.AsCurrency / 100;
        DataMoraJuros     := GetProximoDiaUtil(Vencimento);
        DataAbatimento    := StrToCurrDef(EmptyStr, 0);

        if ( CdsTitulosPERCENTDESCONTO.AsCurrency = 0 ) then
          DataDesconto    := StrToCurrDef(EmptyStr, 0)
        else
          DataDesconto    := CdsTitulosDTVENC.AsDateTime;

        if ( fdQryBancos.FieldByName('BCO_DIA_PROTESTO').AsInteger = 0 ) then
          DataProtesto    := StrToCurrDef(EmptyStr, 0)
        else
          DataProtesto    := (Vencimento + fdQryBancos.FieldByName('BCO_DIA_PROTESTO').AsInteger);

        PercentualMulta   := fdQryBancos.FieldByName('BCO_PERCENTUAL_JUROS').AsCurrency;  // Percentual de multa por dia de atraso.

        OcorrenciaOriginal.Tipo := toRemessaRegistrar;

        Instrucao1        := '00';
        Instrucao2        := '00';

        Mensagem.Text := sMensagem + #13 + StringReplace(Trim(edtMsgInstrucoes.Text), '<br>', '', [rfReplaceAll]);
      end;

      Inc(iProximoNossoNumero);

      CdsTitulos.Next;
    end;


    Result := True;
  except
    On E : Exception do
    begin
      Application.MessageBox(PChar('Erro ao tentar gerar boletos (ACBr).' + #13 + E.Message), 'Erro', MB_ICONERROR);
      Result := False;
    end;
  end;
end;

procedure TfrmGeGerarBoleto.RegistrarRotinaSistema;
begin
  ;
end;

initialization
  FormFunction.RegisterForm('frmGeGerarBoleto', TfrmGeGerarBoleto);

end.
